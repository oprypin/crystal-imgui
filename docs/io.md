# ImGuiIO  

Communicate most settings and inputs/outputs to Dear ImGui using this structure.  
Access via [`ImGui.get_io`][]. Read 'Programmer guide' section in .cpp file for general usage.  

[Internal] Storage used by [`ImGui.is_key_down`][], [`ImGui.is_key_pressed`][] etc functions.  
If prior to 1.87 you used io.KeysDownDuration[] (which was marked as internal), you should use GetKeyData(key)->DownDuration and not io.KeysData[key]->DownDuration.  

### ::: ImGui::ImGuiKeyData

##### ::: ImGui::ImGuiKeyData.down

 True for if key is down  

##### ::: ImGui::ImGuiKeyData.down_duration

 Duration the key has been down (<0.0f: not pressed, 0.0f: just pressed, >0.0f: time held)  

##### ::: ImGui::ImGuiKeyData.down_duration_prev

 Last frame duration the key has been down  

##### ::: ImGui::ImGuiKeyData.analog_value

 0.0f..1.0f for gamepad values  

### ::: ImGui::ImGuiIO

#### Configuration                            // Default value  

##### ::: ImGui::ImGuiIO.config_flags

 = 0              // See [`ImGui::ImGuiConfigFlags`][] enum. Set by user/application. Gamepad/keyboard navigation options, etc.  

##### ::: ImGui::ImGuiIO.backend_flags

 = 0              // See [`ImGui::ImGuiBackendFlags`][] enum. Set by backend (imgui_impl_xxx files or custom backend) to communicate features supported by the backend.  

##### ::: ImGui::ImGuiIO.display_size

 <unset>          // Main display size, in pixels (generally == [`ImGui.get_main_viewport`][]->Size). May change every frame.  

##### ::: ImGui::ImGuiIO.delta_time

 = 1.0f/60.0f     // Time elapsed since last frame, in seconds. May change every frame.  

##### ::: ImGui::ImGuiIO.ini_saving_rate

 = 5.0f           // Minimum time between saving positions/sizes to .ini file, in seconds.  

##### ::: ImGui::ImGuiIO.ini_filename

 = "imgui.ini"    // Path to .ini file (important: default "imgui.ini" is relative to current working dir!). Set NULL to disable automatic .ini loading/saving or if you want to manually call LoadIniSettingsXXX() / SaveIniSettingsXXX() functions.  

##### ::: ImGui::ImGuiIO.log_filename

 = "imgui_log.txt"// Path to .log file (default parameter to [`ImGui.log_to_file`][] when no file is specified).  

##### ::: ImGui::ImGuiIO.mouse_double_click_time

 = 0.30f          // Time for a double-click, in seconds.  

##### ::: ImGui::ImGuiIO.mouse_double_click_max_dist

 = 6.0f           // Distance threshold to stay in to validate a double-click, in pixels.  

##### ::: ImGui::ImGuiIO.mouse_drag_threshold

 = 6.0f           // Distance threshold before considering we are dragging.  

##### ::: ImGui::ImGuiIO.key_repeat_delay

 = 0.250f         // When holding a key/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).  

##### ::: ImGui::ImGuiIO.key_repeat_rate

 = 0.050f         // When holding a key/button, rate at which it repeats, in seconds.  

##### ::: ImGui::ImGuiIO.user_data

 = NULL           // Store your own data for retrieval by callbacks.  

##### ::: ImGui::ImGuiIO.fonts

 <auto>           // Font atlas: load, rasterize and pack one or more fonts into a single texture.  

##### ::: ImGui::ImGuiIO.font_global_scale

 = 1.0f           // Global scale all fonts  

##### ::: ImGui::ImGuiIO.font_allow_user_scaling

 = false          // Allow user scaling text of individual window with CTRL+Wheel.  

##### ::: ImGui::ImGuiIO.font_default

 = NULL           // Font to use on [`ImGui.new_frame`][]. Use NULL to uses Fonts->Fonts[0].  

##### ::: ImGui::ImGuiIO.display_framebuffer_scale

 = (1, 1)         // For retina display or other situations where window coordinates are different from framebuffer coordinates. This generally ends up in [`ImGui::ImDrawData`][]::FramebufferScale.  

#### Miscellaneous options  

##### ::: ImGui::ImGuiIO.mouse_draw_cursor

 = false          // Request ImGui to draw a mouse cursor for you (if you are on a platform without a mouse cursor). Cannot be easily renamed to 'io.ConfigXXX' because this is frequently used by backend implementations.  

