# Dear ImGui end-user API functions  
(Note that ImGui:: being a namespace, you can add extra ImGui:: functions in your own separate file. Please don't modify imgui source files!)  

## Context creation and access  

- Each context create its own [`ImFontAtlas`][ImGui::ImFontAtlas] by default. You may instance one yourself and pass it to [`create_context`][ImGui.create_context] to share a font atlas between contexts.
- DLL users: heaps and globals are not shared across DLL boundaries! You will need to call [`set_current_context`][ImGui.set_current_context] + [`set_allocator_functions`][ImGui.set_allocator_functions]
  for each static/DLL boundary you are calling from. Read "Context and Memory Allocators" section of imgui.cpp for details.

### ::: ImGui.create_context

### ::: ImGui.destroy_context

 NULL = destroy current context  

### ::: ImGui.get_current_context

### ::: ImGui.set_current_context

## Main  

### ::: ImGui.get_io

 access the IO structure (mouse/keyboard/gamepad inputs, time, various configuration options/flags)  

### ::: ImGui.get_style

 access the Style structure (colors, sizes). Always use PushStyleCol(), PushStyleVar() to modify style mid-frame!  

### ::: ImGui.new_frame

 start a new Dear ImGui frame, you can submit any command from this point until [`render`][ImGui.render]/[`end_frame`][ImGui.end_frame].  

### ::: ImGui.end_frame

 ends the Dear ImGui frame. automatically called by [`render`][ImGui.render]. If you don't need to render data (skipping rendering) you may call [`end_frame`][ImGui.end_frame] without [`render`][ImGui.render]... but you'll have wasted CPU already! If you don't need to render, better to not create any windows and not call [`new_frame`][ImGui.new_frame] at all!  

### ::: ImGui.render

 ends the Dear ImGui frame, finalize the draw data. You can then get call [`get_draw_data`][ImGui.get_draw_data].  

### ::: ImGui.get_draw_data

 valid after [`render`][ImGui.render] and until the next call to [`new_frame`][ImGui.new_frame]. this is what you have to render.  

## Demo, Debug, Information  

### ::: ImGui.show_demo_window

 create Demo window. demonstrate most ImGui features. call this to learn about the library! try to make it always available in your application!  

### ::: ImGui.show_metrics_window

 create Metrics/Debugger window. display Dear ImGui internals: windows, draw commands, various internal state, etc.  

### ::: ImGui.show_debug_log_window

 create Debug Log window. display a simplified log of important dear imgui events.  

### ::: ImGui.show_stack_tool_window

 create Stack Tool window. hover items with mouse to query information about the source of their unique ID.  

### ::: ImGui.show_about_window

 create About window. display Dear ImGui version, credits and build/system information.  

### ::: ImGui.show_style_editor

 add style editor block (not a window). you can pass in a reference [`ImGuiStyle`][ImGui::ImGuiStyle] structure to compare to, revert to and save to (else it uses the default style)  

### ::: ImGui.show_style_selector

 add style selector block (not a window), essentially a combo listing the default styles.  

### ::: ImGui.show_font_selector

 add font selector block (not a window), essentially a combo listing the loaded fonts.  

### ::: ImGui.show_user_guide

 add basic help/info block (not a window): how to manipulate ImGui as a end-user (mouse/keyboard controls).  

### ::: ImGui.get_version

 get the compiled version string e.g. "1.80 WIP" (essentially the value for IMGUI_VERSION from the compiled version of imgui.cpp)  

## Styles  

### ::: ImGui.style_colors_dark

 new, recommended style (default)  

### ::: ImGui.style_colors_light

 best used with borders and a custom, thicker font  

### ::: ImGui.style_colors_classic

 classic imgui style  

## Windows  

- Begin() = push window to the stack and start appending to it. End() = pop window from the stack.
- Passing 'bool* p_open != NULL' shows a window-closing widget in the upper-right corner of the window,
  which clicking will set the boolean to false when clicked.
- You may append multiple times to the same window during the same frame by calling Begin()/End() pairs multiple times.
  Some information such as 'flags' or 'p_open' will only be considered by the first call to Begin().
- Begin() return false to indicate the window is collapsed or fully clipped, so you may early out and omit submitting
  anything to the window. Always call a matching End() for each Begin() call, regardless of its return value!
  [Important: due to legacy reason, this is inconsistent with most other functions such as [`begin_menu`][ImGui.begin_menu]/[`end_menu`][ImGui.end_menu],
   [`begin_popup`][ImGui.begin_popup]/[`end_popup`][ImGui.end_popup], etc. where the EndXXX call should only be called if the corresponding BeginXXX function
   returned true. Begin and BeginChild are the only odd ones out. Will be fixed in a future update.]
- Note that the bottom of window stack always contains a window called "Debug".

### ::: ImGui.begin

### ::: ImGui.end

## Child Windows  

- Use child windows to begin into a self-contained independent scrolling/clipping regions within a host window. Child windows can embed their own child.
- For each independent axis of 'size': ==0.0f: use remaining host window size / >0.0f: fixed size / <0.0f: use remaining window size minus abs(size) / Each axis can use a different mode, e.g. [`ImVec2`][ImGui::ImVec2](0,400).
- BeginChild() returns false to indicate the window is collapsed or fully clipped, so you may early out and omit submitting anything to the window.
  Always call a matching [`end_child`][ImGui.end_child] for each BeginChild() call, regardless of its return value.
  [Important: due to legacy reason, this is inconsistent with most other functions such as [`begin_menu`][ImGui.begin_menu]/[`end_menu`][ImGui.end_menu],
   [`begin_popup`][ImGui.begin_popup]/[`end_popup`][ImGui.end_popup], etc. where the EndXXX call should only be called if the corresponding BeginXXX function
   returned true. Begin and BeginChild are the only odd ones out. Will be fixed in a future update.]

### ::: ImGui.begin_child

### ::: ImGui.begin_child

### ::: ImGui.end_child

## Windows Utilities  

- 'current window' = the window we are appending into while inside a Begin()/End() block. 'next window' = next window we will Begin() into.

### ::: ImGui.is_window_appearing

### ::: ImGui.is_window_collapsed

### ::: ImGui.is_window_focused

 is current window focused? or its root/child, depending on flags. see flags for options.  

### ::: ImGui.is_window_hovered

 is current window hovered (and typically: not blocked by a popup/modal)? see flags for options. NB: If you are trying to check whether your mouse should be dispatched to imgui or to your app, you should use the 'io.WantCaptureMouse' boolean for that! Please read the FAQ!  

### ::: ImGui.get_window_draw_list

 get draw list associated to the current window, to append your own drawing primitives  

### ::: ImGui.get_window_pos

 get current window position in screen space (useful if you want to do your own drawing via the DrawList API)  

### ::: ImGui.get_window_size

 get current window size  

### ::: ImGui.get_window_width

 get current window width (shortcut for [`get_window_size`][ImGui.get_window_size].x)  

### ::: ImGui.get_window_height

 get current window height (shortcut for [`get_window_size`][ImGui.get_window_size].y)  

## Window manipulation  

- Prefer using SetNextXXX functions (before Begin) rather that SetXXX functions (after Begin).

### ::: ImGui.set_next_window_pos

 set next window position. call before Begin(). use pivot=(0.5f,0.5f) to center on given point, etc.  

### ::: ImGui.set_next_window_size

 set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin()  

### ::: ImGui.set_next_window_size_constraints

 set next window size limits. use -1,-1 on either X/Y axis to preserve the current size. Sizes will be rounded down. Use callback to apply non-trivial programmatic constraints.  

### ::: ImGui.set_next_window_content_size

 set next window content size (~ scrollable client area, which enforce the range of scrollbars). Not including window decorations (title bar, menu bar, etc.) nor WindowPadding. set an axis to 0.0f to leave it automatic. call before Begin()  

### ::: ImGui.set_next_window_collapsed

 set next window collapsed state. call before Begin()  

### ::: ImGui.set_next_window_focus

 set next window to be focused / top-most. call before Begin()  

### ::: ImGui.set_next_window_bg_alpha

 set next window background color alpha. helper to easily override the Alpha component of ImGuiCol_WindowBg/ChildBg/PopupBg. you may also use ImGuiWindowFlags_NoBackground.  

### ::: ImGui.set_window_pos

 (not recommended) set current window position - call within Begin()/End(). prefer using [`set_next_window_pos`][ImGui.set_next_window_pos], as this may incur tearing and side-effects.  

### ::: ImGui.set_window_size

 (not recommended) set current window size - call within Begin()/End(). set to [`ImVec2`][ImGui::ImVec2](0, 0) to force an auto-fit. prefer using [`set_next_window_size`][ImGui.set_next_window_size], as this may incur tearing and minor side-effects.  

### ::: ImGui.set_window_collapsed

 (not recommended) set current window collapsed state. prefer using [`set_next_window_collapsed`][ImGui.set_next_window_collapsed].  

### ::: ImGui.set_window_focus

 (not recommended) set current window to be focused / top-most. prefer using [`set_next_window_focus`][ImGui.set_next_window_focus].  

### ::: ImGui.set_window_font_scale

 [OBSOLETE] set font scale. Adjust IO.FontGlobalScale if you want to scale all windows. This is an old API! For correct scaling, prefer to reload font + rebuild [`ImFontAtlas`][ImGui::ImFontAtlas] + call style.ScaleAllSizes().  

### ::: ImGui.set_window_pos

 set named window position.  

### ::: ImGui.set_window_size

 set named window size. set axis to 0.0f to force an auto-fit on this axis.  

### ::: ImGui.set_window_collapsed

 set named window collapsed state  

### ::: ImGui.set_window_focus

 set named window to be focused / top-most. use NULL to remove focus.  

## Content region  

- Retrieve available space from a given point. [`get_content_region_avail`][ImGui.get_content_region_avail] is frequently useful.
- Those functions are bound to be redesigned (they are confusing, incomplete and the Min/Max return values are in local window coordinates which increases confusion)

### ::: ImGui.get_content_region_avail

 == [`get_content_region_max`][ImGui.get_content_region_max] - [`get_cursor_pos`][ImGui.get_cursor_pos]  

### ::: ImGui.get_content_region_max

 current content boundaries (typically window boundaries including scrolling, or current column boundaries), in windows coordinates  

### ::: ImGui.get_window_content_region_min

 content boundaries min for the full window (roughly (0,0)-Scroll), in window coordinates  

### ::: ImGui.get_window_content_region_max

 content boundaries max for the full window (roughly (0,0)+Size-Scroll) where Size can be override with [`set_next_window_content_size`][ImGui.set_next_window_content_size], in window coordinates  

## Windows Scrolling  

### ::: ImGui.get_scroll_x

 get scrolling amount [0 .. [`get_scroll_max_x`][ImGui.get_scroll_max_x]]  

### ::: ImGui.get_scroll_y

 get scrolling amount [0 .. [`get_scroll_max_y`][ImGui.get_scroll_max_y]]  

### ::: ImGui.set_scroll_x

 set scrolling amount [0 .. [`get_scroll_max_x`][ImGui.get_scroll_max_x]]  

### ::: ImGui.set_scroll_y

 set scrolling amount [0 .. [`get_scroll_max_y`][ImGui.get_scroll_max_y]]  

### ::: ImGui.get_scroll_max_x

 get maximum scrolling amount ~~ ContentSize.x - WindowSize.x - DecorationsSize.x  

### ::: ImGui.get_scroll_max_y

 get maximum scrolling amount ~~ ContentSize.y - WindowSize.y - DecorationsSize.y  

### ::: ImGui.set_scroll_here_x

 adjust scrolling amount to make current cursor position visible. center_x_ratio=0.0: left, 0.5: center, 1.0: right. When using to make a "default/current item" visible, consider using [`set_item_default_focus`][ImGui.set_item_default_focus] instead.  

### ::: ImGui.set_scroll_here_y

 adjust scrolling amount to make current cursor position visible. center_y_ratio=0.0: top, 0.5: center, 1.0: bottom. When using to make a "default/current item" visible, consider using [`set_item_default_focus`][ImGui.set_item_default_focus] instead.  

### ::: ImGui.set_scroll_from_pos_x

 adjust scrolling amount to make given position visible. Generally [`get_cursor_start_pos`][ImGui.get_cursor_start_pos] + offset to compute a valid position.  

### ::: ImGui.set_scroll_from_pos_y

 adjust scrolling amount to make given position visible. Generally [`get_cursor_start_pos`][ImGui.get_cursor_start_pos] + offset to compute a valid position.  

## Parameters stacks (shared)  

### ::: ImGui.push_font

 use NULL as a shortcut to push default font  

### ::: ImGui.pop_font

### ::: ImGui.push_style_color

 modify a style color. always use this if you modify the style after [`new_frame`][ImGui.new_frame].  

### ::: ImGui.push_style_color

### ::: ImGui.pop_style_color

### ::: ImGui.push_style_var

 modify a style float variable. always use this if you modify the style after [`new_frame`][ImGui.new_frame].  

### ::: ImGui.push_style_var

 modify a style [`ImVec2`][ImGui::ImVec2] variable. always use this if you modify the style after [`new_frame`][ImGui.new_frame].  

### ::: ImGui.pop_style_var

### ::: ImGui.push_allow_keyboard_focus

 == tab stop enable. Allow focusing using TAB/Shift-TAB, enabled by default but you can disable it for certain widgets  

### ::: ImGui.pop_allow_keyboard_focus

### ::: ImGui.push_button_repeat

 in 'repeat' mode, [`button`][ImGui.button]*() functions return repeated true in a typematic manner (using io.KeyRepeatDelay/io.KeyRepeatRate setting). Note that you can call [`is_item_active`][ImGui.is_item_active] after any [`button`][ImGui.button] to tell if the button is held in the current frame.  

### ::: ImGui.pop_button_repeat

## Parameters stacks (current window)  

### ::: ImGui.push_item_width

 push width of items for common large "item+label" widgets. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -FLT_MIN always align width to the right side).  

