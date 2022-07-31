# Drawing API (ImDrawCmd, ImDrawIdx, ImDrawVert, ImDrawChannel, ImDrawListSplitter, ImDrawListFlags, ImDrawList, ImDrawData)  
Hold a series of drawing commands. The user provides a renderer for [`ImGui::ImDrawData`][] which essentially contains an array of [`ImGui::ImDrawList`][].  

The maximum line width to bake anti-aliased textures for. Build atlas with ImFontAtlasFlags_NoBakedLines to disable baking.  

ImDrawCallback: Draw callbacks for advanced uses [configurable type: override in imconfig.h]  
NB: You most likely do NOT need to use draw callbacks just to create your own widget or customized UI rendering,  
you can poke into the draw list for that! Draw callback may be useful for example to:  
 A) Change your GPU render state,
 B) render a complex 3D scene inside a UI element without an intermediate texture/render target, etc.

The expected behavior from your rendering function is 'if (cmd.UserCallback != NULL) { cmd.UserCallback(parent_list, cmd); } else { RenderTriangles() }'  
If you want to override the signature of ImDrawCallback, you can simply use e.g. '#define ImDrawCallback MyDrawCallback' (in imconfig.h) + update rendering backend accordingly.  

Special Draw callback value to request renderer backend to reset the graphics/render state.  
The renderer backend needs to handle this special value, otherwise it will crash trying to call a function at this address.  
This is useful for example if you submitted callbacks which you know have altered the render state and you want it to be restored.  
It is not done by default because they are many perfectly useful way of altering render state for imgui contents (e.g. changing shader/blending settings before an [`ImGui.image`][] call).  

## Typically, 1 command = 1 GPU draw call (unless command is a callback)  

- VtxOffset: When 'io.BackendFlags & ImGuiBackendFlags_RendererHasVtxOffset' is enabled,
  this fields allow us to render meshes larger than 64K vertices while keeping 16-bit indices.
  Backends made for <1.71. will typically ignore the VtxOffset fields.
- The ClipRect/TextureId/VtxOffset fields must be contiguous as we memcmp() them together (this is asserted for).

### ::: ImGui::ImDrawCmd

##### ::: ImGui::ImDrawCmd.clip_rect

 4*4  // Clipping rectangle (x1, y1, x2, y2). Subtract [`ImGui::ImDrawData`][]->DisplayPos to get clipping rectangle in "viewport" coordinates  

##### ::: ImGui::ImDrawCmd.texture_id

 4-8  // User-provided texture ID. Set by user in ImfontAtlas::SetTexID() for fonts or passed to [`ImGui.image`][]*() functions. Ignore if never using images or multiple fonts atlas.  

##### ::: ImGui::ImDrawCmd.vtx_offset

 4    // Start offset in vertex buffer. ImGuiBackendFlags_RendererHasVtxOffset: always 0, otherwise may be >0 to support meshes larger than 64K vertices with 16-bit indices.  

##### ::: ImGui::ImDrawCmd.idx_offset

 4    // Start offset in index buffer.  

##### ::: ImGui::ImDrawCmd.elem_count

 4    // Number of indices (multiple of 3) to be rendered as triangles. Vertices are stored in the callee [`ImGui::ImDrawList`][]'s vtx_buffer[] array, indices in idx_buffer[].  

##### ::: ImGui::ImDrawCmd.user_callback

 4-8  // If != NULL, call the function instead of rendering the vertices. clip_rect and texture_id will be set normally.  

##### ::: ImGui::ImDrawCmd.user_callback_data

 4-8  // The draw callback code can access this.  

 Also ensure our padding fields are zeroed  

Since 1.83: returns ImTextureID associated with this draw call. Warning: DO NOT assume this is always same as 'TextureId' (we will change this function for an upcoming feature)  

## Vertex layout  

### ::: ImGui::ImDrawVert

##### ::: ImGui::ImDrawVert.pos

##### ::: ImGui::ImDrawVert.uv

##### ::: ImGui::ImDrawVert.col

