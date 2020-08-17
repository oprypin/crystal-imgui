require "./lib"

module ImGui
  struct ImColor
    include StructType

    def hsv(h : Float32, s : Float32, v : Float32, a : Float32 = 1.0) : ImGui::ImColor
      LibImGui.ImColor_HSV(out p_out, self, h, s, v, a)
      p_out
    end

    def self.new : ImColor
      result = LibImGui.ImColor_ImColorNil
      result.value
    end

    def self.new(r : Int32, g : Int32, b : Int32, a : Int32 = 255) : ImColor
      result = LibImGui.ImColor_ImColorInt(r, g, b, a)
      result.value
    end

    def self.new(rgba : UInt32) : ImColor
      result = LibImGui.ImColor_ImColorU32(rgba)
      result.value
    end

    def self.new(r : Float32, g : Float32, b : Float32, a : Float32 = 1.0) : ImColor
      result = LibImGui.ImColor_ImColorFloat(r, g, b, a)
      result.value
    end

    def self.new(col : ImVec4) : ImColor
      result = LibImGui.ImColor_ImColorVec4(col)
      result.value
    end

    def set_hsv(h : Float32, s : Float32, v : Float32, a : Float32 = 1.0) : Void
      LibImGui.ImColor_SetHSV(self, h, s, v, a)
    end
  end

  class ImDrawChannel
    include ClassType(LibImGui::ImDrawChannel)
  end

  class ImDrawCmd
    include ClassType(LibImGui::ImDrawCmd)

    def clip_rect : ImVec4
      @this.clip_rect.value
    end

    def clip_rect=(clip_rect : ImVec4)
      @this.clip_rect = clip_rect
    end

    def texture_id : ImTextureID
      @this.texture_id
    end

    def texture_id=(texture_id : ImTextureID)
      @this.texture_id = texture_id
    end

    def vtx_offset : UInt32
      @this.vtx_offset
    end

    def vtx_offset=(vtx_offset : UInt32)
      @this.vtx_offset = vtx_offset
    end

    def idx_offset : UInt32
      @this.idx_offset
    end

    def idx_offset=(idx_offset : UInt32)
      @this.idx_offset = idx_offset
    end

    def elem_count : UInt32
      @this.elem_count
    end

    def elem_count=(elem_count : UInt32)
      @this.elem_count = elem_count
    end

    def user_callback : ImDrawCallback
      @this.user_callback
    end

    def user_callback=(user_callback : ImDrawCallback)
      @this.user_callback = user_callback
    end

    def user_callback_data : Void*
      @this.user_callback_data
    end

    def user_callback_data=(user_callback_data : Void*)
      @this.user_callback_data = user_callback_data
    end

    def self.new : ImDrawCmd
      result = LibImGui.ImDrawCmd_ImDrawCmd
      ImDrawCmd.new(result)
    end
  end

  class ImDrawData
    include ClassType(LibImGui::ImDrawData)

    def valid : Bool
      @this.valid
    end

    def valid=(valid : Bool)
      @this.valid = valid
    end

    def cmd_lists : Slice(ImDrawList)
      Slice(ImDrawList).new(@this.cmd_lists, @this.cmd_lists_count)
    end

    def cmd_lists=(cmd_lists : Slice(ImDrawList))
      @this.cmd_lists = cmd_lists
    end

    def cmd_lists_count : Int32
      @this.cmd_lists_count
    end

    def cmd_lists_count=(cmd_lists_count : Int32)
      @this.cmd_lists_count = cmd_lists_count
    end

    def total_idx_count : Int32
      @this.total_idx_count
    end

    def total_idx_count=(total_idx_count : Int32)
      @this.total_idx_count = total_idx_count
    end

    def total_vtx_count : Int32
      @this.total_vtx_count
    end

    def total_vtx_count=(total_vtx_count : Int32)
      @this.total_vtx_count = total_vtx_count
    end

    def display_pos : ImVec2
      @this.display_pos.value
    end

    def display_pos=(display_pos : ImVec2)
      @this.display_pos = display_pos
    end

    def display_size : ImVec2
      @this.display_size.value
    end

    def display_size=(display_size : ImVec2)
      @this.display_size = display_size
    end

    def framebuffer_scale : ImVec2
      @this.framebuffer_scale.value
    end

    def framebuffer_scale=(framebuffer_scale : ImVec2)
      @this.framebuffer_scale = framebuffer_scale
    end

    def clear : Void
      LibImGui.ImDrawData_Clear(self)
    end

    def de_index_all_buffers : Void
      LibImGui.ImDrawData_DeIndexAllBuffers(self)
    end

    def self.new : ImDrawData
      result = LibImGui.ImDrawData_ImDrawData
      ImDrawData.new(result)
    end

    def scale_clip_rects(fb_scale : ImVec2) : Void
      LibImGui.ImDrawData_ScaleClipRects(self, fb_scale)
    end
  end

  class ImDrawList
    include ClassType(LibImGui::ImDrawList)

    def cmd_buffer : LibImGui::ImVector(LibImGui::ImDrawCmd)
      @this.cmd_buffer.value
    end

    def cmd_buffer=(cmd_buffer : LibImGui::ImVector(LibImGui::ImDrawCmd))
      @this.cmd_buffer = cmd_buffer
    end

    def idx_buffer : LibImGui::ImVector(ImDrawIdx)
      @this.idx_buffer.value
    end

    def idx_buffer=(idx_buffer : LibImGui::ImVector(ImDrawIdx))
      @this.idx_buffer = idx_buffer
    end

    def vtx_buffer : LibImGui::ImVector(ImDrawVert)
      @this.vtx_buffer.value
    end

    def vtx_buffer=(vtx_buffer : LibImGui::ImVector(ImDrawVert))
      @this.vtx_buffer = vtx_buffer
    end

    def flags : ImDrawListFlags
      @this.flags
    end

    def flags=(flags : ImDrawListFlags)
      @this.flags = flags
    end

    def add_bezier_curve(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32, thickness : Float32, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_AddBezierCurve(self, p1, p2, p3, p4, col, thickness, num_segments)
    end

    def add_callback(callback : ImDrawCallback, callback_data : Void*) : Void
      LibImGui.ImDrawList_AddCallback(self, callback, callback_data)
    end

    def add_circle(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32 = 12, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddCircle(self, center, radius, col, num_segments, thickness)
    end

    def add_circle_filled(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32 = 12) : Void
      LibImGui.ImDrawList_AddCircleFilled(self, center, radius, col, num_segments)
    end

    def add_convex_poly_filled(points : ImVec2*, num_points : Int32, col : UInt32) : Void
      LibImGui.ImDrawList_AddConvexPolyFilled(self, points, num_points, col)
    end

    def add_draw_cmd : Void
      LibImGui.ImDrawList_AddDrawCmd(self)
    end

    def add_image(user_texture_id : ImTextureID, p_min : ImVec2, p_max : ImVec2, uv_min : ImVec2 = ImVec2.new(0, 0), uv_max : ImVec2 = ImVec2.new(1, 1), col : UInt32 = ((UInt32.new(255) << 24) | (UInt32.new(255) << 16) | (UInt32.new(255) << 8) | (UInt32.new(255) << 0))) : Void
      LibImGui.ImDrawList_AddImage(self, user_texture_id, p_min, p_max, uv_min, uv_max, col)
    end

    def add_image_quad(user_texture_id : ImTextureID, p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, uv1 : ImVec2 = ImVec2.new(0, 0), uv2 : ImVec2 = ImVec2.new(1, 0), uv3 : ImVec2 = ImVec2.new(1, 1), uv4 : ImVec2 = ImVec2.new(0, 1), col : UInt32 = ((UInt32.new(255) << 24) | (UInt32.new(255) << 16) | (UInt32.new(255) << 8) | (UInt32.new(255) << 0))) : Void
      LibImGui.ImDrawList_AddImageQuad(self, user_texture_id, p1, p2, p3, p4, uv1, uv2, uv3, uv4, col)
    end

    def add_image_rounded(user_texture_id : ImTextureID, p_min : ImVec2, p_max : ImVec2, uv_min : ImVec2, uv_max : ImVec2, col : UInt32, rounding : Float32, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags_All) : Void
      LibImGui.ImDrawList_AddImageRounded(self, user_texture_id, p_min, p_max, uv_min, uv_max, col, rounding, rounding_corners)
    end

    def add_line(p1 : ImVec2, p2 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddLine(self, p1, p2, col, thickness)
    end

    def add_ngon(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddNgon(self, center, radius, col, num_segments, thickness)
    end

    def add_ngon_filled(center : ImVec2, radius : Float32, col : UInt32, num_segments : Int32) : Void
      LibImGui.ImDrawList_AddNgonFilled(self, center, radius, col, num_segments)
    end

    def add_polyline(points : ImVec2*, num_points : Int32, col : UInt32, closed : Bool, thickness : Float32) : Void
      LibImGui.ImDrawList_AddPolyline(self, points, num_points, col, closed, thickness)
    end

    def add_quad(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddQuad(self, p1, p2, p3, p4, col, thickness)
    end

    def add_quad_filled(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_AddQuadFilled(self, p1, p2, p3, p4, col)
    end

    def add_rect(p_min : ImVec2, p_max : ImVec2, col : UInt32, rounding : Float32 = 0.0, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags_All, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddRect(self, p_min, p_max, col, rounding, rounding_corners, thickness)
    end

    def add_rect_filled(p_min : ImVec2, p_max : ImVec2, col : UInt32, rounding : Float32 = 0.0, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags_All) : Void
      LibImGui.ImDrawList_AddRectFilled(self, p_min, p_max, col, rounding, rounding_corners)
    end

    def add_rect_filled_multi_color(p_min : ImVec2, p_max : ImVec2, col_upr_left : UInt32, col_upr_right : UInt32, col_bot_right : UInt32, col_bot_left : UInt32) : Void
      LibImGui.ImDrawList_AddRectFilledMultiColor(self, p_min, p_max, col_upr_left, col_upr_right, col_bot_right, col_bot_left)
    end

    def add_text(pos : ImVec2, col : UInt32, text_begin : String, text_end : String? = nil) : Void
      LibImGui.ImDrawList_AddTextVec2(self, pos, col, text_begin, text_end)
    end

    def add_text(font : ImFont*, font_size : Float32, pos : ImVec2, col : UInt32, text_begin : String, text_end : String? = nil, wrap_width : Float32 = 0.0, cpu_fine_clip_rect : ImVec4*? = nil) : Void
      LibImGui.ImDrawList_AddTextFontPtr(self, font, font_size, pos, col, text_begin, text_end, wrap_width, cpu_fine_clip_rect)
    end

    def add_triangle(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, col : UInt32, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddTriangle(self, p1, p2, p3, col, thickness)
    end

    def add_triangle_filled(p1 : ImVec2, p2 : ImVec2, p3 : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_AddTriangleFilled(self, p1, p2, p3, col)
    end

    def channels_merge : Void
      LibImGui.ImDrawList_ChannelsMerge(self)
    end

    def channels_set_current(n : Int32) : Void
      LibImGui.ImDrawList_ChannelsSetCurrent(self, n)
    end

    def channels_split(count : Int32) : Void
      LibImGui.ImDrawList_ChannelsSplit(self, count)
    end

    def clone_output : ImDrawList
      result = LibImGui.ImDrawList_CloneOutput(self)
      ImDrawList.new(result)
    end

    def get_clip_rect_max : ImGui::ImVec2
      LibImGui.ImDrawList_GetClipRectMax(out p_out, self)
      p_out
    end

    def get_clip_rect_min : ImGui::ImVec2
      LibImGui.ImDrawList_GetClipRectMin(out p_out, self)
      p_out
    end

    def self.new(shared_data : ImDrawListSharedData) : ImDrawList
      result = LibImGui.ImDrawList_ImDrawList(shared_data)
      ImDrawList.new(result)
    end

    def path_arc_to(center : ImVec2, radius : Float32, a_min : Float32, a_max : Float32, num_segments : Int32 = 10) : Void
      LibImGui.ImDrawList_PathArcTo(self, center, radius, a_min, a_max, num_segments)
    end

    def path_arc_to_fast(center : ImVec2, radius : Float32, a_min_of_12 : Int32, a_max_of_12 : Int32) : Void
      LibImGui.ImDrawList_PathArcToFast(self, center, radius, a_min_of_12, a_max_of_12)
    end

    def path_bezier_curve_to(p2 : ImVec2, p3 : ImVec2, p4 : ImVec2, num_segments : Int32 = 0) : Void
      LibImGui.ImDrawList_PathBezierCurveTo(self, p2, p3, p4, num_segments)
    end

    def path_clear : Void
      LibImGui.ImDrawList_PathClear(self)
    end

    def path_fill_convex(col : UInt32) : Void
      LibImGui.ImDrawList_PathFillConvex(self, col)
    end

    def path_line_to(pos : ImVec2) : Void
      LibImGui.ImDrawList_PathLineTo(self, pos)
    end

    def path_line_to_merge_duplicate(pos : ImVec2) : Void
      LibImGui.ImDrawList_PathLineToMergeDuplicate(self, pos)
    end

    def path_rect(rect_min : ImVec2, rect_max : ImVec2, rounding : Float32 = 0.0, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags_All) : Void
      LibImGui.ImDrawList_PathRect(self, rect_min, rect_max, rounding, rounding_corners)
    end

    def path_stroke(col : UInt32, closed : Bool, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_PathStroke(self, col, closed, thickness)
    end

    def pop_clip_rect : Void
      LibImGui.ImDrawList_PopClipRect(self)
    end

    def pop_texture_id : Void
      LibImGui.ImDrawList_PopTextureID(self)
    end

    def prim_quad_uv(a : ImVec2, b : ImVec2, c : ImVec2, d : ImVec2, uv_a : ImVec2, uv_b : ImVec2, uv_c : ImVec2, uv_d : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimQuadUV(self, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col)
    end

    def prim_rect(a : ImVec2, b : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimRect(self, a, b, col)
    end

    def prim_rect_uv(a : ImVec2, b : ImVec2, uv_a : ImVec2, uv_b : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimRectUV(self, a, b, uv_a, uv_b, col)
    end

    def prim_reserve(idx_count : Int32, vtx_count : Int32) : Void
      LibImGui.ImDrawList_PrimReserve(self, idx_count, vtx_count)
    end

    def prim_unreserve(idx_count : Int32, vtx_count : Int32) : Void
      LibImGui.ImDrawList_PrimUnreserve(self, idx_count, vtx_count)
    end

    def prim_vtx(pos : ImVec2, uv : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimVtx(self, pos, uv, col)
    end

    def prim_write_idx(idx : ImDrawIdx) : Void
      LibImGui.ImDrawList_PrimWriteIdx(self, idx)
    end

    def prim_write_vtx(pos : ImVec2, uv : ImVec2, col : UInt32) : Void
      LibImGui.ImDrawList_PrimWriteVtx(self, pos, uv, col)
    end

    def push_clip_rect(clip_rect_min : ImVec2, clip_rect_max : ImVec2, intersect_with_current_clip_rect : Bool = false) : Void
      LibImGui.ImDrawList_PushClipRect(self, clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
    end

    def push_clip_rect_full_screen : Void
      LibImGui.ImDrawList_PushClipRectFullScreen(self)
    end

    def push_texture_id(texture_id : ImTextureID) : Void
      LibImGui.ImDrawList_PushTextureID(self, texture_id)
    end
  end

  class ImDrawListSplitter
    include ClassType(LibImGui::ImDrawListSplitter)

    def clear : Void
      LibImGui.ImDrawListSplitter_Clear(self)
    end

    def clear_free_memory : Void
      LibImGui.ImDrawListSplitter_ClearFreeMemory(self)
    end

    def self.new : ImDrawListSplitter
      result = LibImGui.ImDrawListSplitter_ImDrawListSplitter
      ImDrawListSplitter.new(result)
    end

    def merge(draw_list : ImDrawList) : Void
      LibImGui.ImDrawListSplitter_Merge(self, draw_list)
    end

    def set_current_channel(draw_list : ImDrawList, channel_idx : Int32) : Void
      LibImGui.ImDrawListSplitter_SetCurrentChannel(self, draw_list, channel_idx)
    end

    def split(draw_list : ImDrawList, count : Int32) : Void
      LibImGui.ImDrawListSplitter_Split(self, draw_list, count)
    end
  end

  struct ImDrawVert
    include StructType
  end

  struct ImFont
    include StructType

    def index_advance_x : LibImGui::ImVector(Float32)
      pointerof(@index_advance_x).as(LibImGui::ImVector(Float32)*).value
    end

    def index_advance_x=(index_advance_x : LibImGui::ImVector(Float32))
      pointerof(@index_advance_x).value = index_advance_x.as(LibImGui::ImVectorInternal*).value
    end

    def index_lookup : LibImGui::ImVector(ImWchar)
      pointerof(@index_lookup).as(LibImGui::ImVector(ImWchar)*).value
    end

    def index_lookup=(index_lookup : LibImGui::ImVector(ImWchar))
      pointerof(@index_lookup).value = index_lookup.as(LibImGui::ImVectorInternal*).value
    end

    def glyphs : LibImGui::ImVector(ImFontGlyph)
      pointerof(@glyphs).as(LibImGui::ImVector(ImFontGlyph)*).value
    end

    def glyphs=(glyphs : LibImGui::ImVector(ImFontGlyph))
      pointerof(@glyphs).value = glyphs.as(LibImGui::ImVectorInternal*).value
    end

    def add_glyph(c : ImWchar, x0 : Float32, y0 : Float32, x1 : Float32, y1 : Float32, u0 : Float32, v0 : Float32, u1 : Float32, v1 : Float32, advance_x : Float32) : Void
      LibImGui.ImFont_AddGlyph(self, c, x0, y0, x1, y1, u0, v0, u1, v1, advance_x)
    end

    def add_remap_char(dst : ImWchar, src : ImWchar, overwrite_dst : Bool = true) : Void
      LibImGui.ImFont_AddRemapChar(self, dst, src, overwrite_dst)
    end

    def build_lookup_table : Void
      LibImGui.ImFont_BuildLookupTable(self)
    end

    def calc_text_size_a(size : Float32, max_width : Float32, wrap_width : Float32, text_begin : String, text_end : String? = nil, remaining : LibC::Char**? = nil) : ImGui::ImVec2
      LibImGui.ImFont_CalcTextSizeA(out p_out, self, size, max_width, wrap_width, text_begin, text_end, remaining)
      p_out
    end

    def calc_word_wrap_position_a(scale : Float32, text : String, text_end : String, wrap_width : Float32) : String
      result = LibImGui.ImFont_CalcWordWrapPositionA(self, scale, text, text_end, wrap_width)
      String.new(result)
    end

    def clear_output_data : Void
      LibImGui.ImFont_ClearOutputData(self)
    end

    def find_glyph(c : ImWchar) : ImFontGlyph
      result = LibImGui.ImFont_FindGlyph(self, c)
      result.value
    end

    def find_glyph_no_fallback(c : ImWchar) : ImFontGlyph
      result = LibImGui.ImFont_FindGlyphNoFallback(self, c)
      result.value
    end

    def get_char_advance(c : ImWchar) : Float32
      LibImGui.ImFont_GetCharAdvance(self, c)
    end

    def get_debug_name : String
      result = LibImGui.ImFont_GetDebugName(self)
      String.new(result)
    end

    def grow_index(new_size : Int32) : Void
      LibImGui.ImFont_GrowIndex(self, new_size)
    end

    def self.new : ImFont
      result = LibImGui.ImFont_ImFont
      result.value
    end

    def is_glyph_range_unused(c_begin : UInt32, c_last : UInt32) : Bool
      LibImGui.ImFont_IsGlyphRangeUnused(self, c_begin, c_last)
    end

    def is_loaded : Bool
      LibImGui.ImFont_IsLoaded(self)
    end

    def render_char(draw_list : ImDrawList, size : Float32, pos : ImVec2, col : UInt32, c : ImWchar) : Void
      LibImGui.ImFont_RenderChar(self, draw_list, size, pos, col, c)
    end

    def render_text(draw_list : ImDrawList, size : Float32, pos : ImVec2, col : UInt32, clip_rect : ImVec4, text_begin : String, text_end : String, wrap_width : Float32 = 0.0, cpu_fine_clip : Bool = false) : Void
      LibImGui.ImFont_RenderText(self, draw_list, size, pos, col, clip_rect, text_begin, text_end, wrap_width, cpu_fine_clip)
    end

    def set_fallback_char(c : ImWchar) : Void
      LibImGui.ImFont_SetFallbackChar(self, c)
    end

    def set_glyph_visible(c : ImWchar, visible : Bool) : Void
      LibImGui.ImFont_SetGlyphVisible(self, c, visible)
    end
  end

  class ImFontAtlas
    include ClassType(LibImGui::ImFontAtlas)

    def locked : Bool
      @this.locked
    end

    def locked=(locked : Bool)
      @this.locked = locked
    end

    def flags : ImFontAtlasFlags
      @this.flags
    end

    def flags=(flags : ImFontAtlasFlags)
      @this.flags = flags
    end

    def tex_id : ImTextureID
      @this.tex_id
    end

    def tex_id=(tex_id : ImTextureID)
      @this.tex_id = tex_id
    end

    def tex_desired_width : Int32
      @this.tex_desired_width
    end

    def tex_desired_width=(tex_desired_width : Int32)
      @this.tex_desired_width = tex_desired_width
    end

    def tex_glyph_padding : Int32
      @this.tex_glyph_padding
    end

    def tex_glyph_padding=(tex_glyph_padding : Int32)
      @this.tex_glyph_padding = tex_glyph_padding
    end

    def tex_pixels_alpha8 : LibC::UChar*
      @this.tex_pixels_alpha8
    end

    def tex_pixels_alpha8=(tex_pixels_alpha8 : LibC::UChar*)
      @this.tex_pixels_alpha8 = tex_pixels_alpha8
    end

    def tex_pixels_rgba32 : UInt32*
      @this.tex_pixels_rgba32
    end

    def tex_pixels_rgba32=(tex_pixels_rgba32 : UInt32*)
      @this.tex_pixels_rgba32 = tex_pixels_rgba32
    end

    def tex_width : Int32
      @this.tex_width
    end

    def tex_width=(tex_width : Int32)
      @this.tex_width = tex_width
    end

    def tex_height : Int32
      @this.tex_height
    end

    def tex_height=(tex_height : Int32)
      @this.tex_height = tex_height
    end

    def tex_uv_scale : ImVec2
      @this.tex_uv_scale.value
    end

    def tex_uv_scale=(tex_uv_scale : ImVec2)
      @this.tex_uv_scale = tex_uv_scale
    end

    def tex_uv_white_pixel : ImVec2
      @this.tex_uv_white_pixel.value
    end

    def tex_uv_white_pixel=(tex_uv_white_pixel : ImVec2)
      @this.tex_uv_white_pixel = tex_uv_white_pixel
    end

    def fonts : LibImGui::ImVector(ImFont*)
      @this.fonts.value
    end

    def fonts=(fonts : LibImGui::ImVector(ImFont*))
      @this.fonts = fonts
    end

    def custom_rects : LibImGui::ImVector(LibImGui::ImFontAtlasCustomRect)
      @this.custom_rects.value
    end

    def custom_rects=(custom_rects : LibImGui::ImVector(LibImGui::ImFontAtlasCustomRect))
      @this.custom_rects = custom_rects
    end

    def config_data : LibImGui::ImVector(LibImGui::ImFontConfig)
      @this.config_data.value
    end

    def config_data=(config_data : LibImGui::ImVector(LibImGui::ImFontConfig))
      @this.config_data = config_data
    end

    def custom_rect_ids : Int32[1]
      @this.custom_rect_ids
    end

    def custom_rect_ids=(custom_rect_ids : Int32[1])
      @this.custom_rect_ids = custom_rect_ids
    end

    def add_custom_rect_font_glyph(font : ImFont*, id : ImWchar, width : Int32, height : Int32, advance_x : Float32, offset : ImVec2 = ImVec2.new(0, 0)) : Int32
      LibImGui.ImFontAtlas_AddCustomRectFontGlyph(self, font, id, width, height, advance_x, offset)
    end

    def add_custom_rect_regular(width : Int32, height : Int32) : Int32
      LibImGui.ImFontAtlas_AddCustomRectRegular(self, width, height)
    end

    def add_font(font_cfg : ImFontConfig) : ImFont
      result = LibImGui.ImFontAtlas_AddFont(self, font_cfg)
      result.value
    end

    def add_font_default(font_cfg : ImFontConfig? = nil) : ImFont
      result = LibImGui.ImFontAtlas_AddFontDefault(self, font_cfg)
      result.value
    end

    def add_font_from_file_ttf(filename : String, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar*? = nil) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromFileTTF(self, filename, size_pixels, font_cfg, glyph_ranges)
      result.value
    end

    def add_font_from_memory_compressed_base85_ttf(compressed_font_data_base85 : String, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar*? = nil) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self, compressed_font_data_base85, size_pixels, font_cfg, glyph_ranges)
      result.value
    end

    def add_font_from_memory_compressed_ttf(compressed_font_data : Void*, compressed_font_size : Int32, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar*? = nil) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryCompressedTTF(self, compressed_font_data, compressed_font_size, size_pixels, font_cfg, glyph_ranges)
      result.value
    end

    def add_font_from_memory_ttf(font_data : Void*, font_size : Int32, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar*? = nil) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryTTF(self, font_data, font_size, size_pixels, font_cfg, glyph_ranges)
      result.value
    end

    def build : Bool
      LibImGui.ImFontAtlas_Build(self)
    end

    def calc_custom_rect_uv(rect : ImFontAtlasCustomRect) : {ImGui::ImVec2, ImGui::ImVec2}
      LibImGui.ImFontAtlas_CalcCustomRectUV(self, rect, out out_uv_min, out out_uv_max)
      {out_uv_min, out_uv_max}
    end

    def clear : Void
      LibImGui.ImFontAtlas_Clear(self)
    end

    def clear_fonts : Void
      LibImGui.ImFontAtlas_ClearFonts(self)
    end

    def clear_input_data : Void
      LibImGui.ImFontAtlas_ClearInputData(self)
    end

    def clear_tex_data : Void
      LibImGui.ImFontAtlas_ClearTexData(self)
    end

    def get_custom_rect_by_index(index : Int32) : ImFontAtlasCustomRect
      result = LibImGui.ImFontAtlas_GetCustomRectByIndex(self, index)
      ImFontAtlasCustomRect.new(result)
    end

    def get_glyph_ranges_chinese_full : ImWchar
      LibImGui.ImFontAtlas_GetGlyphRangesChineseFull(self)
    end

    def get_glyph_ranges_chinese_simplified_common : ImWchar
      LibImGui.ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self)
    end

    def get_glyph_ranges_cyrillic : ImWchar
      LibImGui.ImFontAtlas_GetGlyphRangesCyrillic(self)
    end

    def get_glyph_ranges_default : ImWchar
      LibImGui.ImFontAtlas_GetGlyphRangesDefault(self)
    end

    def get_glyph_ranges_japanese : ImWchar
      LibImGui.ImFontAtlas_GetGlyphRangesJapanese(self)
    end

    def get_glyph_ranges_korean : ImWchar
      LibImGui.ImFontAtlas_GetGlyphRangesKorean(self)
    end

    def get_glyph_ranges_thai : ImWchar
      LibImGui.ImFontAtlas_GetGlyphRangesThai(self)
    end

    def get_glyph_ranges_vietnamese : ImWchar
      LibImGui.ImFontAtlas_GetGlyphRangesVietnamese(self)
    end

    def get_mouse_cursor_tex_data(cursor : ImGuiMouseCursor) : {Bool, ImGui::ImVec2, ImGui::ImVec2, ImGui::ImVec2[2], ImGui::ImVec2[2]}
      result = LibImGui.ImFontAtlas_GetMouseCursorTexData(self, cursor, out out_offset, out out_size, out out_uv_border, out out_uv_fill)
      {result, out_offset, out_size, out_uv_border, out_uv_fill}
    end

    def get_tex_data_as_alpha8 : {LibC::UChar*, LibC::Int, LibC::Int, LibC::Int}
      LibImGui.ImFontAtlas_GetTexDataAsAlpha8(self, out out_pixels, out out_width, out out_height, out out_bytes_per_pixel)
      {out_pixels, out_width, out_height, out_bytes_per_pixel}
    end

    def get_tex_data_as_rgba32 : {LibC::UChar*, LibC::Int, LibC::Int, LibC::Int}
      LibImGui.ImFontAtlas_GetTexDataAsRGBA32(self, out out_pixels, out out_width, out out_height, out out_bytes_per_pixel)
      {out_pixels, out_width, out_height, out_bytes_per_pixel}
    end

    def self.new : ImFontAtlas
      result = LibImGui.ImFontAtlas_ImFontAtlas
      ImFontAtlas.new(result)
    end

    def is_built : Bool
      LibImGui.ImFontAtlas_IsBuilt(self)
    end

    def set_tex_id(id : ImTextureID) : Void
      LibImGui.ImFontAtlas_SetTexID(self, id)
    end
  end

  class ImFontAtlasCustomRect
    include ClassType(LibImGui::ImFontAtlasCustomRect)

    def width : UInt16
      @this.width
    end

    def width=(width : UInt16)
      @this.width = width
    end

    def height : UInt16
      @this.height
    end

    def height=(height : UInt16)
      @this.height = height
    end

    def x : UInt16
      @this.x
    end

    def x=(x : UInt16)
      @this.x = x
    end

    def y : UInt16
      @this.y
    end

    def y=(y : UInt16)
      @this.y = y
    end

    def glyph_id : UInt32
      @this.glyph_id
    end

    def glyph_id=(glyph_id : UInt32)
      @this.glyph_id = glyph_id
    end

    def glyph_advance_x : Float32
      @this.glyph_advance_x
    end

    def glyph_advance_x=(glyph_advance_x : Float32)
      @this.glyph_advance_x = glyph_advance_x
    end

    def glyph_offset : ImVec2
      @this.glyph_offset.value
    end

    def glyph_offset=(glyph_offset : ImVec2)
      @this.glyph_offset = glyph_offset
    end

    def font : ImFont*
      @this.font.value
    end

    def font=(font : ImFont*)
      @this.font = font
    end

    def self.new : ImFontAtlasCustomRect
      result = LibImGui.ImFontAtlasCustomRect_ImFontAtlasCustomRect
      ImFontAtlasCustomRect.new(result)
    end

    def is_packed : Bool
      LibImGui.ImFontAtlasCustomRect_IsPacked(self)
    end
  end

  class ImFontConfig
    include ClassType(LibImGui::ImFontConfig)

    def font_data : Void*
      @this.font_data
    end

    def font_data=(font_data : Void*)
      @this.font_data = font_data
    end

    def font_data_size : Int32
      @this.font_data_size
    end

    def font_data_size=(font_data_size : Int32)
      @this.font_data_size = font_data_size
    end

    def font_data_owned_by_atlas : Bool
      @this.font_data_owned_by_atlas
    end

    def font_data_owned_by_atlas=(font_data_owned_by_atlas : Bool)
      @this.font_data_owned_by_atlas = font_data_owned_by_atlas
    end

    def font_no : Int32
      @this.font_no
    end

    def font_no=(font_no : Int32)
      @this.font_no = font_no
    end

    def size_pixels : Float32
      @this.size_pixels
    end

    def size_pixels=(size_pixels : Float32)
      @this.size_pixels = size_pixels
    end

    def oversample_h : Int32
      @this.oversample_h
    end

    def oversample_h=(oversample_h : Int32)
      @this.oversample_h = oversample_h
    end

    def oversample_v : Int32
      @this.oversample_v
    end

    def oversample_v=(oversample_v : Int32)
      @this.oversample_v = oversample_v
    end

    def pixel_snap_h : Bool
      @this.pixel_snap_h
    end

    def pixel_snap_h=(pixel_snap_h : Bool)
      @this.pixel_snap_h = pixel_snap_h
    end

    def glyph_extra_spacing : ImVec2
      @this.glyph_extra_spacing.value
    end

    def glyph_extra_spacing=(glyph_extra_spacing : ImVec2)
      @this.glyph_extra_spacing = glyph_extra_spacing
    end

    def glyph_offset : ImVec2
      @this.glyph_offset.value
    end

    def glyph_offset=(glyph_offset : ImVec2)
      @this.glyph_offset = glyph_offset
    end

    def glyph_ranges : ImWchar*
      @this.glyph_ranges
    end

    def glyph_ranges=(glyph_ranges : ImWchar*)
      @this.glyph_ranges = glyph_ranges
    end

    def glyph_min_advance_x : Float32
      @this.glyph_min_advance_x
    end

    def glyph_min_advance_x=(glyph_min_advance_x : Float32)
      @this.glyph_min_advance_x = glyph_min_advance_x
    end

    def glyph_max_advance_x : Float32
      @this.glyph_max_advance_x
    end

    def glyph_max_advance_x=(glyph_max_advance_x : Float32)
      @this.glyph_max_advance_x = glyph_max_advance_x
    end

    def merge_mode : Bool
      @this.merge_mode
    end

    def merge_mode=(merge_mode : Bool)
      @this.merge_mode = merge_mode
    end

    def rasterizer_flags : UInt32
      @this.rasterizer_flags
    end

    def rasterizer_flags=(rasterizer_flags : UInt32)
      @this.rasterizer_flags = rasterizer_flags
    end

    def rasterizer_multiply : Float32
      @this.rasterizer_multiply
    end

    def rasterizer_multiply=(rasterizer_multiply : Float32)
      @this.rasterizer_multiply = rasterizer_multiply
    end

    def ellipsis_char : ImWchar
      @this.ellipsis_char
    end

    def ellipsis_char=(ellipsis_char : ImWchar)
      @this.ellipsis_char = ellipsis_char
    end

    def name : LibC::Char[40]
      @this.name
    end

    def name=(name : LibC::Char[40])
      @this.name = name
    end

    def dst_font : ImFont*
      @this.dst_font.value
    end

    def dst_font=(dst_font : ImFont*)
      @this.dst_font = dst_font
    end

    def self.new : ImFontConfig
      result = LibImGui.ImFontConfig_ImFontConfig
      ImFontConfig.new(result)
    end
  end

  struct ImFontGlyph
    include StructType
  end

  class ImFontGlyphRangesBuilder
    include ClassType(LibImGui::ImFontGlyphRangesBuilder)

    def used_chars : LibImGui::ImVector(UInt32)
      @this.used_chars.value
    end

    def used_chars=(used_chars : LibImGui::ImVector(UInt32))
      @this.used_chars = used_chars
    end

    def add_char(c : ImWchar) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddChar(self, c)
    end

    def add_ranges(ranges : ImWchar*) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddRanges(self, ranges)
    end

    def add_text(text : String, text_end : String? = nil) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddText(self, text, text_end)
    end

    def build_ranges : LibImGui::ImVector
      LibImGui.ImFontGlyphRangesBuilder_BuildRanges(self, out out_ranges)
      out_ranges.value
    end

    def clear : Void
      LibImGui.ImFontGlyphRangesBuilder_Clear(self)
    end

    def get_bit(n : LibC::SizeT) : Bool
      LibImGui.ImFontGlyphRangesBuilder_GetBit(self, n)
    end

    def self.new : ImFontGlyphRangesBuilder
      result = LibImGui.ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder
      ImFontGlyphRangesBuilder.new(result)
    end

    def set_bit(n : LibC::SizeT) : Void
      LibImGui.ImFontGlyphRangesBuilder_SetBit(self, n)
    end
  end

  class ImGuiContext
    include ClassType(LibImGui::ImGuiContext)

    def initialized : Bool
      @this.initialized
    end

    def initialized=(initialized : Bool)
      @this.initialized = initialized
    end

    def font_atlas_owned_by_context : Bool
      @this.font_atlas_owned_by_context
    end

    def font_atlas_owned_by_context=(font_atlas_owned_by_context : Bool)
      @this.font_atlas_owned_by_context = font_atlas_owned_by_context
    end

    def io : LibImGui::ImGuiIO
      ImGuiIO.new(@this.io)
    end

    def io=(io : LibImGui::ImGuiIO)
      @this.io = io
    end

    def style : LibImGui::ImGuiStyle
      ImGuiStyle.new(@this.style)
    end

    def style=(style : LibImGui::ImGuiStyle)
      @this.style = style
    end

    def font : ImFont*
      @this.font.value
    end

    def font=(font : ImFont*)
      @this.font = font
    end

    def font_size : Float32
      @this.font_size
    end

    def font_size=(font_size : Float32)
      @this.font_size = font_size
    end

    def font_base_size : Float32
      @this.font_base_size
    end

    def font_base_size=(font_base_size : Float32)
      @this.font_base_size = font_base_size
    end

    def draw_list_shared_data : LibImGui::ImDrawListSharedData
      ImDrawListSharedData.new(@this.draw_list_shared_data)
    end

    def draw_list_shared_data=(draw_list_shared_data : LibImGui::ImDrawListSharedData)
      @this.draw_list_shared_data = draw_list_shared_data
    end

    def time : Float64
      @this.time
    end

    def time=(time : Float64)
      @this.time = time
    end

    def frame_count : Int32
      @this.frame_count
    end

    def frame_count=(frame_count : Int32)
      @this.frame_count = frame_count
    end

    def frame_count_ended : Int32
      @this.frame_count_ended
    end

    def frame_count_ended=(frame_count_ended : Int32)
      @this.frame_count_ended = frame_count_ended
    end

    def frame_count_rendered : Int32
      @this.frame_count_rendered
    end

    def frame_count_rendered=(frame_count_rendered : Int32)
      @this.frame_count_rendered = frame_count_rendered
    end

    def within_frame_scope : Bool
      @this.within_frame_scope
    end

    def within_frame_scope=(within_frame_scope : Bool)
      @this.within_frame_scope = within_frame_scope
    end

    def within_frame_scope_with_implicit_window : Bool
      @this.within_frame_scope_with_implicit_window
    end

    def within_frame_scope_with_implicit_window=(within_frame_scope_with_implicit_window : Bool)
      @this.within_frame_scope_with_implicit_window = within_frame_scope_with_implicit_window
    end

    def within_end_child : Bool
      @this.within_end_child
    end

    def within_end_child=(within_end_child : Bool)
      @this.within_end_child = within_end_child
    end

    def test_engine_hook_items : Bool
      @this.test_engine_hook_items
    end

    def test_engine_hook_items=(test_engine_hook_items : Bool)
      @this.test_engine_hook_items = test_engine_hook_items
    end

    def test_engine_hook_id_info : ImGuiID
      @this.test_engine_hook_id_info
    end

    def test_engine_hook_id_info=(test_engine_hook_id_info : ImGuiID)
      @this.test_engine_hook_id_info = test_engine_hook_id_info
    end

    def test_engine : Void*
      @this.test_engine
    end

    def test_engine=(test_engine : Void*)
      @this.test_engine = test_engine
    end

    def windows : LibImGui::ImVector(ImGuiWindow)
      @this.windows.value
    end

    def windows=(windows : LibImGui::ImVector(ImGuiWindow))
      @this.windows = windows
    end

    def windows_focus_order : LibImGui::ImVector(ImGuiWindow)
      @this.windows_focus_order.value
    end

    def windows_focus_order=(windows_focus_order : LibImGui::ImVector(ImGuiWindow))
      @this.windows_focus_order = windows_focus_order
    end

    def windows_temp_sort_buffer : LibImGui::ImVector(ImGuiWindow)
      @this.windows_temp_sort_buffer.value
    end

    def windows_temp_sort_buffer=(windows_temp_sort_buffer : LibImGui::ImVector(ImGuiWindow))
      @this.windows_temp_sort_buffer = windows_temp_sort_buffer
    end

    def current_window_stack : LibImGui::ImVector(ImGuiWindow)
      @this.current_window_stack.value
    end

    def current_window_stack=(current_window_stack : LibImGui::ImVector(ImGuiWindow))
      @this.current_window_stack = current_window_stack
    end

    def windows_by_id : LibImGui::ImGuiStorage
      ImGuiStorage.new(@this.windows_by_id)
    end

    def windows_by_id=(windows_by_id : LibImGui::ImGuiStorage)
      @this.windows_by_id = windows_by_id
    end

    def windows_active_count : Int32
      @this.windows_active_count
    end

    def windows_active_count=(windows_active_count : Int32)
      @this.windows_active_count = windows_active_count
    end

    def current_window : ImGuiWindow
      ImGuiWindow.new(@this.current_window)
    end

    def current_window=(current_window : ImGuiWindow)
      @this.current_window = current_window
    end

    def hovered_window : ImGuiWindow
      ImGuiWindow.new(@this.hovered_window)
    end

    def hovered_window=(hovered_window : ImGuiWindow)
      @this.hovered_window = hovered_window
    end

    def hovered_root_window : ImGuiWindow
      ImGuiWindow.new(@this.hovered_root_window)
    end

    def hovered_root_window=(hovered_root_window : ImGuiWindow)
      @this.hovered_root_window = hovered_root_window
    end

    def moving_window : ImGuiWindow
      ImGuiWindow.new(@this.moving_window)
    end

    def moving_window=(moving_window : ImGuiWindow)
      @this.moving_window = moving_window
    end

    def wheeling_window : ImGuiWindow
      ImGuiWindow.new(@this.wheeling_window)
    end

    def wheeling_window=(wheeling_window : ImGuiWindow)
      @this.wheeling_window = wheeling_window
    end

    def wheeling_window_ref_mouse_pos : ImVec2
      @this.wheeling_window_ref_mouse_pos.value
    end

    def wheeling_window_ref_mouse_pos=(wheeling_window_ref_mouse_pos : ImVec2)
      @this.wheeling_window_ref_mouse_pos = wheeling_window_ref_mouse_pos
    end

    def wheeling_window_timer : Float32
      @this.wheeling_window_timer
    end

    def wheeling_window_timer=(wheeling_window_timer : Float32)
      @this.wheeling_window_timer = wheeling_window_timer
    end

    def hovered_id : ImGuiID
      @this.hovered_id
    end

    def hovered_id=(hovered_id : ImGuiID)
      @this.hovered_id = hovered_id
    end

    def hovered_id_allow_overlap : Bool
      @this.hovered_id_allow_overlap
    end

    def hovered_id_allow_overlap=(hovered_id_allow_overlap : Bool)
      @this.hovered_id_allow_overlap = hovered_id_allow_overlap
    end

    def hovered_id_previous_frame : ImGuiID
      @this.hovered_id_previous_frame
    end

    def hovered_id_previous_frame=(hovered_id_previous_frame : ImGuiID)
      @this.hovered_id_previous_frame = hovered_id_previous_frame
    end

    def hovered_id_timer : Float32
      @this.hovered_id_timer
    end

    def hovered_id_timer=(hovered_id_timer : Float32)
      @this.hovered_id_timer = hovered_id_timer
    end

    def hovered_id_not_active_timer : Float32
      @this.hovered_id_not_active_timer
    end

    def hovered_id_not_active_timer=(hovered_id_not_active_timer : Float32)
      @this.hovered_id_not_active_timer = hovered_id_not_active_timer
    end

    def active_id : ImGuiID
      @this.active_id
    end

    def active_id=(active_id : ImGuiID)
      @this.active_id = active_id
    end

    def active_id_is_alive : ImGuiID
      @this.active_id_is_alive
    end

    def active_id_is_alive=(active_id_is_alive : ImGuiID)
      @this.active_id_is_alive = active_id_is_alive
    end

    def active_id_timer : Float32
      @this.active_id_timer
    end

    def active_id_timer=(active_id_timer : Float32)
      @this.active_id_timer = active_id_timer
    end

    def active_id_is_just_activated : Bool
      @this.active_id_is_just_activated
    end

    def active_id_is_just_activated=(active_id_is_just_activated : Bool)
      @this.active_id_is_just_activated = active_id_is_just_activated
    end

    def active_id_allow_overlap : Bool
      @this.active_id_allow_overlap
    end

    def active_id_allow_overlap=(active_id_allow_overlap : Bool)
      @this.active_id_allow_overlap = active_id_allow_overlap
    end

    def active_id_has_been_pressed_before : Bool
      @this.active_id_has_been_pressed_before
    end

    def active_id_has_been_pressed_before=(active_id_has_been_pressed_before : Bool)
      @this.active_id_has_been_pressed_before = active_id_has_been_pressed_before
    end

    def active_id_has_been_edited_before : Bool
      @this.active_id_has_been_edited_before
    end

    def active_id_has_been_edited_before=(active_id_has_been_edited_before : Bool)
      @this.active_id_has_been_edited_before = active_id_has_been_edited_before
    end

    def active_id_has_been_edited_this_frame : Bool
      @this.active_id_has_been_edited_this_frame
    end

    def active_id_has_been_edited_this_frame=(active_id_has_been_edited_this_frame : Bool)
      @this.active_id_has_been_edited_this_frame = active_id_has_been_edited_this_frame
    end

    def active_id_using_nav_dir_mask : UInt32
      @this.active_id_using_nav_dir_mask
    end

    def active_id_using_nav_dir_mask=(active_id_using_nav_dir_mask : UInt32)
      @this.active_id_using_nav_dir_mask = active_id_using_nav_dir_mask
    end

    def active_id_using_nav_input_mask : UInt32
      @this.active_id_using_nav_input_mask
    end

    def active_id_using_nav_input_mask=(active_id_using_nav_input_mask : UInt32)
      @this.active_id_using_nav_input_mask = active_id_using_nav_input_mask
    end

    def active_id_using_key_input_mask : UInt64
      @this.active_id_using_key_input_mask
    end

    def active_id_using_key_input_mask=(active_id_using_key_input_mask : UInt64)
      @this.active_id_using_key_input_mask = active_id_using_key_input_mask
    end

    def active_id_click_offset : ImVec2
      @this.active_id_click_offset.value
    end

    def active_id_click_offset=(active_id_click_offset : ImVec2)
      @this.active_id_click_offset = active_id_click_offset
    end

    def active_id_window : ImGuiWindow
      ImGuiWindow.new(@this.active_id_window)
    end

    def active_id_window=(active_id_window : ImGuiWindow)
      @this.active_id_window = active_id_window
    end

    def active_id_source : LibImGui::ImGuiInputSource
      @this.active_id_source
    end

    def active_id_source=(active_id_source : LibImGui::ImGuiInputSource)
      @this.active_id_source = active_id_source
    end

    def active_id_mouse_button : Int32
      @this.active_id_mouse_button
    end

    def active_id_mouse_button=(active_id_mouse_button : Int32)
      @this.active_id_mouse_button = active_id_mouse_button
    end

    def active_id_previous_frame : ImGuiID
      @this.active_id_previous_frame
    end

    def active_id_previous_frame=(active_id_previous_frame : ImGuiID)
      @this.active_id_previous_frame = active_id_previous_frame
    end

    def active_id_previous_frame_is_alive : Bool
      @this.active_id_previous_frame_is_alive
    end

    def active_id_previous_frame_is_alive=(active_id_previous_frame_is_alive : Bool)
      @this.active_id_previous_frame_is_alive = active_id_previous_frame_is_alive
    end

    def active_id_previous_frame_has_been_edited_before : Bool
      @this.active_id_previous_frame_has_been_edited_before
    end

    def active_id_previous_frame_has_been_edited_before=(active_id_previous_frame_has_been_edited_before : Bool)
      @this.active_id_previous_frame_has_been_edited_before = active_id_previous_frame_has_been_edited_before
    end

    def active_id_previous_frame_window : ImGuiWindow
      ImGuiWindow.new(@this.active_id_previous_frame_window)
    end

    def active_id_previous_frame_window=(active_id_previous_frame_window : ImGuiWindow)
      @this.active_id_previous_frame_window = active_id_previous_frame_window
    end

    def last_active_id : ImGuiID
      @this.last_active_id
    end

    def last_active_id=(last_active_id : ImGuiID)
      @this.last_active_id = last_active_id
    end

    def last_active_id_timer : Float32
      @this.last_active_id_timer
    end

    def last_active_id_timer=(last_active_id_timer : Float32)
      @this.last_active_id_timer = last_active_id_timer
    end

    def next_window_data : LibImGui::ImGuiNextWindowData
      ImGuiNextWindowData.new(@this.next_window_data)
    end

    def next_window_data=(next_window_data : LibImGui::ImGuiNextWindowData)
      @this.next_window_data = next_window_data
    end

    def next_item_data : LibImGui::ImGuiNextItemData
      ImGuiNextItemData.new(@this.next_item_data)
    end

    def next_item_data=(next_item_data : LibImGui::ImGuiNextItemData)
      @this.next_item_data = next_item_data
    end

    def color_modifiers : LibImGui::ImVector(LibImGui::ImGuiColorMod)
      @this.color_modifiers.value
    end

    def color_modifiers=(color_modifiers : LibImGui::ImVector(LibImGui::ImGuiColorMod))
      @this.color_modifiers = color_modifiers
    end

    def style_modifiers : LibImGui::ImVector(LibImGui::ImGuiStyleMod)
      @this.style_modifiers.value
    end

    def style_modifiers=(style_modifiers : LibImGui::ImVector(LibImGui::ImGuiStyleMod))
      @this.style_modifiers = style_modifiers
    end

    def font_stack : LibImGui::ImVector(ImFont*)
      @this.font_stack.value
    end

    def font_stack=(font_stack : LibImGui::ImVector(ImFont*))
      @this.font_stack = font_stack
    end

    def open_popup_stack : LibImGui::ImVector(LibImGui::ImGuiPopupData)
      @this.open_popup_stack.value
    end

    def open_popup_stack=(open_popup_stack : LibImGui::ImVector(LibImGui::ImGuiPopupData))
      @this.open_popup_stack = open_popup_stack
    end

    def begin_popup_stack : LibImGui::ImVector(LibImGui::ImGuiPopupData)
      @this.begin_popup_stack.value
    end

    def begin_popup_stack=(begin_popup_stack : LibImGui::ImVector(LibImGui::ImGuiPopupData))
      @this.begin_popup_stack = begin_popup_stack
    end

    def nav_window : ImGuiWindow
      ImGuiWindow.new(@this.nav_window)
    end

    def nav_window=(nav_window : ImGuiWindow)
      @this.nav_window = nav_window
    end

    def nav_id : ImGuiID
      @this.nav_id
    end

    def nav_id=(nav_id : ImGuiID)
      @this.nav_id = nav_id
    end

    def nav_focus_scope_id : ImGuiID
      @this.nav_focus_scope_id
    end

    def nav_focus_scope_id=(nav_focus_scope_id : ImGuiID)
      @this.nav_focus_scope_id = nav_focus_scope_id
    end

    def nav_activate_id : ImGuiID
      @this.nav_activate_id
    end

    def nav_activate_id=(nav_activate_id : ImGuiID)
      @this.nav_activate_id = nav_activate_id
    end

    def nav_activate_down_id : ImGuiID
      @this.nav_activate_down_id
    end

    def nav_activate_down_id=(nav_activate_down_id : ImGuiID)
      @this.nav_activate_down_id = nav_activate_down_id
    end

    def nav_activate_pressed_id : ImGuiID
      @this.nav_activate_pressed_id
    end

    def nav_activate_pressed_id=(nav_activate_pressed_id : ImGuiID)
      @this.nav_activate_pressed_id = nav_activate_pressed_id
    end

    def nav_input_id : ImGuiID
      @this.nav_input_id
    end

    def nav_input_id=(nav_input_id : ImGuiID)
      @this.nav_input_id = nav_input_id
    end

    def nav_just_tabbed_id : ImGuiID
      @this.nav_just_tabbed_id
    end

    def nav_just_tabbed_id=(nav_just_tabbed_id : ImGuiID)
      @this.nav_just_tabbed_id = nav_just_tabbed_id
    end

    def nav_just_moved_to_id : ImGuiID
      @this.nav_just_moved_to_id
    end

    def nav_just_moved_to_id=(nav_just_moved_to_id : ImGuiID)
      @this.nav_just_moved_to_id = nav_just_moved_to_id
    end

    def nav_just_moved_to_focus_scope_id : ImGuiID
      @this.nav_just_moved_to_focus_scope_id
    end

    def nav_just_moved_to_focus_scope_id=(nav_just_moved_to_focus_scope_id : ImGuiID)
      @this.nav_just_moved_to_focus_scope_id = nav_just_moved_to_focus_scope_id
    end

    def nav_just_moved_to_key_mods : ImGuiKeyModFlags
      @this.nav_just_moved_to_key_mods
    end

    def nav_just_moved_to_key_mods=(nav_just_moved_to_key_mods : ImGuiKeyModFlags)
      @this.nav_just_moved_to_key_mods = nav_just_moved_to_key_mods
    end

    def nav_next_activate_id : ImGuiID
      @this.nav_next_activate_id
    end

    def nav_next_activate_id=(nav_next_activate_id : ImGuiID)
      @this.nav_next_activate_id = nav_next_activate_id
    end

    def nav_input_source : LibImGui::ImGuiInputSource
      @this.nav_input_source
    end

    def nav_input_source=(nav_input_source : LibImGui::ImGuiInputSource)
      @this.nav_input_source = nav_input_source
    end

    def nav_scoring_rect : LibImGui::ImRect
      ImRect.new(@this.nav_scoring_rect)
    end

    def nav_scoring_rect=(nav_scoring_rect : LibImGui::ImRect)
      @this.nav_scoring_rect = nav_scoring_rect
    end

    def nav_scoring_count : Int32
      @this.nav_scoring_count
    end

    def nav_scoring_count=(nav_scoring_count : Int32)
      @this.nav_scoring_count = nav_scoring_count
    end

    def nav_layer : LibImGui::ImGuiNavLayer
      @this.nav_layer
    end

    def nav_layer=(nav_layer : LibImGui::ImGuiNavLayer)
      @this.nav_layer = nav_layer
    end

    def nav_id_tab_counter : Int32
      @this.nav_id_tab_counter
    end

    def nav_id_tab_counter=(nav_id_tab_counter : Int32)
      @this.nav_id_tab_counter = nav_id_tab_counter
    end

    def nav_id_is_alive : Bool
      @this.nav_id_is_alive
    end

    def nav_id_is_alive=(nav_id_is_alive : Bool)
      @this.nav_id_is_alive = nav_id_is_alive
    end

    def nav_mouse_pos_dirty : Bool
      @this.nav_mouse_pos_dirty
    end

    def nav_mouse_pos_dirty=(nav_mouse_pos_dirty : Bool)
      @this.nav_mouse_pos_dirty = nav_mouse_pos_dirty
    end

    def nav_disable_highlight : Bool
      @this.nav_disable_highlight
    end

    def nav_disable_highlight=(nav_disable_highlight : Bool)
      @this.nav_disable_highlight = nav_disable_highlight
    end

    def nav_disable_mouse_hover : Bool
      @this.nav_disable_mouse_hover
    end

    def nav_disable_mouse_hover=(nav_disable_mouse_hover : Bool)
      @this.nav_disable_mouse_hover = nav_disable_mouse_hover
    end

    def nav_any_request : Bool
      @this.nav_any_request
    end

    def nav_any_request=(nav_any_request : Bool)
      @this.nav_any_request = nav_any_request
    end

    def nav_init_request : Bool
      @this.nav_init_request
    end

    def nav_init_request=(nav_init_request : Bool)
      @this.nav_init_request = nav_init_request
    end

    def nav_init_request_from_move : Bool
      @this.nav_init_request_from_move
    end

    def nav_init_request_from_move=(nav_init_request_from_move : Bool)
      @this.nav_init_request_from_move = nav_init_request_from_move
    end

    def nav_init_result_id : ImGuiID
      @this.nav_init_result_id
    end

    def nav_init_result_id=(nav_init_result_id : ImGuiID)
      @this.nav_init_result_id = nav_init_result_id
    end

    def nav_init_result_rect_rel : LibImGui::ImRect
      ImRect.new(@this.nav_init_result_rect_rel)
    end

    def nav_init_result_rect_rel=(nav_init_result_rect_rel : LibImGui::ImRect)
      @this.nav_init_result_rect_rel = nav_init_result_rect_rel
    end

    def nav_move_from_clamped_ref_rect : Bool
      @this.nav_move_from_clamped_ref_rect
    end

    def nav_move_from_clamped_ref_rect=(nav_move_from_clamped_ref_rect : Bool)
      @this.nav_move_from_clamped_ref_rect = nav_move_from_clamped_ref_rect
    end

    def nav_move_request : Bool
      @this.nav_move_request
    end

    def nav_move_request=(nav_move_request : Bool)
      @this.nav_move_request = nav_move_request
    end

    def nav_move_request_flags : LibImGui::ImGuiNavMoveFlags
      @this.nav_move_request_flags
    end

    def nav_move_request_flags=(nav_move_request_flags : LibImGui::ImGuiNavMoveFlags)
      @this.nav_move_request_flags = nav_move_request_flags
    end

    def nav_move_request_forward : LibImGui::ImGuiNavForward
      @this.nav_move_request_forward
    end

    def nav_move_request_forward=(nav_move_request_forward : LibImGui::ImGuiNavForward)
      @this.nav_move_request_forward = nav_move_request_forward
    end

    def nav_move_request_key_mods : ImGuiKeyModFlags
      @this.nav_move_request_key_mods
    end

    def nav_move_request_key_mods=(nav_move_request_key_mods : ImGuiKeyModFlags)
      @this.nav_move_request_key_mods = nav_move_request_key_mods
    end

    def nav_move_dir : ImGuiDir
      @this.nav_move_dir
    end

    def nav_move_dir=(nav_move_dir : ImGuiDir)
      @this.nav_move_dir = nav_move_dir
    end

    def nav_move_dir_last : ImGuiDir
      @this.nav_move_dir_last
    end

    def nav_move_dir_last=(nav_move_dir_last : ImGuiDir)
      @this.nav_move_dir_last = nav_move_dir_last
    end

    def nav_move_clip_dir : ImGuiDir
      @this.nav_move_clip_dir
    end

    def nav_move_clip_dir=(nav_move_clip_dir : ImGuiDir)
      @this.nav_move_clip_dir = nav_move_clip_dir
    end

    def nav_move_result_local : LibImGui::ImGuiNavMoveResult
      ImGuiNavMoveResult.new(@this.nav_move_result_local)
    end

    def nav_move_result_local=(nav_move_result_local : LibImGui::ImGuiNavMoveResult)
      @this.nav_move_result_local = nav_move_result_local
    end

    def nav_move_result_local_visible_set : LibImGui::ImGuiNavMoveResult
      ImGuiNavMoveResult.new(@this.nav_move_result_local_visible_set)
    end

    def nav_move_result_local_visible_set=(nav_move_result_local_visible_set : LibImGui::ImGuiNavMoveResult)
      @this.nav_move_result_local_visible_set = nav_move_result_local_visible_set
    end

    def nav_move_result_other : LibImGui::ImGuiNavMoveResult
      ImGuiNavMoveResult.new(@this.nav_move_result_other)
    end

    def nav_move_result_other=(nav_move_result_other : LibImGui::ImGuiNavMoveResult)
      @this.nav_move_result_other = nav_move_result_other
    end

    def nav_wrap_request_window : ImGuiWindow
      ImGuiWindow.new(@this.nav_wrap_request_window)
    end

    def nav_wrap_request_window=(nav_wrap_request_window : ImGuiWindow)
      @this.nav_wrap_request_window = nav_wrap_request_window
    end

    def nav_wrap_request_flags : LibImGui::ImGuiNavMoveFlags
      @this.nav_wrap_request_flags
    end

    def nav_wrap_request_flags=(nav_wrap_request_flags : LibImGui::ImGuiNavMoveFlags)
      @this.nav_wrap_request_flags = nav_wrap_request_flags
    end

    def nav_windowing_target : ImGuiWindow
      ImGuiWindow.new(@this.nav_windowing_target)
    end

    def nav_windowing_target=(nav_windowing_target : ImGuiWindow)
      @this.nav_windowing_target = nav_windowing_target
    end

    def nav_windowing_target_anim : ImGuiWindow
      ImGuiWindow.new(@this.nav_windowing_target_anim)
    end

    def nav_windowing_target_anim=(nav_windowing_target_anim : ImGuiWindow)
      @this.nav_windowing_target_anim = nav_windowing_target_anim
    end

    def nav_windowing_list_window : ImGuiWindow
      ImGuiWindow.new(@this.nav_windowing_list_window)
    end

    def nav_windowing_list_window=(nav_windowing_list_window : ImGuiWindow)
      @this.nav_windowing_list_window = nav_windowing_list_window
    end

    def nav_windowing_timer : Float32
      @this.nav_windowing_timer
    end

    def nav_windowing_timer=(nav_windowing_timer : Float32)
      @this.nav_windowing_timer = nav_windowing_timer
    end

    def nav_windowing_highlight_alpha : Float32
      @this.nav_windowing_highlight_alpha
    end

    def nav_windowing_highlight_alpha=(nav_windowing_highlight_alpha : Float32)
      @this.nav_windowing_highlight_alpha = nav_windowing_highlight_alpha
    end

    def nav_windowing_toggle_layer : Bool
      @this.nav_windowing_toggle_layer
    end

    def nav_windowing_toggle_layer=(nav_windowing_toggle_layer : Bool)
      @this.nav_windowing_toggle_layer = nav_windowing_toggle_layer
    end

    def focus_request_curr_window : ImGuiWindow
      ImGuiWindow.new(@this.focus_request_curr_window)
    end

    def focus_request_curr_window=(focus_request_curr_window : ImGuiWindow)
      @this.focus_request_curr_window = focus_request_curr_window
    end

    def focus_request_next_window : ImGuiWindow
      ImGuiWindow.new(@this.focus_request_next_window)
    end

    def focus_request_next_window=(focus_request_next_window : ImGuiWindow)
      @this.focus_request_next_window = focus_request_next_window
    end

    def focus_request_curr_counter_regular : Int32
      @this.focus_request_curr_counter_regular
    end

    def focus_request_curr_counter_regular=(focus_request_curr_counter_regular : Int32)
      @this.focus_request_curr_counter_regular = focus_request_curr_counter_regular
    end

    def focus_request_curr_counter_tab_stop : Int32
      @this.focus_request_curr_counter_tab_stop
    end

    def focus_request_curr_counter_tab_stop=(focus_request_curr_counter_tab_stop : Int32)
      @this.focus_request_curr_counter_tab_stop = focus_request_curr_counter_tab_stop
    end

    def focus_request_next_counter_regular : Int32
      @this.focus_request_next_counter_regular
    end

    def focus_request_next_counter_regular=(focus_request_next_counter_regular : Int32)
      @this.focus_request_next_counter_regular = focus_request_next_counter_regular
    end

    def focus_request_next_counter_tab_stop : Int32
      @this.focus_request_next_counter_tab_stop
    end

    def focus_request_next_counter_tab_stop=(focus_request_next_counter_tab_stop : Int32)
      @this.focus_request_next_counter_tab_stop = focus_request_next_counter_tab_stop
    end

    def focus_tab_pressed : Bool
      @this.focus_tab_pressed
    end

    def focus_tab_pressed=(focus_tab_pressed : Bool)
      @this.focus_tab_pressed = focus_tab_pressed
    end

    def draw_data : LibImGui::ImDrawData
      ImDrawData.new(@this.draw_data)
    end

    def draw_data=(draw_data : LibImGui::ImDrawData)
      @this.draw_data = draw_data
    end

    def draw_data_builder : LibImGui::ImDrawDataBuilder
      ImDrawDataBuilder.new(@this.draw_data_builder)
    end

    def draw_data_builder=(draw_data_builder : LibImGui::ImDrawDataBuilder)
      @this.draw_data_builder = draw_data_builder
    end

    def dim_bg_ratio : Float32
      @this.dim_bg_ratio
    end

    def dim_bg_ratio=(dim_bg_ratio : Float32)
      @this.dim_bg_ratio = dim_bg_ratio
    end

    def background_draw_list : LibImGui::ImDrawList
      ImDrawList.new(@this.background_draw_list)
    end

    def background_draw_list=(background_draw_list : LibImGui::ImDrawList)
      @this.background_draw_list = background_draw_list
    end

    def foreground_draw_list : LibImGui::ImDrawList
      ImDrawList.new(@this.foreground_draw_list)
    end

    def foreground_draw_list=(foreground_draw_list : LibImGui::ImDrawList)
      @this.foreground_draw_list = foreground_draw_list
    end

    def mouse_cursor : ImGuiMouseCursor
      @this.mouse_cursor
    end

    def mouse_cursor=(mouse_cursor : ImGuiMouseCursor)
      @this.mouse_cursor = mouse_cursor
    end

    def drag_drop_active : Bool
      @this.drag_drop_active
    end

    def drag_drop_active=(drag_drop_active : Bool)
      @this.drag_drop_active = drag_drop_active
    end

    def drag_drop_within_source : Bool
      @this.drag_drop_within_source
    end

    def drag_drop_within_source=(drag_drop_within_source : Bool)
      @this.drag_drop_within_source = drag_drop_within_source
    end

    def drag_drop_within_target : Bool
      @this.drag_drop_within_target
    end

    def drag_drop_within_target=(drag_drop_within_target : Bool)
      @this.drag_drop_within_target = drag_drop_within_target
    end

    def drag_drop_source_flags : ImGuiDragDropFlags
      @this.drag_drop_source_flags
    end

    def drag_drop_source_flags=(drag_drop_source_flags : ImGuiDragDropFlags)
      @this.drag_drop_source_flags = drag_drop_source_flags
    end

    def drag_drop_source_frame_count : Int32
      @this.drag_drop_source_frame_count
    end

    def drag_drop_source_frame_count=(drag_drop_source_frame_count : Int32)
      @this.drag_drop_source_frame_count = drag_drop_source_frame_count
    end

    def drag_drop_mouse_button : Int32
      @this.drag_drop_mouse_button
    end

    def drag_drop_mouse_button=(drag_drop_mouse_button : Int32)
      @this.drag_drop_mouse_button = drag_drop_mouse_button
    end

    def drag_drop_payload : LibImGui::ImGuiPayload
      ImGuiPayload.new(@this.drag_drop_payload)
    end

    def drag_drop_payload=(drag_drop_payload : LibImGui::ImGuiPayload)
      @this.drag_drop_payload = drag_drop_payload
    end

    def drag_drop_target_rect : LibImGui::ImRect
      ImRect.new(@this.drag_drop_target_rect)
    end

    def drag_drop_target_rect=(drag_drop_target_rect : LibImGui::ImRect)
      @this.drag_drop_target_rect = drag_drop_target_rect
    end

    def drag_drop_target_id : ImGuiID
      @this.drag_drop_target_id
    end

    def drag_drop_target_id=(drag_drop_target_id : ImGuiID)
      @this.drag_drop_target_id = drag_drop_target_id
    end

    def drag_drop_accept_flags : ImGuiDragDropFlags
      @this.drag_drop_accept_flags
    end

    def drag_drop_accept_flags=(drag_drop_accept_flags : ImGuiDragDropFlags)
      @this.drag_drop_accept_flags = drag_drop_accept_flags
    end

    def drag_drop_accept_id_curr_rect_surface : Float32
      @this.drag_drop_accept_id_curr_rect_surface
    end

    def drag_drop_accept_id_curr_rect_surface=(drag_drop_accept_id_curr_rect_surface : Float32)
      @this.drag_drop_accept_id_curr_rect_surface = drag_drop_accept_id_curr_rect_surface
    end

    def drag_drop_accept_id_curr : ImGuiID
      @this.drag_drop_accept_id_curr
    end

    def drag_drop_accept_id_curr=(drag_drop_accept_id_curr : ImGuiID)
      @this.drag_drop_accept_id_curr = drag_drop_accept_id_curr
    end

    def drag_drop_accept_id_prev : ImGuiID
      @this.drag_drop_accept_id_prev
    end

    def drag_drop_accept_id_prev=(drag_drop_accept_id_prev : ImGuiID)
      @this.drag_drop_accept_id_prev = drag_drop_accept_id_prev
    end

    def drag_drop_accept_frame_count : Int32
      @this.drag_drop_accept_frame_count
    end

    def drag_drop_accept_frame_count=(drag_drop_accept_frame_count : Int32)
      @this.drag_drop_accept_frame_count = drag_drop_accept_frame_count
    end

    def drag_drop_hold_just_pressed_id : ImGuiID
      @this.drag_drop_hold_just_pressed_id
    end

    def drag_drop_hold_just_pressed_id=(drag_drop_hold_just_pressed_id : ImGuiID)
      @this.drag_drop_hold_just_pressed_id = drag_drop_hold_just_pressed_id
    end

    def drag_drop_payload_buf_heap : LibImGui::ImVector(LibC::UChar)
      @this.drag_drop_payload_buf_heap.value
    end

    def drag_drop_payload_buf_heap=(drag_drop_payload_buf_heap : LibImGui::ImVector(LibC::UChar))
      @this.drag_drop_payload_buf_heap = drag_drop_payload_buf_heap
    end

    def drag_drop_payload_buf_local : LibC::UChar[16]
      @this.drag_drop_payload_buf_local
    end

    def drag_drop_payload_buf_local=(drag_drop_payload_buf_local : LibC::UChar[16])
      @this.drag_drop_payload_buf_local = drag_drop_payload_buf_local
    end

    def current_tab_bar : ImGuiTabBar
      ImGuiTabBar.new(@this.current_tab_bar)
    end

    def current_tab_bar=(current_tab_bar : ImGuiTabBar)
      @this.current_tab_bar = current_tab_bar
    end

    def tab_bars : ImPool(LibImGui::ImGuiTabBar)
      @this.tab_bars
    end

    def tab_bars=(tab_bars : ImPool(LibImGui::ImGuiTabBar))
      @this.tab_bars = tab_bars
    end

    def current_tab_bar_stack : LibImGui::ImVector(LibImGui::ImGuiPtrOrIndex)
      @this.current_tab_bar_stack.value
    end

    def current_tab_bar_stack=(current_tab_bar_stack : LibImGui::ImVector(LibImGui::ImGuiPtrOrIndex))
      @this.current_tab_bar_stack = current_tab_bar_stack
    end

    def shrink_width_buffer : LibImGui::ImVector(LibImGui::ImGuiShrinkWidthItem)
      @this.shrink_width_buffer.value
    end

    def shrink_width_buffer=(shrink_width_buffer : LibImGui::ImVector(LibImGui::ImGuiShrinkWidthItem))
      @this.shrink_width_buffer = shrink_width_buffer
    end

    def last_valid_mouse_pos : ImVec2
      @this.last_valid_mouse_pos.value
    end

    def last_valid_mouse_pos=(last_valid_mouse_pos : ImVec2)
      @this.last_valid_mouse_pos = last_valid_mouse_pos
    end

    def input_text_state : LibImGui::ImGuiInputTextState
      ImGuiInputTextState.new(@this.input_text_state)
    end

    def input_text_state=(input_text_state : LibImGui::ImGuiInputTextState)
      @this.input_text_state = input_text_state
    end

    def input_text_password_font : ImFont
      @this.input_text_password_font.value
    end

    def input_text_password_font=(input_text_password_font : ImFont)
      @this.input_text_password_font = input_text_password_font
    end

    def temp_input_id : ImGuiID
      @this.temp_input_id
    end

    def temp_input_id=(temp_input_id : ImGuiID)
      @this.temp_input_id = temp_input_id
    end

    def color_edit_options : ImGuiColorEditFlags
      @this.color_edit_options
    end

    def color_edit_options=(color_edit_options : ImGuiColorEditFlags)
      @this.color_edit_options = color_edit_options
    end

    def color_edit_last_hue : Float32
      @this.color_edit_last_hue
    end

    def color_edit_last_hue=(color_edit_last_hue : Float32)
      @this.color_edit_last_hue = color_edit_last_hue
    end

    def color_edit_last_sat : Float32
      @this.color_edit_last_sat
    end

    def color_edit_last_sat=(color_edit_last_sat : Float32)
      @this.color_edit_last_sat = color_edit_last_sat
    end

    def color_edit_last_color : Float32[3]
      @this.color_edit_last_color
    end

    def color_edit_last_color=(color_edit_last_color : Float32[3])
      @this.color_edit_last_color = color_edit_last_color
    end

    def color_picker_ref : ImVec4
      @this.color_picker_ref.value
    end

    def color_picker_ref=(color_picker_ref : ImVec4)
      @this.color_picker_ref = color_picker_ref
    end

    def drag_current_accum_dirty : Bool
      @this.drag_current_accum_dirty
    end

    def drag_current_accum_dirty=(drag_current_accum_dirty : Bool)
      @this.drag_current_accum_dirty = drag_current_accum_dirty
    end

    def drag_current_accum : Float32
      @this.drag_current_accum
    end

    def drag_current_accum=(drag_current_accum : Float32)
      @this.drag_current_accum = drag_current_accum
    end

    def drag_speed_default_ratio : Float32
      @this.drag_speed_default_ratio
    end

    def drag_speed_default_ratio=(drag_speed_default_ratio : Float32)
      @this.drag_speed_default_ratio = drag_speed_default_ratio
    end

    def scrollbar_click_delta_to_grab_center : Float32
      @this.scrollbar_click_delta_to_grab_center
    end

    def scrollbar_click_delta_to_grab_center=(scrollbar_click_delta_to_grab_center : Float32)
      @this.scrollbar_click_delta_to_grab_center = scrollbar_click_delta_to_grab_center
    end

    def tooltip_override_count : Int32
      @this.tooltip_override_count
    end

    def tooltip_override_count=(tooltip_override_count : Int32)
      @this.tooltip_override_count = tooltip_override_count
    end

    def clipboard_handler_data : LibImGui::ImVector(LibC::Char)
      @this.clipboard_handler_data.value
    end

    def clipboard_handler_data=(clipboard_handler_data : LibImGui::ImVector(LibC::Char))
      @this.clipboard_handler_data = clipboard_handler_data
    end

    def menus_id_submitted_this_frame : LibImGui::ImVector(ImGuiID)
      @this.menus_id_submitted_this_frame.value
    end

    def menus_id_submitted_this_frame=(menus_id_submitted_this_frame : LibImGui::ImVector(ImGuiID))
      @this.menus_id_submitted_this_frame = menus_id_submitted_this_frame
    end

    def platform_ime_pos : ImVec2
      @this.platform_ime_pos.value
    end

    def platform_ime_pos=(platform_ime_pos : ImVec2)
      @this.platform_ime_pos = platform_ime_pos
    end

    def platform_ime_last_pos : ImVec2
      @this.platform_ime_last_pos.value
    end

    def platform_ime_last_pos=(platform_ime_last_pos : ImVec2)
      @this.platform_ime_last_pos = platform_ime_last_pos
    end

    def settings_loaded : Bool
      @this.settings_loaded
    end

    def settings_loaded=(settings_loaded : Bool)
      @this.settings_loaded = settings_loaded
    end

    def settings_dirty_timer : Float32
      @this.settings_dirty_timer
    end

    def settings_dirty_timer=(settings_dirty_timer : Float32)
      @this.settings_dirty_timer = settings_dirty_timer
    end

    def settings_ini_data : LibImGui::ImGuiTextBuffer
      ImGuiTextBuffer.new(@this.settings_ini_data)
    end

    def settings_ini_data=(settings_ini_data : LibImGui::ImGuiTextBuffer)
      @this.settings_ini_data = settings_ini_data
    end

    def settings_handlers : LibImGui::ImVector(LibImGui::ImGuiSettingsHandler)
      @this.settings_handlers.value
    end

    def settings_handlers=(settings_handlers : LibImGui::ImVector(LibImGui::ImGuiSettingsHandler))
      @this.settings_handlers = settings_handlers
    end

    def settings_windows : ImChunkStream(LibImGui::ImGuiWindowSettings)
      @this.settings_windows
    end

    def settings_windows=(settings_windows : ImChunkStream(LibImGui::ImGuiWindowSettings))
      @this.settings_windows = settings_windows
    end

    def log_enabled : Bool
      @this.log_enabled
    end

    def log_enabled=(log_enabled : Bool)
      @this.log_enabled = log_enabled
    end

    def log_type : LibImGui::ImGuiLogType
      @this.log_type
    end

    def log_type=(log_type : LibImGui::ImGuiLogType)
      @this.log_type = log_type
    end

    def log_file : ImFileHandle
      @this.log_file
    end

    def log_file=(log_file : ImFileHandle)
      @this.log_file = log_file
    end

    def log_buffer : LibImGui::ImGuiTextBuffer
      ImGuiTextBuffer.new(@this.log_buffer)
    end

    def log_buffer=(log_buffer : LibImGui::ImGuiTextBuffer)
      @this.log_buffer = log_buffer
    end

    def log_line_pos_y : Float32
      @this.log_line_pos_y
    end

    def log_line_pos_y=(log_line_pos_y : Float32)
      @this.log_line_pos_y = log_line_pos_y
    end

    def log_line_first_item : Bool
      @this.log_line_first_item
    end

    def log_line_first_item=(log_line_first_item : Bool)
      @this.log_line_first_item = log_line_first_item
    end

    def log_depth_ref : Int32
      @this.log_depth_ref
    end

    def log_depth_ref=(log_depth_ref : Int32)
      @this.log_depth_ref = log_depth_ref
    end

    def log_depth_to_expand : Int32
      @this.log_depth_to_expand
    end

    def log_depth_to_expand=(log_depth_to_expand : Int32)
      @this.log_depth_to_expand = log_depth_to_expand
    end

    def log_depth_to_expand_default : Int32
      @this.log_depth_to_expand_default
    end

    def log_depth_to_expand_default=(log_depth_to_expand_default : Int32)
      @this.log_depth_to_expand_default = log_depth_to_expand_default
    end

    def debug_item_picker_active : Bool
      @this.debug_item_picker_active
    end

    def debug_item_picker_active=(debug_item_picker_active : Bool)
      @this.debug_item_picker_active = debug_item_picker_active
    end

    def debug_item_picker_break_id : ImGuiID
      @this.debug_item_picker_break_id
    end

    def debug_item_picker_break_id=(debug_item_picker_break_id : ImGuiID)
      @this.debug_item_picker_break_id = debug_item_picker_break_id
    end

    def framerate_sec_per_frame : Float32[120]
      @this.framerate_sec_per_frame
    end

    def framerate_sec_per_frame=(framerate_sec_per_frame : Float32[120])
      @this.framerate_sec_per_frame = framerate_sec_per_frame
    end

    def framerate_sec_per_frame_idx : Int32
      @this.framerate_sec_per_frame_idx
    end

    def framerate_sec_per_frame_idx=(framerate_sec_per_frame_idx : Int32)
      @this.framerate_sec_per_frame_idx = framerate_sec_per_frame_idx
    end

    def framerate_sec_per_frame_accum : Float32
      @this.framerate_sec_per_frame_accum
    end

    def framerate_sec_per_frame_accum=(framerate_sec_per_frame_accum : Float32)
      @this.framerate_sec_per_frame_accum = framerate_sec_per_frame_accum
    end

    def want_capture_mouse_next_frame : Int32
      @this.want_capture_mouse_next_frame
    end

    def want_capture_mouse_next_frame=(want_capture_mouse_next_frame : Int32)
      @this.want_capture_mouse_next_frame = want_capture_mouse_next_frame
    end

    def want_capture_keyboard_next_frame : Int32
      @this.want_capture_keyboard_next_frame
    end

    def want_capture_keyboard_next_frame=(want_capture_keyboard_next_frame : Int32)
      @this.want_capture_keyboard_next_frame = want_capture_keyboard_next_frame
    end

    def want_text_input_next_frame : Int32
      @this.want_text_input_next_frame
    end

    def want_text_input_next_frame=(want_text_input_next_frame : Int32)
      @this.want_text_input_next_frame = want_text_input_next_frame
    end

    def temp_buffer : LibC::Char[3073]
      @this.temp_buffer
    end

    def temp_buffer=(temp_buffer : LibC::Char[3073])
      @this.temp_buffer = temp_buffer
    end
  end

  class ImGuiIO
    include ClassType(LibImGui::ImGuiIO)

    def config_flags : ImGuiConfigFlags
      @this.config_flags
    end

    def config_flags=(config_flags : ImGuiConfigFlags)
      @this.config_flags = config_flags
    end

    def backend_flags : ImGuiBackendFlags
      @this.backend_flags
    end

    def backend_flags=(backend_flags : ImGuiBackendFlags)
      @this.backend_flags = backend_flags
    end

    def display_size : ImVec2
      @this.display_size.value
    end

    def display_size=(display_size : ImVec2)
      @this.display_size = display_size
    end

    def delta_time : Float32
      @this.delta_time
    end

    def delta_time=(delta_time : Float32)
      @this.delta_time = delta_time
    end

    def ini_saving_rate : Float32
      @this.ini_saving_rate
    end

    def ini_saving_rate=(ini_saving_rate : Float32)
      @this.ini_saving_rate = ini_saving_rate
    end

    def ini_filename : String
      String.new(@this.ini_filename)
    end

    def ini_filename=(ini_filename : String)
      @this.ini_filename = ini_filename
    end

    def log_filename : String
      String.new(@this.log_filename)
    end

    def log_filename=(log_filename : String)
      @this.log_filename = log_filename
    end

    def mouse_double_click_time : Float32
      @this.mouse_double_click_time
    end

    def mouse_double_click_time=(mouse_double_click_time : Float32)
      @this.mouse_double_click_time = mouse_double_click_time
    end

    def mouse_double_click_max_dist : Float32
      @this.mouse_double_click_max_dist
    end

    def mouse_double_click_max_dist=(mouse_double_click_max_dist : Float32)
      @this.mouse_double_click_max_dist = mouse_double_click_max_dist
    end

    def mouse_drag_threshold : Float32
      @this.mouse_drag_threshold
    end

    def mouse_drag_threshold=(mouse_drag_threshold : Float32)
      @this.mouse_drag_threshold = mouse_drag_threshold
    end

    def key_map : Int32[22]
      @this.key_map
    end

    def key_map=(key_map : Int32[22])
      @this.key_map = key_map
    end

    def key_repeat_delay : Float32
      @this.key_repeat_delay
    end

    def key_repeat_delay=(key_repeat_delay : Float32)
      @this.key_repeat_delay = key_repeat_delay
    end

    def key_repeat_rate : Float32
      @this.key_repeat_rate
    end

    def key_repeat_rate=(key_repeat_rate : Float32)
      @this.key_repeat_rate = key_repeat_rate
    end

    def user_data : Void*
      @this.user_data
    end

    def user_data=(user_data : Void*)
      @this.user_data = user_data
    end

    def fonts : ImFontAtlas
      ImFontAtlas.new(@this.fonts)
    end

    def fonts=(fonts : ImFontAtlas)
      @this.fonts = fonts
    end

    def font_global_scale : Float32
      @this.font_global_scale
    end

    def font_global_scale=(font_global_scale : Float32)
      @this.font_global_scale = font_global_scale
    end

    def font_allow_user_scaling : Bool
      @this.font_allow_user_scaling
    end

    def font_allow_user_scaling=(font_allow_user_scaling : Bool)
      @this.font_allow_user_scaling = font_allow_user_scaling
    end

    def font_default : ImFont*
      @this.font_default.value
    end

    def font_default=(font_default : ImFont*)
      @this.font_default = font_default
    end

    def display_framebuffer_scale : ImVec2
      @this.display_framebuffer_scale.value
    end

    def display_framebuffer_scale=(display_framebuffer_scale : ImVec2)
      @this.display_framebuffer_scale = display_framebuffer_scale
    end

    def mouse_draw_cursor : Bool
      @this.mouse_draw_cursor
    end

    def mouse_draw_cursor=(mouse_draw_cursor : Bool)
      @this.mouse_draw_cursor = mouse_draw_cursor
    end

    def config_mac_osx_behaviors : Bool
      @this.config_mac_osx_behaviors
    end

    def config_mac_osx_behaviors=(config_mac_osx_behaviors : Bool)
      @this.config_mac_osx_behaviors = config_mac_osx_behaviors
    end

    def config_input_text_cursor_blink : Bool
      @this.config_input_text_cursor_blink
    end

    def config_input_text_cursor_blink=(config_input_text_cursor_blink : Bool)
      @this.config_input_text_cursor_blink = config_input_text_cursor_blink
    end

    def config_windows_resize_from_edges : Bool
      @this.config_windows_resize_from_edges
    end

    def config_windows_resize_from_edges=(config_windows_resize_from_edges : Bool)
      @this.config_windows_resize_from_edges = config_windows_resize_from_edges
    end

    def config_windows_move_from_title_bar_only : Bool
      @this.config_windows_move_from_title_bar_only
    end

    def config_windows_move_from_title_bar_only=(config_windows_move_from_title_bar_only : Bool)
      @this.config_windows_move_from_title_bar_only = config_windows_move_from_title_bar_only
    end

    def config_windows_memory_compact_timer : Float32
      @this.config_windows_memory_compact_timer
    end

    def config_windows_memory_compact_timer=(config_windows_memory_compact_timer : Float32)
      @this.config_windows_memory_compact_timer = config_windows_memory_compact_timer
    end

    def backend_platform_name : String
      String.new(@this.backend_platform_name)
    end

    def backend_platform_name=(backend_platform_name : String)
      @this.backend_platform_name = backend_platform_name
    end

    def backend_renderer_name : String
      String.new(@this.backend_renderer_name)
    end

    def backend_renderer_name=(backend_renderer_name : String)
      @this.backend_renderer_name = backend_renderer_name
    end

    def backend_platform_user_data : Void*
      @this.backend_platform_user_data
    end

    def backend_platform_user_data=(backend_platform_user_data : Void*)
      @this.backend_platform_user_data = backend_platform_user_data
    end

    def backend_renderer_user_data : Void*
      @this.backend_renderer_user_data
    end

    def backend_renderer_user_data=(backend_renderer_user_data : Void*)
      @this.backend_renderer_user_data = backend_renderer_user_data
    end

    def backend_language_user_data : Void*
      @this.backend_language_user_data
    end

    def backend_language_user_data=(backend_language_user_data : Void*)
      @this.backend_language_user_data = backend_language_user_data
    end

    def get_clipboard_text_fn : (Void*) -> String
      @this.get_clipboard_text_fn
    end

    def get_clipboard_text_fn=(get_clipboard_text_fn : (Void*) -> String)
      @this.get_clipboard_text_fn = get_clipboard_text_fn
    end

    def set_clipboard_text_fn : (Void*, String) -> Void
      @this.set_clipboard_text_fn
    end

    def set_clipboard_text_fn=(set_clipboard_text_fn : (Void*, String) -> Void)
      @this.set_clipboard_text_fn = set_clipboard_text_fn
    end

    def clipboard_user_data : Void*
      @this.clipboard_user_data
    end

    def clipboard_user_data=(clipboard_user_data : Void*)
      @this.clipboard_user_data = clipboard_user_data
    end

    def ime_set_input_screen_pos_fn : (Int32, Int32) -> Void
      @this.ime_set_input_screen_pos_fn
    end

    def ime_set_input_screen_pos_fn=(ime_set_input_screen_pos_fn : (Int32, Int32) -> Void)
      @this.ime_set_input_screen_pos_fn = ime_set_input_screen_pos_fn
    end

    def ime_window_handle : Void*
      @this.ime_window_handle
    end

    def ime_window_handle=(ime_window_handle : Void*)
      @this.ime_window_handle = ime_window_handle
    end

    def render_draw_lists_fn_unused : Void*
      @this.render_draw_lists_fn_unused
    end

    def render_draw_lists_fn_unused=(render_draw_lists_fn_unused : Void*)
      @this.render_draw_lists_fn_unused = render_draw_lists_fn_unused
    end

    def mouse_pos : ImVec2
      @this.mouse_pos.value
    end

    def mouse_pos=(mouse_pos : ImVec2)
      @this.mouse_pos = mouse_pos
    end

    def mouse_down : Bool[5]
      @this.mouse_down
    end

    def mouse_down=(mouse_down : Bool[5])
      @this.mouse_down = mouse_down
    end

    def mouse_wheel : Float32
      @this.mouse_wheel
    end

    def mouse_wheel=(mouse_wheel : Float32)
      @this.mouse_wheel = mouse_wheel
    end

    def mouse_wheel_h : Float32
      @this.mouse_wheel_h
    end

    def mouse_wheel_h=(mouse_wheel_h : Float32)
      @this.mouse_wheel_h = mouse_wheel_h
    end

    def key_ctrl : Bool
      @this.key_ctrl
    end

    def key_ctrl=(key_ctrl : Bool)
      @this.key_ctrl = key_ctrl
    end

    def key_shift : Bool
      @this.key_shift
    end

    def key_shift=(key_shift : Bool)
      @this.key_shift = key_shift
    end

    def key_alt : Bool
      @this.key_alt
    end

    def key_alt=(key_alt : Bool)
      @this.key_alt = key_alt
    end

    def key_super : Bool
      @this.key_super
    end

    def key_super=(key_super : Bool)
      @this.key_super = key_super
    end

    def keys_down : Bool[512]
      @this.keys_down
    end

    def keys_down=(keys_down : Bool[512])
      @this.keys_down = keys_down
    end

    def nav_inputs : Float32[21]
      @this.nav_inputs
    end

    def nav_inputs=(nav_inputs : Float32[21])
      @this.nav_inputs = nav_inputs
    end

    def want_capture_mouse : Bool
      @this.want_capture_mouse
    end

    def want_capture_mouse=(want_capture_mouse : Bool)
      @this.want_capture_mouse = want_capture_mouse
    end

    def want_capture_keyboard : Bool
      @this.want_capture_keyboard
    end

    def want_capture_keyboard=(want_capture_keyboard : Bool)
      @this.want_capture_keyboard = want_capture_keyboard
    end

    def want_text_input : Bool
      @this.want_text_input
    end

    def want_text_input=(want_text_input : Bool)
      @this.want_text_input = want_text_input
    end

    def want_set_mouse_pos : Bool
      @this.want_set_mouse_pos
    end

    def want_set_mouse_pos=(want_set_mouse_pos : Bool)
      @this.want_set_mouse_pos = want_set_mouse_pos
    end

    def want_save_ini_settings : Bool
      @this.want_save_ini_settings
    end

    def want_save_ini_settings=(want_save_ini_settings : Bool)
      @this.want_save_ini_settings = want_save_ini_settings
    end

    def nav_active : Bool
      @this.nav_active
    end

    def nav_active=(nav_active : Bool)
      @this.nav_active = nav_active
    end

    def nav_visible : Bool
      @this.nav_visible
    end

    def nav_visible=(nav_visible : Bool)
      @this.nav_visible = nav_visible
    end

    def framerate : Float32
      @this.framerate
    end

    def framerate=(framerate : Float32)
      @this.framerate = framerate
    end

    def metrics_render_vertices : Int32
      @this.metrics_render_vertices
    end

    def metrics_render_vertices=(metrics_render_vertices : Int32)
      @this.metrics_render_vertices = metrics_render_vertices
    end

    def metrics_render_indices : Int32
      @this.metrics_render_indices
    end

    def metrics_render_indices=(metrics_render_indices : Int32)
      @this.metrics_render_indices = metrics_render_indices
    end

    def metrics_render_windows : Int32
      @this.metrics_render_windows
    end

    def metrics_render_windows=(metrics_render_windows : Int32)
      @this.metrics_render_windows = metrics_render_windows
    end

    def metrics_active_windows : Int32
      @this.metrics_active_windows
    end

    def metrics_active_windows=(metrics_active_windows : Int32)
      @this.metrics_active_windows = metrics_active_windows
    end

    def metrics_active_allocations : Int32
      @this.metrics_active_allocations
    end

    def metrics_active_allocations=(metrics_active_allocations : Int32)
      @this.metrics_active_allocations = metrics_active_allocations
    end

    def mouse_delta : ImVec2
      @this.mouse_delta.value
    end

    def mouse_delta=(mouse_delta : ImVec2)
      @this.mouse_delta = mouse_delta
    end

    def key_mods : ImGuiKeyModFlags
      @this.key_mods
    end

    def key_mods=(key_mods : ImGuiKeyModFlags)
      @this.key_mods = key_mods
    end

    def mouse_pos_prev : ImVec2
      @this.mouse_pos_prev.value
    end

    def mouse_pos_prev=(mouse_pos_prev : ImVec2)
      @this.mouse_pos_prev = mouse_pos_prev
    end

    def mouse_clicked_pos : ImVec2[5]
      @this.mouse_clicked_pos.value
    end

    def mouse_clicked_pos=(mouse_clicked_pos : ImVec2[5])
      @this.mouse_clicked_pos = mouse_clicked_pos
    end

    def mouse_clicked_time : Float64[5]
      @this.mouse_clicked_time
    end

    def mouse_clicked_time=(mouse_clicked_time : Float64[5])
      @this.mouse_clicked_time = mouse_clicked_time
    end

    def mouse_clicked : Bool[5]
      @this.mouse_clicked
    end

    def mouse_clicked=(mouse_clicked : Bool[5])
      @this.mouse_clicked = mouse_clicked
    end

    def mouse_double_clicked : Bool[5]
      @this.mouse_double_clicked
    end

    def mouse_double_clicked=(mouse_double_clicked : Bool[5])
      @this.mouse_double_clicked = mouse_double_clicked
    end

    def mouse_released : Bool[5]
      @this.mouse_released
    end

    def mouse_released=(mouse_released : Bool[5])
      @this.mouse_released = mouse_released
    end

    def mouse_down_owned : Bool[5]
      @this.mouse_down_owned
    end

    def mouse_down_owned=(mouse_down_owned : Bool[5])
      @this.mouse_down_owned = mouse_down_owned
    end

    def mouse_down_was_double_click : Bool[5]
      @this.mouse_down_was_double_click
    end

    def mouse_down_was_double_click=(mouse_down_was_double_click : Bool[5])
      @this.mouse_down_was_double_click = mouse_down_was_double_click
    end

    def mouse_down_duration : Float32[5]
      @this.mouse_down_duration
    end

    def mouse_down_duration=(mouse_down_duration : Float32[5])
      @this.mouse_down_duration = mouse_down_duration
    end

    def mouse_down_duration_prev : Float32[5]
      @this.mouse_down_duration_prev
    end

    def mouse_down_duration_prev=(mouse_down_duration_prev : Float32[5])
      @this.mouse_down_duration_prev = mouse_down_duration_prev
    end

    def mouse_drag_max_distance_abs : ImVec2[5]
      @this.mouse_drag_max_distance_abs.value
    end

    def mouse_drag_max_distance_abs=(mouse_drag_max_distance_abs : ImVec2[5])
      @this.mouse_drag_max_distance_abs = mouse_drag_max_distance_abs
    end

    def mouse_drag_max_distance_sqr : Float32[5]
      @this.mouse_drag_max_distance_sqr
    end

    def mouse_drag_max_distance_sqr=(mouse_drag_max_distance_sqr : Float32[5])
      @this.mouse_drag_max_distance_sqr = mouse_drag_max_distance_sqr
    end

    def keys_down_duration : Float32[512]
      @this.keys_down_duration
    end

    def keys_down_duration=(keys_down_duration : Float32[512])
      @this.keys_down_duration = keys_down_duration
    end

    def keys_down_duration_prev : Float32[512]
      @this.keys_down_duration_prev
    end

    def keys_down_duration_prev=(keys_down_duration_prev : Float32[512])
      @this.keys_down_duration_prev = keys_down_duration_prev
    end

    def nav_inputs_down_duration : Float32[21]
      @this.nav_inputs_down_duration
    end

    def nav_inputs_down_duration=(nav_inputs_down_duration : Float32[21])
      @this.nav_inputs_down_duration = nav_inputs_down_duration
    end

    def nav_inputs_down_duration_prev : Float32[21]
      @this.nav_inputs_down_duration_prev
    end

    def nav_inputs_down_duration_prev=(nav_inputs_down_duration_prev : Float32[21])
      @this.nav_inputs_down_duration_prev = nav_inputs_down_duration_prev
    end

    def pen_pressure : Float32
      @this.pen_pressure
    end

    def pen_pressure=(pen_pressure : Float32)
      @this.pen_pressure = pen_pressure
    end

    def input_queue_surrogate : ImWchar16
      @this.input_queue_surrogate
    end

    def input_queue_surrogate=(input_queue_surrogate : ImWchar16)
      @this.input_queue_surrogate = input_queue_surrogate
    end

    def input_queue_characters : LibImGui::ImVector(ImWchar)
      @this.input_queue_characters.value
    end

    def input_queue_characters=(input_queue_characters : LibImGui::ImVector(ImWchar))
      @this.input_queue_characters = input_queue_characters
    end

    def add_input_character(c : UInt32) : Void
      LibImGui.ImGuiIO_AddInputCharacter(self, c)
    end

    def add_input_character_utf16(c : ImWchar16) : Void
      LibImGui.ImGuiIO_AddInputCharacterUTF16(self, c)
    end

    def add_input_characters_utf8(str : String) : Void
      LibImGui.ImGuiIO_AddInputCharactersUTF8(self, str)
    end

    def clear_input_characters : Void
      LibImGui.ImGuiIO_ClearInputCharacters(self)
    end

    def self.new : ImGuiIO
      result = LibImGui.ImGuiIO_ImGuiIO
      ImGuiIO.new(result)
    end
  end

  class ImGuiInputTextCallbackData
    include ClassType(LibImGui::ImGuiInputTextCallbackData)

    def event_flag : ImGuiInputTextFlags
      @this.event_flag
    end

    def event_flag=(event_flag : ImGuiInputTextFlags)
      @this.event_flag = event_flag
    end

    def flags : ImGuiInputTextFlags
      @this.flags
    end

    def flags=(flags : ImGuiInputTextFlags)
      @this.flags = flags
    end

    def user_data : Void*
      @this.user_data
    end

    def user_data=(user_data : Void*)
      @this.user_data = user_data
    end

    def event_char : ImWchar
      @this.event_char
    end

    def event_char=(event_char : ImWchar)
      @this.event_char = event_char
    end

    def event_key : ImGuiKey
      @this.event_key
    end

    def event_key=(event_key : ImGuiKey)
      @this.event_key = event_key
    end

    def buf : LibC::Char*
      @this.buf
    end

    def buf=(buf : LibC::Char*)
      @this.buf = buf
    end

    def buf_text_len : Int32
      @this.buf_text_len
    end

    def buf_text_len=(buf_text_len : Int32)
      @this.buf_text_len = buf_text_len
    end

    def buf_size : Int32
      @this.buf_size
    end

    def buf_size=(buf_size : Int32)
      @this.buf_size = buf_size
    end

    def buf_dirty : Bool
      @this.buf_dirty
    end

    def buf_dirty=(buf_dirty : Bool)
      @this.buf_dirty = buf_dirty
    end

    def cursor_pos : Int32
      @this.cursor_pos
    end

    def cursor_pos=(cursor_pos : Int32)
      @this.cursor_pos = cursor_pos
    end

    def selection_start : Int32
      @this.selection_start
    end

    def selection_start=(selection_start : Int32)
      @this.selection_start = selection_start
    end

    def selection_end : Int32
      @this.selection_end
    end

    def selection_end=(selection_end : Int32)
      @this.selection_end = selection_end
    end

    def delete_chars(pos : Int32, bytes_count : Int32) : Void
      LibImGui.ImGuiInputTextCallbackData_DeleteChars(self, pos, bytes_count)
    end

    def has_selection : Bool
      LibImGui.ImGuiInputTextCallbackData_HasSelection(self)
    end

    def self.new : ImGuiInputTextCallbackData
      result = LibImGui.ImGuiInputTextCallbackData_ImGuiInputTextCallbackData
      ImGuiInputTextCallbackData.new(result)
    end

    def insert_chars(pos : Int32, text : String, text_end : String? = nil) : Void
      LibImGui.ImGuiInputTextCallbackData_InsertChars(self, pos, text, text_end)
    end
  end

  class ImGuiListClipper
    include ClassType(LibImGui::ImGuiListClipper)

    def display_start : Int32
      @this.display_start
    end

    def display_start=(display_start : Int32)
      @this.display_start = display_start
    end

    def display_end : Int32
      @this.display_end
    end

    def display_end=(display_end : Int32)
      @this.display_end = display_end
    end

    def items_count : Int32
      @this.items_count
    end

    def items_count=(items_count : Int32)
      @this.items_count = items_count
    end

    def step_no : Int32
      @this.step_no
    end

    def step_no=(step_no : Int32)
      @this.step_no = step_no
    end

    def items_height : Float32
      @this.items_height
    end

    def items_height=(items_height : Float32)
      @this.items_height = items_height
    end

    def start_pos_y : Float32
      @this.start_pos_y
    end

    def start_pos_y=(start_pos_y : Float32)
      @this.start_pos_y = start_pos_y
    end

    def begin(items_count : Int32, items_height : Float32 = -1.0) : Void
      LibImGui.ImGuiListClipper_Begin(self, items_count, items_height)
    end

    def end : Void
      LibImGui.ImGuiListClipper_End(self)
    end

    def self.new(items_count : Int32 = -1, items_height : Float32 = -1.0) : ImGuiListClipper
      result = LibImGui.ImGuiListClipper_ImGuiListClipper(items_count, items_height)
      ImGuiListClipper.new(result)
    end

    def step : Bool
      LibImGui.ImGuiListClipper_Step(self)
    end
  end

  class ImGuiOnceUponAFrame
    include ClassType(LibImGui::ImGuiOnceUponAFrame)

    def ref_frame : Int32
      @this.ref_frame
    end

    def ref_frame=(ref_frame : Int32)
      @this.ref_frame = ref_frame
    end

    def self.new : ImGuiOnceUponAFrame
      result = LibImGui.ImGuiOnceUponAFrame_ImGuiOnceUponAFrame
      ImGuiOnceUponAFrame.new(result)
    end
  end

  class ImGuiPayload
    include ClassType(LibImGui::ImGuiPayload)

    def data : Void*
      @this.data
    end

    def data=(data : Void*)
      @this.data = data
    end

    def data_size : Int32
      @this.data_size
    end

    def data_size=(data_size : Int32)
      @this.data_size = data_size
    end

    def source_id : ImGuiID
      @this.source_id
    end

    def source_id=(source_id : ImGuiID)
      @this.source_id = source_id
    end

    def source_parent_id : ImGuiID
      @this.source_parent_id
    end

    def source_parent_id=(source_parent_id : ImGuiID)
      @this.source_parent_id = source_parent_id
    end

    def data_frame_count : Int32
      @this.data_frame_count
    end

    def data_frame_count=(data_frame_count : Int32)
      @this.data_frame_count = data_frame_count
    end

    def data_type : LibC::Char[33]
      @this.data_type
    end

    def data_type=(data_type : LibC::Char[33])
      @this.data_type = data_type
    end

    def preview : Bool
      @this.preview
    end

    def preview=(preview : Bool)
      @this.preview = preview
    end

    def delivery : Bool
      @this.delivery
    end

    def delivery=(delivery : Bool)
      @this.delivery = delivery
    end

    def clear : Void
      LibImGui.ImGuiPayload_Clear(self)
    end

    def self.new : ImGuiPayload
      result = LibImGui.ImGuiPayload_ImGuiPayload
      ImGuiPayload.new(result)
    end

    def is_data_type(type : String) : Bool
      LibImGui.ImGuiPayload_IsDataType(self, type)
    end

    def is_delivery : Bool
      LibImGui.ImGuiPayload_IsDelivery(self)
    end

    def is_preview : Bool
      LibImGui.ImGuiPayload_IsPreview(self)
    end
  end

  class ImGuiSizeCallbackData
    include ClassType(LibImGui::ImGuiSizeCallbackData)

    def user_data : Void*
      @this.user_data
    end

    def user_data=(user_data : Void*)
      @this.user_data = user_data
    end

    def pos : ImVec2
      @this.pos.value
    end

    def pos=(pos : ImVec2)
      @this.pos = pos
    end

    def current_size : ImVec2
      @this.current_size.value
    end

    def current_size=(current_size : ImVec2)
      @this.current_size = current_size
    end

    def desired_size : ImVec2
      @this.desired_size.value
    end

    def desired_size=(desired_size : ImVec2)
      @this.desired_size = desired_size
    end
  end

  class ImGuiStorage
    include ClassType(LibImGui::ImGuiStorage)

    def data : LibImGui::ImVector(LibImGui::ImGuiStoragePair)
      @this.data.value
    end

    def data=(data : LibImGui::ImVector(LibImGui::ImGuiStoragePair))
      @this.data = data
    end

    def build_sort_by_key : Void
      LibImGui.ImGuiStorage_BuildSortByKey(self)
    end

    def clear : Void
      LibImGui.ImGuiStorage_Clear(self)
    end

    def get_bool(key : ImGuiID, default_val : Bool = false) : Bool
      LibImGui.ImGuiStorage_GetBool(self, key, default_val)
    end

    def get_bool_ref(key : ImGuiID, default_val : Bool = false) : Bool
      LibImGui.ImGuiStorage_GetBoolRef(self, key, default_val)
    end

    def get_float(key : ImGuiID, default_val : Float32 = 0.0) : Float32
      LibImGui.ImGuiStorage_GetFloat(self, key, default_val)
    end

    def get_float_ref(key : ImGuiID, default_val : Float32 = 0.0) : Float32
      LibImGui.ImGuiStorage_GetFloatRef(self, key, default_val)
    end

    def get_int(key : ImGuiID, default_val : Int32 = 0) : Int32
      LibImGui.ImGuiStorage_GetInt(self, key, default_val)
    end

    def get_int_ref(key : ImGuiID, default_val : Int32 = 0) : Int32
      LibImGui.ImGuiStorage_GetIntRef(self, key, default_val)
    end

    def get_void_ptr(key : ImGuiID) : Void
      LibImGui.ImGuiStorage_GetVoidPtr(self, key)
    end

    def get_void_ptr_ref(key : ImGuiID, default_val : Void*? = nil) : Void*
      LibImGui.ImGuiStorage_GetVoidPtrRef(self, key, default_val)
    end

    def set_all_int(val : Int32) : Void
      LibImGui.ImGuiStorage_SetAllInt(self, val)
    end

    def set_bool(key : ImGuiID, val : Bool) : Void
      LibImGui.ImGuiStorage_SetBool(self, key, val)
    end

    def set_float(key : ImGuiID, val : Float32) : Void
      LibImGui.ImGuiStorage_SetFloat(self, key, val)
    end

    def set_int(key : ImGuiID, val : Int32) : Void
      LibImGui.ImGuiStorage_SetInt(self, key, val)
    end

    def set_void_ptr(key : ImGuiID, val : Void*) : Void
      LibImGui.ImGuiStorage_SetVoidPtr(self, key, val)
    end
  end

  class ImGuiStyle
    include ClassType(LibImGui::ImGuiStyle)

    def alpha : Float32
      @this.alpha
    end

    def alpha=(alpha : Float32)
      @this.alpha = alpha
    end

    def window_padding : ImVec2
      @this.window_padding.value
    end

    def window_padding=(window_padding : ImVec2)
      @this.window_padding = window_padding
    end

    def window_rounding : Float32
      @this.window_rounding
    end

    def window_rounding=(window_rounding : Float32)
      @this.window_rounding = window_rounding
    end

    def window_border_size : Float32
      @this.window_border_size
    end

    def window_border_size=(window_border_size : Float32)
      @this.window_border_size = window_border_size
    end

    def window_min_size : ImVec2
      @this.window_min_size.value
    end

    def window_min_size=(window_min_size : ImVec2)
      @this.window_min_size = window_min_size
    end

    def window_title_align : ImVec2
      @this.window_title_align.value
    end

    def window_title_align=(window_title_align : ImVec2)
      @this.window_title_align = window_title_align
    end

    def window_menu_button_position : ImGuiDir
      @this.window_menu_button_position
    end

    def window_menu_button_position=(window_menu_button_position : ImGuiDir)
      @this.window_menu_button_position = window_menu_button_position
    end

    def child_rounding : Float32
      @this.child_rounding
    end

    def child_rounding=(child_rounding : Float32)
      @this.child_rounding = child_rounding
    end

    def child_border_size : Float32
      @this.child_border_size
    end

    def child_border_size=(child_border_size : Float32)
      @this.child_border_size = child_border_size
    end

    def popup_rounding : Float32
      @this.popup_rounding
    end

    def popup_rounding=(popup_rounding : Float32)
      @this.popup_rounding = popup_rounding
    end

    def popup_border_size : Float32
      @this.popup_border_size
    end

    def popup_border_size=(popup_border_size : Float32)
      @this.popup_border_size = popup_border_size
    end

    def frame_padding : ImVec2
      @this.frame_padding.value
    end

    def frame_padding=(frame_padding : ImVec2)
      @this.frame_padding = frame_padding
    end

    def frame_rounding : Float32
      @this.frame_rounding
    end

    def frame_rounding=(frame_rounding : Float32)
      @this.frame_rounding = frame_rounding
    end

    def frame_border_size : Float32
      @this.frame_border_size
    end

    def frame_border_size=(frame_border_size : Float32)
      @this.frame_border_size = frame_border_size
    end

    def item_spacing : ImVec2
      @this.item_spacing.value
    end

    def item_spacing=(item_spacing : ImVec2)
      @this.item_spacing = item_spacing
    end

    def item_inner_spacing : ImVec2
      @this.item_inner_spacing.value
    end

    def item_inner_spacing=(item_inner_spacing : ImVec2)
      @this.item_inner_spacing = item_inner_spacing
    end

    def touch_extra_padding : ImVec2
      @this.touch_extra_padding.value
    end

    def touch_extra_padding=(touch_extra_padding : ImVec2)
      @this.touch_extra_padding = touch_extra_padding
    end

    def indent_spacing : Float32
      @this.indent_spacing
    end

    def indent_spacing=(indent_spacing : Float32)
      @this.indent_spacing = indent_spacing
    end

    def columns_min_spacing : Float32
      @this.columns_min_spacing
    end

    def columns_min_spacing=(columns_min_spacing : Float32)
      @this.columns_min_spacing = columns_min_spacing
    end

    def scrollbar_size : Float32
      @this.scrollbar_size
    end

    def scrollbar_size=(scrollbar_size : Float32)
      @this.scrollbar_size = scrollbar_size
    end

    def scrollbar_rounding : Float32
      @this.scrollbar_rounding
    end

    def scrollbar_rounding=(scrollbar_rounding : Float32)
      @this.scrollbar_rounding = scrollbar_rounding
    end

    def grab_min_size : Float32
      @this.grab_min_size
    end

    def grab_min_size=(grab_min_size : Float32)
      @this.grab_min_size = grab_min_size
    end

    def grab_rounding : Float32
      @this.grab_rounding
    end

    def grab_rounding=(grab_rounding : Float32)
      @this.grab_rounding = grab_rounding
    end

    def tab_rounding : Float32
      @this.tab_rounding
    end

    def tab_rounding=(tab_rounding : Float32)
      @this.tab_rounding = tab_rounding
    end

    def tab_border_size : Float32
      @this.tab_border_size
    end

    def tab_border_size=(tab_border_size : Float32)
      @this.tab_border_size = tab_border_size
    end

    def tab_min_width_for_unselected_close_button : Float32
      @this.tab_min_width_for_unselected_close_button
    end

    def tab_min_width_for_unselected_close_button=(tab_min_width_for_unselected_close_button : Float32)
      @this.tab_min_width_for_unselected_close_button = tab_min_width_for_unselected_close_button
    end

    def color_button_position : ImGuiDir
      @this.color_button_position
    end

    def color_button_position=(color_button_position : ImGuiDir)
      @this.color_button_position = color_button_position
    end

    def button_text_align : ImVec2
      @this.button_text_align.value
    end

    def button_text_align=(button_text_align : ImVec2)
      @this.button_text_align = button_text_align
    end

    def selectable_text_align : ImVec2
      @this.selectable_text_align.value
    end

    def selectable_text_align=(selectable_text_align : ImVec2)
      @this.selectable_text_align = selectable_text_align
    end

    def display_window_padding : ImVec2
      @this.display_window_padding.value
    end

    def display_window_padding=(display_window_padding : ImVec2)
      @this.display_window_padding = display_window_padding
    end

    def display_safe_area_padding : ImVec2
      @this.display_safe_area_padding.value
    end

    def display_safe_area_padding=(display_safe_area_padding : ImVec2)
      @this.display_safe_area_padding = display_safe_area_padding
    end

    def mouse_cursor_scale : Float32
      @this.mouse_cursor_scale
    end

    def mouse_cursor_scale=(mouse_cursor_scale : Float32)
      @this.mouse_cursor_scale = mouse_cursor_scale
    end

    def anti_aliased_lines : Bool
      @this.anti_aliased_lines
    end

    def anti_aliased_lines=(anti_aliased_lines : Bool)
      @this.anti_aliased_lines = anti_aliased_lines
    end

    def anti_aliased_fill : Bool
      @this.anti_aliased_fill
    end

    def anti_aliased_fill=(anti_aliased_fill : Bool)
      @this.anti_aliased_fill = anti_aliased_fill
    end

    def curve_tessellation_tol : Float32
      @this.curve_tessellation_tol
    end

    def curve_tessellation_tol=(curve_tessellation_tol : Float32)
      @this.curve_tessellation_tol = curve_tessellation_tol
    end

    def circle_segment_max_error : Float32
      @this.circle_segment_max_error
    end

    def circle_segment_max_error=(circle_segment_max_error : Float32)
      @this.circle_segment_max_error = circle_segment_max_error
    end

    def colors : ImVec4[48]
      @this.colors.value
    end

    def colors=(colors : ImVec4[48])
      @this.colors = colors
    end

    def self.new : ImGuiStyle
      result = LibImGui.ImGuiStyle_ImGuiStyle
      ImGuiStyle.new(result)
    end

    def scale_all_sizes(scale_factor : Float32) : Void
      LibImGui.ImGuiStyle_ScaleAllSizes(self, scale_factor)
    end
  end

  class ImGuiTextBuffer
    include ClassType(LibImGui::ImGuiTextBuffer)

    def buf : LibImGui::ImVector(LibC::Char)
      @this.buf.value
    end

    def buf=(buf : LibImGui::ImVector(LibC::Char))
      @this.buf = buf
    end

    def self.new : ImGuiTextBuffer
      result = LibImGui.ImGuiTextBuffer_ImGuiTextBuffer
      ImGuiTextBuffer.new(result)
    end

    def append(str : String, str_end : String? = nil) : Void
      LibImGui.ImGuiTextBuffer_append(self, str, str_end)
    end

    def appendf(fmt : String, *args) : Void
      LibImGui.ImGuiTextBuffer_appendf(self, fmt, *args)
    end

    def begin : String
      result = LibImGui.ImGuiTextBuffer_begin(self)
      String.new(result)
    end

    def c_str : String
      result = LibImGui.ImGuiTextBuffer_c_str(self)
      String.new(result)
    end

    def clear : Void
      LibImGui.ImGuiTextBuffer_clear(self)
    end

    def empty : Bool
      LibImGui.ImGuiTextBuffer_empty(self)
    end

    def end : String
      result = LibImGui.ImGuiTextBuffer_end(self)
      String.new(result)
    end

    def reserve(capacity : Int32) : Void
      LibImGui.ImGuiTextBuffer_reserve(self, capacity)
    end

    def size : Int32
      LibImGui.ImGuiTextBuffer_size(self)
    end
  end

  class ImGuiTextFilter
    include ClassType(LibImGui::ImGuiTextFilter)

    def input_buf : LibC::Char[256]
      @this.input_buf
    end

    def input_buf=(input_buf : LibC::Char[256])
      @this.input_buf = input_buf
    end

    def filters : LibImGui::ImVector(LibImGui::ImGuiTextRange)
      @this.filters.value
    end

    def filters=(filters : LibImGui::ImVector(LibImGui::ImGuiTextRange))
      @this.filters = filters
    end

    def count_grep : Int32
      @this.count_grep
    end

    def count_grep=(count_grep : Int32)
      @this.count_grep = count_grep
    end

    def build : Void
      LibImGui.ImGuiTextFilter_Build(self)
    end

    def clear : Void
      LibImGui.ImGuiTextFilter_Clear(self)
    end

    def draw(label : String = "Filter(inc,-exc)", width : Float32 = 0.0) : Bool
      LibImGui.ImGuiTextFilter_Draw(self, label, width)
    end

    def self.new(default_filter : String = "") : ImGuiTextFilter
      result = LibImGui.ImGuiTextFilter_ImGuiTextFilter(default_filter)
      ImGuiTextFilter.new(result)
    end

    def is_active : Bool
      LibImGui.ImGuiTextFilter_IsActive(self)
    end

    def pass_filter(text : String, text_end : String? = nil) : Bool
      LibImGui.ImGuiTextFilter_PassFilter(self, text, text_end)
    end
  end

  struct ImVec2
    include StructType

    def self.new : ImVec2
      result = LibImGui.ImVec2_ImVec2Nil
      result.value
    end

    def self.new(_x : Float32, _y : Float32) : ImVec2
      result = LibImGui.ImVec2_ImVec2Float(_x, _y)
      result.value
    end
  end

  struct ImVec4
    include StructType

    def self.new : ImVec4
      result = LibImGui.ImVec4_ImVec4Nil
      result.value
    end

    def self.new(_x : Float32, _y : Float32, _z : Float32, _w : Float32) : ImVec4
      result = LibImGui.ImVec4_ImVec4Float(_x, _y, _z, _w)
      result.value
    end
  end

  struct ImVector
    include StructType
  end

  def self.accept_drag_drop_payload(type : String, flags : ImGuiDragDropFlags = 0) : ImGuiPayload
    result = LibImGui.igAcceptDragDropPayload(type, flags)
    ImGuiPayload.new(result)
  end

  def self.align_text_to_frame_padding : Void
    LibImGui.igAlignTextToFramePadding
  end

  def self.arrow_button(str_id : String, dir : ImGuiDir) : Bool
    LibImGui.igArrowButton(str_id, dir)
  end

  def self.begin(name : String, p_open : Bool*? = nil, flags : ImGuiWindowFlags = 0) : Bool
    LibImGui.igBegin(name, p_open, flags)
  end

  def self.begin_child(str_id : String, size : ImVec2 = ImVec2.new(0, 0), border : Bool = false, flags : ImGuiWindowFlags = 0) : Bool
    LibImGui.igBeginChildStr(str_id, size, border, flags)
  end

  def self.begin_child(id : ImGuiID, size : ImVec2 = ImVec2.new(0, 0), border : Bool = false, flags : ImGuiWindowFlags = 0) : Bool
    LibImGui.igBeginChildID(id, size, border, flags)
  end

  def self.begin_child_frame(id : ImGuiID, size : ImVec2, flags : ImGuiWindowFlags = 0) : Bool
    LibImGui.igBeginChildFrame(id, size, flags)
  end

  def self.begin_combo(label : String, preview_value : String, flags : ImGuiComboFlags = 0) : Bool
    LibImGui.igBeginCombo(label, preview_value, flags)
  end

  def self.begin_drag_drop_source(flags : ImGuiDragDropFlags = 0) : Bool
    LibImGui.igBeginDragDropSource(flags)
  end

  def self.begin_drag_drop_target : Bool
    LibImGui.igBeginDragDropTarget
  end

  def self.begin_group : Void
    LibImGui.igBeginGroup
  end

  def self.begin_main_menu_bar : Bool
    LibImGui.igBeginMainMenuBar
  end

  def self.begin_menu(label : String, enabled : Bool = true) : Bool
    LibImGui.igBeginMenu(label, enabled)
  end

  def self.begin_menu_bar : Bool
    LibImGui.igBeginMenuBar
  end

  def self.begin_popup(str_id : String, flags : ImGuiWindowFlags = 0) : Bool
    LibImGui.igBeginPopup(str_id, flags)
  end

  def self.begin_popup_context_item(str_id : String? = nil, popup_flags : ImGuiPopupFlags = 1) : Bool
    LibImGui.igBeginPopupContextItem(str_id, popup_flags)
  end

  def self.begin_popup_context_void(str_id : String? = nil, popup_flags : ImGuiPopupFlags = 1) : Bool
    LibImGui.igBeginPopupContextVoid(str_id, popup_flags)
  end

  def self.begin_popup_context_window(str_id : String? = nil, popup_flags : ImGuiPopupFlags = 1) : Bool
    LibImGui.igBeginPopupContextWindow(str_id, popup_flags)
  end

  def self.begin_popup_modal(name : String, p_open : Bool*? = nil, flags : ImGuiWindowFlags = 0) : Bool
    LibImGui.igBeginPopupModal(name, p_open, flags)
  end

  def self.begin_tab_bar(str_id : String, flags : ImGuiTabBarFlags = 0) : Bool
    LibImGui.igBeginTabBar(str_id, flags)
  end

  def self.begin_tab_item(label : String, p_open : Bool*? = nil, flags : ImGuiTabItemFlags = 0) : Bool
    LibImGui.igBeginTabItem(label, p_open, flags)
  end

  def self.begin_tooltip : Void
    LibImGui.igBeginTooltip
  end

  def self.bullet : Void
    LibImGui.igBullet
  end

  def self.bullet_text(fmt : String, *args) : Void
    LibImGui.igBulletText(fmt, *args)
  end

  def self.button(label : String, size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igButton(label, size)
  end

  def self.calc_item_width : Float32
    LibImGui.igCalcItemWidth
  end

  def self.calc_list_clipping(items_count : Int32, items_height : Float32) : {LibC::Int, LibC::Int}
    LibImGui.igCalcListClipping(items_count, items_height, out out_items_display_start, out out_items_display_end)
    {out_items_display_start, out_items_display_end}
  end

  def self.calc_text_size(text : String, text_end : String? = nil, hide_text_after_double_hash : Bool = false, wrap_width : Float32 = -1.0) : ImGui::ImVec2
    LibImGui.igCalcTextSize(out p_out, text, text_end, hide_text_after_double_hash, wrap_width)
    p_out
  end

  def self.capture_keyboard_from_app(want_capture_keyboard_value : Bool = true) : Void
    LibImGui.igCaptureKeyboardFromApp(want_capture_keyboard_value)
  end

  def self.capture_mouse_from_app(want_capture_mouse_value : Bool = true) : Void
    LibImGui.igCaptureMouseFromApp(want_capture_mouse_value)
  end

  def self.checkbox(label : String, v : Bool*) : Bool
    LibImGui.igCheckbox(label, v)
  end

  def self.checkbox_flags(label : String, flags : UInt32*, flags_value : UInt32) : Bool
    LibImGui.igCheckboxFlags(label, flags, flags_value)
  end

  def self.close_current_popup : Void
    LibImGui.igCloseCurrentPopup
  end

  def self.collapsing_header(label : String, flags : ImGuiTreeNodeFlags = 0) : Bool
    LibImGui.igCollapsingHeaderTreeNodeFlags(label, flags)
  end

  def self.collapsing_header(label : String, p_open : Bool*, flags : ImGuiTreeNodeFlags = 0) : Bool
    LibImGui.igCollapsingHeaderBoolPtr(label, p_open, flags)
  end

  def self.color_button(desc_id : String, col : ImVec4, flags : ImGuiColorEditFlags = 0, size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igColorButton(desc_id, col, flags, size)
  end

  def self.color_convert_float4_to_u32(in : ImVec4) : UInt32
    LibImGui.igColorConvertFloat4ToU32(in)
  end

  def self.color_convert_hs_vto_rgb(h : Float32, s : Float32, v : Float32) : {LibC::Float, LibC::Float, LibC::Float}
    LibImGui.igColorConvertHSVtoRGB(h, s, v, out out_r, out out_g, out out_b)
    {out_r, out_g, out_b}
  end

  def self.color_convert_rg_bto_hsv(r : Float32, g : Float32, b : Float32) : {LibC::Float, LibC::Float, LibC::Float}
    LibImGui.igColorConvertRGBtoHSV(r, g, b, out out_h, out out_s, out out_v)
    {out_h, out_s, out_v}
  end

  def self.color_convert_u32_to_float4(in : UInt32) : ImGui::ImVec4
    LibImGui.igColorConvertU32ToFloat4(out p_out, in)
    p_out
  end

  def self.color_edit3(label : String, col : Float32[3], flags : ImGuiColorEditFlags = 0) : Bool
    LibImGui.igColorEdit3(label, col, flags)
  end

  def self.color_edit4(label : String, col : Float32[4], flags : ImGuiColorEditFlags = 0) : Bool
    LibImGui.igColorEdit4(label, col, flags)
  end

  def self.color_picker3(label : String, col : Float32[3], flags : ImGuiColorEditFlags = 0) : Bool
    LibImGui.igColorPicker3(label, col, flags)
  end

  def self.color_picker4(label : String, col : Float32[4], flags : ImGuiColorEditFlags = 0, ref_col : Float32*? = nil) : Bool
    LibImGui.igColorPicker4(label, col, flags, ref_col)
  end

  def self.columns(count : Int32 = 1, id : String? = nil, border : Bool = true) : Void
    LibImGui.igColumns(count, id, border)
  end

  def self.combo(label : String, current_item : Int32*, items : LibC::Char**, items_count : Int32, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.igComboStr_arr(label, current_item, items, items_count, popup_max_height_in_items)
  end

  def self.combo(label : String, current_item : Int32*, items_separated_by_zeros : String, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.igComboStr(label, current_item, items_separated_by_zeros, popup_max_height_in_items)
  end

  def self.combo(label : String, current_item : Int32*, items_getter : (Void*, Int32, LibC::Char**) -> Bool, data : Void*, items_count : Int32, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.igComboFnBoolPtr(label, current_item, items_getter, data, items_count, popup_max_height_in_items)
  end

  def self.create_context(shared_font_atlas : ImFontAtlas? = nil) : ImGuiContext
    result = LibImGui.igCreateContext(shared_font_atlas)
    ImGuiContext.new(result)
  end

  def self.debug_check_version_and_data_layout(version_str : String, sz_io : LibC::SizeT, sz_style : LibC::SizeT, sz_vec2 : LibC::SizeT, sz_vec4 : LibC::SizeT, sz_drawvert : LibC::SizeT, sz_drawidx : LibC::SizeT) : Bool
    LibImGui.igDebugCheckVersionAndDataLayout(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx)
  end

  def self.destroy_context(ctx : ImGuiContext? = nil) : Void
    LibImGui.igDestroyContext(ctx)
  end

  def self.drag_float(label : String, v : Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3", power : Float32 = 1.0) : Bool
    LibImGui.igDragFloat(label, v, v_speed, v_min, v_max, format, power)
  end

  def self.drag_float2(label : String, v : Float32[2], v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3", power : Float32 = 1.0) : Bool
    LibImGui.igDragFloat2(label, v, v_speed, v_min, v_max, format, power)
  end

  def self.drag_float3(label : String, v : Float32[3], v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3", power : Float32 = 1.0) : Bool
    LibImGui.igDragFloat3(label, v, v_speed, v_min, v_max, format, power)
  end

  def self.drag_float4(label : String, v : Float32[4], v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3", power : Float32 = 1.0) : Bool
    LibImGui.igDragFloat4(label, v, v_speed, v_min, v_max, format, power)
  end

  def self.drag_float_range2(label : String, v_current_min : Float32*, v_current_max : Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3", format_max : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, power)
  end

  def self.drag_int(label : String, v : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d") : Bool
    LibImGui.igDragInt(label, v, v_speed, v_min, v_max, format)
  end

  def self.drag_int2(label : String, v : Int32[2], v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d") : Bool
    LibImGui.igDragInt2(label, v, v_speed, v_min, v_max, format)
  end

  def self.drag_int3(label : String, v : Int32[3], v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d") : Bool
    LibImGui.igDragInt3(label, v, v_speed, v_min, v_max, format)
  end

  def self.drag_int4(label : String, v : Int32[4], v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d") : Bool
    LibImGui.igDragInt4(label, v, v_speed, v_min, v_max, format)
  end

  def self.drag_int_range2(label : String, v_current_min : Int32*, v_current_max : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", format_max : String? = nil) : Bool
    LibImGui.igDragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max)
  end

  def self.drag_scalar(label : String, data_type : ImGuiDataType, p_data : Void*, v_speed : Float32, p_min : Void*? = nil, p_max : Void*? = nil, format : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igDragScalar(label, data_type, p_data, v_speed, p_min, p_max, format, power)
  end

  def self.drag_scalar_n(label : String, data_type : ImGuiDataType, p_data : Void*, components : Int32, v_speed : Float32, p_min : Void*? = nil, p_max : Void*? = nil, format : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igDragScalarN(label, data_type, p_data, components, v_speed, p_min, p_max, format, power)
  end

  def self.dummy(size : ImVec2) : Void
    LibImGui.igDummy(size)
  end

  def self.end : Void
    LibImGui.igEnd
  end

  def self.end_child : Void
    LibImGui.igEndChild
  end

  def self.end_child_frame : Void
    LibImGui.igEndChildFrame
  end

  def self.end_combo : Void
    LibImGui.igEndCombo
  end

  def self.end_drag_drop_source : Void
    LibImGui.igEndDragDropSource
  end

  def self.end_drag_drop_target : Void
    LibImGui.igEndDragDropTarget
  end

  def self.end_frame : Void
    LibImGui.igEndFrame
  end

  def self.end_group : Void
    LibImGui.igEndGroup
  end

  def self.end_main_menu_bar : Void
    LibImGui.igEndMainMenuBar
  end

  def self.end_menu : Void
    LibImGui.igEndMenu
  end

  def self.end_menu_bar : Void
    LibImGui.igEndMenuBar
  end

  def self.end_popup : Void
    LibImGui.igEndPopup
  end

  def self.end_tab_bar : Void
    LibImGui.igEndTabBar
  end

  def self.end_tab_item : Void
    LibImGui.igEndTabItem
  end

  def self.end_tooltip : Void
    LibImGui.igEndTooltip
  end

  def self.get_background_draw_list : ImDrawList
    result = LibImGui.igGetBackgroundDrawList
    ImDrawList.new(result)
  end

  def self.get_clipboard_text : String
    result = LibImGui.igGetClipboardText
    String.new(result)
  end

  def self.get_color_u32(idx : ImGuiCol, alpha_mul : Float32 = 1.0) : UInt32
    LibImGui.igGetColorU32Col(idx, alpha_mul)
  end

  def self.get_color_u32(col : ImVec4) : UInt32
    LibImGui.igGetColorU32Vec4(col)
  end

  def self.get_color_u32(col : UInt32) : UInt32
    LibImGui.igGetColorU32U32(col)
  end

  def self.get_column_index : Int32
    LibImGui.igGetColumnIndex
  end

  def self.get_column_offset(column_index : Int32 = -1) : Float32
    LibImGui.igGetColumnOffset(column_index)
  end

  def self.get_column_width(column_index : Int32 = -1) : Float32
    LibImGui.igGetColumnWidth(column_index)
  end

  def self.get_columns_count : Int32
    LibImGui.igGetColumnsCount
  end

  def self.get_content_region_avail : ImGui::ImVec2
    LibImGui.igGetContentRegionAvail(out p_out)
    p_out
  end

  def self.get_content_region_max : ImGui::ImVec2
    LibImGui.igGetContentRegionMax(out p_out)
    p_out
  end

  def self.get_current_context : ImGuiContext
    result = LibImGui.igGetCurrentContext
    ImGuiContext.new(result)
  end

  def self.get_cursor_pos : ImGui::ImVec2
    LibImGui.igGetCursorPos(out p_out)
    p_out
  end

  def self.get_cursor_pos_x : Float32
    LibImGui.igGetCursorPosX
  end

  def self.get_cursor_pos_y : Float32
    LibImGui.igGetCursorPosY
  end

  def self.get_cursor_screen_pos : ImGui::ImVec2
    LibImGui.igGetCursorScreenPos(out p_out)
    p_out
  end

  def self.get_cursor_start_pos : ImGui::ImVec2
    LibImGui.igGetCursorStartPos(out p_out)
    p_out
  end

  def self.get_drag_drop_payload : ImGuiPayload
    result = LibImGui.igGetDragDropPayload
    ImGuiPayload.new(result)
  end

  def self.get_draw_data : ImDrawData
    result = LibImGui.igGetDrawData
    ImDrawData.new(result)
  end

  def self.get_draw_list_shared_data : ImDrawListSharedData
    result = LibImGui.igGetDrawListSharedData
    ImDrawListSharedData.new(result)
  end

  def self.get_font : ImFont
    result = LibImGui.igGetFont
    result.value
  end

  def self.get_font_size : Float32
    LibImGui.igGetFontSize
  end

  def self.get_font_tex_uv_white_pixel : ImGui::ImVec2
    LibImGui.igGetFontTexUvWhitePixel(out p_out)
    p_out
  end

  def self.get_foreground_draw_list : ImDrawList
    result = LibImGui.igGetForegroundDrawListNil
    ImDrawList.new(result)
  end

  def self.get_frame_count : Int32
    LibImGui.igGetFrameCount
  end

  def self.get_frame_height : Float32
    LibImGui.igGetFrameHeight
  end

  def self.get_frame_height_with_spacing : Float32
    LibImGui.igGetFrameHeightWithSpacing
  end

  def self.get_id(str_id : String) : ImGuiID
    LibImGui.igGetIDStr(str_id)
  end

  def self.get_id(str_id_begin : String, str_id_end : String) : ImGuiID
    LibImGui.igGetIDStrStr(str_id_begin, str_id_end)
  end

  def self.get_id(ptr_id : Void*) : ImGuiID
    LibImGui.igGetIDPtr(ptr_id)
  end

  def self.get_io : ImGuiIO
    result = LibImGui.igGetIO
    ImGuiIO.new(result)
  end

  def self.get_item_rect_max : ImGui::ImVec2
    LibImGui.igGetItemRectMax(out p_out)
    p_out
  end

  def self.get_item_rect_min : ImGui::ImVec2
    LibImGui.igGetItemRectMin(out p_out)
    p_out
  end

  def self.get_item_rect_size : ImGui::ImVec2
    LibImGui.igGetItemRectSize(out p_out)
    p_out
  end

  def self.get_key_index(imgui_key : ImGuiKey) : Int32
    LibImGui.igGetKeyIndex(imgui_key)
  end

  def self.get_key_pressed_amount(key_index : Int32, repeat_delay : Float32, rate : Float32) : Int32
    LibImGui.igGetKeyPressedAmount(key_index, repeat_delay, rate)
  end

  def self.get_mouse_cursor : ImGuiMouseCursor
    LibImGui.igGetMouseCursor
  end

  def self.get_mouse_drag_delta(button : ImGuiMouseButton = 0, lock_threshold : Float32 = -1.0) : ImGui::ImVec2
    LibImGui.igGetMouseDragDelta(out p_out, button, lock_threshold)
    p_out
  end

  def self.get_mouse_pos : ImGui::ImVec2
    LibImGui.igGetMousePos(out p_out)
    p_out
  end

  def self.get_mouse_pos_on_opening_current_popup : ImGui::ImVec2
    LibImGui.igGetMousePosOnOpeningCurrentPopup(out p_out)
    p_out
  end

  def self.get_scroll_max_x : Float32
    LibImGui.igGetScrollMaxX
  end

  def self.get_scroll_max_y : Float32
    LibImGui.igGetScrollMaxY
  end

  def self.get_scroll_x : Float32
    LibImGui.igGetScrollX
  end

  def self.get_scroll_y : Float32
    LibImGui.igGetScrollY
  end

  def self.get_state_storage : ImGuiStorage
    result = LibImGui.igGetStateStorage
    ImGuiStorage.new(result)
  end

  def self.get_style : ImGuiStyle
    result = LibImGui.igGetStyle
    ImGuiStyle.new(result)
  end

  def self.get_style_color_name(idx : ImGuiCol) : String
    result = LibImGui.igGetStyleColorName(idx)
    String.new(result)
  end

  def self.get_style_color_vec4(idx : ImGuiCol) : ImVec4
    result = LibImGui.igGetStyleColorVec4(idx)
    result.value
  end

  def self.get_text_line_height : Float32
    LibImGui.igGetTextLineHeight
  end

  def self.get_text_line_height_with_spacing : Float32
    LibImGui.igGetTextLineHeightWithSpacing
  end

  def self.get_time : Float64
    LibImGui.igGetTime
  end

  def self.get_tree_node_to_label_spacing : Float32
    LibImGui.igGetTreeNodeToLabelSpacing
  end

  def self.get_version : String
    result = LibImGui.igGetVersion
    String.new(result)
  end

  def self.get_window_content_region_max : ImGui::ImVec2
    LibImGui.igGetWindowContentRegionMax(out p_out)
    p_out
  end

  def self.get_window_content_region_min : ImGui::ImVec2
    LibImGui.igGetWindowContentRegionMin(out p_out)
    p_out
  end

  def self.get_window_content_region_width : Float32
    LibImGui.igGetWindowContentRegionWidth
  end

  def self.get_window_draw_list : ImDrawList
    result = LibImGui.igGetWindowDrawList
    ImDrawList.new(result)
  end

  def self.get_window_height : Float32
    LibImGui.igGetWindowHeight
  end

  def self.get_window_pos : ImGui::ImVec2
    LibImGui.igGetWindowPos(out p_out)
    p_out
  end

  def self.get_window_size : ImGui::ImVec2
    LibImGui.igGetWindowSize(out p_out)
    p_out
  end

  def self.get_window_width : Float32
    LibImGui.igGetWindowWidth
  end

  def self.image(user_texture_id : ImTextureID, size : ImVec2, uv0 : ImVec2 = ImVec2.new(0, 0), uv1 : ImVec2 = ImVec2.new(1, 1), tint_col : ImVec4 = ImVec4(1, 1, 1, 1), border_col : ImVec4 = ImVec4(0, 0, 0, 0)) : Void
    LibImGui.igImage(user_texture_id, size, uv0, uv1, tint_col, border_col)
  end

  def self.image_button(user_texture_id : ImTextureID, size : ImVec2, uv0 : ImVec2 = ImVec2.new(0, 0), uv1 : ImVec2 = ImVec2.new(1, 1), frame_padding : Int32 = -1, bg_col : ImVec4 = ImVec4(0, 0, 0, 0), tint_col : ImVec4 = ImVec4(1, 1, 1, 1)) : Bool
    LibImGui.igImageButton(user_texture_id, size, uv0, uv1, frame_padding, bg_col, tint_col)
  end

  def self.indent(indent_w : Float32 = 0.0) : Void
    LibImGui.igIndent(indent_w)
  end

  def self.input_double(label : String, v : Float64*, step : Float64 = 0.0, step_fast : Float64 = 0.0, format : String = "%.6", flags : ImGuiInputTextFlags = 0) : Bool
    LibImGui.igInputDouble(label, v, step, step_fast, format, flags)
  end

  def self.input_float(label : String, v : Float32*, step : Float32 = 0.0, step_fast : Float32 = 0.0, format : String = "%.3", flags : ImGuiInputTextFlags = 0) : Bool
    LibImGui.igInputFloat(label, v, step, step_fast, format, flags)
  end

  def self.input_float2(label : String, v : Float32[2], format : String = "%.3", flags : ImGuiInputTextFlags = 0) : Bool
    LibImGui.igInputFloat2(label, v, format, flags)
  end

  def self.input_float3(label : String, v : Float32[3], format : String = "%.3", flags : ImGuiInputTextFlags = 0) : Bool
    LibImGui.igInputFloat3(label, v, format, flags)
  end

  def self.input_float4(label : String, v : Float32[4], format : String = "%.3", flags : ImGuiInputTextFlags = 0) : Bool
    LibImGui.igInputFloat4(label, v, format, flags)
  end

  def self.input_int(label : String, v : Int32*, step : Int32 = 1, step_fast : Int32 = 100, flags : ImGuiInputTextFlags = 0) : Bool
    LibImGui.igInputInt(label, v, step, step_fast, flags)
  end

  def self.input_int2(label : String, v : Int32[2], flags : ImGuiInputTextFlags = 0) : Bool
    LibImGui.igInputInt2(label, v, flags)
  end

  def self.input_int3(label : String, v : Int32[3], flags : ImGuiInputTextFlags = 0) : Bool
    LibImGui.igInputInt3(label, v, flags)
  end

  def self.input_int4(label : String, v : Int32[4], flags : ImGuiInputTextFlags = 0) : Bool
    LibImGui.igInputInt4(label, v, flags)
  end

  def self.input_scalar(label : String, data_type : ImGuiDataType, p_data : Void*, p_step : Void*? = nil, p_step_fast : Void*? = nil, format : String? = nil, flags : ImGuiInputTextFlags = 0) : Bool
    LibImGui.igInputScalar(label, data_type, p_data, p_step, p_step_fast, format, flags)
  end

  def self.input_scalar_n(label : String, data_type : ImGuiDataType, p_data : Void*, components : Int32, p_step : Void*? = nil, p_step_fast : Void*? = nil, format : String? = nil, flags : ImGuiInputTextFlags = 0) : Bool
    LibImGui.igInputScalarN(label, data_type, p_data, components, p_step, p_step_fast, format, flags)
  end

  def self.input_text(label : String, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGuiInputTextFlags = 0, callback : ImGuiInputTextCallback? = nil, user_data : Void*? = nil) : Bool
    LibImGui.igInputText(label, buf, buf_size, flags, callback, user_data)
  end

  def self.input_text_multiline(label : String, buf : LibC::Char*, buf_size : LibC::SizeT, size : ImVec2 = ImVec2.new(0, 0), flags : ImGuiInputTextFlags = 0, callback : ImGuiInputTextCallback? = nil, user_data : Void*? = nil) : Bool
    LibImGui.igInputTextMultiline(label, buf, buf_size, size, flags, callback, user_data)
  end

  def self.input_text_with_hint(label : String, hint : String, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGuiInputTextFlags = 0, callback : ImGuiInputTextCallback? = nil, user_data : Void*? = nil) : Bool
    LibImGui.igInputTextWithHint(label, hint, buf, buf_size, flags, callback, user_data)
  end

  def self.invisible_button(str_id : String, size : ImVec2) : Bool
    LibImGui.igInvisibleButton(str_id, size)
  end

  def self.is_any_item_active : Bool
    LibImGui.igIsAnyItemActive
  end

  def self.is_any_item_focused : Bool
    LibImGui.igIsAnyItemFocused
  end

  def self.is_any_item_hovered : Bool
    LibImGui.igIsAnyItemHovered
  end

  def self.is_any_mouse_down : Bool
    LibImGui.igIsAnyMouseDown
  end

  def self.is_item_activated : Bool
    LibImGui.igIsItemActivated
  end

  def self.is_item_active : Bool
    LibImGui.igIsItemActive
  end

  def self.is_item_clicked(mouse_button : ImGuiMouseButton = 0) : Bool
    LibImGui.igIsItemClicked(mouse_button)
  end

  def self.is_item_deactivated : Bool
    LibImGui.igIsItemDeactivated
  end

  def self.is_item_deactivated_after_edit : Bool
    LibImGui.igIsItemDeactivatedAfterEdit
  end

  def self.is_item_edited : Bool
    LibImGui.igIsItemEdited
  end

  def self.is_item_focused : Bool
    LibImGui.igIsItemFocused
  end

  def self.is_item_hovered(flags : ImGuiHoveredFlags = 0) : Bool
    LibImGui.igIsItemHovered(flags)
  end

  def self.is_item_toggled_open : Bool
    LibImGui.igIsItemToggledOpen
  end

  def self.is_item_visible : Bool
    LibImGui.igIsItemVisible
  end

  def self.is_key_down(user_key_index : Int32) : Bool
    LibImGui.igIsKeyDown(user_key_index)
  end

  def self.is_key_pressed(user_key_index : Int32, repeat : Bool = true) : Bool
    LibImGui.igIsKeyPressed(user_key_index, repeat)
  end

  def self.is_key_released(user_key_index : Int32) : Bool
    LibImGui.igIsKeyReleased(user_key_index)
  end

  def self.is_mouse_clicked(button : ImGuiMouseButton, repeat : Bool = false) : Bool
    LibImGui.igIsMouseClicked(button, repeat)
  end

  def self.is_mouse_double_clicked(button : ImGuiMouseButton) : Bool
    LibImGui.igIsMouseDoubleClicked(button)
  end

  def self.is_mouse_down(button : ImGuiMouseButton) : Bool
    LibImGui.igIsMouseDown(button)
  end

  def self.is_mouse_dragging(button : ImGuiMouseButton, lock_threshold : Float32 = -1.0) : Bool
    LibImGui.igIsMouseDragging(button, lock_threshold)
  end

  def self.is_mouse_hovering_rect(r_min : ImVec2, r_max : ImVec2, clip : Bool = true) : Bool
    LibImGui.igIsMouseHoveringRect(r_min, r_max, clip)
  end

  def self.is_mouse_pos_valid(mouse_pos : ImVec2*? = nil) : Bool
    LibImGui.igIsMousePosValid(mouse_pos)
  end

  def self.is_mouse_released(button : ImGuiMouseButton) : Bool
    LibImGui.igIsMouseReleased(button)
  end

  def self.is_popup_open(str_id : String, flags : ImGuiPopupFlags = 0) : Bool
    LibImGui.igIsPopupOpenStr(str_id, flags)
  end

  def self.is_rect_visible(size : ImVec2) : Bool
    LibImGui.igIsRectVisibleNil(size)
  end

  def self.is_rect_visible(rect_min : ImVec2, rect_max : ImVec2) : Bool
    LibImGui.igIsRectVisibleVec2(rect_min, rect_max)
  end

  def self.is_window_appearing : Bool
    LibImGui.igIsWindowAppearing
  end

  def self.is_window_collapsed : Bool
    LibImGui.igIsWindowCollapsed
  end

  def self.is_window_focused(flags : ImGuiFocusedFlags = 0) : Bool
    LibImGui.igIsWindowFocused(flags)
  end

  def self.is_window_hovered(flags : ImGuiHoveredFlags = 0) : Bool
    LibImGui.igIsWindowHovered(flags)
  end

  def self.label_text(label : String, fmt : String, *args) : Void
    LibImGui.igLabelText(label, fmt, *args)
  end

  def self.list_box(label : String, current_item : Int32*, items : LibC::Char**, items_count : Int32, height_in_items : Int32 = -1) : Bool
    LibImGui.igListBoxStr_arr(label, current_item, items, items_count, height_in_items)
  end

  def self.list_box(label : String, current_item : Int32*, items_getter : (Void*, Int32, LibC::Char**) -> Bool, data : Void*, items_count : Int32, height_in_items : Int32 = -1) : Bool
    LibImGui.igListBoxFnBoolPtr(label, current_item, items_getter, data, items_count, height_in_items)
  end

  def self.list_box_footer : Void
    LibImGui.igListBoxFooter
  end

  def self.list_box_header(label : String, size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igListBoxHeaderVec2(label, size)
  end

  def self.list_box_header(label : String, items_count : Int32, height_in_items : Int32 = -1) : Bool
    LibImGui.igListBoxHeaderInt(label, items_count, height_in_items)
  end

  def self.load_ini_settings_from_disk(ini_filename : String) : Void
    LibImGui.igLoadIniSettingsFromDisk(ini_filename)
  end

  def self.load_ini_settings_from_memory(ini_data : String, ini_size : LibC::SizeT = 0) : Void
    LibImGui.igLoadIniSettingsFromMemory(ini_data, ini_size)
  end

  def self.log_buttons : Void
    LibImGui.igLogButtons
  end

  def self.log_finish : Void
    LibImGui.igLogFinish
  end

  def self.log_text(fmt : String, *args) : Void
    LibImGui.igLogText(fmt, *args)
  end

  def self.log_to_clipboard(auto_open_depth : Int32 = -1) : Void
    LibImGui.igLogToClipboard(auto_open_depth)
  end

  def self.log_to_file(auto_open_depth : Int32 = -1, filename : String? = nil) : Void
    LibImGui.igLogToFile(auto_open_depth, filename)
  end

  def self.log_to_tty(auto_open_depth : Int32 = -1) : Void
    LibImGui.igLogToTTY(auto_open_depth)
  end

  def self.mem_alloc(size : LibC::SizeT) : Void
    LibImGui.igMemAlloc(size)
  end

  def self.mem_free(ptr : Void*) : Void
    LibImGui.igMemFree(ptr)
  end

  def self.menu_item(label : String, shortcut : String? = nil, selected : Bool = false, enabled : Bool = true) : Bool
    LibImGui.igMenuItemBool(label, shortcut, selected, enabled)
  end

  def self.menu_item(label : String, shortcut : String, p_selected : Bool*, enabled : Bool = true) : Bool
    LibImGui.igMenuItemBoolPtr(label, shortcut, p_selected, enabled)
  end

  def self.new_frame : Void
    LibImGui.igNewFrame
  end

  def self.new_line : Void
    LibImGui.igNewLine
  end

  def self.next_column : Void
    LibImGui.igNextColumn
  end

  def self.open_popup(str_id : String, popup_flags : ImGuiPopupFlags = 0) : Void
    LibImGui.igOpenPopup(str_id, popup_flags)
  end

  def self.open_popup_context_item(str_id : String? = nil, popup_flags : ImGuiPopupFlags = 1) : Bool
    LibImGui.igOpenPopupContextItem(str_id, popup_flags)
  end

  def self.plot_histogram(label : String, values : Float32*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = FLT_MAX, scale_max : Float32 = FLT_MAX, graph_size : ImVec2 = ImVec2.new(0, 0), stride : Int32 = sizeof(Float32)) : Void
    LibImGui.igPlotHistogramFloatPtr(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
  end

  def self.plot_histogram(label : String, values_getter : (Void*, Int32) -> Float32, data : Void*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = FLT_MAX, scale_max : Float32 = FLT_MAX, graph_size : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.igPlotHistogramFnFloatPtr(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
  end

  def self.plot_lines(label : String, values : Float32*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = FLT_MAX, scale_max : Float32 = FLT_MAX, graph_size : ImVec2 = ImVec2.new(0, 0), stride : Int32 = sizeof(Float32)) : Void
    LibImGui.igPlotLinesFloatPtr(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
  end

  def self.plot_lines(label : String, values_getter : (Void*, Int32) -> Float32, data : Void*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = FLT_MAX, scale_max : Float32 = FLT_MAX, graph_size : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.igPlotLinesFnFloatPtr(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
  end

  def self.pop_allow_keyboard_focus : Void
    LibImGui.igPopAllowKeyboardFocus
  end

  def self.pop_button_repeat : Void
    LibImGui.igPopButtonRepeat
  end

  def self.pop_clip_rect : Void
    LibImGui.igPopClipRect
  end

  def self.pop_font : Void
    LibImGui.igPopFont
  end

  def self.pop_id : Void
    LibImGui.igPopID
  end

  def self.pop_item_width : Void
    LibImGui.igPopItemWidth
  end

  def self.pop_style_color(count : Int32 = 1) : Void
    LibImGui.igPopStyleColor(count)
  end

  def self.pop_style_var(count : Int32 = 1) : Void
    LibImGui.igPopStyleVar(count)
  end

  def self.pop_text_wrap_pos : Void
    LibImGui.igPopTextWrapPos
  end

  def self.progress_bar(fraction : Float32, size_arg : ImVec2 = ImVec2.new(-1, 0), overlay : String? = nil) : Void
    LibImGui.igProgressBar(fraction, size_arg, overlay)
  end

  def self.push_allow_keyboard_focus(allow_keyboard_focus : Bool) : Void
    LibImGui.igPushAllowKeyboardFocus(allow_keyboard_focus)
  end

  def self.push_button_repeat(repeat : Bool) : Void
    LibImGui.igPushButtonRepeat(repeat)
  end

  def self.push_clip_rect(clip_rect_min : ImVec2, clip_rect_max : ImVec2, intersect_with_current_clip_rect : Bool) : Void
    LibImGui.igPushClipRect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect)
  end

  def self.push_font(font : ImFont*) : Void
    LibImGui.igPushFont(font)
  end

  def self.push_id(str_id : String) : Void
    LibImGui.igPushIDStr(str_id)
  end

  def self.push_id(str_id_begin : String, str_id_end : String) : Void
    LibImGui.igPushIDStrStr(str_id_begin, str_id_end)
  end

  def self.push_id(ptr_id : Void*) : Void
    LibImGui.igPushIDPtr(ptr_id)
  end

  def self.push_id(int_id : Int32) : Void
    LibImGui.igPushIDInt(int_id)
  end

  def self.push_item_width(item_width : Float32) : Void
    LibImGui.igPushItemWidth(item_width)
  end

  def self.push_style_color(idx : ImGuiCol, col : UInt32) : Void
    LibImGui.igPushStyleColorU32(idx, col)
  end

  def self.push_style_color(idx : ImGuiCol, col : ImVec4) : Void
    LibImGui.igPushStyleColorVec4(idx, col)
  end

  def self.push_style_var(idx : ImGuiStyleVar, val : Float32) : Void
    LibImGui.igPushStyleVarFloat(idx, val)
  end

  def self.push_style_var(idx : ImGuiStyleVar, val : ImVec2) : Void
    LibImGui.igPushStyleVarVec2(idx, val)
  end

  def self.push_text_wrap_pos(wrap_local_pos_x : Float32 = 0.0) : Void
    LibImGui.igPushTextWrapPos(wrap_local_pos_x)
  end

  def self.radio_button(label : String, active : Bool) : Bool
    LibImGui.igRadioButtonBool(label, active)
  end

  def self.radio_button(label : String, v : Int32*, v_button : Int32) : Bool
    LibImGui.igRadioButtonIntPtr(label, v, v_button)
  end

  def self.render : Void
    LibImGui.igRender
  end

  def self.reset_mouse_drag_delta(button : ImGuiMouseButton = 0) : Void
    LibImGui.igResetMouseDragDelta(button)
  end

  def self.same_line(offset_from_start_x : Float32 = 0.0, spacing : Float32 = -1.0) : Void
    LibImGui.igSameLine(offset_from_start_x, spacing)
  end

  def self.save_ini_settings_to_disk(ini_filename : String) : Void
    LibImGui.igSaveIniSettingsToDisk(ini_filename)
  end

  def self.save_ini_settings_to_memory : {String, LibC::SizeT}
    result = LibImGui.igSaveIniSettingsToMemory(out out_ini_size)
    {String.new(result), out_ini_size}
  end

  def self.selectable(label : String, selected : Bool = false, flags : ImGuiSelectableFlags = 0, size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igSelectableBool(label, selected, flags, size)
  end

  def self.selectable(label : String, p_selected : Bool*, flags : ImGuiSelectableFlags = 0, size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igSelectableBoolPtr(label, p_selected, flags, size)
  end

  def self.separator : Void
    LibImGui.igSeparator
  end

  def self.set_allocator_functions(alloc_func : (LibC::SizeT, Void*) -> Void*, free_func : (Void*, Void*) -> Void, user_data : Void*? = nil) : Void
    LibImGui.igSetAllocatorFunctions(alloc_func, free_func, user_data)
  end

  def self.set_clipboard_text(text : String) : Void
    LibImGui.igSetClipboardText(text)
  end

  def self.set_color_edit_options(flags : ImGuiColorEditFlags) : Void
    LibImGui.igSetColorEditOptions(flags)
  end

  def self.set_column_offset(column_index : Int32, offset_x : Float32) : Void
    LibImGui.igSetColumnOffset(column_index, offset_x)
  end

  def self.set_column_width(column_index : Int32, width : Float32) : Void
    LibImGui.igSetColumnWidth(column_index, width)
  end

  def self.set_current_context(ctx : ImGuiContext) : Void
    LibImGui.igSetCurrentContext(ctx)
  end

  def self.set_cursor_pos(local_pos : ImVec2) : Void
    LibImGui.igSetCursorPos(local_pos)
  end

  def self.set_cursor_pos_x(local_x : Float32) : Void
    LibImGui.igSetCursorPosX(local_x)
  end

  def self.set_cursor_pos_y(local_y : Float32) : Void
    LibImGui.igSetCursorPosY(local_y)
  end

  def self.set_cursor_screen_pos(pos : ImVec2) : Void
    LibImGui.igSetCursorScreenPos(pos)
  end

  def self.set_drag_drop_payload(type : String, data : Void*, sz : LibC::SizeT, cond : ImGuiCond = 0) : Bool
    LibImGui.igSetDragDropPayload(type, data, sz, cond)
  end

  def self.set_item_allow_overlap : Void
    LibImGui.igSetItemAllowOverlap
  end

  def self.set_item_default_focus : Void
    LibImGui.igSetItemDefaultFocus
  end

  def self.set_keyboard_focus_here(offset : Int32 = 0) : Void
    LibImGui.igSetKeyboardFocusHere(offset)
  end

  def self.set_mouse_cursor(cursor_type : ImGuiMouseCursor) : Void
    LibImGui.igSetMouseCursor(cursor_type)
  end

  def self.set_next_item_open(is_open : Bool, cond : ImGuiCond = 0) : Void
    LibImGui.igSetNextItemOpen(is_open, cond)
  end

  def self.set_next_item_width(item_width : Float32) : Void
    LibImGui.igSetNextItemWidth(item_width)
  end

  def self.set_next_window_bg_alpha(alpha : Float32) : Void
    LibImGui.igSetNextWindowBgAlpha(alpha)
  end

  def self.set_next_window_collapsed(collapsed : Bool, cond : ImGuiCond = 0) : Void
    LibImGui.igSetNextWindowCollapsed(collapsed, cond)
  end

  def self.set_next_window_content_size(size : ImVec2) : Void
    LibImGui.igSetNextWindowContentSize(size)
  end

  def self.set_next_window_focus : Void
    LibImGui.igSetNextWindowFocus
  end

  def self.set_next_window_pos(pos : ImVec2, cond : ImGuiCond = 0, pivot : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.igSetNextWindowPos(pos, cond, pivot)
  end

  def self.set_next_window_size(size : ImVec2, cond : ImGuiCond = 0) : Void
    LibImGui.igSetNextWindowSize(size, cond)
  end

  def self.set_next_window_size_constraints(size_min : ImVec2, size_max : ImVec2, custom_callback : ImGuiSizeCallback? = nil, custom_callback_data : Void*? = nil) : Void
    LibImGui.igSetNextWindowSizeConstraints(size_min, size_max, custom_callback, custom_callback_data)
  end

  def self.set_scroll_from_pos_x(local_x : Float32, center_x_ratio : Float32 = 0.5) : Void
    LibImGui.igSetScrollFromPosXFloat(local_x, center_x_ratio)
  end

  def self.set_scroll_from_pos_y(local_y : Float32, center_y_ratio : Float32 = 0.5) : Void
    LibImGui.igSetScrollFromPosYFloat(local_y, center_y_ratio)
  end

  def self.set_scroll_here_x(center_x_ratio : Float32 = 0.5) : Void
    LibImGui.igSetScrollHereX(center_x_ratio)
  end

  def self.set_scroll_here_y(center_y_ratio : Float32 = 0.5) : Void
    LibImGui.igSetScrollHereY(center_y_ratio)
  end

  def self.set_scroll_x(scroll_x : Float32) : Void
    LibImGui.igSetScrollXFloat(scroll_x)
  end

  def self.set_scroll_y(scroll_y : Float32) : Void
    LibImGui.igSetScrollYFloat(scroll_y)
  end

  def self.set_state_storage(storage : ImGuiStorage) : Void
    LibImGui.igSetStateStorage(storage)
  end

  def self.set_tab_item_closed(tab_or_docked_window_label : String) : Void
    LibImGui.igSetTabItemClosed(tab_or_docked_window_label)
  end

  def self.set_tooltip(fmt : String, *args) : Void
    LibImGui.igSetTooltip(fmt, *args)
  end

  def self.set_window_collapsed(collapsed : Bool, cond : ImGuiCond = 0) : Void
    LibImGui.igSetWindowCollapsedBool(collapsed, cond)
  end

  def self.set_window_collapsed(name : String, collapsed : Bool, cond : ImGuiCond = 0) : Void
    LibImGui.igSetWindowCollapsedStr(name, collapsed, cond)
  end

  def self.set_window_focus : Void
    LibImGui.igSetWindowFocusNil
  end

  def self.set_window_focus(name : String) : Void
    LibImGui.igSetWindowFocusStr(name)
  end

  def self.set_window_font_scale(scale : Float32) : Void
    LibImGui.igSetWindowFontScale(scale)
  end

  def self.set_window_pos(pos : ImVec2, cond : ImGuiCond = 0) : Void
    LibImGui.igSetWindowPosVec2(pos, cond)
  end

  def self.set_window_pos(name : String, pos : ImVec2, cond : ImGuiCond = 0) : Void
    LibImGui.igSetWindowPosStr(name, pos, cond)
  end

  def self.set_window_size(size : ImVec2, cond : ImGuiCond = 0) : Void
    LibImGui.igSetWindowSizeVec2(size, cond)
  end

  def self.set_window_size(name : String, size : ImVec2, cond : ImGuiCond = 0) : Void
    LibImGui.igSetWindowSizeStr(name, size, cond)
  end

  def self.show_about_window(p_open : Bool*? = nil) : Void
    LibImGui.igShowAboutWindow(p_open)
  end

  def self.show_demo_window(p_open : Bool*? = nil) : Void
    LibImGui.igShowDemoWindow(p_open)
  end

  def self.show_font_selector(label : String) : Void
    LibImGui.igShowFontSelector(label)
  end

  def self.show_metrics_window(p_open : Bool*? = nil) : Void
    LibImGui.igShowMetricsWindow(p_open)
  end

  def self.show_style_editor(ref : ImGuiStyle? = nil) : Void
    LibImGui.igShowStyleEditor(ref)
  end

  def self.show_style_selector(label : String) : Bool
    LibImGui.igShowStyleSelector(label)
  end

  def self.show_user_guide : Void
    LibImGui.igShowUserGuide
  end

  def self.slider_angle(label : String, v_rad : Float32*, v_degrees_min : Float32 = -360.0, v_degrees_max : Float32 = +360.0, format : String = "%.0 deg") : Bool
    LibImGui.igSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, format)
  end

  def self.slider_float(label : String, v : Float32*, v_min : Float32, v_max : Float32, format : String = "%.3", power : Float32 = 1.0) : Bool
    LibImGui.igSliderFloat(label, v, v_min, v_max, format, power)
  end

  def self.slider_float2(label : String, v : Float32[2], v_min : Float32, v_max : Float32, format : String = "%.3", power : Float32 = 1.0) : Bool
    LibImGui.igSliderFloat2(label, v, v_min, v_max, format, power)
  end

  def self.slider_float3(label : String, v : Float32[3], v_min : Float32, v_max : Float32, format : String = "%.3", power : Float32 = 1.0) : Bool
    LibImGui.igSliderFloat3(label, v, v_min, v_max, format, power)
  end

  def self.slider_float4(label : String, v : Float32[4], v_min : Float32, v_max : Float32, format : String = "%.3", power : Float32 = 1.0) : Bool
    LibImGui.igSliderFloat4(label, v, v_min, v_max, format, power)
  end

  def self.slider_int(label : String, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d") : Bool
    LibImGui.igSliderInt(label, v, v_min, v_max, format)
  end

  def self.slider_int2(label : String, v : Int32[2], v_min : Int32, v_max : Int32, format : String = "%d") : Bool
    LibImGui.igSliderInt2(label, v, v_min, v_max, format)
  end

  def self.slider_int3(label : String, v : Int32[3], v_min : Int32, v_max : Int32, format : String = "%d") : Bool
    LibImGui.igSliderInt3(label, v, v_min, v_max, format)
  end

  def self.slider_int4(label : String, v : Int32[4], v_min : Int32, v_max : Int32, format : String = "%d") : Bool
    LibImGui.igSliderInt4(label, v, v_min, v_max, format)
  end

  def self.slider_scalar(label : String, data_type : ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igSliderScalar(label, data_type, p_data, p_min, p_max, format, power)
  end

  def self.slider_scalar_n(label : String, data_type : ImGuiDataType, p_data : Void*, components : Int32, p_min : Void*, p_max : Void*, format : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igSliderScalarN(label, data_type, p_data, components, p_min, p_max, format, power)
  end

  def self.small_button(label : String) : Bool
    LibImGui.igSmallButton(label)
  end

  def self.spacing : Void
    LibImGui.igSpacing
  end

  def self.style_colors_classic(dst : ImGuiStyle? = nil) : Void
    LibImGui.igStyleColorsClassic(dst)
  end

  def self.style_colors_dark(dst : ImGuiStyle? = nil) : Void
    LibImGui.igStyleColorsDark(dst)
  end

  def self.style_colors_light(dst : ImGuiStyle? = nil) : Void
    LibImGui.igStyleColorsLight(dst)
  end

  def self.text(fmt : String, *args) : Void
    LibImGui.igText(fmt, *args)
  end

  def self.text_colored(col : ImVec4, fmt : String, *args) : Void
    LibImGui.igTextColored(col, fmt, *args)
  end

  def self.text_disabled(fmt : String, *args) : Void
    LibImGui.igTextDisabled(fmt, *args)
  end

  def self.text_unformatted(text : String, text_end : String? = nil) : Void
    LibImGui.igTextUnformatted(text, text_end)
  end

  def self.text_wrapped(fmt : String, *args) : Void
    LibImGui.igTextWrapped(fmt, *args)
  end

  def self.tree_node(label : String) : Bool
    LibImGui.igTreeNodeStr(label)
  end

  def self.tree_node(str_id : String, fmt : String, *args) : Bool
    LibImGui.igTreeNodeStrStr(str_id, fmt, *args)
  end

  def self.tree_node(ptr_id : Void*, fmt : String, *args) : Bool
    LibImGui.igTreeNodePtr(ptr_id, fmt, *args)
  end

  def self.tree_node_ex(label : String, flags : ImGuiTreeNodeFlags = 0) : Bool
    LibImGui.igTreeNodeExStr(label, flags)
  end

  def self.tree_node_ex(str_id : String, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Bool
    LibImGui.igTreeNodeExStrStr(str_id, flags, fmt, *args)
  end

  def self.tree_node_ex(ptr_id : Void*, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Bool
    LibImGui.igTreeNodeExPtr(ptr_id, flags, fmt, *args)
  end

  def self.tree_pop : Void
    LibImGui.igTreePop
  end

  def self.tree_push(str_id : String) : Void
    LibImGui.igTreePushStr(str_id)
  end

  def self.tree_push(ptr_id : Void*? = nil) : Void
    LibImGui.igTreePushPtr(ptr_id)
  end

  def self.unindent(indent_w : Float32 = 0.0) : Void
    LibImGui.igUnindent(indent_w)
  end

  def self.v_slider_float(label : String, size : ImVec2, v : Float32*, v_min : Float32, v_max : Float32, format : String = "%.3", power : Float32 = 1.0) : Bool
    LibImGui.igVSliderFloat(label, size, v, v_min, v_max, format, power)
  end

  def self.v_slider_int(label : String, size : ImVec2, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d") : Bool
    LibImGui.igVSliderInt(label, size, v, v_min, v_max, format)
  end

  def self.v_slider_scalar(label : String, size : ImVec2, data_type : ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igVSliderScalar(label, size, data_type, p_data, p_min, p_max, format, power)
  end

  def self.value(prefix : String, b : Bool) : Void
    LibImGui.igValueBool(prefix, b)
  end

  def self.value(prefix : String, v : Int32) : Void
    LibImGui.igValueInt(prefix, v)
  end

  def self.value(prefix : String, v : UInt32) : Void
    LibImGui.igValueUint(prefix, v)
  end

  def self.value(prefix : String, v : Float32, float_format : String? = nil) : Void
    LibImGui.igValueFloat(prefix, v, float_format)
  end
end
