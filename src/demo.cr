require "./imgui"

macro assert(expr)
  ({{expr}}) || raise "Assertion failed: " + {{expr.stringify}}
end

module ImGuiDemo
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

  @@show_app_main_menu_bar = false
  @@show_app_documents = false
  @@show_app_console = false
  @@show_app_log = false
  @@show_app_layout = false
  @@show_app_property_editor = false
  @@show_app_long_text = false
  @@show_app_auto_resize = false
  @@show_app_constrained_resize = false
  @@show_app_simple_overlay = false
  @@show_app_window_titles = false
  @@show_app_custom_rendering = false
  @@show_app_metrics = false
  @@show_app_style_editor = false
  @@show_app_about = false
  @@no_titlebar = false
  @@no_scrollbar = false
  @@no_menu = false
  @@no_move = false
  @@no_resize = false
  @@no_collapse = false
  @@no_close = false
  @@no_nav = false
  @@no_background = false
  @@no_bring_to_front = false

  def self.show_demo_window(p_open = Pointer(Bool).null)
    assert(ImGui.get_current_context != nil && "Missing dear imgui context. Refer to examples app!")

    if @@show_app_main_menu_bar
      show_example_app_main_menu_bar()
    end
    if @@show_app_documents
      show_example_app_documents(pointerof(@@show_app_documents))
    end
    if @@show_app_console
      show_example_app_console(pointerof(@@show_app_console))
    end
    if @@show_app_log
      show_example_app_log(pointerof(@@show_app_log))
    end
    if @@show_app_layout
      show_example_app_layout(pointerof(@@show_app_layout))
    end
    if @@show_app_property_editor
      show_example_app_property_editor(pointerof(@@show_app_property_editor))
    end
    if @@show_app_long_text
      show_example_app_long_text(pointerof(@@show_app_long_text))
    end
    if @@show_app_auto_resize
      show_example_app_auto_resize(pointerof(@@show_app_auto_resize))
    end
    if @@show_app_constrained_resize
      show_example_app_constrained_resize(pointerof(@@show_app_constrained_resize))
    end
    if @@show_app_simple_overlay
      show_example_app_simple_overlay(pointerof(@@show_app_simple_overlay))
    end
    if @@show_app_window_titles
      show_example_app_window_titles(pointerof(@@show_app_window_titles))
    end
    if @@show_app_custom_rendering
      show_example_app_custom_rendering(pointerof(@@show_app_custom_rendering))
    end

    if @@show_app_metrics
      ImGui.show_metrics_window(pointerof(@@show_app_metrics))
    end
    if @@show_app_about
      show_about_window(pointerof(@@show_app_about))
    end
    if @@show_app_style_editor
      ImGui.begin("crystal-imgui Style Editor", pointerof(@@show_app_style_editor))
      show_style_editor
      ImGui.end
    end

    window_flags = ImGui::ImGuiWindowFlags::None
    if @@no_titlebar
      window_flags |= ImGui::ImGuiWindowFlags::NoTitleBar
    end
    if @@no_scrollbar
      window_flags |= ImGui::ImGuiWindowFlags::NoScrollbar
    end
    if !@@no_menu
      window_flags |= ImGui::ImGuiWindowFlags::MenuBar
    end
    if @@no_move
      window_flags |= ImGui::ImGuiWindowFlags::NoMove
    end
    if @@no_resize
      window_flags |= ImGui::ImGuiWindowFlags::NoResize
    end
    if @@no_collapse
      window_flags |= ImGui::ImGuiWindowFlags::NoCollapse
    end
    if @@no_nav
      window_flags |= ImGui::ImGuiWindowFlags::NoNav
    end
    if @@no_background
      window_flags |= ImGui::ImGuiWindowFlags::NoBackground
    end
    if @@no_bring_to_front
      window_flags |= ImGui::ImGuiWindowFlags::NoBringToFrontOnFocus
    end
    if @@no_close
      p_open = Pointer(Bool).null
    end

    ImGui.set_next_window_pos(ImGui.vec2(20, 20), ImGui::ImGuiCond::FirstUseEver)
    ImGui.set_next_window_size(ImGui.vec2(550, 680), ImGui::ImGuiCond::FirstUseEver)

    if !ImGui.begin("crystal-imgui Demo", p_open, window_flags)
      ImGui.end
      return
    end

    ImGui.push_item_width(ImGui.get_font_size * -12)

    if ImGui.begin_menu_bar
      if ImGui.begin_menu("Menu")
        show_example_menu_file()
        ImGui.end_menu
      end
      if ImGui.begin_menu("Examples")
        ImGui.menu_item("Main menu bar", "", pointerof(@@show_app_main_menu_bar))
        ImGui.menu_item("Console", "", pointerof(@@show_app_console))
        ImGui.menu_item("Log", "", pointerof(@@show_app_log))
        ImGui.menu_item("Simple layout", "", pointerof(@@show_app_layout))
        ImGui.menu_item("Property editor", "", pointerof(@@show_app_property_editor))
        ImGui.menu_item("Long text display", "", pointerof(@@show_app_long_text))
        ImGui.menu_item("Auto-resizing window", "", pointerof(@@show_app_auto_resize))
        ImGui.menu_item("Constrained-resizing window", "", pointerof(@@show_app_constrained_resize))
        ImGui.menu_item("Simple overlay", "", pointerof(@@show_app_simple_overlay))
        ImGui.menu_item("Manipulating window titles", "", pointerof(@@show_app_window_titles))
        ImGui.menu_item("Custom rendering", "", pointerof(@@show_app_custom_rendering))
        ImGui.menu_item("Documents", "", pointerof(@@show_app_documents))
        ImGui.end_menu
      end
      if ImGui.begin_menu("Tools")
        ImGui.menu_item("Metrics", "", pointerof(@@show_app_metrics))
        ImGui.menu_item("Style Editor", "", pointerof(@@show_app_style_editor))
        ImGui.menu_item("About Dear ImGui", "", pointerof(@@show_app_about))
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
      ImGui.bullet_text("See the show_demo_window() code in imgui_demo.cpp. <- you are here!")
      ImGui.bullet_text("See comments in imgui.cpp.")
      ImGui.bullet_text("See example applications in the examples/ folder.")
      ImGui.bullet_text("Read the FAQ at http://www.dearimgui.org/faq/")
      ImGui.bullet_text("Set 'io.config_flags |= NavEnableKeyboard' for keyboard controls.")
      ImGui.bullet_text("Set 'io.config_flags |= NavEnableGamepad' for gamepad controls.")
      ImGui.separator

      ImGui.text("USER GUIDE:")
      show_user_guide
    end

    if ImGui.collapsing_header("Configuration")
      io = ImGui.get_io

      if ImGui.tree_node("Configuration##2")
        ImGui.checkbox_flags("io.config_flags: NavEnableKeyboard", pointerof(io.config_flags), ImGui::ImGuiConfigFlags::NavEnableKeyboard)
        ImGui.checkbox_flags("io.config_flags: NavEnableGamepad", pointerof(io.config_flags), ImGui::ImGuiConfigFlags::NavEnableGamepad)
        ImGui.same_line
        help_marker("Required back-end to feed in gamepad inputs in io.nav_inputs[] and set io.backend_flags |= ImGui::ImGuiBackendFlags::HasGamepad.\n\nRead instructions in imgui.cpp for details.")
        ImGui.checkbox_flags("io.config_flags: NavEnableSetMousePos", pointerof(io.config_flags), ImGui::ImGuiConfigFlags::NavEnableSetMousePos)
        ImGui.same_line
        help_marker("Instruct navigation to move the mouse cursor. See comment for ImGui::ImGuiConfigFlags::NavEnableSetMousePos.")
        ImGui.checkbox_flags("io.config_flags: NoMouse", pointerof(io.config_flags), ImGui::ImGuiConfigFlags::NoMouse)

        if io.config_flags.includes? :NoMouse
          if (ImGui.get_time % 0.40f32) < 0.20f32
            ImGui.same_line
            ImGui.text("<<PRESS SPACE TO DISABLE>>")
          end
          if ImGui.is_key_pressed(ImGui.get_key_index(ImGui::ImGuiKey::Space))
            io.config_flags &= ~ImGui::ImGuiConfigFlags::NoMouse
          end
        end
        ImGui.checkbox_flags("io.config_flags: NoMouseCursorChange", pointerof(io.config_flags), ImGui::ImGuiConfigFlags::NoMouseCursorChange)
        ImGui.same_line
        help_marker("Instruct back-end to not alter mouse cursor shape and visibility.")
        ImGui.checkbox("io.config_input_text_cursor_blink", pointerof(io.config_input_text_cursor_blink))
        ImGui.same_line
        help_marker("Set to false to disable blinking cursor, for users who consider it distracting")
        ImGui.checkbox("io.config_windows_resize_from_edges", pointerof(io.config_windows_resize_from_edges))
        ImGui.same_line
        help_marker("Enable resizing of windows from their edges and from the lower-left corner.\nThis requires (io.backend_flags.includes? :HasMouseCursors) because it needs mouse cursor feedback.")
        ImGui.checkbox("io.config_windows_move_from_title_bar_only", pointerof(io.config_windows_move_from_title_bar_only))
        ImGui.checkbox("io.mouse_draw_cursor", pointerof(io.mouse_draw_cursor))
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

        ImGui.checkbox_flags("io.backend_flags: HasGamepad", pointerof(io.backend_flags), ImGui::ImGuiBackendFlags::HasGamepad)
        ImGui.checkbox_flags("io.backend_flags: HasMouseCursors", pointerof(io.backend_flags), ImGui::ImGuiBackendFlags::HasMouseCursors)
        ImGui.checkbox_flags("io.backend_flags: HasSetMousePos", pointerof(io.backend_flags), ImGui::ImGuiBackendFlags::HasSetMousePos)
        ImGui.checkbox_flags("io.backend_flags: RendererHasVtxOffset", pointerof(io.backend_flags), ImGui::ImGuiBackendFlags::RendererHasVtxOffset)
        ImGui.tree_pop
        ImGui.separator
      end

      if ImGui.tree_node("Style")
        help_marker("The same contents can be accessed in 'tools.style Editor' or by calling the show_style_editor() function.")
        show_style_editor
        ImGui.tree_pop
        ImGui.separator
      end

      if ImGui.tree_node("Capture/Logging")
        help_marker(
          "The logging API redirects all text output so you can easily capture the content of " +
          "a window or a block. Tree nodes can be automatically expanded.\n" +
          "Try opening any of the contents below in this window and then click one of the \"Log To\" button.")
        ImGui.log_buttons

        help_marker("You can also call ImGui.log_text() to output directly to the log without a visual output.")
        if ImGui.button("Copy \"Hello, world!\" to clipboard")
          ImGui.log_to_clipboard
          ImGui.log_text("Hello, world!")
          ImGui.log_finish
        end
        ImGui.tree_pop
      end
    end

    if ImGui.collapsing_header("Window options")
      ImGui.checkbox("No titlebar", pointerof(@@no_titlebar))
      ImGui.same_line(150)
      ImGui.checkbox("No scrollbar", pointerof(@@no_scrollbar))
      ImGui.same_line(300)
      ImGui.checkbox("No menu", pointerof(@@no_menu))
      ImGui.checkbox("No move", pointerof(@@no_move))
      ImGui.same_line(150)
      ImGui.checkbox("No resize", pointerof(@@no_resize))
      ImGui.same_line(300)
      ImGui.checkbox("No collapse", pointerof(@@no_collapse))
      ImGui.checkbox("No close", pointerof(@@no_close))
      ImGui.same_line(150)
      ImGui.checkbox("No nav", pointerof(@@no_nav))
      ImGui.same_line(300)
      ImGui.checkbox("No background", pointerof(@@no_background))
      ImGui.checkbox("No bring to front", pointerof(@@no_bring_to_front))
    end

    show_demo_window_widgets()
    show_demo_window_layout()
    show_demo_window_popups()
    show_demo_window_columns()
    show_demo_window_misc()

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

  @@clicked = 0
  @@check = true
  @@e = 0
  @@counter = 0
  @@arr = [0.6f32, 0.1f32, 1.0f32, 0.5f32, 0.92f32, 0.1f32, 0.2f32]
  @@item_current = 0
  @@str0 : IO::Memory = IO::Memory.new(128) << "Hello, world!"
  @@str1 : IO::Memory = IO::Memory.new(128)
  @@i0 = 123
  @@f0 = 0.001f32
  @@d0 = 999999.00000001
  @@f1 = 1.0e10f32
  @@vec4a = [0.10f32, 0.20f32, 0.30f32, 0.44f32]
  @@i1 = 50
  @@i2 = 42
  @@f1_ = 1.00f32
  @@f2 = 0.0067f32
  @@i1_ = 0
  @@f1__ = 0.123f32
  @@f2_ = 0.0f32
  @@angle = 0.0f32
  @@elem = 0
  @@col1 = [1.0f32, 0.0f32, 0.2f32]
  @@col2 = [0.4f32, 0.7f32, 0.0f32, 0.5f32]
  @@item_current_ = 1
  @@base_flags : ImGui::ImGuiTreeNodeFlags = ImGui::ImGuiTreeNodeFlags::OpenOnArrow | ImGui::ImGuiTreeNodeFlags::OpenOnDoubleClick | ImGui::ImGuiTreeNodeFlags::SpanAvailWidth
  @@align_label_with_current_x_position = false
  @@test_drag_and_drop = false
  @@selection_mask : Int32 = (1 << 2)
  @@closable_group = true
  @@wrap_width = 200.0f32
  @@buf : IO::Memory = IO::Memory.new(32) << "日本語"
  @@pressed_count = 0
  @@flags = ImGui::ImGuiComboFlags::None
  @@item_current_idx = 0
  @@item_current_2 = 0
  @@item_current_3 = -1
  @@item_current_4 = 0
  @@selection = [false, true, false, false, false]
  @@selected = -1
  @@selection_ = [false, false, false, false, false]
  @@selected_ = [false, false, false]
  @@selected__ : Array(Bool) = [false] * 16
  @@selected___ = [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1]
  @@selected____ = [true, false, true, false, true, false, true, false, true]
  @@text : IO::Memory = (IO::Memory.new(1024 * 16) <<
    "/*\n" <<
    " The Pentium F00F bug, shorthand for F0 0F C7 C8,\n" <<
    " the hexadecimal encoding of one offending instruction,\n" <<
    " more formally, the invalid operand with locked CMPXCHG8B\n" <<
    " instruction bug, is a design flaw in the majority of\n" <<
    " Intel Pentium, Pentium MMX, and Pentium OverDrive\n" <<
    " processors (all in the P5 microarchitecture).\n" <<
    "*/\n\n" <<
    "label:\n" <<
    "\tlock cmpxchg8b eax\n")
  @@flags_ = ImGui::ImGuiInputTextFlags::AllowTabInput
  @@buf1 = IO::Memory.new(64)
  @@buf2 = IO::Memory.new(64)
  @@buf3 = IO::Memory.new(64)
  @@buf4 = IO::Memory.new(64)
  @@buf5 = IO::Memory.new(64)
  @@buf6 = IO::Memory.new(64)
  @@password : IO::Memory = IO::Memory.new(64) << "password123"
  @@my_str = IO::Memory.new
  @@animate = true
  @@arr_ = [0.6f32, 0.1f32, 1.0f32, 0.5f32, 0.92f32, 0.1f32, 0.2f32]
  @@values : Array(Float32) = [0.0f32] * 90
  @@values_offset = 0
  @@refresh_time = 0.0
  @@phase = 0.0f32
  @@func_type = 0
  @@display_count = 70
  @@progress = 0.0f32
  @@progress_dir = 1.0f32
  @@color = ImGui.vec4(114.0f32 / 255.0f32, 144.0f32 / 255.0f32, 154.0f32 / 255.0f32, 200.0f32 / 255.0f32)
  @@alpha_preview = true
  @@alpha_half_preview = false
  @@drag_and_drop = true
  @@options_menu = true
  @@hdr = false
  @@saved_palette = Array(ImGui::ImVec4).new(32) do |n|
    r, g, b = ImGui.color_convert_hs_vto_rgb(n / 31.0f32, 0.8f32, 0.8f32)
    ImGui.vec4(r, g, b, 1.0f32)
  end
  @@backup_color = ImGui::ImVec4.new
  @@no_border = false
  @@alpha = true
  @@alpha_bar = true
  @@side_preview = true
  @@ref_color = false
  @@ref_color_v = ImGui::ImVec4.new(1.0f32, 0.0f32, 1.0f32, 0.5f32)
  @@display_mode = 0
  @@picker_mode = 0
  @@color_hsv = ImGui::ImVec4.new(0.23f32, 1.0f32, 1.0f32, 1.0f32)
  @@flags__ = ImGui::ImGuiSliderFlags::None
  @@drag_f = 0.5f32
  @@drag_i = 50
  @@slider_f = 0.5f32
  @@slider_i = 50
  @@begin = 10f32
  @@end = 90f32
  @@begin_i = 100
  @@end_i = 1000
  @@s8_v = 127i8
  @@u8_v = 255u8
  @@s16_v = 32767i16
  @@u16_v = 65535u16
  @@s32_v = -1i32
  @@u32_v : UInt32 = (-1).to_u32!
  @@s64_v = -1i64
  @@u64_v : UInt64 = (-1).to_u64!
  @@f32_v = 0.123f32
  @@f64_v = 90000.01234567890123456789
  @@drag_clamp = false
  @@inputs_step = true
  @@vec4f = [0.10f32, 0.20f32, 0.30f32, 0.44f32]
  @@vec4i = [1, 5, 100, 255]
  @@int_value = 0
  @@values_ = [0.0f32, 0.60f32, 0.35f32, 0.9f32, 0.70f32, 0.20f32, 0.0f32]
  @@values2 = [0.20f32, 0.80f32, 0.40f32, 0.25f32]
  @@col1_ = [1.0f32, 0.0f32, 0.2f32]
  @@col2_ = [0.4f32, 0.7f32, 0.0f32, 0.5f32]
  @@mode = Mode::Copy
  @@names = ["Bobby", "Beatrice", "Betty", "Brianna", "Barry", "Bernard", "Bibi", "Blaine", "Bryn"]
  @@item_names = ["Item One", "Item Two", "Item Three", "Item Four", "Item Five"]
  @@item_type = 1
  @@b = false
  @@col4f = [1.0f32, 0.5f32, 0.0f32, 1.0f32]
  @@str = IO::Memory.new(16)
  @@current = 1
  @@embed_all_inside_a_child_window = false
  @@unused_str : IO::Memory = IO::Memory.new << "This widget is only here to be able to tab-out of the widgets above."
  @@test_window = false

  def self.show_demo_window_widgets
    if !ImGui.collapsing_header("Widgets")
      return
    end

    if ImGui.tree_node("Basic")
      if ImGui.button("Button")
        @@clicked += 1
      end
      if @@clicked.odd?
        ImGui.same_line
        ImGui.text("Thanks for clicking me!")
      end

      ImGui.checkbox("checkbox", pointerof(@@check))

      ImGui.radio_button("radio a", pointerof(@@e), 0)
      ImGui.same_line
      ImGui.radio_button("radio b", pointerof(@@e), 1)
      ImGui.same_line
      ImGui.radio_button("radio c", pointerof(@@e), 2)

      7.times do |i|
        if i > 0
          ImGui.same_line
        end
        ImGui.push_id(i)
        ImGui.push_style_color(ImGui::ImGuiCol::Button, ImGui.col32(ImGui.hsv(i / 7.0f32, 0.6f32, 0.6f32)))
        ImGui.push_style_color(ImGui::ImGuiCol::ButtonHovered, ImGui.col32(ImGui.hsv(i / 7.0f32, 0.7f32, 0.7f32)))
        ImGui.push_style_color(ImGui::ImGuiCol::ButtonActive, ImGui.col32(ImGui.hsv(i / 7.0f32, 0.8f32, 0.8f32)))
        ImGui.button("Click")
        ImGui.pop_style_color(3)
        ImGui.pop_id
      end

      ImGui.align_text_to_frame_padding
      ImGui.text("Hold to repeat:")
      ImGui.same_line

      spacing = ImGui.get_style.item_inner_spacing.x
      ImGui.push_button_repeat(true)
      if ImGui.arrow_button("##left", ImGui::ImGuiDir::Left)
        @@counter -= 1
      end
      ImGui.same_line(0.0f32, spacing)
      if ImGui.arrow_button("##right", ImGui::ImGuiDir::Right)
        @@counter += 1
      end
      ImGui.pop_button_repeat
      ImGui.same_line
      ImGui.text("%d", @@counter)

      ImGui.text("Hover over me")
      if ImGui.is_item_hovered
        ImGui.set_tooltip("I am a tooltip")
      end

      ImGui.same_line
      ImGui.text("- or me")
      if ImGui.is_item_hovered
        ImGui.begin_tooltip
        ImGui.text("I am a fancy tooltip")

        ImGui.plot_lines("Curve", @@arr.to_unsafe, @@arr.size)
        ImGui.end_tooltip
      end

      ImGui.separator

      ImGui.label_text("label", "Value")

      begin
        items = ["AAAA", "BBBB", "CCCC", "DDDD", "EEEE", "FFFF", "GGGG", "HHHH", "IIIIIII", "JJJJ", "KKKKKKK"]
        ImGui.combo("combo", pointerof(@@item_current), items.map(&.to_unsafe).to_unsafe, items.size)
        ImGui.same_line
        help_marker("Refer to the \"Combo\" section below for an explanation of the full BeginCombo/EndCombo API, and demonstration of various flags.\n")
      end

      begin
        ImGui.input_text("input text", @@str0)
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
          "You can use the ImGui::ImGuiInputTextFlags::CallbackResize facility if you need to wire input_text() " +
          "to a dynamic string type. See misc/cpp/imgui_stdlib.h for an example (this is not demonstrated " +
          "in imgui_demo.cpp).")

        ImGui.input_text_with_hint("input text (w/ hint)", "enter text here", @@str1)

        ImGui.input_int("input int", pointerof(@@i0))
        ImGui.same_line
        help_marker(
          "You can apply arithmetic operators +,*,/ on numerical values.\n" +
          "  @@e.g. [ 100 ], input '*2', result becomes [ 200 ]\n" +
          "Use +- to subtract.")

        ImGui.input_float("input float", pointerof(@@f0), 0.01f32, 1.0f32, "%.3f")

        ImGui.input_double("input double", pointerof(@@d0), 0.01f32, 1.0f32, "%.8f")

        ImGui.input_float("input scientific", pointerof(@@f1), 0.0f32, 0.0f32, "%e")
        ImGui.same_line
        help_marker(
          "You can input value using the scientific notation,\n" +
          "  @@e.g. \"1e+8\" becomes \"100000000\".")

        ImGui.input_float3("input float3", @@vec4a.to_unsafe)
      end

      begin
        ImGui.drag_int("drag int", pointerof(@@i1), 1)
        ImGui.same_line
        help_marker(
          "Click and drag to edit value.\n" +
          "Hold SHIFT/ALT for faster/slower edit.\n" +
          "Double-click or CTRL+click to input value.")

        ImGui.drag_int("drag int 0..100", pointerof(@@i2), 1, 0, 100, "%d%%")

        ImGui.drag_float("drag float", pointerof(@@f1_), 0.005f32)
        ImGui.drag_float("drag small float", pointerof(@@f2), 0.0001f32, 0.0f32, 0.0f32, "%.06f ns")
      end

      begin
        ImGui.slider_int("slider int", pointerof(@@i1_), -1, 3)
        ImGui.same_line
        help_marker("CTRL+click to input value.")

        ImGui.slider_float("slider float", pointerof(@@f1__), 0.0f32, 1.0f32, "ratio = %.3f")
        ImGui.slider_float("slider float (log)", pointerof(@@f2_), -10.0f32, 10.0f32, "%.4f", ImGui::ImGuiSliderFlags::Logarithmic)

        ImGui.slider_angle("slider @@angle", pointerof(@@angle))

        ImGui.slider_int("slider enum", pointerof(@@elem), 0, Element.values.size - 1, Element.new(@@elem).to_s)
        ImGui.same_line
        help_marker("Using the format string parameter to display a name instead of the underlying integer.")
      end

      begin
        ImGui.color_edit3("color 1", @@col1.to_unsafe)
        ImGui.same_line
        help_marker(
          "Click on the colored square to open a color picker.\n" +
          "Click and hold to use drag and drop.\n" +
          "Right-click on the colored square to show options.\n" +
          "CTRL+click on individual component to input value.\n")

        ImGui.color_edit4("color 2", @@col2.to_unsafe)
      end

      begin
        items = ["Apple", "Banana", "Cherry", "Kiwi", "Mango", "Orange", "Pineapple", "Strawberry", "Watermelon"]
        ImGui.list_box("listbox\n(single select)", pointerof(@@item_current_), items.map(&.to_unsafe).to_unsafe, items.size, 4)
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Trees")
      if ImGui.tree_node("Basic trees")
        5.times do |i|
          if i == 0
            ImGui.set_next_item_open(true, ImGui::ImGuiCond::Once)
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

        ImGui.checkbox_flags("ImGui::ImGuiTreeNodeFlags::OpenOnArrow", pointerof(@@base_flags), ImGui::ImGuiTreeNodeFlags::OpenOnArrow)
        ImGui.checkbox_flags("ImGui::ImGuiTreeNodeFlags::OpenOnDoubleClick", pointerof(@@base_flags), ImGui::ImGuiTreeNodeFlags::OpenOnDoubleClick)
        ImGui.checkbox_flags("ImGui::ImGuiTreeNodeFlags::SpanAvailWidth", pointerof(@@base_flags), ImGui::ImGuiTreeNodeFlags::SpanAvailWidth)
        ImGui.same_line
        help_marker("Extend hit area to all available width instead of allowing more items to be laid out after the node.")
        ImGui.checkbox_flags("ImGui::ImGuiTreeNodeFlags::SpanFullWidth", pointerof(@@base_flags), ImGui::ImGuiTreeNodeFlags::SpanFullWidth)
        ImGui.checkbox("Align label with current X position", pointerof(@@align_label_with_current_x_position))
        ImGui.checkbox("Test tree node as drag source", pointerof(@@test_drag_and_drop))
        ImGui.text("Hello!")
        if @@align_label_with_current_x_position
          ImGui.unindent(ImGui.get_tree_node_to_label_spacing)
        end

        node_clicked = -1
        6.times do |i|
          node_flags = @@base_flags
          is_selected = (@@selection_mask & (1 << i)) != 0
          if is_selected
            node_flags |= ImGui::ImGuiTreeNodeFlags::Selected
          end
          if i < 3
            node_open = ImGui.tree_node_ex(i, node_flags, "Selectable Node %d", i)
            if ImGui.is_item_clicked
              node_clicked = i
            end
            if @@test_drag_and_drop && ImGui.begin_drag_drop_source
              ImGui.set_drag_drop_payload("_TREENODE", Pointer(Void).null, 0)
              ImGui.text("This is a drag and drop source")
              ImGui.end_drag_drop_source
            end
            if node_open
              ImGui.bullet_text("Blah blah\nBlah Blah")
              ImGui.tree_pop
            end
          else
            node_flags |= ImGui::ImGuiTreeNodeFlags::Leaf | ImGui::ImGuiTreeNodeFlags::NoTreePushOnOpen
            ImGui.tree_node_ex(i, node_flags, "Selectable Leaf %d", i)
            if ImGui.is_item_clicked
              node_clicked = i
            end
            if @@test_drag_and_drop && ImGui.begin_drag_drop_source
              ImGui.set_drag_drop_payload("_TREENODE", Pointer(Void).null, 0)
              ImGui.text("This is a drag and drop source")
              ImGui.end_drag_drop_source
            end
          end
        end
        if node_clicked != -1
          if ImGui.get_io.key_ctrl
            @@selection_mask ^= (1 << node_clicked)
          else
            @@selection_mask = (1 << node_clicked)
          end
        end
        if @@align_label_with_current_x_position
          ImGui.indent(ImGui.get_tree_node_to_label_spacing)
        end
        ImGui.tree_pop
      end
      ImGui.tree_pop
    end

    if ImGui.tree_node("Collapsing Headers")
      ImGui.checkbox("Show 2nd header", pointerof(@@closable_group))
      if ImGui.collapsing_header("Header", ImGui::ImGuiTreeNodeFlags::None)
        ImGui.text("IsItemHovered: %d", ImGui.is_item_hovered)
        5.times do |i|
          ImGui.text("Some content %d", i)
        end
      end
      if ImGui.collapsing_header("Header with a close button", pointerof(@@closable_group))
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
        ImGui.text_colored(ImGui.vec4(1.0f32, 0.0f32, 1.0f32, 1.0f32), "Pink")
        ImGui.text_colored(ImGui.vec4(1.0f32, 1.0f32, 0.0f32, 1.0f32), "Yellow")
        ImGui.text_disabled("Disabled")
        ImGui.same_line
        help_marker("The TextDisabled color is stored in ImGuiStyle.")
        ImGui.tree_pop
      end

      if ImGui.tree_node("Word Wrapping")
        ImGui.text_wrapped("This text should automatically wrap on the edge of the window. The current implementation for text wrapping follows simple rules suitable for English and possibly other languages.")
        ImGui.spacing

        ImGui.slider_float("Wrap width", pointerof(@@wrap_width), -20, 600, "%.0f")

        draw_list = ImGui.get_window_draw_list
        2.times do |n|
          ImGui.text("Test paragraph %d:", n)
          pos = ImGui.get_cursor_screen_pos
          marker_min = ImGui.vec2(pos.x + @@wrap_width, pos.y)
          marker_max = ImGui.vec2(pos.x + @@wrap_width + 10, pos.y + ImGui.get_text_line_height)
          ImGui.push_text_wrap_pos(ImGui.get_cursor_pos.x + @@wrap_width)
          if n == 0
            ImGui.text("The lazy dog is a good dog. This paragraph should fit within %.0f pixels. Testing a 1 character word. The quick brown fox jumps over the lazy dog.", @@wrap_width)
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
          "Call io.font.add_font_from_file_ttf() manually to load extra character ranges. " +
          "Read docs/FONTS.md for details.")
        ImGui.text("Hiragana: かきくけこ (kakikukeko)")
        ImGui.text("Kanjis: 日本語 (nihongo)")

        ImGui.input_text("UTF-8 input", @@buf)
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
        uv_min = ImGui.vec2(0.0f32, 0.0f32)
        uv_max = ImGui.vec2(1.0f32, 1.0f32)
        tint_col = ImGui.vec4(1.0f32, 1.0f32, 1.0f32, 1.0f32)
        border_col = ImGui.vec4(1.0f32, 1.0f32, 1.0f32, 0.5f32)
        ImGui.image(my_tex_id, ImGui.vec2(my_tex_w, my_tex_h), uv_min, uv_max, tint_col, border_col)
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
          uv0 = ImGui.vec2((region_x) / my_tex_w, (region_y) / my_tex_h)
          uv1 = ImGui.vec2((region_x + region_sz) / my_tex_w, (region_y + region_sz) / my_tex_h)
          ImGui.image(my_tex_id, ImGui.vec2(region_sz * zoom, region_sz * zoom), uv0, uv1, tint_col, border_col)
          ImGui.end_tooltip
        end
      end
      ImGui.text_wrapped("And now some textured buttons..")

      8.times do |i|
        ImGui.push_id(i)
        frame_padding = -1 + i
        size = ImGui.vec2(32.0f32, 32.0f32)
        uv0 = ImGui.vec2(0.0f32, 0.0f32)
        uv1 = ImGui.vec2(32.0f32 / my_tex_w, 32 / my_tex_h)
        bg_col = ImGui.vec4(0.0f32, 0.0f32, 0.0f32, 1.0f32)
        tint_col = ImGui.vec4(1.0f32, 1.0f32, 1.0f32, 1.0f32)
        if ImGui.image_button(my_tex_id, size, uv0, uv1, frame_padding, bg_col, tint_col)
          @@pressed_count += 1
        end
        ImGui.pop_id
        ImGui.same_line
      end
      ImGui.new_line
      ImGui.text("Pressed %d times.", @@pressed_count)
      ImGui.tree_pop
    end

    if ImGui.tree_node("Combo")
      ImGui.checkbox_flags("ImGui::ImGuiComboFlags::PopupAlignLeft", pointerof(@@flags), ImGui::ImGuiComboFlags::PopupAlignLeft)
      ImGui.same_line
      help_marker("Only makes a difference if the popup is larger than the combo")
      if ImGui.checkbox_flags("ImGui::ImGuiComboFlags::NoArrowButton", pointerof(@@flags), ImGui::ImGuiComboFlags::NoArrowButton)
        @@flags &= ~ImGui::ImGuiComboFlags::NoPreview
      end
      if ImGui.checkbox_flags("ImGui::ImGuiComboFlags::NoPreview", pointerof(@@flags), ImGui::ImGuiComboFlags::NoPreview)
        @@flags &= ~ImGui::ImGuiComboFlags::NoArrowButton
      end

      items = ["AAAA", "BBBB", "CCCC", "DDDD", "EEEE", "FFFF", "GGGG", "HHHH", "IIII", "JJJJ", "KKKK", "LLLLLLL", "MMMM", "OOOOOOO"]
      combo_label = items[@@item_current_idx]
      if ImGui.begin_combo("combo 1", combo_label, @@flags)
        items.size.times do |n|
          is_selected = (@@item_current_idx == n)
          if ImGui.selectable(items[n], is_selected)
            item_current_idx = n
          end

          if is_selected
            ImGui.set_item_default_focus
          end
        end
        ImGui.end_combo
      end

      ImGui.combo("combo 2 (one-liner)", pointerof(@@item_current_2), "aaaa\0bbbb\0cccc\0dddd\0eeee\0\0")

      ImGui.combo("combo 3 (array)", pointerof(@@item_current_3), items.map(&.to_unsafe).to_unsafe, items.size)

      ImGui.combo("combo 4 (function)", pointerof(@@item_current_4), items.size) do |idx|
        items[idx]
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Selectables")
      if ImGui.tree_node("Basic")
        ImGui.selectable("1. I am selectable", pointerof(@@selection[0]))
        ImGui.selectable("2. I am selectable", pointerof(@@selection[1]))
        ImGui.text("3. I am not selectable")
        ImGui.selectable("4. I am selectable", pointerof(@@selection[3]))
        if ImGui.selectable("5. I am double clickable", pointerof(@@selection[4]), ImGui::ImGuiSelectableFlags::AllowDoubleClick)
          if ImGui.is_mouse_double_clicked(ImGui::ImGuiMouseButton::Left)
            selection = !@@selection[4]
          end
        end
        ImGui.tree_pop
      end
      if ImGui.tree_node("Selection State: Single Selection")
        5.times do |n|
          if ImGui.selectable("Object #{n}", @@selected == n)
            selected = n
          end
        end
        ImGui.tree_pop
      end
      if ImGui.tree_node("Selection State: Multiple Selection")
        help_marker("Hold CTRL and click to select multiple items.")

        5.times do |n|
          if ImGui.selectable("Object #{n}", @@selection_[n])
            if !ImGui.get_io.key_ctrl
              @@selection_.map! { false }
            end
            @@selection[n] = !@@selection[n]
          end
        end
        ImGui.tree_pop
      end
      if ImGui.tree_node("Rendering more text into the same line")
        ImGui.selectable("main.c", pointerof(@@selected_[0]))
        ImGui.same_line(300)
        ImGui.text(" 2,345 bytes")
        ImGui.selectable("hello.cpp", pointerof(@@selected_[1]))
        ImGui.same_line(300)
        ImGui.text("12,345 bytes")
        ImGui.selectable("hello.h", pointerof(@@selected_[2]))
        ImGui.same_line(300)
        ImGui.text(" 2,345 bytes")
        ImGui.tree_pop
      end
      if ImGui.tree_node("In columns")
        ImGui.columns(3, nil, false)

        16.times do |i|
          if ImGui.selectable("Item #{i}", pointerof(@@selected__[i]))
          end
          ImGui.next_column
        end
        ImGui.columns(1)
        ImGui.tree_pop
      end
      if ImGui.tree_node("Grid")
        (4 * 4).times do |i|
          ImGui.push_id(i)
          if ImGui.selectable("Sailor", @@selected___[i] != 0, size: ImGui.vec2(50, 50))
            @@selected___[i] ^= 1

            x = i % 4
            y = i / 4
            if x > 0
              @@selected___[i - 1] ^= 1
            end
            if x < 3 && i < 15
              @@selected___[i + 1] ^= 1
            end
            if y > 0 && i > 3
              @@selected___[i - 4] ^= 1
            end
            if y < 3 && i < 12
              @@selected___[i + 4] ^= 1
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
          "By default, Selectables uses style.selectable_text_align but it can be overridden on a per-item " +
          "basis using push_style_var(). You'll probably want to always keep your default situation to " +
          "left-align otherwise it becomes difficult to layout multiple items on a same line")

        3.times do |y|
          3.times do |x|
            alignment = ImGui.vec2(x / 2.0f32, y / 2.0f32)
            name = "(%.1f,%.1f)" % {alignment.x, alignment.y}
            if x > 0
              ImGui.same_line
            end
            ImGui.push_style_var(ImGui::ImGuiStyleVar::SelectableTextAlign, alignment)
            ImGui.selectable(name, pointerof(@@selected____[3 * y + x]), ImGui::ImGuiSelectableFlags::None, ImGui.vec2(80, 80))
            ImGui.pop_style_var
          end
        end
        ImGui.tree_pop
      end
      ImGui.tree_pop
    end

    if ImGui.tree_node("Text Input")
      if ImGui.tree_node("Multi-line Text Input")
        help_marker("You can use the ImGui::ImGuiInputTextFlags::CallbackResize facility if you need to wire input_text_multiline() to a dynamic string type. See misc/cpp/imgui_stdlib.h for an example. (This is not demonstrated in imgui_demo.cpp because we don't want to include <string> in here)")
        ImGui.checkbox_flags("ImGui::ImGuiInputTextFlags::ReadOnly", pointerof(@@flags_), ImGui::ImGuiInputTextFlags::ReadOnly)
        ImGui.checkbox_flags("ImGui::ImGuiInputTextFlags::AllowTabInput", pointerof(@@flags_), ImGui::ImGuiInputTextFlags::AllowTabInput)
        ImGui.checkbox_flags("ImGui::ImGuiInputTextFlags::CtrlEnterForNewLine", pointerof(@@flags_), ImGui::ImGuiInputTextFlags::CtrlEnterForNewLine)
        ImGui.input_text_multiline("##source", @@text, ImGui.vec2(-Float32::MIN_POSITIVE, ImGui.get_text_line_height * 16), @@flags_)
        ImGui.tree_pop
      end

      if ImGui.tree_node("Filtered Text Input")
        ImGui.input_text("default", @@buf1)

        ImGui.input_text("decimal", @@buf2, ImGui::ImGuiInputTextFlags::CharsDecimal)

        ImGui.input_text("hexadecimal", @@buf3, ImGui::ImGuiInputTextFlags::CharsHexadecimal | ImGui::ImGuiInputTextFlags::CharsUppercase)

        ImGui.input_text("uppercase", @@buf4, ImGui::ImGuiInputTextFlags::CharsUppercase)

        ImGui.input_text("no blank", @@buf5, ImGui::ImGuiInputTextFlags::CharsNoBlank)

        ImGui.input_text("\"imgui\" letters", @@buf6, ImGui::ImGuiInputTextFlags::CallbackCharFilter) do |data|
          if data.event_char.ord < 256 && "imgui".includes?(data.event_char)
            0
          else
            1
          end
        end
        ImGui.text("Password input")

        ImGui.input_text("password", @@password, ImGui::ImGuiInputTextFlags::Password)
        ImGui.same_line
        help_marker("Display all characters as '*'.\nDisable clipboard cut and copy.\nDisable logging.\n")
        ImGui.input_text_with_hint("password (w/ hint)", "<password>", @@password, ImGui::ImGuiInputTextFlags::Password)
        ImGui.input_text("password (clear)", @@password)
        ImGui.tree_pop
      end

      if ImGui.tree_node("Resize Callback")
        help_marker(
          "Using ImGui::ImGuiInputTextFlags::CallbackResize to wire your custom string type to input_text().\n\n" +
          "See misc/cpp/imgui_stdlib.h for an implementation of this for std.string.")

        ImGui.input_text_multiline("##MyStr", @@my_str, ImGui.vec2(-Float32::MIN_POSITIVE, ImGui.get_text_line_height * 16))
        ImGui.text(@@my_str.inspect)
        ImGui.tree_pop
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Plots Widgets")
      ImGui.checkbox("Animate", pointerof(@@animate))

      ImGui.plot_lines("Frame Times", @@arr_.to_unsafe, @@arr_.size)

      if !@@animate || @@refresh_time == 0.0
        @@refresh_time = ImGui.get_time
      end
      while @@refresh_time < ImGui.get_time
        @@values[@@values_offset] = Math.cos(@@phase)
        values_offset = (@@values_offset + 1) % @@values.size
        @@phase += 0.10f32 * @@values_offset
        @@refresh_time += 1.0f32 / 60.0f32
      end

      begin
        average = 0.0f32
        @@values.size.times do |n|
          average += @@values[n]
        end
        average /= @@values.size
        ImGui.plot_lines("Lines", @@values.to_unsafe, @@values.size, @@values_offset, "avg %f" % average, -1.0f32, 1.0f32, ImGui.vec2(0, 80.0f32))
      end
      ImGui.plot_histogram("Histogram", @@arr_.to_unsafe, @@arr_.size, 0, nil, 0.0f32, 1.0f32, ImGui.vec2(0, 80.0f32))

      sin = ->(i : Int32) { Math.sin(i * 0.1).to_f32 }
      saw = ->(i : Int32) { (i & 1) ? 1.0f32 : -1.0f32 }
      ImGui.separator
      ImGui.set_next_item_width(100)
      ImGui.combo("func", pointerof(@@func_type), "Sin\0Saw\0")
      ImGui.same_line
      ImGui.slider_int("Sample count", pointerof(@@display_count), 1, 400)
      func = (@@func_type == 0) ? sin : saw
      ImGui.plot_lines("Lines", @@display_count, 0, nil, -1.0f32, 1.0f32, ImGui.vec2(0, 80), &func)
      ImGui.plot_histogram("Histogram", @@display_count, 0, nil, -1.0f32, 1.0f32, ImGui.vec2(0, 80), &func)
      ImGui.separator

      if @@animate
        @@progress += @@progress_dir * 0.4f32 * ImGui.get_io.delta_time
        if @@progress >= +1.1f32
          @@progress = +1.1f32
          @@progress_dir *= -1.0f32
        end
        if @@progress <= -0.1f32
          @@progress = -0.1f32
          @@progress_dir *= -1.0f32
        end
      end

      ImGui.progress_bar(@@progress, ImGui.vec2(0.0f32, 0.0f32))
      ImGui.same_line(0.0f32, ImGui.get_style.item_inner_spacing.x)
      ImGui.text("Progress Bar")

      progress_saturated = @@progress.clamp(0.0f32, 1.0f32)
      ImGui.progress_bar(@@progress, ImGui.vec2(0f32, 0f32), "#{(progress_saturated * 1753).to_i}/1753")
      ImGui.tree_pop
    end

    if ImGui.tree_node("Color/Picker Widgets")
      ImGui.checkbox("With Alpha Preview", pointerof(@@alpha_preview))
      ImGui.checkbox("With Half Alpha Preview", pointerof(@@alpha_half_preview))
      ImGui.checkbox("With Drag and Drop", pointerof(@@drag_and_drop))
      ImGui.checkbox("With Options Menu", pointerof(@@options_menu))
      ImGui.same_line
      help_marker("Right-click on the individual @@color widget to show options.")
      ImGui.checkbox("With HDR", pointerof(@@hdr))
      ImGui.same_line
      help_marker("Currently all this does is to lift the 0..1 limits on dragging widgets.")
      misc_flags = (@@hdr ? ImGui::ImGuiColorEditFlags::HDR : ImGui::ImGuiColorEditFlags::None) | (@@drag_and_drop ? ImGui::ImGuiColorEditFlags::None : ImGui::ImGuiColorEditFlags::NoDragDrop) | (@@alpha_half_preview ? ImGui::ImGuiColorEditFlags::AlphaPreviewHalf : (@@alpha_preview ? ImGui::ImGuiColorEditFlags::AlphaPreview : ImGui::ImGuiColorEditFlags::None)) | (@@options_menu ? ImGui::ImGuiColorEditFlags::None : ImGui::ImGuiColorEditFlags::NoOptions)

      ImGui.text("Color widget:")
      ImGui.same_line
      help_marker(
        "Click on the colored square to open a @@color picker.\n" +
        "CTRL+click on individual component to input value.\n")
      ImGui.color_edit3("MyColor##1", pointerof(@@color), misc_flags)

      ImGui.text("Color widget HSV with Alpha:")
      ImGui.color_edit4("MyColor##2", pointerof(@@color), ImGui::ImGuiColorEditFlags::DisplayHSV | misc_flags)

      ImGui.text("Color widget with Float Display:")
      ImGui.color_edit4("MyColor##2", pointerof(@@color), ImGui::ImGuiColorEditFlags::Float | misc_flags)

      ImGui.text("Color button with Picker:")
      ImGui.same_line
      help_marker(
        "With the ImGui::ImGuiColorEditFlags::NoInputs flag you can hide all the slider/text inputs.\n" +
        "With the ImGui::ImGuiColorEditFlags::NoLabel flag you can pass a non-empty label which will only " +
        "be used for the tooltip and picker popup.")
      ImGui.color_edit4("MyColor##3", pointerof(@@color), ImGui::ImGuiColorEditFlags::NoInputs | ImGui::ImGuiColorEditFlags::NoLabel | misc_flags)

      ImGui.text("Color button with Custom Picker Popup:")

      open_popup = ImGui.color_button("MyColor##3b", @@color, misc_flags)
      ImGui.same_line(0, ImGui.get_style.item_inner_spacing.x)
      open_popup |= ImGui.button("Palette")
      if open_popup
        ImGui.open_popup("mypicker")
        backup_color = @@color
      end
      if ImGui.begin_popup("mypicker")
        ImGui.text("MY CUSTOM COLOR PICKER WITH AN AMAZING PALETTE!")
        ImGui.separator
        ImGui.color_picker4("##picker", pointerof(@@color), misc_flags | ImGui::ImGuiColorEditFlags::NoSidePreview | ImGui::ImGuiColorEditFlags::NoSmallPreview)
        ImGui.same_line

        ImGui.begin_group
        ImGui.text("Current")
        ImGui.color_button("##current", @@color, ImGui::ImGuiColorEditFlags::NoPicker | ImGui::ImGuiColorEditFlags::AlphaPreviewHalf, ImGui.vec2(60, 40))
        ImGui.text("Previous")
        if ImGui.color_button("##previous", @@backup_color, ImGui::ImGuiColorEditFlags::NoPicker | ImGui::ImGuiColorEditFlags::AlphaPreviewHalf, ImGui.vec2(60, 40))
          color = @@backup_color
        end
        ImGui.separator
        ImGui.text("Palette")
        @@saved_palette.size.times do |n|
          ImGui.push_id(n)
          if (n % 8) != 0
            ImGui.same_line(0.0f32, ImGui.get_style.item_spacing.y)
          end

          palette_button_flags = ImGui::ImGuiColorEditFlags::NoAlpha | ImGui::ImGuiColorEditFlags::NoPicker | ImGui::ImGuiColorEditFlags::NoTooltip
          if ImGui.color_button("##palette", @@saved_palette[n], palette_button_flags, ImGui.vec2(20, 20))
            color = ImGui.vec4(@@saved_palette[n].x, @@saved_palette[n].y, @@saved_palette[n].z, @@color.w)
          end

          if ImGui.begin_drag_drop_target
            if payload = ImGui.accept_drag_drop_payload(ImGui::PAYLOAD_TYPE_COLOR_3F)
              data = payload.data.as(Float32*)
              @@saved_palette[n] = ImGui.rgb(data[0], data[1], data[2])
            end
            if payload = ImGui.accept_drag_drop_payload(ImGui::PAYLOAD_TYPE_COLOR_4F)
              data = payload.data.as(Float32*)
              @@saved_palette[n] = ImGui.rgb(data[0], data[1], data[2], data[3])
            end
            ImGui.end_drag_drop_target
          end

          ImGui.pop_id
        end
        ImGui.end_group
        ImGui.end_popup
      end

      ImGui.text("Color button only:")

      ImGui.checkbox("ImGui::ImGuiColorEditFlags::NoBorder", pointerof(@@no_border))
      ImGui.color_button("MyColor##3c", @@color, misc_flags | (@@no_border ? ImGui::ImGuiColorEditFlags::NoBorder : ImGui::ImGuiColorEditFlags::None), ImGui.vec2(80, 80))

      ImGui.text("Color picker:")

      ImGui.checkbox("With Alpha", pointerof(@@alpha))
      ImGui.checkbox("With Alpha Bar", pointerof(@@alpha_bar))
      ImGui.checkbox("With Side Preview", pointerof(@@side_preview))
      if @@side_preview
        ImGui.same_line
        ImGui.checkbox("With Ref Color", pointerof(@@ref_color))
        if @@ref_color
          ImGui.same_line
          ImGui.color_edit4("##RefColor", pointerof(@@ref_color_v), ImGui::ImGuiColorEditFlags::NoInputs | misc_flags)
        end
      end
      ImGui.combo("Display Mode", pointerof(@@display_mode), "Auto/Current\0None\0RGB Only\0HSV Only\0Hex Only\0")
      ImGui.same_line
      help_marker(
        "ColorEdit defaults to displaying RGB inputs if you don't specify a display mode, " +
        "but the user can change it with a right-click.\n\nColorPicker defaults to displaying RGB+HSV+Hex " +
        "if you don't specify a display mode.\n\nYou can change the defaults using set_color_edit_options().")
      ImGui.combo("Picker Mode", pointerof(@@picker_mode), "Auto/Current\0Hue bar + SV rect\0Hue wheel + SV triangle\0")
      ImGui.same_line
      help_marker("User can right-click the picker to change mode.")
      flags = misc_flags
      if !@@alpha
        flags |= ImGui::ImGuiColorEditFlags::NoAlpha
      end
      if @@alpha_bar
        flags |= ImGui::ImGuiColorEditFlags::AlphaBar
      end
      if !@@side_preview
        flags |= ImGui::ImGuiColorEditFlags::NoSidePreview
      end
      if @@picker_mode == 1
        flags |= ImGui::ImGuiColorEditFlags::PickerHueBar
      end
      if @@picker_mode == 2
        flags |= ImGui::ImGuiColorEditFlags::PickerHueWheel
      end
      if @@display_mode == 1
        flags |= ImGui::ImGuiColorEditFlags::NoInputs
      end
      if @@display_mode == 2
        flags |= ImGui::ImGuiColorEditFlags::DisplayRGB
      end
      if @@display_mode == 3
        flags |= ImGui::ImGuiColorEditFlags::DisplayHSV
      end
      if @@display_mode == 4
        flags |= ImGui::ImGuiColorEditFlags::DisplayHex
      end
      ImGui.color_picker4("MyColor##4", pointerof(@@color), flags, @@ref_color ? @@ref_color_v.to_unsafe : Pointer(Float32).null)

      ImGui.text("Set defaults in code:")
      ImGui.same_line
      help_marker(
        "set_color_edit_options() is designed to allow you to set boot-time default.\n" +
        "We don't have Push/Pop functions because you can force options on a per-widget basis if needed," +
        "and the user can change non-forced ones with the options menu.\nWe don't have a getter to avoid" +
        "encouraging you to persistently save values that aren't forward-compatible.")
      if ImGui.button("Default: Uint8 + HSV + Hue Bar")
        ImGui.set_color_edit_options(ImGui::ImGuiColorEditFlags::Uint8 | ImGui::ImGuiColorEditFlags::DisplayHSV | ImGui::ImGuiColorEditFlags::PickerHueBar)
      end
      if ImGui.button("Default: Float + HDR + Hue Wheel")
        ImGui.set_color_edit_options(ImGui::ImGuiColorEditFlags::Float | ImGui::ImGuiColorEditFlags::HDR | ImGui::ImGuiColorEditFlags::PickerHueWheel)
      end

      ImGui.spacing
      ImGui.text("HSV encoded colors")
      ImGui.same_line
      help_marker(
        "By default, colors are given to ColorEdit and ColorPicker in RGB, but ImGui::ImGuiColorEditFlags::InputHSV" +
        "allows you to store colors as HSV and pass them to ColorEdit and ColorPicker as HSV. This comes with the" +
        "added benefit that you can manipulate hue values with the picker even when saturation or value are zero.")
      ImGui.text("Color widget with InputHSV:")
      ImGui.color_edit4("HSV shown as RGB##1", pointerof(@@color_hsv), ImGui::ImGuiColorEditFlags::DisplayRGB | ImGui::ImGuiColorEditFlags::InputHSV | ImGui::ImGuiColorEditFlags::Float)
      ImGui.color_edit4("HSV shown as HSV##1", pointerof(@@color_hsv), ImGui::ImGuiColorEditFlags::DisplayHSV | ImGui::ImGuiColorEditFlags::InputHSV | ImGui::ImGuiColorEditFlags::Float)
      ImGui.drag_float4("Raw HSV values", pointerof(@@color_hsv), 0.01f32, 0.0f32, 1.0f32)

      ImGui.tree_pop
    end

    if ImGui.tree_node("Drag/Slider Flags")
      ImGui.checkbox_flags("ImGuiSliderFlags_ClampOnInput", pointerof(@@flags__), ImGui::ImGuiSliderFlags::ClampOnInput)
      ImGui.same_line
      help_marker("Always clamp value to min/max bounds (if any) when input manually with CTRL+Click.")
      ImGui.checkbox_flags("ImGuiSliderFlags_Logarithmic", pointerof(@@flags__), ImGui::ImGuiSliderFlags::Logarithmic)
      ImGui.same_line
      help_marker("Enable logarithmic editing (more precision for small values).")
      ImGui.checkbox_flags("ImGuiSliderFlags_NoRoundToFormat", pointerof(@@flags__), ImGui::ImGuiSliderFlags::NoRoundToFormat)
      ImGui.same_line
      help_marker("Disable rounding underlying value to match precision of the format string (e.g. %.3f values are rounded to those 3 digits).")
      ImGui.checkbox_flags("ImGuiSliderFlags_NoInput", pointerof(@@flags__), ImGui::ImGuiSliderFlags::NoInput)
      ImGui.same_line
      help_marker("Disable CTRL+Click or Enter key allowing to input text directly into the widget.")

      ImGui.text("Underlying float value: %f", @@drag_f)
      ImGui.drag_float("DragFloat (0 -> 1)", pointerof(@@drag_f), 0.005f32, 0.0f32, 1.0f32, "%.3f", @@flags__)
      ImGui.drag_float("DragFloat (0 -> +inf)", pointerof(@@drag_f), 0.005f32, 0.0f32, Float32::MAX, "%.3f", @@flags__)
      ImGui.drag_float("DragFloat (-inf -> 1)", pointerof(@@drag_f), 0.005f32, -Float32::MAX, 1.0f32, "%.3f", @@flags__)
      ImGui.drag_float("DragFloat (-inf -> +inf)", pointerof(@@drag_f), 0.005f32, -Float32::MAX, +Float32::MAX, "%.3f", @@flags__)
      ImGui.drag_int("DragInt (0 -> 100)", pointerof(@@drag_i), 0.5f32, 0, 100, "%d", @@flags__)

      ImGui.text("Underlying float value: %f", @@slider_f)
      ImGui.slider_float("SliderFloat (0 -> 1)", pointerof(@@slider_f), 0.0f32, 1.0f32, "%.3f", @@flags__)
      ImGui.slider_int("SliderInt (0 -> 100)", pointerof(@@slider_i), 0, 100, "%.3f", @@flags__)

      ImGui.tree_pop
    end

    if ImGui.tree_node("Range Widgets")
      ImGui.drag_float_range2("range float", pointerof(@@begin), pointerof(@@end), 0.25f32, 0.0f32, 100.0f32, "Min: %.1f %%", "Max: %.1f %%", ImGui::ImGuiSliderFlags::ClampOnInput)
      ImGui.drag_int_range2("range int", pointerof(@@begin_i), pointerof(@@end_i), 5, 0, 1000, "Min: %d units", "Max: %d units")
      ImGui.drag_int_range2("range int (no bounds)", pointerof(@@begin_i), pointerof(@@end_i), 5, 0, 0, "Min: %d units", "Max: %d units")
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

      drag_speed = 0.2f32

      ImGui.text("Drags:")
      ImGui.checkbox("Clamp integers to 0..50", pointerof(@@drag_clamp))
      ImGui.same_line
      help_marker("As with every widgets in dear imgui, we never modify values unless there is a user interaction.\nYou can override the clamping limits by using CTRL+Click to input a value.")
      ImGui.drag_scalar_("drag s8", pointerof(@@s8_v), drag_speed, @@drag_clamp ? s8_zero : nil, @@drag_clamp ? s8_fifty : nil)
      ImGui.drag_scalar("drag u8", pointerof(@@u8_v), drag_speed, @@drag_clamp ? u8_zero : nil, @@drag_clamp ? u8_fifty : nil, "%u ms")
      ImGui.drag_scalar("drag s16", pointerof(@@s16_v), drag_speed, @@drag_clamp ? s16_zero : nil, @@drag_clamp ? s16_fifty : nil)
      ImGui.drag_scalar("drag u16", pointerof(@@u16_v), drag_speed, @@drag_clamp ? u16_zero : nil, @@drag_clamp ? u16_fifty : nil, "%u ms")
      ImGui.drag_scalar("drag s32", pointerof(@@s32_v), drag_speed, @@drag_clamp ? s32_zero : nil, @@drag_clamp ? s32_fifty : nil)
      ImGui.drag_scalar("drag u32", pointerof(@@u32_v), drag_speed, @@drag_clamp ? u32_zero : nil, @@drag_clamp ? u32_fifty : nil, "%u ms")
      ImGui.drag_scalar("drag s64", pointerof(@@s64_v), drag_speed, @@drag_clamp ? s64_zero : nil, @@drag_clamp ? s64_fifty : nil)
      ImGui.drag_scalar("drag u64", pointerof(@@u64_v), drag_speed, @@drag_clamp ? u64_zero : nil, @@drag_clamp ? u64_fifty : nil)
      ImGui.drag_scalar("drag float", pointerof(@@f32_v), 0.005f32, f32_zero, f32_one, "%f")
      ImGui.drag_scalar("drag float log", pointerof(@@f32_v), 0.005f32, f32_zero, f32_one, "%f", ImGui::ImGuiSliderFlags::Logarithmic)
      ImGui.drag_scalar("drag double", pointerof(@@f64_v), 0.0005f32, f64_zero, nil, "%.10f grams")
      ImGui.drag_scalar("drag double log", pointerof(@@f64_v), 0.0005f32, f64_zero, f64_one, "0 < %.10f < 1", ImGui::ImGuiSliderFlags::Logarithmic)

      ImGui.text("Sliders")
      ImGui.slider_scalar("slider s8 full", pointerof(@@s8_v), s8_min, s8_max, "%d")
      ImGui.slider_scalar("slider u8 full", pointerof(@@u8_v), u8_min, u8_max, "%u")
      ImGui.slider_scalar("slider s16 full", pointerof(@@s16_v), s16_min, s16_max, "%d")
      ImGui.slider_scalar("slider u16 full", pointerof(@@u16_v), u16_min, u16_max, "%u")
      ImGui.slider_scalar("slider s32 low", pointerof(@@s32_v), s32_zero, s32_fifty, "%d")
      ImGui.slider_scalar("slider s32 high", pointerof(@@s32_v), s32_hi_a, s32_hi_b, "%d")
      ImGui.slider_scalar("slider s32 full", pointerof(@@s32_v), s32_min, s32_max, "%d")
      ImGui.slider_scalar("slider u32 low", pointerof(@@u32_v), u32_zero, u32_fifty, "%u")
      ImGui.slider_scalar("slider u32 high", pointerof(@@u32_v), u32_hi_a, u32_hi_b, "%u")
      ImGui.slider_scalar("slider u32 full", pointerof(@@u32_v), u32_min, u32_max, "%u")
      ImGui.slider_scalar("slider s64 low", pointerof(@@s64_v), s64_zero, s64_fifty, "%I64d")
      ImGui.slider_scalar("slider s64 high", pointerof(@@s64_v), s64_hi_a, s64_hi_b, "%I64d")
      ImGui.slider_scalar("slider s64 full", pointerof(@@s64_v), s64_min, s64_max, "%I64d")
      ImGui.slider_scalar("slider u64 low", pointerof(@@u64_v), u64_zero, u64_fifty, "%I64u ms")
      ImGui.slider_scalar("slider u64 high", pointerof(@@u64_v), u64_hi_a, u64_hi_b, "%I64u ms")
      ImGui.slider_scalar("slider u64 full", pointerof(@@u64_v), u64_min, u64_max, "%I64u ms")
      ImGui.slider_scalar("slider float low", pointerof(@@f32_v), f32_zero, f32_one)
      ImGui.slider_scalar("slider float low log", pointerof(@@f32_v), f32_zero, f32_one, "%.10f", ImGui::ImGuiSliderFlags::Logarithmic)
      ImGui.slider_scalar("slider float high", pointerof(@@f32_v), f32_lo_a, f32_hi_a, "%e")
      ImGui.slider_scalar("slider double low", pointerof(@@f64_v), f64_zero, f64_one, "%.10f grams")
      ImGui.slider_scalar("slider double low log", pointerof(@@f64_v), f64_zero, f64_one, "%.10f", ImGui::ImGuiSliderFlags::Logarithmic)
      ImGui.slider_scalar("slider double high", pointerof(@@f64_v), f64_lo_a, f64_hi_a, "%e grams")

      ImGui.text("Inputs")
      ImGui.checkbox("Show step buttons", pointerof(@@inputs_step))
      ImGui.input_scalar("input s8", pointerof(@@s8_v), @@inputs_step ? s8_one : nil, nil, "%d")
      ImGui.input_scalar("input u8", pointerof(@@u8_v), @@inputs_step ? u8_one : nil, nil, "%u")
      ImGui.input_scalar("input s16", pointerof(@@s16_v), @@inputs_step ? s16_one : nil, nil, "%d")
      ImGui.input_scalar("input u16", pointerof(@@u16_v), @@inputs_step ? u16_one : nil, nil, "%u")
      ImGui.input_scalar("input s32", pointerof(@@s32_v), @@inputs_step ? s32_one : nil, nil, "%d")
      ImGui.input_scalar("input s32 hex", pointerof(@@s32_v), @@inputs_step ? s32_one : nil, nil, "%08X", ImGui::ImGuiInputTextFlags::CharsHexadecimal)
      ImGui.input_scalar("input u32", pointerof(@@u32_v), @@inputs_step ? u32_one : nil, nil, "%u")
      ImGui.input_scalar("input u32 hex", pointerof(@@u32_v), @@inputs_step ? u32_one : nil, nil, "%08X", ImGui::ImGuiInputTextFlags::CharsHexadecimal)
      ImGui.input_scalar("input s64", pointerof(@@s64_v), @@inputs_step ? s64_one : nil)
      ImGui.input_scalar("input u64", pointerof(@@u64_v), @@inputs_step ? u64_one : nil)
      ImGui.input_scalar("input float", pointerof(@@f32_v), @@inputs_step ? f32_one : nil)
      ImGui.input_scalar("input double", pointerof(@@f64_v), @@inputs_step ? f64_one : nil)

      ImGui.tree_pop
    end

    if ImGui.tree_node("Multi-component Widgets")
      ImGui.input_float2("input float2", @@vec4f.to_unsafe)
      ImGui.drag_float2("drag float2", @@vec4f.to_unsafe, 0.01f32, 0.0f32, 1.0f32)
      ImGui.slider_float2("slider float2", @@vec4f.to_unsafe, 0.0f32, 1.0f32)
      ImGui.input_int2("input int2", @@vec4i.to_unsafe)
      ImGui.drag_int2("drag int2", @@vec4i.to_unsafe, 1, 0, 255)
      ImGui.slider_int2("slider int2", @@vec4i.to_unsafe, 0, 255)
      ImGui.spacing

      ImGui.input_float3("input float3", @@vec4f.to_unsafe)
      ImGui.drag_float3("drag float3", @@vec4f.to_unsafe, 0.01f32, 0.0f32, 1.0f32)
      ImGui.slider_float3("slider float3", @@vec4f.to_unsafe, 0.0f32, 1.0f32)
      ImGui.input_int3("input int3", @@vec4i.to_unsafe)
      ImGui.drag_int3("drag int3", @@vec4i.to_unsafe, 1, 0, 255)
      ImGui.slider_int3("slider int3", @@vec4i.to_unsafe, 0, 255)
      ImGui.spacing

      ImGui.input_float4("input float4", @@vec4f.to_unsafe)
      ImGui.drag_float4("drag float4", @@vec4f.to_unsafe, 0.01f32, 0.0f32, 1.0f32)
      ImGui.slider_float4("slider float4", @@vec4f.to_unsafe, 0.0f32, 1.0f32)
      ImGui.input_int4("input int4", @@vec4i.to_unsafe)
      ImGui.drag_int4("drag int4", @@vec4i.to_unsafe, 1, 0, 255)
      ImGui.slider_int4("slider int4", @@vec4i.to_unsafe, 0, 255)

      ImGui.tree_pop
    end

    if ImGui.tree_node("Vertical Sliders")
      spacing = 4
      ImGui.push_style_var(ImGui::ImGuiStyleVar::ItemSpacing, ImGui.vec2(spacing, spacing))

      ImGui.v_slider_int("##int", ImGui.vec2(18, 160), pointerof(@@int_value), 0, 5)
      ImGui.same_line

      ImGui.push_id("set1")
      7.times do |i|
        if i > 0
          ImGui.same_line
        end
        ImGui.push_id(i)
        ImGui.push_style_color(ImGui::ImGuiCol::FrameBg, ImGui.col32(ImGui.hsv(i / 7.0f32, 0.5f32, 0.5f32)))
        ImGui.push_style_color(ImGui::ImGuiCol::FrameBgHovered, ImGui.col32(ImGui.hsv(i / 7.0f32, 0.6f32, 0.5f32)))
        ImGui.push_style_color(ImGui::ImGuiCol::FrameBgActive, ImGui.col32(ImGui.hsv(i / 7.0f32, 0.7f32, 0.5f32)))
        ImGui.push_style_color(ImGui::ImGuiCol::SliderGrab, ImGui.col32(ImGui.hsv(i / 7.0f32, 0.9f32, 0.9f32)))
        ImGui.v_slider_float("##v", ImGui.vec2(18, 160), pointerof(@@values_[i]), 0.0f32, 1.0f32, "")
        if ImGui.is_item_active || ImGui.is_item_hovered
          ImGui.set_tooltip("%.3f", @@values_[i])
        end
        ImGui.pop_style_color(4)
        ImGui.pop_id
      end
      ImGui.pop_id

      ImGui.same_line
      ImGui.push_id("set2")

      rows = 3
      small_slider_size = ImGui.vec2(18, ((160.0f32 - (rows - 1) * spacing) / rows).to_i)
      4.times do |nx|
        if nx > 0
          ImGui.same_line
        end
        ImGui.begin_group
        rows.times do |ny|
          ImGui.push_id(nx * rows + ny)
          ImGui.v_slider_float("##v", small_slider_size, pointerof(@@values2[nx]), 0.0f32, 1.0f32, "")
          if ImGui.is_item_active || ImGui.is_item_hovered
            ImGui.set_tooltip("%.3f", @@values2[nx])
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
        ImGui.push_style_var(ImGui::ImGuiStyleVar::GrabMinSize, 40)
        ImGui.v_slider_float("##v", ImGui.vec2(40, 160), pointerof(@@values_[i]), 0.0f32, 1.0f32, "%.2f\nsec")
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

        ImGui.color_edit3("color 1", @@col1_.to_unsafe)
        ImGui.color_edit4("color 2", @@col2_.to_unsafe)
        ImGui.tree_pop
      end

      if ImGui.tree_node("Drag and drop to copy/swap items")
        if ImGui.radio_button("Copy", @@mode == Mode::Copy)
          @@mode = Mode::Copy
        end
        ImGui.same_line
        if ImGui.radio_button("Move", @@mode == Mode::Move)
          @@mode = Mode::Move
        end
        ImGui.same_line
        if ImGui.radio_button("Swap", @@mode == Mode::Swap)
          @@mode = Mode::Swap
        end
        @@names.size.times do |n|
          ImGui.push_id(n)
          if (n % 3) != 0
            ImGui.same_line
          end
          ImGui.button(@@names[n], ImGui.vec2(60, 60))

          if ImGui.begin_drag_drop_source
            ImGui.set_drag_drop_payload("DND_DEMO_CELL", pointerof(n).as(Void*), LibC::SizeT.new(sizeof(Int32)))

            if @@mode == Mode::Copy
              ImGui.text("Copy %s", @@names[n])
            end
            if @@mode == Mode::Move
              ImGui.text("Move %s", @@names[n])
            end
            if @@mode == Mode::Swap
              ImGui.text("Swap %s", @@names[n])
            end
            ImGui.end_drag_drop_source
          end
          if ImGui.begin_drag_drop_target
            if payload = ImGui.accept_drag_drop_payload("DND_DEMO_CELL")
              assert(payload.data_size == sizeof(Int32))
              payload_n = payload.data.as(Int32*).value
              if @@mode == Mode::Copy
                @@names[n] = @@names[payload_n]
              end
              if @@mode == Mode::Move
                @@names[n] = @@names[payload_n]
                @@names[payload_n] = ""
              end
              if @@mode == Mode::Swap
                tmp = @@names[n]
                @@names[n] = @@names[payload_n]
                @@names[payload_n] = tmp
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
        @@item_names.size.times do |n|
          item = @@item_names[n]
          ImGui.selectable(item)

          if ImGui.is_item_active && !ImGui.is_item_hovered
            n_next = n + (ImGui.get_mouse_drag_delta(ImGui::ImGuiMouseButton::Left).y < 0f32 ? -1 : 1)
            if n_next >= 0 && n_next < @@item_names.size
              @@item_names[n] = @@item_names[n_next]
              @@item_names[n_next] = item
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

      ImGui.combo("Item Type", pointerof(@@item_type), item_names.map(&.to_unsafe).to_unsafe, item_names.size, item_names.size)
      ImGui.same_line
      help_marker("Testing how various types of items are interacting with the IsItemXXX functions.")

      ret = false

      if @@item_type == 0
        ImGui.text("ITEM: Text")
      end
      if @@item_type == 1
        ret = ImGui.button("ITEM: Button")
      end
      if @@item_type == 2
        ImGui.push_button_repeat(true)
        ret = ImGui.button("ITEM: Button")
        ImGui.pop_button_repeat
      end
      if @@item_type == 3
        ret = ImGui.checkbox("ITEM: Checkbox", pointerof(@@b))
      end
      if @@item_type == 4
        ret = ImGui.slider_float("ITEM: SliderFloat", @@col4f.to_unsafe, 0.0f32, 1.0f32)
      end
      if @@item_type == 5
        ret = ImGui.input_text("ITEM: InputText", @@str)
      end
      if @@item_type == 6
        ret = ImGui.input_float("ITEM: InputFloat", @@col4f.to_unsafe, 1.0f32)
      end
      if @@item_type == 7
        ret = ImGui.input_float3("ITEM: InputFloat3", @@col4f.to_unsafe)
      end
      if @@item_type == 8
        ret = ImGui.color_edit4("ITEM: ColorEdit4", @@col4f.to_unsafe)
      end
      if @@item_type == 9
        ret = ImGui.menu_item("ITEM: MenuItem")
      end
      if @@item_type == 10
        ret = ImGui.tree_node("ITEM: TreeNode")
        if ret
          ImGui.tree_pop
        end
      end
      if @@item_type == 11
        ret = ImGui.tree_node_ex("ITEM: TreeNode w/ ImGui::ImGuiTreeNodeFlags::OpenOnDoubleClick", ImGui::ImGuiTreeNodeFlags::OpenOnDoubleClick | ImGui::ImGuiTreeNodeFlags::NoTreePushOnOpen)
      end
      if @@item_type == 12
        items = ["Apple", "Banana", "Cherry", "Kiwi"]

        ret = ImGui.list_box("ITEM: ListBox", pointerof(@@current), items.map(&.to_unsafe).to_unsafe, items.size, items.size)
      end

      ImGui.bullet_text(
        "Return value = %d\n" +
        "is_item_focused() = %d\n" +
        "is_item_hovered() = %d\n" +
        "is_item_hovered(_AllowWhenBlockedByPopup) = %d\n" +
        "is_item_hovered(_AllowWhenBlockedByActiveItem) = %d\n" +
        "is_item_hovered(_AllowWhenOverlapped) = %d\n" +
        "is_item_hovered(_RectOnly) = %d\n" +
        "is_item_active() = %d\n" +
        "is_item_edited() = %d\n" +
        "is_item_activated() = %d\n" +
        "is_item_deactivated() = %d\n" +
        "is_item_deactivated_after_edit() = %d\n" +
        "is_item_visible() = %d\n" +
        "is_item_clicked() = %d\n" +
        "is_item_toggled_open() = %d\n" +
        "get_item_rect_min() = (%.1f, %.1f)\n" +
        "get_item_rect_max() = (%.1f, %.1f)\n" +
        "get_item_rect_size() = (%.1f, %.1f)",
        ret,
        ImGui.is_item_focused,
        ImGui.is_item_hovered,
        ImGui.is_item_hovered(ImGui::ImGuiHoveredFlags::AllowWhenBlockedByPopup),
        ImGui.is_item_hovered(ImGui::ImGuiHoveredFlags::AllowWhenBlockedByActiveItem),
        ImGui.is_item_hovered(ImGui::ImGuiHoveredFlags::AllowWhenOverlapped),
        ImGui.is_item_hovered(ImGui::ImGuiHoveredFlags::RectOnly),
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

      ImGui.checkbox("Embed everything inside a child window (for additional testing)", pointerof(@@embed_all_inside_a_child_window))
      if @@embed_all_inside_a_child_window
        ImGui.begin_child("outer_child", ImGui.vec2(0, ImGui.get_font_size * 20.0f32), true)
      end

      ImGui.bullet_text(
        "is_window_focused() = %d\n" +
        "is_window_focused(_ChildWindows) = %d\n" +
        "is_window_focused(_ChildWindows|_RootWindow) = %d\n" +
        "is_window_focused(_RootWindow) = %d\n" +
        "is_window_focused(_AnyWindow) = %d\n",
        ImGui.is_window_focused,
        ImGui.is_window_focused(ImGui::ImGuiFocusedFlags::ChildWindows),
        ImGui.is_window_focused(ImGui::ImGuiFocusedFlags::ChildWindows | ImGui::ImGuiFocusedFlags::RootWindow),
        ImGui.is_window_focused(ImGui::ImGuiFocusedFlags::RootWindow),
        ImGui.is_window_focused(ImGui::ImGuiFocusedFlags::AnyWindow))

      ImGui.bullet_text(
        "is_window_hovered() = %d\n" +
        "is_window_hovered(_AllowWhenBlockedByPopup) = %d\n" +
        "is_window_hovered(_AllowWhenBlockedByActiveItem) = %d\n" +
        "is_window_hovered(_ChildWindows) = %d\n" +
        "is_window_hovered(_ChildWindows|_RootWindow) = %d\n" +
        "is_window_hovered(_ChildWindows|_AllowWhenBlockedByPopup) = %d\n" +
        "is_window_hovered(_RootWindow) = %d\n" +
        "is_window_hovered(_AnyWindow) = %d\n",
        ImGui.is_window_hovered,
        ImGui.is_window_hovered(ImGui::ImGuiHoveredFlags::AllowWhenBlockedByPopup),
        ImGui.is_window_hovered(ImGui::ImGuiHoveredFlags::AllowWhenBlockedByActiveItem),
        ImGui.is_window_hovered(ImGui::ImGuiHoveredFlags::ChildWindows),
        ImGui.is_window_hovered(ImGui::ImGuiHoveredFlags::ChildWindows | ImGui::ImGuiHoveredFlags::RootWindow),
        ImGui.is_window_hovered(ImGui::ImGuiHoveredFlags::ChildWindows | ImGui::ImGuiHoveredFlags::AllowWhenBlockedByPopup),
        ImGui.is_window_hovered(ImGui::ImGuiHoveredFlags::RootWindow),
        ImGui.is_window_hovered(ImGui::ImGuiHoveredFlags::AnyWindow))

      ImGui.begin_child("child", ImGui.vec2(0, 50), true)
      ImGui.text("This is another child window for testing the _ChildWindows flag.")
      ImGui.end_child
      if @@embed_all_inside_a_child_window
        ImGui.end_child
      end

      ImGui.input_text("dummy", @@unused_str, ImGui::ImGuiInputTextFlags::ReadOnly)

      ImGui.checkbox("Hovered/Active tests after begin() for title bar testing", pointerof(@@test_window))
      if @@test_window
        ImGui.begin("Title bar Hovered/Active tests", pointerof(@@test_window))
        if ImGui.begin_popup_context_item
          if ImGui.menu_item("Close")
            @@test_window = false
          end
          ImGui.end_popup
        end
        ImGui.text(
          "is_item_hovered() after @@begin = %d (== is title bar hovered)\n" +
          "is_item_active() after @@begin = %d (== is window being clicked/moved)\n",
          ImGui.is_item_hovered, ImGui.is_item_active)
        ImGui.end
      end

      ImGui.tree_pop
    end
  end

  @@disable_mouse_wheel = false
  @@disable_menu = false
  @@offset_x = 0
  @@f = 0.0f32
  @@c1 = false
  @@c2 = false
  @@c3 = false
  @@c4 = false
  @@f0_ = 1.0f32
  @@f1___ = 2.0f32
  @@f2__ = 3.0f32
  @@item = -1
  @@selection__ = [0, 1, 2, 3]
  @@tab_bar_flags = ImGui::ImGuiTabBarFlags::Reorderable
  @@opened = [true, true, true, true]
  @@track_item = 50
  @@enable_track = true
  @@enable_extra_decorations = false
  @@scroll_to_off_px = 0.0f32
  @@scroll_to_pos_px = 200.0f32
  @@lines = 7
  @@show_horizontal_contents_size_demo_window = false
  @@show_h_scrollbar = true
  @@show_button = true
  @@show_tree_nodes = true
  @@show_text_wrapped = false
  @@show_columns = true
  @@show_tab_bar = true
  @@show_child = false
  @@explicit_content_size = false
  @@contents_size_x = 300.0f32
  @@size = ImGui::ImVec2.new(100, 100)
  @@offset = ImGui::ImVec2.new(30, 30)

  def self.show_demo_window_layout
    if !ImGui.collapsing_header("Layout & Scrolling")
      return
    end

    if ImGui.tree_node("Child windows")
      help_marker("Use child windows to begin into a self-contained independent scrolling/clipping regions within a host window.")

      ImGui.checkbox("Disable Mouse Wheel", pointerof(@@disable_mouse_wheel))
      ImGui.checkbox("Disable Menu", pointerof(@@disable_menu))

      begin
        window_flags = ImGui::ImGuiWindowFlags::HorizontalScrollbar
        if @@disable_mouse_wheel
          window_flags |= ImGui::ImGuiWindowFlags::NoScrollWithMouse
        end
        ImGui.begin_child("ChildL", ImGui.vec2(ImGui.get_window_content_region_width * 0.5f32, 260), false, window_flags)
        100.times do |i|
          ImGui.text("%04d: scrollable region", i)
        end
        ImGui.end_child
      end

      ImGui.same_line

      begin
        window_flags = ImGui::ImGuiWindowFlags::None
        if @@disable_mouse_wheel
          window_flags |= ImGui::ImGuiWindowFlags::NoScrollWithMouse
        end
        if !@@disable_menu
          window_flags |= ImGui::ImGuiWindowFlags::MenuBar
        end
        ImGui.push_style_var(ImGui::ImGuiStyleVar::ChildRounding, 5.0f32)
        ImGui.begin_child("ChildR", ImGui.vec2(0, 260), true, window_flags)
        if !@@disable_menu && ImGui.begin_menu_bar
          if ImGui.begin_menu("Menu")
            show_example_menu_file()
            ImGui.end_menu
          end
          ImGui.end_menu_bar
        end
        ImGui.columns(2)
        100.times do |i|
          ImGui.button("%03d" % i, ImGui.vec2(-Float32::MIN_POSITIVE, 0.0f32))
          ImGui.next_column
        end
        ImGui.end_child
        ImGui.pop_style_var
      end

      ImGui.separator
      begin
        ImGui.set_next_item_width(100)
        ImGui.drag_int("Offset X", pointerof(@@offset_x), 1.0f32, -1000, 1000)

        ImGui.set_cursor_pos_x(ImGui.get_cursor_pos_x + @@offset_x)
        ImGui.push_style_color(ImGui::ImGuiCol::ChildBg, ImGui.col32(255, 0, 0, 100))
        ImGui.begin_child("Red", ImGui.vec2(200, 100), true, ImGui::ImGuiWindowFlags::None)
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
      ImGui.text("SetNextItemWidth/push_item_width(100)")
      ImGui.same_line
      help_marker("Fixed width.")
      ImGui.set_next_item_width(100)
      ImGui.drag_float("float##1", pointerof(@@f))

      ImGui.text("SetNextItemWidth/push_item_width(get_window_width() * 0.5f32)")
      ImGui.same_line
      help_marker("Half of window width.")
      ImGui.set_next_item_width(ImGui.get_window_width * 0.5f32)
      ImGui.drag_float("float##2", pointerof(@@f))

      ImGui.text("SetNextItemWidth/push_item_width(get_content_region_avail().x * 0.5f32)")
      ImGui.same_line
      help_marker("Half of available width.\n(~ right-cursor_pos)\n(works within a column set)")
      ImGui.set_next_item_width(ImGui.get_content_region_avail.x * 0.5f32)
      ImGui.drag_float("float##3", pointerof(@@f))

      ImGui.text("SetNextItemWidth/push_item_width(-100)")
      ImGui.same_line
      help_marker("Align to right edge minus 100")
      ImGui.set_next_item_width(-100)
      ImGui.drag_float("float##4", pointerof(@@f))

      ImGui.text("SetNextItemWidth/push_item_width(-1)")
      ImGui.same_line
      help_marker("Align to right edge")
      ImGui.push_item_width(-1)
      ImGui.drag_float("##float5a", pointerof(@@f))
      ImGui.drag_float("##float5b", pointerof(@@f))
      ImGui.drag_float("##float5c", pointerof(@@f))
      ImGui.pop_item_width

      ImGui.tree_pop
    end

    if ImGui.tree_node("Basic Horizontal Layout")
      ImGui.text_wrapped("(Use ImGui.same_line() to keep adding items to the right of the preceding item)")

      ImGui.text("Two items: Hello")
      ImGui.same_line
      ImGui.text_colored(ImGui.vec4(1, 1, 0, 1), "Sailor")

      ImGui.text("More spacing: Hello")
      ImGui.same_line(0, 20)
      ImGui.text_colored(ImGui.vec4(1, 1, 0, 1), "Sailor")

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

      ImGui.checkbox("My", pointerof(@@c1))
      ImGui.same_line
      ImGui.checkbox("Tailor", pointerof(@@c2))
      ImGui.same_line
      ImGui.checkbox("Is", pointerof(@@c3))
      ImGui.same_line
      ImGui.checkbox("Rich", pointerof(@@c4))

      ImGui.push_item_width(80)
      items = ["AAAA", "BBBB", "CCCC", "DDDD"]

      ImGui.combo("Combo", pointerof(@@item), items.map(&.to_unsafe).to_unsafe, items.size)
      ImGui.same_line
      ImGui.slider_float("X", pointerof(@@f0_), 0.0f32, 5.0f32)
      ImGui.same_line
      ImGui.slider_float("Y", pointerof(@@f1___), 0.0f32, 5.0f32)
      ImGui.same_line
      ImGui.slider_float("Z", pointerof(@@f2__), 0.0f32, 5.0f32)
      ImGui.pop_item_width

      ImGui.push_item_width(80)
      ImGui.text("Lists:")

      4.times do |i|
        if i > 0
          ImGui.same_line
        end
        ImGui.push_id(i)
        ImGui.list_box("", pointerof(@@selection__[i]), items.map(&.to_unsafe).to_unsafe, items.size)
        ImGui.pop_id
      end
      ImGui.pop_item_width

      button_sz = ImGui.vec2(40, 40)
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
        @@tab_bar_flags = ImGui::ImGuiTabBarFlags::None
        if ImGui.begin_tab_bar("MyTabBar", @@tab_bar_flags)
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
        ImGui.checkbox_flags("ImGui::ImGuiTabBarFlags::Reorderable", pointerof(@@tab_bar_flags), ImGui::ImGuiTabBarFlags::Reorderable)
        ImGui.checkbox_flags("ImGui::ImGuiTabBarFlags::AutoSelectNewTabs", pointerof(@@tab_bar_flags), ImGui::ImGuiTabBarFlags::AutoSelectNewTabs)
        ImGui.checkbox_flags("ImGui::ImGuiTabBarFlags::TabListPopupButton", pointerof(@@tab_bar_flags), ImGui::ImGuiTabBarFlags::TabListPopupButton)
        ImGui.checkbox_flags("ImGui::ImGuiTabBarFlags::NoCloseWithMiddleMouseButton", pointerof(@@tab_bar_flags), ImGui::ImGuiTabBarFlags::NoCloseWithMiddleMouseButton)
        if (@@tab_bar_flags.includes? :FittingPolicyMask_) == 0
          @@tab_bar_flags |= ImGui::ImGuiTabBarFlags::FittingPolicyDefault_
        end
        if ImGui.checkbox_flags("ImGui::ImGuiTabBarFlags::FittingPolicyResizeDown", pointerof(@@tab_bar_flags), ImGui::ImGuiTabBarFlags::FittingPolicyResizeDown)
          @@tab_bar_flags &= ~(ImGui::ImGuiTabBarFlags::FittingPolicyMask_ ^ ImGui::ImGuiTabBarFlags::FittingPolicyResizeDown)
        end
        if ImGui.checkbox_flags("ImGui::ImGuiTabBarFlags::FittingPolicyScroll", pointerof(@@tab_bar_flags), ImGui::ImGuiTabBarFlags::FittingPolicyScroll)
          @@tab_bar_flags &= ~(ImGui::ImGuiTabBarFlags::FittingPolicyMask_ ^ ImGui::ImGuiTabBarFlags::FittingPolicyScroll)
        end

        names = ["Artichoke", "Beetroot", "Celery", "Daikon"]

        @@opened.size.times do |n|
          if n > 0
            ImGui.same_line
          end
          ImGui.checkbox(names[n], pointerof(@@opened[n]))
        end

        if ImGui.begin_tab_bar("MyTabBar", @@tab_bar_flags)
          @@opened.size.times do |n|
            if @@opened[n] && ImGui.begin_tab_item(names[n], pointerof(@@opened[n]), ImGui::ImGuiTabItemFlags::None)
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
        "begin_group() basically locks the horizontal position for new line. " +
        "end_group() bundles the whole group so that you can use \"item\" functions such as " +
        "is_item_hovered()/is_item_active() or same_line() etc. on the whole group.")
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
      ImGui.plot_histogram("##values", values.to_unsafe, values.size, 0, nil, 0.0f32, 1.0f32, size)

      ImGui.button("ACTION", ImGui.vec2((size.x - ImGui.get_style.item_spacing.x) * 0.5f32, size.y))
      ImGui.same_line
      ImGui.button("REACTION", ImGui.vec2((size.x - ImGui.get_style.item_spacing.x) * 0.5f32, size.y))
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
        ImGui.button("Some framed @@item")
        ImGui.same_line
        help_marker("Baseline of button will look misaligned with text..")

        ImGui.align_text_to_frame_padding
        ImGui.text("OK Blahblah")
        ImGui.same_line
        ImGui.button("Some framed @@item")
        ImGui.same_line
        help_marker("We call align_text_to_frame_padding() to vertically align the text baseline by +frame_padding.y")

        ImGui.button("TEST##1")
        ImGui.same_line
        ImGui.text("TEST")
        ImGui.same_line
        ImGui.small_button("TEST##2")

        ImGui.align_text_to_frame_padding
        ImGui.text("Text aligned to framed @@item")
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

        ImGui.button("80x80", ImGui.vec2(80, 80))
        ImGui.same_line
        ImGui.button("50x50", ImGui.vec2(50, 50))
        ImGui.same_line
        ImGui.button("button()")
        ImGui.same_line
        ImGui.small_button("small_button()")

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
      help_marker("Use set_scroll_here_y() or set_scroll_from_pos_y() to scroll to a given vertical position.")

      ImGui.checkbox("Decoration", pointerof(@@enable_extra_decorations))

      ImGui.checkbox("Track", pointerof(@@enable_track))
      ImGui.push_item_width(100)
      ImGui.same_line(140)
      @@enable_track |= ImGui.drag_int("##@@item", pointerof(@@track_item), 0.25f32, 0, 99, "Item = %d")

      scroll_to_off = ImGui.button("Scroll Offset")
      ImGui.same_line(140)
      scroll_to_off |= ImGui.drag_float("##off", pointerof(@@scroll_to_off_px), 1.00f32, 0, Float32::MAX, "+%.0f px")

      scroll_to_pos = ImGui.button("Scroll To Pos")
      ImGui.same_line(140)
      scroll_to_pos |= ImGui.drag_float("##pos", pointerof(@@scroll_to_pos_px), 1.00f32, -10, Float32::MAX, "X/Y = %.0f px")
      ImGui.pop_item_width

      if scroll_to_off || scroll_to_pos
        @@enable_track = false
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

        child_flags = @@enable_extra_decorations ? ImGui::ImGuiWindowFlags::MenuBar : ImGui::ImGuiWindowFlags::None
        child_id = ImGui.get_id(i)
        child_is_visible = ImGui.begin_child(child_id, ImGui.vec2(child_w, 200.0f32), true, child_flags)
        if ImGui.begin_menu_bar
          ImGui.text_unformatted("abc")
          ImGui.end_menu_bar
        end
        if scroll_to_off
          ImGui.set_scroll_y(@@scroll_to_off_px)
        end
        if scroll_to_pos
          ImGui.set_scroll_from_pos_y(ImGui.get_cursor_start_pos.y + @@scroll_to_pos_px, i * 0.25f32)
        end
        if child_is_visible
          100.times do |item|
            if @@enable_track && item == @@track_item
              ImGui.text_colored(ImGui.vec4(1, 1, 0, 1), "Item %d", item)
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
        "Use set_scroll_here_x() or set_scroll_from_pos_x() to scroll to a given horizontal position.\n\n" +
        "Because the clipping rectangle of most window hides half worth of WindowPadding on the " +
        "left/right, using set_scroll_from_pos_x(+1) will usually result in clipped text whereas the " +
        "equivalent set_scroll_from_pos_y(+1) wouldn't.")
      ImGui.push_id("##HorizontalScrolling")
      5.times do |i|
        child_height = ImGui.get_text_line_height + style.scrollbar_size + style.window_padding.y * 2.0f32
        child_flags = ImGui::ImGuiWindowFlags::HorizontalScrollbar | (@@enable_extra_decorations ? ImGui::ImGuiWindowFlags::AlwaysVerticalScrollbar : ImGui::ImGuiWindowFlags::None)
        child_id = ImGui.get_id(i)
        child_is_visible = ImGui.begin_child(child_id, ImGui.vec2(-100, child_height), true, child_flags)
        if scroll_to_off
          ImGui.set_scroll_x(@@scroll_to_off_px)
        end
        if scroll_to_pos
          ImGui.set_scroll_from_pos_x(ImGui.get_cursor_start_pos.x + @@scroll_to_pos_px, i * 0.25f32)
        end
        if child_is_visible
          100.times do |item|
            if @@enable_track && item == @@track_item
              ImGui.text_colored(ImGui.vec4(1, 1, 0, 1), "Item %d", item)
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
        "Horizontal scrolling for a window is enabled via the ImGui::ImGuiWindowFlags::HorizontalScrollbar flag.\n\n" +
        "You may want to also explicitly specify content width by using set_next_window_content_width() before begin().")

      ImGui.slider_int("Lines", pointerof(@@lines), 1, 15)
      ImGui.push_style_var(ImGui::ImGuiStyleVar::FrameRounding, 3.0f32)
      ImGui.push_style_var(ImGui::ImGuiStyleVar::FramePadding, ImGui.vec2(2.0f32, 1.0f32))
      scrolling_child_size = ImGui.vec2(0, ImGui.get_frame_height_with_spacing * 7 + 30)
      ImGui.begin_child("scrolling", scrolling_child_size, true, ImGui::ImGuiWindowFlags::HorizontalScrollbar)
      @@lines.times do |line|
        num_buttons = 10 + ((line & 1) ? line * 9 : line * 3)
        num_buttons.times do |n|
          if n > 0
            ImGui.same_line
          end
          ImGui.push_id(n + line * 1000)
          label = (!(n % 15)) ? "FizzBuzz" : (!(n % 3)) ? "Fizz" : (!(n % 5)) ? "Buzz" : "#{n}"
          hue = n * 0.05f32
          ImGui.push_style_color(ImGui::ImGuiCol::Button, ImGui.col32(ImGui.hsv(hue, 0.6f32, 0.6f32)))
          ImGui.push_style_color(ImGui::ImGuiCol::ButtonHovered, ImGui.col32(ImGui.hsv(hue, 0.7f32, 0.7f32)))
          ImGui.push_style_color(ImGui::ImGuiCol::ButtonActive, ImGui.col32(ImGui.hsv(hue, 0.8f32, 0.8f32)))
          ImGui.button(label, ImGui.vec2(40.0f32 + Math.sin((line + n)) * 20.0f32, 0.0f32))
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

      ImGui.checkbox("Show Horizontal contents size demo window", pointerof(@@show_horizontal_contents_size_demo_window))

      if @@show_horizontal_contents_size_demo_window
        if @@explicit_content_size
          ImGui.set_next_window_content_size(ImGui.vec2(@@contents_size_x, 0.0f32))
        end
        ImGui.begin("Horizontal contents size demo window", pointerof(@@show_horizontal_contents_size_demo_window), @@show_h_scrollbar ? ImGui::ImGuiWindowFlags::HorizontalScrollbar : ImGui::ImGuiWindowFlags::None)
        ImGui.push_style_var(ImGui::ImGuiStyleVar::ItemSpacing, ImGui.vec2(2, 0))
        ImGui.push_style_var(ImGui::ImGuiStyleVar::FramePadding, ImGui.vec2(2, 0))
        help_marker("Test of different widgets react and impact the work rectangle growing when horizontal scrolling is enabled.\n\nUse 'metrics.tools.show windows rectangles' to visualize rectangles.")
        ImGui.checkbox("H-scrollbar", pointerof(@@show_h_scrollbar))
        ImGui.checkbox("Button", pointerof(@@show_button))
        ImGui.checkbox("Tree nodes", pointerof(@@show_tree_nodes))
        ImGui.checkbox("Text wrapped", pointerof(@@show_text_wrapped))
        ImGui.checkbox("Columns", pointerof(@@show_columns))
        ImGui.checkbox("Tab bar", pointerof(@@show_tab_bar))
        ImGui.checkbox("Child", pointerof(@@show_child))
        ImGui.checkbox("Explicit content size", pointerof(@@explicit_content_size))
        ImGui.text("Scroll %.1f/%.1f %.1f/%.1f", ImGui.get_scroll_x, ImGui.get_scroll_max_x, ImGui.get_scroll_y, ImGui.get_scroll_max_y)
        if @@explicit_content_size
          ImGui.same_line
          ImGui.set_next_item_width(100)
          ImGui.drag_float("##csx", pointerof(@@contents_size_x))
          p = ImGui.get_cursor_screen_pos
          ImGui.get_window_draw_list.add_rect_filled(p, ImGui.vec2(p.x + 10, p.y + 10), ImGui.col32(255, 255, 255))
          ImGui.get_window_draw_list.add_rect_filled(ImGui.vec2(p.x + @@contents_size_x - 10, p.y), ImGui.vec2(p.x + @@contents_size_x, p.y + 10), ImGui.col32(255, 255, 255))
          ImGui.dummy(ImGui.vec2(0, 10))
        end
        ImGui.pop_style_var(2)
        ImGui.separator
        if @@show_button
          ImGui.button("this is a 300-wide button", ImGui.vec2(300, 0))
        end
        if @@show_tree_nodes
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
        if @@show_text_wrapped
          ImGui.text_wrapped("This text should automatically wrap on the edge of the work rectangle.")
        end
        if @@show_columns
          ImGui.columns(4)
          4.times do |n|
            ImGui.text("Width %.2f", ImGui.get_column_width)
            ImGui.next_column
          end
          ImGui.columns(1)
        end
        if @@show_tab_bar && ImGui.begin_tab_bar("Hello")
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
        if @@show_child
          ImGui.begin_child("child", ImGui.vec2(0, 0), true)
          ImGui.end_child
        end
        ImGui.end
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Clipping")
      ImGui.drag_float2("size", pointerof(@@size), 0.5f32, 1.0f32, 200.0f32, "%.0f")
      ImGui.text_wrapped("(Click and drag to scroll)")

      3.times do |n|
        if n > 0
          ImGui.same_line
        end
        ImGui.push_id(n)
        ImGui.begin_group

        ImGui.invisible_button("##empty", @@size)
        if ImGui.is_item_active && ImGui.is_mouse_dragging(ImGui::ImGuiMouseButton::Left)
          @@offset.x += ImGui.get_io.mouse_delta.x
          @@offset.y += ImGui.get_io.mouse_delta.y
        end
        p0 = ImGui.get_item_rect_min
        p1 = ImGui.get_item_rect_max
        text_str = "Line 1 hello\nLine 2 clip me!"
        text_pos = ImGui.vec2(p0.x + @@offset.x, p0.y + @@offset.y)
        draw_list = ImGui.get_window_draw_list

        case n
        when 0
          help_marker(
            "Using ImGui.push_clip_rect():\n" +
            "Will alter ImGui hit-testing logic + ImDrawList rendering.\n" +
            "(use this if you want your clipping rectangle to affect interactions)")
          ImGui.push_clip_rect(p0, p1, true)
          draw_list.add_rect_filled(p0, p1, ImGui.col32(90, 90, 120, 255))
          draw_list.add_text(text_pos, ImGui.col32(255, 255, 255), text_str)
          ImGui.pop_clip_rect
          break
        when 1
          help_marker(
            "Using ImDrawList.push_clip_rect():\n" +
            "Will alter ImDrawList rendering only.\n" +
            "(use this as a shortcut if you are only using ImDrawList calls)")
          draw_list.push_clip_rect(p0, p1, true)
          draw_list.add_rect_filled(p0, p1, ImGui.col32(90, 90, 120, 255))
          draw_list.add_text(text_pos, ImGui.col32(255, 255, 255), text_str)
          draw_list.pop_clip_rect
          break
        when 2
          help_marker(
            "Using ImDrawList.add_text() with a fine ClipRect:\n" +
            "Will alter only this specific ImDrawList.add_text() rendering.\n" +
            "(this is often used internally to avoid altering the clipping rectangle and minimize draw calls)")
          clip_rect = ImGui.vec4(p0.x, p0.y, p1.x, p1.y)
          draw_list.add_rect_filled(p0, p1, ImGui.col32(90, 90, 120, 255))
          draw_list.add_text(ImGui.get_font, ImGui.get_font_size, text_pos, ImGui.col32(255, 255, 255), text_str, 0.0f32, pointerof(clip_rect))
          break
        end
        ImGui.end_group
        ImGui.pop_id
      end

      ImGui.tree_pop
    end
  end

  @@selected_fish = -1
  @@toggles = [true, false, false, false, false]
  @@value = 0.5f32
  @@name : IO::Memory = IO::Memory.new(32) << "Label1"
  @@dont_ask_me_next_time = false
  @@item_ = 1
  @@color_ = [0.4f32, 0.7f32, 0.0f32, 0.5f32]

  def self.show_demo_window_popups
    if !ImGui.collapsing_header("Popups & Modal windows")
      return
    end
    if ImGui.tree_node("Popups")
      ImGui.text_wrapped(
        "When a popup is active, it inhibits interacting with windows that are behind the popup. " +
        "Clicking outside the popup closes it.")

      names = ["Bream", "Haddock", "Mackerel", "Pollock", "Tilefish"]

      if ImGui.button("Select..")
        ImGui.open_popup("my_select_popup")
      end
      ImGui.same_line
      ImGui.text_unformatted(@@selected_fish == -1 ? "<None>" : names[@@selected_fish])
      if ImGui.begin_popup("my_select_popup")
        ImGui.text("Aquarium")
        ImGui.separator
        names.size.times do |i|
          if ImGui.selectable(names[i])
            selected_fish = i
          end
        end
        ImGui.end_popup
      end

      if ImGui.button("Toggle..")
        ImGui.open_popup("my_toggle_popup")
      end
      if ImGui.begin_popup("my_toggle_popup")
        names.size.times do |i|
          ImGui.menu_item(names[i], "", pointerof(@@toggles[i]))
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
            ImGui.menu_item(names[i], "", pointerof(@@toggles[i]))
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
        show_example_menu_file()
        ImGui.end_popup
      end

      ImGui.tree_pop
    end

    if ImGui.tree_node("Context menus")
      ImGui.text("Value = %.3f (<-- right-click here)", @@value)
      if ImGui.begin_popup_context_item("item context menu")
        if ImGui.selectable("Set to zero")
          value = 0.0f32
        end
        if ImGui.selectable("Set to PI")
          value = 3.1415f32
        end
        ImGui.set_next_item_width(-1)
        ImGui.drag_float("##Value", pointerof(@@value), 0.1f32, 0.0f32, 0.0f32)
        ImGui.end_popup
      end

      ImGui.text("(You can also right-click me to open the same popup as above.)")
      ImGui.open_popup_context_item("item context menu", ImGui::ImGuiPopupFlags::MouseButtonRight)

      ImGui.button("Button: #{@@name}###Button")
      if ImGui.begin_popup_context_item
        ImGui.text("Edit @@name:")
        ImGui.input_text("##edit", @@name)
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

      center = ImGui.vec2(ImGui.get_io.display_size.x * 0.5f32, ImGui.get_io.display_size.y * 0.5f32)
      ImGui.set_next_window_pos(center, ImGui::ImGuiCond::Appearing, ImGui.vec2(0.5f32, 0.5f32))

      if ImGui.begin_popup_modal("Delete?", flags: ImGui::ImGuiWindowFlags::AlwaysAutoResize)
        ImGui.text("All those beautiful files will be deleted.\nThis operation cannot be undone!\n\n")
        ImGui.separator

        ImGui.push_style_var(ImGui::ImGuiStyleVar::FramePadding, ImGui.vec2(0, 0))
        ImGui.checkbox("Don't ask me next time", pointerof(@@dont_ask_me_next_time))
        ImGui.pop_style_var

        if ImGui.button("OK", ImGui.vec2(120, 0))
          ImGui.close_current_popup
        end
        ImGui.set_item_default_focus
        ImGui.same_line
        if ImGui.button("Cancel", ImGui.vec2(120, 0))
          ImGui.close_current_popup
        end
        ImGui.end_popup
      end

      if ImGui.button("Stacked modals..")
        ImGui.open_popup("Stacked 1")
      end
      if ImGui.begin_popup_modal("Stacked 1", flags: ImGui::ImGuiWindowFlags::MenuBar)
        if ImGui.begin_menu_bar
          if ImGui.begin_menu("File")
            if ImGui.menu_item("Some menu item")
            end
            ImGui.end_menu
          end
          ImGui.end_menu_bar
        end
        ImGui.text("Hello from Stacked The First\nUsing style.colors[ImGui::ImGuiCol::ModalWindowDimBg] behind it.")

        ImGui.combo("Combo", pointerof(@@item_), "aaaa\0bbbb\0cccc\0dddd\0eeee\0\0")
        ImGui.color_edit4("color", @@color_.to_unsafe)

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
      ImGui.menu_item("Menu @@item_", "CTRL+M")
      if ImGui.begin_menu("Menu inside a regular window")
        show_example_menu_file()
        ImGui.end_menu
      end
      ImGui.pop_id
      ImGui.separator
      ImGui.tree_pop
    end
  end

  @@disable_indent = false
  @@selected_____ = -1
  @@h_borders = true
  @@v_borders = true
  @@columns_count = 4
  @@foo = 1.0f32
  @@bar = 1.0f32

  def self.show_demo_window_columns
    if !ImGui.collapsing_header("Columns")
      return
    end

    ImGui.push_id("Columns")

    ImGui.checkbox("Disable tree indentation", pointerof(@@disable_indent))
    ImGui.same_line
    help_marker("Disable the indenting of tree nodes so demo columns can use the full window width.")
    if @@disable_indent
      ImGui.push_style_var(ImGui::ImGuiStyleVar::IndentSpacing, 0.0f32)
    end

    if ImGui.tree_node("Basic")
      ImGui.text("Without border:")
      ImGui.columns(3, "mycolumns3", false)
      ImGui.separator
      14.times do |n|
        if ImGui.selectable("Item #{n}")
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

      3.times do |i|
        if ImGui.selectable("%04d" % i, @@selected_____ == i, ImGui::ImGuiSelectableFlags::SpanAllColumns)
          selected = i
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
      lines_count = 3
      ImGui.set_next_item_width(ImGui.get_font_size * 8)
      ImGui.drag_int("##@@columns_count", pointerof(@@columns_count), 0.1f32, 2, 10, "%d columns")
      if @@columns_count < 2
        columns_count = 2
      end
      ImGui.same_line
      ImGui.checkbox("horizontal", pointerof(@@h_borders))
      ImGui.same_line
      ImGui.checkbox("vertical", pointerof(@@v_borders))
      ImGui.columns(@@columns_count, nil, @@v_borders)
      (@@columns_count * lines_count).times do |i|
        if @@h_borders && ImGui.get_column_index == 0
          ImGui.separator
        end
        ImGui.text("%c%c%c", 'a' + i, 'a' + i, 'a' + i)
        ImGui.text("Width %.2f", ImGui.get_column_width)
        ImGui.text("Avail %.2f", ImGui.get_content_region_avail.x)
        ImGui.text("Offset %.2f", ImGui.get_column_offset)
        ImGui.text("Long text that is likely to clip")
        ImGui.button("Button", ImGui.vec2(-Float32::MIN_POSITIVE, 0.0f32))
        ImGui.next_column
      end
      ImGui.columns(1)
      if @@h_borders
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

      ImGui.input_float("red", pointerof(@@foo), 0.05f32, 0, "%.3f")
      ImGui.text("An extra line here.")
      ImGui.next_column

      ImGui.text("Sailor")
      ImGui.button("Corniflower")

      ImGui.input_float("blue", pointerof(@@bar), 0.05f32, 0, "%.3f")
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
      ImGui.set_next_window_content_size(ImGui.vec2(1500.0f32, 0.0f32))
      child_size = ImGui.vec2(0, ImGui.get_font_size * 20.0f32)
      ImGui.begin_child("##ScrollingRegion", child_size, false, ImGui::ImGuiWindowFlags::HorizontalScrollbar)
      ImGui.columns(10)
      items_count = 2000
      clipper = ImGui::ImGuiListClipper.new(items_count)
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

    if @@disable_indent
      ImGui.pop_style_var
    end
    ImGui.pop_id
  end

  @@filter = ImGui::ImGuiTextFilter.new
  @@buf_ : IO::Memory = IO::Memory.new(32) << "hello"
  @@buf__ : IO::Memory = IO::Memory.new(128) << "click on a button to set focus"
  @@f3 = [0.0f32, 0.0f32, 0.0f32]

  def self.show_demo_window_misc
    if ImGui.collapsing_header("Filtering")
      ImGui.text("Filter usage:\n" +
                 "  \"\"         display all lines\n" +
                 "  \"xxx\"      display lines containing \"xxx\"\n" +
                 "  \"xxx,yyy\"  display lines containing \"xxx\" or \"yyy\"\n" +
                 "  \"-xxx\"     hide lines containing \"xxx\"")
      @@filter.draw
      lines = ["aaa1.c", "bbb1.c", "ccc1.c", "aaa2.cpp", "bbb2.cpp", "ccc2.cpp", "abc.h", "hello, world"]
      lines.each do |line|
        if @@filter.pass_filter(line)
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
          if ImGui.is_mouse_clicked(ImGui::ImGuiMouseButton.new(i))
            ImGui.same_line
            ImGui.text("b%d", i)
          end
        end
        ImGui.text("Mouse dblclick:")
        io.mouse_down.size.times do |i|
          if ImGui.is_mouse_double_clicked(ImGui::ImGuiMouseButton.new(i))
            ImGui.same_line
            ImGui.text("b%d", i)
          end
        end
        ImGui.text("Mouse released:")
        io.mouse_down.size.times do |i|
          if ImGui.is_mouse_released(ImGui::ImGuiMouseButton.new(i))
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

        ImGui.input_text("1", @@buf_)
        ImGui.input_text("2", @@buf_)
        ImGui.input_text("3", @@buf_)
        ImGui.push_allow_keyboard_focus(false)
        ImGui.input_text("4 (tab skip)", @@buf_)

        ImGui.pop_allow_keyboard_focus
        ImGui.input_text("5", @@buf_)
        ImGui.tree_pop
      end

      if ImGui.tree_node("Focus from code")
        focus_1 = ImGui.button("Focus on 1")
        ImGui.same_line
        focus_2 = ImGui.button("Focus on 2")
        ImGui.same_line
        focus_3 = ImGui.button("Focus on 3")
        has_focus = 0

        if focus_1
          ImGui.set_keyboard_focus_here
        end
        ImGui.input_text("1", @@buf__)
        if ImGui.is_item_active
          has_focus = 1
        end

        if focus_2
          ImGui.set_keyboard_focus_here
        end
        ImGui.input_text("2", @@buf__)
        if ImGui.is_item_active
          has_focus = 2
        end

        ImGui.push_allow_keyboard_focus(false)
        if focus_3
          ImGui.set_keyboard_focus_here
        end
        ImGui.input_text("3 (tab skip)", @@buf__)
        if ImGui.is_item_active
          has_focus = 3
        end
        ImGui.pop_allow_keyboard_focus

        if has_focus
          ImGui.text("Item with focus: %d", has_focus)
        else
          ImGui.text("Item with focus: <none>")
        end

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
        ImGui.slider_float3("Float3", pointerof(@@f3[0]), 0.0f32, 1.0f32)

        ImGui.text_wrapped("NB: Cursor & selection are preserved when refocusing last used item in code.")
        ImGui.tree_pop
      end

      if ImGui.tree_node("Dragging")
        ImGui.text_wrapped("You can use ImGui.get_mouse_drag_delta(ImGui::ImGuiMouseButton::Left) to query for the dragged amount on any widget.")
        3.times do |button|
          button = ImGui::ImGuiMouseButton.new(button)
          ImGui.text("is_mouse_dragging(%d):", button)
          ImGui.text("  w/ default threshold: %d,", ImGui.is_mouse_dragging(button))
          ImGui.text("  w/ zero threshold: %d,", ImGui.is_mouse_dragging(button, 0.0f32))
          ImGui.text("  w/ large threshold: %d,", ImGui.is_mouse_dragging(button, 20.0f32))
        end

        ImGui.button("Drag Me")
        if ImGui.is_item_active
          ImGui.get_foreground_draw_list.add_line(io.mouse_clicked_pos[0], io.mouse_pos, ImGui.get_color_u32(ImGui::ImGuiCol::Button), 4.0f32)
        end

        value_raw = ImGui.get_mouse_drag_delta(ImGui::ImGuiMouseButton::Left, 0.0f32)
        value_with_lock_threshold = ImGui.get_mouse_drag_delta(ImGui::ImGuiMouseButton::Left)
        mouse_delta = io.mouse_delta
        ImGui.text("get_mouse_drag_delta(0):")
        ImGui.text("  w/ default threshold: (%.1f, %.1f)", value_with_lock_threshold.x, value_with_lock_threshold.y)
        ImGui.text("  w/ zero threshold: (%.1f, %.1f)", value_raw.x, value_raw.y)
        ImGui.text("io.mouse_delta: (%.1f, %.1f)", mouse_delta.x, mouse_delta.y)
        ImGui.tree_pop
      end

      if ImGui.tree_node("Mouse cursors")
        current = ImGui.get_mouse_cursor
        ImGui.text("Current mouse cursor = %d: %s", current.to_i, current.to_s)
        ImGui.text("Hover to see mouse cursors:")
        ImGui.same_line
        help_marker(
          "Your application can render a different mouse cursor based on what ImGui.get_mouse_cursor() returns. " +
          "If software cursor rendering (io.mouse_draw_cursor) is set ImGui will draw the right cursor for you, " +
          "otherwise your backend needs to handle it.")
        ImGui::ImGuiMouseCursor.each do |cur|
          next if cur == ImGui::ImGuiMouseCursor::None
          label = "Mouse cursor #{cur.to_i}: #{cur}"
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

  @@show_config_info = false

  def self.show_about_window(p_open = Pointer(Bool).null)
    if !ImGui.begin("About crystal-imgui", p_open, ImGui::ImGuiWindowFlags::AlwaysAutoResize)
      ImGui.end
      return
    end
    ImGui.text("Dear ImGui %s", ImGui.get_version)
    ImGui.separator
    ImGui.text("By Omar Cornut and all Dear ImGui contributors.")
    ImGui.text("Dear ImGui is licensed under the MIT License, see LICENSE for more information.")

    ImGui.checkbox("Config/Build Information", pointerof(@@show_config_info))
    if @@show_config_info
      io = ImGui.get_io
      style = ImGui.get_style

      copy_to_clipboard = ImGui.button("Copy to clipboard")
      child_size = ImGui.vec2(0, ImGui.get_text_line_height_with_spacing * 18)
      ImGui.begin_child_frame(ImGui.get_id("cfg_infos"), child_size, ImGui::ImGuiWindowFlags::NoMove)
      if copy_to_clipboard
        ImGui.log_to_clipboard
        ImGui.log_text("```\n")
      end

      ImGui.text("Dear ImGui %s", ImGui.get_version)
      ImGui.separator
      ImGui.text("sizeof(size_t): %d, sizeof(ImDrawIdx): %d, sizeof(ImDrawVert): %d", sizeof(LibC::SizeT), sizeof(ImGui::ImDrawIdx), sizeof(ImGui::ImDrawVert))
      ImGui.separator
      ImGui.text("io.backend_platform_name: %s", io.backend_platform_name ? io.backend_platform_name : "nil")
      ImGui.text("io.backend_renderer_name: %s", io.backend_renderer_name ? io.backend_renderer_name : "nil")
      ImGui.text("io.config_flags: 0x%08X", io.config_flags)
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
        ImGui.text("io.mouse_draw_cursor")
      end
      if io.config_mac_osx_behaviors
        ImGui.text("io.config_mac_osx_behaviors")
      end
      if io.config_input_text_cursor_blink
        ImGui.text("io.config_input_text_cursor_blink")
      end
      if io.config_windows_resize_from_edges
        ImGui.text("io.config_windows_resize_from_edges")
      end
      if io.config_windows_move_from_title_bar_only
        ImGui.text("io.config_windows_move_from_title_bar_only")
      end
      if io.config_windows_memory_compact_timer >= 0.0f32
        ImGui.text("io.config_windows_memory_compact_timer = %.1ff", io.config_windows_memory_compact_timer)
      end
      ImGui.text("io.backend_flags: 0x%08X", io.backend_flags)
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
      ImGui.text("io.fonts: %d fonts, Flags: 0x%08X, TexSize: %d,%d", io.fonts.fonts.size, io.fonts.flags, io.fonts.tex_width, io.fonts.tex_height)
      ImGui.text("io.display_size: %.2f,%.2f", io.display_size.x, io.display_size.y)
      ImGui.text("io.display_framebuffer_scale: %.2f,%.2f", io.display_framebuffer_scale.x, io.display_framebuffer_scale.y)
      ImGui.separator
      ImGui.text("style.window_padding: %.2f,%.2f", style.window_padding.x, style.window_padding.y)
      ImGui.text("style.window_border_size: %.2f", style.window_border_size)
      ImGui.text("style.frame_padding: %.2f,%.2f", style.frame_padding.x, style.frame_padding.y)
      ImGui.text("style.frame_rounding: %.2f", style.frame_rounding)
      ImGui.text("style.frame_border_size: %.2f", style.frame_border_size)
      ImGui.text("style.item_spacing: %.2f,%.2f", style.item_spacing.x, style.item_spacing.y)
      ImGui.text("style.item_inner_spacing: %.2f,%.2f", style.item_inner_spacing.x, style.item_inner_spacing.y)

      if copy_to_clipboard
        ImGui.log_text("\n```\n")
        ImGui.log_finish
      end
      ImGui.end_child_frame
    end
    ImGui.end
  end

  @@style_idx = -1

  def self.show_style_selector(label)
    if ImGui.combo(label, pointerof(@@style_idx), "Classic\0Dark\0Light\0")
      case @@style_idx
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
      "- Load additional fonts with io.fonts.add_font_from_file_ttf().\n" +
      "- The font atlas is built when calling io.fonts.get_tex_data_as_xxxx() or io.fonts.build().\n" +
      "- Read FAQ and docs/FONTS.md for more details.\n" +
      "- If you need to add/remove fonts at runtime (e.g. for DPI change), do it before calling new_frame().")
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
      glyph_col = ImGui.get_color_u32(ImGui::ImGuiCol::Text)
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
          cell_p1 = ImGui.vec2(base_pos.x + (n % 16) * (cell_size + cell_spacing), base_pos.y + (n / 16) * (cell_size + cell_spacing))
          cell_p2 = ImGui.vec2(cell_p1.x + cell_size, cell_p1.y + cell_size)
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
            ImGui.text("Pos: (%.2f,%.2f).(%.2f,%.2f)", glyph.x0, glyph.y0, glyph.x1, glyph.y1)
            ImGui.text("UV: (%.3f,%.3f).(%.3f,%.3f)", glyph.u0, glyph.v0, glyph.u1, glyph.v1)
            ImGui.end_tooltip
          end
        end
        ImGui.dummy(ImGui.vec2((cell_size + cell_spacing) * 16, (cell_size + cell_spacing) * 16))
        ImGui.tree_pop
      end
      ImGui.tree_pop
    end
    ImGui.tree_pop
  end

  @@ref_saved_style = ImGui::ImGuiStyle.new
  @@init = true
  @@output_dest = 0
  @@output_only_modified = true
  @@filter_ = ImGui::ImGuiTextFilter.new
  @@alpha_flags = ImGui::ImGuiColorEditFlags::None
  @@window_scale = 1.0f32

  def self.show_style_editor(ref : ImGui::ImGuiStyle? = nil)
    style = ImGui.get_style

    if @@init && ref == nil
      ref_saved_style = style
    end
    init = false
    ref ||= @@ref_saved_style

    ImGui.push_item_width(ImGui.get_window_width * 0.50f32)

    if show_style_selector("Colors##Selector")
      ref_saved_style = style
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
      ref = @@ref_saved_style = style
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

    if ImGui.begin_tab_bar("##tabs", ImGui::ImGuiTabBarFlags::None)
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
          style.window_menu_button_position = ImGui::ImGuiDir.new(window_menu_button_position - 1)
        end
        color_button_position = style.color_button_position.to_i
        if ImGui.combo("ColorButtonPosition", pointerof(color_button_position), "Left\0Right\0")
          style.color_button_position = ImGui::ImGuiDir.new(color_button_position)
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
        if ImGui.button("Export")
          if @@output_dest == 0
            ImGui.log_to_clipboard
          else
            ImGui.log_to_tty
          end
          ImGui.log_text("ImVec4* colors = ImGui::GetStyle().Colors;\n")
          ImGui::ImGuiCol.each do |col_i|
            i = col_i.to_i
            col = style.colors[i]
            name = ImGui.get_style_color_name(col_i)
            if !@@output_only_modified || col != ref.colors[i]
              ImGui.log_text("colors[ImGuiCol_%s]%*s= ImGui.vec4(%.2ff, %.2ff, %.2ff, %.2ff);\n",
                name, 23 - name.size, "", col.x, col.y, col.z, col.w)
            end
          end
          ImGui.log_finish
        end
        ImGui.same_line
        ImGui.set_next_item_width(120)
        ImGui.combo("##output_type", pointerof(@@output_dest), "To Clipboard\0To TTY\0")
        ImGui.same_line
        ImGui.checkbox("Only Modified Colors", pointerof(@@output_only_modified))

        @@filter.draw("Filter colors", ImGui.get_font_size * 16)

        if ImGui.radio_button("Opaque", @@alpha_flags == ImGui::ImGuiColorEditFlags::None)
          alpha_flags = ImGui::ImGuiColorEditFlags::None
        end
        ImGui.same_line
        if ImGui.radio_button("Alpha", @@alpha_flags == ImGui::ImGuiColorEditFlags::AlphaPreview)
          alpha_flags = ImGui::ImGuiColorEditFlags::AlphaPreview
        end
        ImGui.same_line
        if ImGui.radio_button("Both", @@alpha_flags == ImGui::ImGuiColorEditFlags::AlphaPreviewHalf)
          alpha_flags = ImGui::ImGuiColorEditFlags::AlphaPreviewHalf
        end
        ImGui.same_line
        help_marker(
          "In the color list:\n" +
          "Left-click on colored square to open color picker,\n" +
          "Right-click to open edit options menu.")

        ImGui.begin_child("##colors", ImGui.vec2(0, 0), true, ImGui::ImGuiWindowFlags::AlwaysVerticalScrollbar | ImGui::ImGuiWindowFlags::AlwaysHorizontalScrollbar | ImGui::ImGuiWindowFlags::NavFlattened)
        ImGui.push_item_width(-160)
        ImGui::ImGuiCol.each do |col_i|
          i = col_i.to_i
          name = ImGui.get_style_color_name(col_i)
          if !@@filter_.pass_filter(name)
            next
          end
          ImGui.push_id(i)
          ImGui.color_edit4("##color", pointerof(style.colors[i]), ImGui::ImGuiColorEditFlags::AlphaBar | @@alpha_flags)
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
          tint_col = ImGui.vec4(1.0f32, 1.0f32, 1.0f32, 1.0f32)
          border_col = ImGui.vec4(1.0f32, 1.0f32, 1.0f32, 0.5f32)
          ImGui.image(atlas.tex_id, ImGui.vec2(atlas.tex_width, atlas.tex_height), ImGui.vec2(0, 0), ImGui.vec2(1, 1), tint_col, border_col)
          ImGui.tree_pop
        end

        min_scale = 0.3f32
        max_scale = 2.0f32
        help_marker(
          "Those are old settings provided for convenience.\n" +
          "However, the _correct_ way of scaling your UI is currently to reload your font at the designed size, " +
          "rebuild the font atlas, and call style.scale_all_sizes() on a reference ImGuiStyle structure.\n" +
          "Using those settings here will give you poor quality results.")

        if ImGui.drag_float("window scale", pointerof(@@window_scale), 0.005f32, min_scale, max_scale, "%.2f", ImGui::ImGuiSliderFlags::ClampOnInput)
          ImGui.set_window_font_scale(@@window_scale)
        end
        ImGui.drag_float("global scale", pointerof(io.font_global_scale), 0.005f32, min_scale, max_scale, "%.2f", ImGui::ImGuiSliderFlags::ClampOnInput)
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

        ImGui.drag_float("Circle Segment Max Error", pointerof(style.circle_segment_max_error), 0.01f32, 0.10f32, 10.0f32, "%.2")
        if ImGui.is_item_active
          ImGui.set_next_window_pos(ImGui.get_cursor_screen_pos)
          ImGui.begin_tooltip
          p = ImGui.get_cursor_screen_pos
          rad_min = 10.0f32
          rad_max = 80.0f32
          off_x = 10.0f32
          7.times do |n|
            rad = rad_min + (rad_max - rad_min) * n / (7.0f32 - 1.0f32)
            ImGui.get_window_draw_list.add_circle(ImGui.vec2(p.x + off_x + rad, p.y + rad_max), rad, ImGui.get_color_u32(ImGui::ImGuiCol::Text), 0)
            off_x += 10.0f32 + rad * 2.0f32
          end
          ImGui.dummy(ImGui.vec2(off_x, rad_max * 2.0f32))
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
        show_example_menu_file()
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

  @@enabled = true
  @@f_ = 0.5f32
  @@n = 0
  @@b_ = true

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
          show_example_menu_file()
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
      ImGui.menu_item("Enabled", "", pointerof(@@enabled))
      ImGui.begin_child("child", ImGui.vec2(0, 60), true)
      10.times do |i|
        ImGui.text("Scrolling Text %d", i)
      end
      ImGui.end_child

      ImGui.slider_float("Value", pointerof(@@f_), 0.0f32, 1.0f32)
      ImGui.input_float("Input", pointerof(@@f_), 0.1f32)
      ImGui.combo("Combo", pointerof(@@n), "Yes\0No\0Maybe\0\0")
      ImGui.end_menu
    end

    if ImGui.begin_menu("Colors")
      sz = ImGui.get_text_line_height
      ImGui::ImGuiCol.values.each do |col_i|
        name = ImGui.get_style_color_name(col_i)
        p = ImGui.get_cursor_screen_pos
        ImGui.get_window_draw_list.add_rect_filled(p, ImGui.vec2(p.x + sz, p.y + sz), ImGui.get_color_u32(col_i))
        ImGui.dummy(ImGui.vec2(sz, sz))
        ImGui.same_line
        ImGui.menu_item(name)
      end
      ImGui.end_menu
    end

    if ImGui.begin_menu("Options")
      ImGui.checkbox("SomeOption", pointerof(@@b_))
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
    @input_buf = IO::Memory.new(256)
    @items = [] of String
    @commands = ["HELP", "HISTORY", "CLEAR", "CLASSIFY"]
    @history = [] of String
    @history_pos = -1
    @filter = ImGui::ImGuiTextFilter.new
    @auto_scroll = true
    @scroll_to_bottom = false

    def initialize
      add_log("Welcome to crystal-imgui!")
    end

    def stricmp(s1, s2)
      s1.upcase <=> s2.upcase
    end

    def clear_log
      @items.clear
    end

    def add_log(fmt, *args)
      @items << sprintf(fmt, *args)
    end

    def draw(title, p_open)
      ImGui.set_next_window_size(ImGui.vec2(520, 600), ImGui::ImGuiCond::FirstUseEver)
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
        clear_log()
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
      ImGui.begin_child("ScrollingRegion", ImGui.vec2(0, -footer_height_to_reserve), false, ImGui::ImGuiWindowFlags::HorizontalScrollbar)
      if ImGui.begin_popup_context_window
        if ImGui.selectable("Clear")
          clear_log()
        end
        ImGui.end_popup
      end
      ImGui.push_style_var(ImGui::ImGuiStyleVar::ItemSpacing, ImGui.vec2(4, 1))
      if copy_to_clipboard
        ImGui.log_to_clipboard
      end
      @items.each do |item|
        if !@filter.pass_filter(item)
          next
        end

        color = nil
        if item.includes?("[error]")
          color = ImGui.vec4(1.0f32, 0.4f32, 0.4f32, 1.0f32)
        elsif item.starts_with?("# ")
          color = ImGui.vec4(1.0f32, 0.8f32, 0.6f32, 1.0f32)
        end
        if color
          ImGui.push_style_color(ImGui::ImGuiCol::Text, color)
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
      input_text_flags = ImGui::ImGuiInputTextFlags::EnterReturnsTrue | ImGui::ImGuiInputTextFlags::CallbackCompletion | ImGui::ImGuiInputTextFlags::CallbackHistory
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
        if stricmp(@history[i], command_line) == 0
          @history.delete_at(i)
          break
        end
      end
      @history << command_line

      if stricmp(command_line, "CLEAR") == 0
        clear_log()
      elsif stricmp(command_line, "HELP") == 0
        add_log("Commands:")
        @commands.each do |cmd|
          add_log("- %s", cmd)
        end
      elsif stricmp(command_line, "HISTORY") == 0
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
      when ImGui::ImGuiInputTextFlags::CallbackCompletion
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
          if cmd[0, n].upcase == cmd[word_start, n].upcase == 0
            candidates << cmd
          end
        end

        if candidates.size == 0
          add_log("No match for \"%.*s\"!\n", word_end - word_start, data.buf + word_start)
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
      when ImGui::ImGuiInputTextFlags::CallbackHistory
        prev_history_pos = @history_pos
        if data.event_key == ImGui::ImGuiKey::UpArrow
          if @history_pos == -1
            @history_pos = @history.size - 1
          elsif @history_pos > 0
            @history_pos -= 1
          end
        elsif data.event_key == ImGui::ImGuiKey::DownArrow
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

  @@console = ExampleAppConsole.new

  def self.show_example_app_console(p_open = Pointer(Bool).null)
    @@console.draw("Example: Console", p_open)
  end

  class ExampleAppLog
    @buf = IO::Memory.new
    @filter = ImGui::ImGuiTextFilter.new
    @line_offsets = [0]
    @auto_scroll = true

    def clear
      @buf.clear
      @line_offsets = [0]
    end

    def add_log(fmt, *args)
      old_size = @buf.size
      @buf.printf(fmt, *args)
      (old_size...@buf.size).each do |i|
        if @buf.buffer[i] == '\n'.ord
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
      ImGui.begin_child("scrolling", ImGui.vec2(0, 0), false, ImGui::ImGuiWindowFlags::HorizontalScrollbar)

      if clear
        clear()
      end
      if copy
        ImGui.log_to_clipboard
      end

      ImGui.push_style_var(ImGui::ImGuiStyleVar::ItemSpacing, ImGui.vec2(0, 0))
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
        clipper = ImGui::ImGuiListClipper.new
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

  @@log = ExampleAppLog.new
  @@counter_ = 0

  def self.show_example_app_log(p_open = Pointer(Bool).null)
    ImGui.set_next_window_size(ImGui.vec2(500, 400), ImGui::ImGuiCond::FirstUseEver)
    ImGui.begin("Example: Log", p_open)
    if ImGui.small_button("[Debug] Add 5 entries")
      categories = ["info", "warn", "error"]
      words = ["Bumfuzzled", "Cattywampus", "Snickersnee", "Abibliophobia", "Absquatulate", "Nincompoop", "Pauciloquent"]
      5.times do |n|
        category = categories[@@counter_ % categories.size]
        word = words[@@counter_ % words.size]
        @@log.add_log("[%05d] [%s] Hello, current time is %.1f, here's a word: '%s'\n",
          ImGui.get_frame_count, category, ImGui.get_time, word)
        @@counter_ += 1
      end
    end
    ImGui.end

    @@log.draw("Example: Log", p_open)
  end

  @@selected______ = 0

  def self.show_example_app_layout(p_open = Pointer(Bool).null)
    ImGui.set_next_window_size(ImGui.vec2(500, 440), ImGui::ImGuiCond::FirstUseEver)
    if ImGui.begin("Example: Simple layout", p_open, ImGui::ImGuiWindowFlags::MenuBar)
      if ImGui.begin_menu_bar
        if ImGui.begin_menu("File")
          if ImGui.menu_item("Close")
            p_open.value = false
          end
          ImGui.end_menu
        end
        ImGui.end_menu_bar
      end

      begin
        ImGui.begin_child("left pane", ImGui.vec2(150, 0), true)
        100.times do |i|
          if ImGui.selectable("MyObject #{i}", @@selected______ == i)
            selected = i
          end
        end
        ImGui.end_child
      end
      ImGui.same_line

      begin
        ImGui.begin_group
        ImGui.begin_child("item view", ImGui.vec2(0, -ImGui.get_frame_height_with_spacing))
        ImGui.text("MyObject: %d", @@selected______)
        ImGui.separator
        if ImGui.begin_tab_bar("##Tabs", ImGui::ImGuiTabBarFlags::None)
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

  @@placeholder_members = [0.0f32, 0.0f32, 1.0f32, 3.1416f32, 100.0f32, 999.0f32]

  def self.show_placeholder_object(prefix, uid)
    ImGui.push_id(uid)
    ImGui.align_text_to_frame_padding
    node_open = ImGui.tree_node("Object", "%s_%u", prefix, uid)
    ImGui.next_column
    ImGui.align_text_to_frame_padding
    ImGui.text("my sailor is rich")
    ImGui.next_column
    if node_open
      8.times do |i|
        ImGui.push_id(i)
        if i < 2
          show_placeholder_object("Child", 424242)
        else
          ImGui.align_text_to_frame_padding
          flags = ImGui::ImGuiTreeNodeFlags::Leaf | ImGui::ImGuiTreeNodeFlags::NoTreePushOnOpen | ImGui::ImGuiTreeNodeFlags::Bullet
          ImGui.tree_node_ex("Field", flags, "Field_%d", i)
          ImGui.next_column
          ImGui.set_next_item_width(-1)
          if i >= 5
            ImGui.input_float("##value", pointerof(@@placeholder_members[i]), 1.0f32)
          else
            ImGui.drag_float("##value", pointerof(@@placeholder_members[i]), 0.01f32)
          end
          ImGui.next_column
        end
        ImGui.pop_id
      end
      ImGui.tree_pop
    end
    ImGui.pop_id
  end

  def self.show_example_app_property_editor(p_open = Pointer(Bool).null)
    ImGui.set_next_window_size(ImGui.vec2(430, 450), ImGui::ImGuiCond::FirstUseEver)
    if !ImGui.begin("Example: Property editor", p_open)
      ImGui.end
      return
    end

    help_marker(
      "This example shows how you may implement a property editor using two columns.\n" +
      "All objects/fields data are dummies here.\n" +
      "Remember that in many simple cases, you can use ImGui.same_line(xxx) to position\n" +
      "your cursor horizontally instead of using the columns() API.")

    ImGui.push_style_var(ImGui::ImGuiStyleVar::FramePadding, ImGui.vec2(2, 2))
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

  @@test_type = 0
  @@log_ = IO::Memory.new
  @@lines_ = 0

  def self.show_example_app_long_text(p_open = Pointer(Bool).null)
    ImGui.set_next_window_size(ImGui.vec2(520, 600), ImGui::ImGuiCond::FirstUseEver)
    if !ImGui.begin("Example: Long text display", p_open)
      ImGui.end
      return
    end

    ImGui.text("Printing unusually long amount of text.")
    ImGui.combo("Test type", pointerof(@@test_type),
      "Single call to text_unformatted()\0" +
      "Multiple calls to text(), clipped\0" +
      "Multiple calls to text(), not clipped (slow)\0")
    ImGui.text("Buffer contents: %d @@lines_, %d bytes", @@lines_, @@log_.size)
    if ImGui.button("Clear")
      @@log_.clear
      @@lines_ = 0
    end
    ImGui.same_line
    if ImGui.button("Add 1000 @@lines_")
      1000.times do |i|
        @@log_ << (@@lines_ + i) << " The quick brown fox jumps over the lazy dog\n"
      end
      @@lines_ += 1000
    end
    ImGui.begin_child("Log")
    case @@test_type
    when 0
      ImGui.text_unformatted(@@log_.to_slice)
    when 1
      ImGui.push_style_var(ImGui::ImGuiStyleVar::ItemSpacing, ImGui.vec2(0, 0))
      clipper = ImGui::ImGuiListClipper.new(@@lines_)
      while clipper.step
        (clipper.display_start...clipper.display_end).each do |i|
          ImGui.text("%i The quick brown fox jumps over the lazy dog", i)
        end
      end
      ImGui.pop_style_var
    when 2
      ImGui.push_style_var(ImGui::ImGuiStyleVar::ItemSpacing, ImGui.vec2(0, 0))
      @@lines_.times do |i|
        ImGui.text("%i The quick brown fox jumps over the lazy dog", i)
      end
      ImGui.pop_style_var
    end
    ImGui.end_child
    ImGui.end
  end

  @@lines__ = 10

  def self.show_example_app_auto_resize(p_open = Pointer(Bool).null)
    if !ImGui.begin("Example: Auto-resizing window", p_open, ImGui::ImGuiWindowFlags::AlwaysAutoResize)
      ImGui.end
      return
    end

    ImGui.text_unformatted(
      "Window will resize every-frame to the size of its content.\n" +
      "Note that you probably don't want to query the window size to\n" +
      "output your content because that would create a feedback loop.")
    ImGui.slider_int("Number of lines", pointerof(@@lines__), 1, 20)
    @@lines__.times do |i|
      ImGui.text("%*sThis is line %d", i * 4, "", i)
    end
    ImGui.end
  end

  @@auto_resize = false
  @@type = 0
  @@display_lines = 10

  def self.show_example_app_constrained_resize(p_open = Pointer(Bool).null)
    test_desc = [
      "Resize vertical only",
      "Resize horizontal only",
      "Width > 100, Height > 100",
      "Width 400-500",
      "Height 400-500",
      "Custom: Always Square",
      "Custom: Fixed Steps (100)",
    ]

    if @@type == 0
      ImGui.set_next_window_size_constraints(ImGui.vec2(-1, 0), ImGui.vec2(-1, Float32::MAX))
    end
    if @@type == 1
      ImGui.set_next_window_size_constraints(ImGui.vec2(0, -1), ImGui.vec2(Float32::MAX, -1))
    end
    if @@type == 2
      ImGui.set_next_window_size_constraints(ImGui.vec2(100, 100), ImGui.vec2(Float32::MAX, Float32::MAX))
    end
    if @@type == 3
      ImGui.set_next_window_size_constraints(ImGui.vec2(400, -1), ImGui.vec2(500, -1))
    end
    if @@type == 4
      ImGui.set_next_window_size_constraints(ImGui.vec2(-1, 400), ImGui.vec2(-1, 500))
    end
    if @@type == 5
      ImGui.set_next_window_size_constraints(ImGui.vec2(0, 0), ImGui.vec2(Float32::MAX, Float32::MAX)) do |data|
        data.desired_size.x = data.desired_size.y = {data.desired_size.x, data.desired_size.y}.max
      end
    end
    if @@type == 6
      step = 100
      ImGui.set_next_window_size_constraints(ImGui.vec2(0, 0), ImGui.vec2(Float32::MAX, Float32::MAX)) do |data|
        data.desired_size = ImGui.vec2((data.desired_size.x / step + 0.5f32).to_i * step, (data.desired_size.y / step + 0.5f32).to_i * step)
      end
    end

    flags = @@auto_resize ? ImGui::ImGuiWindowFlags::AlwaysAutoResize : ImGui::ImGuiWindowFlags::None
    if ImGui.begin("Example: Constrained Resize", p_open, flags)
      if ImGui.button("200x200")
        ImGui.set_window_size(ImGui.vec2(200, 200))
      end
      ImGui.same_line
      if ImGui.button("500x500")
        ImGui.set_window_size(ImGui.vec2(500, 500))
      end
      ImGui.same_line
      if ImGui.button("800x200")
        ImGui.set_window_size(ImGui.vec2(800, 200))
      end
      ImGui.set_next_item_width(200)
      ImGui.combo("Constraint", pointerof(@@type), test_desc.map(&.to_unsafe).to_unsafe, test_desc.size)
      ImGui.set_next_item_width(200)
      ImGui.drag_int("Lines", pointerof(@@display_lines), 0.2f32, 1, 100)
      ImGui.checkbox("Auto-resize", pointerof(@@auto_resize))
      @@display_lines.times do |i|
        ImGui.text("%*sHello, sailor! Making this line long enough for the example.", i * 4, "")
      end
    end
    ImGui.end
  end

  @@corner = 0

  def self.show_example_app_simple_overlay(p_open = Pointer(Bool).null)
    distance = 10.0f32

    io = ImGui.get_io
    if @@corner != -1
      window_pos = ImGui.vec2((@@corner & 1) ? io.display_size.x - distance : distance, (@@corner & 2) ? io.display_size.y - distance : distance)
      window_pos_pivot = ImGui.vec2((@@corner & 1) ? 1.0f32 : 0.0f32, (@@corner & 2) ? 1.0f32 : 0.0f32)
      ImGui.set_next_window_pos(window_pos, ImGui::ImGuiCond::Always, window_pos_pivot)
    end
    ImGui.set_next_window_bg_alpha(0.35f32)
    window_flags = ImGui::ImGuiWindowFlags::NoDecoration | ImGui::ImGuiWindowFlags::AlwaysAutoResize | ImGui::ImGuiWindowFlags::NoSavedSettings | ImGui::ImGuiWindowFlags::NoFocusOnAppearing | ImGui::ImGuiWindowFlags::NoNav
    if @@corner != -1
      window_flags |= ImGui::ImGuiWindowFlags::NoMove
    end
    if ImGui.begin("Example: Simple overlay", p_open, window_flags)
      ImGui.text("Simple overlay\n" +
                 "in the @@corner of the screen.\n" +
                 "(right-click to change position)")
      ImGui.separator
      if ImGui.is_mouse_pos_valid
        ImGui.text("Mouse Position: (%.1f,%.1f)", io.mouse_pos.x, io.mouse_pos.y)
      else
        ImGui.text("Mouse Position: <invalid>")
      end
      if ImGui.begin_popup_context_window
        if ImGui.menu_item("Custom", nil, @@corner == -1)
          corner = -1
        end
        if ImGui.menu_item("Top-left", nil, @@corner == 0)
          corner = 0
        end
        if ImGui.menu_item("Top-right", nil, @@corner == 1)
          corner = 1
        end
        if ImGui.menu_item("Bottom-left", nil, @@corner == 2)
          corner = 2
        end
        if ImGui.menu_item("Bottom-right", nil, @@corner == 3)
          corner = 3
        end
        if p_open.value && ImGui.menu_item("Close")
          p_open.value = false
        end
        ImGui.end_popup
      end
    end
    ImGui.end
  end

  def self.show_example_app_window_titles(p_open = Pointer(Bool).null)
    ImGui.set_next_window_pos(ImGui.vec2(100, 100), ImGui::ImGuiCond::FirstUseEver)
    ImGui.begin("Same title as another window##1")
    ImGui.text("This is window 1.\nMy title is the same as window 2, but my identifier is unique.")
    ImGui.end

    ImGui.set_next_window_pos(ImGui.vec2(100, 200), ImGui::ImGuiCond::FirstUseEver)
    ImGui.begin("Same title as another window##2")
    ImGui.text("This is window 2.\nMy title is the same as window 1, but my identifier is unique.")
    ImGui.end

    spin = "|/-\\"[(ImGui.get_time / 0.25f32).to_i & 3]
    ImGui.set_next_window_pos(ImGui.vec2(100, 300), ImGui::ImGuiCond::FirstUseEver)
    ImGui.begin("Animated title #{spin} #{ImGui.get_frame_count}###AnimatedTitle")
    ImGui.text("This window has a changing title.")
    ImGui.end
  end

  @@sz = 36.0f32
  @@thickness = 3.0f32
  @@ngon_sides = 6
  @@circle_segments_override = false
  @@circle_segments_override_v = 12
  @@colf = ImGui.vec4(1.0f32, 1.0f32, 0.4f32, 1.0f32)
  @@points = [] of ImGui::ImVec2
  @@opt_enable_grid = true
  @@opt_enable_context_menu = true
  @@adding_line = false
  @@draw_bg = true
  @@draw_fg = true

  def self.show_example_app_custom_rendering(p_open = Pointer(Bool).null)
    if !ImGui.begin("Example: Custom rendering", p_open)
      ImGui.end
      return
    end

    if ImGui.begin_tab_bar("##TabBar")
      if ImGui.begin_tab_item("Primitives")
        ImGui.push_item_width(-ImGui.get_font_size * 10)
        draw_list = ImGui.get_window_draw_list

        ImGui.text("Gradients")
        gradient_size = ImGui.vec2(ImGui.calc_item_width, ImGui.get_frame_height)
        begin
          p0 = ImGui.get_cursor_screen_pos
          p1 = ImGui.vec2(p0.x + gradient_size.x, p0.y + gradient_size.y)
          col_a = ImGui.get_color_u32(ImGui.col32(0, 0, 0, 255))
          col_b = ImGui.get_color_u32(ImGui.col32(255, 255, 255, 255))
          draw_list.add_rect_filled_multi_color(p0, p1, col_a, col_b, col_b, col_a)
          ImGui.invisible_button("##gradient1", gradient_size)
        end
        begin
          p0 = ImGui.get_cursor_screen_pos
          p1 = ImGui.vec2(p0.x + gradient_size.x, p0.y + gradient_size.y)
          col_a = ImGui.get_color_u32(ImGui.col32(0, 255, 0, 255))
          col_b = ImGui.get_color_u32(ImGui.col32(255, 0, 0, 255))
          draw_list.add_rect_filled_multi_color(p0, p1, col_a, col_b, col_b, col_a)
          ImGui.invisible_button("##gradient2", gradient_size)
        end

        ImGui.text("All primitives")

        ImGui.drag_float("Size", pointerof(@@sz), 0.2f32, 2.0f32, 72.0f32, "%.0f")
        ImGui.drag_float("Thickness", pointerof(@@thickness), 0.05f32, 1.0f32, 8.0f32, "%.02f")
        ImGui.slider_int("N-gon sides", pointerof(@@ngon_sides), 3, 12)
        ImGui.checkbox("##circlesegmentoverride", pointerof(@@circle_segments_override))
        ImGui.same_line(0.0f32, ImGui.get_style.item_inner_spacing.x)
        if ImGui.slider_int("Circle segments", pointerof(@@circle_segments_override_v), 3, 40)
          circle_segments_override = true
        end
        ImGui.color_edit4("Color", pointerof(@@colf))

        p = ImGui.get_cursor_screen_pos
        col = ImGui.color_convert_float4_to_u32(@@colf)
        spacing = 10.0f32
        corners_none = ImGui::ImDrawCornerFlags::None
        corners_all = ImGui::ImDrawCornerFlags::All
        corners_tl_br = ImGui::ImDrawCornerFlags::TopLeft | ImGui::ImDrawCornerFlags::BotRight
        circle_segments = @@circle_segments_override ? @@circle_segments_override_v : 0
        x = p.x + 4.0f32
        y = p.y + 4.0f32
        2.times do |n|
          th = (n == 0) ? 1.0f32 : @@thickness
          draw_list.add_ngon(ImGui.vec2(x + @@sz * 0.5f32, y + @@sz * 0.5f32), @@sz * 0.5f32, col, @@ngon_sides, th)
          x += @@sz + spacing
          draw_list.add_circle(ImGui.vec2(x + @@sz * 0.5f32, y + @@sz * 0.5f32), @@sz * 0.5f32, col, circle_segments, th)
          x += @@sz + spacing
          draw_list.add_rect(ImGui.vec2(x, y), ImGui.vec2(x + @@sz, y + @@sz), col, 0.0f32, corners_none, th)
          x += @@sz + spacing
          draw_list.add_rect(ImGui.vec2(x, y), ImGui.vec2(x + @@sz, y + @@sz), col, 10.0f32, corners_all, th)
          x += @@sz + spacing
          draw_list.add_rect(ImGui.vec2(x, y), ImGui.vec2(x + @@sz, y + @@sz), col, 10.0f32, corners_tl_br, th)
          x += @@sz + spacing
          draw_list.add_triangle(ImGui.vec2(x + @@sz * 0.5f32, y), ImGui.vec2(x + @@sz, y + @@sz - 0.5f32), ImGui.vec2(x, y + @@sz - 0.5f32), col, th)
          x += @@sz + spacing

          draw_list.add_line(ImGui.vec2(x, y), ImGui.vec2(x + @@sz, y), col, th)
          x += @@sz + spacing
          draw_list.add_line(ImGui.vec2(x, y), ImGui.vec2(x, y + @@sz), col, th)
          x += spacing
          draw_list.add_line(ImGui.vec2(x, y), ImGui.vec2(x + @@sz, y + @@sz), col, th)
          x += @@sz + spacing
          draw_list.add_bezier_curve(ImGui.vec2(x, y), ImGui.vec2(x + @@sz * 1.3f32, y + @@sz * 0.3f32), ImGui.vec2(x + @@sz - @@sz * 1.3f32, y + @@sz - @@sz * 0.3f32), ImGui.vec2(x + @@sz, y + @@sz), col, th)
          x = p.x + 4
          y += @@sz + spacing
        end
        draw_list.add_ngon_filled(ImGui.vec2(x + @@sz * 0.5f32, y + @@sz * 0.5f32), @@sz * 0.5f32, col, @@ngon_sides)
        x += @@sz + spacing
        draw_list.add_circle_filled(ImGui.vec2(x + @@sz * 0.5f32, y + @@sz * 0.5f32), @@sz * 0.5f32, col, circle_segments)
        x += @@sz + spacing
        draw_list.add_rect_filled(ImGui.vec2(x, y), ImGui.vec2(x + @@sz, y + @@sz), col)
        x += @@sz + spacing
        draw_list.add_rect_filled(ImGui.vec2(x, y), ImGui.vec2(x + @@sz, y + @@sz), col, 10.0f32)
        x += @@sz + spacing
        draw_list.add_rect_filled(ImGui.vec2(x, y), ImGui.vec2(x + @@sz, y + @@sz), col, 10.0f32, corners_tl_br)
        x += @@sz + spacing
        draw_list.add_triangle_filled(ImGui.vec2(x + @@sz * 0.5f32, y), ImGui.vec2(x + @@sz, y + @@sz - 0.5f32), ImGui.vec2(x, y + @@sz - 0.5f32), col)
        x += @@sz + spacing

        draw_list.add_rect_filled(ImGui.vec2(x, y), ImGui.vec2(x + @@sz, y + @@thickness), col)
        x += @@sz + spacing
        draw_list.add_rect_filled(ImGui.vec2(x, y), ImGui.vec2(x + @@thickness, y + @@sz), col)
        x += spacing * 2.0f32
        draw_list.add_rect_filled(ImGui.vec2(x, y), ImGui.vec2(x + 1, y + 1), col)
        x += @@sz
        draw_list.add_rect_filled_multi_color(ImGui.vec2(x, y), ImGui.vec2(x + @@sz, y + @@sz), ImGui.col32(0, 0, 0, 255), ImGui.col32(255, 0, 0, 255), ImGui.col32(255, 255, 0, 255), ImGui.col32(0, 255, 0, 255))

        ImGui.dummy(ImGui.vec2((@@sz + spacing) * 8.8f32, (@@sz + spacing) * 3.0f32))
        ImGui.pop_item_width
        ImGui.end_tab_item
      end

      if ImGui.begin_tab_item("Canvas")
        scrolling = ImGui.vec2(0.0f32, 0.0f32)

        ImGui.checkbox("Enable grid", pointerof(@@opt_enable_grid))
        ImGui.checkbox("Enable context menu", pointerof(@@opt_enable_context_menu))
        ImGui.text("Mouse Left: drag to add lines,\nMouse Right: drag to scroll, click for context menu.")
        canvas_p0 = ImGui.get_cursor_screen_pos
        canvas_sz = ImGui.get_content_region_avail
        if canvas_sz.x < 50.0f32
          canvas_sz.x = 50.0f32
        end
        if canvas_sz.y < 50.0f32
          canvas_sz.y = 50.0f32
        end
        canvas_p1 = ImGui.vec2(canvas_p0.x + canvas_sz.x, canvas_p0.y + canvas_sz.y)

        io = ImGui.get_io
        draw_list = ImGui.get_window_draw_list
        draw_list.add_rect_filled(canvas_p0, canvas_p1, ImGui.col32(50, 50, 50, 255))
        draw_list.add_rect(canvas_p0, canvas_p1, ImGui.col32(255, 255, 255, 255))

        ImGui.invisible_button("canvas", canvas_sz, ImGui::ImGuiButtonFlags::MouseButtonLeft | ImGui::ImGuiButtonFlags::MouseButtonRight)
        is_hovered = ImGui.is_item_hovered
        is_active = ImGui.is_item_active
        origin = ImGui.vec2(canvas_p0.x + scrolling.x, canvas_p0.y + scrolling.y)
        mouse_pos_in_canvas = ImGui.vec2(io.mouse_pos.x - origin.x, io.mouse_pos.y - origin.y)

        if is_hovered && !@@adding_line && ImGui.is_mouse_clicked(ImGui::ImGuiMouseButton::Left)
          @@points.push(mouse_pos_in_canvas)
          @@points.push(mouse_pos_in_canvas)
          adding_line = true
        end
        if @@adding_line
          @@points[-1] = mouse_pos_in_canvas
          if !ImGui.is_mouse_down(ImGui::ImGuiMouseButton::Left)
            adding_line = false
          end
        end
        mouse_threshold_for_pan = @@opt_enable_context_menu ? -1.0f32 : 0.0f32
        if is_active && ImGui.is_mouse_dragging(ImGui::ImGuiMouseButton::Right, mouse_threshold_for_pan)
          scrolling.x += io.mouse_delta.x
          scrolling.y += io.mouse_delta.y
        end

        drag_delta = ImGui.get_mouse_drag_delta(ImGui::ImGuiMouseButton::Right)
        if @@opt_enable_context_menu && ImGui.is_mouse_released(ImGui::ImGuiMouseButton::Right) && drag_delta.x == 0.0f32 && drag_delta.y == 0.0f32
          ImGui.open_popup_context_item("context")
        end
        if ImGui.begin_popup("context")
          if adding_line
            @@points.pop(2)
          end
          adding_line = false
          if ImGui.menu_item("Remove one", nil, false, @@points.size > 0)
            @@points.pop(2)
          end
          if ImGui.menu_item("Remove all", nil, false, @@points.size > 0)
            @@points.clear
          end
          ImGui.end_popup
        end

        draw_list.push_clip_rect(canvas_p0, canvas_p1, true)
        if @@opt_enable_grid
          grid_step = 64.0f32
          x = scrolling.x % grid_step
          while x < canvas_sz.x
            draw_list.add_line(ImGui.vec2(canvas_p0.x + x, canvas_p0.y), ImGui.vec2(canvas_p0.x + x, canvas_p1.y), ImGui.col32(200, 200, 200, 40))
            x += grid_step
          end
          y = scrolling.y % grid_step
          while y < canvas_sz.y
            draw_list.add_line(ImGui.vec2(canvas_p0.x, canvas_p0.y + y), ImGui.vec2(canvas_p1.x, canvas_p0.y + y), ImGui.col32(200, 200, 200, 40))
            y += grid_step
          end
        end
        (0...@@points.size).step(2) do |n|
          draw_list.add_line(ImGui.vec2(origin.x + @@points[n].x, origin.y + @@points[n].y), ImGui.vec2(origin.x + @@points[n + 1].x, origin.y + @@points[n + 1].y), ImGui.col32(255, 255, 0, 255), 2.0f32)
        end
        draw_list.pop_clip_rect

        ImGui.end_tab_item
      end

      if ImGui.begin_tab_item("BG/FG draw lists")
        ImGui.checkbox("Draw in Background draw list", pointerof(@@draw_bg))
        ImGui.same_line
        help_marker("The Background draw list will be rendered below every Dear ImGui windows.")
        ImGui.checkbox("Draw in Foreground draw list", pointerof(@@draw_fg))
        ImGui.same_line
        help_marker("The Foreground draw list will be rendered over every Dear ImGui windows.")
        window_pos = ImGui.get_window_pos
        window_size = ImGui.get_window_size
        window_center = ImGui.vec2(window_pos.x + window_size.x * 0.5f32, window_pos.y + window_size.y * 0.5f32)
        if @@draw_bg
          ImGui.get_background_draw_list.add_circle(window_center, window_size.x * 0.6f32, ImGui.col32(255, 0, 0, 200), 0, 10f32 + 4)
        end
        if @@draw_fg
          ImGui.get_foreground_draw_list.add_circle(window_center, window_size.y * 0.6f32, ImGui.col32(0, 255, 0, 200), 0, 10f32)
        end
        ImGui.end_tab_item
      end

      ImGui.end_tab_bar
    end

    ImGui.end
  end

  class MyDocument
    property? open, open_prev
    getter name
    property? dirty = false
    property? want_close = false
    property color

    def initialize(@name : String, @open = true, @color = ImGui.vec4(1.0f32, 1.0f32, 1.0f32, 1.0f32))
      @open_prev = open
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
      ImGui.push_style_color(ImGui::ImGuiCol::Text, doc.color)
      ImGui.text_wrapped("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
      ImGui.pop_style_color
      if ImGui.button("Modify", ImGui.vec2(100, 0))
        doc.dirty = true
      end
      ImGui.same_line
      if ImGui.button("Save", ImGui.vec2(100, 0))
        doc.do_save
      end
      ImGui.color_edit3("color", pointerof(doc.color))
      ImGui.pop_id
    end

    def self.display_context_menu(doc)
      if !ImGui.begin_popup_context_item
        return
      end

      if ImGui.menu_item("Save #{doc.name}", "CTRL+S", false, doc.open?)
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
        MyDocument.new("Lettuce", true, ImGui.vec4(0.4f32, 0.8f32, 0.4f32, 1.0f32)),
        MyDocument.new("Eggplant", true, ImGui.vec4(0.8f32, 0.5f32, 1.0f32, 1.0f32)),
        MyDocument.new("Carrot", true, ImGui.vec4(1.0f32, 0.8f32, 0.5f32, 1.0f32)),
        MyDocument.new("Tomato", false, ImGui.vec4(1.0f32, 0.3f32, 0.4f32, 1.0f32)),
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

  @@app = ExampleAppDocuments.new
  @@opt_reorderable = true
  @@opt_fitting_flags = ImGui::ImGuiTabBarFlags::FittingPolicyDefault_
  @@close_queue = [] of MyDocument

  def self.show_example_app_documents(p_open = Pointer(Bool).null)
    window_contents_visible = ImGui.begin("Example: Documents", p_open, ImGui::ImGuiWindowFlags::MenuBar)
    if !window_contents_visible
      ImGui.end
      return
    end

    if ImGui.begin_menu_bar
      if ImGui.begin_menu("File")
        open_count = 0
        @@app.documents.size.times do |doc_n|
          open_count += @@app.documents[doc_n].open? ? 1 : 0
        end

        if ImGui.begin_menu("Open", open_count < @@app.documents.size)
          @@app.documents.size.times do |doc_n|
            doc = @@app.documents[doc_n]
            if !doc.open?
              if ImGui.menu_item(doc.name)
                doc.do_open
              end
            end
          end
          ImGui.end_menu
        end
        if ImGui.menu_item("Close All Documents", nil, false, open_count > 0)
          @@app.documents.size.times do |doc_n|
            @@app.documents[doc_n].do_queue_close
          end
        end
        if ImGui.menu_item("Exit", "Alt+F4")
        end
        ImGui.end_menu
      end
      ImGui.end_menu_bar
    end

    @@app.documents.size.times do |doc_n|
      doc = @@app.documents[doc_n]
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
      tab_bar_flags = (@@opt_fitting_flags) | (@@opt_reorderable ? ImGui::ImGuiTabBarFlags::Reorderable : ImGui::ImGuiTabBarFlags::None)
      if ImGui.begin_tab_bar("##tabs", tab_bar_flags)
        if @@opt_reorderable
          notify_of_documents_closed_elsewhere(@@app)
        end

        @@app.documents.size.times do |doc_n|
          doc = @@app.documents[doc_n]
          if !doc.open?
            next
          end

          tab_flags = (doc.dirty? ? ImGui::ImGuiTabItemFlags::UnsavedDocument : ImGui::ImGuiTabItemFlags::None)
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

    if @@close_queue.empty?
      @@app.documents.size.times do |doc_n|
        doc = @@app.documents[doc_n]
        if doc.want_close?
          doc.want_close = false
          @@close_queue << doc
        end
      end
    end

    if !@@close_queue.empty?
      close_queue_unsaved_documents = 0
      @@close_queue.size.times do |n|
        if @@close_queue[n].dirty?
          close_queue_unsaved_documents += 1
        end
      end

      if close_queue_unsaved_documents == 0
        @@close_queue.size.times do |n|
          @@close_queue[n].do_force_close
        end
        @@close_queue.clear
      else
        if !ImGui.is_popup_open("Save?")
          ImGui.open_popup("Save?")
        end
        if ImGui.begin_popup_modal("Save?")
          ImGui.text("Save change to the following items?")
          ImGui.set_next_item_width(-1.0f32)
          if ImGui.list_box_header("##", close_queue_unsaved_documents, 6)
            @@close_queue.size.times do |n|
              if @@close_queue[n].dirty?
                ImGui.text("%s", @@close_queue[n].name)
              end
            end
            ImGui.list_box_footer
          end

          if ImGui.button("Yes", ImGui.vec2(80, 0))
            @@close_queue.size.times do |n|
              if @@close_queue[n].dirty?
                @@close_queue[n].do_save
              end
              @@close_queue[n].do_force_close
            end
            @@close_queue.clear
            ImGui.close_current_popup
          end
          ImGui.same_line
          if ImGui.button("No", ImGui.vec2(80, 0))
            @@close_queue.size.times do |n|
              @@close_queue[n].do_force_close
            end
            @@close_queue.clear
            ImGui.close_current_popup
          end
          ImGui.same_line
          if ImGui.button("Cancel", ImGui.vec2(80, 0))
            @@close_queue.clear
            ImGui.close_current_popup
          end
          ImGui.end_popup
        end
      end
    end

    ImGui.end
  end
end
