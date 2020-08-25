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
        ptr || raise "Null pointer passed to #{{{@type}}}.new"
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
        this || raise "Null pointer passed to #{{{@type}}}.new"
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
  macro _pointer_wrapper(call, arg_i, bool, *args, **kwargs, &block)
    {% exp = nil %}
    {% if (wrap = args[arg_i].is_a?(PointerOf)) %}
      {% exp = args[arg_i].exp %}
      %val = {{exp}}
    {% end %}
    if ({{call.id}}(
      {% for arg, i in args %}{% if i == arg_i && exp %}pointerof(%val){% else %}{{arg}}{% end %}, {% end %}{{**kwargs}}
    ) {{block}})
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

  private macro make_input_text(name, *args)
    def self.{{name.id}}_({{*args}}, &block : ImGuiInputTextCallbackData -> Int32) : Bool
      user_data = {buf, block}
      LibImGui.ig{{name.id.camelcase}}(
        {% for arg in args %}
          {% if arg.var == "buf" %}
            buf.buffer, buf.@capacity,
          {% else %}
            {{arg.var}},
          {% end %}
        {% end %}
        ->(data) {
          data = ImGuiInputTextCallbackData.new(data)
          buf2, block2 = data.user_data.as(typeof(user_data)*).value

          if data.event_flag == ImGuiInputTextFlags::CallbackResize
            buf2.resize_to_capacity(data.buf_text_len)
            data.buf = buf2.buffer
          end
          block2.call(data)
        }, pointerof(user_data)
      )
    end

    def self.{{name.id}}_({{*args}}) : Bool
      {{name.id}}_({{*args.map(&.var)}}) { 0 }
    end
  end

  make_input_text(:input_text, label : String, buf : IO::Memory, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0))

  make_input_text(:input_text_multiline, label : String, buf : IO::Memory, size : ImVec2 = ImVec2.new(0, 0), flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0))

  make_input_text(:input_text_with_hint, label : String, hint : String, buf : IO::Memory, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0))

  def self.checkbox_flags_(label : String, flags : Enum*, flags_value : Enum) : Bool
    LibImGui.igCheckboxFlags(label, flags.as(UInt32*), flags_value.to_u32!)
  end

  {% for fn in %w[lines histogram] %}
    def self.plot_{{fn.id}}(label : String, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0), &block : Int32 -> Float32) : Void
      LibImGui.igPlot{{fn.id.capitalize}}FnFloatPtr(label, ->(data, idx) {
        data.as(typeof(block)*).value.call(idx)
      }, pointerof(block), values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
    end
  {% end %}

  def self.tree_node_(int_id : Int, fmt : String, *args) : Bool
    tree_node_(Pointer(Void).new(int_id), fmt, *args)
  end

  def self.tree_node_ex_(int_id : Int, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Bool
    tree_node_ex_(Pointer(Void).new(int_id), flags, fmt, *args)
  end

  def self.get_id(int_id : Int) : ImGui::ImGuiID
    get_id(Pointer(Void).new(int_id))
  end

  def self.combo_(label : String, current_item : Int32*, items_count : Int32, popup_max_height_in_items : Int32 = -1, &block : Int32 -> (Slice(UInt8) | String)?) : Bool
    LibImGui.igComboFnBoolPtr(label, current_item, ->(data, idx, out_text) {
      val = data.as(typeof(block)*).value.call(idx)
      if val
        out_text.value = val.to_unsafe
        true
      else
        false
      end
    }, pointerof(block), items_count, popup_max_height_in_items)
  end

  def self.set_next_window_size_constraints(size_min : ImVec2, size_max : ImVec2, &block : ImGuiSizeCallbackData ->) : Void
    LibImGui.igSetNextWindowSizeConstraints(size_min, size_max, ->(data) {
      data.value.user_data.as(typeof(block)*).value.call(ImGui::ImGuiSizeCallbackData.new(data))
    }, pointerof(block))
  end

  def self.col32(r : Int, g : Int, b : Int, a : Int = 255) : UInt32
    (r.to_u32 << 0) | (g.to_u32 << 8) | (b.to_u32 << 16) | (a.to_u32 << 24)
  end

  def self.col32(color : ImVec4) : UInt32
    color_convert_float4_to_u32(color)
  end

  def self.color(r : Int, g : Int, b : Int, a : Int = 255) : ImVec4
    vec4(r / 255f32, g / 255f32, b / 255f32, a / 255f32)
  end

  def self.color(col32 : UInt32) : ImVec4
    color_convert_u32_to_float4(col32)
  end

  def self.get_rgba(color : ImVec4) : {UInt8, UInt8, UInt8, UInt8}
    {(color.x * 255).round.to_u8,
     (color.y * 255).round.to_u8,
     (color.z * 255).round.to_u8,
     (color.w * 255).round.to_u8}
  end

  def self.rgb(r : Number, g : Number, b : Number, a : Number = 1.0) : ImVec4
    vec4(r, g, b, a)
  end

  def self.hsv(h : Number, s : Number, v : Number, a : Number = 1.0) : ImVec4
    r, g, b = color_convert_hs_vto_rgb(h.to_f32, s.to_f32, v.to_f32)
    vec4(r, g, b, a)
  end
end

class IO::Memory
  getter capacity

  def resize_to_capacity(capacity)
    previous_def
  end
end
