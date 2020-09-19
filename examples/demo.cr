require "crsfml"
require "../src/imgui"  # require "imgui"
require "../src/demo"   # require "imgui/demo"
require "imgui-sfml"

title = "Side-by-side: Dear ImGui Demo + crystal-imgui reimplementation"
window = SF::RenderWindow.new(SF::VideoMode.new(1280, 720), title)
window.framerate_limit = 60
ImGui::SFML.init(window)

io = ImGui.get_io
if File.file?(font_path = "/usr/share/fonts/droid/DroidSansJapanese.ttf")
  font_config = ImGui::ImFontConfig.new.tap { |c| c.merge_mode = true}
  io.fonts.add_font_from_file_ttf(font_path, 18, font_config, io.fonts.get_glyph_ranges_japanese)
  io.fonts.build
  ImGui::SFML.update_font_texture
end

delta_clock = SF::Clock.new
while window.open?
  while (event = window.poll_event)
    ImGui::SFML.process_event(event)
    window.close if event.is_a? SF::Event::Closed
  end

  ImGui::SFML.update(window, delta_clock.restart)

  ImGui.show_demo_window
  ImGuiDemo.show_demo_window

  window.clear
  ImGui::SFML.render(window)
  window.display
end

ImGui::SFML.shutdown
