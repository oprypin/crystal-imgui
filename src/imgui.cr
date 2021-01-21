module ImGui
  LibImGui.igSetAllocatorFunctions(->(size, data) {
    GC.malloc(size)
  }, ->(ptr, data) {}, nil)

  private module ClassType(T)
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
    def to_unsafe
      {{"pointerof(@#{@type.instance_vars.first}).as(#{@type}*)".id}}
    end
  end
end

require "./lib"

module ImGui
  # :nodoc:
  macro pointer_wrapper(f)
    {{f}}

    macro {{f.name}}(*args, **kwargs, &block)
      {% verbatim do %}
      {% for arg in args %}{% if arg.is_a?(PointerOf) %}
        %val{arg} = {{arg.exp}}
      {% end %}{% end %}
      {% end %}

      # Wrapping the type into parentheses "breaks" detection of macro calls, so we can call the method shadowed by the macro.
      \%result = (\{{@type.name}}).{{f.name}}{% verbatim do %}(
        {% for arg, i in args %}{% if arg.is_a?(PointerOf) %}pointerof(%val{arg}){% else %}{{arg}}{% end %}, {% end %}{{**kwargs}}
      ) {{block}}{% end %}

      {% verbatim do %}
      {% for arg in args %}{% if arg.is_a?(PointerOf) %}
        if (typeof(%result) == Bool ? %result : {{arg.exp}} != %val{arg})
          {% if arg.exp.id.ends_with?("?") %}{{arg.exp.id[0...-1]}}{% else %}{{arg.exp}}{% end %} = %val{arg}
        end
      {% end %}{% end %}
      %result
      {% end %}
    end
  end

  private def self.to_void_id(x : Reference | Void*)
    x.as(Void*)
  end

  private def self.to_void_id(x : ClassType)
    x.to_unsafe
  end

  private def self.to_void_id(x : Int)
    Pointer(Void).new(x)
  end

  # Include this module to get access to ImGui types directly
  module TopLevel
  end

  include TopLevel
end

# :nodoc:
struct Tuple
  # :nodoc:
  def _promote_va_args
    {% begin %}
    Tuple.new(
    {% for i in 0...@type.size %}
      {% t = @type[i].name %}
      {% if t == "Int8" || t == "UInt8" || t == "Int16" || t == "UInt16" %}
        self[{{i}}].to_i32!,
      {% elsif t == "Float32" %}
        self[{{i}}].to_f64,
      {% else %}
        self[{{i}}],
      {% end %}
    {% end %}
    )
    {% end %}
  end
end

require "./obj"