##### ::: ImGui::ImGuiIO.config_mac_osx_behaviors

 = defined(__APPLE__) // OS X style: [`ImGui.text`][] editing cursor movement using Alt instead of Ctrl, Shortcuts using Cmd/Super instead of Ctrl, Line/[`ImGui.text`][] Start and [`ImGui.end`][] using Cmd+Arrows instead of Home/[`ImGui.end`][], Double click selects by word instead of selecting whole text, Multi-selection in lists uses Cmd/Super instead of Ctrl.  

##### ::: ImGui::ImGuiIO.config_input_trickle_event_queue

 = true           // Enable input queue trickling: some types of events submitted during the same frame (e.g. button down + up) will be spread over multiple frames, improving interactions with low framerates.  

##### ::: ImGui::ImGuiIO.config_input_text_cursor_blink

 = true           // Enable blinking cursor (optional as some users consider it to be distracting).  

##### ::: ImGui::ImGuiIO.config_drag_click_to_input_text

 = false          // [BETA] Enable turning DragXXX widgets into text input with a simple mouse click-release (without moving). Not desirable on devices without a keyboard.  

##### ::: ImGui::ImGuiIO.config_windows_resize_from_edges

 = true           // Enable resizing of windows from their edges and from the lower-left corner. This requires (io.BackendFlags & ImGuiBackendFlags_HasMouseCursors) because it needs mouse cursor feedback. (This used to be a per-window ImGuiWindowFlags_ResizeFromAnySide flag)  

##### ::: ImGui::ImGuiIO.config_windows_move_from_title_bar_only

 = false       // Enable allowing to move windows only when clicking on their title bar. Does not apply to windows without a title bar.  

##### ::: ImGui::ImGuiIO.config_memory_compact_timer

 = 60.0f          // Timer (in seconds) to free transient windows/tables memory buffers when unused. Set to -1.0f to disable.  

#### Platform Functions  
(the imgui_impl_xxxx backend files are setting those up for you)  

Optional: Platform/Renderer backend name (informational only! will be displayed in About Window) + User data for backend/wrappers to store their own stuff.  

##### ::: ImGui::ImGuiIO.backend_platform_name

 = NULL  

##### ::: ImGui::ImGuiIO.backend_renderer_name

 = NULL  

##### ::: ImGui::ImGuiIO.backend_platform_user_data

 = NULL           // User data for platform backend  

##### ::: ImGui::ImGuiIO.backend_renderer_user_data

 = NULL           // User data for renderer backend  

##### ::: ImGui::ImGuiIO.backend_language_user_data

 = NULL           // User data for non C++ programming language backend  

#### Optional: Access OS clipboard  
(default to use native Win32 clipboard on Windows, otherwise uses a private clipboard. Override to access OS clipboard on other architectures)  

##### ::: ImGui::ImGuiIO.clipboard_user_data

Optional: Notify OS Input Method Editor of the screen position of your cursor for text input position (e.g. when using Japanese/Chinese IME on Windows)  
(default to use native imm32 api on Windows)  

 = NULL           // [Obsolete] Set [`ImGui::ImGuiViewport`][]::PlatformHandleRaw instead. Set this to your HWND to get automatic IME cursor positioning.  

 Unused field to keep data structure the same size.  

#### Input - Call before calling [`ImGui.new_frame`][]  

#### Input Functions  
 Queue a new key down/up event. Key should be "translated" (as in, generally ImGuiKey_A matches the key end-user would use to emit an 'A' character)  
 Queue a new key down/up event for analog values (e.g. ImGuiKey_Gamepad_ values). Dead-zones should be handled by the backend.  
 Queue a mouse position update. Use -FLT_MAX,-FLT_MAX to signify no mouse (e.g. app not focused and not hovered)  
 Queue a mouse button change  
 Queue a mouse wheel update  
 Queue a gain/loss of focus for the application (generally based on OS/platform focus of your window)  
 Queue a new character input  
 Queue a new character input from an UTF-16 character, it can be a surrogate  
 Queue a new characters input from an UTF-8 string  

 [Optional] Specify index for legacy <1.87 IsKeyXXX() functions with native indices + specify native keycode, scancode.  
 Set master flag for accepting key/mouse/text events (default to true). Useful if you have native dialog boxes that are interrupting your application loop/refresh, and you want to disable events being queued while your app is frozen.  
 [Internal] Clear the text input buffer manually  
 [Internal] Release all keys  

#### Output - Updated by [`ImGui.new_frame`][] or [`ImGui.end_frame`][]/[`ImGui.render`][]  
(when reading from the io.WantCaptureMouse, io.WantCaptureKeyboard flags to dispatch your inputs, it is  
 generally easier and more correct to use their state BEFORE calling [`ImGui.new_frame`][]. See FAQ for details!)

##### ::: ImGui::ImGuiIO.want_capture_mouse

 Set when Dear ImGui will use mouse inputs, in this case do not dispatch them to your main game/application (either way, always pass on mouse inputs to imgui). (e.g. unclicked mouse is hovering over an imgui window, widget is active, mouse was clicked over an imgui window, etc.).  

