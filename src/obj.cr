require "./lib"

module ImGui
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1927)]
  struct ImColor
    include StructType

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1941)]
    def hsv(h : Float32, s : Float32, v : Float32, a : Float32 = 1.0) : ImGui::ImColor
      LibImGui.ImColor_HSV(out p_out, h, s, v, a)
      p_out
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1931)]
    def self.new : ImColor
      result = LibImGui.ImColor_ImColorNil
      result.value
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1932)]
    def self.new(r : Int32, g : Int32, b : Int32, a : Int32 = 255) : ImColor
      result = LibImGui.ImColor_ImColorInt(r, g, b, a)
      result.value
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1933)]
    def self.new(rgba : UInt32) : ImColor
      result = LibImGui.ImColor_ImColorU32(rgba)
      result.value
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1934)]
    def self.new(r : Float32, g : Float32, b : Float32, a : Float32 = 1.0) : ImColor
      result = LibImGui.ImColor_ImColorFloat(r, g, b, a)
      result.value
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1935)]
    def self.new(col : ImVec4) : ImColor
      result = LibImGui.ImColor_ImColorVec4(col)
      result.value
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1940)]
    def set_hsv(h : Float32, s : Float32, v : Float32, a : Float32 = 1.0) : Void
      LibImGui.ImColor_SetHSV(self, h, s, v, a)
    end
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2013)]
  struct ImDrawChannel
    include StructType
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1976)]
  struct ImDrawCmd
    include ClassType(LibImGui::ImDrawCmd)

    # 4*4
    # Clipping rectangle (x1, y1, x2, y2). Subtract ImDrawData->DisplayPos to get clipping rectangle in "viewport" coordinates
    def clip_rect : ImVec4
      @this.value.clip_rect
    end

    def clip_rect=(clip_rect : ImVec4)
      @this.value.clip_rect = clip_rect
    end

    # 4-8
    # User-provided texture ID. Set by user in ImfontAtlas::SetTexID() for fonts or passed to Image*() functions. Ignore if never using images or multiple fonts atlas.
    def texture_id : ImTextureID
      @this.value.texture_id
    end

    def texture_id=(texture_id : ImTextureID)
      @this.value.texture_id = texture_id
    end

    # 4
    # Start offset in vertex buffer. ImGuiBackendFlags_RendererHasVtxOffset: always 0, otherwise may be >0 to support meshes larger than 64K vertices with 16-bit indices.
    def vtx_offset : UInt32
      @this.value.vtx_offset
    end

    def vtx_offset=(vtx_offset : UInt32)
      @this.value.vtx_offset = vtx_offset
    end

    # 4
    # Start offset in index buffer. Always equal to sum of ElemCount drawn so far.
    def idx_offset : UInt32
      @this.value.idx_offset
    end

    def idx_offset=(idx_offset : UInt32)
      @this.value.idx_offset = idx_offset
    end

    # 4
    # Number of indices (multiple of 3) to be rendered as triangles. Vertices are stored in the callee ImDrawList's vtx_buffer[] array, indices in idx_buffer[].
    def elem_count : UInt32
      @this.value.elem_count
    end

    def elem_count=(elem_count : UInt32)
      @this.value.elem_count = elem_count
    end

    # 4-8
    # If != NULL, call the function instead of rendering the vertices. clip_rect and texture_id will be set normally.
    def user_callback : ImDrawCallback
      @this.value.user_callback
    end

    def user_callback=(user_callback : ImDrawCallback)
      @this.value.user_callback = user_callback
    end

    # 4-8
    # The draw callback code can access this.
    def user_callback_data : Void*
      @this.value.user_callback_data
    end

    def user_callback_data=(user_callback_data : Void*)
      @this.value.user_callback_data = user_callback_data
    end

    # Also ensure our padding fields are zeroed
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1986)]
    def self.new : ImDrawCmd
      result = LibImGui.ImDrawCmd_ImDrawCmd
      ImDrawCmd.new(result)
    end
  end

  alias TopLevel::ImDrawCmd = ImGui::ImDrawCmd

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2183)]
  struct ImDrawData
    include ClassType(LibImGui::ImDrawData)

    # Only valid after Render() is called and before the next NewFrame() is called.
    def valid : Bool
      @this.value.valid
    end

    def valid=(valid : Bool)
      @this.value.valid = valid
    end

    # Array of ImDrawList* to render. The ImDrawList are owned by ImGuiContext and only pointed to from here.
    def cmd_lists : Slice(ImDrawList)
      Slice.new(@this.value.cmd_lists_count.to_i) { |i| ImDrawList.new(@this.value.cmd_lists + i) }
    end

    def cmd_lists=(cmd_lists : Slice(ImDrawList))
      @this.value.cmd_lists, @this.value.cmd_lists_count = cmd_lists.to_unsafe, cmd_lists.bytesize
    end

    # Number of ImDrawList* to render
    def cmd_lists_count : Int32
      @this.value.cmd_lists_count
    end

    def cmd_lists_count=(cmd_lists_count : Int32)
      @this.value.cmd_lists_count = cmd_lists_count
    end

    # For convenience, sum of all ImDrawList's IdxBuffer.Size
    def total_idx_count : Int32
      @this.value.total_idx_count
    end

    def total_idx_count=(total_idx_count : Int32)
      @this.value.total_idx_count = total_idx_count
    end

    # For convenience, sum of all ImDrawList's VtxBuffer.Size
    def total_vtx_count : Int32
      @this.value.total_vtx_count
    end

    def total_vtx_count=(total_vtx_count : Int32)
      @this.value.total_vtx_count = total_vtx_count
    end

    # Upper-left position of the viewport to render (== upper-left of the orthogonal projection matrix to use)
    def display_pos : ImVec2
      @this.value.display_pos
    end

    def display_pos=(display_pos : ImVec2)
      @this.value.display_pos = display_pos
    end

    # Size of the viewport to render (== io.DisplaySize for the main viewport) (DisplayPos + DisplaySize == lower-right of the orthogonal projection matrix to use)
    def display_size : ImVec2
      @this.value.display_size
    end

    def display_size=(display_size : ImVec2)
      @this.value.display_size = display_size
    end

    # Amount of pixels for each unit of DisplaySize. Based on io.DisplayFramebufferScale. Generally (1,1) on normal display, (2,2) on OSX with Retina display.
    def framebuffer_scale : ImVec2
      @this.value.framebuffer_scale
    end

    def framebuffer_scale=(framebuffer_scale : ImVec2)
      @this.value.framebuffer_scale = framebuffer_scale
    end

    # The ImDrawList are owned by ImGuiContext!
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2197)]
    def clear : Void
      LibImGui.ImDrawData_Clear(self)
    end

    # Helper to convert all buffers from indexed to non-indexed, in case you cannot render indexed. Note: this is slow and most likely a waste of resources. Always prefer indexed rendering!
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2198)]
    def de_index_all_buffers : Void
      LibImGui.ImDrawData_DeIndexAllBuffers(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2195)]
    def self.new : ImDrawData
      result = LibImGui.ImDrawData_ImDrawData
      ImDrawData.new(result)
    end

    # Helper to scale the ClipRect field of each ImDrawCmd. Use if your final output buffer is at a different scale than Dear ImGui expects, or if there is a difference between your window resolution and framebuffer resolution.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2199)]
    def scale_clip_rects(fb_scale : ImVec2) : Void
      LibImGui.ImDrawData_ScaleClipRects(self, fb_scale)
    end
  end

  alias TopLevel::ImDrawData = ImGui::ImDrawData

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2069)]
  struct ImDrawList
    include ClassType(LibImGui::ImDrawList)

    # Draw commands. Typically 1 command = 1 GPU draw call, unless the command is a callback.
    def cmd_buffer : ImVector(LibImGui::ImDrawCmd)
      t = @this.value.cmd_buffer
      pointerof(t).as(ImVector(LibImGui::ImDrawCmd)*).value
    end

    def cmd_buffer=(cmd_buffer : ImVector(LibImGui::ImDrawCmd))
      @this.value.cmd_buffer = cmd_buffer.as(LibImGui::ImVectorInternal*).value
    end

    # Index buffer. Each command consume ImDrawCmd::ElemCount of those
    def idx_buffer : ImVector(ImDrawIdx)
      t = @this.value.idx_buffer
      pointerof(t).as(ImVector(ImDrawIdx)*).value
    end

    def idx_buffer=(idx_buffer : ImVector(ImDrawIdx))
      @this.value.idx_buffer = idx_buffer.as(LibImGui::ImVectorInternal*).value
    end

    # Vertex buffer.
    def vtx_buffer : ImVector(ImDrawVert)
      t = @this.value.vtx_buffer
      pointerof(t).as(ImVector(ImDrawVert)*).value
    end

    def vtx_buffer=(vtx_buffer : ImVector(ImDrawVert))
      @this.value.vtx_buffer = vtx_buffer.as(LibImGui::ImVectorInternal*).value
    end

    # Flags, you may poke into these to adjust anti-aliasing settings per-primitive.
    def flags : ImDrawListFlags
      @this.value.flags
    end

    def flags=(flags : ImDrawListFlags)
      @this.value.flags = flags
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2123)]
    def add_bezier_curve(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32, thickness : Float32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_AddBezierCurve(self, p1, p2, p3, p4, col, thickness, num_segments)
    end

    # Your rendering function must check for 'UserCallback' in ImDrawCmd and call the function instead of rendering triangles.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2145)]
    def add_callback(callback : ImDrawCallback, callback_data : Void*) : Void
      LibImGui.ImDrawList_AddCallback(self, callback, callback_data)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2115)]
    def add_circle(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32 = 0, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddCircle(self, center, radius, col, num_segments, thickness)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2116)]
    def add_circle_filled(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_AddCircleFilled(self, center, radius, col, num_segments)
    end

    # Note: Anti-aliased filling requires points to be in clockwise order.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2122)]
    def add_convex_poly_filled(points : ImVec2*, num_points : Int32, col : UInt32) : Void
      LibImGui.ImDrawList_AddConvexPolyFilled(self, points, num_points, col)
    end

    # This is useful if you need to forcefully create a new draw call (to allow for dependent rendering / blending). Otherwise primitives are merged into the same draw-call as much as possible
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2146)]
    def add_draw_cmd : Void
      LibImGui.ImDrawList_AddDrawCmd(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2129)]
    def add_image(user_texture_id : ImTextureID, p_min : ImVec2, p_max : ImVec2, uv_min : ImVec2 = ImVec2.new(0, 0), uv_max : ImVec2 = ImVec2.new(1, 1), col : UInt32 = 4294967295) : Void
      LibImGui.ImDrawList_AddImage(self, user_texture_id, p_min, p_max, uv_min, uv_max, col)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2130)]
    def add_image_quad(user_texture_id : ImTextureID, p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, uv1 : ImVec2 = ImVec2.new(0, 0), uv2 : ImVec2 = ImVec2.new(1, 0), uv3 : ImVec2 = ImVec2.new(1, 1), uv4 : ImVec2 = ImVec2.new(0, 1), col : UInt32 = 4294967295) : Void
      LibImGui.ImDrawList_AddImageQuad(self, user_texture_id, p1, p2, p3, p4, uv1, uv2, uv3, uv4, col)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2131)]
    def add_image_rounded(user_texture_id : ImTextureID, p_min : ImVec2, p_max : ImVec2, uv_min : ImVec2, uv_max : ImVec2, col : UInt32, rounding : Float32, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags::All) : Void
      LibImGui.ImDrawList_AddImageRounded(self, user_texture_id, p_min, p_max, uv_min, uv_max, col, rounding, rounding_corners)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2107)]
    def add_line(p1 : ImVec2, p2 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddLine(self, p1, p2, col, thickness)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2117)]
    def add_ngon(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddNgon(self, center, radius, col, num_segments, thickness)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2118)]
    def add_ngon_filled(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32) : Void
      LibImGui.ImDrawList_AddNgonFilled(self, center, radius, col, num_segments)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2121)]
    def add_polyline(points : ImVec2*, num_points : Int32, col : UInt32, closed : Bool, thickness : Float32) : Void
      LibImGui.ImDrawList_AddPolyline(self, points, num_points, col, closed, thickness)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2111)]
    def add_quad(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddQuad(self, p1, p2, p3, p4, col, thickness)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2112)]
    def add_quad_filled(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_AddQuadFilled(self, p1, p2, p3, p4, col)
    end

    # a: upper-left, b: lower-right (== upper-left + size), rounding_corners_flags: 4 bits corresponding to which corner to round
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2108)]
    def add_rect(p_min : ImVec2, p_max : ImVec2, col : UInt32, rounding : Float32 = 0.0, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags::All, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddRect(self, p_min, p_max, col, rounding, rounding_corners, thickness)
    end

    # a: upper-left, b: lower-right (== upper-left + size)
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2109)]
    def add_rect_filled(p_min : ImVec2, p_max : ImVec2, col : UInt32, rounding : Float32 = 0.0, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags::All) : Void
      LibImGui.ImDrawList_AddRectFilled(self, p_min, p_max, col, rounding, rounding_corners)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2110)]
    def add_rect_filled_multi_color(p_min : ImVec2, p_max : ImVec2, col_upr_left : UInt32, col_upr_right : UInt32, col_bot_right : UInt32, col_bot_left : UInt32) : Void
      LibImGui.ImDrawList_AddRectFilledMultiColor(self, p_min, p_max, col_upr_left, col_upr_right, col_bot_right, col_bot_left)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2119)]
    def add_text(pos : ImVec2, col : UInt32, text : Bytes | String) : Void
      LibImGui.ImDrawList_AddTextVec2(self, pos, col, text, (text.to_unsafe + text.bytesize))
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2120)]
    def add_text(font : ImFont, font_size : Float32, pos : ImVec2, col : UInt32, text : Bytes | String, wrap_width : Float32 = 0.0, cpu_fine_clip_rect : ImVec4* = Pointer(ImVec4).null) : Void
      LibImGui.ImDrawList_AddTextFontPtr(self, font, font_size, pos, col, text, (text.to_unsafe + text.bytesize), wrap_width, cpu_fine_clip_rect)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2113)]
    def add_triangle(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddTriangle(self, p1, p2, p3, col, thickness)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2114)]
    def add_triangle_filled(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_AddTriangleFilled(self, p1, p2, p3, col)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2156)]
    def channels_merge : Void
      LibImGui.ImDrawList_ChannelsMerge(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2157)]
    def channels_set_current(n : Int32) : Void
      LibImGui.ImDrawList_ChannelsSetCurrent(self, n)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2155)]
    def channels_split(count : Int32) : Void
      LibImGui.ImDrawList_ChannelsSplit(self, count)
    end

    # Create a clone of the CmdBuffer/IdxBuffer/VtxBuffer.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2147)]
    def clone_output : ImDrawList
      result = LibImGui.ImDrawList_CloneOutput(self)
      ImDrawList.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2099)]
    def get_clip_rect_max : ImGui::ImVec2
      LibImGui.ImDrawList_GetClipRectMax(out p_out, self)
      p_out
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2098)]
    def get_clip_rect_min : ImGui::ImVec2
      LibImGui.ImDrawList_GetClipRectMin(out p_out, self)
      p_out
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2090)]
    def self.new(shared_data : ImDrawListSharedData) : ImDrawList
      result = LibImGui.ImDrawList_ImDrawList(shared_data)
      ImDrawList.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2139)]
    def path_arc_to(center : ImVec2, radius : Float32, a_min : Float32, a_max : Float32, num_segments : Int32 = 10) : Void
      LibImGui.ImDrawList_PathArcTo(self, center, radius, a_min, a_max, num_segments)
    end

    # Use precomputed angles for a 12 steps circle
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2140)]
    def path_arc_to_fast(center : ImVec2, radius : Float32, a_min_of_12 : Int32, a_max_of_12 : Int32) : Void
      LibImGui.ImDrawList_PathArcToFast(self, center, radius, a_min_of_12, a_max_of_12)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2141)]
    def path_bezier_curve_to(p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_PathBezierCurveTo(self, p2, p3, p4, num_segments)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2134)]
    def path_clear : Void
      LibImGui.ImDrawList_PathClear(self)
    end

    # Note: Anti-aliased filling requires points to be in clockwise order.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2137)]
    def path_fill_convex(col : UInt32) : Void
      LibImGui.ImDrawList_PathFillConvex(self, col)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2135)]
    def path_line_to(pos : ImVec2) : Void
      LibImGui.ImDrawList_PathLineTo(self, pos)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2136)]
    def path_line_to_merge_duplicate(pos : ImVec2) : Void
      LibImGui.ImDrawList_PathLineToMergeDuplicate(self, pos)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2142)]
    def path_rect(rect_min : ImVec2, rect_max : ImVec2, rounding : Float32 = 0.0, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags::All) : Void
      LibImGui.ImDrawList_PathRect(self, rect_min, rect_max, rounding, rounding_corners)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2138)]
    def path_stroke(col : UInt32, closed : Bool, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_PathStroke(self, col, closed, thickness)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2095)]
    def pop_clip_rect : Void
      LibImGui.ImDrawList_PopClipRect(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2097)]
    def pop_texture_id : Void
      LibImGui.ImDrawList_PopTextureID(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2166)]
    def prim_quad_uv(a : ImVec2, b : ImVec2, c : ImVec2, d : ImVec2, uv_a : ImVec2, uv_b : ImVec2, uv_c : ImVec2, uv_d : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimQuadUV(self, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col)
    end

    # Axis aligned rectangle (composed of two triangles)
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2164)]
    def prim_rect(a : ImVec2, b : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimRect(self, a, b, col)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2165)]
    def prim_rect_uv(a : ImVec2, b : ImVec2, uv_a : ImVec2, uv_b : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimRectUV(self, a, b, uv_a, uv_b, col)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2162)]
    def prim_reserve(idx_count : Int32, vtx_count : Int32) : Void
      LibImGui.ImDrawList_PrimReserve(self, idx_count, vtx_count)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2163)]
    def prim_unreserve(idx_count : Int32, vtx_count : Int32) : Void
      LibImGui.ImDrawList_PrimUnreserve(self, idx_count, vtx_count)
    end

    # Write vertex with unique index
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2169)]
    def prim_vtx(pos : ImVec2, uv : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimVtx(self, pos, uv, col)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2168)]
    def prim_write_idx(idx : ImDrawIdx) : Void
      LibImGui.ImDrawList_PrimWriteIdx(self, idx)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2167)]
    def prim_write_vtx(pos : ImVec2, uv : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimWriteVtx(self, pos, uv, col)
    end

    # Render-level scissoring. This is passed down to your render function but not used for CPU-side coarse clipping. Prefer using higher-level ImGui::PushClipRect() to affect logic (hit-testing and widget culling)
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2093)]
    def push_clip_rect(clip_rect_min : ImVec2, clip_rect_max : ImVec2, intersect_with_current_clip_rect : Bool = false) : Void
      LibImGui.ImDrawList_PushClipRect(self, clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2094)]
    def push_clip_rect_full_screen : Void
      LibImGui.ImDrawList_PushClipRectFullScreen(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2096)]
    def push_texture_id(texture_id : ImTextureID) : Void
      LibImGui.ImDrawList_PushTextureID(self, texture_id)
    end
  end

  alias TopLevel::ImDrawList = ImGui::ImDrawList

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2021)]
  class ImDrawListSplitter
    include ClassType(LibImGui::ImDrawListSplitter)

    # Do not clear Channels[] so our allocations are reused next frame
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2029)]
    def clear : Void
      LibImGui.ImDrawListSplitter_Clear(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2030)]
    def clear_free_memory : Void
      LibImGui.ImDrawListSplitter_ClearFreeMemory(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2027)]
    def self.new : ImDrawListSplitter
      result = LibImGui.ImDrawListSplitter_ImDrawListSplitter
      ImDrawListSplitter.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2032)]
    def merge(draw_list : ImDrawList) : Void
      LibImGui.ImDrawListSplitter_Merge(self, draw_list)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2033)]
    def set_current_channel(draw_list : ImDrawList, channel_idx : Int32) : Void
      LibImGui.ImDrawListSplitter_SetCurrentChannel(self, draw_list, channel_idx)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2031)]
    def split(draw_list : ImDrawList, count : Int32) : Void
      LibImGui.ImDrawListSplitter_Split(self, draw_list, count)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2028)]
    def finalize : Void
      LibImGui.ImDrawListSplitter_destroy(self)
    end
  end

  alias TopLevel::ImDrawListSplitter = ImGui::ImDrawListSplitter

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1998)]
  struct ImDrawVert
    include StructType
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2394)]
  struct ImFont
    include ClassType(LibImGui::ImFont)

    # 12-16
    # out
    # Sparse. Glyphs->AdvanceX in a directly indexable way (cache-friendly for CalcTextSize functions which only this this info, and are often bottleneck in large UI).
    def index_advance_x : ImVector(Float32)
      t = @this.value.index_advance_x
      pointerof(t).as(ImVector(Float32)*).value
    end

    def index_advance_x=(index_advance_x : ImVector(Float32))
      @this.value.index_advance_x = index_advance_x.as(LibImGui::ImVectorInternal*).value
    end

    # 4
    # out
    # = FallbackGlyph->AdvanceX
    def fallback_advance_x : Float32
      @this.value.fallback_advance_x
    end

    def fallback_advance_x=(fallback_advance_x : Float32)
      @this.value.fallback_advance_x = fallback_advance_x
    end

    # 4
    # in
    # Height of characters/line, set during loading (don't change after loading)
    def font_size : Float32
      @this.value.font_size
    end

    def font_size=(font_size : Float32)
      @this.value.font_size = font_size
    end

    # 12-16
    # out
    # Sparse. Index glyphs by Unicode code-point.
    def index_lookup : ImVector(ImWchar)
      t = @this.value.index_lookup
      pointerof(t).as(ImVector(ImWchar)*).value
    end

    def index_lookup=(index_lookup : ImVector(ImWchar))
      @this.value.index_lookup = index_lookup.as(LibImGui::ImVectorInternal*).value
    end

    # 12-16
    # out
    # All glyphs.
    def glyphs : ImVector(ImFontGlyph)
      t = @this.value.glyphs
      pointerof(t).as(ImVector(ImFontGlyph)*).value
    end

    def glyphs=(glyphs : ImVector(ImFontGlyph))
      @this.value.glyphs = glyphs.as(LibImGui::ImVectorInternal*).value
    end

    # 4-8
    # out
    # = FindGlyph(FontFallbackChar)
    def fallback_glyph : ImFontGlyph?
      (v = @this.value.fallback_glyph) ? v.value : nil
    end

    def fallback_glyph=(fallback_glyph : ImFontGlyph?)
      @this.value.fallback_glyph = fallback_glyph
    end

    # 8
    # in
    # = (0,0)
    # Offset font rendering by xx pixels
    def display_offset : ImVec2
      @this.value.display_offset
    end

    def display_offset=(display_offset : ImVec2)
      @this.value.display_offset = display_offset
    end

    # 4-8
    # out
    # What we has been loaded into
    def container_atlas : ImFontAtlas
      ImFontAtlas.new(@this.value.container_atlas)
    end

    def container_atlas=(container_atlas : ImFontAtlas)
      @this.value.container_atlas = container_atlas
    end

    # 4-8
    # in
    # Pointer within ContainerAtlas->ConfigData
    def config_data : Slice(ImFontConfig)
      Slice.new(@this.value.config_data_count.to_i) { |i| ImFontConfig.new(@this.value.config_data + i) }
    end

    def config_data=(config_data : Slice(ImFontConfig))
      @this.value.config_data, @this.value.config_data_count = config_data.to_unsafe, config_data.bytesize
    end

    # 2
    # in
    # ~ 1
    # Number of ImFontConfig involved in creating this font. Bigger than 1 when merging multiple font sources into one ImFont.
    def config_data_count : Int16
      @this.value.config_data_count
    end

    def config_data_count=(config_data_count : Int16)
      @this.value.config_data_count = config_data_count
    end

    # 2
    # in
    # = '?'
    # Replacement character if a glyph isn't found. Only set via SetFallbackChar()
    def fallback_char : ImWchar
      @this.value.fallback_char
    end

    def fallback_char=(fallback_char : ImWchar)
      @this.value.fallback_char = fallback_char
    end

    # 2
    # out
    # = -1
    # Character used for ellipsis rendering.
    def ellipsis_char : ImWchar
      @this.value.ellipsis_char
    end

    def ellipsis_char=(ellipsis_char : ImWchar)
      @this.value.ellipsis_char = ellipsis_char
    end

    # 1
    # out //
    def dirty_lookup_tables : Bool
      @this.value.dirty_lookup_tables
    end

    def dirty_lookup_tables=(dirty_lookup_tables : Bool)
      @this.value.dirty_lookup_tables = dirty_lookup_tables
    end

    # 4
    # in
    # = 1.f
    # Base font scale, multiplied by the per-window font scale which you can adjust with SetWindowFontScale()
    def scale : Float32
      @this.value.scale
    end

    def scale=(scale : Float32)
      @this.value.scale = scale
    end

    # 4+4
    # out
    # Ascent: distance from top to bottom of e.g. 'A' [0..FontSize]
    def ascent : Float32
      @this.value.ascent
    end

    def ascent=(ascent : Float32)
      @this.value.ascent = ascent
    end

    # 4+4
    # out
    # Ascent: distance from top to bottom of e.g. 'A' [0..FontSize]
    def descent : Float32
      @this.value.descent
    end

    def descent=(descent : Float32)
      @this.value.descent = descent
    end

    # 4
    # out
    # Total surface in pixels to get an idea of the font rasterization/texture cost (not exact, we approximate the cost of padding between glyphs)
    def metrics_total_surface : Int32
      @this.value.metrics_total_surface
    end

    def metrics_total_surface=(metrics_total_surface : Int32)
      @this.value.metrics_total_surface = metrics_total_surface
    end

    # 2 bytes if ImWchar=ImWchar16, 34 bytes if ImWchar==ImWchar32. Store 1-bit for each block of 4K codepoints that has one active glyph. This is mainly used to facilitate iterations across all used codepoints.
    def used4k_pages_map : Slice(UInt8)
      @this.value.used4k_pages_map.to_slice
    end

    def used4k_pages_map=(used4k_pages_map : Slice(UInt8))
      @this.value.used4k_pages_map = used4k_pages_map
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2439)]
    def add_glyph(src_cfg : ImFontConfig, c : ImWchar, x0 : Float32, y0 : Float32, x1 : Float32, y1 : Float32, u0 : Float32, v0 : Float32, u1 : Float32, v1 : Float32, advance_x : Float32) : Void
      LibImGui.ImFont_AddGlyph(self, src_cfg, c, x0, y0, x1, y1, u0, v0, u1, v1, advance_x)
    end

    # Makes 'dst' character/glyph points to 'src' character/glyph. Currently needs to be called AFTER fonts have been built.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2440)]
    def add_remap_char(dst : ImWchar, src : ImWchar, overwrite_dst : Bool = true) : Void
      LibImGui.ImFont_AddRemapChar(self, dst, src, overwrite_dst)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2436)]
    def build_lookup_table : Void
      LibImGui.ImFont_BuildLookupTable(self)
    end

    # utf8
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2430)]
    def calc_text_size_a(size : Float32, max_width : Float32, wrap_width : Float32, text : Bytes | String, remaining : LibC::Char** = Pointer(LibC::Char*).null) : ImGui::ImVec2
      LibImGui.ImFont_CalcTextSizeA(out p_out, self, size, max_width, wrap_width, text, (text.to_unsafe + text.bytesize), remaining)
      p_out
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2431)]
    def calc_word_wrap_position_a(scale : Float32, text : Bytes | String, wrap_width : Float32) : String
      result = LibImGui.ImFont_CalcWordWrapPositionA(self, scale, text, (text.to_unsafe + text.bytesize), wrap_width)
      String.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2437)]
    def clear_output_data : Void
      LibImGui.ImFont_ClearOutputData(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2422)]
    def find_glyph(c : ImWchar) : ImFontGlyph
      result = LibImGui.ImFont_FindGlyph(self, c)
      result.value
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2423)]
    def find_glyph_no_fallback(c : ImWchar) : ImFontGlyph
      result = LibImGui.ImFont_FindGlyphNoFallback(self, c)
      result.value
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2424)]
    def get_char_advance(c : ImWchar) : Float32
      LibImGui.ImFont_GetCharAdvance(self, c)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2426)]
    def get_debug_name : String
      result = LibImGui.ImFont_GetDebugName(self)
      String.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2438)]
    def grow_index(new_size : Int32) : Void
      LibImGui.ImFont_GrowIndex(self, new_size)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2420)]
    def self.new : ImFont
      result = LibImGui.ImFont_ImFont
      ImFont.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2443)]
    def is_glyph_range_unused(c_begin : UInt32, c_last : UInt32) : Bool
      LibImGui.ImFont_IsGlyphRangeUnused(self, c_begin, c_last)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2425)]
    def is_loaded : Bool
      LibImGui.ImFont_IsLoaded(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2432)]
    def render_char(draw_list : ImDrawList, size : Float32, pos : ImVec2, col : UInt32, c : ImWchar) : Void
      LibImGui.ImFont_RenderChar(self, draw_list, size, pos, col, c)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2433)]
    def render_text(draw_list : ImDrawList, size : Float32, pos : ImVec2, col : UInt32, clip_rect : ImVec4, text : Bytes | String, wrap_width : Float32 = 0.0, cpu_fine_clip : Bool = false) : Void
      LibImGui.ImFont_RenderText(self, draw_list, size, pos, col, clip_rect, text, (text.to_unsafe + text.bytesize), wrap_width, cpu_fine_clip)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2442)]
    def set_fallback_char(c : ImWchar) : Void
      LibImGui.ImFont_SetFallbackChar(self, c)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2441)]
    def set_glyph_visible(c : ImWchar, visible : Bool) : Void
      LibImGui.ImFont_SetGlyphVisible(self, c, visible)
    end
  end

  alias TopLevel::ImFont = ImGui::ImFont

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2299)]
  class ImFontAtlas
    include ClassType(LibImGui::ImFontAtlas)

    # Marked as Locked by ImGui::NewFrame() so attempt to modify the atlas will assert.
    def locked : Bool
      @this.value.locked
    end

    def locked=(locked : Bool)
      @this.value.locked = locked
    end

    # Build flags (see ImFontAtlasFlags_)
    def flags : ImFontAtlasFlags
      @this.value.flags
    end

    def flags=(flags : ImFontAtlasFlags)
      @this.value.flags = flags
    end

    # User data to refer to the texture once it has been uploaded to user's graphic systems. It is passed back to you during rendering via the ImDrawCmd structure.
    def tex_id : ImTextureID
      @this.value.tex_id
    end

    def tex_id=(tex_id : ImTextureID)
      @this.value.tex_id = tex_id
    end

    # Texture width desired by user before Build(). Must be a power-of-two. If have many glyphs your graphics API have texture size restrictions you may want to increase texture width to decrease height.
    def tex_desired_width : Int32
      @this.value.tex_desired_width
    end

    def tex_desired_width=(tex_desired_width : Int32)
      @this.value.tex_desired_width = tex_desired_width
    end

    # Padding between glyphs within texture in pixels. Defaults to 1. If your rendering method doesn't rely on bilinear filtering you may set this to 0.
    def tex_glyph_padding : Int32
      @this.value.tex_glyph_padding
    end

    def tex_glyph_padding=(tex_glyph_padding : Int32)
      @this.value.tex_glyph_padding = tex_glyph_padding
    end

    # 1 component per pixel, each component is unsigned 8-bit. Total size = TexWidth * TexHeight
    def tex_pixels_alpha8 : LibC::UChar*
      @this.value.tex_pixels_alpha8
    end

    def tex_pixels_alpha8=(tex_pixels_alpha8 : LibC::UChar*)
      @this.value.tex_pixels_alpha8 = tex_pixels_alpha8
    end

    # 4 component per pixel, each component is unsigned 8-bit. Total size = TexWidth * TexHeight * 4
    def tex_pixels_rgba32 : UInt32*
      @this.value.tex_pixels_rgba32
    end

    def tex_pixels_rgba32=(tex_pixels_rgba32 : UInt32*)
      @this.value.tex_pixels_rgba32 = tex_pixels_rgba32
    end

    # Texture width calculated during Build().
    def tex_width : Int32
      @this.value.tex_width
    end

    def tex_width=(tex_width : Int32)
      @this.value.tex_width = tex_width
    end

    # Texture height calculated during Build().
    def tex_height : Int32
      @this.value.tex_height
    end

    def tex_height=(tex_height : Int32)
      @this.value.tex_height = tex_height
    end

    # = (1.0f/TexWidth, 1.0f/TexHeight)
    def tex_uv_scale : ImVec2
      @this.value.tex_uv_scale
    end

    def tex_uv_scale=(tex_uv_scale : ImVec2)
      @this.value.tex_uv_scale = tex_uv_scale
    end

    # Texture coordinates to a white pixel
    def tex_uv_white_pixel : ImVec2
      @this.value.tex_uv_white_pixel
    end

    def tex_uv_white_pixel=(tex_uv_white_pixel : ImVec2)
      @this.value.tex_uv_white_pixel = tex_uv_white_pixel
    end

    # Hold all the fonts returned by AddFont*. Fonts[0] is the default font upon calling ImGui::NewFrame(), use ImGui::PushFont()/PopFont() to change the current font.
    def fonts : ImVector(ImFont)
      t = @this.value.fonts
      pointerof(t).as(ImVector(ImFont)*).value
    end

    def fonts=(fonts : ImVector(ImFont))
      @this.value.fonts = fonts.as(LibImGui::ImVectorInternal*).value
    end

    # Rectangles for packing custom texture data into the atlas.
    def custom_rects : ImVector(LibImGui::ImFontAtlasCustomRect)
      t = @this.value.custom_rects
      pointerof(t).as(ImVector(LibImGui::ImFontAtlasCustomRect)*).value
    end

    def custom_rects=(custom_rects : ImVector(LibImGui::ImFontAtlasCustomRect))
      @this.value.custom_rects = custom_rects.as(LibImGui::ImVectorInternal*).value
    end

    # Configuration data
    def config_data : ImVector(LibImGui::ImFontConfig)
      t = @this.value.config_data
      pointerof(t).as(ImVector(LibImGui::ImFontConfig)*).value
    end

    def config_data=(config_data : ImVector(LibImGui::ImFontConfig))
      @this.value.config_data = config_data.as(LibImGui::ImVectorInternal*).value
    end

    # UVs for baked anti-aliased lines
    def tex_uv_lines : Slice(ImVec4)
      @this.value.tex_uv_lines.to_slice
    end

    def tex_uv_lines=(tex_uv_lines : Slice(ImVec4))
      @this.value.tex_uv_lines = tex_uv_lines
    end

    # Custom texture rectangle ID for white pixel and mouse cursors
    def pack_id_mouse_cursors : Int32
      @this.value.pack_id_mouse_cursors
    end

    def pack_id_mouse_cursors=(pack_id_mouse_cursors : Int32)
      @this.value.pack_id_mouse_cursors = pack_id_mouse_cursors
    end

    # Custom texture rectangle ID for baked anti-aliased lines
    def pack_id_lines : Int32
      @this.value.pack_id_lines
    end

    def pack_id_lines=(pack_id_lines : Int32)
      @this.value.pack_id_lines = pack_id_lines
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2352)]
    def add_custom_rect_font_glyph(font : ImFont, id : ImWchar, width : Int32, height : Int32, advance_x : Float32, offset : ImVec2 = ImVec2.new(0, 0)) : Int32
      LibImGui.ImFontAtlas_AddCustomRectFontGlyph(self, font, id, width, height, advance_x, offset)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2351)]
    def add_custom_rect_regular(width : Int32, height : Int32) : Int32
      LibImGui.ImFontAtlas_AddCustomRectRegular(self, width, height)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2303)]
    def add_font(font_cfg : ImFontConfig) : ImFont
      result = LibImGui.ImFontAtlas_AddFont(self, font_cfg)
      ImFont.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2304)]
    def add_font_default(font_cfg : ImFontConfig? = nil) : ImFont
      result = LibImGui.ImFontAtlas_AddFontDefault(self, font_cfg)
      ImFont.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2305)]
    def add_font_from_file_ttf(filename : String, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromFileTTF(self, filename, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    # 'compressed_font_data_base85' still owned by caller. Compress with binary_to_compressed_c.cpp with -base85 parameter.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2308)]
    def add_font_from_memory_compressed_base85_ttf(compressed_font_data_base85 : String, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self, compressed_font_data_base85, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    # 'compressed_font_data' still owned by caller. Compress with binary_to_compressed_c.cpp.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2307)]
    def add_font_from_memory_compressed_ttf(compressed_font_data : Void*, compressed_font_size : Int32, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryCompressedTTF(self, compressed_font_data, compressed_font_size, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    # Note: Transfer ownership of 'ttf_data' to ImFontAtlas! Will be deleted after destruction of the atlas. Set font_cfg->FontDataOwnedByAtlas=false to keep ownership of your data and it won't be freed.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2306)]
    def add_font_from_memory_ttf(font_data : Void*, font_size : Int32, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryTTF(self, font_data, font_size, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    # Build pixels data. This is called automatically for you by the GetTexData*** functions.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2319)]
    def build : Bool
      LibImGui.ImFontAtlas_Build(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2356)]
    def calc_custom_rect_uv(rect : ImFontAtlasCustomRect) : {ImGui::ImVec2, ImGui::ImVec2}
      LibImGui.ImFontAtlas_CalcCustomRectUV(self, rect, out out_uv_min, out out_uv_max)
      {out_uv_min, out_uv_max}
    end

    # Clear all input and output.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2312)]
    def clear : Void
      LibImGui.ImFontAtlas_Clear(self)
    end

    # Clear output font data (glyphs storage, UV coordinates).
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2311)]
    def clear_fonts : Void
      LibImGui.ImFontAtlas_ClearFonts(self)
    end

    # Clear input data (all ImFontConfig structures including sizes, TTF data, glyph ranges, etc.) = all the data used to build the texture and fonts.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2309)]
    def clear_input_data : Void
      LibImGui.ImFontAtlas_ClearInputData(self)
    end

    # Clear output texture data (CPU side). Saves RAM once the texture has been copied to graphics memory.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2310)]
    def clear_tex_data : Void
      LibImGui.ImFontAtlas_ClearTexData(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2353)]
    def get_custom_rect_by_index(index : Int32) : ImFontAtlasCustomRect
      result = LibImGui.ImFontAtlas_GetCustomRectByIndex(self, index)
      ImFontAtlasCustomRect.new(result)
    end

    # Default + Half-Width + Japanese Hiragana/Katakana + full set of about 21000 CJK Unified Ideographs
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2335)]
    def get_glyph_ranges_chinese_full : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesChineseFull(self)
    end

    # Default + Half-Width + Japanese Hiragana/Katakana + set of 2500 CJK Unified Ideographs for common simplified Chinese
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2336)]
    def get_glyph_ranges_chinese_simplified_common : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self)
    end

    # Default + about 400 Cyrillic characters
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2337)]
    def get_glyph_ranges_cyrillic : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesCyrillic(self)
    end

    # Basic Latin, Extended Latin
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2332)]
    def get_glyph_ranges_default : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesDefault(self)
    end

    # Default + Hiragana, Katakana, Half-Width, Selection of 1946 Ideographs
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2334)]
    def get_glyph_ranges_japanese : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesJapanese(self)
    end

    # Default + Korean characters
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2333)]
    def get_glyph_ranges_korean : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesKorean(self)
    end

    # Default + Thai characters
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2338)]
    def get_glyph_ranges_thai : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesThai(self)
    end

    # Default + Vietnamese characters
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2339)]
    def get_glyph_ranges_vietnamese : ImWchar*
      LibImGui.ImFontAtlas_GetGlyphRangesVietnamese(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2357)]
    def get_mouse_cursor_tex_data(cursor : ImGuiMouseCursor) : {Bool, ImGui::ImVec2, ImGui::ImVec2, Slice(ImGui::ImVec2), Slice(ImGui::ImVec2)}
      result = LibImGui.ImFontAtlas_GetMouseCursorTexData(self, cursor, out out_offset, out out_size, out out_uv_border, out out_uv_fill)
      {result, out_offset, out_size, out_uv_border.to_slice, out_uv_fill.to_slice}
    end

    # 1 byte per-pixel
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2320)]
    def get_tex_data_as_alpha8 : {LibC::UChar*, LibC::Int, LibC::Int, LibC::Int}
      LibImGui.ImFontAtlas_GetTexDataAsAlpha8(self, out out_pixels, out out_width, out out_height, out out_bytes_per_pixel)
      {out_pixels, out_width, out_height, out_bytes_per_pixel}
    end

    # 4 bytes-per-pixel
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2321)]
    def get_tex_data_as_rgba32 : {LibC::UChar*, LibC::Int, LibC::Int, LibC::Int}
      LibImGui.ImFontAtlas_GetTexDataAsRGBA32(self, out out_pixels, out out_width, out out_height, out out_bytes_per_pixel)
      {out_pixels, out_width, out_height, out_bytes_per_pixel}
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2301)]
    def self.new : ImFontAtlas
      result = LibImGui.ImFontAtlas_ImFontAtlas
      ImFontAtlas.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2322)]
    def is_built : Bool
      LibImGui.ImFontAtlas_IsBuilt(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2323)]
    def set_tex_id(id : ImTextureID) : Void
      LibImGui.ImFontAtlas_SetTexID(self, id)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2302)]
    def finalize : Void
      LibImGui.ImFontAtlas_destroy(self)
    end
  end

  alias TopLevel::ImFontAtlas = ImGui::ImFontAtlas

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2261)]
  struct ImFontAtlasCustomRect
    include ClassType(LibImGui::ImFontAtlasCustomRect)

    # Input
    # Desired rectangle dimension
    def width : UInt16
      @this.value.width
    end

    def width=(width : UInt16)
      @this.value.width = width
    end

    # Input
    # Desired rectangle dimension
    def height : UInt16
      @this.value.height
    end

    def height=(height : UInt16)
      @this.value.height = height
    end

    # Output
    # Packed position in Atlas
    def x : UInt16
      @this.value.x
    end

    def x=(x : UInt16)
      @this.value.x = x
    end

    # Output
    # Packed position in Atlas
    def y : UInt16
      @this.value.y
    end

    def y=(y : UInt16)
      @this.value.y = y
    end

    # Input
    # For custom font glyphs only (ID < 0x110000)
    def glyph_id : UInt32
      @this.value.glyph_id
    end

    def glyph_id=(glyph_id : UInt32)
      @this.value.glyph_id = glyph_id
    end

    # Input
    # For custom font glyphs only: glyph xadvance
    def glyph_advance_x : Float32
      @this.value.glyph_advance_x
    end

    def glyph_advance_x=(glyph_advance_x : Float32)
      @this.value.glyph_advance_x = glyph_advance_x
    end

    # Input
    # For custom font glyphs only: glyph display offset
    def glyph_offset : ImVec2
      @this.value.glyph_offset
    end

    def glyph_offset=(glyph_offset : ImVec2)
      @this.value.glyph_offset = glyph_offset
    end

    # Input
    # For custom font glyphs only: target font
    def font : ImFont
      ImFont.new(@this.value.font)
    end

    def font=(font : ImFont)
      @this.value.font = font
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2269)]
    def self.new : ImFontAtlasCustomRect
      result = LibImGui.ImFontAtlasCustomRect_ImFontAtlasCustomRect
      ImFontAtlasCustomRect.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2270)]
    def is_packed : Bool
      LibImGui.ImFontAtlasCustomRect_IsPacked(self)
    end
  end

  alias TopLevel::ImFontAtlasCustomRect = ImGui::ImFontAtlasCustomRect

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2206)]
  struct ImFontConfig
    include ClassType(LibImGui::ImFontConfig)

    # TTF/OTF data
    def font_data : Void*
      @this.value.font_data
    end

    def font_data=(font_data : Void*)
      @this.value.font_data = font_data
    end

    # TTF/OTF data size
    def font_data_size : Int32
      @this.value.font_data_size
    end

    def font_data_size=(font_data_size : Int32)
      @this.value.font_data_size = font_data_size
    end

    # true
    # TTF/OTF data ownership taken by the container ImFontAtlas (will delete memory itself).
    def font_data_owned_by_atlas : Bool
      @this.value.font_data_owned_by_atlas
    end

    def font_data_owned_by_atlas=(font_data_owned_by_atlas : Bool)
      @this.value.font_data_owned_by_atlas = font_data_owned_by_atlas
    end

    # 0
    # Index of font within TTF/OTF file
    def font_no : Int32
      @this.value.font_no
    end

    def font_no=(font_no : Int32)
      @this.value.font_no = font_no
    end

    # Size in pixels for rasterizer (more or less maps to the resulting font height).
    def size_pixels : Float32
      @this.value.size_pixels
    end

    def size_pixels=(size_pixels : Float32)
      @this.value.size_pixels = size_pixels
    end

    # 3
    # Rasterize at higher quality for sub-pixel positioning. Read https://github.com/nothings/stb/blob/master/tests/oversample/README.md for details.
    def oversample_h : Int32
      @this.value.oversample_h
    end

    def oversample_h=(oversample_h : Int32)
      @this.value.oversample_h = oversample_h
    end

    # 1
    # Rasterize at higher quality for sub-pixel positioning. We don't use sub-pixel positions on the Y axis.
    def oversample_v : Int32
      @this.value.oversample_v
    end

    def oversample_v=(oversample_v : Int32)
      @this.value.oversample_v = oversample_v
    end

    # false
    # Align every glyph to pixel boundary. Useful e.g. if you are merging a non-pixel aligned font with the default font. If enabled, you can set OversampleH/V to 1.
    def pixel_snap_h : Bool
      @this.value.pixel_snap_h
    end

    def pixel_snap_h=(pixel_snap_h : Bool)
      @this.value.pixel_snap_h = pixel_snap_h
    end

    # 0, 0
    # Extra spacing (in pixels) between glyphs. Only X axis is supported for now.
    def glyph_extra_spacing : ImVec2
      @this.value.glyph_extra_spacing
    end

    def glyph_extra_spacing=(glyph_extra_spacing : ImVec2)
      @this.value.glyph_extra_spacing = glyph_extra_spacing
    end

    # 0, 0
    # Offset all glyphs from this font input.
    def glyph_offset : ImVec2
      @this.value.glyph_offset
    end

    def glyph_offset=(glyph_offset : ImVec2)
      @this.value.glyph_offset = glyph_offset
    end

    # NULL
    # Pointer to a user-provided list of Unicode range (2 value per range, values are inclusive, zero-terminated list). THE ARRAY DATA NEEDS TO PERSIST AS LONG AS THE FONT IS ALIVE.
    def glyph_ranges : ImWchar*
      @this.value.glyph_ranges
    end

    def glyph_ranges=(glyph_ranges : ImWchar*)
      @this.value.glyph_ranges = glyph_ranges
    end

    # 0
    # Minimum AdvanceX for glyphs, set Min to align font icons, set both Min/Max to enforce mono-space font
    def glyph_min_advance_x : Float32
      @this.value.glyph_min_advance_x
    end

    def glyph_min_advance_x=(glyph_min_advance_x : Float32)
      @this.value.glyph_min_advance_x = glyph_min_advance_x
    end

    # FLT_MAX
    # Maximum AdvanceX for glyphs
    def glyph_max_advance_x : Float32
      @this.value.glyph_max_advance_x
    end

    def glyph_max_advance_x=(glyph_max_advance_x : Float32)
      @this.value.glyph_max_advance_x = glyph_max_advance_x
    end

    # false
    # Merge into previous ImFont, so you can combine multiple inputs font into one ImFont (e.g. ASCII font + icons + Japanese glyphs). You may want to use GlyphOffset.y when merge font of different heights.
    def merge_mode : Bool
      @this.value.merge_mode
    end

    def merge_mode=(merge_mode : Bool)
      @this.value.merge_mode = merge_mode
    end

    # 0x00
    # Settings for custom font rasterizer (e.g. ImGuiFreeType). Leave as zero if you aren't using one.
    def rasterizer_flags : UInt32
      @this.value.rasterizer_flags
    end

    def rasterizer_flags=(rasterizer_flags : UInt32)
      @this.value.rasterizer_flags = rasterizer_flags
    end

    # 1.0f
    # Brighten (>1.0f) or darken (<1.0f) font output. Brightening small fonts may be a good workaround to make them more readable.
    def rasterizer_multiply : Float32
      @this.value.rasterizer_multiply
    end

    def rasterizer_multiply=(rasterizer_multiply : Float32)
      @this.value.rasterizer_multiply = rasterizer_multiply
    end

    # -1
    # Explicitly specify unicode codepoint of ellipsis character. When fonts are being merged first specified ellipsis will be used.
    def ellipsis_char : ImWchar
      @this.value.ellipsis_char
    end

    def ellipsis_char=(ellipsis_char : ImWchar)
      @this.value.ellipsis_char = ellipsis_char
    end

    # Name (strictly to ease debugging)
    def name : Slice(LibC::Char)
      @this.value.name.to_slice
    end

    def name=(name : Slice(LibC::Char))
      @this.value.name = name
    end

    def dst_font : ImFont
      ImFont.new(@this.value.dst_font)
    end

    def dst_font=(dst_font : ImFont)
      @this.value.dst_font = dst_font
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2230)]
    def self.new : ImFontConfig
      result = LibImGui.ImFontConfig_ImFontConfig
      ImFontConfig.new(result)
    end
  end

  alias TopLevel::ImFontConfig = ImGui::ImFontConfig

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2235)]
  struct ImFontGlyph
    include StructType
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2246)]
  struct ImFontGlyphRangesBuilder
    include StructType

    # Store 1-bit per Unicode code point (0=unused, 1=used)
    def used_chars : ImVector(UInt32)
      t = @used_chars
      pointerof(t).as(ImVector(UInt32)*).value
    end

    def used_chars=(used_chars : ImVector(UInt32))
      @used_chars = used_chars.as(LibImGui::ImVectorInternal*).value
    end

    # Add character
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2254)]
    def add_char(c : ImWchar) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddChar(self, c)
    end

    # Add ranges, e.g. builder.AddRanges(ImFontAtlas::GetGlyphRangesDefault()) to force add all of ASCII/Latin+Ext
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2256)]
    def add_ranges(ranges : ImWchar*) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddRanges(self, ranges)
    end

    # Add string (each character of the UTF-8 string are added)
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2255)]
    def add_text(text : Bytes | String) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddText(self, text, (text.to_unsafe + text.bytesize))
    end

    # Output new ranges
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2257)]
    def build_ranges : ImVector
      LibImGui.ImFontGlyphRangesBuilder_BuildRanges(self, out out_ranges)
      out_ranges
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2251)]
    def clear : Void
      LibImGui.ImFontGlyphRangesBuilder_Clear(self)
    end

    # Get bit n in the array
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2252)]
    def get_bit(n : LibC::SizeT) : Bool
      LibImGui.ImFontGlyphRangesBuilder_GetBit(self, n)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2250)]
    def self.new : ImFontGlyphRangesBuilder
      result = LibImGui.ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder
      result.value
    end

    # Set bit n in the array
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L2253)]
    def set_bit(n : LibC::SizeT) : Void
      LibImGui.ImFontGlyphRangesBuilder_SetBit(self, n)
    end
  end

  alias ImGuiContext = LibImGui::ImGuiContext

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1493)]
  struct ImGuiIO
    include ClassType(LibImGui::ImGuiIO)

    # = 0
    # See ImGuiConfigFlags_ enum. Set by user/application. Gamepad/keyboard navigation options, etc.
    def config_flags : ImGuiConfigFlags
      @this.value.config_flags
    end

    def config_flags=(config_flags : ImGuiConfigFlags)
      @this.value.config_flags = config_flags
    end

    # = 0
    # See ImGuiBackendFlags_ enum. Set by back-end (imgui_impl_xxx files or custom back-end) to communicate features supported by the back-end.
    def backend_flags : ImGuiBackendFlags
      @this.value.backend_flags
    end

    def backend_flags=(backend_flags : ImGuiBackendFlags)
      @this.value.backend_flags = backend_flags
    end

    # <unset>
    # Main display size, in pixels.
    def display_size : ImVec2
      @this.value.display_size
    end

    def display_size=(display_size : ImVec2)
      @this.value.display_size = display_size
    end

    # = 1.0f/60.0f
    # Time elapsed since last frame, in seconds.
    def delta_time : Float32
      @this.value.delta_time
    end

    def delta_time=(delta_time : Float32)
      @this.value.delta_time = delta_time
    end

    # = 5.0f
    # Minimum time between saving positions/sizes to .ini file, in seconds.
    def ini_saving_rate : Float32
      @this.value.ini_saving_rate
    end

    def ini_saving_rate=(ini_saving_rate : Float32)
      @this.value.ini_saving_rate = ini_saving_rate
    end

    # = "imgui.ini"
    # Path to .ini file. Set NULL to disable automatic .ini loading/saving, if e.g. you want to manually load/save from memory.
    def ini_filename : String?
      (v = @this.value.ini_filename) ? String.new(v) : nil
    end

    def ini_filename=(ini_filename : String?)
      @this.value.ini_filename = ini_filename
    end

    # = "imgui_log.txt"// Path to .log file (default parameter to ImGui::LogToFile when no file is specified).
    def log_filename : String?
      (v = @this.value.log_filename) ? String.new(v) : nil
    end

    def log_filename=(log_filename : String?)
      @this.value.log_filename = log_filename
    end

    # = 0.30f
    # Time for a double-click, in seconds.
    def mouse_double_click_time : Float32
      @this.value.mouse_double_click_time
    end

    def mouse_double_click_time=(mouse_double_click_time : Float32)
      @this.value.mouse_double_click_time = mouse_double_click_time
    end

    # = 6.0f
    # Distance threshold to stay in to validate a double-click, in pixels.
    def mouse_double_click_max_dist : Float32
      @this.value.mouse_double_click_max_dist
    end

    def mouse_double_click_max_dist=(mouse_double_click_max_dist : Float32)
      @this.value.mouse_double_click_max_dist = mouse_double_click_max_dist
    end

    # = 6.0f
    # Distance threshold before considering we are dragging.
    def mouse_drag_threshold : Float32
      @this.value.mouse_drag_threshold
    end

    def mouse_drag_threshold=(mouse_drag_threshold : Float32)
      @this.value.mouse_drag_threshold = mouse_drag_threshold
    end

    # <unset>
    # Map of indices into the KeysDown[512] entries array which represent your "native" keyboard state.
    def key_map : Slice(Int32)
      @this.value.key_map.to_slice
    end

    def key_map=(key_map : Slice(Int32))
      @this.value.key_map = key_map
    end

    # = 0.250f
    # When holding a key/button, time before it starts repeating, in seconds (for buttons in Repeat mode, etc.).
    def key_repeat_delay : Float32
      @this.value.key_repeat_delay
    end

    def key_repeat_delay=(key_repeat_delay : Float32)
      @this.value.key_repeat_delay = key_repeat_delay
    end

    # = 0.050f
    # When holding a key/button, rate at which it repeats, in seconds.
    def key_repeat_rate : Float32
      @this.value.key_repeat_rate
    end

    def key_repeat_rate=(key_repeat_rate : Float32)
      @this.value.key_repeat_rate = key_repeat_rate
    end

    # = NULL
    # Store your own data for retrieval by callbacks.
    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    # <auto>
    # Font atlas: load, rasterize and pack one or more fonts into a single texture.
    def fonts : ImFontAtlas
      ImFontAtlas.new(@this.value.fonts)
    end

    def fonts=(fonts : ImFontAtlas)
      @this.value.fonts = fonts
    end

    # = 1.0f
    # Global scale all fonts
    def font_global_scale : Float32
      @this.value.font_global_scale
    end

    def font_global_scale=(font_global_scale : Float32)
      @this.value.font_global_scale = font_global_scale
    end

    # = false
    # Allow user scaling text of individual window with CTRL+Wheel.
    def font_allow_user_scaling : Bool
      @this.value.font_allow_user_scaling
    end

    def font_allow_user_scaling=(font_allow_user_scaling : Bool)
      @this.value.font_allow_user_scaling = font_allow_user_scaling
    end

    # = NULL
    # Font to use on NewFrame(). Use NULL to uses Fonts->Fonts[0].
    def font_default : ImFont
      ImFont.new(@this.value.font_default)
    end

    def font_default=(font_default : ImFont)
      @this.value.font_default = font_default
    end

    # = (1, 1)
    # For retina display or other situations where window coordinates are different from framebuffer coordinates. This generally ends up in ImDrawData::FramebufferScale.
    def display_framebuffer_scale : ImVec2
      @this.value.display_framebuffer_scale
    end

    def display_framebuffer_scale=(display_framebuffer_scale : ImVec2)
      @this.value.display_framebuffer_scale = display_framebuffer_scale
    end

    # = false
    # Request ImGui to draw a mouse cursor for you (if you are on a platform without a mouse cursor). Cannot be easily renamed to 'io.ConfigXXX' because this is frequently used by back-end implementations.
    def mouse_draw_cursor : Bool
      @this.value.mouse_draw_cursor
    end

    def mouse_draw_cursor=(mouse_draw_cursor : Bool)
      @this.value.mouse_draw_cursor = mouse_draw_cursor
    end

    # = defined(__APPLE__)
    # OS X style: Text editing cursor movement using Alt instead of Ctrl, Shortcuts using Cmd/Super instead of Ctrl, Line/Text Start and End using Cmd+Arrows instead of Home/End, Double click selects by word instead of selecting whole text, Multi-selection in lists uses Cmd/Super instead of Ctrl (was called io.OptMacOSXBehaviors prior to 1.63)
    def config_mac_osx_behaviors : Bool
      @this.value.config_mac_osx_behaviors
    end

    def config_mac_osx_behaviors=(config_mac_osx_behaviors : Bool)
      @this.value.config_mac_osx_behaviors = config_mac_osx_behaviors
    end

    # = true
    # Set to false to disable blinking cursor, for users who consider it distracting. (was called: io.OptCursorBlink prior to 1.63)
    def config_input_text_cursor_blink : Bool
      @this.value.config_input_text_cursor_blink
    end

    def config_input_text_cursor_blink=(config_input_text_cursor_blink : Bool)
      @this.value.config_input_text_cursor_blink = config_input_text_cursor_blink
    end

    # = true
    # Enable resizing of windows from their edges and from the lower-left corner. This requires (io.BackendFlags & ImGuiBackendFlags_HasMouseCursors) because it needs mouse cursor feedback. (This used to be a per-window ImGuiWindowFlags_ResizeFromAnySide flag)
    def config_windows_resize_from_edges : Bool
      @this.value.config_windows_resize_from_edges
    end

    def config_windows_resize_from_edges=(config_windows_resize_from_edges : Bool)
      @this.value.config_windows_resize_from_edges = config_windows_resize_from_edges
    end

    # = false
    # [BETA] Set to true to only allow moving windows when clicked+dragged from the title bar. Windows without a title bar are not affected.
    def config_windows_move_from_title_bar_only : Bool
      @this.value.config_windows_move_from_title_bar_only
    end

    def config_windows_move_from_title_bar_only=(config_windows_move_from_title_bar_only : Bool)
      @this.value.config_windows_move_from_title_bar_only = config_windows_move_from_title_bar_only
    end

    # = 60.0f
    # [BETA] Compact window memory usage when unused. Set to -1.0f to disable.
    def config_windows_memory_compact_timer : Float32
      @this.value.config_windows_memory_compact_timer
    end

    def config_windows_memory_compact_timer=(config_windows_memory_compact_timer : Float32)
      @this.value.config_windows_memory_compact_timer = config_windows_memory_compact_timer
    end

    # = NULL
    def backend_platform_name : String?
      (v = @this.value.backend_platform_name) ? String.new(v) : nil
    end

    def backend_platform_name=(backend_platform_name : String?)
      @this.value.backend_platform_name = backend_platform_name
    end

    # = NULL
    def backend_renderer_name : String?
      (v = @this.value.backend_renderer_name) ? String.new(v) : nil
    end

    def backend_renderer_name=(backend_renderer_name : String?)
      @this.value.backend_renderer_name = backend_renderer_name
    end

    # = NULL
    # User data for platform back-end
    def backend_platform_user_data : Void*
      @this.value.backend_platform_user_data
    end

    def backend_platform_user_data=(backend_platform_user_data : Void*)
      @this.value.backend_platform_user_data = backend_platform_user_data
    end

    # = NULL
    # User data for renderer back-end
    def backend_renderer_user_data : Void*
      @this.value.backend_renderer_user_data
    end

    def backend_renderer_user_data=(backend_renderer_user_data : Void*)
      @this.value.backend_renderer_user_data = backend_renderer_user_data
    end

    # = NULL
    # User data for non C++ programming language back-end
    def backend_language_user_data : Void*
      @this.value.backend_language_user_data
    end

    def backend_language_user_data=(backend_language_user_data : Void*)
      @this.value.backend_language_user_data = backend_language_user_data
    end

    def get_clipboard_text_fn : (Void*) -> String
      @this.value.get_clipboard_text_fn
    end

    def get_clipboard_text_fn=(get_clipboard_text_fn : (Void*) -> String)
      @this.value.get_clipboard_text_fn = get_clipboard_text_fn
    end

    def set_clipboard_text_fn : (Void*, String) -> Void
      @this.value.set_clipboard_text_fn
    end

    def set_clipboard_text_fn=(set_clipboard_text_fn : (Void*, String) -> Void)
      @this.value.set_clipboard_text_fn = set_clipboard_text_fn
    end

    def clipboard_user_data : Void*
      @this.value.clipboard_user_data
    end

    def clipboard_user_data=(clipboard_user_data : Void*)
      @this.value.clipboard_user_data = clipboard_user_data
    end

    def ime_set_input_screen_pos_fn : (Int32, Int32) -> Void
      @this.value.ime_set_input_screen_pos_fn
    end

    def ime_set_input_screen_pos_fn=(ime_set_input_screen_pos_fn : (Int32, Int32) -> Void)
      @this.value.ime_set_input_screen_pos_fn = ime_set_input_screen_pos_fn
    end

    # = NULL
    # (Windows) Set this to your HWND to get automatic IME cursor positioning.
    def ime_window_handle : Void*
      @this.value.ime_window_handle
    end

    def ime_window_handle=(ime_window_handle : Void*)
      @this.value.ime_window_handle = ime_window_handle
    end

    def render_draw_lists_fn_unused : Void*
      @this.value.render_draw_lists_fn_unused
    end

    def render_draw_lists_fn_unused=(render_draw_lists_fn_unused : Void*)
      @this.value.render_draw_lists_fn_unused = render_draw_lists_fn_unused
    end

    # Mouse position, in pixels. Set to ImVec2(-FLT_MAX, -FLT_MAX) if mouse is unavailable (on another screen, etc.)
    def mouse_pos : ImVec2
      @this.value.mouse_pos
    end

    def mouse_pos=(mouse_pos : ImVec2)
      @this.value.mouse_pos = mouse_pos
    end

    # Mouse buttons: 0=left, 1=right, 2=middle + extras (ImGuiMouseButton_COUNT == 5). Dear ImGui mostly uses left and right buttons. Others buttons allows us to track if the mouse is being used by your application + available to user as a convenience via IsMouse** API.
    def mouse_down : Slice(Bool)
      @this.value.mouse_down.to_slice
    end

    def mouse_down=(mouse_down : Slice(Bool))
      @this.value.mouse_down = mouse_down
    end

    # Mouse wheel Vertical: 1 unit scrolls about 5 lines text.
    def mouse_wheel : Float32
      @this.value.mouse_wheel
    end

    def mouse_wheel=(mouse_wheel : Float32)
      @this.value.mouse_wheel = mouse_wheel
    end

    # Mouse wheel Horizontal. Most users don't have a mouse with an horizontal wheel, may not be filled by all back-ends.
    def mouse_wheel_h : Float32
      @this.value.mouse_wheel_h
    end

    def mouse_wheel_h=(mouse_wheel_h : Float32)
      @this.value.mouse_wheel_h = mouse_wheel_h
    end

    # Keyboard modifier pressed: Control
    def key_ctrl : Bool
      @this.value.key_ctrl
    end

    def key_ctrl=(key_ctrl : Bool)
      @this.value.key_ctrl = key_ctrl
    end

    # Keyboard modifier pressed: Shift
    def key_shift : Bool
      @this.value.key_shift
    end

    def key_shift=(key_shift : Bool)
      @this.value.key_shift = key_shift
    end

    # Keyboard modifier pressed: Alt
    def key_alt : Bool
      @this.value.key_alt
    end

    def key_alt=(key_alt : Bool)
      @this.value.key_alt = key_alt
    end

    # Keyboard modifier pressed: Cmd/Super/Windows
    def key_super : Bool
      @this.value.key_super
    end

    def key_super=(key_super : Bool)
      @this.value.key_super = key_super
    end

    # Keyboard keys that are pressed (ideally left in the "native" order your engine has access to keyboard keys, so you can use your own defines/enums for keys).
    def keys_down : Slice(Bool)
      @this.value.keys_down.to_slice
    end

    def keys_down=(keys_down : Slice(Bool))
      @this.value.keys_down = keys_down
    end

    # Gamepad inputs. Cleared back to zero by EndFrame(). Keyboard keys will be auto-mapped and be written here by NewFrame().
    def nav_inputs : Slice(Float32)
      @this.value.nav_inputs.to_slice
    end

    def nav_inputs=(nav_inputs : Slice(Float32))
      @this.value.nav_inputs = nav_inputs
    end

    # Set when Dear ImGui will use mouse inputs, in this case do not dispatch them to your main game/application (either way, always pass on mouse inputs to imgui). (e.g. unclicked mouse is hovering over an imgui window, widget is active, mouse was clicked over an imgui window, etc.).
    def want_capture_mouse : Bool
      @this.value.want_capture_mouse
    end

    def want_capture_mouse=(want_capture_mouse : Bool)
      @this.value.want_capture_mouse = want_capture_mouse
    end

    # Set when Dear ImGui will use keyboard inputs, in this case do not dispatch them to your main game/application (either way, always pass keyboard inputs to imgui). (e.g. InputText active, or an imgui window is focused and navigation is enabled, etc.).
    def want_capture_keyboard : Bool
      @this.value.want_capture_keyboard
    end

    def want_capture_keyboard=(want_capture_keyboard : Bool)
      @this.value.want_capture_keyboard = want_capture_keyboard
    end

    # Mobile/console: when set, you may display an on-screen keyboard. This is set by Dear ImGui when it wants textual keyboard input to happen (e.g. when a InputText widget is active).
    def want_text_input : Bool
      @this.value.want_text_input
    end

    def want_text_input=(want_text_input : Bool)
      @this.value.want_text_input = want_text_input
    end

    # MousePos has been altered, back-end should reposition mouse on next frame. Rarely used! Set only when ImGuiConfigFlags_NavEnableSetMousePos flag is enabled.
    def want_set_mouse_pos : Bool
      @this.value.want_set_mouse_pos
    end

    def want_set_mouse_pos=(want_set_mouse_pos : Bool)
      @this.value.want_set_mouse_pos = want_set_mouse_pos
    end

    # When manual .ini load/save is active (io.IniFilename == NULL), this will be set to notify your application that you can call SaveIniSettingsToMemory() and save yourself. Important: clear io.WantSaveIniSettings yourself after saving!
    def want_save_ini_settings : Bool
      @this.value.want_save_ini_settings
    end

    def want_save_ini_settings=(want_save_ini_settings : Bool)
      @this.value.want_save_ini_settings = want_save_ini_settings
    end

    # Keyboard/Gamepad navigation is currently allowed (will handle ImGuiKey_NavXXX events) = a window is focused and it doesn't use the ImGuiWindowFlags_NoNavInputs flag.
    def nav_active : Bool
      @this.value.nav_active
    end

    def nav_active=(nav_active : Bool)
      @this.value.nav_active = nav_active
    end

    # Keyboard/Gamepad navigation is visible and allowed (will handle ImGuiKey_NavXXX events).
    def nav_visible : Bool
      @this.value.nav_visible
    end

    def nav_visible=(nav_visible : Bool)
      @this.value.nav_visible = nav_visible
    end

    # Application framerate estimate, in frame per second. Solely for convenience. Rolling average estimation based on io.DeltaTime over 120 frames.
    def framerate : Float32
      @this.value.framerate
    end

    def framerate=(framerate : Float32)
      @this.value.framerate = framerate
    end

    # Vertices output during last call to Render()
    def metrics_render_vertices : Int32
      @this.value.metrics_render_vertices
    end

    def metrics_render_vertices=(metrics_render_vertices : Int32)
      @this.value.metrics_render_vertices = metrics_render_vertices
    end

    # Indices output during last call to Render() = number of triangles * 3
    def metrics_render_indices : Int32
      @this.value.metrics_render_indices
    end

    def metrics_render_indices=(metrics_render_indices : Int32)
      @this.value.metrics_render_indices = metrics_render_indices
    end

    # Number of visible windows
    def metrics_render_windows : Int32
      @this.value.metrics_render_windows
    end

    def metrics_render_windows=(metrics_render_windows : Int32)
      @this.value.metrics_render_windows = metrics_render_windows
    end

    # Number of active windows
    def metrics_active_windows : Int32
      @this.value.metrics_active_windows
    end

    def metrics_active_windows=(metrics_active_windows : Int32)
      @this.value.metrics_active_windows = metrics_active_windows
    end

    # Number of active allocations, updated by MemAlloc/MemFree based on current context. May be off if you have multiple imgui contexts.
    def metrics_active_allocations : Int32
      @this.value.metrics_active_allocations
    end

    def metrics_active_allocations=(metrics_active_allocations : Int32)
      @this.value.metrics_active_allocations = metrics_active_allocations
    end

    # Mouse delta. Note that this is zero if either current or previous position are invalid (-FLT_MAX,-FLT_MAX), so a disappearing/reappearing mouse won't have a huge delta.
    def mouse_delta : ImVec2
      @this.value.mouse_delta
    end

    def mouse_delta=(mouse_delta : ImVec2)
      @this.value.mouse_delta = mouse_delta
    end

    # Key mods flags (same as io.KeyCtrl/KeyShift/KeyAlt/KeySuper but merged into flags), updated by NewFrame()
    def key_mods : ImGuiKeyModFlags
      @this.value.key_mods
    end

    def key_mods=(key_mods : ImGuiKeyModFlags)
      @this.value.key_mods = key_mods
    end

    # Previous mouse position (note that MouseDelta is not necessary == MousePos-MousePosPrev, in case either position is invalid)
    def mouse_pos_prev : ImVec2
      @this.value.mouse_pos_prev
    end

    def mouse_pos_prev=(mouse_pos_prev : ImVec2)
      @this.value.mouse_pos_prev = mouse_pos_prev
    end

    # Position at time of clicking
    def mouse_clicked_pos : Slice(ImVec2)
      @this.value.mouse_clicked_pos.to_slice
    end

    def mouse_clicked_pos=(mouse_clicked_pos : Slice(ImVec2))
      @this.value.mouse_clicked_pos = mouse_clicked_pos
    end

    # Time of last click (used to figure out double-click)
    def mouse_clicked_time : Slice(Float64)
      @this.value.mouse_clicked_time.to_slice
    end

    def mouse_clicked_time=(mouse_clicked_time : Slice(Float64))
      @this.value.mouse_clicked_time = mouse_clicked_time
    end

    # Mouse button went from !Down to Down
    def mouse_clicked : Slice(Bool)
      @this.value.mouse_clicked.to_slice
    end

    def mouse_clicked=(mouse_clicked : Slice(Bool))
      @this.value.mouse_clicked = mouse_clicked
    end

    # Has mouse button been double-clicked?
    def mouse_double_clicked : Slice(Bool)
      @this.value.mouse_double_clicked.to_slice
    end

    def mouse_double_clicked=(mouse_double_clicked : Slice(Bool))
      @this.value.mouse_double_clicked = mouse_double_clicked
    end

    # Mouse button went from Down to !Down
    def mouse_released : Slice(Bool)
      @this.value.mouse_released.to_slice
    end

    def mouse_released=(mouse_released : Slice(Bool))
      @this.value.mouse_released = mouse_released
    end

    # Track if button was clicked inside a dear imgui window. We don't request mouse capture from the application if click started outside ImGui bounds.
    def mouse_down_owned : Slice(Bool)
      @this.value.mouse_down_owned.to_slice
    end

    def mouse_down_owned=(mouse_down_owned : Slice(Bool))
      @this.value.mouse_down_owned = mouse_down_owned
    end

    # Track if button down was a double-click
    def mouse_down_was_double_click : Slice(Bool)
      @this.value.mouse_down_was_double_click.to_slice
    end

    def mouse_down_was_double_click=(mouse_down_was_double_click : Slice(Bool))
      @this.value.mouse_down_was_double_click = mouse_down_was_double_click
    end

    # Duration the mouse button has been down (0.0f == just clicked)
    def mouse_down_duration : Slice(Float32)
      @this.value.mouse_down_duration.to_slice
    end

    def mouse_down_duration=(mouse_down_duration : Slice(Float32))
      @this.value.mouse_down_duration = mouse_down_duration
    end

    # Previous time the mouse button has been down
    def mouse_down_duration_prev : Slice(Float32)
      @this.value.mouse_down_duration_prev.to_slice
    end

    def mouse_down_duration_prev=(mouse_down_duration_prev : Slice(Float32))
      @this.value.mouse_down_duration_prev = mouse_down_duration_prev
    end

    # Maximum distance, absolute, on each axis, of how much mouse has traveled from the clicking point
    def mouse_drag_max_distance_abs : Slice(ImVec2)
      @this.value.mouse_drag_max_distance_abs.to_slice
    end

    def mouse_drag_max_distance_abs=(mouse_drag_max_distance_abs : Slice(ImVec2))
      @this.value.mouse_drag_max_distance_abs = mouse_drag_max_distance_abs
    end

    # Squared maximum distance of how much mouse has traveled from the clicking point
    def mouse_drag_max_distance_sqr : Slice(Float32)
      @this.value.mouse_drag_max_distance_sqr.to_slice
    end

    def mouse_drag_max_distance_sqr=(mouse_drag_max_distance_sqr : Slice(Float32))
      @this.value.mouse_drag_max_distance_sqr = mouse_drag_max_distance_sqr
    end

    # Duration the keyboard key has been down (0.0f == just pressed)
    def keys_down_duration : Slice(Float32)
      @this.value.keys_down_duration.to_slice
    end

    def keys_down_duration=(keys_down_duration : Slice(Float32))
      @this.value.keys_down_duration = keys_down_duration
    end

    # Previous duration the key has been down
    def keys_down_duration_prev : Slice(Float32)
      @this.value.keys_down_duration_prev.to_slice
    end

    def keys_down_duration_prev=(keys_down_duration_prev : Slice(Float32))
      @this.value.keys_down_duration_prev = keys_down_duration_prev
    end

    def nav_inputs_down_duration : Slice(Float32)
      @this.value.nav_inputs_down_duration.to_slice
    end

    def nav_inputs_down_duration=(nav_inputs_down_duration : Slice(Float32))
      @this.value.nav_inputs_down_duration = nav_inputs_down_duration
    end

    def nav_inputs_down_duration_prev : Slice(Float32)
      @this.value.nav_inputs_down_duration_prev.to_slice
    end

    def nav_inputs_down_duration_prev=(nav_inputs_down_duration_prev : Slice(Float32))
      @this.value.nav_inputs_down_duration_prev = nav_inputs_down_duration_prev
    end

    # Touch/Pen pressure (0.0f to 1.0f, should be >0.0f only when MouseDown[0] == true). Helper storage currently unused by Dear ImGui.
    def pen_pressure : Float32
      @this.value.pen_pressure
    end

    def pen_pressure=(pen_pressure : Float32)
      @this.value.pen_pressure = pen_pressure
    end

    # For AddInputCharacterUTF16
    def input_queue_surrogate : ImWchar16
      @this.value.input_queue_surrogate
    end

    def input_queue_surrogate=(input_queue_surrogate : ImWchar16)
      @this.value.input_queue_surrogate = input_queue_surrogate
    end

    # Queue of _characters_ input (obtained by platform back-end). Fill using AddInputCharacter() helper.
    def input_queue_characters : ImVector(ImWchar)
      t = @this.value.input_queue_characters
      pointerof(t).as(ImVector(ImWchar)*).value
    end

    def input_queue_characters=(input_queue_characters : ImVector(ImWchar))
      @this.value.input_queue_characters = input_queue_characters.as(LibImGui::ImVectorInternal*).value
    end

    # Queue new character input
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1576)]
    def add_input_character(c : UInt32) : Void
      LibImGui.ImGuiIO_AddInputCharacter(self, c)
    end

    # Queue new character input from an UTF-16 character, it can be a surrogate
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1577)]
    def add_input_character_utf16(c : ImWchar16) : Void
      LibImGui.ImGuiIO_AddInputCharacterUTF16(self, c)
    end

    # Queue new characters input from an UTF-8 string
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1578)]
    def add_input_characters_utf8(str : String) : Void
      LibImGui.ImGuiIO_AddInputCharactersUTF8(self, str)
    end

    # Clear the text input buffer manually
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1579)]
    def clear_input_characters : Void
      LibImGui.ImGuiIO_ClearInputCharacters(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1627)]
    def self.new : ImGuiIO
      result = LibImGui.ImGuiIO_ImGuiIO
      ImGuiIO.new(result)
    end
  end

  alias TopLevel::ImGuiIO = ImGui::ImGuiIO

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1642)]
  struct ImGuiInputTextCallbackData
    include ClassType(LibImGui::ImGuiInputTextCallbackData)

    # One ImGuiInputTextFlags_Callback*
    # Read-only
    def event_flag : ImGuiInputTextFlags
      @this.value.event_flag
    end

    def event_flag=(event_flag : ImGuiInputTextFlags)
      @this.value.event_flag = event_flag
    end

    # What user passed to InputText()
    # Read-only
    def flags : ImGuiInputTextFlags
      @this.value.flags
    end

    def flags=(flags : ImGuiInputTextFlags)
      @this.value.flags = flags
    end

    # What user passed to InputText()
    # Read-only
    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    # Character input
    # Read-write
    # [CharFilter] Replace character with another one, or set to zero to drop. return 1 is equivalent to setting EventChar=0;
    def event_char : ImWchar
      @this.value.event_char
    end

    def event_char=(event_char : ImWchar)
      @this.value.event_char = event_char
    end

    # Key pressed (Up/Down/TAB)
    # Read-only
    # [Completion,History]
    def event_key : ImGuiKey
      @this.value.event_key
    end

    def event_key=(event_key : ImGuiKey)
      @this.value.event_key = event_key
    end

    # Text buffer
    # Read-write
    # [Resize] Can replace pointer / [Completion,History,Always] Only write to pointed data, don't replace the actual pointer!
    def buf : LibC::Char*
      @this.value.buf
    end

    def buf=(buf : LibC::Char*)
      @this.value.buf = buf
    end

    # Text length (in bytes)
    # Read-write
    # [Resize,Completion,History,Always] Exclude zero-terminator storage. In C land: == strlen(some_text), in C++ land: string.length()
    def buf_text_len : Int32
      @this.value.buf_text_len
    end

    def buf_text_len=(buf_text_len : Int32)
      @this.value.buf_text_len = buf_text_len
    end

    # Buffer size (in bytes) = capacity+1
    # Read-only
    # [Resize,Completion,History,Always] Include zero-terminator storage. In C land == ARRAYSIZE(my_char_array), in C++ land: string.capacity()+1
    def buf_size : Int32
      @this.value.buf_size
    end

    def buf_size=(buf_size : Int32)
      @this.value.buf_size = buf_size
    end

    # Set if you modify Buf/BufTextLen!
    # Write
    # [Completion,History,Always]
    def buf_dirty : Bool
      @this.value.buf_dirty
    end

    def buf_dirty=(buf_dirty : Bool)
      @this.value.buf_dirty = buf_dirty
    end

    # Read-write
    # [Completion,History,Always]
    def cursor_pos : Int32
      @this.value.cursor_pos
    end

    def cursor_pos=(cursor_pos : Int32)
      @this.value.cursor_pos = cursor_pos
    end

    # Read-write
    # [Completion,History,Always] == to SelectionEnd when no selection)
    def selection_start : Int32
      @this.value.selection_start
    end

    def selection_start=(selection_start : Int32)
      @this.value.selection_start = selection_start
    end

    # Read-write
    # [Completion,History,Always]
    def selection_end : Int32
      @this.value.selection_end
    end

    def selection_end=(selection_end : Int32)
      @this.value.selection_end = selection_end
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1664)]
    def delete_chars(pos : Int32, bytes_count : Int32) : Void
      LibImGui.ImGuiInputTextCallbackData_DeleteChars(self, pos, bytes_count)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1666)]
    def has_selection : Bool
      LibImGui.ImGuiInputTextCallbackData_HasSelection(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1663)]
    def self.new : ImGuiInputTextCallbackData
      result = LibImGui.ImGuiInputTextCallbackData_ImGuiInputTextCallbackData
      ImGuiInputTextCallbackData.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1665)]
    def insert_chars(pos : Int32, text : Bytes | String) : Void
      LibImGui.ImGuiInputTextCallbackData_InsertChars(self, pos, text, (text.to_unsafe + text.bytesize))
    end
  end

  alias TopLevel::ImGuiInputTextCallbackData = ImGui::ImGuiInputTextCallbackData

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1883)]
  struct ImGuiListClipper
    include StructType

    # Automatically called by constructor if you passed 'items_count' or by Step() in Step 1.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1900)]
    def begin(items_count : Int32, items_height : Float32 = -1.0) : Void
      LibImGui.ImGuiListClipper_Begin(self, items_count, items_height)
    end

    # Automatically called on the last call of Step() that returns false.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1901)]
    def end : Void
      LibImGui.ImGuiListClipper_End(self)
    end

    # NB: Begin() initialize every fields (as we allow user to call Begin/End multiple times on a same instance if they want).
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1896)]
    def self.new(items_count : Int32 = -1, items_height : Float32 = -1.0) : ImGuiListClipper
      result = LibImGui.ImGuiListClipper_ImGuiListClipper(items_count, items_height)
      result.value
    end

    # Call until it returns false. The DisplayStart/DisplayEnd fields will be set and you can process/draw those items.
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1899)]
    def step : Bool
      LibImGui.ImGuiListClipper_Step(self)
    end
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1765)]
  struct ImGuiOnceUponAFrame
    include StructType

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1767)]
    def self.new : ImGuiOnceUponAFrame
      result = LibImGui.ImGuiOnceUponAFrame_ImGuiOnceUponAFrame
      result.value
    end
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1680)]
  struct ImGuiPayload
    include ClassType(LibImGui::ImGuiPayload)

    # Data (copied and owned by dear imgui)
    def data : Void*
      @this.value.data
    end

    def data=(data : Void*)
      @this.value.data = data
    end

    # Data size
    def data_size : Int32
      @this.value.data_size
    end

    def data_size=(data_size : Int32)
      @this.value.data_size = data_size
    end

    # Source item id
    def source_id : ImGuiID
      @this.value.source_id
    end

    def source_id=(source_id : ImGuiID)
      @this.value.source_id = source_id
    end

    # Source parent id (if available)
    def source_parent_id : ImGuiID
      @this.value.source_parent_id
    end

    def source_parent_id=(source_parent_id : ImGuiID)
      @this.value.source_parent_id = source_parent_id
    end

    # Data timestamp
    def data_frame_count : Int32
      @this.value.data_frame_count
    end

    def data_frame_count=(data_frame_count : Int32)
      @this.value.data_frame_count = data_frame_count
    end

    # Data type tag (short user-supplied string, 32 characters max)
    def data_type : Slice(LibC::Char)
      @this.value.data_type.to_slice
    end

    def data_type=(data_type : Slice(LibC::Char))
      @this.value.data_type = data_type
    end

    # Set when AcceptDragDropPayload() was called and mouse has been hovering the target item (nb: handle overlapping drag targets)
    def preview : Bool
      @this.value.preview
    end

    def preview=(preview : Bool)
      @this.value.preview = preview
    end

    # Set when AcceptDragDropPayload() was called and mouse button is released over the target item.
    def delivery : Bool
      @this.value.delivery
    end

    def delivery=(delivery : Bool)
      @this.value.delivery = delivery
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1695)]
    def clear : Void
      LibImGui.ImGuiPayload_Clear(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1694)]
    def self.new : ImGuiPayload
      result = LibImGui.ImGuiPayload_ImGuiPayload
      ImGuiPayload.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1696)]
    def is_data_type(type : String) : Bool
      LibImGui.ImGuiPayload_IsDataType(self, type)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1698)]
    def is_delivery : Bool
      LibImGui.ImGuiPayload_IsDelivery(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1697)]
    def is_preview : Bool
      LibImGui.ImGuiPayload_IsPreview(self)
    end
  end

  alias TopLevel::ImGuiPayload = ImGui::ImGuiPayload

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1671)]
  struct ImGuiSizeCallbackData
    include ClassType(LibImGui::ImGuiSizeCallbackData)

    # Read-only.   What user passed to SetNextWindowSizeConstraints()
    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    # Read-only.   Window position, for reference.
    def pos : ImVec2
      @this.value.pos
    end

    def pos=(pos : ImVec2)
      @this.value.pos = pos
    end

    # Read-only.   Current window size.
    def current_size : ImVec2
      @this.value.current_size
    end

    def current_size=(current_size : ImVec2)
      @this.value.current_size = current_size
    end

    # Read-write.  Desired size, based on user's mouse position. Write to this field to restrain resizing.
    def desired_size : ImVec2
      @this.value.desired_size
    end

    def desired_size=(desired_size : ImVec2)
      @this.value.desired_size = desired_size
    end
  end

  alias TopLevel::ImGuiSizeCallbackData = ImGui::ImGuiSizeCallbackData

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1827)]
  struct ImGuiStorage
    include StructType

    def data : ImVector(LibImGui::ImGuiStoragePair)
      t = @data
      pointerof(t).as(ImVector(LibImGui::ImGuiStoragePair)*).value
    end

    def data=(data : ImVector(LibImGui::ImGuiStoragePair))
      @data = data.as(LibImGui::ImVectorInternal*).value
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1867)]
    def build_sort_by_key : Void
      LibImGui.ImGuiStorage_BuildSortByKey(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1844)]
    def clear : Void
      LibImGui.ImGuiStorage_Clear(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1847)]
    def get_bool(key : ImGuiID, default_val : Bool = false) : Bool
      LibImGui.ImGuiStorage_GetBool(self, key, default_val)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1859)]
    def get_bool_ref(key : ImGuiID, default_val : Bool = false) : Bool*
      LibImGui.ImGuiStorage_GetBoolRef(self, key, default_val)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1849)]
    def get_float(key : ImGuiID, default_val : Float32 = 0.0) : Float32
      LibImGui.ImGuiStorage_GetFloat(self, key, default_val)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1860)]
    def get_float_ref(key : ImGuiID, default_val : Float32 = 0.0) : Float32*
      LibImGui.ImGuiStorage_GetFloatRef(self, key, default_val)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1845)]
    def get_int(key : ImGuiID, default_val : Int32 = 0) : Int32
      LibImGui.ImGuiStorage_GetInt(self, key, default_val)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1858)]
    def get_int_ref(key : ImGuiID, default_val : Int32 = 0) : Int32*
      LibImGui.ImGuiStorage_GetIntRef(self, key, default_val)
    end

    # default_val is NULL
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1851)]
    def get_void_ptr(key : ImGuiID) : Void*
      LibImGui.ImGuiStorage_GetVoidPtr(self, key)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1861)]
    def get_void_ptr_ref(key : ImGuiID, default_val : Void* = Pointer(Void).null) : Void**
      LibImGui.ImGuiStorage_GetVoidPtrRef(self, key, default_val)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1864)]
    def set_all_int(val : Int32) : Void
      LibImGui.ImGuiStorage_SetAllInt(self, val)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1848)]
    def set_bool(key : ImGuiID, val : Bool) : Void
      LibImGui.ImGuiStorage_SetBool(self, key, val)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1850)]
    def set_float(key : ImGuiID, val : Float32) : Void
      LibImGui.ImGuiStorage_SetFloat(self, key, val)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1846)]
    def set_int(key : ImGuiID, val : Int32) : Void
      LibImGui.ImGuiStorage_SetInt(self, key, val)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1852)]
    def set_void_ptr(key : ImGuiID, val : Void*) : Void
      LibImGui.ImGuiStorage_SetVoidPtr(self, key, val)
    end
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1441)]
  struct ImGuiStyle
    include ClassType(LibImGui::ImGuiStyle)

    # Global alpha applies to everything in Dear ImGui.
    def alpha : Float32
      @this.value.alpha
    end

    def alpha=(alpha : Float32)
      @this.value.alpha = alpha
    end

    # Padding within a window.
    def window_padding : ImVec2
      @this.value.window_padding
    end

    def window_padding=(window_padding : ImVec2)
      @this.value.window_padding = window_padding
    end

    # Radius of window corners rounding. Set to 0.0f to have rectangular windows. Large values tend to lead to variety of artifacts and are not recommended.
    def window_rounding : Float32
      @this.value.window_rounding
    end

    def window_rounding=(window_rounding : Float32)
      @this.value.window_rounding = window_rounding
    end

    # Thickness of border around windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
    def window_border_size : Float32
      @this.value.window_border_size
    end

    def window_border_size=(window_border_size : Float32)
      @this.value.window_border_size = window_border_size
    end

    # Minimum window size. This is a global setting. If you want to constraint individual windows, use SetNextWindowSizeConstraints().
    def window_min_size : ImVec2
      @this.value.window_min_size
    end

    def window_min_size=(window_min_size : ImVec2)
      @this.value.window_min_size = window_min_size
    end

    # Alignment for title bar text. Defaults to (0.0f,0.5f) for left-aligned,vertically centered.
    def window_title_align : ImVec2
      @this.value.window_title_align
    end

    def window_title_align=(window_title_align : ImVec2)
      @this.value.window_title_align = window_title_align
    end

    # Side of the collapsing/docking button in the title bar (None/Left/Right). Defaults to ImGuiDir_Left.
    def window_menu_button_position : ImGuiDir
      @this.value.window_menu_button_position
    end

    def window_menu_button_position=(window_menu_button_position : ImGuiDir)
      @this.value.window_menu_button_position = window_menu_button_position
    end

    # Radius of child window corners rounding. Set to 0.0f to have rectangular windows.
    def child_rounding : Float32
      @this.value.child_rounding
    end

    def child_rounding=(child_rounding : Float32)
      @this.value.child_rounding = child_rounding
    end

    # Thickness of border around child windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
    def child_border_size : Float32
      @this.value.child_border_size
    end

    def child_border_size=(child_border_size : Float32)
      @this.value.child_border_size = child_border_size
    end

    # Radius of popup window corners rounding. (Note that tooltip windows use WindowRounding)
    def popup_rounding : Float32
      @this.value.popup_rounding
    end

    def popup_rounding=(popup_rounding : Float32)
      @this.value.popup_rounding = popup_rounding
    end

    # Thickness of border around popup/tooltip windows. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
    def popup_border_size : Float32
      @this.value.popup_border_size
    end

    def popup_border_size=(popup_border_size : Float32)
      @this.value.popup_border_size = popup_border_size
    end

    # Padding within a framed rectangle (used by most widgets).
    def frame_padding : ImVec2
      @this.value.frame_padding
    end

    def frame_padding=(frame_padding : ImVec2)
      @this.value.frame_padding = frame_padding
    end

    # Radius of frame corners rounding. Set to 0.0f to have rectangular frame (used by most widgets).
    def frame_rounding : Float32
      @this.value.frame_rounding
    end

    def frame_rounding=(frame_rounding : Float32)
      @this.value.frame_rounding = frame_rounding
    end

    # Thickness of border around frames. Generally set to 0.0f or 1.0f. (Other values are not well tested and more CPU/GPU costly).
    def frame_border_size : Float32
      @this.value.frame_border_size
    end

    def frame_border_size=(frame_border_size : Float32)
      @this.value.frame_border_size = frame_border_size
    end

    # Horizontal and vertical spacing between widgets/lines.
    def item_spacing : ImVec2
      @this.value.item_spacing
    end

    def item_spacing=(item_spacing : ImVec2)
      @this.value.item_spacing = item_spacing
    end

    # Horizontal and vertical spacing between within elements of a composed widget (e.g. a slider and its label).
    def item_inner_spacing : ImVec2
      @this.value.item_inner_spacing
    end

    def item_inner_spacing=(item_inner_spacing : ImVec2)
      @this.value.item_inner_spacing = item_inner_spacing
    end

    # Expand reactive bounding box for touch-based system where touch position is not accurate enough. Unfortunately we don't sort widgets so priority on overlap will always be given to the first widget. So don't grow this too much!
    def touch_extra_padding : ImVec2
      @this.value.touch_extra_padding
    end

    def touch_extra_padding=(touch_extra_padding : ImVec2)
      @this.value.touch_extra_padding = touch_extra_padding
    end

    # Horizontal indentation when e.g. entering a tree node. Generally == (FontSize + FramePadding.x*2).
    def indent_spacing : Float32
      @this.value.indent_spacing
    end

    def indent_spacing=(indent_spacing : Float32)
      @this.value.indent_spacing = indent_spacing
    end

    # Minimum horizontal spacing between two columns. Preferably > (FramePadding.x + 1).
    def columns_min_spacing : Float32
      @this.value.columns_min_spacing
    end

    def columns_min_spacing=(columns_min_spacing : Float32)
      @this.value.columns_min_spacing = columns_min_spacing
    end

    # Width of the vertical scrollbar, Height of the horizontal scrollbar.
    def scrollbar_size : Float32
      @this.value.scrollbar_size
    end

    def scrollbar_size=(scrollbar_size : Float32)
      @this.value.scrollbar_size = scrollbar_size
    end

    # Radius of grab corners for scrollbar.
    def scrollbar_rounding : Float32
      @this.value.scrollbar_rounding
    end

    def scrollbar_rounding=(scrollbar_rounding : Float32)
      @this.value.scrollbar_rounding = scrollbar_rounding
    end

    # Minimum width/height of a grab box for slider/scrollbar.
    def grab_min_size : Float32
      @this.value.grab_min_size
    end

    def grab_min_size=(grab_min_size : Float32)
      @this.value.grab_min_size = grab_min_size
    end

    # Radius of grabs corners rounding. Set to 0.0f to have rectangular slider grabs.
    def grab_rounding : Float32
      @this.value.grab_rounding
    end

    def grab_rounding=(grab_rounding : Float32)
      @this.value.grab_rounding = grab_rounding
    end

    # The size in pixels of the dead-zone around zero on logarithmic sliders that cross zero.
    def log_slider_deadzone : Float32
      @this.value.log_slider_deadzone
    end

    def log_slider_deadzone=(log_slider_deadzone : Float32)
      @this.value.log_slider_deadzone = log_slider_deadzone
    end

    # Radius of upper corners of a tab. Set to 0.0f to have rectangular tabs.
    def tab_rounding : Float32
      @this.value.tab_rounding
    end

    def tab_rounding=(tab_rounding : Float32)
      @this.value.tab_rounding = tab_rounding
    end

    # Thickness of border around tabs.
    def tab_border_size : Float32
      @this.value.tab_border_size
    end

    def tab_border_size=(tab_border_size : Float32)
      @this.value.tab_border_size = tab_border_size
    end

    # Minimum width for close button to appears on an unselected tab when hovered. Set to 0.0f to always show when hovering, set to FLT_MAX to never show close button unless selected.
    def tab_min_width_for_unselected_close_button : Float32
      @this.value.tab_min_width_for_unselected_close_button
    end

    def tab_min_width_for_unselected_close_button=(tab_min_width_for_unselected_close_button : Float32)
      @this.value.tab_min_width_for_unselected_close_button = tab_min_width_for_unselected_close_button
    end

    # Side of the color button in the ColorEdit4 widget (left/right). Defaults to ImGuiDir_Right.
    def color_button_position : ImGuiDir
      @this.value.color_button_position
    end

    def color_button_position=(color_button_position : ImGuiDir)
      @this.value.color_button_position = color_button_position
    end

    # Alignment of button text when button is larger than text. Defaults to (0.5f, 0.5f) (centered).
    def button_text_align : ImVec2
      @this.value.button_text_align
    end

    def button_text_align=(button_text_align : ImVec2)
      @this.value.button_text_align = button_text_align
    end

    # Alignment of selectable text. Defaults to (0.0f, 0.0f) (top-left aligned). It's generally important to keep this left-aligned if you want to lay multiple items on a same line.
    def selectable_text_align : ImVec2
      @this.value.selectable_text_align
    end

    def selectable_text_align=(selectable_text_align : ImVec2)
      @this.value.selectable_text_align = selectable_text_align
    end

    # Window position are clamped to be visible within the display area or monitors by at least this amount. Only applies to regular windows.
    def display_window_padding : ImVec2
      @this.value.display_window_padding
    end

    def display_window_padding=(display_window_padding : ImVec2)
      @this.value.display_window_padding = display_window_padding
    end

    # If you cannot see the edges of your screen (e.g. on a TV) increase the safe area padding. Apply to popups/tooltips as well regular windows. NB: Prefer configuring your TV sets correctly!
    def display_safe_area_padding : ImVec2
      @this.value.display_safe_area_padding
    end

    def display_safe_area_padding=(display_safe_area_padding : ImVec2)
      @this.value.display_safe_area_padding = display_safe_area_padding
    end

    # Scale software rendered mouse cursor (when io.MouseDrawCursor is enabled). May be removed later.
    def mouse_cursor_scale : Float32
      @this.value.mouse_cursor_scale
    end

    def mouse_cursor_scale=(mouse_cursor_scale : Float32)
      @this.value.mouse_cursor_scale = mouse_cursor_scale
    end

    # Enable anti-aliased lines/borders. Disable if you are really tight on CPU/GPU. Latched at the beginning of the frame (copied to ImDrawList).
    def anti_aliased_lines : Bool
      @this.value.anti_aliased_lines
    end

    def anti_aliased_lines=(anti_aliased_lines : Bool)
      @this.value.anti_aliased_lines = anti_aliased_lines
    end

    # Enable anti-aliased lines/borders using textures where possible. Require back-end to render with bilinear filtering. Latched at the beginning of the frame (copied to ImDrawList).
    def anti_aliased_lines_use_tex : Bool
      @this.value.anti_aliased_lines_use_tex
    end

    def anti_aliased_lines_use_tex=(anti_aliased_lines_use_tex : Bool)
      @this.value.anti_aliased_lines_use_tex = anti_aliased_lines_use_tex
    end

    # Enable anti-aliased edges around filled shapes (rounded rectangles, circles, etc.). Disable if you are really tight on CPU/GPU. Latched at the beginning of the frame (copied to ImDrawList).
    def anti_aliased_fill : Bool
      @this.value.anti_aliased_fill
    end

    def anti_aliased_fill=(anti_aliased_fill : Bool)
      @this.value.anti_aliased_fill = anti_aliased_fill
    end

    # Tessellation tolerance when using PathBezierCurveTo() without a specific number of segments. Decrease for highly tessellated curves (higher quality, more polygons), increase to reduce quality.
    def curve_tessellation_tol : Float32
      @this.value.curve_tessellation_tol
    end

    def curve_tessellation_tol=(curve_tessellation_tol : Float32)
      @this.value.curve_tessellation_tol = curve_tessellation_tol
    end

    # Maximum error (in pixels) allowed when using AddCircle()/AddCircleFilled() or drawing rounded corner rectangles with no explicit segment count specified. Decrease for higher quality but more geometry.
    def circle_segment_max_error : Float32
      @this.value.circle_segment_max_error
    end

    def circle_segment_max_error=(circle_segment_max_error : Float32)
      @this.value.circle_segment_max_error = circle_segment_max_error
    end

    def colors : Slice(ImVec4)
      @this.value.colors.to_slice
    end

    def colors=(colors : Slice(ImVec4))
      @this.value.colors = colors
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1483)]
    def self.new : ImGuiStyle
      result = LibImGui.ImGuiStyle_ImGuiStyle
      ImGuiStyle.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1484)]
    def scale_all_sizes(scale_factor : Float32) : Void
      LibImGui.ImGuiStyle_ScaleAllSizes(self, scale_factor)
    end
  end

  alias TopLevel::ImGuiStyle = ImGui::ImGuiStyle

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1773)]
  struct ImGuiTextFilter
    include ClassType(LibImGui::ImGuiTextFilter)

    def input_buf : Slice(LibC::Char)
      @this.value.input_buf.to_slice
    end

    def input_buf=(input_buf : Slice(LibC::Char))
      @this.value.input_buf = input_buf
    end

    def filters : ImVector(LibImGui::ImGuiTextRange)
      t = @this.value.filters
      pointerof(t).as(ImVector(LibImGui::ImGuiTextRange)*).value
    end

    def filters=(filters : ImVector(LibImGui::ImGuiTextRange))
      @this.value.filters = filters.as(LibImGui::ImVectorInternal*).value
    end

    def count_grep : Int32
      @this.value.count_grep
    end

    def count_grep=(count_grep : Int32)
      @this.value.count_grep = count_grep
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1778)]
    def build : Void
      LibImGui.ImGuiTextFilter_Build(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1779)]
    def clear : Void
      LibImGui.ImGuiTextFilter_Clear(self)
    end

    # Helper calling InputText+Build
    #
    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1776)]
    def draw(label : String = "Filter(inc,-exc)", width : Float32 = 0.0) : Bool
      LibImGui.ImGuiTextFilter_Draw(self, label, width)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1775)]
    def self.new(default_filter : String = "") : ImGuiTextFilter
      result = LibImGui.ImGuiTextFilter_ImGuiTextFilter(default_filter)
      ImGuiTextFilter.new(result)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1780)]
    def is_active : Bool
      LibImGui.ImGuiTextFilter_IsActive(self)
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L1777)]
    def pass_filter(text : Bytes | String) : Bool
      LibImGui.ImGuiTextFilter_PassFilter(self, text, (text.to_unsafe + text.bytesize))
    end
  end

  alias TopLevel::ImGuiTextFilter = ImGui::ImGuiTextFilter

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L211)]
  struct ImVec2
    include StructType

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L214)]
    def self.new : ImVec2
      result = LibImGui.ImVec2_ImVec2Nil
      result.value
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L215)]
    def self.new(_x : Float32, _y : Float32) : ImVec2
      result = LibImGui.ImVec2_ImVec2Float(_x, _y)
      result.value
    end
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L224)]
  struct ImVec4
    include StructType

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L227)]
    def self.new : ImVec4
      result = LibImGui.ImVec4_ImVec4Nil
      result.value
    end

    # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L228)]
    def self.new(_x : Float32, _y : Float32, _z : Float32, _w : Float32) : ImVec4
      result = LibImGui.ImVec4_ImVec4Float(_x, _y, _z, _w)
      result.value
    end
  end

  struct ImVector
    include StructType
  end

  # accept contents of a given type. If ImGuiDragDropFlags_AcceptBeforeDelivery is set you can peek into the payload before the mouse button is released.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L676)]
  def self.accept_drag_drop_payload(type : String, flags : ImGuiDragDropFlags = ImGuiDragDropFlags.new(0)) : ImGuiPayload?
    result = LibImGui.igAcceptDragDropPayload(type, flags)
    result ? ImGuiPayload.new(result) : nil
  end

  # vertically align upcoming text baseline to FramePadding.y so that it will align properly to regularly framed items (call if you have text on a line before a framed item)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L400)]
  def self.align_text_to_frame_padding : Void
    LibImGui.igAlignTextToFramePadding
  end

  # square button with an arrow shape
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L443)]
  def self.arrow_button(str_id : String, dir : ImGuiDir) : Bool
    LibImGui.igArrowButton(str_id, dir)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L284)]
  pointer_wrapper def self.begin(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBegin(name, p_open, flags)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L292)]
  def self.begin_child(str_id : String, size : ImVec2 = ImVec2.new(0, 0), border : Bool = false, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBeginChildStr(str_id, size, border, flags)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L293)]
  def self.begin_child(id : ImGuiID, size : ImVec2 = ImVec2.new(0, 0), border : Bool = false, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBeginChildID(id, size, border, flags)
  end

  # helper to create a child window / scrolling region that looks like a normal widget frame
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L722)]
  def self.begin_child_frame(id : ImGuiID, size : ImVec2, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBeginChildFrame(id, size, flags)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L456)]
  def self.begin_combo(label : String, preview_value : String, flags : ImGuiComboFlags = ImGuiComboFlags.new(0)) : Bool
    LibImGui.igBeginCombo(label, preview_value, flags)
  end

  # call when the current item is active. If this return true, you can call SetDragDropPayload() + EndDragDropSource()
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L672)]
  def self.begin_drag_drop_source(flags : ImGuiDragDropFlags = ImGuiDragDropFlags.new(0)) : Bool
    LibImGui.igBeginDragDropSource(flags)
  end

  # call after submitting an item that may receive a payload. If this returns true, you can call AcceptDragDropPayload() + EndDragDropTarget()
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L675)]
  def self.begin_drag_drop_target : Bool
    LibImGui.igBeginDragDropTarget
  end

  # lock horizontal starting position
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L389)]
  def self.begin_group : Void
    LibImGui.igBeginGroup
  end

  # create and append to a full screen menu-bar.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L588)]
  def self.begin_main_menu_bar : Bool
    LibImGui.igBeginMainMenuBar
  end

  # create a sub-menu entry. only call EndMenu() if this returns true!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L590)]
  def self.begin_menu(label : String, enabled : Bool = true) : Bool
    LibImGui.igBeginMenu(label, enabled)
  end

  # append to menu-bar of current window (requires ImGuiWindowFlags_MenuBar flag set on parent window).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L586)]
  def self.begin_menu_bar : Bool
    LibImGui.igBeginMenuBar
  end

  # return true if the popup is open, and you can start outputting to it.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L613)]
  def self.begin_popup(str_id : String, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBeginPopup(str_id, flags)
  end

  # open+begin popup when clicked on last item. if you can pass a NULL str_id only if the previous item had an id. If you want to use that on a non-interactive item such as Text() you need to pass in an explicit ID here. read comments in .cpp!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L630)]
  def self.begin_popup_context_item(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.igBeginPopupContextItem(str_id, popup_flags)
  end

  # open+begin popup when clicked in void (where there are no windows).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L632)]
  def self.begin_popup_context_void(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.igBeginPopupContextVoid(str_id, popup_flags)
  end

  # open+begin popup when clicked on current window.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L631)]
  def self.begin_popup_context_window(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.igBeginPopupContextWindow(str_id, popup_flags)
  end

  # return true if the modal is open, and you can start outputting to it.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L614)]
  pointer_wrapper def self.begin_popup_modal(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBeginPopupModal(name, p_open, flags)
  end

  # create and append into a TabBar
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L654)]
  def self.begin_tab_bar(str_id : String, flags : ImGuiTabBarFlags = ImGuiTabBarFlags.new(0)) : Bool
    LibImGui.igBeginTabBar(str_id, flags)
  end

  # create a Tab. Returns true if the Tab is selected.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L656)]
  pointer_wrapper def self.begin_tab_item(label : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiTabItemFlags = ImGuiTabItemFlags.new(0)) : Bool
    LibImGui.igBeginTabItem(label, p_open, flags)
  end

  # begin/append a tooltip window. to create full-featured tooltip (with any kind of items).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L597)]
  def self.begin_tooltip : Void
    LibImGui.igBeginTooltip
  end

  # draw a small circle + keep the cursor on the same line. advance cursor x position by GetTreeNodeToLabelSpacing(), same distance that TreeNode() uses
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L451)]
  def self.bullet : Void
    LibImGui.igBullet
  end

  # shortcut for Bullet()+Text()
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L434)]
  def self.bullet_text(fmt : String, *args) : Void
    LibImGui.igBulletText(fmt, *args._promote_va_args)
  end

  # button
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L440)]
  def self.button(label : String, size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igButton(label, size)
  end

  # width of item given pushed settings and current cursor position. NOT necessarily the width of last item unlike most 'Item' functions.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L367)]
  def self.calc_item_width : Float32
    LibImGui.igCalcItemWidth
  end

  # calculate coarse clipping for large list of evenly sized items. Prefer using the ImGuiListClipper higher-level helper if you can.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L721)]
  def self.calc_list_clipping(items_count : Int32, items_height : Float32) : {LibC::Int, LibC::Int}
    LibImGui.igCalcListClipping(items_count, items_height, out out_items_display_start, out out_items_display_end)
    {out_items_display_start, out_items_display_end}
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L726)]
  def self.calc_text_size(text : Bytes | String, hide_text_after_double_hash : Bool = false, wrap_width : Float32 = -1.0) : ImGui::ImVec2
    LibImGui.igCalcTextSize(out p_out, text, (text.to_unsafe + text.bytesize), hide_text_after_double_hash, wrap_width)
    p_out
  end

  # attention: misleading name! manually override io.WantCaptureKeyboard flag next frame (said flag is entirely left for your application to handle). e.g. force capture keyboard when your widget is being hovered. This is equivalent to setting "io.WantCaptureKeyboard = want_capture_keyboard_value"; after the next NewFrame() call.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L742)]
  def self.capture_keyboard_from_app(want_capture_keyboard_value : Bool = true) : Void
    LibImGui.igCaptureKeyboardFromApp(want_capture_keyboard_value)
  end

  # attention: misleading name! manually override io.WantCaptureMouse flag next frame (said flag is entirely left for your application to handle). This is equivalent to setting "io.WantCaptureMouse = want_capture_mouse_value;" after the next NewFrame() call.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L762)]
  def self.capture_mouse_from_app(want_capture_mouse_value : Bool = true) : Void
    LibImGui.igCaptureMouseFromApp(want_capture_mouse_value)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L446)]
  pointer_wrapper def self.checkbox(label : String, v : Bool*) : Bool
    LibImGui.igCheckbox(label, v)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L447)]
  pointer_wrapper def self.checkbox_flags(label : String, flags : UInt32*, flags_value : UInt32) : Bool
    LibImGui.igCheckboxFlags(label, flags, flags_value)
  end

  # manually close the popup we have begin-ed into.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L624)]
  def self.close_current_popup : Void
    LibImGui.igCloseCurrentPopup
  end

  # if returning 'true' the header is open. doesn't indent nor push on ID stack. user doesn't have to call TreePop().
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L551)]
  pointer_wrapper def self.collapsing_header(label : String, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.igCollapsingHeaderTreeNodeFlags(label, flags)
  end
  # when 'p_open' isn't NULL, display an additional small close button on upper right of the header
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L552)]
  pointer_wrapper def self.collapsing_header(label : String, p_open : Bool*, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.igCollapsingHeaderBoolPtr(label, p_open, flags)
  end

  # display a colored square/button, hover for details, return true when pressed.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L532)]
  def self.color_button(desc_id : String, col : ImVec4, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igColorButton(desc_id, col, flags, size)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L730)]
  def self.color_convert_float4_to_u32(in_ : ImVec4) : UInt32
    LibImGui.igColorConvertFloat4ToU32(in_)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L732)]
  def self.color_convert_hs_vto_rgb(h : Float32, s : Float32, v : Float32) : {LibC::Float, LibC::Float, LibC::Float}
    LibImGui.igColorConvertHSVtoRGB(h, s, v, out out_r, out out_g, out out_b)
    {out_r, out_g, out_b}
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L731)]
  def self.color_convert_rg_bto_hsv(r : Float32, g : Float32, b : Float32) : {LibC::Float, LibC::Float, LibC::Float}
    LibImGui.igColorConvertRGBtoHSV(r, g, b, out out_h, out out_s, out out_v)
    {out_h, out_s, out_v}
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L729)]
  def self.color_convert_u32_to_float4(in_ : UInt32) : ImGui::ImVec4
    LibImGui.igColorConvertU32ToFloat4(out p_out, in_)
    p_out
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L528)]
  pointer_wrapper def self.color_edit3(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.igColorEdit3(label, col.is_a?(Indexable) ? (
      col.size == 3 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 3)")
    ) : col.as(Float32*), flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L529)]
  pointer_wrapper def self.color_edit4(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.igColorEdit4(label, col.is_a?(Indexable) ? (
      col.size == 4 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 4)")
    ) : col.as(Float32*), flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L530)]
  pointer_wrapper def self.color_picker3(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.igColorPicker3(label, col.is_a?(Indexable) ? (
      col.size == 3 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 3)")
    ) : col.as(Float32*), flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L531)]
  pointer_wrapper def self.color_picker4(label : String, col : ImVec4* | Indexable(Float32) | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0), ref_col : Float32* = Pointer(Float32).null) : Bool
    LibImGui.igColorPicker4(label, col.is_a?(Indexable) ? (
      col.size == 4 ? col.to_unsafe : raise ArgumentError.new("Slice has wrong size #{col.size} (want 4)")
    ) : col.as(Float32*), flags, ref_col)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L644)]
  def self.columns(count : Int32 = 1, id : String? = nil, border : Bool = true) : Void
    LibImGui.igColumns(count, id, border)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L458)]
  pointer_wrapper def self.combo(label : String, current_item : Int32*, items : Indexable(LibC::Char*), popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.igComboStr_arr(label, current_item, items, items.size, popup_max_height_in_items)
  end
  # Separate items with \0 within a string, end item-list with \0\0. e.g. "One\0Two\0Three\0"
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L459)]
  pointer_wrapper def self.combo(label : String, current_item : Int32*, items_separated_by_zeros : String, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.igComboStr(label, current_item, items_separated_by_zeros, popup_max_height_in_items)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L460)]
  pointer_wrapper def self.combo(label : String, current_item : Int32*, items_getter : (Void*, Int32, LibC::Char**) -> Bool, data : Void*, items_count : Int32, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.igComboFnBoolPtr(label, current_item, items_getter, data, items_count, popup_max_height_in_items)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L244)]
  def self.create_context(shared_font_atlas : ImFontAtlas? = nil) : ImGuiContext
    result = LibImGui.igCreateContext(shared_font_atlas)
    result.value
  end

  # This is called by IMGUI_CHECKVERSION() macro.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L778)]
  def self.debug_check_version_and_data_layout(version_str : String, sz_io : LibC::SizeT, sz_style : LibC::SizeT, sz_vec2 : LibC::SizeT, sz_vec4 : LibC::SizeT, sz_drawvert : LibC::SizeT, sz_drawidx : LibC::SizeT) : Bool
    LibImGui.igDebugCheckVersionAndDataLayout(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx)
  end

  # NULL = destroy current context
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L245)]
  def self.destroy_context(ctx : ImGuiContext? = nil) : Void
    LibImGui.igDestroyContext(ctx)
  end

  # If v_min >= v_max we have no bound
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L473)]
  pointer_wrapper def self.drag_float(label : String, v : Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragFloat(label, v, v_speed, v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L474)]
  pointer_wrapper def self.drag_float2(label : String, v : ImVec2* | Indexable(Float32) | Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragFloat2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Float32*), v_speed, v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L475)]
  pointer_wrapper def self.drag_float3(label : String, v : Indexable(Float32) | Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragFloat3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Float32*), v_speed, v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L476)]
  pointer_wrapper def self.drag_float4(label : String, v : ImVec4* | Indexable(Float32) | Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragFloat4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Float32*), v_speed, v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L477)]
  pointer_wrapper def self.drag_float_range2(label : String, v_current_min : Float32*, v_current_max : Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", format_max : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags)
  end
  # If v_min >= v_max we have no bound
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L478)]
  pointer_wrapper def self.drag_int(label : String, v : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragInt(label, v, v_speed, v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L479)]
  pointer_wrapper def self.drag_int2(label : String, v : Indexable(Int32) | Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragInt2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Int32*), v_speed, v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L480)]
  pointer_wrapper def self.drag_int3(label : String, v : Indexable(Int32) | Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragInt3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Int32*), v_speed, v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L481)]
  pointer_wrapper def self.drag_int4(label : String, v : Indexable(Int32) | Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragInt4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Int32*), v_speed, v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L482)]
  pointer_wrapper def self.drag_int_range2(label : String, v_current_min : Int32*, v_current_max : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", format_max : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
#[[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L483)]
  pointer_wrapper def self.drag_scalar(label : String, p_data : {{t}}*, v_speed : Float32, p_min : {{t}}? = nil, p_max : {{t}}? = nil, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragScalar(label, ImGuiDataType::{{k.id}}, p_data, v_speed, p_min ? (p_min_ = p_min; pointerof(p_min_)) : Pointer({{t}}).null, p_max ? (p_max_ = p_max; pointerof(p_max_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
#[[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L484)]
  pointer_wrapper def self.drag_scalar_n(label : String, p_data : {{t}}*, components : Int32, v_speed : Float32, p_min : {{t}}* = Pointer({{t}}).null, p_max : {{t}}* = Pointer({{t}}).null, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igDragScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, v_speed, p_min, p_max, format, flags)
  end
  {% end %}

  # add a dummy item of given size. unlike InvisibleButton(), Dummy() won't take the mouse click or be navigable into.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L386)]
  def self.dummy(size : ImVec2) : Void
    LibImGui.igDummy(size)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L285)]
  def self.end : Void
    LibImGui.igEnd
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L294)]
  def self.end_child : Void
    LibImGui.igEndChild
  end

  # always call EndChildFrame() regardless of BeginChildFrame() return values (which indicates a collapsed/clipped window)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L723)]
  def self.end_child_frame : Void
    LibImGui.igEndChildFrame
  end

  # only call EndCombo() if BeginCombo() returns true!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L457)]
  def self.end_combo : Void
    LibImGui.igEndCombo
  end

  # only call EndDragDropSource() if BeginDragDropSource() returns true!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L674)]
  def self.end_drag_drop_source : Void
    LibImGui.igEndDragDropSource
  end

  # only call EndDragDropTarget() if BeginDragDropTarget() returns true!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L677)]
  def self.end_drag_drop_target : Void
    LibImGui.igEndDragDropTarget
  end

  # ends the Dear ImGui frame. automatically called by Render(). If you don't need to render data (skipping rendering) you may call EndFrame() without Render()... but you'll have wasted CPU already! If you don't need to render, better to not create any windows and not call NewFrame() at all!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L253)]
  def self.end_frame : Void
    LibImGui.igEndFrame
  end

  # unlock horizontal starting position + capture the whole group bounding box into one "item" (so you can use IsItemHovered() or layout primitives such as SameLine() on whole group, etc.)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L390)]
  def self.end_group : Void
    LibImGui.igEndGroup
  end

  # only call EndMainMenuBar() if BeginMainMenuBar() returns true!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L589)]
  def self.end_main_menu_bar : Void
    LibImGui.igEndMainMenuBar
  end

  # only call EndMenu() if BeginMenu() returns true!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L591)]
  def self.end_menu : Void
    LibImGui.igEndMenu
  end

  # only call EndMenuBar() if BeginMenuBar() returns true!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L587)]
  def self.end_menu_bar : Void
    LibImGui.igEndMenuBar
  end

  # only call EndPopup() if BeginPopupXXX() returns true!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L615)]
  def self.end_popup : Void
    LibImGui.igEndPopup
  end

  # only call EndTabBar() if BeginTabBar() returns true!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L655)]
  def self.end_tab_bar : Void
    LibImGui.igEndTabBar
  end

  # only call EndTabItem() if BeginTabItem() returns true!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L657)]
  def self.end_tab_item : Void
    LibImGui.igEndTabItem
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L598)]
  def self.end_tooltip : Void
    LibImGui.igEndTooltip
  end

  # this draw list will be the first rendering one. Useful to quickly draw shapes/text behind dear imgui contents.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L715)]
  def self.get_background_draw_list : ImDrawList
    result = LibImGui.igGetBackgroundDrawList
    ImDrawList.new(result)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L766)]
  def self.get_clipboard_text : String
    result = LibImGui.igGetClipboardText
    String.new(result)
  end

  # retrieve given style color with style alpha applied and optional extra alpha multiplier
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L359)]
  def self.get_color_u32(idx : ImGuiCol, alpha_mul : Float32 = 1.0) : UInt32
    LibImGui.igGetColorU32Col(idx, alpha_mul)
  end

  # retrieve given color with style alpha applied
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L360)]
  def self.get_color_u32(col : ImVec4) : UInt32
    LibImGui.igGetColorU32Vec4(col)
  end

  # retrieve given color with style alpha applied
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L361)]
  def self.get_color_u32(col : UInt32) : UInt32
    LibImGui.igGetColorU32U32(col)
  end

  # get current column index
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L646)]
  def self.get_column_index : Int32
    LibImGui.igGetColumnIndex
  end

  # get position of column line (in pixels, from the left side of the contents region). pass -1 to use current column, otherwise 0..GetColumnsCount() inclusive. column 0 is typically 0.0f
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L649)]
  def self.get_column_offset(column_index : Int32 = -1) : Float32
    LibImGui.igGetColumnOffset(column_index)
  end

  # get column width (in pixels). pass -1 to use current column
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L647)]
  def self.get_column_width(column_index : Int32 = -1) : Float32
    LibImGui.igGetColumnWidth(column_index)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L651)]
  def self.get_columns_count : Int32
    LibImGui.igGetColumnsCount
  end

  # == GetContentRegionMax() - GetCursorPos()
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L329)]
  def self.get_content_region_avail : ImGui::ImVec2
    LibImGui.igGetContentRegionAvail(out p_out)
    p_out
  end

  # current content boundaries (typically window boundaries including scrolling, or current column boundaries), in windows coordinates
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L328)]
  def self.get_content_region_max : ImGui::ImVec2
    LibImGui.igGetContentRegionMax(out p_out)
    p_out
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L246)]
  def self.get_current_context : ImGuiContext
    result = LibImGui.igGetCurrentContext
    result.value
  end

  # cursor position in window coordinates (relative to window position)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L391)]
  def self.get_cursor_pos : ImGui::ImVec2
    LibImGui.igGetCursorPos(out p_out)
    p_out
  end

  # (some functions are using window-relative coordinates, such as: GetCursorPos, GetCursorStartPos, GetContentRegionMax, GetWindowContentRegion* etc.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L392)]
  def self.get_cursor_pos_x : Float32
    LibImGui.igGetCursorPosX
  end

  # other functions such as GetCursorScreenPos or everything in ImDrawList::
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L393)]
  def self.get_cursor_pos_y : Float32
    LibImGui.igGetCursorPosY
  end

  # cursor position in absolute screen coordinates [0..io.DisplaySize] (useful to work with ImDrawList API)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L398)]
  def self.get_cursor_screen_pos : ImGui::ImVec2
    LibImGui.igGetCursorScreenPos(out p_out)
    p_out
  end

  # initial cursor position in window coordinates
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L397)]
  def self.get_cursor_start_pos : ImGui::ImVec2
    LibImGui.igGetCursorStartPos(out p_out)
    p_out
  end

  # peek directly into the current payload from anywhere. may return NULL. use ImGuiPayload::IsDataType() to test for the payload type.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L678)]
  def self.get_drag_drop_payload : ImGuiPayload?
    result = LibImGui.igGetDragDropPayload
    result ? ImGuiPayload.new(result) : nil
  end

  # valid after Render() and until the next call to NewFrame(). this is what you have to render.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L255)]
  def self.get_draw_data : ImDrawData
    result = LibImGui.igGetDrawData
    ImDrawData.new(result)
  end

  # you may use this when creating your own ImDrawList instances.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L717)]
  def self.get_draw_list_shared_data : ImDrawListSharedData
    result = LibImGui.igGetDrawListSharedData
    result.value
  end

  # get current font
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L356)]
  def self.get_font : ImFont
    result = LibImGui.igGetFont
    ImFont.new(result)
  end

  # get current font size (= height in pixels) of current font with current scale applied
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L357)]
  def self.get_font_size : Float32
    LibImGui.igGetFontSize
  end

  # get UV coordinate for a while pixel, useful to draw custom shapes via the ImDrawList API
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L358)]
  def self.get_font_tex_uv_white_pixel : ImGui::ImVec2
    LibImGui.igGetFontTexUvWhitePixel(out p_out)
    p_out
  end

  # this draw list will be the last rendered one. Useful to quickly draw shapes/text over dear imgui contents.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L716)]
  def self.get_foreground_draw_list : ImDrawList
    result = LibImGui.igGetForegroundDrawListNil
    ImDrawList.new(result)
  end

  # get global imgui frame count. incremented by 1 every frame.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L714)]
  def self.get_frame_count : Int32
    LibImGui.igGetFrameCount
  end

  # ~ FontSize + style.FramePadding.y * 2
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L403)]
  def self.get_frame_height : Float32
    LibImGui.igGetFrameHeight
  end

  # ~ FontSize + style.FramePadding.y * 2 + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of framed widgets)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L404)]
  def self.get_frame_height_with_spacing : Float32
    LibImGui.igGetFrameHeightWithSpacing
  end

  # calculate unique ID (hash of whole ID stack + given parameter). e.g. if you want to query into ImGuiStorage yourself
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L418)]
  def self.get_id(str_id : String) : ImGuiID
    LibImGui.igGetIDStr(str_id)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L419)]
  def self.get_id(str_id : Bytes | String) : ImGuiID
    LibImGui.igGetIDStrStr(str_id, (str_id.to_unsafe + str_id.bytesize))
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L420)]
  def self.get_id(ptr_id : Reference | ClassType | Int | Void*) : ImGuiID
    LibImGui.igGetIDPtr(to_void_id(ptr_id))
  end

  # access the IO structure (mouse/keyboard/gamepad inputs, time, various configuration options/flags)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L250)]
  def self.get_io : ImGuiIO
    result = LibImGui.igGetIO
    ImGuiIO.new(result)
  end

  # get lower-right bounding rectangle of the last item (screen space)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L706)]
  def self.get_item_rect_max : ImGui::ImVec2
    LibImGui.igGetItemRectMax(out p_out)
    p_out
  end

  # get upper-left bounding rectangle of the last item (screen space)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L705)]
  def self.get_item_rect_min : ImGui::ImVec2
    LibImGui.igGetItemRectMin(out p_out)
    p_out
  end

  # get size of last item
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L707)]
  def self.get_item_rect_size : ImGui::ImVec2
    LibImGui.igGetItemRectSize(out p_out)
    p_out
  end

  # map ImGuiKey_* values into user's key index. == io.KeyMap[key]
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L737)]
  def self.get_key_index(imgui_key : ImGuiKey) : Int32
    LibImGui.igGetKeyIndex(imgui_key)
  end

  # uses provided repeat rate/delay. return a count, most often 0 or 1 but might be >1 if RepeatRate is small enough that DeltaTime > RepeatRate
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L741)]
  def self.get_key_pressed_amount(key_index : Int32, repeat_delay : Float32, rate : Float32) : Int32
    LibImGui.igGetKeyPressedAmount(key_index, repeat_delay, rate)
  end

  # get desired cursor type, reset in ImGui::NewFrame(), this is updated during the frame. valid before Render(). If you use software rendering by setting io.MouseDrawCursor ImGui will render those for you
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L760)]
  def self.get_mouse_cursor : ImGuiMouseCursor
    LibImGui.igGetMouseCursor
  end

  # return the delta from the initial clicking position while the mouse button is pressed or was just released. This is locked and return 0.0f until the mouse moves past a distance threshold at least once (if lock_threshold < -1.0f, uses io.MouseDraggingThreshold)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L758)]
  def self.get_mouse_drag_delta(button : ImGuiMouseButton = ImGuiMouseButton.new(0), lock_threshold : Float32 = -1.0) : ImGui::ImVec2
    LibImGui.igGetMouseDragDelta(out p_out, button, lock_threshold)
    p_out
  end

  # shortcut to ImGui::GetIO().MousePos provided by user, to be consistent with other calls
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L755)]
  def self.get_mouse_pos : ImGui::ImVec2
    LibImGui.igGetMousePos(out p_out)
    p_out
  end

  # retrieve mouse position at the time of opening popup we have BeginPopup() into (helper to avoid user backing that value themselves)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L756)]
  def self.get_mouse_pos_on_opening_current_popup : ImGui::ImVec2
    LibImGui.igGetMousePosOnOpeningCurrentPopup(out p_out)
    p_out
  end

  # get maximum scrolling amount ~~ ContentSize.x - WindowSize.x
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L337)]
  def self.get_scroll_max_x : Float32
    LibImGui.igGetScrollMaxX
  end

  # get maximum scrolling amount ~~ ContentSize.y - WindowSize.y
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L338)]
  def self.get_scroll_max_y : Float32
    LibImGui.igGetScrollMaxY
  end

  # get scrolling amount [0..GetScrollMaxX()]
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L335)]
  def self.get_scroll_x : Float32
    LibImGui.igGetScrollX
  end

  # get scrolling amount [0..GetScrollMaxY()]
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L336)]
  def self.get_scroll_y : Float32
    LibImGui.igGetScrollY
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L720)]
  def self.get_state_storage : ImGuiStorage
    result = LibImGui.igGetStateStorage
    result.value
  end

  # access the Style structure (colors, sizes). Always use PushStyleCol(), PushStyleVar() to modify style mid-frame!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L251)]
  def self.get_style : ImGuiStyle
    result = LibImGui.igGetStyle
    ImGuiStyle.new(result)
  end

  # get a string corresponding to the enum value (for display, saving, etc.).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L718)]
  def self.get_style_color_name(idx : ImGuiCol) : String
    result = LibImGui.igGetStyleColorName(idx)
    String.new(result)
  end

  # retrieve style color as stored in ImGuiStyle structure. use to feed back into PushStyleColor(), otherwise use GetColorU32() to get style color with style alpha baked in.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L355)]
  def self.get_style_color_vec4(idx : ImGuiCol) : ImVec4
    result = LibImGui.igGetStyleColorVec4(idx)
    result.value
  end

  # ~ FontSize
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L401)]
  def self.get_text_line_height : Float32
    LibImGui.igGetTextLineHeight
  end

  # ~ FontSize + style.ItemSpacing.y (distance in pixels between 2 consecutive lines of text)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L402)]
  def self.get_text_line_height_with_spacing : Float32
    LibImGui.igGetTextLineHeightWithSpacing
  end

  # get global imgui time. incremented by io.DeltaTime every frame.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L713)]
  def self.get_time : Float64
    LibImGui.igGetTime
  end

  # horizontal distance preceding label when using TreeNode*() or Bullet() == (g.FontSize + style.FramePadding.x*2) for a regular unframed TreeNode
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L550)]
  def self.get_tree_node_to_label_spacing : Float32
    LibImGui.igGetTreeNodeToLabelSpacing
  end

  # get the compiled version string e.g. "1.23" (essentially the compiled value for IMGUI_VERSION)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L265)]
  def self.get_version : String
    result = LibImGui.igGetVersion
    String.new(result)
  end

  # content boundaries max (roughly (0,0)+Size-Scroll) where Size can be override with SetNextWindowContentSize(), in window coordinates
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L331)]
  def self.get_window_content_region_max : ImGui::ImVec2
    LibImGui.igGetWindowContentRegionMax(out p_out)
    p_out
  end

  # content boundaries min (roughly (0,0)-Scroll), in window coordinates
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L330)]
  def self.get_window_content_region_min : ImGui::ImVec2
    LibImGui.igGetWindowContentRegionMin(out p_out)
    p_out
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L332)]
  def self.get_window_content_region_width : Float32
    LibImGui.igGetWindowContentRegionWidth
  end

  # get draw list associated to the current window, to append your own drawing primitives
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L302)]
  def self.get_window_draw_list : ImDrawList
    result = LibImGui.igGetWindowDrawList
    ImDrawList.new(result)
  end

  # get current window height (shortcut for GetWindowSize().y)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L306)]
  def self.get_window_height : Float32
    LibImGui.igGetWindowHeight
  end

  # get current window position in screen space (useful if you want to do your own drawing via the DrawList API)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L303)]
  def self.get_window_pos : ImGui::ImVec2
    LibImGui.igGetWindowPos(out p_out)
    p_out
  end

  # get current window size
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L304)]
  def self.get_window_size : ImGui::ImVec2
    LibImGui.igGetWindowSize(out p_out)
    p_out
  end

  # get current window width (shortcut for GetWindowSize().x)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L305)]
  def self.get_window_width : Float32
    LibImGui.igGetWindowWidth
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L444)]
  def self.image(user_texture_id : ImTextureID, size : ImVec2, uv0 : ImVec2 = ImVec2.new(0, 0), uv1 : ImVec2 = ImVec2.new(1, 1), tint_col : ImVec4 = ImVec4(1, 1, 1, 1), border_col : ImVec4 = ImVec4(0, 0, 0, 0)) : Void
    LibImGui.igImage(user_texture_id, size, uv0, uv1, tint_col, border_col)
  end

  # <0 frame_padding uses default frame padding settings. 0 for no padding
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L445)]
  def self.image_button(user_texture_id : ImTextureID, size : ImVec2, uv0 : ImVec2 = ImVec2.new(0, 0), uv1 : ImVec2 = ImVec2.new(1, 1), frame_padding : Int32 = -1, bg_col : ImVec4 = ImVec4(0, 0, 0, 0), tint_col : ImVec4 = ImVec4(1, 1, 1, 1)) : Bool
    LibImGui.igImageButton(user_texture_id, size, uv0, uv1, frame_padding, bg_col, tint_col)
  end

  # move content position toward the right, by style.IndentSpacing or indent_w if != 0
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L387)]
  def self.indent(indent_w : Float32 = 0.0) : Void
    LibImGui.igIndent(indent_w)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L521)]
  pointer_wrapper def self.input_double(label : String, v : Float64*, step : Float64 = 0.0, step_fast : Float64 = 0.0, format : String = "%.6f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputDouble(label, v, step, step_fast, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L513)]
  pointer_wrapper def self.input_float(label : String, v : Float32*, step : Float32 = 0.0, step_fast : Float32 = 0.0, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputFloat(label, v, step, step_fast, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L514)]
  pointer_wrapper def self.input_float2(label : String, v : ImVec2* | Indexable(Float32) | Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputFloat2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Float32*), format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L515)]
  pointer_wrapper def self.input_float3(label : String, v : Indexable(Float32) | Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputFloat3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Float32*), format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L516)]
  pointer_wrapper def self.input_float4(label : String, v : ImVec4* | Indexable(Float32) | Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputFloat4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Float32*), format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L517)]
  pointer_wrapper def self.input_int(label : String, v : Int32*, step : Int32 = 1, step_fast : Int32 = 100, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputInt(label, v, step, step_fast, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L518)]
  pointer_wrapper def self.input_int2(label : String, v : Indexable(Int32) | Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputInt2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Int32*), flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L519)]
  pointer_wrapper def self.input_int3(label : String, v : Indexable(Int32) | Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputInt3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Int32*), flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L520)]
  pointer_wrapper def self.input_int4(label : String, v : Indexable(Int32) | Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputInt4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Int32*), flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