### ::: ImGui.pop_item_width

### ::: ImGui.set_next_item_width

 set width of the _next_ common large "item+label" widget. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -FLT_MIN always align width to the right side)  

### ::: ImGui.calc_item_width

 width of item given pushed settings and current cursor position. NOT necessarily the width of last item unlike most 'Item' functions.  

### ::: ImGui.push_text_wrap_pos

 push word-wrapping position for [`text`][ImGui.text]*() commands. < 0.0f: no wrapping; 0.0f: wrap to end of window (or column); > 0.0f: wrap at 'wrap_pos_x' position in window local space  

### ::: ImGui.pop_text_wrap_pos

## Style read access  

- Use the style editor ([`show_style_editor`][ImGui.show_style_editor] function) to interactively see what the colors are)

### ::: ImGui.get_font

 get current font  

### ::: ImGui.get_font_size

 get current font size (= height in pixels) of current font with current scale applied  

### ::: ImGui.get_font_tex_uv_white_pixel

 get UV coordinate for a while pixel, useful to draw custom shapes via the [`ImDrawList`][ImGui::ImDrawList] API  

### ::: ImGui.get_color_u32

 retrieve given style color with style alpha applied and optional extra alpha multiplier, packed as a 32-bit value suitable for [`ImDrawList`][ImGui::ImDrawList]  

### ::: ImGui.get_color_u32

 retrieve given color with style alpha applied, packed as a 32-bit value suitable for [`ImDrawList`][ImGui::ImDrawList]  

### ::: ImGui.get_color_u32

 retrieve given color with style alpha applied, packed as a 32-bit value suitable for [`ImDrawList`][ImGui::ImDrawList]  

### ::: ImGui.get_style_color_vec4

 retrieve style color as stored in [`ImGuiStyle`][ImGui::ImGuiStyle] structure. use to feed back into PushStyleColor(), otherwise use GetColorU32() to get style color with style alpha baked in.  

## Cursor / Layout  

- By "cursor" we mean the current output position.
- The typical widget behavior is to output themselves at the current cursor position, then move the cursor one line down.
- You can call [`same_line`][ImGui.same_line] between widgets to undo the last carriage return and output at the right of the preceding widget.
- Attention! We currently have inconsistencies between window-local and absolute positions we will aim to fix with future API:
   Window-local coordinates:   [`same_line`][ImGui.same_line], [`get_cursor_pos`][ImGui.get_cursor_pos], [`set_cursor_pos`][ImGui.set_cursor_pos], [`get_cursor_start_pos`][ImGui.get_cursor_start_pos], [`get_content_region_max`][ImGui.get_content_region_max], GetWindowContentRegion*(), [`push_text_wrap_pos`][ImGui.push_text_wrap_pos]
   Absolute coordinate:        [`get_cursor_screen_pos`][ImGui.get_cursor_screen_pos], [`set_cursor_screen_pos`][ImGui.set_cursor_screen_pos], all [`ImDrawList`][ImGui::ImDrawList]:: functions.

