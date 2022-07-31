# Viewports  

Flags stored in [`ImGui::ImGuiViewport`][]::Flags, giving indications to the platform backends.  

### ::: ImGui::ImGuiViewportFlags

- `None`  

- `IsPlatformWindow`  
 Represent a Platform Window  

- `IsPlatformMonitor`  
 Represent a Platform Monitor (unused yet)  

- `OwnedByApp`  
 Platform Window: is created/managed by the application (rather than a dear imgui backend)  

- Currently represents the Platform Window created by the application which is hosting our Dear ImGui windows.
- In 'docking' branch with multi-viewport enabled, we extend this concept to have multiple active viewports.
- In the future we will extend this concept further to also represent Platform Monitor and support a "no main platform window" operation mode.
- About Main Area vs Work Area:
    - Main Area = entire viewport.
    - Work Area = entire viewport minus sections used by main menu bars (for platform windows), or by task bar (for platform monitor).
    - Windows are generally trying to stay within the Work Area of their host viewport.

### ::: ImGui::ImGuiViewport

##### ::: ImGui::ImGuiViewport.flags

 See [`ImGui::ImGuiViewportFlags`][]  

##### ::: ImGui::ImGuiViewport.pos

 Main Area: Position of the viewport (Dear ImGui coordinates are the same as OS desktop/native coordinates)  

##### ::: ImGui::ImGuiViewport.size

 Main Area: Size of the viewport.  

##### ::: ImGui::ImGuiViewport.work_pos

 Work Area: Position of the viewport minus task bars, menus bars, status bars (>= Pos)  

##### ::: ImGui::ImGuiViewport.work_size

 Work Area: Size of the viewport minus task bars, menu bars, status bars (<= Size)  

#### Platform/Backend Dependent Data  

##### ::: ImGui::ImGuiViewport.platform_handle_raw

 void* to hold lower-level, platform-native window handle (under Win32 this is expected to be a HWND, unused for other platforms)  

#### Helpers  