You can override the vertex format layout by defining IMGUI_OVERRIDE_DRAWVERT_STRUCT_LAYOUT in imconfig.h  
The code expect [`ImGui::ImVec2`][] pos (8 bytes), [`ImGui::ImVec2`][] uv (8 bytes), ImU32 col (4 bytes), but you can re-order them or add other fields as needed to simplify integration in your engine.  
The type has to be described within the macro (you can either declare the struct or use a typedef). This is because [`ImGui::ImVec2`][]/ImU32 are likely not declared a the time you'd want to set your type up.  
NOTE: IMGUI DOESN'T CLEAR THE STRUCTURE AND DOESN'T CALL A CONSTRUCTOR SO ANY CUSTOM FIELD WILL BE UNINITIALIZED. IF YOU ADD EXTRA FIELDS (SUCH AS A 'Z' COORDINATES) YOU WILL NEED TO CLEAR THEM DURING RENDER OR TO IGNORE THEM.  

## [Internal] For use by [`ImGui::ImDrawList`][]  

### ::: ImGui::ImDrawCmdHeader

##### ::: ImGui::ImDrawCmdHeader.clip_rect

##### ::: ImGui::ImDrawCmdHeader.texture_id

##### ::: ImGui::ImDrawCmdHeader.vtx_offset

## [Internal] For use by [`ImGui::ImDrawListSplitter`][]  

### ::: ImGui::ImDrawChannel

Split/Merge functions are used to split the draw list into different layers which can be drawn into out of order.  
This is used by the [`ImGui.columns`][]/Tables API, so items of each column can be batched together in a same draw call.  

### ::: ImGui::ImDrawListSplitter

 Current channel number (0)  
 Number of active channels (1+)  
 Draw channels (not resized down so _Count might be < Channels.Size)  

 Do not clear Channels[] so our allocations are reused next frame  

## Flags for [`ImGui::ImDrawList`][] functions  
(Legacy: bit 0 must always correspond to ImDrawFlags_Closed to be backward compatible with old API using a bool. Bits 1..3 must be unused)  

### ::: ImGui::ImDrawFlags

- `None`  

- `Closed`  
 PathStroke(), AddPolyline(): specify that shape should be closed (Important: this is always == 1 for legacy reason)  

- `RoundCornersTopLeft`  
 AddRect(), AddRectFilled(), PathRect(): enable rounding top-left corner only (when rounding > 0.0f, we default to all corners). Was 0x01.  

- `RoundCornersTopRight`  
 AddRect(), AddRectFilled(), PathRect(): enable rounding top-right corner only (when rounding > 0.0f, we default to all corners). Was 0x02.  

- `RoundCornersBottomLeft`  
 AddRect(), AddRectFilled(), PathRect(): enable rounding bottom-left corner only (when rounding > 0.0f, we default to all corners). Was 0x04.  

- `RoundCornersBottomRight`  
 AddRect(), AddRectFilled(), PathRect(): enable rounding bottom-right corner only (when rounding > 0.0f, we default to all corners). Wax 0x08.  

- `RoundCornersNone`  
 AddRect(), AddRectFilled(), PathRect(): disable rounding on all corners (when rounding > 0.0f). This is NOT zero, NOT an implicit flag!  

- `RoundCornersTopLeft`, `RoundCornersTopRight`, `RoundCornersTop`  

- `RoundCornersBottomLeft`, `RoundCornersBottomRight`, `RoundCornersBottom`  

- `RoundCornersTopLeft`, `RoundCornersBottomLeft`, `RoundCornersLeft`  

- `RoundCornersTopRight`, `RoundCornersBottomRight`, `RoundCornersRight`  

- `RoundCornersTopLeft`, `RoundCornersTopRight`, `RoundCornersBottomLeft`, `RoundCornersBottomRight`, `RoundCornersAll`  

- `RoundCornersAll`, `RoundCornersDefault_`  
 Default to ALL corners if none of the _RoundCornersXX flags are specified.  

- `RoundCornersNone`, `RoundCornersAll`, `RoundCornersMask_`  

Flags for [`ImGui::ImDrawList`][] instance. Those are set automatically by ImGui:: functions from [`ImGui::ImGuiIO`][] settings, and generally not manipulated directly.  
It is however possible to temporarily alter flags between calls to [`ImGui::ImDrawList`][]:: functions.  

### ::: ImGui::ImDrawListFlags

- `None`  

- `AntiAliasedLines`  
 Enable anti-aliased lines/borders (*2 the number of triangles for 1.0f wide line or lines thin enough to be drawn using textures, otherwise *3 the number of triangles)  