##### ::: ImGui::ImGuiIO.want_capture_keyboard

 Set when Dear ImGui will use keyboard inputs, in this case do not dispatch them to your main game/application (either way, always pass keyboard inputs to imgui). (e.g. [`ImGui.input_text`][] active, or an imgui window is focused and navigation is enabled, etc.).  

##### ::: ImGui::ImGuiIO.want_text_input

 Mobile/console: when set, you may display an on-screen keyboard. This is set by Dear ImGui when it wants textual keyboard input to happen (e.g. when a [`ImGui.input_text`][] widget is active).  

##### ::: ImGui::ImGuiIO.want_set_mouse_pos

 MousePos has been altered, backend should reposition mouse on next frame. Rarely used! Set only when ImGuiConfigFlags_NavEnableSetMousePos flag is enabled.  

##### ::: ImGui::ImGuiIO.want_save_ini_settings

 When manual .ini load/save is active (io.IniFilename == NULL), this will be set to notify your application that you can call [`ImGui.save_ini_settings_to_memory`][] and save yourself. Important: clear io.WantSaveIniSettings yourself after saving!  

##### ::: ImGui::ImGuiIO.nav_active

 Keyboard/Gamepad navigation is currently allowed (will handle ImGuiKey_NavXXX events) = a window is focused and it doesn't use the ImGuiWindowFlags_NoNavInputs flag.  

##### ::: ImGui::ImGuiIO.nav_visible

 Keyboard/Gamepad navigation is visible and allowed (will handle ImGuiKey_NavXXX events).  

##### ::: ImGui::ImGuiIO.framerate

 Rough estimate of application framerate, in frame per second. Solely for convenience. Rolling average estimation based on io.DeltaTime over 120 frames.  

##### ::: ImGui::ImGuiIO.metrics_render_vertices

 Vertices output during last call to [`ImGui.render`][]  

##### ::: ImGui::ImGuiIO.metrics_render_indices

 Indices output during last call to [`ImGui.render`][] = number of triangles * 3  

##### ::: ImGui::ImGuiIO.metrics_render_windows

 Number of visible windows  

##### ::: ImGui::ImGuiIO.metrics_active_windows

 Number of active windows  

##### ::: ImGui::ImGuiIO.metrics_active_allocations

 Number of active allocations, updated by [`ImGui.mem_alloc`][]/[`ImGui.mem_free`][] based on current context. May be off if you have multiple imgui contexts.  

##### ::: ImGui::ImGuiIO.mouse_delta

 Mouse delta. Note that this is zero if either current or previous position are invalid (-FLT_MAX,-FLT_MAX), so a disappearing/reappearing mouse won't have a huge delta.  

Legacy: before 1.87, we required backend to fill io.KeyMap[] (imgui->native map) during initialization and io.KeysDown[] (native indices) every frame.  
This is still temporarily supported as a legacy feature. However the new preferred scheme is for backend to call io.AddKeyEvent().  

##### ::: ImGui::ImGuiIO.key_map

 [LEGACY] Input: map of indices into the KeysDown[512] entries array which represent your "native" keyboard state. The first 512 are now unused and should be kept zero. Legacy backend will write into KeyMap[] using [`ImGui::ImGuiKey`][] indices which are always >512.  

##### ::: ImGui::ImGuiIO.keys_down

 [LEGACY] Input: Keyboard keys that are pressed (ideally left in the "native" order your engine has access to keyboard keys, so you can use your own defines/enums for keys). This used to be [512] sized. It is now ImGuiKey_COUNT to allow legacy io.KeysDown[[`ImGui.get_key_index`][](...)] to work without an overflow.  

[Internal] Dear ImGui will maintain those fields. Forward compatibility not guaranteed!  

#### Main Input State  
(this block used to be written by backend, since 1.87 it is best to NOT write to those directly, call the AddXXX functions above instead)  
(reading from those variables is fair game, as they are extremely unlikely to be moving anywhere)  

##### ::: ImGui::ImGuiIO.mouse_pos

 Mouse position, in pixels. Set to [`ImGui::ImVec2`][](-FLT_MAX, -FLT_MAX) if mouse is unavailable (on another screen, etc.)  

##### ::: ImGui::ImGuiIO.mouse_down

 Mouse buttons: 0=left, 1=right, 2=middle + extras (ImGuiMouseButton_COUNT == 5). Dear ImGui mostly uses left and right buttons. Others buttons allows us to track if the mouse is being used by your application + available to user as a convenience via IsMouse** API.  

##### ::: ImGui::ImGuiIO.mouse_wheel

 Mouse wheel Vertical: 1 unit scrolls about 5 lines text.  

