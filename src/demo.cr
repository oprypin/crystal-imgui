require "./imgui"
require "./util"

module ImGuiDemo
  include ImGui::TopLevel

  def self.help_marker(desc)
    ImGui.text_disabled("(?)")
    if ImGui.is_item_hovered
      ImGui.begin_tooltip
      ImGui.push_text_wrap_pos(ImGui.get_font_size * 35.0f32)
      ImGui.text_unformatted(desc)
      ImGui.pop_text_wrap_pos
      ImGui.end_tooltip
    end
  end

  def self.show_user_guide
    io = ImGui.get_io
    ImGui.bullet_text("Double-click on title bar to collapse window.")
    ImGui.bullet_text(
      "Click and drag on lower corner to resize window\n" +
      "(double-click to auto fit window to its contents).")
    ImGui.bullet_text("CTRL+Click on a slider or drag box to input value as text.")
    ImGui.bullet_text("TAB/SHIFT+TAB to cycle through keyboard editable fields.")
    if io.font_allow_user_scaling
      ImGui.bullet_text("CTRL+Mouse Wheel to zoom window contents.")
    end
    ImGui.bullet_text("While inputing text:\n")
    ImGui.indent
    ImGui.bullet_text("CTRL+Left/Right to word jump.")
    ImGui.bullet_text("CTRL+A or double-click to select all.")
    ImGui.bullet_text("CTRL+X/C/V to use clipboard cut/copy/paste.")
    ImGui.bullet_text("CTRL+Z,CTRL+Y to undo/redo.")
    ImGui.bullet_text("ESCAPE to revert.")
    ImGui.bullet_text("You can apply arithmetic operators +,*,/ on numerical values.\nUse +- to subtract.")
    ImGui.unindent
    ImGui.bullet_text("With keyboard navigation enabled:")
    ImGui.indent
    ImGui.bullet_text("Arrow keys to navigate.")
    ImGui.bullet_text("Space to activate a widget.")
    ImGui.bullet_text("Return to input text into a widget.")
    ImGui.bullet_text("Escape to deactivate a widget, close popup, exit child window.")
    ImGui.bullet_text("Alt to jump to the menu layer of a window.")
    ImGui.bullet_text("CTRL+Tab to select a window.")
    ImGui.unindent
  end

  ImGui.pointer_wrapper def self.show_demo_window(p_open = Pointer(Bool).null)
    assert(ImGui.get_current_context != nil && "Missing dear imgui context. Refer to examples app!")

    static show_app_main_menu_bar = false
    static show_app_documents = false
    static show_app_console = false
    static show_app_log = false
    static show_app_layout = false
    static show_app_property_editor = false
    static show_app_long_text = false
    static show_app_auto_resize = false
    static show_app_constrained_resize = false
    static show_app_simple_overlay = false
    static show_app_window_titles = false
    static show_app_custom_rendering = false

    if show_app_main_menu_bar.val
      show_example_app_main_menu_bar
    end
    if show_app_documents.val
      show_example_app_documents(pointerof(show_app_documents.val))
    end

    if show_app_console.val
      show_example_app_console(pointerof(show_app_console.val))
    end
    if show_app_log.val
      show_example_app_log(pointerof(show_app_log.val))
    end
    if show_app_layout.val
      show_example_app_layout(pointerof(show_app_layout.val))
    end
    if show_app_property_editor.val
      show_example_app_property_editor(pointerof(show_app_property_editor.val))
    end
    if show_app_long_text.val
      show_example_app_long_text(pointerof(show_app_long_text.val))
    end
    if show_app_auto_resize.val
      show_example_app_auto_resize(pointerof(show_app_auto_resize.val))
    end
    if show_app_constrained_resize.val
      show_example_app_constrained_resize(pointerof(show_app_constrained_resize.val))
    end
    if show_app_simple_overlay.val
      show_example_app_simple_overlay(pointerof(show_app_simple_overlay.val))
    end
    if show_app_window_titles.val
      show_example_app_window_titles(pointerof(show_app_window_titles.val))
    end
    if show_app_custom_rendering.val
      show_example_app_custom_rendering(pointerof(show_app_custom_rendering.val))
    end

    static show_app_metrics = false
    static show_app_style_editor = false
    static show_app_about = false

    if show_app_metrics.val
      ImGui.show_metrics_window(pointerof(show_app_metrics.val))
    end
    if show_app_about.val
      show_about_window(pointerof(show_app_about.val))
    end
    if show_app_style_editor.val
      ImGui.begin("crystal-imgui Style Editor", pointerof(show_app_style_editor.val))
      show_style_editor
      ImGui.end
    end

    static no_titlebar = false
    static no_scrollbar = false
    static no_menu = false
    static no_move = false
    static no_resize = false
    static no_collapse = false
    static no_close = false
    static no_nav = false
    static no_background = false
    static no_bring_to_front = false

    window_flags = ImGuiWindowFlags::None
    if no_titlebar.val
      window_flags |= ImGuiWindowFlags::NoTitleBar
    end
    if no_scrollbar.val
      window_flags |= ImGuiWindowFlags::NoScrollbar
    end
    if !no_menu.val
      window_flags |= ImGuiWindowFlags::MenuBar
    end
    if no_move.val
      window_flags |= ImGuiWindowFlags::NoMove
    end
    if no_resize.val
      window_flags |= ImGuiWindowFlags::NoResize
    end
    if no_collapse.val
      window_flags |= ImGuiWindowFlags::NoCollapse
    end
    if no_nav.val
      window_flags |= ImGuiWindowFlags::NoNav
    end
    if no_background.val
      window_flags |= ImGuiWindowFlags::NoBackground
    end
    if no_bring_to_front.val
      window_flags |= ImGuiWindowFlags::NoBringToFrontOnFocus
    end
    if no_close.val
      p_open = Pointer(Bool).null
    end

    ImGui.set_next_window_pos(ImVec2.new(20, 20), ImGuiCond::FirstUseEver)
    ImGui.set_next_window_size(ImVec2.new(550, 680), ImGuiCond::FirstUseEver)

    if !ImGui.begin("crystal-imgui Demo", p_open, window_flags)
      ImGui.end
      return
    end

    ImGui.push_item_width(ImGui.get_font_size * -12)

    if ImGui.begin_menu_bar
      if ImGui.begin_menu("Menu")
        show_example_menu_file
        ImGui.end_menu
      end
      if ImGui.begin_menu("Examples")
        ImGui.menu_item("Main menu bar", "", pointerof(show_app_main_menu_bar.val))
        ImGui.menu_item("Console", "", pointerof(show_app_console.val))
        ImGui.menu_item("Log", "", pointerof(show_app_log.val))
        ImGui.menu_item("Simple layout", "", pointerof(show_app_layout.val))
        ImGui.menu_item("Property editor", "", pointerof(show_app_property_editor.val))
        ImGui.menu_item("Long text display", "", pointerof(show_app_long_text.val))
        ImGui.menu_item("Auto-resizing window", "", pointerof(show_app_auto_resize.val))
        ImGui.menu_item("Constrained-resizing window", "", pointerof(show_app_constrained_resize.val))
        ImGui.menu_item("Simple overlay", "", pointerof(show_app_simple_overlay.val))
        ImGui.menu_item("Manipulating window titles", "", pointerof(show_app_window_titles.val))
        ImGui.menu_item("Custom rendering", "", pointerof(show_app_custom_rendering.val))
        ImGui.menu_item("Documents", "", pointerof(show_app_documents.val))
        ImGui.end_menu
      end
      if ImGui.begin_menu("Tools")
        ImGui.menu_item("Metrics", "", pointerof(show_app_metrics.val))
        ImGui.menu_item("Style Editor", "", pointerof(show_app_style_editor.val))
        ImGui.menu_item("About Dear ImGui", "", pointerof(show_app_about.val))
        ImGui.end_menu
      end
      ImGui.end_menu_bar
    end

    ImGui.text("dear imgui says hello. (%s)", ImGui.get_version)
    ImGui.spacing

    if ImGui.collapsing_header("Help")
      ImGui.text("ABOUT THIS DEMO:")
      ImGui.bullet_text("Sections below are demonstrating many aspects of the library.")
      ImGui.bullet_text("The \"Examples\" menu above leads to more demo contents.")
      ImGui.bullet_text("The \"Tools\" menu above gives access to: About Box, Style Editor,\n" +
                        "and Metrics (general purpose Dear ImGui debugging tool).")
      ImGui.separator

      ImGui.text("PROGRAMMER GUIDE:")
      ImGui.bullet_text("See the ShowDemoWindow() code in src/demo.cr. <- you are here!")
      ImGui.bullet_text("See comments in imgui.cpp.")
      ImGui.bullet_text("See example applications in the examples/ folder.")
      ImGui.bullet_text("Read the FAQ at http://www.dearimgui.org/faq/")
      ImGui.bullet_text("Set 'io.ConfigFlags |= NavEnableKeyboard' for keyboard controls.")
      ImGui.bullet_text("Set 'io.ConfigFlags |= NavEnableGamepad' for gamepad controls.")
      ImGui.separator

      ImGui.text("USER GUIDE:")
      show_user_guide
    end

    if ImGui.collapsing_header("Configuration")
      io = ImGui.get_io

      if ImGui.tree_node("Configuration##2")
        ImGui.checkbox_flags("io.ConfigFlags: NavEnableKeyboard", pointerof(io.config_flags), ImGuiConfigFlags::NavEnableKeyboard)
        ImGui.checkbox_flags("io.ConfigFlags: NavEnableGamepad", pointerof(io.config_flags), ImGuiConfigFlags::NavEnableGamepad)
        ImGui.same_line
        help_marker("Required back-end to feed in gamepad inputs in io.NavInputs[] and set io.BackendFlags |= ImGuiBackendFlags_HasGamepad.\n\nRead instructions in imgui.cpp for details.")
        ImGui.checkbox_flags("io.ConfigFlags: NavEnableSetMousePos", pointerof(io.config_flags), ImGuiConfigFlags::NavEnableSetMousePos)
        ImGui.same_line
        help_marker("Instruct navigation to move the mouse cursor. See comment for ImGuiConfigFlags_NavEnableSetMousePos.")
        ImGui.checkbox_flags("io.ConfigFlags: NoMouse", pointerof(io.config_flags), ImGuiConfigFlags::NoMouse)

        if io.config_flags.includes? :NoMouse
          if (ImGui.get_time % 0.40f32) < 0.20f32
            ImGui.same_line
            ImGui.text("<<PRESS SPACE TO DISABLE>>")
          end
          if ImGui.is_key_pressed(ImGui.get_key_index(ImGuiKey::Space))
            io.config_flags &= ~ImGuiConfigFlags::NoMouse
          end
        end
        ImGui.checkbox_flags("io.ConfigFlags: NoMouseCursorChange", pointerof(io.config_flags), ImGuiConfigFlags::NoMouseCursorChange)
        ImGui.same_line
        help_marker("Instruct back-end to not alter mouse cursor shape and visibility.")
        ImGui.checkbox("io.ConfigInputTextCursorBlink", pointerof(io.config_input_text_cursor_blink))
        ImGui.same_line
        help_marker("Set to false to disable blinking cursor, for users who consider it distracting")
        ImGui.checkbox("io.ConfigWindowsResizeFromEdges", pointerof(io.config_windows_resize_from_edges))
        ImGui.same_line
        help_marker("Enable resizing of windows from their edges and from the lower-left corner.\nThis requires (io.BackendFlags & ImGuiBackendFlags_HasMouseCursors) because it needs mouse cursor feedback.")
        ImGui.checkbox("io.ConfigWindowsMoveFromTitleBarOnly", pointerof(io.config_windows_move_from_title_bar_only))
        ImGui.checkbox("io.MouseDrawCursor", pointerof(io.mouse_draw_cursor))
        ImGui.same_line
        help_marker("Instruct Dear ImGui to render a mouse cursor itself. Note that a mouse cursor rendered via your application GPU rendering path will feel more laggy than hardware cursor, but will be more in sync with your other visuals.\n\nSome desktop applications may use both kinds of cursors (e.g. enable software cursor only when resizing/dragging something).")
        ImGui.text("Also see Style->Rendering for rendering options.")
        ImGui.tree_pop
        ImGui.separator
      end

      if ImGui.tree_node("Backend Flags")
        help_marker(
          "Those flags are set by the back-ends (imgui_impl_xxx files) to specify their capabilities.\n" +
          "Here we expose then as read-only fields to avoid breaking interactions with your back-end.")

        ImGui.checkbox_flags("io.BackendFlags: HasGamepad", pointerof(io.backend_flags), ImGuiBackendFlags::HasGamepad)
        ImGui.checkbox_flags("io.BackendFlags: HasMouseCursors", pointerof(io.backend_flags), ImGuiBackendFlags::HasMouseCursors)
        ImGui.checkbox_flags("io.BackendFlags: HasSetMousePos", pointerof(io.backend_flags), ImGuiBackendFlags::HasSetMousePos)
        ImGui.checkbox_flags("io.BackendFlags: RendererHasVtxOffset", pointerof(io.backend_flags), ImGuiBackendFlags::RendererHasVtxOffset)
        ImGui.tree_pop
        ImGui.separator
      end

      if ImGui.tree_node("Style")
        help_marker("The same contents can be accessed in 'Tools->Style Editor' or by calling the ShowStyleEditor() function.")
        ImGui.show_style_editor
        ImGui.tree_pop
        ImGui.separator
      end

      if ImGui.tree_node("Capture/Logging")
        help_marker(
          "The logging API redirects all text output so you can easily capture the content of " +
          "a window or a block. Tree nodes can be automatically expanded.\n" +
          "Try opening any of the contents below in this window and then click one of the \"Log To\" button.")
        ImGui.log_buttons

        help_marker("You can also call ImGui::LogText() to output directly to the log without a visual output.")
        if ImGui.button("Copy \"Hello, world!\" to clipboard")
          ImGui.log_to_clipboard
          ImGui.log_text("Hello, world!")
          ImGui.log_finish
        end
        ImGui.tree_pop
      end
    end

    if ImGui.collapsing_header("Window options")
      ImGui.checkbox("No titlebar", pointerof(no_titlebar.val))
      ImGui.same_line(150)
      ImGui.checkbox("No scrollbar", pointerof(no_scrollbar.val))
      ImGui.same_line(300)
      ImGui.checkbox("No menu", pointerof(no_menu.val))
      ImGui.checkbox("No move", pointerof(no_move.val))
      ImGui.same_line(150)
      ImGui.checkbox("No resize", pointerof(no_resize.val))
      ImGui.same_line(300)
      ImGui.checkbox("No collapse", pointerof(no_collapse.val))
      ImGui.checkbox("No close", pointerof(no_close.val))
      ImGui.same_line(150)
      ImGui.checkbox("No nav", pointerof(no_nav.val))
      ImGui.same_line(300)
      ImGui.checkbox("No background", pointerof(no_background.val))
      ImGui.checkbox("No bring to front", pointerof(no_bring_to_front.val))
    end

    show_demo_window_widgets
    show_demo_window_layout
    show_demo_window_popups
    show_demo_window_columns
    show_demo_window_misc

    ImGui.end
  end

  enum Element
    Fire
    Earth
    Air
    Water
  end

  enum Mode
    Copy
    Move
    Swap
  end

  def self.show_demo_window_widgets
    if !ImGui.collapsing_header("Widgets")
      return
    end

    if ImGui.tree_node("Basic")
      static clicked = 0
      if ImGui.button("Button")
        clicked.val += 1
      end
      if clicked.val.odd?
        ImGui.same_line
        ImGui.text("Thanks for clicking me!")
      end

      static check = true
      ImGui.checkbox("checkbox", pointerof(check.val))

      static e = 0
      ImGui.radio_button("radio a", pointerof(e.val), 0)
      ImGui.same_line
      ImGui.radio_button("radio b", pointerof(e.val), 1)
      ImGui.same_line
      ImGui.radio_button("radio c", pointerof(e.val), 2)

      7.times do |i|
        if i > 0
          ImGui.same_line
        end
        ImGui.push_id(i)
        ImGui.push_style_color(ImGuiCol::Button, ImGui.hsv(i / 7.0f32, 0.6f32, 0.6f32))
        ImGui.push_style_color(ImGuiCol::ButtonHovered, ImGui.hsv(i / 7.0f32, 0.7f32, 0.7f32))
        ImGui.push_style_color(ImGuiCol::ButtonActive, ImGui.hsv(i / 7.0f32, 0.8f32, 0.8f32))
        ImGui.button("Click")
        ImGui.pop_style_color(3)
        ImGui.pop_id
      end

      ImGui.align_text_to_frame_padding
      ImGui.text("Hold to repeat:")
      ImGui.same_line

      static counter = 0
      spacing = ImGui.get_style.item_inner_spacing.x
      ImGui.push_button_repeat(true)
      if ImGui.arrow_button("##left", ImGuiDir::Left)
        counter.val -= 1
      end
      ImGui.same_line(0.0f32, spacing)
      if ImGui.arrow_button("##right", ImGuiDir::Right)
        counter.val += 1
      end
      ImGui.pop_button_repeat
      ImGui.same_line
      ImGui.text("%d", counter.val)

      ImGui.text("Hover over me")
      if ImGui.is_item_hovered
        ImGui.set_tooltip("I am a tooltip")
      end

      ImGui.same_line
      ImGui.text("- or me")
      if ImGui.is_item_hovered
        ImGui.begin_tooltip
        ImGui.text("I am a fancy tooltip")
        static arr = [0.6f32, 0.1f32, 1.0f32, 0.5f32, 0.92f32, 0.1f32, 0.2f32]
        ImGui.plot_lines("Curve", arr.val)
        ImGui.end_tooltip
      end

      ImGui.separator

      ImGui.label_text("label", "Value")

      begin
        items = ["AAAA", "BBBB", "CCCC", "DDDD", "EEEE", "FFFF", "GGGG", "HHHH", "IIIIIII", "JJJJ", "KKKKKKK"]
        static item_current = 0
        ImGui.combo("combo", pointerof(item_current.val), items)
        ImGui.same_line
        help_marker("Refer to the \"Combo\" section below for an explanation of the full BeginCombo/EndCombo API, and demonstration of various flags.\n")
      end

      begin
        static str0 = ImGui::TextBuffer.new("Hello, world!", 128)
        ImGui.input_text("input text", str0.val)
        ImGui.same_line
        help_marker(
          "USER:\n" +
          "Hold SHIFT or use mouse to select text.\n" +
          "CTRL+Left/Right to word jump.\n" +
          "CTRL+A or double-click to select all.\n" +
          "CTRL+X,CTRL+C,CTRL+V clipboard.\n" +
          "CTRL+Z,CTRL+Y undo/redo.\n" +
          "ESCAPE to revert.\n\n" +
          "PROGRAMMER:\n" +
          "You can use the ImGuiInputTextFlags_CallbackResize facility if you need to wire InputText() " +
          "to a dynamic string type. See misc/cpp/imgui_stdlib.h for an example (this is not demonstrated " +
          "in src/demo.cr).")

        static str1 = ImGui::TextBuffer.new(128)
        ImGui.input_text_with_hint("input text (w/ hint)", "enter text here", str1.val)

        static i0 = 123
        ImGui.input_int("input int", pointerof(i0.val))
        ImGui.same_line
        help_marker(
          "You can apply arithmetic operators +,*,/ on numerical values.\n" +
          "  e.g. [ 100 ], input '*2', result becomes [ 200 ]\n" +
          "Use +- to subtract.")

        static f0 = 0.001f32
        ImGui.input_float("input float", pointerof(f0.val), 0.01f32, 1.0f32, "%.3f")

        static d0 = 999999.00000001
        ImGui.input_double("input double", pointerof(d0.val), 0.01f32, 1.0f32, "%.8f")

        static f1 = 1.0e10f32
        ImGui.input_float("input scientific", pointerof(f1.val), 0.0f32, 0.0f32, "%e")
        ImGui.same_line
        help_marker(
          "You can input value using the scientific notation,\n" +
          "  e.g. \"1e+8\" becomes \"100000000\".")

        static vec4a = Slice[0.10f32, 0.20f32, 0.30f32, 0.44f32]
        ImGui.input_float3("input float3", vec4a.val[...3])
      end

      begin
        static i1 = 50
        static i2 = 42
        ImGui.drag_int("drag int", pointerof(i1.val), 1)
        ImGui.same_line
        help_marker(
          "Click and drag to edit value.\n" +
          "Hold SHIFT/ALT for faster/slower edit.\n" +
          "Double-click or CTRL+click to input value.")

        ImGui.drag_int("drag int 0..100", pointerof(i2.val), 1, 0, 100, "%d%%")

        static f1 = 1.00f32
        static f2 = 0.0067f32
        ImGui.drag_float("drag float", pointerof(f1.val), 0.005f32)
        ImGui.drag_float("drag small float", pointerof(f2.val), 0.0001f32, 0.0f32, 0.0f32, "%.06f ns")
      end

      begin
        static i1 = 0
        ImGui.slider_int("slider int", pointerof(i1.val), -1, 3)
        ImGui.same_line
        help_marker("CTRL+click to input value.")

        static f1 = 0.123f32
        static f2 = 0.0f32
        ImGui.slider_float("slider float", pointerof(f1.val), 0.0f32, 1.0f32, "ratio = %.3f")
        ImGui.slider_float("slider float (log)", pointerof(f2.val), -10.0f32, 10.0f32, "%.4f", ImGuiSliderFlags::Logarithmic)

        static angle = 0.0f32
        ImGui.slider_angle("slider angle", pointerof(angle.val))

        static elem = 0
        ImGui.slider_int("slider enum", pointerof(elem.val), 0, Element.values.size - 1, Element.new(elem.val).to_s)
        ImGui.same_line
        help_marker("Using the format string parameter to display a name instead of the underlying integer.")
      end

      begin
        static col1 = Slice[1.0f32, 0.0f32, 0.2f32]
        static col2 = Slice[0.4f32, 0.7f32, 0.0f32, 0.5f32]
        ImGui.color_edit3("color 1", col1.val)
        ImGui.same_line
        help_marker(
          "Click on the colored square to open a color picker.\n" +
          "Click and hold to use drag and drop.\n" +
          "Right-click on the colored square to show options.\n" +
          "CTRL+click on individual component to input value.\n")

        ImGui.color_edit4("color 2", col2.val)
      end

      begin
        items = ["Apple", "Banana", "Cherry", "Kiwi", "Mango", "Orange", "Pineapple", "Strawberry", "Watermelon"]
        static item_current = 1
        ImGui.list_box("listbox\n(single select)", pointerof(item_current.val), items, 4)
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Trees")
      if ImGui.tree_node("Basic trees")
        5.times do |i|
          if i == 0
            ImGui.set_next_item_open(true, ImGuiCond::Once)
          end

          if ImGui.tree_node(i, "Child %d", i)
            ImGui.text("blah blah")
            ImGui.same_line
            if ImGui.small_button("button")
            end
            ImGui.tree_pop
          end
        end
        ImGui.tree_pop
      end

      if ImGui.tree_node("Advanced, with Selectable nodes")
        help_marker(
          "This is a more typical looking tree with selectable nodes.\n" +
          "Click to select, CTRL+Click to toggle, click on arrows or double-click to open.")
        static base_flags = ImGuiTreeNodeFlags::OpenOnArrow | ImGuiTreeNodeFlags::OpenOnDoubleClick | ImGuiTreeNodeFlags::SpanAvailWidth
        static align_label_with_current_x_position = false
        static test_drag_and_drop = false
        ImGui.checkbox_flags("ImGuiTreeNodeFlags_OpenOnArrow", pointerof(base_flags.val), ImGuiTreeNodeFlags::OpenOnArrow)
        ImGui.checkbox_flags("ImGuiTreeNodeFlags_OpenOnDoubleClick", pointerof(base_flags.val), ImGuiTreeNodeFlags::OpenOnDoubleClick)
        ImGui.checkbox_flags("ImGuiTreeNodeFlags_SpanAvailWidth", pointerof(base_flags.val), ImGuiTreeNodeFlags::SpanAvailWidth)
        ImGui.same_line
        help_marker("Extend hit area to all available width instead of allowing more items to be laid out after the node.")
        ImGui.checkbox_flags("ImGuiTreeNodeFlags_SpanFullWidth", pointerof(base_flags.val), ImGuiTreeNodeFlags::SpanFullWidth)
        ImGui.checkbox("Align label with current X position", pointerof(align_label_with_current_x_position.val))
        ImGui.checkbox("Test tree node as drag source", pointerof(test_drag_and_drop.val))
        ImGui.text("Hello!")
        if align_label_with_current_x_position.val
          ImGui.unindent(ImGui.get_tree_node_to_label_spacing)
        end

        static selection_mask = (1 << 2)
        node_clicked = -1
        6.times do |i|
          node_flags = base_flags.val
          is_selected = (selection_mask.val & (1 << i)) != 0
          if is_selected
            node_flags |= ImGuiTreeNodeFlags::Selected
          end
          if i < 3
            node_open = ImGui.tree_node_ex(i, node_flags, "Selectable Node %d", i)
            if ImGui.is_item_clicked
              node_clicked = i
            end
            if test_drag_and_drop.val && ImGui.begin_drag_drop_source
              ImGui.set_drag_drop_payload("_TREENODE", Pointer(Void).null, 0)
              ImGui.text("This is a drag and drop source")
              ImGui.end_drag_drop_source
            end
            if node_open
              ImGui.bullet_text("Blah blah\nBlah Blah")
              ImGui.tree_pop
            end
          else
            node_flags |= ImGuiTreeNodeFlags::Leaf | ImGuiTreeNodeFlags::NoTreePushOnOpen
            ImGui.tree_node_ex(i, node_flags, "Selectable Leaf %d", i)
            if ImGui.is_item_clicked
              node_clicked = i
            end
            if test_drag_and_drop.val && ImGui.begin_drag_drop_source
              ImGui.set_drag_drop_payload("_TREENODE", Pointer(Void).null, 0)
              ImGui.text("This is a drag and drop source")
              ImGui.end_drag_drop_source
            end
          end
        end
        if node_clicked != -1
          if ImGui.get_io.key_ctrl
            selection_mask.val ^= (1 << node_clicked)
          else
            selection_mask.val = (1 << node_clicked)
          end
        end
        if align_label_with_current_x_position.val
          ImGui.indent(ImGui.get_tree_node_to_label_spacing)
        end
        ImGui.tree_pop
      end
      ImGui.tree_pop
    end

    if ImGui.tree_node("Collapsing Headers")
      static closable_group = true
      ImGui.checkbox("Show 2nd header", pointerof(closable_group.val))
      if ImGui.collapsing_header("Header", ImGuiTreeNodeFlags::None)
        ImGui.text("IsItemHovered: %d", ImGui.is_item_hovered)
        5.times do |i|
          ImGui.text("Some content %d", i)
        end
      end
      if ImGui.collapsing_header("Header with a close button", pointerof(closable_group.val))
        ImGui.text("IsItemHovered: %d", ImGui.is_item_hovered)
        5.times do |i|
          ImGui.text("More content %d", i)
        end
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Bullets")
      ImGui.bullet_text("Bullet point 1")
      ImGui.bullet_text("Bullet point 2\nOn multiple lines")
      if ImGui.tree_node("Tree node")
        ImGui.bullet_text("Another bullet point")
        ImGui.tree_pop
      end
      ImGui.bullet
      ImGui.text("Bullet point 3 (two calls)")
      ImGui.bullet
      ImGui.small_button("Button")
      ImGui.tree_pop
    end

    if ImGui.tree_node("Text")
      if ImGui.tree_node("Colored Text")
        ImGui.text_colored(ImVec4.new(1.0f32, 0.0f32, 1.0f32, 1.0f32), "Pink")
        ImGui.text_colored(ImVec4.new(1.0f32, 1.0f32, 0.0f32, 1.0f32), "Yellow")
        ImGui.text_disabled("Disabled")
        ImGui.same_line
        help_marker("The TextDisabled color is stored in ImGuiStyle.")
        ImGui.tree_pop
      end

      if ImGui.tree_node("Word Wrapping")
        ImGui.text_wrapped("This text should automatically wrap on the edge of the window. The current implementation for text wrapping follows simple rules suitable for English and possibly other languages.")
        ImGui.spacing

        static wrap_width = 200.0f32
        ImGui.slider_float("Wrap width", pointerof(wrap_width.val), -20, 600, "%.0f")

        draw_list = ImGui.get_window_draw_list
        2.times do |n|
          ImGui.text("Test paragraph %d:", n)
          pos = ImGui.get_cursor_screen_pos
          marker_min = ImVec2.new(pos.x + wrap_width.val, pos.y)
          marker_max = ImVec2.new(pos.x + wrap_width.val + 10, pos.y + ImGui.get_text_line_height)
          ImGui.push_text_wrap_pos(ImGui.get_cursor_pos.x + wrap_width.val)
          if n == 0
            ImGui.text("The lazy dog is a good dog. This paragraph should fit within %.0f pixels. Testing a 1 character word. The quick brown fox jumps over the lazy dog.", wrap_width.val)
          end
          if n == 1
            ImGui.text("aaaaaaaa bbbbbbbb, c cccccccc,dddddddd. d eeeeeeee   ffffffff. gggggggg!hhhhhhhh")
          end

          draw_list.add_rect(ImGui.get_item_rect_min, ImGui.get_item_rect_max, ImGui.col32(255, 255, 0, 255))
          draw_list.add_rect_filled(marker_min, marker_max, ImGui.col32(255, 0, 255, 255))
          ImGui.pop_text_wrap_pos
        end

        ImGui.tree_pop
      end

      if ImGui.tree_node("UTF-8 Text")
        ImGui.text_wrapped(
          "CJK text will only appears if the font was loaded with the appropriate CJK character ranges. " +
          "Call io.Font->AddFontFromFileTTF() manually to load extra character ranges. " +
          "Read docs/FONTS.md for details.")
        ImGui.text("Hiragana: かきくけこ (kakikukeko)")
        ImGui.text("Kanjis: 日本語 (nihongo)")
        static buf = ImGui::TextBuffer.new("日本語", 32)

        ImGui.input_text("UTF-8 input", buf.val)
        ImGui.tree_pop
      end
      ImGui.tree_pop
    end

    if ImGui.tree_node("Images")
      io = ImGui.get_io
      ImGui.text_wrapped("Below we are displaying the font texture (which is the only texture we have access to in this demo). Use the 'ImTextureID' type as storage to pass pointers or identifier to your own texture data. Hover the texture for a zoomed view!")
      my_tex_id = io.fonts.tex_id
      my_tex_w = io.fonts.tex_width
      my_tex_h = io.fonts.tex_height
      begin
        ImGui.text("%.0fx%.0f", my_tex_w, my_tex_h)
        pos = ImGui.get_cursor_screen_pos
        uv_min = ImVec2.new(0.0f32, 0.0f32)
        uv_max = ImVec2.new(1.0f32, 1.0f32)
        tint_col = ImVec4.new(1.0f32, 1.0f32, 1.0f32, 1.0f32)
        border_col = ImVec4.new(1.0f32, 1.0f32, 1.0f32, 0.5f32)
        ImGui.image(my_tex_id, ImVec2.new(my_tex_w, my_tex_h), uv_min, uv_max, tint_col, border_col)
        if ImGui.is_item_hovered
          ImGui.begin_tooltip
          region_sz = 32.0f32
          region_x = io.mouse_pos.x - pos.x - region_sz * 0.5f32
          region_y = io.mouse_pos.y - pos.y - region_sz * 0.5f32
          zoom = 4.0f32
          if region_x < 0.0f32
            region_x = 0.0f32
          elsif region_x > my_tex_w - region_sz
            region_x = my_tex_w - region_sz
          end
          if region_y < 0.0f32
            region_y = 0.0f32
          elsif region_y > my_tex_h - region_sz
            region_y = my_tex_h - region_sz
          end
          ImGui.text("Min: (%.2f, %.2f)", region_x, region_y)
          ImGui.text("Max: (%.2f, %.2f)", region_x + region_sz, region_y + region_sz)
          uv0 = ImVec2.new((region_x) / my_tex_w, (region_y) / my_tex_h)
          uv1 = ImVec2.new((region_x + region_sz) / my_tex_w, (region_y + region_sz) / my_tex_h)
          ImGui.image(my_tex_id, ImVec2.new(region_sz * zoom, region_sz * zoom), uv0, uv1, tint_col, border_col)
          ImGui.end_tooltip
        end
      end
      ImGui.text_wrapped("And now some textured buttons..")
      static pressed_count = 0
      8.times do |i|
        ImGui.push_id(i)
        frame_padding = -1 + i
        size = ImVec2.new(32.0f32, 32.0f32)
        uv0 = ImVec2.new(0.0f32, 0.0f32)
        uv1 = ImVec2.new(32.0f32 / my_tex_w, 32 / my_tex_h)
        bg_col = ImVec4.new(0.0f32, 0.0f32, 0.0f32, 1.0f32)
        tint_col = ImVec4.new(1.0f32, 1.0f32, 1.0f32, 1.0f32)
        if ImGui.image_button(my_tex_id, size, uv0, uv1, frame_padding, bg_col, tint_col)
          pressed_count.val += 1
        end
        ImGui.pop_id
        ImGui.same_line
      end
      ImGui.new_line
      ImGui.text("Pressed %d times.", pressed_count.val)
      ImGui.tree_pop
    end

    if ImGui.tree_node("Combo")
      static flags = ImGuiComboFlags::None
      ImGui.checkbox_flags("ImGuiComboFlags_PopupAlignLeft", pointerof(flags.val), ImGuiComboFlags::PopupAlignLeft)
      ImGui.same_line
      help_marker("Only makes a difference if the popup is larger than the combo")
      if ImGui.checkbox_flags("ImGuiComboFlags_NoArrowButton", pointerof(flags.val), ImGuiComboFlags::NoArrowButton)
        flags.val &= ~ImGuiComboFlags::NoPreview
      end
      if ImGui.checkbox_flags("ImGuiComboFlags_NoPreview", pointerof(flags.val), ImGuiComboFlags::NoPreview)
        flags.val &= ~ImGuiComboFlags::NoArrowButton
      end

      items = ["AAAA", "BBBB", "CCCC", "DDDD", "EEEE", "FFFF", "GGGG", "HHHH", "IIII", "JJJJ", "KKKK", "LLLLLLL", "MMMM", "OOOOOOO"]
      static item_current_idx = 0
      combo_label = items[item_current_idx.val]
      if ImGui.begin_combo("combo 1", combo_label, flags.val)
        items.size.times do |n|
          is_selected = (item_current_idx.val == n)
          if ImGui.selectable(items[n], is_selected)
            item_current_idx.val = n
          end

          if is_selected
            ImGui.set_item_default_focus
          end
        end
        ImGui.end_combo
      end

      static item_current_2 = 0
      ImGui.combo("combo 2 (one-liner)", pointerof(item_current_2.val), "aaaa\0bbbb\0cccc\0dddd\0eeee\0\0")

      static item_current_3 = -1
      ImGui.combo("combo 3 (array)", pointerof(item_current_3.val), items, items.size)

      static item_current_4 = 0
      ImGui.combo("combo 4 (function)", pointerof(item_current_4.val), items.size) do |idx|
        items[idx]
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Selectables")
      if ImGui.tree_node("Basic")
        static selection = [false, true, false, false, false]
        ImGui.selectable("1. I am selectable", pointerof(selection.val[0]))
        ImGui.selectable("2. I am selectable", pointerof(selection.val[1]))
        ImGui.text("3. I am not selectable")
        ImGui.selectable("4. I am selectable", pointerof(selection.val[3]))
        if ImGui.selectable("5. I am double clickable", selection.val[4], ImGuiSelectableFlags::AllowDoubleClick)
          if ImGui.is_mouse_double_clicked(ImGuiMouseButton::Left)
            selection.val[4] = !selection.val[4]
          end
        end
        ImGui.tree_pop
      end
      if ImGui.tree_node("Selection State: Single Selection")
        static selected = -1
        5.times do |n|
          buf = sprintf("Object %d", n)
          if ImGui.selectable(buf, selected.val == n)
            selected.val = n
          end
        end
        ImGui.tree_pop
      end
      if ImGui.tree_node("Selection State: Multiple Selection")
        help_marker("Hold CTRL and click to select multiple items.")
        static selection = [false, false, false, false, false]
        5.times do |n|
          buf = sprintf("Object %d", n)
          if ImGui.selectable(buf, selection.val[n])
            if !ImGui.get_io.key_ctrl
              selection.val.map! { false }
            end
            selection.val[n] = !selection.val[n]
          end
        end
        ImGui.tree_pop
      end
      if ImGui.tree_node("Rendering more text into the same line")
        static selected = [false, false, false]
        ImGui.selectable("main.c", pointerof(selected.val[0]))
        ImGui.same_line(300)
        ImGui.text(" 2,345 bytes")
        ImGui.selectable("Hello.cpp", pointerof(selected.val[1]))
        ImGui.same_line(300)
        ImGui.text("12,345 bytes")
        ImGui.selectable("Hello.h", pointerof(selected.val[2]))
        ImGui.same_line(300)
        ImGui.text(" 2,345 bytes")
        ImGui.tree_pop
      end
      if ImGui.tree_node("In columns")
        ImGui.columns(3, nil, false)
        static selected = Slice.new(16, false)
        16.times do |i|
          label = sprintf("Item %d", i)
          if ImGui.selectable(label, pointerof(selected.val[i]))
          end
          ImGui.next_column
        end
        ImGui.columns(1)
        ImGui.tree_pop
      end
      if ImGui.tree_node("Grid")
        static selected = Slice[1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]
        (4 * 4).times do |i|
          ImGui.push_id(i)
          if ImGui.selectable("Sailor", selected.val[i] != 0, size: ImVec2.new(50, 50))
            selected.val[i] ^= 1

            x = i % 4
            y = i // 4
            if x > 0
              selected.val[i - 1] ^= 1
            end
            if x < 3 && i < 15
              selected.val[i + 1] ^= 1
            end
            if y > 0 && i > 3
              selected.val[i - 4] ^= 1
            end
            if y < 3 && i < 12
              selected.val[i + 4] ^= 1
            end
          end
          if (i % 4) < 3
            ImGui.same_line
          end
          ImGui.pop_id
        end
        ImGui.tree_pop
      end
      if ImGui.tree_node("Alignment")
        help_marker(
          "By default, Selectables uses style.SelectableTextAlign but it can be overridden on a per-item " +
          "basis using PushStyleVar(). You'll probably want to always keep your default situation to " +
          "left-align otherwise it becomes difficult to layout multiple items on a same line")
        static selected = Slice[true, false, true, false, true, false, true, false, true]
        3.times do |y|
          3.times do |x|
            alignment = ImVec2.new(x / 2.0f32, y / 2.0f32)
            name = sprintf("(%.1f,%.1f)", alignment.x, alignment.y)
            if x > 0
              ImGui.same_line
            end
            ImGui.push_style_var(ImGuiStyleVar::SelectableTextAlign, alignment)
            ImGui.selectable(name, pointerof(selected.val[3 * y + x]), ImGuiSelectableFlags::None, ImVec2.new(80, 80))
            ImGui.pop_style_var
          end
        end
        ImGui.tree_pop
      end
      ImGui.tree_pop
    end

    if ImGui.tree_node("Text Input")
      if ImGui.tree_node("Multi-line Text Input")
        static text = ImGui::TextBuffer.new(1024 * 16) <<
                      "/*\n" <<
                      " The Pentium F00F bug, shorthand for F0 0F C7 C8,\n" <<
                      " the hexadecimal encoding of one offending instruction,\n" <<
                      " more formally, the invalid operand with locked CMPXCHG8B\n" <<
                      " instruction bug, is a design flaw in the majority of\n" <<
                      " Intel Pentium, Pentium MMX, and Pentium OverDrive\n" <<
                      " processors (all in the P5 microarchitecture).\n" <<
                      "*/\n\n" <<
                      "label:\n" <<
                      "\tlock cmpxchg8b eax\n"

        static flags = ImGuiInputTextFlags::AllowTabInput
        help_marker("You can use the ImGuiInputTextFlags_CallbackResize facility if you need to wire InputTextMultiline() to a dynamic string type. See misc/cpp/imgui_stdlib.h for an example. (This is not demonstrated in src/demo.cr because we don't want to include <string> in here)")
        ImGui.checkbox_flags("ImGuiInputTextFlags_ReadOnly", pointerof(flags.val), ImGuiInputTextFlags::ReadOnly)
        ImGui.checkbox_flags("ImGuiInputTextFlags_AllowTabInput", pointerof(flags.val), ImGuiInputTextFlags::AllowTabInput)
        ImGui.checkbox_flags("ImGuiInputTextFlags_CtrlEnterForNewLine", pointerof(flags.val), ImGuiInputTextFlags::CtrlEnterForNewLine)
        ImGui.input_text_multiline("##source", text.val, ImVec2.new(-Float32::MIN_POSITIVE, ImGui.get_text_line_height * 16), flags.val)
        ImGui.tree_pop
      end

      if ImGui.tree_node("Filtered Text Input")
        static buf1 = ImGui::TextBuffer.new(64)
        ImGui.input_text("default", buf1.val)
        static buf2 = ImGui::TextBuffer.new(64)
        ImGui.input_text("decimal", buf2.val, ImGuiInputTextFlags::CharsDecimal)
        static buf3 = ImGui::TextBuffer.new(64)
        ImGui.input_text("hexadecimal", buf3.val, ImGuiInputTextFlags::CharsHexadecimal | ImGuiInputTextFlags::CharsUppercase)
        static buf4 = ImGui::TextBuffer.new(64)
        ImGui.input_text("uppercase", buf4.val, ImGuiInputTextFlags::CharsUppercase)
        static buf5 = ImGui::TextBuffer.new(64)
        ImGui.input_text("no blank", buf5.val, ImGuiInputTextFlags::CharsNoBlank)
        static buf6 = ImGui::TextBuffer.new(64)
        ImGui.input_text("\"imgui\" letters", buf6.val, ImGuiInputTextFlags::CallbackCharFilter) do |data|
          if data.event_char.ord < 256 && "imgui".includes?(data.event_char)
            0
          else
            1
          end
        end
        ImGui.text("Password input")
        static password = ImGui::TextBuffer.new("password123", 64)
        ImGui.input_text("password", password.val, ImGuiInputTextFlags::Password)
        ImGui.same_line
        help_marker("Display all characters as '*'.\nDisable clipboard cut and copy.\nDisable logging.\n")
        ImGui.input_text_with_hint("password (w/ hint)", "<password>", password.val, ImGuiInputTextFlags::Password)
        ImGui.input_text("password (clear)", password.val)
        ImGui.tree_pop
      end

      if ImGui.tree_node("Resize Callback")
        help_marker(
          "Using ImGuiInputTextFlags_CallbackResize to wire your custom string type to InputText().\n\n" +
          "See misc/cpp/imgui_stdlib.h for an implementation of this for std::string.")

        static my_str = ImGui::TextBuffer.new
        ImGui.input_text_multiline("##MyStr", my_str.val, ImVec2.new(-Float32::MIN_POSITIVE, ImGui.get_text_line_height * 16), ImGuiInputTextFlags::CallbackResize)
        ImGui.text("Data: %p\nSize: %d\nCapacity: %d", my_str.val.to_unsafe, my_str.val.bytesize, my_str.val.capacity)
        ImGui.tree_pop
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Plots Widgets")
      static animate = true
      ImGui.checkbox("Animate", pointerof(animate.val))

      static arr = [0.6f32, 0.1f32, 1.0f32, 0.5f32, 0.92f32, 0.1f32, 0.2f32]
      ImGui.plot_lines("Frame Times", arr.val)

      static values = Slice.new(90, 0.0f32)
      static values_offset = 0
      static refresh_time = 0.0
      if !animate.val || refresh_time.val == 0.0
        refresh_time.val = ImGui.get_time
      end
      while refresh_time.val < ImGui.get_time
        static phase = 0.0f32
        values.val[values_offset.val] = Math.cos(phase.val)
        values_offset.val = (values_offset.val + 1) % values.val.size
        phase.val += 0.10f32 * values_offset.val
        refresh_time.val += 1.0f32 / 60.0f32
      end

      begin
        average = 0.0f32
        values.val.size.times do |n|
          average += values.val[n]
        end
        average /= values.val.size
        overlay = sprintf("avg %f", average)
        ImGui.plot_lines("Lines", values.val, values_offset.val, overlay, -1.0f32, 1.0f32, ImVec2.new(0, 80.0f32))
      end
      ImGui.plot_histogram("Histogram", arr.val, 0, nil, 0.0f32, 1.0f32, ImVec2.new(0, 80.0f32))

      sin = ->(i : Int32) {
        Math.sin(i * 0.1).to_f32
      }
      saw = ->(i : Int32) {
        i.odd? ? 1.0f32 : -1.0f32
      }
      static func_type = 0
      static display_count = 70
      ImGui.separator
      ImGui.set_next_item_width(100)
      ImGui.combo("func", pointerof(func_type.val), "Sin\0Saw\0")
      ImGui.same_line
      ImGui.slider_int("Sample count", pointerof(display_count.val), 1, 400)
      func = (func_type.val == 0) ? sin : saw
      ImGui.plot_lines("Lines", display_count.val, 0, nil, -1.0f32, 1.0f32, ImVec2.new(0, 80), &func)
      ImGui.plot_histogram("Histogram", display_count.val, 0, nil, -1.0f32, 1.0f32, ImVec2.new(0, 80), &func)
      ImGui.separator

      static progress = 0.0f32
      static progress_dir = 1.0f32
      if animate.val
        progress.val += progress_dir.val * 0.4f32 * ImGui.get_io.delta_time
        if progress.val >= +1.1f32
          progress.val = +1.1f32
          progress_dir.val *= -1.0f32
        end
        if progress.val <= -0.1f32
          progress.val = -0.1f32
          progress_dir.val *= -1.0f32
        end
      end

      ImGui.progress_bar(progress.val, ImVec2.new(0.0f32, 0.0f32))
      ImGui.same_line(0.0f32, ImGui.get_style.item_inner_spacing.x)
      ImGui.text("Progress Bar")

      progress_saturated = progress.val.clamp(0.0f32, 1.0f32)
      buf = sprintf("%d/%d", (progress_saturated * 1753).to_i, 1753)
      ImGui.progress_bar(progress.val, ImVec2.new(0f32, 0f32), buf)
      ImGui.tree_pop
    end

    if ImGui.tree_node("Color/Picker Widgets")
      static color = ImVec4.new(114.0f32 / 255.0f32, 144.0f32 / 255.0f32, 154.0f32 / 255.0f32, 200.0f32 / 255.0f32)

      static alpha_preview = true
      static alpha_half_preview = false
      static drag_and_drop = true
      static options_menu = true
      static hdr = false
      ImGui.checkbox("With Alpha Preview", pointerof(alpha_preview.val))
      ImGui.checkbox("With Half Alpha Preview", pointerof(alpha_half_preview.val))
      ImGui.checkbox("With Drag and Drop", pointerof(drag_and_drop.val))
      ImGui.checkbox("With Options Menu", pointerof(options_menu.val))
      ImGui.same_line
      help_marker("Right-click on the individual color widget to show options.")
      ImGui.checkbox("With HDR", pointerof(hdr.val))
      ImGui.same_line
      help_marker("Currently all this does is to lift the 0..1 limits on dragging widgets.")
      misc_flags = (hdr.val ? ImGuiColorEditFlags::HDR : ImGuiColorEditFlags::None) | (drag_and_drop.val ? ImGuiColorEditFlags::None : ImGuiColorEditFlags::NoDragDrop) | (alpha_half_preview.val ? ImGuiColorEditFlags::AlphaPreviewHalf : (alpha_preview.val ? ImGuiColorEditFlags::AlphaPreview : ImGuiColorEditFlags::None)) | (options_menu.val ? ImGuiColorEditFlags::None : ImGuiColorEditFlags::NoOptions)

      ImGui.text("Color widget:")
      ImGui.same_line
      help_marker(
        "Click on the colored square to open a color picker.\n" +
        "CTRL+click on individual component to input value.\n")
      ImGui.color_edit3("MyColor##1", pointerof(color.val), misc_flags)

      ImGui.text("Color widget HSV with Alpha:")
      ImGui.color_edit4("MyColor##2", pointerof(color.val), ImGuiColorEditFlags::DisplayHSV | misc_flags)

      ImGui.text("Color widget with Float Display:")
      ImGui.color_edit4("MyColor##2f", pointerof(color.val), ImGuiColorEditFlags::Float | misc_flags)

      ImGui.text("Color button with Picker:")
      ImGui.same_line
      help_marker(
        "With the ImGuiColorEditFlags_NoInputs flag you can hide all the slider/text inputs.\n" +
        "With the ImGuiColorEditFlags_NoLabel flag you can pass a non-empty label which will only " +
        "be used for the tooltip and picker popup.")
      ImGui.color_edit4("MyColor##3", pointerof(color.val), ImGuiColorEditFlags::NoInputs | ImGuiColorEditFlags::NoLabel | misc_flags)

      ImGui.text("Color button with Custom Picker Popup:")

      static saved_palette = Array(ImVec4).new(32) do |n|
        r, g, b = ImGui.color_convert_hs_vto_rgb(n / 31.0f32, 0.8f32, 0.8f32)
        ImVec4.new(r, g, b, 1.0f32)
      end

      static backup_color = ImVec4.new
      open_popup = ImGui.color_button("MyColor##3b", color.val, misc_flags)
      ImGui.same_line(0, ImGui.get_style.item_inner_spacing.x)
      open_popup |= ImGui.button("Palette")
      if open_popup
        ImGui.open_popup("mypicker")
        backup_color.val = color.val
      end
      if ImGui.begin_popup("mypicker")
        ImGui.text("MY CUSTOM COLOR PICKER WITH AN AMAZING PALETTE!")
        ImGui.separator
        ImGui.color_picker4("##picker", pointerof(color.val), misc_flags | ImGuiColorEditFlags::NoSidePreview | ImGuiColorEditFlags::NoSmallPreview)
        ImGui.same_line

        ImGui.begin_group
        ImGui.text("Current")
        ImGui.color_button("##current", color.val, ImGuiColorEditFlags::NoPicker | ImGuiColorEditFlags::AlphaPreviewHalf, ImVec2.new(60, 40))
        ImGui.text("Previous")
        if ImGui.color_button("##previous", backup_color.val, ImGuiColorEditFlags::NoPicker | ImGuiColorEditFlags::AlphaPreviewHalf, ImVec2.new(60, 40))
          color.val = backup_color.val
        end
        ImGui.separator
        ImGui.text("Palette")
        saved_palette.val.size.times do |n|
          ImGui.push_id(n)
          if (n % 8) != 0
            ImGui.same_line(0.0f32, ImGui.get_style.item_spacing.y)
          end

          palette_button_flags = ImGuiColorEditFlags::NoAlpha | ImGuiColorEditFlags::NoPicker | ImGuiColorEditFlags::NoTooltip
          if ImGui.color_button("##palette", saved_palette.val[n], palette_button_flags, ImVec2.new(20, 20))
            color.val = ImVec4.new(saved_palette.val[n].x, saved_palette.val[n].y, saved_palette.val[n].z, color.val.w)
          end

          if ImGui.begin_drag_drop_target
            if payload = ImGui.accept_drag_drop_payload(ImGui::PAYLOAD_TYPE_COLOR_3F)
              data = payload.data.as(Float32*)
              saved_palette.val[n] = ImGui.rgb(data[0], data[1], data[2])
            end
            if payload = ImGui.accept_drag_drop_payload(ImGui::PAYLOAD_TYPE_COLOR_4F)
              data = payload.data.as(Float32*)
              saved_palette.val[n] = ImGui.rgb(data[0], data[1], data[2], data[3])
            end
            ImGui.end_drag_drop_target
          end

          ImGui.pop_id
        end
        ImGui.end_group
        ImGui.end_popup
      end

      ImGui.text("Color button only:")
      static no_border = false
      ImGui.checkbox("ImGuiColorEditFlags_NoBorder", pointerof(no_border.val))
      ImGui.color_button("MyColor##3c", color.val, misc_flags | (no_border.val ? ImGuiColorEditFlags::NoBorder : ImGuiColorEditFlags::None), ImVec2.new(80, 80))

      ImGui.text("Color picker:")
      static alpha = true
      static alpha_bar = true
      static side_preview = true
      static ref_color = false
      static ref_color_v = ImVec4.new(1.0f32, 0.0f32, 1.0f32, 0.5f32)
      static display_mode = 0
      static picker_mode = 0
      ImGui.checkbox("With Alpha", pointerof(alpha.val))
      ImGui.checkbox("With Alpha Bar", pointerof(alpha_bar.val))
      ImGui.checkbox("With Side Preview", pointerof(side_preview.val))
      if side_preview.val
        ImGui.same_line
        ImGui.checkbox("With Ref Color", pointerof(ref_color.val))
        if ref_color.val
          ImGui.same_line
          ImGui.color_edit4("##RefColor", pointerof(ref_color_v.val), ImGuiColorEditFlags::NoInputs | misc_flags)
        end
      end
      ImGui.combo("Display Mode", pointerof(display_mode.val), "Auto/Current\0None\0RGB Only\0HSV Only\0Hex Only\0")
      ImGui.same_line
      help_marker(
        "ColorEdit defaults to displaying RGB inputs if you don't specify a display mode, " +
        "but the user can change it with a right-click.\n\nColorPicker defaults to displaying RGB+HSV+Hex " +
        "if you don't specify a display mode.\n\nYou can change the defaults using SetColorEditOptions().")
      ImGui.combo("Picker Mode", pointerof(picker_mode.val), "Auto/Current\0Hue bar + SV rect\0Hue wheel + SV triangle\0")
      ImGui.same_line
      help_marker("User can right-click the picker to change mode.")
      flags = misc_flags
      if !alpha.val
        flags |= ImGuiColorEditFlags::NoAlpha
      end
      if alpha_bar.val
        flags |= ImGuiColorEditFlags::AlphaBar
      end
      if !side_preview.val
        flags |= ImGuiColorEditFlags::NoSidePreview
      end
      if picker_mode.val == 1
        flags |= ImGuiColorEditFlags::PickerHueBar
      end
      if picker_mode.val == 2
        flags |= ImGuiColorEditFlags::PickerHueWheel
      end
      if display_mode.val == 1
        flags |= ImGuiColorEditFlags::NoInputs
      end
      if display_mode.val == 2
        flags |= ImGuiColorEditFlags::DisplayRGB
      end
      if display_mode.val == 3
        flags |= ImGuiColorEditFlags::DisplayHSV
      end
      if display_mode.val == 4
        flags |= ImGuiColorEditFlags::DisplayHex
      end
      ImGui.color_picker4("MyColor##4", pointerof(color.val), flags, ref_color.val ? ref_color_v.val.to_unsafe : Pointer(Float32).null)

      ImGui.text("Set defaults in code:")
      ImGui.same_line
      help_marker(
        "SetColorEditOptions() is designed to allow you to set boot-time default.\n" +
        "We don't have Push/Pop functions because you can force options on a per-widget basis if needed," +
        "and the user can change non-forced ones with the options menu.\nWe don't have a getter to avoid" +
        "encouraging you to persistently save values that aren't forward-compatible.")
      if ImGui.button("Default: Uint8 + HSV + Hue Bar")
        ImGui.set_color_edit_options(ImGuiColorEditFlags::Uint8 | ImGuiColorEditFlags::DisplayHSV | ImGuiColorEditFlags::PickerHueBar)
      end
      if ImGui.button("Default: Float + HDR + Hue Wheel")
        ImGui.set_color_edit_options(ImGuiColorEditFlags::Float | ImGuiColorEditFlags::HDR | ImGuiColorEditFlags::PickerHueWheel)
      end

      static color_hsv = ImVec4.new(0.23f32, 1.0f32, 1.0f32, 1.0f32)
      ImGui.spacing
      ImGui.text("HSV encoded colors")
      ImGui.same_line
      help_marker(
        "By default, colors are given to ColorEdit and ColorPicker in RGB, but ImGuiColorEditFlags_InputHSV" +
        "allows you to store colors as HSV and pass them to ColorEdit and ColorPicker as HSV. This comes with the" +
        "added benefit that you can manipulate hue values with the picker even when saturation or value are zero.")
      ImGui.text("Color widget with InputHSV:")
      ImGui.color_edit4("HSV shown as RGB##1", pointerof(color_hsv.val), ImGuiColorEditFlags::DisplayRGB | ImGuiColorEditFlags::InputHSV | ImGuiColorEditFlags::Float)
      ImGui.color_edit4("HSV shown as HSV##1", pointerof(color_hsv.val), ImGuiColorEditFlags::DisplayHSV | ImGuiColorEditFlags::InputHSV | ImGuiColorEditFlags::Float)
      ImGui.drag_float4("Raw HSV values", pointerof(color_hsv.val), 0.01f32, 0.0f32, 1.0f32)

      ImGui.tree_pop
    end

    if ImGui.tree_node("Drag/Slider Flags")
      static flags = ImGuiSliderFlags::None
      ImGui.checkbox_flags("ImGuiSliderFlags_ClampOnInput", pointerof(flags.val), ImGuiSliderFlags::ClampOnInput)
      ImGui.same_line
      help_marker("Always clamp value to min/max bounds (if any) when input manually with CTRL+Click.")
      ImGui.checkbox_flags("ImGuiSliderFlags_Logarithmic", pointerof(flags.val), ImGuiSliderFlags::Logarithmic)
      ImGui.same_line
      help_marker("Enable logarithmic editing (more precision for small values).")
      ImGui.checkbox_flags("ImGuiSliderFlags_NoRoundToFormat", pointerof(flags.val), ImGuiSliderFlags::NoRoundToFormat)
      ImGui.same_line
      help_marker("Disable rounding underlying value to match precision of the format string (e.g. %.3f values are rounded to those 3 digits).")
      ImGui.checkbox_flags("ImGuiSliderFlags_NoInput", pointerof(flags.val), ImGuiSliderFlags::NoInput)
      ImGui.same_line
      help_marker("Disable CTRL+Click or Enter key allowing to input text directly into the widget.")

      static drag_f = 0.5f32
      static drag_i = 50
      ImGui.text("Underlying float value: %f", drag_f.val)
      ImGui.drag_float("DragFloat (0 -> 1)", pointerof(drag_f.val), 0.005f32, 0.0f32, 1.0f32, "%.3f", flags.val)
      ImGui.drag_float("DragFloat (0 -> +inf)", pointerof(drag_f.val), 0.005f32, 0.0f32, Float32::MAX, "%.3f", flags.val)
      ImGui.drag_float("DragFloat (-inf -> 1)", pointerof(drag_f.val), 0.005f32, -Float32::MAX, 1.0f32, "%.3f", flags.val)
      ImGui.drag_float("DragFloat (-inf -> +inf)", pointerof(drag_f.val), 0.005f32, -Float32::MAX, +Float32::MAX, "%.3f", flags.val)
      ImGui.drag_int("DragInt (0 -> 100)", pointerof(drag_i.val), 0.5f32, 0, 100, "%d", flags.val)

      static slider_f = 0.5f32
      static slider_i = 50
      ImGui.text("Underlying float value: %f", slider_f.val)
      ImGui.slider_float("SliderFloat (0 -> 1)", pointerof(slider_f.val), 0.0f32, 1.0f32, "%.3f", flags.val)
      ImGui.slider_int("SliderInt (0 -> 100)", pointerof(slider_i.val), 0, 100, "%.3f", flags.val)

      ImGui.tree_pop
    end

    if ImGui.tree_node("Range Widgets")
      static begin_ = 10f32
      static end_ = 90f32
      static begin_i = 100
      static end_i = 1000
      ImGui.drag_float_range2("range float", pointerof(begin_.val), pointerof(end_.val), 0.25f32, 0.0f32, 100.0f32, "Min: %.1f %%", "Max: %.1f %%", ImGuiSliderFlags::ClampOnInput)
      ImGui.drag_int_range2("range int", pointerof(begin_i.val), pointerof(end_i.val), 5, 0, 1000, "Min: %d units", "Max: %d units")
      ImGui.drag_int_range2("range int (no bounds)", pointerof(begin_i.val), pointerof(end_i.val), 5, 0, 0, "Min: %d units", "Max: %d units")
      ImGui.tree_pop
    end

    if ImGui.tree_node("Data Types")
      s8_zero = 0i8
      s8_one = 1i8
      s8_fifty = 50i8
      s8_min = -128i8
      s8_max = 127i8
      u8_zero = 0u8
      u8_one = 1u8
      u8_fifty = 50u8
      u8_min = 0u8
      u8_max = 255u8
      s16_zero = 0i16
      s16_one = 1i16
      s16_fifty = 50i16
      s16_min = -32768i16
      s16_max = 32767i16
      u16_zero = 0u16
      u16_one = 1u16
      u16_fifty = 50u16
      u16_min = 0u16
      u16_max = 65535u16
      s32_zero = 0i32
      s32_one = 1i32
      s32_fifty = 50i32
      s32_min = Int32::MIN // 2
      s32_max = Int32::MAX // 2
      s32_hi_a = Int32::MAX // 2 - 100
      s32_hi_b = Int32::MAX // 2
      u32_zero = 0u32
      u32_one = 1u32
      u32_fifty = 50u32
      u32_min = 0u32
      u32_max = UInt32::MAX // 2
      u32_hi_a = UInt32::MAX // 2 - 100
      u32_hi_b = UInt32::MAX // 2
      s64_zero = 0i64
      s64_one = 1i64
      s64_fifty = 50i64
      s64_min = Int64::MIN // 2
      s64_max = Int64::MAX // 2
      s64_hi_a = Int64::MAX // 2 - 100
      s64_hi_b = Int64::MAX // 2
      u64_zero = 0u64
      u64_one = 1u64
      u64_fifty = 50u64
      u64_min = 0u64
      u64_max = UInt64::MAX // 2
      u64_hi_a = UInt64::MAX // 2 - 100
      u64_hi_b = UInt64::MAX // 2
      f32_zero = 0.0f32
      f32_one = 1.0f32
      f32_lo_a = -10000000000.0f32
      f32_hi_a = +10000000000.0f32
      f64_zero = 0.0
      f64_one = 1.0
      f64_lo_a = -1000000000000000.0
      f64_hi_a = +1000000000000000.0

      static s8_v = 127i8
      static u8_v = 255u8
      static s16_v = 32767i16
      static u16_v = 65535u16
      static s32_v = -1i32
      static u32_v = (-1).to_u32!
      static s64_v = -1i64
      static u64_v = (-1).to_u64!
      static f32_v = 0.123f32
      static f64_v = 90000.01234567890123456789

      drag_speed = 0.2f32
      static drag_clamp = false
      ImGui.text("Drags:")
      ImGui.checkbox("Clamp integers to 0..50", pointerof(drag_clamp.val))
      ImGui.same_line
      help_marker("As with every widgets in dear imgui, we never modify values unless there is a user interaction.\nYou can override the clamping limits by using CTRL+Click to input a value.")
      ImGui.drag_scalar("drag s8", pointerof(s8_v.val), drag_speed, drag_clamp.val ? s8_zero : nil, drag_clamp.val ? s8_fifty : nil)
      ImGui.drag_scalar("drag u8", pointerof(u8_v.val), drag_speed, drag_clamp.val ? u8_zero : nil, drag_clamp.val ? u8_fifty : nil, "%u ms")
      ImGui.drag_scalar("drag s16", pointerof(s16_v.val), drag_speed, drag_clamp.val ? s16_zero : nil, drag_clamp.val ? s16_fifty : nil)
      ImGui.drag_scalar("drag u16", pointerof(u16_v.val), drag_speed, drag_clamp.val ? u16_zero : nil, drag_clamp.val ? u16_fifty : nil, "%u ms")
      ImGui.drag_scalar("drag s32", pointerof(s32_v.val), drag_speed, drag_clamp.val ? s32_zero : nil, drag_clamp.val ? s32_fifty : nil)
      ImGui.drag_scalar("drag u32", pointerof(u32_v.val), drag_speed, drag_clamp.val ? u32_zero : nil, drag_clamp.val ? u32_fifty : nil, "%u ms")
      ImGui.drag_scalar("drag s64", pointerof(s64_v.val), drag_speed, drag_clamp.val ? s64_zero : nil, drag_clamp.val ? s64_fifty : nil)
      ImGui.drag_scalar("drag u64", pointerof(u64_v.val), drag_speed, drag_clamp.val ? u64_zero : nil, drag_clamp.val ? u64_fifty : nil)
      ImGui.drag_scalar("drag float", pointerof(f32_v.val), 0.005f32, f32_zero, f32_one, "%f")
      ImGui.drag_scalar("drag float log", pointerof(f32_v.val), 0.005f32, f32_zero, f32_one, "%f", ImGuiSliderFlags::Logarithmic)
      ImGui.drag_scalar("drag double", pointerof(f64_v.val), 0.0005f32, f64_zero, nil, "%.10f grams")
      ImGui.drag_scalar("drag double log", pointerof(f64_v.val), 0.0005f32, f64_zero, f64_one, "0 < %.10f < 1", ImGuiSliderFlags::Logarithmic)

      ImGui.text("Sliders")
      ImGui.slider_scalar("slider s8 full", pointerof(s8_v.val), s8_min, s8_max, "%d")
      ImGui.slider_scalar("slider u8 full", pointerof(u8_v.val), u8_min, u8_max, "%u")
      ImGui.slider_scalar("slider s16 full", pointerof(s16_v.val), s16_min, s16_max, "%d")
      ImGui.slider_scalar("slider u16 full", pointerof(u16_v.val), u16_min, u16_max, "%u")
      ImGui.slider_scalar("slider s32 low", pointerof(s32_v.val), s32_zero, s32_fifty, "%d")
      ImGui.slider_scalar("slider s32 high", pointerof(s32_v.val), s32_hi_a, s32_hi_b, "%d")
      ImGui.slider_scalar("slider s32 full", pointerof(s32_v.val), s32_min, s32_max, "%d")
      ImGui.slider_scalar("slider u32 low", pointerof(u32_v.val), u32_zero, u32_fifty, "%u")
      ImGui.slider_scalar("slider u32 high", pointerof(u32_v.val), u32_hi_a, u32_hi_b, "%u")
      ImGui.slider_scalar("slider u32 full", pointerof(u32_v.val), u32_min, u32_max, "%u")
      ImGui.slider_scalar("slider s64 low", pointerof(s64_v.val), s64_zero, s64_fifty, "%I64d")
      ImGui.slider_scalar("slider s64 high", pointerof(s64_v.val), s64_hi_a, s64_hi_b, "%I64d")
      ImGui.slider_scalar("slider s64 full", pointerof(s64_v.val), s64_min, s64_max, "%I64d")
      ImGui.slider_scalar("slider u64 low", pointerof(u64_v.val), u64_zero, u64_fifty, "%I64u ms")
      ImGui.slider_scalar("slider u64 high", pointerof(u64_v.val), u64_hi_a, u64_hi_b, "%I64u ms")
      ImGui.slider_scalar("slider u64 full", pointerof(u64_v.val), u64_min, u64_max, "%I64u ms")
      ImGui.slider_scalar("slider float low", pointerof(f32_v.val), f32_zero, f32_one)
      ImGui.slider_scalar("slider float low log", pointerof(f32_v.val), f32_zero, f32_one, "%.10f", ImGuiSliderFlags::Logarithmic)
      ImGui.slider_scalar("slider float high", pointerof(f32_v.val), f32_lo_a, f32_hi_a, "%e")
      ImGui.slider_scalar("slider double low", pointerof(f64_v.val), f64_zero, f64_one, "%.10f grams")
      ImGui.slider_scalar("slider double low log", pointerof(f64_v.val), f64_zero, f64_one, "%.10f", ImGuiSliderFlags::Logarithmic)
      ImGui.slider_scalar("slider double high", pointerof(f64_v.val), f64_lo_a, f64_hi_a, "%e grams")

      static inputs_step = true
      ImGui.text("Inputs")
      ImGui.checkbox("Show step buttons", pointerof(inputs_step.val))
      ImGui.input_scalar("input s8", pointerof(s8_v.val), inputs_step.val ? s8_one : nil, nil, "%d")
      ImGui.input_scalar("input u8", pointerof(u8_v.val), inputs_step.val ? u8_one : nil, nil, "%u")
      ImGui.input_scalar("input s16", pointerof(s16_v.val), inputs_step.val ? s16_one : nil, nil, "%d")
      ImGui.input_scalar("input u16", pointerof(u16_v.val), inputs_step.val ? u16_one : nil, nil, "%u")
      ImGui.input_scalar("input s32", pointerof(s32_v.val), inputs_step.val ? s32_one : nil, nil, "%d")
      ImGui.input_scalar("input s32 hex", pointerof(s32_v.val), inputs_step.val ? s32_one : nil, nil, "%08X", ImGuiInputTextFlags::CharsHexadecimal)
      ImGui.input_scalar("input u32", pointerof(u32_v.val), inputs_step.val ? u32_one : nil, nil, "%u")
      ImGui.input_scalar("input u32 hex", pointerof(u32_v.val), inputs_step.val ? u32_one : nil, nil, "%08X", ImGuiInputTextFlags::CharsHexadecimal)
      ImGui.input_scalar("input s64", pointerof(s64_v.val), inputs_step.val ? s64_one : nil)
      ImGui.input_scalar("input u64", pointerof(u64_v.val), inputs_step.val ? u64_one : nil)
      ImGui.input_scalar("input float", pointerof(f32_v.val), inputs_step.val ? f32_one : nil)
      ImGui.input_scalar("input double", pointerof(f64_v.val), inputs_step.val ? f64_one : nil)

      ImGui.tree_pop
    end

    if ImGui.tree_node("Multi-component Widgets")
      static vec4f = Slice[0.10f32, 0.20f32, 0.30f32, 0.44f32]
      static vec4i = Slice[1, 5, 100, 255]

      ImGui.input_float2("input float2", vec4f.val[...2])
      ImGui.drag_float2("drag float2", vec4f.val[...2], 0.01f32, 0.0f32, 1.0f32)
      ImGui.slider_float2("slider float2", vec4f.val[...2], 0.0f32, 1.0f32)
      ImGui.input_int2("input int2", vec4i.val[...2])
      ImGui.drag_int2("drag int2", vec4i.val[...2], 1, 0, 255)
      ImGui.slider_int2("slider int2", vec4i.val[...2], 0, 255)
      ImGui.spacing

      ImGui.input_float3("input float3", vec4f.val[...3])
      ImGui.drag_float3("drag float3", vec4f.val[...3], 0.01f32, 0.0f32, 1.0f32)
      ImGui.slider_float3("slider float3", vec4f.val[...3], 0.0f32, 1.0f32)
      ImGui.input_int3("input int3", vec4i.val[...3])
      ImGui.drag_int3("drag int3", vec4i.val[...3], 1, 0, 255)
      ImGui.slider_int3("slider int3", vec4i.val[...3], 0, 255)
      ImGui.spacing

      ImGui.input_float4("input float4", vec4f.val)
      ImGui.drag_float4("drag float4", vec4f.val, 0.01f32, 0.0f32, 1.0f32)
      ImGui.slider_float4("slider float4", vec4f.val, 0.0f32, 1.0f32)
      ImGui.input_int4("input int4", vec4i.val)
      ImGui.drag_int4("drag int4", vec4i.val, 1, 0, 255)
      ImGui.slider_int4("slider int4", vec4i.val, 0, 255)

      ImGui.tree_pop
    end

    if ImGui.tree_node("Vertical Sliders")
      spacing = 4
      ImGui.push_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(spacing, spacing))

      static int_value = 0
      ImGui.v_slider_int("##int", ImVec2.new(18, 160), pointerof(int_value.val), 0, 5)
      ImGui.same_line

      static values = [0.0f32, 0.60f32, 0.35f32, 0.9f32, 0.70f32, 0.20f32, 0.0f32]
      ImGui.push_id("set1")
      7.times do |i|
        if i > 0
          ImGui.same_line
        end
        ImGui.push_id(i)
        ImGui.push_style_color(ImGuiCol::FrameBg, ImGui.hsv(i / 7.0f32, 0.5f32, 0.5f32))
        ImGui.push_style_color(ImGuiCol::FrameBgHovered, ImGui.hsv(i / 7.0f32, 0.6f32, 0.5f32))
        ImGui.push_style_color(ImGuiCol::FrameBgActive, ImGui.hsv(i / 7.0f32, 0.7f32, 0.5f32))
        ImGui.push_style_color(ImGuiCol::SliderGrab, ImGui.hsv(i / 7.0f32, 0.9f32, 0.9f32))
        ImGui.v_slider_float("##v", ImVec2.new(18, 160), pointerof(values.val[i]), 0.0f32, 1.0f32, "")
        if ImGui.is_item_active || ImGui.is_item_hovered
          ImGui.set_tooltip("%.3f", values.val[i])
        end
        ImGui.pop_style_color(4)
        ImGui.pop_id
      end
      ImGui.pop_id

      ImGui.same_line
      ImGui.push_id("set2")
      static values2 = [0.20f32, 0.80f32, 0.40f32, 0.25f32]
      rows = 3
      small_slider_size = ImVec2.new(18, ((160.0f32 - (rows - 1) * spacing) / rows).to_i)
      4.times do |nx|
        if nx > 0
          ImGui.same_line
        end
        ImGui.begin_group
        rows.times do |ny|
          ImGui.push_id(nx * rows + ny)
          ImGui.v_slider_float("##v", small_slider_size, pointerof(values2.val[nx]), 0.0f32, 1.0f32, "")
          if ImGui.is_item_active || ImGui.is_item_hovered
            ImGui.set_tooltip("%.3f", values2.val[nx])
          end
          ImGui.pop_id
        end
        ImGui.end_group
      end
      ImGui.pop_id

      ImGui.same_line
      ImGui.push_id("set3")
      4.times do |i|
        if i > 0
          ImGui.same_line
        end
        ImGui.push_id(i)
        ImGui.push_style_var(ImGuiStyleVar::GrabMinSize, 40)
        ImGui.v_slider_float("##v", ImVec2.new(40, 160), pointerof(values.val[i]), 0.0f32, 1.0f32, "%.2f\nsec")
        ImGui.pop_style_var
        ImGui.pop_id
      end
      ImGui.pop_id
      ImGui.pop_style_var
      ImGui.tree_pop
    end

    if ImGui.tree_node("Drag and Drop")
      if ImGui.tree_node("Drag and drop in standard widgets")
        help_marker("You can drag from the colored squares.")
        static col1 = Slice[1.0f32, 0.0f32, 0.2f32]
        static col2 = Slice[0.4f32, 0.7f32, 0.0f32, 0.5f32]
        ImGui.color_edit3("color 1", col1.val)
        ImGui.color_edit4("color 2", col2.val)
        ImGui.tree_pop
      end

      if ImGui.tree_node("Drag and drop to copy/swap items")
        static mode = Mode::Copy
        if ImGui.radio_button("Copy", mode.val == Mode::Copy)
          mode.val = Mode::Copy
        end
        ImGui.same_line
        if ImGui.radio_button("Move", mode.val == Mode::Move)
          mode.val = Mode::Move
        end
        ImGui.same_line
        if ImGui.radio_button("Swap", mode.val == Mode::Swap)
          mode.val = Mode::Swap
        end
        static names = ["Bobby", "Beatrice", "Betty", "Brianna", "Barry", "Bernard", "Bibi", "Blaine", "Bryn"]
        names.val.size.times do |n|
          ImGui.push_id(n)
          if (n % 3) != 0
            ImGui.same_line
          end
          ImGui.button(names.val[n], ImVec2.new(60, 60))

          if ImGui.begin_drag_drop_source(ImGuiDragDropFlags::None)
            ImGui.set_drag_drop_payload("DND_DEMO_CELL", pointerof(n).as(Void*), LibC::SizeT.new(sizeof(Int32)))

            if mode.val == Mode::Copy
              ImGui.text("Copy %s", names.val[n])
            end
            if mode.val == Mode::Move
              ImGui.text("Move %s", names.val[n])
            end
            if mode.val == Mode::Swap
              ImGui.text("Swap %s", names.val[n])
            end
            ImGui.end_drag_drop_source
          end
          if ImGui.begin_drag_drop_target
            if payload = ImGui.accept_drag_drop_payload("DND_DEMO_CELL")
              assert(payload.data_size == sizeof(Int32))
              payload_n = payload.data.as(Int32*).value
              if mode.val == Mode::Copy
                names.val[n] = names.val[payload_n]
              end
              if mode.val == Mode::Move
                names.val[n] = names.val[payload_n]
                names.val[payload_n] = ""
              end
              if mode.val == Mode::Swap
                tmp = names.val[n]
                names.val[n] = names.val[payload_n]
                names.val[payload_n] = tmp
              end
            end
            ImGui.end_drag_drop_target
          end
          ImGui.pop_id
        end
        ImGui.tree_pop
      end

      if ImGui.tree_node("Drag to reorder items (simple)")
        help_marker(
          "We don't use the drag and drop api at all here! " +
          "Instead we query when the item is held but not hovered, and order items accordingly.")
        static item_names = ["Item One", "Item Two", "Item Three", "Item Four", "Item Five"]
        item_names.val.size.times do |n|
          item = item_names.val[n]
          ImGui.selectable(item)

          if ImGui.is_item_active && !ImGui.is_item_hovered
            n_next = n + (ImGui.get_mouse_drag_delta(ImGuiMouseButton::Left).y < 0f32 ? -1 : 1)
            if n_next >= 0 && n_next < item_names.val.size
              item_names.val[n] = item_names.val[n_next]
              item_names.val[n_next] = item
              ImGui.reset_mouse_drag_delta
            end
          end
        end
        ImGui.tree_pop
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Querying Status (Active/Focused/Hovered etc.)")
      item_names = [
        "Text", "Button", "Button (w/ repeat)", "Checkbox", "SliderFloat", "InputText", "InputFloat",
        "InputFloat3", "ColorEdit4", "MenuItem", "TreeNode", "TreeNode (w/ double-click)", "ListBox",
      ]
      static item_type = 1
      ImGui.combo("Item Type", pointerof(item_type.val), item_names, item_names.size)
      ImGui.same_line
      help_marker("Testing how various types of items are interacting with the IsItemXXX functions.")

      ret = false
      static b = false
      static col4f = Slice[1.0f32, 0.5f32, 0.0f32, 1.0f32]
      static str = ImGui::TextBuffer.new(16)
      if item_type.val == 0
        ImGui.text("ITEM: Text")
      end
      if item_type.val == 1
        ret = ImGui.button("ITEM: Button")
      end
      if item_type.val == 2
        ImGui.push_button_repeat(true)
        ret = ImGui.button("ITEM: Button")
        ImGui.pop_button_repeat
      end
      if item_type.val == 3
        ret = ImGui.checkbox("ITEM: Checkbox", pointerof(b.val))
      end
      if item_type.val == 4
        ret = ImGui.slider_float("ITEM: SliderFloat", pointerof(col4f.val[0]), 0.0f32, 1.0f32)
      end
      if item_type.val == 5
        ret = ImGui.input_text("ITEM: InputText", str.val)
      end
      if item_type.val == 6
        ret = ImGui.input_float("ITEM: InputFloat", pointerof(col4f.val[0]), 1.0f32)
      end
      if item_type.val == 7
        ret = ImGui.input_float3("ITEM: InputFloat3", col4f.val[...3])
      end
      if item_type.val == 8
        ret = ImGui.color_edit4("ITEM: ColorEdit4", col4f.val)
      end
      if item_type.val == 9
        ret = ImGui.menu_item("ITEM: MenuItem")
      end
      if item_type.val == 10
        ret = ImGui.tree_node("ITEM: TreeNode")
        if ret
          ImGui.tree_pop
        end
      end
      if item_type.val == 11
        ret = ImGui.tree_node_ex("ITEM: TreeNode w/ ImGuiTreeNodeFlags_OpenOnDoubleClick", ImGuiTreeNodeFlags::OpenOnDoubleClick | ImGuiTreeNodeFlags::NoTreePushOnOpen)
      end
      if item_type.val == 12
        items = ["Apple", "Banana", "Cherry", "Kiwi"]
        static current = 1
        ret = ImGui.list_box("ITEM: ListBox", pointerof(current.val), items, items.size)
      end

      ImGui.bullet_text(
        "Return value = %d\n" +
        "IsItemFocused() = %d\n" +
        "IsItemHovered() = %d\n" +
        "IsItemHovered(_AllowWhenBlockedByPopup) = %d\n" +
        "IsItemHovered(_AllowWhenBlockedByActiveItem) = %d\n" +
        "IsItemHovered(_AllowWhenOverlapped) = %d\n" +
        "IsItemHovered(_RectOnly) = %d\n" +
        "IsItemActive() = %d\n" +
        "IsItemEdited() = %d\n" +
        "IsItemActivated() = %d\n" +
        "IsItemDeactivated() = %d\n" +
        "IsItemDeactivatedAfterEdit() = %d\n" +
        "IsItemVisible() = %d\n" +
        "IsItemClicked() = %d\n" +
        "IsItemToggledOpen() = %d\n" +
        "GetItemRectMin() = (%.1f, %.1f)\n" +
        "GetItemRectMax() = (%.1f, %.1f)\n" +
        "GetItemRectSize() = (%.1f, %.1f)",
        ret,
        ImGui.is_item_focused,
        ImGui.is_item_hovered,
        ImGui.is_item_hovered(ImGuiHoveredFlags::AllowWhenBlockedByPopup),
        ImGui.is_item_hovered(ImGuiHoveredFlags::AllowWhenBlockedByActiveItem),
        ImGui.is_item_hovered(ImGuiHoveredFlags::AllowWhenOverlapped),
        ImGui.is_item_hovered(ImGuiHoveredFlags::RectOnly),
        ImGui.is_item_active,
        ImGui.is_item_edited,
        ImGui.is_item_activated,
        ImGui.is_item_deactivated,
        ImGui.is_item_deactivated_after_edit,
        ImGui.is_item_visible,
        ImGui.is_item_clicked,
        ImGui.is_item_toggled_open,
        ImGui.get_item_rect_min.x, ImGui.get_item_rect_min.y,
        ImGui.get_item_rect_max.x, ImGui.get_item_rect_max.y,
        ImGui.get_item_rect_size.x, ImGui.get_item_rect_size.y)

      static embed_all_inside_a_child_window = false
      ImGui.checkbox("Embed everything inside a child window (for additional testing)", pointerof(embed_all_inside_a_child_window.val))
      if embed_all_inside_a_child_window.val
        ImGui.begin_child("outer_child", ImVec2.new(0, ImGui.get_font_size * 20.0f32), true)
      end

      ImGui.bullet_text(
        "IsWindowFocused() = %d\n" +
        "IsWindowFocused(_ChildWindows) = %d\n" +
        "IsWindowFocused(_ChildWindows|_RootWindow) = %d\n" +
        "IsWindowFocused(_RootWindow) = %d\n" +
        "IsWindowFocused(_AnyWindow) = %d\n",
        ImGui.is_window_focused,
        ImGui.is_window_focused(ImGuiFocusedFlags::ChildWindows),
        ImGui.is_window_focused(ImGuiFocusedFlags::ChildWindows | ImGuiFocusedFlags::RootWindow),
        ImGui.is_window_focused(ImGuiFocusedFlags::RootWindow),
        ImGui.is_window_focused(ImGuiFocusedFlags::AnyWindow))

      ImGui.bullet_text(
        "IsWindowHovered() = %d\n" +
        "IsWindowHovered(_AllowWhenBlockedByPopup) = %d\n" +
        "IsWindowHovered(_AllowWhenBlockedByActiveItem) = %d\n" +
        "IsWindowHovered(_ChildWindows) = %d\n" +
        "IsWindowHovered(_ChildWindows|_RootWindow) = %d\n" +
        "IsWindowHovered(_ChildWindows|_AllowWhenBlockedByPopup) = %d\n" +
        "IsWindowHovered(_RootWindow) = %d\n" +
        "IsWindowHovered(_AnyWindow) = %d\n",
        ImGui.is_window_hovered,
        ImGui.is_window_hovered(ImGuiHoveredFlags::AllowWhenBlockedByPopup),
        ImGui.is_window_hovered(ImGuiHoveredFlags::AllowWhenBlockedByActiveItem),
        ImGui.is_window_hovered(ImGuiHoveredFlags::ChildWindows),
        ImGui.is_window_hovered(ImGuiHoveredFlags::ChildWindows | ImGuiHoveredFlags::RootWindow),
        ImGui.is_window_hovered(ImGuiHoveredFlags::ChildWindows | ImGuiHoveredFlags::AllowWhenBlockedByPopup),
        ImGui.is_window_hovered(ImGuiHoveredFlags::RootWindow),
        ImGui.is_window_hovered(ImGuiHoveredFlags::AnyWindow))

      ImGui.begin_child("child", ImVec2.new(0, 50), true)
      ImGui.text("This is another child window for testing the _ChildWindows flag.")
      ImGui.end_child
      if embed_all_inside_a_child_window.val
        ImGui.end_child
      end

      static unused_str = ImGui::TextBuffer.new("This widget is only here to be able to tab-out of the widgets above.")
      ImGui.input_text("unused", unused_str.val, ImGuiInputTextFlags::ReadOnly)

      static test_window = false
      ImGui.checkbox("Hovered/Active tests after Begin() for title bar testing", pointerof(test_window.val))
      if test_window.val
        ImGui.begin("Title bar Hovered/Active tests", pointerof(test_window.val))
        if ImGui.begin_popup_context_item
          if ImGui.menu_item("Close")
            test_window.val = false
          end
          ImGui.end_popup
        end
        ImGui.text(
          "IsItemHovered() after begin = %d (== is title bar hovered)\n" +
          "IsItemActive() after begin = %d (== is window being clicked/moved)\n",
          ImGui.is_item_hovered, ImGui.is_item_active)
        ImGui.end
      end

      ImGui.tree_pop
    end
  end

  def self.show_demo_window_layout
    if !ImGui.collapsing_header("Layout & Scrolling")
      return
    end

    if ImGui.tree_node("Child windows")
      help_marker("Use child windows to begin into a self-contained independent scrolling/clipping regions within a host window.")
      static disable_mouse_wheel = false
      static disable_menu = false
      ImGui.checkbox("Disable Mouse Wheel", pointerof(disable_mouse_wheel.val))
      ImGui.checkbox("Disable Menu", pointerof(disable_menu.val))

      begin
        window_flags = ImGuiWindowFlags::HorizontalScrollbar
        if disable_mouse_wheel.val
          window_flags |= ImGuiWindowFlags::NoScrollWithMouse
        end
        ImGui.begin_child("ChildL", ImVec2.new(ImGui.get_window_content_region_width * 0.5f32, 260), false, window_flags)
        100.times do |i|
          ImGui.text("%04d: scrollable region", i)
        end
        ImGui.end_child
      end

      ImGui.same_line

      begin
        window_flags = ImGuiWindowFlags::None
        if disable_mouse_wheel.val
          window_flags |= ImGuiWindowFlags::NoScrollWithMouse
        end
        if !disable_menu.val
          window_flags |= ImGuiWindowFlags::MenuBar
        end
        ImGui.push_style_var(ImGuiStyleVar::ChildRounding, 5.0f32)
        ImGui.begin_child("ChildR", ImVec2.new(0, 260), true, window_flags)
        if !disable_menu.val && ImGui.begin_menu_bar
          if ImGui.begin_menu("Menu")
            show_example_menu_file
            ImGui.end_menu
          end
          ImGui.end_menu_bar
        end
        ImGui.columns(2)
        100.times do |i|
          buf = sprintf("%03d", i)
          ImGui.button(buf, ImVec2.new(-Float32::MIN_POSITIVE, 0.0f32))
          ImGui.next_column
        end
        ImGui.end_child
        ImGui.pop_style_var
      end

      ImGui.separator
      begin
        static offset_x = 0
        ImGui.set_next_item_width(100)
        ImGui.drag_int("Offset X", pointerof(offset_x.val), 1.0f32, -1000, 1000)

        ImGui.set_cursor_pos_x(ImGui.get_cursor_pos_x + offset_x.val)
        ImGui.push_style_color(ImGuiCol::ChildBg, ImGui.col32(255, 0, 0, 100))
        ImGui.begin_child("Red", ImVec2.new(200, 100), true, ImGuiWindowFlags::None)
        50.times do |n|
          ImGui.text("Some test %d", n)
        end
        ImGui.end_child
        child_is_hovered = ImGui.is_item_hovered
        child_rect_min = ImGui.get_item_rect_min
        child_rect_max = ImGui.get_item_rect_max
        ImGui.pop_style_color
        ImGui.text("Hovered: %d", child_is_hovered)
        ImGui.text("Rect of child window is: (%.0f,%.0f) (%.0f,%.0f)", child_rect_min.x, child_rect_min.y, child_rect_max.x, child_rect_max.y)
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Widgets Width")
      static f = 0.0f32
      ImGui.text("SetNextItemWidth/PushItemWidth(100)")
      ImGui.same_line
      help_marker("Fixed width.")
      ImGui.set_next_item_width(100)
      ImGui.drag_float("float##1", pointerof(f.val))

      ImGui.text("SetNextItemWidth/PushItemWidth(GetWindowWidth() * 0.5f)")
      ImGui.same_line
      help_marker("Half of window width.")
      ImGui.set_next_item_width(ImGui.get_window_width * 0.5f32)
      ImGui.drag_float("float##2", pointerof(f.val))

      ImGui.text("SetNextItemWidth/PushItemWidth(GetContentRegionAvail().x * 0.5f)")
      ImGui.same_line
      help_marker("Half of available width.\n(~ right-cursor_pos)\n(works within a column set)")
      ImGui.set_next_item_width(ImGui.get_content_region_avail.x * 0.5f32)
      ImGui.drag_float("float##3", pointerof(f.val))

      ImGui.text("SetNextItemWidth/PushItemWidth(-100)")
      ImGui.same_line
      help_marker("Align to right edge minus 100")
      ImGui.set_next_item_width(-100)
      ImGui.drag_float("float##4", pointerof(f.val))

      ImGui.text("SetNextItemWidth/PushItemWidth(-1)")
      ImGui.same_line
      help_marker("Align to right edge")
      ImGui.push_item_width(-1)
      ImGui.drag_float("##float5a", pointerof(f.val))
      ImGui.drag_float("##float5b", pointerof(f.val))
      ImGui.drag_float("##float5c", pointerof(f.val))
      ImGui.pop_item_width

      ImGui.tree_pop
    end

    if ImGui.tree_node("Basic Horizontal Layout")
      ImGui.text_wrapped("(Use ImGui::SameLine() to keep adding items to the right of the preceding item)")

      ImGui.text("Two items: Hello")
      ImGui.same_line
      ImGui.text_colored(ImVec4.new(1, 1, 0, 1), "Sailor")

      ImGui.text("More spacing: Hello")
      ImGui.same_line(0, 20)
      ImGui.text_colored(ImVec4.new(1, 1, 0, 1), "Sailor")

      ImGui.align_text_to_frame_padding
      ImGui.text("Normal buttons")
      ImGui.same_line
      ImGui.button("Banana")
      ImGui.same_line
      ImGui.button("Apple")
      ImGui.same_line
      ImGui.button("Corniflower")

      ImGui.text("Small buttons")
      ImGui.same_line
      ImGui.small_button("Like this one")
      ImGui.same_line
      ImGui.text("can fit within a text block.")

      ImGui.text("Aligned")
      ImGui.same_line(150)
      ImGui.text("x=150")
      ImGui.same_line(300)
      ImGui.text("x=300")
      ImGui.text("Aligned")
      ImGui.same_line(150)
      ImGui.small_button("x=150")
      ImGui.same_line(300)
      ImGui.small_button("x=300")

      static c1 = false
      static c2 = false
      static c3 = false
      static c4 = false
      ImGui.checkbox("My", pointerof(c1.val))
      ImGui.same_line
      ImGui.checkbox("Tailor", pointerof(c2.val))
      ImGui.same_line
      ImGui.checkbox("Is", pointerof(c3.val))
      ImGui.same_line
      ImGui.checkbox("Rich", pointerof(c4.val))

      static f0 = 1.0f32
      static f1 = 2.0f32
      static f2 = 3.0f32
      ImGui.push_item_width(80)
      items = ["AAAA", "BBBB", "CCCC", "DDDD"]
      static item = -1
      ImGui.combo("Combo", pointerof(item.val), items, items.size)
      ImGui.same_line
      ImGui.slider_float("X", pointerof(f0.val), 0.0f32, 5.0f32)
      ImGui.same_line
      ImGui.slider_float("Y", pointerof(f1.val), 0.0f32, 5.0f32)
      ImGui.same_line
      ImGui.slider_float("Z", pointerof(f2.val), 0.0f32, 5.0f32)
      ImGui.pop_item_width

      ImGui.push_item_width(80)
      ImGui.text("Lists:")
      static selection = [0, 1, 2, 3]
      4.times do |i|
        if i > 0
          ImGui.same_line
        end
        ImGui.push_id(i)
        ImGui.list_box("", pointerof(selection.val[i]), items)
        ImGui.pop_id
      end
      ImGui.pop_item_width

      button_sz = ImVec2.new(40, 40)
      ImGui.button("A", button_sz)
      ImGui.same_line
      ImGui.dummy(button_sz)
      ImGui.same_line
      ImGui.button("B", button_sz)

      ImGui.text("Manually wrapping:")
      style = ImGui.get_style
      buttons_count = 20
      window_visible_x2 = ImGui.get_window_pos.x + ImGui.get_window_content_region_max.x
      buttons_count.times do |n|
        ImGui.push_id(n)
        ImGui.button("Box", button_sz)
        last_button_x2 = ImGui.get_item_rect_max.x
        next_button_x2 = last_button_x2 + style.item_spacing.x + button_sz.x
        if n + 1 < buttons_count && next_button_x2 < window_visible_x2
          ImGui.same_line
        end
        ImGui.pop_id
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Tabs")
      if ImGui.tree_node("Basic")
        tab_bar_flags = ImGuiTabBarFlags::None
        if ImGui.begin_tab_bar("MyTabBar", tab_bar_flags)
          if ImGui.begin_tab_item("Avocado")
            ImGui.text("This is the Avocado tab!\nblah blah blah blah blah")
            ImGui.end_tab_item
          end
          if ImGui.begin_tab_item("Broccoli")
            ImGui.text("This is the Broccoli tab!\nblah blah blah blah blah")
            ImGui.end_tab_item
          end
          if ImGui.begin_tab_item("Cucumber")
            ImGui.text("This is the Cucumber tab!\nblah blah blah blah blah")
            ImGui.end_tab_item
          end
          ImGui.end_tab_bar
        end
        ImGui.separator
        ImGui.tree_pop
      end

      if ImGui.tree_node("Advanced & Close Button")
        static tab_bar_flags = ImGuiTabBarFlags::Reorderable
        ImGui.checkbox_flags("ImGuiTabBarFlags_Reorderable", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::Reorderable)
        ImGui.checkbox_flags("ImGuiTabBarFlags_AutoSelectNewTabs", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::AutoSelectNewTabs)
        ImGui.checkbox_flags("ImGuiTabBarFlags_TabListPopupButton", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::TabListPopupButton)
        ImGui.checkbox_flags("ImGuiTabBarFlags_NoCloseWithMiddleMouseButton", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::NoCloseWithMiddleMouseButton)
        if !tab_bar_flags.val.includes? :FittingPolicyMask_
          tab_bar_flags.val |= ImGuiTabBarFlags::FittingPolicyDefault_
        end
        if ImGui.checkbox_flags("ImGuiTabBarFlags_FittingPolicyResizeDown", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::FittingPolicyResizeDown)
          tab_bar_flags.val &= ~(ImGuiTabBarFlags::FittingPolicyMask_ ^ ImGuiTabBarFlags::FittingPolicyResizeDown)
        end
        if ImGui.checkbox_flags("ImGuiTabBarFlags_FittingPolicyScroll", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::FittingPolicyScroll)
          tab_bar_flags.val &= ~(ImGuiTabBarFlags::FittingPolicyMask_ ^ ImGuiTabBarFlags::FittingPolicyScroll)
        end

        names = ["Artichoke", "Beetroot", "Celery", "Daikon"]
        static opened = [true, true, true, true]
        opened.val.size.times do |n|
          if n > 0
            ImGui.same_line
          end
          ImGui.checkbox(names[n], pointerof(opened.val[n]))
        end

        if ImGui.begin_tab_bar("MyTabBar", tab_bar_flags.val)
          opened.val.size.times do |n|
            if opened.val[n] && ImGui.begin_tab_item(names[n], pointerof(opened.val[n]), ImGuiTabItemFlags::None)
              ImGui.text("This is the %s tab!", names[n])
              if n.odd?
                ImGui.text("I am an odd tab.")
              end
              ImGui.end_tab_item
            end
          end
          ImGui.end_tab_bar
        end
        ImGui.separator
        ImGui.tree_pop
      end
      ImGui.tree_pop
    end

    if ImGui.tree_node("Groups")
      help_marker(
        "BeginGroup() basically locks the horizontal position for new line. " +
        "EndGroup() bundles the whole group so that you can use \"item\" functions such as " +
        "IsItemHovered()/IsItemActive() or SameLine() etc. on the whole group.")
      ImGui.begin_group
      begin
        ImGui.begin_group
        ImGui.button("AAA")
        ImGui.same_line
        ImGui.button("BBB")
        ImGui.same_line
        ImGui.begin_group
        ImGui.button("CCC")
        ImGui.button("DDD")
        ImGui.end_group
        ImGui.same_line
        ImGui.button("EEE")
        ImGui.end_group
        if ImGui.is_item_hovered
          ImGui.set_tooltip("First group hovered")
        end
      end

      size = ImGui.get_item_rect_size
      values = [0.5f32, 0.20f32, 0.80f32, 0.60f32, 0.25f32]
      ImGui.plot_histogram("##values", values, 0, nil, 0.0f32, 1.0f32, size)

      ImGui.button("ACTION", ImVec2.new((size.x - ImGui.get_style.item_spacing.x) * 0.5f32, size.y))
      ImGui.same_line
      ImGui.button("REACTION", ImVec2.new((size.x - ImGui.get_style.item_spacing.x) * 0.5f32, size.y))
      ImGui.end_group
      ImGui.same_line

      ImGui.button("LEVERAGE\nBUZZWORD", size)
      ImGui.same_line

      if ImGui.list_box_header("List", size)
        ImGui.selectable("Selected", true)
        ImGui.selectable("Not Selected", false)
        ImGui.list_box_footer
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Text Baseline Alignment")
      begin
        ImGui.bullet_text("Text baseline:")
        ImGui.same_line
        help_marker(
          "This is testing the vertical alignment that gets applied on text to keep it aligned with widgets. " +
          "Lines only composed of text or \"small\" widgets use less vertical space than lines with framed widgets.")
        ImGui.indent

        ImGui.text("KO Blahblah")
        ImGui.same_line
        ImGui.button("Some framed item")
        ImGui.same_line
        help_marker("Baseline of button will look misaligned with text..")

        ImGui.align_text_to_frame_padding
        ImGui.text("OK Blahblah")
        ImGui.same_line
        ImGui.button("Some framed item")
        ImGui.same_line
        help_marker("We call AlignTextToFramePadding() to vertically align the text baseline by +FramePadding.y")

        ImGui.button("TEST##1")
        ImGui.same_line
        ImGui.text("TEST")
        ImGui.same_line
        ImGui.small_button("TEST##2")

        ImGui.align_text_to_frame_padding
        ImGui.text("Text aligned to framed item")
        ImGui.same_line
        ImGui.button("Item##1")
        ImGui.same_line
        ImGui.text("Item")
        ImGui.same_line
        ImGui.small_button("Item##2")
        ImGui.same_line
        ImGui.button("Item##3")

        ImGui.unindent
      end

      ImGui.spacing

      begin
        ImGui.bullet_text("Multi-line text:")
        ImGui.indent
        ImGui.text("One\nTwo\nThree")
        ImGui.same_line
        ImGui.text("Hello\nWorld")
        ImGui.same_line
        ImGui.text("Banana")

        ImGui.text("Banana")
        ImGui.same_line
        ImGui.text("Hello\nWorld")
        ImGui.same_line
        ImGui.text("One\nTwo\nThree")

        ImGui.button("HOP##1")
        ImGui.same_line
        ImGui.text("Banana")
        ImGui.same_line
        ImGui.text("Hello\nWorld")
        ImGui.same_line
        ImGui.text("Banana")

        ImGui.button("HOP##2")
        ImGui.same_line
        ImGui.text("Hello\nWorld")
        ImGui.same_line
        ImGui.text("Banana")
        ImGui.unindent
      end

      ImGui.spacing

      begin
        ImGui.bullet_text("Misc items:")
        ImGui.indent

        ImGui.button("80x80", ImVec2.new(80, 80))
        ImGui.same_line
        ImGui.button("50x50", ImVec2.new(50, 50))
        ImGui.same_line
        ImGui.button("button()")
        ImGui.same_line
        ImGui.small_button("SmallButton()")

        spacing = ImGui.get_style.item_inner_spacing.x
        ImGui.button("Button##1")
        ImGui.same_line(0.0f32, spacing)
        if ImGui.tree_node("Node##1")
          6.times do |i|
            ImGui.bullet_text("Item %d..", i)
          end
          ImGui.tree_pop
        end

        ImGui.align_text_to_frame_padding

        node_open = ImGui.tree_node("Node##2")
        ImGui.same_line(0.0f32, spacing)
        ImGui.button("Button##2")
        if node_open
          6.times do |i|
            ImGui.bullet_text("Item %d..", i)
          end
          ImGui.tree_pop
        end

        ImGui.button("Button##3")
        ImGui.same_line(0.0f32, spacing)
        ImGui.bullet_text("Bullet text")

        ImGui.align_text_to_frame_padding
        ImGui.bullet_text("Node")
        ImGui.same_line(0.0f32, spacing)
        ImGui.button("Button##4")
        ImGui.unindent
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Scrolling")
      help_marker("Use SetScrollHereY() or SetScrollFromPosY() to scroll to a given vertical position.")

      static track_item = 50
      static enable_track = true
      static enable_extra_decorations = false
      static scroll_to_off_px = 0.0f32
      static scroll_to_pos_px = 200.0f32

      ImGui.checkbox("Decoration", pointerof(enable_extra_decorations.val))

      ImGui.checkbox("Track", pointerof(enable_track.val))
      ImGui.push_item_width(100)
      ImGui.same_line(140)
      enable_track.val |= ImGui.drag_int("##item", pointerof(track_item.val), 0.25f32, 0, 99, "Item = %d")

      scroll_to_off = ImGui.button("Scroll Offset")
      ImGui.same_line(140)
      scroll_to_off |= ImGui.drag_float("##off", pointerof(scroll_to_off_px.val), 1.00f32, 0, Float32::MAX, "+%.0f px")

      scroll_to_pos = ImGui.button("Scroll To Pos")
      ImGui.same_line(140)
      scroll_to_pos |= ImGui.drag_float("##pos", pointerof(scroll_to_pos_px.val), 1.00f32, -10, Float32::MAX, "X/Y = %.0f px")
      ImGui.pop_item_width

      if scroll_to_off || scroll_to_pos
        enable_track.val = false
      end

      style = ImGui.get_style
      child_w = (ImGui.get_content_region_avail.x - 4 * style.item_spacing.x) / 5
      if child_w < 1.0f32
        child_w = 1.0f32
      end
      ImGui.push_id("##VerticalScrolling")
      5.times do |i|
        if i > 0
          ImGui.same_line
        end
        ImGui.begin_group
        names = ["Top", "25%", "Center", "75%", "Bottom"]
        ImGui.text_unformatted(names[i])

        child_flags = enable_extra_decorations.val ? ImGuiWindowFlags::MenuBar : ImGuiWindowFlags::None
        child_id = ImGui.get_id(i)
        child_is_visible = ImGui.begin_child(child_id, ImVec2.new(child_w, 200.0f32), true, child_flags)
        if ImGui.begin_menu_bar
          ImGui.text_unformatted("abc")
          ImGui.end_menu_bar
        end
        if scroll_to_off
          ImGui.set_scroll_y(scroll_to_off_px.val)
        end
        if scroll_to_pos
          ImGui.set_scroll_from_pos_y(ImGui.get_cursor_start_pos.y + scroll_to_pos_px.val, i * 0.25f32)
        end
        if child_is_visible
          100.times do |item|
            if enable_track.val && item == track_item.val
              ImGui.text_colored(ImVec4.new(1, 1, 0, 1), "Item %d", item)
              ImGui.set_scroll_here_y(i * 0.25f32)
            else
              ImGui.text("Item %d", item)
            end
          end
        end
        scroll_y = ImGui.get_scroll_y
        scroll_max_y = ImGui.get_scroll_max_y
        ImGui.end_child
        ImGui.text("%.0f/%.0f", scroll_y, scroll_max_y)
        ImGui.end_group
      end
      ImGui.pop_id

      ImGui.spacing
      help_marker(
        "Use SetScrollHereX() or SetScrollFromPosX() to scroll to a given horizontal position.\n\n" +
        "Because the clipping rectangle of most window hides half worth of WindowPadding on the " +
        "left/right, using SetScrollFromPosX(+1) will usually result in clipped text whereas the " +
        "equivalent SetScrollFromPosY(+1) wouldn't.")
      ImGui.push_id("##HorizontalScrolling")
      5.times do |i|
        child_height = ImGui.get_text_line_height + style.scrollbar_size + style.window_padding.y * 2.0f32
        child_flags = ImGuiWindowFlags::HorizontalScrollbar | (enable_extra_decorations.val ? ImGuiWindowFlags::AlwaysVerticalScrollbar : ImGuiWindowFlags::None)
        child_id = ImGui.get_id(i)
        child_is_visible = ImGui.begin_child(child_id, ImVec2.new(-100, child_height), true, child_flags)
        if scroll_to_off
          ImGui.set_scroll_x(scroll_to_off_px.val)
        end
        if scroll_to_pos
          ImGui.set_scroll_from_pos_x(ImGui.get_cursor_start_pos.x + scroll_to_pos_px.val, i * 0.25f32)
        end
        if child_is_visible
          100.times do |item|
            if enable_track.val && item == track_item.val
              ImGui.text_colored(ImVec4.new(1, 1, 0, 1), "Item %d", item)
              ImGui.set_scroll_here_x(i * 0.25f32)
            else
              ImGui.text("Item %d", item)
            end
            ImGui.same_line
          end
        end
        scroll_x = ImGui.get_scroll_x
        scroll_max_x = ImGui.get_scroll_max_x
        ImGui.end_child
        ImGui.same_line
        names = ["Left", "25%", "Center", "75%", "Right"]
        ImGui.text("%s\n%.0f/%.0f", names[i], scroll_x, scroll_max_x)
        ImGui.spacing
      end
      ImGui.pop_id

      help_marker(
        "Horizontal scrolling for a window is enabled via the ImGuiWindowFlags_HorizontalScrollbar flag.\n\n" +
        "You may want to also explicitly specify content width by using SetNextWindowContentWidth() before Begin().")
      static lines = 7
      ImGui.slider_int("Lines", pointerof(lines.val), 1, 15)
      ImGui.push_style_var(ImGuiStyleVar::FrameRounding, 3.0f32)
      ImGui.push_style_var(ImGuiStyleVar::FramePadding, ImVec2.new(2.0f32, 1.0f32))
      scrolling_child_size = ImVec2.new(0, ImGui.get_frame_height_with_spacing * 7 + 30)
      ImGui.begin_child("scrolling", scrolling_child_size, true, ImGuiWindowFlags::HorizontalScrollbar)
      lines.val.times do |line|
        num_buttons = 10 + (line.odd? ? line * 9 : line * 3)
        num_buttons.times do |n|
          if n > 0
            ImGui.same_line
          end
          ImGui.push_id(n + line * 1000)
          num_buf = sprintf("%d", n)
          label = (n % 15 == 0) ? "FizzBuzz" : (n % 3 == 0) ? "Fizz" : (n % 5 == 0) ? "Buzz" : num_buf
          hue = n * 0.05f32
          ImGui.push_style_color(ImGuiCol::Button, ImGui.hsv(hue, 0.6f32, 0.6f32))
          ImGui.push_style_color(ImGuiCol::ButtonHovered, ImGui.hsv(hue, 0.7f32, 0.7f32))
          ImGui.push_style_color(ImGuiCol::ButtonActive, ImGui.hsv(hue, 0.8f32, 0.8f32))
          ImGui.button(label, ImVec2.new(40.0f32 + Math.sin((line + n)) * 20.0f32, 0.0f32))
          ImGui.pop_style_color(3)
          ImGui.pop_id
        end
      end
      scroll_x = ImGui.get_scroll_x
      scroll_max_x = ImGui.get_scroll_max_x
      ImGui.end_child
      ImGui.pop_style_var(2)
      scroll_x_delta = 0.0f32
      ImGui.small_button("<<")
      if ImGui.is_item_active
        scroll_x_delta = -ImGui.get_io.delta_time * 1000.0f32
      end
      ImGui.same_line
      ImGui.text("Scroll from code")
      ImGui.same_line
      ImGui.small_button(">>")
      if ImGui.is_item_active
        scroll_x_delta = +ImGui.get_io.delta_time * 1000.0f32
      end
      ImGui.same_line
      ImGui.text("%.0f/%.0f", scroll_x, scroll_max_x)
      if scroll_x_delta != 0.0f32
        ImGui.begin_child("scrolling")
        ImGui.set_scroll_x(ImGui.get_scroll_x + scroll_x_delta)
        ImGui.end_child
      end
      ImGui.spacing

      static show_horizontal_contents_size_demo_window = false
      ImGui.checkbox("Show Horizontal contents size demo window", pointerof(show_horizontal_contents_size_demo_window.val))

      if show_horizontal_contents_size_demo_window.val
        static show_h_scrollbar = true
        static show_button = true
        static show_tree_nodes = true
        static show_text_wrapped = false
        static show_columns = true
        static show_tab_bar = true
        static show_child = false
        static explicit_content_size = false
        static contents_size_x = 300.0f32
        if explicit_content_size.val
          ImGui.set_next_window_content_size(ImVec2.new(contents_size_x.val, 0.0f32))
        end
        ImGui.begin("Horizontal contents size demo window", pointerof(show_horizontal_contents_size_demo_window.val), show_h_scrollbar.val ? ImGuiWindowFlags::HorizontalScrollbar : ImGuiWindowFlags::None)
        ImGui.push_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(2, 0))
        ImGui.push_style_var(ImGuiStyleVar::FramePadding, ImVec2.new(2, 0))
        help_marker("Test of different widgets react and impact the work rectangle growing when horizontal scrolling is enabled.\n\nUse 'Metrics->Tools->Show windows rectangles' to visualize rectangles.")
        ImGui.checkbox("H-scrollbar", pointerof(show_h_scrollbar.val))
        ImGui.checkbox("Button", pointerof(show_button.val))
        ImGui.checkbox("Tree nodes", pointerof(show_tree_nodes.val))
        ImGui.checkbox("Text wrapped", pointerof(show_text_wrapped.val))
        ImGui.checkbox("Columns", pointerof(show_columns.val))
        ImGui.checkbox("Tab bar", pointerof(show_tab_bar.val))
        ImGui.checkbox("Child", pointerof(show_child.val))
        ImGui.checkbox("Explicit content size", pointerof(explicit_content_size.val))
        ImGui.text("Scroll %.1f/%.1f %.1f/%.1f", ImGui.get_scroll_x, ImGui.get_scroll_max_x, ImGui.get_scroll_y, ImGui.get_scroll_max_y)
        if explicit_content_size.val
          ImGui.same_line
          ImGui.set_next_item_width(100)
          ImGui.drag_float("##csx", pointerof(contents_size_x.val))
          p = ImGui.get_cursor_screen_pos
          ImGui.get_window_draw_list.add_rect_filled(p, ImVec2.new(p.x + 10, p.y + 10), ImGui.col32(255, 255, 255))
          ImGui.get_window_draw_list.add_rect_filled(ImVec2.new(p.x + contents_size_x.val - 10, p.y), ImVec2.new(p.x + contents_size_x.val, p.y + 10), ImGui.col32(255, 255, 255))
          ImGui.dummy(ImVec2.new(0, 10))
        end
        ImGui.pop_style_var(2)
        ImGui.separator
        if show_button.val
          ImGui.button("this is a 300-wide button", ImVec2.new(300, 0))
        end
        if show_tree_nodes.val
          open = true
          if ImGui.tree_node("this is a tree node")
            if ImGui.tree_node("another one of those tree node...")
              ImGui.text("Some tree contents")
              ImGui.tree_pop
            end
            ImGui.tree_pop
          end
          ImGui.collapsing_header("CollapsingHeader", pointerof(open))
        end
        if show_text_wrapped.val
          ImGui.text_wrapped("This text should automatically wrap on the edge of the work rectangle.")
        end
        if show_columns.val
          ImGui.columns(4)
          4.times do |n|
            ImGui.text("Width %.2f", ImGui.get_column_width)
            ImGui.next_column
          end
          ImGui.columns(1)
        end
        if show_tab_bar.val && ImGui.begin_tab_bar("Hello")
          if ImGui.begin_tab_item("OneOneOne")
            ImGui.end_tab_item
          end
          if ImGui.begin_tab_item("TwoTwoTwo")
            ImGui.end_tab_item
          end
          if ImGui.begin_tab_item("ThreeThreeThree")
            ImGui.end_tab_item
          end
          if ImGui.begin_tab_item("FourFourFour")
            ImGui.end_tab_item
          end
          ImGui.end_tab_bar
        end
        if show_child.val
          ImGui.begin_child("child", ImVec2.new(0, 0), true)
          ImGui.end_child
        end
        ImGui.end
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Clipping")
      static size = ImVec2.new(100.0f32, 100.0f32)
      static offset = ImVec2.new(30.0f32, 30.0f32)
      ImGui.drag_float2("size", pointerof(size.val), 0.5f32, 1.0f32, 200.0f32, "%.0f")
      ImGui.text_wrapped("(Click and drag to scroll)")

      3.times do |n|
        if n > 0
          ImGui.same_line
        end
        ImGui.push_id(n)
        ImGui.begin_group

        ImGui.invisible_button("##empty", size.val)
        if ImGui.is_item_active && ImGui.is_mouse_dragging(ImGuiMouseButton::Left)
          offset.val = ImVec2.new(offset.val.x + ImGui.get_io.mouse_delta.x, offset.val.y + ImGui.get_io.mouse_delta.y)
        end
        p0 = ImGui.get_item_rect_min
        p1 = ImGui.get_item_rect_max
        text_str = "Line 1 hello\nLine 2 clip me!"
        text_pos = ImVec2.new(p0.x + offset.val.x, p0.y + offset.val.y)
        draw_list = ImGui.get_window_draw_list

        case n
        when 0
          help_marker(
            "Using ImGui::PushClipRect():\n" +
            "Will alter ImGui hit-testing logic + ImDrawList rendering.\n" +
            "(use this if you want your clipping rectangle to affect interactions)")
          ImGui.push_clip_rect(p0, p1, true)
          draw_list.add_rect_filled(p0, p1, ImGui.col32(90, 90, 120, 255))
          draw_list.add_text(text_pos, ImGui.col32(255, 255, 255), text_str)
          ImGui.pop_clip_rect
        when 1
          help_marker(
            "Using ImDrawList::PushClipRect():\n" +
            "Will alter ImDrawList rendering only.\n" +
            "(use this as a shortcut if you are only using ImDrawList calls)")
          draw_list.push_clip_rect(p0, p1, true)
          draw_list.add_rect_filled(p0, p1, ImGui.col32(90, 90, 120, 255))
          draw_list.add_text(text_pos, ImGui.col32(255, 255, 255), text_str)
          draw_list.pop_clip_rect
        when 2
          help_marker(
            "Using ImDrawList::AddText() with a fine ClipRect:\n" +
            "Will alter only this specific ImDrawList::AddText() rendering.\n" +
            "(this is often used internally to avoid altering the clipping rectangle and minimize draw calls)")
          clip_rect = ImVec4.new(p0.x, p0.y, p1.x, p1.y)
          draw_list.add_rect_filled(p0, p1, ImGui.col32(90, 90, 120, 255))
          draw_list.add_text(ImGui.get_font, ImGui.get_font_size, text_pos, ImGui.col32(255, 255, 255), text_str, 0.0f32, pointerof(clip_rect))
        end
        ImGui.end_group
        ImGui.pop_id
      end

      ImGui.tree_pop
    end
  end

  def self.show_demo_window_popups
    if !ImGui.collapsing_header("Popups & Modal windows")
      return
    end
    if ImGui.tree_node("Popups")
      ImGui.text_wrapped(
        "When a popup is active, it inhibits interacting with windows that are behind the popup. " +
        "Clicking outside the popup closes it.")

      static selected_fish = -1
      names = ["Bream", "Haddock", "Mackerel", "Pollock", "Tilefish"]
      static toggles = [true, false, false, false, false]

      if ImGui.button("Select..")
        ImGui.open_popup("my_select_popup")
      end
      ImGui.same_line
      ImGui.text_unformatted(selected_fish.val == -1 ? "<None>" : names[selected_fish.val])
      if ImGui.begin_popup("my_select_popup")
        ImGui.text("Aquarium")
        ImGui.separator
        names.size.times do |i|
          if ImGui.selectable(names[i])
            selected_fish.val = i
          end
        end
        ImGui.end_popup
      end

      if ImGui.button("Toggle..")
        ImGui.open_popup("my_toggle_popup")
      end
      if ImGui.begin_popup("my_toggle_popup")
        names.size.times do |i|
          ImGui.menu_item(names[i], "", pointerof(toggles.val[i]))
        end
        if ImGui.begin_menu("Sub-menu")
          ImGui.menu_item("Click me")
          ImGui.end_menu
        end

        ImGui.separator
        ImGui.text("Tooltip here")
        if ImGui.is_item_hovered
          ImGui.set_tooltip("I am a tooltip over a popup")
        end

        if ImGui.button("Stacked Popup")
          ImGui.open_popup("another popup")
        end
        if ImGui.begin_popup("another popup")
          names.size.times do |i|
            ImGui.menu_item(names[i], "", pointerof(toggles.val[i]))
          end
          if ImGui.begin_menu("Sub-menu")
            ImGui.menu_item("Click me")
            if ImGui.button("Stacked Popup")
              ImGui.open_popup("another popup")
            end
            if ImGui.begin_popup("another popup")
              ImGui.text("I am the last one here.")
              ImGui.end_popup
            end
            ImGui.end_menu
          end
          ImGui.end_popup
        end
        ImGui.end_popup
      end

      if ImGui.button("File Menu..")
        ImGui.open_popup("my_file_popup")
      end
      if ImGui.begin_popup("my_file_popup")
        show_example_menu_file
        ImGui.end_popup
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Context menus")
      static value = 0.5f32
      ImGui.text("Value = %.3f (<-- right-click here)", value.val)
      if ImGui.begin_popup_context_item("item context menu")
        if ImGui.selectable("Set to zero")
          value.val = 0.0f32
        end
        if ImGui.selectable("Set to PI")
          value.val = 3.1415f32
        end
        ImGui.set_next_item_width(-1)
        ImGui.drag_float("##Value", pointerof(value.val), 0.1f32, 0.0f32, 0.0f32)
        ImGui.end_popup
      end

      ImGui.text("(You can also right-click me to open the same popup as above.)")
      ImGui.open_popup_context_item("item context menu", ImGuiPopupFlags::MouseButtonRight)

      static name = ImGui::TextBuffer.new("Label1", 32)
      buf = sprintf("Button: %s###Button", name.val.to_s)
      ImGui.button(buf)
      if ImGui.begin_popup_context_item
        ImGui.text("Edit name:")
        ImGui.input_text("##edit", name.val)
        if ImGui.button("Close")
          ImGui.close_current_popup
        end
        ImGui.end_popup
      end
      ImGui.same_line
      ImGui.text("(<-- right-click here)")

      ImGui.tree_pop
    end

    if ImGui.tree_node("Modals")
      ImGui.text_wrapped("Modal windows are like popups but the user cannot close them by clicking outside.")

      if ImGui.button("Delete..")
        ImGui.open_popup("Delete?")
      end

      center = ImVec2.new(ImGui.get_io.display_size.x * 0.5f32, ImGui.get_io.display_size.y * 0.5f32)
      ImGui.set_next_window_pos(center, ImGuiCond::Appearing, ImVec2.new(0.5f32, 0.5f32))

      if ImGui.begin_popup_modal("Delete?", flags: ImGuiWindowFlags::AlwaysAutoResize)
        ImGui.text("All those beautiful files will be deleted.\nThis operation cannot be undone!\n\n")
        ImGui.separator

        static dont_ask_me_next_time = false
        ImGui.push_style_var(ImGuiStyleVar::FramePadding, ImVec2.new(0, 0))
        ImGui.checkbox("Don't ask me next time", pointerof(dont_ask_me_next_time.val))
        ImGui.pop_style_var

        if ImGui.button("OK", ImVec2.new(120, 0))
          ImGui.close_current_popup
        end
        ImGui.set_item_default_focus
        ImGui.same_line
        if ImGui.button("Cancel", ImVec2.new(120, 0))
          ImGui.close_current_popup
        end
        ImGui.end_popup
      end

      if ImGui.button("Stacked modals..")
        ImGui.open_popup("Stacked 1")
      end
      if ImGui.begin_popup_modal("Stacked 1", flags: ImGuiWindowFlags::MenuBar)
        if ImGui.begin_menu_bar
          if ImGui.begin_menu("File")
            if ImGui.menu_item("Some menu item")
            end
            ImGui.end_menu
          end
          ImGui.end_menu_bar
        end
        ImGui.text("Hello from Stacked The First\nUsing style.Colors[ImGuiCol_ModalWindowDimBg] behind it.")

        static item = 1
        static color = Slice[0.4f32, 0.7f32, 0.0f32, 0.5f32]
        ImGui.combo("Combo", pointerof(item.val), "aaaa\0bbbb\0cccc\0dddd\0eeee\0\0")
        ImGui.color_edit4("color", color.val)

        if ImGui.button("Add another modal..")
          ImGui.open_popup("Stacked 2")
        end

        unused_open = true
        if ImGui.begin_popup_modal("Stacked 2", pointerof(unused_open))
          ImGui.text("Hello from Stacked The Second!")
          if ImGui.button("Close")
            ImGui.close_current_popup
          end
          ImGui.end_popup
        end

        if ImGui.button("Close")
          ImGui.close_current_popup
        end
        ImGui.end_popup
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Menus inside a regular window")
      ImGui.text_wrapped("Below we are testing adding menu items to a regular window. It's rather unusual but should work!")
      ImGui.separator

      ImGui.push_id("foo")
      ImGui.menu_item("Menu item", "CTRL+M")
      if ImGui.begin_menu("Menu inside a regular window")
        show_example_menu_file
        ImGui.end_menu
      end
      ImGui.pop_id
      ImGui.separator
      ImGui.tree_pop
    end
  end

  def self.show_demo_window_columns
    if !ImGui.collapsing_header("Columns")
      return
    end

    ImGui.push_id("Columns")

    static disable_indent = false
    ImGui.checkbox("Disable tree indentation", pointerof(disable_indent.val))
    ImGui.same_line
    help_marker("Disable the indenting of tree nodes so demo columns can use the full window width.")
    if disable_indent.val
      ImGui.push_style_var(ImGuiStyleVar::IndentSpacing, 0.0f32)
    end

    if ImGui.tree_node("Basic")
      ImGui.text("Without border:")
      ImGui.columns(3, "mycolumns3", false)
      ImGui.separator
      14.times do |n|
        label = sprintf("Item %d", n)
        if ImGui.selectable(label)
        end

        ImGui.next_column
      end
      ImGui.columns(1)
      ImGui.separator

      ImGui.text("With border:")
      ImGui.columns(4, "mycolumns")
      ImGui.separator
      ImGui.text("ID")
      ImGui.next_column
      ImGui.text("Name")
      ImGui.next_column
      ImGui.text("Path")
      ImGui.next_column
      ImGui.text("Hovered")
      ImGui.next_column
      ImGui.separator
      names = ["One", "Two", "Three"]
      paths = ["/path/one", "/path/two", "/path/three"]
      static selected = -1
      3.times do |i|
        label = sprintf("%04d", i)
        if ImGui.selectable(label, selected.val == i, ImGuiSelectableFlags::SpanAllColumns)
          selected.val = i
        end
        hovered = ImGui.is_item_hovered
        ImGui.next_column
        ImGui.text(names[i])
        ImGui.next_column
        ImGui.text(paths[i])
        ImGui.next_column
        ImGui.text("%d", hovered)
        ImGui.next_column
      end
      ImGui.columns(1)
      ImGui.separator
      ImGui.tree_pop
    end

    if ImGui.tree_node("Borders")
      static h_borders = true
      static v_borders = true
      static columns_count = 4
      lines_count = 3
      ImGui.set_next_item_width(ImGui.get_font_size * 8)
      ImGui.drag_int("##columns_count", pointerof(columns_count.val), 0.1f32, 2, 10, "%d columns")
      if columns_count.val < 2
        columns_count.val = 2
      end
      ImGui.same_line
      ImGui.checkbox("horizontal", pointerof(h_borders.val))
      ImGui.same_line
      ImGui.checkbox("vertical", pointerof(v_borders.val))
      ImGui.columns(columns_count.val, nil, v_borders.val)
      (columns_count.val * lines_count).times do |i|
        if h_borders.val && ImGui.get_column_index == 0
          ImGui.separator
        end
        ImGui.text("%c%c%c", 'a' + i, 'a' + i, 'a' + i)
        ImGui.text("Width %.2f", ImGui.get_column_width)
        ImGui.text("Avail %.2f", ImGui.get_content_region_avail.x)
        ImGui.text("Offset %.2f", ImGui.get_column_offset)
        ImGui.text("Long text that is likely to clip")
        ImGui.button("Button", ImVec2.new(-Float32::MIN_POSITIVE, 0.0f32))
        ImGui.next_column
      end
      ImGui.columns(1)
      if h_borders.val
        ImGui.separator
      end
      ImGui.tree_pop
    end

    if ImGui.tree_node("Mixed items")
      ImGui.columns(3, "mixed")
      ImGui.separator

      ImGui.text("Hello")
      ImGui.button("Banana")
      ImGui.next_column

      ImGui.text("ImGui")
      ImGui.button("Apple")
      static foo = 1.0f32
      ImGui.input_float("red", pointerof(foo.val), 0.05f32, 0, "%.3f")
      ImGui.text("An extra line here.")
      ImGui.next_column

      ImGui.text("Sailor")
      ImGui.button("Corniflower")
      static bar = 1.0f32
      ImGui.input_float("blue", pointerof(bar.val), 0.05f32, 0, "%.3f")
      ImGui.next_column

      if ImGui.collapsing_header("Category A")
        ImGui.text("Blah blah blah")
      end
      ImGui.next_column
      if ImGui.collapsing_header("Category B")
        ImGui.text("Blah blah blah")
      end
      ImGui.next_column
      if ImGui.collapsing_header("Category C")
        ImGui.text("Blah blah blah")
      end
      ImGui.next_column
      ImGui.columns(1)
      ImGui.separator
      ImGui.tree_pop
    end

    if ImGui.tree_node("Word-wrapping")
      ImGui.columns(2, "word-wrapping")
      ImGui.separator
      ImGui.text_wrapped("The quick brown fox jumps over the lazy dog.")
      ImGui.text_wrapped("Hello Left")
      ImGui.next_column
      ImGui.text_wrapped("The quick brown fox jumps over the lazy dog.")
      ImGui.text_wrapped("Hello Right")
      ImGui.columns(1)
      ImGui.separator
      ImGui.tree_pop
    end
    if ImGui.tree_node("Horizontal Scrolling")
      ImGui.set_next_window_content_size(ImVec2.new(1500.0f32, 0.0f32))
      child_size = ImVec2.new(0, ImGui.get_font_size * 20.0f32)
      ImGui.begin_child("##ScrollingRegion", child_size, false, ImGuiWindowFlags::HorizontalScrollbar)
      ImGui.columns(10)
      items_count = 2000
      clipper = ImGuiListClipper.new(items_count)
      while clipper.step
        (clipper.display_start...clipper.display_end).each do |i|
          10.times do |j|
            ImGui.text("Line %d Column %d...", i, j)
            ImGui.next_column
          end
        end
      end
      ImGui.columns(1)
      ImGui.end_child
      ImGui.tree_pop
    end

    if ImGui.tree_node("Tree")
      ImGui.columns(2, "tree", true)
      3.times do |x|
        open1 = ImGui.tree_node(x.to_s, "Node%d", x)
        ImGui.next_column
        ImGui.text("Node contents")
        ImGui.next_column
        if open1
          3.times do |y|
            open2 = ImGui.tree_node(y.to_s, "Node%d.%d", x, y)
            ImGui.next_column
            ImGui.text("Node contents")
            if open2
              ImGui.text("Even more contents")
              if ImGui.tree_node("Tree in column")
                ImGui.text("The quick brown fox jumps over the lazy dog")
                ImGui.tree_pop
              end
            end
            ImGui.next_column
            if open2
              ImGui.tree_pop
            end
          end
          ImGui.tree_pop
        end
      end
      ImGui.columns(1)
      ImGui.tree_pop
    end

    if disable_indent.val
      ImGui.pop_style_var
    end
    ImGui.pop_id
  end

  def self.show_demo_window_misc
    if ImGui.collapsing_header("Filtering")
      static filter = ImGuiTextFilter.new
      ImGui.text("Filter usage:\n" +
                 "  \"\"         display all lines\n" +
                 "  \"xxx\"      display lines containing \"xxx\"\n" +
                 "  \"xxx,yyy\"  display lines containing \"xxx\" or \"yyy\"\n" +
                 "  \"-xxx\"     hide lines containing \"xxx\"")
      filter.val.draw
      lines = ["aaa1.c", "bbb1.c", "ccc1.c", "aaa2.cpp", "bbb2.cpp", "ccc2.cpp", "abc.h", "hello, world"]
      lines.each do |line|
        if filter.val.pass_filter(line)
          ImGui.bullet_text("%s", line)
        end
      end
    end

    if ImGui.collapsing_header("Inputs, Navigation & Focus")
      io = ImGui.get_io

      ImGui.text("WantCaptureMouse: %d", io.want_capture_mouse)
      ImGui.text("WantCaptureKeyboard: %d", io.want_capture_keyboard)
      ImGui.text("WantTextInput: %d", io.want_text_input)
      ImGui.text("WantSetMousePos: %d", io.want_set_mouse_pos)
      ImGui.text("NavActive: %d, NavVisible: %d", io.nav_active, io.nav_visible)

      if ImGui.tree_node("Keyboard, Mouse & Navigation State")
        if ImGui.is_mouse_pos_valid
          ImGui.text("Mouse pos: (%g, %g)", io.mouse_pos.x, io.mouse_pos.y)
        else
          ImGui.text("Mouse pos: <INVALID>")
        end
        ImGui.text("Mouse delta: (%g, %g)", io.mouse_delta.x, io.mouse_delta.y)
        ImGui.text("Mouse down:")
        io.mouse_down.size.times do |i|
          if io.mouse_down_duration[i] >= 0.0f32
            ImGui.same_line
            ImGui.text("b%d (%.02f secs)", i, io.mouse_down_duration[i])
          end
        end
        ImGui.text("Mouse clicked:")
        io.mouse_down.size.times do |i|
          if ImGui.is_mouse_clicked(ImGuiMouseButton.new(i))
            ImGui.same_line
            ImGui.text("b%d", i)
          end
        end
        ImGui.text("Mouse dblclick:")
        io.mouse_down.size.times do |i|
          if ImGui.is_mouse_double_clicked(ImGuiMouseButton.new(i))
            ImGui.same_line
            ImGui.text("b%d", i)
          end
        end
        ImGui.text("Mouse released:")
        io.mouse_down.size.times do |i|
          if ImGui.is_mouse_released(ImGuiMouseButton.new(i))
            ImGui.same_line
            ImGui.text("b%d", i)
          end
        end
        ImGui.text("Mouse wheel: %.1f", io.mouse_wheel)

        ImGui.text("Keys down:")
        io.keys_down.size.times do |i|
          if io.keys_down_duration[i] >= 0.0f32
            ImGui.same_line
            ImGui.text("%d (0x%X) (%.02f secs)", i, i, io.keys_down_duration[i])
          end
        end
        ImGui.text("Keys pressed:")
        io.keys_down.size.times do |i|
          if ImGui.is_key_pressed(i)
            ImGui.same_line
            ImGui.text("%d (0x%X)", i, i)
          end
        end
        ImGui.text("Keys release:")
        io.keys_down.size.times do |i|
          if ImGui.is_key_released(i)
            ImGui.same_line
            ImGui.text("%d (0x%X)", i, i)
          end
        end
        ImGui.text("Keys mods: %s%s%s%s", io.key_ctrl ? "CTRL " : "", io.key_shift ? "SHIFT " : "", io.key_alt ? "ALT " : "", io.key_super ? "SUPER " : "")
        ImGui.text("Chars queue:")
        io.input_queue_characters.size.times do |i|
          c = io.input_queue_characters[i]
          ImGui.same_line
          ImGui.text("'%c' (0x%04X)", (c > ' ' && c.ord <= 255) ? c : '?', c)
        end

        ImGui.text("NavInputs down:")
        io.nav_inputs.size.times do |i|
          if io.nav_inputs[i] > 0.0f32
            ImGui.same_line
            ImGui.text("[%d] %.2f", i, io.nav_inputs[i])
          end
        end
        ImGui.text("NavInputs pressed:")
        io.nav_inputs.size.times do |i|
          if io.nav_inputs_down_duration[i] == 0.0f32
            ImGui.same_line
            ImGui.text("[%d]", i)
          end
        end
        ImGui.text("NavInputs duration:")
        io.nav_inputs.size.times do |i|
          if io.nav_inputs_down_duration[i] >= 0.0f32
            ImGui.same_line
            ImGui.text("[%d] %.2f", i, io.nav_inputs_down_duration[i])
          end
        end

        ImGui.button("Hovering me sets the\nkeyboard capture flag")
        if ImGui.is_item_hovered
          ImGui.capture_keyboard_from_app(true)
        end
        ImGui.same_line
        ImGui.button("Holding me clears the\nthe keyboard capture flag")
        if ImGui.is_item_active
          ImGui.capture_keyboard_from_app(false)
        end

        ImGui.tree_pop
      end

      if ImGui.tree_node("Tabbing")
        ImGui.text("Use TAB/SHIFT+TAB to cycle through keyboard editable fields.")
        static buf = ImGui::TextBuffer.new("hello", 32)
        ImGui.input_text("1", buf.val)
        ImGui.input_text("2", buf.val)
        ImGui.input_text("3", buf.val)
        ImGui.push_allow_keyboard_focus(false)
        ImGui.input_text("4 (tab skip)", buf.val)

        ImGui.pop_allow_keyboard_focus
        ImGui.input_text("5", buf.val)
        ImGui.tree_pop
      end

      if ImGui.tree_node("Focus from code")
        focus_1 = ImGui.button("Focus on 1")
        ImGui.same_line
        focus_2 = ImGui.button("Focus on 2")
        ImGui.same_line
        focus_3 = ImGui.button("Focus on 3")
        has_focus = 0
        static buf = ImGui::TextBuffer.new("click on a button to set focus", 128)

        if focus_1
          ImGui.set_keyboard_focus_here
        end
        ImGui.input_text("1", buf.val)
        if ImGui.is_item_active
          has_focus = 1
        end

        if focus_2
          ImGui.set_keyboard_focus_here
        end
        ImGui.input_text("2", buf.val)
        if ImGui.is_item_active
          has_focus = 2
        end

        ImGui.push_allow_keyboard_focus(false)
        if focus_3
          ImGui.set_keyboard_focus_here
        end
        ImGui.input_text("3 (tab skip)", buf.val)
        if ImGui.is_item_active
          has_focus = 3
        end
        ImGui.pop_allow_keyboard_focus

        if has_focus
          ImGui.text("Item with focus: %d", has_focus)
        else
          ImGui.text("Item with focus: <none>")
        end

        static f3 = Slice[0.0f32, 0.0f32, 0.0f32]
        focus_ahead = -1
        if ImGui.button("Focus on X")
          focus_ahead = 0
        end
        ImGui.same_line
        if ImGui.button("Focus on Y")
          focus_ahead = 1
        end
        ImGui.same_line
        if ImGui.button("Focus on Z")
          focus_ahead = 2
        end
        if focus_ahead != -1
          ImGui.set_keyboard_focus_here(focus_ahead)
        end
        ImGui.slider_float3("Float3", f3.val, 0.0f32, 1.0f32)

        ImGui.text_wrapped("NB: Cursor & selection are preserved when refocusing last used item in code.")
        ImGui.tree_pop
      end

      if ImGui.tree_node("Dragging")
        ImGui.text_wrapped("You can use ImGui::GetMouseDragDelta(0) to query for the dragged amount on any widget.")
        3.times do |button|
          button = ImGuiMouseButton.new(button)
          ImGui.text("IsMouseDragging(%d):", button)
          ImGui.text("  w/ default threshold: %d,", ImGui.is_mouse_dragging(button))
          ImGui.text("  w/ zero threshold: %d,", ImGui.is_mouse_dragging(button, 0.0f32))
          ImGui.text("  w/ large threshold: %d,", ImGui.is_mouse_dragging(button, 20.0f32))
        end

        ImGui.button("Drag Me")
        if ImGui.is_item_active
          ImGui.get_foreground_draw_list.add_line(io.mouse_clicked_pos[0], io.mouse_pos, ImGui.get_color_u32(ImGuiCol::Button), 4.0f32)
        end

        value_raw = ImGui.get_mouse_drag_delta(ImGuiMouseButton::Left, 0.0f32)
        value_with_lock_threshold = ImGui.get_mouse_drag_delta(ImGuiMouseButton::Left)
        mouse_delta = io.mouse_delta
        ImGui.text("GetMouseDragDelta(0):")
        ImGui.text("  w/ default threshold: (%.1f, %.1f)", value_with_lock_threshold.x, value_with_lock_threshold.y)
        ImGui.text("  w/ zero threshold: (%.1f, %.1f)", value_raw.x, value_raw.y)
        ImGui.text("io.MouseDelta: (%.1f, %.1f)", mouse_delta.x, mouse_delta.y)
        ImGui.tree_pop
      end

      if ImGui.tree_node("Mouse cursors")
        current = ImGui.get_mouse_cursor
        ImGui.text("Current mouse cursor = %d: %s", current.to_i, current.to_s)
        ImGui.text("Hover to see mouse cursors:")
        ImGui.same_line
        help_marker(
          "Your application can render a different mouse cursor based on what ImGui::GetMouseCursor() returns. " +
          "If software cursor rendering (io.MouseDrawCursor) is set ImGui will draw the right cursor for you, " +
          "otherwise your backend needs to handle it.")
        ImGuiMouseCursor.each do |cur|
          next if cur == ImGuiMouseCursor::None
          label = sprintf("Mouse cursor %d: %s", cur.to_i, cur)
          ImGui.bullet
          ImGui.selectable(label, false)
          if ImGui.is_item_hovered || ImGui.is_item_focused
            ImGui.set_mouse_cursor(cur)
          end
        end
        ImGui.tree_pop
      end
    end
  end

  ImGui.pointer_wrapper def self.show_about_window(p_open = Pointer(Bool).null)
    if !ImGui.begin("About Dear ImGui", p_open, ImGuiWindowFlags::AlwaysAutoResize)
      ImGui.end
      return
    end
    ImGui.text("Dear ImGui %s", ImGui.get_version)
    ImGui.separator
    ImGui.text("By Omar Cornut and all Dear ImGui contributors.")
    ImGui.text("Dear ImGui is licensed under the MIT License, see LICENSE for more information.")

    static show_config_info = false
    ImGui.checkbox("Config/Build Information", pointerof(show_config_info.val))
    if show_config_info.val
      io = ImGui.get_io
      style = ImGui.get_style

      copy_to_clipboard = ImGui.button("Copy to clipboard")
      child_size = ImVec2.new(0, ImGui.get_text_line_height_with_spacing * 18)
      ImGui.begin_child_frame(ImGui.get_id("cfg_infos"), child_size, ImGuiWindowFlags::NoMove)
      if copy_to_clipboard
        ImGui.log_to_clipboard
        ImGui.log_text("```\n")
      end

      ImGui.text("Dear ImGui %s", ImGui.get_version)
      ImGui.separator
      ImGui.text("sizeof(size_t): %d, sizeof(ImDrawIdx): %d, sizeof(ImDrawVert): %d", sizeof(LibC::SizeT), sizeof(ImGui::ImDrawIdx), sizeof(ImDrawVert))
      ImGui.separator
      ImGui.text("io.BackendPlatformName: %s", io.backend_platform_name || "NULL")
      ImGui.text("io.BackendRendererName: %s", io.backend_renderer_name || "NULL")
      ImGui.text("io.ConfigFlags: 0x%08X", io.config_flags)
      if io.config_flags.includes? :NavEnableKeyboard
        ImGui.text(" NavEnableKeyboard")
      end
      if io.config_flags.includes? :NavEnableGamepad
        ImGui.text(" NavEnableGamepad")
      end
      if io.config_flags.includes? :NavEnableSetMousePos
        ImGui.text(" NavEnableSetMousePos")
      end
      if io.config_flags.includes? :NavNoCaptureKeyboard
        ImGui.text(" NavNoCaptureKeyboard")
      end
      if io.config_flags.includes? :NoMouse
        ImGui.text(" NoMouse")
      end
      if io.config_flags.includes? :NoMouseCursorChange
        ImGui.text(" NoMouseCursorChange")
      end
      if io.mouse_draw_cursor
        ImGui.text("io.MouseDrawCursor")
      end
      if io.config_mac_osx_behaviors
        ImGui.text("io.ConfigMacOSXBehaviors")
      end
      if io.config_input_text_cursor_blink
        ImGui.text("io.ConfigInputTextCursorBlink")
      end
      if io.config_windows_resize_from_edges
        ImGui.text("io.ConfigWindowsResizeFromEdges")
      end
      if io.config_windows_move_from_title_bar_only
        ImGui.text("io.ConfigWindowsMoveFromTitleBarOnly")
      end
      if io.config_windows_memory_compact_timer >= 0.0f32
        ImGui.text("io.ConfigWindowsMemoryCompactTimer = %.1ff", io.config_windows_memory_compact_timer)
      end
      ImGui.text("io.BackendFlags: 0x%08X", io.backend_flags)
      if io.backend_flags.includes? :HasGamepad
        ImGui.text(" HasGamepad")
      end
      if io.backend_flags.includes? :HasMouseCursors
        ImGui.text(" HasMouseCursors")
      end
      if io.backend_flags.includes? :HasSetMousePos
        ImGui.text(" HasSetMousePos")
      end
      if io.backend_flags.includes? :RendererHasVtxOffset
        ImGui.text(" RendererHasVtxOffset")
      end
      ImGui.separator
      ImGui.text("io.Fonts: %d fonts, Flags: 0x%08X, TexSize: %d,%d", io.fonts.fonts.size, io.fonts.flags, io.fonts.tex_width, io.fonts.tex_height)
      ImGui.text("io.DisplaySize: %.2f,%.2f", io.display_size.x, io.display_size.y)
      ImGui.text("io.DisplayFramebufferScale: %.2f,%.2f", io.display_framebuffer_scale.x, io.display_framebuffer_scale.y)
      ImGui.separator
      ImGui.text("style.WindowPadding: %.2f,%.2f", style.window_padding.x, style.window_padding.y)
      ImGui.text("style.WindowBorderSize: %.2f", style.window_border_size)
      ImGui.text("style.FramePadding: %.2f,%.2f", style.frame_padding.x, style.frame_padding.y)
      ImGui.text("style.FrameRounding: %.2f", style.frame_rounding)
      ImGui.text("style.FrameBorderSize: %.2f", style.frame_border_size)
      ImGui.text("style.ItemSpacing: %.2f,%.2f", style.item_spacing.x, style.item_spacing.y)
      ImGui.text("style.ItemInnerSpacing: %.2f,%.2f", style.item_inner_spacing.x, style.item_inner_spacing.y)

      if copy_to_clipboard
        ImGui.log_text("\n```\n")
        ImGui.log_finish
      end
      ImGui.end_child_frame
    end
    ImGui.end
  end

  def self.show_style_selector(label)
    static style_idx = -1
    if ImGui.combo(label, pointerof(style_idx.val), "Classic\0Dark\0Light\0")
      case style_idx.val
      when 0
        ImGui.style_colors_classic
      when 1
        ImGui.style_colors_dark
      when 2
        ImGui.style_colors_light
      end
      return true
    end
    return false
  end

  def self.show_font_selector(label)
    io = ImGui.get_io
    font_current = ImGui.get_font
    if ImGui.begin_combo(label, font_current.get_debug_name)
      io.fonts.fonts.size.times do |n|
        font = io.fonts.fonts[n]
        ImGui.push_id(font)
        if ImGui.selectable(font.get_debug_name, font == font_current)
          io.font_default = font
        end
        ImGui.pop_id
      end
      ImGui.end_combo
    end
    ImGui.same_line
    help_marker(
      "- Load additional fonts with io.Fonts->AddFontFromFileTTF().\n" +
      "- The font atlas is built when calling io.Fonts->GetTexDataAsXXXX() or io.Fonts->Build().\n" +
      "- Read FAQ and docs/FONTS.md for more details.\n" +
      "- If you need to add/remove fonts at runtime (e.g. for DPI change), do it before calling NewFrame().")
  end

  def self.node_font(font)
    io = ImGui.get_io
    style = ImGui.get_style
    font_details_opened = ImGui.tree_node(font, "Font: \"%s\"\n%.2f px, %d glyphs, %d file(s)",
      font.config_data ? font.config_data[0].name : "", font.font_size, font.glyphs.size, font.config_data_count)
    ImGui.same_line
    if ImGui.small_button("Set as default")
      io.font_default = font
    end
    if !font_details_opened
      return
    end

    ImGui.push_font(font)
    ImGui.text("The quick brown fox jumps over the lazy dog")
    ImGui.pop_font
    ImGui.drag_float("Font scale", pointerof(font.scale), 0.005f32, 0.3f32, 2.0f32, "%.1f")
    ImGui.same_line
    help_marker(
      "Note than the default embedded font is NOT meant to be scaled.\n\n" +
      "Font are currently rendered into bitmaps at a given size at the time of building the atlas. " +
      "You may oversample them to get some flexibility with scaling. " +
      "You can also render at multiple sizes and select which one to use at runtime.\n\n" +
      "(Glimmer of hope: the atlas system will be rewritten in the future to make scaling more flexible.)")
    ImGui.input_float("Font offset", pointerof(font.display_offset.y), 1, 1, "%.0f")
    ImGui.text("Ascent: %f, Descent: %f, Height: %f", font.ascent, font.descent, font.ascent - font.descent)
    ImGui.text("Fallback character: '%c' (U+%04X)", font.fallback_char, font.fallback_char)
    ImGui.text("Ellipsis character: '%c' (U+%04X)", font.ellipsis_char, font.ellipsis_char)
    surface_sqrt = Math.sqrt(font.metrics_total_surface).to_i
    ImGui.text("Texture Area: about %d px ~%dx%d px", font.metrics_total_surface, surface_sqrt, surface_sqrt)
    font.config_data_count.times do |config_i|
      if font.config_data
        if cfg = font.config_data[config_i]
          ImGui.bullet_text("Input %d: '%s', Oversample: (%d,%d), PixelSnapH: %d",
            config_i, cfg.name, cfg.oversample_h, cfg.oversample_v, cfg.pixel_snap_h)
        end
      end
    end
    if ImGui.tree_node("Glyphs", "Glyphs (%d)", font.glyphs.size)
      glyph_col = ImGui.get_color_u32(ImGuiCol::Text)
      (0u32..Char::MAX_CODEPOINT).step(256) do |base|
        if (base & 4095) == 0 && font.is_glyph_range_unused(base, base + 4095)
          base += 4096 - 256
          next
        end

        count = 0
        256.times do |n|
          if font.find_glyph_no_fallback((base + n).chr)
            count += 1
          end
        end
        if count <= 0
          next
        end
        if !ImGui.tree_node(base.to_s, "U+%04X..u+%04X (%d %s)", base, base + 255, count, count > 1 ? "glyphs" : "glyph")
          next
        end
        cell_size = font.font_size * 1
        cell_spacing = style.item_spacing.y
        base_pos = ImGui.get_cursor_screen_pos
        draw_list = ImGui.get_window_draw_list
        256.times do |n|
          cell_p1 = ImVec2.new(base_pos.x + (n % 16) * (cell_size + cell_spacing), base_pos.y + (n // 16) * (cell_size + cell_spacing))
          cell_p2 = ImVec2.new(cell_p1.x + cell_size, cell_p1.y + cell_size)
          glyph = font.find_glyph_no_fallback((base + n).chr)
          draw_list.add_rect(cell_p1, cell_p2, glyph ? ImGui.col32(255, 255, 255, 100) : ImGui.col32(255, 255, 255, 50))
          if glyph
            font.render_char(draw_list, cell_size, cell_p1, glyph_col, (base + n).chr)
          end
          if glyph && ImGui.is_mouse_hovering_rect(cell_p1, cell_p2)
            ImGui.begin_tooltip
            ImGui.text("Codepoint: U+%04X", base + n)
            ImGui.separator
            ImGui.text("Visible: %d", glyph.visible)
            ImGui.text("AdvanceX: %.1f", glyph.advance_x)
            ImGui.text("Pos: (%.2f,%.2f)->(%.2f,%.2f)", glyph.x0, glyph.y0, glyph.x1, glyph.y1)
            ImGui.text("UV: (%.3f,%.3f)->(%.3f,%.3f)", glyph.u0, glyph.v0, glyph.u1, glyph.v1)
            ImGui.end_tooltip
          end
        end
        ImGui.dummy(ImVec2.new((cell_size + cell_spacing) * 16, (cell_size + cell_spacing) * 16))
        ImGui.tree_pop
      end
      ImGui.tree_pop
    end
    ImGui.tree_pop
  end

  def self.show_style_editor(ref = nil)
    style = ImGui.get_style
    static ref_saved_style = ImGuiStyle.new

    static init = true
    if init.val && ref == nil
      ref_saved_style.val = style
    end
    init.val = false
    ref ||= ref_saved_style.val

    ImGui.push_item_width(ImGui.get_window_width * 0.50f32)

    if show_style_selector("Colors##Selector")
      ref_saved_style.val = style
    end
    show_font_selector("Fonts##Selector")

    if ImGui.slider_float("FrameRounding", pointerof(style.frame_rounding), 0.0f32, 12.0f32, "%.0f")
      style.grab_rounding = style.frame_rounding
    end
    begin
      border = (style.window_border_size > 0.0f32)
      if ImGui.checkbox("WindowBorder", pointerof(border))
        style.window_border_size = border ? 1.0f32 : 0.0f32
      end
    end
    ImGui.same_line
    begin
      border = (style.frame_border_size > 0.0f32)
      if ImGui.checkbox("FrameBorder", pointerof(border))
        style.frame_border_size = border ? 1.0f32 : 0.0f32
      end
    end
    ImGui.same_line
    begin
      border = (style.popup_border_size > 0.0f32)
      if ImGui.checkbox("PopupBorder", pointerof(border))
        style.popup_border_size = border ? 1.0f32 : 0.0f32
      end
    end

    if ImGui.button("Save Ref")
      ref_saved_style.val = style
    end
    ImGui.same_line
    if ImGui.button("Revert Ref")
      style = ref
    end
    ImGui.same_line
    help_marker(
      "Save/Revert in local non-persistent storage. Default Colors definition are not affected. " +
      "Use \"Export\" below to save them somewhere.")

    ImGui.separator

    if ImGui.begin_tab_bar("##tabs", ImGuiTabBarFlags::None)
      if ImGui.begin_tab_item("Sizes")
        ImGui.text("Main")
        ImGui.slider_float2("WindowPadding", pointerof(style.window_padding), 0.0f32, 20.0f32, "%.0f")
        ImGui.slider_float2("FramePadding", pointerof(style.frame_padding), 0.0f32, 20.0f32, "%.0f")
        ImGui.slider_float2("ItemSpacing", pointerof(style.item_spacing), 0.0f32, 20.0f32, "%.0f")
        ImGui.slider_float2("ItemInnerSpacing", pointerof(style.item_inner_spacing), 0.0f32, 20.0f32, "%.0f")
        ImGui.slider_float2("TouchExtraPadding", pointerof(style.touch_extra_padding), 0.0f32, 10.0f32, "%.0f")
        ImGui.slider_float("IndentSpacing", pointerof(style.indent_spacing), 0.0f32, 30.0f32, "%.0f")
        ImGui.slider_float("ScrollbarSize", pointerof(style.scrollbar_size), 1.0f32, 20.0f32, "%.0f")
        ImGui.slider_float("GrabMinSize", pointerof(style.grab_min_size), 1.0f32, 20.0f32, "%.0f")
        ImGui.text("Borders")
        ImGui.slider_float("WindowBorderSize", pointerof(style.window_border_size), 0.0f32, 1.0f32, "%.0f")
        ImGui.slider_float("ChildBorderSize", pointerof(style.child_border_size), 0.0f32, 1.0f32, "%.0f")
        ImGui.slider_float("PopupBorderSize", pointerof(style.popup_border_size), 0.0f32, 1.0f32, "%.0f")
        ImGui.slider_float("FrameBorderSize", pointerof(style.frame_border_size), 0.0f32, 1.0f32, "%.0f")
        ImGui.slider_float("TabBorderSize", pointerof(style.tab_border_size), 0.0f32, 1.0f32, "%.0f")
        ImGui.text("Rounding")
        ImGui.slider_float("WindowRounding", pointerof(style.window_rounding), 0.0f32, 12.0f32, "%.0f")
        ImGui.slider_float("ChildRounding", pointerof(style.child_rounding), 0.0f32, 12.0f32, "%.0f")
        ImGui.slider_float("FrameRounding", pointerof(style.frame_rounding), 0.0f32, 12.0f32, "%.0f")
        ImGui.slider_float("PopupRounding", pointerof(style.popup_rounding), 0.0f32, 12.0f32, "%.0f")
        ImGui.slider_float("ScrollbarRounding", pointerof(style.scrollbar_rounding), 0.0f32, 12.0f32, "%.0f")
        ImGui.slider_float("GrabRounding", pointerof(style.grab_rounding), 0.0f32, 12.0f32, "%.0f")
        ImGui.slider_float("LogSliderDeadzone", pointerof(style.log_slider_deadzone), 0.0f32, 12.0f32, "%.0f")
        ImGui.slider_float("TabRounding", pointerof(style.tab_rounding), 0.0f32, 12.0f32, "%.0f")
        ImGui.text("Alignment")
        ImGui.slider_float2("WindowTitleAlign", pointerof(style.window_title_align), 0.0f32, 1.0f32, "%.2f")
        window_menu_button_position = style.window_menu_button_position.to_i + 1
        if ImGui.combo("WindowMenuButtonPosition", pointerof(window_menu_button_position), "None\0Left\0Right\0")
          style.window_menu_button_position = ImGuiDir.new(window_menu_button_position - 1)
        end
        color_button_position = style.color_button_position.to_i
        if ImGui.combo("ColorButtonPosition", pointerof(color_button_position), "Left\0Right\0")
          style.color_button_position = ImGuiDir.new(color_button_position)
        end
        ImGui.slider_float2("ButtonTextAlign", pointerof(style.button_text_align), 0.0f32, 1.0f32, "%.2f")
        ImGui.same_line
        help_marker("Alignment applies when a button is larger than its text content.")
        ImGui.slider_float2("SelectableTextAlign", pointerof(style.selectable_text_align), 0.0f32, 1.0f32, "%.2f")
        ImGui.same_line
        help_marker("Alignment applies when a selectable is larger than its text content.")
        ImGui.text("Safe Area Padding")
        ImGui.same_line
        help_marker("Adjust if you cannot see the edges of your screen (e.g. on a TV where scaling has not been configured).")
        ImGui.slider_float2("DisplaySafeAreaPadding", pointerof(style.display_safe_area_padding), 0.0f32, 30.0f32, "%.0f")
        ImGui.end_tab_item
      end

      if ImGui.begin_tab_item("Colors")
        static output_dest = 0
        static output_only_modified = true
        if ImGui.button("Export")
          if output_dest.val == 0
            ImGui.log_to_clipboard
          else
            ImGui.log_to_tty
          end
          ImGui.log_text("ImVec4* colors = ImGui::GetStyle().Colors;\n")
          ImGuiCol.each do |col_i|
            i = col_i.to_i
            col = style.colors[i]
            name = ImGui.get_style_color_name(col_i)
            if !output_only_modified.val || col != ref.colors[i]
              ImGui.log_text("colors[ImGuiCol_%s]%*s= ImVec4(%.2ff, %.2ff, %.2ff, %.2ff);\n",
                name, 23 - name.size, "", col.x, col.y, col.z, col.w)
            end
          end
          ImGui.log_finish
        end
        ImGui.same_line
        ImGui.set_next_item_width(120)
        ImGui.combo("##output_type", pointerof(output_dest.val), "To Clipboard\0To TTY\0")
        ImGui.same_line
        ImGui.checkbox("Only Modified Colors", pointerof(output_only_modified.val))

        static filter = ImGuiTextFilter.new
        filter.val.draw("Filter colors", ImGui.get_font_size * 16)

        static alpha_flags = ImGuiColorEditFlags::None
        if ImGui.radio_button("Opaque", alpha_flags.val == ImGuiColorEditFlags::None)
          alpha_flags.val = ImGuiColorEditFlags::None
        end
        ImGui.same_line
        if ImGui.radio_button("Alpha", alpha_flags.val == ImGuiColorEditFlags::AlphaPreview)
          alpha_flags.val = ImGuiColorEditFlags::AlphaPreview
        end
        ImGui.same_line
        if ImGui.radio_button("Both", alpha_flags.val == ImGuiColorEditFlags::AlphaPreviewHalf)
          alpha_flags.val = ImGuiColorEditFlags::AlphaPreviewHalf
        end
        ImGui.same_line
        help_marker(
          "In the color list:\n" +
          "Left-click on colored square to open color picker,\n" +
          "Right-click to open edit options menu.")

        ImGui.begin_child("##colors", ImVec2.new(0, 0), true, ImGuiWindowFlags::AlwaysVerticalScrollbar | ImGuiWindowFlags::AlwaysHorizontalScrollbar | ImGuiWindowFlags::NavFlattened)
        ImGui.push_item_width(-160)
        ImGuiCol.each do |col_i|
          i = col_i.to_i
          name = ImGui.get_style_color_name(col_i)
          if !filter.val.pass_filter(name)
            next
          end
          ImGui.push_id(i)
          ImGui.color_edit4("##color", pointerof(style.colors[i]), ImGuiColorEditFlags::AlphaBar | alpha_flags.val)
          if style.colors[i] != ref.colors[i]
            ImGui.same_line(0.0f32, style.item_inner_spacing.x)
            if ImGui.button("Save")
              ref.colors[i] = style.colors[i]
            end
            ImGui.same_line(0.0f32, style.item_inner_spacing.x)
            if ImGui.button("Revert")
              style.colors[i] = ref.colors[i]
            end
          end
          ImGui.same_line(0.0f32, style.item_inner_spacing.x)
          ImGui.text_unformatted(name)
          ImGui.pop_id
        end
        ImGui.pop_item_width
        ImGui.end_child

        ImGui.end_tab_item
      end

      if ImGui.begin_tab_item("Fonts")
        io = ImGui.get_io
        atlas = io.fonts
        help_marker("Read FAQ and docs/FONTS.md for details on font loading.")
        ImGui.push_item_width(120)
        atlas.fonts.size.times do |i|
          font = atlas.fonts[i]
          ImGui.push_id(font)
          node_font(font)
          ImGui.pop_id
        end
        if ImGui.tree_node("Atlas texture", "Atlas texture (%dx%d pixels)", atlas.tex_width, atlas.tex_height)
          tint_col = ImVec4.new(1.0f32, 1.0f32, 1.0f32, 1.0f32)
          border_col = ImVec4.new(1.0f32, 1.0f32, 1.0f32, 0.5f32)
          ImGui.image(atlas.tex_id, ImVec2.new(atlas.tex_width, atlas.tex_height), ImVec2.new(0, 0), ImVec2.new(1, 1), tint_col, border_col)
          ImGui.tree_pop
        end

        min_scale = 0.3f32
        max_scale = 2.0f32
        help_marker(
          "Those are old settings provided for convenience.\n" +
          "However, the _correct_ way of scaling your UI is currently to reload your font at the designed size, " +
          "rebuild the font atlas, and call style.ScaleAllSizes() on a reference ImGuiStyle structure.\n" +
          "Using those settings here will give you poor quality results.")
        static window_scale = 1.0f32
        if ImGui.drag_float("window scale", pointerof(window_scale.val), 0.005f32, min_scale, max_scale, "%.2f", ImGuiSliderFlags::ClampOnInput)
          ImGui.set_window_font_scale(window_scale.val)
        end
        ImGui.drag_float("global scale", pointerof(io.font_global_scale), 0.005f32, min_scale, max_scale, "%.2f", ImGuiSliderFlags::ClampOnInput)
        ImGui.pop_item_width

        ImGui.end_tab_item
      end

      if ImGui.begin_tab_item("Rendering")
        ImGui.checkbox("Anti-aliased lines", pointerof(style.anti_aliased_lines))
        ImGui.same_line
        help_marker("When disabling anti-aliasing lines, you'll probably want to disable borders in your style as well.")
        ImGui.checkbox("Anti-aliased lines use texture", pointerof(style.anti_aliased_lines_use_tex))
        ImGui.same_line
        help_marker("Faster lines using texture data. Require back-end to render with bilinear filtering (not point/nearest filtering).")
        ImGui.checkbox("Anti-aliased fill", pointerof(style.anti_aliased_fill))
        ImGui.push_item_width(100)
        ImGui.drag_float("Curve Tessellation Tolerance", pointerof(style.curve_tessellation_tol), 0.02f32, 0.10f32, 10.0f32, "%.2f")
        if style.curve_tessellation_tol < 0.10f32
          style.curve_tessellation_tol = 0.10f32
        end

        ImGui.drag_float("Circle Segment Max Error", pointerof(style.circle_segment_max_error), 0.01f32, 0.10f32, 10.0f32, "%.2f")
        if ImGui.is_item_active
          ImGui.set_next_window_pos(ImGui.get_cursor_screen_pos)
          ImGui.begin_tooltip
          p = ImGui.get_cursor_screen_pos
          rad_min = 10.0f32
          rad_max = 80.0f32
          off_x = 10.0f32
          7.times do |n|
            rad = rad_min + (rad_max - rad_min) * n / (7.0f32 - 1.0f32)
            ImGui.get_window_draw_list.add_circle(ImVec2.new(p.x + off_x + rad, p.y + rad_max), rad, ImGui.get_color_u32(ImGuiCol::Text), 0)
            off_x += 10.0f32 + rad * 2.0f32
          end
          ImGui.dummy(ImVec2.new(off_x, rad_max * 2.0f32))
          ImGui.end_tooltip
        end
        ImGui.same_line
        help_marker("When drawing circle primitives with \"num_segments == 0\" tesselation will be calculated automatically.")

        ImGui.drag_float("Global Alpha", pointerof(style.alpha), 0.005f32, 0.20f32, 1.0f32, "%.2f")
        ImGui.pop_item_width

        ImGui.end_tab_item
      end

      ImGui.end_tab_bar
    end

    ImGui.pop_item_width
  end

  def self.show_example_app_main_menu_bar
    if ImGui.begin_main_menu_bar
      if ImGui.begin_menu("File")
        show_example_menu_file
        ImGui.end_menu
      end
      if ImGui.begin_menu("Edit")
        if ImGui.menu_item("Undo", "CTRL+Z")
        end
        if ImGui.menu_item("Redo", "CTRL+Y", false, false)
        end
        ImGui.separator
        if ImGui.menu_item("Cut", "CTRL+X")
        end
        if ImGui.menu_item("Copy", "CTRL+C")
        end
        if ImGui.menu_item("Paste", "CTRL+V")
        end
        ImGui.end_menu
      end
      ImGui.end_main_menu_bar
    end
  end

  def self.show_example_menu_file
    ImGui.menu_item("(demo menu)", nil, false, false)
    if ImGui.menu_item("New")
    end
    if ImGui.menu_item("Open", "Ctrl+O")
    end
    if ImGui.begin_menu("Open Recent")
      ImGui.menu_item("fish_hat.c")
      ImGui.menu_item("fish_hat.inl")
      ImGui.menu_item("fish_hat.h")
      if ImGui.begin_menu("More..")
        ImGui.menu_item("Hello")
        ImGui.menu_item("Sailor")
        if ImGui.begin_menu("Recurse..")
          show_example_menu_file
          ImGui.end_menu
        end
        ImGui.end_menu
      end
      ImGui.end_menu
    end
    if ImGui.menu_item("Save", "Ctrl+S")
    end
    if ImGui.menu_item("Save As..")
    end

    ImGui.separator
    if ImGui.begin_menu("Options")
      static enabled = true
      ImGui.menu_item("Enabled", "", pointerof(enabled.val))
      ImGui.begin_child("child", ImVec2.new(0, 60), true)
      10.times do |i|
        ImGui.text("Scrolling Text %d", i)
      end
      ImGui.end_child
      static f = 0.5f32
      static n = 0
      ImGui.slider_float("Value", pointerof(f.val), 0.0f32, 1.0f32)
      ImGui.input_float("Input", pointerof(f.val), 0.1f32)
      ImGui.combo("Combo", pointerof(n.val), "Yes\0No\0Maybe\0\0")
      ImGui.end_menu
    end

    if ImGui.begin_menu("Colors")
      sz = ImGui.get_text_line_height
      ImGuiCol.values.each do |col_i|
        name = ImGui.get_style_color_name(col_i)
        p = ImGui.get_cursor_screen_pos
        ImGui.get_window_draw_list.add_rect_filled(p, ImVec2.new(p.x + sz, p.y + sz), ImGui.get_color_u32(col_i))
        ImGui.dummy(ImVec2.new(sz, sz))
        ImGui.same_line
        ImGui.menu_item(name)
      end
      ImGui.end_menu
    end

    if ImGui.begin_menu("Options")
      static b = true
      ImGui.checkbox("SomeOption", pointerof(b.val))
      ImGui.end_menu
    end

    if ImGui.begin_menu("Disabled", false)
      assert(0)
    end
    if ImGui.menu_item("Checked", nil, true)
    end
    if ImGui.menu_item("Quit", "Alt+F4")
    end
  end

  class ExampleAppConsole
    def initialize
      @input_buf = ImGui::TextBuffer.new(256)
      @items = [] of String
      @history = [] of String
      @history_pos = -1
      @filter = ImGuiTextFilter.new
      @commands = ["HELP", "HISTORY", "CLEAR", "CLASSIFY"]
      @auto_scroll = true
      @scroll_to_bottom = false
      add_log("Welcome to Dear ImGui!")
    end

    def clear_log
      @items.clear
    end

    def add_log(fmt, *args)
      @items << sprintf(fmt, *args)
    end

    def draw(title, p_open)
      ImGui.set_next_window_size(ImVec2.new(520, 600), ImGuiCond::FirstUseEver)
      if !ImGui.begin(title, p_open)
        ImGui.end
        return
      end

      if ImGui.begin_popup_context_item
        if ImGui.menu_item("Close Console")
          p_open.value = false
        end
        ImGui.end_popup
      end

      ImGui.text_wrapped(
        "This example implements a console with basic coloring, completion and history. A more elaborate " +
        "implementation may want to store entries along with extra data such as timestamp, emitter, etc.")
      ImGui.text_wrapped("Enter 'HELP' for help, press TAB to use text completion.")

      if ImGui.small_button("Add Debug Text")
        add_log("%d some text", @items.size)
        add_log("some more text")
        add_log("display very important message here!")
      end
      ImGui.same_line
      if ImGui.small_button("Add Debug Error")
        add_log("[error] something went wrong")
      end
      ImGui.same_line
      if ImGui.small_button("Clear")
        clear_log
      end
      ImGui.same_line
      copy_to_clipboard = ImGui.small_button("Copy")

      ImGui.separator

      if ImGui.begin_popup("Options")
        ImGui.checkbox("Auto-scroll", pointerof(@auto_scroll))
        ImGui.end_popup
      end

      if ImGui.button("Options")
        ImGui.open_popup("Options")
      end
      ImGui.same_line
      @filter.draw("Filter (\"incl,-excl\") (\"error\")", 180)
      ImGui.separator

      footer_height_to_reserve = ImGui.get_style.item_spacing.y + ImGui.get_frame_height_with_spacing
      ImGui.begin_child("ScrollingRegion", ImVec2.new(0, -footer_height_to_reserve), false, ImGuiWindowFlags::HorizontalScrollbar)
      if ImGui.begin_popup_context_window
        if ImGui.selectable("Clear")
          clear_log
        end
        ImGui.end_popup
      end
      ImGui.push_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(4, 1))
      if copy_to_clipboard
        ImGui.log_to_clipboard
      end
      @items.each do |item|
        if !@filter.pass_filter(item)
          next
        end

        color = nil
        if item.includes?("[error]")
          color = ImVec4.new(1.0f32, 0.4f32, 0.4f32, 1.0f32)
        elsif item.starts_with?("# ")
          color = ImVec4.new(1.0f32, 0.8f32, 0.6f32, 1.0f32)
        end
        if color
          ImGui.push_style_color(ImGuiCol::Text, color)
        end
        ImGui.text_unformatted(item)
        if color
          ImGui.pop_style_color
        end
      end
      if copy_to_clipboard
        ImGui.log_finish
      end

      if @scroll_to_bottom || (@auto_scroll && ImGui.get_scroll_y >= ImGui.get_scroll_max_y)
        ImGui.set_scroll_here_y(1.0f32)
      end
      @scroll_to_bottom = false

      ImGui.pop_style_var
      ImGui.end_child
      ImGui.separator

      reclaim_focus = false
      input_text_flags = ImGuiInputTextFlags::EnterReturnsTrue | ImGuiInputTextFlags::CallbackCompletion | ImGuiInputTextFlags::CallbackHistory
      if ImGui.input_text("Input", @input_buf, input_text_flags) { |data| text_edit_callback(data) }
        s = @input_buf.to_s.strip
        if !s.empty?
          exec_command(s)
        end
        @input_buf.clear
        reclaim_focus = true
      end

      ImGui.set_item_default_focus
      if reclaim_focus
        ImGui.set_keyboard_focus_here(-1)
      end

      ImGui.end
    end

    def exec_command(command_line)
      add_log("# %s\n", command_line)

      @history_pos = -1
      (@history.size - 1).downto(0) do |i|
        if @history[i].upcase == command_line.upcase
          @history.delete_at(i)
          break
        end
      end
      @history << command_line

      if command_line.upcase == "CLEAR"
        clear_log()
      elsif command_line.upcase == "HELP"
        add_log("Commands:")
        @commands.each do |cmd|
          add_log("- %s", cmd)
        end
      elsif command_line.upcase == "HISTORY"
        first = @history.size - 10
        ({first, 0}.max...@history.size).each do |i|
          add_log("%3d: %s\n", i, @history[i])
        end
      else
        add_log("Unknown command: '%s'\n", command_line)
      end

      @scroll_to_bottom = true
    end

    def text_edit_callback(data)
      case data.event_flag
      when ImGuiInputTextFlags::CallbackCompletion
        word_end = data.cursor_pos
        word_start = word_end
        while word_start > 0
          c = data.buf[word_start - 1]
          if c.chr.in?(' ', '\t', ',', ';')
            break
          end
          word_start -= 1
        end

        candidates = [] of String
        @commands.each do |cmd|
          n = (word_end - word_start).to_i
          if cmd[0, n].upcase == cmd[word_start, n].upcase
            candidates << cmd
          end
        end

        if candidates.size == 0
          add_log("No match for \"%s\"!\n", String.new(data.bytes[word_start...word_end]))
        elsif candidates.size == 1
          data.delete_chars(word_start, (word_end - word_start))
          data.insert_chars(data.cursor_pos, candidates[0])
          data.insert_chars(data.cursor_pos, " ")
        else
          match_len = (word_end - word_start).to_i
          loop do
            c = 0
            all_candidates_matches = true
            (0...candidates.size).each do |i|
              if i == 0
                c = candidates[i][match_len].upcase
              elsif c == 0 || c != candidates[i][match_len].upcase
                all_candidates_matches = false
              end
            end
            if !all_candidates_matches
              break
            end
            match_len += 1
          end

          if match_len > 0
            data.delete_chars(word_start, word_end - word_start)
            data.insert_chars(data.cursor_pos, candidates[0].to_slice[0, match_len])
          end

          add_log("Possible matches:\n")
          candidates.size.times do |i|
            add_log("- %s\n", candidates[i])
          end
        end
      when ImGuiInputTextFlags::CallbackHistory
        prev_history_pos = @history_pos
        if data.event_key == ImGuiKey::UpArrow
          if @history_pos == -1
            @history_pos = @history.size - 1
          elsif @history_pos > 0
            @history_pos -= 1
          end
        elsif data.event_key == ImGuiKey::DownArrow
          if @history_pos != -1
            if (@history_pos += 1) >= @history.size
              @history_pos = -1
            end
          end
        end

        if prev_history_pos != @history_pos
          history_str = (@history_pos >= 0) ? @history[@history_pos] : ""
          data.delete_chars(0, data.buf_text_len)
          data.insert_chars(0, history_str)
        end
      end
      return 0
    end
  end

  ImGui.pointer_wrapper def self.show_example_app_console(p_open = Pointer(Bool).null)
    static console = ExampleAppConsole.new
    console.val.draw("Example: Console", p_open)
  end

  class ExampleAppLog
    def initialize
      @buf = ImGui::TextBuffer.new
      @filter = ImGuiTextFilter.new
      @line_offsets = [0]
      @auto_scroll = true
    end

    def clear
      @buf.clear
      @line_offsets = [0]
    end

    def add_log(fmt, *args)
      old_size = @buf.bytesize
      @buf.printf(fmt, *args)
      (old_size...@buf.bytesize).each do |i|
        if @buf.to_slice[i] == '\n'.ord
          @line_offsets << (i + 1)
        end
      end
    end

    def draw(title, p_open = nil)
      if !ImGui.begin(title, p_open)
        ImGui.end
        return
      end

      if ImGui.begin_popup("Options")
        ImGui.checkbox("Auto-scroll", pointerof(@auto_scroll))
        ImGui.end_popup
      end

      if ImGui.button("Options")
        ImGui.open_popup("Options")
      end
      ImGui.same_line
      clear = ImGui.button("Clear")
      ImGui.same_line
      copy = ImGui.button("Copy")
      ImGui.same_line
      @filter.draw("Filter", -100.0f32)

      ImGui.separator
      ImGui.begin_child("scrolling", ImVec2.new(0, 0), false, ImGuiWindowFlags::HorizontalScrollbar)

      if clear
        clear
      end
      if copy
        ImGui.log_to_clipboard
      end

      ImGui.push_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(0, 0))
      buf = @buf.to_slice
      if @filter.is_active
        @line_offsets.size.times do |line_no|
          line_end = (line_no + 1 < @line_offsets.size) ? @line_offsets[line_no + 1] - 1 : nil
          line = buf[@line_offsets[line_no]...line_end]
          if @filter.pass_filter(line)
            ImGui.text_unformatted(line)
          end
        end
      else
        clipper = ImGuiListClipper.new
        clipper.begin(@line_offsets.size)
        while clipper.step
          (clipper.display_start...clipper.display_end).each do |line_no|
            line_end = (line_no + 1 < @line_offsets.size) ? @line_offsets[line_no + 1] - 1 : nil
            line = buf[@line_offsets[line_no]...line_end]
            ImGui.text_unformatted(line)
          end
        end
        clipper.end
      end
      ImGui.pop_style_var

      if @auto_scroll && ImGui.get_scroll_y >= ImGui.get_scroll_max_y
        ImGui.set_scroll_here_y(1.0f32)
      end

      ImGui.end_child
      ImGui.end
    end
  end

  ImGui.pointer_wrapper def self.show_example_app_log(p_open = Pointer(Bool).null)
    static log = ExampleAppLog.new

    ImGui.set_next_window_size(ImVec2.new(500, 400), ImGuiCond::FirstUseEver)
    ImGui.begin("Example: Log", p_open)
    if ImGui.small_button("[Debug] Add 5 entries")
      static counter = 0
      categories = ["info", "warn", "error"]
      words = ["Bumfuzzled", "Cattywampus", "Snickersnee", "Abibliophobia", "Absquatulate", "Nincompoop", "Pauciloquent"]
      5.times do |n|
        category = categories[counter.val % categories.size]
        word = words[counter.val % words.size]
        log.val.add_log("[%05d] [%s] Hello, current time is %.1f, here's a word: '%s'\n",
          ImGui.get_frame_count, category, ImGui.get_time, word)
        counter.val += 1
      end
    end
    ImGui.end

    log.val.draw("Example: Log", p_open)
  end

  ImGui.pointer_wrapper def self.show_example_app_layout(p_open = Pointer(Bool).null)
    ImGui.set_next_window_size(ImVec2.new(500, 440), ImGuiCond::FirstUseEver)
    if ImGui.begin("Example: Simple layout", p_open, ImGuiWindowFlags::MenuBar)
      if ImGui.begin_menu_bar
        if ImGui.begin_menu("File")
          if ImGui.menu_item("Close")
            p_open.value = false
          end
          ImGui.end_menu
        end
        ImGui.end_menu_bar
      end

      static selected = 0
      begin
        ImGui.begin_child("left pane", ImVec2.new(150, 0), true)
        100.times do |i|
          label = sprintf("MyObject %d", i)
          if ImGui.selectable(label, selected.val == i)
            selected.val = i
          end
        end
        ImGui.end_child
      end
      ImGui.same_line

      begin
        ImGui.begin_group
        ImGui.begin_child("item view", ImVec2.new(0, -ImGui.get_frame_height_with_spacing))
        ImGui.text("MyObject: %d", selected.val)
        ImGui.separator
        if ImGui.begin_tab_bar("##Tabs", ImGuiTabBarFlags::None)
          if ImGui.begin_tab_item("Description")
            ImGui.text_wrapped("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
            ImGui.end_tab_item
          end
          if ImGui.begin_tab_item("Details")
            ImGui.text("ID: 0123456789")
            ImGui.end_tab_item
          end
          ImGui.end_tab_bar
        end
        ImGui.end_child
        if ImGui.button("Revert")
        end
        ImGui.same_line
        if ImGui.button("Save")
        end
        ImGui.end_group
      end
    end
    ImGui.end
  end

  def self.show_placeholder_object(prefix, uid)
    ImGui.push_id(uid)
    ImGui.align_text_to_frame_padding
    node_open = ImGui.tree_node("Object", "%s_%u", prefix, uid)
    ImGui.next_column
    ImGui.align_text_to_frame_padding
    ImGui.text("my sailor is rich")
    ImGui.next_column
    if node_open
      static placeholder_members = [0.0f32, 0.0f32, 1.0f32, 3.1416f32, 100.0f32, 999.0f32, 0.0f32, 0.0f32]
      8.times do |i|
        ImGui.push_id(i)
        if i < 2
          show_placeholder_object("Child", 424242)
        else
          ImGui.align_text_to_frame_padding
          flags = ImGuiTreeNodeFlags::Leaf | ImGuiTreeNodeFlags::NoTreePushOnOpen | ImGuiTreeNodeFlags::Bullet
          ImGui.tree_node_ex("Field", flags, "Field_%d", i)
          ImGui.next_column
          ImGui.set_next_item_width(-1)
          if i >= 5
            ImGui.input_float("##value", pointerof(placeholder_members.val[i]), 1.0f32)
          else
            ImGui.drag_float("##value", pointerof(placeholder_members.val[i]), 0.01f32)
          end
          ImGui.next_column
        end
        ImGui.pop_id
      end
      ImGui.tree_pop
    end
    ImGui.pop_id
  end

  ImGui.pointer_wrapper def self.show_example_app_property_editor(p_open = Pointer(Bool).null)
    ImGui.set_next_window_size(ImVec2.new(430, 450), ImGuiCond::FirstUseEver)
    if !ImGui.begin("Example: Property editor", p_open)
      ImGui.end
      return
    end

    help_marker(
      "This example shows how you may implement a property editor using two columns.\n" +
      "All objects/fields data are dummies here.\n" +
      "Remember that in many simple cases, you can use ImGui::SameLine(xxx) to position\n" +
      "your cursor horizontally instead of using the Columns() API.")

    ImGui.push_style_var(ImGuiStyleVar::FramePadding, ImVec2.new(2, 2))
    ImGui.columns(2)
    ImGui.separator

    3.times do |obj_i|
      show_placeholder_object("Object", obj_i)
    end

    ImGui.columns(1)
    ImGui.separator
    ImGui.pop_style_var
    ImGui.end
  end

  ImGui.pointer_wrapper def self.show_example_app_long_text(p_open = Pointer(Bool).null)
    ImGui.set_next_window_size(ImVec2.new(520, 600), ImGuiCond::FirstUseEver)
    if !ImGui.begin("Example: Long text display", p_open)
      ImGui.end
      return
    end

    static test_type = 0
    static log = ImGui::TextBuffer.new
    static lines = 0
    ImGui.text("Printing unusually long amount of text.")
    ImGui.combo("Test type", pointerof(test_type.val),
      "Single call to TextUnformatted()\0" +
      "Multiple calls to Text(), clipped\0" +
      "Multiple calls to Text(), not clipped (slow)\0")
    ImGui.text("Buffer contents: %d lines, %d bytes", lines.val, log.val.bytesize)
    if ImGui.button("Clear")
      log.val.clear
      lines.val = 0
    end
    ImGui.same_line
    if ImGui.button("Add 1000 lines")
      1000.times do |i|
        log.val.printf("%i The quick brown fox jumps over the lazy dog\n", lines.val + i)
      end
      lines.val += 1000
    end
    ImGui.begin_child("Log")
    case test_type.val
    when 0
      ImGui.text_unformatted(log.val.to_slice)
    when 1
      ImGui.push_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(0, 0))
      clipper = ImGuiListClipper.new(lines.val)
      while clipper.step
        (clipper.display_start...clipper.display_end).each do |i|
          ImGui.text("%i The quick brown fox jumps over the lazy dog", i)
        end
      end
      ImGui.pop_style_var
    when 2
      ImGui.push_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(0, 0))
      lines.val.times do |i|
        ImGui.text("%i The quick brown fox jumps over the lazy dog", i)
      end
      ImGui.pop_style_var
    end
    ImGui.end_child
    ImGui.end
  end

  ImGui.pointer_wrapper def self.show_example_app_auto_resize(p_open = Pointer(Bool).null)
    if !ImGui.begin("Example: Auto-resizing window", p_open, ImGuiWindowFlags::AlwaysAutoResize)
      ImGui.end
      return
    end

    static lines = 10
    ImGui.text_unformatted(
      "Window will resize every-frame to the size of its content.\n" +
      "Note that you probably don't want to query the window size to\n" +
      "output your content because that would create a feedback loop.")
    ImGui.slider_int("Number of lines", pointerof(lines.val), 1, 20)
    lines.val.times do |i|
      ImGui.text("%*sThis is line %d", i * 4, "", i)
    end
    ImGui.end
  end

  ImGui.pointer_wrapper def self.show_example_app_constrained_resize(p_open = Pointer(Bool).null)
    square_constraint = ->(data : ImGuiSizeCallbackData) {
      size = {data.desired_size.x, data.desired_size.y}.max
      data.desired_size = ImVec2.new(size, size)
    }
    step = 100
    step_constraint = ->(data : ImGuiSizeCallbackData) {
      data.desired_size = ImVec2.new((data.desired_size.x / step + 0.5f32).to_i * step, (data.desired_size.y / step + 0.5f32).to_i * step)
    }

    test_desc = [
      "Resize vertical only",
      "Resize horizontal only",
      "Width > 100, Height > 100",
      "Width 400-500",
      "Height 400-500",
      "Custom: Always Square",
      "Custom: Fixed Steps (100)",
    ]

    static auto_resize = false
    static type = 0
    static display_lines = 10
    if type.val == 0
      ImGui.set_next_window_size_constraints(ImVec2.new(-1, 0), ImVec2.new(-1, Float32::MAX))
    end
    if type.val == 1
      ImGui.set_next_window_size_constraints(ImVec2.new(0, -1), ImVec2.new(Float32::MAX, -1))
    end
    if type.val == 2
      ImGui.set_next_window_size_constraints(ImVec2.new(100, 100), ImVec2.new(Float32::MAX, Float32::MAX))
    end
    if type.val == 3
      ImGui.set_next_window_size_constraints(ImVec2.new(400, -1), ImVec2.new(500, -1))
    end
    if type.val == 4
      ImGui.set_next_window_size_constraints(ImVec2.new(-1, 400), ImVec2.new(-1, 500))
    end
    if type.val == 5
      ImGui.set_next_window_size_constraints(ImVec2.new(0, 0), ImVec2.new(Float32::MAX, Float32::MAX), &square_constraint)
    end
    if type.val == 6
      ImGui.set_next_window_size_constraints(ImVec2.new(0, 0), ImVec2.new(Float32::MAX, Float32::MAX), &step_constraint)
    end

    flags = auto_resize.val ? ImGuiWindowFlags::AlwaysAutoResize : ImGuiWindowFlags::None
    if ImGui.begin("Example: Constrained Resize", p_open, flags)
      if ImGui.button("200x200")
        ImGui.set_window_size(ImVec2.new(200, 200))
      end
      ImGui.same_line
      if ImGui.button("500x500")
        ImGui.set_window_size(ImVec2.new(500, 500))
      end
      ImGui.same_line
      if ImGui.button("800x200")
        ImGui.set_window_size(ImVec2.new(800, 200))
      end
      ImGui.set_next_item_width(200)
      ImGui.combo("Constraint", pointerof(type.val), test_desc)
      ImGui.set_next_item_width(200)
      ImGui.drag_int("Lines", pointerof(display_lines.val), 0.2f32, 1, 100)
      ImGui.checkbox("Auto-resize", pointerof(auto_resize.val))
      display_lines.val.times do |i|
        ImGui.text("%*sHello, sailor! Making this line long enough for the example.", i * 4, "")
      end
    end
    ImGui.end
  end

  ImGui.pointer_wrapper def self.show_example_app_simple_overlay(p_open = Pointer(Bool).null)
    distance = 10.0f32
    static corner = 0
    io = ImGui.get_io
    if corner.val != -1
      window_pos = ImVec2.new((corner.val & 1) != 0 ? io.display_size.x - distance : distance, (corner.val & 2) != 0 ? io.display_size.y - distance : distance)
      window_pos_pivot = ImVec2.new((corner.val & 1) != 0 ? 1.0f32 : 0.0f32, (corner.val & 2) != 0 ? 1.0f32 : 0.0f32)
      ImGui.set_next_window_pos(window_pos, ImGuiCond::Always, window_pos_pivot)
    end
    ImGui.set_next_window_bg_alpha(0.35f32)
    window_flags = ImGuiWindowFlags::NoDecoration | ImGuiWindowFlags::AlwaysAutoResize | ImGuiWindowFlags::NoSavedSettings | ImGuiWindowFlags::NoFocusOnAppearing | ImGuiWindowFlags::NoNav
    if corner.val != -1
      window_flags |= ImGuiWindowFlags::NoMove
    end
    if ImGui.begin("Example: Simple overlay", p_open, window_flags)
      ImGui.text("Simple overlay\n" +
                 "in the corner of the screen.\n" +
                 "(right-click to change position)")
      ImGui.separator
      if ImGui.is_mouse_pos_valid
        ImGui.text("Mouse Position: (%.1f,%.1f)", io.mouse_pos.x, io.mouse_pos.y)
      else
        ImGui.text("Mouse Position: <invalid>")
      end
      if ImGui.begin_popup_context_window
        if ImGui.menu_item("Custom", nil, corner.val == -1)
          corner.val = -1
        end
        if ImGui.menu_item("Top-left", nil, corner.val == 0)
          corner.val = 0
        end
        if ImGui.menu_item("Top-right", nil, corner.val == 1)
          corner.val = 1
        end
        if ImGui.menu_item("Bottom-left", nil, corner.val == 2)
          corner.val = 2
        end
        if ImGui.menu_item("Bottom-right", nil, corner.val == 3)
          corner.val = 3
        end
        if p_open.value && ImGui.menu_item("Close")
          p_open.value = false
        end
        ImGui.end_popup
      end
    end
    ImGui.end
  end

  ImGui.pointer_wrapper def self.show_example_app_window_titles(p_open = Pointer(Bool).null)
    ImGui.set_next_window_pos(ImVec2.new(100, 100), ImGuiCond::FirstUseEver)
    ImGui.begin("Same title as another window##1")
    ImGui.text("This is window 1.\nMy title is the same as window 2, but my identifier is unique.")
    ImGui.end

    ImGui.set_next_window_pos(ImVec2.new(100, 200), ImGuiCond::FirstUseEver)
    ImGui.begin("Same title as another window##2")
    ImGui.text("This is window 2.\nMy title is the same as window 1, but my identifier is unique.")
    ImGui.end

    buf = sprintf("Animated title %c %d###AnimatedTitle", "|/-\\"[(ImGui.get_time / 0.25f32).to_i & 3], ImGui.get_frame_count)
    ImGui.set_next_window_pos(ImVec2.new(100, 300), ImGuiCond::FirstUseEver)
    ImGui.begin(buf)
    ImGui.text("This window has a changing title.")
    ImGui.end
  end

  ImGui.pointer_wrapper def self.show_example_app_custom_rendering(p_open = Pointer(Bool).null)
    if !ImGui.begin("Example: Custom rendering", p_open)
      ImGui.end
      return
    end

    if ImGui.begin_tab_bar("##TabBar")
      if ImGui.begin_tab_item("Primitives")
        ImGui.push_item_width(-ImGui.get_font_size * 10)
        draw_list = ImGui.get_window_draw_list

        ImGui.text("Gradients")
        gradient_size = ImVec2.new(ImGui.calc_item_width, ImGui.get_frame_height)
        begin
          p0 = ImGui.get_cursor_screen_pos
          p1 = ImVec2.new(p0.x + gradient_size.x, p0.y + gradient_size.y)
          col_a = ImGui.get_color_u32(ImGui.col32(0, 0, 0, 255))
          col_b = ImGui.get_color_u32(ImGui.col32(255, 255, 255, 255))
          draw_list.add_rect_filled_multi_color(p0, p1, col_a, col_b, col_b, col_a)
          ImGui.invisible_button("##gradient1", gradient_size)
        end
        begin
          p0 = ImGui.get_cursor_screen_pos
          p1 = ImVec2.new(p0.x + gradient_size.x, p0.y + gradient_size.y)
          col_a = ImGui.get_color_u32(ImGui.col32(0, 255, 0, 255))
          col_b = ImGui.get_color_u32(ImGui.col32(255, 0, 0, 255))
          draw_list.add_rect_filled_multi_color(p0, p1, col_a, col_b, col_b, col_a)
          ImGui.invisible_button("##gradient2", gradient_size)
        end

        ImGui.text("All primitives")
        static sz = 36.0f32
        static thickness = 3.0f32
        static ngon_sides = 6
        static circle_segments_override = false
        static circle_segments_override_v = 12
        static colf = ImVec4.new(1.0f32, 1.0f32, 0.4f32, 1.0f32)
        ImGui.drag_float("Size", pointerof(sz.val), 0.2f32, 2.0f32, 72.0f32, "%.0f")
        ImGui.drag_float("Thickness", pointerof(thickness.val), 0.05f32, 1.0f32, 8.0f32, "%.02f")
        ImGui.slider_int("N-gon sides", pointerof(ngon_sides.val), 3, 12)
        ImGui.checkbox("##circlesegmentoverride", pointerof(circle_segments_override.val))
        ImGui.same_line(0.0f32, ImGui.get_style.item_inner_spacing.x)
        if ImGui.slider_int("Circle segments", pointerof(circle_segments_override_v.val), 3, 40)
          circle_segments_override.val = true
        end
        ImGui.color_edit4("Color", pointerof(colf.val))

        p = ImGui.get_cursor_screen_pos
        col = ImGui.color_convert_float4_to_u32(colf.val)
        spacing = 10.0f32
        corners_none = ImDrawCornerFlags::None
        corners_all = ImDrawCornerFlags::All
        corners_tl_br = ImDrawCornerFlags::TopLeft | ImDrawCornerFlags::BotRight
        circle_segments = circle_segments_override.val ? circle_segments_override_v.val : 0
        x = p.x + 4.0f32
        y = p.y + 4.0f32
        2.times do |n|
          th = (n == 0) ? 1.0f32 : thickness.val
          draw_list.add_ngon(ImVec2.new(x + sz.val * 0.5f32, y + sz.val * 0.5f32), sz.val * 0.5f32, col, ngon_sides.val, th)
          x += sz.val + spacing
          draw_list.add_circle(ImVec2.new(x + sz.val * 0.5f32, y + sz.val * 0.5f32), sz.val * 0.5f32, col, circle_segments, th)
          x += sz.val + spacing
          draw_list.add_rect(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), col, 0.0f32, corners_none, th)
          x += sz.val + spacing
          draw_list.add_rect(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), col, 10.0f32, corners_all, th)
          x += sz.val + spacing
          draw_list.add_rect(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), col, 10.0f32, corners_tl_br, th)
          x += sz.val + spacing
          draw_list.add_triangle(ImVec2.new(x + sz.val * 0.5f32, y), ImVec2.new(x + sz.val, y + sz.val - 0.5f32), ImVec2.new(x, y + sz.val - 0.5f32), col, th)
          x += sz.val + spacing

          draw_list.add_line(ImVec2.new(x, y), ImVec2.new(x + sz.val, y), col, th)
          x += sz.val + spacing
          draw_list.add_line(ImVec2.new(x, y), ImVec2.new(x, y + sz.val), col, th)
          x += spacing
          draw_list.add_line(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), col, th)
          x += sz.val + spacing
          draw_list.add_bezier_curve(ImVec2.new(x, y), ImVec2.new(x + sz.val * 1.3f32, y + sz.val * 0.3f32), ImVec2.new(x + sz.val - sz.val * 1.3f32, y + sz.val - sz.val * 0.3f32), ImVec2.new(x + sz.val, y + sz.val), col, th)
          x = p.x + 4
          y += sz.val + spacing
        end
        draw_list.add_ngon_filled(ImVec2.new(x + sz.val * 0.5f32, y + sz.val * 0.5f32), sz.val * 0.5f32, col, ngon_sides.val)
        x += sz.val + spacing
        draw_list.add_circle_filled(ImVec2.new(x + sz.val * 0.5f32, y + sz.val * 0.5f32), sz.val * 0.5f32, col, circle_segments)
        x += sz.val + spacing
        draw_list.add_rect_filled(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), col)
        x += sz.val + spacing
        draw_list.add_rect_filled(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), col, 10.0f32)
        x += sz.val + spacing
        draw_list.add_rect_filled(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), col, 10.0f32, corners_tl_br)
        x += sz.val + spacing
        draw_list.add_triangle_filled(ImVec2.new(x + sz.val * 0.5f32, y), ImVec2.new(x + sz.val, y + sz.val - 0.5f32), ImVec2.new(x, y + sz.val - 0.5f32), col)
        x += sz.val + spacing

        draw_list.add_rect_filled(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + thickness.val), col)
        x += sz.val + spacing
        draw_list.add_rect_filled(ImVec2.new(x, y), ImVec2.new(x + thickness.val, y + sz.val), col)
        x += spacing * 2.0f32
        draw_list.add_rect_filled(ImVec2.new(x, y), ImVec2.new(x + 1, y + 1), col)
        x += sz.val
        draw_list.add_rect_filled_multi_color(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), ImGui.col32(0, 0, 0, 255), ImGui.col32(255, 0, 0, 255), ImGui.col32(255, 255, 0, 255), ImGui.col32(0, 255, 0, 255))

        ImGui.dummy(ImVec2.new((sz.val + spacing) * 8.8f32, (sz.val + spacing) * 3.0f32))
        ImGui.pop_item_width
        ImGui.end_tab_item
      end

      if ImGui.begin_tab_item("Canvas")
        static points = [] of ImVec2
        static scrolling = ImVec2.new(0.0f32, 0.0f32)
        static opt_enable_grid = true
        static opt_enable_context_menu = true
        static adding_line = false

        ImGui.checkbox("Enable grid", pointerof(opt_enable_grid.val))
        ImGui.checkbox("Enable context menu", pointerof(opt_enable_context_menu.val))
        ImGui.text("Mouse Left: drag to add lines,\nMouse Right: drag to scroll, click for context menu.")
        canvas_p0 = ImGui.get_cursor_screen_pos
        canvas_sz = ImGui.get_content_region_avail
        if canvas_sz.x < 50.0f32
          canvas_sz.x = 50.0f32
        end
        if canvas_sz.y < 50.0f32
          canvas_sz.y = 50.0f32
        end
        canvas_p1 = ImVec2.new(canvas_p0.x + canvas_sz.x, canvas_p0.y + canvas_sz.y)

        io = ImGui.get_io
        draw_list = ImGui.get_window_draw_list
        draw_list.add_rect_filled(canvas_p0, canvas_p1, ImGui.col32(50, 50, 50, 255))
        draw_list.add_rect(canvas_p0, canvas_p1, ImGui.col32(255, 255, 255, 255))

        ImGui.invisible_button("canvas", canvas_sz, ImGuiButtonFlags::MouseButtonLeft | ImGuiButtonFlags::MouseButtonRight)
        is_hovered = ImGui.is_item_hovered
        is_active = ImGui.is_item_active
        origin = ImVec2.new(canvas_p0.x + scrolling.val.x, canvas_p0.y + scrolling.val.y)
        mouse_pos_in_canvas = ImVec2.new(io.mouse_pos.x - origin.x, io.mouse_pos.y - origin.y)

        if is_hovered && !adding_line.val && ImGui.is_mouse_clicked(ImGuiMouseButton::Left)
          points.val.push(mouse_pos_in_canvas)
          points.val.push(mouse_pos_in_canvas)
          adding_line.val = true
        end
        if adding_line.val
          points.val[-1] = mouse_pos_in_canvas
          if !ImGui.is_mouse_down(ImGuiMouseButton::Left)
            adding_line.val = false
          end
        end

        mouse_threshold_for_pan = opt_enable_context_menu.val ? -1.0f32 : 0.0f32
        if is_active && ImGui.is_mouse_dragging(ImGuiMouseButton::Right, mouse_threshold_for_pan)
          scrolling.val = ImVec2.new(scrolling.val.x + io.mouse_delta.x, scrolling.val.y + io.mouse_delta.y)
        end

        drag_delta = ImGui.get_mouse_drag_delta(ImGuiMouseButton::Right)
        if opt_enable_context_menu.val && ImGui.is_mouse_released(ImGuiMouseButton::Right) && drag_delta.x == 0.0f32 && drag_delta.y == 0.0f32
          ImGui.open_popup_context_item("context")
        end
        if ImGui.begin_popup("context")
          if adding_line.val
            points.val.pop(2)
          end
          adding_line.val = false
          if ImGui.menu_item("Remove one", nil, false, points.val.size > 0)
            points.val.pop(2)
          end
          if ImGui.menu_item("Remove all", nil, false, points.val.size > 0)
            points.val.clear
          end
          ImGui.end_popup
        end

        draw_list.push_clip_rect(canvas_p0, canvas_p1, true)
        if opt_enable_grid.val
          grid_step = 64.0f32
          x = scrolling.val.x % grid_step
          while x < canvas_sz.x
            draw_list.add_line(ImVec2.new(canvas_p0.x + x, canvas_p0.y), ImVec2.new(canvas_p0.x + x, canvas_p1.y), ImGui.col32(200, 200, 200, 40))
            x += grid_step
          end
          y = scrolling.val.y % grid_step
          while y < canvas_sz.y
            draw_list.add_line(ImVec2.new(canvas_p0.x, canvas_p0.y + y), ImVec2.new(canvas_p1.x, canvas_p0.y + y), ImGui.col32(200, 200, 200, 40))
            y += grid_step
          end
        end
        (0...points.val.size).step(2) do |n|
          draw_list.add_line(ImVec2.new(origin.x + points.val[n].x, origin.y + points.val[n].y), ImVec2.new(origin.x + points.val[n + 1].x, origin.y + points.val[n + 1].y), ImGui.col32(255, 255, 0, 255), 2.0f32)
        end
        draw_list.pop_clip_rect

        ImGui.end_tab_item
      end

      if ImGui.begin_tab_item("BG/FG draw lists")
        static draw_bg = true
        static draw_fg = true
        ImGui.checkbox("Draw in Background draw list", pointerof(draw_bg.val))
        ImGui.same_line
        help_marker("The Background draw list will be rendered below every Dear ImGui windows.")
        ImGui.checkbox("Draw in Foreground draw list", pointerof(draw_fg.val))
        ImGui.same_line
        help_marker("The Foreground draw list will be rendered over every Dear ImGui windows.")
        window_pos = ImGui.get_window_pos
        window_size = ImGui.get_window_size
        window_center = ImVec2.new(window_pos.x + window_size.x * 0.5f32, window_pos.y + window_size.y * 0.5f32)
        if draw_bg.val
          ImGui.get_background_draw_list.add_circle(window_center, window_size.x * 0.6f32, ImGui.col32(255, 0, 0, 200), 0, 10f32 + 4)
        end
        if draw_fg.val
          ImGui.get_foreground_draw_list.add_circle(window_center, window_size.y * 0.6f32, ImGui.col32(0, 255, 0, 200), 0, 10f32)
        end
        ImGui.end_tab_item
      end

      ImGui.end_tab_bar
    end

    ImGui.end
  end

  class MyDocument
    getter name
    property? open
    property? open_prev
    property? dirty
    property? want_close
    property color

    def initialize(@name : String, @open = true, @color = ImVec4.new(1.0f32, 1.0f32, 1.0f32, 1.0f32))
      @open_prev = open
      @dirty = false
      @want_close = false
    end

    def do_open
      @open = true
    end

    def do_queue_close
      @want_close = true
    end

    def do_force_close
      @open = false
      @dirty = false
    end

    def do_save
      @dirty = false
    end

    def self.display_contents(doc)
      ImGui.push_id(doc)
      ImGui.text("Document \"%s\"", doc.name)
      ImGui.push_style_color(ImGuiCol::Text, doc.color)
      ImGui.text_wrapped("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
      ImGui.pop_style_color
      if ImGui.button("Modify", ImVec2.new(100, 0))
        doc.dirty = true
      end
      ImGui.same_line
      if ImGui.button("Save", ImVec2.new(100, 0))
        doc.do_save
      end
      ImGui.color_edit3("color", pointerof(doc.color))
      ImGui.pop_id
    end

    def self.display_context_menu(doc)
      if !ImGui.begin_popup_context_item
        return
      end

      buf = sprintf("Save %s", doc.name)
      if ImGui.menu_item(buf, "CTRL+S", false, doc.open?)
        doc.do_save
      end
      if ImGui.menu_item("Close", "CTRL+W", false, doc.open?)
        doc.do_queue_close
      end
      ImGui.end_popup
    end
  end

  class ExampleAppDocuments
    property documents

    def initialize
      @documents = [
        MyDocument.new("Lettuce", true, ImVec4.new(0.4f32, 0.8f32, 0.4f32, 1.0f32)),
        MyDocument.new("Eggplant", true, ImVec4.new(0.8f32, 0.5f32, 1.0f32, 1.0f32)),
        MyDocument.new("Carrot", true, ImVec4.new(1.0f32, 0.8f32, 0.5f32, 1.0f32)),
        MyDocument.new("Tomato", false, ImVec4.new(1.0f32, 0.3f32, 0.4f32, 1.0f32)),
        MyDocument.new("A Rather Long Title", false),
        MyDocument.new("Some Document", false),
      ]
    end
  end

  def self.notify_of_documents_closed_elsewhere(app)
    app.documents.size.times do |doc_n|
      doc = app.documents[doc_n]
      if !doc.open? && doc.open_prev?
        ImGui.set_tab_item_closed(doc.name)
      end
      doc.open_prev = doc.open?
    end
  end

  ImGui.pointer_wrapper def self.show_example_app_documents(p_open = Pointer(Bool).null)
    static app = ExampleAppDocuments.new

    static opt_reorderable = true
    static opt_fitting_flags = ImGuiTabBarFlags::FittingPolicyDefault_

    window_contents_visible = ImGui.begin("Example: Documents", p_open, ImGuiWindowFlags::MenuBar)
    if !window_contents_visible
      ImGui.end
      return
    end

    if ImGui.begin_menu_bar
      if ImGui.begin_menu("File")
        open_count = 0
        app.val.documents.size.times do |doc_n|
          open_count += app.val.documents[doc_n].open? ? 1 : 0
        end

        if ImGui.begin_menu("Open", open_count < app.val.documents.size)
          app.val.documents.size.times do |doc_n|
            doc = app.val.documents[doc_n]
            if !doc.open?
              if ImGui.menu_item(doc.name)
                doc.do_open
              end
            end
          end
          ImGui.end_menu
        end
        if ImGui.menu_item("Close All Documents", nil, false, open_count > 0)
          app.val.documents.size.times do |doc_n|
            app.val.documents[doc_n].do_queue_close
          end
        end
        if ImGui.menu_item("Exit", "Alt+F4")
        end
        ImGui.end_menu
      end
      ImGui.end_menu_bar
    end

    app.val.documents.size.times do |doc_n|
      doc = app.val.documents[doc_n]
      if doc_n > 0
        ImGui.same_line
      end
      ImGui.push_id(doc)
      if ImGui.checkbox(doc.name, pointerof(doc.open?))
        if !doc.open?
          doc.do_force_close
        end
      end
      ImGui.pop_id
    end

    ImGui.separator

    begin
      tab_bar_flags = (opt_fitting_flags.val) | (opt_reorderable.val ? ImGuiTabBarFlags::Reorderable : ImGuiTabBarFlags::None)
      if ImGui.begin_tab_bar("##tabs", tab_bar_flags)
        if opt_reorderable.val
          notify_of_documents_closed_elsewhere(app.val)
        end

        app.val.documents.size.times do |doc_n|
          doc = app.val.documents[doc_n]
          if !doc.open?
            next
          end

          tab_flags = (doc.dirty? ? ImGuiTabItemFlags::UnsavedDocument : ImGuiTabItemFlags::None)
          visible = ImGui.begin_tab_item(doc.name, pointerof(doc.open?), tab_flags)

          if !doc.open? && doc.dirty?
            doc.open = true
            doc.do_queue_close
          end

          MyDocument.display_context_menu(doc)
          if visible
            MyDocument.display_contents(doc)
            ImGui.end_tab_item
          end
        end

        ImGui.end_tab_bar
      end
    end

    static close_queue = [] of MyDocument
    if close_queue.val.empty?
      app.val.documents.size.times do |doc_n|
        doc = app.val.documents[doc_n]
        if doc.want_close?
          doc.want_close = false
          close_queue.val << doc
        end
      end
    end

    if !close_queue.val.empty?
      close_queue_unsaved_documents = 0
      close_queue.val.size.times do |n|
        if close_queue.val[n].dirty?
          close_queue_unsaved_documents += 1
        end
      end

      if close_queue_unsaved_documents == 0
        close_queue.val.size.times do |n|
          close_queue.val[n].do_force_close
        end
        close_queue.val.clear
      else
        if !ImGui.is_popup_open("Save?")
          ImGui.open_popup("Save?")
        end
        if ImGui.begin_popup_modal("Save?")
          ImGui.text("Save change to the following items?")
          ImGui.set_next_item_width(-1.0f32)
          if ImGui.list_box_header("##", close_queue_unsaved_documents, 6)
            close_queue.val.size.times do |n|
              if close_queue.val[n].dirty?
                ImGui.text("%s", close_queue.val[n].name)
              end
            end
            ImGui.list_box_footer
          end

          if ImGui.button("Yes", ImVec2.new(80, 0))
            close_queue.val.size.times do |n|
              if close_queue.val[n].dirty?
                close_queue.val[n].do_save
              end
              close_queue.val[n].do_force_close
            end
            close_queue.val.clear
            ImGui.close_current_popup
          end
          ImGui.same_line
          if ImGui.button("No", ImVec2.new(80, 0))
            close_queue.val.size.times do |n|
              close_queue.val[n].do_force_close
            end
            close_queue.val.clear
            ImGui.close_current_popup
          end
          ImGui.same_line
          if ImGui.button("Cancel", ImVec2.new(80, 0))
            close_queue.val.clear
            ImGui.close_current_popup
          end
          ImGui.end_popup
        end
      end
    end

    ImGui.end
  end
end