- `AntiAliasedLinesUseTex`  
 Enable anti-aliased lines/borders using textures when possible. Require backend to render with bilinear filtering (NOT point/nearest filtering).  

- `AntiAliasedFill`  
 Enable anti-aliased edge around filled shapes (rounded rectangles, circles).  

- `AllowVtxOffset`  
 Can emit 'VtxOffset > 0' to allow large meshes. Set when 'ImGuiBackendFlags_RendererHasVtxOffset' is enabled.  

## Draw command list  
This is the low-level list of polygons that ImGui:: functions are filling. At the end of the frame,  
all command lists are passed to your [`ImGui::ImGuiIO`][]::RenderDrawListFn function for rendering.  
Each dear imgui window contains its own [`ImGui::ImDrawList`][]. You can use [`ImGui.get_window_draw_list`][] to  
access the current window draw list and draw custom primitives.  
You can interleave normal ImGui:: calls and adding primitives to the current draw list.  
In single viewport mode, top-left is == [`ImGui.get_main_viewport`][]->Pos (generally 0,0), bottom-right is == [`ImGui.get_main_viewport`][]->Pos+Size (generally io.DisplaySize).  
You are totally free to apply whatever transformation matrix to want to the data (depending on the use of the transformation you may want to apply it to ClipRect as well!)  
Important: Primitives are always added to the list and not culled (culling is done at higher-level by ImGui:: functions), if you use this API a lot consider coarse culling your drawn objects.  

### ::: ImGui::ImDrawList

#### This is what you have to render  

##### ::: ImGui::ImDrawList.cmd_buffer

 Draw commands. Typically 1 command = 1 GPU draw call, unless the command is a callback.  

##### ::: ImGui::ImDrawList.idx_buffer

 Index buffer. Each command consume [`ImGui::ImDrawCmd`][]::ElemCount of those  

##### ::: ImGui::ImDrawList.vtx_buffer

 Vertex buffer.  

##### ::: ImGui::ImDrawList.flags

 Flags, you may poke into these to adjust anti-aliasing settings per-primitive.  

#### [Internal, used while building lists]  
 [Internal] generally == VtxBuffer.Size unless we are past 64K vertices, in which case this gets reset to 0.  
 Pointer to shared draw data (you can use [`ImGui.get_draw_list_shared_data`][] to get the one from current ImGui context)  
 Pointer to owner window's name for debugging  
 [Internal] point within VtxBuffer.Data after each add command (to avoid using the [`ImGui::ImVector`][]<> operators too much)  
 [Internal] point within IdxBuffer.Data after each add command (to avoid using the [`ImGui::ImVector`][]<> operators too much)  
 [Internal]  
 [Internal]  
 [Internal] current path building  
 [Internal] template of active commands. Fields should match those of CmdBuffer.back().  
 [Internal] for channels api (note: prefer using your own persistent instance of [`ImGui::ImDrawListSplitter`][]!)  
 [Internal] anti-alias fringe is scaled by this value, this helps to keep things sharp while zooming at vertex buffer content  

#### If you want to create [`ImGui::ImDrawList`][] instances, pass them [`ImGui.get_draw_list_shared_data`][] or create and use your own ImDrawListSharedData (so you can use [`ImGui::ImDrawList`][] without ImGui)  

 [`ImGui.render`][]-level scissoring. This is passed down to your render function but not used for CPU-side coarse clipping. Prefer using higher-level [`ImGui.push_clip_rect`][] to affect logic (hit-testing and widget culling)  

#### Primitives  

- Filled shapes must always use clockwise winding order. The anti-aliasing fringe depends on it. Counter-clockwise shapes will have "inward" anti-aliasing.
- For rectangular primitives, "p_min" and "p_max" represent the upper-left and lower-right corners.
- For circle primitives, use "num_segments == 0" to automatically calculate tessellation (preferred).
  In older versions (until Dear ImGui 1.77) the AddCircle functions defaulted to num_segments == 12.
  In future versions we will use textures to provide cheaper and higher-quality circles.
  Use AddNgon() and AddNgonFilled() functions if you need to guaranteed a specific number of sides.

 a: upper-left, b: lower-right (== upper-left + size)  
 a: upper-left, b: lower-right (== upper-left + size)  

 Cubic Bezier (4 control points)  
 Quadratic Bezier (3 control points)  

#### [`ImGui.image`][] primitives  