### ::: ImGui.separator

 separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator.  

### ::: ImGui.same_line

 call between widgets or groups to layout them horizontally. X position given in window coordinates.  

### ::: ImGui.new_line

 undo a [`same_line`][ImGui.same_line] or force a new line when in an horizontal-layout context.  

### ::: ImGui.spacing

 add vertical spacing.  

### ::: ImGui.dummy

 add a dummy item of given size. unlike [`invisible_button`][ImGui.invisible_button], [`dummy`][ImGui.dummy] won't take the mouse click or be navigable into.  

### ::: ImGui.indent

 move content position toward the right, by indent_w, or style.IndentSpacing if indent_w <= 0  

### ::: ImGui.unindent

 move content position back to the left, by indent_w, or style.IndentSpacing if indent_w <= 0  

### ::: ImGui.begin_group

 lock horizontal starting position  

### ::: ImGui.end_group

 unlock horizontal starting position + capture the whole group bounding box into one "item" (so you can use [`is_item_hovered`][ImGui.is_item_hovered] or layout primitives such as [`same_line`][ImGui.same_line] on whole group, etc.)  

### ::: ImGui.get_cursor_pos

 cursor position in window coordinates (relative to window position)  

### ::: ImGui.get_cursor_pos_x

   (some functions are using window-relative coordinates, such as: [`get_cursor_pos`][ImGui.get_cursor_pos], [`get_cursor_start_pos`][ImGui.get_cursor_start_pos], [`get_content_region_max`][ImGui.get_content_region_max], GetWindowContentRegion* etc.

### ::: ImGui.get_cursor_pos_y

    other functions such as [`get_cursor_screen_pos`][ImGui.get_cursor_screen_pos] or everything in [`ImDrawList`][ImGui::ImDrawList]::

### ::: ImGui.set_cursor_pos

    are using the main, absolute coordinate system.

### ::: ImGui.set_cursor_pos_x

    [`get_window_pos`][ImGui.get_window_pos] + [`get_cursor_pos`][ImGui.get_cursor_pos] == [`get_cursor_screen_pos`][ImGui.get_cursor_screen_pos] etc.)

### ::: ImGui.set_cursor_pos_y

### ::: ImGui.get_cursor_start_pos

 initial cursor position in window coordinates  

### ::: ImGui.get_cursor_screen_pos

 cursor position in absolute coordinates (useful to work with [`ImDrawList`][ImGui::ImDrawList] API). generally top-left == [`get_main_viewport`][ImGui.get_main_viewport]->Pos == (0,0) in single viewport mode, and bottom-right == [`get_main_viewport`][ImGui.get_main_viewport]->Pos+Size == io.DisplaySize in single-viewport mode.  

### ::: ImGui.set_cursor_screen_pos

 cursor position in absolute coordinates  

### ::: ImGui.align_text_to_frame_padding

 vertically align upcoming text baseline to FramePadding.y so that it will align properly to regularly framed items (call if you have text on a line before a framed item)  

### ::: ImGui.get_text_line_height

 ~ FontSize  

### ::: ImGui.get_text_line_height_with_spacing

 ~ FontSize + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of text)  

### ::: ImGui.get_frame_height

 ~ FontSize + style.FramePadding.y * 2  

### ::: ImGui.get_frame_height_with_spacing

 ~ FontSize + style.FramePadding.y * 2 + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of framed widgets)  

## ID stack/scopes  
Read the FAQ (docs/FAQ.md or http://dearimgui.org/faq) for more details about how ID are handled in dear imgui.  

- Those questions are answered and impacted by understanding of the ID stack system:
    - "Q: Why is my widget not reacting when I click on it?"
    - "Q: How can I have widgets with an empty label?"
    - "Q: How can I have multiple widgets with the same label?"
- Short version: ID are hashes of the entire ID stack. If you are creating widgets in a loop you most likely
  want to push a unique identifier (e.g. object pointer, loop index) to uniquely differentiate them.
- You can also use the "Label##foobar" syntax within widget label to distinguish them from each others.
- In this header file we use the "label"/"name" terminology to denote a string that will be displayed + used as an ID,
  whereas "str_id" denote a string that is only used as an ID and not normally displayed.

### ::: ImGui.push_id

 push string into the ID stack (will hash string).  

### ::: ImGui.push_id

 push string into the ID stack (will hash string).  

### ::: ImGui.push_id

 push pointer into the ID stack (will hash pointer).  

### ::: ImGui.push_id

 push integer into the ID stack (will hash integer).  

### ::: ImGui.pop_id

 pop from the ID stack.  

### ::: ImGui.get_id

 calculate unique ID (hash of whole ID stack + given parameter). e.g. if you want to query into [`ImGuiStorage`][ImGui::ImGuiStorage] yourself  

### ::: ImGui.get_id

### ::: ImGui.get_id

## Widgets: [`text`][ImGui.text]  

### ::: ImGui.text_unformatted

 raw text without formatting. Roughly equivalent to [`text`][ImGui.text]("%s", text) but: A) doesn't require null terminated string if 'text_end' is specified, B) it's faster, no memory copy is done, no buffer size limits, recommended for long chunks of text.  

### ::: ImGui.text

 formatted text  

### ::: ImGui.text_colored

 shortcut for PushStyleColor(ImGuiCol_Text, col); [`text`][ImGui.text](fmt, ...); [`pop_style_color`][ImGui.pop_style_color];  

### ::: ImGui.text_disabled

 shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); [`text`][ImGui.text](fmt, ...); [`pop_style_color`][ImGui.pop_style_color];  

### ::: ImGui.text_wrapped

 shortcut for [`push_text_wrap_pos`][ImGui.push_text_wrap_pos](0.0f); [`text`][ImGui.text](fmt, ...); [`pop_text_wrap_pos`][ImGui.pop_text_wrap_pos];. Note that this won't work on an auto-resizing window if there's no other widgets to extend the window width, yoy may need to set a size using [`set_next_window_size`][ImGui.set_next_window_size].  

### ::: ImGui.label_text

 display text+label aligned the same way as value+label widgets  

### ::: ImGui.bullet_text

 shortcut for [`bullet`][ImGui.bullet]+[`text`][ImGui.text]  

## Widgets: Main  

- Most widgets return true when the value has been changed or when pressed/selected
- You may also use one of the many IsItemXXX functions (e.g. [`is_item_active`][ImGui.is_item_active], [`is_item_hovered`][ImGui.is_item_hovered], etc.) to query widget state.

### ::: ImGui.button

 button  

### ::: ImGui.small_button

 button with FramePadding=(0,0) to easily embed within text  

### ::: ImGui.invisible_button

 flexible button behavior without the visuals, frequently useful to build custom behaviors using the public api (along with [`is_item_active`][ImGui.is_item_active], [`is_item_hovered`][ImGui.is_item_hovered], etc.)  

### ::: ImGui.arrow_button

 square button with an arrow shape  

### ::: ImGui.image

### ::: ImGui.image_button

 <0 frame_padding uses default frame padding settings. 0 for no padding  

### ::: ImGui.checkbox

### ::: ImGui.checkbox_flags

### ::: ImGui.checkbox_flags

### ::: ImGui.radio_button

 use with e.g. if (RadioButton("one", my_value==1)) { my_value = 1; }  

### ::: ImGui.radio_button

 shortcut to handle the above pattern when value is an integer  

### ::: ImGui.progress_bar

### ::: ImGui.bullet

 draw a small circle + keep the cursor on the same line. advance cursor x position by [`get_tree_node_to_label_spacing`][ImGui.get_tree_node_to_label_spacing], same distance that TreeNode() uses  

## Widgets: Combo Box  

- The [`begin_combo`][ImGui.begin_combo]/[`end_combo`][ImGui.end_combo] api allows you to manage your contents and selection state however you want it, by creating e.g. Selectable() items.
- The old Combo() api are helpers over [`begin_combo`][ImGui.begin_combo]/[`end_combo`][ImGui.end_combo] which are kept available for convenience purpose. This is analogous to how ListBox are created.

### ::: ImGui.begin_combo

### ::: ImGui.end_combo

 only call [`end_combo`][ImGui.end_combo] if [`begin_combo`][ImGui.begin_combo] returns true!  

