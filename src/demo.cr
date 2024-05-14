# Based on https://github.com/ocornut/imgui/blob/v1.90.2/imgui_demo.cpp

require "./imgui"
require "./util"

module ImGuiDemo
  include ImGui::TopLevel

  def self.help_marker(desc)
    ImGui.text_disabled("(?)")
    if ImGui.begin_item_tooltip
      ImGui.with_text_wrap_pos(ImGui.get_font_size * 35.0f32) do
        ImGui.text_unformatted(desc)
      end
      ImGui.end_tooltip
    end
  end

  def self.demo_marker(section)
  end

  ImGui.pointer_wrapper def self.show_demo_window(p_open = Pointer(Bool).null)
    assert(ImGui.get_current_context != nil && "Missing Dear ImGui context. Refer to examples app!")

    static show_app_main_menu_bar = false
    static show_app_console = false
    static show_app_custom_rendering = false
    static show_app_documents = false
    static show_app_log = false
    static show_app_layout = false
    static show_app_property_editor = false
    static show_app_simple_overlay = false
    static show_app_auto_resize = false
    static show_app_constrained_resize = false
    static show_app_fullscreen = false
    static show_app_long_text = false
    static show_app_window_titles = false

    if show_app_main_menu_bar.val
      show_example_app_main_menu_bar
    end
    if show_app_documents.val
      show_example_app_documents(pointerof(show_app_documents.val))
    end
    if show_app_console.val
      show_example_app_console(pointerof(show_app_console.val))
    end
    if show_app_custom_rendering.val
      show_example_app_custom_rendering(pointerof(show_app_custom_rendering.val))
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
    if show_app_simple_overlay.val
      show_example_app_simple_overlay(pointerof(show_app_simple_overlay.val))
    end
    if show_app_auto_resize.val
      show_example_app_auto_resize(pointerof(show_app_auto_resize.val))
    end
    if show_app_constrained_resize.val
      show_example_app_constrained_resize(pointerof(show_app_constrained_resize.val))
    end
    if show_app_fullscreen.val
      show_example_app_fullscreen(pointerof(show_app_fullscreen.val))
    end
    if show_app_long_text.val
      show_example_app_long_text(pointerof(show_app_long_text.val))
    end
    if show_app_window_titles.val
      show_example_app_window_titles(pointerof(show_app_window_titles.val))
    end

    static show_tool_metrics = false
    static show_tool_debug_log = false
    static show_tool_id_stack_tool = false
    static show_tool_style_editor = false
    static show_tool_about = false

    if show_tool_metrics.val
      ImGui.show_metrics_window(pointerof(show_tool_metrics.val))
    end
    if show_tool_debug_log.val
      ImGui.show_debug_log_window(pointerof(show_tool_debug_log.val))
    end
    if show_tool_id_stack_tool.val
      ImGui.show_id_stack_tool_window(pointerof(show_tool_id_stack_tool.val))
    end
    if show_tool_style_editor.val
      ImGui.window("crystal-imgui Style Editor", pointerof(show_tool_style_editor.val)) do
        show_style_editor
      end
    end
    if show_tool_about.val
      show_about_window(pointerof(show_tool_about.val))
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
    static unsaved_document = false

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
    if unsaved_document.val
      window_flags |= ImGuiWindowFlags::UnsavedDocument
    end
    if no_close.val
      p_open = Pointer(Bool).null
    end

    main_viewport = ImGui.get_main_viewport
    ImGui.set_next_window_pos(ImVec2.new(20, main_viewport.work_pos.y + 20), ImGuiCond::FirstUseEver)
    ImGui.set_next_window_size(ImVec2.new(550, 680), ImGuiCond::FirstUseEver)

    if !ImGui.begin("crystal-imgui Demo", p_open, window_flags)
      ImGui.end
      return
    end

    ImGui.with_item_width(ImGui.get_font_size * -12) do
      ImGui.menu_bar do
        ImGui.menu("Menu") do
          demo_marker("Menu/File")
          show_example_menu_file
        end
        ImGui.menu("Examples") do
          demo_marker("Menu/Examples")
          ImGui.menu_item("Main menu bar", "", pointerof(show_app_main_menu_bar.val))

          ImGui.separator_text("Mini apps")
          ImGui.menu_item("Console", "", pointerof(show_app_console.val))
          ImGui.menu_item("Custom rendering", "", pointerof(show_app_custom_rendering.val))
          ImGui.menu_item("Documents", "", pointerof(show_app_documents.val))
          ImGui.menu_item("Log", "", pointerof(show_app_log.val))
          ImGui.menu_item("Property editor", "", pointerof(show_app_property_editor.val))
          ImGui.menu_item("Simple layout", "", pointerof(show_app_layout.val))
          ImGui.menu_item("Simple overlay", "", pointerof(show_app_simple_overlay.val))

          ImGui.separator_text("Concepts")
          ImGui.menu_item("Auto-resizing window", "", pointerof(show_app_auto_resize.val))
          ImGui.menu_item("Constrained-resizing window", "", pointerof(show_app_constrained_resize.val))
          ImGui.menu_item("Fullscreen window", "", pointerof(show_app_fullscreen.val))
          ImGui.menu_item("Long text display", "", pointerof(show_app_long_text.val))
          ImGui.menu_item("Manipulating window titles", "", pointerof(show_app_window_titles.val))
        end

        ImGui.menu("Tools") do
          demo_marker("Menu/Tools")
          has_debug_tools = true
          ImGui.menu_item("Metrics/Debugger", "", pointerof(show_tool_metrics.val), has_debug_tools)
          ImGui.menu_item("Debug Log", "", pointerof(show_tool_debug_log.val), has_debug_tools)
          ImGui.menu_item("ID Stack Tool", "", pointerof(show_tool_id_stack_tool.val), has_debug_tools)
          ImGui.menu_item("Style Editor", "", pointerof(show_tool_style_editor.val))
          ImGui.menu_item("About Dear ImGui", "", pointerof(show_tool_about.val))
        end
      end

      ImGui.text("dear imgui says hello! (%s) (%d)", ImGui::VERSION, ImGui::VERSION_NUM)
      ImGui.spacing

      demo_marker("Help")
      if ImGui.collapsing_header("Help")
        ImGui.separator_text("ABOUT THIS DEMO:")
        ImGui.bullet_text("Sections below are demonstrating many aspects of the library.")
        ImGui.bullet_text("The \"Examples\" menu above leads to more demo contents.")
        ImGui.bullet_text("The \"Tools\" menu above gives access to: About Box, Style Editor,\n" +
                          "and Metrics/Debugger (general purpose Dear ImGui debugging tool).")

        ImGui.separator_text("PROGRAMMER GUIDE:")
        ImGui.bullet_text("See the ShowDemoWindow() code in src/demo.cr. <- you are here!")
        ImGui.bullet_text("See comments in imgui.cpp.")
        ImGui.bullet_text("See example applications in the examples/ folder.")
        ImGui.bullet_text("Read the FAQ at https://www.dearimgui.com/faq/")
        ImGui.bullet_text("Set 'io.ConfigFlags |= NavEnableKeyboard' for keyboard controls.")
        ImGui.bullet_text("Set 'io.ConfigFlags |= NavEnableGamepad' for gamepad controls.")

        ImGui.separator_text("USER GUIDE:")
        show_user_guide
      end

      demo_marker("Configuration")
      if ImGui.collapsing_header("Configuration")
        io = ImGui.get_io

        ImGui.tree_node("Configuration##2") do
          ImGui.separator_text("General")
          ImGui.checkbox_flags("io.ConfigFlags: NavEnableKeyboard", pointerof(io.config_flags), ImGuiConfigFlags::NavEnableKeyboard)
          ImGui.same_line
          help_marker("Enable keyboard controls.")
          ImGui.checkbox_flags("io.ConfigFlags: NavEnableGamepad", pointerof(io.config_flags), ImGuiConfigFlags::NavEnableGamepad)
          ImGui.same_line
          help_marker("Enable gamepad controls. Require backend to set io.BackendFlags |= ImGuiBackendFlags_HasGamepad.\n\nRead instructions in imgui.cpp for details.")
          ImGui.checkbox_flags("io.ConfigFlags: NavEnableSetMousePos", pointerof(io.config_flags), ImGuiConfigFlags::NavEnableSetMousePos)
          ImGui.same_line
          help_marker("Instruct navigation to move the mouse cursor. See comment for ImGuiConfigFlags_NavEnableSetMousePos.")
          ImGui.checkbox_flags("io.ConfigFlags: NoMouse", pointerof(io.config_flags), ImGuiConfigFlags::NoMouse)
          if io.config_flags.includes?(:NoMouse)
            if ImGui.get_time % 0.40f32 < 0.20f32
              ImGui.same_line
              ImGui.text("<<PRESS SPACE TO DISABLE>>")
            end
            if ImGui.is_key_pressed(ImGuiKey::Space)
              io.config_flags &= ~ImGuiConfigFlags::NoMouse
            end
          end
          ImGui.checkbox_flags("io.ConfigFlags: NoMouseCursorChange", pointerof(io.config_flags), ImGuiConfigFlags::NoMouseCursorChange)
          ImGui.same_line
          help_marker("Instruct backend to not alter mouse cursor shape and visibility.")
          ImGui.checkbox("io.ConfigInputTrickleEventQueue", pointerof(io.config_input_trickle_event_queue))
          ImGui.same_line
          help_marker("Enable input queue trickling: some types of events submitted during the same frame (e.g. button down + up) will be spread over multiple frames, improving interactions with low framerates.")
          ImGui.checkbox("io.MouseDrawCursor", pointerof(io.mouse_draw_cursor))
          ImGui.same_line
          help_marker("Instruct Dear ImGui to render a mouse cursor itself. Note that a mouse cursor rendered via your application GPU rendering path will feel more laggy than hardware cursor, but will be more in sync with your other visuals.\n\nSome desktop applications may use both kinds of cursors (e.g. enable software cursor only when resizing/dragging something).")

          ImGui.separator_text("Widgets")
          ImGui.checkbox("io.ConfigInputTextCursorBlink", pointerof(io.config_input_text_cursor_blink))
          ImGui.same_line
          help_marker("Enable blinking cursor (optional as some users consider it to be distracting).")
          ImGui.checkbox("io.ConfigInputTextEnterKeepActive", pointerof(io.config_input_text_enter_keep_active))
          ImGui.same_line
          help_marker("Pressing Enter will keep item active and select contents (single-line only).")
          ImGui.checkbox("io.ConfigDragClickToInputText", pointerof(io.config_drag_click_to_input_text))
          ImGui.same_line
          help_marker("Enable turning DragXXX widgets into text input with a simple mouse click-release (without moving).")
          ImGui.checkbox("io.ConfigWindowsResizeFromEdges", pointerof(io.config_windows_resize_from_edges))
          ImGui.same_line
          help_marker("Enable resizing of windows from their edges and from the lower-left corner.\nThis requires (io.BackendFlags & ImGuiBackendFlags_HasMouseCursors) because it needs mouse cursor feedback.")
          ImGui.checkbox("io.ConfigWindowsMoveFromTitleBarOnly", pointerof(io.config_windows_move_from_title_bar_only))
          ImGui.checkbox("io.ConfigMacOSXBehaviors", pointerof(io.config_mac_osx_behaviors))
          ImGui.text("Also see Style->Rendering for rendering options.")

          ImGui.separator_text("Debug")
          ImGui.checkbox("io.ConfigDebugIsDebuggerPresent", pointerof(io.config_debug_is_debugger_present))
          ImGui.same_line
          help_marker("Enable various tools calling IM_DEBUG_BREAK().\n\nRequires a debugger being attached, otherwise IM_DEBUG_BREAK() options will appear to crash your application.")
          ImGui.disabled do
            ImGui.checkbox("io.ConfigDebugBeginReturnValueOnce", pointerof(io.config_debug_begin_return_value_once))
          end
          ImGui.same_line
          help_marker("First calls to Begin()/BeginChild() will return false.\n\nTHIS OPTION IS DISABLED because it needs to be set at application boot-time to make sense. Showing the disabled option is a way to make this feature easier to discover.")
          ImGui.checkbox("io.ConfigDebugBeginReturnValueLoop", pointerof(io.config_debug_begin_return_value_loop))
          ImGui.same_line
          help_marker("Some calls to Begin()/BeginChild() will return false.\n\nWill cycle through window depths then repeat. Windows should be flickering while running.")
          ImGui.checkbox("io.ConfigDebugIgnoreFocusLoss", pointerof(io.config_debug_ignore_focus_loss))
          ImGui.same_line
          help_marker("Option to deactivate io.AddFocusEvent(false) handling. May facilitate interactions with a debugger when focus loss leads to clearing inputs data.")
          ImGui.checkbox("io.ConfigDebugIniSettings", pointerof(io.config_debug_ini_settings))
          ImGui.same_line
          help_marker("Option to save .ini data with extra comments (particularly helpful for Docking, but makes saving slower).")

          ImGui.spacing
        end

        demo_marker("Configuration/Backend Flags")
        ImGui.tree_node("Backend Flags") do
          help_marker(
            "Those flags are set by the backends (imgui_impl_xxx files) to specify their capabilities.\n" +
            "Here we expose them as read-only fields to avoid breaking interactions with your backend.")

          ImGui.disabled do
            ImGui.checkbox_flags("io.BackendFlags: HasGamepad", pointerof(io.backend_flags), ImGuiBackendFlags::HasGamepad)
            ImGui.checkbox_flags("io.BackendFlags: HasMouseCursors", pointerof(io.backend_flags), ImGuiBackendFlags::HasMouseCursors)
            ImGui.checkbox_flags("io.BackendFlags: HasSetMousePos", pointerof(io.backend_flags), ImGuiBackendFlags::HasSetMousePos)
            ImGui.checkbox_flags("io.BackendFlags: RendererHasVtxOffset", pointerof(io.backend_flags), ImGuiBackendFlags::RendererHasVtxOffset)
          end
          ImGui.spacing
        end

        demo_marker("Configuration/Style")
        ImGui.tree_node("Style") do
          help_marker("The same contents can be accessed in 'Tools->Style Editor' or by calling the ShowStyleEditor() function.")
          show_style_editor
          ImGui.spacing
        end

        demo_marker("Configuration/Capture, Logging")
        ImGui.tree_node("Capture/Logging") do
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
        end
      end

      demo_marker("Window options")
      if ImGui.collapsing_header("Window options")
        ImGui.table("split", 3) do
          ImGui.table_next_column
          ImGui.checkbox("No titlebar", pointerof(no_titlebar.val))
          ImGui.table_next_column
          ImGui.checkbox("No scrollbar", pointerof(no_scrollbar.val))
          ImGui.table_next_column
          ImGui.checkbox("No menu", pointerof(no_menu.val))
          ImGui.table_next_column
          ImGui.checkbox("No move", pointerof(no_move.val))
          ImGui.table_next_column
          ImGui.checkbox("No resize", pointerof(no_resize.val))
          ImGui.table_next_column
          ImGui.checkbox("No collapse", pointerof(no_collapse.val))
          ImGui.table_next_column
          ImGui.checkbox("No close", pointerof(no_close.val))
          ImGui.table_next_column
          ImGui.checkbox("No nav", pointerof(no_nav.val))
          ImGui.table_next_column
          ImGui.checkbox("No background", pointerof(no_background.val))
          ImGui.table_next_column
          ImGui.checkbox("No bring to front", pointerof(no_bring_to_front.val))
          ImGui.table_next_column
          ImGui.checkbox("Unsaved document", pointerof(unsaved_document.val))
        end
      end

      show_demo_window_widgets
      show_demo_window_layout
      show_demo_window_popups
      show_demo_window_tables
      show_demo_window_inputs
    end
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
    demo_marker("Widgets")
    if !ImGui.collapsing_header("Widgets")
      return
    end

    static disable_all = false
    if disable_all.val
      ImGui.begin_disabled
    end

    demo_marker("Widgets/Basic")
    ImGui.tree_node("Basic") do
      ImGui.separator_text("General")

      demo_marker("Widgets/Basic/Button")
      static clicked = 0
      if ImGui.button("Button")
        clicked.val += 1
      end
      if clicked.val.odd?
        ImGui.same_line
        ImGui.text("Thanks for clicking me!")
      end

      demo_marker("Widgets/Basic/Checkbox")
      static check = true
      ImGui.checkbox("checkbox", pointerof(check.val))

      demo_marker("Widgets/Basic/RadioButton")
      static e = 0
      ImGui.radio_button("radio a", pointerof(e.val), 0)
      ImGui.same_line
      ImGui.radio_button("radio b", pointerof(e.val), 1)
      ImGui.same_line
      ImGui.radio_button("radio c", pointerof(e.val), 2)

      demo_marker("Widgets/Basic/Buttons (Colored)")
      7.times do |i|
        if i > 0
          ImGui.same_line
        end
        ImGui.with_id(i) do
          ImGui.push_style_color(ImGuiCol::Button, ImGui.hsv(i / 7.0f32, 0.6f32, 0.6f32))
          ImGui.push_style_color(ImGuiCol::ButtonHovered, ImGui.hsv(i / 7.0f32, 0.7f32, 0.7f32))
          ImGui.push_style_color(ImGuiCol::ButtonActive, ImGui.hsv(i / 7.0f32, 0.8f32, 0.8f32))
          ImGui.button("Click")
          ImGui.pop_style_color(3)
        end
      end

      ImGui.align_text_to_frame_padding
      ImGui.text("Hold to repeat:")
      ImGui.same_line

      demo_marker("Widgets/Basic/Buttons (Repeating)")
      static counter = 0
      spacing = ImGui.get_style.item_inner_spacing.x
      ImGui.with_button_repeat(true) do
        if ImGui.arrow_button("##left", ImGuiDir::Left)
          counter.val -= 1
        end
        ImGui.same_line(0.0f32, spacing)
        if ImGui.arrow_button("##right", ImGuiDir::Right)
          counter.val += 1
        end
      end
      ImGui.same_line
      ImGui.text("%d", counter.val)

      ImGui.button("Tooltip")
      ImGui.set_item_tooltip("I am a tooltip")

      ImGui.label_text("label", "Value")

      ImGui.separator_text("Inputs")

      begin
        demo_marker("Widgets/Basic/InputText")
        static str0 = ImGui::TextBuffer.new("Hello, world!", 128)
        ImGui.input_text("input text", str0.val)
        ImGui.same_line
        help_marker(
          "USER:\n" +
          "Hold SHIFT or use mouse to select text.\n" +
          "CTRL+Left/Right to word jump.\n" +
          "CTRL+A or Double-Click to select all.\n" +
          "CTRL+X,CTRL+C,CTRL+V clipboard.\n" +
          "CTRL+Z,CTRL+Y undo/redo.\n" +
          "ESCAPE to revert.\n\n" +
          "PROGRAMMER:\n" +
          "You can use the ImGuiInputTextFlags_CallbackResize facility if you need to wire InputText() " +
          "to a dynamic string type. See misc/cpp/imgui_stdlib.h for an example (this is not demonstrated " +
          "in src/demo.cr).")

        static str1 = ImGui::TextBuffer.new(128)
        ImGui.input_text_with_hint("input text (w/ hint)", "enter text here", str1.val)

        demo_marker("Widgets/Basic/InputInt, InputFloat")
        static i0 = 123
        ImGui.input_int("input int", pointerof(i0.val))

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

      ImGui.separator_text("Drags")

      begin
        demo_marker("Widgets/Basic/DragInt, DragFloat")
        static i1 = 50
        static i2 = 42
        ImGui.drag_int("drag int", pointerof(i1.val), 1)
        ImGui.same_line
        help_marker(
          "Click and drag to edit value.\n" +
          "Hold SHIFT/ALT for faster/slower edit.\n" +
          "Double-click or CTRL+click to input value.")

        ImGui.drag_int("drag int 0..100", pointerof(i2.val), 1, 0, 100, "%d%%", ImGuiSliderFlags::AlwaysClamp)

        static f1 = 1.00f32
        static f2 = 0.0067f32
        ImGui.drag_float("drag float", pointerof(f1.val), 0.005f32)
        ImGui.drag_float("drag small float", pointerof(f2.val), 0.0001f32, 0.0f32, 0.0f32, "%.06f ns")
      end

      ImGui.separator_text("Sliders")

      begin
        demo_marker("Widgets/Basic/SliderInt, SliderFloat")
        static i1 = 0
        ImGui.slider_int("slider int", pointerof(i1.val), -1, 3)
        ImGui.same_line
        help_marker("CTRL+click to input value.")

        static f1 = 0.123f32
        static f2 = 0.0f32
        ImGui.slider_float("slider float", pointerof(f1.val), 0.0f32, 1.0f32, "ratio = %.3f")
        ImGui.slider_float("slider float (log)", pointerof(f2.val), -10.0f32, 10.0f32, "%.4f", ImGuiSliderFlags::Logarithmic)

        demo_marker("Widgets/Basic/SliderAngle")
        static angle = 0.0f32
        ImGui.slider_angle("slider angle", pointerof(angle.val))

        demo_marker("Widgets/Basic/Slider (enum)")
        static elem = 0
        ImGui.slider_int("slider enum", pointerof(elem.val), 0, Element.values.size - 1, Element.new(elem.val).to_s)
        ImGui.same_line
        help_marker("Using the format string parameter to display a name instead of the underlying integer.")
      end

      ImGui.separator_text("Selectors/Pickers")

      begin
        demo_marker("Widgets/Basic/ColorEdit3, ColorEdit4")
        static col1 = Slice[1.0f32, 0.0f32, 0.2f32]
        static col2 = Slice[0.4f32, 0.7f32, 0.0f32, 0.5f32]
        ImGui.color_edit3("color 1", col1.val)
        ImGui.same_line
        help_marker(
          "Click on the color square to open a color picker.\n" +
          "Click and hold to use drag and drop.\n" +
          "Right-click on the color square to show options.\n" +
          "CTRL+click on individual component to input value.\n")

        ImGui.color_edit4("color 2", col2.val)
      end

      begin
        demo_marker("Widgets/Basic/Combo")
        items = ["AAAA", "BBBB", "CCCC", "DDDD", "EEEE", "FFFF", "GGGG", "HHHH", "IIIIIII", "JJJJ", "KKKKKKK"]
        static item_current = 0
        ImGui.combo("combo", pointerof(item_current.val), items)
        ImGui.same_line
        help_marker(
          "Using the simplified one-liner Combo API here.\n" +
          "Refer to the \"Combo\" section below for an explanation of how to use the more flexible and general BeginCombo/EndCombo API.")
      end

      begin
        demo_marker("Widgets/Basic/ListBox")
        items = ["Apple", "Banana", "Cherry", "Kiwi", "Mango", "Orange", "Pineapple", "Strawberry", "Watermelon"]
        static item_current = 1
        ImGui.list_box("listbox", pointerof(item_current.val), items, 4)
        ImGui.same_line
        help_marker(
          "Using the simplified one-liner ListBox API here.\n" +
          "Refer to the \"List boxes\" section below for an explanation of how to use the more flexible and general BeginListBox/EndListBox API.")
      end
    end

    demo_marker("Widgets/Tooltips")
    ImGui.tree_node("Tooltips") do
      ImGui.separator_text("General")
      help_marker(
        "Tooltip are typically created by using a IsItemHovered() + SetTooltip() sequence.\n\n" +
        "We provide a helper SetItemTooltip() function to perform the two with standards flags.")

      sz = ImVec2.new(-Float32::MIN_POSITIVE, 0.0f32)

      ImGui.button("Basic", sz)
      ImGui.set_item_tooltip("I am a tooltip")

      ImGui.button("Fancy", sz)
      if ImGui.begin_item_tooltip
        ImGui.text("I am a fancy tooltip")
        static arr = [0.6f32, 0.1f32, 1.0f32, 0.5f32, 0.92f32, 0.1f32, 0.2f32]
        ImGui.plot_lines("Curve", arr.val)
        ImGui.text("Sin(time) = %f", Math.sin(ImGui.get_time))
        ImGui.end_tooltip
      end

      ImGui.separator_text("Always On")

      static always_on = 0
      ImGui.radio_button("Off", pointerof(always_on.val), 0)
      ImGui.same_line
      ImGui.radio_button("Always On (Simple)", pointerof(always_on.val), 1)
      ImGui.same_line
      ImGui.radio_button("Always On (Advanced)", pointerof(always_on.val), 2)
      if always_on.val == 1
        ImGui.set_tooltip("I am following you around.")
      elsif always_on.val == 2 && ImGui.begin_tooltip
        ImGui.progress_bar(Math.sin(ImGui.get_time).to_f32 * 0.5f32 + 0.5f32, ImVec2.new(ImGui.get_font_size * 25, 0.0f32))
        ImGui.end_tooltip
      end

      ImGui.separator_text("Custom")

      help_marker(
        "Passing ImGuiHoveredFlags_ForTooltip to IsItemHovered() is the preferred way to standardize" +
        "tooltip activation details across your application. You may however decide to use custom" +
        "flags for a specific tooltip instance.")

      ImGui.button("Manual", sz)
      if ImGui.is_item_hovered(ImGuiHoveredFlags::ForTooltip)
        ImGui.set_tooltip("I am a manually emitted tooltip.")
      end

      ImGui.button("DelayNone", sz)
      if ImGui.is_item_hovered(ImGuiHoveredFlags::DelayNone)
        ImGui.set_tooltip("I am a tooltip with no delay.")
      end

      ImGui.button("DelayShort", sz)
      if ImGui.is_item_hovered(ImGuiHoveredFlags::DelayShort | ImGuiHoveredFlags::NoSharedDelay)
        ImGui.set_tooltip("I am a tooltip with a short delay (%0.2f sec).", ImGui.get_style.hover_delay_short)
      end

      ImGui.button("DelayLong", sz)
      if ImGui.is_item_hovered(ImGuiHoveredFlags::DelayNormal | ImGuiHoveredFlags::NoSharedDelay)
        ImGui.set_tooltip("I am a tooltip with a long delay (%0.2f sec).", ImGui.get_style.hover_delay_normal)
      end

      ImGui.button("Stationary", sz)
      if ImGui.is_item_hovered(ImGuiHoveredFlags::Stationary)
        ImGui.set_tooltip("I am a tooltip requiring mouse to be stationary before activating.")
      end

      ImGui.disabled do
        ImGui.button("Disabled item", sz)
      end
      if ImGui.is_item_hovered(ImGuiHoveredFlags::ForTooltip)
        ImGui.set_tooltip("I am a a tooltip for a disabled item.")
      end
    end

    demo_marker("Widgets/Tree Nodes")
    ImGui.tree_node("Tree Nodes") do
      demo_marker("Widgets/Tree Nodes/Basic trees")
      ImGui.tree_node("Basic trees") do
        5.times do |i|
          if i == 0
            ImGui.set_next_item_open(true, ImGuiCond::Once)
          end

          ImGui.tree_node(i, "Child %d", i) do
            ImGui.text("blah blah")
            ImGui.same_line
            if ImGui.small_button("button")
            end
          end
        end
      end

      demo_marker("Widgets/Tree Nodes/Advanced, with Selectable nodes")
      ImGui.tree_node("Advanced, with Selectable nodes") do
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
        ImGui.checkbox_flags("ImGuiTreeNodeFlags_SpanAllColumns", pointerof(base_flags.val), ImGuiTreeNodeFlags::SpanAllColumns)
        ImGui.same_line
        help_marker("For use in Tables only.")
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
            if ImGui.is_item_clicked && !ImGui.is_item_toggled_open
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
            if ImGui.is_item_clicked && !ImGui.is_item_toggled_open
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
      end
    end

    demo_marker("Widgets/Collapsing Headers")
    ImGui.tree_node("Collapsing Headers") do
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
    end

    demo_marker("Widgets/Bullets")
    ImGui.tree_node("Bullets") do
      ImGui.bullet_text("Bullet point 1")
      ImGui.bullet_text("Bullet point 2\nOn multiple lines")
      ImGui.tree_node("Tree node") do
        ImGui.bullet_text("Another bullet point")
      end
      ImGui.bullet
      ImGui.text("Bullet point 3 (two calls)")
      ImGui.bullet
      ImGui.small_button("Button")
    end

    demo_marker("Widgets/Text")
    ImGui.tree_node("Text") do
      demo_marker("Widgets/Text/Colored Text")
      ImGui.tree_node("Colorful Text") do
        ImGui.text_colored(ImVec4.new(1.0f32, 0.0f32, 1.0f32, 1.0f32), "Pink")
        ImGui.text_colored(ImVec4.new(1.0f32, 1.0f32, 0.0f32, 1.0f32), "Yellow")
        ImGui.text_disabled("Disabled")
        ImGui.same_line
        help_marker("The TextDisabled color is stored in ImGuiStyle.")
      end

      demo_marker("Widgets/Text/Word Wrapping")
      ImGui.tree_node("Word Wrapping") do
        ImGui.text_wrapped(
          "This text should automatically wrap on the edge of the window. The current implementation " +
          "for text wrapping follows simple rules suitable for English and possibly other languages.")
        ImGui.spacing

        static wrap_width = 200.0f32
        ImGui.slider_float("Wrap width", pointerof(wrap_width.val), -20, 600, "%.0f")

        draw_list = ImGui.get_window_draw_list
        2.times do |n|
          ImGui.text("Test paragraph %d:", n)
          pos = ImGui.get_cursor_screen_pos
          marker_min = ImVec2.new(pos.x + wrap_width.val, pos.y)
          marker_max = ImVec2.new(pos.x + wrap_width.val + 10, pos.y + ImGui.get_text_line_height)
          ImGui.with_text_wrap_pos(ImGui.get_cursor_pos.x + wrap_width.val) do
            if n == 0
              ImGui.text("The lazy dog is a good dog. This paragraph should fit within %.0f pixels. Testing a 1 character word. The quick brown fox jumps over the lazy dog.", wrap_width.val)
            else
              ImGui.text("aaaaaaaa bbbbbbbb, c cccccccc,dddddddd. d eeeeeeee   ffffffff. gggggggg!hhhhhhhh")
            end

            draw_list.add_rect(ImGui.get_item_rect_min, ImGui.get_item_rect_max, ImGui.col32(255, 255, 0, 255))
            draw_list.add_rect_filled(marker_min, marker_max, ImGui.col32(255, 0, 255, 255))
          end
        end
      end

      demo_marker("Widgets/Text/UTF-8 Text")
      ImGui.tree_node("UTF-8 Text") do
        ImGui.text_wrapped(
          "CJK text will only appear if the font was loaded with the appropriate CJK character ranges. " +
          "Call io.Fonts->AddFontFromFileTTF() manually to load extra character ranges. " +
          "Read docs/FONTS.md for details.")
        ImGui.text("Hiragana: かきくけこ (kakikukeko)")
        ImGui.text("Kanjis: 日本語 (nihongo)")
        static buf = ImGui::TextBuffer.new("日本語", 32)

        ImGui.input_text("UTF-8 input", buf.val)
      end
    end

    demo_marker("Widgets/Images")
    ImGui.tree_node("Images") do
      io = ImGui.get_io
      ImGui.text_wrapped(
        "Below we are displaying the font texture (which is the only texture we have access to in this demo). " +
        "Use the 'ImTextureID' type as storage to pass pointers or identifier to your own texture data. " +
        "Hover the texture for a zoomed view!")
      my_tex_id = io.fonts.tex_id
      my_tex_w = io.fonts.tex_width
      my_tex_h = io.fonts.tex_height
      begin
        static use_text_color_for_tint = false
        ImGui.checkbox("Use Text Color for Tint", pointerof(use_text_color_for_tint.val))
        ImGui.text("%.0fx%.0f", my_tex_w, my_tex_h)
        pos = ImGui.get_cursor_screen_pos
        uv_min = ImVec2.new(0.0f32, 0.0f32)
        uv_max = ImVec2.new(1.0f32, 1.0f32)
        tint_col = use_text_color_for_tint.val ? ImGui.get_style_color_vec4(ImGuiCol::Text) : ImVec4.new(1.0f32, 1.0f32, 1.0f32, 1.0f32)
        border_col = ImGui.get_style_color_vec4(ImGuiCol::Border)
        ImGui.image(my_tex_id, ImVec2.new(my_tex_w, my_tex_h), uv_min, uv_max, tint_col, border_col)
        if ImGui.begin_item_tooltip
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

      demo_marker("Widgets/Images/Textured buttons")
      ImGui.text_wrapped("And now some textured buttons..")
      static pressed_count = 0
      8.times do |i|
        ImGui.with_id(i) do
          if i > 0
            ImGui.push_style_var(ImGuiStyleVar::FramePadding, ImVec2.new(i - 1.0f32, i - 1.0f32))
          end
          size = ImVec2.new(32.0f32, 32.0f32)
          uv0 = ImVec2.new(0.0f32, 0.0f32)
          uv1 = ImVec2.new(32.0f32 / my_tex_w, 32.0f32 / my_tex_h)
          bg_col = ImVec4.new(0.0f32, 0.0f32, 0.0f32, 1.0f32)
          tint_col = ImVec4.new(1.0f32, 1.0f32, 1.0f32, 1.0f32)
          if ImGui.image_button("", my_tex_id, size, uv0, uv1, bg_col, tint_col)
            pressed_count.val += 1
          end
          if i > 0
            ImGui.pop_style_var
          end
        end
        ImGui.same_line
      end
      ImGui.new_line
      ImGui.text("Pressed %d times.", pressed_count.val)
    end

    demo_marker("Widgets/Combo")
    ImGui.tree_node("Combo") do
      static flags = ImGuiComboFlags::None
      ImGui.checkbox_flags("ImGuiComboFlags_PopupAlignLeft", pointerof(flags.val), ImGuiComboFlags::PopupAlignLeft)
      ImGui.same_line
      help_marker("Only makes a difference if the popup is larger than the combo")
      if ImGui.checkbox_flags("ImGuiComboFlags_NoArrowButton", pointerof(flags.val), ImGuiComboFlags::NoArrowButton)
        flags.val &= ~ImGuiComboFlags::NoPreview
      end
      if ImGui.checkbox_flags("ImGuiComboFlags_NoPreview", pointerof(flags.val), ImGuiComboFlags::NoPreview)
        flags.val &= ~(ImGuiComboFlags::NoArrowButton | ImGuiComboFlags::WidthFitPreview)
      end
      if ImGui.checkbox_flags("ImGuiComboFlags_WidthFitPreview", pointerof(flags.val), ImGuiComboFlags::WidthFitPreview)
        flags.val &= ~ImGuiComboFlags::NoPreview
      end

      if ImGui.checkbox_flags("ImGuiComboFlags_HeightSmall", pointerof(flags.val), ImGuiComboFlags::HeightSmall)
        flags.val &= ~(ImGuiComboFlags::HeightMask_ & ~ImGuiComboFlags::HeightSmall)
      end
      if ImGui.checkbox_flags("ImGuiComboFlags_HeightRegular", pointerof(flags.val), ImGuiComboFlags::HeightRegular)
        flags.val &= ~(ImGuiComboFlags::HeightMask_ & ~ImGuiComboFlags::HeightRegular)
      end
      if ImGui.checkbox_flags("ImGuiComboFlags_HeightLargest", pointerof(flags.val), ImGuiComboFlags::HeightLargest)
        flags.val &= ~(ImGuiComboFlags::HeightMask_ & ~ImGuiComboFlags::HeightLargest)
      end

      items = ["AAAA", "BBBB", "CCCC", "DDDD", "EEEE", "FFFF", "GGGG", "HHHH", "IIII", "JJJJ", "KKKK", "LLLLLLL", "MMMM", "OOOOOOO"]
      static item_current_idx = 0

      combo_preview_value = items[item_current_idx.val]

      ImGui.combo("combo 1", combo_preview_value, flags.val) do
        items.size.times do |n|
          is_selected = (item_current_idx.val == n)
          if ImGui.selectable(items[n], is_selected)
            item_current_idx.val = n
          end

          if is_selected
            ImGui.set_item_default_focus
          end
        end
      end

      ImGui.spacing
      ImGui.separator_text("One-liner variants")
      help_marker("Flags above don't apply to this section.")

      static item_current_2 = 0
      ImGui.combo("combo 2 (one-liner)", pointerof(item_current_2.val), "aaaa\0bbbb\0cccc\0dddd\0eeee\0\0")

      static item_current_3 = -1
      ImGui.combo("combo 3 (array)", pointerof(item_current_3.val), items)

      static item_current_4 = 0
      ImGui.combo("combo 4 (function)", pointerof(item_current_4.val), items.size) do |idx|
        items[idx]
      end
    end

    demo_marker("Widgets/List Boxes")
    ImGui.tree_node("List boxes") do
      items = ["AAAA", "BBBB", "CCCC", "DDDD", "EEEE", "FFFF", "GGGG", "HHHH", "IIII", "JJJJ", "KKKK", "LLLLLLL", "MMMM", "OOOOOOO"]
      static item_current_idx = 0
      ImGui.list_box("listbox 1") do
        items.size.times do |n|
          is_selected = (item_current_idx.val == n)
          if ImGui.selectable(items[n], is_selected)
            item_current_idx.val = n
          end

          if is_selected
            ImGui.set_item_default_focus
          end
        end
      end

      ImGui.text("Full-width:")
      ImGui.list_box("##listbox 2", ImVec2.new(-Float32::MIN_POSITIVE, 5 * ImGui.get_text_line_height_with_spacing)) do
        items.size.times do |n|
          is_selected = (item_current_idx.val == n)
          if ImGui.selectable(items[n], is_selected)
            item_current_idx.val = n
          end

          if is_selected
            ImGui.set_item_default_focus
          end
        end
      end
    end

    demo_marker("Widgets/Selectables")
    ImGui.tree_node("Selectables") do
      demo_marker("Widgets/Selectables/Basic")
      ImGui.tree_node("Basic") do
        static selection = [false, true, false, false]
        ImGui.selectable("1. I am selectable", pointerof(selection.val[0]))
        ImGui.selectable("2. I am selectable", pointerof(selection.val[1]))
        ImGui.selectable("3. I am selectable", pointerof(selection.val[2]))
        if ImGui.selectable("4. I am double clickable", selection.val[3], ImGuiSelectableFlags::AllowDoubleClick)
          if ImGui.is_mouse_double_clicked(:Left)
            selection.val[3] = !selection.val[3]
          end
        end
      end

      demo_marker("Widgets/Selectables/Single Selection")
      ImGui.tree_node("Selection State: Single Selection") do
        static selected = -1
        5.times do |n|
          buf = sprintf("Object %d", n)
          if ImGui.selectable(buf, selected.val == n)
            selected.val = n
          end
        end
      end
      demo_marker("Widgets/Selectables/Multiple Selection")
      ImGui.tree_node("Selection State: Multiple Selection") do
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
      end
      demo_marker("Widgets/Selectables/Rendering more items on the same line")
      ImGui.tree_node("Rendering more items on the same line") do
        static selected = [false, false, false]
        ImGui.set_next_item_allow_overlap
        ImGui.selectable("main.c", pointerof(selected.val[0]))
        ImGui.same_line
        ImGui.small_button("Link 1")
        ImGui.set_next_item_allow_overlap
        ImGui.selectable("Hello.cpp", pointerof(selected.val[1]))
        ImGui.same_line
        ImGui.small_button("Link 2")
        ImGui.set_next_item_allow_overlap
        ImGui.selectable("Hello.h", pointerof(selected.val[2]))
        ImGui.same_line
        ImGui.small_button("Link 3")
      end

      demo_marker("Widgets/Selectables/In columns")
      ImGui.tree_node("In columns") do
        static selected = Slice.new(16, false)

        ImGui.table("split1", 3, ImGuiTableFlags::Resizable | ImGuiTableFlags::NoSavedSettings | ImGuiTableFlags::Borders) do
          10.times do |i|
            label = sprintf("Item %d", i)
            ImGui.table_next_column
            ImGui.selectable(label, pointerof(selected.val[i]))
          end
        end
        ImGui.spacing
        ImGui.table("split2", 3, ImGuiTableFlags::Resizable | ImGuiTableFlags::NoSavedSettings | ImGuiTableFlags::Borders) do
          10.times do |i|
            label = sprintf("Item %d", i)
            ImGui.table_next_row
            ImGui.table_next_column
            ImGui.selectable(label, pointerof(selected.val[i]), ImGuiSelectableFlags::SpanAllColumns)
            ImGui.table_next_column
            ImGui.text("Some other contents")
            ImGui.table_next_column
            ImGui.text("123456")
          end
        end
      end

      demo_marker("Widgets/Selectables/Grid")
      ImGui.tree_node("Grid") do
        static selected = [[1, 0, 0, 0], [0, 1, 0, 0], [0, 0, 1, 0], [0, 0, 0, 1]]

        time = ImGui.get_time
        winning_state = selected.val.all?(&.all?(&.>(0)))
        if winning_state
          ImGui.push_style_var(ImGuiStyleVar::SelectableTextAlign, ImVec2.new(0.5f32 + 0.5f32 * Math.cos(time * 2.0f32), 0.5f32 + 0.5f32 * Math.sin(time * 3.0f32)))
        end

        4.times do |y|
          4.times do |x|
            if x > 0
              ImGui.same_line
            end
            ImGui.with_id(y * 4 + x) do
              if ImGui.selectable("Sailor", selected.val[y][x] != 0, size: ImVec2.new(50, 50))
                selected.val[y][x] ^= 1
                if x > 0
                  selected.val[y][x - 1] ^= 1
                end
                if x < 3
                  selected.val[y][x + 1] ^= 1
                end
                if y > 0
                  selected.val[y - 1][x] ^= 1
                end
                if y < 3
                  selected.val[y + 1][x] ^= 1
                end
              end
            end
          end
        end

        if winning_state
          ImGui.pop_style_var
        end
      end
      demo_marker("Widgets/Selectables/Alignment")
      ImGui.tree_node("Alignment") do
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
            ImGui.with_style_var(ImGuiStyleVar::SelectableTextAlign, alignment) do
              ImGui.selectable(name, pointerof(selected.val[3 * y + x]), ImGuiSelectableFlags::None, ImVec2.new(80, 80))
            end
          end
        end
      end
    end

    demo_marker("Widgets/Text Input")
    ImGui.tree_node("Text Input") do
      demo_marker("Widgets/Text Input/Multi-line Text Input")
      ImGui.tree_node("Multi-line Text Input") do
        static text = ImGui::TextBuffer.new(1024 * 16) << (
          "/*\n" +
          " The Pentium F00F bug, shorthand for F0 0F C7 C8,\n" +
          " the hexadecimal encoding of one offending instruction,\n" +
          " more formally, the invalid operand with locked CMPXCHG8B\n" +
          " instruction bug, is a design flaw in the majority of\n" +
          " Intel Pentium, Pentium MMX, and Pentium OverDrive\n" +
          " processors (all in the P5 microarchitecture).\n" +
          "*/\n\n" +
          "label:\n" +
          "\tlock cmpxchg8b eax\n"
        )

        static flags = ImGuiInputTextFlags::AllowTabInput
        help_marker("You can use the ImGuiInputTextFlags_CallbackResize facility if you need to wire InputTextMultiline() to a dynamic string type. See misc/cpp/imgui_stdlib.h for an example. (This is not demonstrated in src/demo.cr because we don't want to include <string> in here)")
        ImGui.checkbox_flags("ImGuiInputTextFlags_ReadOnly", pointerof(flags.val), ImGuiInputTextFlags::ReadOnly)
        ImGui.checkbox_flags("ImGuiInputTextFlags_AllowTabInput", pointerof(flags.val), ImGuiInputTextFlags::AllowTabInput)
        ImGui.same_line
        help_marker("When _AllowTabInput is set, passing through the widget with Tabbing doesn't automatically activate it, in order to also cycling through subsequent widgets.")
        ImGui.checkbox_flags("ImGuiInputTextFlags_CtrlEnterForNewLine", pointerof(flags.val), ImGuiInputTextFlags::CtrlEnterForNewLine)
        ImGui.input_text_multiline("##source", text.val, ImVec2.new(-Float32::MIN_POSITIVE, ImGui.get_text_line_height * 16), flags.val)
      end

      demo_marker("Widgets/Text Input/Filtered Text Input")
      ImGui.tree_node("Filtered Text Input") do
        static buf1 = ImGui::TextBuffer.new(32)
        ImGui.input_text("default", buf1.val)
        static buf2 = ImGui::TextBuffer.new(32)
        ImGui.input_text("decimal", buf2.val, ImGuiInputTextFlags::CharsDecimal)
        static buf3 = ImGui::TextBuffer.new(32)
        ImGui.input_text("hexadecimal", buf3.val, ImGuiInputTextFlags::CharsHexadecimal | ImGuiInputTextFlags::CharsUppercase)
        static buf4 = ImGui::TextBuffer.new(32)
        ImGui.input_text("uppercase", buf4.val, ImGuiInputTextFlags::CharsUppercase)
        static buf5 = ImGui::TextBuffer.new(32)
        ImGui.input_text("no blank", buf5.val, ImGuiInputTextFlags::CharsNoBlank)
        static buf6 = ImGui::TextBuffer.new(32)
        ImGui.input_text("casing swap", buf6.val, ImGuiInputTextFlags::CallbackCharFilter) do |data|
          if data.event_char >= 'a' && data.event_char <= 'z'
            data.event_char += 'A' - 'a'
          elsif data.event_char >= 'A' && data.event_char <= 'Z'
            data.event_char += 'a' - 'A'
          end
          0
        end
        static buf7 = ImGui::TextBuffer.new(32)
        ImGui.input_text("\"imgui\"", buf7.val, ImGuiInputTextFlags::CallbackCharFilter) do |data|
          if data.event_char.ord < 256 && "imgui".includes?(data.event_char)
            0
          else
            1
          end
        end
      end

      demo_marker("Widgets/Text Input/Password input")
      ImGui.tree_node("Password Input") do
        static password = ImGui::TextBuffer.new("password123", 64)
        ImGui.input_text("password", password.val, ImGuiInputTextFlags::Password)
        ImGui.same_line
        help_marker("Display all characters as '*'.\nDisable clipboard cut and copy.\nDisable logging.\n")
        ImGui.input_text_with_hint("password (w/ hint)", "<password>", password.val, ImGuiInputTextFlags::Password)
        ImGui.input_text("password (clear)", password.val)
      end

      demo_marker("Widgets/Text Input/Completion, History, Edit Callbacks")
      ImGui.tree_node("Completion, History, Edit Callbacks") do
        static edit_count = 0
        my_callback = ->(data : ImGuiInputTextCallbackData) {
          if data.event_flag == ImGuiInputTextFlags::CallbackCompletion
            data.insert_chars(data.cursor_pos, "..")
          elsif data.event_flag == ImGuiInputTextFlags::CallbackHistory
            if data.event_key == ImGuiKey::UpArrow
              data.delete_chars(0, data.buf_text_len)
              data.insert_chars(0, "Pressed Up!")
              data.select_all
            elsif data.event_key == ImGuiKey::DownArrow
              data.delete_chars(0, data.buf_text_len)
              data.insert_chars(0, "Pressed Down!")
              data.select_all
            end
          elsif data.event_flag == ImGuiInputTextFlags::CallbackEdit
            c = data.buf[0].chr
            if (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')
              data.buf[0] ^= 32
            end
            data.buf_dirty = true

            edit_count.val += 1
          end
          return 0
        }
        static buf1 = ImGui::TextBuffer.new(64)
        ImGui.input_text("Completion", buf1.val, ImGuiInputTextFlags::CallbackCompletion, &my_callback)
        ImGui.same_line
        help_marker(
          "Here we append \"..\" each time Tab is pressed. " +
          "See 'Examples>Console' for a more meaningful demonstration of using this callback.")

        static buf2 = ImGui::TextBuffer.new(64)
        ImGui.input_text("History", buf2.val, ImGuiInputTextFlags::CallbackHistory, &my_callback)
        ImGui.same_line
        help_marker(
          "Here we replace and select text each time Up/Down are pressed. " +
          "See 'Examples>Console' for a more meaningful demonstration of using this callback.")

        static buf3 = ImGui::TextBuffer.new(64)
        ImGui.input_text("Edit", buf3.val, ImGuiInputTextFlags::CallbackEdit, &my_callback)
        ImGui.same_line
        help_marker(
          "Here we toggle the casing of the first character on every edit + count edits.")
        ImGui.same_line
        ImGui.text("(%d)", edit_count.val)
      end

      demo_marker("Widgets/Text Input/Resize Callback")
      ImGui.tree_node("Resize Callback") do
        help_marker(
          "Using ImGuiInputTextFlags_CallbackResize to wire your custom string type to InputText().\n\n" +
          "See misc/cpp/imgui_stdlib.h for an implementation of this for std::string.")

        static my_str = ImGui::TextBuffer.new
        ImGui.input_text_multiline("##MyStr", my_str.val, ImVec2.new(-Float32::MIN_POSITIVE, ImGui.get_text_line_height * 16), ImGuiInputTextFlags::CallbackResize)
        ImGui.text("Data: %p\nSize: %d\nCapacity: %d", my_str.val.to_unsafe, my_str.val.bytesize, my_str.val.capacity)
      end

      demo_marker("Widgets/Text Input/Miscellaneous")
      ImGui.tree_node("Miscellaneous") do
        static buf1 = ImGui::TextBuffer.new(16)
        static flags = ImGuiInputTextFlags::EscapeClearsAll
        ImGui.checkbox_flags("ImGuiInputTextFlags_EscapeClearsAll", pointerof(flags.val), ImGuiInputTextFlags::EscapeClearsAll)
        ImGui.checkbox_flags("ImGuiInputTextFlags_ReadOnly", pointerof(flags.val), ImGuiInputTextFlags::ReadOnly)
        ImGui.checkbox_flags("ImGuiInputTextFlags_NoUndoRedo", pointerof(flags.val), ImGuiInputTextFlags::NoUndoRedo)
        ImGui.input_text("Hello", buf1.val, flags.val)
      end
    end

    demo_marker("Widgets/Tabs")
    ImGui.tree_node("Tabs") do
      demo_marker("Widgets/Tabs/Basic")
      ImGui.tree_node("Basic") do
        tab_bar_flags = ImGuiTabBarFlags::None
        ImGui.tab_bar("MyTabBar", tab_bar_flags) do
          ImGui.tab_item("Avocado") do
            ImGui.text("This is the Avocado tab!\nblah blah blah blah blah")
          end
          ImGui.tab_item("Broccoli") do
            ImGui.text("This is the Broccoli tab!\nblah blah blah blah blah")
          end
          ImGui.tab_item("Cucumber") do
            ImGui.text("This is the Cucumber tab!\nblah blah blah blah blah")
          end
        end
        ImGui.separator
      end

      demo_marker("Widgets/Tabs/Advanced & Close Button")
      ImGui.tree_node("Advanced & Close Button") do
        static tab_bar_flags = ImGuiTabBarFlags::Reorderable
        ImGui.checkbox_flags("ImGuiTabBarFlags_Reorderable", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::Reorderable)
        ImGui.checkbox_flags("ImGuiTabBarFlags_AutoSelectNewTabs", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::AutoSelectNewTabs)
        ImGui.checkbox_flags("ImGuiTabBarFlags_TabListPopupButton", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::TabListPopupButton)
        ImGui.checkbox_flags("ImGuiTabBarFlags_NoCloseWithMiddleMouseButton", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::NoCloseWithMiddleMouseButton)
        if !tab_bar_flags.val.includes?(:FittingPolicyMask_)
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

        ImGui.tab_bar("MyTabBar", tab_bar_flags.val) do
          opened.val.size.times do |n|
            if opened.val[n] && ImGui.begin_tab_item(names[n], pointerof(opened.val[n]), ImGuiTabItemFlags::None)
              ImGui.text("This is the %s tab!", names[n])
              if n.odd?
                ImGui.text("I am an odd tab.")
              end
              ImGui.end_tab_item
            end
          end
        end
        ImGui.separator
      end

      demo_marker("Widgets/Tabs/TabItemButton & Leading-Trailing flags")
      ImGui.tree_node("TabItemButton & Leading/Trailing flags") do
        static active_tabs = [] of Int32
        static next_tab_id = 0
        if next_tab_id.val == 0
          3.times do |i|
            active_tabs.val << next_tab_id.val
            next_tab_id.val += 1
          end
        end

        static show_leading_button = true
        static show_trailing_button = true
        ImGui.checkbox("Show Leading TabItemButton()", pointerof(show_leading_button.val))
        ImGui.checkbox("Show Trailing TabItemButton()", pointerof(show_trailing_button.val))

        static tab_bar_flags = ImGuiTabBarFlags::AutoSelectNewTabs | ImGuiTabBarFlags::Reorderable | ImGuiTabBarFlags::FittingPolicyResizeDown
        ImGui.checkbox_flags("ImGuiTabBarFlags_TabListPopupButton", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::TabListPopupButton)
        if ImGui.checkbox_flags("ImGuiTabBarFlags_FittingPolicyResizeDown", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::FittingPolicyResizeDown)
          tab_bar_flags.val &= ~(ImGuiTabBarFlags::FittingPolicyMask_ ^ ImGuiTabBarFlags::FittingPolicyResizeDown)
        end
        if ImGui.checkbox_flags("ImGuiTabBarFlags_FittingPolicyScroll", pointerof(tab_bar_flags.val), ImGuiTabBarFlags::FittingPolicyScroll)
          tab_bar_flags.val &= ~(ImGuiTabBarFlags::FittingPolicyMask_ ^ ImGuiTabBarFlags::FittingPolicyScroll)
        end

        ImGui.tab_bar("MyTabBar", tab_bar_flags.val) do
          if show_leading_button.val
            if ImGui.tab_item_button("?", ImGuiTabItemFlags::Leading | ImGuiTabItemFlags::NoTooltip)
              ImGui.open_popup("MyHelpMenu")
            end
          end
          ImGui.popup("MyHelpMenu") do
            ImGui.selectable("Hello!")
          end

          if show_trailing_button.val
            if ImGui.tab_item_button("+", ImGuiTabItemFlags::Trailing | ImGuiTabItemFlags::NoTooltip)
              active_tabs.val << next_tab_id.val
              next_tab_id.val += 1
            end
          end

          n = 0
          while n < active_tabs.val.size
            open = true
            name = sprintf("%04d", active_tabs.val[n])
            ImGui.tab_item(name, pointerof(open), ImGuiTabItemFlags::None) do
              ImGui.text("This is the %s tab!", name)
            end

            if !open
              active_tabs.val.delete_at(n)
            else
              n += 1
            end
          end
        end
        ImGui.separator
      end
    end

    demo_marker("Widgets/Plotting")
    ImGui.tree_node("Plotting") do
      static animate = true
      ImGui.checkbox("Animate", pointerof(animate.val))

      demo_marker("Widgets/Plotting/PlotLines, PlotHistogram")
      static arr = [0.6f32, 0.1f32, 1.0f32, 0.5f32, 0.92f32, 0.1f32, 0.2f32]
      ImGui.plot_lines("Frame Times", arr.val)
      ImGui.plot_histogram("Histogram", arr.val, 0, nil, 0.0f32, 1.0f32, ImVec2.new(0, 80.0f32))

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

      sin = ->(i : Int32) {
        Math.sin(i * 0.1).to_f32
      }
      saw = ->(i : Int32) {
        i.odd? ? 1.0f32 : -1.0f32
      }
      static func_type = 0
      static display_count = 70
      ImGui.separator_text("Functions")
      ImGui.set_next_item_width(ImGui.get_font_size * 8)
      ImGui.combo("func", pointerof(func_type.val), "Sin\0Saw\0")
      ImGui.same_line
      ImGui.slider_int("Sample count", pointerof(display_count.val), 1, 400)
      func = (func_type.val == 0) ? sin : saw
      ImGui.plot_lines("Lines", display_count.val, 0, nil, -1.0f32, 1.0f32, ImVec2.new(0, 80), &func)
      ImGui.plot_histogram("Histogram", display_count.val, 0, nil, -1.0f32, 1.0f32, ImVec2.new(0, 80), &func)
      ImGui.separator

      demo_marker("Widgets/Plotting/ProgressBar")
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
    end

    demo_marker("Widgets/Color")
    ImGui.tree_node("Color/Picker Widgets") do
      static color = ImVec4.new(114.0f32 / 255.0f32, 144.0f32 / 255.0f32, 154.0f32 / 255.0f32, 200.0f32 / 255.0f32)

      static alpha_preview = true
      static alpha_half_preview = false
      static drag_and_drop = true
      static options_menu = true
      static hdr = false
      ImGui.separator_text("Options")
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

      demo_marker("Widgets/Color/ColorEdit")
      ImGui.separator_text("Inline color editor")
      ImGui.text("Color widget:")
      ImGui.same_line
      help_marker(
        "Click on the color square to open a color picker.\n" +
        "CTRL+click on individual component to input value.\n")
      ImGui.color_edit3("MyColor##1", pointerof(color.val), misc_flags)

      demo_marker("Widgets/Color/ColorEdit (HSV, with Alpha)")
      ImGui.text("Color widget HSV with Alpha:")
      ImGui.color_edit4("MyColor##2", pointerof(color.val), ImGuiColorEditFlags::DisplayHSV | misc_flags)

      demo_marker("Widgets/Color/ColorEdit (float display)")
      ImGui.text("Color widget with Float Display:")
      ImGui.color_edit4("MyColor##2f", pointerof(color.val), ImGuiColorEditFlags::Float | misc_flags)

      demo_marker("Widgets/Color/ColorButton (with Picker)")
      ImGui.text("Color button with Picker:")
      ImGui.same_line
      help_marker(
        "With the ImGuiColorEditFlags_NoInputs flag you can hide all the slider/text inputs.\n" +
        "With the ImGuiColorEditFlags_NoLabel flag you can pass a non-empty label which will only " +
        "be used for the tooltip and picker popup.")
      ImGui.color_edit4("MyColor##3", pointerof(color.val), ImGuiColorEditFlags::NoInputs | ImGuiColorEditFlags::NoLabel | misc_flags)

      demo_marker("Widgets/Color/ColorButton (with custom Picker popup)")
      ImGui.text("Color button with Custom Picker Popup:")

      static saved_palette = Array(ImVec4).new(32) do |n|
        r, g, b = ImGui.color_convert_hsv_to_rgb(n / 31.0f32, 0.8f32, 0.8f32)
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
      ImGui.popup("mypicker") do
        ImGui.text("MY CUSTOM COLOR PICKER WITH AN AMAZING PALETTE!")
        ImGui.separator
        ImGui.color_picker4("##picker", pointerof(color.val), misc_flags | ImGuiColorEditFlags::NoSidePreview | ImGuiColorEditFlags::NoSmallPreview)
        ImGui.same_line

        ImGui.group do
          ImGui.text("Current")
          ImGui.color_button("##current", color.val, ImGuiColorEditFlags::NoPicker | ImGuiColorEditFlags::AlphaPreviewHalf, ImVec2.new(60, 40))
          ImGui.text("Previous")
          if ImGui.color_button("##previous", backup_color.val, ImGuiColorEditFlags::NoPicker | ImGuiColorEditFlags::AlphaPreviewHalf, ImVec2.new(60, 40))
            color.val = backup_color.val
          end
          ImGui.separator
          ImGui.text("Palette")
          saved_palette.val.size.times do |n|
            ImGui.with_id(n) do
              if (n % 8) != 0
                ImGui.same_line(0.0f32, ImGui.get_style.item_spacing.y)
              end

              palette_button_flags = ImGuiColorEditFlags::NoAlpha | ImGuiColorEditFlags::NoPicker | ImGuiColorEditFlags::NoTooltip
              if ImGui.color_button("##palette", saved_palette.val[n], palette_button_flags, ImVec2.new(20, 20))
                color.val = ImVec4.new(saved_palette.val[n].x, saved_palette.val[n].y, saved_palette.val[n].z, color.val.w)
              end

              ImGui.drag_drop_target do
                if payload = ImGui.accept_drag_drop_payload(ImGui::PAYLOAD_TYPE_COLOR_3F)
                  data = payload.data.as(Float32*)
                  saved_palette.val[n] = ImGui.rgb(data[0], data[1], data[2])
                end
                if payload = ImGui.accept_drag_drop_payload(ImGui::PAYLOAD_TYPE_COLOR_4F)
                  data = payload.data.as(Float32*)
                  saved_palette.val[n] = ImGui.rgb(data[0], data[1], data[2], data[3])
                end
              end
            end
          end
        end
      end

      demo_marker("Widgets/Color/ColorButton (simple)")
      ImGui.text("Color button only:")
      static no_border = false
      ImGui.checkbox("ImGuiColorEditFlags_NoBorder", pointerof(no_border.val))
      ImGui.color_button("MyColor##3c", color.val, misc_flags | (no_border.val ? ImGuiColorEditFlags::NoBorder : ImGuiColorEditFlags::None), ImVec2.new(80, 80))

      demo_marker("Widgets/Color/ColorPicker")
      ImGui.separator_text("Color picker")
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
        "but the user can change it with a right-click on those inputs.\n\nColorPicker defaults to displaying RGB+HSV+Hex " +
        "if you don't specify a display mode.\n\nYou can change the defaults using SetColorEditOptions().")
      ImGui.same_line
      help_marker("When not specified explicitly (Auto/Current mode), user can right-click the picker to change mode.")
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

      ImGui.text("Both types:")
      w = (ImGui.get_content_region_avail.x - ImGui.get_style.item_spacing.y) * 0.40f32
      ImGui.set_next_item_width(w)
      ImGui.color_picker3("##MyColor##5", pointerof(color.val), ImGuiColorEditFlags::PickerHueBar | ImGuiColorEditFlags::NoSidePreview | ImGuiColorEditFlags::NoInputs | ImGuiColorEditFlags::NoAlpha)
      ImGui.same_line
      ImGui.set_next_item_width(w)
      ImGui.color_picker3("##MyColor##6", pointerof(color.val), ImGuiColorEditFlags::PickerHueWheel | ImGuiColorEditFlags::NoSidePreview | ImGuiColorEditFlags::NoInputs | ImGuiColorEditFlags::NoAlpha)

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
    end

    demo_marker("Widgets/Drag and Slider Flags")
    ImGui.tree_node("Drag/Slider Flags") do
      static flags = ImGuiSliderFlags::None
      ImGui.checkbox_flags("ImGuiSliderFlags_AlwaysClamp", pointerof(flags.val), ImGuiSliderFlags::AlwaysClamp)
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
      ImGui.slider_int("SliderInt (0 -> 100)", pointerof(slider_i.val), 0, 100, "%d", flags.val)
    end

    demo_marker("Widgets/Range Widgets")
    ImGui.tree_node("Range Widgets") do
      static begin_ = 10f32
      static end_ = 90f32
      static begin_i = 100
      static end_i = 1000
      ImGui.drag_float_range2("range float", pointerof(begin_.val), pointerof(end_.val), 0.25f32, 0.0f32, 100.0f32, "Min: %.1f %%", "Max: %.1f %%", ImGuiSliderFlags::AlwaysClamp)
      ImGui.drag_int_range2("range int", pointerof(begin_i.val), pointerof(end_i.val), 5, 0, 1000, "Min: %d units", "Max: %d units")
      ImGui.drag_int_range2("range int (no bounds)", pointerof(begin_i.val), pointerof(end_i.val), 5, 0, 0, "Min: %d units", "Max: %d units")
    end

    demo_marker("Widgets/Data Types")
    ImGui.tree_node("Data Types") do
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
      demo_marker("Widgets/Data Types/Drags")
      ImGui.separator_text("Drags")
      ImGui.checkbox("Clamp integers to 0..50", pointerof(drag_clamp.val))
      ImGui.same_line
      help_marker(
        "As with every widget in dear imgui, we never modify values unless there is a user interaction.\n" +
        "You can override the clamping limits by using CTRL+Click to input a value.")
      ImGui.drag_scalar("drag s8", pointerof(s8_v.val), drag_speed, drag_clamp.val ? s8_zero : nil, drag_clamp.val ? s8_fifty : nil)
      ImGui.drag_scalar("drag u8", pointerof(u8_v.val), drag_speed, drag_clamp.val ? u8_zero : nil, drag_clamp.val ? u8_fifty : nil, "%u ms")
      ImGui.drag_scalar("drag s16", pointerof(s16_v.val), drag_speed, drag_clamp.val ? s16_zero : nil, drag_clamp.val ? s16_fifty : nil)
      ImGui.drag_scalar("drag u16", pointerof(u16_v.val), drag_speed, drag_clamp.val ? u16_zero : nil, drag_clamp.val ? u16_fifty : nil, "%u ms")
      ImGui.drag_scalar("drag s32", pointerof(s32_v.val), drag_speed, drag_clamp.val ? s32_zero : nil, drag_clamp.val ? s32_fifty : nil)
      ImGui.drag_scalar("drag s32 hex", pointerof(s32_v.val), drag_speed, drag_clamp.val ? s32_zero : nil, drag_clamp.val ? s32_fifty : nil, "0x%08X")
      ImGui.drag_scalar("drag u32", pointerof(u32_v.val), drag_speed, drag_clamp.val ? u32_zero : nil, drag_clamp.val ? u32_fifty : nil, "%u ms")
      ImGui.drag_scalar("drag s64", pointerof(s64_v.val), drag_speed, drag_clamp.val ? s64_zero : nil, drag_clamp.val ? s64_fifty : nil)
      ImGui.drag_scalar("drag u64", pointerof(u64_v.val), drag_speed, drag_clamp.val ? u64_zero : nil, drag_clamp.val ? u64_fifty : nil)
      ImGui.drag_scalar("drag float", pointerof(f32_v.val), 0.005f32, f32_zero, f32_one, "%f")
      ImGui.drag_scalar("drag float log", pointerof(f32_v.val), 0.005f32, f32_zero, f32_one, "%f", ImGuiSliderFlags::Logarithmic)
      ImGui.drag_scalar("drag double", pointerof(f64_v.val), 0.0005f32, f64_zero, nil, "%.10f grams")
      ImGui.drag_scalar("drag double log", pointerof(f64_v.val), 0.0005f32, f64_zero, f64_one, "0 < %.10f < 1", ImGuiSliderFlags::Logarithmic)

      demo_marker("Widgets/Data Types/Sliders")
      ImGui.separator_text("Sliders")
      ImGui.slider_scalar("slider s8 full", pointerof(s8_v.val), s8_min, s8_max, "%d")
      ImGui.slider_scalar("slider u8 full", pointerof(u8_v.val), u8_min, u8_max, "%u")
      ImGui.slider_scalar("slider s16 full", pointerof(s16_v.val), s16_min, s16_max, "%d")
      ImGui.slider_scalar("slider u16 full", pointerof(u16_v.val), u16_min, u16_max, "%u")
      ImGui.slider_scalar("slider s32 low", pointerof(s32_v.val), s32_zero, s32_fifty, "%d")
      ImGui.slider_scalar("slider s32 high", pointerof(s32_v.val), s32_hi_a, s32_hi_b, "%d")
      ImGui.slider_scalar("slider s32 full", pointerof(s32_v.val), s32_min, s32_max, "%d")
      ImGui.slider_scalar("slider s32 hex", pointerof(s32_v.val), s32_zero, s32_fifty, "0x%04X")
      ImGui.slider_scalar("slider u32 low", pointerof(u32_v.val), u32_zero, u32_fifty, "%u")
      ImGui.slider_scalar("slider u32 high", pointerof(u32_v.val), u32_hi_a, u32_hi_b, "%u")
      ImGui.slider_scalar("slider u32 full", pointerof(u32_v.val), u32_min, u32_max, "%u")
      ImGui.slider_scalar("slider s64 low", pointerof(s64_v.val), s64_zero, s64_fifty, "%lld")
      ImGui.slider_scalar("slider s64 high", pointerof(s64_v.val), s64_hi_a, s64_hi_b, "%lld")
      ImGui.slider_scalar("slider s64 full", pointerof(s64_v.val), s64_min, s64_max, "%lld")
      ImGui.slider_scalar("slider u64 low", pointerof(u64_v.val), u64_zero, u64_fifty, "%llu ms")
      ImGui.slider_scalar("slider u64 high", pointerof(u64_v.val), u64_hi_a, u64_hi_b, "%llu ms")
      ImGui.slider_scalar("slider u64 full", pointerof(u64_v.val), u64_min, u64_max, "%llu ms")
      ImGui.slider_scalar("slider float low", pointerof(f32_v.val), f32_zero, f32_one)
      ImGui.slider_scalar("slider float low log", pointerof(f32_v.val), f32_zero, f32_one, "%.10f", ImGuiSliderFlags::Logarithmic)
      ImGui.slider_scalar("slider float high", pointerof(f32_v.val), f32_lo_a, f32_hi_a, "%e")
      ImGui.slider_scalar("slider double low", pointerof(f64_v.val), f64_zero, f64_one, "%.10f grams")
      ImGui.slider_scalar("slider double low log", pointerof(f64_v.val), f64_zero, f64_one, "%.10f", ImGuiSliderFlags::Logarithmic)
      ImGui.slider_scalar("slider double high", pointerof(f64_v.val), f64_lo_a, f64_hi_a, "%e grams")

      ImGui.separator_text("Sliders (reverse)")
      ImGui.slider_scalar("slider s8 reverse", pointerof(s8_v.val), s8_max, s8_min, "%d")
      ImGui.slider_scalar("slider u8 reverse", pointerof(u8_v.val), u8_max, u8_min, "%u")
      ImGui.slider_scalar("slider s32 reverse", pointerof(s32_v.val), s32_fifty, s32_zero, "%d")
      ImGui.slider_scalar("slider u32 reverse", pointerof(u32_v.val), u32_fifty, u32_zero, "%u")
      ImGui.slider_scalar("slider s64 reverse", pointerof(s64_v.val), s64_fifty, s64_zero, "%lld")
      ImGui.slider_scalar("slider u64 reverse", pointerof(u64_v.val), u64_fifty, u64_zero, "%llu ms")

      demo_marker("Widgets/Data Types/Inputs")
      static inputs_step = true
      ImGui.separator_text("Inputs")
      ImGui.checkbox("Show step buttons", pointerof(inputs_step.val))
      ImGui.input_scalar("input s8", pointerof(s8_v.val), inputs_step.val ? s8_one : nil, nil, "%d")
      ImGui.input_scalar("input u8", pointerof(u8_v.val), inputs_step.val ? u8_one : nil, nil, "%u")
      ImGui.input_scalar("input s16", pointerof(s16_v.val), inputs_step.val ? s16_one : nil, nil, "%d")
      ImGui.input_scalar("input u16", pointerof(u16_v.val), inputs_step.val ? u16_one : nil, nil, "%u")
      ImGui.input_scalar("input s32", pointerof(s32_v.val), inputs_step.val ? s32_one : nil, nil, "%d")
      ImGui.input_scalar("input s32 hex", pointerof(s32_v.val), inputs_step.val ? s32_one : nil, nil, "%04X")
      ImGui.input_scalar("input u32", pointerof(u32_v.val), inputs_step.val ? u32_one : nil, nil, "%u")
      ImGui.input_scalar("input u32 hex", pointerof(u32_v.val), inputs_step.val ? u32_one : nil, nil, "%08X")
      ImGui.input_scalar("input s64", pointerof(s64_v.val), inputs_step.val ? s64_one : nil)
      ImGui.input_scalar("input u64", pointerof(u64_v.val), inputs_step.val ? u64_one : nil)
      ImGui.input_scalar("input float", pointerof(f32_v.val), inputs_step.val ? f32_one : nil)
      ImGui.input_scalar("input double", pointerof(f64_v.val), inputs_step.val ? f64_one : nil)
    end

    demo_marker("Widgets/Multi-component Widgets")
    ImGui.tree_node("Multi-component Widgets") do
      static vec4f = Slice[0.10f32, 0.20f32, 0.30f32, 0.44f32]
      static vec4i = Slice[1, 5, 100, 255]

      ImGui.separator_text("2-wide")
      ImGui.input_float2("input float2", vec4f.val[...2])
      ImGui.drag_float2("drag float2", vec4f.val[...2], 0.01f32, 0.0f32, 1.0f32)
      ImGui.slider_float2("slider float2", vec4f.val[...2], 0.0f32, 1.0f32)
      ImGui.input_int2("input int2", vec4i.val[...2])
      ImGui.drag_int2("drag int2", vec4i.val[...2], 1, 0, 255)
      ImGui.slider_int2("slider int2", vec4i.val[...2], 0, 255)

      ImGui.separator_text("3-wide")
      ImGui.input_float3("input float3", vec4f.val[...3])
      ImGui.drag_float3("drag float3", vec4f.val[...3], 0.01f32, 0.0f32, 1.0f32)
      ImGui.slider_float3("slider float3", vec4f.val[...3], 0.0f32, 1.0f32)
      ImGui.input_int3("input int3", vec4i.val[...3])
      ImGui.drag_int3("drag int3", vec4i.val[...3], 1, 0, 255)
      ImGui.slider_int3("slider int3", vec4i.val[...3], 0, 255)

      ImGui.separator_text("4-wide")
      ImGui.input_float4("input float4", vec4f.val)
      ImGui.drag_float4("drag float4", vec4f.val, 0.01f32, 0.0f32, 1.0f32)
      ImGui.slider_float4("slider float4", vec4f.val, 0.0f32, 1.0f32)
      ImGui.input_int4("input int4", vec4i.val)
      ImGui.drag_int4("drag int4", vec4i.val, 1, 0, 255)
      ImGui.slider_int4("slider int4", vec4i.val, 0, 255)
    end

    demo_marker("Widgets/Vertical Sliders")
    ImGui.tree_node("Vertical Sliders") do
      spacing = 4
      ImGui.with_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(spacing, spacing)) do
        static int_value = 0
        ImGui.v_slider_int("##int", ImVec2.new(18, 160), pointerof(int_value.val), 0, 5)
        ImGui.same_line

        static values = [0.0f32, 0.60f32, 0.35f32, 0.9f32, 0.70f32, 0.20f32, 0.0f32]
        ImGui.with_id("set1") do
          7.times do |i|
            if i > 0
              ImGui.same_line
            end
            ImGui.with_id(i) do
              ImGui.push_style_color(ImGuiCol::FrameBg, ImGui.hsv(i / 7.0f32, 0.5f32, 0.5f32))
              ImGui.push_style_color(ImGuiCol::FrameBgHovered, ImGui.hsv(i / 7.0f32, 0.6f32, 0.5f32))
              ImGui.push_style_color(ImGuiCol::FrameBgActive, ImGui.hsv(i / 7.0f32, 0.7f32, 0.5f32))
              ImGui.push_style_color(ImGuiCol::SliderGrab, ImGui.hsv(i / 7.0f32, 0.9f32, 0.9f32))
              ImGui.v_slider_float("##v", ImVec2.new(18, 160), pointerof(values.val[i]), 0.0f32, 1.0f32, "")
              if ImGui.is_item_active || ImGui.is_item_hovered
                ImGui.set_tooltip("%.3f", values.val[i])
              end
              ImGui.pop_style_color(4)
            end
          end
        end

        ImGui.same_line
        ImGui.with_id("set2") do
          static values2 = [0.20f32, 0.80f32, 0.40f32, 0.25f32]
          rows = 3
          small_slider_size = ImVec2.new(18, ((160.0f32 - (rows - 1) * spacing) / rows).to_i)
          4.times do |nx|
            if nx > 0
              ImGui.same_line
            end
            ImGui.group do
              rows.times do |ny|
                ImGui.with_id(nx * rows + ny) do
                  ImGui.v_slider_float("##v", small_slider_size, pointerof(values2.val[nx]), 0.0f32, 1.0f32, "")
                  if ImGui.is_item_active || ImGui.is_item_hovered
                    ImGui.set_tooltip("%.3f", values2.val[nx])
                  end
                end
              end
            end
          end
        end

        ImGui.same_line
        ImGui.with_id("set3") do
          4.times do |i|
            if i > 0
              ImGui.same_line
            end
            ImGui.with_id(i) do
              ImGui.with_style_var(ImGuiStyleVar::GrabMinSize, 40) do
                ImGui.v_slider_float("##v", ImVec2.new(40, 160), pointerof(values.val[i]), 0.0f32, 1.0f32, "%.2f\nsec")
              end
            end
          end
        end
      end
    end

    demo_marker("Widgets/Drag and drop")
    ImGui.tree_node("Drag and Drop") do
      demo_marker("Widgets/Drag and drop/Standard widgets")
      ImGui.tree_node("Drag and drop in standard widgets") do
        help_marker("You can drag from the color squares.")
        static col1 = Slice[1.0f32, 0.0f32, 0.2f32]
        static col2 = Slice[0.4f32, 0.7f32, 0.0f32, 0.5f32]
        ImGui.color_edit3("color 1", col1.val)
        ImGui.color_edit4("color 2", col2.val)
      end

      demo_marker("Widgets/Drag and drop/Copy-swap items")
      ImGui.tree_node("Drag and drop to copy/swap items") do
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
          ImGui.with_id(n) do
            if (n % 3) != 0
              ImGui.same_line
            end
            ImGui.button(names.val[n], ImVec2.new(60, 60))

            ImGui.drag_drop_source(ImGuiDragDropFlags::None) do
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
            end
            ImGui.drag_drop_target do
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
            end
          end
        end
      end

      demo_marker("Widgets/Drag and Drop/Drag to reorder items (simple)")
      ImGui.tree_node("Drag to reorder items (simple)") do
        help_marker(
          "We don't use the drag and drop api at all here! " +
          "Instead we query when the item is held but not hovered, and order items accordingly.")
        static item_names = ["Item One", "Item Two", "Item Three", "Item Four", "Item Five"]
        item_names.val.size.times do |n|
          item = item_names.val[n]
          ImGui.selectable(item)

          if ImGui.is_item_active && !ImGui.is_item_hovered
            n_next = n + (ImGui.get_mouse_drag_delta(:Left).y < 0f32 ? -1 : 1)
            if n_next >= 0 && n_next < item_names.val.size
              item_names.val[n] = item_names.val[n_next]
              item_names.val[n_next] = item
              ImGui.reset_mouse_drag_delta
            end
          end
        end
      end

      demo_marker("Widgets/Drag and Drop/Tooltip at target location")
      ImGui.tree_node("Tooltip at target location") do
        2.times do |n|
          ImGui.button(n ? "drop here##1" : "drop here##0")
          ImGui.drag_drop_target do
            drop_target_flags = ImGuiDragDropFlags::AcceptBeforeDelivery | ImGuiDragDropFlags::AcceptNoPreviewTooltip
            if payload = ImGui.accept_drag_drop_payload(ImGui::PAYLOAD_TYPE_COLOR_4F, drop_target_flags)
              ImGui.set_mouse_cursor(ImGuiMouseCursor::NotAllowed)
              ImGui.tooltip do
                ImGui.text("Cannot drop here!")
              end
            end
          end

          col4 = ImVec4.new(1.0f32, 0.0f32, 0.2f32, 1.0f32)
          if n == 0
            ImGui.color_button("drag me", col4)
          end
        end
      end
    end

    demo_marker("Widgets/Querying Item Status (Edited,Active,Hovered etc.)")
    ImGui.tree_node("Querying Item Status (Edited/Active/Hovered etc.)") do
      item_names = [
        "Text", "Button", "Button (w/ repeat)", "Checkbox", "SliderFloat", "InputText", "InputTextMultiline", "InputFloat",
        "InputFloat3", "ColorEdit4", "Selectable", "MenuItem", "TreeNode", "TreeNode (w/ double-click)", "Combo", "ListBox",
      ]
      static item_type = 4
      static item_disabled = false
      ImGui.combo("Item Type", pointerof(item_type.val), item_names, item_names.size)
      ImGui.same_line
      help_marker("Testing how various types of items are interacting with the IsItemXXX functions. Note that the bool return value of most ImGui function is generally equivalent to calling ImGui::IsItemHovered().")
      ImGui.checkbox("Item Disabled", pointerof(item_disabled.val))

      ret = false
      static b = false
      static col4f = Slice[1.0f32, 0.5f32, 0.0f32, 1.0f32]
      static str = ImGui::TextBuffer.new(16)
      if item_disabled.val
        ImGui.begin_disabled(true)
      end
      if item_type.val == 0
        ImGui.text("ITEM: Text")
      end
      if item_type.val == 1
        ret = ImGui.button("ITEM: Button")
      end
      if item_type.val == 2
        ImGui.with_button_repeat(true) do
          ret = ImGui.button("ITEM: Button")
        end
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
        ret = ImGui.input_text_multiline("ITEM: InputTextMultiline", str.val)
      end
      if item_type.val == 7
        ret = ImGui.input_float("ITEM: InputFloat", pointerof(col4f.val[0]), 1.0f32)
      end
      if item_type.val == 8
        ret = ImGui.input_float3("ITEM: InputFloat3", col4f.val)
      end
      if item_type.val == 9
        ret = ImGui.color_edit4("ITEM: ColorEdit4", col4f.val)
      end
      if item_type.val == 10
        ret = ImGui.selectable("ITEM: Selectable")
      end
      if item_type.val == 11
        ret = ImGui.menu_item("ITEM: MenuItem")
      end
      if item_type.val == 12
        ret = ImGui.tree_node("ITEM: TreeNode")
        if ret
          ImGui.tree_pop
        end
      end
      if item_type.val == 13
        ret = ImGui.tree_node_ex("ITEM: TreeNode w/ ImGuiTreeNodeFlags_OpenOnDoubleClick", ImGuiTreeNodeFlags::OpenOnDoubleClick | ImGuiTreeNodeFlags::NoTreePushOnOpen)
      end
      if item_type.val == 14
        items = ["Apple", "Banana", "Cherry", "Kiwi"]
        static current = 1
        ret = ImGui.combo("ITEM: Combo", pointerof(current.val), items)
      end
      if item_type.val == 15
        items = ["Apple", "Banana", "Cherry", "Kiwi"]
        static current = 1
        ret = ImGui.list_box("ITEM: ListBox", pointerof(current.val), items, items.size)
      end

      hovered_delay_none = ImGui.is_item_hovered
      hovered_delay_stationary = ImGui.is_item_hovered(ImGuiHoveredFlags::Stationary)
      hovered_delay_short = ImGui.is_item_hovered(ImGuiHoveredFlags::DelayShort)
      hovered_delay_normal = ImGui.is_item_hovered(ImGuiHoveredFlags::DelayNormal)
      hovered_delay_tooltip = ImGui.is_item_hovered(ImGuiHoveredFlags::ForTooltip)

      ImGui.bullet_text(
        "Return value = %d\n" +
        "IsItemFocused() = %d\n" +
        "IsItemHovered() = %d\n" +
        "IsItemHovered(_AllowWhenBlockedByPopup) = %d\n" +
        "IsItemHovered(_AllowWhenBlockedByActiveItem) = %d\n" +
        "IsItemHovered(_AllowWhenOverlappedByItem) = %d\n" +
        "IsItemHovered(_AllowWhenOverlappedByWindow) = %d\n" +
        "IsItemHovered(_AllowWhenDisabled) = %d\n" +
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
        ImGui.is_item_hovered(ImGuiHoveredFlags::AllowWhenOverlappedByItem),
        ImGui.is_item_hovered(ImGuiHoveredFlags::AllowWhenOverlappedByWindow),
        ImGui.is_item_hovered(ImGuiHoveredFlags::AllowWhenDisabled),
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
      ImGui.bullet_text(
        "with Hovering Delay or Stationary test:\n" +
        "IsItemHovered() = = %d\n" +
        "IsItemHovered(_Stationary) = %d\n" +
        "IsItemHovered(_DelayShort) = %d\n" +
        "IsItemHovered(_DelayNormal) = %d\n" +
        "IsItemHovered(_Tooltip) = %d",
        hovered_delay_none, hovered_delay_stationary, hovered_delay_short, hovered_delay_normal, hovered_delay_tooltip)

      if item_disabled.val
        ImGui.end_disabled
      end

      buf = ImGui::TextBuffer.new(1)
      ImGui.input_text("unused", buf, ImGuiInputTextFlags::ReadOnly)
      ImGui.same_line
      help_marker("This widget is only here to be able to tab-out of the widgets above and see e.g. Deactivated() status.")
    end

    demo_marker("Widgets/Querying Window Status (Focused,Hovered etc.)")
    ImGui.tree_node("Querying Window Status (Focused/Hovered etc.)") do
      static embed_all_inside_a_child_window = false
      ImGui.checkbox("Embed everything inside a child window for testing _RootWindow flag.", pointerof(embed_all_inside_a_child_window.val))
      if embed_all_inside_a_child_window.val
        ImGui.begin_child("outer_child", ImVec2.new(0, ImGui.get_font_size * 20.0f32), ImGuiChildFlags::Border)
      end

      ImGui.bullet_text(
        "IsWindowFocused() = %d\n" +
        "IsWindowFocused(_ChildWindows) = %d\n" +
        "IsWindowFocused(_ChildWindows|_NoPopupHierarchy) = %d\n" +
        "IsWindowFocused(_ChildWindows|_RootWindow) = %d\n" +
        "IsWindowFocused(_ChildWindows|_RootWindow|_NoPopupHierarchy) = %d\n" +
        "IsWindowFocused(_RootWindow) = %d\n" +
        "IsWindowFocused(_RootWindow|_NoPopupHierarchy) = %d\n" +
        "IsWindowFocused(_AnyWindow) = %d\n",
        ImGui.is_window_focused,
        ImGui.is_window_focused(ImGuiFocusedFlags::ChildWindows),
        ImGui.is_window_focused(ImGuiFocusedFlags::ChildWindows | ImGuiFocusedFlags::NoPopupHierarchy),
        ImGui.is_window_focused(ImGuiFocusedFlags::ChildWindows | ImGuiFocusedFlags::RootWindow),
        ImGui.is_window_focused(ImGuiFocusedFlags::ChildWindows | ImGuiFocusedFlags::RootWindow | ImGuiFocusedFlags::NoPopupHierarchy),
        ImGui.is_window_focused(ImGuiFocusedFlags::RootWindow),
        ImGui.is_window_focused(ImGuiFocusedFlags::RootWindow | ImGuiFocusedFlags::NoPopupHierarchy),
        ImGui.is_window_focused(ImGuiFocusedFlags::AnyWindow))

      ImGui.bullet_text(
        "IsWindowHovered() = %d\n" +
        "IsWindowHovered(_AllowWhenBlockedByPopup) = %d\n" +
        "IsWindowHovered(_AllowWhenBlockedByActiveItem) = %d\n" +
        "IsWindowHovered(_ChildWindows) = %d\n" +
        "IsWindowHovered(_ChildWindows|_NoPopupHierarchy) = %d\n" +
        "IsWindowHovered(_ChildWindows|_RootWindow) = %d\n" +
        "IsWindowHovered(_ChildWindows|_RootWindow|_NoPopupHierarchy) = %d\n" +
        "IsWindowHovered(_RootWindow) = %d\n" +
        "IsWindowHovered(_RootWindow|_NoPopupHierarchy) = %d\n" +
        "IsWindowHovered(_ChildWindows|_AllowWhenBlockedByPopup) = %d\n" +
        "IsWindowHovered(_AnyWindow) = %d\n" +
        "IsWindowHovered(_Stationary) = %d\n",
        ImGui.is_window_hovered,
        ImGui.is_window_hovered(ImGuiHoveredFlags::AllowWhenBlockedByPopup),
        ImGui.is_window_hovered(ImGuiHoveredFlags::AllowWhenBlockedByActiveItem),
        ImGui.is_window_hovered(ImGuiHoveredFlags::ChildWindows),
        ImGui.is_window_hovered(ImGuiHoveredFlags::ChildWindows | ImGuiHoveredFlags::NoPopupHierarchy),
        ImGui.is_window_hovered(ImGuiHoveredFlags::ChildWindows | ImGuiHoveredFlags::RootWindow),
        ImGui.is_window_hovered(ImGuiHoveredFlags::ChildWindows | ImGuiHoveredFlags::RootWindow | ImGuiHoveredFlags::NoPopupHierarchy),
        ImGui.is_window_hovered(ImGuiHoveredFlags::RootWindow),
        ImGui.is_window_hovered(ImGuiHoveredFlags::RootWindow | ImGuiHoveredFlags::NoPopupHierarchy),
        ImGui.is_window_hovered(ImGuiHoveredFlags::ChildWindows | ImGuiHoveredFlags::AllowWhenBlockedByPopup),
        ImGui.is_window_hovered(ImGuiHoveredFlags::AnyWindow),
        ImGui.is_window_hovered(ImGuiHoveredFlags::Stationary))

      ImGui.child("child", ImVec2.new(0, 50), ImGuiChildFlags::Border) do
        ImGui.text("This is another child window for testing the _ChildWindows flag.")
      end
      if embed_all_inside_a_child_window.val
        ImGui.end_child
      end

      static test_window = false
      ImGui.checkbox("Hovered/Active tests after Begin() for title bar testing", pointerof(test_window.val))
      if test_window.val
        ImGui.window("Title bar Hovered/Active tests", pointerof(test_window.val)) do
          ImGui.popup_context_item do
            if ImGui.menu_item("Close")
              test_window.val = false
            end
          end
          ImGui.text(
            "IsItemHovered() after begin = %d (== is title bar hovered)\n" +
            "IsItemActive() after begin = %d (== is window being clicked/moved)\n",
            ImGui.is_item_hovered, ImGui.is_item_active)
        end
      end
    end

    if disable_all.val
      ImGui.end_disabled
    end

    demo_marker("Widgets/Disable Block")
    ImGui.tree_node("Disable block") do
      ImGui.checkbox("Disable entire section above", pointerof(disable_all.val))
      ImGui.same_line
      help_marker("Demonstrate using BeginDisabled()/EndDisabled() across this section.")
    end

    demo_marker("Widgets/Text Filter")
    ImGui.tree_node("Text Filter") do
      help_marker("Not a widget per-se, but ImGuiTextFilter is a helper to perform simple filtering on text strings.")
      static filter = ImGuiTextFilter.new
      ImGui.text("Filter usage:\n" +
                 "  \"\"         display all lines\n" +
                 "  \"xxx\"      display lines containing \"xxx\"\n" +
                 "  \"xxx,yyy\"  display lines containing \"xxx\" or \"yyy\"\n" +
                 "  \"-xxx\"     hide lines containing \"xxx\"")
      filter.val.draw
      lines = ["aaa1.c", "bbb1.c", "ccc1.c", "aaa2.cpp", "bbb2.cpp", "ccc2.cpp", "abc.h", "hello, world"]
      lines.size.times do |i|
        if filter.val.pass_filter(lines[i])
          ImGui.bullet_text("%s", lines[i])
        end
      end
    end
  end

  def self.show_demo_window_layout
    demo_marker("Layout")
    if !ImGui.collapsing_header("Layout & Scrolling")
      return
    end

    demo_marker("Layout/Child windows")
    ImGui.tree_node("Child windows") do
      ImGui.separator_text("Child windows")

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
        ImGui.child("ChildL", ImVec2.new(ImGui.get_content_region_avail.x * 0.5f32, 260), ImGuiChildFlags::None, window_flags) do
          100.times do |i|
            ImGui.text("%04d: scrollable region", i)
          end
        end
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
        ImGui.with_style_var(ImGuiStyleVar::ChildRounding, 5.0f32) do
          ImGui.child("ChildR", ImVec2.new(0, 260), ImGuiChildFlags::Border, window_flags) do
            if !disable_menu.val && ImGui.begin_menu_bar
              ImGui.menu("Menu") do
                show_example_menu_file
              end
              ImGui.end_menu_bar
            end
            ImGui.table("split", 2, ImGuiTableFlags::Resizable | ImGuiTableFlags::NoSavedSettings) do
              100.times do |i|
                buf = sprintf("%03d", i)
                ImGui.table_next_column
                ImGui.button(buf, ImVec2.new(-Float32::MIN_POSITIVE, 0.0f32))
              end
            end
          end
        end
      end

      ImGui.separator_text("Manual-resize")
      begin
        help_marker("Drag bottom border to resize. Double-click bottom border to auto-fit to vertical contents.")
        ImGui.with_style_color(ImGuiCol::ChildBg, ImGui.get_style_color_vec4(ImGuiCol::FrameBg)) do
          if ImGui.begin_child("ResizableChild", ImVec2.new(-Float32::MIN_POSITIVE, ImGui.get_text_line_height_with_spacing * 8), ImGuiChildFlags::Border | ImGuiChildFlags::ResizeY)
            10.times do |n|
              ImGui.text("Line %04d", n)
            end
          end
        end
        ImGui.end_child
      end

      ImGui.separator_text("Auto-resize with constraints")
      begin
        static draw_lines = 3
        static max_height_in_lines = 10
        ImGui.set_next_item_width(ImGui.get_font_size * 8)
        ImGui.drag_int("Lines Count", pointerof(draw_lines.val), 0.2f32)
        ImGui.set_next_item_width(ImGui.get_font_size * 8)
        ImGui.drag_int("Max Height (in Lines)", pointerof(max_height_in_lines.val), 0.2f32)

        ImGui.set_next_window_size_constraints(ImVec2.new(0.0f32, ImGui.get_text_line_height_with_spacing * 1), ImVec2.new(Float32::MAX, ImGui.get_text_line_height_with_spacing * max_height_in_lines.val))
        if ImGui.begin_child("ConstrainedChild", ImVec2.new(-Float32::MIN_POSITIVE, 0.0f32), ImGuiChildFlags::Border | ImGuiChildFlags::AutoResizeY)
          draw_lines.val.times do |n|
            ImGui.text("Line %04d", n)
          end
        end
        ImGui.end_child
      end

      ImGui.separator_text("Misc/Advanced")
      begin
        static offset_x = 0
        static override_bg_color = true
        static child_flags = ImGuiChildFlags::Border | ImGuiChildFlags::ResizeX | ImGuiChildFlags::ResizeY
        ImGui.set_next_item_width(ImGui.get_font_size * 8)
        ImGui.drag_int("Offset X", pointerof(offset_x.val), 1.0f32, -1000, 1000)
        ImGui.checkbox("Override ChildBg color", pointerof(override_bg_color.val))
        ImGui.checkbox_flags("ImGuiChildFlags_Border", pointerof(child_flags.val), ImGuiChildFlags::Border)
        ImGui.checkbox_flags("ImGuiChildFlags_AlwaysUseWindowPadding", pointerof(child_flags.val), ImGuiChildFlags::AlwaysUseWindowPadding)
        ImGui.checkbox_flags("ImGuiChildFlags_ResizeX", pointerof(child_flags.val), ImGuiChildFlags::ResizeX)
        ImGui.checkbox_flags("ImGuiChildFlags_ResizeY", pointerof(child_flags.val), ImGuiChildFlags::ResizeY)
        ImGui.checkbox_flags("ImGuiChildFlags_FrameStyle", pointerof(child_flags.val), ImGuiChildFlags::FrameStyle)
        ImGui.same_line
        help_marker("Style the child window like a framed item: use FrameBg, FrameRounding, FrameBorderSize, FramePadding instead of ChildBg, ChildRounding, ChildBorderSize, WindowPadding.")
        if child_flags.val.includes?(:FrameStyle)
          override_bg_color.val = false
        end

        ImGui.set_cursor_pos_x(ImGui.get_cursor_pos_x + offset_x.val)
        if override_bg_color.val
          ImGui.push_style_color(ImGuiCol::ChildBg, ImGui.col32(255, 0, 0, 100))
        end
        ImGui.begin_child("Red", ImVec2.new(200, 100), child_flags.val, ImGuiWindowFlags::None)
        if override_bg_color.val
          ImGui.pop_style_color
        end

        50.times do |n|
          ImGui.text("Some test %d", n)
        end
        ImGui.end_child
        child_is_hovered = ImGui.is_item_hovered
        child_rect_min = ImGui.get_item_rect_min
        child_rect_max = ImGui.get_item_rect_max
        ImGui.text("Hovered: %d", child_is_hovered)
        ImGui.text("Rect of child window is: (%.0f,%.0f) (%.0f,%.0f)", child_rect_min.x, child_rect_min.y, child_rect_max.x, child_rect_max.y)
      end
    end

    demo_marker("Layout/Widgets Width")
    ImGui.tree_node("Widgets Width") do
      static f = 0.0f32
      static show_indented_items = true
      ImGui.checkbox("Show indented items", pointerof(show_indented_items.val))

      ImGui.text("SetNextItemWidth/PushItemWidth(100)")
      ImGui.same_line
      help_marker("Fixed width.")
      ImGui.with_item_width(100) do
        ImGui.drag_float("float##1b", pointerof(f.val))
        if show_indented_items.val
          ImGui.indent
          ImGui.drag_float("float (indented)##1b", pointerof(f.val))
          ImGui.unindent
        end
      end

      ImGui.text("SetNextItemWidth/PushItemWidth(-100)")
      ImGui.same_line
      help_marker("Align to right edge minus 100")
      ImGui.with_item_width(-100) do
        ImGui.drag_float("float##2a", pointerof(f.val))
        if show_indented_items.val
          ImGui.indent
          ImGui.drag_float("float (indented)##2b", pointerof(f.val))
          ImGui.unindent
        end
      end

      ImGui.text("SetNextItemWidth/PushItemWidth(GetContentRegionAvail().x * 0.5f)")
      ImGui.same_line
      help_marker("Half of available width.\n(~ right-cursor_pos)\n(works within a column set)")
      ImGui.with_item_width(ImGui.get_content_region_avail.x * 0.5f32) do
        ImGui.drag_float("float##3a", pointerof(f.val))
        if show_indented_items.val
          ImGui.indent
          ImGui.drag_float("float (indented)##3b", pointerof(f.val))
          ImGui.unindent
        end
      end

      ImGui.text("SetNextItemWidth/PushItemWidth(-GetContentRegionAvail().x * 0.5f)")
      ImGui.same_line
      help_marker("Align to right edge minus half")
      ImGui.with_item_width(-ImGui.get_content_region_avail.x * 0.5f32) do
        ImGui.drag_float("float##4a", pointerof(f.val))
        if show_indented_items.val
          ImGui.indent
          ImGui.drag_float("float (indented)##4b", pointerof(f.val))
          ImGui.unindent
        end
      end

      ImGui.text("SetNextItemWidth/PushItemWidth(-FLT_MIN)")
      ImGui.same_line
      help_marker("Align to right edge")
      ImGui.with_item_width(-Float32::MIN_POSITIVE) do
        ImGui.drag_float("##float5a", pointerof(f.val))
        if show_indented_items.val
          ImGui.indent
          ImGui.drag_float("float (indented)##5b", pointerof(f.val))
          ImGui.unindent
        end
      end
    end

    demo_marker("Layout/Basic Horizontal Layout")
    ImGui.tree_node("Basic Horizontal Layout") do
      ImGui.text_wrapped("(Use ImGui::SameLine() to keep adding items to the right of the preceding item)")

      demo_marker("Layout/Basic Horizontal Layout/SameLine")
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

      demo_marker("Layout/Basic Horizontal Layout/SameLine (with offset)")
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

      demo_marker("Layout/Basic Horizontal Layout/SameLine (more)")
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
      items = ["AAAA", "BBBB", "CCCC", "DDDD"]
      static item = -1
      ImGui.with_item_width(80) do
        ImGui.combo("Combo", pointerof(item.val), items, items.size)
        ImGui.same_line
        ImGui.slider_float("X", pointerof(f0.val), 0.0f32, 5.0f32)
        ImGui.same_line
        ImGui.slider_float("Y", pointerof(f1.val), 0.0f32, 5.0f32)
        ImGui.same_line
        ImGui.slider_float("Z", pointerof(f2.val), 0.0f32, 5.0f32)
      end

      ImGui.with_item_width(80) do
        ImGui.text("Lists:")
        static selection = [0, 1, 2, 3]
        4.times do |i|
          if i > 0
            ImGui.same_line
          end
          ImGui.with_id(i) do
            ImGui.list_box("", pointerof(selection.val[i]), items)
          end
        end
      end

      demo_marker("Layout/Basic Horizontal Layout/Dummy")
      button_sz = ImVec2.new(40, 40)
      ImGui.button("A", button_sz)
      ImGui.same_line
      ImGui.dummy(button_sz)
      ImGui.same_line
      ImGui.button("B", button_sz)

      demo_marker("Layout/Basic Horizontal Layout/Manual wrapping")
      ImGui.text("Manual wrapping:")
      style = ImGui.get_style
      buttons_count = 20
      window_visible_x2 = ImGui.get_window_pos.x + ImGui.get_window_content_region_max.x
      buttons_count.times do |n|
        ImGui.with_id(n) do
          ImGui.button("Box", button_sz)
          last_button_x2 = ImGui.get_item_rect_max.x
          next_button_x2 = last_button_x2 + style.item_spacing.x + button_sz.x
          if n + 1 < buttons_count && next_button_x2 < window_visible_x2
            ImGui.same_line
          end
        end
      end
    end

    demo_marker("Layout/Groups")
    ImGui.tree_node("Groups") do
      help_marker(
        "BeginGroup() basically locks the horizontal position for new line. " +
        "EndGroup() bundles the whole group so that you can use \"item\" functions such as " +
        "IsItemHovered()/IsItemActive() or SameLine() etc. on the whole group.")
      size = ImVec2.new(0, 0)
      ImGui.group do
        begin
          ImGui.group do
            ImGui.button("AAA")
            ImGui.same_line
            ImGui.button("BBB")
            ImGui.same_line
            ImGui.group do
              ImGui.button("CCC")
              ImGui.button("DDD")
            end
            ImGui.same_line
            ImGui.button("EEE")
          end
          ImGui.set_item_tooltip("First group hovered")
        end

        size = ImGui.get_item_rect_size
        values = [0.5f32, 0.20f32, 0.80f32, 0.60f32, 0.25f32]
        ImGui.plot_histogram("##values", values, 0, nil, 0.0f32, 1.0f32, size)

        ImGui.button("ACTION", ImVec2.new((size.x - ImGui.get_style.item_spacing.x) * 0.5f32, size.y))
        ImGui.same_line
        ImGui.button("REACTION", ImVec2.new((size.x - ImGui.get_style.item_spacing.x) * 0.5f32, size.y))
      end
      ImGui.same_line

      ImGui.button("LEVERAGE\nBUZZWORD", size)
      ImGui.same_line

      ImGui.list_box("List", size) do
        ImGui.selectable("Selected", true)
        ImGui.selectable("Not Selected", false)
      end
    end

    demo_marker("Layout/Text Baseline Alignment")
    ImGui.tree_node("Text Baseline Alignment") do
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
        ImGui.button("Button()")
        ImGui.same_line
        ImGui.small_button("SmallButton()")

        spacing = ImGui.get_style.item_inner_spacing.x
        ImGui.button("Button##1")
        ImGui.same_line(0.0f32, spacing)
        ImGui.tree_node("Node##1") do
          6.times do |i|
            ImGui.bullet_text("Item %d..", i)
          end
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
    end

    demo_marker("Layout/Scrolling")
    ImGui.tree_node("Scrolling") do
      demo_marker("Layout/Scrolling/Vertical")
      help_marker("Use SetScrollHereY() or SetScrollFromPosY() to scroll to a given vertical position.")

      static track_item = 50
      static enable_track = true
      static enable_extra_decorations = false
      static scroll_to_off_px = 0.0f32
      static scroll_to_pos_px = 200.0f32

      ImGui.checkbox("Decoration", pointerof(enable_extra_decorations.val))

      ImGui.checkbox("Track", pointerof(enable_track.val))
      scroll_to_off = scroll_to_pos = false
      ImGui.with_item_width(100) do
        ImGui.same_line(140)
        enable_track.val |= ImGui.drag_int("##item", pointerof(track_item.val), 0.25f32, 0, 99, "Item = %d")

        scroll_to_off = ImGui.button("Scroll Offset")
        ImGui.same_line(140)
        scroll_to_off |= ImGui.drag_float("##off", pointerof(scroll_to_off_px.val), 1.00f32, 0, Float32::MAX, "+%.0f px")

        scroll_to_pos = ImGui.button("Scroll To Pos")
        ImGui.same_line(140)
        scroll_to_pos |= ImGui.drag_float("##pos", pointerof(scroll_to_pos_px.val), 1.00f32, -10, Float32::MAX, "X/Y = %.0f px")
      end

      if scroll_to_off || scroll_to_pos
        enable_track.val = false
      end

      style = ImGui.get_style
      child_w = (ImGui.get_content_region_avail.x - 4 * style.item_spacing.x) / 5
      if child_w < 1.0f32
        child_w = 1.0f32
      end
      ImGui.with_id("##VerticalScrolling") do
        5.times do |i|
          if i > 0
            ImGui.same_line
          end
          ImGui.group do
            names = ["Top", "25%", "Center", "75%", "Bottom"]
            ImGui.text_unformatted(names[i])

            child_flags = enable_extra_decorations.val ? ImGuiWindowFlags::MenuBar : ImGuiWindowFlags::None
            child_id = ImGui.get_id(i)
            child_is_visible = ImGui.begin_child(child_id, ImVec2.new(child_w, 200.0f32), ImGuiChildFlags::Border, child_flags)
            ImGui.menu_bar do
              ImGui.text_unformatted("abc")
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
          end
        end
      end

      demo_marker("Layout/Scrolling/Horizontal")
      ImGui.spacing
      help_marker(
        "Use SetScrollHereX() or SetScrollFromPosX() to scroll to a given horizontal position.\n\n" +
        "Because the clipping rectangle of most window hides half worth of WindowPadding on the " +
        "left/right, using SetScrollFromPosX(+1) will usually result in clipped text whereas the " +
        "equivalent SetScrollFromPosY(+1) wouldn't.")
      ImGui.with_id("##HorizontalScrolling") do
        5.times do |i|
          child_height = ImGui.get_text_line_height + style.scrollbar_size + style.window_padding.y * 2.0f32
          child_flags = ImGuiWindowFlags::HorizontalScrollbar | (enable_extra_decorations.val ? ImGuiWindowFlags::AlwaysVerticalScrollbar : ImGuiWindowFlags::None)
          child_id = ImGui.get_id(i)
          child_is_visible = ImGui.begin_child(child_id, ImVec2.new(-100, child_height), ImGuiChildFlags::Border, child_flags)
          if scroll_to_off
            ImGui.set_scroll_x(scroll_to_off_px.val)
          end
          if scroll_to_pos
            ImGui.set_scroll_from_pos_x(ImGui.get_cursor_start_pos.x + scroll_to_pos_px.val, i * 0.25f32)
          end
          if child_is_visible
            100.times do |item|
              if item > 0
                ImGui.same_line
              end
              if enable_track.val && item == track_item.val
                ImGui.text_colored(ImVec4.new(1, 1, 0, 1), "Item %d", item)
                ImGui.set_scroll_here_x(i * 0.25f32)
              else
                ImGui.text("Item %d", item)
              end
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
      end

      demo_marker("Layout/Scrolling/Horizontal (more)")
      help_marker(
        "Horizontal scrolling for a window is enabled via the ImGuiWindowFlags_HorizontalScrollbar flag.\n\n" +
        "You may want to also explicitly specify content width by using SetNextWindowContentWidth() before Begin().")
      static lines = 7
      ImGui.slider_int("Lines", pointerof(lines.val), 1, 15)
      ImGui.push_style_var(ImGuiStyleVar::FrameRounding, 3.0f32)
      ImGui.push_style_var(ImGuiStyleVar::FramePadding, ImVec2.new(2.0f32, 1.0f32))
      scrolling_child_size = ImVec2.new(0, ImGui.get_frame_height_with_spacing * 7 + 30)
      scroll_x = scroll_max_x = 0f32
      ImGui.child("scrolling", scrolling_child_size, ImGuiChildFlags::Border, ImGuiWindowFlags::HorizontalScrollbar) do
        lines.val.times do |line|
          num_buttons = 10 + ((line.odd?) ? line * 9 : line * 3)
          num_buttons.times do |n|
            if n > 0
              ImGui.same_line
            end
            ImGui.with_id(n + line * 1000) do
              num_buf = sprintf("%d", n)
              label = (n % 15 == 0) ? "FizzBuzz" : (n % 3 == 0) ? "Fizz" : (n % 5 == 0) ? "Buzz" : num_buf
              hue = n * 0.05f32
              ImGui.push_style_color(ImGuiCol::Button, ImGui.hsv(hue, 0.6f32, 0.6f32))
              ImGui.push_style_color(ImGuiCol::ButtonHovered, ImGui.hsv(hue, 0.7f32, 0.7f32))
              ImGui.push_style_color(ImGuiCol::ButtonActive, ImGui.hsv(hue, 0.8f32, 0.8f32))
              ImGui.button(label, ImVec2.new(40.0f32 + Math.sin((line + n)) * 20.0f32, 0.0f32))
              ImGui.pop_style_color(3)
            end
          end
        end
        scroll_x = ImGui.get_scroll_x
        scroll_max_x = ImGui.get_scroll_max_x
      end
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
        ImGui.child("scrolling") do
          ImGui.set_scroll_x(ImGui.get_scroll_x + scroll_x_delta)
        end
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
        ImGui.window("Horizontal contents size demo window", pointerof(show_horizontal_contents_size_demo_window.val), show_h_scrollbar.val ? ImGuiWindowFlags::HorizontalScrollbar : ImGuiWindowFlags::None) do
          demo_marker("Layout/Scrolling/Horizontal contents size demo window")
          ImGui.push_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(2, 0))
          ImGui.push_style_var(ImGuiStyleVar::FramePadding, ImVec2.new(2, 0))
          help_marker(
            "Test how different widgets react and impact the work rectangle growing when horizontal scrolling is enabled.\n\n" +
            "Use 'Metrics->Tools->Show windows rectangles' to visualize rectangles.")
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
            ImGui.tree_node("this is a tree node") do
              ImGui.tree_node("another one of those tree node...") do
                ImGui.text("Some tree contents")
              end
            end
            ImGui.collapsing_header("CollapsingHeader", pointerof(open))
          end
          if show_text_wrapped.val
            ImGui.text_wrapped("This text should automatically wrap on the edge of the work rectangle.")
          end
          if show_columns.val
            ImGui.text("Tables:")
            ImGui.table("table", 4, ImGuiTableFlags::Borders) do
              4.times do |n|
                ImGui.table_next_column
                ImGui.text("Width %.2f", ImGui.get_content_region_avail.x)
              end
            end
            ImGui.text("Columns:")
            ImGui.columns(4)
            4.times do |n|
              ImGui.text("Width %.2f", ImGui.get_column_width)
              ImGui.next_column
            end
            ImGui.columns(1)
          end
          if show_tab_bar.val && ImGui.begin_tab_bar("Hello")
            ImGui.tab_item("OneOneOne") do
            end
            ImGui.tab_item("TwoTwoTwo") do
            end
            ImGui.tab_item("ThreeThreeThree") do
            end
            ImGui.tab_item("FourFourFour") do
            end
            ImGui.end_tab_bar
          end
          if show_child.val
            ImGui.child("child", ImVec2.new(0, 0), ImGuiChildFlags::Border) do
            end
          end
        end
      end
    end

    demo_marker("Layout/Clipping")
    ImGui.tree_node("Clipping") do
      static size = ImVec2.new(100.0f32, 100.0f32)
      static offset = ImVec2.new(30.0f32, 30.0f32)
      ImGui.drag_float2("size", pointerof(size.val), 0.5f32, 1.0f32, 200.0f32, "%.0f")
      ImGui.text_wrapped("(Click and drag to scroll)")

      help_marker(
        "(Left) Using ImGui::PushClipRect():\n" +
        "Will alter ImGui hit-testing logic + ImDrawList rendering.\n" +
        "(use this if you want your clipping rectangle to affect interactions)\n\n" +
        "(Center) Using ImDrawList::PushClipRect():\n" +
        "Will alter ImDrawList rendering only.\n" +
        "(use this as a shortcut if you are only using ImDrawList calls)\n\n" +
        "(Right) Using ImDrawList::AddText() with a fine ClipRect:\n" +
        "Will alter only this specific ImDrawList::AddText() rendering.\n" +
        "This is often used internally to avoid altering the clipping rectangle and minimize draw calls.")

      3.times do |n|
        if n > 0
          ImGui.same_line
        end

        ImGui.with_id(n) do
          ImGui.invisible_button("##canvas", size.val)
          if ImGui.is_item_active && ImGui.is_mouse_dragging(ImGuiMouseButton::Left)
            offset.val = ImVec2.new(offset.val.x + ImGui.get_io.mouse_delta.x, offset.val.y + ImGui.get_io.mouse_delta.y)
          end
        end
        if !ImGui.is_item_visible
          next
        end

        p0 = ImGui.get_item_rect_min
        p1 = ImGui.get_item_rect_max
        text_str = "Line 1 hello\nLine 2 clip me!"
        text_pos = ImVec2.new(p0.x + offset.val.x, p0.y + offset.val.y)
        draw_list = ImGui.get_window_draw_list
        case n
        when 0
          ImGui.with_clip_rect(p0, p1, true) do
            draw_list.add_rect_filled(p0, p1, ImGui.col32(90, 90, 120, 255))
            draw_list.add_text(text_pos, ImGui.col32(255, 255, 255), text_str)
          end
        when 1
          draw_list.push_clip_rect(p0, p1, true)
          draw_list.add_rect_filled(p0, p1, ImGui.col32(90, 90, 120, 255))
          draw_list.add_text(text_pos, ImGui.col32(255, 255, 255), text_str)
          draw_list.pop_clip_rect
        when 2
          clip_rect = ImVec4.new(p0.x, p0.y, p1.x, p1.y)
          draw_list.add_rect_filled(p0, p1, ImGui.col32(90, 90, 120, 255))
          draw_list.add_text(ImGui.get_font, ImGui.get_font_size, text_pos, ImGui.col32(255, 255, 255), text_str, 0.0f32, pointerof(clip_rect))
        end
      end
    end

    demo_marker("Layout/Overlap Mode")
    ImGui.tree_node("Overlap Mode") do
      static enable_allow_overlap = true

      help_marker(
        "Hit-testing is by default performed in item submission order, which generally is perceived as 'back-to-front'.\n\n" +
        "By using SetNextItemAllowOverlap() you can notify that an item may be overlapped by another. " +
        "Doing so alters the hovering logic: items using AllowOverlap mode requires an extra frame to accept hovered state.")
      ImGui.checkbox("Enable AllowOverlap", pointerof(enable_allow_overlap.val))

      button1_pos = ImGui.get_cursor_screen_pos
      button2_pos = ImVec2.new(button1_pos.x + 50.0f32, button1_pos.y + 50.0f32)
      if enable_allow_overlap.val
        ImGui.set_next_item_allow_overlap
      end
      ImGui.button("Button 1", ImVec2.new(80, 80))
      ImGui.set_cursor_screen_pos(button2_pos)
      ImGui.button("Button 2", ImVec2.new(80, 80))

      if enable_allow_overlap.val
        ImGui.set_next_item_allow_overlap
      end
      ImGui.selectable("Some Selectable", false)
      ImGui.same_line
      ImGui.small_button("++")
    end
  end

  def self.show_demo_window_popups
    demo_marker("Popups")
    if !ImGui.collapsing_header("Popups & Modal windows")
      return
    end
    demo_marker("Popups/Popups")
    ImGui.tree_node("Popups") do
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
      ImGui.popup("my_select_popup") do
        ImGui.separator_text("Aquarium")
        names.size.times do |i|
          if ImGui.selectable(names[i])
            selected_fish.val = i
          end
        end
      end

      if ImGui.button("Toggle..")
        ImGui.open_popup("my_toggle_popup")
      end
      ImGui.popup("my_toggle_popup") do
        names.size.times do |i|
          ImGui.menu_item(names[i], "", pointerof(toggles.val[i]))
        end
        ImGui.menu("Sub-menu") do
          ImGui.menu_item("Click me")
        end

        ImGui.separator
        ImGui.text("Tooltip here")
        ImGui.set_item_tooltip("I am a tooltip over a popup")

        if ImGui.button("Stacked Popup")
          ImGui.open_popup("another popup")
        end
        ImGui.popup("another popup") do
          names.size.times do |i|
            ImGui.menu_item(names[i], "", pointerof(toggles.val[i]))
          end
          ImGui.menu("Sub-menu") do
            ImGui.menu_item("Click me")
            if ImGui.button("Stacked Popup")
              ImGui.open_popup("another popup")
            end
            ImGui.popup("another popup") do
              ImGui.text("I am the last one here.")
            end
          end
        end
      end

      if ImGui.button("With a menu..")
        ImGui.open_popup("my_file_popup")
      end
      ImGui.popup("my_file_popup", ImGuiWindowFlags::MenuBar) do
        ImGui.menu_bar do
          ImGui.menu("File") do
            show_example_menu_file
          end
          ImGui.menu("Edit") do
            ImGui.menu_item("Dummy")
          end
        end
        ImGui.text("Hello from popup!")
        ImGui.button("This is a dummy button..")
      end
    end

    demo_marker("Popups/Context menus")
    ImGui.tree_node("Context menus") do
      help_marker("\"Context\" functions are simple helpers to associate a Popup to a given Item or Window identifier.")
      begin
        names = ["Label1", "Label2", "Label3", "Label4", "Label5"]
        static selected = -1
        5.times do |n|
          if ImGui.selectable(names[n], selected.val == n)
            selected.val = n
          end
          ImGui.popup_context_item do
            selected.val = n
            ImGui.text("This a popup for \"%s\"!", names[n])
            if ImGui.button("Close")
              ImGui.close_current_popup
            end
          end
          ImGui.set_item_tooltip("Right-click to open popup")
        end
      end

      begin
        help_marker("Text() elements don't have stable identifiers so we need to provide one.")
        static value = 0.5f32
        ImGui.text("Value = %.3f <-- (1) right-click this text", value.val)
        ImGui.popup_context_item("my popup") do
          if ImGui.selectable("Set to zero")
            value.val = 0.0f32
          end
          if ImGui.selectable("Set to PI")
            value.val = 3.1415f32
          end
          ImGui.set_next_item_width(-Float32::MIN_POSITIVE)
          ImGui.drag_float("##Value", pointerof(value.val), 0.1f32, 0.0f32, 0.0f32)
        end

        ImGui.text("(2) Or right-click this text")
        ImGui.open_popup_on_item_click("my popup", ImGuiPopupFlags::MouseButtonRight)

        if ImGui.button("(3) Or click this button")
          ImGui.open_popup("my popup")
        end
      end

      begin
        help_marker("Showcase using a popup ID linked to item ID, with the item having a changing label + stable ID using the ### operator.")
        static name = ImGui::TextBuffer.new("Label1", 32)
        buf = sprintf("Button: %s###Button", name.val)
        ImGui.button(buf)
        ImGui.popup_context_item do
          ImGui.text("Edit name:")
          ImGui.input_text("##edit", name.val)
          if ImGui.button("Close")
            ImGui.close_current_popup
          end
        end
        ImGui.same_line
        ImGui.text("(<-- right-click here)")
      end
    end

    demo_marker("Popups/Modals")
    ImGui.tree_node("Modals") do
      ImGui.text_wrapped("Modal windows are like popups but the user cannot close them by clicking outside.")

      if ImGui.button("Delete..")
        ImGui.open_popup("Delete?")
      end

      center = ImGui.get_main_viewport.get_center
      ImGui.set_next_window_pos(center, ImGuiCond::Appearing, ImVec2.new(0.5f32, 0.5f32))

      ImGui.popup_modal("Delete?", flags: ImGuiWindowFlags::AlwaysAutoResize) do
        ImGui.text("All those beautiful files will be deleted.\nThis operation cannot be undone!")
        ImGui.separator

        static dont_ask_me_next_time = false
        ImGui.with_style_var(ImGuiStyleVar::FramePadding, ImVec2.new(0, 0)) do
          ImGui.checkbox("Don't ask me next time", pointerof(dont_ask_me_next_time.val))
        end

        if ImGui.button("OK", ImVec2.new(120, 0))
          ImGui.close_current_popup
        end
        ImGui.set_item_default_focus
        ImGui.same_line
        if ImGui.button("Cancel", ImVec2.new(120, 0))
          ImGui.close_current_popup
        end
      end

      if ImGui.button("Stacked modals..")
        ImGui.open_popup("Stacked 1")
      end
      ImGui.popup_modal("Stacked 1", flags: ImGuiWindowFlags::MenuBar) do
        ImGui.menu_bar do
          ImGui.menu("File") do
            if ImGui.menu_item("Some menu item")
            end
          end
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
        ImGui.popup_modal("Stacked 2", pointerof(unused_open)) do
          ImGui.text("Hello from Stacked The Second!")
          if ImGui.button("Close")
            ImGui.close_current_popup
          end
        end

        if ImGui.button("Close")
          ImGui.close_current_popup
        end
      end
    end

    demo_marker("Popups/Menus inside a regular window")
    ImGui.tree_node("Menus inside a regular window") do
      ImGui.text_wrapped("Below we are testing adding menu items to a regular window. It's rather unusual but should work!")
      ImGui.separator

      ImGui.menu_item("Menu item", "CTRL+M")
      ImGui.menu("Menu inside a regular window") do
        show_example_menu_file
      end
      ImGui.separator
    end
  end

  private enum MyItemColumnID
    ID
    Name
    Action
    Quantity
    Description
  end

  private class MyItem
    def initialize(
      @id : Int32,
      @name : String,
      @quantity : Int32
    )
    end

    property id, name, quantity
    class_property! s_current_sort_specs : ImGuiTableSortSpecs?

    def self.sort_with_sort_specs(sort_specs, items)
      MyItem.s_current_sort_specs = sort_specs
      if items.size > 1
        items.sort!
      end
      MyItem.s_current_sort_specs = nil
    end

    def <=>(rhs)
      a = self
      b = rhs
      MyItem.s_current_sort_specs.specs_count.times do |n|
        sort_spec = MyItem.s_current_sort_specs.specs[n]
        delta = 0
        case MyItemColumnID.new(sort_spec.column_user_id.to_i)
        when MyItemColumnID::ID
          delta = (a.id - b.id)
        when MyItemColumnID::Name
          delta = (a.name <=> b.name)
        when MyItemColumnID::Quantity
          delta = (a.quantity - b.quantity)
        when MyItemColumnID::Description
          delta = (a.name <=> b.name)
        else
          ImGuiDemo.assert(false)
        end
        if delta > 0
          return (sort_spec.sort_direction == ImGuiSortDirection::Ascending) ? +1 : -1
        end
        if delta < 0
          return (sort_spec.sort_direction == ImGuiSortDirection::Ascending) ? -1 : +1
        end
      end

      return (a.id - b.id)
    end
  end

  def self.with_style_compact
    style = ImGui.get_style
    ImGui.push_style_var(ImGuiStyleVar::FramePadding, ImVec2.new(style.frame_padding.x, (style.frame_padding.y * 0.60f32).to_i))
    ImGui.push_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(style.item_spacing.x, (style.item_spacing.y * 0.60f32).to_i))
    yield
    ImGui.pop_style_var(2)
  end

  private record EnumDesc,
    value : ImGuiTableFlags,
    name : String,
    tooltip : String

  ImGui.pointer_wrapper def self.edit_table_sizing_flags(p_flags)
    policies = [
      EnumDesc.new(ImGuiTableFlags::None, "Default", "Use default sizing policy:\n- ImGuiTableFlags_SizingFixedFit if ScrollX is on or if host window has ImGuiWindowFlags_AlwaysAutoResize.\n- ImGuiTableFlags_SizingStretchSame otherwise."),
      EnumDesc.new(ImGuiTableFlags::SizingFixedFit, "ImGuiTableFlags_SizingFixedFit", "Columns default to _WidthFixed (if resizable) or _WidthAuto (if not resizable), matching contents width."),
      EnumDesc.new(ImGuiTableFlags::SizingFixedSame, "ImGuiTableFlags_SizingFixedSame", "Columns are all the same width, matching the maximum contents width.\nImplicitly disable ImGuiTableFlags_Resizable and enable ImGuiTableFlags_NoKeepColumnsVisible."),
      EnumDesc.new(ImGuiTableFlags::SizingStretchProp, "ImGuiTableFlags_SizingStretchProp", "Columns default to _WidthStretch with weights proportional to their widths."),
      EnumDesc.new(ImGuiTableFlags::SizingStretchSame, "ImGuiTableFlags_SizingStretchSame", "Columns default to _WidthStretch with same weights."),
    ]
    idx = policies.index do |pol|
      pol.value == (p_flags.value & ImGuiTableFlags::SizingMask_)
    end || policies.size
    preview_text = (idx < policies.size) ? policies[idx].name[(idx > 0 ? "ImGuiTableFlags".size : 0)..] : ""
    ImGui.combo("Sizing Policy", preview_text) do
      policies.size.times do |n|
        if ImGui.selectable(policies[n].name, idx == n)
          p_flags.value = (p_flags.value & ~ImGuiTableFlags::SizingMask_) | policies[n].value
        end
      end
    end
    ImGui.same_line
    ImGui.text_disabled("(?)")
    if ImGui.begin_item_tooltip
      ImGui.with_text_wrap_pos(ImGui.get_font_size * 50.0f32) do
        policies.size.times do |m|
          ImGui.separator
          ImGui.text("%s:", policies[m].name)
          ImGui.separator
          ImGui.set_cursor_pos_x(ImGui.get_cursor_pos_x + ImGui.get_style.indent_spacing * 0.5f32)
          ImGui.text_unformatted(policies[m].tooltip)
        end
      end
      ImGui.end_tooltip
    end
  end

  ImGui.pointer_wrapper def self.edit_table_columns_flags(p_flags)
    ImGui.checkbox_flags("_Disabled", p_flags, ImGuiTableColumnFlags::Disabled)
    ImGui.same_line
    help_marker("Master disable flag (also hide from context menu)")
    ImGui.checkbox_flags("_DefaultHide", p_flags, ImGuiTableColumnFlags::DefaultHide)
    ImGui.checkbox_flags("_DefaultSort", p_flags, ImGuiTableColumnFlags::DefaultSort)
    if ImGui.checkbox_flags("_WidthStretch", p_flags, ImGuiTableColumnFlags::WidthStretch)
      p_flags.value &= ~(ImGuiTableColumnFlags::WidthMask_ ^ ImGuiTableColumnFlags::WidthStretch)
    end
    if ImGui.checkbox_flags("_WidthFixed", p_flags, ImGuiTableColumnFlags::WidthFixed)
      p_flags.value &= ~(ImGuiTableColumnFlags::WidthMask_ ^ ImGuiTableColumnFlags::WidthFixed)
    end
    ImGui.checkbox_flags("_NoResize", p_flags, ImGuiTableColumnFlags::NoResize)
    ImGui.checkbox_flags("_NoReorder", p_flags, ImGuiTableColumnFlags::NoReorder)
    ImGui.checkbox_flags("_NoHide", p_flags, ImGuiTableColumnFlags::NoHide)
    ImGui.checkbox_flags("_NoClip", p_flags, ImGuiTableColumnFlags::NoClip)
    ImGui.checkbox_flags("_NoSort", p_flags, ImGuiTableColumnFlags::NoSort)
    ImGui.checkbox_flags("_NoSortAscending", p_flags, ImGuiTableColumnFlags::NoSortAscending)
    ImGui.checkbox_flags("_NoSortDescending", p_flags, ImGuiTableColumnFlags::NoSortDescending)
    ImGui.checkbox_flags("_NoHeaderLabel", p_flags, ImGuiTableColumnFlags::NoHeaderLabel)
    ImGui.checkbox_flags("_NoHeaderWidth", p_flags, ImGuiTableColumnFlags::NoHeaderWidth)
    ImGui.checkbox_flags("_PreferSortAscending", p_flags, ImGuiTableColumnFlags::PreferSortAscending)
    ImGui.checkbox_flags("_PreferSortDescending", p_flags, ImGuiTableColumnFlags::PreferSortDescending)
    ImGui.checkbox_flags("_IndentEnable", p_flags, ImGuiTableColumnFlags::IndentEnable)
    ImGui.same_line
    help_marker("Default for column 0")
    ImGui.checkbox_flags("_IndentDisable", p_flags, ImGuiTableColumnFlags::IndentDisable)
    ImGui.same_line
    help_marker("Default for column >0")
    ImGui.checkbox_flags("_AngledHeader", p_flags, ImGuiTableColumnFlags::AngledHeader)
  end

  def self.show_table_columns_status_flags(flags)
    ImGui.checkbox_flags("_IsEnabled", pointerof(flags), ImGuiTableColumnFlags::IsEnabled)
    ImGui.checkbox_flags("_IsVisible", pointerof(flags), ImGuiTableColumnFlags::IsVisible)
    ImGui.checkbox_flags("_IsSorted", pointerof(flags), ImGuiTableColumnFlags::IsSorted)
    ImGui.checkbox_flags("_IsHovered", pointerof(flags), ImGuiTableColumnFlags::IsHovered)
  end

  private enum ContentsType1
    Text
    FillButton
  end

  private enum ContentsType2
    ShowWidth
    ShortText
    LongText
    Button
    FillButton
    InputText
  end

  private enum ContentsType3
    Text
    Button
    SmallButton
    FillButton
    Selectable
    SelectableSpanRow
  end

  private class MyTreeNode
    def initialize(
      @name : String,
      @type : String,
      @size : Int32,
      @child_idx : Int32,
      @child_count : Int32
    )
    end

    class_property tree_node_flags = ImGuiTreeNodeFlags::SpanAllColumns

    getter name, type, size, child_idx, child_count

    def self.display_node(node, all_nodes)
      ImGui.table_next_row
      ImGui.table_next_column
      is_folder = (node.child_count > 0)
      if is_folder
        open = ImGui.tree_node_ex(node.name, MyTreeNode.tree_node_flags | ImGuiTreeNodeFlags::SpanFullWidth)
        ImGui.table_next_column
        ImGui.text_disabled("--")
        ImGui.table_next_column
        ImGui.text_unformatted(node.type)
        if open
          node.child_count.times do |child_n|
            display_node(all_nodes[node.child_idx + child_n], all_nodes)
          end
          ImGui.tree_pop
        end
      else
        ImGui.tree_node_ex(node.name, MyTreeNode.tree_node_flags | ImGuiTreeNodeFlags::Leaf | ImGuiTreeNodeFlags::Bullet | ImGuiTreeNodeFlags::NoTreePushOnOpen | ImGuiTreeNodeFlags::SpanFullWidth)
        ImGui.table_next_column
        ImGui.text("%d", node.size)
        ImGui.table_next_column
        ImGui.text_unformatted(node.type)
      end
    end
  end

  def self.show_demo_window_tables
    demo_marker("Tables")
    if !ImGui.collapsing_header("Tables & Columns")
      return
    end

    text_base_width = ImGui.calc_text_size("A").x
    text_base_height = ImGui.get_text_line_height_with_spacing

    static disable_indent = false
    ImGui.with_id("Tables") do
      open_action = -1
      if ImGui.button("Expand all")
        open_action = 1
      end
      ImGui.same_line
      if ImGui.button("Collapse all")
        open_action = 0
      end
      ImGui.same_line

      ImGui.checkbox("Disable tree indentation", pointerof(disable_indent.val))
      ImGui.same_line
      help_marker("Disable the indenting of tree nodes so demo tables can use the full window width.")
      ImGui.separator
      if disable_indent.val
        ImGui.push_style_var(ImGuiStyleVar::IndentSpacing, 0.0f32)
      end
      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Basic")
      ImGui.tree_node("Basic") do
        help_marker("Using TableNextRow() + calling TableSetColumnIndex() _before_ each cell, in a loop.")
        ImGui.table("table1", 3) do
          4.times do |row|
            ImGui.table_next_row
            3.times do |column|
              ImGui.table_set_column_index(column)
              ImGui.text("Row %d Column %d", row, column)
            end
          end
        end

        help_marker("Using TableNextRow() + calling TableNextColumn() _before_ each cell, manually.")
        ImGui.table("table2", 3) do
          4.times do |row|
            ImGui.table_next_row
            ImGui.table_next_column
            ImGui.text("Row %d", row)
            ImGui.table_next_column
            ImGui.text("Some contents")
            ImGui.table_next_column
            ImGui.text("123.456")
          end
        end

        help_marker(
          "Only using TableNextColumn(), which tends to be convenient for tables where every cell contains " +
          "the same type of contents.\n This is also more similar to the old NextColumn() function of the " +
          "Columns API, and provided to facilitate the Columns->Tables API transition.")
        ImGui.table("table3", 3) do
          14.times do |item|
            ImGui.table_next_column
            ImGui.text("Item %d", item)
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Borders, background")
      ImGui.tree_node("Borders, background") do
        static flags = ImGuiTableFlags::Borders | ImGuiTableFlags::RowBg
        static display_headers = false
        static contents_type = ContentsType1::Text

        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_RowBg", pointerof(flags.val), ImGuiTableFlags::RowBg)
          ImGui.checkbox_flags("ImGuiTableFlags_Borders", pointerof(flags.val), ImGuiTableFlags::Borders)
          ImGui.same_line
          help_marker("ImGuiTableFlags_Borders\n = ImGuiTableFlags_BordersInnerV\n | ImGuiTableFlags_BordersOuterV\n | ImGuiTableFlags_BordersInnerV\n | ImGuiTableFlags_BordersOuterH")
          ImGui.indent

          ImGui.checkbox_flags("ImGuiTableFlags_BordersH", pointerof(flags.val), ImGuiTableFlags::BordersH)
          ImGui.indent
          ImGui.checkbox_flags("ImGuiTableFlags_BordersOuterH", pointerof(flags.val), ImGuiTableFlags::BordersOuterH)
          ImGui.checkbox_flags("ImGuiTableFlags_BordersInnerH", pointerof(flags.val), ImGuiTableFlags::BordersInnerH)
          ImGui.unindent

          ImGui.checkbox_flags("ImGuiTableFlags_BordersV", pointerof(flags.val), ImGuiTableFlags::BordersV)
          ImGui.indent
          ImGui.checkbox_flags("ImGuiTableFlags_BordersOuterV", pointerof(flags.val), ImGuiTableFlags::BordersOuterV)
          ImGui.checkbox_flags("ImGuiTableFlags_BordersInnerV", pointerof(flags.val), ImGuiTableFlags::BordersInnerV)
          ImGui.unindent

          ImGui.checkbox_flags("ImGuiTableFlags_BordersOuter", pointerof(flags.val), ImGuiTableFlags::BordersOuter)
          ImGui.checkbox_flags("ImGuiTableFlags_BordersInner", pointerof(flags.val), ImGuiTableFlags::BordersInner)
          ImGui.unindent

          ImGui.align_text_to_frame_padding
          ImGui.text("Cell contents:")
          ImGui.same_line
          ImGui.radio_button("Text", pointerof(contents_type.val), ContentsType1::Text)
          ImGui.same_line
          ImGui.radio_button("FillButton", pointerof(contents_type.val), ContentsType1::FillButton)
          ImGui.checkbox("Display headers", pointerof(display_headers.val))
          ImGui.checkbox_flags("ImGuiTableFlags_NoBordersInBody", pointerof(flags.val), ImGuiTableFlags::NoBordersInBody)
          ImGui.same_line
          help_marker("Disable vertical borders in columns Body (borders will always appear in Headers")
        end

        ImGui.table("table1", 3, flags.val) do
          if display_headers.val
            ImGui.table_setup_column("One")
            ImGui.table_setup_column("Two")
            ImGui.table_setup_column("Three")
            ImGui.table_headers_row
          end

          5.times do |row|
            ImGui.table_next_row
            3.times do |column|
              ImGui.table_set_column_index(column)
              buf = sprintf("Hello %d,%d", column, row)
              if contents_type.val == ContentsType1::Text
                ImGui.text_unformatted(buf)
              elsif contents_type.val == ContentsType1::FillButton
                ImGui.button(buf, ImVec2.new(-Float32::MIN_POSITIVE, 0.0f32))
              end
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Resizable, stretch")
      ImGui.tree_node("Resizable, stretch") do
        static flags = ImGuiTableFlags::SizingStretchSame | ImGuiTableFlags::Resizable | ImGuiTableFlags::BordersOuter | ImGuiTableFlags::BordersV | ImGuiTableFlags::ContextMenuInBody
        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_Resizable", pointerof(flags.val), ImGuiTableFlags::Resizable)
          ImGui.checkbox_flags("ImGuiTableFlags_BordersV", pointerof(flags.val), ImGuiTableFlags::BordersV)
          ImGui.same_line
          help_marker(
            "Using the _Resizable flag automatically enables the _BordersInnerV flag as well, " +
            "this is why the resize borders are still showing when unchecking this.")
        end

        ImGui.table("table1", 3, flags.val) do
          5.times do |row|
            ImGui.table_next_row
            3.times do |column|
              ImGui.table_set_column_index(column)
              ImGui.text("Hello %d,%d", column, row)
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Resizable, fixed")
      ImGui.tree_node("Resizable, fixed") do
        help_marker(
          "Using _Resizable + _SizingFixedFit flags.\n" +
          "Fixed-width columns generally makes more sense if you want to use horizontal scrolling.\n\n" +
          "Double-click a column border to auto-fit the column to its contents.")
        static flags = ImGuiTableFlags::SizingFixedFit | ImGuiTableFlags::Resizable | ImGuiTableFlags::BordersOuter | ImGuiTableFlags::BordersV | ImGuiTableFlags::ContextMenuInBody
        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_NoHostExtendX", pointerof(flags.val), ImGuiTableFlags::NoHostExtendX)
        end

        ImGui.table("table1", 3, flags.val) do
          5.times do |row|
            ImGui.table_next_row
            3.times do |column|
              ImGui.table_set_column_index(column)
              ImGui.text("Hello %d,%d", column, row)
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Resizable, mixed")
      ImGui.tree_node("Resizable, mixed") do
        help_marker(
          "Using TableSetupColumn() to alter resizing policy on a per-column basis.\n\n" +
          "When combining Fixed and Stretch columns, generally you only want one, maybe two trailing columns to use _WidthStretch.")
        static flags = ImGuiTableFlags::SizingFixedFit | ImGuiTableFlags::RowBg | ImGuiTableFlags::Borders | ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable

        ImGui.table("table1", 3, flags.val) do
          ImGui.table_setup_column("AAA", ImGuiTableColumnFlags::WidthFixed)
          ImGui.table_setup_column("BBB", ImGuiTableColumnFlags::WidthFixed)
          ImGui.table_setup_column("CCC", ImGuiTableColumnFlags::WidthStretch)
          ImGui.table_headers_row
          5.times do |row|
            ImGui.table_next_row
            3.times do |column|
              ImGui.table_set_column_index(column)
              ImGui.text("%s %d,%d", (column == 2) ? "Stretch" : "Fixed", column, row)
            end
          end
        end
        ImGui.table("table2", 6, flags.val) do
          ImGui.table_setup_column("AAA", ImGuiTableColumnFlags::WidthFixed)
          ImGui.table_setup_column("BBB", ImGuiTableColumnFlags::WidthFixed)
          ImGui.table_setup_column("CCC", ImGuiTableColumnFlags::WidthFixed | ImGuiTableColumnFlags::DefaultHide)
          ImGui.table_setup_column("DDD", ImGuiTableColumnFlags::WidthStretch)
          ImGui.table_setup_column("EEE", ImGuiTableColumnFlags::WidthStretch)
          ImGui.table_setup_column("FFF", ImGuiTableColumnFlags::WidthStretch | ImGuiTableColumnFlags::DefaultHide)
          ImGui.table_headers_row
          5.times do |row|
            ImGui.table_next_row
            6.times do |column|
              ImGui.table_set_column_index(column)
              ImGui.text("%s %d,%d", (column >= 3) ? "Stretch" : "Fixed", column, row)
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Reorderable, hideable, with headers")
      ImGui.tree_node("Reorderable, hideable, with headers") do
        help_marker(
          "Click and drag column headers to reorder columns.\n\n" +
          "Right-click on a header to open a context menu.")
        static flags = ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable | ImGuiTableFlags::BordersOuter | ImGuiTableFlags::BordersV
        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_Resizable", pointerof(flags.val), ImGuiTableFlags::Resizable)
          ImGui.checkbox_flags("ImGuiTableFlags_Reorderable", pointerof(flags.val), ImGuiTableFlags::Reorderable)
          ImGui.checkbox_flags("ImGuiTableFlags_Hideable", pointerof(flags.val), ImGuiTableFlags::Hideable)
          ImGui.checkbox_flags("ImGuiTableFlags_NoBordersInBody", pointerof(flags.val), ImGuiTableFlags::NoBordersInBody)
          ImGui.checkbox_flags("ImGuiTableFlags_NoBordersInBodyUntilResize", pointerof(flags.val), ImGuiTableFlags::NoBordersInBodyUntilResize)
          ImGui.same_line
          help_marker("Disable vertical borders in columns Body until hovered for resize (borders will always appear in Headers)")
          ImGui.checkbox_flags("ImGuiTableFlags_HighlightHoveredColumn", pointerof(flags.val), ImGuiTableFlags::HighlightHoveredColumn)
        end

        ImGui.table("table1", 3, flags.val) do
          ImGui.table_setup_column("One")
          ImGui.table_setup_column("Two")
          ImGui.table_setup_column("Three")
          ImGui.table_headers_row
          6.times do |row|
            ImGui.table_next_row
            3.times do |column|
              ImGui.table_set_column_index(column)
              ImGui.text("Hello %d,%d", column, row)
            end
          end
        end

        ImGui.table("table2", 3, flags.val | ImGuiTableFlags::SizingFixedFit, ImVec2.new(0.0f32, 0.0f32)) do
          ImGui.table_setup_column("One")
          ImGui.table_setup_column("Two")
          ImGui.table_setup_column("Three")
          ImGui.table_headers_row
          6.times do |row|
            ImGui.table_next_row
            3.times do |column|
              ImGui.table_set_column_index(column)
              ImGui.text("Fixed %d,%d", column, row)
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Padding")
      ImGui.tree_node("Padding") do
        help_marker(
          "We often want outer padding activated when any using features which makes the edges of a column visible:\n" +
          "e.g.:\n" +
          "- BorderOuterV\n" +
          "- any form of row selection\n" +
          "Because of this, activating BorderOuterV sets the default to PadOuterX. " +
          "Using PadOuterX or NoPadOuterX you can override the default.\n\n" +
          "Actual padding values are using style.CellPadding.\n\n" +
          "In this demo we don't show horizontal borders to emphasize how they don't affect default horizontal padding.")

        static flags1 = ImGuiTableFlags::BordersV
        static show_headers = false
        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_PadOuterX", pointerof(flags1.val), ImGuiTableFlags::PadOuterX)
          ImGui.same_line
          help_marker("Enable outer-most padding (default if ImGuiTableFlags_BordersOuterV is set)")
          ImGui.checkbox_flags("ImGuiTableFlags_NoPadOuterX", pointerof(flags1.val), ImGuiTableFlags::NoPadOuterX)
          ImGui.same_line
          help_marker("Disable outer-most padding (default if ImGuiTableFlags_BordersOuterV is not set)")
          ImGui.checkbox_flags("ImGuiTableFlags_NoPadInnerX", pointerof(flags1.val), ImGuiTableFlags::NoPadInnerX)
          ImGui.same_line
          help_marker("Disable inner padding between columns (double inner padding if BordersOuterV is on, single inner padding if BordersOuterV is off)")
          ImGui.checkbox_flags("ImGuiTableFlags_BordersOuterV", pointerof(flags1.val), ImGuiTableFlags::BordersOuterV)
          ImGui.checkbox_flags("ImGuiTableFlags_BordersInnerV", pointerof(flags1.val), ImGuiTableFlags::BordersInnerV)
          ImGui.checkbox("show_headers", pointerof(show_headers.val))
        end

        ImGui.table("table_padding", 3, flags1.val) do
          if show_headers.val
            ImGui.table_setup_column("One")
            ImGui.table_setup_column("Two")
            ImGui.table_setup_column("Three")
            ImGui.table_headers_row
          end

          5.times do |row|
            ImGui.table_next_row
            3.times do |column|
              ImGui.table_set_column_index(column)
              if row == 0
                ImGui.text("Avail %.2f", ImGui.get_content_region_avail.x)
              else
                buf = sprintf("Hello %d,%d", column, row)
                ImGui.button(buf, ImVec2.new(-Float32::MIN_POSITIVE, 0.0f32))
              end
            end
          end
        end

        help_marker("Setting style.CellPadding to (0,0) or a custom value.")
        static flags2 = ImGuiTableFlags::Borders | ImGuiTableFlags::RowBg
        static cell_padding = ImVec2.new(0.0f32, 0.0f32)
        static show_widget_frame_bg = true

        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_Borders", pointerof(flags2.val), ImGuiTableFlags::Borders)
          ImGui.checkbox_flags("ImGuiTableFlags_BordersH", pointerof(flags2.val), ImGuiTableFlags::BordersH)
          ImGui.checkbox_flags("ImGuiTableFlags_BordersV", pointerof(flags2.val), ImGuiTableFlags::BordersV)
          ImGui.checkbox_flags("ImGuiTableFlags_BordersInner", pointerof(flags2.val), ImGuiTableFlags::BordersInner)
          ImGui.checkbox_flags("ImGuiTableFlags_BordersOuter", pointerof(flags2.val), ImGuiTableFlags::BordersOuter)
          ImGui.checkbox_flags("ImGuiTableFlags_RowBg", pointerof(flags2.val), ImGuiTableFlags::RowBg)
          ImGui.checkbox_flags("ImGuiTableFlags_Resizable", pointerof(flags2.val), ImGuiTableFlags::Resizable)
          ImGui.checkbox("show_widget_frame_bg", pointerof(show_widget_frame_bg.val))
          ImGui.slider_float2("CellPadding", pointerof(cell_padding.val), 0.0f32, 10.0f32, "%.0f")
        end

        ImGui.with_style_var(ImGuiStyleVar::CellPadding, cell_padding.val) do
          ImGui.table("table_padding_2", 3, flags2.val) do
            static text_bufs = Array.new(3 * 5) { ImGui::TextBuffer.new(16) }
            static init = true
            if !show_widget_frame_bg.val
              ImGui.push_style_color(ImGuiCol::FrameBg, 0)
            end
            (3 * 5).times do |cell|
              ImGui.table_next_column
              if init.val
                text_bufs.val[cell].clear
                text_bufs.val[cell] << "edit me"
              end
              ImGui.set_next_item_width(-Float32::MIN_POSITIVE)
              ImGui.with_id(cell) do
                ImGui.input_text("##cell", text_bufs.val[cell])
              end
            end
            if !show_widget_frame_bg.val
              ImGui.pop_style_color
            end
            init.val = false
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Explicit widths")
      ImGui.tree_node("Sizing policies") do
        static flags1 = ImGuiTableFlags::BordersV | ImGuiTableFlags::BordersOuterH | ImGuiTableFlags::RowBg | ImGuiTableFlags::ContextMenuInBody
        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_Resizable", pointerof(flags1.val), ImGuiTableFlags::Resizable)
          ImGui.checkbox_flags("ImGuiTableFlags_NoHostExtendX", pointerof(flags1.val), ImGuiTableFlags::NoHostExtendX)
        end

        static sizing_policy_flags = [ImGuiTableFlags::SizingFixedFit, ImGuiTableFlags::SizingFixedSame, ImGuiTableFlags::SizingStretchProp, ImGuiTableFlags::SizingStretchSame]
        4.times do |table_n|
          ImGui.with_id(table_n) do
            ImGui.set_next_item_width(text_base_width * 30)
            edit_table_sizing_flags(pointerof(sizing_policy_flags.val[table_n]))

            ImGui.table("table1", 3, sizing_policy_flags.val[table_n] | flags1.val) do
              3.times do |row|
                ImGui.table_next_row
                ImGui.table_next_column
                ImGui.text("Oh dear")
                ImGui.table_next_column
                ImGui.text("Oh dear")
                ImGui.table_next_column
                ImGui.text("Oh dear")
              end
            end
            ImGui.table("table2", 3, sizing_policy_flags.val[table_n] | flags1.val) do
              3.times do |row|
                ImGui.table_next_row
                ImGui.table_next_column
                ImGui.text("AAAA")
                ImGui.table_next_column
                ImGui.text("BBBBBBBB")
                ImGui.table_next_column
                ImGui.text("CCCCCCCCCCCC")
              end
            end
          end
        end

        ImGui.spacing
        ImGui.text_unformatted("Advanced")
        ImGui.same_line
        help_marker(
          "This section allows you to interact and see the effect of various sizing policies " +
          "depending on whether Scroll is enabled and the contents of your columns.")

        static flags = ImGuiTableFlags::ScrollY | ImGuiTableFlags::Borders | ImGuiTableFlags::RowBg | ImGuiTableFlags::Resizable
        static contents_type = ContentsType2::ShowWidth
        static column_count = 3

        with_style_compact do
          ImGui.with_id("Advanced") do
            ImGui.with_item_width(text_base_width * 30) do
              edit_table_sizing_flags(pointerof(flags.val))
              ImGui.combo("Contents", pointerof(contents_type.val), "Show width\0Short Text\0Long Text\0Button\0Fill Button\0InputText\0")
              if contents_type.val == ContentsType2::FillButton
                ImGui.same_line
                help_marker(
                  "Be mindful that using right-alignment (e.g. size.x = -FLT_MIN) creates a feedback loop " +
                  "where contents width can feed into auto-column width can feed into contents width.")
              end
              ImGui.drag_int("Columns", pointerof(column_count.val), 0.1f32, 1, 64, "%d", ImGuiSliderFlags::AlwaysClamp)
              ImGui.checkbox_flags("ImGuiTableFlags_Resizable", pointerof(flags.val), ImGuiTableFlags::Resizable)
              ImGui.checkbox_flags("ImGuiTableFlags_PreciseWidths", pointerof(flags.val), ImGuiTableFlags::PreciseWidths)
              ImGui.same_line
              help_marker("Disable distributing remainder width to stretched columns (width allocation on a 100-wide table with 3 columns: Without this flag: 33,33,34. With this flag: 33,33,33). With larger number of columns, resizing will appear to be less smooth.")
              ImGui.checkbox_flags("ImGuiTableFlags_ScrollX", pointerof(flags.val), ImGuiTableFlags::ScrollX)
              ImGui.checkbox_flags("ImGuiTableFlags_ScrollY", pointerof(flags.val), ImGuiTableFlags::ScrollY)
              ImGui.checkbox_flags("ImGuiTableFlags_NoClip", pointerof(flags.val), ImGuiTableFlags::NoClip)
            end
          end
        end

        ImGui.table("table2", column_count.val, flags.val, ImVec2.new(0.0f32, text_base_height * 7)) do
          (10 * column_count.val).times do |cell|
            ImGui.table_next_column
            column = ImGui.table_get_column_index
            row = ImGui.table_get_row_index

            ImGui.with_id(cell) do
              static text_buf = ImGui::TextBuffer.new(32)
              label = sprintf("Hello %d,%d", column, row)
              case contents_type.val
              when ContentsType2::ShortText
                ImGui.text_unformatted(label)
              when ContentsType2::LongText
                ImGui.text("Some %s text %d,%d\nOver two lines..", column == 0 ? "long" : "longeeer", column, row)
              when ContentsType2::ShowWidth
                ImGui.text("W: %.1f", ImGui.get_content_region_avail.x)
              when ContentsType2::Button
                ImGui.button(label)
              when ContentsType2::FillButton
                ImGui.button(label, ImVec2.new(-Float32::MIN_POSITIVE, 0.0f32))
              when ContentsType2::InputText
                ImGui.set_next_item_width(-Float32::MIN_POSITIVE)
                ImGui.input_text("##", text_buf.val)
              end
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Vertical scrolling, with clipping")
      ImGui.tree_node("Vertical scrolling, with clipping") do
        help_marker(
          "Here we activate ScrollY, which will create a child window container to allow hosting scrollable contents.\n\n" +
          "We also demonstrate using ImGuiListClipper to virtualize the submission of many items.")
        static flags = ImGuiTableFlags::ScrollY | ImGuiTableFlags::RowBg | ImGuiTableFlags::BordersOuter | ImGuiTableFlags::BordersV | ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable

        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_ScrollY", pointerof(flags.val), ImGuiTableFlags::ScrollY)
        end

        outer_size = ImVec2.new(0.0f32, text_base_height * 8)
        ImGui.table("table_scrolly", 3, flags.val, outer_size) do
          ImGui.table_setup_scroll_freeze(0, 1)
          ImGui.table_setup_column("One", ImGuiTableColumnFlags::None)
          ImGui.table_setup_column("Two", ImGuiTableColumnFlags::None)
          ImGui.table_setup_column("Three", ImGuiTableColumnFlags::None)
          ImGui.table_headers_row

          clipper = ImGuiListClipper.new
          clipper.begin(1000)
          while clipper.step
            (clipper.display_start...clipper.display_end).each do |row|
              ImGui.table_next_row
              3.times do |column|
                ImGui.table_set_column_index(column)
                ImGui.text("Hello %d,%d", column, row)
              end
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Horizontal scrolling")
      ImGui.tree_node("Horizontal scrolling") do
        help_marker(
          "When ScrollX is enabled, the default sizing policy becomes ImGuiTableFlags_SizingFixedFit, " +
          "as automatically stretching columns doesn't make much sense with horizontal scrolling.\n\n" +
          "Also note that as of the current version, you will almost always want to enable ScrollY along with ScrollX, " +
          "because the container window won't automatically extend vertically to fix contents " +
          "(this may be improved in future versions).")
        static flags = ImGuiTableFlags::ScrollX | ImGuiTableFlags::ScrollY | ImGuiTableFlags::RowBg | ImGuiTableFlags::BordersOuter | ImGuiTableFlags::BordersV | ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable
        static freeze_cols = 1
        static freeze_rows = 1

        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_Resizable", pointerof(flags.val), ImGuiTableFlags::Resizable)
          ImGui.checkbox_flags("ImGuiTableFlags_ScrollX", pointerof(flags.val), ImGuiTableFlags::ScrollX)
          ImGui.checkbox_flags("ImGuiTableFlags_ScrollY", pointerof(flags.val), ImGuiTableFlags::ScrollY)
          ImGui.set_next_item_width(ImGui.get_frame_height)
          ImGui.drag_int("freeze_cols", pointerof(freeze_cols.val), 0.2f32, 0, 9, flags: ImGuiSliderFlags::NoInput)
          ImGui.set_next_item_width(ImGui.get_frame_height)
          ImGui.drag_int("freeze_rows", pointerof(freeze_rows.val), 0.2f32, 0, 9, flags: ImGuiSliderFlags::NoInput)
        end

        outer_size = ImVec2.new(0.0f32, text_base_height * 8)
        ImGui.table("table_scrollx", 7, flags.val, outer_size) do
          ImGui.table_setup_scroll_freeze(freeze_cols.val, freeze_rows.val)
          ImGui.table_setup_column("Line #", ImGuiTableColumnFlags::NoHide)
          ImGui.table_setup_column("One")
          ImGui.table_setup_column("Two")
          ImGui.table_setup_column("Three")
          ImGui.table_setup_column("Four")
          ImGui.table_setup_column("Five")
          ImGui.table_setup_column("Six")
          ImGui.table_headers_row
          20.times do |row|
            ImGui.table_next_row
            7.times do |column|
              if !ImGui.table_set_column_index(column) && column > 0
                next
              end
              if column == 0
                ImGui.text("Line %d", row)
              else
                ImGui.text("Hello world %d,%d", column, row)
              end
            end
          end
        end

        ImGui.spacing
        ImGui.text_unformatted("Stretch + ScrollX")
        ImGui.same_line
        help_marker(
          "Showcase using Stretch columns + ScrollX together: " +
          "this is rather unusual and only makes sense when specifying an 'inner_width' for the table!\n" +
          "Without an explicit value, inner_width is == outer_size.x and therefore using Stretch columns " +
          "along with ScrollX doesn't make sense.")
        static flags2 = ImGuiTableFlags::SizingStretchSame | ImGuiTableFlags::ScrollX | ImGuiTableFlags::ScrollY | ImGuiTableFlags::BordersOuter | ImGuiTableFlags::RowBg | ImGuiTableFlags::ContextMenuInBody
        static inner_width = 1000.0f32
        with_style_compact do
          ImGui.with_id("flags3") do
            ImGui.with_item_width(text_base_width * 30) do
              ImGui.checkbox_flags("ImGuiTableFlags_ScrollX", pointerof(flags2.val), ImGuiTableFlags::ScrollX)
              ImGui.drag_float("inner_width", pointerof(inner_width.val), 1.0f32, 0.0f32, Float32::MAX, "%.1f")
            end
          end
        end
        ImGui.table("table2", 7, flags2.val, outer_size, inner_width.val) do
          (20 * 7).times do |cell|
            ImGui.table_next_column
            ImGui.text("Hello world %d,%d", ImGui.table_get_column_index, ImGui.table_get_row_index)
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Columns flags")
      ImGui.tree_node("Columns flags") do
        column_count = 3
        column_names = ["One", "Two", "Three"]
        static column_flags = Slice[ImGuiTableColumnFlags::DefaultSort, ImGuiTableColumnFlags::None, ImGuiTableColumnFlags::DefaultHide]
        static column_flags_out = Slice.new(3, ImGuiTableColumnFlags::None)

        ImGui.table("table_columns_flags_checkboxes", column_count, ImGuiTableFlags::None) do
          with_style_compact do
            column_count.times do |column|
              ImGui.table_next_column
              ImGui.with_id(column) do
                ImGui.align_text_to_frame_padding
                ImGui.text("'%s'", column_names[column])
                ImGui.spacing
                ImGui.text("Input flags:")
                edit_table_columns_flags(pointerof(column_flags.val[column]))
                ImGui.spacing
                ImGui.text("Output flags:")
                ImGui.disabled do
                  show_table_columns_status_flags(column_flags_out.val[column])
                end
              end
            end
          end
        end

        flags = ImGuiTableFlags::SizingFixedFit | ImGuiTableFlags::ScrollX | ImGuiTableFlags::ScrollY | ImGuiTableFlags::RowBg | ImGuiTableFlags::BordersOuter | ImGuiTableFlags::BordersV | ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable | ImGuiTableFlags::Sortable
        outer_size = ImVec2.new(0.0f32, text_base_height * 9)
        ImGui.table("table_columns_flags", column_count, flags, outer_size) do
          has_angled_header = false
          column_count.times do |column|
            has_angled_header ||= (column_flags.val[column].includes?(:AngledHeader))
            ImGui.table_setup_column(column_names[column], column_flags.val[column])
          end
          if has_angled_header
            ImGui.table_angled_headers_row
          end
          ImGui.table_headers_row
          column_count.times do |column|
            column_flags_out.val[column] = ImGui.table_get_column_flags(column)
          end
          indent_step = (text_base_width.to_i / 2f32)
          8.times do |row|
            ImGui.indent(indent_step)
            ImGui.table_next_row
            column_count.times do |column|
              ImGui.table_set_column_index(column)
              ImGui.text("%s %s", (column == 0) ? "Indented" : "Hello", ImGui.table_get_column_name(column))
            end
          end
          ImGui.unindent(indent_step * 8.0f32)
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Columns widths")
      ImGui.tree_node("Columns widths") do
        help_marker("Using TableSetupColumn() to setup default width.")

        static flags1 = ImGuiTableFlags::Borders | ImGuiTableFlags::NoBordersInBodyUntilResize
        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_Resizable", pointerof(flags1.val), ImGuiTableFlags::Resizable)
          ImGui.checkbox_flags("ImGuiTableFlags_NoBordersInBodyUntilResize", pointerof(flags1.val), ImGuiTableFlags::NoBordersInBodyUntilResize)
        end
        ImGui.table("table1", 3, flags1.val) do
          ImGui.table_setup_column("one", ImGuiTableColumnFlags::WidthFixed, 100.0f32)
          ImGui.table_setup_column("two", ImGuiTableColumnFlags::WidthFixed, 200.0f32)
          ImGui.table_setup_column("three", ImGuiTableColumnFlags::WidthFixed)
          ImGui.table_headers_row
          4.times do |row|
            ImGui.table_next_row
            3.times do |column|
              ImGui.table_set_column_index(column)
              if row == 0
                ImGui.text("(w: %5.1f)", ImGui.get_content_region_avail.x)
              else
                ImGui.text("Hello %d,%d", column, row)
              end
            end
          end
        end

        help_marker(
          "Using TableSetupColumn() to setup explicit width.\n\nUnless _NoKeepColumnsVisible is set, " +
          "fixed columns with set width may still be shrunk down if there's not enough space in the host.")

        static flags2 = ImGuiTableFlags::None
        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_NoKeepColumnsVisible", pointerof(flags2.val), ImGuiTableFlags::NoKeepColumnsVisible)
          ImGui.checkbox_flags("ImGuiTableFlags_BordersInnerV", pointerof(flags2.val), ImGuiTableFlags::BordersInnerV)
          ImGui.checkbox_flags("ImGuiTableFlags_BordersOuterV", pointerof(flags2.val), ImGuiTableFlags::BordersOuterV)
        end
        ImGui.table("table2", 4, flags2.val) do
          ImGui.table_setup_column("", ImGuiTableColumnFlags::WidthFixed, 100.0f32)
          ImGui.table_setup_column("", ImGuiTableColumnFlags::WidthFixed, text_base_width * 15.0f32)
          ImGui.table_setup_column("", ImGuiTableColumnFlags::WidthFixed, text_base_width * 30.0f32)
          ImGui.table_setup_column("", ImGuiTableColumnFlags::WidthFixed, text_base_width * 15.0f32)
          5.times do |row|
            ImGui.table_next_row
            4.times do |column|
              ImGui.table_set_column_index(column)
              if row == 0
                ImGui.text("(w: %5.1f)", ImGui.get_content_region_avail.x)
              else
                ImGui.text("Hello %d,%d", column, row)
              end
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Nested tables")
      ImGui.tree_node("Nested tables") do
        help_marker("This demonstrates embedding a table into another table cell.")

        ImGui.table("table_nested1", 2, ImGuiTableFlags::Borders | ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable) do
          ImGui.table_setup_column("A0")
          ImGui.table_setup_column("A1")
          ImGui.table_headers_row

          ImGui.table_next_column
          ImGui.text("A0 Row 0")
          begin
            rows_height = text_base_height * 2
            ImGui.table("table_nested2", 2, ImGuiTableFlags::Borders | ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable) do
              ImGui.table_setup_column("B0")
              ImGui.table_setup_column("B1")
              ImGui.table_headers_row

              ImGui.table_next_row(ImGuiTableRowFlags::None, rows_height)
              ImGui.table_next_column
              ImGui.text("B0 Row 0")
              ImGui.table_next_column
              ImGui.text("B1 Row 0")
              ImGui.table_next_row(ImGuiTableRowFlags::None, rows_height)
              ImGui.table_next_column
              ImGui.text("B0 Row 1")
              ImGui.table_next_column
              ImGui.text("B1 Row 1")
            end
          end
          ImGui.table_next_column
          ImGui.text("A1 Row 0")
          ImGui.table_next_column
          ImGui.text("A0 Row 1")
          ImGui.table_next_column
          ImGui.text("A1 Row 1")
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Row height")
      ImGui.tree_node("Row height") do
        help_marker(
          "You can pass a 'min_row_height' to TableNextRow().\n\nRows are padded with 'style.CellPadding.y' on top and bottom, " +
          "so effectively the minimum row height will always be >= 'style.CellPadding.y * 2.0f'.\n\n" +
          "We cannot honor a _maximum_ row height as that would require a unique clipping rectangle per row.")
        ImGui.table("table_row_height", 1, ImGuiTableFlags::Borders) do
          8.times do |row|
            min_row_height = (text_base_height * 0.30f32 * row).to_i.to_f32
            ImGui.table_next_row(ImGuiTableRowFlags::None, min_row_height)
            ImGui.table_next_column
            ImGui.text("min_row_height = %.2f", min_row_height)
          end
        end

        help_marker(
          "Showcase using SameLine(0,0) to share Current Line Height between cells.\n\n" +
          "Please note that Tables Row Height is not the same thing as Current Line Height, " +
          "as a table cell may contains multiple lines.")
        ImGui.table("table_share_lineheight", 2, ImGuiTableFlags::Borders) do
          ImGui.table_next_row
          ImGui.table_next_column
          ImGui.color_button("##1", ImVec4.new(0.13f32, 0.26f32, 0.40f32, 1.0f32), ImGuiColorEditFlags::None, ImVec2.new(40, 40))
          ImGui.table_next_column
          ImGui.text("Line 1")
          ImGui.text("Line 2")

          ImGui.table_next_row
          ImGui.table_next_column
          ImGui.color_button("##2", ImVec4.new(0.13f32, 0.26f32, 0.40f32, 1.0f32), ImGuiColorEditFlags::None, ImVec2.new(40, 40))
          ImGui.table_next_column
          ImGui.same_line(0.0f32, 0.0f32)
          ImGui.text("Line 1, with SameLine(0,0)")
          ImGui.text("Line 2")
        end

        help_marker("Showcase altering CellPadding.y between rows. Note that CellPadding.x is locked for the entire table.")
        ImGui.table("table_changing_cellpadding_y", 1, ImGuiTableFlags::Borders) do
          style = ImGui.get_style
          8.times do |row|
            if (row % 3) == 2
              ImGui.push_style_var(ImGuiStyleVar::CellPadding, ImVec2.new(style.cell_padding.x, 20.0f32))
            end
            ImGui.table_next_row(ImGuiTableRowFlags::None)
            ImGui.table_next_column
            ImGui.text("CellPadding.y = %.2f", style.cell_padding.y)
            if (row % 3) == 2
              ImGui.pop_style_var
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Outer size")
      ImGui.tree_node("Outer size") do
        ImGui.text("Using NoHostExtendX and NoHostExtendY:")
        static flags = ImGuiTableFlags::Borders | ImGuiTableFlags::Resizable | ImGuiTableFlags::ContextMenuInBody | ImGuiTableFlags::RowBg | ImGuiTableFlags::SizingFixedFit | ImGuiTableFlags::NoHostExtendX
        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_NoHostExtendX", pointerof(flags.val), ImGuiTableFlags::NoHostExtendX)
          ImGui.same_line
          help_marker("Make outer width auto-fit to columns, overriding outer_size.x value.\n\nOnly available when ScrollX/ScrollY are disabled and Stretch columns are not used.")
          ImGui.checkbox_flags("ImGuiTableFlags_NoHostExtendY", pointerof(flags.val), ImGuiTableFlags::NoHostExtendY)
          ImGui.same_line
          help_marker("Make outer height stop exactly at outer_size.y (prevent auto-extending table past the limit).\n\nOnly available when ScrollX/ScrollY are disabled. Data below the limit will be clipped and not visible.")
        end

        outer_size = ImVec2.new(0.0f32, text_base_height * 5.5f32)
        ImGui.table("table1", 3, flags.val, outer_size) do
          10.times do |row|
            ImGui.table_next_row
            3.times do |column|
              ImGui.table_next_column
              ImGui.text("Cell %d,%d", column, row)
            end
          end
        end
        ImGui.same_line
        ImGui.text("Hello!")

        ImGui.spacing

        ImGui.text("Using explicit size:")
        ImGui.table("table2", 3, ImGuiTableFlags::Borders | ImGuiTableFlags::RowBg, ImVec2.new(text_base_width * 30, 0.0f32)) do
          5.times do |row|
            ImGui.table_next_row
            3.times do |column|
              ImGui.table_next_column
              ImGui.text("Cell %d,%d", column, row)
            end
          end
        end
        ImGui.same_line
        ImGui.table("table3", 3, ImGuiTableFlags::Borders | ImGuiTableFlags::RowBg, ImVec2.new(text_base_width * 30, 0.0f32)) do
          3.times do |row|
            ImGui.table_next_row(:None, text_base_height * 1.5f32)
            3.times do |column|
              ImGui.table_next_column
              ImGui.text("Cell %d,%d", column, row)
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Background color")
      ImGui.tree_node("Background color") do
        static flags = ImGuiTableFlags::RowBg
        static row_bg_type = 1
        static row_bg_target = 1
        static cell_bg_type = 1

        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_Borders", pointerof(flags.val), ImGuiTableFlags::Borders)
          ImGui.checkbox_flags("ImGuiTableFlags_RowBg", pointerof(flags.val), ImGuiTableFlags::RowBg)
          ImGui.same_line
          help_marker("ImGuiTableFlags_RowBg automatically sets RowBg0 to alternative colors pulled from the Style.")
          ImGui.combo("row bg type", pointerof(row_bg_type.val), "None\0Red\0Gradient\0")
          ImGui.combo("row bg target", pointerof(row_bg_target.val), "RowBg0\0RowBg1\0")
          ImGui.same_line
          help_marker("Target RowBg0 to override the alternating odd/even colors,\nTarget RowBg1 to blend with them.")
          ImGui.combo("cell bg type", pointerof(cell_bg_type.val), "None\0Blue\0")
          ImGui.same_line
          help_marker("We are colorizing cells to B1->C2 here.")
          assert(row_bg_type.val >= 0 && row_bg_type.val <= 2)
          assert(row_bg_target.val >= 0 && row_bg_target.val <= 1)
          assert(cell_bg_type.val >= 0 && cell_bg_type.val <= 1)
        end

        ImGui.table("table1", 5, flags.val) do
          6.times do |row|
            ImGui.table_next_row

            if row_bg_type.val != 0
              row_bg_color = ImGui.get_color_u32(row_bg_type.val == 1 ? ImVec4.new(0.7f32, 0.3f32, 0.3f32, 0.65f32) : ImVec4.new(0.2f32 + row * 0.1f32, 0.2f32, 0.2f32, 0.65f32))
              ImGui.table_set_bg_color(ImGuiTableBgTarget::RowBg0 + row_bg_target.val, row_bg_color)
            end

            5.times do |column|
              ImGui.table_set_column_index(column)
              ImGui.text("%c%c", 'A' + row, '0' + column)

              if row >= 1 && row <= 2 && column >= 1 && column <= 2 && cell_bg_type.val == 1
                cell_bg_color = ImGui.get_color_u32(ImVec4.new(0.3f32, 0.3f32, 0.7f32, 0.65f32))
                ImGui.table_set_bg_color(ImGuiTableBgTarget::CellBg, cell_bg_color)
              end
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Tree view")
      ImGui.tree_node("Tree view") do
        static flags = ImGuiTableFlags::BordersV | ImGuiTableFlags::BordersOuterH | ImGuiTableFlags::Resizable | ImGuiTableFlags::RowBg | ImGuiTableFlags::NoBordersInBody

        ImGui.checkbox_flags("ImGuiTreeNodeFlags_SpanFullWidth", pointerof(MyTreeNode.tree_node_flags), ImGuiTreeNodeFlags::SpanFullWidth)
        ImGui.checkbox_flags("ImGuiTreeNodeFlags_SpanAllColumns", pointerof(MyTreeNode.tree_node_flags), ImGuiTreeNodeFlags::SpanAllColumns)

        help_marker("See \"Columns flags.val\" section to configure how indentation is applied to individual columns.")
        ImGui.table("3ways", 3, flags.val) do
          ImGui.table_setup_column("Name", ImGuiTableColumnFlags::NoHide)
          ImGui.table_setup_column("Size", ImGuiTableColumnFlags::WidthFixed, text_base_width * 12.0f32)
          ImGui.table_setup_column("Type", ImGuiTableColumnFlags::WidthFixed, text_base_width * 18.0f32)
          ImGui.table_headers_row

          static nodes = [
            MyTreeNode.new("Root", "Folder", -1, 1, 3),
            MyTreeNode.new("Music", "Folder", -1, 4, 2),
            MyTreeNode.new("Textures", "Folder", -1, 6, 3),
            MyTreeNode.new("desktop.ini", "System file", 1024, -1, -1),
            MyTreeNode.new("File1_a.wav", "Audio file", 123000, -1, -1),
            MyTreeNode.new("File1_b.wav", "Audio file", 456000, -1, -1),
            MyTreeNode.new("Image001.png", "Image file", 203128, -1, -1),
            MyTreeNode.new("Copy of Image001.png", "Image file", 203256, -1, -1),
            MyTreeNode.new("Copy of Image001 (Final2).png", "Image file", 203512, -1, -1),
          ]

          MyTreeNode.display_node(nodes.val[0], nodes.val)
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Item width")
      ImGui.tree_node("Item width") do
        help_marker(
          "Showcase using PushItemWidth() and how it is preserved on a per-column basis.\n\n" +
          "Note that on auto-resizing non-resizable fixed columns, querying the content width for " +
          "e.g. right-alignment doesn't make sense.")
        ImGui.table("table_item_width", 3, ImGuiTableFlags::Borders) do
          ImGui.table_setup_column("small")
          ImGui.table_setup_column("half")
          ImGui.table_setup_column("right-align")
          ImGui.table_headers_row

          3.times do |row|
            ImGui.table_next_row
            if row == 0
              ImGui.table_set_column_index(0)
              ImGui.push_item_width(text_base_width * 3.0f32)
              ImGui.table_set_column_index(1)
              ImGui.push_item_width(-ImGui.get_content_region_avail.x * 0.5f32)
              ImGui.table_set_column_index(2)
              ImGui.push_item_width(-Float32::MIN_POSITIVE)
            end

            static dummy_f = 0.0f32
            ImGui.with_id(row) do
              ImGui.table_set_column_index(0)
              ImGui.slider_float("float0", pointerof(dummy_f.val), 0.0f32, 1.0f32)
              ImGui.table_set_column_index(1)
              ImGui.slider_float("float1", pointerof(dummy_f.val), 0.0f32, 1.0f32)
              ImGui.table_set_column_index(2)
              ImGui.slider_float("##float2", pointerof(dummy_f.val), 0.0f32, 1.0f32)
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Custom headers")
      ImGui.tree_node("Custom headers") do
        columns_count = 3
        ImGui.table("table_custom_headers", columns_count, ImGuiTableFlags::Borders | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable) do
          ImGui.table_setup_column("Apricot")
          ImGui.table_setup_column("Banana")
          ImGui.table_setup_column("Cherry")

          static column_selected = Slice.new(3, false)
          ImGui.table_next_row(ImGuiTableRowFlags::Headers)
          columns_count.times do |column|
            ImGui.table_set_column_index(column)
            column_name = ImGui.table_get_column_name(column)
            ImGui.with_id(column) do
              ImGui.with_style_var(ImGuiStyleVar::FramePadding, ImVec2.new(0, 0)) do
                ImGui.checkbox("##checkall", pointerof(column_selected.val[column]))
              end
              ImGui.same_line(0.0f32, ImGui.get_style.item_inner_spacing.x)
              ImGui.table_header(column_name)
            end
          end

          5.times do |row|
            ImGui.table_next_row
            3.times do |column|
              buf = sprintf("Cell %d,%d", column, row)
              ImGui.table_set_column_index(column)
              ImGui.selectable(buf, column_selected.val[column])
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Angled headers")
      ImGui.tree_node("Angled headers") do
        column_names = ["Track", "cabasa", "ride", "smash", "tom-hi", "tom-mid", "tom-low", "hihat-o", "hihat-c", "snare-s", "snare-c", "clap", "rim", "kick"]
        columns_count = column_names.size
        rows_count = 12

        static table_flags = ImGuiTableFlags::SizingFixedFit | ImGuiTableFlags::ScrollX | ImGuiTableFlags::ScrollY | ImGuiTableFlags::BordersOuter | ImGuiTableFlags::BordersInnerH | ImGuiTableFlags::Hideable | ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::HighlightHoveredColumn
        static bools = [false] * (columns_count * rows_count)
        static frozen_cols = 1
        static frozen_rows = 2
        ImGui.checkbox_flags("_ScrollX", pointerof(table_flags.val), ImGuiTableFlags::ScrollX)
        ImGui.checkbox_flags("_ScrollY", pointerof(table_flags.val), ImGuiTableFlags::ScrollY)
        ImGui.checkbox_flags("_NoBordersInBody", pointerof(table_flags.val), ImGuiTableFlags::NoBordersInBody)
        ImGui.checkbox_flags("_HighlightHoveredColumn", pointerof(table_flags.val), ImGuiTableFlags::HighlightHoveredColumn)
        ImGui.set_next_item_width(ImGui.get_font_size * 8)
        ImGui.slider_int("Frozen columns", pointerof(frozen_cols.val), 0, 2)
        ImGui.set_next_item_width(ImGui.get_font_size * 8)
        ImGui.slider_int("Frozen rows", pointerof(frozen_rows.val), 0, 2)

        ImGui.table("table_angled_headers", columns_count, table_flags.val, ImVec2.new(0.0f32, text_base_height * 12)) do
          ImGui.table_setup_column(column_names[0], ImGuiTableColumnFlags::NoHide | ImGuiTableColumnFlags::NoReorder)
          (1...columns_count).each do |n|
            ImGui.table_setup_column(column_names[n], ImGuiTableColumnFlags::AngledHeader | ImGuiTableColumnFlags::WidthFixed)
          end
          ImGui.table_setup_scroll_freeze(frozen_cols.val, frozen_rows.val)

          ImGui.table_angled_headers_row
          ImGui.table_headers_row
          rows_count.times do |row|
            ImGui.with_id(row) do
              ImGui.table_next_row
              ImGui.table_set_column_index(0)
              ImGui.align_text_to_frame_padding
              ImGui.text("Track %d", row)
              (1...columns_count).each do |column|
                if ImGui.table_set_column_index(column)
                  ImGui.with_id(column) do
                    ImGui.checkbox("", pointerof(bools.val[row * columns_count + column]))
                  end
                end
              end
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Context menus")
      ImGui.tree_node("Context menus") do
        help_marker(
          "By default, right-clicking over a TableHeadersRow()/TableHeader() line will open the default context-menu.\n" +
          "Using ImGuiTableFlags_ContextMenuInBody we also allow right-clicking over columns body.")
        static flags1 = ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable | ImGuiTableFlags::Borders | ImGuiTableFlags::ContextMenuInBody

        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_ContextMenuInBody", pointerof(flags1.val), ImGuiTableFlags::ContextMenuInBody)
        end

        columns_count = 3
        ImGui.table("table_context_menu", columns_count, flags1.val) do
          ImGui.table_setup_column("One")
          ImGui.table_setup_column("Two")
          ImGui.table_setup_column("Three")

          ImGui.table_headers_row

          4.times do |row|
            ImGui.table_next_row
            columns_count.times do |column|
              ImGui.table_set_column_index(column)
              ImGui.text("Cell %d,%d", column, row)
            end
          end
        end

        help_marker(
          "Demonstrate mixing table context menu (over header), item context button (over button) " +
          "and custom per-colunm context menu (over column body).")
        flags2 = ImGuiTableFlags::Resizable | ImGuiTableFlags::SizingFixedFit | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable | ImGuiTableFlags::Borders
        if ImGui.begin_table("table_context_menu_2", columns_count, flags2)
          ImGui.table_setup_column("One")
          ImGui.table_setup_column("Two")
          ImGui.table_setup_column("Three")

          ImGui.table_headers_row
          4.times do |row|
            ImGui.table_next_row
            columns_count.times do |column|
              ImGui.table_set_column_index(column)
              ImGui.text("Cell %d,%d", column, row)
              ImGui.same_line

              ImGui.with_id(row * columns_count + column) do
                ImGui.small_button("..")
                ImGui.popup_context_item do
                  ImGui.text("This is the popup for Button(\"..\") in Cell %d,%d", column, row)
                  if ImGui.button("Close")
                    ImGui.close_current_popup
                  end
                end
              end
            end
          end

          hovered_column = -1
          (columns_count + 1).times do |column|
            ImGui.with_id(column) do
              if ImGui.table_get_column_flags(column).includes?(:IsHovered)
                hovered_column = column
              end
              if hovered_column == column && !ImGui.is_any_item_hovered && ImGui.is_mouse_released(:Right)
                ImGui.open_popup("MyPopup")
              end
              ImGui.popup("MyPopup") do
                if column == columns_count
                  ImGui.text("This is a custom popup for unused space after the last column.")
                else
                  ImGui.text("This is a custom popup for Column %d", column)
                end
                if ImGui.button("Close")
                  ImGui.close_current_popup
                end
              end
            end
          end

          ImGui.end_table
          ImGui.text("Hovered column: %d", hovered_column)
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Synced instances")
      ImGui.tree_node("Synced instances") do
        help_marker("Multiple tables with the same identifier will share their settings, width, visibility, order etc.")

        static flags = ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable | ImGuiTableFlags::Borders | ImGuiTableFlags::SizingFixedFit | ImGuiTableFlags::NoSavedSettings
        ImGui.checkbox_flags("ImGuiTableFlags_ScrollY", pointerof(flags.val), ImGuiTableFlags::ScrollY)
        ImGui.checkbox_flags("ImGuiTableFlags_SizingFixedFit", pointerof(flags.val), ImGuiTableFlags::SizingFixedFit)
        ImGui.checkbox_flags("ImGuiTableFlags_HighlightHoveredColumn", pointerof(flags.val), ImGuiTableFlags::HighlightHoveredColumn)
        3.times do |n|
          buf = sprintf("Synced Table %d", n)
          open = ImGui.collapsing_header(buf, ImGuiTreeNodeFlags::DefaultOpen)
          if open && ImGui.begin_table("Table", 3, flags.val, ImVec2.new(0.0f32, ImGui.get_text_line_height_with_spacing * 5))
            ImGui.table_setup_column("One")
            ImGui.table_setup_column("Two")
            ImGui.table_setup_column("Three")
            ImGui.table_headers_row
            cell_count = (n == 1) ? 27 : 9
            cell_count.times do |cell|
              ImGui.table_next_column
              ImGui.text("this cell %d", cell)
            end
            ImGui.end_table
          end
        end
      end

      template_items_names = [
        "Banana", "Apple", "Cherry", "Watermelon", "Grapefruit", "Strawberry", "Mango",
        "Kiwi", "Orange", "Pineapple", "Blueberry", "Plum", "Coconut", "Pear", "Apricot",
      ]
      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Sorting")
      ImGui.tree_node("Sorting") do
        static items = Array(MyItem).new(50) { |n|
          template_n = n % template_items_names.size
          MyItem.new(
            id: n,
            name: template_items_names[template_n],
            quantity: (n * n - n) % 20,
          )
        }

        static flags = ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable | ImGuiTableFlags::Sortable | ImGuiTableFlags::SortMulti | ImGuiTableFlags::RowBg | ImGuiTableFlags::BordersOuter | ImGuiTableFlags::BordersV | ImGuiTableFlags::NoBordersInBody | ImGuiTableFlags::ScrollY
        with_style_compact do
          ImGui.checkbox_flags("ImGuiTableFlags_SortMulti", pointerof(flags.val), ImGuiTableFlags::SortMulti)
          ImGui.same_line
          help_marker("When sorting is enabled: hold shift when clicking headers to sort on multiple column. TableGetSortSpecs() may return specs where (SpecsCount > 1).")
          ImGui.checkbox_flags("ImGuiTableFlags_SortTristate", pointerof(flags.val), ImGuiTableFlags::SortTristate)
          ImGui.same_line
          help_marker("When sorting is enabled: allow no sorting, disable default sorting. TableGetSortSpecs() may return specs where (SpecsCount == 0).")
        end

        ImGui.table("table_sorting", 4, flags.val, ImVec2.new(0.0f32, text_base_height * 15), 0.0f32) do
          ImGui.table_setup_column("ID", ImGuiTableColumnFlags::DefaultSort | ImGuiTableColumnFlags::WidthFixed, 0.0f32, MyItemColumnID::ID.to_u32)
          ImGui.table_setup_column("Name", ImGuiTableColumnFlags::WidthFixed, 0.0f32, MyItemColumnID::Name.to_u32)
          ImGui.table_setup_column("Action", ImGuiTableColumnFlags::NoSort | ImGuiTableColumnFlags::WidthFixed, 0.0f32, MyItemColumnID::Action.to_u32)
          ImGui.table_setup_column("Quantity", ImGuiTableColumnFlags::PreferSortDescending | ImGuiTableColumnFlags::WidthStretch, 0.0f32, MyItemColumnID::Quantity.to_u32)
          ImGui.table_setup_scroll_freeze(0, 1)
          ImGui.table_headers_row

          if (sort_specs = ImGui.table_get_sort_specs)
            if sort_specs.specs_dirty
              MyItem.sort_with_sort_specs(sort_specs, items.val)
              sort_specs.specs_dirty = false
            end
          end

          clipper = ImGuiListClipper.new
          clipper.begin(items.val.size)
          while clipper.step
            (clipper.display_start...clipper.display_end).each do |row_n|
              item = items.val[row_n]
              ImGui.with_id(item.id) do
                ImGui.table_next_row
                ImGui.table_next_column
                ImGui.text("%04d", item.id)
                ImGui.table_next_column
                ImGui.text_unformatted(item.name)
                ImGui.table_next_column
                ImGui.small_button("None")
                ImGui.table_next_column
                ImGui.text("%d", item.quantity)
              end
            end
          end
        end
      end

      if open_action != -1
        ImGui.set_next_item_open(open_action != 0)
      end
      demo_marker("Tables/Advanced")
      ImGui.tree_node("Advanced") do
        static flags = ImGuiTableFlags::Resizable | ImGuiTableFlags::Reorderable | ImGuiTableFlags::Hideable | ImGuiTableFlags::Sortable | ImGuiTableFlags::SortMulti | ImGuiTableFlags::RowBg | ImGuiTableFlags::Borders | ImGuiTableFlags::NoBordersInBody | ImGuiTableFlags::ScrollX | ImGuiTableFlags::ScrollY | ImGuiTableFlags::SizingFixedFit
        static columns_base_flags = ImGuiTableColumnFlags::None

        static contents_type = ContentsType3::SelectableSpanRow
        contents_type_names = ["Text", "Button", "SmallButton", "FillButton", "Selectable", "Selectable (span row)"]
        static freeze_cols = 1
        static freeze_rows = 1
        static items_count = template_items_names.size * 2
        static outer_size_value = ImVec2.new(0.0f32, text_base_height * 12)
        static row_min_height = 0.0f32
        static inner_width_with_scroll = 0.0f32
        static outer_size_enabled = true
        static show_headers = true
        static show_wrapped_text = false

        ImGui.tree_node("Options") do
          with_style_compact do
            ImGui.with_item_width(text_base_width * 28.0f32) do
              ImGui.tree_node_ex("Features:", ImGuiTreeNodeFlags::DefaultOpen) do
                ImGui.checkbox_flags("ImGuiTableFlags_Resizable", pointerof(flags.val), ImGuiTableFlags::Resizable)
                ImGui.checkbox_flags("ImGuiTableFlags_Reorderable", pointerof(flags.val), ImGuiTableFlags::Reorderable)
                ImGui.checkbox_flags("ImGuiTableFlags_Hideable", pointerof(flags.val), ImGuiTableFlags::Hideable)
                ImGui.checkbox_flags("ImGuiTableFlags_Sortable", pointerof(flags.val), ImGuiTableFlags::Sortable)
                ImGui.checkbox_flags("ImGuiTableFlags_NoSavedSettings", pointerof(flags.val), ImGuiTableFlags::NoSavedSettings)
                ImGui.checkbox_flags("ImGuiTableFlags_ContextMenuInBody", pointerof(flags.val), ImGuiTableFlags::ContextMenuInBody)
              end

              ImGui.tree_node_ex("Decorations:", ImGuiTreeNodeFlags::DefaultOpen) do
                ImGui.checkbox_flags("ImGuiTableFlags_RowBg", pointerof(flags.val), ImGuiTableFlags::RowBg)
                ImGui.checkbox_flags("ImGuiTableFlags_BordersV", pointerof(flags.val), ImGuiTableFlags::BordersV)
                ImGui.checkbox_flags("ImGuiTableFlags_BordersOuterV", pointerof(flags.val), ImGuiTableFlags::BordersOuterV)
                ImGui.checkbox_flags("ImGuiTableFlags_BordersInnerV", pointerof(flags.val), ImGuiTableFlags::BordersInnerV)
                ImGui.checkbox_flags("ImGuiTableFlags_BordersH", pointerof(flags.val), ImGuiTableFlags::BordersH)
                ImGui.checkbox_flags("ImGuiTableFlags_BordersOuterH", pointerof(flags.val), ImGuiTableFlags::BordersOuterH)
                ImGui.checkbox_flags("ImGuiTableFlags_BordersInnerH", pointerof(flags.val), ImGuiTableFlags::BordersInnerH)
                ImGui.checkbox_flags("ImGuiTableFlags_NoBordersInBody", pointerof(flags.val), ImGuiTableFlags::NoBordersInBody)
                ImGui.same_line
                help_marker("Disable vertical borders in columns Body (borders will always appear in Headers")
                ImGui.checkbox_flags("ImGuiTableFlags_NoBordersInBodyUntilResize", pointerof(flags.val), ImGuiTableFlags::NoBordersInBodyUntilResize)
                ImGui.same_line
                help_marker("Disable vertical borders in columns Body until hovered for resize (borders will always appear in Headers)")
              end

              ImGui.tree_node_ex("Sizing:", ImGuiTreeNodeFlags::DefaultOpen) do
                edit_table_sizing_flags(pointerof(flags.val))
                ImGui.same_line
                help_marker("In the Advanced demo we override the policy of each column so those table-wide settings have less effect that typical.")
                ImGui.checkbox_flags("ImGuiTableFlags_NoHostExtendX", pointerof(flags.val), ImGuiTableFlags::NoHostExtendX)
                ImGui.same_line
                help_marker("Make outer width auto-fit to columns, overriding outer_size.x value.\n\nOnly available when ScrollX/ScrollY are disabled and Stretch columns are not used.")
                ImGui.checkbox_flags("ImGuiTableFlags_NoHostExtendY", pointerof(flags.val), ImGuiTableFlags::NoHostExtendY)
                ImGui.same_line
                help_marker("Make outer height stop exactly at outer_size.y (prevent auto-extending table past the limit).\n\nOnly available when ScrollX/ScrollY are disabled. Data below the limit will be clipped and not visible.")
                ImGui.checkbox_flags("ImGuiTableFlags_NoKeepColumnsVisible", pointerof(flags.val), ImGuiTableFlags::NoKeepColumnsVisible)
                ImGui.same_line
                help_marker("Only available if ScrollX is disabled.")
                ImGui.checkbox_flags("ImGuiTableFlags_PreciseWidths", pointerof(flags.val), ImGuiTableFlags::PreciseWidths)
                ImGui.same_line
                help_marker("Disable distributing remainder width to stretched columns (width allocation on a 100-wide table with 3 columns: Without this flag: 33,33,34. With this flag: 33,33,33). With larger number of columns, resizing will appear to be less smooth.")
                ImGui.checkbox_flags("ImGuiTableFlags_NoClip", pointerof(flags.val), ImGuiTableFlags::NoClip)
                ImGui.same_line
                help_marker("Disable clipping rectangle for every individual columns (reduce draw command count, items will be able to overflow into other columns). Generally incompatible with ScrollFreeze options.")
              end

              ImGui.tree_node_ex("Padding:", ImGuiTreeNodeFlags::DefaultOpen) do
                ImGui.checkbox_flags("ImGuiTableFlags_PadOuterX", pointerof(flags.val), ImGuiTableFlags::PadOuterX)
                ImGui.checkbox_flags("ImGuiTableFlags_NoPadOuterX", pointerof(flags.val), ImGuiTableFlags::NoPadOuterX)
                ImGui.checkbox_flags("ImGuiTableFlags_NoPadInnerX", pointerof(flags.val), ImGuiTableFlags::NoPadInnerX)
              end

              ImGui.tree_node_ex("Scrolling:", ImGuiTreeNodeFlags::DefaultOpen) do
                ImGui.checkbox_flags("ImGuiTableFlags_ScrollX", pointerof(flags.val), ImGuiTableFlags::ScrollX)
                ImGui.same_line
                ImGui.set_next_item_width(ImGui.get_frame_height)
                ImGui.drag_int("freeze_cols", pointerof(freeze_cols.val), 0.2f32, 0, 9, flags: ImGuiSliderFlags::NoInput)
                ImGui.checkbox_flags("ImGuiTableFlags_ScrollY", pointerof(flags.val), ImGuiTableFlags::ScrollY)
                ImGui.same_line
                ImGui.set_next_item_width(ImGui.get_frame_height)
                ImGui.drag_int("freeze_rows", pointerof(freeze_rows.val), 0.2f32, 0, 9, flags: ImGuiSliderFlags::NoInput)
              end

              ImGui.tree_node_ex("Sorting:", ImGuiTreeNodeFlags::DefaultOpen) do
                ImGui.checkbox_flags("ImGuiTableFlags_SortMulti", pointerof(flags.val), ImGuiTableFlags::SortMulti)
                ImGui.same_line
                help_marker("When sorting is enabled: hold shift when clicking headers to sort on multiple column. TableGetSortSpecs() may return specs where (SpecsCount > 1).")
                ImGui.checkbox_flags("ImGuiTableFlags_SortTristate", pointerof(flags.val), ImGuiTableFlags::SortTristate)
                ImGui.same_line
                help_marker("When sorting is enabled: allow no sorting, disable default sorting. TableGetSortSpecs() may return specs where (SpecsCount == 0).")
              end

              ImGui.tree_node_ex("Headers:", ImGuiTreeNodeFlags::DefaultOpen) do
                ImGui.checkbox("show_headers", pointerof(show_headers.val))
                ImGui.checkbox_flags("ImGuiTableFlags_HighlightHoveredColumn", pointerof(flags.val), ImGuiTableFlags::HighlightHoveredColumn)
                ImGui.checkbox_flags("ImGuiTableColumnFlags_AngledHeader", pointerof(columns_base_flags.val), ImGuiTableColumnFlags::AngledHeader)
                ImGui.same_line
                help_marker("Enable AngledHeader on all columns. Best enabled on selected narrow columns (see \"Angled headers\" section of the demo).")
              end

              ImGui.tree_node_ex("Other:", ImGuiTreeNodeFlags::DefaultOpen) do
                ImGui.checkbox("show_wrapped_text", pointerof(show_wrapped_text.val))

                ImGui.drag_float2("##OuterSize", pointerof(outer_size_value.val))
                ImGui.same_line(0.0f32, ImGui.get_style.item_inner_spacing.x)
                ImGui.checkbox("outer_size", pointerof(outer_size_enabled.val))
                ImGui.same_line
                help_marker("If scrolling is disabled (ScrollX and ScrollY not set):\n" +
                            "- The table is output directly in the parent window.\n" +
                            "- OuterSize.x < 0.0f will right-align the table.\n" +
                            "- OuterSize.x = 0.0f will narrow fit the table unless there are any Stretch columns.\n" +
                            "- OuterSize.y then becomes the minimum size for the table, which will extend vertically if there are more rows (unless NoHostExtendY is set).")

                ImGui.drag_float("inner_width (when ScrollX active)", pointerof(inner_width_with_scroll.val), 1.0f32, 0.0f32, Float32::MAX)

                ImGui.drag_float("row_min_height", pointerof(row_min_height.val), 1.0f32, 0.0f32, Float32::MAX)
                ImGui.same_line
                help_marker("Specify height of the Selectable item.")

                ImGui.drag_int("items_count", pointerof(items_count.val), 0.1f32, 0, 9999)
                ImGui.combo("items_type (first column)", pointerof(contents_type.val), contents_type_names)
              end
            end
          end
          ImGui.spacing
        end

        static items = [] of MyItem
        static selection = [] of Int32
        static items_need_sort = false
        if items.val.size != items_count.val
          items.val = Array(MyItem).new(items_count.val) do |n|
            template_n = n % template_items_names.size
            MyItem.new(
              id: n,
              name: template_items_names[template_n],
              quantity: (template_n == 3) ? 10 : (template_n == 4) ? 20 : 0,
            )
          end
        end

        parent_draw_list = ImGui.get_window_draw_list
        parent_draw_list_draw_cmd_count = parent_draw_list.cmd_buffer.size
        table_scroll_cur = ImVec2.new
        table_scroll_max = ImVec2.new
        table_draw_list = nil

        inner_width_to_use = (flags.val.includes?(:ScrollX)) ? inner_width_with_scroll.val : 0.0f32
        ImGui.table("table_advanced", 6, flags.val, outer_size_enabled.val ? outer_size_value.val : ImVec2.new(0, 0), inner_width_to_use) do
          ImGui.table_setup_column("ID", columns_base_flags.val | ImGuiTableColumnFlags::DefaultSort | ImGuiTableColumnFlags::WidthFixed | ImGuiTableColumnFlags::NoHide, 0.0f32, MyItemColumnID::ID.to_u32)
          ImGui.table_setup_column("Name", columns_base_flags.val | ImGuiTableColumnFlags::WidthFixed, 0.0f32, MyItemColumnID::Name.to_u32)
          ImGui.table_setup_column("Action", columns_base_flags.val | ImGuiTableColumnFlags::NoSort | ImGuiTableColumnFlags::WidthFixed, 0.0f32, MyItemColumnID::Action.to_u32)
          ImGui.table_setup_column("Quantity", columns_base_flags.val | ImGuiTableColumnFlags::PreferSortDescending, 0.0f32, MyItemColumnID::Quantity.to_u32)
          ImGui.table_setup_column("Description", columns_base_flags.val | (flags.val.includes?(:NoHostExtendX) ? ImGuiTableColumnFlags::None : ImGuiTableColumnFlags::WidthStretch), 0.0f32, MyItemColumnID::Description.to_u32)
          ImGui.table_setup_column("Hidden", columns_base_flags.val | ImGuiTableColumnFlags::DefaultHide | ImGuiTableColumnFlags::NoSort)
          ImGui.table_setup_scroll_freeze(freeze_cols.val, freeze_rows.val)

          sort_specs = ImGui.table_get_sort_specs
          if sort_specs && sort_specs.specs_dirty
            items_need_sort.val = true
          end
          if sort_specs && items_need_sort.val && items.val.size > 1
            MyItem.sort_with_sort_specs(sort_specs, items.val)
            sort_specs.specs_dirty = false
          end
          items_need_sort.val = false

          sorts_specs_using_quantity = (ImGui.table_get_column_flags(3).includes?(:IsSorted))

          if show_headers.val && (columns_base_flags.val.includes?(:AngledHeader))
            ImGui.table_angled_headers_row
          end
          if show_headers.val
            ImGui.table_headers_row
          end

          ImGui.with_button_repeat(true) do
            clipper = ImGuiListClipper.new
            clipper.begin(items.val.size)
            while clipper.step
              (clipper.display_start...clipper.display_end).each do |row_n|
                item = items.val[row_n]

                item_is_selected = selection.val.includes?(item.id)
                ImGui.with_id(item.id) do
                  ImGui.table_next_row(ImGuiTableRowFlags::None, row_min_height.val)

                  ImGui.table_set_column_index(0)
                  label = sprintf("%04d", item.id)
                  if contents_type.val == ContentsType3::Text
                    ImGui.text_unformatted(label)
                  elsif contents_type.val == ContentsType3::Button
                    ImGui.button(label)
                  elsif contents_type.val == ContentsType3::SmallButton
                    ImGui.small_button(label)
                  elsif contents_type.val == ContentsType3::FillButton
                    ImGui.button(label, ImVec2.new(-Float32::MIN_POSITIVE, 0.0f32))
                  elsif contents_type.val == ContentsType3::Selectable || contents_type.val == ContentsType3::SelectableSpanRow
                    selectable_flags = (contents_type.val == ContentsType3::SelectableSpanRow) ? ImGuiSelectableFlags::SpanAllColumns | ImGuiSelectableFlags::AllowOverlap : ImGuiSelectableFlags::None
                    if ImGui.selectable(label, item_is_selected, selectable_flags, ImVec2.new(0, row_min_height.val))
                      if ImGui.get_io.key_ctrl
                        if item_is_selected
                          selection.val.delete(item.id)
                        else
                          selection.val << item.id
                        end
                      else
                        selection.val.clear
                        selection.val << item.id
                      end
                    end
                  end

                  if ImGui.table_set_column_index(1)
                    ImGui.text_unformatted(item.name)
                  end

                  if ImGui.table_set_column_index(2)
                    if ImGui.small_button("Chop")
                      item.quantity += 1
                    end
                    if sorts_specs_using_quantity && ImGui.is_item_deactivated
                      items_need_sort.val = true
                    end
                    ImGui.same_line
                    if ImGui.small_button("Eat")
                      item.quantity -= 1
                    end
                    if sorts_specs_using_quantity && ImGui.is_item_deactivated
                      items_need_sort.val = true
                    end
                  end

                  if ImGui.table_set_column_index(3)
                    ImGui.text("%d", item.quantity)
                  end

                  ImGui.table_set_column_index(4)
                  if show_wrapped_text.val
                    ImGui.text_wrapped("Lorem ipsum dolor sit amet")
                  else
                    ImGui.text("Lorem ipsum dolor sit amet")
                  end

                  if ImGui.table_set_column_index(5)
                    ImGui.text("1234")
                  end
                end
              end
            end
          end

          table_scroll_cur = ImVec2.new(ImGui.get_scroll_x, ImGui.get_scroll_y)
          table_scroll_max = ImVec2.new(ImGui.get_scroll_max_x, ImGui.get_scroll_max_y)
          table_draw_list = ImGui.get_window_draw_list
        end
        static show_debug_details = false
        ImGui.checkbox("Debug details", pointerof(show_debug_details.val))
        if show_debug_details.val && table_draw_list
          ImGui.same_line(0.0f32, 0.0f32)
          table_draw_list_draw_cmd_count = table_draw_list.cmd_buffer.size
          if table_draw_list == parent_draw_list
            ImGui.text(": DrawCmd: +%d (in same window)",
              table_draw_list_draw_cmd_count - parent_draw_list_draw_cmd_count)
          else
            ImGui.text(": DrawCmd: +%d (in child window), Scroll: (%.f/%.f) (%.f/%.f)",
              table_draw_list_draw_cmd_count - 1, table_scroll_cur.x, table_scroll_max.x, table_scroll_cur.y, table_scroll_max.y)
          end
        end
      end
    end

    show_demo_window_columns

    if disable_indent.val
      ImGui.pop_style_var
    end
  end

  def self.show_demo_window_columns
    demo_marker("Columns (legacy API)")
    open = ImGui.tree_node("Legacy Columns API")
    ImGui.same_line
    help_marker("Columns() is an old API! Prefer using the more flexible and powerful BeginTable() API!")
    if !open
      return
    end

    demo_marker("Columns (legacy API)/Basic")
    ImGui.tree_node("Basic") do
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
    end

    demo_marker("Columns (legacy API)/Borders")
    ImGui.tree_node("Borders") do
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
    end

    demo_marker("Columns (legacy API)/Mixed items")
    ImGui.tree_node("Mixed items") do
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
    end

    demo_marker("Columns (legacy API)/Word-wrapping")
    ImGui.tree_node("Word-wrapping") do
      ImGui.columns(2, "word-wrapping")
      ImGui.separator
      ImGui.text_wrapped("The quick brown fox jumps over the lazy dog.")
      ImGui.text_wrapped("Hello Left")
      ImGui.next_column
      ImGui.text_wrapped("The quick brown fox jumps over the lazy dog.")
      ImGui.text_wrapped("Hello Right")
      ImGui.columns(1)
      ImGui.separator
    end

    demo_marker("Columns (legacy API)/Horizontal Scrolling")
    ImGui.tree_node("Horizontal Scrolling") do
      ImGui.set_next_window_content_size(ImVec2.new(1500.0f32, 0.0f32))
      child_size = ImVec2.new(0, ImGui.get_font_size * 20.0f32)
      ImGui.child("##ScrollingRegion", child_size, ImGuiChildFlags::None, ImGuiWindowFlags::HorizontalScrollbar) do
        ImGui.columns(10)

        items_count = 2000
        clipper = ImGuiListClipper.new
        clipper.begin(items_count)
        while clipper.step
          (clipper.display_start...clipper.display_end).each do |i|
            10.times do |j|
              ImGui.text("Line %d Column %d...", i, j)
              ImGui.next_column
            end
          end
        end
        ImGui.columns(1)
      end
    end

    demo_marker("Columns (legacy API)/Tree")
    ImGui.tree_node("Tree") do
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
              ImGui.tree_node("Tree in column") do
                ImGui.text("The quick brown fox jumps over the lazy dog")
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
    end

    ImGui.tree_pop
  end

  def self.show_demo_window_inputs
    demo_marker("Inputs & Focus")
    if ImGui.collapsing_header("Inputs & Focus")
      io = ImGui.get_io

      demo_marker("Inputs & Focus/Inputs")
      ImGui.set_next_item_open(true, ImGuiCond::Once)
      ImGui.tree_node("Inputs") do
        help_marker(
          "This is a simplified view. See more detailed input state:\n" +
          "- in 'Tools->Metrics/Debugger->Inputs'.\n" +
          "- in 'Tools->Debug Log->IO'.")
        if ImGui.is_mouse_pos_valid
          ImGui.text("Mouse pos: (%g, %g)", io.mouse_pos.x, io.mouse_pos.y)
        else
          ImGui.text("Mouse pos: <INVALID>")
        end
        ImGui.text("Mouse delta: (%g, %g)", io.mouse_delta.x, io.mouse_delta.y)
        ImGui.text("Mouse down:")
        io.mouse_down.size.times do |i|
          if ImGui.is_mouse_down(ImGuiMouseButton.new(i))
            ImGui.same_line
            ImGui.text("b%d (%.02f secs)", i, io.mouse_down_duration[i])
          end
        end
        ImGui.text("Mouse wheel: %.1f", io.mouse_wheel)

        ImGui.text("Keys down:")
        (0...ImGuiKey::COUNT.to_i).each do |key|
          key = ImGuiKey.new(key)
          next if !ImGui.is_key_down(key)
          ImGui.same_line
          ImGui.text((key < ImGuiKey::Tab) ? "\"%s\"" : "\"%s\" %d", ImGui.get_key_name(key), key)
        end
        ImGui.text("Keys mods: %s%s%s%s", io.key_ctrl ? "CTRL " : "", io.key_shift ? "SHIFT " : "", io.key_alt ? "ALT " : "", io.key_super ? "SUPER " : "")
        ImGui.text("Chars queue:")
        io.input_queue_characters.size.times do |i|
          c = io.input_queue_characters[i]
          ImGui.same_line
          ImGui.text("'%c' (0x%04X)", (c > ' ' && c.ord <= 255) ? c : '?', c)
        end
      end

      demo_marker("Inputs & Focus/Outputs")
      ImGui.set_next_item_open(true, ImGuiCond::Once)
      ImGui.tree_node("Outputs") do
        help_marker(
          "The value of io.WantCaptureMouse and io.WantCaptureKeyboard are normally set by Dear ImGui " +
          "to instruct your application of how to route inputs. Typically, when a value is true, it means " +
          "Dear ImGui wants the corresponding inputs and we expect the underlying application to ignore them.\n\n" +
          "The most typical case is: when hovering a window, Dear ImGui set io.WantCaptureMouse to true, " +
          "and underlying application should ignore mouse inputs (in practice there are many and more subtle " +
          "rules leading to how those flags are set).")
        ImGui.text("io.WantCaptureMouse: %d", io.want_capture_mouse)
        ImGui.text("io.WantCaptureMouseUnlessPopupClose: %d", io.want_capture_mouse_unless_popup_close)
        ImGui.text("io.WantCaptureKeyboard: %d", io.want_capture_keyboard)
        ImGui.text("io.WantTextInput: %d", io.want_text_input)
        ImGui.text("io.WantSetMousePos: %d", io.want_set_mouse_pos)
        ImGui.text("io.NavActive: %d, io.NavVisible: %d", io.nav_active, io.nav_visible)

        demo_marker("Inputs & Focus/Outputs/WantCapture override")
        ImGui.tree_node("WantCapture override") do
          help_marker(
            "Hovering the colored canvas will override io.WantCaptureXXX fields.\n" +
            "Notice how normally (when set to none), the value of io.WantCaptureKeyboard would be false when hovering " +
            "and true when clicking.")
          static capture_override_mouse = -1
          static capture_override_keyboard = -1
          capture_override_desc = ["None", "Set to false", "Set to true"]
          ImGui.set_next_item_width(ImGui.get_font_size * 15)
          ImGui.slider_int("SetNextFrameWantCaptureMouse() on hover", pointerof(capture_override_mouse.val), -1, +1, capture_override_desc[capture_override_mouse.val + 1], ImGuiSliderFlags::AlwaysClamp)
          ImGui.set_next_item_width(ImGui.get_font_size * 15)
          ImGui.slider_int("SetNextFrameWantCaptureKeyboard() on hover", pointerof(capture_override_keyboard.val), -1, +1, capture_override_desc[capture_override_keyboard.val + 1], ImGuiSliderFlags::AlwaysClamp)

          ImGui.color_button("##panel", ImVec4.new(0.7f32, 0.1f32, 0.7f32, 1.0f32), ImGuiColorEditFlags::NoTooltip | ImGuiColorEditFlags::NoDragDrop, ImVec2.new(128.0f32, 96.0f32))
          if ImGui.is_item_hovered && capture_override_mouse.val != -1
            ImGui.set_next_frame_want_capture_mouse(capture_override_mouse.val == 1)
          end
          if ImGui.is_item_hovered && capture_override_keyboard.val != -1
            ImGui.set_next_frame_want_capture_keyboard(capture_override_keyboard.val == 1)
          end
        end
      end

      demo_marker("Inputs & Focus/Mouse Cursors")
      ImGui.tree_node("Mouse Cursors") do
        mouse_cursors_names = ["Arrow", "TextInput", "ResizeAll", "ResizeNS", "ResizeEW", "ResizeNESW", "ResizeNWSE", "Hand", "NotAllowed"]

        current = ImGui.get_mouse_cursor
        ImGui.text("Current mouse cursor = %d: %s", current, mouse_cursors_names[current.value])
        ImGui.disabled(true) do
          ImGui.checkbox_flags("io.BackendFlags: HasMouseCursors", pointerof(io.backend_flags), ImGuiBackendFlags::HasMouseCursors)
        end

        ImGui.text("Hover to see mouse cursors:")
        ImGui.same_line
        help_marker(
          "Your application can render a different mouse cursor based on what ImGui::GetMouseCursor() returns. " +
          "If software cursor rendering (io.MouseDrawCursor) is set ImGui will draw the right cursor for you, " +
          "otherwise your backend needs to handle it.")
        mouse_cursors_names.each_index do |i|
          label = sprintf("Mouse cursor %d: %s", i, mouse_cursors_names[i])
          ImGui.bullet
          ImGui.selectable(label, false)
          if ImGui.is_item_hovered
            ImGui.set_mouse_cursor(ImGuiMouseCursor.new(i))
          end
        end
      end

      demo_marker("Inputs & Focus/Tabbing")
      ImGui.tree_node("Tabbing") do
        ImGui.text("Use TAB/SHIFT+TAB to cycle through keyboard editable fields.")
        static buf = ImGui::TextBuffer.new("hello", 32)
        ImGui.input_text("1", buf.val)
        ImGui.input_text("2", buf.val)
        ImGui.input_text("3", buf.val)
        ImGui.with_tab_stop(false) do
          ImGui.input_text("4 (tab skip)", buf.val)
          ImGui.same_line
          help_marker("Item won't be cycled through when using TAB or Shift+Tab.")
        end
        ImGui.input_text("5", buf.val)
      end

      demo_marker("Inputs & Focus/Focus from code")
      ImGui.tree_node("Focus from code") do
        focus_1 = ImGui.button("Focus on 1")
        ImGui.same_line
        focus_2 = ImGui.button("Focus on 2")
        ImGui.same_line
        focus_3 = ImGui.button("Focus on 3")
        has_focus = nil
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

        ImGui.with_tab_stop(false) do
          if focus_3
            ImGui.set_keyboard_focus_here
          end
          ImGui.input_text("3 (tab skip)", buf.val)
          if ImGui.is_item_active
            has_focus = 3
          end
          ImGui.same_line
          help_marker("Item won't be cycled through when using TAB or Shift+Tab.")
        end

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
      end

      demo_marker("Inputs & Focus/Dragging")
      ImGui.tree_node("Dragging") do
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

        value_raw = ImGui.get_mouse_drag_delta(:Left, 0.0f32)
        value_with_lock_threshold = ImGui.get_mouse_drag_delta(:Left)
        mouse_delta = io.mouse_delta
        ImGui.text("GetMouseDragDelta(0):")
        ImGui.text("  w/ default threshold: (%.1f, %.1f)", value_with_lock_threshold.x, value_with_lock_threshold.y)
        ImGui.text("  w/ zero threshold: (%.1f, %.1f)", value_raw.x, value_raw.y)
        ImGui.text("io.MouseDelta: (%.1f, %.1f)", mouse_delta.x, mouse_delta.y)
      end
    end
  end

  ImGui.pointer_wrapper def self.show_about_window(p_open = Pointer(Bool).null)
    if !ImGui.begin("About Dear ImGui", p_open, ImGuiWindowFlags::AlwaysAutoResize)
      ImGui.end
      return
    end
    demo_marker("Tools/About Dear ImGui")
    ImGui.text("Dear ImGui %s (%d)", ImGui::VERSION, ImGui::VERSION_NUM)
    ImGui.separator
    ImGui.text("By Omar Cornut and all Dear ImGui contributors.")
    ImGui.text("Dear ImGui is licensed under the MIT License, see LICENSE for more information.")
    ImGui.text("If your company uses this, please consider sponsoring the project!")

    static show_config_info = false
    ImGui.checkbox("Config/Build Information", pointerof(show_config_info.val))
    if show_config_info.val
      io = ImGui.get_io
      style = ImGui.get_style

      copy_to_clipboard = ImGui.button("Copy to clipboard")
      child_size = ImVec2.new(0, ImGui.get_text_line_height_with_spacing * 18)
      ImGui.child(ImGui.get_id("cfg_infos"), child_size, ImGuiChildFlags::FrameStyle) do
        if copy_to_clipboard
          ImGui.log_to_clipboard
          ImGui.log_text("```\n")
        end

        ImGui.text("Dear ImGui %s (%d)", ImGui::VERSION, ImGui::VERSION_NUM)
        ImGui.separator
        ImGui.text("sizeof(size_t): %d, sizeof(ImDrawIdx): %d, sizeof(ImDrawVert): %d", sizeof(LibC::SizeT), sizeof(ImGui::ImDrawIdx), sizeof(ImDrawVert))
        ImGui.separator
        ImGui.text("io.BackendPlatformName: %s", io.backend_platform_name || "NULL")
        ImGui.text("io.BackendRendererName: %s", io.backend_renderer_name || "NULL")
        ImGui.text("io.ConfigFlags: 0x%08X", io.config_flags)
        if io.config_flags.includes?(:NavEnableKeyboard)
          ImGui.text(" NavEnableKeyboard")
        end
        if io.config_flags.includes?(:NavEnableGamepad)
          ImGui.text(" NavEnableGamepad")
        end
        if io.config_flags.includes?(:NavEnableSetMousePos)
          ImGui.text(" NavEnableSetMousePos")
        end
        if io.config_flags.includes?(:NavNoCaptureKeyboard)
          ImGui.text(" NavNoCaptureKeyboard")
        end
        if io.config_flags.includes?(:NoMouse)
          ImGui.text(" NoMouse")
        end
        if io.config_flags.includes?(:NoMouseCursorChange)
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
        if io.config_memory_compact_timer >= 0.0f32
          ImGui.text("io.ConfigMemoryCompactTimer = %.1f", io.config_memory_compact_timer)
        end
        ImGui.text("io.BackendFlags: 0x%08X", io.backend_flags)
        if io.backend_flags.includes?(:HasGamepad)
          ImGui.text(" HasGamepad")
        end
        if io.backend_flags.includes?(:HasMouseCursors)
          ImGui.text(" HasMouseCursors")
        end
        if io.backend_flags.includes?(:HasSetMousePos)
          ImGui.text(" HasSetMousePos")
        end
        if io.backend_flags.includes?(:RendererHasVtxOffset)
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
      end
    end
    ImGui.end
  end

  def self.show_font_selector(label)
    io = ImGui.get_io
    font_current = ImGui.get_font
    ImGui.combo(label, font_current.get_debug_name) do
      io.fonts.fonts.each do |font|
        ImGui.with_id(font) do
          if ImGui.selectable(font.get_debug_name, font == font_current)
            io.font_default = font
          end
        end
      end
    end
    ImGui.same_line
    help_marker(
      "- Load additional fonts with io.Fonts->AddFontFromFileTTF().\n" +
      "- The font atlas is built when calling io.Fonts->GetTexDataAsXXXX() or io.Fonts->Build().\n" +
      "- Read FAQ and docs/FONTS.md for more details.\n" +
      "- If you need to add/remove fonts at runtime (e.g. for DPI change), do it before calling NewFrame().")
  end

  def self.show_style_selector(label)
    static style_idx = -1
    if ImGui.combo(label, pointerof(style_idx.val), "Dark\0Light\0Classic\0")
      case style_idx.val
      when 0
        ImGui.style_colors_dark
      when 1
        ImGui.style_colors_light
      when 2
        ImGui.style_colors_classic
      end
      return true
    end
    return false
  end

  def self.show_style_editor(ref = nil)
    demo_marker("Tools/Style Editor")

    style = ImGui.get_style
    static ref_saved_style = ImGuiStyle.new

    static init = true
    if init.val && ref == nil
      ref_saved_style.val = style
    end
    init.val = false
    ref ||= ref_saved_style.val

    ImGui.with_item_width(ImGui.get_window_width * 0.50f32) do
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

      ImGui.tab_bar("##tabs", ImGuiTabBarFlags::None) do
        ImGui.tab_item("Sizes") do
          ImGui.separator_text("Main")
          ImGui.slider_float2("WindowPadding", pointerof(style.window_padding), 0.0f32, 20.0f32, "%.0f")
          ImGui.slider_float2("FramePadding", pointerof(style.frame_padding), 0.0f32, 20.0f32, "%.0f")
          ImGui.slider_float2("ItemSpacing", pointerof(style.item_spacing), 0.0f32, 20.0f32, "%.0f")
          ImGui.slider_float2("ItemInnerSpacing", pointerof(style.item_inner_spacing), 0.0f32, 20.0f32, "%.0f")
          ImGui.slider_float2("TouchExtraPadding", pointerof(style.touch_extra_padding), 0.0f32, 10.0f32, "%.0f")
          ImGui.slider_float("IndentSpacing", pointerof(style.indent_spacing), 0.0f32, 30.0f32, "%.0f")
          ImGui.slider_float("ScrollbarSize", pointerof(style.scrollbar_size), 1.0f32, 20.0f32, "%.0f")
          ImGui.slider_float("GrabMinSize", pointerof(style.grab_min_size), 1.0f32, 20.0f32, "%.0f")

          ImGui.separator_text("Borders")
          ImGui.slider_float("WindowBorderSize", pointerof(style.window_border_size), 0.0f32, 1.0f32, "%.0f")
          ImGui.slider_float("ChildBorderSize", pointerof(style.child_border_size), 0.0f32, 1.0f32, "%.0f")
          ImGui.slider_float("PopupBorderSize", pointerof(style.popup_border_size), 0.0f32, 1.0f32, "%.0f")
          ImGui.slider_float("FrameBorderSize", pointerof(style.frame_border_size), 0.0f32, 1.0f32, "%.0f")
          ImGui.slider_float("TabBorderSize", pointerof(style.tab_border_size), 0.0f32, 1.0f32, "%.0f")
          ImGui.slider_float("TabBarBorderSize", pointerof(style.tab_bar_border_size), 0.0f32, 2.0f32, "%.0f")

          ImGui.separator_text("Rounding")
          ImGui.slider_float("WindowRounding", pointerof(style.window_rounding), 0.0f32, 12.0f32, "%.0f")
          ImGui.slider_float("ChildRounding", pointerof(style.child_rounding), 0.0f32, 12.0f32, "%.0f")
          ImGui.slider_float("FrameRounding", pointerof(style.frame_rounding), 0.0f32, 12.0f32, "%.0f")
          ImGui.slider_float("PopupRounding", pointerof(style.popup_rounding), 0.0f32, 12.0f32, "%.0f")
          ImGui.slider_float("ScrollbarRounding", pointerof(style.scrollbar_rounding), 0.0f32, 12.0f32, "%.0f")
          ImGui.slider_float("GrabRounding", pointerof(style.grab_rounding), 0.0f32, 12.0f32, "%.0f")
          ImGui.slider_float("TabRounding", pointerof(style.tab_rounding), 0.0f32, 12.0f32, "%.0f")

          ImGui.separator_text("Tables")
          ImGui.slider_float2("CellPadding", pointerof(style.cell_padding), 0.0f32, 20.0f32, "%.0f")
          ImGui.slider_angle("TableAngledHeadersAngle", pointerof(style.table_angled_headers_angle), -50.0f32, +50.0f32)

          ImGui.separator_text("Widgets")
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
          ImGui.slider_float("SeparatorTextBorderSize", pointerof(style.separator_text_border_size), 0.0f32, 10.0f32, "%.0f")
          ImGui.slider_float2("SeparatorTextAlign", pointerof(style.separator_text_align), 0.0f32, 1.0f32, "%.2f")
          ImGui.slider_float2("SeparatorTextPadding", pointerof(style.separator_text_padding), 0.0f32, 40.0f32, "%.0f")
          ImGui.slider_float("LogSliderDeadzone", pointerof(style.log_slider_deadzone), 0.0f32, 12.0f32, "%.0f")

          ImGui.separator_text("Tooltips")
          {% for n in 0..1 %}
            ImGui.tree_node_ex({{n == 0 ? "HoverFlagsForTooltipMouse" : "HoverFlagsForTooltipNav"}}) do
              {% p = (n == 0) ? "pointerof(style.hover_flags_for_tooltip_mouse)".id : "pointerof(style.hover_flags_for_tooltip_nav)".id %}
              ImGui.checkbox_flags("ImGuiHoveredFlags_DelayNone", {{p}}, ImGuiHoveredFlags::DelayNone)
              ImGui.checkbox_flags("ImGuiHoveredFlags_DelayShort", {{p}}, ImGuiHoveredFlags::DelayShort)
              ImGui.checkbox_flags("ImGuiHoveredFlags_DelayNormal", {{p}}, ImGuiHoveredFlags::DelayNormal)
              ImGui.checkbox_flags("ImGuiHoveredFlags_Stationary", {{p}}, ImGuiHoveredFlags::Stationary)
              ImGui.checkbox_flags("ImGuiHoveredFlags_NoSharedDelay", {{p}}, ImGuiHoveredFlags::NoSharedDelay)
            end
          {% end %}

          ImGui.separator_text("Misc")
          ImGui.slider_float2("DisplaySafeAreaPadding", pointerof(style.display_safe_area_padding), 0.0f32, 30.0f32, "%.0f")
          ImGui.same_line
          help_marker("Adjust if you cannot see the edges of your screen (e.g. on a TV where scaling has not been configured).")
        end

        ImGui.tab_item("Colors") do
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
            "Left-click on color square to open color picker,\n" +
            "Right-click to open edit options menu.")

          ImGui.set_next_window_size_constraints(ImVec2.new(0.0f32, ImGui.get_text_line_height_with_spacing * 10), ImVec2.new(Float32::MAX, Float32::MAX))
          ImGui.child("##colors", ImVec2.new(0, 0), ImGuiChildFlags::Border, ImGuiWindowFlags::AlwaysVerticalScrollbar | ImGuiWindowFlags::AlwaysHorizontalScrollbar | ImGuiWindowFlags::NavFlattened) do
            ImGui.with_item_width(ImGui.get_font_size * -12) do
              ImGuiCol.each do |col_i|
                i = col_i.to_i
                name = ImGui.get_style_color_name(col_i)
                if !filter.val.pass_filter(name)
                  next
                end
                ImGui.with_id(i) do
                  if ImGui.button("?")
                    ImGui.debug_flash_style_color(col_i)
                  end
                  ImGui.set_item_tooltip("Flash given color to identify places where it is used.")
                  ImGui.same_line
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
                end
              end
            end
          end
        end

        ImGui.tab_item("Fonts") do
          io = ImGui.get_io
          atlas = io.fonts
          help_marker("Read FAQ and docs/FONTS.md for details on font loading.")
          LibImGui.ShowFontAtlas(atlas)

          min_scale = 0.3f32
          max_scale = 2.0f32
          help_marker(
            "Those are old settings provided for convenience.\n" +
            "However, the _correct_ way of scaling your UI is currently to reload your font at the designed size, " +
            "rebuild the font atlas, and call style.ScaleAllSizes() on a reference ImGuiStyle structure.\n" +
            "Using those settings here will give you poor quality results.")
          static window_scale = 1.0f32
          ImGui.with_item_width(ImGui.get_font_size * 8) do
            if ImGui.drag_float("window scale", pointerof(window_scale.val), 0.005f32, min_scale, max_scale, "%.2f", ImGuiSliderFlags::AlwaysClamp)
              ImGui.set_window_font_scale(window_scale.val)
            end
            ImGui.drag_float("global scale", pointerof(io.font_global_scale), 0.005f32, min_scale, max_scale, "%.2f", ImGuiSliderFlags::AlwaysClamp)
          end
        end

        ImGui.tab_item("Rendering") do
          ImGui.checkbox("Anti-aliased lines", pointerof(style.anti_aliased_lines))
          ImGui.same_line
          help_marker("When disabling anti-aliasing lines, you'll probably want to disable borders in your style as well.")

          ImGui.checkbox("Anti-aliased lines use texture", pointerof(style.anti_aliased_lines_use_tex))
          ImGui.same_line
          help_marker("Faster lines using texture data. Require backend to render with bilinear filtering (not point/nearest filtering).")

          ImGui.checkbox("Anti-aliased fill", pointerof(style.anti_aliased_fill))
          ImGui.with_item_width(ImGui.get_font_size * 8) do
            ImGui.drag_float("Curve Tessellation Tolerance", pointerof(style.curve_tessellation_tol), 0.02f32, 0.10f32, 10.0f32, "%.2f")
            if style.curve_tessellation_tol < 0.10f32
              style.curve_tessellation_tol = 0.10f32
            end

            ImGui.drag_float("Circle Tessellation Max Error", pointerof(style.circle_tessellation_max_error), 0.005f32, 0.10f32, 5.0f32, "%.2f", ImGuiSliderFlags::AlwaysClamp)
            show_samples = ImGui.is_item_active
            if show_samples
              ImGui.set_next_window_pos(ImGui.get_cursor_screen_pos)
            end
            if show_samples && ImGui.begin_tooltip
              ImGui.text_unformatted("(R = radius, N = number of segments)")
              ImGui.spacing
              draw_list = ImGui.get_window_draw_list
              min_widget_width = ImGui.calc_text_size("N: MMM\nR: MMM").x
              8.times do |n|
                rad_min = 5.0f32
                rad_max = 70.0f32
                rad = rad_min + (rad_max - rad_min) * n / (8.0f32 - 1.0f32)

                ImGui.group do
                  ImGui.text("R: %.f\nN: %d", rad, LibImGui.ImDrawList__CalcCircleAutoSegmentCount(draw_list, rad))

                  canvas_width = {min_widget_width, rad * 2.0f32}.max
                  offset_x = (canvas_width * 0.5f32).floor
                  offset_y = (rad_max).floor

                  p1 = ImGui.get_cursor_screen_pos
                  draw_list.add_circle(ImVec2.new(p1.x + offset_x, p1.y + offset_y), rad, ImGui.get_color_u32(ImGuiCol::Text))
                  ImGui.dummy(ImVec2.new(canvas_width, rad_max * 2))
                end
                ImGui.same_line
              end
              ImGui.end_tooltip
            end
            ImGui.same_line
            help_marker("When drawing circle primitives with \"num_segments == 0\" tesselation will be calculated automatically.")

            ImGui.drag_float("Global Alpha", pointerof(style.alpha), 0.005f32, 0.20f32, 1.0f32, "%.2f")
            ImGui.drag_float("Disabled Alpha", pointerof(style.disabled_alpha), 0.005f32, 0.0f32, 1.0f32, "%.2f")
            ImGui.same_line
            help_marker("Additional alpha multiplier for disabled items (multiply over current value of Alpha).")
          end
        end
      end
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
    ImGui.bullet_text("CTRL+Tab to select a window.")
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
    ImGui.unindent
    ImGui.bullet_text("With keyboard navigation enabled:")
    ImGui.indent
    ImGui.bullet_text("Arrow keys to navigate.")
    ImGui.bullet_text("Space to activate a widget.")
    ImGui.bullet_text("Return to input text into a widget.")
    ImGui.bullet_text("Escape to deactivate a widget, close popup, exit child window.")
    ImGui.bullet_text("Alt to jump to the menu layer of a window.")
    ImGui.unindent
  end

  def self.show_example_app_main_menu_bar
    ImGui.main_menu_bar do
      ImGui.menu("File") do
        show_example_menu_file
      end
      ImGui.menu("Edit") do
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
      end
    end
  end

  def self.show_example_menu_file
    demo_marker("Examples/Menu")
    ImGui.menu_item("(demo menu)", "", false, false)
    if ImGui.menu_item("New")
    end
    if ImGui.menu_item("Open", "Ctrl+O")
    end
    ImGui.menu("Open Recent") do
      ImGui.menu_item("fish_hat.c")
      ImGui.menu_item("fish_hat.inl")
      ImGui.menu_item("fish_hat.h")
      ImGui.menu("More..") do
        ImGui.menu_item("Hello")
        ImGui.menu_item("Sailor")
        ImGui.menu("Recurse..") do
          show_example_menu_file
        end
      end
    end
    if ImGui.menu_item("Save", "Ctrl+S")
    end
    if ImGui.menu_item("Save As..")
    end

    ImGui.separator
    demo_marker("Examples/Menu/Options")
    ImGui.menu("Options") do
      static enabled = true
      ImGui.menu_item("Enabled", "", pointerof(enabled.val))
      ImGui.child("child", ImVec2.new(0, 60), ImGuiChildFlags::Border) do
        10.times do |i|
          ImGui.text("Scrolling Text %d", i)
        end
      end
      static f = 0.5f32
      static n = 0
      ImGui.slider_float("Value", pointerof(f.val), 0.0f32, 1.0f32)
      ImGui.input_float("Input", pointerof(f.val), 0.1f32)
      ImGui.combo("Combo", pointerof(n.val), "Yes\0No\0Maybe\0\0")
    end

    demo_marker("Examples/Menu/Colors")
    ImGui.menu("Colors") do
      sz = ImGui.get_text_line_height
      ImGuiCol.each do |col_i|
        name = ImGui.get_style_color_name(col_i)
        p = ImGui.get_cursor_screen_pos
        ImGui.get_window_draw_list.add_rect_filled(p, ImVec2.new(p.x + sz, p.y + sz), ImGui.get_color_u32(col_i))
        ImGui.dummy(ImVec2.new(sz, sz))
        ImGui.same_line
        ImGui.menu_item(name)
      end
    end

    ImGui.menu("Options") do
      demo_marker("Examples/Menu/Append to an existing menu")
      static b = true
      ImGui.checkbox("SomeOption", pointerof(b.val))
    end

    if ImGui.begin_menu("Disabled", false)
      assert(0)
    end
    if ImGui.menu_item("Checked", nil, true)
    end
    ImGui.separator
    if ImGui.menu_item("Quit", "Alt+F4")
    end
  end

  class ExampleAppConsole
    def initialize
      ImGuiDemo.demo_marker("Examples/Console")

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

      ImGui.popup_context_item do
        if ImGui.menu_item("Close Console")
          p_open.value = false
        end
      end

      ImGui.text_wrapped(
        "This example implements a console with basic coloring, completion (TAB key) and history (Up/Down keys). A more elaborate " +
        "implementation may want to store entries along with extra data such as timestamp, emitter, etc.")
      ImGui.text_wrapped("Enter 'HELP' for help.")

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

      ImGui.popup("Options") do
        ImGui.checkbox("Auto-scroll", pointerof(@auto_scroll))
      end

      if ImGui.button("Options")
        ImGui.open_popup("Options")
      end
      ImGui.same_line
      @filter.draw("Filter (\"incl,-excl\") (\"error\")", 180)
      ImGui.separator

      footer_height_to_reserve = ImGui.get_style.item_spacing.y + ImGui.get_frame_height_with_spacing
      ImGui.child("ScrollingRegion", ImVec2.new(0, -footer_height_to_reserve), ImGuiChildFlags::None, ImGuiWindowFlags::HorizontalScrollbar) do
        ImGui.popup_context_window do
          if ImGui.selectable("Clear")
            clear_log
          end
        end
        ImGui.with_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(4, 1)) do
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
        end
      end

      ImGui.separator

      reclaim_focus = false
      input_text_flags = ImGuiInputTextFlags::EnterReturnsTrue | ImGuiInputTextFlags::EscapeClearsAll | ImGuiInputTextFlags::CallbackCompletion | ImGuiInputTextFlags::CallbackHistory
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
        word = String.new(data.bytes[word_start...word_end])

        candidates = [] of String
        @commands.each do |cmd|
          n = (word_end - word_start).to_i
          if cmd[0, n].upcase == word[0, n].upcase
            candidates << cmd
          end
        end

        if candidates.size == 0
          add_log("No match for \"%s\"!\n", word)
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

      ImGui.popup("Options") do
        ImGui.checkbox("Auto-scroll", pointerof(@auto_scroll))
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

      ImGui.child("scrolling", ImVec2.new(0, 0), ImGuiChildFlags::None, ImGuiWindowFlags::HorizontalScrollbar) do
        if clear
          clear
        end
        if copy
          ImGui.log_to_clipboard
        end

        ImGui.with_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(0, 0)) do
          buf = @buf.to_slice
          buf_end = nil
          if @filter.is_active
            @line_offsets.size.times do |line_no|
              line_start = @line_offsets[line_no]
              line_end = (line_no + 1 < @line_offsets.size) ? (@line_offsets[line_no + 1] - 1) : buf_end
              line = buf[line_start...line_end]
              if @filter.pass_filter(line)
                ImGui.text_unformatted(line)
              end
            end
          else
            clipper = ImGuiListClipper.new
            clipper.begin(@line_offsets.size)
            while clipper.step
              (clipper.display_start...clipper.display_end).each do |line_no|
                line_start = @line_offsets[line_no]
                line_end = (line_no + 1 < @line_offsets.size) ? @line_offsets[line_no + 1] - 1 : buf_end
                line = buf[line_start...line_end]
                ImGui.text_unformatted(line)
              end
            end
            clipper.end
          end
        end

        if @auto_scroll && ImGui.get_scroll_y >= ImGui.get_scroll_max_y
          ImGui.set_scroll_here_y(1.0f32)
        end
      end
      ImGui.end
    end
  end

  ImGui.pointer_wrapper def self.show_example_app_log(p_open = Pointer(Bool).null)
    static log = ExampleAppLog.new

    ImGui.set_next_window_size(ImVec2.new(500, 400), ImGuiCond::FirstUseEver)
    ImGui.window("Example: Log", p_open) do
      demo_marker("Examples/Log")
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
    end

    log.val.draw("Example: Log", p_open)
  end

  ImGui.pointer_wrapper def self.show_example_app_layout(p_open = Pointer(Bool).null)
    ImGui.set_next_window_size(ImVec2.new(500, 440), ImGuiCond::FirstUseEver)
    if ImGui.begin("Example: Simple layout", p_open, ImGuiWindowFlags::MenuBar)
      demo_marker("Examples/Simple layout")
      ImGui.menu_bar do
        ImGui.menu("File") do
          if ImGui.menu_item("Close", "Ctrl+W")
            p_open.value = false
          end
        end
      end

      static selected = 0
      begin
        ImGui.child("left pane", ImVec2.new(150, 0), ImGuiChildFlags::Border | ImGuiChildFlags::ResizeX) do
          100.times do |i|
            label = sprintf("MyObject %d", i)
            if ImGui.selectable(label, selected.val == i)
              selected.val = i
            end
          end
        end
      end
      ImGui.same_line

      begin
        ImGui.group do
          ImGui.child("item view", ImVec2.new(0, -ImGui.get_frame_height_with_spacing)) do
            ImGui.text("MyObject: %d", selected.val)
            ImGui.separator
            ImGui.tab_bar("##Tabs", ImGuiTabBarFlags::None) do
              ImGui.tab_item("Description") do
                ImGui.text_wrapped("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
              end
              ImGui.tab_item("Details") do
                ImGui.text("ID: 0123456789")
              end
            end
          end
          if ImGui.button("Revert")
          end
          ImGui.same_line
          if ImGui.button("Save")
          end
        end
      end
    end
    ImGui.end
  end

  def self.show_placeholder_object(prefix, uid)
    ImGui.with_id(uid) do
      ImGui.table_next_row
      ImGui.table_set_column_index(0)
      ImGui.align_text_to_frame_padding
      node_open = ImGui.tree_node("Object", "%s_%u", prefix, uid)
      ImGui.table_set_column_index(1)
      ImGui.text("my sailor is rich")

      if node_open
        static placeholder_members = [0.0f32, 0.0f32, 1.0f32, 3.1416f32, 100.0f32, 999.0f32, 0.0f32, 0.0f32]
        8.times do |i|
          ImGui.with_id(i) do
            if i < 2
              show_placeholder_object("Child", 424242)
            else
              ImGui.table_next_row
              ImGui.table_set_column_index(0)
              ImGui.align_text_to_frame_padding
              flags = ImGuiTreeNodeFlags::Leaf | ImGuiTreeNodeFlags::NoTreePushOnOpen | ImGuiTreeNodeFlags::Bullet
              ImGui.tree_node_ex("Field", flags, "Field_%d", i)

              ImGui.table_set_column_index(1)
              ImGui.set_next_item_width(-Float32::MIN_POSITIVE)
              if i >= 5
                ImGui.input_float("##value", pointerof(placeholder_members.val[i]), 1.0f32)
              else
                ImGui.drag_float("##value", pointerof(placeholder_members.val[i]), 0.01f32)
              end
              ImGui.next_column
            end
          end
        end
        ImGui.tree_pop
      end
    end
  end

  ImGui.pointer_wrapper def self.show_example_app_property_editor(p_open = Pointer(Bool).null)
    ImGui.set_next_window_size(ImVec2.new(430, 450), ImGuiCond::FirstUseEver)
    if !ImGui.begin("Example: Property editor", p_open)
      ImGui.end
      return
    end

    demo_marker("Examples/Property Editor")
    help_marker(
      "This example shows how you may implement a property editor using two columns.\n" +
      "All objects/fields data are dummies here.\n")

    ImGui.with_style_var(ImGuiStyleVar::FramePadding, ImVec2.new(2, 2)) do
      ImGui.table("##split", 2, ImGuiTableFlags::BordersOuter | ImGuiTableFlags::Resizable | ImGuiTableFlags::ScrollY) do
        ImGui.table_setup_scroll_freeze(0, 1)
        ImGui.table_setup_column("Object")
        ImGui.table_setup_column("Contents")
        ImGui.table_headers_row

        4.times do |obj_i|
          show_placeholder_object("Object", obj_i)
        end
      end
    end
    ImGui.end
  end

  ImGui.pointer_wrapper def self.show_example_app_long_text(p_open = Pointer(Bool).null)
    ImGui.set_next_window_size(ImVec2.new(520, 600), ImGuiCond::FirstUseEver)
    if !ImGui.begin("Example: Long text display", p_open)
      ImGui.end
      return
    end
    demo_marker("Examples/Long text display")

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
    ImGui.child("Log") do
      case test_type.val
      when 0
        ImGui.text_unformatted(log.val.to_slice)
      when 1 then begin
        ImGui.with_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(0, 0)) do
          clipper = ImGuiListClipper.new
          clipper.begin(lines.val)
          while clipper.step
            (clipper.display_start...clipper.display_end).each do |i|
              ImGui.text("%i The quick brown fox jumps over the lazy dog", i)
            end
          end
        end
      end
      when 2
        ImGui.with_style_var(ImGuiStyleVar::ItemSpacing, ImVec2.new(0, 0)) do
          lines.val.times do |i|
            ImGui.text("%i The quick brown fox jumps over the lazy dog", i)
          end
        end
      end
    end
    ImGui.end
  end

  ImGui.pointer_wrapper def self.show_example_app_auto_resize(p_open = Pointer(Bool).null)
    if !ImGui.begin("Example: Auto-resizing window", p_open, ImGuiWindowFlags::AlwaysAutoResize)
      ImGui.end
      return
    end
    demo_marker("Examples/Auto-resizing window")

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
    aspect_ratio = 16.0f32 / 9.0f32
    aspect_ratio_constraint = ->(data : ImGuiSizeCallbackData) {
      size_x = data.current_size.x
      size_y = (size_x / aspect_ratio).to_i.to_f32
      data.desired_size = ImVec2.new(size_x, size_y)
    }
    square_constraint = ->(data : ImGuiSizeCallbackData) {
      size = {data.desired_size.x, data.desired_size.y}.max
      data.desired_size = ImVec2.new(size, size)
    }
    step = 100.0f32
    step_constraint = ->(data : ImGuiSizeCallbackData) {
      data.desired_size = ImVec2.new((data.desired_size.x / step + 0.5f32).to_i * step, (data.desired_size.y / step + 0.5f32).to_i * step)
    }

    test_desc = [
      "Between 100x100 and 500x500",
      "At least 100x100",
      "Resize vertical only",
      "Resize horizontal only",
      "Width Between 400 and 500",
      "Custom: Aspect Ratio 16:9",
      "Custom: Always Square",
      "Custom: Fixed Steps (100)",
    ]

    static auto_resize = false
    static window_padding = true
    static type = 6
    static display_lines = 10

    if type.val == 0
      ImGui.set_next_window_size_constraints(ImVec2.new(100, 100), ImVec2.new(500, 500))
    end
    if type.val == 1
      ImGui.set_next_window_size_constraints(ImVec2.new(100, 100), ImVec2.new(Float32::MAX, Float32::MAX))
    end
    if type.val == 2
      ImGui.set_next_window_size_constraints(ImVec2.new(-1, 0), ImVec2.new(-1, Float32::MAX))
    end
    if type.val == 3
      ImGui.set_next_window_size_constraints(ImVec2.new(0, -1), ImVec2.new(Float32::MAX, -1))
    end
    if type.val == 4
      ImGui.set_next_window_size_constraints(ImVec2.new(400, -1), ImVec2.new(500, -1))
    end
    if type.val == 5
      ImGui.set_next_window_size_constraints(ImVec2.new(-1, 500), ImVec2.new(-1, Float32::MAX))
    end
    if type.val == 6
      ImGui.set_next_window_size_constraints(ImVec2.new(0, 0), ImVec2.new(Float32::MAX, Float32::MAX), &aspect_ratio_constraint)
    end
    if type.val == 7
      ImGui.set_next_window_size_constraints(ImVec2.new(0, 0), ImVec2.new(Float32::MAX, Float32::MAX), &square_constraint)
    end
    if type.val == 8
      ImGui.set_next_window_size_constraints(ImVec2.new(0, 0), ImVec2.new(Float32::MAX, Float32::MAX), &step_constraint)
    end

    if !window_padding.val
      ImGui.push_style_var(ImGuiStyleVar::WindowPadding, ImVec2.new(0.0f32, 0.0f32))
    end
    window_flags = auto_resize.val ? ImGuiWindowFlags::AlwaysAutoResize : ImGuiWindowFlags::None
    window_open = ImGui.begin("Example: Constrained Resize", p_open, window_flags)
    if !window_padding.val
      ImGui.pop_style_var
    end
    if window_open
      demo_marker("Examples/Constrained Resizing window")
      if ImGui.get_io.key_shift
        avail_size = ImGui.get_content_region_avail
        pos = ImGui.get_cursor_screen_pos
        ImGui.color_button("viewport", ImVec4.new(0.5f32, 0.2f32, 0.5f32, 1.0f32), ImGuiColorEditFlags::NoTooltip | ImGuiColorEditFlags::NoDragDrop, avail_size)
        ImGui.set_cursor_screen_pos(ImVec2.new(pos.x + 10, pos.y + 10))
        ImGui.text("%.2f x %.2f", avail_size.x, avail_size.y)
      else
        ImGui.text("(Hold SHIFT to display a dummy viewport)")
        if ImGui.button("Set 200x200")
          ImGui.set_window_size(ImVec2.new(200, 200))
        end
        ImGui.same_line
        if ImGui.button("Set 500x500")
          ImGui.set_window_size(ImVec2.new(500, 500))
        end
        ImGui.same_line
        if ImGui.button("Set 800x200")
          ImGui.set_window_size(ImVec2.new(800, 200))
        end
        ImGui.set_next_item_width(ImGui.get_font_size * 20)
        ImGui.combo("Constraint", pointerof(type.val), test_desc)
        ImGui.set_next_item_width(ImGui.get_font_size * 20)
        ImGui.drag_int("Lines", pointerof(display_lines.val), 0.2f32, 1, 100)
        ImGui.checkbox("Auto-resize", pointerof(auto_resize.val))
        ImGui.checkbox("Window padding", pointerof(window_padding.val))
        display_lines.val.times do |i|
          ImGui.text("%*sHello, sailor! Making this line long enough for the example.", i * 4, "")
        end
      end
    end
    ImGui.end
  end

  ImGui.pointer_wrapper def self.show_example_app_simple_overlay(p_open = Pointer(Bool).null)
    static location = 0
    io = ImGui.get_io
    window_flags = ImGuiWindowFlags::NoDecoration | ImGuiWindowFlags::AlwaysAutoResize | ImGuiWindowFlags::NoSavedSettings | ImGuiWindowFlags::NoFocusOnAppearing | ImGuiWindowFlags::NoNav
    if location.val >= 0
      pad = 10.0f32
      viewport = ImGui.get_main_viewport
      work_pos = viewport.work_pos
      work_size = viewport.work_size
      window_pos = ImVec2.new
      window_pos_pivot = ImVec2.new
      window_pos.x = (location.val & 1) != 0 ? (work_pos.x + work_size.x - pad) : (work_pos.x + pad)
      window_pos.y = (location.val & 2) != 0 ? (work_pos.y + work_size.y - pad) : (work_pos.y + pad)
      window_pos_pivot.x = (location.val & 1) != 0 ? 1.0f32 : 0.0f32
      window_pos_pivot.y = (location.val & 2) != 0 ? 1.0f32 : 0.0f32
      ImGui.set_next_window_pos(window_pos, ImGuiCond::Always, window_pos_pivot)
      window_flags |= ImGuiWindowFlags::NoMove
    elsif location.val == -2
      ImGui.set_next_window_pos(ImGui.get_main_viewport.get_center, ImGuiCond::Always, ImVec2.new(0.5f32, 0.5f32))
      window_flags |= ImGuiWindowFlags::NoMove
    end
    ImGui.set_next_window_bg_alpha(0.35f32)
    if ImGui.begin("Example: Simple overlay", p_open, window_flags)
      demo_marker("Examples/Simple Overlay")
      ImGui.text("Simple overlay\n" +
                 "(right-click to change position)")
      ImGui.separator
      if ImGui.is_mouse_pos_valid
        ImGui.text("Mouse Position: (%.1f,%.1f)", io.mouse_pos.x, io.mouse_pos.y)
      else
        ImGui.text("Mouse Position: <invalid>")
      end
      ImGui.popup_context_window do
        if ImGui.menu_item("Custom", nil, location.val == -1)
          location.val = -1
        end
        if ImGui.menu_item("Center", nil, location.val == -2)
          location.val = -2
        end
        if ImGui.menu_item("Top-left", nil, location.val == 0)
          location.val = 0
        end
        if ImGui.menu_item("Top-right", nil, location.val == 1)
          location.val = 1
        end
        if ImGui.menu_item("Bottom-left", nil, location.val == 2)
          location.val = 2
        end
        if ImGui.menu_item("Bottom-right", nil, location.val == 3)
          location.val = 3
        end
        if p_open && ImGui.menu_item("Close")
          p_open.value = false
        end
      end
    end
    ImGui.end
  end

  ImGui.pointer_wrapper def self.show_example_app_fullscreen(p_open = Pointer(Bool).null)
    static use_work_area = true
    static flags = ImGuiWindowFlags::NoDecoration | ImGuiWindowFlags::NoMove | ImGuiWindowFlags::NoSavedSettings

    viewport = ImGui.get_main_viewport
    ImGui.set_next_window_pos(use_work_area.val ? viewport.work_pos : viewport.pos)
    ImGui.set_next_window_size(use_work_area.val ? viewport.work_size : viewport.size)

    if ImGui.begin("Example: Fullscreen window", p_open, flags.val)
      ImGui.checkbox("Use work area instead of main area", pointerof(use_work_area.val))
      ImGui.same_line
      help_marker("Main Area = entire viewport,\nWork Area = entire viewport minus sections used by the main menu bars, task bars etc.\n\nEnable the main-menu bar in Examples menu to see the difference.")

      ImGui.checkbox_flags("ImGuiWindowFlags_NoBackground", pointerof(flags.val), ImGuiWindowFlags::NoBackground)
      ImGui.checkbox_flags("ImGuiWindowFlags_NoDecoration", pointerof(flags.val), ImGuiWindowFlags::NoDecoration)
      ImGui.indent
      ImGui.checkbox_flags("ImGuiWindowFlags_NoTitleBar", pointerof(flags.val), ImGuiWindowFlags::NoTitleBar)
      ImGui.checkbox_flags("ImGuiWindowFlags_NoCollapse", pointerof(flags.val), ImGuiWindowFlags::NoCollapse)
      ImGui.checkbox_flags("ImGuiWindowFlags_NoScrollbar", pointerof(flags.val), ImGuiWindowFlags::NoScrollbar)
      ImGui.unindent

      if p_open && ImGui.button("Close this window")
        p_open.value = false
      end
    end
    ImGui.end
  end

  ImGui.pointer_wrapper def self.show_example_app_window_titles(p_open = Pointer(Bool).null)
    viewport = ImGui.get_main_viewport
    base_pos = viewport.pos

    ImGui.set_next_window_pos(ImVec2.new(base_pos.x + 100, base_pos.y + 100), ImGuiCond::FirstUseEver)
    ImGui.window("Same title as another window##1") do
      demo_marker("Examples/Manipulating window titles")
      ImGui.text("This is window 1.\nMy title is the same as window 2, but my identifier is unique.")
    end

    ImGui.set_next_window_pos(ImVec2.new(base_pos.x + 100, base_pos.y + 200), ImGuiCond::FirstUseEver)
    ImGui.window("Same title as another window##2") do
      ImGui.text("This is window 2.\nMy title is the same as window 1, but my identifier is unique.")
    end

    buf = sprintf("Animated title %c %d###AnimatedTitle", "|/-\\"[(ImGui.get_time / 0.25f32).to_i & 3], ImGui.get_frame_count)
    ImGui.set_next_window_pos(ImVec2.new(base_pos.x + 100, base_pos.y + 300), ImGuiCond::FirstUseEver)
    ImGui.window(buf) do
      ImGui.text("This window has a changing title.")
    end
  end

  ImGui.pointer_wrapper def self.show_example_app_custom_rendering(p_open = Pointer(Bool).null)
    if !ImGui.begin("Example: Custom rendering", p_open)
      ImGui.end
      return
    end
    demo_marker("Examples/Custom Rendering")

    ImGui.tab_bar("##TabBar") do
      ImGui.tab_item("Primitives") do
        ImGui.with_item_width(-ImGui.get_font_size * 15) do
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
          static curve_segments_override = false
          static curve_segments_override_v = 8
          static colf = ImVec4.new(1.0f32, 1.0f32, 0.4f32, 1.0f32)
          ImGui.drag_float("Size", pointerof(sz.val), 0.2f32, 2.0f32, 100.0f32, "%.0f")
          ImGui.drag_float("Thickness", pointerof(thickness.val), 0.05f32, 1.0f32, 8.0f32, "%.02f")
          ImGui.slider_int("N-gon sides", pointerof(ngon_sides.val), 3, 12)
          ImGui.checkbox("##circlesegmentoverride", pointerof(circle_segments_override.val))
          ImGui.same_line(0.0f32, ImGui.get_style.item_inner_spacing.x)
          circle_segments_override.val |= ImGui.slider_int("Circle segments override", pointerof(circle_segments_override_v.val), 3, 40)
          ImGui.checkbox("##curvessegmentoverride", pointerof(curve_segments_override.val))
          ImGui.same_line(0.0f32, ImGui.get_style.item_inner_spacing.x)
          curve_segments_override.val |= ImGui.slider_int("Curves segments override", pointerof(curve_segments_override_v.val), 3, 40)
          ImGui.color_edit4("Color", pointerof(colf.val))

          p = ImGui.get_cursor_screen_pos
          col = ImGui.color_convert_float4_to_u32(colf.val)
          spacing = 10.0f32
          corners_tl_br = ImDrawFlags::RoundCornersTopLeft | ImDrawFlags::RoundCornersBottomRight
          rounding = sz.val / 5.0f32
          circle_segments = circle_segments_override.val ? circle_segments_override_v.val : 0
          curve_segments = curve_segments_override.val ? curve_segments_override_v.val : 0
          x = p.x + 4.0f32
          y = p.y + 4.0f32
          2.times do |n|
            th = (n == 0) ? 1.0f32 : thickness.val
            draw_list.add_ngon(ImVec2.new(x + sz.val * 0.5f32, y + sz.val * 0.5f32), sz.val * 0.5f32, col, ngon_sides.val, th)
            x += sz.val + spacing
            draw_list.add_circle(ImVec2.new(x + sz.val * 0.5f32, y + sz.val * 0.5f32), sz.val * 0.5f32, col, circle_segments, th)
            x += sz.val + spacing
            draw_list.add_ellipse(ImVec2.new(x + sz.val * 0.5f32, y + sz.val * 0.5f32), sz.val * 0.5f32, sz.val * 0.3f32, col, -0.3f32, circle_segments, th)
            x += sz.val + spacing
            draw_list.add_rect(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), col, 0.0f32, ImDrawFlags::None, th)
            x += sz.val + spacing
            draw_list.add_rect(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), col, rounding, ImDrawFlags::None, th)
            x += sz.val + spacing
            draw_list.add_rect(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), col, rounding, corners_tl_br, th)
            x += sz.val + spacing
            draw_list.add_triangle(ImVec2.new(x + sz.val * 0.5f32, y), ImVec2.new(x + sz.val, y + sz.val - 0.5f32), ImVec2.new(x, y + sz.val - 0.5f32), col, th)
            x += sz.val + spacing

            draw_list.add_line(ImVec2.new(x, y), ImVec2.new(x + sz.val, y), col, th)
            x += sz.val + spacing
            draw_list.add_line(ImVec2.new(x, y), ImVec2.new(x, y + sz.val), col, th)
            x += spacing
            draw_list.add_line(ImVec2.new(x, y), ImVec2.new(x + sz.val, y + sz.val), col, th)
            x += sz.val + spacing

            cp3 = [ImVec2.new(x, y + sz.val * 0.6f32), ImVec2.new(x + sz.val * 0.5f32, y - sz.val * 0.4f32), ImVec2.new(x + sz.val, y + sz.val)]
            draw_list.add_bezier_quadratic(cp3[0], cp3[1], cp3[2], col, th, curve_segments)
            x += sz.val + spacing

            cp4 = [ImVec2.new(x, y), ImVec2.new(x + sz.val * 1.3f32, y + sz.val * 0.3f32), ImVec2.new(x + sz.val - sz.val * 1.3f32, y + sz.val - sz.val * 0.3f32), ImVec2.new(x + sz.val, y + sz.val)]
            draw_list.add_bezier_cubic(cp4[0], cp4[1], cp4[2], cp4[3], col, th, curve_segments)

            x = p.x + 4
            y += sz.val + spacing
          end
          draw_list.add_ngon_filled(ImVec2.new(x + sz.val * 0.5f32, y + sz.val * 0.5f32), sz.val * 0.5f32, col, ngon_sides.val)
          x += sz.val + spacing
          draw_list.add_circle_filled(ImVec2.new(x + sz.val * 0.5f32, y + sz.val * 0.5f32), sz.val * 0.5f32, col, circle_segments)
          x += sz.val + spacing
          draw_list.add_ellipse_filled(ImVec2.new(x + sz.val * 0.5f32, y + sz.val * 0.5f32), sz.val * 0.5f32, sz.val * 0.3f32, col, -0.3f32, circle_segments)
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

          ImGui.dummy(ImVec2.new((sz.val + spacing) * 11.2f32, (sz.val + spacing) * 3.0f32))
        end
      end

      ImGui.tab_item("Canvas") do
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
        if opt_enable_context_menu.val && drag_delta.x == 0.0f32 && drag_delta.y == 0.0f32
          ImGui.open_popup_on_item_click("context", ImGuiPopupFlags::MouseButtonRight)
        end
        ImGui.popup("context") do
          if adding_line.val
            points.val.pop(2)
          end
          adding_line.val = false
          if ImGui.menu_item("Remove one", "", false, points.val.size > 0)
            points.val.pop(2)
          end
          if ImGui.menu_item("Remove all", nil, false, points.val.size > 0)
            points.val.clear
          end
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
      end

      ImGui.tab_item("BG/FG draw lists") do
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
      end

      ImGui.tab_item("Draw Channels") do
        draw_list = ImGui.get_window_draw_list
        begin
          ImGui.text("Blue shape is drawn first: appears in back")
          ImGui.text("Red shape is drawn after: appears in front")
          p0 = ImGui.get_cursor_screen_pos
          draw_list.add_rect_filled(ImVec2.new(p0.x, p0.y), ImVec2.new(p0.x + 50, p0.y + 50), ImGui.col32(0, 0, 255, 255))
          draw_list.add_rect_filled(ImVec2.new(p0.x + 25, p0.y + 25), ImVec2.new(p0.x + 75, p0.y + 75), ImGui.col32(255, 0, 0, 255))
          ImGui.dummy(ImVec2.new(75, 75))
        end
        ImGui.separator
        begin
          ImGui.text("Blue shape is drawn first, into channel 1: appears in front")
          ImGui.text("Red shape is drawn after, into channel 0: appears in back")
          p1 = ImGui.get_cursor_screen_pos

          draw_list.channels_split(2)
          draw_list.channels_set_current(1)
          draw_list.add_rect_filled(ImVec2.new(p1.x, p1.y), ImVec2.new(p1.x + 50, p1.y + 50), ImGui.col32(0, 0, 255, 255))
          draw_list.channels_set_current(0)
          draw_list.add_rect_filled(ImVec2.new(p1.x + 25, p1.y + 25), ImVec2.new(p1.x + 75, p1.y + 75), ImGui.col32(255, 0, 0, 255))

          draw_list.channels_merge
          ImGui.dummy(ImVec2.new(75, 75))
          ImGui.text("After reordering, contents of channel 0 appears below channel 1.")
        end
      end
    end

    ImGui.end
  end

  class MyDocument
    getter name
    property open
    property open_prev
    property dirty
    property want_close
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
      ImGui.with_id(doc) do
        ImGui.text("Document \"%s\"", doc.name)
        ImGui.with_style_color(ImGuiCol::Text, doc.color) do
          ImGui.text_wrapped("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
        end
        if ImGui.button("Modify", ImVec2.new(100, 0))
          doc.dirty = true
        end
        ImGui.same_line
        if ImGui.button("Save", ImVec2.new(100, 0))
          doc.do_save
        end
        ImGui.color_edit3("color", pointerof(doc.color))
      end
    end

    def self.display_context_menu(doc)
      if !ImGui.begin_popup_context_item
        return
      end

      buf = sprintf("Save %s", doc.name)
      if ImGui.menu_item(buf, "CTRL+S", false, doc.open)
        doc.do_save
      end
      if ImGui.menu_item("Close", "CTRL+W", false, doc.open)
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
    app.documents.each do |doc|
      if !doc.open && doc.open_prev
        ImGui.set_tab_item_closed(doc.name)
      end
      doc.open_prev = doc.open
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

    ImGui.menu_bar do
      ImGui.menu("File") do
        open_count = 0
        app.val.documents.each do |doc|
          open_count += doc.open ? 1 : 0
        end

        ImGui.menu("Open", open_count < app.val.documents.size) do
          app.val.documents.each do |doc|
            if !doc.open && ImGui.menu_item(doc.name)
              doc.do_open
            end
          end
        end
        if ImGui.menu_item("Close All Documents", "", false, open_count > 0)
          app.val.documents.each do |doc|
            doc.do_queue_close
          end
        end
        if ImGui.menu_item("Exit", "Ctrl+F4") && p_open.value
          p_open.value = false
        end
      end
    end

    app.val.documents.size.times do |doc_n|
      doc = app.val.documents[doc_n]
      if doc_n > 0
        ImGui.same_line
      end
      ImGui.with_id(doc) do
        if ImGui.checkbox(doc.name, pointerof(doc.open))
          if !doc.open
            doc.do_force_close
          end
        end
      end
    end

    ImGui.separator
    begin
      tab_bar_flags = (opt_fitting_flags.val) | (opt_reorderable.val ? ImGuiTabBarFlags::Reorderable : ImGuiTabBarFlags::None)
      ImGui.tab_bar("##tabs", tab_bar_flags) do
        if opt_reorderable.val
          notify_of_documents_closed_elsewhere(app.val)
        end

        app.val.documents.each do |doc|
          if !doc.open
            next
          end

          tab_flags = (doc.dirty ? ImGuiTabItemFlags::UnsavedDocument : ImGuiTabItemFlags::None)
          visible = ImGui.begin_tab_item(doc.name, pointerof(doc.open), tab_flags)

          if !doc.open && doc.dirty
            doc.open = true
            doc.do_queue_close
          end

          MyDocument.display_context_menu(doc)
          if visible
            MyDocument.display_contents(doc)
            ImGui.end_tab_item
          end
        end
      end
    end

    static close_queue = [] of MyDocument
    if close_queue.val.empty?
      app.val.documents.each do |doc|
        if doc.want_close
          doc.want_close = false
          close_queue.val << doc
        end
      end
    end

    if !close_queue.val.empty?
      close_queue_unsaved_documents = 0
      close_queue.val.size.times do |n|
        if close_queue.val[n].dirty
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
        ImGui.popup_modal("Save?", flags: ImGuiWindowFlags::AlwaysAutoResize) do
          ImGui.text("Save change to the following items?")
          item_height = ImGui.get_text_line_height_with_spacing
          if ImGui.begin_child(ImGui.get_id("frame"), ImVec2.new(-Float32::MIN_POSITIVE, 6.25f32 * item_height), ImGuiChildFlags::FrameStyle)
            close_queue.val.size.times do |n|
              if close_queue.val[n].dirty
                ImGui.text("%s", close_queue.val[n].name)
              end
            end
          end
          ImGui.end_child

          button_size = ImVec2.new(ImGui.get_font_size * 7.0f32, 0.0f32)
          if ImGui.button("Yes", button_size)
            close_queue.val.size.times do |n|
              if close_queue.val[n].dirty
                close_queue.val[n].do_save
              end
              close_queue.val[n].do_force_close
            end
            close_queue.val.clear
            ImGui.close_current_popup
          end
          ImGui.same_line
          if ImGui.button("No", button_size)
            close_queue.val.size.times do |n|
              close_queue.val[n].do_force_close
            end
            close_queue.val.clear
            ImGui.close_current_popup
          end
          ImGui.same_line
          if ImGui.button("Cancel", button_size)
            close_queue.val.clear
            ImGui.close_current_popup
          end
        end
      end
    end

    ImGui.end
  end
end