module ImGui
  struct ImVec2
    def initialize
      @x = @y = 0
    end

    def initialize(x : Number, y : Number)
      @x = x.to_f32
      @y = y.to_f32
    end

    def to_unsafe : Float32*
      pointerof(@x)
    end
  end

  struct ImVec4
    def initialize
      @x = @y = @z = @w = 0
    end

    def initialize(x : Number, y : Number, z : Number, w : Number)
      @x = x.to_f32
      @y = y.to_f32
      @z = z.to_f32
      @w = w.to_f32
    end

    def to_unsafe : Float32*
      pointerof(@x)
    end
  end

  struct ImGuiInputTextCallbackData
    def bytes : Bytes
      self.buf.to_slice(self.buf_text_len)
    end
  end

  class TextBuffer < IO
    private EMPTY_STRING = [0u8].to_unsafe

    @buf : UInt8* = EMPTY_STRING
    getter capacity : Int32

    def bytesize : Int32
      LibC.strlen(@buf).to_i
    end

    def self.new(string : String, capacity : Int32 = string.bytesize)
      new(string.to_slice, capacity)
    end

    def initialize(string : Bytes, @capacity : Int32 = string.bytesize)
      if capacity < string.bytesize
        raise ArgumentError.new("Capacity can't be smaller than the string size")
      end
      if capacity > 0
        @buf = Pointer(UInt8).malloc(capacity + 1)
        @buf.copy_from(string.to_unsafe, string.bytesize)
      end
    end

    def initialize(@capacity : Int32 = 0)
      if capacity > 0
        @buf = Pointer(UInt8).malloc(capacity + 1)
      end
    end

    def read(slice)
      raise "Can't read from TextBuffer"
    end

    def write(slice : Bytes) : Nil
      old_size = bytesize
      resize(bytesize + slice.bytesize)
      slice.copy_to(@buf + old_size, slice.bytesize)
    end

    def resize(size : Int32) : Nil
      if size <= 0
        @buf = EMPTY_STRING
        @capacity = 0
        return
      end
      if size > @capacity
        @capacity = size < 8 ? 8 : Math.pw2ceil(size + 1)
        if @buf == EMPTY_STRING
          @buf = Pointer(UInt8).malloc(@capacity)
        else
          @buf = @buf.realloc(@capacity)
        end
        @capacity -= 1
      end
      @buf[size] = 0
    end

    def clear : Nil
      if capacity > 0
        @buf[0] = 0
      end
    end

    def to_unsafe : UInt8*
      @buf
    end

    def to_slice : Bytes
      @buf.to_slice(bytesize)
    end

    def to_s : String
      String.new(@buf)
    end
  end

  private NULL_CALLBACK = ->(d : ImGuiInputTextCallbackData) { 0 }

  private macro make_input_text(name, *args)
    def self.{{name.id}}({{*args}}, &block : ImGuiInputTextCallbackData -> Int32) : Bool
      block = nil if block == NULL_CALLBACK
      user_data = {buf, block}
      LibImGui.ig{{name.id.camelcase}}(
        {% for arg in args %}
          {% if arg.var == "buf" %}
            buf, buf.capacity,
          {% else %}
            {{arg.var}},
          {% end %}
        {% end %}
        ->(data) {
          data = ImGuiInputTextCallbackData.new(data)
          buf2, block2 = data.user_data.as(typeof(user_data)*).value

          if data.event_flag == ImGuiInputTextFlags::CallbackResize
            buf2.resize(data.buf_text_len)
            data.buf = buf2.to_unsafe
          end
          block2 ? block2.call(data) : 0
        }, pointerof(user_data)
      )
    end

    def self.{{name.id}}({{*args}}) : Bool
      {{name.id}}({{*args.map(&.var)}}, &NULL_CALLBACK)
    end
  end

  make_input_text(:input_text, label : String, buf : TextBuffer, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0))

  make_input_text(:input_text_multiline, label : String, buf : TextBuffer, size : ImVec2 = ImVec2.new(0, 0), flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0))

  make_input_text(:input_text_with_hint, label : String, hint : String, buf : TextBuffer, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0))

  pointer_wrapper def self.checkbox_flags(label : String, flags : Pointer, flags_value : Enum) : Bool
    LibImGui.igCheckboxFlags(label, flags.as(UInt32*), flags_value.as(Enum).to_u32!)
  end

  private macro make_plot(name, *args)
    def self.{{name.id}}({{*args}}, &block : Int32 -> Float32) : Void
      LibImGui.ig{{name.id.camelcase}}FnFloatPtr(
        {% for arg, i in args %}
          {% if i == 1 %}
            ->(data, idx) { data.as(typeof(block)*).value.call(idx) },
            pointerof(block),
          {% end %}
          {{arg.var}},
        {% end %}
      )
    end
  end

  make_plot(:plot_lines, label : String, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0))

  make_plot(:plot_histogram, label : String, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0))

  def self.get_id(int_id : Int) : ImGuiID
    get_id(Pointer(Void).new(int_id))
  end

  private macro make_list_box(name, *args)
    pointer_wrapper def self.{{name.id}}({{*args}}, &block : Int32 -> (Slice(UInt8) | String)?) : Bool
      LibImGui.ig{{name.id.camelcase}}FnBoolPtr(
        {% for arg, i in args %}
          {% if i == 2 %}
            ->(data, idx, out_text) {
              val = data.as(typeof(block)*).value.call(idx)
              if val
                out_text.value = val.to_unsafe
                true
              else
                false
              end
            }, pointerof(block),
            {% end %}
          {{arg.var}},
        {% end %}
      )
    end
  end

  make_list_box(:combo, label : String, current_item : Int32*, items_count : Int32, popup_max_height_in_items : Int32 = -1)

  pointer_wrapper def self.combo(label : String, current_item : Int32*, items : Indexable(String), popup_max_height_in_items : Int32 = -1)
    self.combo(label, current_item, items.size, popup_max_height_in_items) { |i| items[i] }
  end

  make_list_box(:list_box, label : String, current_item : Int32*, items_count : Int32, height_in_items : Int32 = -1)

  pointer_wrapper def self.list_box(label : String, current_item : Int32*, items : Indexable(String), height_in_items : Int32 = -1)
    self.list_box(label, current_item, items.size, height_in_items) { |i| items[i] }
  end

  def self.set_next_window_size_constraints(size_min : ImVec2, size_max : ImVec2, &block : ImGuiSizeCallbackData ->) : Void
    LibImGui.igSetNextWindowSizeConstraints(size_min, size_max, ->(data) {
      block2 = Box(typeof(block)).unbox(data.value.user_data)
      block2.call(ImGuiSizeCallbackData.new(data))
    }, Box.box(block))
  end

  struct ImDrawList
    def add_callback(&block : (ImDrawList, ImDrawCmd) ->) : Void
      LibImGui.ImDrawList_AddCallback(self, ->(parent_list, cmd) {
        block2 = Box(typeof(block)).unbox(cmd.value.user_callback_data)
        block2.call(ImDrawList.new(parent_list), ImDrawCmd.new(cmd))
      }, Box.box(block))
    end
  end

  def self.push_id(ptr_id : ClassType) : Void
    LibImGui.igPushIDPtr(ptr_id)
  end

  def self.col32(r : Int, g : Int, b : Int, a : Int = 255) : UInt32
    (r.to_u32 << 0) | (g.to_u32 << 8) | (b.to_u32 << 16) | (a.to_u32 << 24)
  end

  def self.col32(color : ImVec4) : UInt32
    color_convert_float4_to_u32(color)
  end

  def self.color(r : Int, g : Int, b : Int, a : Int = 255) : ImVec4
    ImVec4.new(r / 255f32, g / 255f32, b / 255f32, a / 255f32)
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
    ImVec4.new(r, g, b, a)
  end

  def self.hsv(h : Number, s : Number, v : Number, a : Number = 1.0) : ImVec4
    r, g, b = color_convert_hsv_to_rgb(h.to_f32, s.to_f32, v.to_f32)
    ImVec4.new(r, g, b, a)
  end

  PAYLOAD_TYPE_COLOR_3F = "_COL3F"
  PAYLOAD_TYPE_COLOR_4F = "_COL4F"
end