### ::: ImGui.combo

### ::: ImGui.combo

 Separate items with \0 within a string, end item-list with \0\0. e.g. "One\0Two\0Three\0"  

### ::: ImGui.combo

## Widgets: Drag Sliders  

- CTRL+Click on any drag box to turn them into an input box. Manually input values aren't clamped by default and can go off-bounds. Use ImGuiSliderFlags_AlwaysClamp to always clamp.
- For all the Float2/Float3/Float4/Int2/Int3/Int4 versions of every functions, note that a 'float v[X]' function argument is the same as 'float* v',
  the array syntax is just a way to document the number of elements that are expected to be accessible. You can pass address of your first element out of a contiguous set, e.g. &myvector.x
- Adjust format string to decorate the value with a prefix, a suffix, or adapt the editing and display precision e.g. "%.3f" -> 1.234; "%5.2f secs" -> 01.23 secs; "Biscuit: %.0f" -> Biscuit: 1; etc.
- Format string may also be set to NULL or use the default format ("%f" or "%d").
- Speed are per-pixel of mouse movement (v_speed=0.2f: mouse needs to move by 5 pixels to increase value by 1). For gamepad/keyboard navigation, minimum speed is Max(v_speed, minimum_step_at_given_precision).
- Use v_min < v_max to clamp edits to given limits. Note that CTRL+Click manual input can override those limits if ImGuiSliderFlags_AlwaysClamp is not used.
- Use v_max = FLT_MAX / INT_MAX etc to avoid clamping to a maximum, same with v_min = -FLT_MAX / INT_MIN to avoid clamping to a minimum.
- We use the same sets of flags for DragXXX() and SliderXXX() functions as the features are the same and it makes it easier to swap them.
- Legacy: Pre-1.78 there are DragXXX() function signatures that takes a final `float power=1.0f' argument instead of the `[`ImGuiSliderFlags`][ImGui::ImGuiSliderFlags] flags=0' argument.
  If you get a warning converting a float to [`ImGuiSliderFlags`][ImGui::ImGuiSliderFlags], read https://github.com/ocornut/imgui/issues/3361

### ::: ImGui.drag_float

 If v_min >= v_max we have no bound  

### ::: ImGui.drag_float2

### ::: ImGui.drag_float3

### ::: ImGui.drag_float4

### ::: ImGui.drag_float_range2

### ::: ImGui.drag_int

 If v_min >= v_max we have no bound  

### ::: ImGui.drag_int2

### ::: ImGui.drag_int3

### ::: ImGui.drag_int4

### ::: ImGui.drag_int_range2

### ::: ImGui.drag_scalar

### ::: ImGui.drag_scalar_n

## Widgets: Regular Sliders  

- CTRL+Click on any slider to turn them into an input box. Manually input values aren't clamped by default and can go off-bounds. Use ImGuiSliderFlags_AlwaysClamp to always clamp.
- Adjust format string to decorate the value with a prefix, a suffix, or adapt the editing and display precision e.g. "%.3f" -> 1.234; "%5.2f secs" -> 01.23 secs; "Biscuit: %.0f" -> Biscuit: 1; etc.
- Format string may also be set to NULL or use the default format ("%f" or "%d").
- Legacy: Pre-1.78 there are SliderXXX() function signatures that takes a final `float power=1.0f' argument instead of the `[`ImGuiSliderFlags`][ImGui::ImGuiSliderFlags] flags=0' argument.
  If you get a warning converting a float to [`ImGuiSliderFlags`][ImGui::ImGuiSliderFlags], read https://github.com/ocornut/imgui/issues/3361

### ::: ImGui.slider_float

 adjust format to decorate the value with a prefix or a suffix for in-slider labels or unit display.  

### ::: ImGui.slider_float2

### ::: ImGui.slider_float3

### ::: ImGui.slider_float4

### ::: ImGui.slider_angle

### ::: ImGui.slider_int

### ::: ImGui.slider_int2

### ::: ImGui.slider_int3

### ::: ImGui.slider_int4

### ::: ImGui.slider_scalar

### ::: ImGui.slider_scalar_n

### ::: ImGui.v_slider_float

### ::: ImGui.v_slider_int

### ::: ImGui.v_slider_scalar

## Widgets: Input with Keyboard  

- If you want to use [`input_text`][ImGui.input_text] with std::string or any custom dynamic string type, see misc/cpp/imgui_stdlib.h and comments in imgui_demo.cpp.
- Most of the [`ImGuiInputTextFlags`][ImGui::ImGuiInputTextFlags] flags are only useful for [`input_text`][ImGui.input_text] and not for InputFloatX, InputIntX, [`input_double`][ImGui.input_double] etc.

### ::: ImGui.input_text

### ::: ImGui.input_text_multiline

### ::: ImGui.input_text_with_hint

### ::: ImGui.input_float

### ::: ImGui.input_float2

### ::: ImGui.input_float3

### ::: ImGui.input_float4

### ::: ImGui.input_int

### ::: ImGui.input_int2

### ::: ImGui.input_int3

### ::: ImGui.input_int4

### ::: ImGui.input_double

### ::: ImGui.input_scalar

### ::: ImGui.input_scalar_n

Widgets: Color Editor/Picker (tip: the ColorEdit* functions have a little color square that can be left-clicked to open a picker, and right-clicked to open an option menu.)  

- Note that in C++ a 'float v[X]' function argument is the _same_ as 'float* v', the array syntax is just a way to document the number of elements that are expected to be accessible.
- You can pass the address of a first float element out of a contiguous structure, e.g. &myvector.x

### ::: ImGui.color_edit3

### ::: ImGui.color_edit4

### ::: ImGui.color_picker3

### ::: ImGui.color_picker4

### ::: ImGui.color_button

 display a color square/button, hover for details, return true when pressed.  

### ::: ImGui.set_color_edit_options

 initialize current options (generally on application startup) if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls.  

## Widgets: Trees  

- TreeNode functions return true when the node is open, in which case you need to also call [`tree_pop`][ImGui.tree_pop] when you are finished displaying the tree node contents.

### ::: ImGui.tree_node

### ::: ImGui.tree_node

 helper variation to easily decorelate the id from the displayed string. Read the FAQ about why and how to use ID. to align arbitrary text at the same level as a TreeNode() you can use [`bullet`][ImGui.bullet].  

### ::: ImGui.tree_node

 "  

### ::: ImGui.tree_node_ex

### ::: ImGui.tree_node_ex

### ::: ImGui.tree_node_ex

### ::: ImGui.tree_push

 ~ [`indent`][ImGui.indent]+PushId(). Already called by TreeNode() when returning true, but you can call TreePush/[`tree_pop`][ImGui.tree_pop] yourself if desired.  

### ::: ImGui.tree_push

 "  

### ::: ImGui.tree_pop

 ~ [`unindent`][ImGui.unindent]+PopId()  

### ::: ImGui.get_tree_node_to_label_spacing

 horizontal distance preceding label when using TreeNode*() or [`bullet`][ImGui.bullet] == (g.FontSize + style.FramePadding.x*2) for a regular unframed TreeNode  

### ::: ImGui.collapsing_header

 if returning 'true' the header is open. doesn't indent nor push on ID stack. user doesn't have to call [`tree_pop`][ImGui.tree_pop].  

### ::: ImGui.collapsing_header

 when 'p_visible != NULL': if '*p_visible==true' display an additional small close button on upper right of the header which will set the bool to false when clicked, if '*p_visible==false' don't display the header.  

### ::: ImGui.set_next_item_open

 set next TreeNode/CollapsingHeader open state.  

## Widgets: Selectables  

- A selectable highlights when hovered, and can display another color when selected.
- Neighbors selectable extend their highlight bounds in order to leave no gap between them. This is so a series of selected Selectable appear contiguous.

### ::: ImGui.selectable

 "bool selected" carry the selection state (read-only). Selectable() is clicked is returns true so you can modify your selection state. size.x==0.0: use remaining width, size.x>0.0: specify width. size.y==0.0: use label height, size.y>0.0: specify height  

### ::: ImGui.selectable

 "bool* p_selected" point to the selection state (read-write), as a convenient helper.  

## Widgets: List Boxes  

