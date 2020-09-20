require "../src/imgui"

ImGui.debug_check_version_and_data_layout(
  ImGui.get_version, *{
  sizeof(LibImGui::ImGuiIO), sizeof(LibImGui::ImGuiStyle), sizeof(ImGui::ImVec2),
  sizeof(ImGui::ImVec4), sizeof(ImGui::ImDrawVert), sizeof(ImGui::ImDrawIdx),
}.map &->LibC::SizeT.new(Int32)
)
puts "CreateContext() - v#{ImGui.get_version}"
ImGui.create_context

io : ImGui::ImGuiIO = ImGui.get_io
text_pixels, text_w, text_h = io.fonts.get_tex_data_as_rgba32

f = 0f32

20.times do |n|
  puts "NewFrame() #{n}"

  io.display_size = ImGui::ImVec2.new(1920, 1080)
  io.delta_time = 1f32 / 60
  ImGui.new_frame

  ImGui.text("Hello World!")
  ImGui.slider_float("float", pointerof(f), 0.0f32, 1.0f32)
  ImGui.text("Application average %.3f ms/frame (%.1f FPS)", 1000.0f32 / io.framerate, io.framerate)
  ImGui.show_demo_window

  ImGui.render
end

puts "DestroyContext()"
ImGui.destroy_context
