require "./lib"

module ImGui
  # [struct ImVec2](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L260)
  struct ImVec2
    include StructType

    # [ImVec2::ImVec2()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L263)
    def self.new : ImVec2
      result = LibImGui.ImVec2_ImVec2_Nil
      result.value
    end

    # [ImVec2::ImVec2()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L264)
    def self.new(_x : Float32, _y : Float32) : ImVec2
      result = LibImGui.ImVec2_ImVec2_Float(_x, _y)
      result.value
    end
  end

  # [struct ImVec4](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L273)
  struct ImVec4
    include StructType

    # [ImVec4::ImVec4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L276)
    def self.new : ImVec4
      result = LibImGui.ImVec4_ImVec4_Nil
      result.value
    end

    # [ImVec4::ImVec4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L277)
    def self.new(_x : Float32, _y : Float32, _z : Float32, _w : Float32) : ImVec4
      result = LibImGui.ImVec4_ImVec4_Float(_x, _y, _z, _w)
      result.value
    end
  end

  # [ImGui::CreateContext()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L295)
  def self.create_context(shared_font_atlas : ImFontAtlas? = nil) : ImGuiContext
    result = LibImGui.CreateContext(shared_font_atlas)
    result.value
  end

  # NULL = destroy current context
  #
  # [ImGui::DestroyContext()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L296)
  def self.destroy_context(ctx : ImGuiContext? = nil) : Void
    LibImGui.DestroyContext(ctx)
  end

  # [ImGui::GetCurrentContext()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L297)
  def self.get_current_context : ImGuiContext
    result = LibImGui.GetCurrentContext
    result.value
  end

  # [ImGui::SetCurrentContext()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L298)
  def self.set_current_context(ctx : ImGuiContext) : Void
    LibImGui.SetCurrentContext(ctx)
  end

  # access the IO structure (mouse/keyboard/gamepad inputs, time, various configuration options/flags)
  #
  # [ImGui::GetIO()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L301)
  def self.get_io : ImGuiIO
    result = LibImGui.GetIO
    ImGuiIO.new(result)
  end

  # access the Style structure (colors, sizes). Always use PushStyleCol(), PushStyleVar() to modify style mid-frame!
  #
  # [ImGui::GetStyle()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L302)
  def self.get_style : ImGuiStyle
    result = LibImGui.GetStyle
    ImGuiStyle.new(result)
  end

  # start a new Dear ImGui frame, you can submit any command from this point until Render()/EndFrame().
  #
  # [ImGui::NewFrame()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L303)
  def self.new_frame : Void
    LibImGui.NewFrame
  end

  # ends the Dear ImGui frame. automatically called by Render(). If you don't need to render data (skipping rendering) you may call EndFrame() without Render()... but you'll have wasted CPU already! If you don't need to render, better to not create any windows and not call NewFrame() at all!
  #
  # [ImGui::EndFrame()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L304)
  def self.end_frame : Void
    LibImGui.EndFrame
  end

  # ends the Dear ImGui frame, finalize the draw data. You can then get call GetDrawData().
  #
  # [ImGui::Render()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L305)
  def self.render : Void
    LibImGui.Render
  end

  # valid after Render() and until the next call to NewFrame(). this is what you have to render.
  #
  # [ImGui::GetDrawData()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L306)
  def self.get_draw_data : ImDrawData
    result = LibImGui.GetDrawData
    ImDrawData.new(result)
  end

  # create Demo window. demonstrate most ImGui features. call this to learn about the library! try to make it always available in your application!
  #
  # [ImGui::ShowDemoWindow()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L309)
  pointer_wrapper def self.show_demo_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.ShowDemoWindow(p_open)
  end
  # create Metrics/Debugger window. display Dear ImGui internals: windows, draw commands, various internal state, etc.
  #
  # [ImGui::ShowMetricsWindow()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L310)
  pointer_wrapper def self.show_metrics_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.ShowMetricsWindow(p_open)
  end
  # create Debug Log window. display a simplified log of important dear imgui events.
  #
  # [ImGui::ShowDebugLogWindow()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L311)
  pointer_wrapper def self.show_debug_log_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.ShowDebugLogWindow(p_open)
  end
  # create Stack Tool window. hover items with mouse to query information about the source of their unique ID.
  #
  # [ImGui::ShowStackToolWindow()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L312)
  pointer_wrapper def self.show_stack_tool_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.ShowStackToolWindow(p_open)
  end
  # create About window. display Dear ImGui version, credits and build/system information.
  #
  # [ImGui::ShowAboutWindow()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L313)
  pointer_wrapper def self.show_about_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.ShowAboutWindow(p_open)
  end

  # add style editor block (not a window). you can pass in a reference ImGuiStyle structure to compare to, revert to and save to (else it uses the default style)
  #
  # [ImGui::ShowStyleEditor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L314)
  def self.show_style_editor(ref : ImGuiStyle? = nil) : Void
    LibImGui.ShowStyleEditor(ref)
  end

  # add style selector block (not a window), essentially a combo listing the default styles.
  #
  # [ImGui::ShowStyleSelector()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L315)
  def self.show_style_selector(label : String) : Bool
    LibImGui.ShowStyleSelector(label)
  end

  # add font selector block (not a window), essentially a combo listing the loaded fonts.
  #
  # [ImGui::ShowFontSelector()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L316)
  def self.show_font_selector(label : String) : Void
    LibImGui.ShowFontSelector(label)
  end

  # add basic help/info block (not a window): how to manipulate ImGui as an end-user (mouse/keyboard controls).
  #
  # [ImGui::ShowUserGuide()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L317)
  def self.show_user_guide : Void
    LibImGui.ShowUserGuide
  end

  # get the compiled version string e.g. "1.80 WIP" (essentially the value for IMGUI_VERSION from the compiled version of imgui.cpp)
  #
  # [ImGui::GetVersion()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L318)
  def self.get_version : String
    result = LibImGui.GetVersion
    String.new(result)
  end

  # new, recommended style (default)
  #
  # [ImGui::StyleColorsDark()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L321)
  def self.style_colors_dark(dst : ImGuiStyle? = nil) : Void
    LibImGui.StyleColorsDark(dst)
  end

  # best used with borders and a custom, thicker font
  #
  # [ImGui::StyleColorsLight()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L322)
  def self.style_colors_light(dst : ImGuiStyle? = nil) : Void
    LibImGui.StyleColorsLight(dst)
  end

  # classic imgui style
  #
  # [ImGui::StyleColorsClassic()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L323)
  def self.style_colors_classic(dst : ImGuiStyle? = nil) : Void
    LibImGui.StyleColorsClassic(dst)
  end

  # [ImGui::Begin()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L337)
  pointer_wrapper def self.begin(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.Begin(name, p_open, flags)
  end
  # Calls `begin`, conditionally yields to the block, then calls `end`.
  pointer_wrapper def self.window(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Nil
    yield if self.begin(name, p_open, flags)
    self.end
  end

  # [ImGui::End()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L338)
  def self.end : Void
    LibImGui.End
  end

  # [ImGui::BeginChild()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L348)
  def self.begin_child(str_id : String, size : ImVec2 = ImVec2.new(0, 0), border : Bool = false, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.BeginChild_Str(str_id, size, border, flags)
  end

  # Calls `begin_child`, conditionally yields to the block, then calls `end_child`.
  def self.child(str_id : String, size : ImVec2 = ImVec2.new(0, 0), border : Bool = false, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Nil
    yield if self.begin_child(str_id, size, border, flags)
    self.end_child
  end

  # [ImGui::BeginChild()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L349)
  def self.begin_child(id : ImGuiID, size : ImVec2 = ImVec2.new(0, 0), border : Bool = false, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.BeginChild_ID(id, size, border, flags)
  end

  # Calls `begin_child`, conditionally yields to the block, then calls `end_child`.
  def self.child(id : ImGuiID, size : ImVec2 = ImVec2.new(0, 0), border : Bool = false, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Nil
    yield if self.begin_child(id, size, border, flags)
    self.end_child
  end

  # [ImGui::EndChild()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L350)
  def self.end_child : Void
    LibImGui.EndChild
  end

  # [ImGui::IsWindowAppearing()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L354)
  def self.is_window_appearing : Bool
    LibImGui.IsWindowAppearing
  end

  # [ImGui::IsWindowCollapsed()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L355)
  def self.is_window_collapsed : Bool
    LibImGui.IsWindowCollapsed
  end

  # is current window focused? or its root/child, depending on flags. see flags for options.
  #
  # [ImGui::IsWindowFocused()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L356)
  def self.is_window_focused(flags : ImGuiFocusedFlags = ImGuiFocusedFlags.new(0)) : Bool
    LibImGui.IsWindowFocused(flags)
  end

  # is current window hovered (and typically: not blocked by a popup/modal)? see flags for options. NB: If you are trying to check whether your mouse should be dispatched to imgui or to your app, you should use the 'io.WantCaptureMouse' boolean for that! Please read the FAQ!
  #
  # [ImGui::IsWindowHovered()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L357)
  def self.is_window_hovered(flags : ImGuiHoveredFlags = ImGuiHoveredFlags.new(0)) : Bool
    LibImGui.IsWindowHovered(flags)
  end

  # get draw list associated to the current window, to append your own drawing primitives
  #
  # [ImGui::GetWindowDrawList()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L358)
  def self.get_window_draw_list : ImDrawList
    result = LibImGui.GetWindowDrawList
    ImDrawList.new(result)
  end

  # get current window position in screen space (note: it is unlikely you need to use this. Consider using current layout pos instead, GetScreenCursorPos())
  #
  # [ImGui::GetWindowPos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L359)
  def self.get_window_pos : ImGui::ImVec2
    LibImGui.GetWindowPos(out p_out)
    p_out
  end

  # get current window size (note: it is unlikely you need to use this. Consider using GetScreenCursorPos() and e.g. GetContentRegionAvail() instead)
  #
  # [ImGui::GetWindowSize()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L360)
  def self.get_window_size : ImGui::ImVec2
    LibImGui.GetWindowSize(out p_out)
    p_out
  end

  # get current window width (shortcut for GetWindowSize().x)
  #
  # [ImGui::GetWindowWidth()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L361)
  def self.get_window_width : Float32
    LibImGui.GetWindowWidth
  end

  # get current window height (shortcut for GetWindowSize().y)
  #
  # [ImGui::GetWindowHeight()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L362)
  def self.get_window_height : Float32
    LibImGui.GetWindowHeight
  end

  # set next window position. call before Begin(). use pivot=(0.5f,0.5f) to center on given point, etc.
  #
  # [ImGui::SetNextWindowPos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L366)
  def self.set_next_window_pos(pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0), pivot : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.SetNextWindowPos(pos, cond, pivot)
  end

  # set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin()
  #
  # [ImGui::SetNextWindowSize()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L367)
  def self.set_next_window_size(size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetNextWindowSize(size, cond)
  end

  # set next window size limits. use -1,-1 on either X/Y axis to preserve the current size. Sizes will be rounded down. Use callback to apply non-trivial programmatic constraints.
  #
  # [ImGui::SetNextWindowSizeConstraints()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L368)
  def self.set_next_window_size_constraints(size_min : ImVec2, size_max : ImVec2, custom_callback : ImGuiSizeCallback? = nil, custom_callback_data : Void* = Pointer(Void).null) : Void
    LibImGui.SetNextWindowSizeConstraints(size_min, size_max, custom_callback, custom_callback_data)
  end

  # set next window content size (~ scrollable client area, which enforce the range of scrollbars). Not including window decorations (title bar, menu bar, etc.) nor WindowPadding. set an axis to 0.0f to leave it automatic. call before Begin()
  #
  # [ImGui::SetNextWindowContentSize()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L369)
  def self.set_next_window_content_size(size : ImVec2) : Void
    LibImGui.SetNextWindowContentSize(size)
  end

  # set next window collapsed state. call before Begin()
  #
  # [ImGui::SetNextWindowCollapsed()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L370)
  def self.set_next_window_collapsed(collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetNextWindowCollapsed(collapsed, cond)
  end

  # set next window to be focused / top-most. call before Begin()
  #
  # [ImGui::SetNextWindowFocus()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L371)
  def self.set_next_window_focus : Void
    LibImGui.SetNextWindowFocus
  end

  # set next window scrolling value (use < 0.0f to not affect a given axis).
  #
  # [ImGui::SetNextWindowScroll()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L372)
  def self.set_next_window_scroll(scroll : ImVec2) : Void
    LibImGui.SetNextWindowScroll(scroll)
  end

  # set next window background color alpha. helper to easily override the Alpha component of ImGuiCol_WindowBg/ChildBg/PopupBg. you may also use ImGuiWindowFlags_NoBackground.
  #
  # [ImGui::SetNextWindowBgAlpha()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L373)
  def self.set_next_window_bg_alpha(alpha : Float32) : Void
    LibImGui.SetNextWindowBgAlpha(alpha)
  end

  # (not recommended) set current window position - call within Begin()/End(). prefer using SetNextWindowPos(), as this may incur tearing and side-effects.
  #
  # [ImGui::SetWindowPos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L374)
  def self.set_window_pos(pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowPos_Vec2(pos, cond)
  end

  # set named window position.
  #
  # [ImGui::SetWindowPos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L379)
  def self.set_window_pos(name : String, pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowPos_Str(name, pos, cond)
  end

  # (not recommended) set current window size - call within Begin()/End(). set to ImVec2(0, 0) to force an auto-fit. prefer using SetNextWindowSize(), as this may incur tearing and minor side-effects.
  #
  # [ImGui::SetWindowSize()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L375)
  def self.set_window_size(size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowSize_Vec2(size, cond)
  end

  # set named window size. set axis to 0.0f to force an auto-fit on this axis.
  #
  # [ImGui::SetWindowSize()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L380)
  def self.set_window_size(name : String, size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowSize_Str(name, size, cond)
  end

  # (not recommended) set current window collapsed state. prefer using SetNextWindowCollapsed().
  #
  # [ImGui::SetWindowCollapsed()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L376)
  def self.set_window_collapsed(collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowCollapsed_Bool(collapsed, cond)
  end

  # set named window collapsed state
  #
  # [ImGui::SetWindowCollapsed()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L381)
  def self.set_window_collapsed(name : String, collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetWindowCollapsed_Str(name, collapsed, cond)
  end

  # (not recommended) set current window to be focused / top-most. prefer using SetNextWindowFocus().
  #
  # [ImGui::SetWindowFocus()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L377)
  def self.set_window_focus : Void
    LibImGui.SetWindowFocus_Nil
  end

  # set named window to be focused / top-most. use NULL to remove focus.
  #
  # [ImGui::SetWindowFocus()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L382)
  def self.set_window_focus(name : String) : Void
    LibImGui.SetWindowFocus_Str(name)
  end

  # [OBSOLETE] set font scale. Adjust IO.FontGlobalScale if you want to scale all windows. This is an old API! For correct scaling, prefer to reload font + rebuild ImFontAtlas + call style.ScaleAllSizes().
  #
  # [ImGui::SetWindowFontScale()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L378)
  def self.set_window_font_scale(scale : Float32) : Void
    LibImGui.SetWindowFontScale(scale)
  end

  # == GetContentRegionMax() - GetCursorPos()
  #
  # [ImGui::GetContentRegionAvail()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L387)
  def self.get_content_region_avail : ImGui::ImVec2
    LibImGui.GetContentRegionAvail(out p_out)
    p_out
  end

  # current content boundaries (typically window boundaries including scrolling, or current column boundaries), in windows coordinates
  #
  # [ImGui::GetContentRegionMax()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L388)
  def self.get_content_region_max : ImGui::ImVec2
    LibImGui.GetContentRegionMax(out p_out)
    p_out
  end

  # content boundaries min for the full window (roughly (0,0)-Scroll), in window coordinates
  #
  # [ImGui::GetWindowContentRegionMin()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L389)
  def self.get_window_content_region_min : ImGui::ImVec2
    LibImGui.GetWindowContentRegionMin(out p_out)
    p_out
  end

  # content boundaries max for the full window (roughly (0,0)+Size-Scroll) where Size can be overridden with SetNextWindowContentSize(), in window coordinates
  #
  # [ImGui::GetWindowContentRegionMax()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L390)
  def self.get_window_content_region_max : ImGui::ImVec2
    LibImGui.GetWindowContentRegionMax(out p_out)
    p_out
  end

  # get scrolling amount [0 .. GetScrollMaxX()]
  #
  # [ImGui::GetScrollX()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L395)
  def self.get_scroll_x : Float32
    LibImGui.GetScrollX
  end

  # get scrolling amount [0 .. GetScrollMaxY()]
  #
  # [ImGui::GetScrollY()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L396)
  def self.get_scroll_y : Float32
    LibImGui.GetScrollY
  end

  # set scrolling amount [0 .. GetScrollMaxX()]
  #
  # [ImGui::SetScrollX()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L397)
  def self.set_scroll_x(scroll_x : Float32) : Void
    LibImGui.SetScrollX_Float(scroll_x)
  end

  # set scrolling amount [0 .. GetScrollMaxY()]
  #
  # [ImGui::SetScrollY()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L398)
  def self.set_scroll_y(scroll_y : Float32) : Void
    LibImGui.SetScrollY_Float(scroll_y)
  end

  # get maximum scrolling amount ~~ ContentSize.x - WindowSize.x - DecorationsSize.x
  #
  # [ImGui::GetScrollMaxX()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L399)
  def self.get_scroll_max_x : Float32
    LibImGui.GetScrollMaxX
  end

  # get maximum scrolling amount ~~ ContentSize.y - WindowSize.y - DecorationsSize.y
  #
  # [ImGui::GetScrollMaxY()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L400)
  def self.get_scroll_max_y : Float32
    LibImGui.GetScrollMaxY
  end

  # adjust scrolling amount to make current cursor position visible. center_x_ratio=0.0: left, 0.5: center, 1.0: right. When using to make a "default/current item" visible, consider using SetItemDefaultFocus() instead.
  #
  # [ImGui::SetScrollHereX()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L401)
  def self.set_scroll_here_x(center_x_ratio : Float32 = 0.5) : Void
    LibImGui.SetScrollHereX(center_x_ratio)
  end

  # adjust scrolling amount to make current cursor position visible. center_y_ratio=0.0: top, 0.5: center, 1.0: bottom. When using to make a "default/current item" visible, consider using SetItemDefaultFocus() instead.
  #
  # [ImGui::SetScrollHereY()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L402)
  def self.set_scroll_here_y(center_y_ratio : Float32 = 0.5) : Void
    LibImGui.SetScrollHereY(center_y_ratio)
  end

  # adjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.
  #
  # [ImGui::SetScrollFromPosX()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L403)
  def self.set_scroll_from_pos_x(local_x : Float32, center_x_ratio : Float32 = 0.5) : Void
    LibImGui.SetScrollFromPosX_Float(local_x, center_x_ratio)
  end

  # adjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.
  #
  # [ImGui::SetScrollFromPosY()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L404)
  def self.set_scroll_from_pos_y(local_y : Float32, center_y_ratio : Float32 = 0.5) : Void
    LibImGui.SetScrollFromPosY_Float(local_y, center_y_ratio)
  end

  # use NULL as a shortcut to push default font
  #
  # [ImGui::PushFont()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L407)
  def self.push_font(font : ImFont) : Void
    LibImGui.PushFont(font)
  end

  # Calls `push_font`, yields to the block, then calls `pop_font`.
  def self.with_font(font : ImFont) : Nil
    self.push_font(font)
    yield
    self.pop_font
  end

  # [ImGui::PopFont()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L408)
  def self.pop_font : Void
    LibImGui.PopFont
  end

  # modify a style color. always use this if you modify the style after NewFrame().
  #
  # [ImGui::PushStyleColor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L409)
  def self.push_style_color(idx : ImGuiCol, col : UInt32) : Void
    LibImGui.PushStyleColor_U32(idx, col)
  end

  # Calls `push_style_color`, yields to the block, then calls `pop_style_color`.
  def self.with_style_color(idx : ImGuiCol, col : UInt32) : Nil
    self.push_style_color(idx, col)
    yield
    self.pop_style_color
  end

  # [ImGui::PushStyleColor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L410)
  def self.push_style_color(idx : ImGuiCol, col : ImVec4) : Void
    LibImGui.PushStyleColor_Vec4(idx, col)
  end

  # Calls `push_style_color`, yields to the block, then calls `pop_style_color`.
  def self.with_style_color(idx : ImGuiCol, col : ImVec4) : Nil
    self.push_style_color(idx, col)
    yield
    self.pop_style_color
  end

  # [ImGui::PopStyleColor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L411)
  def self.pop_style_color(count : Int32 = 1) : Void
    LibImGui.PopStyleColor(count)
  end

  # modify a style float variable. always use this if you modify the style after NewFrame().
  #
  # [ImGui::PushStyleVar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L412)
  def self.push_style_var(idx : ImGuiStyleVar, val : Float32) : Void
    LibImGui.PushStyleVar_Float(idx, val)
  end

  # Calls `push_style_var`, yields to the block, then calls `pop_style_var`.
  def self.with_style_var(idx : ImGuiStyleVar, val : Float32) : Nil
    self.push_style_var(idx, val)
    yield
    self.pop_style_var
  end

  # modify a style ImVec2 variable. always use this if you modify the style after NewFrame().
  #
  # [ImGui::PushStyleVar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L413)
  def self.push_style_var(idx : ImGuiStyleVar, val : ImVec2) : Void
    LibImGui.PushStyleVar_Vec2(idx, val)
  end

  # Calls `push_style_var`, yields to the block, then calls `pop_style_var`.
  def self.with_style_var(idx : ImGuiStyleVar, val : ImVec2) : Nil
    self.push_style_var(idx, val)
    yield
    self.pop_style_var
  end

  # [ImGui::PopStyleVar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L414)
  def self.pop_style_var(count : Int32 = 1) : Void
    LibImGui.PopStyleVar(count)
  end

  # == tab stop enable. Allow focusing using TAB/Shift-TAB, enabled by default but you can disable it for certain widgets
  #
  # [ImGui::PushTabStop()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L415)
  def self.push_tab_stop(tab_stop : Bool) : Void
    LibImGui.PushTabStop(tab_stop)
  end

  # Calls `push_tab_stop`, yields to the block, then calls `pop_tab_stop`.
  def self.with_tab_stop(tab_stop : Bool) : Nil
    self.push_tab_stop(tab_stop)
    yield
    self.pop_tab_stop
  end

  # [ImGui::PopTabStop()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L416)
  def self.pop_tab_stop : Void
    LibImGui.PopTabStop
  end

  # in 'repeat' mode, Button*() functions return repeated true in a typematic manner (using io.KeyRepeatDelay/io.KeyRepeatRate setting). Note that you can call IsItemActive() after any Button() to tell if the button is held in the current frame.
  #
  # [ImGui::PushButtonRepeat()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L417)
  def self.push_button_repeat(repeat : Bool) : Void
    LibImGui.PushButtonRepeat(repeat)
  end

  # Calls `push_button_repeat`, yields to the block, then calls `pop_button_repeat`.
  def self.with_button_repeat(repeat : Bool) : Nil
    self.push_button_repeat(repeat)
    yield
    self.pop_button_repeat
  end

  # [ImGui::PopButtonRepeat()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L418)
  def self.pop_button_repeat : Void
    LibImGui.PopButtonRepeat
  end

  # push width of items for common large "item+label" widgets. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -FLT_MIN always align width to the right side).
  #
  # [ImGui::PushItemWidth()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L421)
  def self.push_item_width(item_width : Float32) : Void
    LibImGui.PushItemWidth(item_width)
  end

  # Calls `push_item_width`, yields to the block, then calls `pop_item_width`.
  def self.with_item_width(item_width : Float32) : Nil
    self.push_item_width(item_width)
    yield
    self.pop_item_width
  end

  # [ImGui::PopItemWidth()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L422)
  def self.pop_item_width : Void
    LibImGui.PopItemWidth
  end

  # set width of the _next_ common large "item+label" widget. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -FLT_MIN always align width to the right side)
  #
  # [ImGui::SetNextItemWidth()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L423)
  def self.set_next_item_width(item_width : Float32) : Void
    LibImGui.SetNextItemWidth(item_width)
  end

  # width of item given pushed settings and current cursor position. NOT necessarily the width of last item unlike most 'Item' functions.
  #
  # [ImGui::CalcItemWidth()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L424)
  def self.calc_item_width : Float32
    LibImGui.CalcItemWidth
  end

  # push word-wrapping position for Text*() commands. < 0.0f: no wrapping; 0.0f: wrap to end of window (or column); > 0.0f: wrap at 'wrap_pos_x' position in window local space
  #
  # [ImGui::PushTextWrapPos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L425)
  def self.push_text_wrap_pos(wrap_local_pos_x : Float32 = 0.0) : Void
    LibImGui.PushTextWrapPos(wrap_local_pos_x)
  end

  # Calls `push_text_wrap_pos`, yields to the block, then calls `pop_text_wrap_pos`.
  def self.with_text_wrap_pos(wrap_local_pos_x : Float32 = 0.0) : Nil
    self.push_text_wrap_pos(wrap_local_pos_x)
    yield
    self.pop_text_wrap_pos
  end

  # [ImGui::PopTextWrapPos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L426)
  def self.pop_text_wrap_pos : Void
    LibImGui.PopTextWrapPos
  end

  # get current font
  #
  # [ImGui::GetFont()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L430)
  def self.get_font : ImFont
    result = LibImGui.GetFont
    ImFont.new(result)
  end

  # get current font size (= height in pixels) of current font with current scale applied
  #
  # [ImGui::GetFontSize()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L431)
  def self.get_font_size : Float32
    LibImGui.GetFontSize
  end

  # get UV coordinate for a while pixel, useful to draw custom shapes via the ImDrawList API
  #
  # [ImGui::GetFontTexUvWhitePixel()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L432)
  def self.get_font_tex_uv_white_pixel : ImGui::ImVec2
    LibImGui.GetFontTexUvWhitePixel(out p_out)
    p_out
  end

  # retrieve given style color with style alpha applied and optional extra alpha multiplier, packed as a 32-bit value suitable for ImDrawList
  #
  # [ImGui::GetColorU32()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L433)
  def self.get_color_u32(idx : ImGuiCol, alpha_mul : Float32 = 1.0) : UInt32
    LibImGui.GetColorU32_Col(idx, alpha_mul)
  end

  # retrieve given color with style alpha applied, packed as a 32-bit value suitable for ImDrawList
  #
  # [ImGui::GetColorU32()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L434)
  def self.get_color_u32(col : ImVec4) : UInt32
    LibImGui.GetColorU32_Vec4(col)
  end

  # retrieve given color with style alpha applied, packed as a 32-bit value suitable for ImDrawList
  #
  # [ImGui::GetColorU32()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L435)
  def self.get_color_u32(col : UInt32) : UInt32
    LibImGui.GetColorU32_U32(col)
  end

  # retrieve style color as stored in ImGuiStyle structure. use to feed back into PushStyleColor(), otherwise use GetColorU32() to get style color with style alpha baked in.
  #
  # [ImGui::GetStyleColorVec4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L436)
  def self.get_style_color_vec4(idx : ImGuiCol) : ImVec4
    result = LibImGui.GetStyleColorVec4(idx)
    result.value
  end

  # separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator.
  #
  # [ImGui::Separator()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L445)
  def self.separator : Void
    LibImGui.Separator
  end

  # call between widgets or groups to layout them horizontally. X position given in window coordinates.
  #
  # [ImGui::SameLine()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L446)
  def self.same_line(offset_from_start_x : Float32 = 0.0, spacing : Float32 = -1.0) : Void
    LibImGui.SameLine(offset_from_start_x, spacing)
  end

  # undo a SameLine() or force a new line when in a horizontal-layout context.
  #
  # [ImGui::NewLine()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L447)
  def self.new_line : Void
    LibImGui.NewLine
  end

  # add vertical spacing.
  #
  # [ImGui::Spacing()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L448)
  def self.spacing : Void
    LibImGui.Spacing
  end

  # add a dummy item of given size. unlike InvisibleButton(), Dummy() won't take the mouse click or be navigable into.
  #
  # [ImGui::Dummy()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L449)
  def self.dummy(size : ImVec2) : Void
    LibImGui.Dummy(size)
  end

  # move content position toward the right, by indent_w, or style.IndentSpacing if indent_w <= 0
  #
  # [ImGui::Indent()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L450)
  def self.indent(indent_w : Float32 = 0.0) : Void
    LibImGui.Indent(indent_w)
  end

  # move content position back to the left, by indent_w, or style.IndentSpacing if indent_w <= 0
  #
  # [ImGui::Unindent()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L451)
  def self.unindent(indent_w : Float32 = 0.0) : Void
    LibImGui.Unindent(indent_w)
  end

  # lock horizontal starting position
  #
  # [ImGui::BeginGroup()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L452)
  def self.begin_group : Void
    LibImGui.BeginGroup
  end

  # Calls `begin_group`, yields to the block, then calls `end_group`.
  def self.group : Nil
    self.begin_group
    yield
    self.end_group
  end

  # unlock horizontal starting position + capture the whole group bounding box into one "item" (so you can use IsItemHovered() or layout primitives such as SameLine() on whole group, etc.)
  #
  # [ImGui::EndGroup()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L453)
  def self.end_group : Void
    LibImGui.EndGroup
  end

  # cursor position in window coordinates (relative to window position)
  #
  # [ImGui::GetCursorPos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L454)
  def self.get_cursor_pos : ImGui::ImVec2
    LibImGui.GetCursorPos(out p_out)
    p_out
  end

  # (some functions are using window-relative coordinates, such as: GetCursorPos, GetCursorStartPos, GetContentRegionMax, GetWindowContentRegion* etc.
  #
  # [ImGui::GetCursorPosX()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L455)
  def self.get_cursor_pos_x : Float32
    LibImGui.GetCursorPosX
  end

  # other functions such as GetCursorScreenPos or everything in ImDrawList::
  #
  # [ImGui::GetCursorPosY()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L456)
  def self.get_cursor_pos_y : Float32
    LibImGui.GetCursorPosY
  end

  # are using the main, absolute coordinate system.
  #
  # [ImGui::SetCursorPos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L457)
  def self.set_cursor_pos(local_pos : ImVec2) : Void
    LibImGui.SetCursorPos(local_pos)
  end

  # GetWindowPos() + GetCursorPos() == GetCursorScreenPos() etc.)
  #
  # [ImGui::SetCursorPosX()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L458)
  def self.set_cursor_pos_x(local_x : Float32) : Void
    LibImGui.SetCursorPosX(local_x)
  end

  # [ImGui::SetCursorPosY()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L459)
  def self.set_cursor_pos_y(local_y : Float32) : Void
    LibImGui.SetCursorPosY(local_y)
  end

  # initial cursor position in window coordinates
  #
  # [ImGui::GetCursorStartPos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L460)
  def self.get_cursor_start_pos : ImGui::ImVec2
    LibImGui.GetCursorStartPos(out p_out)
    p_out
  end

  # cursor position in absolute coordinates (useful to work with ImDrawList API). generally top-left == GetMainViewport()->Pos == (0,0) in single viewport mode, and bottom-right == GetMainViewport()->Pos+Size == io.DisplaySize in single-viewport mode.
  #
  # [ImGui::GetCursorScreenPos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L461)
  def self.get_cursor_screen_pos : ImGui::ImVec2
    LibImGui.GetCursorScreenPos(out p_out)
    p_out
  end

  # cursor position in absolute coordinates
  #
  # [ImGui::SetCursorScreenPos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L462)
  def self.set_cursor_screen_pos(pos : ImVec2) : Void
    LibImGui.SetCursorScreenPos(pos)
  end

  # vertically align upcoming text baseline to FramePadding.y so that it will align properly to regularly framed items (call if you have text on a line before a framed item)
  #
  # [ImGui::AlignTextToFramePadding()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L463)
  def self.align_text_to_frame_padding : Void
    LibImGui.AlignTextToFramePadding
  end

  # ~ FontSize
  #
  # [ImGui::GetTextLineHeight()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L464)
  def self.get_text_line_height : Float32
    LibImGui.GetTextLineHeight
  end

  # ~ FontSize + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of text)
  #
  # [ImGui::GetTextLineHeightWithSpacing()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L465)
  def self.get_text_line_height_with_spacing : Float32
    LibImGui.GetTextLineHeightWithSpacing
  end

  # ~ FontSize + style.FramePadding.y * 2
  #
  # [ImGui::GetFrameHeight()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L466)
  def self.get_frame_height : Float32
    LibImGui.GetFrameHeight
  end

  # ~ FontSize + style.FramePadding.y * 2 + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of framed widgets)
  #
  # [ImGui::GetFrameHeightWithSpacing()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L467)
  def self.get_frame_height_with_spacing : Float32
    LibImGui.GetFrameHeightWithSpacing
  end

  # push string into the ID stack (will hash string).
  #
  # [ImGui::PushID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L480)
  def self.push_id(str_id : String) : Void
    LibImGui.PushID_Str(str_id)
  end

  # Calls `push_id`, yields to the block, then calls `pop_id`.
  def self.with_id(str_id : String) : Nil
    self.push_id(str_id)
    yield
    self.pop_id
  end

  # push string into the ID stack (will hash string).
  #
  # [ImGui::PushID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L481)
  def self.push_id(str_id : Bytes | String) : Void
    LibImGui.PushID_StrStr(str_id, (str_id.to_unsafe + str_id.bytesize))
  end

  # Calls `push_id`, yields to the block, then calls `pop_id`.
  def self.with_id(str_id : Bytes | String) : Nil
    self.push_id(str_id)
    yield
    self.pop_id
  end

  # push pointer into the ID stack (will hash pointer).
  #
  # [ImGui::PushID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L482)
  def self.push_id(ptr_id : Reference | ClassType | Int | Void*) : Void
    LibImGui.PushID_Ptr(to_void_id(ptr_id))
  end

  # Calls `push_id`, yields to the block, then calls `pop_id`.
  def self.with_id(ptr_id : Reference | ClassType | Int | Void*) : Nil
    self.push_id(ptr_id)
    yield
    self.pop_id
  end

  # push integer into the ID stack (will hash integer).
  #
  # [ImGui::PushID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L483)
  def self.push_id(int_id : Int32) : Void
    LibImGui.PushID_Int(int_id)
  end

  # Calls `push_id`, yields to the block, then calls `pop_id`.
  def self.with_id(int_id : Int32) : Nil
    self.push_id(int_id)
    yield
    self.pop_id
  end

  # pop from the ID stack.
  #
  # [ImGui::PopID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L484)
  def self.pop_id : Void
    LibImGui.PopID
  end

  # calculate unique ID (hash of whole ID stack + given parameter). e.g. if you want to query into ImGuiStorage yourself
  #
  # [ImGui::GetID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L485)
  def self.get_id(str_id : String) : ImGuiID
    LibImGui.GetID_Str(str_id)
  end

  # [ImGui::GetID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L486)
  def self.get_id(str_id : Bytes | String) : ImGuiID
    LibImGui.GetID_StrStr(str_id, (str_id.to_unsafe + str_id.bytesize))
  end

  # [ImGui::GetID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L487)
  def self.get_id(ptr_id : Reference | ClassType | Int | Void*) : ImGuiID
    LibImGui.GetID_Ptr(to_void_id(ptr_id))
  end

  # raw text without formatting. Roughly equivalent to Text("%s", text) but: A) doesn't require null terminated string if 'text_end' is specified, B) it's faster, no memory copy is done, no buffer size limits, recommended for long chunks of text.
  #
  # [ImGui::TextUnformatted()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L490)
  def self.text_unformatted(text : Bytes | String) : Void
    LibImGui.TextUnformatted(text, (text.to_unsafe + text.bytesize))
  end

  # formatted text
  #
  # [ImGui::Text()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L491)
  def self.text(fmt : String, *args) : Void
    LibImGui.Text(fmt, *args._promote_va_args)
  end

  # shortcut for PushStyleColor(ImGuiCol_Text, col); Text(fmt, ...); PopStyleColor();
  #
  # [ImGui::TextColored()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L493)
  def self.text_colored(col : ImVec4, fmt : String, *args) : Void
    LibImGui.TextColored(col, fmt, *args._promote_va_args)
  end

  # shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();
  #
  # [ImGui::TextDisabled()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L495)
  def self.text_disabled(fmt : String, *args) : Void
    LibImGui.TextDisabled(fmt, *args._promote_va_args)
  end

  # shortcut for PushTextWrapPos(0.0f); Text(fmt, ...); PopTextWrapPos();. Note that this won't work on an auto-resizing window if there's no other widgets to extend the window width, yoy may need to set a size using SetNextWindowSize().
  #
  # [ImGui::TextWrapped()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L497)
  def self.text_wrapped(fmt : String, *args) : Void
    LibImGui.TextWrapped(fmt, *args._promote_va_args)
  end

  # display text+label aligned the same way as value+label widgets
  #
  # [ImGui::LabelText()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L499)
  def self.label_text(label : String, fmt : String, *args) : Void
    LibImGui.LabelText(label, fmt, *args._promote_va_args)
  end

  # shortcut for Bullet()+Text()
  #
  # [ImGui::BulletText()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L501)
  def self.bullet_text(fmt : String, *args) : Void
    LibImGui.BulletText(fmt, *args._promote_va_args)
  end

  # currently: formatted text with an horizontal line
  #
  # [ImGui::SeparatorText()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L503)
  def self.separator_text(label : String) : Void
    LibImGui.SeparatorText(label)
  end

  # button
  #
  # [ImGui::Button()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L508)
  def self.button(label : String, size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.Button(label, size)
  end

  # button with FramePadding=(0,0) to easily embed within text
  #
  # [ImGui::SmallButton()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L509)
  def self.small_button(label : String) : Bool
    LibImGui.SmallButton(label)
  end

  # flexible button behavior without the visuals, frequently useful to build custom behaviors using the public api (along with IsItemActive, IsItemHovered, etc.)
  #
  # [ImGui::InvisibleButton()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L510)
  def self.invisible_button(str_id : String, size : ImVec2, flags : ImGuiButtonFlags = ImGuiButtonFlags.new(0)) : Bool
    LibImGui.InvisibleButton(str_id, size, flags)
  end

  # square button with an arrow shape
  #
  # [ImGui::ArrowButton()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L511)
  def self.arrow_button(str_id : String, dir : ImGuiDir) : Bool
    LibImGui.ArrowButton(str_id, dir)
  end

  # [ImGui::Checkbox()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L512)
  pointer_wrapper def self.checkbox(label : String, v : Bool*) : Bool
    LibImGui.Checkbox(label, v)
  end
  # [ImGui::CheckboxFlags()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L513)
  pointer_wrapper def self.checkbox_flags(label : String, flags : Int32*, flags_value : Int32) : Bool
    LibImGui.CheckboxFlags_IntPtr(label, flags, flags_value)
  end
  # [ImGui::CheckboxFlags()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L514)
  pointer_wrapper def self.checkbox_flags(label : String, flags : UInt32*, flags_value : UInt32) : Bool
    LibImGui.CheckboxFlags_UintPtr(label, flags, flags_value)
  end
  # use with e.g. if (RadioButton("one", my_value==1)) { my_value = 1; }
  #
  # [ImGui::RadioButton()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L515)
  pointer_wrapper def self.radio_button(label : String, active : Bool) : Bool
    LibImGui.RadioButton_Bool(label, active)
  end
  # shortcut to handle the above pattern when value is an integer
  #
  # [ImGui::RadioButton()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L516)
  pointer_wrapper def self.radio_button(label : String, v : Int32*, v_button : Int32) : Bool
    LibImGui.RadioButton_IntPtr(label, v, v_button)
  end

  # [ImGui::ProgressBar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L517)
  def self.progress_bar(fraction : Float32, size_arg : ImVec2 = ImVec2.new(-Float32::MIN_POSITIVE, 0), overlay : String? = nil) : Void
    LibImGui.ProgressBar(fraction, size_arg, overlay)
  end

  # draw a small circle + keep the cursor on the same line. advance cursor x position by GetTreeNodeToLabelSpacing(), same distance that TreeNode() uses
  #
  # [ImGui::Bullet()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L518)
  def self.bullet : Void
    LibImGui.Bullet
  end

  # [ImGui::Image()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L522)
  def self.image(user_texture_id : ImTextureID, size : ImVec2, uv0 : ImVec2 = ImVec2.new(0, 0), uv1 : ImVec2 = ImVec2.new(1, 1), tint_col : ImVec4 = ImVec4.new(1, 1, 1, 1), border_col : ImVec4 = ImVec4.new(0, 0, 0, 0)) : Void
    LibImGui.Image(user_texture_id, size, uv0, uv1, tint_col, border_col)
  end

  # [ImGui::ImageButton()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L523)
  def self.image_button(str_id : String, user_texture_id : ImTextureID, size : ImVec2, uv0 : ImVec2 = ImVec2.new(0, 0), uv1 : ImVec2 = ImVec2.new(1, 1), bg_col : ImVec4 = ImVec4.new(0, 0, 0, 0), tint_col : ImVec4 = ImVec4.new(1, 1, 1, 1)) : Bool
    LibImGui.ImageButton(str_id, user_texture_id, size, uv0, uv1, bg_col, tint_col)
  end

  # [ImGui::BeginCombo()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L528)
  def self.begin_combo(label : String, preview_value : String, flags : ImGuiComboFlags = ImGuiComboFlags.new(0)) : Bool
    LibImGui.BeginCombo(label, preview_value, flags)
  end

  # Calls `begin_combo`, conditionally yields to the block, then conditionally calls `end_combo`.
  def self.combo(label : String, preview_value : String, flags : ImGuiComboFlags = ImGuiComboFlags.new(0)) : Nil
    return unless self.begin_combo(label, preview_value, flags)
    yield
    self.end_combo
  end

  # only call EndCombo() if BeginCombo() returns true!
  #
  # [ImGui::EndCombo()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L529)
  def self.end_combo : Void
    LibImGui.EndCombo
  end

  # [ImGui::Combo()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L530)
  pointer_wrapper def self.combo(label : String, current_item : Int32* | Pointer, items : Indexable(LibC::Char*), popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.Combo_Str_arr(label, (typeof(current_item.value.to_i32); current_item.as(Int32*)), items, items.size, popup_max_height_in_items)
  end
  # Separate items with \0 within a string, end item-list with \0\0. e.g. "One\0Two\0Three\0"
  #
  # [ImGui::Combo()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L531)
  pointer_wrapper def self.combo(label : String, current_item : Int32* | Pointer, items_separated_by_zeros : String, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.Combo_Str(label, (typeof(current_item.value.to_i32); current_item.as(Int32*)), items_separated_by_zeros, popup_max_height_in_items)
  end
  # [ImGui::Combo()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L532)
  pointer_wrapper def self.combo(label : String, current_item : Int32* | Pointer, items_getter : (Void*, Int32, LibC::Char**) -> Bool, data : Void*, items_count : Int32, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.Combo_FnBoolPtr(label, (typeof(current_item.value.to_i32); current_item.as(Int32*)), items_getter, data, items_count, popup_max_height_in_items)
  end
  # If v_min >= v_max we have no bound
  #
  # [ImGui::DragFloat()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L546)
  pointer_wrapper def self.drag_float(label : String, v : Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragFloat(label, v, v_speed, v_min, v_max, format, flags)
  end
  # [ImGui::DragFloat2()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L547)
  pointer_wrapper def self.drag_float2(label : String, v : ImVec2* | Indexable(Float32) | Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragFloat2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Float32*), v_speed, v_min, v_max, format, flags)
  end
  # [ImGui::DragFloat3()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L548)
  pointer_wrapper def self.drag_float3(label : String, v : Indexable(Float32) | Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragFloat3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Float32*), v_speed, v_min, v_max, format, flags)
  end
  # [ImGui::DragFloat4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L549)
  pointer_wrapper def self.drag_float4(label : String, v : ImVec4* | Indexable(Float32) | Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragFloat4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Float32*), v_speed, v_min, v_max, format, flags)
  end
  # [ImGui::DragFloatRange2()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L550)
  pointer_wrapper def self.drag_float_range2(label : String, v_current_min : Float32*, v_current_max : Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", format_max : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags)
  end
  # If v_min >= v_max we have no bound
  #
  # [ImGui::DragInt()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L551)
  pointer_wrapper def self.drag_int(label : String, v : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragInt(label, v, v_speed, v_min, v_max, format, flags)
  end
  # [ImGui::DragInt2()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L552)
  pointer_wrapper def self.drag_int2(label : String, v : Indexable(Int32) | Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragInt2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Int32*), v_speed, v_min, v_max, format, flags)
  end
  # [ImGui::DragInt3()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L553)
  pointer_wrapper def self.drag_int3(label : String, v : Indexable(Int32) | Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragInt3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Int32*), v_speed, v_min, v_max, format, flags)
  end
  # [ImGui::DragInt4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L554)
  pointer_wrapper def self.drag_int4(label : String, v : Indexable(Int32) | Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragInt4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Int32*), v_speed, v_min, v_max, format, flags)
  end
  # [ImGui::DragIntRange2()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L555)
  pointer_wrapper def self.drag_int_range2(label : String, v_current_min : Int32*, v_current_max : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", format_max : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  # [ImGui::DragScalar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L556)
  pointer_wrapper def self.drag_scalar(label : String, p_data : {{t}}*, v_speed : Float32 = 1.0, p_min : {{t}}? = nil, p_max : {{t}}? = nil, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragScalar(label, ImGuiDataType::{{k.id}}, p_data, v_speed, p_min ? (p_min_ = p_min; pointerof(p_min_)) : Pointer({{t}}).null, p_max ? (p_max_ = p_max; pointerof(p_max_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  # [ImGui::DragScalarN()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L557)
  pointer_wrapper def self.drag_scalar_n(label : String, p_data : {{t}}*, components : Int32, v_speed : Float32 = 1.0, p_min : {{t}}* = Pointer({{t}}).null, p_max : {{t}}* = Pointer({{t}}).null, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.DragScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, v_speed, p_min, p_max, format, flags)
  end
  {% end %}
  # adjust format to decorate the value with a prefix or a suffix for in-slider labels or unit display.
  #
  # [ImGui::SliderFloat()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L565)
  pointer_wrapper def self.slider_float(label : String, v : Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderFloat(label, v, v_min, v_max, format, flags)
  end
  # [ImGui::SliderFloat2()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L566)
  pointer_wrapper def self.slider_float2(label : String, v : ImVec2* | Indexable(Float32) | Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderFloat2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Float32*), v_min, v_max, format, flags)
  end
  # [ImGui::SliderFloat3()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L567)
  pointer_wrapper def self.slider_float3(label : String, v : Indexable(Float32) | Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderFloat3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Float32*), v_min, v_max, format, flags)
  end
  # [ImGui::SliderFloat4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L568)
  pointer_wrapper def self.slider_float4(label : String, v : ImVec4* | Indexable(Float32) | Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderFloat4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Float32*), v_min, v_max, format, flags)
  end
  # [ImGui::SliderAngle()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L569)
  pointer_wrapper def self.slider_angle(label : String, v_rad : Float32*, v_degrees_min : Float32 = -360.0, v_degrees_max : Float32 = +360.0, format : String = "%.0f deg", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderAngle(label, v_rad, v_degrees_min, v_degrees_max, format, flags)
  end
  # [ImGui::SliderInt()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L570)
  pointer_wrapper def self.slider_int(label : String, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderInt(label, v, v_min, v_max, format, flags)
  end
  # [ImGui::SliderInt2()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L571)
  pointer_wrapper def self.slider_int2(label : String, v : Indexable(Int32) | Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderInt2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Int32*), v_min, v_max, format, flags)
  end
  # [ImGui::SliderInt3()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L572)
  pointer_wrapper def self.slider_int3(label : String, v : Indexable(Int32) | Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderInt3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Int32*), v_min, v_max, format, flags)
  end
  # [ImGui::SliderInt4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L573)
  pointer_wrapper def self.slider_int4(label : String, v : Indexable(Int32) | Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderInt4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Int32*), v_min, v_max, format, flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  # [ImGui::SliderScalar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L574)
  pointer_wrapper def self.slider_scalar(label : String, p_data : {{t}}*, p_min : {{t}}, p_max : {{t}}, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderScalar(label, ImGuiDataType::{{k.id}}, p_data, p_min ? (p_min_ = p_min; pointerof(p_min_)) : Pointer({{t}}).null, p_max ? (p_max_ = p_max; pointerof(p_max_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  # [ImGui::SliderScalarN()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L575)
  pointer_wrapper def self.slider_scalar_n(label : String, p_data : {{t}}*, components : Int32, p_min : {{t}}*, p_max : {{t}}*, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.SliderScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, p_min, p_max, format, flags)
  end
  {% end %}
  # [ImGui::VSliderFloat()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L576)
  pointer_wrapper def self.v_slider_float(label : String, size : ImVec2, v : Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.VSliderFloat(label, size, v, v_min, v_max, format, flags)
  end
  # [ImGui::VSliderInt()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L577)
  pointer_wrapper def self.v_slider_int(label : String, size : ImVec2, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.VSliderInt(label, size, v, v_min, v_max, format, flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  # [ImGui::VSliderScalar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L578)
  pointer_wrapper def self.v_slider_scalar(label : String, size : ImVec2, p_data : {{t}}*, p_min : {{t}}, p_max : {{t}}, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.VSliderScalar(label, size, ImGuiDataType::{{k.id}}, p_data, p_min ? (p_min_ = p_min; pointerof(p_min_)) : Pointer({{t}}).null, p_max ? (p_max_ = p_max; pointerof(p_max_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}

  # [ImGui::InputText()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L583)
  def self.input_text(label : String, buf : Bytes, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.InputText(label, buf, buf.size, flags, callback, user_data)
  end

  # [ImGui::InputTextMultiline()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L584)
  def self.input_text_multiline(label : String, buf : Bytes, size : ImVec2 = ImVec2.new(0, 0), flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.InputTextMultiline(label, buf, buf.size, size, flags, callback, user_data)
  end

  # [ImGui::InputTextWithHint()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L585)
  def self.input_text_with_hint(label : String, hint : String, buf : Bytes, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.InputTextWithHint(label, hint, buf, buf.size, flags, callback, user_data)
  end

  # [ImGui::InputFloat()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L586)
  pointer_wrapper def self.input_float(label : String, v : Float32*, step : Float32 = 0.0, step_fast : Float32 = 0.0, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputFloat(label, v, step, step_fast, format, flags)
  end
  # [ImGui::InputFloat2()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L587)
  pointer_wrapper def self.input_float2(label : String, v : ImVec2* | Indexable(Float32) | Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputFloat2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Float32*), format, flags)
  end
  # [ImGui::InputFloat3()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L588)
  pointer_wrapper def self.input_float3(label : String, v : Indexable(Float32) | Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputFloat3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Float32*), format, flags)
  end
  # [ImGui::InputFloat4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L589)
  pointer_wrapper def self.input_float4(label : String, v : ImVec4* | Indexable(Float32) | Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputFloat4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Float32*), format, flags)
  end
  # [ImGui::InputInt()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L590)
  pointer_wrapper def self.input_int(label : String, v : Int32*, step : Int32 = 1, step_fast : Int32 = 100, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputInt(label, v, step, step_fast, flags)
  end
  # [ImGui::InputInt2()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L591)
  pointer_wrapper def self.input_int2(label : String, v : Indexable(Int32) | Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputInt2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Int32*), flags)
  end
  # [ImGui::InputInt3()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L592)
  pointer_wrapper def self.input_int3(label : String, v : Indexable(Int32) | Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputInt3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Int32*), flags)
  end
  # [ImGui::InputInt4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L593)
  pointer_wrapper def self.input_int4(label : String, v : Indexable(Int32) | Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputInt4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Int32*), flags)
  end
  # [ImGui::InputDouble()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L594)
  pointer_wrapper def self.input_double(label : String, v : Float64*, step : Float64 = 0.0, step_fast : Float64 = 0.0, format : String = "%.6f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputDouble(label, v, step, step_fast, format, flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  # [ImGui::InputScalar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L595)
  pointer_wrapper def self.input_scalar(label : String, p_data : {{t}}*, p_step : {{t}}? = nil, p_step_fast : {{t}}? = nil, format : String? = nil, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputScalar(label, ImGuiDataType::{{k.id}}, p_data, p_step ? (p_step_ = p_step; pointerof(p_step_)) : Pointer({{t}}).null, p_step_fast ? (p_step_fast_ = p_step_fast; pointerof(p_step_fast_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  # [ImGui::InputScalarN()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L596)
  pointer_wrapper def self.input_scalar_n(label : String, p_data : {{t}}*, components : Int32, p_step : {{t}}* = Pointer({{t}}).null, p_step_fast : {{t}}* = Pointer({{t}}).null, format : String? = nil, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.InputScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, p_step, p_step_fast, format, flags)
  end
  {% end %}
  # [ImGui::ColorEdit3()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L601)
  pointer_wrapper def self.color_edit3(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.ColorEdit3(label, col.is_a?(Indexable) ? (
      col.size == 3 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 3)")
    ) : col.as(Float32*), flags)
  end
  # [ImGui::ColorEdit4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L602)
  pointer_wrapper def self.color_edit4(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.ColorEdit4(label, col.is_a?(Indexable) ? (
      col.size == 4 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 4)")
    ) : col.as(Float32*), flags)
  end
  # [ImGui::ColorPicker3()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L603)
  pointer_wrapper def self.color_picker3(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.ColorPicker3(label, col.is_a?(Indexable) ? (
      col.size == 3 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 3)")
    ) : col.as(Float32*), flags)
  end
  # [ImGui::ColorPicker4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L604)
  pointer_wrapper def self.color_picker4(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0), ref_col : Float32* = Pointer(Float32).null) : Bool
    LibImGui.ColorPicker4(label, col.is_a?(Indexable) ? (
      col.size == 4 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 4)")
    ) : col.as(Float32*), flags, ref_col)
  end

  # display a color square/button, hover for details, return true when pressed.
  #
  # [ImGui::ColorButton()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L605)
  def self.color_button(desc_id : String, col : ImVec4, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.ColorButton(desc_id, col, flags, size)
  end

  # initialize current options (generally on application startup) if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls.
  #
  # [ImGui::SetColorEditOptions()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L606)
  def self.set_color_edit_options(flags : ImGuiColorEditFlags) : Void
    LibImGui.SetColorEditOptions(flags)
  end

  # [ImGui::TreeNode()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L610)
  def self.tree_node(label : String) : Bool
    LibImGui.TreeNode_Str(label)
  end

  # Calls `tree_node`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node(label : String) : Nil
    return unless self.tree_node(label)
    yield
    self.tree_pop
  end

  # helper variation to easily decorelate the id from the displayed string. Read the FAQ about why and how to use ID. to align arbitrary text at the same level as a TreeNode() you can use Bullet().
  #
  # [ImGui::TreeNode()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L611)
  def self.tree_node(str_id : String, fmt : String, *args) : Bool
    LibImGui.TreeNode_StrStr(str_id, fmt, *args._promote_va_args)
  end

  # Calls `tree_node`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node(str_id : String, fmt : String, *args) : Nil
    return unless self.tree_node(str_id, fmt, *args)
    yield
    self.tree_pop
  end

  # "
  #
  # [ImGui::TreeNode()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L612)
  def self.tree_node(ptr_id : Reference | ClassType | Int | Void*, fmt : String, *args) : Bool
    LibImGui.TreeNode_Ptr(to_void_id(ptr_id), fmt, *args._promote_va_args)
  end

  # Calls `tree_node`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node(ptr_id : Reference | ClassType | Int | Void*, fmt : String, *args) : Nil
    return unless self.tree_node(ptr_id, fmt, *args)
    yield
    self.tree_pop
  end

  # [ImGui::TreeNodeEx()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L615)
  def self.tree_node_ex(label : String, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.TreeNodeEx_Str(label, flags)
  end

  # Calls `tree_node_ex`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node_ex(label : String, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Nil
    return unless self.tree_node_ex(label, flags)
    yield
    self.tree_pop
  end

  # [ImGui::TreeNodeEx()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L616)
  def self.tree_node_ex(str_id : String, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Bool
    LibImGui.TreeNodeEx_StrStr(str_id, flags, fmt, *args._promote_va_args)
  end

  # Calls `tree_node_ex`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node_ex(str_id : String, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Nil
    return unless self.tree_node_ex(str_id, flags, fmt, *args)
    yield
    self.tree_pop
  end

  # [ImGui::TreeNodeEx()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L617)
  def self.tree_node_ex(ptr_id : Reference | ClassType | Int | Void*, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Bool
    LibImGui.TreeNodeEx_Ptr(to_void_id(ptr_id), flags, fmt, *args._promote_va_args)
  end

  # Calls `tree_node_ex`, conditionally yields to the block, then conditionally calls `tree_pop`.
  def self.tree_node_ex(ptr_id : Reference | ClassType | Int | Void*, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Nil
    return unless self.tree_node_ex(ptr_id, flags, fmt, *args)
    yield
    self.tree_pop
  end

  # ~ Indent()+PushId(). Already called by TreeNode() when returning true, but you can call TreePush/TreePop yourself if desired.
  #
  # [ImGui::TreePush()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L620)
  def self.tree_push(str_id : String) : Void
    LibImGui.TreePush_Str(str_id)
  end

  # Calls `tree_push`, yields to the block, then calls `tree_pop`.
  def self.with_tree(str_id : String) : Nil
    self.tree_push(str_id)
    yield
    self.tree_pop
  end

  # "
  #
  # [ImGui::TreePush()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L621)
  def self.tree_push(ptr_id : Reference | ClassType | Int | Void*) : Void
    LibImGui.TreePush_Ptr(to_void_id(ptr_id))
  end

  # Calls `tree_push`, yields to the block, then calls `tree_pop`.
  def self.with_tree(ptr_id : Reference | ClassType | Int | Void*) : Nil
    self.tree_push(ptr_id)
    yield
    self.tree_pop
  end

  # ~ Unindent()+PopId()
  #
  # [ImGui::TreePop()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L622)
  def self.tree_pop : Void
    LibImGui.TreePop
  end

  # horizontal distance preceding label when using TreeNode*() or Bullet() == (g.FontSize + style.FramePadding.x*2) for a regular unframed TreeNode
  #
  # [ImGui::GetTreeNodeToLabelSpacing()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L623)
  def self.get_tree_node_to_label_spacing : Float32
    LibImGui.GetTreeNodeToLabelSpacing
  end

  # if returning 'true' the header is open. doesn't indent nor push on ID stack. user doesn't have to call TreePop().
  #
  # [ImGui::CollapsingHeader()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L624)
  pointer_wrapper def self.collapsing_header(label : String, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.CollapsingHeader_TreeNodeFlags(label, flags)
  end
  # when 'p_visible != NULL': if '*p_visible==true' display an additional small close button on upper right of the header which will set the bool to false when clicked, if '*p_visible==false' don't display the header.
  #
  # [ImGui::CollapsingHeader()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L625)
  pointer_wrapper def self.collapsing_header(label : String, p_visible : Bool*, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.CollapsingHeader_BoolPtr(label, p_visible, flags)
  end

  # set next TreeNode/CollapsingHeader open state.
  #
  # [ImGui::SetNextItemOpen()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L626)
  def self.set_next_item_open(is_open : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.SetNextItemOpen(is_open, cond)
  end

  # "bool selected" carry the selection state (read-only). Selectable() is clicked is returns true so you can modify your selection state. size.x==0.0: use remaining width, size.x>0.0: specify width. size.y==0.0: use label height, size.y>0.0: specify height
  #
  # [ImGui::Selectable()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L631)
  pointer_wrapper def self.selectable(label : String, selected : Bool = false, flags : ImGuiSelectableFlags = ImGuiSelectableFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.Selectable_Bool(label, selected, flags, size)
  end
  # "bool* p_selected" point to the selection state (read-write), as a convenient helper.
  #
  # [ImGui::Selectable()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L632)
  pointer_wrapper def self.selectable(label : String, p_selected : Bool*, flags : ImGuiSelectableFlags = ImGuiSelectableFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.Selectable_BoolPtr(label, p_selected, flags, size)
  end

  # open a framed scrolling region
  #
  # [ImGui::BeginListBox()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L640)
  def self.begin_list_box(label : String, size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.BeginListBox(label, size)
  end

  # Calls `begin_list_box`, conditionally yields to the block, then conditionally calls `end_list_box`.
  def self.list_box(label : String, size : ImVec2 = ImVec2.new(0, 0)) : Nil
    return unless self.begin_list_box(label, size)
    yield
    self.end_list_box
  end

  # only call EndListBox() if BeginListBox() returned true!
  #
  # [ImGui::EndListBox()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L641)
  def self.end_list_box : Void
    LibImGui.EndListBox
  end

  # [ImGui::ListBox()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L642)
  pointer_wrapper def self.list_box(label : String, current_item : Int32* | Pointer, items : Indexable(LibC::Char*), height_in_items : Int32 = -1) : Bool
    LibImGui.ListBox_Str_arr(label, (typeof(current_item.value.to_i32); current_item.as(Int32*)), items, items.size, height_in_items)
  end
  # [ImGui::ListBox()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L643)
  pointer_wrapper def self.list_box(label : String, current_item : Int32* | Pointer, items_getter : (Void*, Int32, LibC::Char**) -> Bool, data : Void*, items_count : Int32, height_in_items : Int32 = -1) : Bool
    LibImGui.ListBox_FnBoolPtr(label, (typeof(current_item.value.to_i32); current_item.as(Int32*)), items_getter, data, items_count, height_in_items)
  end

  # [ImGui::PlotLines()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L647)
  def self.plot_lines(label : String, values : Indexable(Float32), values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0), stride : Int32 = sizeof(Float32)) : Void
    LibImGui.PlotLines_FloatPtr(label, values, values.size, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
  end

  # [ImGui::PlotLines()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L648)
  def self.plot_lines(label : String, values_getter : (Void*, Int32) -> Float32, data : Void*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.PlotLines_FnFloatPtr(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
  end

  # [ImGui::PlotHistogram()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L649)
  def self.plot_histogram(label : String, values : Indexable(Float32), values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0), stride : Int32 = sizeof(Float32)) : Void
    LibImGui.PlotHistogram_FloatPtr(label, values, values.size, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
  end

  # [ImGui::PlotHistogram()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L650)
  def self.plot_histogram(label : String, values_getter : (Void*, Int32) -> Float32, data : Void*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.PlotHistogram_FnFloatPtr(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
  end

  # [ImGui::Value()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L654)
  def self.value(prefix : String, b : Bool) : Void
    LibImGui.Value_Bool(prefix, b)
  end

  # [ImGui::Value()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L655)
  def self.value(prefix : String, v : Int32) : Void
    LibImGui.Value_Int(prefix, v)
  end

  # [ImGui::Value()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L656)
  def self.value(prefix : String, v : UInt32) : Void
    LibImGui.Value_Uint(prefix, v)
  end

  # [ImGui::Value()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L657)
  def self.value(prefix : String, v : Float32, float_format : String? = nil) : Void
    LibImGui.Value_Float(prefix, v, float_format)
  end

  # append to menu-bar of current window (requires ImGuiWindowFlags_MenuBar flag set on parent window).
  #
  # [ImGui::BeginMenuBar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L664)
  def self.begin_menu_bar : Bool
    LibImGui.BeginMenuBar
  end

  # Calls `begin_menu_bar`, conditionally yields to the block, then conditionally calls `end_menu_bar`.
  def self.menu_bar : Nil
    return unless self.begin_menu_bar
    yield
    self.end_menu_bar
  end

  # only call EndMenuBar() if BeginMenuBar() returns true!
  #
  # [ImGui::EndMenuBar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L665)
  def self.end_menu_bar : Void
    LibImGui.EndMenuBar
  end

  # create and append to a full screen menu-bar.
  #
  # [ImGui::BeginMainMenuBar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L666)
  def self.begin_main_menu_bar : Bool
    LibImGui.BeginMainMenuBar
  end

  # Calls `begin_main_menu_bar`, conditionally yields to the block, then conditionally calls `end_main_menu_bar`.
  def self.main_menu_bar : Nil
    return unless self.begin_main_menu_bar
    yield
    self.end_main_menu_bar
  end

  # only call EndMainMenuBar() if BeginMainMenuBar() returns true!
  #
  # [ImGui::EndMainMenuBar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L667)
  def self.end_main_menu_bar : Void
    LibImGui.EndMainMenuBar
  end

  # create a sub-menu entry. only call EndMenu() if this returns true!
  #
  # [ImGui::BeginMenu()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L668)
  def self.begin_menu(label : String, enabled : Bool = true) : Bool
    LibImGui.BeginMenu(label, enabled)
  end

  # Calls `begin_menu`, conditionally yields to the block, then conditionally calls `end_menu`.
  def self.menu(label : String, enabled : Bool = true) : Nil
    return unless self.begin_menu(label, enabled)
    yield
    self.end_menu
  end

  # only call EndMenu() if BeginMenu() returns true!
  #
  # [ImGui::EndMenu()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L669)
  def self.end_menu : Void
    LibImGui.EndMenu
  end

  # return true when activated.
  #
  # [ImGui::MenuItem()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L670)
  pointer_wrapper def self.menu_item(label : String, shortcut : String? = nil, selected : Bool = false, enabled : Bool = true) : Bool
    LibImGui.MenuItem_Bool(label, shortcut, selected, enabled)
  end
  # return true when activated + toggle (*p_selected) if p_selected != NULL
  #
  # [ImGui::MenuItem()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L671)
  pointer_wrapper def self.menu_item(label : String, shortcut : String, p_selected : Bool*, enabled : Bool = true) : Bool
    LibImGui.MenuItem_BoolPtr(label, shortcut, p_selected, enabled)
  end

  # begin/append a tooltip window.
  #
  # [ImGui::BeginTooltip()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L676)
  def self.begin_tooltip : Bool
    LibImGui.BeginTooltip
  end

  # Calls `begin_tooltip`, conditionally yields to the block, then calls `end_tooltip`.
  def self.tooltip : Nil
    yield if self.begin_tooltip
    self.end_tooltip
  end

  # only call EndTooltip() if BeginTooltip()/BeginItemTooltip() returns true!
  #
  # [ImGui::EndTooltip()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L677)
  def self.end_tooltip : Void
    LibImGui.EndTooltip
  end

  # set a text-only tooltip. Often used after a ImGui::IsItemHovered() check. Override any previous call to SetTooltip().
  #
  # [ImGui::SetTooltip()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L678)
  def self.set_tooltip(fmt : String, *args) : Void
    LibImGui.SetTooltip(fmt, *args._promote_va_args)
  end

  # begin/append a tooltip window if preceding item was hovered.
  #
  # [ImGui::BeginItemTooltip()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L685)
  def self.begin_item_tooltip : Bool
    LibImGui.BeginItemTooltip
  end

  # set a text-only tooltip if preceeding item was hovered. override any previous call to SetTooltip().
  #
  # [ImGui::SetItemTooltip()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L686)
  def self.set_item_tooltip(fmt : String, *args) : Void
    LibImGui.SetItemTooltip(fmt, *args._promote_va_args)
  end

  # return true if the popup is open, and you can start outputting to it.
  #
  # [ImGui::BeginPopup()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L701)
  def self.begin_popup(str_id : String, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.BeginPopup(str_id, flags)
  end

  # Calls `begin_popup`, conditionally yields to the block, then conditionally calls `end_popup`.
  def self.popup(str_id : String, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Nil
    return unless self.begin_popup(str_id, flags)
    yield
    self.end_popup
  end

  # return true if the modal is open, and you can start outputting to it.
  #
  # [ImGui::BeginPopupModal()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L702)
  pointer_wrapper def self.begin_popup_modal(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.BeginPopupModal(name, p_open, flags)
  end
  # Calls `begin_popup_modal`, conditionally yields to the block, then conditionally calls `end_popup`.
  pointer_wrapper def self.popup_modal(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Nil
    return unless self.begin_popup_modal(name, p_open, flags)
    yield
    self.end_popup
  end

  # only call EndPopup() if BeginPopupXXX() returns true!
  #
  # [ImGui::EndPopup()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L703)
  def self.end_popup : Void
    LibImGui.EndPopup
  end

  # call to mark popup as open (don't call every frame!).
  #
  # [ImGui::OpenPopup()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L713)
  def self.open_popup(str_id : String, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(0)) : Void
    LibImGui.OpenPopup_Str(str_id, popup_flags)
  end

  # id overload to facilitate calling from nested stacks
  #
  # [ImGui::OpenPopup()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L714)
  def self.open_popup(id : ImGuiID, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(0)) : Void
    LibImGui.OpenPopup_ID(id, popup_flags)
  end

  # helper to open popup when clicked on last item. Default to ImGuiPopupFlags_MouseButtonRight == 1. (note: actually triggers on the mouse _released_ event to be consistent with popup behaviors)
  #
  # [ImGui::OpenPopupOnItemClick()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L715)
  def self.open_popup_on_item_click(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Void
    LibImGui.OpenPopupOnItemClick(str_id, popup_flags)
  end

  # manually close the popup we have begin-ed into.
  #
  # [ImGui::CloseCurrentPopup()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L716)
  def self.close_current_popup : Void
    LibImGui.CloseCurrentPopup
  end

  # open+begin popup when clicked on last item. Use str_id==NULL to associate the popup to previous item. If you want to use that on a non-interactive item such as Text() you need to pass in an explicit ID here. read comments in .cpp!
  #
  # [ImGui::BeginPopupContextItem()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L723)
  def self.begin_popup_context_item(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.BeginPopupContextItem(str_id, popup_flags)
  end

  # Calls `begin_popup_context_item`, conditionally yields to the block, then conditionally calls `end_popup`.
  def self.popup_context_item(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Nil
    return unless self.begin_popup_context_item(str_id, popup_flags)
    yield
    self.end_popup
  end

  # open+begin popup when clicked on current window.
  #
  # [ImGui::BeginPopupContextWindow()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L724)
  def self.begin_popup_context_window(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.BeginPopupContextWindow(str_id, popup_flags)
  end

  # Calls `begin_popup_context_window`, conditionally yields to the block, then conditionally calls `end_popup`.
  def self.popup_context_window(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Nil
    return unless self.begin_popup_context_window(str_id, popup_flags)
    yield
    self.end_popup
  end

  # open+begin popup when clicked in void (where there are no windows).
  #
  # [ImGui::BeginPopupContextVoid()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L725)
  def self.begin_popup_context_void(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.BeginPopupContextVoid(str_id, popup_flags)
  end

  # Calls `begin_popup_context_void`, conditionally yields to the block, then conditionally calls `end_popup`.
  def self.popup_context_void(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Nil
    return unless self.begin_popup_context_void(str_id, popup_flags)
    yield
    self.end_popup
  end

  # return true if the popup is open.
  #
  # [ImGui::IsPopupOpen()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L731)
  def self.is_popup_open(str_id : String, flags : ImGuiPopupFlags = ImGuiPopupFlags.new(0)) : Bool
    LibImGui.IsPopupOpen_Str(str_id, flags)
  end

  # [ImGui::BeginTable()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L756)
  def self.begin_table(str_id : String, column : Int32, flags : ImGuiTableFlags = ImGuiTableFlags.new(0), outer_size : ImVec2 = ImVec2.new(0.0, 0.0), inner_width : Float32 = 0.0) : Bool
    LibImGui.BeginTable(str_id, column, flags, outer_size, inner_width)
  end

  # Calls `begin_table`, conditionally yields to the block, then conditionally calls `end_table`.
  def self.table(str_id : String, column : Int32, flags : ImGuiTableFlags = ImGuiTableFlags.new(0), outer_size : ImVec2 = ImVec2.new(0.0, 0.0), inner_width : Float32 = 0.0) : Nil
    return unless self.begin_table(str_id, column, flags, outer_size, inner_width)
    yield
    self.end_table
  end

  # only call EndTable() if BeginTable() returns true!
  #
  # [ImGui::EndTable()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L757)
  def self.end_table : Void
    LibImGui.EndTable
  end

  # append into the first cell of a new row.
  #
  # [ImGui::TableNextRow()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L758)
  def self.table_next_row(row_flags : ImGuiTableRowFlags = ImGuiTableRowFlags.new(0), min_row_height : Float32 = 0.0) : Void
    LibImGui.TableNextRow(row_flags, min_row_height)
  end

  # append into the next column (or first column of next row if currently in last column). Return true when column is visible.
  #
  # [ImGui::TableNextColumn()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L759)
  def self.table_next_column : Bool
    LibImGui.TableNextColumn
  end

  # append into the specified column. Return true when column is visible.
  #
  # [ImGui::TableSetColumnIndex()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L760)
  def self.table_set_column_index(column_n : Int32) : Bool
    LibImGui.TableSetColumnIndex(column_n)
  end

  # [ImGui::TableSetupColumn()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L770)
  def self.table_setup_column(label : String, flags : ImGuiTableColumnFlags = ImGuiTableColumnFlags.new(0), init_width_or_weight : Float32 = 0.0, user_id : ImGuiID = 0) : Void
    LibImGui.TableSetupColumn(label, flags, init_width_or_weight, user_id)
  end

  # lock columns/rows so they stay visible when scrolled.
  #
  # [ImGui::TableSetupScrollFreeze()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L771)
  def self.table_setup_scroll_freeze(cols : Int32, rows : Int32) : Void
    LibImGui.TableSetupScrollFreeze(cols, rows)
  end

  # submit all headers cells based on data provided to TableSetupColumn() + submit context menu
  #
  # [ImGui::TableHeadersRow()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L772)
  def self.table_headers_row : Void
    LibImGui.TableHeadersRow
  end

  # submit one header cell manually (rarely used)
  #
  # [ImGui::TableHeader()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L773)
  def self.table_header(label : String) : Void
    LibImGui.TableHeader(label)
  end

  # get latest sort specs for the table (NULL if not sorting).  Lifetime: don't hold on this pointer over multiple frames or past any subsequent call to BeginTable().
  #
  # [ImGui::TableGetSortSpecs()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L781)
  def self.table_get_sort_specs : ImGuiTableSortSpecs?
    result = LibImGui.TableGetSortSpecs
    result ? ImGuiTableSortSpecs.new(result) : nil
  end

  # return number of columns (value passed to BeginTable)
  #
  # [ImGui::TableGetColumnCount()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L782)
  def self.table_get_column_count : Int32
    LibImGui.TableGetColumnCount
  end

  # return current column index.
  #
  # [ImGui::TableGetColumnIndex()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L783)
  def self.table_get_column_index : Int32
    LibImGui.TableGetColumnIndex
  end

  # return current row index.
  #
  # [ImGui::TableGetRowIndex()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L784)
  def self.table_get_row_index : Int32
    LibImGui.TableGetRowIndex
  end

  # return "" if column didn't have a name declared by TableSetupColumn(). Pass -1 to use current column.
  #
  # [ImGui::TableGetColumnName()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L785)
  def self.table_get_column_name(column_n : Int32 = -1) : String
    result = LibImGui.TableGetColumnName_Int(column_n)
    String.new(result)
  end

  # return column flags so you can query their Enabled/Visible/Sorted/Hovered status flags. Pass -1 to use current column.
  #
  # [ImGui::TableGetColumnFlags()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L786)
  def self.table_get_column_flags(column_n : Int32 = -1) : ImGuiTableColumnFlags
    LibImGui.TableGetColumnFlags(column_n)
  end

  # change user accessible enabled/disabled state of a column. Set to false to hide the column. User can use the context menu to change this themselves (right-click in headers, or right-click in columns body with ImGuiTableFlags_ContextMenuInBody)
  #
  # [ImGui::TableSetColumnEnabled()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L787)
  def self.table_set_column_enabled(column_n : Int32, v : Bool) : Void
    LibImGui.TableSetColumnEnabled(column_n, v)
  end

  # change the color of a cell, row, or column. See ImGuiTableBgTarget_ flags for details.
  #
  # [ImGui::TableSetBgColor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L788)
  def self.table_set_bg_color(target : ImGuiTableBgTarget, color : UInt32, column_n : Int32 = -1) : Void
    LibImGui.TableSetBgColor(target, color, column_n)
  end

  # [ImGui::Columns()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L792)
  def self.columns(count : Int32 = 1, id : String? = nil, border : Bool = true) : Void
    LibImGui.Columns(count, id, border)
  end

  # next column, defaults to current row or next row if the current row is finished
  #
  # [ImGui::NextColumn()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L793)
  def self.next_column : Void
    LibImGui.NextColumn
  end

  # get current column index
  #
  # [ImGui::GetColumnIndex()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L794)
  def self.get_column_index : Int32
    LibImGui.GetColumnIndex
  end

  # get column width (in pixels). pass -1 to use current column
  #
  # [ImGui::GetColumnWidth()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L795)
  def self.get_column_width(column_index : Int32 = -1) : Float32
    LibImGui.GetColumnWidth(column_index)
  end

  # set column width (in pixels). pass -1 to use current column
  #
  # [ImGui::SetColumnWidth()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L796)
  def self.set_column_width(column_index : Int32, width : Float32) : Void
    LibImGui.SetColumnWidth(column_index, width)
  end

  # get position of column line (in pixels, from the left side of the contents region). pass -1 to use current column, otherwise 0..GetColumnsCount() inclusive. column 0 is typically 0.0f
  #
  # [ImGui::GetColumnOffset()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L797)
  def self.get_column_offset(column_index : Int32 = -1) : Float32
    LibImGui.GetColumnOffset(column_index)
  end

  # set position of column line (in pixels, from the left side of the contents region). pass -1 to use current column
  #
  # [ImGui::SetColumnOffset()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L798)
  def self.set_column_offset(column_index : Int32, offset_x : Float32) : Void
    LibImGui.SetColumnOffset(column_index, offset_x)
  end

  # [ImGui::GetColumnsCount()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L799)
  def self.get_columns_count : Int32
    LibImGui.GetColumnsCount
  end

  # create and append into a TabBar
  #
  # [ImGui::BeginTabBar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L803)
  def self.begin_tab_bar(str_id : String, flags : ImGuiTabBarFlags = ImGuiTabBarFlags.new(0)) : Bool
    LibImGui.BeginTabBar(str_id, flags)
  end

  # Calls `begin_tab_bar`, conditionally yields to the block, then conditionally calls `end_tab_bar`.
  def self.tab_bar(str_id : String, flags : ImGuiTabBarFlags = ImGuiTabBarFlags.new(0)) : Nil
    return unless self.begin_tab_bar(str_id, flags)
    yield
    self.end_tab_bar
  end

  # only call EndTabBar() if BeginTabBar() returns true!
  #
  # [ImGui::EndTabBar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L804)
  def self.end_tab_bar : Void
    LibImGui.EndTabBar
  end

  # create a Tab. Returns true if the Tab is selected.
  #
  # [ImGui::BeginTabItem()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L805)
  pointer_wrapper def self.begin_tab_item(label : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiTabItemFlags = ImGuiTabItemFlags.new(0)) : Bool
    LibImGui.BeginTabItem(label, p_open, flags)
  end
  # Calls `begin_tab_item`, conditionally yields to the block, then conditionally calls `end_tab_item`.
  pointer_wrapper def self.tab_item(label : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiTabItemFlags = ImGuiTabItemFlags.new(0)) : Nil
    return unless self.begin_tab_item(label, p_open, flags)
    yield
    self.end_tab_item
  end

  # only call EndTabItem() if BeginTabItem() returns true!
  #
  # [ImGui::EndTabItem()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L806)
  def self.end_tab_item : Void
    LibImGui.EndTabItem
  end

  # create a Tab behaving like a button. return true when clicked. cannot be selected in the tab bar.
  #
  # [ImGui::TabItemButton()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L807)
  def self.tab_item_button(label : String, flags : ImGuiTabItemFlags = ImGuiTabItemFlags.new(0)) : Bool
    LibImGui.TabItemButton(label, flags)
  end

  # notify TabBar or Docking system of a closed tab/window ahead (useful to reduce visual flicker on reorderable tab bars). For tab-bar: call after BeginTabBar() and before Tab submissions. Otherwise call with a window name.
  #
  # [ImGui::SetTabItemClosed()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L808)
  def self.set_tab_item_closed(tab_or_docked_window_label : String) : Void
    LibImGui.SetTabItemClosed(tab_or_docked_window_label)
  end

  # start logging to tty (stdout)
  #
  # [ImGui::LogToTTY()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L812)
  def self.log_to_tty(auto_open_depth : Int32 = -1) : Void
    LibImGui.LogToTTY(auto_open_depth)
  end

  # start logging to file
  #
  # [ImGui::LogToFile()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L813)
  def self.log_to_file(auto_open_depth : Int32 = -1, filename : String? = nil) : Void
    LibImGui.LogToFile(auto_open_depth, filename)
  end

  # start logging to OS clipboard
  #
  # [ImGui::LogToClipboard()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L814)
  def self.log_to_clipboard(auto_open_depth : Int32 = -1) : Void
    LibImGui.LogToClipboard(auto_open_depth)
  end

  # stop logging (close file, etc.)
  #
  # [ImGui::LogFinish()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L815)
  def self.log_finish : Void
    LibImGui.LogFinish
  end

  # helper to display buttons for logging to tty/file/clipboard
  #
  # [ImGui::LogButtons()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L816)
  def self.log_buttons : Void
    LibImGui.LogButtons
  end

  # pass text data straight to log (without being displayed)
  #
  # [ImGui::LogText()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L817)
  def self.log_text(fmt : String, *args) : Void
    LibImGui.LogText(fmt, *args._promote_va_args)
  end

  # call after submitting an item which may be dragged. when this return true, you can call SetDragDropPayload() + EndDragDropSource()
  #
  # [ImGui::BeginDragDropSource()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L825)
  def self.begin_drag_drop_source(flags : ImGuiDragDropFlags = ImGuiDragDropFlags.new(0)) : Bool
    LibImGui.BeginDragDropSource(flags)
  end

  # Calls `begin_drag_drop_source`, conditionally yields to the block, then conditionally calls `end_drag_drop_source`.
  def self.drag_drop_source(flags : ImGuiDragDropFlags = ImGuiDragDropFlags.new(0)) : Nil
    return unless self.begin_drag_drop_source(flags)
    yield
    self.end_drag_drop_source
  end

  # type is a user defined string of maximum 32 characters. Strings starting with '_' are reserved for dear imgui internal types. Data is copied and held by imgui. Return true when payload has been accepted.
  #
  # [ImGui::SetDragDropPayload()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L826)
  def self.set_drag_drop_payload(type : String, data : Void*, sz : LibC::SizeT, cond : ImGuiCond = ImGuiCond.new(0)) : Bool
    LibImGui.SetDragDropPayload(type, data, sz, cond)
  end

  # only call EndDragDropSource() if BeginDragDropSource() returns true!
  #
  # [ImGui::EndDragDropSource()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L827)
  def self.end_drag_drop_source : Void
    LibImGui.EndDragDropSource
  end

  # call after submitting an item that may receive a payload. If this returns true, you can call AcceptDragDropPayload() + EndDragDropTarget()
  #
  # [ImGui::BeginDragDropTarget()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L828)
  def self.begin_drag_drop_target : Bool
    LibImGui.BeginDragDropTarget
  end

  # Calls `begin_drag_drop_target`, conditionally yields to the block, then conditionally calls `end_drag_drop_target`.
  def self.drag_drop_target : Nil
    return unless self.begin_drag_drop_target
    yield
    self.end_drag_drop_target
  end

  # accept contents of a given type. If ImGuiDragDropFlags_AcceptBeforeDelivery is set you can peek into the payload before the mouse button is released.
  #
  # [ImGui::AcceptDragDropPayload()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L829)
  def self.accept_drag_drop_payload(type : String, flags : ImGuiDragDropFlags = ImGuiDragDropFlags.new(0)) : ImGuiPayload?
    result = LibImGui.AcceptDragDropPayload(type, flags)
    result ? ImGuiPayload.new(result) : nil
  end

  # only call EndDragDropTarget() if BeginDragDropTarget() returns true!
  #
  # [ImGui::EndDragDropTarget()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L830)
  def self.end_drag_drop_target : Void
    LibImGui.EndDragDropTarget
  end

  # peek directly into the current payload from anywhere. may return NULL. use ImGuiPayload::IsDataType() to test for the payload type.
  #
  # [ImGui::GetDragDropPayload()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L831)
  def self.get_drag_drop_payload : ImGuiPayload?
    result = LibImGui.GetDragDropPayload
    result ? ImGuiPayload.new(result) : nil
  end

  # [ImGui::BeginDisabled()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L837)
  def self.begin_disabled(disabled : Bool = true) : Void
    LibImGui.BeginDisabled(disabled)
  end

  # Calls `begin_disabled`, yields to the block, then calls `end_disabled`.
  def self.disabled(disabled : Bool = true) : Nil
    self.begin_disabled(disabled)
    yield
    self.end_disabled
  end

  # [ImGui::EndDisabled()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L838)
  def self.end_disabled : Void
    LibImGui.EndDisabled
  end

  # [ImGui::PushClipRect()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L842)
  def self.push_clip_rect(clip_rect_min : ImVec2, clip_rect_max : ImVec2, intersect_with_current_clip_rect : Bool) : Void
    LibImGui.PushClipRect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
  end

  # Calls `push_clip_rect`, yields to the block, then calls `pop_clip_rect`.
  def self.with_clip_rect(clip_rect_min : ImVec2, clip_rect_max : ImVec2, intersect_with_current_clip_rect : Bool) : Nil
    self.push_clip_rect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
    yield
    self.pop_clip_rect
  end

  # [ImGui::PopClipRect()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L843)
  def self.pop_clip_rect : Void
    LibImGui.PopClipRect
  end

  # make last item the default focused item of a window.
  #
  # [ImGui::SetItemDefaultFocus()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L847)
  def self.set_item_default_focus : Void
    LibImGui.SetItemDefaultFocus
  end

  # focus keyboard on the next widget. Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.
  #
  # [ImGui::SetKeyboardFocusHere()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L848)
  def self.set_keyboard_focus_here(offset : Int32 = 0) : Void
    LibImGui.SetKeyboardFocusHere(offset)
  end

  # allow next item to be overlapped by a subsequent item. Useful with invisible buttons, selectable, treenode covering an area where subsequent items may need to be added. Note that both Selectable() and TreeNode() have dedicated flags doing this.
  #
  # [ImGui::SetNextItemAllowOverlap()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L851)
  def self.set_next_item_allow_overlap : Void
    LibImGui.SetNextItemAllowOverlap
  end

  # is the last item hovered? (and usable, aka not blocked by a popup, etc.). See ImGuiHoveredFlags for more options.
  #
  # [ImGui::IsItemHovered()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L856)
  def self.is_item_hovered(flags : ImGuiHoveredFlags = ImGuiHoveredFlags.new(0)) : Bool
    LibImGui.IsItemHovered(flags)
  end

  # is the last item active? (e.g. button being held, text field being edited. This will continuously return true while holding mouse button on an item. Items that don't interact will always return false)
  #
  # [ImGui::IsItemActive()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L857)
  def self.is_item_active : Bool
    LibImGui.IsItemActive
  end

  # is the last item focused for keyboard/gamepad navigation?
  #
  # [ImGui::IsItemFocused()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L858)
  def self.is_item_focused : Bool
    LibImGui.IsItemFocused
  end

  # is the last item hovered and mouse clicked on? (**)  == IsMouseClicked(mouse_button) && IsItemHovered()Important. (**) this is NOT equivalent to the behavior of e.g. Button(). Read comments in function definition.
  #
  # [ImGui::IsItemClicked()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L859)
  def self.is_item_clicked(mouse_button : ImGuiMouseButton = ImGuiMouseButton.new(0)) : Bool
    LibImGui.IsItemClicked(mouse_button)
  end

  # is the last item visible? (items may be out of sight because of clipping/scrolling)
  #
  # [ImGui::IsItemVisible()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L860)
  def self.is_item_visible : Bool
    LibImGui.IsItemVisible
  end

  # did the last item modify its underlying value this frame? or was pressed? This is generally the same as the "bool" return value of many widgets.
  #
  # [ImGui::IsItemEdited()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L861)
  def self.is_item_edited : Bool
    LibImGui.IsItemEdited
  end

  # was the last item just made active (item was previously inactive).
  #
  # [ImGui::IsItemActivated()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L862)
  def self.is_item_activated : Bool
    LibImGui.IsItemActivated
  end

  # was the last item just made inactive (item was previously active). Useful for Undo/Redo patterns with widgets that require continuous editing.
  #
  # [ImGui::IsItemDeactivated()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L863)
  def self.is_item_deactivated : Bool
    LibImGui.IsItemDeactivated
  end

  # was the last item just made inactive and made a value change when it was active? (e.g. Slider/Drag moved). Useful for Undo/Redo patterns with widgets that require continuous editing. Note that you may get false positives (some widgets such as Combo()/ListBox()/Selectable() will return true even when clicking an already selected item).
  #
  # [ImGui::IsItemDeactivatedAfterEdit()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L864)
  def self.is_item_deactivated_after_edit : Bool
    LibImGui.IsItemDeactivatedAfterEdit
  end

  # was the last item open state toggled? set by TreeNode().
  #
  # [ImGui::IsItemToggledOpen()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L865)
  def self.is_item_toggled_open : Bool
    LibImGui.IsItemToggledOpen
  end

  # is any item hovered?
  #
  # [ImGui::IsAnyItemHovered()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L866)
  def self.is_any_item_hovered : Bool
    LibImGui.IsAnyItemHovered
  end

  # is any item active?
  #
  # [ImGui::IsAnyItemActive()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L867)
  def self.is_any_item_active : Bool
    LibImGui.IsAnyItemActive
  end

  # is any item focused?
  #
  # [ImGui::IsAnyItemFocused()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L868)
  def self.is_any_item_focused : Bool
    LibImGui.IsAnyItemFocused
  end

  # get ID of last item (~~ often same ImGui::GetID(label) beforehand)
  #
  # [ImGui::GetItemID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L869)
  def self.get_item_id : ImGuiID
    LibImGui.GetItemID
  end

  # get upper-left bounding rectangle of the last item (screen space)
  #
  # [ImGui::GetItemRectMin()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L870)
  def self.get_item_rect_min : ImGui::ImVec2
    LibImGui.GetItemRectMin(out p_out)
    p_out
  end

  # get lower-right bounding rectangle of the last item (screen space)
  #
  # [ImGui::GetItemRectMax()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L871)
  def self.get_item_rect_max : ImGui::ImVec2
    LibImGui.GetItemRectMax(out p_out)
    p_out
  end

  # get size of last item
  #
  # [ImGui::GetItemRectSize()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L872)
  def self.get_item_rect_size : ImGui::ImVec2
    LibImGui.GetItemRectSize(out p_out)
    p_out
  end

  # return primary/default viewport. This can never be NULL.
  #
  # [ImGui::GetMainViewport()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L878)
  def self.get_main_viewport : ImGuiViewport
    result = LibImGui.GetMainViewport
    ImGuiViewport.new(result)
  end

  # this draw list will be the first rendered one. Useful to quickly draw shapes/text behind dear imgui contents.
  #
  # [ImGui::GetBackgroundDrawList()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L881)
  def self.get_background_draw_list : ImDrawList
    result = LibImGui.GetBackgroundDrawList_Nil
    ImDrawList.new(result)
  end

  # this draw list will be the last rendered one. Useful to quickly draw shapes/text over dear imgui contents.
  #
  # [ImGui::GetForegroundDrawList()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L882)
  def self.get_foreground_draw_list : ImDrawList
    result = LibImGui.GetForegroundDrawList_Nil
    ImDrawList.new(result)
  end

  # test if rectangle (of given size, starting from cursor position) is visible / not clipped.
  #
  # [ImGui::IsRectVisible()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L885)
  def self.is_rect_visible(size : ImVec2) : Bool
    LibImGui.IsRectVisible_Nil(size)
  end

  # test if rectangle (in screen space) is visible / not clipped. to perform coarse clipping on user's side.
  #
  # [ImGui::IsRectVisible()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L886)
  def self.is_rect_visible(rect_min : ImVec2, rect_max : ImVec2) : Bool
    LibImGui.IsRectVisible_Vec2(rect_min, rect_max)
  end

  # get global imgui time. incremented by io.DeltaTime every frame.
  #
  # [ImGui::GetTime()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L887)
  def self.get_time : Float64
    LibImGui.GetTime
  end

  # get global imgui frame count. incremented by 1 every frame.
  #
  # [ImGui::GetFrameCount()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L888)
  def self.get_frame_count : Int32
    LibImGui.GetFrameCount
  end

  # you may use this when creating your own ImDrawList instances.
  #
  # [ImGui::GetDrawListSharedData()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L889)
  def self.get_draw_list_shared_data : ImDrawListSharedData
    result = LibImGui.GetDrawListSharedData
    result.value
  end

  # get a string corresponding to the enum value (for display, saving, etc.).
  #
  # [ImGui::GetStyleColorName()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L890)
  def self.get_style_color_name(idx : ImGuiCol) : String
    result = LibImGui.GetStyleColorName(idx)
    String.new(result)
  end

  # replace current window storage with our own (if you want to manipulate it yourself, typically clear subsection of it)
  #
  # [ImGui::SetStateStorage()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L891)
  def self.set_state_storage(storage : ImGuiStorage*) : Void
    LibImGui.SetStateStorage(storage)
  end

  # [ImGui::GetStateStorage()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L892)
  def self.get_state_storage : ImGuiStorage
    result = LibImGui.GetStateStorage
    result.value
  end

  # helper to create a child window / scrolling region that looks like a normal widget frame
  #
  # [ImGui::BeginChildFrame()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L893)
  def self.begin_child_frame(id : ImGuiID, size : ImVec2, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.BeginChildFrame(id, size, flags)
  end

  # Calls `begin_child_frame`, conditionally yields to the block, then calls `end_child_frame`.
  def self.child_frame(id : ImGuiID, size : ImVec2, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Nil
    yield if self.begin_child_frame(id, size, flags)
    self.end_child_frame
  end

  # always call EndChildFrame() regardless of BeginChildFrame() return values (which indicates a collapsed/clipped window)
  #
  # [ImGui::EndChildFrame()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L894)
  def self.end_child_frame : Void
    LibImGui.EndChildFrame
  end

  # [ImGui::CalcTextSize()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L897)
  def self.calc_text_size(text : Bytes | String, hide_text_after_double_hash : Bool = false, wrap_width : Float32 = -1.0) : ImGui::ImVec2
    LibImGui.CalcTextSize(out p_out, text, (text.to_unsafe + text.bytesize), hide_text_after_double_hash, wrap_width)
    p_out
  end

  # [ImGui::ColorConvertU32ToFloat4()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L900)
  def self.color_convert_u32_to_float4(in_ : UInt32) : ImGui::ImVec4
    LibImGui.ColorConvertU32ToFloat4(out p_out, in_)
    p_out
  end

  # [ImGui::ColorConvertFloat4ToU32()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L901)
  def self.color_convert_float4_to_u32(in_ : ImVec4) : UInt32
    LibImGui.ColorConvertFloat4ToU32(in_)
  end

  # [ImGui::ColorConvertRGBtoHSV()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L902)
  def self.color_convert_rgb_to_hsv(r : Float32, g : Float32, b : Float32) : {LibC::Float, LibC::Float, LibC::Float}
    LibImGui.ColorConvertRGBtoHSV(r, g, b, out out_h, out out_s, out out_v)
    {out_h, out_s, out_v}
  end

  # [ImGui::ColorConvertHSVtoRGB()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L903)
  def self.color_convert_hsv_to_rgb(h : Float32, s : Float32, v : Float32) : {LibC::Float, LibC::Float, LibC::Float}
    LibImGui.ColorConvertHSVtoRGB(h, s, v, out out_r, out out_g, out out_b)
    {out_r, out_g, out_b}
  end

  # is key being held.
  #
  # [ImGui::IsKeyDown()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L910)
  def self.is_key_down(key : ImGuiKey) : Bool
    LibImGui.IsKeyDown_Nil(key)
  end

  # was key pressed (went from !Down to Down)? if repeat=true, uses io.KeyRepeatDelay / KeyRepeatRate
  #
  # [ImGui::IsKeyPressed()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L911)
  def self.is_key_pressed(key : ImGuiKey, repeat : Bool = true) : Bool
    LibImGui.IsKeyPressed_Bool(key, repeat)
  end

  # was key released (went from Down to !Down)?
  #
  # [ImGui::IsKeyReleased()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L912)
  def self.is_key_released(key : ImGuiKey) : Bool
    LibImGui.IsKeyReleased_Nil(key)
  end

  # uses provided repeat rate/delay. return a count, most often 0 or 1 but might be >1 if RepeatRate is small enough that DeltaTime > RepeatRate
  #
  # [ImGui::GetKeyPressedAmount()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L913)
  def self.get_key_pressed_amount(key : ImGuiKey, repeat_delay : Float32, rate : Float32) : Int32
    LibImGui.GetKeyPressedAmount(key, repeat_delay, rate)
  end

  # [DEBUG] returns English name of the key. Those names a provided for debugging purpose and are not meant to be saved persistently not compared.
  #
  # [ImGui::GetKeyName()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L914)
  def self.get_key_name(key : ImGuiKey) : String
    result = LibImGui.GetKeyName(key)
    String.new(result)
  end

  # Override io.WantCaptureKeyboard flag next frame (said flag is left for your application to handle, typically when true it instructs your app to ignore inputs). e.g. force capture keyboard when your widget is being hovered. This is equivalent to setting "io.WantCaptureKeyboard = want_capture_keyboard"; after the next NewFrame() call.
  #
  # [ImGui::SetNextFrameWantCaptureKeyboard()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L915)
  def self.set_next_frame_want_capture_keyboard(want_capture_keyboard : Bool) : Void
    LibImGui.SetNextFrameWantCaptureKeyboard(want_capture_keyboard)
  end

  # is mouse button held?
  #
  # [ImGui::IsMouseDown()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L921)
  def self.is_mouse_down(button : ImGuiMouseButton) : Bool
    LibImGui.IsMouseDown_Nil(button)
  end

  # did mouse button clicked? (went from !Down to Down). Same as GetMouseClickedCount() == 1.
  #
  # [ImGui::IsMouseClicked()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L922)
  def self.is_mouse_clicked(button : ImGuiMouseButton, repeat : Bool = false) : Bool
    LibImGui.IsMouseClicked_Bool(button, repeat)
  end

  # did mouse button released? (went from Down to !Down)
  #
  # [ImGui::IsMouseReleased()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L923)
  def self.is_mouse_released(button : ImGuiMouseButton) : Bool
    LibImGui.IsMouseReleased_Nil(button)
  end

  # did mouse button double-clicked? Same as GetMouseClickedCount() == 2. (note that a double-click will also report IsMouseClicked() == true)
  #
  # [ImGui::IsMouseDoubleClicked()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L924)
  def self.is_mouse_double_clicked(button : ImGuiMouseButton) : Bool
    LibImGui.IsMouseDoubleClicked(button)
  end

  # return the number of successive mouse-clicks at the time where a click happen (otherwise 0).
  #
  # [ImGui::GetMouseClickedCount()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L925)
  def self.get_mouse_clicked_count(button : ImGuiMouseButton) : Int32
    LibImGui.GetMouseClickedCount(button)
  end

  # is mouse hovering given bounding rect (in screen space). clipped by current clipping settings, but disregarding of other consideration of focus/window ordering/popup-block.
  #
  # [ImGui::IsMouseHoveringRect()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L926)
  def self.is_mouse_hovering_rect(r_min : ImVec2, r_max : ImVec2, clip : Bool = true) : Bool
    LibImGui.IsMouseHoveringRect(r_min, r_max, clip)
  end

  # by convention we use (-FLT_MAX,-FLT_MAX) to denote that there is no mouse available
  #
  # [ImGui::IsMousePosValid()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L927)
  def self.is_mouse_pos_valid(mouse_pos : ImVec2* = Pointer(ImVec2).null) : Bool
    LibImGui.IsMousePosValid(mouse_pos)
  end

  # [WILL OBSOLETE] is any mouse button held? This was designed for backends, but prefer having backend maintain a mask of held mouse buttons, because upcoming input queue system will make this invalid.
  #
  # [ImGui::IsAnyMouseDown()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L928)
  def self.is_any_mouse_down : Bool
    LibImGui.IsAnyMouseDown
  end

  # shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls
  #
  # [ImGui::GetMousePos()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L929)
  def self.get_mouse_pos : ImGui::ImVec2
    LibImGui.GetMousePos(out p_out)
    p_out
  end

  # retrieve mouse position at the time of opening popup we have BeginPopup() into (helper to avoid user backing that value themselves)
  #
  # [ImGui::GetMousePosOnOpeningCurrentPopup()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L930)
  def self.get_mouse_pos_on_opening_current_popup : ImGui::ImVec2
    LibImGui.GetMousePosOnOpeningCurrentPopup(out p_out)
    p_out
  end

  # is mouse dragging? (if lock_threshold < -1.0f, uses io.MouseDraggingThreshold)
  #
  # [ImGui::IsMouseDragging()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L931)
  def self.is_mouse_dragging(button : ImGuiMouseButton, lock_threshold : Float32 = -1.0) : Bool
    LibImGui.IsMouseDragging(button, lock_threshold)
  end

  # return the delta from the initial clicking position while the mouse button is pressed or was just released. This is locked and return 0.0f until the mouse moves past a distance threshold at least once (if lock_threshold < -1.0f, uses io.MouseDraggingThreshold)
  #
  # [ImGui::GetMouseDragDelta()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L932)
  def self.get_mouse_drag_delta(button : ImGuiMouseButton = ImGuiMouseButton.new(0), lock_threshold : Float32 = -1.0) : ImGui::ImVec2
    LibImGui.GetMouseDragDelta(out p_out, button, lock_threshold)
    p_out
  end

  # [ImGui::ResetMouseDragDelta()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L933)
  def self.reset_mouse_drag_delta(button : ImGuiMouseButton = ImGuiMouseButton.new(0)) : Void
    LibImGui.ResetMouseDragDelta(button)
  end

  # get desired mouse cursor shape. Important: reset in ImGui::NewFrame(), this is updated during the frame. valid before Render(). If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you
  #
  # [ImGui::GetMouseCursor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L934)
  def self.get_mouse_cursor : ImGuiMouseCursor
    LibImGui.GetMouseCursor
  end

  # set desired mouse cursor shape
  #
  # [ImGui::SetMouseCursor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L935)
  def self.set_mouse_cursor(cursor_type : ImGuiMouseCursor) : Void
    LibImGui.SetMouseCursor(cursor_type)
  end

  # Override io.WantCaptureMouse flag next frame (said flag is left for your application to handle, typical when true it instucts your app to ignore inputs). This is equivalent to setting "io.WantCaptureMouse = want_capture_mouse;" after the next NewFrame() call.
  #
  # [ImGui::SetNextFrameWantCaptureMouse()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L936)
  def self.set_next_frame_want_capture_mouse(want_capture_mouse : Bool) : Void
    LibImGui.SetNextFrameWantCaptureMouse(want_capture_mouse)
  end

  # [ImGui::GetClipboardText()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L940)
  def self.get_clipboard_text : String
    result = LibImGui.GetClipboardText
    String.new(result)
  end

  # [ImGui::SetClipboardText()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L941)
  def self.set_clipboard_text(text : String) : Void
    LibImGui.SetClipboardText(text)
  end

  # call after CreateContext() and before the first call to NewFrame(). NewFrame() automatically calls LoadIniSettingsFromDisk(io.IniFilename).
  #
  # [ImGui::LoadIniSettingsFromDisk()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L947)
  def self.load_ini_settings_from_disk(ini_filename : String) : Void
    LibImGui.LoadIniSettingsFromDisk(ini_filename)
  end

  # call after CreateContext() and before the first call to NewFrame() to provide .ini data from your own data source.
  #
  # [ImGui::LoadIniSettingsFromMemory()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L948)
  def self.load_ini_settings_from_memory(ini_data : String, ini_size : LibC::SizeT = 0) : Void
    LibImGui.LoadIniSettingsFromMemory(ini_data, ini_size)
  end

  # this is automatically called (if io.IniFilename is not empty) a few seconds after any modification that should be reflected in the .ini file (and also by DestroyContext).
  #
  # [ImGui::SaveIniSettingsToDisk()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L949)
  def self.save_ini_settings_to_disk(ini_filename : String) : Void
    LibImGui.SaveIniSettingsToDisk(ini_filename)
  end

  # return a zero-terminated string with the .ini data which you can save by your own mean. call when io.WantSaveIniSettings is set, then save data by your own mean and clear io.WantSaveIniSettings.
  #
  # [ImGui::SaveIniSettingsToMemory()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L950)
  def self.save_ini_settings_to_memory : {String, LibC::SizeT}
    result = LibImGui.SaveIniSettingsToMemory(out out_ini_size)
    {String.new(result), out_ini_size}
  end

  # [ImGui::DebugTextEncoding()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L953)
  def self.debug_text_encoding(text : String) : Void
    LibImGui.DebugTextEncoding(text)
  end

  # This is called by IMGUI_CHECKVERSION() macro.
  #
  # [ImGui::DebugCheckVersionAndDataLayout()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L954)
  def self.debug_check_version_and_data_layout(version_str : String, sz_io : LibC::SizeT, sz_style : LibC::SizeT, sz_vec2 : LibC::SizeT, sz_vec4 : LibC::SizeT, sz_drawvert : LibC::SizeT, sz_drawidx : LibC::SizeT) : Bool
    LibImGui.DebugCheckVersionAndDataLayout(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx)
  end

  # [ImGui::SetAllocatorFunctions()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L960)
  def self.set_allocator_functions(alloc_func : ImGuiMemAllocFunc, free_func : ImGuiMemFreeFunc, user_data : Void* = Pointer(Void).null) : Void
    LibImGui.SetAllocatorFunctions(alloc_func, free_func, user_data)
  end

  # [ImGui::GetAllocatorFunctions()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L961)
  pointer_wrapper def self.get_allocator_functions(p_alloc_func : ImGuiMemAllocFunc*, p_free_func : ImGuiMemFreeFunc*, p_user_data : Void**) : Void
    LibImGui.GetAllocatorFunctions(p_alloc_func, p_free_func, p_user_data)
  end

  # [ImGui::MemAlloc()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L962)
  def self.mem_alloc(size : LibC::SizeT) : Void*
    LibImGui.MemAlloc(size)
  end

  # [ImGui::MemFree()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L963)
  def self.mem_free(ptr : Void*) : Void
    LibImGui.MemFree(ptr)
  end

  # [struct ImVector](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L1814)
  struct ImVector
    include StructType
  end

  # [struct ImGuiStyle](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L1885)
  struct ImGuiStyle
    include ClassType(LibImGui::ImGuiStyle)

    # Global alpha applies to everything in Dear ImGui.
    def alpha : Float32
      @this.value.alpha
    end

    def alpha=(alpha : Float32)
      @this.value.alpha = alpha
    end

    # Additional alpha multiplier applied by BeginDisabled(). Multiply over current value of Alpha.
    def disabled_alpha : Float32
      @this.value.disabled_alpha
    end

    def disabled_alpha=(disabled_alpha : Float32)
      @this.value.disabled_alpha = disabled_alpha
    end

    # Padding within a window.
    def window_padding : ImVec2
      @this.value.window_padding
    end

    def window_padding=(window_padding : ImVec2)
      @this.value.window_padding = window_padding
    end

    # Radius of window corners rounding. Set to 0.0f to have rectangular windows. Large values tend to lead to variety of artifacts and are not recommended.
    def window_rounding : Float32
      @this.value.window_rounding
    end

    def window_rounding=(window_rounding : Float32)
      @this.value.window_rounding = window_rounding
    end

    # Thickness of border around windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
    def window_border_size : Float32
      @this.value.window_border_size
    end

    def window_border_size=(window_border_size : Float32)
      @this.value.window_border_size = window_border_size
    end

    # Minimum window size. This is a global setting. If you want to constrain individual windows, use SetNextWindowSizeConstraints().
    def window_min_size : ImVec2
      @this.value.window_min_size
    end

    def window_min_size=(window_min_size : ImVec2)
      @this.value.window_min_size = window_min_size
    end

    # Alignment for title bar text. Defaults to (0.0f,0.5f) for left-aligned,vertically centered.
    def window_title_align : ImVec2
      @this.value.window_title_align
    end

    def window_title_align=(window_title_align : ImVec2)
      @this.value.window_title_align = window_title_align
    end

    # Side of the collapsing/docking button in the title bar (None/Left/Right). Defaults to ImGuiDir_Left.
    def window_menu_button_position : ImGuiDir
      @this.value.window_menu_button_position
    end

    def window_menu_button_position=(window_menu_button_position : ImGuiDir)
      @this.value.window_menu_button_position = window_menu_button_position
    end

    # Radius of child window corners rounding. Set to 0.0f to have rectangular windows.
    def child_rounding : Float32
      @this.value.child_rounding
    end

    def child_rounding=(child_rounding : Float32)
      @this.value.child_rounding = child_rounding
    end

    # Thickness of border around child windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
    def child_border_size : Float32
      @this.value.child_border_size
    end

    def child_border_size=(child_border_size : Float32)
      @this.value.child_border_size = child_border_size
    end

    # Radius of popup window corners rounding. (Note that tooltip windows use WindowRounding)
    def popup_rounding : Float32
      @this.value.popup_rounding
    end

    def popup_rounding=(popup_rounding : Float32)
      @this.value.popup_rounding = popup_rounding
    end

    # Thickness of border around popup/tooltip windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
    def popup_border_size : Float32
      @this.value.popup_border_size
    end

    def popup_border_size=(popup_border_size : Float32)
      @this.value.popup_border_size = popup_border_size
    end

    # Padding within a framed rectangle (used by most widgets).
    def frame_padding : ImVec2
      @this.value.frame_padding
    end

    def frame_padding=(frame_padding : ImVec2)
      @this.value.frame_padding = frame_padding
    end

    # Radius of frame corners rounding. Set to 0.0f to have rectangular frame (used by most widgets).
    def frame_rounding : Float32
      @this.value.frame_rounding
    end

    def frame_rounding=(frame_rounding : Float32)
      @this.value.frame_rounding = frame_rounding
    end

    # Thickness of border around frames. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
    def frame_border_size : Float32
      @this.value.frame_border_size
    end

    def frame_border_size=(frame_border_size : Float32)
      @this.value.frame_border_size = frame_border_size
    end

    # Horizontal and vertical spacing between widgets/lines.
    def item_spacing : ImVec2
      @this.value.item_spacing
    end

    def item_spacing=(item_spacing : ImVec2)
      @this.value.item_spacing = item_spacing
    end

    # Horizontal and vertical spacing between within elements of a composed widget (e.g. a slider and its label).
    def item_inner_spacing : ImVec2
      @this.value.item_inner_spacing
    end

    def item_inner_spacing=(item_inner_spacing : ImVec2)
      @this.value.item_inner_spacing = item_inner_spacing
    end

    # Padding within a table cell. CellPadding.y may be altered between different rows.
    def cell_padding : ImVec2
      @this.value.cell_padding
    end

    def cell_padding=(cell_padding : ImVec2)
      @this.value.cell_padding = cell_padding
    end

    # Expand reactive bounding box for touch-based system where touch position is not accurate enough. Unfortunately we don't sort widgets so priority on overlap will always be given to the first widget. So don't grow this too much!
    def touch_extra_padding : ImVec2
      @this.value.touch_extra_padding
    end

    def touch_extra_padding=(touch_extra_padding : ImVec2)
      @this.value.touch_extra_padding = touch_extra_padding
    end

    # Horizontal indentation when e.g. entering a tree node. Generally == (FontSize + FramePadding.x*2).
    def indent_spacing : Float32
      @this.value.indent_spacing
    end

    def indent_spacing=(indent_spacing : Float32)
      @this.value.indent_spacing = indent_spacing
    end

    # Minimum horizontal spacing between two columns. Preferably > (FramePadding.x + 1).
    def columns_min_spacing : Float32
      @this.value.columns_min_spacing
    end

    def columns_min_spacing=(columns_min_spacing : Float32)
      @this.value.columns_min_spacing = columns_min_spacing
    end

    # Width of the vertical scrollbar, Height of the horizontal scrollbar.
    def scrollbar_size : Float32
      @this.value.scrollbar_size
    end

    def scrollbar_size=(scrollbar_size : Float32)
      @this.value.scrollbar_size = scrollbar_size
    end

    # Radius of grab corners for scrollbar.
    def scrollbar_rounding : Float32
      @this.value.scrollbar_rounding
    end

    def scrollbar_rounding=(scrollbar_rounding : Float32)
      @this.value.scrollbar_rounding = scrollbar_rounding
    end

    # Minimum width/height of a grab box for slider/scrollbar.
    def grab_min_size : Float32
      @this.value.grab_min_size
    end

    def grab_min_size=(grab_min_size : Float32)
      @this.value.grab_min_size = grab_min_size
    end

    # Radius of grabs corners rounding. Set to 0.0f to have rectangular slider grabs.
    def grab_rounding : Float32
      @this.value.grab_rounding
    end

    def grab_rounding=(grab_rounding : Float32)
      @this.value.grab_rounding = grab_rounding
    end

    # The size in pixels of the dead-zone around zero on logarithmic sliders that cross zero.
    def log_slider_deadzone : Float32
      @this.value.log_slider_deadzone
    end

    def log_slider_deadzone=(log_slider_deadzone : Float32)
      @this.value.log_slider_deadzone = log_slider_deadzone
    end

    # Radius of upper corners of a tab. Set to 0.0f to have rectangular tabs.
    def tab_rounding : Float32
      @this.value.tab_rounding
    end

    def tab_rounding=(tab_rounding : Float32)
      @this.value.tab_rounding = tab_rounding
    end

    # Thickness of border around tabs.
    def tab_border_size : Float32
      @this.value.tab_border_size
    end

    def tab_border_size=(tab_border_size : Float32)
      @this.value.tab_border_size = tab_border_size
    end

    # Minimum width for close button to appear on an unselected tab when hovered. Set to 0.0f to always show when hovering, set to FLT_MAX to never show close button unless selected.
    def tab_min_width_for_close_button : Float32
      @this.value.tab_min_width_for_close_button
    end

    def tab_min_width_for_close_button=(tab_min_width_for_close_button : Float32)
      @this.value.tab_min_width_for_close_button = tab_min_width_for_close_button
    end

    # Side of the color button in the ColorEdit4 widget (left/right). Defaults to ImGuiDir_Right.
    def color_button_position : ImGuiDir
      @this.value.color_button_position
    end

    def color_button_position=(color_button_position : ImGuiDir)
      @this.value.color_button_position = color_button_position
    end

    # Alignment of button text when button is larger than text. Defaults to (0.5f, 0.5f) (centered).
    def button_text_align : ImVec2
      @this.value.button_text_align
    end

    def button_text_align=(button_text_align : ImVec2)
      @this.value.button_text_align = button_text_align
    end

    # Alignment of selectable text. Defaults to (0.0f, 0.0f) (top-left aligned). It's generally important to keep this left-aligned if you want to lay multiple items on a same line.
    def selectable_text_align : ImVec2
      @this.value.selectable_text_align
    end

    def selectable_text_align=(selectable_text_align : ImVec2)
      @this.value.selectable_text_align = selectable_text_align
    end

    # Thickkness of border in SeparatorText()
    def separator_text_border_size : Float32
      @this.value.separator_text_border_size
    end

    def separator_text_border_size=(separator_text_border_size : Float32)
      @this.value.separator_text_border_size = separator_text_border_size
    end

    # Alignment of text within the separator. Defaults to (0.0f, 0.5f) (left aligned, center).
    def separator_text_align : ImVec2
      @this.value.separator_text_align
    end

    def separator_text_align=(separator_text_align : ImVec2)
      @this.value.separator_text_align = separator_text_align
    end

    # Horizontal offset of text from each edge of the separator + spacing on other axis. Generally small values. .y is recommended to be == FramePadding.y.
    def separator_text_padding : ImVec2
      @this.value.separator_text_padding
    end

    def separator_text_padding=(separator_text_padding : ImVec2)
      @this.value.separator_text_padding = separator_text_padding
    end

    # Window position are clamped to be visible within the display area or monitors by at least this amount. Only applies to regular windows.
    def display_window_padding : ImVec2
      @this.value.display_window_padding
    end

    def display_window_padding=(display_window_padding : ImVec2)
      @this.value.display_window_padding = display_window_padding
    end

    # If you cannot see the edges of your screen (e.g. on a TV) increase the safe area padding. Apply to popups/tooltips as well regular windows. NB: Prefer configuring your TV sets correctly!
    def display_safe_area_padding : ImVec2
      @this.value.display_safe_area_padding
    end

    def display_safe_area_padding=(display_safe_area_padding : ImVec2)
      @this.value.display_safe_area_padding = display_safe_area_padding
    end

    # Scale software rendered mouse cursor (when io.MouseDrawCursor is enabled). May be removed later.
    def mouse_cursor_scale : Float32
      @this.value.mouse_cursor_scale
    end

    def mouse_cursor_scale=(mouse_cursor_scale : Float32)
      @this.value.mouse_cursor_scale = mouse_cursor_scale
    end

    # Enable anti-aliased lines/borders. Disable if you are really tight on CPU/GPU. Latched at the beginning of the frame (copied to ImDrawList).
    def anti_aliased_lines : Bool
      @this.value.anti_aliased_lines
    end

    def anti_aliased_lines=(anti_aliased_lines : Bool)
      @this.value.anti_aliased_lines = anti_aliased_lines
    end

    # Enable anti-aliased lines/borders using textures where possible. Require backend to render with bilinear filtering (NOT point/nearest filtering). Latched at the beginning of the frame (copied to ImDrawList).
    def anti_aliased_lines_use_tex : Bool
      @this.value.anti_aliased_lines_use_tex
    end

    def anti_aliased_lines_use_tex=(anti_aliased_lines_use_tex : Bool)
      @this.value.anti_aliased_lines_use_tex = anti_aliased_lines_use_tex
    end

    # Enable anti-aliased edges around filled shapes (rounded rectangles, circles, etc.). Disable if you are really tight on CPU/GPU. Latched at the beginning of the frame (copied to ImDrawList).
    def anti_aliased_fill : Bool
      @this.value.anti_aliased_fill
    end

    def anti_aliased_fill=(anti_aliased_fill : Bool)
      @this.value.anti_aliased_fill = anti_aliased_fill
    end

    # Tessellation tolerance when using PathBezierCurveTo() without a specific number of segments. Decrease for highly tessellated curves (higher quality, more polygons), increase to reduce quality.
    def curve_tessellation_tol : Float32
      @this.value.curve_tessellation_tol
    end

    def curve_tessellation_tol=(curve_tessellation_tol : Float32)
      @this.value.curve_tessellation_tol = curve_tessellation_tol
    end

    # Maximum error (in pixels) allowed when using AddCircle()/AddCircleFilled() or drawing rounded corner rectangles with no explicit segment count specified. Decrease for higher quality but more geometry.
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

    # Delay for IsItemHovered(ImGuiHoveredFlags_Stationary). Time required to consider mouse stationary.
    def hover_stationary_delay : Float32
      @this.value.hover_stationary_delay
    end

    def hover_stationary_delay=(hover_stationary_delay : Float32)
      @this.value.hover_stationary_delay = hover_stationary_delay
    end

    # Delay for IsItemHovered(ImGuiHoveredFlags_DelayShort). Usually used along with HoverStationaryDelay.
    def hover_delay_short : Float32
      @this.value.hover_delay_short
    end

    def hover_delay_short=(hover_delay_short : Float32)
      @this.value.hover_delay_short = hover_delay_short
    end

    # Delay for IsItemHovered(ImGuiHoveredFlags_DelayNormal). "
    def hover_delay_normal : Float32
      @this.value.hover_delay_normal
    end

    def hover_delay_normal=(hover_delay_normal : Float32)
      @this.value.hover_delay_normal = hover_delay_normal
    end

    # Default flags when using IsItemHovered(ImGuiHoveredFlags_ForTooltip) or BeginItemTooltip()/SetItemTooltip() while using mouse.
    def hover_flags_for_tooltip_mouse : ImGuiHoveredFlags
      @this.value.hover_flags_for_tooltip_mouse
    end

    def hover_flags_for_tooltip_mouse=(hover_flags_for_tooltip_mouse : ImGuiHoveredFlags)
      @this.value.hover_flags_for_tooltip_mouse = hover_flags_for_tooltip_mouse
    end

    # Default flags when using IsItemHovered(ImGuiHoveredFlags_ForTooltip) or BeginItemTooltip()/SetItemTooltip() while using keyboard/gamepad.
    def hover_flags_for_tooltip_nav : ImGuiHoveredFlags
      @this.value.hover_flags_for_tooltip_nav
    end

    def hover_flags_for_tooltip_nav=(hover_flags_for_tooltip_nav : ImGuiHoveredFlags)
      @this.value.hover_flags_for_tooltip_nav = hover_flags_for_tooltip_nav
    end

    # [ImGuiStyle::ImGuiStyle()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L1940)
    def self.new : ImGuiStyle
      result = LibImGui.ImGuiStyle_ImGuiStyle
      ImGuiStyle.new(result)
    end

    # [ImGuiStyle::ScaleAllSizes()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L1941)
    def scale_all_sizes(scale_factor : Float32) : Void
      LibImGui.ImGuiStyle_ScaleAllSizes(self, scale_factor)
    end
  end

  alias TopLevel::ImGuiStyle = ImGui::ImGuiStyle

  # [struct ImGuiKeyData](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L1953)
  struct ImGuiKeyData
    include ClassType(LibImGui::ImGuiKeyData)

    # True for if key is down
    def down : Bool
      @this.value.down
    end

    def down=(down : Bool)
      @this.value.down = down
    end

    # Duration the key has been down (<0.0f: not pressed, 0.0f: just pressed, >0.0f: time held)
    def down_duration : Float32
      @this.value.down_duration
    end

    def down_duration=(down_duration : Float32)
      @this.value.down_duration = down_duration
    end

    # Last frame duration the key has been down
    def down_duration_prev : Float32
      @this.value.down_duration_prev
    end

    def down_duration_prev=(down_duration_prev : Float32)
      @this.value.down_duration_prev = down_duration_prev
    end

    # 0.0f..1.0f for gamepad values
    def analog_value : Float32
      @this.value.analog_value
    end

    def analog_value=(analog_value : Float32)
      @this.value.analog_value = analog_value
    end
  end

  alias TopLevel::ImGuiKeyData = ImGui::ImGuiKeyData

  # [struct ImGuiIO](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L1961)
  struct ImGuiIO
    include ClassType(LibImGui::ImGuiIO)

    # = 0
    # See ImGuiConfigFlags_ enum. Set by user/application. Gamepad/keyboard navigation options, etc.
    def config_flags : ImGuiConfigFlags
      @this.value.config_flags
    end

    def config_flags=(config_flags : ImGuiConfigFlags)
      @this.value.config_flags = config_flags
    end

    # = 0
    # See ImGuiBackendFlags_ enum. Set by backend (imgui_impl_xxx files or custom backend) to communicate features supported by the backend.
    def backend_flags : ImGuiBackendFlags
      @this.value.backend_flags
    end

    def backend_flags=(backend_flags : ImGuiBackendFlags)
      @this.value.backend_flags = backend_flags
    end

    # <unset>
    # Main display size, in pixels (generally == GetMainViewport()->Size). May change every frame.
    def display_size : ImVec2
      @this.value.display_size
    end

    def display_size=(display_size : ImVec2)
      @this.value.display_size = display_size
    end

    # = 1.0f/60.0f
    # Time elapsed since last frame, in seconds. May change every frame.
    def delta_time : Float32
      @this.value.delta_time
    end

    def delta_time=(delta_time : Float32)
      @this.value.delta_time = delta_time
    end

    # = 5.0f
    # Minimum time between saving positions/sizes to .ini file, in seconds.
    def ini_saving_rate : Float32
      @this.value.ini_saving_rate
    end

    def ini_saving_rate=(ini_saving_rate : Float32)
      @this.value.ini_saving_rate = ini_saving_rate
    end

    # = "imgui.ini"
    # Path to .ini file (important: default "imgui.ini" is relative to current working dir!). Set NULL to disable automatic .ini loading/saving or if you want to manually call LoadIniSettingsXXX() / SaveIniSettingsXXX() functions.
    def ini_filename : String?
      (v = @this.value.ini_filename) ? String.new(v) : nil
    end

    def ini_filename=(ini_filename : String?)
      @this.value.ini_filename = ini_filename
    end

    # = "imgui_log.txt"// Path to .log file (default parameter to ImGui::LogToFile when no file is specified).
    def log_filename : String?
      (v = @this.value.log_filename) ? String.new(v) : nil
    end

    def log_filename=(log_filename : String?)
      @this.value.log_filename = log_filename
    end

    # = NULL
    # Store your own data.
    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    # <auto>
    # Font atlas: load, rasterize and pack one or more fonts into a single texture.
    def fonts : ImFontAtlas
      ImFontAtlas.new(@this.value.fonts)
    end

    def fonts=(fonts : ImFontAtlas)
      @this.value.fonts = fonts
    end

    # = 1.0f
    # Global scale all fonts
    def font_global_scale : Float32
      @this.value.font_global_scale
    end

    def font_global_scale=(font_global_scale : Float32)
      @this.value.font_global_scale = font_global_scale
    end

    # = false
    # Allow user scaling text of individual window with CTRL+Wheel.
    def font_allow_user_scaling : Bool
      @this.value.font_allow_user_scaling
    end

    def font_allow_user_scaling=(font_allow_user_scaling : Bool)
      @this.value.font_allow_user_scaling = font_allow_user_scaling
    end

    # = NULL
    # Font to use on NewFrame(). Use NULL to uses Fonts->Fonts[0].
    def font_default : ImFont
      ImFont.new(@this.value.font_default)
    end

    def font_default=(font_default : ImFont)
      @this.value.font_default = font_default
    end

    # = (1, 1)
    # For retina display or other situations where window coordinates are different from framebuffer coordinates. This generally ends up in ImDrawData::FramebufferScale.
    def display_framebuffer_scale : ImVec2
      @this.value.display_framebuffer_scale
    end

    def display_framebuffer_scale=(display_framebuffer_scale : ImVec2)
      @this.value.display_framebuffer_scale = display_framebuffer_scale
    end

    # = false
    # Request ImGui to draw a mouse cursor for you (if you are on a platform without a mouse cursor). Cannot be easily renamed to 'io.ConfigXXX' because this is frequently used by backend implementations.
    def mouse_draw_cursor : Bool
      @this.value.mouse_draw_cursor
    end

    def mouse_draw_cursor=(mouse_draw_cursor : Bool)
      @this.value.mouse_draw_cursor = mouse_draw_cursor
    end

    # = defined(__APPLE__)
    # OS X style: Text editing cursor movement using Alt instead of Ctrl, Shortcuts using Cmd/Super instead of Ctrl, Line/Text Start and End using Cmd+Arrows instead of Home/End, Double click selects by word instead of selecting whole text, Multi-selection in lists uses Cmd/Super instead of Ctrl.
    def config_mac_osx_behaviors : Bool
      @this.value.config_mac_osx_behaviors
    end

    def config_mac_osx_behaviors=(config_mac_osx_behaviors : Bool)
      @this.value.config_mac_osx_behaviors = config_mac_osx_behaviors
    end

    # = true
    # Enable input queue trickling: some types of events submitted during the same frame (e.g. button down + up) will be spread over multiple frames, improving interactions with low framerates.
    def config_input_trickle_event_queue : Bool
      @this.value.config_input_trickle_event_queue
    end

    def config_input_trickle_event_queue=(config_input_trickle_event_queue : Bool)
      @this.value.config_input_trickle_event_queue = config_input_trickle_event_queue
    end

    # = true
    # Enable blinking cursor (optional as some users consider it to be distracting).
    def config_input_text_cursor_blink : Bool
      @this.value.config_input_text_cursor_blink
    end

    def config_input_text_cursor_blink=(config_input_text_cursor_blink : Bool)
      @this.value.config_input_text_cursor_blink = config_input_text_cursor_blink
    end

    # = false
    # [BETA] Pressing Enter will keep item active and select contents (single-line only).
    def config_input_text_enter_keep_active : Bool
      @this.value.config_input_text_enter_keep_active
    end

    def config_input_text_enter_keep_active=(config_input_text_enter_keep_active : Bool)
      @this.value.config_input_text_enter_keep_active = config_input_text_enter_keep_active
    end

    # = false
    # [BETA] Enable turning DragXXX widgets into text input with a simple mouse click-release (without moving). Not desirable on devices without a keyboard.
    def config_drag_click_to_input_text : Bool
      @this.value.config_drag_click_to_input_text
    end

    def config_drag_click_to_input_text=(config_drag_click_to_input_text : Bool)
      @this.value.config_drag_click_to_input_text = config_drag_click_to_input_text
    end

    # = true
    # Enable resizing of windows from their edges and from the lower-left corner. This requires (io.BackendFlags & ImGuiBackendFlags_HasMouseCursors) because it needs mouse cursor feedback. (This used to be a per-window ImGuiWindowFlags_ResizeFromAnySide flag)
    def config_windows_resize_from_edges : Bool
      @this.value.config_windows_resize_from_edges
    end

    def config_windows_resize_from_edges=(config_windows_resize_from_edges : Bool)
      @this.value.config_windows_resize_from_edges = config_windows_resize_from_edges
    end

    # = false
    # Enable allowing to move windows only when clicking on their title bar. Does not apply to windows without a title bar.
    def config_windows_move_from_title_bar_only : Bool
      @this.value.config_windows_move_from_title_bar_only
    end

    def config_windows_move_from_title_bar_only=(config_windows_move_from_title_bar_only : Bool)
      @this.value.config_windows_move_from_title_bar_only = config_windows_move_from_title_bar_only
    end

    # = 60.0f
    # Timer (in seconds) to free transient windows/tables memory buffers when unused. Set to -1.0f to disable.
    def config_memory_compact_timer : Float32
      @this.value.config_memory_compact_timer
    end

    def config_memory_compact_timer=(config_memory_compact_timer : Float32)
      @this.value.config_memory_compact_timer = config_memory_compact_timer
    end

    # = 0.30f
    # Time for a double-click, in seconds.
    def mouse_double_click_time : Float32
      @this.value.mouse_double_click_time
    end

    def mouse_double_click_time=(mouse_double_click_time : Float32)
      @this.value.mouse_double_click_time = mouse_double_click_time
    end

    # = 6.0f
    # Distance threshold to stay in to validate a double-click, in pixels.
    def mouse_double_click_max_dist : Float32
      @this.value.mouse_double_click_max_dist
    end

    def mouse_double_click_max_dist=(mouse_double_click_max_dist : Float32)
      @this.value.mouse_double_click_max_dist = mouse_double_click_max_dist
    end

    # = 6.0f
    # Distance threshold before considering we are dragging.
    def mouse_drag_threshold : Float32
      @this.value.mouse_drag_threshold
    end

    def mouse_drag_threshold=(mouse_drag_threshold : Float32)
      @this.value.mouse_drag_threshold = mouse_drag_threshold
    end

    # = 0.275f
    # When holding a key/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).
    def key_repeat_delay : Float32
      @this.value.key_repeat_delay
    end

    def key_repeat_delay=(key_repeat_delay : Float32)
      @this.value.key_repeat_delay = key_repeat_delay
    end

    # = 0.050f
    # When holding a key/button, rate at which it repeats, in seconds.
    def key_repeat_rate : Float32
      @this.value.key_repeat_rate
    end

    def key_repeat_rate=(key_repeat_rate : Float32)
      @this.value.key_repeat_rate = key_repeat_rate
    end

    # = false
    # First-time calls to Begin()/BeginChild() will return false. NEEDS TO BE SET AT APPLICATION BOOT TIME if you don't want to miss windows.
    def config_debug_begin_return_value_once : Bool
      @this.value.config_debug_begin_return_value_once
    end

    def config_debug_begin_return_value_once=(config_debug_begin_return_value_once : Bool)
      @this.value.config_debug_begin_return_value_once = config_debug_begin_return_value_once
    end

    # = false
    # Some calls to Begin()/BeginChild() will return false. Will cycle through window depths then repeat. Suggested use: add "io.ConfigDebugBeginReturnValue = io.KeyShift" in your main loop then occasionally press SHIFT. Windows should be flickering while running.
    def config_debug_begin_return_value_loop : Bool
      @this.value.config_debug_begin_return_value_loop
    end

    def config_debug_begin_return_value_loop=(config_debug_begin_return_value_loop : Bool)
      @this.value.config_debug_begin_return_value_loop = config_debug_begin_return_value_loop
    end

    # = false
    # Ignore io.AddFocusEvent(false), consequently not calling io.ClearInputKeys() in input processing.
    def config_debug_ignore_focus_loss : Bool
      @this.value.config_debug_ignore_focus_loss
    end

    def config_debug_ignore_focus_loss=(config_debug_ignore_focus_loss : Bool)
      @this.value.config_debug_ignore_focus_loss = config_debug_ignore_focus_loss
    end

    # = false
    # Save .ini data with extra comments (particularly helpful for Docking, but makes saving slower)
    def config_debug_ini_settings : Bool
      @this.value.config_debug_ini_settings
    end

    def config_debug_ini_settings=(config_debug_ini_settings : Bool)
      @this.value.config_debug_ini_settings = config_debug_ini_settings
    end

    # = NULL
    def backend_platform_name : String?
      (v = @this.value.backend_platform_name) ? String.new(v) : nil
    end

    def backend_platform_name=(backend_platform_name : String?)
      @this.value.backend_platform_name = backend_platform_name
    end

    # = NULL
    def backend_renderer_name : String?
      (v = @this.value.backend_renderer_name) ? String.new(v) : nil
    end

    def backend_renderer_name=(backend_renderer_name : String?)
      @this.value.backend_renderer_name = backend_renderer_name
    end

    # = NULL
    # User data for platform backend
    def backend_platform_user_data : Void*
      @this.value.backend_platform_user_data
    end

    def backend_platform_user_data=(backend_platform_user_data : Void*)
      @this.value.backend_platform_user_data = backend_platform_user_data
    end

    # = NULL
    # User data for renderer backend
    def backend_renderer_user_data : Void*
      @this.value.backend_renderer_user_data
    end

    def backend_renderer_user_data=(backend_renderer_user_data : Void*)
      @this.value.backend_renderer_user_data = backend_renderer_user_data
    end

    # = NULL
    # User data for non C++ programming language backend
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

    # '.'
    # [Experimental] Configure decimal point e.g. '.' or ',' useful for some languages (e.g. German), generally pulled from *localeconv()->decimal_point
    def platform_locale_decimal_point : ImWchar
      @this.value.platform_locale_decimal_point
    end

    def platform_locale_decimal_point=(platform_locale_decimal_point : ImWchar)
      @this.value.platform_locale_decimal_point = platform_locale_decimal_point
    end

    # Set when Dear ImGui will use mouse inputs, in this case do not dispatch them to your main game/application (either way, always pass on mouse inputs to imgui). (e.g. unclicked mouse is hovering over an imgui window, widget is active, mouse was clicked over an imgui window, etc.).
    def want_capture_mouse : Bool
      @this.value.want_capture_mouse
    end

    def want_capture_mouse=(want_capture_mouse : Bool)
      @this.value.want_capture_mouse = want_capture_mouse
    end

    # Set when Dear ImGui will use keyboard inputs, in this case do not dispatch them to your main game/application (either way, always pass keyboard inputs to imgui). (e.g. InputText active, or an imgui window is focused and navigation is enabled, etc.).
    def want_capture_keyboard : Bool
      @this.value.want_capture_keyboard
    end

    def want_capture_keyboard=(want_capture_keyboard : Bool)
      @this.value.want_capture_keyboard = want_capture_keyboard
    end

    # Mobile/console: when set, you may display an on-screen keyboard. This is set by Dear ImGui when it wants textual keyboard input to happen (e.g. when a InputText widget is active).
    def want_text_input : Bool
      @this.value.want_text_input
    end

    def want_text_input=(want_text_input : Bool)
      @this.value.want_text_input = want_text_input
    end

    # MousePos has been altered, backend should reposition mouse on next frame. Rarely used! Set only when ImGuiConfigFlags_NavEnableSetMousePos flag is enabled.
    def want_set_mouse_pos : Bool
      @this.value.want_set_mouse_pos
    end

    def want_set_mouse_pos=(want_set_mouse_pos : Bool)
      @this.value.want_set_mouse_pos = want_set_mouse_pos
    end

    # When manual .ini load/save is active (io.IniFilename == NULL), this will be set to notify your application that you can call SaveIniSettingsToMemory() and save yourself. Important: clear io.WantSaveIniSettings yourself after saving!
    def want_save_ini_settings : Bool
      @this.value.want_save_ini_settings
    end

    def want_save_ini_settings=(want_save_ini_settings : Bool)
      @this.value.want_save_ini_settings = want_save_ini_settings
    end

    # Keyboard/Gamepad navigation is currently allowed (will handle ImGuiKey_NavXXX events) = a window is focused and it doesn't use the ImGuiWindowFlags_NoNavInputs flag.
    def nav_active : Bool
      @this.value.nav_active
    end

    def nav_active=(nav_active : Bool)
      @this.value.nav_active = nav_active
    end

    # Keyboard/Gamepad navigation is visible and allowed (will handle ImGuiKey_NavXXX events).
    def nav_visible : Bool
      @this.value.nav_visible
    end

    def nav_visible=(nav_visible : Bool)
      @this.value.nav_visible = nav_visible
    end

    # Estimate of application framerate (rolling average over 60 frames, based on io.DeltaTime), in frame per second. Solely for convenience. Slow applications may not want to use a moving average or may want to reset underlying buffers occasionally.
    def framerate : Float32
      @this.value.framerate
    end

    def framerate=(framerate : Float32)
      @this.value.framerate = framerate
    end

    # Vertices output during last call to Render()
    def metrics_render_vertices : Int32
      @this.value.metrics_render_vertices
    end

    def metrics_render_vertices=(metrics_render_vertices : Int32)
      @this.value.metrics_render_vertices = metrics_render_vertices
    end

    # Indices output during last call to Render() = number of triangles * 3
    def metrics_render_indices : Int32
      @this.value.metrics_render_indices
    end

    def metrics_render_indices=(metrics_render_indices : Int32)
      @this.value.metrics_render_indices = metrics_render_indices
    end

    # Number of visible windows
    def metrics_render_windows : Int32
      @this.value.metrics_render_windows
    end

    def metrics_render_windows=(metrics_render_windows : Int32)
      @this.value.metrics_render_windows = metrics_render_windows
    end

    # Number of active windows
    def metrics_active_windows : Int32
      @this.value.metrics_active_windows
    end

    def metrics_active_windows=(metrics_active_windows : Int32)
      @this.value.metrics_active_windows = metrics_active_windows
    end

    # Number of active allocations, updated by MemAlloc/MemFree based on current context. May be off if you have multiple imgui contexts.
    def metrics_active_allocations : Int32
      @this.value.metrics_active_allocations
    end

    def metrics_active_allocations=(metrics_active_allocations : Int32)
      @this.value.metrics_active_allocations = metrics_active_allocations
    end

    # Mouse delta. Note that this is zero if either current or previous position are invalid (-FLT_MAX,-FLT_MAX), so a disappearing/reappearing mouse won't have a huge delta.
    def mouse_delta : ImVec2
      @this.value.mouse_delta
    end

    def mouse_delta=(mouse_delta : ImVec2)
      @this.value.mouse_delta = mouse_delta
    end

    # [LEGACY] Input: map of indices into the KeysDown[512] entries array which represent your "native" keyboard state. The first 512 are now unused and should be kept zero. Legacy backend will write into KeyMap[] using ImGuiKey_ indices which are always >512.
    def key_map : Slice(Int32)
      @this.value.key_map.to_slice
    end

    def key_map=(key_map : Slice(Int32))
      @this.value.key_map = key_map
    end

    # [LEGACY] Input: Keyboard keys that are pressed (ideally left in the "native" order your engine has access to keyboard keys, so you can use your own defines/enums for keys). This used to be [512] sized. It is now ImGuiKey_COUNT to allow legacy io.KeysDown[GetKeyIndex(...)] to work without an overflow.
    def keys_down : Slice(Bool)
      @this.value.keys_down.to_slice
    end

    def keys_down=(keys_down : Slice(Bool))
      @this.value.keys_down = keys_down
    end

    # [LEGACY] Since 1.88, NavInputs[] was removed. Backends from 1.60 to 1.86 won't build. Feed gamepad inputs via io.AddKeyEvent() and ImGuiKey_GamepadXXX enums.
    def nav_inputs : Slice(Float32)
      @this.value.nav_inputs.to_slice
    end

    def nav_inputs=(nav_inputs : Slice(Float32))
      @this.value.nav_inputs = nav_inputs
    end

    # Parent UI context (needs to be set explicitly by parent).
    def ctx : ImGuiContext?
      (v = @this.value.ctx) ? v.value : nil
    end

    def ctx=(ctx : ImGuiContext?)
      @this.value.ctx = ctx
    end

    # Mouse position, in pixels. Set to ImVec2(-FLT_MAX, -FLT_MAX) if mouse is unavailable (on another screen, etc.)
    def mouse_pos : ImVec2
      @this.value.mouse_pos
    end

    def mouse_pos=(mouse_pos : ImVec2)
      @this.value.mouse_pos = mouse_pos
    end

    # Mouse buttons: 0=left, 1=right, 2=middle + extras (ImGuiMouseButton_COUNT == 5). Dear ImGui mostly uses left and right buttons. Other buttons allow us to track if the mouse is being used by your application + available to user as a convenience via IsMouse** API.
    def mouse_down : Slice(Bool)
      @this.value.mouse_down.to_slice
    end

    def mouse_down=(mouse_down : Slice(Bool))
      @this.value.mouse_down = mouse_down
    end

    # Mouse wheel Vertical: 1 unit scrolls about 5 lines text. >0 scrolls Up, <0 scrolls Down. Hold SHIFT to turn vertical scroll into horizontal scroll.
    def mouse_wheel : Float32
      @this.value.mouse_wheel
    end

    def mouse_wheel=(mouse_wheel : Float32)
      @this.value.mouse_wheel = mouse_wheel
    end

    # Mouse wheel Horizontal. >0 scrolls Left, <0 scrolls Right. Most users don't have a mouse with a horizontal wheel, may not be filled by all backends.
    def mouse_wheel_h : Float32
      @this.value.mouse_wheel_h
    end

    def mouse_wheel_h=(mouse_wheel_h : Float32)
      @this.value.mouse_wheel_h = mouse_wheel_h
    end

    # Mouse actual input peripheral (Mouse/TouchScreen/Pen).
    def mouse_source : ImGuiMouseSource
      @this.value.mouse_source
    end

    def mouse_source=(mouse_source : ImGuiMouseSource)
      @this.value.mouse_source = mouse_source
    end

    # Keyboard modifier down: Control
    def key_ctrl : Bool
      @this.value.key_ctrl
    end

    def key_ctrl=(key_ctrl : Bool)
      @this.value.key_ctrl = key_ctrl
    end

    # Keyboard modifier down: Shift
    def key_shift : Bool
      @this.value.key_shift
    end

    def key_shift=(key_shift : Bool)
      @this.value.key_shift = key_shift
    end

    # Keyboard modifier down: Alt
    def key_alt : Bool
      @this.value.key_alt
    end

    def key_alt=(key_alt : Bool)
      @this.value.key_alt = key_alt
    end

    # Keyboard modifier down: Cmd/Super/Windows
    def key_super : Bool
      @this.value.key_super
    end

    def key_super=(key_super : Bool)
      @this.value.key_super = key_super
    end

    # Key mods flags (any of ImGuiMod_Ctrl/ImGuiMod_Shift/ImGuiMod_Alt/ImGuiMod_Super flags, same as io.KeyCtrl/KeyShift/KeyAlt/KeySuper but merged into flags. DOES NOT CONTAINS ImGuiMod_Shortcut which is pretranslated). Read-only, updated by NewFrame()
    def key_mods : ImGuiKeyChord
      @this.value.key_mods
    end

    def key_mods=(key_mods : ImGuiKeyChord)
      @this.value.key_mods = key_mods
    end

    # Key state for all known keys. Use IsKeyXXX() functions to access this.
    def keys_data : Slice(ImGuiKeyData)
      @this.value.keys_data.to_slice
    end

    def keys_data=(keys_data : Slice(ImGuiKeyData))
      @this.value.keys_data = keys_data
    end

    # Alternative to WantCaptureMouse: (WantCaptureMouse == true && WantCaptureMouseUnlessPopupClose == false) when a click over void is expected to close a popup.
    def want_capture_mouse_unless_popup_close : Bool
      @this.value.want_capture_mouse_unless_popup_close
    end

    def want_capture_mouse_unless_popup_close=(want_capture_mouse_unless_popup_close : Bool)
      @this.value.want_capture_mouse_unless_popup_close = want_capture_mouse_unless_popup_close
    end

    # Previous mouse position (note that MouseDelta is not necessary == MousePos-MousePosPrev, in case either position is invalid)
    def mouse_pos_prev : ImVec2
      @this.value.mouse_pos_prev
    end

    def mouse_pos_prev=(mouse_pos_prev : ImVec2)
      @this.value.mouse_pos_prev = mouse_pos_prev
    end

    # Position at time of clicking
    def mouse_clicked_pos : Slice(ImVec2)
      @this.value.mouse_clicked_pos.to_slice
    end

    def mouse_clicked_pos=(mouse_clicked_pos : Slice(ImVec2))
      @this.value.mouse_clicked_pos = mouse_clicked_pos
    end

    # Time of last click (used to figure out double-click)
    def mouse_clicked_time : Slice(Float64)
      @this.value.mouse_clicked_time.to_slice
    end

    def mouse_clicked_time=(mouse_clicked_time : Slice(Float64))
      @this.value.mouse_clicked_time = mouse_clicked_time
    end

    # Mouse button went from !Down to Down (same as MouseClickedCount[x] != 0)
    def mouse_clicked : Slice(Bool)
      @this.value.mouse_clicked.to_slice
    end

    def mouse_clicked=(mouse_clicked : Slice(Bool))
      @this.value.mouse_clicked = mouse_clicked
    end

    # Has mouse button been double-clicked? (same as MouseClickedCount[x] == 2)
    def mouse_double_clicked : Slice(Bool)
      @this.value.mouse_double_clicked.to_slice
    end

    def mouse_double_clicked=(mouse_double_clicked : Slice(Bool))
      @this.value.mouse_double_clicked = mouse_double_clicked
    end

    # == 0 (not clicked), == 1 (same as MouseClicked[]), == 2 (double-clicked), == 3 (triple-clicked) etc. when going from !Down to Down
    def mouse_clicked_count : Slice(UInt16)
      @this.value.mouse_clicked_count.to_slice
    end

    def mouse_clicked_count=(mouse_clicked_count : Slice(UInt16))
      @this.value.mouse_clicked_count = mouse_clicked_count
    end

    # Count successive number of clicks. Stays valid after mouse release. Reset after another click is done.
    def mouse_clicked_last_count : Slice(UInt16)
      @this.value.mouse_clicked_last_count.to_slice
    end

    def mouse_clicked_last_count=(mouse_clicked_last_count : Slice(UInt16))
      @this.value.mouse_clicked_last_count = mouse_clicked_last_count
    end

    # Mouse button went from Down to !Down
    def mouse_released : Slice(Bool)
      @this.value.mouse_released.to_slice
    end

    def mouse_released=(mouse_released : Slice(Bool))
      @this.value.mouse_released = mouse_released
    end

    # Track if button was clicked inside a dear imgui window or over void blocked by a popup. We don't request mouse capture from the application if click started outside ImGui bounds.
    def mouse_down_owned : Slice(Bool)
      @this.value.mouse_down_owned.to_slice
    end

    def mouse_down_owned=(mouse_down_owned : Slice(Bool))
      @this.value.mouse_down_owned = mouse_down_owned
    end

    # Track if button was clicked inside a dear imgui window.
    def mouse_down_owned_unless_popup_close : Slice(Bool)
      @this.value.mouse_down_owned_unless_popup_close.to_slice
    end

    def mouse_down_owned_unless_popup_close=(mouse_down_owned_unless_popup_close : Slice(Bool))
      @this.value.mouse_down_owned_unless_popup_close = mouse_down_owned_unless_popup_close
    end

    # On a non-Mac system, holding SHIFT requests WheelY to perform the equivalent of a WheelX event. On a Mac system this is already enforced by the system.
    def mouse_wheel_request_axis_swap : Bool
      @this.value.mouse_wheel_request_axis_swap
    end

    def mouse_wheel_request_axis_swap=(mouse_wheel_request_axis_swap : Bool)
      @this.value.mouse_wheel_request_axis_swap = mouse_wheel_request_axis_swap
    end

    # Duration the mouse button has been down (0.0f == just clicked)
    def mouse_down_duration : Slice(Float32)
      @this.value.mouse_down_duration.to_slice
    end

    def mouse_down_duration=(mouse_down_duration : Slice(Float32))
      @this.value.mouse_down_duration = mouse_down_duration
    end

    # Previous time the mouse button has been down
    def mouse_down_duration_prev : Slice(Float32)
      @this.value.mouse_down_duration_prev.to_slice
    end

    def mouse_down_duration_prev=(mouse_down_duration_prev : Slice(Float32))
      @this.value.mouse_down_duration_prev = mouse_down_duration_prev
    end

    # Squared maximum distance of how much mouse has traveled from the clicking point (used for moving thresholds)
    def mouse_drag_max_distance_sqr : Slice(Float32)
      @this.value.mouse_drag_max_distance_sqr.to_slice
    end

    def mouse_drag_max_distance_sqr=(mouse_drag_max_distance_sqr : Slice(Float32))
      @this.value.mouse_drag_max_distance_sqr = mouse_drag_max_distance_sqr
    end

    # Touch/Pen pressure (0.0f to 1.0f, should be >0.0f only when MouseDown[0] == true). Helper storage currently unused by Dear ImGui.
    def pen_pressure : Float32
      @this.value.pen_pressure
    end

    def pen_pressure=(pen_pressure : Float32)
      @this.value.pen_pressure = pen_pressure
    end

    # Only modify via AddFocusEvent()
    def app_focus_lost : Bool
      @this.value.app_focus_lost
    end

    def app_focus_lost=(app_focus_lost : Bool)
      @this.value.app_focus_lost = app_focus_lost
    end

    # Only modify via SetAppAcceptingEvents()
    def app_accepting_events : Bool
      @this.value.app_accepting_events
    end

    def app_accepting_events=(app_accepting_events : Bool)
      @this.value.app_accepting_events = app_accepting_events
    end

    # -1: unknown, 0: using AddKeyEvent(), 1: using legacy io.KeysDown[]
    def backend_using_legacy_key_arrays : Int8
      @this.value.backend_using_legacy_key_arrays
    end

    def backend_using_legacy_key_arrays=(backend_using_legacy_key_arrays : Int8)
      @this.value.backend_using_legacy_key_arrays = backend_using_legacy_key_arrays
    end

    # 0: using AddKeyAnalogEvent(), 1: writing to legacy io.NavInputs[] directly
    def backend_using_legacy_nav_input_array : Bool
      @this.value.backend_using_legacy_nav_input_array
    end

    def backend_using_legacy_nav_input_array=(backend_using_legacy_nav_input_array : Bool)
      @this.value.backend_using_legacy_nav_input_array = backend_using_legacy_nav_input_array
    end

    # For AddInputCharacterUTF16()
    def input_queue_surrogate : ImWchar16
      @this.value.input_queue_surrogate
    end

    def input_queue_surrogate=(input_queue_surrogate : ImWchar16)
      @this.value.input_queue_surrogate = input_queue_surrogate
    end

    # Queue of _characters_ input (obtained by platform backend). Fill using AddInputCharacter() helper.
    def input_queue_characters : ImVector(ImWchar)
      t = @this.value.input_queue_characters
      pointerof(t).as(ImVector(ImWchar)*).value
    end

    def input_queue_characters=(input_queue_characters : ImVector(ImWchar))
      @this.value.input_queue_characters = input_queue_characters.as(LibImGui::ImVectorInternal*).value
    end

    # Queue a new key down/up event. Key should be "translated" (as in, generally ImGuiKey_A matches the key end-user would use to emit an 'A' character)
    #
    # [ImGuiIO::AddKeyEvent()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2055)
    def add_key_event(key : ImGuiKey, down : Bool) : Void
      LibImGui.ImGuiIO_AddKeyEvent(self, key, down)
    end

    # Queue a new key down/up event for analog values (e.g. ImGuiKey_Gamepad_ values). Dead-zones should be handled by the backend.
    #
    # [ImGuiIO::AddKeyAnalogEvent()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2056)
    def add_key_analog_event(key : ImGuiKey, down : Bool, v : Float32) : Void
      LibImGui.ImGuiIO_AddKeyAnalogEvent(self, key, down, v)
    end

    # Queue a mouse position update. Use -FLT_MAX,-FLT_MAX to signify no mouse (e.g. app not focused and not hovered)
    #
    # [ImGuiIO::AddMousePosEvent()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2057)
    def add_mouse_pos_event(x : Float32, y : Float32) : Void
      LibImGui.ImGuiIO_AddMousePosEvent(self, x, y)
    end

    # Queue a mouse button change
    #
    # [ImGuiIO::AddMouseButtonEvent()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2058)
    def add_mouse_button_event(button : Int32, down : Bool) : Void
      LibImGui.ImGuiIO_AddMouseButtonEvent(self, button, down)
    end

    # Queue a mouse wheel update. wheel_y<0: scroll down, wheel_y>0: scroll up, wheel_x<0: scroll right, wheel_x>0: scroll left.
    #
    # [ImGuiIO::AddMouseWheelEvent()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2059)
    def add_mouse_wheel_event(wheel_x : Float32, wheel_y : Float32) : Void
      LibImGui.ImGuiIO_AddMouseWheelEvent(self, wheel_x, wheel_y)
    end

    # Queue a mouse source change (Mouse/TouchScreen/Pen)
    #
    # [ImGuiIO::AddMouseSourceEvent()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2060)
    def add_mouse_source_event(source : ImGuiMouseSource) : Void
      LibImGui.ImGuiIO_AddMouseSourceEvent(self, source)
    end

    # Queue a gain/loss of focus for the application (generally based on OS/platform focus of your window)
    #
    # [ImGuiIO::AddFocusEvent()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2061)
    def add_focus_event(focused : Bool) : Void
      LibImGui.ImGuiIO_AddFocusEvent(self, focused)
    end

    # Queue a new character input
    #
    # [ImGuiIO::AddInputCharacter()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2062)
    def add_input_character(c : UInt32) : Void
      LibImGui.ImGuiIO_AddInputCharacter(self, c)
    end

    # Queue a new character input from a UTF-16 character, it can be a surrogate
    #
    # [ImGuiIO::AddInputCharacterUTF16()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2063)
    def add_input_character_utf16(c : ImWchar16) : Void
      LibImGui.ImGuiIO_AddInputCharacterUTF16(self, c)
    end

    # Queue a new characters input from a UTF-8 string
    #
    # [ImGuiIO::AddInputCharactersUTF8()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2064)
    def add_input_characters_utf8(str : String) : Void
      LibImGui.ImGuiIO_AddInputCharactersUTF8(self, str)
    end

    # [Optional] Specify index for legacy <1.87 IsKeyXXX() functions with native indices + specify native keycode, scancode.
    #
    # [ImGuiIO::SetKeyEventNativeData()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2066)
    def set_key_event_native_data(key : ImGuiKey, native_keycode : Int32, native_scancode : Int32, native_legacy_index : Int32 = -1) : Void
      LibImGui.ImGuiIO_SetKeyEventNativeData(self, key, native_keycode, native_scancode, native_legacy_index)
    end

    # Set master flag for accepting key/mouse/text events (default to true). Useful if you have native dialog boxes that are interrupting your application loop/refresh, and you want to disable events being queued while your app is frozen.
    #
    # [ImGuiIO::SetAppAcceptingEvents()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2067)
    def set_app_accepting_events(accepting_events : Bool) : Void
      LibImGui.ImGuiIO_SetAppAcceptingEvents(self, accepting_events)
    end

    # Clear all incoming events.
    #
    # [ImGuiIO::ClearEventsQueue()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2068)
    def clear_events_queue : Void
      LibImGui.ImGuiIO_ClearEventsQueue(self)
    end

    # Clear current keyboard/mouse/gamepad state + current frame text input buffer. Equivalent to releasing all keys/buttons.
    #
    # [ImGuiIO::ClearInputKeys()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2069)
    def clear_input_keys : Void
      LibImGui.ImGuiIO_ClearInputKeys(self)
    end

    # [ImGuiIO::ImGuiIO()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2149)
    def self.new : ImGuiIO
      result = LibImGui.ImGuiIO_ImGuiIO
      ImGuiIO.new(result)
    end
  end

  alias TopLevel::ImGuiIO = ImGui::ImGuiIO

  # [struct ImGuiInputTextCallbackData](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2165)
  struct ImGuiInputTextCallbackData
    include ClassType(LibImGui::ImGuiInputTextCallbackData)

    # Parent UI context
    def ctx : ImGuiContext?
      (v = @this.value.ctx) ? v.value : nil
    end

    def ctx=(ctx : ImGuiContext?)
      @this.value.ctx = ctx
    end

    # One ImGuiInputTextFlags_Callback*
    # Read-only
    def event_flag : ImGuiInputTextFlags
      @this.value.event_flag
    end

    def event_flag=(event_flag : ImGuiInputTextFlags)
      @this.value.event_flag = event_flag
    end

    # What user passed to InputText()
    # Read-only
    def flags : ImGuiInputTextFlags
      @this.value.flags
    end

    def flags=(flags : ImGuiInputTextFlags)
      @this.value.flags = flags
    end

    # What user passed to InputText()
    # Read-only
    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    # Character input
    # Read-write
    # [CharFilter] Replace character with another one, or set to zero to drop. return 1 is equivalent to setting EventChar=0;
    def event_char : ImWchar
      @this.value.event_char
    end

    def event_char=(event_char : ImWchar)
      @this.value.event_char = event_char
    end

    # Key pressed (Up/Down/TAB)
    # Read-only
    # [Completion,History]
    def event_key : ImGuiKey
      @this.value.event_key
    end

    def event_key=(event_key : ImGuiKey)
      @this.value.event_key = event_key
    end

    # Text buffer
    # Read-write
    # [Resize] Can replace pointer / [Completion,History,Always] Only write to pointed data, don't replace the actual pointer!
    def buf : LibC::Char*
      @this.value.buf
    end

    def buf=(buf : LibC::Char*)
      @this.value.buf = buf
    end

    # Text length (in bytes)
    # Read-write
    # [Resize,Completion,History,Always] Exclude zero-terminator storage. In C land: == strlen(some_text), in C++ land: string.length()
    def buf_text_len : Int32
      @this.value.buf_text_len
    end

    def buf_text_len=(buf_text_len : Int32)
      @this.value.buf_text_len = buf_text_len
    end

    # Buffer size (in bytes) = capacity+1
    # Read-only
    # [Resize,Completion,History,Always] Include zero-terminator storage. In C land == ARRAYSIZE(my_char_array), in C++ land: string.capacity()+1
    def buf_size : Int32
      @this.value.buf_size
    end

    def buf_size=(buf_size : Int32)
      @this.value.buf_size = buf_size
    end

    # Set if you modify Buf/BufTextLen!
    # Write
    # [Completion,History,Always]
    def buf_dirty : Bool
      @this.value.buf_dirty
    end

    def buf_dirty=(buf_dirty : Bool)
      @this.value.buf_dirty = buf_dirty
    end

    # Read-write
    # [Completion,History,Always]
    def cursor_pos : Int32
      @this.value.cursor_pos
    end

    def cursor_pos=(cursor_pos : Int32)
      @this.value.cursor_pos = cursor_pos
    end

    # Read-write
    # [Completion,History,Always] == to SelectionEnd when no selection)
    def selection_start : Int32
      @this.value.selection_start
    end

    def selection_start=(selection_start : Int32)
      @this.value.selection_start = selection_start
    end

    # Read-write
    # [Completion,History,Always]
    def selection_end : Int32
      @this.value.selection_end
    end

    def selection_end=(selection_end : Int32)
      @this.value.selection_end = selection_end
    end

    # [ImGuiInputTextCallbackData::ImGuiInputTextCallbackData()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2187)
    def self.new : ImGuiInputTextCallbackData
      result = LibImGui.ImGuiInputTextCallbackData_ImGuiInputTextCallbackData
      ImGuiInputTextCallbackData.new(result)
    end

    # [ImGuiInputTextCallbackData::DeleteChars()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2188)
    def delete_chars(pos : Int32, bytes_count : Int32) : Void
      LibImGui.ImGuiInputTextCallbackData_DeleteChars(self, pos, bytes_count)
    end

    # [ImGuiInputTextCallbackData::InsertChars()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2189)
    def insert_chars(pos : Int32, text : Bytes | String) : Void
      LibImGui.ImGuiInputTextCallbackData_InsertChars(self, pos, text, (text.to_unsafe + text.bytesize))
    end

    # [ImGuiInputTextCallbackData::SelectAll()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2190)
    def select_all : Void
      LibImGui.ImGuiInputTextCallbackData_SelectAll(self)
    end

    # [ImGuiInputTextCallbackData::ClearSelection()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2191)
    def clear_selection : Void
      LibImGui.ImGuiInputTextCallbackData_ClearSelection(self)
    end

    # [ImGuiInputTextCallbackData::HasSelection()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2192)
    def has_selection : Bool
      LibImGui.ImGuiInputTextCallbackData_HasSelection(self)
    end
  end

  alias TopLevel::ImGuiInputTextCallbackData = ImGui::ImGuiInputTextCallbackData

  # [struct ImGuiSizeCallbackData](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2197)
  struct ImGuiSizeCallbackData
    include ClassType(LibImGui::ImGuiSizeCallbackData)

    # Read-only.   What user passed to SetNextWindowSizeConstraints(). Generally store an integer or float in here (need reinterpret_cast<>).
    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    # Read-only.   Window position, for reference.
    def pos : ImVec2
      @this.value.pos
    end

    def pos=(pos : ImVec2)
      @this.value.pos = pos
    end

    # Read-only.   Current window size.
    def current_size : ImVec2
      @this.value.current_size
    end

    def current_size=(current_size : ImVec2)
      @this.value.current_size = current_size
    end

    # Read-write.  Desired size, based on user's mouse position. Write to this field to restrain resizing.
    def desired_size : ImVec2
      @this.value.desired_size
    end

    def desired_size=(desired_size : ImVec2)
      @this.value.desired_size = desired_size
    end
  end

  alias TopLevel::ImGuiSizeCallbackData = ImGui::ImGuiSizeCallbackData

  # [struct ImGuiPayload](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2206)
  struct ImGuiPayload
    include ClassType(LibImGui::ImGuiPayload)

    # Data (copied and owned by dear imgui)
    def data : Void*
      @this.value.data
    end

    def data=(data : Void*)
      @this.value.data = data
    end

    # Data size
    def data_size : Int32
      @this.value.data_size
    end

    def data_size=(data_size : Int32)
      @this.value.data_size = data_size
    end

    # Source item id
    def source_id : ImGuiID
      @this.value.source_id
    end

    def source_id=(source_id : ImGuiID)
      @this.value.source_id = source_id
    end

    # Source parent id (if available)
    def source_parent_id : ImGuiID
      @this.value.source_parent_id
    end

    def source_parent_id=(source_parent_id : ImGuiID)
      @this.value.source_parent_id = source_parent_id
    end

    # Data timestamp
    def data_frame_count : Int32
      @this.value.data_frame_count
    end

    def data_frame_count=(data_frame_count : Int32)
      @this.value.data_frame_count = data_frame_count
    end

    # Data type tag (short user-supplied string, 32 characters max)
    def data_type : Slice(LibC::Char)
      @this.value.data_type.to_slice
    end

    def data_type=(data_type : Slice(LibC::Char))
      @this.value.data_type = data_type
    end

    # Set when AcceptDragDropPayload() was called and mouse has been hovering the target item (nb: handle overlapping drag targets)
    def preview : Bool
      @this.value.preview
    end

    def preview=(preview : Bool)
      @this.value.preview = preview
    end

    # Set when AcceptDragDropPayload() was called and mouse button is released over the target item.
    def delivery : Bool
      @this.value.delivery
    end

    def delivery=(delivery : Bool)
      @this.value.delivery = delivery
    end

    # [ImGuiPayload::ImGuiPayload()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2220)
    def self.new : ImGuiPayload
      result = LibImGui.ImGuiPayload_ImGuiPayload
      ImGuiPayload.new(result)
    end

    # [ImGuiPayload::Clear()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2221)
    def clear : Void
      LibImGui.ImGuiPayload_Clear(self)
    end

    # [ImGuiPayload::IsDataType()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2222)
    def is_data_type(type : String) : Bool
      LibImGui.ImGuiPayload_IsDataType(self, type)
    end

    # [ImGuiPayload::IsPreview()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2223)
    def is_preview : Bool
      LibImGui.ImGuiPayload_IsPreview(self)
    end

    # [ImGuiPayload::IsDelivery()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2224)
    def is_delivery : Bool
      LibImGui.ImGuiPayload_IsDelivery(self)
    end
  end

  alias TopLevel::ImGuiPayload = ImGui::ImGuiPayload

  # [struct ImGuiTableColumnSortSpecs](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2228)
  struct ImGuiTableColumnSortSpecs
    include ClassType(LibImGui::ImGuiTableColumnSortSpecs)

    # User id of the column (if specified by a TableSetupColumn() call)
    def column_user_id : ImGuiID
      @this.value.column_user_id
    end

    def column_user_id=(column_user_id : ImGuiID)
      @this.value.column_user_id = column_user_id
    end

    # Index of the column
    def column_index : Int16
      @this.value.column_index
    end

    def column_index=(column_index : Int16)
      @this.value.column_index = column_index
    end

    # Index within parent ImGuiTableSortSpecs (always stored in order starting from 0, tables sorted on a single criteria will always have a 0 here)
    def sort_order : Int16
      @this.value.sort_order
    end

    def sort_order=(sort_order : Int16)
      @this.value.sort_order = sort_order
    end

    # ImGuiSortDirection_Ascending or ImGuiSortDirection_Descending (you can use this or SortSign, whichever is more convenient for your sort function)
    def sort_direction : ImGuiSortDirection
      @this.value.sort_direction
    end

    def sort_direction=(sort_direction : ImGuiSortDirection)
      @this.value.sort_direction = sort_direction
    end

    # [ImGuiTableColumnSortSpecs::ImGuiTableColumnSortSpecs()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2235)
    def self.new : ImGuiTableColumnSortSpecs
      result = LibImGui.ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs
      ImGuiTableColumnSortSpecs.new(result)
    end
  end

  alias TopLevel::ImGuiTableColumnSortSpecs = ImGui::ImGuiTableColumnSortSpecs

  # [struct ImGuiTableSortSpecs](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2242)
  struct ImGuiTableSortSpecs
    include ClassType(LibImGui::ImGuiTableSortSpecs)

    # Pointer to sort spec array.
    def specs : Slice(ImGuiTableColumnSortSpecs)
      Slice.new(@this.value.specs_count.to_i) { |i| ImGuiTableColumnSortSpecs.new(@this.value.specs + i) }
    end

    def specs=(specs : Slice(ImGuiTableColumnSortSpecs))
      @this.value.specs, @this.value.specs_count = specs.to_unsafe, specs.bytesize
    end

    # Sort spec count. Most often 1. May be > 1 when ImGuiTableFlags_SortMulti is enabled. May be == 0 when ImGuiTableFlags_SortTristate is enabled.
    def specs_count : Int32
      @this.value.specs_count
    end

    def specs_count=(specs_count : Int32)
      @this.value.specs_count = specs_count
    end

    # Set to true when specs have changed since last time! Use this to sort again, then clear the flag.
    def specs_dirty : Bool
      @this.value.specs_dirty
    end

    def specs_dirty=(specs_dirty : Bool)
      @this.value.specs_dirty = specs_dirty
    end

    # [ImGuiTableSortSpecs::ImGuiTableSortSpecs()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2248)
    def self.new : ImGuiTableSortSpecs?
      result = LibImGui.ImGuiTableSortSpecs_ImGuiTableSortSpecs
      result ? ImGuiTableSortSpecs.new(result) : nil
    end
  end

  alias TopLevel::ImGuiTableSortSpecs = ImGui::ImGuiTableSortSpecs

  # [struct ImGuiOnceUponAFrame](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2265)
  struct ImGuiOnceUponAFrame
    include StructType

    # [ImGuiOnceUponAFrame::ImGuiOnceUponAFrame()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2267)
    def self.new : ImGuiOnceUponAFrame
      result = LibImGui.ImGuiOnceUponAFrame_ImGuiOnceUponAFrame
      result.value
    end
  end

  # [struct ImGuiTextFilter](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2273)
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

    # [ImGuiTextFilter::ImGuiTextFilter()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2275)
    def self.new(default_filter : String = "") : ImGuiTextFilter
      result = LibImGui.ImGuiTextFilter_ImGuiTextFilter(default_filter)
      ImGuiTextFilter.new(result)
    end

    # Helper calling InputText+Build
    #
    # [ImGuiTextFilter::Draw()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2276)
    def draw(label : String = "Filter(inc,-exc)", width : Float32 = 0.0) : Bool
      LibImGui.ImGuiTextFilter_Draw(self, label, width)
    end

    # [ImGuiTextFilter::PassFilter()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2277)
    def pass_filter(text : Bytes | String) : Bool
      LibImGui.ImGuiTextFilter_PassFilter(self, text, (text.to_unsafe + text.bytesize))
    end

    # [ImGuiTextFilter::Build()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2278)
    def build : Void
      LibImGui.ImGuiTextFilter_Build(self)
    end

    # [ImGuiTextFilter::Clear()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2279)
    def clear : Void
      LibImGui.ImGuiTextFilter_Clear(self)
    end

    # [ImGuiTextFilter::IsActive()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2280)
    def is_active : Bool
      LibImGui.ImGuiTextFilter_IsActive(self)
    end
  end

  alias TopLevel::ImGuiTextFilter = ImGui::ImGuiTextFilter

  # [struct ImGuiStorage](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2327)
  struct ImGuiStorage
    include StructType

    def data : ImVector(LibImGui::ImGuiStoragePair)
      t = @data
      pointerof(t).as(ImVector(LibImGui::ImGuiStoragePair)*).value
    end

    def data=(data : ImVector(LibImGui::ImGuiStoragePair))
      @data = data.as(LibImGui::ImVectorInternal*).value
    end

    # [ImGuiStorage::Clear()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2344)
    def clear : Void
      LibImGui.ImGuiStorage_Clear(self)
    end

    # [ImGuiStorage::GetInt()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2345)
    def get_int(key : ImGuiID, default_val : Int32 = 0) : Int32
      LibImGui.ImGuiStorage_GetInt(self, key, default_val)
    end

    # [ImGuiStorage::SetInt()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2346)
    def set_int(key : ImGuiID, val : Int32) : Void
      LibImGui.ImGuiStorage_SetInt(self, key, val)
    end

    # [ImGuiStorage::GetBool()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2347)
    def get_bool(key : ImGuiID, default_val : Bool = false) : Bool
      LibImGui.ImGuiStorage_GetBool(self, key, default_val)
    end

    # [ImGuiStorage::SetBool()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2348)
    def set_bool(key : ImGuiID, val : Bool) : Void
      LibImGui.ImGuiStorage_SetBool(self, key, val)
    end

    # [ImGuiStorage::GetFloat()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2349)
    def get_float(key : ImGuiID, default_val : Float32 = 0.0) : Float32
      LibImGui.ImGuiStorage_GetFloat(self, key, default_val)
    end

    # [ImGuiStorage::SetFloat()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2350)
    def set_float(key : ImGuiID, val : Float32) : Void
      LibImGui.ImGuiStorage_SetFloat(self, key, val)
    end

    # default_val is NULL
    #
    # [ImGuiStorage::GetVoidPtr()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2351)
    def get_void_ptr(key : ImGuiID) : Void*
      LibImGui.ImGuiStorage_GetVoidPtr(self, key)
    end

    # [ImGuiStorage::SetVoidPtr()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2352)
    def set_void_ptr(key : ImGuiID, val : Void*) : Void
      LibImGui.ImGuiStorage_SetVoidPtr(self, key, val)
    end

    # [ImGuiStorage::GetIntRef()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2358)
    def get_int_ref(key : ImGuiID, default_val : Int32 = 0) : Int32*
      LibImGui.ImGuiStorage_GetIntRef(self, key, default_val)
    end

    # [ImGuiStorage::GetBoolRef()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2359)
    def get_bool_ref(key : ImGuiID, default_val : Bool = false) : Bool*
      LibImGui.ImGuiStorage_GetBoolRef(self, key, default_val)
    end

    # [ImGuiStorage::GetFloatRef()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2360)
    def get_float_ref(key : ImGuiID, default_val : Float32 = 0.0) : Float32*
      LibImGui.ImGuiStorage_GetFloatRef(self, key, default_val)
    end

    # [ImGuiStorage::GetVoidPtrRef()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2361)
    def get_void_ptr_ref(key : ImGuiID, default_val : Void* = Pointer(Void).null) : Void**
      LibImGui.ImGuiStorage_GetVoidPtrRef(self, key, default_val)
    end

    # [ImGuiStorage::SetAllInt()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2364)
    def set_all_int(val : Int32) : Void
      LibImGui.ImGuiStorage_SetAllInt(self, val)
    end

    # [ImGuiStorage::BuildSortByKey()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2367)
    def build_sort_by_key : Void
      LibImGui.ImGuiStorage_BuildSortByKey(self)
    end
  end

  # [struct ImGuiListClipper](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2390)
  struct ImGuiListClipper
    include StructType

    # [ImGuiListClipper::ImGuiListClipper()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2402)
    def self.new : ImGuiListClipper
      result = LibImGui.ImGuiListClipper_ImGuiListClipper
      result.value
    end

    # [ImGuiListClipper::Begin()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2404)
    def begin(items_count : Int32, items_height : Float32 = -1.0) : Void
      LibImGui.ImGuiListClipper_Begin(self, items_count, items_height)
    end

    # Automatically called on the last call of Step() that returns false.
    #
    # [ImGuiListClipper::End()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2405)
    def end : Void
      LibImGui.ImGuiListClipper_End(self)
    end

    # Call until it returns false. The DisplayStart/DisplayEnd fields will be set and you can process/draw those items.
    #
    # [ImGuiListClipper::Step()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2406)
    def step : Bool
      LibImGui.ImGuiListClipper_Step(self)
    end

    # [ImGuiListClipper::IncludeItemByIndex()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2410)
    def include_item_by_index(item_index : Int32) : Void
      LibImGui.ImGuiListClipper_IncludeItemByIndex(self, item_index)
    end

    # item_end is exclusive e.g. use (42, 42+1) to make item 42 never clipped.
    #
    # [ImGuiListClipper::IncludeItemsByIndex()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2411)
    def include_items_by_index(item_begin : Int32, item_end : Int32) : Void
      LibImGui.ImGuiListClipper_IncludeItemsByIndex(self, item_begin, item_end)
    end
  end

  # [struct ImColor](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2472)
  struct ImColor
    include StructType

    # [ImColor::ImColor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2476)
    def self.new : ImColor
      result = LibImGui.ImColor_ImColor_Nil
      result.value
    end

    # [ImColor::ImColor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2477)
    def self.new(r : Float32, g : Float32, b : Float32, a : Float32 = 1.0) : ImColor
      result = LibImGui.ImColor_ImColor_Float(r, g, b, a)
      result.value
    end

    # [ImColor::ImColor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2478)
    def self.new(col : ImVec4) : ImColor
      result = LibImGui.ImColor_ImColor_Vec4(col)
      result.value
    end

    # [ImColor::ImColor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2479)
    def self.new(r : Int32, g : Int32, b : Int32, a : Int32 = 255) : ImColor
      result = LibImGui.ImColor_ImColor_Int(r, g, b, a)
      result.value
    end

    # [ImColor::ImColor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2480)
    def self.new(rgba : UInt32) : ImColor
      result = LibImGui.ImColor_ImColor_U32(rgba)
      result.value
    end

    # [ImColor::SetHSV()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2485)
    def set_hsv(h : Float32, s : Float32, v : Float32, a : Float32 = 1.0) : Void
      LibImGui.ImColor_SetHSV(self, h, s, v, a)
    end

    # [ImColor::HSV()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2486)
    def hsv(h : Float32, s : Float32, v : Float32, a : Float32 = 1.0) : ImGui::ImColor
      LibImGui.ImColor_HSV(out p_out, h, s, v, a)
      p_out
    end
  end

  # [struct ImDrawCmd](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2521)
  struct ImDrawCmd
    include ClassType(LibImGui::ImDrawCmd)

    # 4*4
    # Clipping rectangle (x1, y1, x2, y2). Subtract ImDrawData->DisplayPos to get clipping rectangle in "viewport" coordinates
    def clip_rect : ImVec4
      @this.value.clip_rect
    end

    def clip_rect=(clip_rect : ImVec4)
      @this.value.clip_rect = clip_rect
    end

    # 4-8
    # User-provided texture ID. Set by user in ImfontAtlas::SetTexID() for fonts or passed to Image*() functions. Ignore if never using images or multiple fonts atlas.
    def texture_id : ImTextureID
      @this.value.texture_id
    end

    def texture_id=(texture_id : ImTextureID)
      @this.value.texture_id = texture_id
    end

    # 4
    # Start offset in vertex buffer. ImGuiBackendFlags_RendererHasVtxOffset: always 0, otherwise may be >0 to support meshes larger than 64K vertices with 16-bit indices.
    def vtx_offset : UInt32
      @this.value.vtx_offset
    end

    def vtx_offset=(vtx_offset : UInt32)
      @this.value.vtx_offset = vtx_offset
    end

    # 4
    # Start offset in index buffer.
    def idx_offset : UInt32
      @this.value.idx_offset
    end

    def idx_offset=(idx_offset : UInt32)
      @this.value.idx_offset = idx_offset
    end

    # 4
    # Number of indices (multiple of 3) to be rendered as triangles. Vertices are stored in the callee ImDrawList's vtx_buffer[] array, indices in idx_buffer[].
    def elem_count : UInt32
      @this.value.elem_count
    end

    def elem_count=(elem_count : UInt32)
      @this.value.elem_count = elem_count
    end

    # 4-8
    # If != NULL, call the function instead of rendering the vertices. clip_rect and texture_id will be set normally.
    def user_callback : ImDrawCallback
      @this.value.user_callback
    end

    def user_callback=(user_callback : ImDrawCallback)
      @this.value.user_callback = user_callback
    end

    # 4-8
    # The draw callback code can access this.
    def user_callback_data : Void*
      @this.value.user_callback_data
    end

    def user_callback_data=(user_callback_data : Void*)
      @this.value.user_callback_data = user_callback_data
    end

    # Also ensure our padding fields are zeroed
    #
    # [ImDrawCmd::ImDrawCmd()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2531)
    def self.new : ImDrawCmd
      result = LibImGui.ImDrawCmd_ImDrawCmd
      ImDrawCmd.new(result)
    end

    # [ImDrawCmd::GetTexID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2534)
    def get_tex_id : ImTextureID
      LibImGui.ImDrawCmd_GetTexID(self)
    end
  end

  alias TopLevel::ImDrawCmd = ImGui::ImDrawCmd

  # [struct ImDrawVert](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2539)
  struct ImDrawVert
    include StructType
  end

  # [struct ImDrawCmdHeader](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2554)
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

  # [struct ImDrawChannel](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2562)
  struct ImDrawChannel
    include StructType
  end

  # [struct ImDrawListSplitter](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2571)
  struct ImDrawListSplitter
    include ClassType(LibImGui::ImDrawListSplitter)

    # [ImDrawListSplitter::ImDrawListSplitter()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2577)
    def self.new : ImDrawListSplitter
      result = LibImGui.ImDrawListSplitter_ImDrawListSplitter
      ImDrawListSplitter.new(result)
    end

    # Do not clear Channels[] so our allocations are reused next frame
    #
    # [ImDrawListSplitter::Clear()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2579)
    def clear : Void
      LibImGui.ImDrawListSplitter_Clear(self)
    end

    # [ImDrawListSplitter::ClearFreeMemory()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2580)
    def clear_free_memory : Void
      LibImGui.ImDrawListSplitter_ClearFreeMemory(self)
    end

    # [ImDrawListSplitter::Split()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2581)
    def split(draw_list : ImDrawList, count : Int32) : Void
      LibImGui.ImDrawListSplitter_Split(self, draw_list, count)
    end

    # [ImDrawListSplitter::Merge()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2582)
    def merge(draw_list : ImDrawList) : Void
      LibImGui.ImDrawListSplitter_Merge(self, draw_list)
    end

    # [ImDrawListSplitter::SetCurrentChannel()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2583)
    def set_current_channel(draw_list : ImDrawList, channel_idx : Int32) : Void
      LibImGui.ImDrawListSplitter_SetCurrentChannel(self, draw_list, channel_idx)
    end
  end

  alias TopLevel::ImDrawListSplitter = ImGui::ImDrawListSplitter

  # [struct ImDrawList](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2626)
  struct ImDrawList
    include ClassType(LibImGui::ImDrawList)

    # Draw commands. Typically 1 command = 1 GPU draw call, unless the command is a callback.
    def cmd_buffer : ImVector(LibImGui::ImDrawCmd)
      t = @this.value.cmd_buffer
      pointerof(t).as(ImVector(LibImGui::ImDrawCmd)*).value
    end

    def cmd_buffer=(cmd_buffer : ImVector(LibImGui::ImDrawCmd))
      @this.value.cmd_buffer = cmd_buffer.as(LibImGui::ImVectorInternal*).value
    end

    # Index buffer. Each command consume ImDrawCmd::ElemCount of those
    def idx_buffer : ImVector(ImDrawIdx)
      t = @this.value.idx_buffer
      pointerof(t).as(ImVector(ImDrawIdx)*).value
    end

    def idx_buffer=(idx_buffer : ImVector(ImDrawIdx))
      @this.value.idx_buffer = idx_buffer.as(LibImGui::ImVectorInternal*).value
    end

    # Vertex buffer.
    def vtx_buffer : ImVector(ImDrawVert)
      t = @this.value.vtx_buffer
      pointerof(t).as(ImVector(ImDrawVert)*).value
    end

    def vtx_buffer=(vtx_buffer : ImVector(ImDrawVert))
      @this.value.vtx_buffer = vtx_buffer.as(LibImGui::ImVectorInternal*).value
    end

    # Flags, you may poke into these to adjust anti-aliasing settings per-primitive.
    def flags : ImDrawListFlags
      @this.value.flags
    end

    def flags=(flags : ImDrawListFlags)
      @this.value.flags = flags
    end

    # [ImDrawList::ImDrawList()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2648)
    def self.new(shared_data : ImDrawListSharedData) : ImDrawList
      result = LibImGui.ImDrawList_ImDrawList(shared_data)
      ImDrawList.new(result)
    end

    # Render-level scissoring. This is passed down to your render function but not used for CPU-side coarse clipping. Prefer using higher-level ImGui::PushClipRect() to affect logic (hit-testing and widget culling)
    #
    # [ImDrawList::PushClipRect()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2651)
    def push_clip_rect(clip_rect_min : ImVec2, clip_rect_max : ImVec2, intersect_with_current_clip_rect : Bool = false) : Void
      LibImGui.ImDrawList_PushClipRect(self, clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
    end

    # [ImDrawList::PushClipRectFullScreen()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2652)
    def push_clip_rect_full_screen : Void
      LibImGui.ImDrawList_PushClipRectFullScreen(self)
    end

    # [ImDrawList::PopClipRect()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2653)
    def pop_clip_rect : Void
      LibImGui.ImDrawList_PopClipRect(self)
    end

    # [ImDrawList::PushTextureID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2654)
    def push_texture_id(texture_id : ImTextureID) : Void
      LibImGui.ImDrawList_PushTextureID(self, texture_id)
    end

    # [ImDrawList::PopTextureID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2655)
    def pop_texture_id : Void
      LibImGui.ImDrawList_PopTextureID(self)
    end

    # [ImDrawList::GetClipRectMin()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2656)
    def get_clip_rect_min : ImGui::ImVec2
      LibImGui.ImDrawList_GetClipRectMin(out p_out, self)
      p_out
    end

    # [ImDrawList::GetClipRectMax()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2657)
    def get_clip_rect_max : ImGui::ImVec2
      LibImGui.ImDrawList_GetClipRectMax(out p_out, self)
      p_out
    end

    # [ImDrawList::AddLine()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2666)
    def add_line(p1 : ImVec2, p2 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddLine(self, p1, p2, col, thickness)
    end

    # a: upper-left, b: lower-right (== upper-left + size)
    #
    # [ImDrawList::AddRect()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2667)
    def add_rect(p_min : ImVec2, p_max : ImVec2, col : UInt32, rounding : Float32 = 0.0, flags : ImDrawFlags = ImDrawFlags.new(0), thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddRect(self, p_min, p_max, col, rounding, flags, thickness)
    end

    # a: upper-left, b: lower-right (== upper-left + size)
    #
    # [ImDrawList::AddRectFilled()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2668)
    def add_rect_filled(p_min : ImVec2, p_max : ImVec2, col : UInt32, rounding : Float32 = 0.0, flags : ImDrawFlags = ImDrawFlags.new(0)) : Void
      LibImGui.ImDrawList_AddRectFilled(self, p_min, p_max, col, rounding, flags)
    end

    # [ImDrawList::AddRectFilledMultiColor()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2669)
    def add_rect_filled_multi_color(p_min : ImVec2, p_max : ImVec2, col_upr_left : UInt32, col_upr_right : UInt32, col_bot_right : UInt32, col_bot_left : UInt32) : Void
      LibImGui.ImDrawList_AddRectFilledMultiColor(self, p_min, p_max, col_upr_left, col_upr_right, col_bot_right, col_bot_left)
    end

    # [ImDrawList::AddQuad()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2670)
    def add_quad(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddQuad(self, p1, p2, p3, p4, col, thickness)
    end

    # [ImDrawList::AddQuadFilled()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2671)
    def add_quad_filled(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_AddQuadFilled(self, p1, p2, p3, p4, col)
    end

    # [ImDrawList::AddTriangle()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2672)
    def add_triangle(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddTriangle(self, p1, p2, p3, col, thickness)
    end

    # [ImDrawList::AddTriangleFilled()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2673)
    def add_triangle_filled(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_AddTriangleFilled(self, p1, p2, p3, col)
    end

    # [ImDrawList::AddCircle()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2674)
    def add_circle(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32 = 0, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddCircle(self, center, radius, col, num_segments, thickness)
    end

    # [ImDrawList::AddCircleFilled()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2675)
    def add_circle_filled(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_AddCircleFilled(self, center, radius, col, num_segments)
    end

    # [ImDrawList::AddNgon()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2676)
    def add_ngon(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddNgon(self, center, radius, col, num_segments, thickness)
    end

    # [ImDrawList::AddNgonFilled()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2677)
    def add_ngon_filled(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32) : Void
      LibImGui.ImDrawList_AddNgonFilled(self, center, radius, col, num_segments)
    end

    # [ImDrawList::AddText()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2678)
    def add_text(pos : ImVec2, col : UInt32, text : Bytes | String) : Void
      LibImGui.ImDrawList_AddText_Vec2(self, pos, col, text, (text.to_unsafe + text.bytesize))
    end

    # [ImDrawList::AddText()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2679)
    def add_text(font : ImFont, font_size : Float32, pos : ImVec2, col : UInt32, text : Bytes | String, wrap_width : Float32 = 0.0, cpu_fine_clip_rect : ImVec4* = Pointer(ImVec4).null) : Void
      LibImGui.ImDrawList_AddText_FontPtr(self, font, font_size, pos, col, text, (text.to_unsafe + text.bytesize), wrap_width, cpu_fine_clip_rect)
    end

    # [ImDrawList::AddPolyline()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2680)
    def add_polyline(points : ImVec2*, num_points : Int32, col : UInt32, flags : ImDrawFlags, thickness : Float32) : Void
      LibImGui.ImDrawList_AddPolyline(self, points, num_points, col, flags, thickness)
    end

    # [ImDrawList::AddConvexPolyFilled()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2681)
    def add_convex_poly_filled(points : ImVec2*, num_points : Int32, col : UInt32) : Void
      LibImGui.ImDrawList_AddConvexPolyFilled(self, points, num_points, col)
    end

    # Cubic Bezier (4 control points)
    #
    # [ImDrawList::AddBezierCubic()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2682)
    def add_bezier_cubic(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32, thickness : Float32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_AddBezierCubic(self, p1, p2, p3, p4, col, thickness, num_segments)
    end

    # Quadratic Bezier (3 control points)
    #
    # [ImDrawList::AddBezierQuadratic()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2683)
    def add_bezier_quadratic(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, col : UInt32, thickness : Float32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_AddBezierQuadratic(self, p1, p2, p3, col, thickness, num_segments)
    end

    # [ImDrawList::AddImage()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2689)
    def add_image(user_texture_id : ImTextureID, p_min : ImVec2, p_max : ImVec2, uv_min : ImVec2 = ImVec2.new(0, 0), uv_max : ImVec2 = ImVec2.new(1, 1), col : UInt32 = 4294967295) : Void
      LibImGui.ImDrawList_AddImage(self, user_texture_id, p_min, p_max, uv_min, uv_max, col)
    end

    # [ImDrawList::AddImageQuad()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2690)
    def add_image_quad(user_texture_id : ImTextureID, p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, uv1 : ImVec2 = ImVec2.new(0, 0), uv2 : ImVec2 = ImVec2.new(1, 0), uv3 : ImVec2 = ImVec2.new(1, 1), uv4 : ImVec2 = ImVec2.new(0, 1), col : UInt32 = 4294967295) : Void
      LibImGui.ImDrawList_AddImageQuad(self, user_texture_id, p1, p2, p3, p4, uv1, uv2, uv3, uv4, col)
    end

    # [ImDrawList::AddImageRounded()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2691)
    def add_image_rounded(user_texture_id : ImTextureID, p_min : ImVec2, p_max : ImVec2, uv_min : ImVec2, uv_max : ImVec2, col : UInt32, rounding : Float32, flags : ImDrawFlags = ImDrawFlags.new(0)) : Void
      LibImGui.ImDrawList_AddImageRounded(self, user_texture_id, p_min, p_max, uv_min, uv_max, col, rounding, flags)
    end

    # [ImDrawList::PathClear()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2695)
    def path_clear : Void
      LibImGui.ImDrawList_PathClear(self)
    end

    # [ImDrawList::PathLineTo()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2696)
    def path_line_to(pos : ImVec2) : Void
      LibImGui.ImDrawList_PathLineTo(self, pos)
    end

    # [ImDrawList::PathLineToMergeDuplicate()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2697)
    def path_line_to_merge_duplicate(pos : ImVec2) : Void
      LibImGui.ImDrawList_PathLineToMergeDuplicate(self, pos)
    end

    # [ImDrawList::PathFillConvex()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2698)
    def path_fill_convex(col : UInt32) : Void
      LibImGui.ImDrawList_PathFillConvex(self, col)
    end

    # [ImDrawList::PathStroke()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2699)
    def path_stroke(col : UInt32, flags : ImDrawFlags = ImDrawFlags.new(0), thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_PathStroke(self, col, flags, thickness)
    end

    # [ImDrawList::PathArcTo()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2700)
    def path_arc_to(center : ImVec2, radius : Float32, a_min : Float32, a_max : Float32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_PathArcTo(self, center, radius, a_min, a_max, num_segments)
    end

    # Use precomputed angles for a 12 steps circle
    #
    # [ImDrawList::PathArcToFast()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2701)
    def path_arc_to_fast(center : ImVec2, radius : Float32, a_min_of_12 : Int32, a_max_of_12 : Int32) : Void
      LibImGui.ImDrawList_PathArcToFast(self, center, radius, a_min_of_12, a_max_of_12)
    end

    # Cubic Bezier (4 control points)
    #
    # [ImDrawList::PathBezierCubicCurveTo()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2702)
    def path_bezier_cubic_curve_to(p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_PathBezierCubicCurveTo(self, p2, p3, p4, num_segments)
    end

    # Quadratic Bezier (3 control points)
    #
    # [ImDrawList::PathBezierQuadraticCurveTo()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2703)
    def path_bezier_quadratic_curve_to(p2 : ImVec2, p3 : ImVec2, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_PathBezierQuadraticCurveTo(self, p2, p3, num_segments)
    end

    # [ImDrawList::PathRect()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2704)
    def path_rect(rect_min : ImVec2, rect_max : ImVec2, rounding : Float32 = 0.0, flags : ImDrawFlags = ImDrawFlags.new(0)) : Void
      LibImGui.ImDrawList_PathRect(self, rect_min, rect_max, rounding, flags)
    end

    # Your rendering function must check for 'UserCallback' in ImDrawCmd and call the function instead of rendering triangles.
    #
    # [ImDrawList::AddCallback()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2707)
    def add_callback(callback : ImDrawCallback, callback_data : Void*) : Void
      LibImGui.ImDrawList_AddCallback(self, callback, callback_data)
    end

    # This is useful if you need to forcefully create a new draw call (to allow for dependent rendering / blending). Otherwise primitives are merged into the same draw-call as much as possible
    #
    # [ImDrawList::AddDrawCmd()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2708)
    def add_draw_cmd : Void
      LibImGui.ImDrawList_AddDrawCmd(self)
    end

    # Create a clone of the CmdBuffer/IdxBuffer/VtxBuffer.
    #
    # [ImDrawList::CloneOutput()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2709)
    def clone_output : ImDrawList
      result = LibImGui.ImDrawList_CloneOutput(self)
      ImDrawList.new(result)
    end

    # [ImDrawList::ChannelsSplit()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2717)
    def channels_split(count : Int32) : Void
      LibImGui.ImDrawList_ChannelsSplit(self, count)
    end

    # [ImDrawList::ChannelsMerge()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2718)
    def channels_merge : Void
      LibImGui.ImDrawList_ChannelsMerge(self)
    end

    # [ImDrawList::ChannelsSetCurrent()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2719)
    def channels_set_current(n : Int32) : Void
      LibImGui.ImDrawList_ChannelsSetCurrent(self, n)
    end

    # [ImDrawList::PrimReserve()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2724)
    def prim_reserve(idx_count : Int32, vtx_count : Int32) : Void
      LibImGui.ImDrawList_PrimReserve(self, idx_count, vtx_count)
    end

    # [ImDrawList::PrimUnreserve()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2725)
    def prim_unreserve(idx_count : Int32, vtx_count : Int32) : Void
      LibImGui.ImDrawList_PrimUnreserve(self, idx_count, vtx_count)
    end

    # Axis aligned rectangle (composed of two triangles)
    #
    # [ImDrawList::PrimRect()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2726)
    def prim_rect(a : ImVec2, b : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimRect(self, a, b, col)
    end

    # [ImDrawList::PrimRectUV()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2727)
    def prim_rect_uv(a : ImVec2, b : ImVec2, uv_a : ImVec2, uv_b : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimRectUV(self, a, b, uv_a, uv_b, col)
    end

    # [ImDrawList::PrimQuadUV()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2728)
    def prim_quad_uv(a : ImVec2, b : ImVec2, c : ImVec2, d : ImVec2, uv_a : ImVec2, uv_b : ImVec2, uv_c : ImVec2, uv_d : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimQuadUV(self, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col)
    end

    # [ImDrawList::PrimWriteVtx()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2729)
    def prim_write_vtx(pos : ImVec2, uv : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimWriteVtx(self, pos, uv, col)
    end

    # [ImDrawList::PrimWriteIdx()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2730)
    def prim_write_idx(idx : ImDrawIdx) : Void
      LibImGui.ImDrawList_PrimWriteIdx(self, idx)
    end

    # Write vertex with unique index
    #
    # [ImDrawList::PrimVtx()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2731)
    def prim_vtx(pos : ImVec2, uv : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimVtx(self, pos, uv, col)
    end
  end

  alias TopLevel::ImDrawList = ImGui::ImDrawList

  # [struct ImDrawData](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2753)
  struct ImDrawData
    include ClassType(LibImGui::ImDrawData)

    # Only valid after Render() is called and before the next NewFrame() is called.
    def valid : Bool
      @this.value.valid
    end

    def valid=(valid : Bool)
      @this.value.valid = valid
    end

    # Number of ImDrawList* to render (should always be == CmdLists.size)
    def cmd_lists_count : Int32
      @this.value.cmd_lists_count
    end

    def cmd_lists_count=(cmd_lists_count : Int32)
      @this.value.cmd_lists_count = cmd_lists_count
    end

    # For convenience, sum of all ImDrawList's IdxBuffer.Size
    def total_idx_count : Int32
      @this.value.total_idx_count
    end

    def total_idx_count=(total_idx_count : Int32)
      @this.value.total_idx_count = total_idx_count
    end

    # For convenience, sum of all ImDrawList's VtxBuffer.Size
    def total_vtx_count : Int32
      @this.value.total_vtx_count
    end

    def total_vtx_count=(total_vtx_count : Int32)
      @this.value.total_vtx_count = total_vtx_count
    end

    # Array of ImDrawList* to render. The ImDrawLists are owned by ImGuiContext and only pointed to from here.
    def cmd_lists : ImVector(ImDrawList)
      t = @this.value.cmd_lists
      pointerof(t).as(ImVector(ImDrawList)*).value
    end

    def cmd_lists=(cmd_lists : ImVector(ImDrawList))
      @this.value.cmd_lists = cmd_lists.as(LibImGui::ImVectorInternal*).value
    end

    # Top-left position of the viewport to render (== top-left of the orthogonal projection matrix to use) (== GetMainViewport()->Pos for the main viewport, == (0.0) in most single-viewport applications)
    def display_pos : ImVec2
      @this.value.display_pos
    end

    def display_pos=(display_pos : ImVec2)
      @this.value.display_pos = display_pos
    end

    # Size of the viewport to render (== GetMainViewport()->Size for the main viewport, == io.DisplaySize in most single-viewport applications)
    def display_size : ImVec2
      @this.value.display_size
    end

    def display_size=(display_size : ImVec2)
      @this.value.display_size = display_size
    end

    # Amount of pixels for each unit of DisplaySize. Based on io.DisplayFramebufferScale. Generally (1,1) on normal display, (2,2) on OSX with Retina display.
    def framebuffer_scale : ImVec2
      @this.value.framebuffer_scale
    end

    def framebuffer_scale=(framebuffer_scale : ImVec2)
      @this.value.framebuffer_scale = framebuffer_scale
    end

    # Viewport carrying the ImDrawData instance, might be of use to the renderer (generally not).
    def owner_viewport : ImGuiViewport
      ImGuiViewport.new(@this.value.owner_viewport)
    end

    def owner_viewport=(owner_viewport : ImGuiViewport)
      @this.value.owner_viewport = owner_viewport
    end

    # [ImDrawData::ImDrawData()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2766)
    def self.new : ImDrawData
      result = LibImGui.ImDrawData_ImDrawData
      ImDrawData.new(result)
    end

    # [ImDrawData::Clear()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2767)
    def clear : Void
      LibImGui.ImDrawData_Clear(self)
    end

    # Helper to add an external draw list into an existing ImDrawData.
    #
    # [ImDrawData::AddDrawList()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2768)
    def add_draw_list(draw_list : ImDrawList) : Void
      LibImGui.ImDrawData_AddDrawList(self, draw_list)
    end

    # Helper to convert all buffers from indexed to non-indexed, in case you cannot render indexed. Note: this is slow and most likely a waste of resources. Always prefer indexed rendering!
    #
    # [ImDrawData::DeIndexAllBuffers()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2769)
    def de_index_all_buffers : Void
      LibImGui.ImDrawData_DeIndexAllBuffers(self)
    end

    # Helper to scale the ClipRect field of each ImDrawCmd. Use if your final output buffer is at a different scale than Dear ImGui expects, or if there is a difference between your window resolution and framebuffer resolution.
    #
    # [ImDrawData::ScaleClipRects()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2770)
    def scale_clip_rects(fb_scale : ImVec2) : Void
      LibImGui.ImDrawData_ScaleClipRects(self, fb_scale)
    end
  end

  alias TopLevel::ImDrawData = ImGui::ImDrawData

  # [struct ImFontConfig](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2777)
  struct ImFontConfig
    include ClassType(LibImGui::ImFontConfig)

    # TTF/OTF data
    def font_data : Void*
      @this.value.font_data
    end

    def font_data=(font_data : Void*)
      @this.value.font_data = font_data
    end

    # TTF/OTF data size
    def font_data_size : Int32
      @this.value.font_data_size
    end

    def font_data_size=(font_data_size : Int32)
      @this.value.font_data_size = font_data_size
    end

    # true
    # TTF/OTF data ownership taken by the container ImFontAtlas (will delete memory itself).
    def font_data_owned_by_atlas : Bool
      @this.value.font_data_owned_by_atlas
    end

    def font_data_owned_by_atlas=(font_data_owned_by_atlas : Bool)
      @this.value.font_data_owned_by_atlas = font_data_owned_by_atlas
    end

    # 0
    # Index of font within TTF/OTF file
    def font_no : Int32
      @this.value.font_no
    end

    def font_no=(font_no : Int32)
      @this.value.font_no = font_no
    end

    # Size in pixels for rasterizer (more or less maps to the resulting font height).
    def size_pixels : Float32
      @this.value.size_pixels
    end

    def size_pixels=(size_pixels : Float32)
      @this.value.size_pixels = size_pixels
    end

    # 2
    # Rasterize at higher quality for sub-pixel positioning. Note the difference between 2 and 3 is minimal. You can reduce this to 1 for large glyphs save memory. Read https://github.com/nothings/stb/blob/master/tests/oversample/README.md for details.
    def oversample_h : Int32
      @this.value.oversample_h
    end

    def oversample_h=(oversample_h : Int32)
      @this.value.oversample_h = oversample_h
    end

    # 1
    # Rasterize at higher quality for sub-pixel positioning. This is not really useful as we don't use sub-pixel positions on the Y axis.
    def oversample_v : Int32
      @this.value.oversample_v
    end

    def oversample_v=(oversample_v : Int32)
      @this.value.oversample_v = oversample_v
    end

    # false
    # Align every glyph to pixel boundary. Useful e.g. if you are merging a non-pixel aligned font with the default font. If enabled, you can set OversampleH/V to 1.
    def pixel_snap_h : Bool
      @this.value.pixel_snap_h
    end

    def pixel_snap_h=(pixel_snap_h : Bool)
      @this.value.pixel_snap_h = pixel_snap_h
    end

    # 0, 0
    # Extra spacing (in pixels) between glyphs. Only X axis is supported for now.
    def glyph_extra_spacing : ImVec2
      @this.value.glyph_extra_spacing
    end

    def glyph_extra_spacing=(glyph_extra_spacing : ImVec2)
      @this.value.glyph_extra_spacing = glyph_extra_spacing
    end

    # 0, 0
    # Offset all glyphs from this font input.
    def glyph_offset : ImVec2
      @this.value.glyph_offset
    end

    def glyph_offset=(glyph_offset : ImVec2)
      @this.value.glyph_offset = glyph_offset
    end

    # NULL
    # THE ARRAY DATA NEEDS TO PERSIST AS LONG AS THE FONT IS ALIVE. Pointer to a user-provided list of Unicode range (2 value per range, values are inclusive, zero-terminated list).
    def glyph_ranges : ImWchar*
      @this.value.glyph_ranges
    end

    def glyph_ranges=(glyph_ranges : ImWchar*)
      @this.value.glyph_ranges = glyph_ranges
    end

    # 0
    # Minimum AdvanceX for glyphs, set Min to align font icons, set both Min/Max to enforce mono-space font
    def glyph_min_advance_x : Float32
      @this.value.glyph_min_advance_x
    end

    def glyph_min_advance_x=(glyph_min_advance_x : Float32)
      @this.value.glyph_min_advance_x = glyph_min_advance_x
    end

    # FLT_MAX
    # Maximum AdvanceX for glyphs
    def glyph_max_advance_x : Float32
      @this.value.glyph_max_advance_x
    end

    def glyph_max_advance_x=(glyph_max_advance_x : Float32)
      @this.value.glyph_max_advance_x = glyph_max_advance_x
    end

    # false
    # Merge into previous ImFont, so you can combine multiple inputs font into one ImFont (e.g. ASCII font + icons + Japanese glyphs). You may want to use GlyphOffset.y when merge font of different heights.
    def merge_mode : Bool
      @this.value.merge_mode
    end

    def merge_mode=(merge_mode : Bool)
      @this.value.merge_mode = merge_mode
    end

    # 0
    # Settings for custom font builder. THIS IS BUILDER IMPLEMENTATION DEPENDENT. Leave as zero if unsure.
    def font_builder_flags : UInt32
      @this.value.font_builder_flags
    end

    def font_builder_flags=(font_builder_flags : UInt32)
      @this.value.font_builder_flags = font_builder_flags
    end

    # 1.0f
    # Brighten (>1.0f) or darken (<1.0f) font output. Brightening small fonts may be a good workaround to make them more readable.
    def rasterizer_multiply : Float32
      @this.value.rasterizer_multiply
    end

    def rasterizer_multiply=(rasterizer_multiply : Float32)
      @this.value.rasterizer_multiply = rasterizer_multiply
    end

    # -1
    # Explicitly specify unicode codepoint of ellipsis character. When fonts are being merged first specified ellipsis will be used.
    def ellipsis_char : ImWchar
      @this.value.ellipsis_char
    end

    def ellipsis_char=(ellipsis_char : ImWchar)
      @this.value.ellipsis_char = ellipsis_char
    end

    # Name (strictly to ease debugging)
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

    # [ImFontConfig::ImFontConfig()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2801)
    def self.new : ImFontConfig
      result = LibImGui.ImFontConfig_ImFontConfig
      ImFontConfig.new(result)
    end
  end

  alias TopLevel::ImFontConfig = ImGui::ImFontConfig

  # [struct ImFontGlyph](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2806)
  struct ImFontGlyph
    include StructType
  end

  # [struct ImFontGlyphRangesBuilder](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2818)
  struct ImFontGlyphRangesBuilder
    include StructType

    # Store 1-bit per Unicode code point (0=unused, 1=used)
    def used_chars : ImVector(UInt32)
      t = @used_chars
      pointerof(t).as(ImVector(UInt32)*).value
    end

    def used_chars=(used_chars : ImVector(UInt32))
      @used_chars = used_chars.as(LibImGui::ImVectorInternal*).value
    end

    # [ImFontGlyphRangesBuilder::ImFontGlyphRangesBuilder()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2822)
    def self.new : ImFontGlyphRangesBuilder
      result = LibImGui.ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder
      result.value
    end

    # [ImFontGlyphRangesBuilder::Clear()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2823)
    def clear : Void
      LibImGui.ImFontGlyphRangesBuilder_Clear(self)
    end

    # Get bit n in the array
    #
    # [ImFontGlyphRangesBuilder::GetBit()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2824)
    def get_bit(n : LibC::SizeT) : Bool
      LibImGui.ImFontGlyphRangesBuilder_GetBit(self, n)
    end

    # Set bit n in the array
    #
    # [ImFontGlyphRangesBuilder::SetBit()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2825)
    def set_bit(n : LibC::SizeT) : Void
      LibImGui.ImFontGlyphRangesBuilder_SetBit(self, n)
    end

    # Add character
    #
    # [ImFontGlyphRangesBuilder::AddChar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2826)
    def add_char(c : ImWchar) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddChar(self, c)
    end

    # Add string (each character of the UTF-8 string are added)
    #
    # [ImFontGlyphRangesBuilder::AddText()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2827)
    def add_text(text : Bytes | String) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddText(self, text, (text.to_unsafe + text.bytesize))
    end

    # Add ranges, e.g. builder.AddRanges(ImFontAtlas::GetGlyphRangesDefault()) to force add all of ASCII/Latin+Ext
    #
    # [ImFontGlyphRangesBuilder::AddRanges()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2828)
    def add_ranges(ranges : ImWchar*) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddRanges(self, ranges)
    end

    # Output new ranges
    #
    # [ImFontGlyphRangesBuilder::BuildRanges()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2829)
    def build_ranges : ImVector
      LibImGui.ImFontGlyphRangesBuilder_BuildRanges(self, out out_ranges)
      out_ranges
    end
  end

  # [struct ImFontAtlasCustomRect](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2833)
  struct ImFontAtlasCustomRect
    include ClassType(LibImGui::ImFontAtlasCustomRect)

    # Input
    # Desired rectangle dimension
    def width : UInt16
      @this.value.width
    end

    def width=(width : UInt16)
      @this.value.width = width
    end

    # Input
    # Desired rectangle dimension
    def height : UInt16
      @this.value.height
    end

    def height=(height : UInt16)
      @this.value.height = height
    end

    # Output
    # Packed position in Atlas
    def x : UInt16
      @this.value.x
    end

    def x=(x : UInt16)
      @this.value.x = x
    end

    # Output
    # Packed position in Atlas
    def y : UInt16
      @this.value.y
    end

    def y=(y : UInt16)
      @this.value.y = y
    end

    # Input
    # For custom font glyphs only (ID < 0x110000)
    def glyph_id : UInt32
      @this.value.glyph_id
    end

    def glyph_id=(glyph_id : UInt32)
      @this.value.glyph_id = glyph_id
    end

    # Input
    # For custom font glyphs only: glyph xadvance
    def glyph_advance_x : Float32
      @this.value.glyph_advance_x
    end

    def glyph_advance_x=(glyph_advance_x : Float32)
      @this.value.glyph_advance_x = glyph_advance_x
    end

    # Input
    # For custom font glyphs only: glyph display offset
    def glyph_offset : ImVec2
      @this.value.glyph_offset
    end

    def glyph_offset=(glyph_offset : ImVec2)
      @this.value.glyph_offset = glyph_offset
    end

    # Input
    # For custom font glyphs only: target font
    def font : ImFont
      ImFont.new(@this.value.font)
    end

    def font=(font : ImFont)
      @this.value.font = font
    end

    # [ImFontAtlasCustomRect::ImFontAtlasCustomRect()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2841)
    def self.new : ImFontAtlasCustomRect
      result = LibImGui.ImFontAtlasCustomRect_ImFontAtlasCustomRect
      ImFontAtlasCustomRect.new(result)
    end

    # [ImFontAtlasCustomRect::IsPacked()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2842)
    def is_packed : Bool
      LibImGui.ImFontAtlasCustomRect_IsPacked(self)
    end
  end

  alias TopLevel::ImFontAtlasCustomRect = ImGui::ImFontAtlasCustomRect

  # [struct ImFontAtlas](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2871)
  struct ImFontAtlas
    include ClassType(LibImGui::ImFontAtlas)

    # Build flags (see ImFontAtlasFlags_)
    def flags : ImFontAtlasFlags
      @this.value.flags
    end

    def flags=(flags : ImFontAtlasFlags)
      @this.value.flags = flags
    end

    # User data to refer to the texture once it has been uploaded to user's graphic systems. It is passed back to you during rendering via the ImDrawCmd structure.
    def tex_id : ImTextureID
      @this.value.tex_id
    end

    def tex_id=(tex_id : ImTextureID)
      @this.value.tex_id = tex_id
    end

    # Texture width desired by user before Build(). Must be a power-of-two. If have many glyphs your graphics API have texture size restrictions you may want to increase texture width to decrease height.
    def tex_desired_width : Int32
      @this.value.tex_desired_width
    end

    def tex_desired_width=(tex_desired_width : Int32)
      @this.value.tex_desired_width = tex_desired_width
    end

    # Padding between glyphs within texture in pixels. Defaults to 1. If your rendering method doesn't rely on bilinear filtering you may set this to 0 (will also need to set AntiAliasedLinesUseTex = false).
    def tex_glyph_padding : Int32
      @this.value.tex_glyph_padding
    end

    def tex_glyph_padding=(tex_glyph_padding : Int32)
      @this.value.tex_glyph_padding = tex_glyph_padding
    end

    # Marked as Locked by ImGui::NewFrame() so attempt to modify the atlas will assert.
    def locked : Bool
      @this.value.locked
    end

    def locked=(locked : Bool)
      @this.value.locked = locked
    end

    # Store your own atlas related user-data (if e.g. you have multiple font atlas).
    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    # Set when texture was built matching current font input
    def tex_ready : Bool
      @this.value.tex_ready
    end

    def tex_ready=(tex_ready : Bool)
      @this.value.tex_ready = tex_ready
    end

    # Tell whether our texture data is known to use colors (rather than just alpha channel), in order to help backend select a format.
    def tex_pixels_use_colors : Bool
      @this.value.tex_pixels_use_colors
    end

    def tex_pixels_use_colors=(tex_pixels_use_colors : Bool)
      @this.value.tex_pixels_use_colors = tex_pixels_use_colors
    end

    # 1 component per pixel, each component is unsigned 8-bit. Total size = TexWidth * TexHeight
    def tex_pixels_alpha8 : LibC::UChar*
      @this.value.tex_pixels_alpha8
    end

    def tex_pixels_alpha8=(tex_pixels_alpha8 : LibC::UChar*)
      @this.value.tex_pixels_alpha8 = tex_pixels_alpha8
    end

    # 4 component per pixel, each component is unsigned 8-bit. Total size = TexWidth * TexHeight * 4
    def tex_pixels_rgba32 : UInt32*
      @this.value.tex_pixels_rgba32
    end

    def tex_pixels_rgba32=(tex_pixels_rgba32 : UInt32*)
      @this.value.tex_pixels_rgba32 = tex_pixels_rgba32
    end

    # Texture width calculated during Build().
    def tex_width : Int32
      @this.value.tex_width
    end

    def tex_width=(tex_width : Int32)
      @this.value.tex_width = tex_width
    end

    # Texture height calculated during Build().
    def tex_height : Int32
      @this.value.tex_height
    end

    def tex_height=(tex_height : Int32)
      @this.value.tex_height = tex_height
    end

    # = (1.0f/TexWidth, 1.0f/TexHeight)
    def tex_uv_scale : ImVec2
      @this.value.tex_uv_scale
    end

    def tex_uv_scale=(tex_uv_scale : ImVec2)
      @this.value.tex_uv_scale = tex_uv_scale
    end

    # Texture coordinates to a white pixel
    def tex_uv_white_pixel : ImVec2
      @this.value.tex_uv_white_pixel
    end

    def tex_uv_white_pixel=(tex_uv_white_pixel : ImVec2)
      @this.value.tex_uv_white_pixel = tex_uv_white_pixel
    end

    # Hold all the fonts returned by AddFont*. Fonts[0] is the default font upon calling ImGui::NewFrame(), use ImGui::PushFont()/PopFont() to change the current font.
    def fonts : ImVector(ImFont)
      t = @this.value.fonts
      pointerof(t).as(ImVector(ImFont)*).value
    end

    def fonts=(fonts : ImVector(ImFont))
      @this.value.fonts = fonts.as(LibImGui::ImVectorInternal*).value
    end

    # Rectangles for packing custom texture data into the atlas.
    def custom_rects : ImVector(LibImGui::ImFontAtlasCustomRect)
      t = @this.value.custom_rects
      pointerof(t).as(ImVector(LibImGui::ImFontAtlasCustomRect)*).value
    end

    def custom_rects=(custom_rects : ImVector(LibImGui::ImFontAtlasCustomRect))
      @this.value.custom_rects = custom_rects.as(LibImGui::ImVectorInternal*).value
    end

    # Configuration data
    def config_data : ImVector(LibImGui::ImFontConfig)
      t = @this.value.config_data
      pointerof(t).as(ImVector(LibImGui::ImFontConfig)*).value
    end

    def config_data=(config_data : ImVector(LibImGui::ImFontConfig))
      @this.value.config_data = config_data.as(LibImGui::ImVectorInternal*).value
    end

    # UVs for baked anti-aliased lines
    def tex_uv_lines : Slice(ImVec4)
      @this.value.tex_uv_lines.to_slice
    end

    def tex_uv_lines=(tex_uv_lines : Slice(ImVec4))
      @this.value.tex_uv_lines = tex_uv_lines
    end

    # Opaque interface to a font builder (default to stb_truetype, can be changed to use FreeType by defining IMGUI_ENABLE_FREETYPE).
    def font_builder_io : ImFontBuilderIO?
      (v = @this.value.font_builder_io) ? v.value : nil
    end

    def font_builder_io=(font_builder_io : ImFontBuilderIO?)
      @this.value.font_builder_io = font_builder_io
    end

    # Shared flags (for all fonts) for custom font builder. THIS IS BUILD IMPLEMENTATION DEPENDENT. Per-font override is also available in ImFontConfig.
    def font_builder_flags : UInt32
      @this.value.font_builder_flags
    end

    def font_builder_flags=(font_builder_flags : UInt32)
      @this.value.font_builder_flags = font_builder_flags
    end

    # Custom texture rectangle ID for white pixel and mouse cursors
    def pack_id_mouse_cursors : Int32
      @this.value.pack_id_mouse_cursors
    end

    def pack_id_mouse_cursors=(pack_id_mouse_cursors : Int32)
      @this.value.pack_id_mouse_cursors = pack_id_mouse_cursors
    end

    # Custom texture rectangle ID for baked anti-aliased lines
    def pack_id_lines : Int32
      @this.value.pack_id_lines
    end

    def pack_id_lines=(pack_id_lines : Int32)
      @this.value.pack_id_lines = pack_id_lines
    end

    # [ImFontAtlas::ImFontAtlas()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2873)
    def self.new : ImFontAtlas
      result = LibImGui.ImFontAtlas_ImFontAtlas
      ImFontAtlas.new(result)
    end

    # [ImFontAtlas::AddFont()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2875)
    def add_font(font_cfg : ImFontConfig) : ImFont
      result = LibImGui.ImFontAtlas_AddFont(self, font_cfg)
      ImFont.new(result)
    end

    # [ImFontAtlas::AddFontDefault()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2876)
    def add_font_default(font_cfg : ImFontConfig? = nil) : ImFont
      result = LibImGui.ImFontAtlas_AddFontDefault(self, font_cfg)
      ImFont.new(result)
    end

    # [ImFontAtlas::AddFontFromFileTTF()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2877)
    def add_font_from_file_ttf(filename : String, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromFileTTF(self, filename, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    # Note: Transfer ownership of 'ttf_data' to ImFontAtlas! Will be deleted after destruction of the atlas. Set font_cfg->FontDataOwnedByAtlas=false to keep ownership of your data and it won't be freed.
    #
    # [ImFontAtlas::AddFontFromMemoryTTF()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2878)
    def add_font_from_memory_ttf(font_data : Void*, font_size : Int32, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryTTF(self, font_data, font_size, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    # 'compressed_font_data' still owned by caller. Compress with binary_to_compressed_c.cpp.
    #
    # [ImFontAtlas::AddFontFromMemoryCompressedTTF()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2879)
    def add_font_from_memory_compressed_ttf(compressed_font_data : Void*, compressed_font_size : Int32, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryCompressedTTF(self, compressed_font_data, compressed_font_size, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    # 'compressed_font_data_base85' still owned by caller. Compress with binary_to_compressed_c.cpp with -base85 parameter.
    #
    # [ImFontAtlas::AddFontFromMemoryCompressedBase85TTF()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2880)
    def add_font_from_memory_compressed_base85_ttf(compressed_font_data_base85 : String, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self, compressed_font_data_base85, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    # Clear input data (all ImFontConfig structures including sizes, TTF data, glyph ranges, etc.) = all the data used to build the texture and fonts.
    #
    # [ImFontAtlas::ClearInputData()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2881)
    def clear_input_data : Void
      LibImGui.ImFontAtlas_ClearInputData(self)
    end

    # Clear output texture data (CPU side). Saves RAM once the texture has been copied to graphics memory.
    #
    # [ImFontAtlas::ClearTexData()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2882)
    def clear_tex_data : Void
      LibImGui.ImFontAtlas_ClearTexData(self)
    end

    # Clear output font data (glyphs storage, UV coordinates).
    #
    # [ImFontAtlas::ClearFonts()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2883)
    def clear_fonts : Void
      LibImGui.ImFontAtlas_ClearFonts(self)
    end

    # Clear all input and output.
    #
    # [ImFontAtlas::Clear()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2884)
    def clear : Void
      LibImGui.ImFontAtlas_Clear(self)
    end

    # Build pixels data. This is called automatically for you by the GetTexData*** functions.
    #
    # [ImFontAtlas::Build()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2891)
    def build : Bool
      LibImGui.ImFontAtlas_Build(self)
    end

    # 1 byte per-pixel
    #
    # [ImFontAtlas::GetTexDataAsAlpha8()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2892)
    def get_tex_data_as_alpha8 : {LibC::UChar*, LibC::Int, LibC::Int, LibC::Int}
      LibImGui.ImFontAtlas_GetTexDataAsAlpha8(self, out out_pixels, out out_width, out out_height, out out_bytes_per_pixel)
      {out_pixels, out_width, out_height, out_bytes_per_pixel}
    end

    # 4 bytes-per-pixel
    #
    # [ImFontAtlas::GetTexDataAsRGBA32()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2893)
    def get_tex_data_as_rgba32 : {LibC::UChar*, LibC::Int, LibC::Int, LibC::Int}
      LibImGui.ImFontAtlas_GetTexDataAsRGBA32(self, out out_pixels, out out_width, out out_height, out out_bytes_per_pixel)
      {out_pixels, out_width, out_height, out_bytes_per_pixel}
    end

    # Bit ambiguous: used to detect when user didn't build texture but effectively we should check TexID != 0 except that would be backend dependent...
    #
    # [ImFontAtlas::IsBuilt()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2894)
    def is_built : Bool
      LibImGui.ImFontAtlas_IsBuilt(self)
    end

    # [ImFontAtlas::SetTexID()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2895)
    def set_tex_id(id : ImTextureID) : Void
      LibImGui.ImFontAtlas_SetTexID(self, id)
    end

    # Basic Latin, Extended Latin
    #
    # [ImFontAtlas::GetGlyphRangesDefault()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2905)
    def get_glyph_ranges_default : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesDefault(self)
    end

    # Default + Greek and Coptic
    #
    # [ImFontAtlas::GetGlyphRangesGreek()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2906)
    def get_glyph_ranges_greek : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesGreek(self)
    end

    # Default + Korean characters
    #
    # [ImFontAtlas::GetGlyphRangesKorean()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2907)
    def get_glyph_ranges_korean : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesKorean(self)
    end

    # Default + Hiragana, Katakana, Half-Width, Selection of 2999 Ideographs
    #
    # [ImFontAtlas::GetGlyphRangesJapanese()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2908)
    def get_glyph_ranges_japanese : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesJapanese(self)
    end

    # Default + Half-Width + Japanese Hiragana/Katakana + full set of about 21000 CJK Unified Ideographs
    #
    # [ImFontAtlas::GetGlyphRangesChineseFull()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2909)
    def get_glyph_ranges_chinese_full : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesChineseFull(self)
    end

    # Default + Half-Width + Japanese Hiragana/Katakana + set of 2500 CJK Unified Ideographs for common simplified Chinese
    #
    # [ImFontAtlas::GetGlyphRangesChineseSimplifiedCommon()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2910)
    def get_glyph_ranges_chinese_simplified_common : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self)
    end

    # Default + about 400 Cyrillic characters
    #
    # [ImFontAtlas::GetGlyphRangesCyrillic()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2911)
    def get_glyph_ranges_cyrillic : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesCyrillic(self)
    end

    # Default + Thai characters
    #
    # [ImFontAtlas::GetGlyphRangesThai()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2912)
    def get_glyph_ranges_thai : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesThai(self)
    end

    # Default + Vietnamese characters
    #
    # [ImFontAtlas::GetGlyphRangesVietnamese()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2913)
    def get_glyph_ranges_vietnamese : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesVietnamese(self)
    end

    # [ImFontAtlas::AddCustomRectRegular()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2926)
    def add_custom_rect_regular(width : Int32, height : Int32) : Int32
      LibImGui.ImFontAtlas_AddCustomRectRegular(self, width, height)
    end

    # [ImFontAtlas::AddCustomRectFontGlyph()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2927)
    def add_custom_rect_font_glyph(font : ImFont, id : ImWchar, width : Int32, height : Int32, advance_x : Float32, offset : ImVec2 = ImVec2.new(0, 0)) : Int32
      LibImGui.ImFontAtlas_AddCustomRectFontGlyph(self, font, id, width, height, advance_x, offset)
    end

    # [ImFontAtlas::GetCustomRectByIndex()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2928)
    def get_custom_rect_by_index(index : Int32) : ImFontAtlasCustomRect
      result = LibImGui.ImFontAtlas_GetCustomRectByIndex(self, index)
      ImFontAtlasCustomRect.new(result)
    end

    # [ImFontAtlas::CalcCustomRectUV()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2931)
    def calc_custom_rect_uv(rect : ImFontAtlasCustomRect) : {ImGui::ImVec2, ImGui::ImVec2}
      LibImGui.ImFontAtlas_CalcCustomRectUV(self, rect, out out_uv_min, out out_uv_max)
      {out_uv_min, out_uv_max}
    end

    # [ImFontAtlas::GetMouseCursorTexData()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2932)
    def get_mouse_cursor_tex_data(cursor : ImGuiMouseCursor) : {Bool, ImGui::ImVec2, ImGui::ImVec2, Slice(ImGui::ImVec2), Slice(ImGui::ImVec2)}
      result = LibImGui.ImFontAtlas_GetMouseCursorTexData(self, cursor, out out_offset, out out_size, out out_uv_border, out out_uv_fill)
      {result, out_offset, out_size, out_uv_border.to_slice, out_uv_fill.to_slice}
    end
  end

  alias TopLevel::ImFontAtlas = ImGui::ImFontAtlas

  # [struct ImFont](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L2975)
  struct ImFont
    include ClassType(LibImGui::ImFont)

    # 12-16
    # out
    # Sparse. Glyphs->AdvanceX in a directly indexable way (cache-friendly for CalcTextSize functions which only this this info, and are often bottleneck in large UI).
    def index_advance_x : ImVector(Float32)
      t = @this.value.index_advance_x
      pointerof(t).as(ImVector(Float32)*).value
    end

    def index_advance_x=(index_advance_x : ImVector(Float32))
      @this.value.index_advance_x = index_advance_x.as(LibImGui::ImVectorInternal*).value
    end

    # 4
    # out
    # = FallbackGlyph->AdvanceX
    def fallback_advance_x : Float32
      @this.value.fallback_advance_x
    end

    def fallback_advance_x=(fallback_advance_x : Float32)
      @this.value.fallback_advance_x = fallback_advance_x
    end

    # 4
    # in
    # Height of characters/line, set during loading (don't change after loading)
    def font_size : Float32
      @this.value.font_size
    end

    def font_size=(font_size : Float32)
      @this.value.font_size = font_size
    end

    # 12-16
    # out
    # Sparse. Index glyphs by Unicode code-point.
    def index_lookup : ImVector(ImWchar)
      t = @this.value.index_lookup
      pointerof(t).as(ImVector(ImWchar)*).value
    end

    def index_lookup=(index_lookup : ImVector(ImWchar))
      @this.value.index_lookup = index_lookup.as(LibImGui::ImVectorInternal*).value
    end

    # 12-16
    # out
    # All glyphs.
    def glyphs : ImVector(ImFontGlyph)
      t = @this.value.glyphs
      pointerof(t).as(ImVector(ImFontGlyph)*).value
    end

    def glyphs=(glyphs : ImVector(ImFontGlyph))
      @this.value.glyphs = glyphs.as(LibImGui::ImVectorInternal*).value
    end

    # 4-8
    # out
    # = FindGlyph(FontFallbackChar)
    def fallback_glyph : ImFontGlyph?
      (v = @this.value.fallback_glyph) ? v.value : nil
    end

    def fallback_glyph=(fallback_glyph : ImFontGlyph?)
      @this.value.fallback_glyph = fallback_glyph
    end

    # 4-8
    # out
    # What we has been loaded into
    def container_atlas : ImFontAtlas
      ImFontAtlas.new(@this.value.container_atlas)
    end

    def container_atlas=(container_atlas : ImFontAtlas)
      @this.value.container_atlas = container_atlas
    end

    # 4-8
    # in
    # Pointer within ContainerAtlas->ConfigData
    def config_data : Slice(ImFontConfig)
      Slice.new(@this.value.config_data_count.to_i) { |i| ImFontConfig.new(@this.value.config_data + i) }
    end

    def config_data=(config_data : Slice(ImFontConfig))
      @this.value.config_data, @this.value.config_data_count = config_data.to_unsafe, config_data.bytesize
    end

    # 2
    # in
    # ~ 1
    # Number of ImFontConfig involved in creating this font. Bigger than 1 when merging multiple font sources into one ImFont.
    def config_data_count : Int16
      @this.value.config_data_count
    end

    def config_data_count=(config_data_count : Int16)
      @this.value.config_data_count = config_data_count
    end

    # 2
    # out
    # = FFFD/'?'
    # Character used if a glyph isn't found.
    def fallback_char : ImWchar
      @this.value.fallback_char
    end

    def fallback_char=(fallback_char : ImWchar)
      @this.value.fallback_char = fallback_char
    end

    # 2
    # out
    # = '...'/'.'// Character used for ellipsis rendering.
    def ellipsis_char : ImWchar
      @this.value.ellipsis_char
    end

    def ellipsis_char=(ellipsis_char : ImWchar)
      @this.value.ellipsis_char = ellipsis_char
    end

    # 1
    # out
    # 1 or 3
    def ellipsis_char_count : Int16
      @this.value.ellipsis_char_count
    end

    def ellipsis_char_count=(ellipsis_char_count : Int16)
      @this.value.ellipsis_char_count = ellipsis_char_count
    end

    # 4
    # out
    # Width
    def ellipsis_width : Float32
      @this.value.ellipsis_width
    end

    def ellipsis_width=(ellipsis_width : Float32)
      @this.value.ellipsis_width = ellipsis_width
    end

    # 4
    # out
    # Step between characters when EllipsisCount > 0
    def ellipsis_char_step : Float32
      @this.value.ellipsis_char_step
    end

    def ellipsis_char_step=(ellipsis_char_step : Float32)
      @this.value.ellipsis_char_step = ellipsis_char_step
    end

    # 1
    # out //
    def dirty_lookup_tables : Bool
      @this.value.dirty_lookup_tables
    end

    def dirty_lookup_tables=(dirty_lookup_tables : Bool)
      @this.value.dirty_lookup_tables = dirty_lookup_tables
    end

    # 4
    # in
    # = 1.f
    # Base font scale, multiplied by the per-window font scale which you can adjust with SetWindowFontScale()
    def scale : Float32
      @this.value.scale
    end

    def scale=(scale : Float32)
      @this.value.scale = scale
    end

    # 4+4
    # out
    # Ascent: distance from top to bottom of e.g. 'A' [0..FontSize]
    def ascent : Float32
      @this.value.ascent
    end

    def ascent=(ascent : Float32)
      @this.value.ascent = ascent
    end

    # 4+4
    # out
    # Ascent: distance from top to bottom of e.g. 'A' [0..FontSize]
    def descent : Float32
      @this.value.descent
    end

    def descent=(descent : Float32)
      @this.value.descent = descent
    end

    # 4
    # out
    # Total surface in pixels to get an idea of the font rasterization/texture cost (not exact, we approximate the cost of padding between glyphs)
    def metrics_total_surface : Int32
      @this.value.metrics_total_surface
    end

    def metrics_total_surface=(metrics_total_surface : Int32)
      @this.value.metrics_total_surface = metrics_total_surface
    end

    # 2 bytes if ImWchar=ImWchar16, 34 bytes if ImWchar==ImWchar32. Store 1-bit for each block of 4K codepoints that has one active glyph. This is mainly used to facilitate iterations across all used codepoints.
    def used4k_pages_map : Slice(UInt8)
      @this.value.used4k_pages_map.to_slice
    end

    def used4k_pages_map=(used4k_pages_map : Slice(UInt8))
      @this.value.used4k_pages_map = used4k_pages_map
    end

    # [ImFont::ImFont()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3003)
    def self.new : ImFont
      result = LibImGui.ImFont_ImFont
      ImFont.new(result)
    end

    # [ImFont::FindGlyph()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3005)
    def find_glyph(c : ImWchar) : ImFontGlyph
      result = LibImGui.ImFont_FindGlyph(self, c)
      result.value
    end

    # [ImFont::FindGlyphNoFallback()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3006)
    def find_glyph_no_fallback(c : ImWchar) : ImFontGlyph
      result = LibImGui.ImFont_FindGlyphNoFallback(self, c)
      result.value
    end

    # [ImFont::GetCharAdvance()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3007)
    def get_char_advance(c : ImWchar) : Float32
      LibImGui.ImFont_GetCharAdvance(self, c)
    end

    # [ImFont::IsLoaded()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3008)
    def is_loaded : Bool
      LibImGui.ImFont_IsLoaded(self)
    end

    # [ImFont::GetDebugName()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3009)
    def get_debug_name : String
      result = LibImGui.ImFont_GetDebugName(self)
      String.new(result)
    end

    # utf8
    #
    # [ImFont::CalcTextSizeA()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3013)
    def calc_text_size_a(size : Float32, max_width : Float32, wrap_width : Float32, text : Bytes | String, remaining : LibC::Char** = Pointer(LibC::Char*).null) : ImGui::ImVec2
      LibImGui.ImFont_CalcTextSizeA(out p_out, self, size, max_width, wrap_width, text, (text.to_unsafe + text.bytesize), remaining)
      p_out
    end

    # [ImFont::CalcWordWrapPositionA()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3014)
    def calc_word_wrap_position_a(scale : Float32, text : Bytes | String, wrap_width : Float32) : String
      result = LibImGui.ImFont_CalcWordWrapPositionA(self, scale, text, (text.to_unsafe + text.bytesize), wrap_width)
      String.new(result)
    end

    # [ImFont::RenderChar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3015)
    def render_char(draw_list : ImDrawList, size : Float32, pos : ImVec2, col : UInt32, c : ImWchar) : Void
      LibImGui.ImFont_RenderChar(self, draw_list, size, pos, col, c)
    end

    # [ImFont::RenderText()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3016)
    def render_text(draw_list : ImDrawList, size : Float32, pos : ImVec2, col : UInt32, clip_rect : ImVec4, text : Bytes | String, wrap_width : Float32 = 0.0, cpu_fine_clip : Bool = false) : Void
      LibImGui.ImFont_RenderText(self, draw_list, size, pos, col, clip_rect, text, (text.to_unsafe + text.bytesize), wrap_width, cpu_fine_clip)
    end

    # [ImFont::BuildLookupTable()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3019)
    def build_lookup_table : Void
      LibImGui.ImFont_BuildLookupTable(self)
    end

    # [ImFont::ClearOutputData()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3020)
    def clear_output_data : Void
      LibImGui.ImFont_ClearOutputData(self)
    end

    # [ImFont::GrowIndex()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3021)
    def grow_index(new_size : Int32) : Void
      LibImGui.ImFont_GrowIndex(self, new_size)
    end

    # [ImFont::AddGlyph()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3022)
    def add_glyph(src_cfg : ImFontConfig, c : ImWchar, x0 : Float32, y0 : Float32, x1 : Float32, y1 : Float32, u0 : Float32, v0 : Float32, u1 : Float32, v1 : Float32, advance_x : Float32) : Void
      LibImGui.ImFont_AddGlyph(self, src_cfg, c, x0, y0, x1, y1, u0, v0, u1, v1, advance_x)
    end

    # Makes 'dst' character/glyph points to 'src' character/glyph. Currently needs to be called AFTER fonts have been built.
    #
    # [ImFont::AddRemapChar()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3023)
    def add_remap_char(dst : ImWchar, src : ImWchar, overwrite_dst : Bool = true) : Void
      LibImGui.ImFont_AddRemapChar(self, dst, src, overwrite_dst)
    end

    # [ImFont::SetGlyphVisible()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3024)
    def set_glyph_visible(c : ImWchar, visible : Bool) : Void
      LibImGui.ImFont_SetGlyphVisible(self, c, visible)
    end

    # [ImFont::IsGlyphRangeUnused()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3025)
    def is_glyph_range_unused(c_begin : UInt32, c_last : UInt32) : Bool
      LibImGui.ImFont_IsGlyphRangeUnused(self, c_begin, c_last)
    end
  end

  alias TopLevel::ImFont = ImGui::ImFont

  # [struct ImGuiViewport](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3048)
  struct ImGuiViewport
    include ClassType(LibImGui::ImGuiViewport)

    # See ImGuiViewportFlags_
    def flags : ImGuiViewportFlags
      @this.value.flags
    end

    def flags=(flags : ImGuiViewportFlags)
      @this.value.flags = flags
    end

    # Main Area: Position of the viewport (Dear ImGui coordinates are the same as OS desktop/native coordinates)
    def pos : ImVec2
      @this.value.pos
    end

    def pos=(pos : ImVec2)
      @this.value.pos = pos
    end

    # Main Area: Size of the viewport.
    def size : ImVec2
      @this.value.size
    end

    def size=(size : ImVec2)
      @this.value.size = size
    end

    # Work Area: Position of the viewport minus task bars, menus bars, status bars (>= Pos)
    def work_pos : ImVec2
      @this.value.work_pos
    end

    def work_pos=(work_pos : ImVec2)
      @this.value.work_pos = work_pos
    end

    # Work Area: Size of the viewport minus task bars, menu bars, status bars (<= Size)
    def work_size : ImVec2
      @this.value.work_size
    end

    def work_size=(work_size : ImVec2)
      @this.value.work_size = work_size
    end

    # void* to hold lower-level, platform-native window handle (under Win32 this is expected to be a HWND, unused for other platforms)
    def platform_handle_raw : Void*
      @this.value.platform_handle_raw
    end

    def platform_handle_raw=(platform_handle_raw : Void*)
      @this.value.platform_handle_raw = platform_handle_raw
    end

    # [ImGuiViewport::ImGuiViewport()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3059)
    def self.new : ImGuiViewport
      result = LibImGui.ImGuiViewport_ImGuiViewport
      ImGuiViewport.new(result)
    end

    # [ImGuiViewport::GetCenter()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3062)
    def get_center : ImGui::ImVec2
      LibImGui.ImGuiViewport_GetCenter(out p_out, self)
      p_out
    end

    # [ImGuiViewport::GetWorkCenter()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3063)
    def get_work_center : ImGui::ImVec2
      LibImGui.ImGuiViewport_GetWorkCenter(out p_out, self)
      p_out
    end
  end

  alias TopLevel::ImGuiViewport = ImGui::ImGuiViewport

  # [struct ImGuiPlatformImeData](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3071)
  struct ImGuiPlatformImeData
    include ClassType(LibImGui::ImGuiPlatformImeData)

    # A widget wants the IME to be visible
    def want_visible : Bool
      @this.value.want_visible
    end

    def want_visible=(want_visible : Bool)
      @this.value.want_visible = want_visible
    end

    # Position of the input cursor
    def input_pos : ImVec2
      @this.value.input_pos
    end

    def input_pos=(input_pos : ImVec2)
      @this.value.input_pos = input_pos
    end

    # Line height
    def input_line_height : Float32
      @this.value.input_line_height
    end

    def input_line_height=(input_line_height : Float32)
      @this.value.input_line_height = input_line_height
    end

    # [ImGuiPlatformImeData::ImGuiPlatformImeData()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3077)
    def self.new : ImGuiPlatformImeData
      result = LibImGui.ImGuiPlatformImeData_ImGuiPlatformImeData
      ImGuiPlatformImeData.new(result)
    end
  end

  alias TopLevel::ImGuiPlatformImeData = ImGui::ImGuiPlatformImeData

  # map ImGuiKey_* values into legacy native key index. == io.KeyMap[key]
  #
  # [ImGui::GetKeyIndex()](https://github.com/ocornut/imgui/blob/fef33891579dda780028a10401e851ddb828e983/imgui.h#L3089)
  def self.get_key_index(key : ImGuiKey) : ImGuiKey
    LibImGui.GetKeyIndex(key)
  end

  alias ImGuiContext = LibImGui::ImGuiContext
end
