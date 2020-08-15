require "json"

enum Context
  Lib
  Ext
end

macro assert(expr)
  ({{expr}}) || raise "Assertion failed: " + {{expr.stringify}}
end

macro def_map_from_json(field, parent_field = nil)
  getter name : String
  getter {{field}}

  def initialize(@name : String, @{{field}})
    {% if parent_field %}each &.{{parent_field}} = self{% end %}
  end

  def self.new(pull : JSON::PullParser)
    self.new(pull.string_value, {{field.type}}.new(pull))
  end

  forward_missing_to {{field.var}}
end

class CType
  NativeLib = {
    "int" => "LibC::Int",
    "unsigned int" => "LibC::UInt",
    "short" => "LibC::Short",
    "unsigned short" => "LibC::UShort",
    "char" => "LibC::Char",
    "unsigned char" => "LibC::UChar",
    "signed char" => "LibC::SChar",
    "size_t" => "LibC::SizeT",
    "float" => "LibC::Float",
    "double" => "LibC::Double",
    "void" => "Void",
    "bool" => "Bool",
    "FILE" => "Void",
  }
  NativeCr = {
    "int" => "Int32",
    "unsigned int" => "UInt32",
    "short" => "Int16",
    "unsigned short" => "UInt16",
    "float" => "Float32",
    "double" => "Float64",
  }

  def self.native?(type : String, context : Context) : String?
    if type =~ /^Im(S|(U))(\d+)$/
      "#{$2?}Int#{$3}"
    elsif context.ext?
      NativeCr[type]? || NativeLib[type]?
    else
      NativeLib[type]?
    end
  end

  getter c_name : String

  def initialize(@c_name : String)
  end

  def self.new(name : String) : self
    CFunctionType.new(name) rescue CUnion.new(name) rescue previous_def
  end

  def self.new(pull : JSON::PullParser)
    self.new(String.new(pull))
  end

  def name(context : Context = :lib) : String
    self.base_name(context)
  end

  def base_name(context : Context) : String
    name = self.c_name.gsub(/\bconst | const\b/, "").lchop("struct ")
    name = name.sub("[]", "*")
    name = name.sub(/[\w ]+/) do |s|
      CType.native?(s, context) || s
    end
    name = "ImGui::#{name}" if context.lib? && name =~ /^Im[A-Z]/
    name
  end

  def internal_name(context : Context): String
    self.name(context)
  end
end

class CTemplateType < CType
  getter template : CType

  def initialize(@c_name, @template)
  end

  def name(context : Context) : String
    sub = context.lib? ? "Void\\2" : "\\1(#{self.template.name(context)})\\2"
    super.sub(/^(.+)\b([^a-zA-Z]*)$/, sub)
  end

  def internal_name(context : Context): String
    base_name(context) + "Internal"
  end
end

