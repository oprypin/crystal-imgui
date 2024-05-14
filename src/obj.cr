require "./lib"

module ImGui
  struct ImVec2
    include StructType

    def self.new : ImVec2
      result = LibImGui.ImVec2_ImVec2_Nil
      result.value
    end

    def self.new(_x : Float32, _y : Float32) : ImVec2
      result = LibImGui.ImVec2_ImVec2_Float(_x, _y)
      result.value
    end
  end

  struct ImVec4
    include StructType

    def self.new : ImVec4
      result = LibImGui.ImVec4_ImVec4_Nil
      result.value
    end

    def self.new(_x : Float32, _y : Float32, _z : Float32, _w : Float32) : ImVec4
      result = LibImGui.ImVec4_ImVec4_Float(_x, _y, _z, _w)
      result.value
    end
  end

  def self.create_context(shared_font_atlas : ImFontAtlas? = nil) : ImGuiContext
    result = LibImGui.CreateContext(shared_font_atlas)
    result.value
  end

  def self.destroy_context(ctx : ImGuiContext? = nil) : Void
    LibImGui.DestroyContext(ctx)
  end

  def self.get_current_context : ImGuiContext
    result = LibImGui.GetCurrentContext
    result.value
  end

  def self.set_current_context(ctx : ImGuiContext) : Void
    LibImGui.SetCurrentContext(ctx)
  end

  def self.get_io : ImGuiIO
    result = LibImGui.GetIO
    ImGuiIO.new(result)
  end

  def self.get_style : ImGuiStyle
    result = LibImGui.GetStyle
    ImGuiStyle.new(result)
  end

  def self.new_frame : Void
    LibImGui.NewFrame
  end

  def self.end_frame : Void
    LibImGui.EndFrame
  end

  def self.render : Void
    LibImGui.Render
  end

  def self.get_draw_data : ImDrawData
    result = LibImGui.GetDrawData
    ImDrawData.new(result)
  end

  pointer_wrapper def self.show_demo_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.ShowDemoWindow(p_open)
  end
  pointer_wrapper def self.show_metrics_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.ShowMetricsWindow(p_open)
  end
  pointer_wrapper def self.show_debug_log_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.ShowDebugLogWindow(p_open)
  end
  pointer_wrapper def self.show_id_stack_tool_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.ShowIDStackToolWindow(p_open)
  end
  pointer_wrapper def self.show_about_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.ShowAboutWindow(p_open)
  end

  def self.show_style_editor(ref : ImGuiStyle? = nil) : Void
    LibImGui.ShowStyleEditor(ref)
  end

  def self.show_style_selector(label : String) : Bool
    LibImGui.ShowStyleSelector(label)
  end

  def self.show_font_selector(label : String) : Void
    LibImGui.ShowFontSelector(label)
  end

  def self.show_user_guide : Void
    LibImGui.ShowUserGuide
  end

  def self.get_version : String
    result = LibImGui.GetVersion
    String.new(result)
  end

  def self.style_colors_dark(dst : ImGuiStyle? = nil) : Void
    LibImGui.StyleColorsDark(dst)
  end

  def self.style_colors_light(dst : ImGuiStyle? = nil) : Void
    LibImGui.StyleColorsLight(dst)
  end

  def self.style_colors_classic(dst : ImGuiStyle? = nil) : Void
    LibImGui.StyleColorsClassic(dst)
  end

  pointer_wrapper def self.begin(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.Begin(name, p_open, flags)
  end
  # Calls `begin`, conditionally yields to the block, then calls `end`.
  pointer_wrapper def self.window(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Nil
    yield if self.begin(name, p_open, flags)
    self.end
  end

  def self.end : Void
    LibImGui.End
  end

  def self.begin_child(str_id : String, size : ImVec2 = ImVec2.new(0, 0), child_flags : ImGuiChildFlags = ImGuiChildFlags.new(0), window_flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.BeginChild_Str(str_id, size, child_flags, window_flags)
  end

  # Calls `begin_child`, conditionally yields to the block, then calls `end_child`.
  def self.child(str_id : String, size : ImVec2 = ImVec2.new(0, 0), child_flags : ImGuiChildFlags = ImGuiChildFlags.new(0), window_flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Nil
    yield if self.begin_child(str_id, size, child_flags, window_flags)
    self.end_child
  end

  def self.begin_child(id : ImGuiID, size : ImVec2 = ImVec2.new(0, 0), child_flags : ImGuiChildFlags = ImGuiChildFlags.new(0), window_flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.BeginChild_ID(id, size, child_flags, window_flags)
  end

  # Calls `begin_child`, conditionally yields to the block, then calls `end_child`.
  def self.child(id : ImGuiID, size : ImVec2 = ImVec2.new(0, 0), child_flags : ImGuiChildFlags = ImGuiChildFlags.new(0), window_flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Nil
    yield if self.begin_child(id, size, child_flags, window_flags)
    self.end_child
  end

  def self.end_child : Void
    LibImGui.EndChild
  end

  def self.is_window_appearing : Bool
    LibImGui.IsWindowAppearing
  end

  def self.is_window_collapsed : Bool
    LibImGui.IsWindowCollapsed
  end

  def self.is_window_focused(flags : ImGuiFocusedFlags = ImGuiFocusedFlags.new(0)) : Bool
    LibImGui.IsWindowFocused(flags)
  end

  def self.is_window_hovered(flags : ImGuiHoveredFlags = ImGuiHoveredFlags.new(0)) : Bool
    LibImGui.IsWindowHovered(flags)
  end

  def self.get_window_draw_list : ImDrawList
    result = LibImGui.GetWindowDrawList
    ImDrawList.new(result)
  end

  def self.get_window_pos : ImGui::ImVec2
    LibImGui.GetWindowPos(out p_out)
    p_out
  end

  def self.get_window_size : ImGui::ImVec2
    LibImGui.GetWindowSize(out p_out)
    p_out
  end

  def self.get_window_width : Float32
    LibImGui.GetWindowWidth
  end

  def self.get_window_height : Float32
    LibImGui.GetWindowHeight
  end

  def self.set_next_window_pos(pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0), pivot : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.SetNextWindowPos(pos, cond, pivot)
  end

  def self.set_next_window_size(size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetNextWindowSize(size, cond)
  end

  def self.set_next_window_size_constraints(size_min : ImVec2, size_max : ImVec2, custom_callback : ImGuiSizeCallback? = nil, custom_callback_data : Void* = Pointer(Void).null) : Void
    LibImGui.SetNextWindowSizeConstraints(size_min, size_max, custom_callback, custom_callback_data)
  end

  def self.set_next_window_content_size(size : ImVec2) : Void
    LibImGui.SetNextWindowContentSize(size)
  end

  def self.set_next_window_collapsed(collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetNextWindowCollapsed(collapsed, cond)
  end

  def self.set_next_window_focus : Void
    LibImGui.SetNextWindowFocus
  end

  def self.set_next_window_scroll(scroll : ImVec2) : Void
    LibImGui.SetNextWindowScroll(scroll)
  end

  def self.set_next_window_bg_alpha(alpha : Float32) : Void
    LibImGui.SetNextWindowBgAlpha(alpha)
  end

  def self.set_window_pos(pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowPos_Vec2(pos, cond)
  end

  def self.set_window_pos(name : String, pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowPos_Str(name, pos, cond)
  end

  def self.set_window_size(size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowSize_Vec2(size, cond)
  end

  def self.set_window_size(name : String, size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowSize_Str(name, size, cond)
  end

  def self.set_window_collapsed(collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowCollapsed_Bool(collapsed, cond)
  end

  def self.set_window_collapsed(name : String, collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowCollapsed_Str(name, collapsed, cond)
  end

  def self.set_window_focus : Void
    LibImGui.SetWindowFocus_Nil
  end

  def self.set_window_focus(name : String) : Void
    LibImGui.SetWindowFocus_Str(name)
  end

  def self.set_window_font_scale(scale : Float32) : Void
    LibImGui.SetWindowFontScale(scale)
  end

  def self.get_content_region_avail : ImGui::ImVec2
    LibImGui.GetContentRegionAvail(out p_out)
    p_out
  end

  def self.get_content_region_max : ImGui::ImVec2
    LibImGui.GetContentRegionMax(out p_out)
    p_out
  end

  def self.get_window_content_region_min : ImGui::ImVec2
    LibImGui.GetWindowContentRegionMin(out p_out)
    p_out
  end

  def self.get_window_content_region_max : ImGui::ImVec2
    LibImGui.GetWindowContentRegionMax(out p_out)
    p_out
  end

  def self.get_scroll_x : Float32
    LibImGui.GetScrollX
  end

  def self.get_scroll_y : Float32
    LibImGui.GetScrollY
  end

  def self.set_scroll_x(scroll_x : Float32) : Void
    LibImGui.SetScrollX_Float(scroll_x)
  end

  def self.set_scroll_y(scroll_y : Float32) : Void
    LibImGui.SetScrollY_Float(scroll_y)
  end

  def self.get_scroll_max_x : Float32
    LibImGui.GetScrollMaxX
  end

  def self.get_scroll_max_y : Float32
    LibImGui.GetScrollMaxY
  end

  def self.set_scroll_here_x(center_x_ratio : Float32 = 0.5) : Void
    LibImGui.SetScrollHereX(center_x_ratio)
  end

  def self.set_scroll_here_y(center_y_ratio : Float32 = 0.5) : Void
    LibImGui.SetScrollHereY(center_y_ratio)
  end

  def self.set_scroll_from_pos_x(local_x : Float32, center_x_ratio : Float32 = 0.5) : Void
    LibImGui.SetScrollFromPosX_Float(local_x, center_x_ratio)
  end

  def self.set_scroll_from_pos_y(local_y : Float32, center_y_ratio : Float32 = 0.5) : Void
    LibImGui.SetScrollFromPosY_Float(local_y, center_y_ratio)
  end

  def self.push_font(font : ImFont) : Void
    LibImGui.PushFont(font)
  end

  # Calls `push_font`, yields to the block, then calls `pop_font`.
  def self.with_font(font : ImFont) : Nil
    self.push_font(font)
    yield
    self.pop_font
  end

  def self.pop_font : Void
    LibImGui.PopFont
  end

  def self.push_style_color(idx : ImGuiCol, col : UInt32) : Void
    LibImGui.PushStyleColor_U32(idx, col)
  end

  # Calls `push_style_color`, yields to the block, then calls `pop_style_color`.
  def self.with_style_color(idx : ImGuiCol, col : UInt32) : Nil
    self.push_style_color(idx, col)
    yield
    self.pop_style_color
  end

  def self.push_style_color(idx : ImGuiCol, col : ImVec4) : Void
    LibImGui.PushStyleColor_Vec4(idx, col)
  end

  # Calls `push_style_color`, yields to the block, then calls `pop_style_color`.
  def self.with_style_color(idx : ImGuiCol, col : ImVec4) : Nil
    self.push_style_color(idx, col)
    yield
    self.pop_style_color
  end

  def self.pop_style_color(count : Int32 = 1) : Void
    LibImGui.PopStyleColor(count)
  end

  def self.push_style_var(idx : ImGuiStyleVar, val : Float32) : Void
    LibImGui.PushStyleVar_Float(idx, val)
  end

  # Calls `push_style_var`, yields to the block, then calls `pop_style_var`.
  def self.with_style_var(idx : ImGuiStyleVar, val : Float32) : Nil
    self.push_style_var(idx, val)
    yield
    self.pop_style_var
  end

  def self.push_style_var(idx : ImGuiStyleVar, val : ImVec2) : Void
    LibImGui.PushStyleVar_Vec2(idx, val)
  end

  # Calls `push_style_var`, yields to the block, then calls `pop_style_var`.
  def self.with_style_var(idx : ImGuiStyleVar, val : ImVec2) : Nil
    self.push_style_var(idx, val)
    yield
    self.pop_style_var
  end

  def self.pop_style_var(count : Int32 = 1) : Void
    LibImGui.PopStyleVar(count)
  end

  def self.push_tab_stop(tab_stop : Bool) : Void
    LibImGui.PushTabStop(tab_stop)
  end

  # Calls `push_tab_stop`, yields to the block, then calls `pop_tab_stop`.
  def self.with_tab_stop(tab_stop : Bool) : Nil
    self.push_tab_stop(tab_stop)
    yield
    self.pop_tab_stop
  end

  def self.pop_tab_stop : Void
    LibImGui.PopTabStop
  end

  def self.push_button_repeat(repeat : Bool) : Void
    LibImGui.PushButtonRepeat(repeat)
  end

  # Calls `push_button_repeat`, yields to the block, then calls `pop_button_repeat`.
  def self.with_button_repeat(repeat : Bool) : Nil
    self.push_button_repeat(repeat)
    yield
    self.pop_button_repeat
  end

  def self.pop_button_repeat : Void
    LibImGui.PopButtonRepeat
  end

  def self.push_item_width(item_width : Float32) : Void
    LibImGui.PushItemWidth(item_width)
  end

  # Calls `push_item_width`, yields to the block, then calls `pop_item_width`.
  def self.with_item_width(item_width : Float32) : Nil
    self.push_item_width(item_width)
    yield
    self.pop_item_width
  end

  def self.pop_item_width : Void
    LibImGui.PopItemWidth
  end

  def self.set_next_item_width(item_width : Float32) : Void
    LibImGui.SetNextItemWidth(item_width)
  end

  def self.calc_item_width : Float32
    LibImGui.CalcItemWidth
  end

  def self.push_text_wrap_pos(wrap_local_pos_x : Float32 = 0.0) : Void
    LibImGui.PushTextWrapPos(wrap_local_pos_x)
  end

  # Calls `push_text_wrap_pos`, yields to the block, then calls `pop_text_wrap_pos`.
  def self.with_text_wrap_pos(wrap_local_pos_x : Float32 = 0.0) : Nil
    self.push_text_wrap_pos(wrap_local_pos_x)
    yield
    self.pop_text_wrap_pos
  end

  def self.pop_text_wrap_pos : Void
    LibImGui.PopTextWrapPos
  end

  def self.get_font : ImFont
    result = LibImGui.GetFont
    ImFont.new(result)
  end

  def self.get_font_size : Float32
    LibImGui.GetFontSize
  end

  def self.get_font_tex_uv_white_pixel : ImGui::ImVec2
    LibImGui.GetFontTexUvWhitePixel(out p_out)
    p_out
  end

  def self.get_color_u32(idx : ImGuiCol, alpha_mul : Float32 = 1.0) : UInt32
    LibImGui.GetColorU32_Col(idx, alpha_mul)
  end

  def self.get_color_u32(col : ImVec4) : UInt32
    LibImGui.GetColorU32_Vec4(col)
  end

  def self.get_color_u32(col : UInt32, alpha_mul : Float32 = 1.0) : UInt32
    LibImGui.GetColorU32_U32(col, alpha_mul)
  end

  def self.get_style_color_vec4(idx : ImGuiCol) : ImVec4
    result = LibImGui.GetStyleColorVec4(idx)
    result.value
  end

  def self.get_cursor_screen_pos : ImGui::ImVec2
    LibImGui.GetCursorScreenPos(out p_out)
    p_out
  end

  def self.set_cursor_screen_pos(pos : ImVec2) : Void
    LibImGui.SetCursorScreenPos(pos)
  end

  def self.get_cursor_pos : ImGui::ImVec2
    LibImGui.GetCursorPos(out p_out)
    p_out
  end

  def self.get_cursor_pos_x : Float32
    LibImGui.GetCursorPosX
  end

  def self.get_cursor_pos_y : Float32
    LibImGui.GetCursorPosY
  end

  def self.set_cursor_pos(local_pos : ImVec2) : Void
    LibImGui.SetCursorPos(local_pos)
  end

  def self.set_cursor_pos_x(local_x : Float32) : Void
    LibImGui.SetCursorPosX(local_x)
  end

  def self.set_cursor_pos_y(local_y : Float32) : Void
    LibImGui.SetCursorPosY(local_y)
  end

  def self.get_cursor_start_pos : ImGui::ImVec2
    LibImGui.GetCursorStartPos(out p_out)
    p_out
  end

  def self.separator : Void
    LibImGui.Separator
  end

  def self.same_line(offset_from_start_x : Float32 = 0.0, spacing : Float32 = -1.0) : Void
    LibImGui.SameLine(offset_from_start_x, spacing)
  end

  def self.new_line : Void
    LibImGui.NewLine
  end

  def self.spacing : Void
    LibImGui.Spacing
  end

  def self.dummy(size : ImVec2) : Void
    LibImGui.Dummy(size)
  end

  def self.indent(indent_w : Float32 = 0.0) : Void
    LibImGui.Indent(indent_w)
  end

  def self.unindent(indent_w : Float32 = 0.0) : Void
    LibImGui.Unindent(indent_w)
  end

  def self.begin_group : Void
    LibImGui.BeginGroup
  end

  # Calls `begin_group`, yields to the block, then calls `end_group`.
  def self.group : Nil
    self.begin_group
    yield
    self.end_group
  end

  def self.end_group : Void
    LibImGui.EndGroup
  end

  def self.align_text_to_frame_padding : Void
    LibImGui.AlignTextToFramePadding
  end

  def self.get_text_line_height : Float32
    LibImGui.GetTextLineHeight
  end

  def self.get_text_line_height_with_spacing : Float32
    LibImGui.GetTextLineHeightWithSpacing
  end

  def self.get_frame_height : Float32
    LibImGui.GetFrameHeight
  end

  def self.get_frame_height_with_spacing : Float32
    LibImGui.GetFrameHeightWithSpacing
  end

  def self.push_id(str_id : String) : Void
    LibImGui.PushID_Str(str_id)
  end

  # Calls `push_id`, yields to the block, then calls `pop_id`.
  def self.with_id(str_id : String) : Nil
    self.push_id(str_id)
    yield
    self.pop_id
  end

  def self.push_id(str_id : Bytes | String) : Void
    LibImGui.PushID_StrStr(str_id, (str_id.to_unsafe + str_id.bytesize))
  end

  # Calls `push_id`, yields to the block, then calls `pop_id`.
  def self.with_id(str_id : Bytes | String) : Nil
    self.push_id(str_id)
    yield
    self.pop_id
  end

  def self.push_id(ptr_id : Reference | ClassType | Int | Void*) : Void
    LibImGui.PushID_Ptr(to_void_id(ptr_id))
  end

  # Calls `push_id`, yields to the block, then calls `pop_id`.
  def self.with_id(ptr_id : Reference | ClassType | Int | Void*) : Nil
    self.push_id(ptr_id)
    yield
    self.pop_id
  end

  def self.push_id(int_id : Int32) : Void
    LibImGui.PushID_Int(int_id)
  end

  # Calls `push_id`, yields to the block, then calls `pop_id`.
  def self.with_id(int_id : Int32) : Nil
    self.push_id(int_id)
    yield
    self.pop_id
  end

  def self.pop_id : Void
    LibImGui.PopID
  end

  def self.get_id(str_id : String) : ImGuiID
    LibImGui.GetID_Str(str_id)
  end

  def self.get_id(str_id : Bytes | String) : ImGuiID
    LibImGui.GetID_StrStr(str_id, (str_id.to_unsafe + str_id.bytesize))
  end

  def self.get_id(ptr_id : Reference | ClassType | Int | Void*) : ImGuiID
    LibImGui.GetID_Ptr(to_void_id(ptr_id))
  end

  def self.text_unformatted(text : Bytes | String) : Void
    LibImGui.TextUnformatted(text, (text.to_unsafe + text.bytesize))
  end

  def self.text(fmt : String, *args) : Void
    LibImGui.Text(fmt, *args._promote_va_args)
  end

  def self.text_colored(col : ImVec4, fmt : String, *args) : Void
    LibImGui.TextColored(col, fmt, *args._promote_va_args)
  end

  def self.text_disabled(fmt : String, *args) : Void
    LibImGui.TextDisabled(fmt, *args._promote_va_args)
  end

  def self.text_wrapped(fmt : String, *args) : Void
    LibImGui.TextWrapped(fmt, *args._promote_va_args)
  end

  def self.label_text(label : String, fmt : String, *args) : Void
    LibImGui.LabelText(label, fmt, *args._promote_va_args)
  end

  def self.bullet_text(fmt : String, *args) : Void
    LibImGui.BulletText(fmt, *args._promote_va_args)
  end

  def self.separator_text(label : String) : Void
    LibImGui.SeparatorText(label)
  end

  def self.button(label : String, size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.Button(label, size)
  end

  def self.small_button(label : String) : Bool
    LibImGui.SmallButton(label)
  end

  def self.invisible_button(str_id : String, size : ImVec2, flags : ImGuiButtonFlags = ImGuiButtonFlags.new(0)) : Bool
    LibImGui.InvisibleButton(str_id, size, flags)
  end

  def self.arrow_button(str_id : String, dir : ImGuiDir) : Bool
    LibImGui.ArrowButton(str_id, dir)
  end

  pointer_wrapper def self.checkbox(label : String, v : Bool*) : Bool
    LibImGui.Checkbox(label, v)
  end
  pointer_wrapper def self.checkbox_flags(label : String, flags : Int32*, flags_value : Int32) : Bool
    LibImGui.CheckboxFlags_IntPtr(label, flags, flags_value)
  end
  pointer_wrapper def self.checkbox_flags(label : String, flags : UInt32*, flags_value : UInt32) : Bool
    LibImGui.CheckboxFlags_UintPtr(label, flags, flags_value)
  end
  pointer_wrapper def self.radio_button(label : String, active : Bool) : Bool
    LibImGui.RadioButton_Bool(label, active)
  end
  pointer_wrapper def self.radio_button(label : String, v : Int32*, v_button : Int32) : Bool
    LibImGui.RadioButton_IntPtr(label, v, v_button)
  end

  def self.progress_bar(fraction : Float32, size_arg : ImVec2 = ImVec2.new(-Float32::MIN_POSITIVE, 0), overlay : String? = nil) : Void
    LibImGui.ProgressBar(fraction, size_arg, overlay)
  end

  def self.bullet : Void
    LibImGui.Bullet
  end

  def self.image(user_texture_id : ImTextureID, image_size : ImVec2, uv0 : ImVec2 = ImVec2.new(0, 0), uv1 : ImVec2 = ImVec2.new(1, 1), tint_col : ImVec4 = ImVec4.new(1, 1, 1, 1), border_col : ImVec4 = ImVec4.new(0, 0, 0, 0)) : Void
    LibImGui.Image(user_texture_id, image_size, uv0, uv1, tint_col, border_col)
  end

  def self.image_button(str_id : String, user_texture_id : ImTextureID, image_size : ImVec2, uv0 : ImVec2 = ImVec2.new(0, 0), uv1 : ImVec2 = ImVec2.new(1, 1), bg_col : ImVec4 = ImVec4.new(0, 0, 0, 0), tint_col : ImVec4 = ImVec4.new(1, 1, 1, 1)) : Bool
    LibImGui.ImageButton(str_id, user_texture_id, image_size, uv0, uv1, bg_col, tint_col)
  end

  def self.begin_combo(label : String, preview_value : String, flags : ImGuiComboFlags = ImGuiComboFlags.new(0)) : Bool
    LibImGui.BeginCombo(label, preview_value, flags)
  end

  # Calls `begin_combo`, conditionally yields to the block, then conditionally calls `end_combo`.
  def self.combo(label : String, preview_value : String, flags : ImGuiComboFlags = ImGuiComboFlags.new(0)) : Nil
    return unless self.begin_combo(label, preview_value, flags)
    yield
    self.end_combo
  end

  def self.end_combo : Void
    LibImGui.EndCombo
  end

  pointer_wrapper def self.combo(label : String, current_item : Int32* | Pointer, items : Indexable(LibC::Char*), popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.Combo_Str_arr(label, (typeof(current_item.value.to_i32); current_item.as(Int32*)), items, items.size, popup_max_height_in_items)
  end
  pointer_wrapper def self.combo(label : String, current_item : Int32* | Pointer, items_separated_by_zeros : String, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.Combo_Str(label, (typeof(current_item.value.to_i32); current_item.as(Int32*)), items_separated_by_zeros, popup_max_height_in_items)
  end
  pointer_wrapper def self.combo(label : String, current_item : Int32* | Pointer, getter : (Void*, Int32) -> String, user_data : Void*, items_count : Int32, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.Combo_FnStrPtr(label, (typeof(current_item.value.to_i32); current_item.as(Int32*)), getter, user_data, items_count, popup_max_height_in_items)
  end
  pointer_wrapper def self.drag_float(label : String, v : Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragFloat(label, v, v_speed, v_min, v_max, format, flags)
  end
  pointer_wrapper def self.drag_float2(label : String, v : ImVec2* | Indexable(Float32) | Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragFloat2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Float32*), v_speed, v_min, v_max, format, flags)
  end
  pointer_wrapper def self.drag_float3(label : String, v : Indexable(Float32) | Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragFloat3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Float32*), v_speed, v_min, v_max, format, flags)
  end
  pointer_wrapper def self.drag_float4(label : String, v : ImVec4* | Indexable(Float32) | Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragFloat4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Float32*), v_speed, v_min, v_max, format, flags)
  end
  pointer_wrapper def self.drag_float_range2(label : String, v_current_min : Float32*, v_current_max : Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", format_max : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags)
  end
  pointer_wrapper def self.drag_int(label : String, v : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragInt(label, v, v_speed, v_min, v_max, format, flags)
  end
  pointer_wrapper def self.drag_int2(label : String, v : Indexable(Int32) | Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragInt2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Int32*), v_speed, v_min, v_max, format, flags)
  end
  pointer_wrapper def self.drag_int3(label : String, v : Indexable(Int32) | Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragInt3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Int32*), v_speed, v_min, v_max, format, flags)
  end
  pointer_wrapper def self.drag_int4(label : String, v : Indexable(Int32) | Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragInt4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Int32*), v_speed, v_min, v_max, format, flags)
  end
  pointer_wrapper def self.drag_int_range2(label : String, v_current_min : Int32*, v_current_max : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", format_max : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  pointer_wrapper def self.drag_scalar(label : String, p_data : {{t}}*, v_speed : Float32 = 1.0, p_min : {{t}}? = nil, p_max : {{t}}? = nil, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragScalar(label, ImGuiDataType::{{k.id}}, p_data, v_speed, p_min ? (p_min_ = p_min; pointerof(p_min_)) : Pointer({{t}}).null, p_max ? (p_max_ = p_max; pointerof(p_max_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  pointer_wrapper def self.drag_scalar_n(label : String, p_data : {{t}}*, components : Int32, v_speed : Float32 = 1.0, p_min : {{t}}* = Pointer({{t}}).null, p_max : {{t}}* = Pointer({{t}}).null, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, v_speed, p_min, p_max, format, flags)
  end
  {% end %}
  pointer_wrapper def self.slider_float(label : String, v : Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderFloat(label, v, v_min, v_max, format, flags)
  end
  pointer_wrapper def self.slider_float2(label : String, v : ImVec2* | Indexable(Float32) | Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderFloat2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Float32*), v_min, v_max, format, flags)
  end
  pointer_wrapper def self.slider_float3(label : String, v : Indexable(Float32) | Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderFloat3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Float32*), v_min, v_max, format, flags)
  end
  pointer_wrapper def self.slider_float4(label : String, v : ImVec4* | Indexable(Float32) | Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderFloat4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Float32*), v_min, v_max, format, flags)
  end
  pointer_wrapper def self.slider_angle(label : String, v_rad : Float32*, v_degrees_min : Float32 = -360.0, v_degrees_max : Float32 = +360.0, format : String = "%.0f deg", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderAngle(label, v_rad, v_degrees_min, v_degrees_max, format, flags)
  end
  pointer_wrapper def self.slider_int(label : String, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderInt(label, v, v_min, v_max, format, flags)
  end
  pointer_wrapper def self.slider_int2(label : String, v : Indexable(Int32) | Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderInt2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Int32*), v_min, v_max, format, flags)
  end
  pointer_wrapper def self.slider_int3(label : String, v : Indexable(Int32) | Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderInt3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Int32*), v_min, v_max, format, flags)
  end
  pointer_wrapper def self.slider_int4(label : String, v : Indexable(Int32) | Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderInt4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Int32*), v_min, v_max, format, flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  pointer_wrapper def self.slider_scalar(label : String, p_data : {{t}}*, p_min : {{t}}, p_max : {{t}}, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderScalar(label, ImGuiDataType::{{k.id}}, p_data, p_min ? (p_min_ = p_min; pointerof(p_min_)) : Pointer({{t}}).null, p_max ? (p_max_ = p_max; pointerof(p_max_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  pointer_wrapper def self.slider_scalar_n(label : String, p_data : {{t}}*, components : Int32, p_min : {{t}}*, p_max : {{t}}*, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, p_min, p_max, format, flags)
  end
  {% end %}
  pointer_wrapper def self.v_slider_float(label : String, size : ImVec2, v : Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.VSliderFloat(label, size, v, v_min, v_max, format, flags)
  end
  pointer_wrapper def self.v_slider_int(label : String, size : ImVec2, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.VSliderInt(label, size, v, v_min, v_max, format, flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  pointer_wrapper def self.v_slider_scalar(label : String, size : ImVec2, p_data : {{t}}*, p_min : {{t}}, p_max : {{t}}, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.VSliderScalar(label, size, ImGuiDataType::{{k.id}}, p_data, p_min ? (p_min_ = p_min; pointerof(p_min_)) : Pointer({{t}}).null, p_max ? (p_max_ = p_max; pointerof(p_max_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}

  def self.input_text(label : String, buf : Bytes, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.InputText(label, buf, buf.size, flags, callback, user_data)
  end

  def self.input_text_multiline(label : String, buf : Bytes, size : ImVec2 = ImVec2.new(0, 0), flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.InputTextMultiline(label, buf, buf.size, size, flags, callback, user_data)
  end

  def self.input_text_with_hint(label : String, hint : String, buf : Bytes, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.InputTextWithHint(label, hint, buf, buf.size, flags, callback, user_data)
  end

  pointer_wrapper def self.input_float(label : String, v : Float32*, step : Float32 = 0.0, step_fast : Float32 = 0.0, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputFloat(label, v, step, step_fast, format, flags)
  end
  pointer_wrapper def self.input_float2(label : String, v : ImVec2* | Indexable(Float32) | Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputFloat2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Float32*), format, flags)
  end
  pointer_wrapper def self.input_float3(label : String, v : Indexable(Float32) | Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputFloat3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Float32*), format, flags)
  end
  pointer_wrapper def self.input_float4(label : String, v : ImVec4* | Indexable(Float32) | Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputFloat4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Float32*), format, flags)
  end
  pointer_wrapper def self.input_int(label : String, v : Int32*, step : Int32 = 1, step_fast : Int32 = 100, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputInt(label, v, step, step_fast, flags)
  end
  pointer_wrapper def self.input_int2(label : String, v : Indexable(Int32) | Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputInt2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Int32*), flags)
  end
  pointer_wrapper def self.input_int3(label : String, v : Indexable(Int32) | Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputInt3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Int32*), flags)
  end
  pointer_wrapper def self.input_int4(label : String, v : Indexable(Int32) | Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputInt4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Int32*), flags)
  end
  pointer_wrapper def self.input_double(label : String, v : Float64*, step : Float64 = 0.0, step_fast : Float64 = 0.0, format : String = "%.6f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputDouble(label, v, step, step_fast, format, flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  pointer_wrapper def self.input_scalar(label : String, p_data : {{t}}*, p_step : {{t}}? = nil, p_step_fast : {{t}}? = nil, format : String? = nil, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputScalar(label, ImGuiDataType::{{k.id}}, p_data, p_step ? (p_step_ = p_step; pointerof(p_step_)) : Pointer({{t}}).null, p_step_fast ? (p_step_fast_ = p_step_fast; pointerof(p_step_fast_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  pointer_wrapper def self.input_scalar_n(label : String, p_data : {{t}}*, components : Int32, p_step : {{t}}* = Pointer({{t}}).null, p_step_fast : {{t}}* = Pointer({{t}}).null, format : String? = nil, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, p_step, p_step_fast, format, flags)
  end
  {% end %}
  pointer_wrapper def self.color_edit3(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.ColorEdit3(label, col.is_a?(Indexable) ? (
      col.size == 3 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 3)")
    ) : col.as(Float32*), flags)
  end
  pointer_wrapper def self.color_edit4(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.ColorEdit4(label, col.is_a?(Indexable) ? (
      col.size == 4 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 4)")
    ) : col.as(Float32*), flags)
  end
  pointer_wrapper def self.color_picker3(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.ColorPicker3(label, col.is_a?(Indexable) ? (
      col.size == 3 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 3)")
    ) : col.as(Float32*), flags)
  end
  pointer_wrapper def self.color_picker4(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0), ref_col : Float32* = Pointer(Float32).null) : Bool
    LibImGui.ColorPicker4(label, col.is_a?(Indexable) ? (
      col.size == 4 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 4)")
    ) : col.as(Float32*), flags, ref_col)
  end

  def self.color_button(desc_id : String, col : ImVec4, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.ColorButton(desc_id, col, flags, size)
  end

  def self.set_color_edit_options(flags : ImGuiColorEditFlags) : Void
    LibImGui.SetColorEditOptions(flags)
  end

  def self.tree_node(label : String) : Bool
    LibImGui.TreeNode_Str(label)
  end

  # Calls `tree_node`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node(label : String) : Nil
    return unless self.tree_node(label)
    yield
    self.tree_pop
  end

  def self.tree_node(str_id : String, fmt : String, *args) : Bool
    LibImGui.TreeNode_StrStr(str_id, fmt, *args._promote_va_args)
  end

  # Calls `tree_node`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node(str_id : String, fmt : String, *args) : Nil
    return unless self.tree_node(str_id, fmt, *args)
    yield
    self.tree_pop
  end

  def self.tree_node(ptr_id : Reference | ClassType | Int | Void*, fmt : String, *args) : Bool
    LibImGui.TreeNode_Ptr(to_void_id(ptr_id), fmt, *args._promote_va_args)
  end

  # Calls `tree_node`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node(ptr_id : Reference | ClassType | Int | Void*, fmt : String, *args) : Nil
    return unless self.tree_node(ptr_id, fmt, *args)
    yield
    self.tree_pop
  end

  def self.tree_node_ex(label : String, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.TreeNodeEx_Str(label, flags)
  end

  # Calls `tree_node_ex`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node_ex(label : String, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Nil
    return unless self.tree_node_ex(label, flags)
    yield
    self.tree_pop
  end

  def self.tree_node_ex(str_id : String, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Bool
    LibImGui.TreeNodeEx_StrStr(str_id, flags, fmt, *args._promote_va_args)
  end

  # Calls `tree_node_ex`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node_ex(str_id : String, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Nil
    return unless self.tree_node_ex(str_id, flags, fmt, *args)
    yield
    self.tree_pop
  end

  def self.tree_node_ex(ptr_id : Reference | ClassType | Int | Void*, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Bool
    LibImGui.TreeNodeEx_Ptr(to_void_id(ptr_id), flags, fmt, *args._promote_va_args)
  end

  # Calls `tree_node_ex`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node_ex(ptr_id : Reference | ClassType | Int | Void*, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Nil
    return unless self.tree_node_ex(ptr_id, flags, fmt, *args)
    yield
    self.tree_pop
  end

  def self.tree_push(str_id : String) : Void
    LibImGui.TreePush_Str(str_id)
  end

  # Calls `tree_push`, yields to the block, then calls `tree_pop`.
  def self.with_tree(str_id : String) : Nil
    self.tree_push(str_id)
    yield
    self.tree_pop
  end

  def self.tree_push(ptr_id : Reference | ClassType | Int | Void*) : Void
    LibImGui.TreePush_Ptr(to_void_id(ptr_id))
  end

  # Calls `tree_push`, yields to the block, then calls `tree_pop`.
  def self.with_tree(ptr_id : Reference | ClassType | Int | Void*) : Nil
    self.tree_push(ptr_id)
    yield
    self.tree_pop
  end

  def self.tree_pop : Void
    LibImGui.TreePop
  end

  def self.get_tree_node_to_label_spacing : Float32
    LibImGui.GetTreeNodeToLabelSpacing
  end

  pointer_wrapper def self.collapsing_header(label : String, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.CollapsingHeader_TreeNodeFlags(label, flags)
  end
  pointer_wrapper def self.collapsing_header(label : String, p_visible : Bool*, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.CollapsingHeader_BoolPtr(label, p_visible, flags)
  end

  def self.set_next_item_open(is_open : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetNextItemOpen(is_open, cond)
  end

  pointer_wrapper def self.selectable(label : String, selected : Bool = false, flags : ImGuiSelectableFlags = ImGuiSelectableFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.Selectable_Bool(label, selected, flags, size)
  end
  pointer_wrapper def self.selectable(label : String, p_selected : Bool*, flags : ImGuiSelectableFlags = ImGuiSelectableFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.Selectable_BoolPtr(label, p_selected, flags, size)
  end

  def self.begin_list_box(label : String, size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.BeginListBox(label, size)
  end

  # Calls `begin_list_box`, conditionally yields to the block, then conditionally calls `end_list_box`.
  def self.list_box(label : String, size : ImVec2 = ImVec2.new(0, 0)) : Nil
    return unless self.begin_list_box(label, size)
    yield
    self.end_list_box
  end

  def self.end_list_box : Void
    LibImGui.EndListBox
  end

  pointer_wrapper def self.list_box(label : String, current_item : Int32* | Pointer, items : Indexable(LibC::Char*), height_in_items : Int32 = -1) : Bool
    LibImGui.ListBox_Str_arr(label, (typeof(current_item.value.to_i32); current_item.as(Int32*)), items, items.size, height_in_items)
  end
  pointer_wrapper def self.list_box(label : String, current_item : Int32* | Pointer, getter : (Void*, Int32) -> String, user_data : Void*, items_count : Int32, height_in_items : Int32 = -1) : Bool
    LibImGui.ListBox_FnStrPtr(label, (typeof(current_item.value.to_i32); current_item.as(Int32*)), getter, user_data, items_count, height_in_items)
  end

  def self.plot_lines(label : String, values : Indexable(Float32), values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0), stride : Int32 = sizeof(Float32)) : Void
    LibImGui.PlotLines_FloatPtr(label, values, values.size, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
  end

  def self.plot_lines(label : String, values_getter : (Void*, Int32) -> Float32, data : Void*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.PlotLines_FnFloatPtr(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
  end

  def self.plot_histogram(label : String, values : Indexable(Float32), values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0), stride : Int32 = sizeof(Float32)) : Void
    LibImGui.PlotHistogram_FloatPtr(label, values, values.size, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
  end

  def self.plot_histogram(label : String, values_getter : (Void*, Int32) -> Float32, data : Void*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.PlotHistogram_FnFloatPtr(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
  end

  def self.value(prefix : String, b : Bool) : Void
    LibImGui.Value_Bool(prefix, b)
  end

  def self.value(prefix : String, v : Int32) : Void
    LibImGui.Value_Int(prefix, v)
  end

  def self.value(prefix : String, v : UInt32) : Void
    LibImGui.Value_Uint(prefix, v)
  end

  def self.value(prefix : String, v : Float32, float_format : String? = nil) : Void
    LibImGui.Value_Float(prefix, v, float_format)
  end

  def self.begin_menu_bar : Bool
    LibImGui.BeginMenuBar
  end

  # Calls `begin_menu_bar`, conditionally yields to the block, then conditionally calls `end_menu_bar`.
  def self.menu_bar : Nil
    return unless self.begin_menu_bar
    yield
    self.end_menu_bar
  end

  def self.end_menu_bar : Void
    LibImGui.EndMenuBar
  end

  def self.begin_main_menu_bar : Bool
    LibImGui.BeginMainMenuBar
  end

  # Calls `begin_main_menu_bar`, conditionally yields to the block, then conditionally calls `end_main_menu_bar`.
  def self.main_menu_bar : Nil
    return unless self.begin_main_menu_bar
    yield
    self.end_main_menu_bar
  end

  def self.end_main_menu_bar : Void
    LibImGui.EndMainMenuBar
  end

  def self.begin_menu(label : String, enabled : Bool = true) : Bool
    LibImGui.BeginMenu(label, enabled)
  end

  # Calls `begin_menu`, conditionally yields to the block, then conditionally calls `end_menu`.
  def self.menu(label : String, enabled : Bool = true) : Nil
    return unless self.begin_menu(label, enabled)
    yield
    self.end_menu
  end

  def self.end_menu : Void
    LibImGui.EndMenu
  end

  pointer_wrapper def self.menu_item(label : String, shortcut : String? = nil, selected : Bool = false, enabled : Bool = true) : Bool
    LibImGui.MenuItem_Bool(label, shortcut, selected, enabled)
  end
  pointer_wrapper def self.menu_item(label : String, shortcut : String, p_selected : Bool*, enabled : Bool = true) : Bool
    LibImGui.MenuItem_BoolPtr(label, shortcut, p_selected, enabled)
  end

  def self.begin_tooltip : Bool
    LibImGui.BeginTooltip
  end

  # Calls `begin_tooltip`, conditionally yields to the block, then calls `end_tooltip`.
  def self.tooltip : Nil
    yield if self.begin_tooltip
    self.end_tooltip
  end

  def self.end_tooltip : Void
    LibImGui.EndTooltip
  end

  def self.set_tooltip(fmt : String, *args) : Void
    LibImGui.SetTooltip(fmt, *args._promote_va_args)
  end

  def self.begin_item_tooltip : Bool
    LibImGui.BeginItemTooltip
  end

  def self.set_item_tooltip(fmt : String, *args) : Void
    LibImGui.SetItemTooltip(fmt, *args._promote_va_args)
  end

  def self.begin_popup(str_id : String, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.BeginPopup(str_id, flags)
  end

  # Calls `begin_popup`, conditionally yields to the block, then conditionally calls `end_popup`.
  def self.popup(str_id : String, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Nil
    return unless self.begin_popup(str_id, flags)
    yield
    self.end_popup
  end

  pointer_wrapper def self.begin_popup_modal(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.BeginPopupModal(name, p_open, flags)
  end
  # Calls `begin_popup_modal`, conditionally yields to the block, then conditionally calls `end_popup`.
  pointer_wrapper def self.popup_modal(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Nil
    return unless self.begin_popup_modal(name, p_open, flags)
    yield
    self.end_popup
  end

  def self.end_popup : Void
    LibImGui.EndPopup
  end

  def self.open_popup(str_id : String, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(0)) : Void
    LibImGui.OpenPopup_Str(str_id, popup_flags)
  end

  def self.open_popup(id : ImGuiID, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(0)) : Void
    LibImGui.OpenPopup_ID(id, popup_flags)
  end

  def self.open_popup_on_item_click(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Void
    LibImGui.OpenPopupOnItemClick(str_id, popup_flags)
  end

  def self.close_current_popup : Void
    LibImGui.CloseCurrentPopup
  end

  def self.begin_popup_context_item(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.BeginPopupContextItem(str_id, popup_flags)
  end

  # Calls `begin_popup_context_item`, conditionally yields to the block, then conditionally calls `end_popup`.
  def self.popup_context_item(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Nil
    return unless self.begin_popup_context_item(str_id, popup_flags)
    yield
    self.end_popup
  end

  def self.begin_popup_context_window(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.BeginPopupContextWindow(str_id, popup_flags)
  end

  # Calls `begin_popup_context_window`, conditionally yields to the block, then conditionally calls `end_popup`.
  def self.popup_context_window(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Nil
    return unless self.begin_popup_context_window(str_id, popup_flags)
    yield
    self.end_popup
  end

  def self.begin_popup_context_void(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.BeginPopupContextVoid(str_id, popup_flags)
  end

  # Calls `begin_popup_context_void`, conditionally yields to the block, then conditionally calls `end_popup`.
  def self.popup_context_void(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Nil
    return unless self.begin_popup_context_void(str_id, popup_flags)
    yield
    self.end_popup
  end

  def self.is_popup_open(str_id : String, flags : ImGuiPopupFlags = ImGuiPopupFlags.new(0)) : Bool
    LibImGui.IsPopupOpen_Str(str_id, flags)
  end

  def self.begin_table(str_id : String, column : Int32, flags : ImGuiTableFlags = ImGuiTableFlags.new(0), outer_size : ImVec2 = ImVec2.new(0.0, 0.0), inner_width : Float32 = 0.0) : Bool
    LibImGui.BeginTable(str_id, column, flags, outer_size, inner_width)
  end

  # Calls `begin_table`, conditionally yields to the block, then conditionally calls `end_table`.
  def self.table(str_id : String, column : Int32, flags : ImGuiTableFlags = ImGuiTableFlags.new(0), outer_size : ImVec2 = ImVec2.new(0.0, 0.0), inner_width : Float32 = 0.0) : Nil
    return unless self.begin_table(str_id, column, flags, outer_size, inner_width)
    yield
    self.end_table
  end

  def self.end_table : Void
    LibImGui.EndTable
  end

  def self.table_next_row(row_flags : ImGuiTableRowFlags = ImGuiTableRowFlags.new(0), min_row_height : Float32 = 0.0) : Void
    LibImGui.TableNextRow(row_flags, min_row_height)
  end

  def self.table_next_column : Bool
    LibImGui.TableNextColumn
  end

  def self.table_set_column_index(column_n : Int32) : Bool
    LibImGui.TableSetColumnIndex(column_n)
  end

  def self.table_setup_column(label : String, flags : ImGuiTableColumnFlags = ImGuiTableColumnFlags.new(0), init_width_or_weight : Float32 = 0.0, user_id : ImGuiID = 0) : Void
    LibImGui.TableSetupColumn(label, flags, init_width_or_weight, user_id)
  end

  def self.table_setup_scroll_freeze(cols : Int32, rows : Int32) : Void
    LibImGui.TableSetupScrollFreeze(cols, rows)
  end

  def self.table_header(label : String) : Void
    LibImGui.TableHeader(label)
  end

  def self.table_headers_row : Void
    LibImGui.TableHeadersRow
  end

  def self.table_angled_headers_row : Void
    LibImGui.TableAngledHeadersRow
  end

  def self.table_get_sort_specs : ImGuiTableSortSpecs?
    result = LibImGui.TableGetSortSpecs
    result ? ImGuiTableSortSpecs.new(result) : nil
  end

  def self.table_get_column_count : Int32
    LibImGui.TableGetColumnCount
  end

  def self.table_get_column_index : Int32
    LibImGui.TableGetColumnIndex
  end

  def self.table_get_row_index : Int32
    LibImGui.TableGetRowIndex
  end

  def self.table_get_column_name(column_n : Int32 = -1) : String
    result = LibImGui.TableGetColumnName_Int(column_n)
    String.new(result)
  end

  def self.table_get_column_flags(column_n : Int32 = -1) : ImGuiTableColumnFlags
    LibImGui.TableGetColumnFlags(column_n)
  end

  def self.table_set_column_enabled(column_n : Int32, v : Bool) : Void
    LibImGui.TableSetColumnEnabled(column_n, v)
  end

  def self.table_set_bg_color(target : ImGuiTableBgTarget, color : UInt32, column_n : Int32 = -1) : Void
    LibImGui.TableSetBgColor(target, color, column_n)
  end

  def self.columns(count : Int32 = 1, id : String? = nil, border : Bool = true) : Void
    LibImGui.Columns(count, id, border)
  end

  def self.next_column : Void
    LibImGui.NextColumn
  end

  def self.get_column_index : Int32
    LibImGui.GetColumnIndex
  end

  def self.get_column_width(column_index : Int32 = -1) : Float32
    LibImGui.GetColumnWidth(column_index)
  end

  def self.set_column_width(column_index : Int32, width : Float32) : Void
    LibImGui.SetColumnWidth(column_index, width)
  end

  def self.get_column_offset(column_index : Int32 = -1) : Float32
    LibImGui.GetColumnOffset(column_index)
  end

  def self.set_column_offset(column_index : Int32, offset_x : Float32) : Void
    LibImGui.SetColumnOffset(column_index, offset_x)
  end

  def self.get_columns_count : Int32
    LibImGui.GetColumnsCount
  end

  def self.begin_tab_bar(str_id : String, flags : ImGuiTabBarFlags = ImGuiTabBarFlags.new(0)) : Bool
    LibImGui.BeginTabBar(str_id, flags)
  end

  # Calls `begin_tab_bar`, conditionally yields to the block, then conditionally calls `end_tab_bar`.
  def self.tab_bar(str_id : String, flags : ImGuiTabBarFlags = ImGuiTabBarFlags.new(0)) : Nil
    return unless self.begin_tab_bar(str_id, flags)
    yield
    self.end_tab_bar
  end

  def self.end_tab_bar : Void
    LibImGui.EndTabBar
  end

  pointer_wrapper def self.begin_tab_item(label : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiTabItemFlags = ImGuiTabItemFlags.new(0)) : Bool
    LibImGui.BeginTabItem(label, p_open, flags)
  end
  # Calls `begin_tab_item`, conditionally yields to the block, then conditionally calls `end_tab_item`.
  pointer_wrapper def self.tab_item(label : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiTabItemFlags = ImGuiTabItemFlags.new(0)) : Nil
    return unless self.begin_tab_item(label, p_open, flags)
    yield
    self.end_tab_item
  end

  def self.end_tab_item : Void
    LibImGui.EndTabItem
  end

  def self.tab_item_button(label : String, flags : ImGuiTabItemFlags = ImGuiTabItemFlags.new(0)) : Bool
    LibImGui.TabItemButton(label, flags)
  end

  def self.set_tab_item_closed(tab_or_docked_window_label : String) : Void
    LibImGui.SetTabItemClosed(tab_or_docked_window_label)
  end

  def self.log_to_tty(auto_open_depth : Int32 = -1) : Void
    LibImGui.LogToTTY(auto_open_depth)
  end

  def self.log_to_file(auto_open_depth : Int32 = -1, filename : String? = nil) : Void
    LibImGui.LogToFile(auto_open_depth, filename)
  end

  def self.log_to_clipboard(auto_open_depth : Int32 = -1) : Void
    LibImGui.LogToClipboard(auto_open_depth)
  end

  def self.log_finish : Void
    LibImGui.LogFinish
  end

  def self.log_buttons : Void
    LibImGui.LogButtons
  end

  def self.log_text(fmt : String, *args) : Void
    LibImGui.LogText(fmt, *args._promote_va_args)
  end

  def self.begin_drag_drop_source(flags : ImGuiDragDropFlags = ImGuiDragDropFlags.new(0)) : Bool
    LibImGui.BeginDragDropSource(flags)
  end

  # Calls `begin_drag_drop_source`, conditionally yields to the block, then conditionally calls `end_drag_drop_source`.
  def self.drag_drop_source(flags : ImGuiDragDropFlags = ImGuiDragDropFlags.new(0)) : Nil
    return unless self.begin_drag_drop_source(flags)
    yield
    self.end_drag_drop_source
  end

  def self.set_drag_drop_payload(type : String, data : Void*, sz : LibC::SizeT, cond : ImGuiCond = ImGuiCond.new(0)) : Bool
    LibImGui.SetDragDropPayload(type, data, sz, cond)
  end

  def self.end_drag_drop_source : Void
    LibImGui.EndDragDropSource
  end

  def self.begin_drag_drop_target : Bool
    LibImGui.BeginDragDropTarget
  end

  # Calls `begin_drag_drop_target`, conditionally yields to the block, then conditionally calls `end_drag_drop_target`.
  def self.drag_drop_target : Nil
    return unless self.begin_drag_drop_target
    yield
    self.end_drag_drop_target
  end

  def self.accept_drag_drop_payload(type : String, flags : ImGuiDragDropFlags = ImGuiDragDropFlags.new(0)) : ImGuiPayload?
    result = LibImGui.AcceptDragDropPayload(type, flags)
    result ? ImGuiPayload.new(result) : nil
  end

  def self.end_drag_drop_target : Void
    LibImGui.EndDragDropTarget
  end

  def self.get_drag_drop_payload : ImGuiPayload?
    result = LibImGui.GetDragDropPayload
    result ? ImGuiPayload.new(result) : nil
  end

  def self.begin_disabled(disabled : Bool = true) : Void
    LibImGui.BeginDisabled(disabled)
  end

  # Calls `begin_disabled`, yields to the block, then calls `end_disabled`.
  def self.disabled(disabled : Bool = true) : Nil
    self.begin_disabled(disabled)
    yield
    self.end_disabled
  end

  def self.end_disabled : Void
    LibImGui.EndDisabled
  end

  def self.push_clip_rect(clip_rect_min : ImVec2, clip_rect_max : ImVec2, intersect_with_current_clip_rect : Bool) : Void
    LibImGui.PushClipRect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
  end

  # Calls `push_clip_rect`, yields to the block, then calls `pop_clip_rect`.
  def self.with_clip_rect(clip_rect_min : ImVec2, clip_rect_max : ImVec2, intersect_with_current_clip_rect : Bool) : Nil
    self.push_clip_rect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
    yield
    self.pop_clip_rect
  end

  def self.pop_clip_rect : Void
    LibImGui.PopClipRect
  end

  def self.set_item_default_focus : Void
    LibImGui.SetItemDefaultFocus
  end

  def self.set_keyboard_focus_here(offset : Int32 = 0) : Void
    LibImGui.SetKeyboardFocusHere(offset)
  end

  def self.set_next_item_allow_overlap : Void
    LibImGui.SetNextItemAllowOverlap
  end

  def self.is_item_hovered(flags : ImGuiHoveredFlags = ImGuiHoveredFlags.new(0)) : Bool
    LibImGui.IsItemHovered(flags)
  end

  def self.is_item_active : Bool
    LibImGui.IsItemActive
  end

  def self.is_item_focused : Bool
    LibImGui.IsItemFocused
  end

  def self.is_item_clicked(mouse_button : ImGuiMouseButton = ImGuiMouseButton.new(0)) : Bool
    LibImGui.IsItemClicked(mouse_button)
  end

  def self.is_item_visible : Bool
    LibImGui.IsItemVisible
  end

  def self.is_item_edited : Bool
    LibImGui.IsItemEdited
  end

  def self.is_item_activated : Bool
    LibImGui.IsItemActivated
  end

  def self.is_item_deactivated : Bool
    LibImGui.IsItemDeactivated
  end

  def self.is_item_deactivated_after_edit : Bool
    LibImGui.IsItemDeactivatedAfterEdit
  end

  def self.is_item_toggled_open : Bool
    LibImGui.IsItemToggledOpen
  end

  def self.is_any_item_hovered : Bool
    LibImGui.IsAnyItemHovered
  end

  def self.is_any_item_active : Bool
    LibImGui.IsAnyItemActive
  end

  def self.is_any_item_focused : Bool
    LibImGui.IsAnyItemFocused
  end

  def self.get_item_id : ImGuiID
    LibImGui.GetItemID
  end

  def self.get_item_rect_min : ImGui::ImVec2
    LibImGui.GetItemRectMin(out p_out)
    p_out
  end

  def self.get_item_rect_max : ImGui::ImVec2
    LibImGui.GetItemRectMax(out p_out)
    p_out
  end

  def self.get_item_rect_size : ImGui::ImVec2
    LibImGui.GetItemRectSize(out p_out)
    p_out
  end

  def self.get_main_viewport : ImGuiViewport
    result = LibImGui.GetMainViewport
    ImGuiViewport.new(result)
  end

  def self.get_background_draw_list : ImDrawList
    result = LibImGui.GetBackgroundDrawList_Nil
    ImDrawList.new(result)
  end

  def self.get_foreground_draw_list : ImDrawList
    result = LibImGui.GetForegroundDrawList_Nil
    ImDrawList.new(result)
  end

  def self.is_rect_visible(size : ImVec2) : Bool
    LibImGui.IsRectVisible_Nil(size)
  end

  def self.is_rect_visible(rect_min : ImVec2, rect_max : ImVec2) : Bool
    LibImGui.IsRectVisible_Vec2(rect_min, rect_max)
  end

  def self.get_time : Float64
    LibImGui.GetTime
  end

  def self.get_frame_count : Int32
    LibImGui.GetFrameCount
  end

  def self.get_draw_list_shared_data : ImDrawListSharedData
    result = LibImGui.GetDrawListSharedData
    result.value
  end

  def self.get_style_color_name(idx : ImGuiCol) : String
    result = LibImGui.GetStyleColorName(idx)
    String.new(result)
  end

  def self.set_state_storage(storage : ImGuiStorage*) : Void
    LibImGui.SetStateStorage(storage)
  end

  def self.get_state_storage : ImGuiStorage
    result = LibImGui.GetStateStorage
    result.value
  end

  def self.calc_text_size(text : Bytes | String, hide_text_after_double_hash : Bool = false, wrap_width : Float32 = -1.0) : ImGui::ImVec2
    LibImGui.CalcTextSize(out p_out, text, (text.to_unsafe + text.bytesize), hide_text_after_double_hash, wrap_width)
    p_out
  end

  def self.color_convert_u32_to_float4(in_ : UInt32) : ImGui::ImVec4
    LibImGui.ColorConvertU32ToFloat4(out p_out, in_)
    p_out
  end

  def self.color_convert_float4_to_u32(in_ : ImVec4) : UInt32
    LibImGui.ColorConvertFloat4ToU32(in_)
  end

  def self.color_convert_rgb_to_hsv(r : Float32, g : Float32, b : Float32) : {LibC::Float, LibC::Float, LibC::Float}
    LibImGui.ColorConvertRGBtoHSV(r, g, b, out out_h, out out_s, out out_v)
    {out_h, out_s, out_v}
  end

  def self.color_convert_hsv_to_rgb(h : Float32, s : Float32, v : Float32) : {LibC::Float, LibC::Float, LibC::Float}
    LibImGui.ColorConvertHSVtoRGB(h, s, v, out out_r, out out_g, out out_b)
    {out_r, out_g, out_b}
  end

  def self.is_key_down(key : ImGuiKey) : Bool
    LibImGui.IsKeyDown_Nil(key)
  end

  def self.is_key_pressed(key : ImGuiKey, repeat : Bool = true) : Bool
    LibImGui.IsKeyPressed_Bool(key, repeat)
  end

  def self.is_key_released(key : ImGuiKey) : Bool
    LibImGui.IsKeyReleased_Nil(key)
  end

  def self.is_key_chord_pressed(key_chord : ImGuiKeyChord) : Bool
    LibImGui.IsKeyChordPressed_Nil(key_chord)
  end

  def self.get_key_pressed_amount(key : ImGuiKey, repeat_delay : Float32, rate : Float32) : Int32
    LibImGui.GetKeyPressedAmount(key, repeat_delay, rate)
  end

  def self.get_key_name(key : ImGuiKey) : String
    result = LibImGui.GetKeyName(key)
    String.new(result)
  end

  def self.set_next_frame_want_capture_keyboard(want_capture_keyboard : Bool) : Void
    LibImGui.SetNextFrameWantCaptureKeyboard(want_capture_keyboard)
  end

  def self.is_mouse_down(button : ImGuiMouseButton) : Bool
    LibImGui.IsMouseDown_Nil(button)
  end

  def self.is_mouse_clicked(button : ImGuiMouseButton, repeat : Bool = false) : Bool
    LibImGui.IsMouseClicked_Bool(button, repeat)
  end

  def self.is_mouse_released(button : ImGuiMouseButton) : Bool
    LibImGui.IsMouseReleased_Nil(button)
  end

  def self.is_mouse_double_clicked(button : ImGuiMouseButton) : Bool
    LibImGui.IsMouseDoubleClicked_Nil(button)
  end

  def self.get_mouse_clicked_count(button : ImGuiMouseButton) : Int32
    LibImGui.GetMouseClickedCount(button)
  end

  def self.is_mouse_hovering_rect(r_min : ImVec2, r_max : ImVec2, clip : Bool = true) : Bool
    LibImGui.IsMouseHoveringRect(r_min, r_max, clip)
  end

  def self.is_mouse_pos_valid(mouse_pos : ImVec2* = Pointer(ImVec2).null) : Bool
    LibImGui.IsMousePosValid(mouse_pos)
  end

  def self.is_any_mouse_down : Bool
    LibImGui.IsAnyMouseDown
  end

  def self.get_mouse_pos : ImGui::ImVec2
    LibImGui.GetMousePos(out p_out)
    p_out
  end

  def self.get_mouse_pos_on_opening_current_popup : ImGui::ImVec2
    LibImGui.GetMousePosOnOpeningCurrentPopup(out p_out)
    p_out
  end

  def self.is_mouse_dragging(button : ImGuiMouseButton, lock_threshold : Float32 = -1.0) : Bool
    LibImGui.IsMouseDragging(button, lock_threshold)
  end

  def self.get_mouse_drag_delta(button : ImGuiMouseButton = ImGuiMouseButton.new(0), lock_threshold : Float32 = -1.0) : ImGui::ImVec2
    LibImGui.GetMouseDragDelta(out p_out, button, lock_threshold)
    p_out
  end

  def self.reset_mouse_drag_delta(button : ImGuiMouseButton = ImGuiMouseButton.new(0)) : Void
    LibImGui.ResetMouseDragDelta(button)
  end

  def self.get_mouse_cursor : ImGuiMouseCursor
    LibImGui.GetMouseCursor
  end

  def self.set_mouse_cursor(cursor_type : ImGuiMouseCursor) : Void
    LibImGui.SetMouseCursor(cursor_type)
  end

  def self.set_next_frame_want_capture_mouse(want_capture_mouse : Bool) : Void
    LibImGui.SetNextFrameWantCaptureMouse(want_capture_mouse)
  end

  def self.get_clipboard_text : String
    result = LibImGui.GetClipboardText
    String.new(result)
  end

  def self.set_clipboard_text(text : String) : Void
    LibImGui.SetClipboardText(text)
  end

  def self.load_ini_settings_from_disk(ini_filename : String) : Void
    LibImGui.LoadIniSettingsFromDisk(ini_filename)
  end

  def self.load_ini_settings_from_memory(ini_data : String, ini_size : LibC::SizeT = 0) : Void
    LibImGui.LoadIniSettingsFromMemory(ini_data, ini_size)
  end

  def self.save_ini_settings_to_disk(ini_filename : String) : Void
    LibImGui.SaveIniSettingsToDisk(ini_filename)
  end

  def self.save_ini_settings_to_memory : {String, LibC::SizeT}
    result = LibImGui.SaveIniSettingsToMemory(out out_ini_size)
    {String.new(result), out_ini_size}
  end

  def self.debug_text_encoding(text : String) : Void
    LibImGui.DebugTextEncoding(text)
  end

  def self.debug_flash_style_color(idx : ImGuiCol) : Void
    LibImGui.DebugFlashStyleColor(idx)
  end

  def self.debug_start_item_picker : Void
    LibImGui.DebugStartItemPicker
  end

  def self.debug_check_version_and_data_layout(version_str : String, sz_io : LibC::SizeT, sz_style : LibC::SizeT, sz_vec2 : LibC::SizeT, sz_vec4 : LibC::SizeT, sz_drawvert : LibC::SizeT, sz_drawidx : LibC::SizeT) : Bool
    LibImGui.DebugCheckVersionAndDataLayout(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx)
  end

  def self.set_allocator_functions(alloc_func : ImGuiMemAllocFunc, free_func : ImGuiMemFreeFunc, user_data : Void* = Pointer(Void).null) : Void
    LibImGui.SetAllocatorFunctions(alloc_func, free_func, user_data)
  end

  pointer_wrapper def self.get_allocator_functions(p_alloc_func : ImGuiMemAllocFunc*, p_free_func : ImGuiMemFreeFunc*, p_user_data : Void**) : Void
    LibImGui.GetAllocatorFunctions(p_alloc_func, p_free_func, p_user_data)
  end

  def self.mem_alloc(size : LibC::SizeT) : Void*
    LibImGui.MemAlloc(size)
  end

  def self.mem_free(ptr : Void*) : Void
    LibImGui.MemFree(ptr)
  end

  struct ImGuiTableSortSpecs
    include ClassType(LibImGui::ImGuiTableSortSpecs)

    def specs : Slice(ImGuiTableColumnSortSpecs)
      Slice.new(@this.value.specs_count.to_i) { |i| ImGuiTableColumnSortSpecs.new(@this.value.specs + i) }
    end

    def specs=(specs : Slice(ImGuiTableColumnSortSpecs))
      @this.value.specs, @this.value.specs_count = specs.to_unsafe, specs.bytesize
    end

    def specs_count : Int32
      @this.value.specs_count
    end

    def specs_count=(specs_count : Int32)
      @this.value.specs_count = specs_count
    end

    def specs_dirty : Bool
      @this.value.specs_dirty
    end

    def specs_dirty=(specs_dirty : Bool)
      @this.value.specs_dirty = specs_dirty
    end

    def self.new : ImGuiTableSortSpecs?
      result = LibImGui.ImGuiTableSortSpecs_ImGuiTableSortSpecs
      result ? ImGuiTableSortSpecs.new(result) : nil
    end
  end

  alias TopLevel::ImGuiTableSortSpecs = ImGui::ImGuiTableSortSpecs

  struct ImGuiTableColumnSortSpecs
    include ClassType(LibImGui::ImGuiTableColumnSortSpecs)

    def column_user_id : ImGuiID
      @this.value.column_user_id
    end

    def column_user_id=(column_user_id : ImGuiID)
      @this.value.column_user_id = column_user_id
    end

    def column_index : Int16
      @this.value.column_index
    end

    def column_index=(column_index : Int16)
      @this.value.column_index = column_index
    end

    def sort_order : Int16
      @this.value.sort_order
    end

    def sort_order=(sort_order : Int16)
      @this.value.sort_order = sort_order
    end

    def sort_direction : ImGuiSortDirection
      @this.value.sort_direction
    end

    def sort_direction=(sort_direction : ImGuiSortDirection)
      @this.value.sort_direction = sort_direction
    end

    def self.new : ImGuiTableColumnSortSpecs
      result = LibImGui.ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs
      ImGuiTableColumnSortSpecs.new(result)
    end
  end

  alias TopLevel::ImGuiTableColumnSortSpecs = ImGui::ImGuiTableColumnSortSpecs

  struct ImVector
    include StructType
  end

  struct ImGuiStyle
    include ClassType(LibImGui::ImGuiStyle)

    def alpha : Float32
      @this.value.alpha
    end

    def alpha=(alpha : Float32)
      @this.value.alpha = alpha
    end

    def disabled_alpha : Float32
      @this.value.disabled_alpha
    end

    def disabled_alpha=(disabled_alpha : Float32)
      @this.value.disabled_alpha = disabled_alpha
    end

    def window_padding : ImVec2
      @this.value.window_padding
    end

    def window_padding=(window_padding : ImVec2)
      @this.value.window_padding = window_padding
    end

    def window_rounding : Float32
      @this.value.window_rounding
    end

    def window_rounding=(window_rounding : Float32)
      @this.value.window_rounding = window_rounding
    end

    def window_border_size : Float32
      @this.value.window_border_size
    end

    def window_border_size=(window_border_size : Float32)
      @this.value.window_border_size = window_border_size
    end

    def window_min_size : ImVec2
      @this.value.window_min_size
    end

    def window_min_size=(window_min_size : ImVec2)
      @this.value.window_min_size = window_min_size
    end

    def window_title_align : ImVec2
      @this.value.window_title_align
    end

    def window_title_align=(window_title_align : ImVec2)
      @this.value.window_title_align = window_title_align
    end

    def window_menu_button_position : ImGuiDir
      @this.value.window_menu_button_position
    end

    def window_menu_button_position=(window_menu_button_position : ImGuiDir)
      @this.value.window_menu_button_position = window_menu_button_position
    end

    def child_rounding : Float32
      @this.value.child_rounding
    end

    def child_rounding=(child_rounding : Float32)
      @this.value.child_rounding = child_rounding
    end

    def child_border_size : Float32
      @this.value.child_border_size
    end

    def child_border_size=(child_border_size : Float32)
      @this.value.child_border_size = child_border_size
    end

    def popup_rounding : Float32
      @this.value.popup_rounding
    end

    def popup_rounding=(popup_rounding : Float32)
      @this.value.popup_rounding = popup_rounding
    end

    def popup_border_size : Float32
      @this.value.popup_border_size
    end

    def popup_border_size=(popup_border_size : Float32)
      @this.value.popup_border_size = popup_border_size
    end

    def frame_padding : ImVec2
      @this.value.frame_padding
    end

    def frame_padding=(frame_padding : ImVec2)
      @this.value.frame_padding = frame_padding
    end

    def frame_rounding : Float32
      @this.value.frame_rounding
    end

    def frame_rounding=(frame_rounding : Float32)
      @this.value.frame_rounding = frame_rounding
    end

    def frame_border_size : Float32
      @this.value.frame_border_size
    end

    def frame_border_size=(frame_border_size : Float32)
      @this.value.frame_border_size = frame_border_size
    end

    def item_spacing : ImVec2
      @this.value.item_spacing
    end

    def item_spacing=(item_spacing : ImVec2)
      @this.value.item_spacing = item_spacing
    end

    def item_inner_spacing : ImVec2
      @this.value.item_inner_spacing
    end

    def item_inner_spacing=(item_inner_spacing : ImVec2)
      @this.value.item_inner_spacing = item_inner_spacing
    end

    def cell_padding : ImVec2
      @this.value.cell_padding
    end

    def cell_padding=(cell_padding : ImVec2)
      @this.value.cell_padding = cell_padding
    end

    def touch_extra_padding : ImVec2
      @this.value.touch_extra_padding
    end

    def touch_extra_padding=(touch_extra_padding : ImVec2)
      @this.value.touch_extra_padding = touch_extra_padding
    end

    def indent_spacing : Float32
      @this.value.indent_spacing
    end

    def indent_spacing=(indent_spacing : Float32)
      @this.value.indent_spacing = indent_spacing
    end

    def columns_min_spacing : Float32
      @this.value.columns_min_spacing
    end

    def columns_min_spacing=(columns_min_spacing : Float32)
      @this.value.columns_min_spacing = columns_min_spacing
    end

    def scrollbar_size : Float32
      @this.value.scrollbar_size
    end

    def scrollbar_size=(scrollbar_size : Float32)
      @this.value.scrollbar_size = scrollbar_size
    end

    def scrollbar_rounding : Float32
      @this.value.scrollbar_rounding
    end

    def scrollbar_rounding=(scrollbar_rounding : Float32)
      @this.value.scrollbar_rounding = scrollbar_rounding
    end

    def grab_min_size : Float32
      @this.value.grab_min_size
    end

    def grab_min_size=(grab_min_size : Float32)
      @this.value.grab_min_size = grab_min_size
    end

    def grab_rounding : Float32
      @this.value.grab_rounding
    end

    def grab_rounding=(grab_rounding : Float32)
      @this.value.grab_rounding = grab_rounding
    end

    def log_slider_deadzone : Float32
      @this.value.log_slider_deadzone
    end

    def log_slider_deadzone=(log_slider_deadzone : Float32)
      @this.value.log_slider_deadzone = log_slider_deadzone
    end

    def tab_rounding : Float32
      @this.value.tab_rounding
    end

    def tab_rounding=(tab_rounding : Float32)
      @this.value.tab_rounding = tab_rounding
    end

    def tab_border_size : Float32
      @this.value.tab_border_size
    end

    def tab_border_size=(tab_border_size : Float32)
      @this.value.tab_border_size = tab_border_size
    end

    def tab_min_width_for_close_button : Float32
      @this.value.tab_min_width_for_close_button
    end

    def tab_min_width_for_close_button=(tab_min_width_for_close_button : Float32)
      @this.value.tab_min_width_for_close_button = tab_min_width_for_close_button
    end

    def tab_bar_border_size : Float32
      @this.value.tab_bar_border_size
    end

    def tab_bar_border_size=(tab_bar_border_size : Float32)
      @this.value.tab_bar_border_size = tab_bar_border_size
    end

    def table_angled_headers_angle : Float32
      @this.value.table_angled_headers_angle
    end

    def table_angled_headers_angle=(table_angled_headers_angle : Float32)
      @this.value.table_angled_headers_angle = table_angled_headers_angle
    end

    def color_button_position : ImGuiDir
      @this.value.color_button_position
    end

    def color_button_position=(color_button_position : ImGuiDir)
      @this.value.color_button_position = color_button_position
    end

    def button_text_align : ImVec2
      @this.value.button_text_align
    end

    def button_text_align=(button_text_align : ImVec2)
      @this.value.button_text_align = button_text_align
    end

    def selectable_text_align : ImVec2
      @this.value.selectable_text_align
    end

    def selectable_text_align=(selectable_text_align : ImVec2)
      @this.value.selectable_text_align = selectable_text_align
    end

    def separator_text_border_size : Float32
      @this.value.separator_text_border_size
    end

    def separator_text_border_size=(separator_text_border_size : Float32)
      @this.value.separator_text_border_size = separator_text_border_size
    end

    def separator_text_align : ImVec2
      @this.value.separator_text_align
    end

    def separator_text_align=(separator_text_align : ImVec2)
      @this.value.separator_text_align = separator_text_align
    end

    def separator_text_padding : ImVec2
      @this.value.separator_text_padding
    end

    def separator_text_padding=(separator_text_padding : ImVec2)
      @this.value.separator_text_padding = separator_text_padding
    end

    def display_window_padding : ImVec2
      @this.value.display_window_padding
    end

    def display_window_padding=(display_window_padding : ImVec2)
      @this.value.display_window_padding = display_window_padding
    end

    def display_safe_area_padding : ImVec2
      @this.value.display_safe_area_padding
    end

    def display_safe_area_padding=(display_safe_area_padding : ImVec2)
      @this.value.display_safe_area_padding = display_safe_area_padding
    end

    def mouse_cursor_scale : Float32
      @this.value.mouse_cursor_scale
    end

    def mouse_cursor_scale=(mouse_cursor_scale : Float32)
      @this.value.mouse_cursor_scale = mouse_cursor_scale
    end

    def anti_aliased_lines : Bool
      @this.value.anti_aliased_lines
    end

    def anti_aliased_lines=(anti_aliased_lines : Bool)
      @this.value.anti_aliased_lines = anti_aliased_lines
    end

    def anti_aliased_lines_use_tex : Bool
      @this.value.anti_aliased_lines_use_tex
    end

    def anti_aliased_lines_use_tex=(anti_aliased_lines_use_tex : Bool)
      @this.value.anti_aliased_lines_use_tex = anti_aliased_lines_use_tex
    end

    def anti_aliased_fill : Bool
      @this.value.anti_aliased_fill
    end

    def anti_aliased_fill=(anti_aliased_fill : Bool)
      @this.value.anti_aliased_fill = anti_aliased_fill
    end

    def curve_tessellation_tol : Float32
      @this.value.curve_tessellation_tol
    end

    def curve_tessellation_tol=(curve_tessellation_tol : Float32)
      @this.value.curve_tessellation_tol = curve_tessellation_tol
    end

    def circle_tessellation_max_error : Float32
      @this.value.circle_tessellation_max_error
    end

    def circle_tessellation_max_error=(circle_tessellation_max_error : Float32)
      @this.value.circle_tessellation_max_error = circle_tessellation_max_error
    end

    def colors : Slice(ImVec4)
      @this.value.colors.to_slice
    end

    def colors=(colors : Slice(ImVec4))
      @this.value.colors = colors
    end

    def hover_stationary_delay : Float32
      @this.value.hover_stationary_delay
    end

    def hover_stationary_delay=(hover_stationary_delay : Float32)
      @this.value.hover_stationary_delay = hover_stationary_delay
    end

    def hover_delay_short : Float32
      @this.value.hover_delay_short
    end

    def hover_delay_short=(hover_delay_short : Float32)
      @this.value.hover_delay_short = hover_delay_short
    end

    def hover_delay_normal : Float32
      @this.value.hover_delay_normal
    end

    def hover_delay_normal=(hover_delay_normal : Float32)
      @this.value.hover_delay_normal = hover_delay_normal
    end

    def hover_flags_for_tooltip_mouse : ImGuiHoveredFlags
      @this.value.hover_flags_for_tooltip_mouse
    end

    def hover_flags_for_tooltip_mouse=(hover_flags_for_tooltip_mouse : ImGuiHoveredFlags)
      @this.value.hover_flags_for_tooltip_mouse = hover_flags_for_tooltip_mouse
    end

    def hover_flags_for_tooltip_nav : ImGuiHoveredFlags
      @this.value.hover_flags_for_tooltip_nav
    end

    def hover_flags_for_tooltip_nav=(hover_flags_for_tooltip_nav : ImGuiHoveredFlags)
      @this.value.hover_flags_for_tooltip_nav = hover_flags_for_tooltip_nav
    end

    def self.new : ImGuiStyle
      result = LibImGui.ImGuiStyle_ImGuiStyle
      ImGuiStyle.new(result)
    end

    def scale_all_sizes(scale_factor : Float32) : Void
      LibImGui.ImGuiStyle_ScaleAllSizes(self, scale_factor)
    end
  end

  alias TopLevel::ImGuiStyle = ImGui::ImGuiStyle

  struct ImGuiKeyData
    include ClassType(LibImGui::ImGuiKeyData)

    def down : Bool
      @this.value.down
    end

    def down=(down : Bool)
      @this.value.down = down
    end

    def down_duration : Float32
      @this.value.down_duration
    end

    def down_duration=(down_duration : Float32)
      @this.value.down_duration = down_duration
    end

    def down_duration_prev : Float32
      @this.value.down_duration_prev
    end

    def down_duration_prev=(down_duration_prev : Float32)
      @this.value.down_duration_prev = down_duration_prev
    end

    def analog_value : Float32
      @this.value.analog_value
    end

    def analog_value=(analog_value : Float32)
      @this.value.analog_value = analog_value
    end
  end

  alias TopLevel::ImGuiKeyData = ImGui::ImGuiKeyData

  struct ImGuiIO
    include ClassType(LibImGui::ImGuiIO)

    def config_flags : ImGuiConfigFlags
      @this.value.config_flags
    end

    def config_flags=(config_flags : ImGuiConfigFlags)
      @this.value.config_flags = config_flags
    end

    def backend_flags : ImGuiBackendFlags
      @this.value.backend_flags
    end

    def backend_flags=(backend_flags : ImGuiBackendFlags)
      @this.value.backend_flags = backend_flags
    end

    def display_size : ImVec2
      @this.value.display_size
    end

    def display_size=(display_size : ImVec2)
      @this.value.display_size = display_size
    end

    def delta_time : Float32
      @this.value.delta_time
    end

    def delta_time=(delta_time : Float32)
      @this.value.delta_time = delta_time
    end

    def ini_saving_rate : Float32
      @this.value.ini_saving_rate
    end

    def ini_saving_rate=(ini_saving_rate : Float32)
      @this.value.ini_saving_rate = ini_saving_rate
    end

    def ini_filename : String?
      (v = @this.value.ini_filename) ? String.new(v) : nil
    end

    def ini_filename=(ini_filename : String?)
      @this.value.ini_filename = ini_filename
    end

    def log_filename : String?
      (v = @this.value.log_filename) ? String.new(v) : nil
    end

    def log_filename=(log_filename : String?)
      @this.value.log_filename = log_filename
    end

    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    def fonts : ImFontAtlas
      ImFontAtlas.new(@this.value.fonts)
    end

    def fonts=(fonts : ImFontAtlas)
      @this.value.fonts = fonts
    end

    def font_global_scale : Float32
      @this.value.font_global_scale
    end

    def font_global_scale=(font_global_scale : Float32)
      @this.value.font_global_scale = font_global_scale
    end

    def font_allow_user_scaling : Bool
      @this.value.font_allow_user_scaling
    end

    def font_allow_user_scaling=(font_allow_user_scaling : Bool)
      @this.value.font_allow_user_scaling = font_allow_user_scaling
    end

    def font_default : ImFont
      ImFont.new(@this.value.font_default)
    end

    def font_default=(font_default : ImFont)
      @this.value.font_default = font_default
    end

    def display_framebuffer_scale : ImVec2
      @this.value.display_framebuffer_scale
    end

    def display_framebuffer_scale=(display_framebuffer_scale : ImVec2)
      @this.value.display_framebuffer_scale = display_framebuffer_scale
    end

    def mouse_draw_cursor : Bool
      @this.value.mouse_draw_cursor
    end

    def mouse_draw_cursor=(mouse_draw_cursor : Bool)
      @this.value.mouse_draw_cursor = mouse_draw_cursor
    end

    def config_mac_osx_behaviors : Bool
      @this.value.config_mac_osx_behaviors
    end

    def config_mac_osx_behaviors=(config_mac_osx_behaviors : Bool)
      @this.value.config_mac_osx_behaviors = config_mac_osx_behaviors
    end

    def config_input_trickle_event_queue : Bool
      @this.value.config_input_trickle_event_queue
    end

    def config_input_trickle_event_queue=(config_input_trickle_event_queue : Bool)
      @this.value.config_input_trickle_event_queue = config_input_trickle_event_queue
    end

    def config_input_text_cursor_blink : Bool
      @this.value.config_input_text_cursor_blink
    end

    def config_input_text_cursor_blink=(config_input_text_cursor_blink : Bool)
      @this.value.config_input_text_cursor_blink = config_input_text_cursor_blink
    end

    def config_input_text_enter_keep_active : Bool
      @this.value.config_input_text_enter_keep_active
    end

    def config_input_text_enter_keep_active=(config_input_text_enter_keep_active : Bool)
      @this.value.config_input_text_enter_keep_active = config_input_text_enter_keep_active
    end

    def config_drag_click_to_input_text : Bool
      @this.value.config_drag_click_to_input_text
    end

    def config_drag_click_to_input_text=(config_drag_click_to_input_text : Bool)
      @this.value.config_drag_click_to_input_text = config_drag_click_to_input_text
    end

    def config_windows_resize_from_edges : Bool
      @this.value.config_windows_resize_from_edges
    end

    def config_windows_resize_from_edges=(config_windows_resize_from_edges : Bool)
      @this.value.config_windows_resize_from_edges = config_windows_resize_from_edges
    end

    def config_windows_move_from_title_bar_only : Bool
      @this.value.config_windows_move_from_title_bar_only
    end

    def config_windows_move_from_title_bar_only=(config_windows_move_from_title_bar_only : Bool)
      @this.value.config_windows_move_from_title_bar_only = config_windows_move_from_title_bar_only
    end

    def config_memory_compact_timer : Float32
      @this.value.config_memory_compact_timer
    end

    def config_memory_compact_timer=(config_memory_compact_timer : Float32)
      @this.value.config_memory_compact_timer = config_memory_compact_timer
    end

    def mouse_double_click_time : Float32
      @this.value.mouse_double_click_time
    end

    def mouse_double_click_time=(mouse_double_click_time : Float32)
      @this.value.mouse_double_click_time = mouse_double_click_time
    end

    def mouse_double_click_max_dist : Float32
      @this.value.mouse_double_click_max_dist
    end

    def mouse_double_click_max_dist=(mouse_double_click_max_dist : Float32)
      @this.value.mouse_double_click_max_dist = mouse_double_click_max_dist
    end

    def mouse_drag_threshold : Float32
      @this.value.mouse_drag_threshold
    end

    def mouse_drag_threshold=(mouse_drag_threshold : Float32)
      @this.value.mouse_drag_threshold = mouse_drag_threshold
    end

    def key_repeat_delay : Float32
      @this.value.key_repeat_delay
    end

    def key_repeat_delay=(key_repeat_delay : Float32)
      @this.value.key_repeat_delay = key_repeat_delay
    end

    def key_repeat_rate : Float32
      @this.value.key_repeat_rate
    end

    def key_repeat_rate=(key_repeat_rate : Float32)
      @this.value.key_repeat_rate = key_repeat_rate
    end

    def config_debug_is_debugger_present : Bool
      @this.value.config_debug_is_debugger_present
    end

    def config_debug_is_debugger_present=(config_debug_is_debugger_present : Bool)
      @this.value.config_debug_is_debugger_present = config_debug_is_debugger_present
    end

    def config_debug_begin_return_value_once : Bool
      @this.value.config_debug_begin_return_value_once
    end

    def config_debug_begin_return_value_once=(config_debug_begin_return_value_once : Bool)
      @this.value.config_debug_begin_return_value_once = config_debug_begin_return_value_once
    end

    def config_debug_begin_return_value_loop : Bool
      @this.value.config_debug_begin_return_value_loop
    end

    def config_debug_begin_return_value_loop=(config_debug_begin_return_value_loop : Bool)
      @this.value.config_debug_begin_return_value_loop = config_debug_begin_return_value_loop
    end

    def config_debug_ignore_focus_loss : Bool
      @this.value.config_debug_ignore_focus_loss
    end

    def config_debug_ignore_focus_loss=(config_debug_ignore_focus_loss : Bool)
      @this.value.config_debug_ignore_focus_loss = config_debug_ignore_focus_loss
    end

    def config_debug_ini_settings : Bool
      @this.value.config_debug_ini_settings
    end

    def config_debug_ini_settings=(config_debug_ini_settings : Bool)
      @this.value.config_debug_ini_settings = config_debug_ini_settings
    end

    def backend_platform_name : String?
      (v = @this.value.backend_platform_name) ? String.new(v) : nil
    end

    def backend_platform_name=(backend_platform_name : String?)
      @this.value.backend_platform_name = backend_platform_name
    end

    def backend_renderer_name : String?
      (v = @this.value.backend_renderer_name) ? String.new(v) : nil
    end

    def backend_renderer_name=(backend_renderer_name : String?)
      @this.value.backend_renderer_name = backend_renderer_name
    end

    def backend_platform_user_data : Void*
      @this.value.backend_platform_user_data
    end

    def backend_platform_user_data=(backend_platform_user_data : Void*)
      @this.value.backend_platform_user_data = backend_platform_user_data
    end

    def backend_renderer_user_data : Void*
      @this.value.backend_renderer_user_data
    end

    def backend_renderer_user_data=(backend_renderer_user_data : Void*)
      @this.value.backend_renderer_user_data = backend_renderer_user_data
    end

    def backend_language_user_data : Void*
      @this.value.backend_language_user_data
    end

    def backend_language_user_data=(backend_language_user_data : Void*)
      @this.value.backend_language_user_data = backend_language_user_data
    end

    def get_clipboard_text_fn : (Void*) -> String
      @this.value.get_clipboard_text_fn
    end

    def get_clipboard_text_fn=(get_clipboard_text_fn : (Void*) -> String)
      @this.value.get_clipboard_text_fn = get_clipboard_text_fn
    end

    def set_clipboard_text_fn : (Void*, String) -> Void
      @this.value.set_clipboard_text_fn
    end

    def set_clipboard_text_fn=(set_clipboard_text_fn : (Void*, String) -> Void)
      @this.value.set_clipboard_text_fn = set_clipboard_text_fn
    end

    def clipboard_user_data : Void*
      @this.value.clipboard_user_data
    end

    def clipboard_user_data=(clipboard_user_data : Void*)
      @this.value.clipboard_user_data = clipboard_user_data
    end

    def set_platform_ime_data_fn : (ImGuiViewport, ImGuiPlatformImeData) -> Void
      @this.value.set_platform_ime_data_fn
    end

    def set_platform_ime_data_fn=(set_platform_ime_data_fn : (ImGuiViewport, ImGuiPlatformImeData) -> Void)
      @this.value.set_platform_ime_data_fn = set_platform_ime_data_fn
    end

    def platform_locale_decimal_point : ImWchar
      @this.value.platform_locale_decimal_point
    end

    def platform_locale_decimal_point=(platform_locale_decimal_point : ImWchar)
      @this.value.platform_locale_decimal_point = platform_locale_decimal_point
    end

    def want_capture_mouse : Bool
      @this.value.want_capture_mouse
    end

    def want_capture_mouse=(want_capture_mouse : Bool)
      @this.value.want_capture_mouse = want_capture_mouse
    end

    def want_capture_keyboard : Bool
      @this.value.want_capture_keyboard
    end

    def want_capture_keyboard=(want_capture_keyboard : Bool)
      @this.value.want_capture_keyboard = want_capture_keyboard
    end

    def want_text_input : Bool
      @this.value.want_text_input
    end

    def want_text_input=(want_text_input : Bool)
      @this.value.want_text_input = want_text_input
    end

    def want_set_mouse_pos : Bool
      @this.value.want_set_mouse_pos
    end

    def want_set_mouse_pos=(want_set_mouse_pos : Bool)
      @this.value.want_set_mouse_pos = want_set_mouse_pos
    end

    def want_save_ini_settings : Bool
      @this.value.want_save_ini_settings
    end

    def want_save_ini_settings=(want_save_ini_settings : Bool)
      @this.value.want_save_ini_settings = want_save_ini_settings
    end

    def nav_active : Bool
      @this.value.nav_active
    end

    def nav_active=(nav_active : Bool)
      @this.value.nav_active = nav_active
    end

    def nav_visible : Bool
      @this.value.nav_visible
    end

    def nav_visible=(nav_visible : Bool)
      @this.value.nav_visible = nav_visible
    end

    def framerate : Float32
      @this.value.framerate
    end

    def framerate=(framerate : Float32)
      @this.value.framerate = framerate
    end

    def metrics_render_vertices : Int32
      @this.value.metrics_render_vertices
    end

    def metrics_render_vertices=(metrics_render_vertices : Int32)
      @this.value.metrics_render_vertices = metrics_render_vertices
    end

    def metrics_render_indices : Int32
      @this.value.metrics_render_indices
    end

    def metrics_render_indices=(metrics_render_indices : Int32)
      @this.value.metrics_render_indices = metrics_render_indices
    end

    def metrics_render_windows : Int32
      @this.value.metrics_render_windows
    end

    def metrics_render_windows=(metrics_render_windows : Int32)
      @this.value.metrics_render_windows = metrics_render_windows
    end

    def metrics_active_windows : Int32
      @this.value.metrics_active_windows
    end

    def metrics_active_windows=(metrics_active_windows : Int32)
      @this.value.metrics_active_windows = metrics_active_windows
    end

    def mouse_delta : ImVec2
      @this.value.mouse_delta
    end

    def mouse_delta=(mouse_delta : ImVec2)
      @this.value.mouse_delta = mouse_delta
    end

    def ctx : ImGuiContext?
      (v = @this.value.ctx) ? v.value : nil
    end

    def ctx=(ctx : ImGuiContext?)
      @this.value.ctx = ctx
    end

    def mouse_pos : ImVec2
      @this.value.mouse_pos
    end

    def mouse_pos=(mouse_pos : ImVec2)
      @this.value.mouse_pos = mouse_pos
    end

    def mouse_down : Slice(Bool)
      @this.value.mouse_down.to_slice
    end

    def mouse_down=(mouse_down : Slice(Bool))
      @this.value.mouse_down = mouse_down
    end

    def mouse_wheel : Float32
      @this.value.mouse_wheel
    end

    def mouse_wheel=(mouse_wheel : Float32)
      @this.value.mouse_wheel = mouse_wheel
    end

    def mouse_wheel_h : Float32
      @this.value.mouse_wheel_h
    end

    def mouse_wheel_h=(mouse_wheel_h : Float32)
      @this.value.mouse_wheel_h = mouse_wheel_h
    end

    def mouse_source : ImGuiMouseSource
      @this.value.mouse_source
    end

    def mouse_source=(mouse_source : ImGuiMouseSource)
      @this.value.mouse_source = mouse_source
    end

    def key_ctrl : Bool
      @this.value.key_ctrl
    end

    def key_ctrl=(key_ctrl : Bool)
      @this.value.key_ctrl = key_ctrl
    end

    def key_shift : Bool
      @this.value.key_shift
    end

    def key_shift=(key_shift : Bool)
      @this.value.key_shift = key_shift
    end

    def key_alt : Bool
      @this.value.key_alt
    end

    def key_alt=(key_alt : Bool)
      @this.value.key_alt = key_alt
    end

    def key_super : Bool
      @this.value.key_super
    end

    def key_super=(key_super : Bool)
      @this.value.key_super = key_super
    end

    def key_mods : ImGuiKeyChord
      @this.value.key_mods
    end

    def key_mods=(key_mods : ImGuiKeyChord)
      @this.value.key_mods = key_mods
    end

    def keys_data : Slice(ImGuiKeyData)
      @this.value.keys_data.to_slice
    end

    def keys_data=(keys_data : Slice(ImGuiKeyData))
      @this.value.keys_data = keys_data
    end

    def want_capture_mouse_unless_popup_close : Bool
      @this.value.want_capture_mouse_unless_popup_close
    end

    def want_capture_mouse_unless_popup_close=(want_capture_mouse_unless_popup_close : Bool)
      @this.value.want_capture_mouse_unless_popup_close = want_capture_mouse_unless_popup_close
    end

    def mouse_pos_prev : ImVec2
      @this.value.mouse_pos_prev
    end

    def mouse_pos_prev=(mouse_pos_prev : ImVec2)
      @this.value.mouse_pos_prev = mouse_pos_prev
    end

    def mouse_clicked_pos : Slice(ImVec2)
      @this.value.mouse_clicked_pos.to_slice
    end

    def mouse_clicked_pos=(mouse_clicked_pos : Slice(ImVec2))
      @this.value.mouse_clicked_pos = mouse_clicked_pos
    end

    def mouse_clicked_time : Slice(Float64)
      @this.value.mouse_clicked_time.to_slice
    end

    def mouse_clicked_time=(mouse_clicked_time : Slice(Float64))
      @this.value.mouse_clicked_time = mouse_clicked_time
    end

    def mouse_clicked : Slice(Bool)
      @this.value.mouse_clicked.to_slice
    end

    def mouse_clicked=(mouse_clicked : Slice(Bool))
      @this.value.mouse_clicked = mouse_clicked
    end

    def mouse_double_clicked : Slice(Bool)
      @this.value.mouse_double_clicked.to_slice
    end

    def mouse_double_clicked=(mouse_double_clicked : Slice(Bool))
      @this.value.mouse_double_clicked = mouse_double_clicked
    end

    def mouse_clicked_count : Slice(UInt16)
      @this.value.mouse_clicked_count.to_slice
    end

    def mouse_clicked_count=(mouse_clicked_count : Slice(UInt16))
      @this.value.mouse_clicked_count = mouse_clicked_count
    end

    def mouse_clicked_last_count : Slice(UInt16)
      @this.value.mouse_clicked_last_count.to_slice
    end

    def mouse_clicked_last_count=(mouse_clicked_last_count : Slice(UInt16))
      @this.value.mouse_clicked_last_count = mouse_clicked_last_count
    end

    def mouse_released : Slice(Bool)
      @this.value.mouse_released.to_slice
    end

    def mouse_released=(mouse_released : Slice(Bool))
      @this.value.mouse_released = mouse_released
    end

    def mouse_down_owned : Slice(Bool)
      @this.value.mouse_down_owned.to_slice
    end

    def mouse_down_owned=(mouse_down_owned : Slice(Bool))
      @this.value.mouse_down_owned = mouse_down_owned
    end

    def mouse_down_owned_unless_popup_close : Slice(Bool)
      @this.value.mouse_down_owned_unless_popup_close.to_slice
    end

    def mouse_down_owned_unless_popup_close=(mouse_down_owned_unless_popup_close : Slice(Bool))
      @this.value.mouse_down_owned_unless_popup_close = mouse_down_owned_unless_popup_close
    end

    def mouse_wheel_request_axis_swap : Bool
      @this.value.mouse_wheel_request_axis_swap
    end

    def mouse_wheel_request_axis_swap=(mouse_wheel_request_axis_swap : Bool)
      @this.value.mouse_wheel_request_axis_swap = mouse_wheel_request_axis_swap
    end

    def mouse_down_duration : Slice(Float32)
      @this.value.mouse_down_duration.to_slice
    end

    def mouse_down_duration=(mouse_down_duration : Slice(Float32))
      @this.value.mouse_down_duration = mouse_down_duration
    end

    def mouse_down_duration_prev : Slice(Float32)
      @this.value.mouse_down_duration_prev.to_slice
    end

    def mouse_down_duration_prev=(mouse_down_duration_prev : Slice(Float32))
      @this.value.mouse_down_duration_prev = mouse_down_duration_prev
    end

    def mouse_drag_max_distance_sqr : Slice(Float32)
      @this.value.mouse_drag_max_distance_sqr.to_slice
    end

    def mouse_drag_max_distance_sqr=(mouse_drag_max_distance_sqr : Slice(Float32))
      @this.value.mouse_drag_max_distance_sqr = mouse_drag_max_distance_sqr
    end

    def pen_pressure : Float32
      @this.value.pen_pressure
    end

    def pen_pressure=(pen_pressure : Float32)
      @this.value.pen_pressure = pen_pressure
    end

    def app_focus_lost : Bool
      @this.value.app_focus_lost
    end

    def app_focus_lost=(app_focus_lost : Bool)
      @this.value.app_focus_lost = app_focus_lost
    end

    def app_accepting_events : Bool
      @this.value.app_accepting_events
    end

    def app_accepting_events=(app_accepting_events : Bool)
      @this.value.app_accepting_events = app_accepting_events
    end

    def backend_using_legacy_key_arrays : Int8
      @this.value.backend_using_legacy_key_arrays
    end

    def backend_using_legacy_key_arrays=(backend_using_legacy_key_arrays : Int8)
      @this.value.backend_using_legacy_key_arrays = backend_using_legacy_key_arrays
    end

    def backend_using_legacy_nav_input_array : Bool
      @this.value.backend_using_legacy_nav_input_array
    end

    def backend_using_legacy_nav_input_array=(backend_using_legacy_nav_input_array : Bool)
      @this.value.backend_using_legacy_nav_input_array = backend_using_legacy_nav_input_array
    end

    def input_queue_surrogate : ImWchar16
      @this.value.input_queue_surrogate
    end

    def input_queue_surrogate=(input_queue_surrogate : ImWchar16)
      @this.value.input_queue_surrogate = input_queue_surrogate
    end

    def input_queue_characters : ImVector(ImWchar)
      t = @this.value.input_queue_characters
      pointerof(t).as(ImVector(ImWchar)*).value
    end

    def input_queue_characters=(input_queue_characters : ImVector(ImWchar))
      @this.value.input_queue_characters = input_queue_characters.as(LibImGui::ImVectorInternal*).value
    end

    def add_key_event(key : ImGuiKey, down : Bool) : Void
      LibImGui.ImGuiIO_AddKeyEvent(self, key, down)
    end

    def add_key_analog_event(key : ImGuiKey, down : Bool, v : Float32) : Void
      LibImGui.ImGuiIO_AddKeyAnalogEvent(self, key, down, v)
    end

    def add_mouse_pos_event(x : Float32, y : Float32) : Void
      LibImGui.ImGuiIO_AddMousePosEvent(self, x, y)
    end

    def add_mouse_button_event(button : Int32, down : Bool) : Void
      LibImGui.ImGuiIO_AddMouseButtonEvent(self, button, down)
    end

    def add_mouse_wheel_event(wheel_x : Float32, wheel_y : Float32) : Void
      LibImGui.ImGuiIO_AddMouseWheelEvent(self, wheel_x, wheel_y)
    end

    def add_mouse_source_event(source : ImGuiMouseSource) : Void
      LibImGui.ImGuiIO_AddMouseSourceEvent(self, source)
    end

    def add_focus_event(focused : Bool) : Void
      LibImGui.ImGuiIO_AddFocusEvent(self, focused)
    end

    def add_input_character(c : UInt32) : Void
      LibImGui.ImGuiIO_AddInputCharacter(self, c)
    end

    def add_input_character_utf16(c : ImWchar16) : Void
      LibImGui.ImGuiIO_AddInputCharacterUTF16(self, c)
    end

    def add_input_characters_utf8(str : String) : Void
      LibImGui.ImGuiIO_AddInputCharactersUTF8(self, str)
    end

    def set_key_event_native_data(key : ImGuiKey, native_keycode : Int32, native_scancode : Int32, native_legacy_index : Int32 = -1) : Void
      LibImGui.ImGuiIO_SetKeyEventNativeData(self, key, native_keycode, native_scancode, native_legacy_index)
    end

    def set_app_accepting_events(accepting_events : Bool) : Void
      LibImGui.ImGuiIO_SetAppAcceptingEvents(self, accepting_events)
    end

    def clear_events_queue : Void
      LibImGui.ImGuiIO_ClearEventsQueue(self)
    end

    def clear_input_keys : Void
      LibImGui.ImGuiIO_ClearInputKeys(self)
    end

    def self.new : ImGuiIO
      result = LibImGui.ImGuiIO_ImGuiIO
      ImGuiIO.new(result)
    end
  end

  alias TopLevel::ImGuiIO = ImGui::ImGuiIO

  struct ImGuiInputTextCallbackData
    include ClassType(LibImGui::ImGuiInputTextCallbackData)

    def ctx : ImGuiContext?
      (v = @this.value.ctx) ? v.value : nil
    end

    def ctx=(ctx : ImGuiContext?)
      @this.value.ctx = ctx
    end

    def event_flag : ImGuiInputTextFlags
      @this.value.event_flag
    end

    def event_flag=(event_flag : ImGuiInputTextFlags)
      @this.value.event_flag = event_flag
    end

    def flags : ImGuiInputTextFlags
      @this.value.flags
    end

    def flags=(flags : ImGuiInputTextFlags)
      @this.value.flags = flags
    end

    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    def event_char : ImWchar
      @this.value.event_char
    end

    def event_char=(event_char : ImWchar)
      @this.value.event_char = event_char
    end

    def event_key : ImGuiKey
      @this.value.event_key
    end

    def event_key=(event_key : ImGuiKey)
      @this.value.event_key = event_key
    end

    def buf : LibC::Char*
      @this.value.buf
    end

    def buf=(buf : LibC::Char*)
      @this.value.buf = buf
    end

    def buf_text_len : Int32
      @this.value.buf_text_len
    end

    def buf_text_len=(buf_text_len : Int32)
      @this.value.buf_text_len = buf_text_len
    end

    def buf_size : Int32
      @this.value.buf_size
    end

    def buf_size=(buf_size : Int32)
      @this.value.buf_size = buf_size
    end

    def buf_dirty : Bool
      @this.value.buf_dirty
    end

    def buf_dirty=(buf_dirty : Bool)
      @this.value.buf_dirty = buf_dirty
    end

    def cursor_pos : Int32
      @this.value.cursor_pos
    end

    def cursor_pos=(cursor_pos : Int32)
      @this.value.cursor_pos = cursor_pos
    end

    def selection_start : Int32
      @this.value.selection_start
    end

    def selection_start=(selection_start : Int32)
      @this.value.selection_start = selection_start
    end

    def selection_end : Int32
      @this.value.selection_end
    end

    def selection_end=(selection_end : Int32)
      @this.value.selection_end = selection_end
    end

    def self.new : ImGuiInputTextCallbackData
      result = LibImGui.ImGuiInputTextCallbackData_ImGuiInputTextCallbackData
      ImGuiInputTextCallbackData.new(result)
    end

    def delete_chars(pos : Int32, bytes_count : Int32) : Void
      LibImGui.ImGuiInputTextCallbackData_DeleteChars(self, pos, bytes_count)
    end

    def insert_chars(pos : Int32, text : Bytes | String) : Void
      LibImGui.ImGuiInputTextCallbackData_InsertChars(self, pos, text, (text.to_unsafe + text.bytesize))
    end

    def select_all : Void
      LibImGui.ImGuiInputTextCallbackData_SelectAll(self)
    end

    def clear_selection : Void
      LibImGui.ImGuiInputTextCallbackData_ClearSelection(self)
    end

    def has_selection : Bool
      LibImGui.ImGuiInputTextCallbackData_HasSelection(self)
    end
  end

  alias TopLevel::ImGuiInputTextCallbackData = ImGui::ImGuiInputTextCallbackData

  struct ImGuiSizeCallbackData
    include ClassType(LibImGui::ImGuiSizeCallbackData)

    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    def pos : ImVec2
      @this.value.pos
    end

    def pos=(pos : ImVec2)
      @this.value.pos = pos
    end

    def current_size : ImVec2
      @this.value.current_size
    end

    def current_size=(current_size : ImVec2)
      @this.value.current_size = current_size
    end

    def desired_size : ImVec2
      @this.value.desired_size
    end

    def desired_size=(desired_size : ImVec2)
      @this.value.desired_size = desired_size
    end
  end

  alias TopLevel::ImGuiSizeCallbackData = ImGui::ImGuiSizeCallbackData

  struct ImGuiPayload
    include ClassType(LibImGui::ImGuiPayload)

    def data : Void*
      @this.value.data
    end

    def data=(data : Void*)
      @this.value.data = data
    end

    def data_size : Int32
      @this.value.data_size
    end

    def data_size=(data_size : Int32)
      @this.value.data_size = data_size
    end

    def source_id : ImGuiID
      @this.value.source_id
    end

    def source_id=(source_id : ImGuiID)
      @this.value.source_id = source_id
    end

    def source_parent_id : ImGuiID
      @this.value.source_parent_id
    end

    def source_parent_id=(source_parent_id : ImGuiID)
      @this.value.source_parent_id = source_parent_id
    end

    def data_frame_count : Int32
      @this.value.data_frame_count
    end

    def data_frame_count=(data_frame_count : Int32)
      @this.value.data_frame_count = data_frame_count
    end

    def data_type : Slice(LibC::Char)
      @this.value.data_type.to_slice
    end

    def data_type=(data_type : Slice(LibC::Char))
      @this.value.data_type = data_type
    end

    def preview : Bool
      @this.value.preview
    end

    def preview=(preview : Bool)
      @this.value.preview = preview
    end

    def delivery : Bool
      @this.value.delivery
    end

    def delivery=(delivery : Bool)
      @this.value.delivery = delivery
    end

    def self.new : ImGuiPayload
      result = LibImGui.ImGuiPayload_ImGuiPayload
      ImGuiPayload.new(result)
    end

    def clear : Void
      LibImGui.ImGuiPayload_Clear(self)
    end

    def is_data_type(type : String) : Bool
      LibImGui.ImGuiPayload_IsDataType(self, type)
    end

    def is_preview : Bool
      LibImGui.ImGuiPayload_IsPreview(self)
    end

    def is_delivery : Bool
      LibImGui.ImGuiPayload_IsDelivery(self)
    end
  end

  alias TopLevel::ImGuiPayload = ImGui::ImGuiPayload

  struct ImGuiOnceUponAFrame
    include StructType

    def self.new : ImGuiOnceUponAFrame
      result = LibImGui.ImGuiOnceUponAFrame_ImGuiOnceUponAFrame
      result.value
    end
  end

  struct ImGuiTextFilter
    include ClassType(LibImGui::ImGuiTextFilter)

    def input_buf : Slice(LibC::Char)
      @this.value.input_buf.to_slice
    end

    def input_buf=(input_buf : Slice(LibC::Char))
      @this.value.input_buf = input_buf
    end

    def filters : ImVector(LibImGui::ImGuiTextRange)
      t = @this.value.filters
      pointerof(t).as(ImVector(LibImGui::ImGuiTextRange)*).value
    end

    def filters=(filters : ImVector(LibImGui::ImGuiTextRange))
      @this.value.filters = filters.as(LibImGui::ImVectorInternal*).value
    end

    def count_grep : Int32
      @this.value.count_grep
    end

    def count_grep=(count_grep : Int32)
      @this.value.count_grep = count_grep
    end

    def self.new(default_filter : String = "") : ImGuiTextFilter
      result = LibImGui.ImGuiTextFilter_ImGuiTextFilter(default_filter)
      ImGuiTextFilter.new(result)
    end

    def draw(label : String = "Filter(inc,-exc)", width : Float32 = 0.0) : Bool
      LibImGui.ImGuiTextFilter_Draw(self, label, width)
    end

    def pass_filter(text : Bytes | String) : Bool
      LibImGui.ImGuiTextFilter_PassFilter(self, text, (text.to_unsafe + text.bytesize))
    end

    def build : Void
      LibImGui.ImGuiTextFilter_Build(self)
    end

    def clear : Void
      LibImGui.ImGuiTextFilter_Clear(self)
    end

    def is_active : Bool
      LibImGui.ImGuiTextFilter_IsActive(self)
    end
  end

  alias TopLevel::ImGuiTextFilter = ImGui::ImGuiTextFilter

  struct ImGuiStorage
    include StructType

    def data : ImVector(LibImGui::ImGuiStoragePair)
      t = @data
      pointerof(t).as(ImVector(LibImGui::ImGuiStoragePair)*).value
    end

    def data=(data : ImVector(LibImGui::ImGuiStoragePair))
      @data = data.as(LibImGui::ImVectorInternal*).value
    end

    def clear : Void
      LibImGui.ImGuiStorage_Clear(self)
    end

    def get_int(key : ImGuiID, default_val : Int32 = 0) : Int32
      LibImGui.ImGuiStorage_GetInt(self, key, default_val)
    end

    def set_int(key : ImGuiID, val : Int32) : Void
      LibImGui.ImGuiStorage_SetInt(self, key, val)
    end

    def get_bool(key : ImGuiID, default_val : Bool = false) : Bool
      LibImGui.ImGuiStorage_GetBool(self, key, default_val)
    end

    def set_bool(key : ImGuiID, val : Bool) : Void
      LibImGui.ImGuiStorage_SetBool(self, key, val)
    end

    def get_float(key : ImGuiID, default_val : Float32 = 0.0) : Float32
      LibImGui.ImGuiStorage_GetFloat(self, key, default_val)
    end

    def set_float(key : ImGuiID, val : Float32) : Void
      LibImGui.ImGuiStorage_SetFloat(self, key, val)
    end

    def get_void_ptr(key : ImGuiID) : Void*
      LibImGui.ImGuiStorage_GetVoidPtr(self, key)
    end

    def set_void_ptr(key : ImGuiID, val : Void*) : Void
      LibImGui.ImGuiStorage_SetVoidPtr(self, key, val)
    end

    def get_int_ref(key : ImGuiID, default_val : Int32 = 0) : Int32*
      LibImGui.ImGuiStorage_GetIntRef(self, key, default_val)
    end

    def get_bool_ref(key : ImGuiID, default_val : Bool = false) : Bool*
      LibImGui.ImGuiStorage_GetBoolRef(self, key, default_val)
    end

    def get_float_ref(key : ImGuiID, default_val : Float32 = 0.0) : Float32*
      LibImGui.ImGuiStorage_GetFloatRef(self, key, default_val)
    end

    def get_void_ptr_ref(key : ImGuiID, default_val : Void* = Pointer(Void).null) : Void**
      LibImGui.ImGuiStorage_GetVoidPtrRef(self, key, default_val)
    end

    def build_sort_by_key : Void
      LibImGui.ImGuiStorage_BuildSortByKey(self)
    end

    def set_all_int(val : Int32) : Void
      LibImGui.ImGuiStorage_SetAllInt(self, val)
    end
  end

  struct ImGuiListClipper
    include StructType

    def self.new : ImGuiListClipper
      result = LibImGui.ImGuiListClipper_ImGuiListClipper
      result.value
    end

    def begin(items_count : Int32, items_height : Float32 = -1.0) : Void
      LibImGui.ImGuiListClipper_Begin(self, items_count, items_height)
    end

    def end : Void
      LibImGui.ImGuiListClipper_End(self)
    end

    def step : Bool
      LibImGui.ImGuiListClipper_Step(self)
    end

    def include_item_by_index(item_index : Int32) : Void
      LibImGui.ImGuiListClipper_IncludeItemByIndex(self, item_index)
    end

    def include_items_by_index(item_begin : Int32, item_end : Int32) : Void
      LibImGui.ImGuiListClipper_IncludeItemsByIndex(self, item_begin, item_end)
    end
  end

  struct ImColor
    include StructType

    def self.new : ImColor
      result = LibImGui.ImColor_ImColor_Nil
      result.value
    end

    def self.new(r : Float32, g : Float32, b : Float32, a : Float32 = 1.0) : ImColor
      result = LibImGui.ImColor_ImColor_Float(r, g, b, a)
      result.value
    end

    def self.new(col : ImVec4) : ImColor
      result = LibImGui.ImColor_ImColor_Vec4(col)
      result.value
    end

    def self.new(r : Int32, g : Int32, b : Int32, a : Int32 = 255) : ImColor
      result = LibImGui.ImColor_ImColor_Int(r, g, b, a)
      result.value
    end

    def self.new(rgba : UInt32) : ImColor
      result = LibImGui.ImColor_ImColor_U32(rgba)
      result.value
    end

    def set_hsv(h : Float32, s : Float32, v : Float32, a : Float32 = 1.0) : Void
      LibImGui.ImColor_SetHSV(self, h, s, v, a)
    end

    def hsv(h : Float32, s : Float32, v : Float32, a : Float32 = 1.0) : ImGui::ImColor
      LibImGui.ImColor_HSV(out p_out, h, s, v, a)
      p_out
    end
  end

  struct ImDrawCmd
    include ClassType(LibImGui::ImDrawCmd)

    def clip_rect : ImVec4
      @this.value.clip_rect
    end

    def clip_rect=(clip_rect : ImVec4)
      @this.value.clip_rect = clip_rect
    end

    def texture_id : ImTextureID
      @this.value.texture_id
    end

    def texture_id=(texture_id : ImTextureID)
      @this.value.texture_id = texture_id
    end

    def vtx_offset : UInt32
      @this.value.vtx_offset
    end

    def vtx_offset=(vtx_offset : UInt32)
      @this.value.vtx_offset = vtx_offset
    end

    def idx_offset : UInt32
      @this.value.idx_offset
    end

    def idx_offset=(idx_offset : UInt32)
      @this.value.idx_offset = idx_offset
    end

    def elem_count : UInt32
      @this.value.elem_count
    end

    def elem_count=(elem_count : UInt32)
      @this.value.elem_count = elem_count
    end

    def user_callback : ImDrawCallback
      @this.value.user_callback
    end

    def user_callback=(user_callback : ImDrawCallback)
      @this.value.user_callback = user_callback
    end

    def user_callback_data : Void*
      @this.value.user_callback_data
    end

    def user_callback_data=(user_callback_data : Void*)
      @this.value.user_callback_data = user_callback_data
    end

    def self.new : ImDrawCmd
      result = LibImGui.ImDrawCmd_ImDrawCmd
      ImDrawCmd.new(result)
    end

    def get_tex_id : ImTextureID
      LibImGui.ImDrawCmd_GetTexID(self)
    end
  end

  alias TopLevel::ImDrawCmd = ImGui::ImDrawCmd

  struct ImDrawVert
    include StructType
  end

  struct ImDrawCmdHeader
    include ClassType(LibImGui::ImDrawCmdHeader)

    def clip_rect : ImVec4
      @this.value.clip_rect
    end

    def clip_rect=(clip_rect : ImVec4)
      @this.value.clip_rect = clip_rect
    end

    def texture_id : ImTextureID
      @this.value.texture_id
    end

    def texture_id=(texture_id : ImTextureID)
      @this.value.texture_id = texture_id
    end

    def vtx_offset : UInt32
      @this.value.vtx_offset
    end

    def vtx_offset=(vtx_offset : UInt32)
      @this.value.vtx_offset = vtx_offset
    end
  end

  alias TopLevel::ImDrawCmdHeader = ImGui::ImDrawCmdHeader

  struct ImDrawChannel
    include StructType
  end

  struct ImDrawListSplitter
    include ClassType(LibImGui::ImDrawListSplitter)

    def self.new : ImDrawListSplitter
      result = LibImGui.ImDrawListSplitter_ImDrawListSplitter
      ImDrawListSplitter.new(result)
    end

    def clear : Void
      LibImGui.ImDrawListSplitter_Clear(self)
    end

    def clear_free_memory : Void
      LibImGui.ImDrawListSplitter_ClearFreeMemory(self)
    end

    def split(draw_list : ImDrawList, count : Int32) : Void
      LibImGui.ImDrawListSplitter_Split(self, draw_list, count)
    end

    def merge(draw_list : ImDrawList) : Void
      LibImGui.ImDrawListSplitter_Merge(self, draw_list)
    end

    def set_current_channel(draw_list : ImDrawList, channel_idx : Int32) : Void
      LibImGui.ImDrawListSplitter_SetCurrentChannel(self, draw_list, channel_idx)
    end
  end

  alias TopLevel::ImDrawListSplitter = ImGui::ImDrawListSplitter

  struct ImDrawList
    include ClassType(LibImGui::ImDrawList)

    def cmd_buffer : ImVector(LibImGui::ImDrawCmd)
      t = @this.value.cmd_buffer
      pointerof(t).as(ImVector(LibImGui::ImDrawCmd)*).value
    end

    def cmd_buffer=(cmd_buffer : ImVector(LibImGui::ImDrawCmd))
      @this.value.cmd_buffer = cmd_buffer.as(LibImGui::ImVectorInternal*).value
    end

    def idx_buffer : ImVector(ImDrawIdx)
      t = @this.value.idx_buffer
      pointerof(t).as(ImVector(ImDrawIdx)*).value
    end

    def idx_buffer=(idx_buffer : ImVector(ImDrawIdx))
      @this.value.idx_buffer = idx_buffer.as(LibImGui::ImVectorInternal*).value
    end

    def vtx_buffer : ImVector(ImDrawVert)
      t = @this.value.vtx_buffer
      pointerof(t).as(ImVector(ImDrawVert)*).value
    end

    def vtx_buffer=(vtx_buffer : ImVector(ImDrawVert))
      @this.value.vtx_buffer = vtx_buffer.as(LibImGui::ImVectorInternal*).value
    end

    def flags : ImDrawListFlags
      @this.value.flags
    end

    def flags=(flags : ImDrawListFlags)
      @this.value.flags = flags
    end

    def self.new(shared_data : ImDrawListSharedData) : ImDrawList
      result = LibImGui.ImDrawList_ImDrawList(shared_data)
      ImDrawList.new(result)
    end

    def push_clip_rect(clip_rect_min : ImVec2, clip_rect_max : ImVec2, intersect_with_current_clip_rect : Bool = false) : Void
      LibImGui.ImDrawList_PushClipRect(self, clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
    end

    def push_clip_rect_full_screen : Void
      LibImGui.ImDrawList_PushClipRectFullScreen(self)
    end

    def pop_clip_rect : Void
      LibImGui.ImDrawList_PopClipRect(self)
    end

    def push_texture_id(texture_id : ImTextureID) : Void
      LibImGui.ImDrawList_PushTextureID(self, texture_id)
    end

    def pop_texture_id : Void
      LibImGui.ImDrawList_PopTextureID(self)
    end

    def get_clip_rect_min : ImGui::ImVec2
      LibImGui.ImDrawList_GetClipRectMin(out p_out, self)
      p_out
    end

    def get_clip_rect_max : ImGui::ImVec2
      LibImGui.ImDrawList_GetClipRectMax(out p_out, self)
      p_out
    end

    def add_line(p1 : ImVec2, p2 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddLine(self, p1, p2, col, thickness)
    end

    def add_rect(p_min : ImVec2, p_max : ImVec2, col : UInt32, rounding : Float32 = 0.0, flags : ImDrawFlags = ImDrawFlags.new(0), thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddRect(self, p_min, p_max, col, rounding, flags, thickness)
    end

    def add_rect_filled(p_min : ImVec2, p_max : ImVec2, col : UInt32, rounding : Float32 = 0.0, flags : ImDrawFlags = ImDrawFlags.new(0)) : Void
      LibImGui.ImDrawList_AddRectFilled(self, p_min, p_max, col, rounding, flags)
    end

    def add_rect_filled_multi_color(p_min : ImVec2, p_max : ImVec2, col_upr_left : UInt32, col_upr_right : UInt32, col_bot_right : UInt32, col_bot_left : UInt32) : Void
      LibImGui.ImDrawList_AddRectFilledMultiColor(self, p_min, p_max, col_upr_left, col_upr_right, col_bot_right, col_bot_left)
    end

    def add_quad(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddQuad(self, p1, p2, p3, p4, col, thickness)
    end

    def add_quad_filled(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_AddQuadFilled(self, p1, p2, p3, p4, col)
    end

    def add_triangle(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddTriangle(self, p1, p2, p3, col, thickness)
    end

    def add_triangle_filled(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_AddTriangleFilled(self, p1, p2, p3, col)
    end

    def add_circle(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32 = 0, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddCircle(self, center, radius, col, num_segments, thickness)
    end

    def add_circle_filled(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_AddCircleFilled(self, center, radius, col, num_segments)
    end

    def add_ngon(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddNgon(self, center, radius, col, num_segments, thickness)
    end

    def add_ngon_filled(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32) : Void
      LibImGui.ImDrawList_AddNgonFilled(self, center, radius, col, num_segments)
    end

    def add_ellipse(center : ImVec2, radius : ImVec2, col : UInt32, rot : Float32 = 0.0, num_segments : Int32 = 0, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddEllipse(self, center, radius, col, rot, num_segments, thickness)
    end

    def add_ellipse_filled(center : ImVec2, radius : ImVec2, col : UInt32, rot : Float32 = 0.0, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_AddEllipseFilled(self, center, radius, col, rot, num_segments)
    end

    def add_text(pos : ImVec2, col : UInt32, text : Bytes | String) : Void
      LibImGui.ImDrawList_AddText_Vec2(self, pos, col, text, (text.to_unsafe + text.bytesize))
    end

    def add_text(font : ImFont, font_size : Float32, pos : ImVec2, col : UInt32, text : Bytes | String, wrap_width : Float32 = 0.0, cpu_fine_clip_rect : ImVec4* = Pointer(ImVec4).null) : Void
      LibImGui.ImDrawList_AddText_FontPtr(self, font, font_size, pos, col, text, (text.to_unsafe + text.bytesize), wrap_width, cpu_fine_clip_rect)
    end

    def add_bezier_cubic(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32, thickness : Float32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_AddBezierCubic(self, p1, p2, p3, p4, col, thickness, num_segments)
    end

    def add_bezier_quadratic(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, col : UInt32, thickness : Float32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_AddBezierQuadratic(self, p1, p2, p3, col, thickness, num_segments)
    end

    def add_polyline(points : ImVec2*, num_points : Int32, col : UInt32, flags : ImDrawFlags, thickness : Float32) : Void
      LibImGui.ImDrawList_AddPolyline(self, points, num_points, col, flags, thickness)
    end

    def add_convex_poly_filled(points : ImVec2*, num_points : Int32, col : UInt32) : Void
      LibImGui.ImDrawList_AddConvexPolyFilled(self, points, num_points, col)
    end

    def add_concave_poly_filled(points : ImVec2*, num_points : Int32, col : UInt32) : Void
      LibImGui.ImDrawList_AddConcavePolyFilled(self, points, num_points, col)
    end

    def add_image(user_texture_id : ImTextureID, p_min : ImVec2, p_max : ImVec2, uv_min : ImVec2 = ImVec2.new(0, 0), uv_max : ImVec2 = ImVec2.new(1, 1), col : UInt32 = 4294967295) : Void
      LibImGui.ImDrawList_AddImage(self, user_texture_id, p_min, p_max, uv_min, uv_max, col)
    end

    def add_image_quad(user_texture_id : ImTextureID, p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, uv1 : ImVec2 = ImVec2.new(0, 0), uv2 : ImVec2 = ImVec2.new(1, 0), uv3 : ImVec2 = ImVec2.new(1, 1), uv4 : ImVec2 = ImVec2.new(0, 1), col : UInt32 = 4294967295) : Void
      LibImGui.ImDrawList_AddImageQuad(self, user_texture_id, p1, p2, p3, p4, uv1, uv2, uv3, uv4, col)
    end

    def add_image_rounded(user_texture_id : ImTextureID, p_min : ImVec2, p_max : ImVec2, uv_min : ImVec2, uv_max : ImVec2, col : UInt32, rounding : Float32, flags : ImDrawFlags = ImDrawFlags.new(0)) : Void
      LibImGui.ImDrawList_AddImageRounded(self, user_texture_id, p_min, p_max, uv_min, uv_max, col, rounding, flags)
    end

    def path_clear : Void
      LibImGui.ImDrawList_PathClear(self)
    end

    def path_line_to(pos : ImVec2) : Void
      LibImGui.ImDrawList_PathLineTo(self, pos)
    end

    def path_line_to_merge_duplicate(pos : ImVec2) : Void
      LibImGui.ImDrawList_PathLineToMergeDuplicate(self, pos)
    end

    def path_fill_convex(col : UInt32) : Void
      LibImGui.ImDrawList_PathFillConvex(self, col)
    end

    def path_fill_concave(col : UInt32) : Void
      LibImGui.ImDrawList_PathFillConcave(self, col)
    end

    def path_stroke(col : UInt32, flags : ImDrawFlags = ImDrawFlags.new(0), thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_PathStroke(self, col, flags, thickness)
    end

    def path_arc_to(center : ImVec2, radius : Float32, a_min : Float32, a_max : Float32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_PathArcTo(self, center, radius, a_min, a_max, num_segments)
    end

    def path_arc_to_fast(center : ImVec2, radius : Float32, a_min_of_12 : Int32, a_max_of_12 : Int32) : Void
      LibImGui.ImDrawList_PathArcToFast(self, center, radius, a_min_of_12, a_max_of_12)
    end

    def path_elliptical_arc_to(center : ImVec2, radius : ImVec2, rot : Float32, a_min : Float32, a_max : Float32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_PathEllipticalArcTo(self, center, radius, rot, a_min, a_max, num_segments)
    end

    def path_bezier_cubic_curve_to(p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_PathBezierCubicCurveTo(self, p2, p3, p4, num_segments)
    end

    def path_bezier_quadratic_curve_to(p2 : ImVec2, p3 : ImVec2, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_PathBezierQuadraticCurveTo(self, p2, p3, num_segments)
    end

    def path_rect(rect_min : ImVec2, rect_max : ImVec2, rounding : Float32 = 0.0, flags : ImDrawFlags = ImDrawFlags.new(0)) : Void
      LibImGui.ImDrawList_PathRect(self, rect_min, rect_max, rounding, flags)
    end

    def add_callback(callback : ImDrawCallback, callback_data : Void*) : Void
      LibImGui.ImDrawList_AddCallback(self, callback, callback_data)
    end

    def add_draw_cmd : Void
      LibImGui.ImDrawList_AddDrawCmd(self)
    end

    def clone_output : ImDrawList
      result = LibImGui.ImDrawList_CloneOutput(self)
      ImDrawList.new(result)
    end

    def channels_split(count : Int32) : Void
      LibImGui.ImDrawList_ChannelsSplit(self, count)
    end

    def channels_merge : Void
      LibImGui.ImDrawList_ChannelsMerge(self)
    end

    def channels_set_current(n : Int32) : Void
      LibImGui.ImDrawList_ChannelsSetCurrent(self, n)
    end

    def prim_reserve(idx_count : Int32, vtx_count : Int32) : Void
      LibImGui.ImDrawList_PrimReserve(self, idx_count, vtx_count)
    end

    def prim_unreserve(idx_count : Int32, vtx_count : Int32) : Void
      LibImGui.ImDrawList_PrimUnreserve(self, idx_count, vtx_count)
    end

    def prim_rect(a : ImVec2, b : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimRect(self, a, b, col)
    end

    def prim_rect_uv(a : ImVec2, b : ImVec2, uv_a : ImVec2, uv_b : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimRectUV(self, a, b, uv_a, uv_b, col)
    end

    def prim_quad_uv(a : ImVec2, b : ImVec2, c : ImVec2, d : ImVec2, uv_a : ImVec2, uv_b : ImVec2, uv_c : ImVec2, uv_d : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimQuadUV(self, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col)
    end

    def prim_write_vtx(pos : ImVec2, uv : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimWriteVtx(self, pos, uv, col)
    end

    def prim_write_idx(idx : ImDrawIdx) : Void
      LibImGui.ImDrawList_PrimWriteIdx(self, idx)
    end

    def prim_vtx(pos : ImVec2, uv : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimVtx(self, pos, uv, col)
    end
  end

  alias TopLevel::ImDrawList = ImGui::ImDrawList

  struct ImDrawData
    include ClassType(LibImGui::ImDrawData)

    def valid : Bool
      @this.value.valid
    end

    def valid=(valid : Bool)
      @this.value.valid = valid
    end

    def cmd_lists_count : Int32
      @this.value.cmd_lists_count
    end

    def cmd_lists_count=(cmd_lists_count : Int32)
      @this.value.cmd_lists_count = cmd_lists_count
    end

    def total_idx_count : Int32
      @this.value.total_idx_count
    end

    def total_idx_count=(total_idx_count : Int32)
      @this.value.total_idx_count = total_idx_count
    end

    def total_vtx_count : Int32
      @this.value.total_vtx_count
    end

    def total_vtx_count=(total_vtx_count : Int32)
      @this.value.total_vtx_count = total_vtx_count
    end

    def cmd_lists : ImVector(ImDrawList)
      t = @this.value.cmd_lists
      pointerof(t).as(ImVector(ImDrawList)*).value
    end

    def cmd_lists=(cmd_lists : ImVector(ImDrawList))
      @this.value.cmd_lists = cmd_lists.as(LibImGui::ImVectorInternal*).value
    end

    def display_pos : ImVec2
      @this.value.display_pos
    end

    def display_pos=(display_pos : ImVec2)
      @this.value.display_pos = display_pos
    end

    def display_size : ImVec2
      @this.value.display_size
    end

    def display_size=(display_size : ImVec2)
      @this.value.display_size = display_size
    end

    def framebuffer_scale : ImVec2
      @this.value.framebuffer_scale
    end

    def framebuffer_scale=(framebuffer_scale : ImVec2)
      @this.value.framebuffer_scale = framebuffer_scale
    end

    def owner_viewport : ImGuiViewport
      ImGuiViewport.new(@this.value.owner_viewport)
    end

    def owner_viewport=(owner_viewport : ImGuiViewport)
      @this.value.owner_viewport = owner_viewport
    end

    def self.new : ImDrawData
      result = LibImGui.ImDrawData_ImDrawData
      ImDrawData.new(result)
    end

    def clear : Void
      LibImGui.ImDrawData_Clear(self)
    end

    def add_draw_list(draw_list : ImDrawList) : Void
      LibImGui.ImDrawData_AddDrawList(self, draw_list)
    end

    def de_index_all_buffers : Void
      LibImGui.ImDrawData_DeIndexAllBuffers(self)
    end

    def scale_clip_rects(fb_scale : ImVec2) : Void
      LibImGui.ImDrawData_ScaleClipRects(self, fb_scale)
    end
  end

  alias TopLevel::ImDrawData = ImGui::ImDrawData

  struct ImFontConfig
    include ClassType(LibImGui::ImFontConfig)

    def font_data : Void*
      @this.value.font_data
    end

    def font_data=(font_data : Void*)
      @this.value.font_data = font_data
    end

    def font_data_size : Int32
      @this.value.font_data_size
    end

    def font_data_size=(font_data_size : Int32)
      @this.value.font_data_size = font_data_size
    end

    def font_data_owned_by_atlas : Bool
      @this.value.font_data_owned_by_atlas
    end

    def font_data_owned_by_atlas=(font_data_owned_by_atlas : Bool)
      @this.value.font_data_owned_by_atlas = font_data_owned_by_atlas
    end

    def font_no : Int32
      @this.value.font_no
    end

    def font_no=(font_no : Int32)
      @this.value.font_no = font_no
    end

    def size_pixels : Float32
      @this.value.size_pixels
    end

    def size_pixels=(size_pixels : Float32)
      @this.value.size_pixels = size_pixels
    end

    def oversample_h : Int32
      @this.value.oversample_h
    end

    def oversample_h=(oversample_h : Int32)
      @this.value.oversample_h = oversample_h
    end

    def oversample_v : Int32
      @this.value.oversample_v
    end

    def oversample_v=(oversample_v : Int32)
      @this.value.oversample_v = oversample_v
    end

    def pixel_snap_h : Bool
      @this.value.pixel_snap_h
    end

    def pixel_snap_h=(pixel_snap_h : Bool)
      @this.value.pixel_snap_h = pixel_snap_h
    end

    def glyph_extra_spacing : ImVec2
      @this.value.glyph_extra_spacing
    end

    def glyph_extra_spacing=(glyph_extra_spacing : ImVec2)
      @this.value.glyph_extra_spacing = glyph_extra_spacing
    end

    def glyph_offset : ImVec2
      @this.value.glyph_offset
    end

    def glyph_offset=(glyph_offset : ImVec2)
      @this.value.glyph_offset = glyph_offset
    end

    def glyph_ranges : ImWchar*
      @this.value.glyph_ranges
    end

    def glyph_ranges=(glyph_ranges : ImWchar*)
      @this.value.glyph_ranges = glyph_ranges
    end

    def glyph_min_advance_x : Float32
      @this.value.glyph_min_advance_x
    end

    def glyph_min_advance_x=(glyph_min_advance_x : Float32)
      @this.value.glyph_min_advance_x = glyph_min_advance_x
    end

    def glyph_max_advance_x : Float32
      @this.value.glyph_max_advance_x
    end

    def glyph_max_advance_x=(glyph_max_advance_x : Float32)
      @this.value.glyph_max_advance_x = glyph_max_advance_x
    end

    def merge_mode : Bool
      @this.value.merge_mode
    end

    def merge_mode=(merge_mode : Bool)
      @this.value.merge_mode = merge_mode
    end

    def font_builder_flags : UInt32
      @this.value.font_builder_flags
    end

    def font_builder_flags=(font_builder_flags : UInt32)
      @this.value.font_builder_flags = font_builder_flags
    end

    def rasterizer_multiply : Float32
      @this.value.rasterizer_multiply
    end

    def rasterizer_multiply=(rasterizer_multiply : Float32)
      @this.value.rasterizer_multiply = rasterizer_multiply
    end

    def rasterizer_density : Float32
      @this.value.rasterizer_density
    end

    def rasterizer_density=(rasterizer_density : Float32)
      @this.value.rasterizer_density = rasterizer_density
    end

    def ellipsis_char : ImWchar
      @this.value.ellipsis_char
    end

    def ellipsis_char=(ellipsis_char : ImWchar)
      @this.value.ellipsis_char = ellipsis_char
    end

    def name : Slice(LibC::Char)
      @this.value.name.to_slice
    end

    def name=(name : Slice(LibC::Char))
      @this.value.name = name
    end

    def dst_font : ImFont
      ImFont.new(@this.value.dst_font)
    end

    def dst_font=(dst_font : ImFont)
      @this.value.dst_font = dst_font
    end

    def self.new : ImFontConfig
      result = LibImGui.ImFontConfig_ImFontConfig
      ImFontConfig.new(result)
    end
  end

  alias TopLevel::ImFontConfig = ImGui::ImFontConfig

  struct ImFontGlyph
    include StructType
  end

  struct ImFontGlyphRangesBuilder
    include StructType

    def used_chars : ImVector(UInt32)
      t = @used_chars
      pointerof(t).as(ImVector(UInt32)*).value
    end

    def used_chars=(used_chars : ImVector(UInt32))
      @used_chars = used_chars.as(LibImGui::ImVectorInternal*).value
    end

    def self.new : ImFontGlyphRangesBuilder
      result = LibImGui.ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder
      result.value
    end

    def clear : Void
      LibImGui.ImFontGlyphRangesBuilder_Clear(self)
    end

    def get_bit(n : LibC::SizeT) : Bool
      LibImGui.ImFontGlyphRangesBuilder_GetBit(self, n)
    end

    def set_bit(n : LibC::SizeT) : Void
      LibImGui.ImFontGlyphRangesBuilder_SetBit(self, n)
    end

    def add_char(c : ImWchar) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddChar(self, c)
    end

    def add_text(text : Bytes | String) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddText(self, text, (text.to_unsafe + text.bytesize))
    end

    def add_ranges(ranges : ImWchar*) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddRanges(self, ranges)
    end

    def build_ranges : ImVector
      LibImGui.ImFontGlyphRangesBuilder_BuildRanges(self, out out_ranges)
      out_ranges
    end
  end

  struct ImFontAtlasCustomRect
    include ClassType(LibImGui::ImFontAtlasCustomRect)

    def width : UInt16
      @this.value.width
    end

    def width=(width : UInt16)
      @this.value.width = width
    end

    def height : UInt16
      @this.value.height
    end

    def height=(height : UInt16)
      @this.value.height = height
    end

    def x : UInt16
      @this.value.x
    end

    def x=(x : UInt16)
      @this.value.x = x
    end

    def y : UInt16
      @this.value.y
    end

    def y=(y : UInt16)
      @this.value.y = y
    end

    def glyph_id : UInt32
      @this.value.glyph_id
    end

    def glyph_id=(glyph_id : UInt32)
      @this.value.glyph_id = glyph_id
    end

    def glyph_advance_x : Float32
      @this.value.glyph_advance_x
    end

    def glyph_advance_x=(glyph_advance_x : Float32)
      @this.value.glyph_advance_x = glyph_advance_x
    end

    def glyph_offset : ImVec2
      @this.value.glyph_offset
    end

    def glyph_offset=(glyph_offset : ImVec2)
      @this.value.glyph_offset = glyph_offset
    end

    def font : ImFont
      ImFont.new(@this.value.font)
    end

    def font=(font : ImFont)
      @this.value.font = font
    end

    def self.new : ImFontAtlasCustomRect
      result = LibImGui.ImFontAtlasCustomRect_ImFontAtlasCustomRect
      ImFontAtlasCustomRect.new(result)
    end

    def is_packed : Bool
      LibImGui.ImFontAtlasCustomRect_IsPacked(self)
    end
  end

  alias TopLevel::ImFontAtlasCustomRect = ImGui::ImFontAtlasCustomRect

  struct ImFontAtlas
    include ClassType(LibImGui::ImFontAtlas)

    def flags : ImFontAtlasFlags
      @this.value.flags
    end

    def flags=(flags : ImFontAtlasFlags)
      @this.value.flags = flags
    end

    def tex_id : ImTextureID
      @this.value.tex_id
    end

    def tex_id=(tex_id : ImTextureID)
      @this.value.tex_id = tex_id
    end

    def tex_desired_width : Int32
      @this.value.tex_desired_width
    end

    def tex_desired_width=(tex_desired_width : Int32)
      @this.value.tex_desired_width = tex_desired_width
    end

    def tex_glyph_padding : Int32
      @this.value.tex_glyph_padding
    end

    def tex_glyph_padding=(tex_glyph_padding : Int32)
      @this.value.tex_glyph_padding = tex_glyph_padding
    end

    def locked : Bool
      @this.value.locked
    end

    def locked=(locked : Bool)
      @this.value.locked = locked
    end

    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    def tex_ready : Bool
      @this.value.tex_ready
    end

    def tex_ready=(tex_ready : Bool)
      @this.value.tex_ready = tex_ready
    end

    def tex_pixels_use_colors : Bool
      @this.value.tex_pixels_use_colors
    end

    def tex_pixels_use_colors=(tex_pixels_use_colors : Bool)
      @this.value.tex_pixels_use_colors = tex_pixels_use_colors
    end

    def tex_pixels_alpha8 : LibC::UChar*
      @this.value.tex_pixels_alpha8
    end

    def tex_pixels_alpha8=(tex_pixels_alpha8 : LibC::UChar*)
      @this.value.tex_pixels_alpha8 = tex_pixels_alpha8
    end

    def tex_pixels_rgba32 : UInt32*
      @this.value.tex_pixels_rgba32
    end

    def tex_pixels_rgba32=(tex_pixels_rgba32 : UInt32*)
      @this.value.tex_pixels_rgba32 = tex_pixels_rgba32
    end

    def tex_width : Int32
      @this.value.tex_width
    end

    def tex_width=(tex_width : Int32)
      @this.value.tex_width = tex_width
    end

    def tex_height : Int32
      @this.value.tex_height
    end

    def tex_height=(tex_height : Int32)
      @this.value.tex_height = tex_height
    end

    def tex_uv_scale : ImVec2
      @this.value.tex_uv_scale
    end

    def tex_uv_scale=(tex_uv_scale : ImVec2)
      @this.value.tex_uv_scale = tex_uv_scale
    end

    def tex_uv_white_pixel : ImVec2
      @this.value.tex_uv_white_pixel
    end

    def tex_uv_white_pixel=(tex_uv_white_pixel : ImVec2)
      @this.value.tex_uv_white_pixel = tex_uv_white_pixel
    end

    def fonts : ImVector(ImFont)
      t = @this.value.fonts
      pointerof(t).as(ImVector(ImFont)*).value
    end

    def fonts=(fonts : ImVector(ImFont))
      @this.value.fonts = fonts.as(LibImGui::ImVectorInternal*).value
    end

    def custom_rects : ImVector(LibImGui::ImFontAtlasCustomRect)
      t = @this.value.custom_rects
      pointerof(t).as(ImVector(LibImGui::ImFontAtlasCustomRect)*).value
    end

    def custom_rects=(custom_rects : ImVector(LibImGui::ImFontAtlasCustomRect))
      @this.value.custom_rects = custom_rects.as(LibImGui::ImVectorInternal*).value
    end

    def config_data : ImVector(LibImGui::ImFontConfig)
      t = @this.value.config_data
      pointerof(t).as(ImVector(LibImGui::ImFontConfig)*).value
    end

    def config_data=(config_data : ImVector(LibImGui::ImFontConfig))
      @this.value.config_data = config_data.as(LibImGui::ImVectorInternal*).value
    end

    def tex_uv_lines : Slice(ImVec4)
      @this.value.tex_uv_lines.to_slice
    end

    def tex_uv_lines=(tex_uv_lines : Slice(ImVec4))
      @this.value.tex_uv_lines = tex_uv_lines
    end

    def font_builder_io : ImFontBuilderIO?
      (v = @this.value.font_builder_io) ? v.value : nil
    end

    def font_builder_io=(font_builder_io : ImFontBuilderIO?)
      @this.value.font_builder_io = font_builder_io
    end

    def font_builder_flags : UInt32
      @this.value.font_builder_flags
    end

    def font_builder_flags=(font_builder_flags : UInt32)
      @this.value.font_builder_flags = font_builder_flags
    end

    def pack_id_mouse_cursors : Int32
      @this.value.pack_id_mouse_cursors
    end

    def pack_id_mouse_cursors=(pack_id_mouse_cursors : Int32)
      @this.value.pack_id_mouse_cursors = pack_id_mouse_cursors
    end

    def pack_id_lines : Int32
      @this.value.pack_id_lines
    end

    def pack_id_lines=(pack_id_lines : Int32)
      @this.value.pack_id_lines = pack_id_lines
    end

    def self.new : ImFontAtlas
      result = LibImGui.ImFontAtlas_ImFontAtlas
      ImFontAtlas.new(result)
    end

    def add_font(font_cfg : ImFontConfig) : ImFont
      result = LibImGui.ImFontAtlas_AddFont(self, font_cfg)
      ImFont.new(result)
    end

    def add_font_default(font_cfg : ImFontConfig? = nil) : ImFont
      result = LibImGui.ImFontAtlas_AddFontDefault(self, font_cfg)
      ImFont.new(result)
    end

    def add_font_from_file_ttf(filename : String, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromFileTTF(self, filename, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    def add_font_from_memory_ttf(font_data : Void*, font_data_size : Int32, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryTTF(self, font_data, font_data_size, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    def add_font_from_memory_compressed_ttf(compressed_font_data : Void*, compressed_font_data_size : Int32, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryCompressedTTF(self, compressed_font_data, compressed_font_data_size, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    def add_font_from_memory_compressed_base85_ttf(compressed_font_data_base85 : String, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self, compressed_font_data_base85, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    def clear_input_data : Void
      LibImGui.ImFontAtlas_ClearInputData(self)
    end

    def clear_tex_data : Void
      LibImGui.ImFontAtlas_ClearTexData(self)
    end

    def clear_fonts : Void
      LibImGui.ImFontAtlas_ClearFonts(self)
    end

    def clear : Void
      LibImGui.ImFontAtlas_Clear(self)
    end

    def build : Bool
      LibImGui.ImFontAtlas_Build(self)
    end

    def get_tex_data_as_alpha8 : {LibC::UChar*, LibC::Int, LibC::Int, LibC::Int}
      LibImGui.ImFontAtlas_GetTexDataAsAlpha8(self, out out_pixels, out out_width, out out_height, out out_bytes_per_pixel)
      {out_pixels, out_width, out_height, out_bytes_per_pixel}
    end

    def get_tex_data_as_rgba32 : {LibC::UChar*, LibC::Int, LibC::Int, LibC::Int}
      LibImGui.ImFontAtlas_GetTexDataAsRGBA32(self, out out_pixels, out out_width, out out_height, out out_bytes_per_pixel)
      {out_pixels, out_width, out_height, out_bytes_per_pixel}
    end

    def is_built : Bool
      LibImGui.ImFontAtlas_IsBuilt(self)
    end

    def set_tex_id(id : ImTextureID) : Void
      LibImGui.ImFontAtlas_SetTexID(self, id)
    end

    def get_glyph_ranges_default : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesDefault(self)
    end

    def get_glyph_ranges_greek : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesGreek(self)
    end

    def get_glyph_ranges_korean : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesKorean(self)
    end

    def get_glyph_ranges_japanese : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesJapanese(self)
    end

    def get_glyph_ranges_chinese_full : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesChineseFull(self)
    end

    def get_glyph_ranges_chinese_simplified_common : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self)
    end

    def get_glyph_ranges_cyrillic : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesCyrillic(self)
    end

    def get_glyph_ranges_thai : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesThai(self)
    end

    def get_glyph_ranges_vietnamese : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesVietnamese(self)
    end

    def add_custom_rect_regular(width : Int32, height : Int32) : Int32
      LibImGui.ImFontAtlas_AddCustomRectRegular(self, width, height)
    end

    def add_custom_rect_font_glyph(font : ImFont, id : ImWchar, width : Int32, height : Int32, advance_x : Float32, offset : ImVec2 = ImVec2.new(0, 0)) : Int32
      LibImGui.ImFontAtlas_AddCustomRectFontGlyph(self, font, id, width, height, advance_x, offset)
    end

    def get_custom_rect_by_index(index : Int32) : ImFontAtlasCustomRect
      result = LibImGui.ImFontAtlas_GetCustomRectByIndex(self, index)
      ImFontAtlasCustomRect.new(result)
    end

    def calc_custom_rect_uv(rect : ImFontAtlasCustomRect) : {ImGui::ImVec2, ImGui::ImVec2}
      LibImGui.ImFontAtlas_CalcCustomRectUV(self, rect, out out_uv_min, out out_uv_max)
      {out_uv_min, out_uv_max}
    end

    def get_mouse_cursor_tex_data(cursor : ImGuiMouseCursor) : {Bool, ImGui::ImVec2, ImGui::ImVec2, Slice(ImGui::ImVec2), Slice(ImGui::ImVec2)}
      result = LibImGui.ImFontAtlas_GetMouseCursorTexData(self, cursor, out out_offset, out out_size, out out_uv_border, out out_uv_fill)
      {result, out_offset, out_size, out_uv_border.to_slice, out_uv_fill.to_slice}
    end
  end

  alias TopLevel::ImFontAtlas = ImGui::ImFontAtlas

  struct ImFont
    include ClassType(LibImGui::ImFont)

    def index_advance_x : ImVector(Float32)
      t = @this.value.index_advance_x
      pointerof(t).as(ImVector(Float32)*).value
    end

    def index_advance_x=(index_advance_x : ImVector(Float32))
      @this.value.index_advance_x = index_advance_x.as(LibImGui::ImVectorInternal*).value
    end

    def fallback_advance_x : Float32
      @this.value.fallback_advance_x
    end

    def fallback_advance_x=(fallback_advance_x : Float32)
      @this.value.fallback_advance_x = fallback_advance_x
    end

    def font_size : Float32
      @this.value.font_size
    end

    def font_size=(font_size : Float32)
      @this.value.font_size = font_size
    end

    def index_lookup : ImVector(ImWchar)
      t = @this.value.index_lookup
      pointerof(t).as(ImVector(ImWchar)*).value
    end

    def index_lookup=(index_lookup : ImVector(ImWchar))
      @this.value.index_lookup = index_lookup.as(LibImGui::ImVectorInternal*).value
    end

    def glyphs : ImVector(ImFontGlyph)
      t = @this.value.glyphs
      pointerof(t).as(ImVector(ImFontGlyph)*).value
    end

    def glyphs=(glyphs : ImVector(ImFontGlyph))
      @this.value.glyphs = glyphs.as(LibImGui::ImVectorInternal*).value
    end

    def fallback_glyph : ImFontGlyph?
      (v = @this.value.fallback_glyph) ? v.value : nil
    end

    def fallback_glyph=(fallback_glyph : ImFontGlyph?)
      @this.value.fallback_glyph = fallback_glyph
    end

    def container_atlas : ImFontAtlas
      ImFontAtlas.new(@this.value.container_atlas)
    end

    def container_atlas=(container_atlas : ImFontAtlas)
      @this.value.container_atlas = container_atlas
    end

    def config_data : Slice(ImFontConfig)
      Slice.new(@this.value.config_data_count.to_i) { |i| ImFontConfig.new(@this.value.config_data + i) }
    end

    def config_data=(config_data : Slice(ImFontConfig))
      @this.value.config_data, @this.value.config_data_count = config_data.to_unsafe, config_data.bytesize
    end

    def config_data_count : Int16
      @this.value.config_data_count
    end

    def config_data_count=(config_data_count : Int16)
      @this.value.config_data_count = config_data_count
    end

    def fallback_char : ImWchar
      @this.value.fallback_char
    end

    def fallback_char=(fallback_char : ImWchar)
      @this.value.fallback_char = fallback_char
    end

    def ellipsis_char : ImWchar
      @this.value.ellipsis_char
    end

    def ellipsis_char=(ellipsis_char : ImWchar)
      @this.value.ellipsis_char = ellipsis_char
    end

    def ellipsis_char_count : Int16
      @this.value.ellipsis_char_count
    end

    def ellipsis_char_count=(ellipsis_char_count : Int16)
      @this.value.ellipsis_char_count = ellipsis_char_count
    end

    def ellipsis_width : Float32
      @this.value.ellipsis_width
    end

    def ellipsis_width=(ellipsis_width : Float32)
      @this.value.ellipsis_width = ellipsis_width
    end

    def ellipsis_char_step : Float32
      @this.value.ellipsis_char_step
    end

    def ellipsis_char_step=(ellipsis_char_step : Float32)
      @this.value.ellipsis_char_step = ellipsis_char_step
    end

    def dirty_lookup_tables : Bool
      @this.value.dirty_lookup_tables
    end

    def dirty_lookup_tables=(dirty_lookup_tables : Bool)
      @this.value.dirty_lookup_tables = dirty_lookup_tables
    end

    def scale : Float32
      @this.value.scale
    end

    def scale=(scale : Float32)
      @this.value.scale = scale
    end

    def ascent : Float32
      @this.value.ascent
    end

    def ascent=(ascent : Float32)
      @this.value.ascent = ascent
    end

    def descent : Float32
      @this.value.descent
    end

    def descent=(descent : Float32)
      @this.value.descent = descent
    end

    def metrics_total_surface : Int32
      @this.value.metrics_total_surface
    end

    def metrics_total_surface=(metrics_total_surface : Int32)
      @this.value.metrics_total_surface = metrics_total_surface
    end

    def used4k_pages_map : Slice(UInt8)
      @this.value.used4k_pages_map.to_slice
    end

    def used4k_pages_map=(used4k_pages_map : Slice(UInt8))
      @this.value.used4k_pages_map = used4k_pages_map
    end

    def self.new : ImFont
      result = LibImGui.ImFont_ImFont
      ImFont.new(result)
    end

    def find_glyph(c : ImWchar) : ImFontGlyph
      result = LibImGui.ImFont_FindGlyph(self, c)
      result.value
    end

    def find_glyph_no_fallback(c : ImWchar) : ImFontGlyph
      result = LibImGui.ImFont_FindGlyphNoFallback(self, c)
      result.value
    end

    def get_char_advance(c : ImWchar) : Float32
      LibImGui.ImFont_GetCharAdvance(self, c)
    end

    def is_loaded : Bool
      LibImGui.ImFont_IsLoaded(self)
    end

    def get_debug_name : String
      result = LibImGui.ImFont_GetDebugName(self)
      String.new(result)
    end

    def calc_text_size_a(size : Float32, max_width : Float32, wrap_width : Float32, text : Bytes | String, remaining : LibC::Char** = Pointer(LibC::Char*).null) : ImGui::ImVec2
      LibImGui.ImFont_CalcTextSizeA(out p_out, self, size, max_width, wrap_width, text, (text.to_unsafe + text.bytesize), remaining)
      p_out
    end

    def calc_word_wrap_position_a(scale : Float32, text : Bytes | String, wrap_width : Float32) : String
      result = LibImGui.ImFont_CalcWordWrapPositionA(self, scale, text, (text.to_unsafe + text.bytesize), wrap_width)
      String.new(result)
    end

    def render_char(draw_list : ImDrawList, size : Float32, pos : ImVec2, col : UInt32, c : ImWchar) : Void
      LibImGui.ImFont_RenderChar(self, draw_list, size, pos, col, c)
    end

    def render_text(draw_list : ImDrawList, size : Float32, pos : ImVec2, col : UInt32, clip_rect : ImVec4, text : Bytes | String, wrap_width : Float32 = 0.0, cpu_fine_clip : Bool = false) : Void
      LibImGui.ImFont_RenderText(self, draw_list, size, pos, col, clip_rect, text, (text.to_unsafe + text.bytesize), wrap_width, cpu_fine_clip)
    end

    def build_lookup_table : Void
      LibImGui.ImFont_BuildLookupTable(self)
    end

    def clear_output_data : Void
      LibImGui.ImFont_ClearOutputData(self)
    end

    def grow_index(new_size : Int32) : Void
      LibImGui.ImFont_GrowIndex(self, new_size)
    end

    def add_glyph(src_cfg : ImFontConfig, c : ImWchar, x0 : Float32, y0 : Float32, x1 : Float32, y1 : Float32, u0 : Float32, v0 : Float32, u1 : Float32, v1 : Float32, advance_x : Float32) : Void
      LibImGui.ImFont_AddGlyph(self, src_cfg, c, x0, y0, x1, y1, u0, v0, u1, v1, advance_x)
    end

    def add_remap_char(dst : ImWchar, src : ImWchar, overwrite_dst : Bool = true) : Void
      LibImGui.ImFont_AddRemapChar(self, dst, src, overwrite_dst)
    end

    def set_glyph_visible(c : ImWchar, visible : Bool) : Void
      LibImGui.ImFont_SetGlyphVisible(self, c, visible)
    end

    def is_glyph_range_unused(c_begin : UInt32, c_last : UInt32) : Bool
      LibImGui.ImFont_IsGlyphRangeUnused(self, c_begin, c_last)
    end
  end

  alias TopLevel::ImFont = ImGui::ImFont

  struct ImGuiViewport
    include ClassType(LibImGui::ImGuiViewport)

    def id : ImGuiID
      @this.value.id
    end

    def id=(id : ImGuiID)
      @this.value.id = id
    end

    def flags : ImGuiViewportFlags
      @this.value.flags
    end

    def flags=(flags : ImGuiViewportFlags)
      @this.value.flags = flags
    end

    def pos : ImVec2
      @this.value.pos
    end

    def pos=(pos : ImVec2)
      @this.value.pos = pos
    end

    def size : ImVec2
      @this.value.size
    end

    def size=(size : ImVec2)
      @this.value.size = size
    end

    def work_pos : ImVec2
      @this.value.work_pos
    end

    def work_pos=(work_pos : ImVec2)
      @this.value.work_pos = work_pos
    end

    def work_size : ImVec2
      @this.value.work_size
    end

    def work_size=(work_size : ImVec2)
      @this.value.work_size = work_size
    end

    def platform_handle_raw : Void*
      @this.value.platform_handle_raw
    end

    def platform_handle_raw=(platform_handle_raw : Void*)
      @this.value.platform_handle_raw = platform_handle_raw
    end

    def self.new : ImGuiViewport
      result = LibImGui.ImGuiViewport_ImGuiViewport
      ImGuiViewport.new(result)
    end

    def get_center : ImGui::ImVec2
      LibImGui.ImGuiViewport_GetCenter(out p_out, self)
      p_out
    end

    def get_work_center : ImGui::ImVec2
      LibImGui.ImGuiViewport_GetWorkCenter(out p_out, self)
      p_out
    end
  end

  alias TopLevel::ImGuiViewport = ImGui::ImGuiViewport

  struct ImGuiPlatformImeData
    include ClassType(LibImGui::ImGuiPlatformImeData)

    def want_visible : Bool
      @this.value.want_visible
    end

    def want_visible=(want_visible : Bool)
      @this.value.want_visible = want_visible
    end

    def input_pos : ImVec2
      @this.value.input_pos
    end

    def input_pos=(input_pos : ImVec2)
      @this.value.input_pos = input_pos
    end

    def input_line_height : Float32
      @this.value.input_line_height
    end

    def input_line_height=(input_line_height : Float32)
      @this.value.input_line_height = input_line_height
    end

    def self.new : ImGuiPlatformImeData
      result = LibImGui.ImGuiPlatformImeData_ImGuiPlatformImeData
      ImGuiPlatformImeData.new(result)
    end
  end

  alias TopLevel::ImGuiPlatformImeData = ImGui::ImGuiPlatformImeData
  alias ImGuiContext = LibImGui::ImGuiContext
end
