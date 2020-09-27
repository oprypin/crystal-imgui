require "json"

enum Context
  Lib
  Ext
  Obj
end

macro assert(expr)
  ({{expr}}) || raise "Assertion failed: " + {{expr.stringify}}
end

macro def_map_from_json(field, parent_field = nil)
  getter name : String
  getter {{field}}

  def initialize(@name : String, @{{field}})
    {% if parent_field %}self.{{field.var}}.each &.{{parent_field}} = self{% end %}
  end

  def self.new(pull : JSON::PullParser)
    self.new(pull.string_value, {{field.type}}.new(pull))
  end
end

class CType
  NativeLib = {
    "int"            => "LibC::Int",
    "unsigned int"   => "LibC::UInt",
    "short"          => "LibC::Short",
    "unsigned short" => "LibC::UShort",
    "char"           => "LibC::Char",
    "unsigned char"  => "LibC::UChar",
    "signed char"    => "LibC::SChar",
    "size_t"         => "LibC::SizeT",
    "float"          => "LibC::Float",
    "double"         => "LibC::Double",
    "void"           => "Void",
    "bool"           => "Bool",
    "FILE"           => "Void",
  }
  NativeCr = {
    "int"            => "Int32",
    "unsigned int"   => "UInt32",
    "short"          => "Int16",
    "unsigned short" => "UInt16",
    "float"          => "Float32",
    "double"         => "Float64",
  }

  def self.native?(type : String, ctx : Context) : String?
    if type =~ /^Im(S|(U))(\d+)$/
      "#{$2?}Int#{$3}"
    elsif ctx.lib?
      NativeLib[type]?
    else
      NativeCr[type]? || NativeLib[type]?
    end
  end

  getter c_name : String

  getter? const : Bool

  def initialize(c_name : String)
    @c_name = c_name.gsub(/\bconst | const\b/, "")
    @const = (@c_name != c_name)
    @c_name = @c_name.lchop("struct ")
  end

  def self.new(name : String) : self
    CFunctionType.new(name) rescue previous_def
  end

  def self.new(pull : JSON::PullParser)
    self.new(String.new(pull))
  end

  def name(ctx : Context = Context::Lib) : String
    self.base_name(ctx)
  end

  def base_type : CType
    base_type = CType.new(self.c_name[/[\w ]+/]? || self.c_name)
  end

  def base_name(ctx : Context) : String
    if ctx.obj? && self.const? && self.c_name == "char*"
      return "String"
    end
    name = self.c_name.gsub("[]", "*")
    name = name.gsub(/\[\d+\]/, "*") unless ctx.lib?
    name = name.sub(/[\w ]+/) do |s|
      CType.native?(s, ctx) || s
    end
    base_type = self.base_type
    if ctx.obj? && base_type.class? && (t = name.rchop?("*"))
      return t
    end
    if (t = base_type.struct? || base_type.enum?)
      in_lib = (base_type.class? || t.internal? || name.starts_with?("ImVector") && !ctx.obj?)
      if ctx.lib?
        name = "ImGui::#{name}" if !in_lib
      else
        name = "LibImGui::#{name}" if in_lib
      end
    end
    name
  end

  def enum? : CEnum?
    if self.c_name.starts_with?("Im")
      AllEnums.values.find { |e| e.name == self.c_name }
    end
  end

  def struct? : CStruct?
    AllStructs[self.c_name.sub("[]", "*")]?
  end

  def class? : Bool
    !!(struct?.try &.class?)
  end
end

class CTemplateType < CType
  getter template : CType

  def initialize(c_name, @template)
    super(c_name)
  end

  def name(ctx : Context) : String
    name = self.base_name(ctx)
    index = assert (name + " ").rindex(/\b/)
    insert = ctx.obj? ? "(#{self.template.name(ctx)})" : "Internal"
    name.insert(index, insert)
  end
end