#[[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L522)]
  pointer_wrapper def self.input_scalar(label : String, p_data : {{t}}*, p_step : {{t}}? = nil, p_step_fast : {{t}}? = nil, format : String? = nil, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputScalar(label, ImGuiDataType::{{k.id}}, p_data, p_step ? (p_step_ = p_step; pointerof(p_step_)) : Pointer({{t}}).null, p_step_fast ? (p_step_fast_ = p_step_fast; pointerof(p_step_fast_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
#[[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L523)]
  pointer_wrapper def self.input_scalar_n(label : String, p_data : {{t}}*, components : Int32, p_step : {{t}}* = Pointer({{t}}).null, p_step_fast : {{t}}* = Pointer({{t}}).null, format : String? = nil, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, p_step, p_step_fast, format, flags)
  end
  {% end %}

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L510)]
  def self.input_text(label : String, buf : Bytes, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.igInputText(label, buf, buf.size, flags, callback, user_data)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L511)]
  def self.input_text_multiline(label : String, buf : Bytes, size : ImVec2 = ImVec2.new(0, 0), flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.igInputTextMultiline(label, buf, buf.size, size, flags, callback, user_data)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L512)]
  def self.input_text_with_hint(label : String, hint : String, buf : Bytes, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.igInputTextWithHint(label, hint, buf, buf.size, flags, callback, user_data)
  end

  # flexible button behavior without the visuals, frequently useful to build custom behaviors using the public api (along with IsItemActive, IsItemHovered, etc.)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L442)]
  def self.invisible_button(str_id : String, size : ImVec2, flags : ImGuiButtonFlags = ImGuiButtonFlags.new(0)) : Bool
    LibImGui.igInvisibleButton(str_id, size, flags)
  end

  # is any item active?
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L703)]
  def self.is_any_item_active : Bool
    LibImGui.igIsAnyItemActive
  end

  # is any item focused?
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L704)]
  def self.is_any_item_focused : Bool
    LibImGui.igIsAnyItemFocused
  end

  # is any item hovered?
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L702)]
  def self.is_any_item_hovered : Bool
    LibImGui.igIsAnyItemHovered
  end

  # is any mouse button held?
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L754)]
  def self.is_any_mouse_down : Bool
    LibImGui.igIsAnyMouseDown
  end

  # was the last item just made active (item was previously inactive).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L698)]
  def self.is_item_activated : Bool
    LibImGui.igIsItemActivated
  end

  # is the last item active? (e.g. button being held, text field being edited. This will continuously return true while holding mouse button on an item. Items that don't interact will always return false)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L693)]
  def self.is_item_active : Bool
    LibImGui.igIsItemActive
  end

  # is the last item clicked? (e.g. button/node just clicked on) == IsMouseClicked(mouse_button) && IsItemHovered()
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L695)]
  def self.is_item_clicked(mouse_button : ImGuiMouseButton = ImGuiMouseButton.new(0)) : Bool
    LibImGui.igIsItemClicked(mouse_button)
  end

  # was the last item just made inactive (item was previously active). Useful for Undo/Redo patterns with widgets that requires continuous editing.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L699)]
  def self.is_item_deactivated : Bool
    LibImGui.igIsItemDeactivated
  end

  # was the last item just made inactive and made a value change when it was active? (e.g. Slider/Drag moved). Useful for Undo/Redo patterns with widgets that requires continuous editing. Note that you may get false positives (some widgets such as Combo()/ListBox()/Selectable() will return true even when clicking an already selected item).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L700)]
  def self.is_item_deactivated_after_edit : Bool
    LibImGui.igIsItemDeactivatedAfterEdit
  end

  # did the last item modify its underlying value this frame? or was pressed? This is generally the same as the "bool" return value of many widgets.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L697)]
  def self.is_item_edited : Bool
    LibImGui.igIsItemEdited
  end

  # is the last item focused for keyboard/gamepad navigation?
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L694)]
  def self.is_item_focused : Bool
    LibImGui.igIsItemFocused
  end

  # is the last item hovered? (and usable, aka not blocked by a popup, etc.). See ImGuiHoveredFlags for more options.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L692)]
  def self.is_item_hovered(flags : ImGuiHoveredFlags = ImGuiHoveredFlags.new(0)) : Bool
    LibImGui.igIsItemHovered(flags)
  end

  # was the last item open state toggled? set by TreeNode().
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L701)]
  def self.is_item_toggled_open : Bool
    LibImGui.igIsItemToggledOpen
  end

  # is the last item visible? (items may be out of sight because of clipping/scrolling)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L696)]
  def self.is_item_visible : Bool
    LibImGui.igIsItemVisible
  end

  # is key being held. == io.KeysDown[user_key_index].
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L738)]
  def self.is_key_down(user_key_index : Int32) : Bool
    LibImGui.igIsKeyDown(user_key_index)
  end

  # was key pressed (went from !Down to Down)? if repeat=true, uses io.KeyRepeatDelay / KeyRepeatRate
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L739)]
  def self.is_key_pressed(user_key_index : Int32, repeat : Bool = true) : Bool
    LibImGui.igIsKeyPressed(user_key_index, repeat)
  end

  # was key released (went from Down to !Down)?
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L740)]
  def self.is_key_released(user_key_index : Int32) : Bool
    LibImGui.igIsKeyReleased(user_key_index)
  end

  # did mouse button clicked? (went from !Down to Down)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L749)]
  def self.is_mouse_clicked(button : ImGuiMouseButton, repeat : Bool = false) : Bool
    LibImGui.igIsMouseClicked(button, repeat)
  end

  # did mouse button double-clicked? (note that a double-click will also report IsMouseClicked() == true)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L751)]
  def self.is_mouse_double_clicked(button : ImGuiMouseButton) : Bool
    LibImGui.igIsMouseDoubleClicked(button)
  end

  # is mouse button held?
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L748)]
  def self.is_mouse_down(button : ImGuiMouseButton) : Bool
    LibImGui.igIsMouseDown(button)
  end

  # is mouse dragging? (if lock_threshold < -1.0f, uses io.MouseDraggingThreshold)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L757)]
  def self.is_mouse_dragging(button : ImGuiMouseButton, lock_threshold : Float32 = -1.0) : Bool
    LibImGui.igIsMouseDragging(button, lock_threshold)
  end

  # is mouse hovering given bounding rect (in screen space). clipped by current clipping settings, but disregarding of other consideration of focus/window ordering/popup-block.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L752)]
  def self.is_mouse_hovering_rect(r_min : ImVec2, r_max : ImVec2, clip : Bool = true) : Bool
    LibImGui.igIsMouseHoveringRect(r_min, r_max, clip)
  end

  # by convention we use (-FLT_MAX,-FLT_MAX) to denote that there is no mouse available
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L753)]
  def self.is_mouse_pos_valid(mouse_pos : ImVec2* = Pointer(ImVec2).null) : Bool
    LibImGui.igIsMousePosValid(mouse_pos)
  end

  # did mouse button released? (went from Down to !Down)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L750)]
  def self.is_mouse_released(button : ImGuiMouseButton) : Bool
    LibImGui.igIsMouseReleased(button)
  end

  # return true if the popup is open.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L637)]
  def self.is_popup_open(str_id : String, flags : ImGuiPopupFlags = ImGuiPopupFlags.new(0)) : Bool
    LibImGui.igIsPopupOpenStr(str_id, flags)
  end

  # test if rectangle (of given size, starting from cursor position) is visible / not clipped.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L711)]
  def self.is_rect_visible(size : ImVec2) : Bool
    LibImGui.igIsRectVisibleNil(size)
  end

  # test if rectangle (in screen space) is visible / not clipped. to perform coarse clipping on user's side.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L712)]
  def self.is_rect_visible(rect_min : ImVec2, rect_max : ImVec2) : Bool
    LibImGui.igIsRectVisibleVec2(rect_min, rect_max)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L298)]
  def self.is_window_appearing : Bool
    LibImGui.igIsWindowAppearing
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L299)]
  def self.is_window_collapsed : Bool
    LibImGui.igIsWindowCollapsed
  end

  # is current window focused? or its root/child, depending on flags. see flags for options.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L300)]
  def self.is_window_focused(flags : ImGuiFocusedFlags = ImGuiFocusedFlags.new(0)) : Bool
    LibImGui.igIsWindowFocused(flags)
  end

  # is current window hovered (and typically: not blocked by a popup/modal)? see flags for options. NB: If you are trying to check whether your mouse should be dispatched to imgui or to your app, you should use the 'io.WantCaptureMouse' boolean for that! Please read the FAQ!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L301)]
  def self.is_window_hovered(flags : ImGuiHoveredFlags = ImGuiHoveredFlags.new(0)) : Bool
    LibImGui.igIsWindowHovered(flags)
  end

  # display text+label aligned the same way as value+label widgets
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L432)]
  def self.label_text(label : String, fmt : String, *args) : Void
    LibImGui.igLabelText(label, fmt, *args._promote_va_args)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L563)]
  pointer_wrapper def self.list_box(label : String, current_item : Int32*, items : Indexable(LibC::Char*), height_in_items : Int32 = -1) : Bool
    LibImGui.igListBoxStr_arr(label, current_item, items, items.size, height_in_items)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L564)]
  pointer_wrapper def self.list_box(label : String, current_item : Int32*, items_getter : (Void*, Int32, LibC::Char**) -> Bool, data : Void*, items_count : Int32, height_in_items : Int32 = -1) : Bool
    LibImGui.igListBoxFnBoolPtr(label, current_item, items_getter, data, items_count, height_in_items)
  end

  # terminate the scrolling region. only call ListBoxFooter() if ListBoxHeader() returned true!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L567)]
  def self.list_box_footer : Void
    LibImGui.igListBoxFooter
  end

  # use if you want to reimplement ListBox() will custom data or interactions. if the function return true, you can output elements then call ListBoxFooter() afterwards.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L565)]
  def self.list_box_header(label : String, size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igListBoxHeaderVec2(label, size)
  end

  # "
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L566)]
  def self.list_box_header(label : String, items_count : Int32, height_in_items : Int32 = -1) : Bool
    LibImGui.igListBoxHeaderInt(label, items_count, height_in_items)
  end

  # call after CreateContext() and before the first call to NewFrame(). NewFrame() automatically calls LoadIniSettingsFromDisk(io.IniFilename).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L772)]
  def self.load_ini_settings_from_disk(ini_filename : String) : Void
    LibImGui.igLoadIniSettingsFromDisk(ini_filename)
  end

  # call after CreateContext() and before the first call to NewFrame() to provide .ini data from your own data source.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L773)]
  def self.load_ini_settings_from_memory(ini_data : String, ini_size : LibC::SizeT = 0) : Void
    LibImGui.igLoadIniSettingsFromMemory(ini_data, ini_size)
  end

  # helper to display buttons for logging to tty/file/clipboard
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L666)]
  def self.log_buttons : Void
    LibImGui.igLogButtons
  end

  # stop logging (close file, etc.)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L665)]
  def self.log_finish : Void
    LibImGui.igLogFinish
  end

  # pass text data straight to log (without being displayed)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L667)]
  def self.log_text(fmt : String, *args) : Void
    LibImGui.igLogText(fmt, *args._promote_va_args)
  end

  # start logging to OS clipboard
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L664)]
  def self.log_to_clipboard(auto_open_depth : Int32 = -1) : Void
    LibImGui.igLogToClipboard(auto_open_depth)
  end

  # start logging to file
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L663)]
  def self.log_to_file(auto_open_depth : Int32 = -1, filename : String? = nil) : Void
    LibImGui.igLogToFile(auto_open_depth, filename)
  end

  # start logging to tty (stdout)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L662)]
  def self.log_to_tty(auto_open_depth : Int32 = -1) : Void
    LibImGui.igLogToTTY(auto_open_depth)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L784)]
  def self.mem_alloc(size : LibC::SizeT) : Void*
    LibImGui.igMemAlloc(size)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L785)]
  def self.mem_free(ptr : Void*) : Void
    LibImGui.igMemFree(ptr)
  end

  # return true when activated. shortcuts are displayed for convenience but not processed by ImGui at the moment
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L592)]
  pointer_wrapper def self.menu_item(label : String, shortcut : String? = nil, selected : Bool = false, enabled : Bool = true) : Bool
    LibImGui.igMenuItemBool(label, shortcut, selected, enabled)
  end
  # return true when activated + toggle (*p_selected) if p_selected != NULL
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L593)]
  pointer_wrapper def self.menu_item(label : String, shortcut : String, p_selected : Bool*, enabled : Bool = true) : Bool
    LibImGui.igMenuItemBoolPtr(label, shortcut, p_selected, enabled)
  end

  # start a new Dear ImGui frame, you can submit any command from this point until Render()/EndFrame().
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L252)]
  def self.new_frame : Void
    LibImGui.igNewFrame
  end

  # undo a SameLine() or force a new line when in an horizontal-layout context.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L384)]
  def self.new_line : Void
    LibImGui.igNewLine
  end

  # next column, defaults to current row or next row if the current row is finished
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L645)]
  def self.next_column : Void
    LibImGui.igNextColumn
  end

  # call to mark popup as open (don't call every frame!).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L622)]
  def self.open_popup(str_id : String, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(0)) : Void
    LibImGui.igOpenPopup(str_id, popup_flags)
  end

  # helper to open popup when clicked on last item. return true when just opened. (note: actually triggers on the mouse _released_ event to be consistent with popup behaviors)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L623)]
  def self.open_popup_context_item(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.igOpenPopupContextItem(str_id, popup_flags)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L572)]
  def self.plot_histogram(label : String, values : Indexable(Float32), values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0), stride : Int32 = sizeof(Float32)) : Void
    LibImGui.igPlotHistogramFloatPtr(label, values, values.size, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L573)]
  def self.plot_histogram(label : String, values_getter : (Void*, Int32) -> Float32, data : Void*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.igPlotHistogramFnFloatPtr(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L570)]
  def self.plot_lines(label : String, values : Indexable(Float32), values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0), stride : Int32 = sizeof(Float32)) : Void
    LibImGui.igPlotLinesFloatPtr(label, values, values.size, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L571)]
  def self.plot_lines(label : String, values_getter : (Void*, Int32) -> Float32, data : Void*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.igPlotLinesFnFloatPtr(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L371)]
  def self.pop_allow_keyboard_focus : Void
    LibImGui.igPopAllowKeyboardFocus
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L373)]
  def self.pop_button_repeat : Void
    LibImGui.igPopButtonRepeat
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L682)]
  def self.pop_clip_rect : Void
    LibImGui.igPopClipRect
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L348)]
  def self.pop_font : Void
    LibImGui.igPopFont
  end

  # pop from the ID stack.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L417)]
  def self.pop_id : Void
    LibImGui.igPopID
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L365)]
  def self.pop_item_width : Void
    LibImGui.igPopItemWidth
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L351)]
  def self.pop_style_color(count : Int32 = 1) : Void
    LibImGui.igPopStyleColor(count)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L354)]
  def self.pop_style_var(count : Int32 = 1) : Void
    LibImGui.igPopStyleVar(count)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L369)]
  def self.pop_text_wrap_pos : Void
    LibImGui.igPopTextWrapPos
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L450)]
  def self.progress_bar(fraction : Float32, size_arg : ImVec2 = ImVec2.new(-1, 0), overlay : String? = nil) : Void
    LibImGui.igProgressBar(fraction, size_arg, overlay)
  end

  # allow focusing using TAB/Shift-TAB, enabled by default but you can disable it for certain widgets
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L370)]
  def self.push_allow_keyboard_focus(allow_keyboard_focus : Bool) : Void
    LibImGui.igPushAllowKeyboardFocus(allow_keyboard_focus)
  end

  # in 'repeat' mode, Button*() functions return repeated true in a typematic manner (using io.KeyRepeatDelay/io.KeyRepeatRate setting). Note that you can call IsItemActive() after any Button() to tell if the button is held in the current frame.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L372)]
  def self.push_button_repeat(repeat : Bool) : Void
    LibImGui.igPushButtonRepeat(repeat)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L681)]
  def self.push_clip_rect(clip_rect_min : ImVec2, clip_rect_max : ImVec2, intersect_with_current_clip_rect : Bool) : Void
    LibImGui.igPushClipRect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
  end

  # use NULL as a shortcut to push default font
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L347)]
  def self.push_font(font : ImFont) : Void
    LibImGui.igPushFont(font)
  end

  # push string into the ID stack (will hash string).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L413)]
  def self.push_id(str_id : String) : Void
    LibImGui.igPushIDStr(str_id)
  end

  # push string into the ID stack (will hash string).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L414)]
  def self.push_id(str_id : Bytes | String) : Void
    LibImGui.igPushIDStrStr(str_id, (str_id.to_unsafe + str_id.bytesize))
  end

  # push pointer into the ID stack (will hash pointer).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L415)]
  def self.push_id(ptr_id : Reference | ClassType | Int | Void*) : Void
    LibImGui.igPushIDPtr(to_void_id(ptr_id))
  end

  # push integer into the ID stack (will hash integer).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L416)]
  def self.push_id(int_id : Int32) : Void
    LibImGui.igPushIDInt(int_id)
  end

  # push width of items for common large "item+label" widgets. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -1.0f always align width to the right side). 0.0f = default to ~2/3 of windows width,
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L364)]
  def self.push_item_width(item_width : Float32) : Void
    LibImGui.igPushItemWidth(item_width)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L349)]
  def self.push_style_color(idx : ImGuiCol, col : UInt32) : Void
    LibImGui.igPushStyleColorU32(idx, col)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L350)]
  def self.push_style_color(idx : ImGuiCol, col : ImVec4) : Void
    LibImGui.igPushStyleColorVec4(idx, col)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L352)]
  def self.push_style_var(idx : ImGuiStyleVar, val : Float32) : Void
    LibImGui.igPushStyleVarFloat(idx, val)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L353)]
  def self.push_style_var(idx : ImGuiStyleVar, val : ImVec2) : Void
    LibImGui.igPushStyleVarVec2(idx, val)
  end

  # push word-wrapping position for Text*() commands. < 0.0f: no wrapping; 0.0f: wrap to end of window (or column); > 0.0f: wrap at 'wrap_pos_x' position in window local space
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L368)]
  def self.push_text_wrap_pos(wrap_local_pos_x : Float32 = 0.0) : Void
    LibImGui.igPushTextWrapPos(wrap_local_pos_x)
  end

  # use with e.g. if (RadioButton("one", my_value==1)) { my_value = 1; }
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L448)]
  pointer_wrapper def self.radio_button(label : String, active : Bool) : Bool
    LibImGui.igRadioButtonBool(label, active)
  end
  # shortcut to handle the above pattern when value is an integer
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L449)]
  pointer_wrapper def self.radio_button(label : String, v : Int32*, v_button : Int32) : Bool
    LibImGui.igRadioButtonIntPtr(label, v, v_button)
  end

  # ends the Dear ImGui frame, finalize the draw data. You can get call GetDrawData() to obtain it and run your rendering function (up to v1.60, this used to call io.RenderDrawListsFn(). Nowadays, we allow and prefer calling your render function yourself.)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L254)]
  def self.render : Void
    LibImGui.igRender
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L759)]
  def self.reset_mouse_drag_delta(button : ImGuiMouseButton = ImGuiMouseButton.new(0)) : Void
    LibImGui.igResetMouseDragDelta(button)
  end

  # call between widgets or groups to layout them horizontally. X position given in window coordinates.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L383)]
  def self.same_line(offset_from_start_x : Float32 = 0.0, spacing : Float32 = -1.0) : Void
    LibImGui.igSameLine(offset_from_start_x, spacing)
  end

  # this is automatically called (if io.IniFilename is not empty) a few seconds after any modification that should be reflected in the .ini file (and also by DestroyContext).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L774)]
  def self.save_ini_settings_to_disk(ini_filename : String) : Void
    LibImGui.igSaveIniSettingsToDisk(ini_filename)
  end

  # return a zero-terminated string with the .ini data which you can save by your own mean. call when io.WantSaveIniSettings is set, then save data by your own mean and clear io.WantSaveIniSettings.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L775)]
  def self.save_ini_settings_to_memory : {String, LibC::SizeT}
    result = LibImGui.igSaveIniSettingsToMemory(out out_ini_size)
    {String.new(result), out_ini_size}
  end

  # "bool selected" carry the selection state (read-only). Selectable() is clicked is returns true so you can modify your selection state. size.x==0.0: use remaining width, size.x>0.0: specify width. size.y==0.0: use label height, size.y>0.0: specify height
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L558)]
  pointer_wrapper def self.selectable(label : String, selected : Bool = false, flags : ImGuiSelectableFlags = ImGuiSelectableFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igSelectableBool(label, selected, flags, size)
  end
  # "bool* p_selected" point to the selection state (read-write), as a convenient helper.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L559)]
  pointer_wrapper def self.selectable(label : String, p_selected : Bool*, flags : ImGuiSelectableFlags = ImGuiSelectableFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igSelectableBoolPtr(label, p_selected, flags, size)
  end

  # separator, generally horizontal. inside a menu bar or in horizontal layout mode, this becomes a vertical separator.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L382)]
  def self.separator : Void
    LibImGui.igSeparator
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L783)]
  def self.set_allocator_functions(alloc_func : (LibC::SizeT, Void*) -> Void*, free_func : (Void*, Void*) -> Void, user_data : Void* = Pointer(Void).null) : Void
    LibImGui.igSetAllocatorFunctions(alloc_func, free_func, user_data)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L767)]
  def self.set_clipboard_text(text : String) : Void
    LibImGui.igSetClipboardText(text)
  end

  # initialize current options (generally on application startup) if you want to select a default format, picker type, etc. User will be able to change many settings, unless you pass the _NoOptions flag to your calls.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L533)]
  def self.set_color_edit_options(flags : ImGuiColorEditFlags) : Void
    LibImGui.igSetColorEditOptions(flags)
  end

  # set position of column line (in pixels, from the left side of the contents region). pass -1 to use current column
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L650)]
  def self.set_column_offset(column_index : Int32, offset_x : Float32) : Void
    LibImGui.igSetColumnOffset(column_index, offset_x)
  end

  # set column width (in pixels). pass -1 to use current column
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L648)]
  def self.set_column_width(column_index : Int32, width : Float32) : Void
    LibImGui.igSetColumnWidth(column_index, width)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L247)]
  def self.set_current_context(ctx : ImGuiContext) : Void
    LibImGui.igSetCurrentContext(ctx)
  end

  # are using the main, absolute coordinate system.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L394)]
  def self.set_cursor_pos(local_pos : ImVec2) : Void
    LibImGui.igSetCursorPos(local_pos)
  end

  # GetWindowPos() + GetCursorPos() == GetCursorScreenPos() etc.)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L395)]
  def self.set_cursor_pos_x(local_x : Float32) : Void
    LibImGui.igSetCursorPosX(local_x)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L396)]
  def self.set_cursor_pos_y(local_y : Float32) : Void
    LibImGui.igSetCursorPosY(local_y)
  end

  # cursor position in absolute screen coordinates [0..io.DisplaySize]
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L399)]
  def self.set_cursor_screen_pos(pos : ImVec2) : Void
    LibImGui.igSetCursorScreenPos(pos)
  end

  # type is a user defined string of maximum 32 characters. Strings starting with '_' are reserved for dear imgui internal types. Data is copied and held by imgui.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L673)]
  def self.set_drag_drop_payload(type : String, data : Void*, sz : LibC::SizeT, cond : ImGuiCond = ImGuiCond.new(0)) : Bool
    LibImGui.igSetDragDropPayload(type, data, sz, cond)
  end

  # allow last item to be overlapped by a subsequent item. sometimes useful with invisible buttons, selectables, etc. to catch unused area.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L708)]
  def self.set_item_allow_overlap : Void
    LibImGui.igSetItemAllowOverlap
  end

  # make last item the default focused item of a window.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L686)]
  def self.set_item_default_focus : Void
    LibImGui.igSetItemDefaultFocus
  end

  # focus keyboard on the next widget. Use positive 'offset' to access sub components of a multiple component widget. Use -1 to access previous widget.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L687)]
  def self.set_keyboard_focus_here(offset : Int32 = 0) : Void
    LibImGui.igSetKeyboardFocusHere(offset)
  end

  # set desired cursor type
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L761)]
  def self.set_mouse_cursor(cursor_type : ImGuiMouseCursor) : Void
    LibImGui.igSetMouseCursor(cursor_type)
  end

  # set next TreeNode/CollapsingHeader open state.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L553)]
  def self.set_next_item_open(is_open : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetNextItemOpen(is_open, cond)
  end

  # set width of the _next_ common large "item+label" widget. >0.0f: width in pixels, <0.0f align xx pixels to the right of window (so -1.0f always align width to the right side)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L366)]
  def self.set_next_item_width(item_width : Float32) : Void
    LibImGui.igSetNextItemWidth(item_width)
  end

  # set next window background color alpha. helper to easily override the Alpha component of ImGuiCol_WindowBg/ChildBg/PopupBg. you may also use ImGuiWindowFlags_NoBackground.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L315)]
  def self.set_next_window_bg_alpha(alpha : Float32) : Void
    LibImGui.igSetNextWindowBgAlpha(alpha)
  end

  # set next window collapsed state. call before Begin()
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L313)]
  def self.set_next_window_collapsed(collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetNextWindowCollapsed(collapsed, cond)
  end

  # set next window content size (~ scrollable client area, which enforce the range of scrollbars). Not including window decorations (title bar, menu bar, etc.) nor WindowPadding. set an axis to 0.0f to leave it automatic. call before Begin()
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L312)]
  def self.set_next_window_content_size(size : ImVec2) : Void
    LibImGui.igSetNextWindowContentSize(size)
  end

  # set next window to be focused / top-most. call before Begin()
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L314)]
  def self.set_next_window_focus : Void
    LibImGui.igSetNextWindowFocus
  end

  # set next window position. call before Begin(). use pivot=(0.5f,0.5f) to center on given point, etc.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L309)]
  def self.set_next_window_pos(pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0), pivot : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.igSetNextWindowPos(pos, cond, pivot)
  end

  # set next window size. set axis to 0.0f to force an auto-fit on this axis. call before Begin()
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L310)]
  def self.set_next_window_size(size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetNextWindowSize(size, cond)
  end

  # set next window size limits. use -1,-1 on either X/Y axis to preserve the current size. Sizes will be rounded down. Use callback to apply non-trivial programmatic constraints.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L311)]
  def self.set_next_window_size_constraints(size_min : ImVec2, size_max : ImVec2, custom_callback : ImGuiSizeCallback? = nil, custom_callback_data : Void* = Pointer(Void).null) : Void
    LibImGui.igSetNextWindowSizeConstraints(size_min, size_max, custom_callback, custom_callback_data)
  end

  # adjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L343)]
  def self.set_scroll_from_pos_x(local_x : Float32, center_x_ratio : Float32 = 0.5) : Void
    LibImGui.igSetScrollFromPosXFloat(local_x, center_x_ratio)
  end

  # adjust scrolling amount to make given position visible. Generally GetCursorStartPos() + offset to compute a valid position.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L344)]
  def self.set_scroll_from_pos_y(local_y : Float32, center_y_ratio : Float32 = 0.5) : Void
    LibImGui.igSetScrollFromPosYFloat(local_y, center_y_ratio)
  end

  # adjust scrolling amount to make current cursor position visible. center_x_ratio=0.0: left, 0.5: center, 1.0: right. When using to make a "default/current item" visible, consider using SetItemDefaultFocus() instead.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L341)]
  def self.set_scroll_here_x(center_x_ratio : Float32 = 0.5) : Void
    LibImGui.igSetScrollHereX(center_x_ratio)
  end

  # adjust scrolling amount to make current cursor position visible. center_y_ratio=0.0: top, 0.5: center, 1.0: bottom. When using to make a "default/current item" visible, consider using SetItemDefaultFocus() instead.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L342)]
  def self.set_scroll_here_y(center_y_ratio : Float32 = 0.5) : Void
    LibImGui.igSetScrollHereY(center_y_ratio)
  end

  # set scrolling amount [0..GetScrollMaxX()]
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L339)]
  def self.set_scroll_x(scroll_x : Float32) : Void
    LibImGui.igSetScrollXFloat(scroll_x)
  end

  # set scrolling amount [0..GetScrollMaxY()]
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L340)]
  def self.set_scroll_y(scroll_y : Float32) : Void
    LibImGui.igSetScrollYFloat(scroll_y)
  end

  # replace current window storage with our own (if you want to manipulate it yourself, typically clear subsection of it)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L719)]
  def self.set_state_storage(storage : ImGuiStorage*) : Void
    LibImGui.igSetStateStorage(storage)
  end

  # notify TabBar or Docking system of a closed tab/window ahead (useful to reduce visual flicker on reorderable tab bars). For tab-bar: call after BeginTabBar() and before Tab submissions. Otherwise call with a window name.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L658)]
  def self.set_tab_item_closed(tab_or_docked_window_label : String) : Void
    LibImGui.igSetTabItemClosed(tab_or_docked_window_label)
  end

  # set a text-only tooltip, typically use with ImGui::IsItemHovered(). override any previous call to SetTooltip().
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L599)]
  def self.set_tooltip(fmt : String, *args) : Void
    LibImGui.igSetTooltip(fmt, *args._promote_va_args)
  end

  # (not recommended) set current window collapsed state. prefer using SetNextWindowCollapsed().
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L318)]
  def self.set_window_collapsed(collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetWindowCollapsedBool(collapsed, cond)
  end

  # set named window collapsed state
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L323)]
  def self.set_window_collapsed(name : String, collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetWindowCollapsedStr(name, collapsed, cond)
  end

  # (not recommended) set current window to be focused / top-most. prefer using SetNextWindowFocus().
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L319)]
  def self.set_window_focus : Void
    LibImGui.igSetWindowFocusNil
  end

  # set named window to be focused / top-most. use NULL to remove focus.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L324)]
  def self.set_window_focus(name : String) : Void
    LibImGui.igSetWindowFocusStr(name)
  end

  # set font scale. Adjust IO.FontGlobalScale if you want to scale all windows. This is an old API! For correct scaling, prefer to reload font + rebuild ImFontAtlas + call style.ScaleAllSizes().
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L320)]
  def self.set_window_font_scale(scale : Float32) : Void
    LibImGui.igSetWindowFontScale(scale)
  end

  # (not recommended) set current window position - call within Begin()/End(). prefer using SetNextWindowPos(), as this may incur tearing and side-effects.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L316)]
  def self.set_window_pos(pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetWindowPosVec2(pos, cond)
  end

  # set named window position.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L321)]
  def self.set_window_pos(name : String, pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetWindowPosStr(name, pos, cond)
  end

  # (not recommended) set current window size - call within Begin()/End(). set to ImVec2(0, 0) to force an auto-fit. prefer using SetNextWindowSize(), as this may incur tearing and minor side-effects.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L317)]
  def self.set_window_size(size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetWindowSizeVec2(size, cond)
  end

  # set named window size. set axis to 0.0f to force an auto-fit on this axis.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L322)]
  def self.set_window_size(name : String, size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetWindowSizeStr(name, size, cond)
  end

  # create About window. display Dear ImGui version, credits and build/system information.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L259)]
  pointer_wrapper def self.show_about_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.igShowAboutWindow(p_open)
  end
  # create Demo window (previously called ShowTestWindow). demonstrate most ImGui features. call this to learn about the library! try to make it always available in your application!
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L258)]
  pointer_wrapper def self.show_demo_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.igShowDemoWindow(p_open)
  end

  # add font selector block (not a window), essentially a combo listing the loaded fonts.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L263)]
  def self.show_font_selector(label : String) : Void
    LibImGui.igShowFontSelector(label)
  end

  # create Debug/Metrics window. display Dear ImGui internals: draw commands (with individual draw calls and vertices), window list, basic internal state, etc.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L260)]
  pointer_wrapper def self.show_metrics_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.igShowMetricsWindow(p_open)
  end

  # add style editor block (not a window). you can pass in a reference ImGuiStyle structure to compare to, revert to and save to (else it uses the default style)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L261)]
  def self.show_style_editor(ref : ImGuiStyle? = nil) : Void
    LibImGui.igShowStyleEditor(ref)
  end

  # add style selector block (not a window), essentially a combo listing the default styles.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L262)]
  def self.show_style_selector(label : String) : Bool
    LibImGui.igShowStyleSelector(label)
  end

  # add basic help/info block (not a window): how to manipulate ImGui as a end-user (mouse/keyboard controls).
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L264)]
  def self.show_user_guide : Void
    LibImGui.igShowUserGuide
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L496)]
  pointer_wrapper def self.slider_angle(label : String, v_rad : Float32*, v_degrees_min : Float32 = -360.0, v_degrees_max : Float32 = +360.0, format : String = "%.0 deg", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, format, flags)
  end
  # adjust format to decorate the value with a prefix or a suffix for in-slider labels or unit display.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L492)]
  pointer_wrapper def self.slider_float(label : String, v : Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igSliderFloat(label, v, v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L493)]
  pointer_wrapper def self.slider_float2(label : String, v : ImVec2* | Indexable(Float32) | Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igSliderFloat2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Float32*), v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L494)]
  pointer_wrapper def self.slider_float3(label : String, v : Indexable(Float32) | Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igSliderFloat3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Float32*), v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L495)]
  pointer_wrapper def self.slider_float4(label : String, v : ImVec4* | Indexable(Float32) | Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igSliderFloat4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Float32*), v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L497)]
  pointer_wrapper def self.slider_int(label : String, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igSliderInt(label, v, v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L498)]
  pointer_wrapper def self.slider_int2(label : String, v : Indexable(Int32) | Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igSliderInt2(label, v.is_a?(Indexable) ? (
      v.size == 2 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 2)")
    ) : v.as(Int32*), v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L499)]
  pointer_wrapper def self.slider_int3(label : String, v : Indexable(Int32) | Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igSliderInt3(label, v.is_a?(Indexable) ? (
      v.size == 3 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 3)")
    ) : v.as(Int32*), v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L500)]
  pointer_wrapper def self.slider_int4(label : String, v : Indexable(Int32) | Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igSliderInt4(label, v.is_a?(Indexable) ? (
      v.size == 4 ? v.to_unsafe : raise ArgumentError.new("Slice has wrong size #{v.size} (want 4)")
    ) : v.as(Int32*), v_min, v_max, format, flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
#[[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L501)]
  pointer_wrapper def self.slider_scalar(label : String, p_data : {{t}}*, p_min : {{t}}, p_max : {{t}}, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igSliderScalar(label, ImGuiDataType::{{k.id}}, p_data, p_min ? (p_min_ = p_min; pointerof(p_min_)) : Pointer({{t}}).null, p_max ? (p_max_ = p_max; pointerof(p_max_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
#[[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L502)]
  pointer_wrapper def self.slider_scalar_n(label : String, p_data : {{t}}*, components : Int32, p_min : {{t}}*, p_max : {{t}}*, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igSliderScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, p_min, p_max, format, flags)
  end
  {% end %}

  # button with FramePadding=(0,0) to easily embed within text
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L441)]
  def self.small_button(label : String) : Bool
    LibImGui.igSmallButton(label)
  end

  # add vertical spacing.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L385)]
  def self.spacing : Void
    LibImGui.igSpacing
  end

  # classic imgui style
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L269)]
  def self.style_colors_classic(dst : ImGuiStyle? = nil) : Void
    LibImGui.igStyleColorsClassic(dst)
  end

  # new, recommended style (default)
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L268)]
  def self.style_colors_dark(dst : ImGuiStyle? = nil) : Void
    LibImGui.igStyleColorsDark(dst)
  end

  # best used with borders and a custom, thicker font
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L270)]
  def self.style_colors_light(dst : ImGuiStyle? = nil) : Void
    LibImGui.igStyleColorsLight(dst)
  end

  # formatted text
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L424)]
  def self.text(fmt : String, *args) : Void
    LibImGui.igText(fmt, *args._promote_va_args)
  end

  # shortcut for PushStyleColor(ImGuiCol_Text, col); Text(fmt, ...); PopStyleColor();
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L426)]
  def self.text_colored(col : ImVec4, fmt : String, *args) : Void
    LibImGui.igTextColored(col, fmt, *args._promote_va_args)
  end

  # shortcut for PushStyleColor(ImGuiCol_Text, style.Colors[ImGuiCol_TextDisabled]); Text(fmt, ...); PopStyleColor();
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L428)]
  def self.text_disabled(fmt : String, *args) : Void
    LibImGui.igTextDisabled(fmt, *args._promote_va_args)
  end

  # raw text without formatting. Roughly equivalent to Text("%s", text) but: A) doesn't require null terminated string if 'text_end' is specified, B) it's faster, no memory copy is done, no buffer size limits, recommended for long chunks of text.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L423)]
  def self.text_unformatted(text : Bytes | String) : Void
    LibImGui.igTextUnformatted(text, (text.to_unsafe + text.bytesize))
  end

  # shortcut for PushTextWrapPos(0.0f); Text(fmt, ...); PopTextWrapPos();. Note that this won't work on an auto-resizing window if there's no other widgets to extend the window width, yoy may need to set a size using SetNextWindowSize().
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L430)]
  def self.text_wrapped(fmt : String, *args) : Void
    LibImGui.igTextWrapped(fmt, *args._promote_va_args)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L537)]
  def self.tree_node(label : String) : Bool
    LibImGui.igTreeNodeStr(label)
  end

  # helper variation to easily decorelate the id from the displayed string. Read the FAQ about why and how to use ID. to align arbitrary text at the same level as a TreeNode() you can use Bullet().
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L538)]
  def self.tree_node(str_id : String, fmt : String, *args) : Bool
    LibImGui.igTreeNodeStrStr(str_id, fmt, *args._promote_va_args)
  end

  # "
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L539)]
  def self.tree_node(ptr_id : Reference | ClassType | Int | Void*, fmt : String, *args) : Bool
    LibImGui.igTreeNodePtr(to_void_id(ptr_id), fmt, *args._promote_va_args)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L542)]
  def self.tree_node_ex(label : String, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.igTreeNodeExStr(label, flags)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L543)]
  def self.tree_node_ex(str_id : String, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Bool
    LibImGui.igTreeNodeExStrStr(str_id, flags, fmt, *args._promote_va_args)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L544)]
  def self.tree_node_ex(ptr_id : Reference | ClassType | Int | Void*, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Bool
    LibImGui.igTreeNodeExPtr(to_void_id(ptr_id), flags, fmt, *args._promote_va_args)
  end

  # ~ Unindent()+PopId()
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L549)]
  def self.tree_pop : Void
    LibImGui.igTreePop
  end

  # ~ Indent()+PushId(). Already called by TreeNode() when returning true, but you can call TreePush/TreePop yourself if desired.
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L547)]
  def self.tree_push(str_id : String) : Void
    LibImGui.igTreePushStr(str_id)
  end

  # "
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L548)]
  def self.tree_push(ptr_id : Reference | ClassType | Int | Void* = Pointer(Reference | ClassType | Int | Void).null) : Void
    LibImGui.igTreePushPtr(to_void_id(ptr_id))
  end

  # move content position back to the left, by style.IndentSpacing or indent_w if != 0
  #
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L388)]
  def self.unindent(indent_w : Float32 = 0.0) : Void
    LibImGui.igUnindent(indent_w)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L503)]
  pointer_wrapper def self.v_slider_float(label : String, size : ImVec2, v : Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igVSliderFloat(label, size, v, v_min, v_max, format, flags)
  end
  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L504)]
  pointer_wrapper def self.v_slider_int(label : String, size : ImVec2, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d", flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igVSliderInt(label, size, v, v_min, v_max, format, flags)
  end
  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
#[[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L505)]
  pointer_wrapper def self.v_slider_scalar(label : String, size : ImVec2, p_data : {{t}}*, p_min : {{t}}, p_max : {{t}}, format : String? = nil, flags : ImGuiSliderFlags = ImGuiSliderFlags.new(0)) : Bool
    LibImGui.igVSliderScalar(label, size, ImGuiDataType::{{k.id}}, p_data, p_min ? (p_min_ = p_min; pointerof(p_min_)) : Pointer({{t}}).null, p_max ? (p_max_ = p_max; pointerof(p_max_)) : Pointer({{t}}).null, format, flags)
  end
  {% end %}

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L577)]
  def self.value(prefix : String, b : Bool) : Void
    LibImGui.igValueBool(prefix, b)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L578)]
  def self.value(prefix : String, v : Int32) : Void
    LibImGui.igValueInt(prefix, v)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L579)]
  def self.value(prefix : String, v : UInt32) : Void
    LibImGui.igValueUint(prefix, v)
  end

  # [[View C++ header](https://github.com/ocornut/imgui/blob/v1.78/imgui.h#L580)]
  def self.value(prefix : String, v : Float32, float_format : String? = nil) : Void
    LibImGui.igValueFloat(prefix, v, float_format)
  end
end