- Read FAQ to understand what ImTextureID is.
- "p_min" and "p_max" represent the upper-left and lower-right corners of the rectangle.
- "uv_min" and "uv_max" represent the normalized texture coordinates to use for those corners. Using (0,0)->(1,1) texture coordinates will generally display the entire texture.

#### Stateful path API, add points then finish with PathFillConvex() or PathStroke()  

- Filled shapes must always use clockwise winding order. The anti-aliasing fringe depends on it. Counter-clockwise shapes will have "inward" anti-aliasing.

 Use precomputed angles for a 12 steps circle  
 Cubic Bezier (4 control points)  
 Quadratic Bezier (3 control points)  

#### Advanced  
 Your rendering function must check for 'UserCallback' in [`ImGui::ImDrawCmd`][] and call the function instead of rendering triangles.  
 This is useful if you need to forcefully create a new draw call (to allow for dependent rendering / blending). Otherwise primitives are merged into the same draw-call as much as possible  
 Create a clone of the CmdBuffer/IdxBuffer/VtxBuffer.  

#### Advanced: Channels  

- Use to split render into layers. By switching channels to can render out-of-order (e.g. submit FG primitives before BG primitives)
- Use to minimize draw calls (e.g. if going back-and-forth between multiple clipping rectangles, prefer to append into separate channels then merge at the end)
- FIXME-OBSOLETE: This API shouldn't have been in [`ImGui::ImDrawList`][] in the first place!
  Prefer using your own persistent instance of [`ImGui::ImDrawListSplitter`][] as you can stack them.
  Using the [`ImGui::ImDrawList`][]::ChannelsXXXX you cannot stack a split over another.

#### Advanced: Primitives allocations  

- We render triangles (three vertices)
- All primitives needs to be reserved via PrimReserve() beforehand.

 Axis aligned rectangle (composed of two triangles)  

 Write vertex with unique index  

 OBSOLETED in 1.80 (Jan 2021)  
 OBSOLETED in 1.80 (Jan 2021)  

#### [Internal helpers]  

## All draw data to render a Dear ImGui frame  
(NB: the style and the naming convention here is a little inconsistent, we currently preserve them for backward compatibility purpose,  
as this is one of the oldest structure exposed by the library! Basically, [`ImGui::ImDrawList`][] == CmdList)  

### ::: ImGui::ImDrawData

##### ::: ImGui::ImDrawData.valid

 Only valid after [`ImGui.render`][] is called and before the next [`ImGui.new_frame`][] is called.  

##### ::: ImGui::ImDrawData.cmd_lists_count

 Number of [`ImGui::ImDrawList`][]* to render  

##### ::: ImGui::ImDrawData.total_idx_count

 For convenience, sum of all [`ImGui::ImDrawList`][]'s IdxBuffer.Size  

##### ::: ImGui::ImDrawData.total_vtx_count

 For convenience, sum of all [`ImGui::ImDrawList`][]'s VtxBuffer.Size  

##### ::: ImGui::ImDrawData.cmd_lists

 Array of [`ImGui::ImDrawList`][]* to render. The [`ImGui::ImDrawList`][] are owned by ImGuiContext and only pointed to from here.  

##### ::: ImGui::ImDrawData.display_pos

 Top-left position of the viewport to render (== top-left of the orthogonal projection matrix to use) (== [`ImGui.get_main_viewport`][]->Pos for the main viewport, == (0.0) in most single-viewport applications)  

##### ::: ImGui::ImDrawData.display_size

 Size of the viewport to render (== [`ImGui.get_main_viewport`][]->Size for the main viewport, == io.DisplaySize in most single-viewport applications)  

##### ::: ImGui::ImDrawData.framebuffer_scale

 Amount of pixels for each unit of DisplaySize. Based on io.DisplayFramebufferScale. Generally (1,1) on normal display, (2,2) on OSX with Retina display.  

#### Functions  

 The [`ImGui::ImDrawList`][] are owned by ImGuiContext!  
 Helper to convert all buffers from indexed to non-indexed, in case you cannot render indexed. Note: this is slow and most likely a waste of resources. Always prefer indexed rendering!  
 Helper to scale the ClipRect field of each [`ImGui::ImDrawCmd`][]. Use if your final output buffer is at a different scale than Dear ImGui expects, or if there is a difference between your window resolution and framebuffer resolution.  

