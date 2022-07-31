# ImGuiStyle  

You may modify the [`get_style`][ImGui.get_style] main instance during initialization and before [`new_frame`][ImGui.new_frame].  
During the frame, use ImGui::PushStyleVar(ImGuiStyleVar_XXXX)/[`pop_style_var`][ImGui.pop_style_var] to alter the main style values,  
and ImGui::PushStyleColor(ImGuiCol_XXX)/[`pop_style_color`][ImGui.pop_style_color] for colors.  

### ::: ImGui::ImGuiStyle

##### ::: ImGui::ImGuiStyle.alpha

 Global alpha applies to everything in Dear ImGui.  

##### ::: ImGui::ImGuiStyle.disabled_alpha

 Additional alpha multiplier applied by [`begin_disabled`][ImGui.begin_disabled]. Multiply over current value of Alpha.  

##### ::: ImGui::ImGuiStyle.window_padding

 Padding within a window.  

##### ::: ImGui::ImGuiStyle.window_rounding

 Radius of window corners rounding. Set to 0.0f to have rectangular windows. Large values tend to lead to variety of artifacts and are not recommended.  

##### ::: ImGui::ImGuiStyle.window_border_size

 Thickness of border around windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).  

##### ::: ImGui::ImGuiStyle.window_min_size

 Minimum window size. This is a global setting. If you want to constraint individual windows, use [`set_next_window_size_constraints`][ImGui.set_next_window_size_constraints].  

##### ::: ImGui::ImGuiStyle.window_title_align

 Alignment for title bar text. Defaults to (0.0f,0.5f) for left-aligned,vertically centered.  

##### ::: ImGui::ImGuiStyle.window_menu_button_position

 Side of the collapsing/docking button in the title bar (None/Left/Right). Defaults to ImGuiDir_Left.  

##### ::: ImGui::ImGuiStyle.child_rounding

 Radius of child window corners rounding. Set to 0.0f to have rectangular windows.  

##### ::: ImGui::ImGuiStyle.child_border_size

 Thickness of border around child windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).  

##### ::: ImGui::ImGuiStyle.popup_rounding

 Radius of popup window corners rounding. (Note that tooltip windows use WindowRounding)  

##### ::: ImGui::ImGuiStyle.popup_border_size

 Thickness of border around popup/tooltip windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).  

##### ::: ImGui::ImGuiStyle.frame_padding

 Padding within a framed rectangle (used by most widgets).  

##### ::: ImGui::ImGuiStyle.frame_rounding

 Radius of frame corners rounding. Set to 0.0f to have rectangular frame (used by most widgets).  

##### ::: ImGui::ImGuiStyle.frame_border_size

 Thickness of border around frames. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).  

##### ::: ImGui::ImGuiStyle.item_spacing

 Horizontal and vertical spacing between widgets/lines.  

##### ::: ImGui::ImGuiStyle.item_inner_spacing

 Horizontal and vertical spacing between within elements of a composed widget (e.g. a slider and its label).  

##### ::: ImGui::ImGuiStyle.cell_padding

 Padding within a table cell  

##### ::: ImGui::ImGuiStyle.touch_extra_padding

 Expand reactive bounding box for touch-based system where touch position is not accurate enough. Unfortunately we don't sort widgets so priority on overlap will always be given to the first widget. So don't grow this too much!  

##### ::: ImGui::ImGuiStyle.indent_spacing

 Horizontal indentation when e.g. entering a tree node. Generally == (FontSize + FramePadding.x*2).  

##### ::: ImGui::ImGuiStyle.columns_min_spacing

 Minimum horizontal spacing between two columns. Preferably > (FramePadding.x + 1).  

##### ::: ImGui::ImGuiStyle.scrollbar_size

 Width of the vertical scrollbar, Height of the horizontal scrollbar.  

##### ::: ImGui::ImGuiStyle.scrollbar_rounding

 Radius of grab corners for scrollbar.  

##### ::: ImGui::ImGuiStyle.grab_min_size

 Minimum width/height of a grab box for slider/scrollbar.  

##### ::: ImGui::ImGuiStyle.grab_rounding

 Radius of grabs corners rounding. Set to 0.0f to have rectangular slider grabs.  

##### ::: ImGui::ImGuiStyle.log_slider_deadzone

 The size in pixels of the dead-zone around zero on logarithmic sliders that cross zero.  

##### ::: ImGui::ImGuiStyle.tab_rounding

 Radius of upper corners of a tab. Set to 0.0f to have rectangular tabs.  

##### ::: ImGui::ImGuiStyle.tab_border_size

 Thickness of border around tabs.  

##### ::: ImGui::ImGuiStyle.tab_min_width_for_close_button

 Minimum width for close button to appears on an unselected tab when hovered. Set to 0.0f to always show when hovering, set to FLT_MAX to never show close button unless selected.  

##### ::: ImGui::ImGuiStyle.color_button_position

 Side of the color button in the [`color_edit4`][ImGui.color_edit4] widget (left/right). Defaults to ImGuiDir_Right.  

##### ::: ImGui::ImGuiStyle.button_text_align

 Alignment of button text when button is larger than text. Defaults to (0.5f, 0.5f) (centered).  

##### ::: ImGui::ImGuiStyle.selectable_text_align

 Alignment of selectable text. Defaults to (0.0f, 0.0f) (top-left aligned). It's generally important to keep this left-aligned if you want to lay multiple items on a same line.  

##### ::: ImGui::ImGuiStyle.display_window_padding

 Window position are clamped to be visible within the display area or monitors by at least this amount. Only applies to regular windows.  

##### ::: ImGui::ImGuiStyle.display_safe_area_padding

 If you cannot see the edges of your screen (e.g. on a TV) increase the safe area padding. Apply to popups/tooltips as well regular windows. NB: Prefer configuring your TV sets correctly!  

##### ::: ImGui::ImGuiStyle.mouse_cursor_scale

 Scale software rendered mouse cursor (when io.MouseDrawCursor is enabled). May be removed later.  

##### ::: ImGui::ImGuiStyle.anti_aliased_lines

 Enable anti-aliased lines/borders. Disable if you are really tight on CPU/GPU. Latched at the beginning of the frame (copied to [`ImDrawList`][ImGui::ImDrawList]).  

##### ::: ImGui::ImGuiStyle.anti_aliased_lines_use_tex

 Enable anti-aliased lines/borders using textures where possible. Require backend to render with bilinear filtering (NOT point/nearest filtering). Latched at the beginning of the frame (copied to [`ImDrawList`][ImGui::ImDrawList]).  

##### ::: ImGui::ImGuiStyle.anti_aliased_fill

 Enable anti-aliased edges around filled shapes (rounded rectangles, circles, etc.). Disable if you are really tight on CPU/GPU. Latched at the beginning of the frame (copied to [`ImDrawList`][ImGui::ImDrawList]).  

##### ::: ImGui::ImGuiStyle.curve_tessellation_tol

 Tessellation tolerance when using PathBezierCurveTo() without a specific number of segments. Decrease for highly tessellated curves (higher quality, more polygons), increase to reduce quality.  

##### ::: ImGui::ImGuiStyle.circle_tessellation_max_error

 Maximum error (in pixels) allowed when using AddCircle()/AddCircleFilled() or drawing rounded corner rectangles with no explicit segment count specified. Decrease for higher quality but more geometry.  

##### ::: ImGui::ImGuiStyle.colors

