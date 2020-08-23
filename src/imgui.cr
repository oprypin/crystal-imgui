module ImGui
  private SENTINEL = Random.rand(Int32)

  LibImGui.igSetAllocatorFunctions(->(size, data) {
    ptr = GC.malloc(size + sizeof(Void*))
    ptr.as(Int32*).value = SENTINEL
    (ptr.as(Int32*) + 1).value = SENTINEL
    ptr + sizeof(Void*)
  }, ->(ptr, data) {}, nil)

  private module DirectClassType(T)
    macro included
      @this : T

      # :nodoc:
      TYPEID = allocate.as(Int32*).value

      private def initialize(ptr : T*)
        @this = uninitialized T
        raise "BUG: Can't create #{{{@type}}} from pointer"
      end

      # :nodoc:
      def self.new(ptr : T*) : self
        (ptr.as(Void*) - offsetof(self, @this)).as(Int32*).tap do |ptr|
          if ptr.value.in?(SENTINEL, TYPEID)
            ptr.value = TYPEID
          else
            puts "BUG: Corrupted memory #{ptr} #{ptr.value} when creating #{{{@type}}}"
          end
        end.as(self)
      end

      def to_unsafe : T*
        pointerof(@this)
      end
    end
  end

  private module StructClassType(T)
    macro included
      @this : T*

      # :nodoc:
      def initialize(@this : T*)
      end

      def to_unsafe : T*
        @this
      end
    end
  end

  private module StructType
    macro included
      def to_unsafe : {{@type}}*
        pointerof(@{{@type.instance_vars.first}})
      end
    end
  end
end

require "./lib"

module ImGui
  # :nodoc:
  macro _pointer_wrapper(call, arg_i, bool, *args)
    {% exp = nil %}
    {% if (wrap = args[arg_i].is_a?(PointerOf)) %}
      {% exp = args[arg_i].exp %}
      %val = {{exp}}
    {% end %}
    if {{call.id}}(
      {% for arg, i in args %}{% if i == 1 && exp %}pointerof(%val){% else %}{{arg}}{% end %}, {% end %}
    )
      {% if exp %}
        {% if bool && exp.id.ends_with?("?") %}{% exp = exp.id[0...-1] %}{% end %}
        {{exp}} = %val
      {% end %}
      true
    else
      false
    end
  end
end

require "./obj"

module ImGui
  struct ImVec2
    def initialize
      @x = @y = 0
    end

    def to_unsafe : Float32*
      pointerof(@x)
    end
  end

  struct ImVec4
    def initialize
      @x = @y = @z = @w = 0
    end

    def to_unsafe : Float32*
      pointerof(@x)
    end
  end

  def self.vec2(x : Number, y : Number) : ImVec2
    ImVec2.new(x.to_f32, y.to_f32)
  end

  def self.vec4(x : Number, y : Number, z : Number, w : Number) : ImVec4
    ImVec4.new(x.to_f32, y.to_f32, z.to_f32, w.to_f32)
  end

  def self.input_text_(label : String, buf : IO::Memory, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), &block : ImGuiInputTextCallbackData -> Int32) : Bool
    LibImGui.igInputText(label, buf.buffer, buf.size, flags, ->(data) {
      data.value.user_data.as(typeof(block)*).value.call(ImGui::ImGuiInputTextCallbackData.new(data))
    }, pointerof(block))
  end

  def self.checkbox_flags_(label : String, flags : Enum*, flags_value : Enum) : Bool
    LibImGui.igCheckboxFlags(label, flags.as(UInt32*), flags_value.to_u32!)
  end

  def self.set_next_window_size_constraints(size_min : ImVec2, size_max : ImVec2, &block : ImGuiSizeCallbackData ->) : Void
    LibImGui.igSetNextWindowSizeConstraints(size_min, size_max, ->(data) {
      data.value.user_data.as(typeof(block)*).value.call(ImGui::ImGuiSizeCallbackData.new(data))
    }, pointerof(block))
  end

  def self.col32(r : Int, g : Int, b : Int, a : Int)
    (a.to_u32<<24) | (b.to_u32<<16) | (g.to_u32<<8) | (r.to_u32<<0)
  end
end