class CFunctionType < CType
  def initialize(c_name)
    super
    assert c_name =~ /^(.+)?\(\*\)\((.*)\)/
    type, args = $1, $2
    @type = CType.new(type)
    @args = args.split(",").map do |arg|
      type, _, name = arg.gsub(" *", "* ").rpartition(" ")
      CArg.new(CType.new(type), name)
    end
  end

  def name(ctx : Context = Context::Lib) : String
    args = self.args.map { |arg| arg.type.name(ctx) }
    "(#{args.join(", ")}) -> #{self.type.name(ctx)}"
  end

  getter type : CType

  getter args : Array(CArg)
end

class CArg
  include JSON::Serializable

  getter name : String

  def name : String
    name = previous_def
    name += "_" if name == "in"
    name
  end

  getter type : CType

  def type : CType
    if previous_def.c_name =~ /^(ImVector)_(\w+)(.*)/
      t = CType.new($2)
      assert !t.class?
      CTemplateType.new("#{$1}#{$3}", t)
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

  # getter args : String

  @[JSON::Field(key: "argsT")]
  getter args : Array(CArg)

  @[JSON::Field(key: "argsoriginal")]
  getter args_orig : String?

  getter call_args : String

  @cimguiname : String

  getter defaults : Hash(String, String) | Array(String)

  def defaults : Hash(String, String)
    previous_def.as?(Hash) || {} of String => String
  end

  getter funcname : String?

  def funcname : String
    previous_def || begin
      assert self.c_name.ends_with?("_destroy")
      "destroy"
    end
  end

  property location : String?

  def location? : Location?
    Location.new(@location) || parent.overloads.find(&.@location).try(&.location?)
  end

  def location : Location
    self.location?.not_nil!
  end

  @[JSON::Field(key: "ov_cimguiname")]
  getter c_name : String

  def name(ctx : Context) : String
    if ctx.obj?
      if self.destructor?
        "finalize"
      elsif self.constructor?
        "self.new"
      else
        self.funcname.underscore
      end
    else
      self.c_name
    end
  end

  getter ret : CType?

  def ret : CType?
    if (t = previous_def)
      t if (t.c_name) != "void"
    else
      assert self.parent.name == "#{self.funcname}_#{self.funcname}"
      CType.new("#{self.funcname}*")
    end
  end

  getter signature : String

  @stname : String?

  def struct? : CStruct?
    if (stname = @stname.presence)
      AllStructs[stname]?
    end
  end

  @[JSON::Field(key: "nonUDT")]
  getter non_udt : Int32?

  @[JSON::Field(key: "retorig")]
  getter ret_orig : String?

  getter? constructor : Bool = false

  getter? destructor : Bool = false

  getter isvararg : String?

  getter? manual : Bool = false

  getter? templated : Bool = false

  getter retref : String?

  getter namespace : String?

  property! parent : CFunction

  def parent=(parent : CFunction)
    assert parent.name == @cimguiname
    previous_def
  end

  def internal? : Bool
    !!self.location?.try(&.internal?) || (self.funcname || "").starts_with?("_")
  end

  def input_output_arg? : Int32?
    idx = self.args.index do |arg|
      arg.type.name(Context::Obj).ends_with?("*") && (arg.name.split("_")[0].in?("p", "v") || arg.name.in?("current_item", "col", "flags"))
    end
    if idx
      idx -= self.args.count { |arg| arg.type.c_name == "ImGuiDataType" }
    end
    idx
  end

  def render(ctx, inside_class = false, &block)
    return if self.templated? || self.internal?
    if self.destructor? && !(assert self.struct?).destructor?
      return
    end
    return if self.args.any? { |arg| arg.type.c_name == "va_list" }

    if ctx.lib?
      args = self.args.map do |arg|
        next "..." if arg.type.c_name == "..."
        "#{arg.name} : #{arg.type.name(ctx).gsub(/\[\d+\]/, "*")}"
      end
      ret = self.ret.try &.name(ctx)
      yield %(fun #{self.c_name}(#{args.join(", ")})#{" : #{ret}" if ret})
    elsif ctx.obj?
      return if self.struct? && !inside_class
      args = [] of String
      call_args = [] of String
      macro_args = [] of String
      rets = [self.ret].compact
      outp = ["result"] * rets.size
      conv = {} of String => String
      outputter = nil
      as_datatype = self.args.index { |arg| arg.type.c_name == "ImGuiDataType" }
      if as_datatype
        yield %(  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %})
      end
      self.args.each_with_index do |arg, arg_i|
        if arg.type.c_name == "..."
          args << %(*args)
          call_args << %(*args._promote_va_args)
          next
        end
        if arg.name == "pOut" || arg.name.split("_").first == "out"
          outp << %(#{arg.name.underscore})
          call_args << %(out #{arg.name.underscore})
          rets << CType.new(arg.type.name.rchop("*"))
          next
        end
        default = self.defaults[arg.name]?.try do |default|
          default
            .gsub(/\b([0-9.]+)f\b(?!")/, "\\1")
            .gsub(/\bImVec2\(/, "ImVec2.new(")
            .gsub("(ImU32)", "UInt32.new")
            .gsub(/\bNULL\b/, "nil")
            .gsub(/\bfloat\b/, "Float32")
            .gsub(/\bFLT_MAX\b/, "Float32::MAX")
        end
        typ = arg.type.name(ctx)
        callarg = arg.name
        if arg.name == "ptr_id" && typ == "Void*"
          typ = "Reference | ClassType | Int | #{typ}"
          callarg = "to_void_id(#{callarg})"
        elsif arg.type.c_name =~ /^(float|int)\[(\d+)\]$/
          t = typ.rchop("*")
          n = $2.to_i
          typ = "Indexable(#{t}) | #{typ}"
          if $1 == "float"
            typ = "ImVec2* | #{typ}" if n == 2
            typ = "ImVec4* | #{typ}" if n == 4 || arg.name.rpartition("_").last == "col"
          end
          callarg = %(#{callarg}.is_a?(Indexable) ? (
              #{callarg}.size == #{n} ? #{callarg}.to_unsafe : raise ArgumentError.new("Slice has wrong size \#{#{callarg}.size} (want #{n})")
          ) : #{callarg}.as(#{t}*))
        elsif arg.name.rpartition("_").last == "end" && typ == "String"
          assert (p_arg = self.args[arg_i - 1].name.rchop("_begin")) == arg.name.rpartition("_").first
          args[-1] = "#{p_arg} : Bytes | String"
          call_args[-1] = p_arg
          call_args << "(#{p_arg}.to_unsafe + #{p_arg}.bytesize)"
          next
        elsif arg.name.rpartition("_").last == "size" && typ == "LibC::SizeT" && (prev_arg = self.args[arg_i - 1]?) && prev_arg.name == arg.name.rpartition("_").first && args[-1]?.try(&.ends_with?("Char*"))
          typ = CType.new(assert prev_arg.type.name(Context::Ext).rchop?("*")).name(ctx)
          args[-1] = "#{prev_arg.name} : Bytes"
          call_args << "#{prev_arg.name}.size"
          next
        elsif arg.name.rpartition("_").last == "count" && typ == "Int32" && (prev_arg = self.args[arg_i - 1]?) && prev_arg.name == arg.name.rpartition("_").first && args[-1]?.try(&.ends_with?("*"))
          typ = CType.new(assert prev_arg.type.name(Context::Ext).rchop?("*")).name(ctx)
          args[-1] = "#{prev_arg.name} : Indexable(#{typ})"
          call_args << "#{prev_arg.name}.size"
          next
        elsif arg_i == as_datatype
          call_args << "ImGuiDataType::{{k.id}}"
          next
        elsif as_datatype && arg_i > as_datatype && typ == "Void*" && arg.name.partition("_").first == "p"
          typ = "{{t}}"
          if arg_i - 1 == as_datatype || self.name(Context::Obj).ends_with?("n")
            typ += "*"
          else
            callarg = "#{callarg} ? (#{callarg}_ = #{callarg}; pointerof(#{callarg}_)) : Pointer({{t}}).null"
          end
          #           callarg += ".as(Void*)"
        end
        if default == "nil"
          if (t = typ.rchop?("*"))
            default = "Pointer(#{t}).null"
          else
            typ += "?" unless typ.ends_with?("?")
          end
        end
        if arg.type.enum? && default =~ /^\d/
          default = "#{typ}.new(#{default})"
        end
        if arg.type.enum? && default
          default = default.gsub(/\B_\B/, "::")
        end
        args << "#{arg.name} : #{typ}#{" = #{default}" if default}" unless arg.name == "self"
        call_args << "#{callarg}"
      end
      outp2 = outp.dup
      outp2, rets = convert_returns!(outp2, rets)
      ret_s = to_tuple(rets) || "Void"
      any_outputter = self.parent.overloads.any?(&.input_output_arg?)
      yield %(# #{self.location}) if self.location?
      yield %(  #{"pointer_wrapper " if any_outputter}def #{"self." if !inside_class}#{self.name(ctx)}(#{args.join(", ")}) : #{ret_s})
      call = %(    LibImGui.#{self.name(Context::Lib)}(#{call_args.join(", ")}))
      call = %(    result = #{call}) if outp.first? == "result" && outp2 != ["result"]
      yield call
      yield (assert to_tuple(outp2)) unless outp2.empty? || outp2 == ["result"]
      yield %(  end)
      yield %(  {% end %}) if as_datatype
    end
  end
end

def to_tuple(args : Array(String)) : String?
  args.size > 1 ? "{" + args.join(", ") + "}" : args.join(", ").presence
end

def convert_returns!(outp : Array(String), rets : Array(CType), member = false) : {Array(String), Array(String)}
  orig_rets = rets
  rets = rets.map(&.name(Context::Obj))
  outp.each_with_index do |o, i|
    ret = orig_rets[i]
    if ret.c_name =~ /\d\]$/
      outp[i] = %(#{o}.to_slice)
      rets[i] = "Slice(#{ret.name(Context::Obj).rchop("*")})"
    elsif (t = ret.base_type.struct?) || ret.name(Context::Obj) == "String"
      if t && t.class? && !t.internal?
        outp[i] = %(#{ret.name(Context::Obj)}.new(#{o}))
        if ret.const?
          outp[i] = %(#{o} ? #{outp[i]} : nil)
          rets[i] += "?"
        end
      else
        rets[i] = ret.name(Context::Obj).rchop("*")
        if member && ret.name.rchop?("*")
          rets[i] += "?"
          if ret.name(Context::Obj) == "String"
            outp[i] = %((v = #{o}) ? String.new(v) : nil)
          else
            outp[i] = %((v = #{o}) ? v.value : nil)
          end
        elsif ret.name(Context::Obj) == "String"
          outp[i] = %(String.new(#{o}))
        else
          outp[i] = o + ".value" if ret.name.rchop?("*")
        end
      end
    end
  end
  {outp, rets}
end

class CFunction
  def_map_from_json(overloads : Array(COverload), parent)

  def render(ctx, inside_class = false, &block : String ->)
    self.overloads.each &.render(ctx, inside_class, &block)
  end

  getter? struct : CStruct? do
    result : CStruct? = nil
    self.overloads.each do |overload|
      result ||= overload.struct?
      assert result == overload.struct?
    end
    result
  end
end

AllFunctions = Hash(String, CFunction).from_json(
  File.read("cimgui/generator/output/definitions.json")
)

class CStructMember
  include JSON::Serializable

  @[JSON::Field(key: "name")]
  getter c_name : String

  def c_name : String
    previous_def.partition("[")[0]
  end

  def name(ctx : Context) : String
    self.c_name.underscore.presence || "val"
  end

  @[JSON::Field(key: "type")]
  getter c_type : String

  def type : CType
    c_type = self.c_type
    c_type += "[#{self.size}]" if self.size
    if (tpl = self.template_type)
      type = assert c_type.rchop?("_" + tpl.gsub("*", "Ptr").gsub(" ", "_"))
      CTemplateType.new(type, CType.new(tpl))
    else
      CType.new(c_type)
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

  def render(ctx : Context, &block : String ->)
    varname = self.name(ctx)
    typ = self.type
    if ctx.lib?
      yield %(#{varname} : #{typ.name(ctx)})
      return
    end
    return if self.internal? && !ctx.ext?
    this = (self.parent.class? ? "@this.value." : "@")
    typeinternal = typ.name(Context::Ext)
    set_call = %(#{this}#{varname} = #{varname})
    if {varname, typ.name(Context::Obj)}.in?({
         {"cmd_lists", "ImDrawList*"},
         {"config_data", "ImFontConfig"},
       })
      t = typ.name(Context::Obj).rchop("*")
      typename = "Slice(#{t})"
      call = %(Slice.new(#{this}#{varname}_count.to_i) { |i| #{t}.new(#{this}#{varname} + i) })
      set_call = %(#{this}#{varname}, #{this}#{varname}_count = #{varname}.to_unsafe, #{varname}.bytesize)
    else
      if typ.class?
        typ = CType.new(typ.name + "*")
      end
      call, rets = convert_returns!(["#{this}#{varname}"], [typ], true)
      call = call.first
      typename = rets.first
    end
    if ctx.ext? && !self.parent.class?
      yield %(#{self.internal? ? "@" : "property "}#{varname} : #{self.type.name(ctx)})
    end
    if ctx.obj?
      if (self.type.is_a?(CTemplateType)) && ctx.obj?
        # yield %(# #{self.location}) if self.location?
        yield %(def #{varname} : #{typename})
        yield %(t = #{this}#{varname})
        yield %(pointerof(t).as(#{typename}*).value)
        yield %(end)
        yield %(def #{varname}=(#{varname} : #{typename}))
        yield set_call += %(.as(#{typeinternal}*).value)
        yield %(end)
      elsif self.parent.class?
        # yield %(# #{self.location}) if self.location?
        yield %(def #{varname} : #{typename})
        yield call
        yield %(end)
        yield %(def #{varname}=(#{varname} : #{typename}))
        yield set_call
        yield %(end)
      end
    end
  end
end

class CStruct
  def_map_from_json(members : Array(CStructMember), parent)

  def render(ctx : Context, &block : String ->)
    if self.internal?
      if ctx.lib?
        yield %(type #{self.name} = Void*)
      elsif ctx.obj? && self.name.in?("ImGuiContext")
        yield %(alias #{self.name} = LibImGui::#{self.name})
      end
    elsif ctx.obj?
      yield %(# #{self.location}) if self.location?
      if self.class?
        yield %(#{self.destructor? ? "class" : "struct"} #{self.name})
        yield %(include ClassType(LibImGui::#{self.name}))
      else
        yield %(struct #{self.name})
        yield %(include StructType)
      end
      self.members.each &.render(ctx, &block)
      self.functions.each &.render(ctx, true, &block)
      yield %(end)
      yield %(alias TopLevel::#{name} = ImGui::#{name}) if self.class?
    elsif self.class? && ctx.lib?
      yield %(struct #{self.name})
      self.members.each do |member|
        member.render(ctx, &block)
      end
      yield %(end)
    elsif !self.class? && ctx.ext?
      yield %()
      yield %(@[Extern])
      yield %(struct #{self.name})
      self.members.each do |member|
        member.render(ctx, &block)
      end
      args = self.members.map { |member| "@#{member.name(ctx)} : #{member.type.name(ctx)}" }
      if !args.empty?
        yield %(def initialize(#{args.join(", ")}))
        yield %(end)
      end
      yield %(end)
      yield %(alias TopLevel::#{name} = ImGui::#{name})
    end
  end

  property location : String?

  def location? : Location?
    Location.new(@location)
  end

  def location : Location
    Location.new(@location.not_nil!)
  end

  def internal? : Bool
    !!self.location?.try(&.internal?) || self.name.in?("ImGuiStoragePair", "ImGuiTextRange", "ImGuiTextBuffer")
  end

  getter functions : Array(CFunction) do
    AllFunctions.values.select { |d| d.struct?.try(&.name) == self.name }
  end

  def class? : Bool
    !%w[ImVector ImVec2 ImVec4 ImColor ImDrawVert ImFontGlyph ImGuiTextRange ImGuiOnceUponAFrame ImGuiStorage ImGuiTextBuffer ImGuiListClipper ImFontGlyphRangesBuilder ImDrawChannel].includes?(self.name)
  end

  def destructor? : COverload?
    # Discard destructors that were manually found to only free memory.
    return nil if self.name.in?("ImVector", "ImDrawData", "ImDrawList", "ImFont", "ImGuiListClipper", "ImVector")
    # Discard destructors without an actual body - also assumed to only free memory.
    AllFunctions["#{self.name}_destroy"]?.try(&.overloads.find(&.location?))
  end
end

AllStructs = Hash(String, CStruct).from_json(
  File.read("cimgui/generator/output/structs_and_enums.json"), "structs"
)
AllStructs["ImVector"] = CStruct.new("ImVector", [] of CStructMember)

class CEnumMember
  include JSON::Serializable

  getter calc_value : Int32

  @[JSON::Field(key: "name")]
  getter c_name : String

  def name : String
    name = (assert self.c_name.lchop?(self.parent.name)).lchop("_")
    if (chop = name.lchop?("_"))
      name = "#{chop}_"
    end
    name
  end

  @[JSON::Field(key: "value")]
  getter c_value : String | Int32

  def value : String
    val = self.c_value.to_s
    self.parent.members.each do |member|
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

  def render(ctx : Context, &block : String ->)
    return if self.internal?
    return unless ctx.ext?

    return if self.name.ends_with?("Private")

    yield %()
    yield %(# #{self.location}) if self.location?
    yield %(@[Flags]) if self.name.ends_with?("Flags")

    yield %(enum #{name})
    self.members.each do |member|
      next if member.name.in?("All", "COUNT")
      # yield %(# #{self.location}) if self.location?
      yield %(#{member.name} = #{member.value})
    end
    yield %(end)
    yield %(alias TopLevel::#{name} = ImGui::#{name})
  end

  property location : String?

  def location? : Location?
    Location.new(@location)
  end

  def location : Location
    Location.new(@location.not_nil!)
  end

  def internal? : Bool
    !!self.location?.try(&.internal?)
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

  def render(ctx : Context, &block : String ->)
    return if CType.native?(self.name, ctx)
    return unless self.name[0].ascii_uppercase?
    return if AllEnums.has_key?(self.name + "_")
    type_name = self.type.name(ctx)
    if self.name == self.type.c_name
      return if AllStructs.has_key?(self.name)
      yield %(alias #{self.name} = Void)
    else
      if ctx.lib?
        return if self.name == "ImWchar"
        yield %(alias #{self.name} = #{type_name})
      elsif ctx.ext?
        yield %(alias #{self.name} = LibImGui::#{self.name})
      end
    end
  end
end

AllTypedefs = Hash(String, String).from_json(
  File.read("cimgui/generator/output/typedefs_dict.json")
).map { |k, v|
  {k, CTypedef.new(k, CType.new(v.rchop(";")))}
}.to_h

AllStructs.each_value do |t|
  next if t.internal?
  assert t.class? || !t.destructor?
end

struct Location
  getter file : String
  getter line : Int32

  class_getter version : String do
    `cd cimgui/imgui && (git describe --tags --exact-match HEAD || git rev-parse HEAD)`.strip
  end

  def initialize(@file, @line)
  end

  def self.new(pair : String) : Location?
    file, _, line = pair.partition(":")
    self.new("#{file}.h", line.to_i)
  end

  def self.new(pair : Nil) : Nil
    nil
  end

  def internal? : Bool
    self.file != "imgui.h"
  end

  def to_s(io)
    io << "[[View C++ header](https://github.com/ocornut/imgui/blob/" << Location.version << "/" << self.file << "#L" << self.line << ")]"
  end
end

def render(ctx : Context, &block : String ->)
  if ctx.lib?
    yield %(require "./custom")
    yield %(require "./types")
    yield %()
    yield %(@[Link("cimgui")])
    yield %(lib LibImGui)
  else
    yield %(require "./lib") if ctx.obj?
    yield %(module ImGui)
  end

  AllEnums.each_value &.render(ctx, &block)
  AllTypedefs.each_value &.render(ctx, &block)
  AllStructs.each_value &.render(ctx, &block)
  AllFunctions.each_value &.render(ctx, &block)

  yield %(end)
end

File.open("src/lib.cr", "w") do |f|
  render(Context::Lib, &->f.puts(String))
end
File.open("src/types.cr", "w") do |f|
  render(Context::Ext, &->f.puts(String))
end
File.open("src/obj.cr", "w") do |f|
  render(Context::Obj, &->f.puts(String))
end