- This is essentially a thin wrapper to using BeginChild/[`end_child`][ImGui.end_child] with some stylistic changes.
- The [`begin_list_box`][ImGui.begin_list_box]/[`end_list_box`][ImGui.end_list_box] api allows you to manage your contents and selection state however you want it, by creating e.g. Selectable() or any items.
- The simplified/old ListBox() api are helpers over [`begin_list_box`][ImGui.begin_list_box]/[`end_list_box`][ImGui.end_list_box] which are kept available for convenience purpose. This is analoguous to how Combos are created.
- Choose frame width:   size.x > 0.0f: custom  /  size.x < 0.0f or -FLT_MIN: right-align   /  size.x = 0.0f (default): use current ItemWidth
- Choose frame height:  size.y > 0.0f: custom  /  size.y < 0.0f or -FLT_MIN: bottom-align  /  size.y = 0.0f (default): arbitrary default height which can fit ~7 items

### ::: ImGui.begin_list_box

 open a framed scrolling region  

### ::: ImGui.end_list_box

 only call [`end_list_box`][ImGui.end_list_box] if [`begin_list_box`][ImGui.begin_list_box] returned true!  

### ::: ImGui.list_box

### ::: ImGui.list_box

## Widgets: Data Plotting  

- Consider using ImPlot (https://github.com/epezent/implot) which is much better!

### ::: ImGui.plot_lines

### ::: ImGui.plot_lines

### ::: ImGui.plot_histogram

### ::: ImGui.plot_histogram

Widgets: Value() Helpers.  

- Those are merely shortcut to calling [`text`][ImGui.text] with a format string. Output single value in "name: value" format (tip: freely declare more in your code to handle your types. you can add functions to the ImGui namespace)

### ::: ImGui.value

### ::: ImGui.value

### ::: ImGui.value

### ::: ImGui.value

## Widgets: Menus  

- Use [`begin_menu_bar`][ImGui.begin_menu_bar] on a window ImGuiWindowFlags_MenuBar to append to its menu bar.
- Use [`begin_main_menu_bar`][ImGui.begin_main_menu_bar] to create a menu bar at the top of the screen and append to it.
- Use [`begin_menu`][ImGui.begin_menu] to create a menu. You can call [`begin_menu`][ImGui.begin_menu] multiple time with the same identifier to append more items to it.
- Not that MenuItem() keyboardshortcuts are displayed as a convenience but _not processed_ by Dear ImGui at the moment.

### ::: ImGui.begin_menu_bar

 append to menu-bar of current window (requires ImGuiWindowFlags_MenuBar flag set on parent window).  

### ::: ImGui.end_menu_bar

 only call [`end_menu_bar`][ImGui.end_menu_bar] if [`begin_menu_bar`][ImGui.begin_menu_bar] returns true!  

### ::: ImGui.begin_main_menu_bar

 create and append to a full screen menu-bar.  

### ::: ImGui.end_main_menu_bar

 only call [`end_main_menu_bar`][ImGui.end_main_menu_bar] if [`begin_main_menu_bar`][ImGui.begin_main_menu_bar] returns true!  

### ::: ImGui.begin_menu

 create a sub-menu entry. only call [`end_menu`][ImGui.end_menu] if this returns true!  

### ::: ImGui.end_menu

 only call [`end_menu`][ImGui.end_menu] if [`begin_menu`][ImGui.begin_menu] returns true!  

### ::: ImGui.menu_item

 return true when activated.  

### ::: ImGui.menu_item

 return true when activated + toggle (*p_selected) if p_selected != NULL  

## Tooltips  

- Tooltip are windows following the mouse. They do not take focus away.

### ::: ImGui.begin_tooltip

 begin/append a tooltip window. to create full-featured tooltip (with any kind of items).  

### ::: ImGui.end_tooltip

### ::: ImGui.set_tooltip

 set a text-only tooltip, typically use with [`is_item_hovered`][ImGui.is_item_hovered]. override any previous call to [`set_tooltip`][ImGui.set_tooltip].  

## Popups, Modals  

  - They block normal mouse hovering detection (and therefore most mouse interactions) behind them.
  - If not modal: they can be closed by clicking anywhere outside them, or by pressing ESCAPE.
  - Their visibility state (~bool) is held internally instead of being held by the programmer as we are used to with regular Begin*() calls.
  - The 3 properties above are related: we need to retain popup visibility state in the library because popups may be closed as any time.
  - You can bypass the hovering restriction by using ImGuiHoveredFlags_AllowWhenBlockedByPopup when calling [`is_item_hovered`][ImGui.is_item_hovered] or [`is_window_hovered`][ImGui.is_window_hovered].
  - IMPORTANT: Popup identifiers are relative to the current ID stack, so OpenPopup and [`begin_popup`][ImGui.begin_popup] generally needs to be at the same level of the stack.
   This is sometimes leading to confusing mistakes. May rework this in the future.

## Popups: begin/end functions  

  - [`begin_popup`][ImGui.begin_popup]: query popup state, if open start appending into the window. Call [`end_popup`][ImGui.end_popup] afterwards. [`ImGuiWindowFlags`][ImGui::ImGuiWindowFlags] are forwarded to the window.
  - [`begin_popup_modal`][ImGui.begin_popup_modal]: block every interactions behind the window, cannot be closed by user, add a dimming background, has a title bar.

### ::: ImGui.begin_popup

 return true if the popup is open, and you can start outputting to it.  

### ::: ImGui.begin_popup_modal

 return true if the modal is open, and you can start outputting to it.  

### ::: ImGui.end_popup

 only call [`end_popup`][ImGui.end_popup] if BeginPopupXXX() returns true!  

## Popups: open/close functions  

  - OpenPopup(): set popup state to open. [`ImGuiPopupFlags`][ImGui::ImGuiPopupFlags] are available for opening options.
  - If not modal: they can be closed by clicking anywhere outside them, or by pressing ESCAPE.
  - [`close_current_popup`][ImGui.close_current_popup]: use inside the [`begin_popup`][ImGui.begin_popup]/[`end_popup`][ImGui.end_popup] scope to close manually.
  - [`close_current_popup`][ImGui.close_current_popup] is called by default by Selectable()/MenuItem() when activated (FIXME: need some options).
  - Use ImGuiPopupFlags_NoOpenOverExistingPopup to avoid opening a popup if there's already one at the same level. This is equivalent to e.g. testing for !IsAnyPopupOpen() prior to OpenPopup().
  - Use [`is_window_appearing`][ImGui.is_window_appearing] after [`begin_popup`][ImGui.begin_popup] to tell if a window just opened.
  - IMPORTANT: Notice that for [`open_popup_on_item_click`][ImGui.open_popup_on_item_click] we exceptionally default flags to 1 (== ImGuiPopupFlags_MouseButtonRight) for backward compatibility with older API taking 'int mouse_button = 1' parameter

### ::: ImGui.open_popup

 call to mark popup as open (don't call every frame!).  

### ::: ImGui.open_popup

 id overload to facilitate calling from nested stacks  

### ::: ImGui.open_popup_on_item_click

 helper to open popup when clicked on last item. Default to ImGuiPopupFlags_MouseButtonRight == 1. (note: actually triggers on the mouse _released_ event to be consistent with popup behaviors)  

### ::: ImGui.close_current_popup

 manually close the popup we have begin-ed into.  

## Popups: open+begin combined functions helpers  

  - Helpers to do OpenPopup+[`begin_popup`][ImGui.begin_popup] where the Open action is triggered by e.g. hovering an item and right-clicking.
  - They are convenient to easily create context menus, hence the name.
  - IMPORTANT: Notice that BeginPopupContextXXX takes [`ImGuiPopupFlags`][ImGui::ImGuiPopupFlags] just like OpenPopup() and unlike [`begin_popup`][ImGui.begin_popup]. For full consistency, we may add [`ImGuiWindowFlags`][ImGui::ImGuiWindowFlags] to the BeginPopupContextXXX functions in the future.
  - IMPORTANT: Notice that we exceptionally default their flags to 1 (== ImGuiPopupFlags_MouseButtonRight) for backward compatibility with older API taking 'int mouse_button = 1' parameter, so if you add other flags remember to re-add the ImGuiPopupFlags_MouseButtonRight.

### ::: ImGui.begin_popup_context_item

 open+begin popup when clicked on last item. Use str_id==NULL to associate the popup to previous item. If you want to use that on a non-interactive item such as [`text`][ImGui.text] you need to pass in an explicit ID here. read comments in .cpp!  

### ::: ImGui.begin_popup_context_window

### ::: ImGui.begin_popup_context_void

 open+begin popup when clicked in void (where there are no windows).  

## Popups: query functions  

  - IsPopupOpen(): return true if the popup is open at the current [`begin_popup`][ImGui.begin_popup] level of the popup stack.
  - IsPopupOpen() with ImGuiPopupFlags_AnyPopupId: return true if any popup is open at the current [`begin_popup`][ImGui.begin_popup] level of the popup stack.
  - IsPopupOpen() with ImGuiPopupFlags_AnyPopupId + ImGuiPopupFlags_AnyPopupLevel: return true if any popup is open.

### ::: ImGui.is_popup_open

 return true if the popup is open.  

## Tables  

- Full-featured replacement for old [`columns`][ImGui.columns] API.
- See Demo->Tables for demo code. See top of imgui_tables.cpp for general commentary.
- See [`ImGuiTableFlags`][ImGui::ImGuiTableFlags] and [`ImGuiTableColumnFlags`][ImGui::ImGuiTableColumnFlags] enums for a description of available flags.

The typical call flow is:  

- 1. Call [`begin_table`][ImGui.begin_table], early out if returning false.
- 2. Optionally call [`table_setup_column`][ImGui.table_setup_column] to submit column name/flags/defaults.
- 3. Optionally call [`table_setup_scroll_freeze`][ImGui.table_setup_scroll_freeze] to request scroll freezing of columns/rows.
- 4. Optionally call [`table_headers_row`][ImGui.table_headers_row] to submit a header row. Names are pulled from [`table_setup_column`][ImGui.table_setup_column] data.
- 5. Populate contents:
      - In most situations you can use [`table_next_row`][ImGui.table_next_row] + [`table_set_column_index`][ImGui.table_set_column_index](N) to start appending into a column.
      - If you are using tables as a sort of grid, where every columns is holding the same type of contents,
     you may prefer using [`table_next_column`][ImGui.table_next_column] instead of [`table_next_row`][ImGui.table_next_row] + [`table_set_column_index`][ImGui.table_set_column_index].
     [`table_next_column`][ImGui.table_next_column] will automatically wrap-around into the next row if needed.
      - IMPORTANT: Comparatively to the old [`columns`][ImGui.columns] API, we need to call [`table_next_column`][ImGui.table_next_column] for the first column!
      - Summary of possible call flow:

       [`table_next_row`][ImGui.table_next_row] -> [`table_set_column_index`][ImGui.table_set_column_index](0) -> [`text`][ImGui.text]("Hello 0") -> [`table_set_column_index`][ImGui.table_set_column_index](1) -> [`text`][ImGui.text]("Hello 1")  // OK
       [`table_next_row`][ImGui.table_next_row] -> [`table_next_column`][ImGui.table_next_column]      -> [`text`][ImGui.text]("Hello 0") -> [`table_next_column`][ImGui.table_next_column]      -> [`text`][ImGui.text]("Hello 1")  // OK
                         [`table_next_column`][ImGui.table_next_column]      -> [`text`][ImGui.text]("Hello 0") -> [`table_next_column`][ImGui.table_next_column]      -> [`text`][ImGui.text]("Hello 1")  // OK: [`table_next_column`][ImGui.table_next_column] automatically gets to next row!
       [`table_next_row`][ImGui.table_next_row]                           -> [`text`][ImGui.text]("Hello 0")                                               // Not OK! Missing [`table_set_column_index`][ImGui.table_set_column_index] or [`table_next_column`][ImGui.table_next_column]! [`text`][ImGui.text] will not appear!

- 5. Call [`end_table`][ImGui.end_table]

### ::: ImGui.begin_table

### ::: ImGui.end_table

 only call [`end_table`][ImGui.end_table] if [`begin_table`][ImGui.begin_table] returns true!  

### ::: ImGui.table_next_row

 append into the first cell of a new row.  

### ::: ImGui.table_next_column

 append into the next column (or first column of next row if currently in last column). Return true when column is visible.  

### ::: ImGui.table_set_column_index

 append into the specified column. Return true when column is visible.  

## Tables: Headers & [`columns`][ImGui.columns] declaration  

- Use [`table_setup_column`][ImGui.table_setup_column] to specify label, resizing policy, default width/weight, id, various other flags etc.
- Use [`table_headers_row`][ImGui.table_headers_row] to create a header row and automatically submit a [`table_header`][ImGui.table_header] for each column.
  Headers are required to perform: reordering, sorting, and opening the context menu.
  The context menu can also be made available in columns body using ImGuiTableFlags_ContextMenuInBody.
- You may manually submit headers using [`table_next_row`][ImGui.table_next_row] + [`table_header`][ImGui.table_header] calls, but this is only useful in
  some advanced use cases (e.g. adding custom widgets in header row).
- Use [`table_setup_scroll_freeze`][ImGui.table_setup_scroll_freeze] to lock columns/rows so they stay visible when scrolled.

### ::: ImGui.table_setup_column

### ::: ImGui.table_setup_scroll_freeze

 lock columns/rows so they stay visible when scrolled.  

### ::: ImGui.table_headers_row

 submit all headers cells based on data provided to [`table_setup_column`][ImGui.table_setup_column] + submit context menu  

### ::: ImGui.table_header

 submit one header cell manually (rarely used)  

## Tables: Sorting & Miscellaneous functions  

- Sorting: call [`table_get_sort_specs`][ImGui.table_get_sort_specs] to retrieve latest sort specs for the table. NULL when not sorting.
  When 'sort_specs->SpecsDirty == true' you should sort your data. It will be true when sorting specs have
  changed since last call, or the first time. Make sure to set 'SpecsDirty = false' after sorting,
  else you may wastefully sort your data every frame!
- Functions args 'int column_n' treat the default value of -1 as the same as passing the current column index.

### ::: ImGui.table_get_sort_specs

 get latest sort specs for the table (NULL if not sorting).  Lifetime: don't hold on this pointer over multiple frames or past any subsequent call to [`begin_table`][ImGui.begin_table].  

### ::: ImGui.table_get_column_count

 return number of columns (value passed to [`begin_table`][ImGui.begin_table])  

### ::: ImGui.table_get_column_index

 return current column index.  

### ::: ImGui.table_get_row_index

 return current row index.  

### ::: ImGui.table_get_column_name

 return "" if column didn't have a name declared by [`table_setup_column`][ImGui.table_setup_column]. Pass -1 to use current column.  

### ::: ImGui.table_get_column_flags

 return column flags so you can query their Enabled/Visible/Sorted/Hovered status flags. Pass -1 to use current column.  

### ::: ImGui.table_set_column_enabled

### ::: ImGui.table_set_bg_color

 change the color of a cell, row, or column. See [`ImGuiTableBgTarget`][ImGui::ImGuiTableBgTarget] flags for details.  

## Legacy [`columns`][ImGui.columns] API (prefer using Tables!)  

- You can also use [`same_line`][ImGui.same_line](pos_x) to mimic simplified columns.

### ::: ImGui.columns

### ::: ImGui.next_column

 next column, defaults to current row or next row if the current row is finished  

### ::: ImGui.get_column_index

 get current column index  

### ::: ImGui.get_column_width

 get column width (in pixels). pass -1 to use current column  

### ::: ImGui.set_column_width

 set column width (in pixels). pass -1 to use current column  

### ::: ImGui.get_column_offset

 get position of column line (in pixels, from the left side of the contents region). pass -1 to use current column, otherwise 0..[`get_columns_count`][ImGui.get_columns_count] inclusive. column 0 is typically 0.0f  

### ::: ImGui.set_column_offset

 set position of column line (in pixels, from the left side of the contents region). pass -1 to use current column  

### ::: ImGui.get_columns_count

## Tab Bars, Tabs  

### ::: ImGui.begin_tab_bar

 create and append into a TabBar  

### ::: ImGui.end_tab_bar

 only call [`end_tab_bar`][ImGui.end_tab_bar] if [`begin_tab_bar`][ImGui.begin_tab_bar] returns true!  

### ::: ImGui.begin_tab_item

 create a Tab. Returns true if the Tab is selected.  

### ::: ImGui.end_tab_item

 only call [`end_tab_item`][ImGui.end_tab_item] if [`begin_tab_item`][ImGui.begin_tab_item] returns true!  

### ::: ImGui.tab_item_button

 create a Tab behaving like a button. return true when clicked. cannot be selected in the tab bar.  

### ::: ImGui.set_tab_item_closed

 notify TabBar or Docking system of a closed tab/window ahead (useful to reduce visual flicker on reorderable tab bars). For tab-bar: call after [`begin_tab_bar`][ImGui.begin_tab_bar] and before Tab submissions. Otherwise call with a window name.  

## Logging/Capture  

- All text output from the interface can be captured into tty/file/clipboard. By default, tree nodes are automatically opened during logging.

### ::: ImGui.log_to_tty

 start logging to tty (stdout)  

### ::: ImGui.log_to_file

 start logging to file  

### ::: ImGui.log_to_clipboard

 start logging to OS clipboard  

### ::: ImGui.log_finish

 stop logging (close file, etc.)  

### ::: ImGui.log_buttons

 helper to display buttons for logging to tty/file/clipboard  

### ::: ImGui.log_text

 pass text data straight to log (without being displayed)  

## Drag and Drop  

- On source items, call [`begin_drag_drop_source`][ImGui.begin_drag_drop_source], if it returns true also call [`set_drag_drop_payload`][ImGui.set_drag_drop_payload] + [`end_drag_drop_source`][ImGui.end_drag_drop_source].
- On target candidates, call [`begin_drag_drop_target`][ImGui.begin_drag_drop_target], if it returns true also call [`accept_drag_drop_payload`][ImGui.accept_drag_drop_payload] + [`end_drag_drop_target`][ImGui.end_drag_drop_target].
- If you stop calling [`begin_drag_drop_source`][ImGui.begin_drag_drop_source] the payload is preserved however it won't have a preview tooltip (we currently display a fallback "..." tooltip, see #1725)
- An item can be both drag source and drop target.

### ::: ImGui.begin_drag_drop_source

 call after submitting an item which may be dragged. when this return true, you can call [`set_drag_drop_payload`][ImGui.set_drag_drop_payload] + [`end_drag_drop_source`][ImGui.end_drag_drop_source]  

### ::: ImGui.set_drag_drop_payload

 type is a user defined string of maximum 32 characters. Strings starting with '_' are reserved for dear imgui internal types. Data is copied and held by imgui. Return true when payload has been accepted.  

### ::: ImGui.end_drag_drop_source

 only call [`end_drag_drop_source`][ImGui.end_drag_drop_source] if [`begin_drag_drop_source`][ImGui.begin_drag_drop_source] returns true!  

### ::: ImGui.begin_drag_drop_target

 call after submitting an item that may receive a payload. If this returns true, you can call [`accept_drag_drop_payload`][ImGui.accept_drag_drop_payload] + [`end_drag_drop_target`][ImGui.end_drag_drop_target]  

### ::: ImGui.accept_drag_drop_payload

 accept contents of a given type. If ImGuiDragDropFlags_AcceptBeforeDelivery is set you can peek into the payload before the mouse button is released.  

### ::: ImGui.end_drag_drop_target

 only call [`end_drag_drop_target`][ImGui.end_drag_drop_target] if [`begin_drag_drop_target`][ImGui.begin_drag_drop_target] returns true!  

### ::: ImGui.get_drag_drop_payload

 peek directly into the current payload from anywhere. may return NULL. use [`ImGuiPayload`][ImGui::ImGuiPayload]::IsDataType() to test for the payload type.  

## Disabling [BETA API]  

- Disable all user interactions and dim items visuals (applying style.DisabledAlpha over current colors)
- Those can be nested but it cannot be used to enable an already disabled section (a single [`begin_disabled`][ImGui.begin_disabled](true) in the stack is enough to keep everything disabled)
- [`begin_disabled`][ImGui.begin_disabled](false) essentially does nothing useful but is provided to facilitate use of boolean expressions. If you can avoid calling [`begin_disabled`][ImGui.begin_disabled](False)/[`end_disabled`][ImGui.end_disabled] best to avoid it.

### ::: ImGui.begin_disabled

### ::: ImGui.end_disabled

## Clipping  

- Mouse hovering is affected by [`push_clip_rect`][ImGui.push_clip_rect] calls, unlike direct calls to [`ImDrawList`][ImGui::ImDrawList]::[`push_clip_rect`][ImGui.push_clip_rect] which are render only.

### ::: ImGui.push_clip_rect

### ::: ImGui.pop_clip_rect

## Focus, Activation  

- Prefer using "[`set_item_default_focus`][ImGui.set_item_default_focus]" over "if ([`is_window_appearing`][ImGui.is_window_appearing]) [`set_scroll_here_y`][ImGui.set_scroll_here_y]" when applicable to signify "this is the default item"

### ::: ImGui.set_item_default_focus

 make last item the default focused item of a window.  

### ::: ImGui.set_keyboard_focus_here

 focus keyboard on the next widget. Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.  

## Item/Widgets Utilities and Query Functions  

- Most of the functions are referring to the previous Item that has been submitted.
- See Demo Window under "Widgets->Querying Status" for an interactive visualization of most of those functions.

### ::: ImGui.is_item_hovered

 is the last item hovered? (and usable, aka not blocked by a popup, etc.). See [`ImGuiHoveredFlags`][ImGui::ImGuiHoveredFlags] for more options.  

### ::: ImGui.is_item_active

 is the last item active? (e.g. button being held, text field being edited. This will continuously return true while holding mouse button on an item. Items that don't interact will always return false)  

### ::: ImGui.is_item_focused

 is the last item focused for keyboard/gamepad navigation?  

### ::: ImGui.is_item_clicked

 is the last item hovered and mouse clicked on? (**)  == [`is_mouse_clicked`][ImGui.is_mouse_clicked](mouse_button) && [`is_item_hovered`][ImGui.is_item_hovered]Important. (**) this it NOT equivalent to the behavior of e.g. [`button`][ImGui.button]. Read comments in function definition.  

### ::: ImGui.is_item_visible

 is the last item visible? (items may be out of sight because of clipping/scrolling)  

### ::: ImGui.is_item_edited

 did the last item modify its underlying value this frame? or was pressed? This is generally the same as the "bool" return value of many widgets.  

### ::: ImGui.is_item_activated

 was the last item just made active (item was previously inactive).  

### ::: ImGui.is_item_deactivated

 was the last item just made inactive (item was previously active). Useful for Undo/Redo patterns with widgets that requires continuous editing.  

### ::: ImGui.is_item_deactivated_after_edit

 was the last item just made inactive and made a value change when it was active? (e.g. Slider/Drag moved). Useful for Undo/Redo patterns with widgets that requires continuous editing. Note that you may get false positives (some widgets such as Combo()/ListBox()/Selectable() will return true even when clicking an already selected item).  

### ::: ImGui.is_item_toggled_open

 was the last item open state toggled? set by TreeNode().  

### ::: ImGui.is_any_item_hovered

 is any item hovered?  

### ::: ImGui.is_any_item_active

 is any item active?  

### ::: ImGui.is_any_item_focused

 is any item focused?  

### ::: ImGui.get_item_rect_min

 get upper-left bounding rectangle of the last item (screen space)  

### ::: ImGui.get_item_rect_max

 get lower-right bounding rectangle of the last item (screen space)  

### ::: ImGui.get_item_rect_size

 get size of last item  

### ::: ImGui.set_item_allow_overlap

 allow last item to be overlapped by a subsequent item. sometimes useful with invisible buttons, selectables, etc. to catch unused area.  

## Viewports  

- Currently represents the Platform Window created by the application which is hosting our Dear ImGui windows.
- In 'docking' branch with multi-viewport enabled, we extend this concept to have multiple active viewports.
- In the future we will extend this concept further to also represent Platform Monitor and support a "no main platform window" operation mode.

### ::: ImGui.get_main_viewport

 return primary/default viewport. This can never be NULL.  

## Background/Foreground Draw Lists  

### ::: ImGui.get_background_draw_list

 this draw list will be the first rendered one. Useful to quickly draw shapes/text behind dear imgui contents.  

### ::: ImGui.get_foreground_draw_list

 this draw list will be the last rendered one. Useful to quickly draw shapes/text over dear imgui contents.  

## Miscellaneous Utilities  

### ::: ImGui.is_rect_visible

 test if rectangle (of given size, starting from cursor position) is visible / not clipped.  

### ::: ImGui.is_rect_visible

 test if rectangle (in screen space) is visible / not clipped. to perform coarse clipping on user's side.  

### ::: ImGui.get_time

 get global imgui time. incremented by io.DeltaTime every frame.  

### ::: ImGui.get_frame_count

 get global imgui frame count. incremented by 1 every frame.  

### ::: ImGui.get_draw_list_shared_data

 you may use this when creating your own [`ImDrawList`][ImGui::ImDrawList] instances.  

### ::: ImGui.get_style_color_name

 get a string corresponding to the enum value (for display, saving, etc.).  

### ::: ImGui.set_state_storage

 replace current window storage with our own (if you want to manipulate it yourself, typically clear subsection of it)  

### ::: ImGui.get_state_storage

### ::: ImGui.begin_child_frame

 helper to create a child window / scrolling region that looks like a normal widget frame  

### ::: ImGui.end_child_frame

 always call [`end_child_frame`][ImGui.end_child_frame] regardless of [`begin_child_frame`][ImGui.begin_child_frame] return values (which indicates a collapsed/clipped window)  

## [`text`][ImGui.text] Utilities  

### ::: ImGui.calc_text_size

## Color Utilities  

### ::: ImGui.color_convert_u32_to_float4

### ::: ImGui.color_convert_float4_to_u32

### ::: ImGui.color_convert_rgb_to_hsv

### ::: ImGui.color_convert_hsv_to_rgb

## Inputs Utilities: Keyboard  
Without IMGUI_DISABLE_OBSOLETE_KEYIO: (legacy support)  

    - For '[`ImGuiKey`][ImGui::ImGuiKey] key' you can still use your legacy native/user indices according to how your backend/engine stored them in io.KeysDown[].

With IMGUI_DISABLE_OBSOLETE_KEYIO: (this is the way forward)  

    - Any use of '[`ImGuiKey`][ImGui::ImGuiKey]' will assert when key < 512 will be passed, previously reserved as native/user keys indices
    - [`get_key_index`][ImGui.get_key_index] is pass-through and therefore deprecated (gone if IMGUI_DISABLE_OBSOLETE_KEYIO is defined)

### ::: ImGui.is_key_down

 is key being held.  

### ::: ImGui.is_key_pressed

 was key pressed (went from !Down to Down)? if repeat=true, uses io.KeyRepeatDelay / KeyRepeatRate  

### ::: ImGui.is_key_released

 was key released (went from Down to !Down)?  

### ::: ImGui.get_key_pressed_amount

 uses provided repeat rate/delay. return a count, most often 0 or 1 but might be >1 if RepeatRate is small enough that DeltaTime > RepeatRate  

### ::: ImGui.get_key_name

 [DEBUG] returns English name of the key. Those names a provided for debugging purpose and are not meant to be saved persistently not compared.  

### ::: ImGui.set_next_frame_want_capture_keyboard

 Override io.WantCaptureKeyboard flag next frame (said flag is left for your application to handle, typically when true it instructs your app to ignore inputs). e.g. force capture keyboard when your widget is being hovered. This is equivalent to setting "io.WantCaptureKeyboard = want_capture_keyboard"; after the next [`new_frame`][ImGui.new_frame] call.  

## Inputs Utilities: Mouse  

- To refer to a mouse button, you may use named enums in your code e.g. ImGuiMouseButton_Left, ImGuiMouseButton_Right.
- You can also use regular integer: it is forever guaranteed that 0=Left, 1=Right, 2=Middle.
- Dragging operations are only reported after mouse has moved a certain distance away from the initial clicking position (see 'lock_threshold' and 'io.MouseDraggingThreshold')

### ::: ImGui.is_mouse_down

 is mouse button held?  

### ::: ImGui.is_mouse_clicked

 did mouse button clicked? (went from !Down to Down). Same as [`get_mouse_clicked_count`][ImGui.get_mouse_clicked_count] == 1.  

### ::: ImGui.is_mouse_released

 did mouse button released? (went from Down to !Down)  

### ::: ImGui.is_mouse_double_clicked

 did mouse button double-clicked? Same as [`get_mouse_clicked_count`][ImGui.get_mouse_clicked_count] == 2. (note that a double-click will also report [`is_mouse_clicked`][ImGui.is_mouse_clicked] == true)  

### ::: ImGui.get_mouse_clicked_count

 return the number of successive mouse-clicks at the time where a click happen (otherwise 0).  

### ::: ImGui.is_mouse_hovering_rect

### ::: ImGui.is_mouse_pos_valid

 by convention we use (-FLT_MAX,-FLT_MAX) to denote that there is no mouse available  

### ::: ImGui.is_any_mouse_down

 [WILL OBSOLETE] is any mouse button held? This was designed for backends, but prefer having backend maintain a mask of held mouse buttons, because upcoming input queue system will make this invalid.  

### ::: ImGui.get_mouse_pos

 shortcut to [`get_io`][ImGui.get_io].MousePos provided by user, to be consistent with other calls  

### ::: ImGui.get_mouse_pos_on_opening_current_popup

 retrieve mouse position at the time of opening popup we have [`begin_popup`][ImGui.begin_popup] into (helper to avoid user backing that value themselves)  

### ::: ImGui.is_mouse_dragging

 is mouse dragging? (if lock_threshold < -1.0f, uses io.MouseDraggingThreshold)  

### ::: ImGui.get_mouse_drag_delta

 return the delta from the initial clicking position while the mouse button is pressed or was just released. This is locked and return 0.0f until the mouse moves past a distance threshold at least once (if lock_threshold < -1.0f, uses io.MouseDraggingThreshold)  

### ::: ImGui.reset_mouse_drag_delta

### ::: ImGui.get_mouse_cursor

 get desired cursor type, reset in [`new_frame`][ImGui.new_frame], this is updated during the frame. valid before [`render`][ImGui.render]. If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you  

### ::: ImGui.set_mouse_cursor

 set desired cursor type  

### ::: ImGui.set_next_frame_want_capture_mouse

 Override io.WantCaptureMouse flag next frame (said flag is left for your application to handle, typical when true it instucts your app to ignore inputs). This is equivalent to setting "io.WantCaptureMouse = want_capture_mouse;" after the next [`new_frame`][ImGui.new_frame] call.  

## Clipboard Utilities  

- Also see the [`log_to_clipboard`][ImGui.log_to_clipboard] function to capture GUI into clipboard, or easily output text data to the clipboard.

### ::: ImGui.get_clipboard_text

### ::: ImGui.set_clipboard_text

Settings/.Ini Utilities  

- The disk functions are automatically called if io.IniFilename != NULL (default is "imgui.ini").
- Set io.IniFilename to NULL to load/save manually. Read io.WantSaveIniSettings description about handling .ini saving manually.
- Important: default value "imgui.ini" is relative to current working dir! Most apps will want to lock this to an absolute path (e.g. same path as executables).

### ::: ImGui.load_ini_settings_from_disk

 call after [`create_context`][ImGui.create_context] and before the first call to [`new_frame`][ImGui.new_frame]. [`new_frame`][ImGui.new_frame] automatically calls [`load_ini_settings_from_disk`][ImGui.load_ini_settings_from_disk](io.IniFilename).  

### ::: ImGui.load_ini_settings_from_memory

 call after [`create_context`][ImGui.create_context] and before the first call to [`new_frame`][ImGui.new_frame] to provide .ini data from your own data source.  

### ::: ImGui.save_ini_settings_to_disk

 this is automatically called (if io.IniFilename is not empty) a few seconds after any modification that should be reflected in the .ini file (and also by [`destroy_context`][ImGui.destroy_context]).  

### ::: ImGui.save_ini_settings_to_memory

 return a zero-terminated string with the .ini data which you can save by your own mean. call when io.WantSaveIniSettings is set, then save data by your own mean and clear io.WantSaveIniSettings.  

## Debug Utilities  

### ::: ImGui.debug_text_encoding

### ::: ImGui.debug_check_version_and_data_layout

 This is called by IMGUI_CHECKVERSION() macro.  

## Memory Allocators  

- Those functions are not reliant on the current context.
- DLL users: heaps and globals are not shared across DLL boundaries! You will need to call [`set_current_context`][ImGui.set_current_context] + [`set_allocator_functions`][ImGui.set_allocator_functions]
  for each static/DLL boundary you are calling from. Read "Context and Memory Allocators" section of imgui.cpp for more details.

### ::: ImGui.set_allocator_functions

### ::: ImGui.get_allocator_functions

### ::: ImGui.mem_alloc

### ::: ImGui.mem_free

 namespace ImGui  