class CUnion < CType
  def initialize(c_name)
    @c_name = "Union"

    assert c_name =~ /^union *\{ *(.+?) *; *}$/
    @members = $1.split("; ").map do |member_s|
      type, _, name = member_s.rpartition(" ")
      CStructMember.new(type, name)
    end
  end

  getter members : Array(CStructMember)

  def render(context : Context, &block : String->)
    return unless context.ext?

    yield %()
    yield %(@[Extern(union: true)])
    yield %(struct #{self.name})
    self.each do |member|
      yield %(property #{member.name(context)} : #{member.type.name(context)})
      yield %(@#{member.name(context)} = uninitialized #{member.type.name(context)})
    end
    yield %(end)
  end

  forward_missing_to members
end

class CFunctionType < CType
  def initialize(@c_name)
    assert c_name =~ /^(.+)?\(\*\)\((.*)\)/
    type, args = $1, $2
    @type = CType.new(type)
    @args = args.split(",").map do |arg|
      type, _, name = arg.rpartition(" ")
      CArg.new(CType.new(type), name)
    end
  end

  def name(context : Context = :lib) : String
    args = self.args.map { |arg| arg.type.name(context) }
    "(#{args.join(", ")}) -> #{self.type.name(context)}"
  end

  getter type : CType

  getter args : Array(CArg)
end

class CArg
  include JSON::Serializable

  getter name : String
  def name(context : Context) : String
    self.name == "..." ? "" : self.name
  end

  getter type : CType
  def type : CType
    if previous_def.c_name =~ /^(ImVector)_(\w+)(.*)/
      CTemplateType.new("#{$1}#{$3}", CType.new($2))
    else
      previous_def
    end
  end

  getter reftoptr : Bool = true

  getter ret : String?

  getter signature : String?

  def initialize(@type, @name)
  end
end

class COverload
  include JSON::Serializable

  #getter args : String

  @[JSON::Field(key: "argsT")]
  getter args : Array(CArg)

  @[JSON::Field(key: "argsoriginal")]
  getter args_orig : String?

  getter call_args : String

  @cimguiname : String

  @[JSON::Field(key: "defaults")]
  @_defaults : Hash(String, String) | Array(String)
  def defaults
    defaults.as(Hash)
  end

  getter funcname : String?

  getter? location : String?
  def location : String
    location? || parent.find(&.location?).try &.location? || ""
  end

  @[JSON::Field(key: "ov_cimguiname")]
  getter c_name : String

  getter ret : CType?
  def ret : CType
    previous_def || begin
      assert self.parent.name == "#{self.funcname}_#{self.funcname}"
      CType.new("#{self.funcname}*")
    end
  end

  getter signature : String

  getter stname : String

  @[JSON::Field(key: "nonUDT")]
  getter non_udt : Int32?

  @[JSON::Field(key: "retorig")]
  getter ret_orig : String?

  getter constructor : Bool?

  getter destructor : Bool?

  getter isvararg : String?

  getter? manual : Bool = false

  getter? templated : Bool = false

  getter retref : String?

  getter namespace : String?

  property! parent : CDefinition
  def parent=(parent : CDefinition)
    assert parent.name == @cimguiname
    previous_def
  end

  def internal? : Bool
    self.location == "internal" || (self.funcname || "").starts_with?("_")
  end

  def render(context, &block)
    return unless context.lib?
    return if self.templated? || self.internal?
    return if self.args.any? { |arg| arg.type.c_name == "va_list" }

    args = self.args.map do |arg|
      next "..." if arg.type.c_name == "..."
      "#{arg.name(context)} : #{arg.type.name(context)}"
    end
    ret = self.ret.try &.name(context)
    yield %(fun #{c_name}(#{args.join(", ")})#{" : #{ret}" if ret})
  end
end

class CDefinition
  def_map_from_json(overloads : Array(COverload), parent)

  def render(context, &block : String->)
    self.overloads.each &.render(context, &block)
  end
end

AllDefinitions = Hash(String, CDefinition).from_json(
  File.read("cimgui/generator/output/definitions.json")
)

class CStructMember
  include JSON::Serializable

  @[JSON::Field(key: "name")]
  getter c_name : String
  def name(context : Context) : String
    self.c_name.partition("[")[0].underscore.presence || "val"
  end

  @[JSON::Field(key: "type")]
  getter c_type : String
  def type : CType
    if (tpl = self.template_type)
      type = assert self.c_type.rchop?("_" + tpl.gsub("*", "Ptr").gsub(" ", "_"))
      CTemplateType.new(type, CType.new(tpl))
    else
      CType.new(self.c_type)
    end
  end

  getter bitfield : String?

  getter template_type : String?

  getter size : Int32?

  property! parent : CStruct

  def initialize(@c_type, @c_name)
  end

  def internal? : Bool
    self.c_name.starts_with?("_")
  end

  def render(context : Context, &block : String->)
    return unless context.ext?
    varname = self.name(context)

    if (u = self.type.as?(CUnion))
      u.render(context, &block)
    end
    if (t = self.type.as?(CTemplateType))
      typename = t.name(context)
      typeinternal = t.internal_name(context)
      yield %(@#{varname} : #{typeinternal})
      return if self.internal?
      yield %(def #{varname} : #{typename})
      yield %(pointerof(@#{varname}).as(#{typename}*).value)
      yield %(end)
      yield %(def #{varname}=(#{varname} : #{typename}))
      yield %(pointerof(@#{varname}).value = #{varname}.as(#{typeinternal}*).value)
      yield %(end)
    else
      yield %(#{self.internal? ? "@" : "property "}#{varname} : #{self.type.name(context)})
    end
  end
end

class CStruct
  def_map_from_json(members : Array(CStructMember), parent)

  def render(context : Context, &block : String->)
    return unless context.ext?

    if self.internal?
      yield %(alias #{self.name} = Void)
      return
    end

    yield %()
    yield %(@[Extern])
    yield %(struct #{self.name})
    self.each do |member|
      member.render(context, &block)
    end
    args = self.map { |member| "@#{member.name(context)} : #{member.type.internal_name(context)}" }
    yield %(def initialize(#{args.join(", ")}))
    yield %(end)
    yield %(end)
  end

  property! location : String
  def internal? : Bool
    self.location == "internal"
  end
end

AllStructs = Hash(String, CStruct).from_json(
  File.read("cimgui/generator/output/structs_and_enums.json"), "structs"
)

class CEnumMember
  include JSON::Serializable

  getter calc_value : Int32

  @[JSON::Field(key: "name")]
  getter c_name : String
  def name : String
    (assert self.c_name.lchop?(self.parent.name)).lchop("_").lchop("_").rchop("_")
  end

  @[JSON::Field(key: "value")]
  getter c_value : String | Int32
  def value : String
    val = self.c_value.to_s
    self.parent.each do |member|
      val = val.sub(member.c_name, member.name)
    end
    val
  end

  property! parent : CEnum
end

class CEnum
  def_map_from_json(members : Array(CEnumMember), parent)

  def name : String
    previous_def.rchop("_")
  end

  def render(context : Context, &block : String->)
    return unless context.ext?

    return if self.name.ends_with?("Private")

    yield %()
    yield %(@[Flags]) if self.name.ends_with?("Flags")

    yield %(enum #{name})
    self.each do |member|
      next if member.name == "All"
      yield %(#{member.name} = #{member.value})
    end
    yield %(end)
  end

  property! location : String
  def internal? : Bool
    self.location == "internal"
  end
end

AllEnums = Hash(String, CEnum).from_json(
  File.read("cimgui/generator/output/structs_and_enums.json"), "enums"
)

Hash(String, String).from_json(
  File.read("cimgui/generator/output/structs_and_enums.json"), "locations"
).each do |type, location|
  (AllEnums[type]? || AllStructs[type]).location = location
end

class CTypedef
  def_map_from_json(type : CType)

  def render(context : Context, &block : String->)
    return unless context.ext?
    return if CType.native?(self.name, context)
    return unless self.name[0].ascii_uppercase?
    return if AllEnums.has_key?(self.name + "_")
    type_name = self.type.name(context)
    if self.name == type_name
      return if AllStructs.has_key?(self.name)
      yield %(alias #{self.name} = Void)
    else
      yield %(alias #{self.name} = #{type_name})
    end
  end
end

AllTypedefs = Hash(String, String).from_json(
  File.read("cimgui/generator/output/typedefs_dict.json")
).map { |k, v|
  {k, CTypedef.new(k, CType.new(v.rchop(";")))}
}.to_h

def render(context : Context, &block : String->)
  if context.lib?
    yield %(require "./custom")
    yield %(require "./types")
    yield %()
    yield %(@[Link("cimgui")])
    yield %(lib LibImGui)
  else
    yield %(module ImGui)
  end

  AllEnums.each_value &.render(context, &block)
  AllTypedefs.each_value &.render(context, &block)
  AllStructs.each_value &.render(context, &block)
  AllDefinitions.each_value &.render(context, &block)

  yield %(end)
end

File.open("src/lib.cr", "w") do |f|
  render(Context::Lib, &->f.puts(String))
end
File.open("src/types.cr", "w") do |f|
  render(Context::Ext, &->f.puts(String))
end