##### ::: ImGui::ImGuiIO.mouse_wheel_h

 Mouse wheel Horizontal. Most users don't have a mouse with an horizontal wheel, may not be filled by all backends.  

##### ::: ImGui::ImGuiIO.key_ctrl

 Keyboard modifier down: Control  

##### ::: ImGui::ImGuiIO.key_shift

 Keyboard modifier down: Shift  

##### ::: ImGui::ImGuiIO.key_alt

 Keyboard modifier down: Alt  

##### ::: ImGui::ImGuiIO.key_super

 Keyboard modifier down: Cmd/Super/Windows  

##### ::: ImGui::ImGuiIO.nav_inputs

 Gamepad inputs. Cleared back to zero by [`ImGui.end_frame`][]. Keyboard keys will be auto-mapped and be written here by [`ImGui.new_frame`][].  

#### Other state maintained from data above + IO function calls  

##### ::: ImGui::ImGuiIO.key_mods

 Key mods flags (same as io.KeyCtrl/KeyShift/KeyAlt/KeySuper but merged into flags), updated by [`ImGui.new_frame`][]  

##### ::: ImGui::ImGuiIO.keys_data

 Key state for all known keys. Use IsKeyXXX() functions to access this.  

##### ::: ImGui::ImGuiIO.want_capture_mouse_unless_popup_close

 Alternative to WantCaptureMouse: (WantCaptureMouse == true && WantCaptureMouseUnlessPopupClose == false) when a click over void is expected to close a popup.  

##### ::: ImGui::ImGuiIO.mouse_pos_prev

 Previous mouse position (note that MouseDelta is not necessary == MousePos-MousePosPrev, in case either position is invalid)  

##### ::: ImGui::ImGuiIO.mouse_clicked_pos

 Position at time of clicking  

##### ::: ImGui::ImGuiIO.mouse_clicked_time

 Time of last click (used to figure out double-click)  

##### ::: ImGui::ImGuiIO.mouse_clicked

 Mouse button went from !Down to Down (same as MouseClickedCount[x] != 0)  

##### ::: ImGui::ImGuiIO.mouse_double_clicked

 Has mouse button been double-clicked? (same as MouseClickedCount[x] == 2)  

##### ::: ImGui::ImGuiIO.mouse_clicked_count

 == 0 (not clicked), == 1 (same as MouseClicked[]), == 2 (double-clicked), == 3 (triple-clicked) etc. when going from !Down to Down  

##### ::: ImGui::ImGuiIO.mouse_clicked_last_count

 Count successive number of clicks. Stays valid after mouse release. Reset after another click is done.  

##### ::: ImGui::ImGuiIO.mouse_released

 Mouse button went from Down to !Down  

##### ::: ImGui::ImGuiIO.mouse_down_owned

 Track if button was clicked inside a dear imgui window or over void blocked by a popup. We don't request mouse capture from the application if click started outside ImGui bounds.  

##### ::: ImGui::ImGuiIO.mouse_down_owned_unless_popup_close

 Track if button was clicked inside a dear imgui window.  

##### ::: ImGui::ImGuiIO.mouse_down_duration

 Duration the mouse button has been down (0.0f == just clicked)  

##### ::: ImGui::ImGuiIO.mouse_down_duration_prev

 Previous time the mouse button has been down  

##### ::: ImGui::ImGuiIO.mouse_drag_max_distance_sqr

 Squared maximum distance of how much mouse has traveled from the clicking point (used for moving thresholds)  

##### ::: ImGui::ImGuiIO.nav_inputs_down_duration

##### ::: ImGui::ImGuiIO.nav_inputs_down_duration_prev

##### ::: ImGui::ImGuiIO.pen_pressure

 Touch/Pen pressure (0.0f to 1.0f, should be >0.0f only when MouseDown[0] == true). Helper storage currently unused by Dear ImGui.  

##### ::: ImGui::ImGuiIO.app_focus_lost

 Only modify via AddFocusEvent()  

##### ::: ImGui::ImGuiIO.app_accepting_events

 Only modify via SetAppAcceptingEvents()  

##### ::: ImGui::ImGuiIO.backend_using_legacy_key_arrays

 -1: unknown, 0: using AddKeyEvent(), 1: using legacy io.KeysDown[]

##### ::: ImGui::ImGuiIO.backend_using_legacy_nav_input_array

 0: using AddKeyAnalogEvent(), 1: writing to legacy io.NavInputs[] directly  

##### ::: ImGui::ImGuiIO.input_queue_surrogate

 For AddInputCharacterUTF16()  

##### ::: ImGui::ImGuiIO.input_queue_characters

 Queue of _characters_ input (obtained by platform backend). Fill using AddInputCharacter() helper.  

