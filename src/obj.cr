require "./lib"

module ImGui
  alias ImBitVector = LibImGui::ImBitVector

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
    include DirectClassType(LibImGui::ImDrawChannel)
  end

  struct ImDrawCmd
    include StructClassType(LibImGui::ImDrawCmd)

    def clip_rect : ImVec4
      @this.value.clip_rect
    end

    def clip_rect=(clip_rect : ImVec4)
      @this.value.clip_rect = clip_rect
    end

    def texture_id : ImTextureID
      @this.value.texture_id
    end

    def texture_id=(texture_id : ImTextureID)
      @this.value.texture_id = texture_id
    end

    def vtx_offset : UInt32
      @this.value.vtx_offset
    end

    def vtx_offset=(vtx_offset : UInt32)
      @this.value.vtx_offset = vtx_offset
    end

    def idx_offset : UInt32
      @this.value.idx_offset
    end

    def idx_offset=(idx_offset : UInt32)
      @this.value.idx_offset = idx_offset
    end

    def elem_count : UInt32
      @this.value.elem_count
    end

    def elem_count=(elem_count : UInt32)
      @this.value.elem_count = elem_count
    end

    def user_callback : ImDrawCallback
      @this.value.user_callback
    end

    def user_callback=(user_callback : ImDrawCallback)
      @this.value.user_callback = user_callback
    end

    def user_callback_data : Void*
      @this.value.user_callback_data
    end

    def user_callback_data=(user_callback_data : Void*)
      @this.value.user_callback_data = user_callback_data
    end

    def self.new : ImDrawCmd
      result = LibImGui.ImDrawCmd_ImDrawCmd
      ImDrawCmd.new(result)
    end
  end

  struct ImDrawData
    include StructClassType(LibImGui::ImDrawData)

    def valid : Bool
      @this.value.valid
    end

    def valid=(valid : Bool)
      @this.value.valid = valid
    end

    def cmd_lists : Slice(ImDrawList)
      Slice(ImDrawList).new(@this.value.cmd_lists, @this.value.cmd_lists_count)
    end

    def cmd_lists=(cmd_lists : Slice(ImDrawList))
      @this.value.cmd_lists = cmd_lists
    end

    def cmd_lists_count : Int32
      @this.value.cmd_lists_count
    end

    def cmd_lists_count=(cmd_lists_count : Int32)
      @this.value.cmd_lists_count = cmd_lists_count
    end

    def total_idx_count : Int32
      @this.value.total_idx_count
    end

    def total_idx_count=(total_idx_count : Int32)
      @this.value.total_idx_count = total_idx_count
    end

    def total_vtx_count : Int32
      @this.value.total_vtx_count
    end

    def total_vtx_count=(total_vtx_count : Int32)
      @this.value.total_vtx_count = total_vtx_count
    end

    def display_pos : ImVec2
      @this.value.display_pos
    end

    def display_pos=(display_pos : ImVec2)
      @this.value.display_pos = display_pos
    end

    def display_size : ImVec2
      @this.value.display_size
    end

    def display_size=(display_size : ImVec2)
      @this.value.display_size = display_size
    end

    def framebuffer_scale : ImVec2
      @this.value.framebuffer_scale
    end

    def framebuffer_scale=(framebuffer_scale : ImVec2)
      @this.value.framebuffer_scale = framebuffer_scale
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

  alias ImDrawDataBuilder = LibImGui::ImDrawDataBuilder

  struct ImDrawList
    include StructClassType(LibImGui::ImDrawList)

    def cmd_buffer : LibImGui::ImVector(LibImGui::ImDrawCmd)
      @this.value.cmd_buffer
    end

    def cmd_buffer=(cmd_buffer : LibImGui::ImVector(LibImGui::ImDrawCmd))
      @this.value.cmd_buffer = cmd_buffer
    end

    def idx_buffer : LibImGui::ImVector(ImDrawIdx)
      @this.value.idx_buffer
    end

    def idx_buffer=(idx_buffer : LibImGui::ImVector(ImDrawIdx))
      @this.value.idx_buffer = idx_buffer
    end

    def vtx_buffer : LibImGui::ImVector(ImDrawVert)
      @this.value.vtx_buffer
    end

    def vtx_buffer=(vtx_buffer : LibImGui::ImVector(ImDrawVert))
      @this.value.vtx_buffer = vtx_buffer
    end

    def flags : ImDrawListFlags
      @this.value.flags
    end

    def flags=(flags : ImDrawListFlags)
      @this.value.flags = flags
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

    def add_image_rounded(user_texture_id : ImTextureID, p_min : ImVec2, p_max : ImVec2, uv_min : ImVec2, uv_max : ImVec2, col : UInt32, rounding : Float32, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags::All) : Void
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

    def add_rect(p_min : ImVec2, p_max : ImVec2, col : UInt32, rounding : Float32 = 0.0, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags::All, thickness : Float32 = 1.0) : Void
      LibImGui.ImDrawList_AddRect(self, p_min, p_max, col, rounding, rounding_corners, thickness)
    end

    def add_rect_filled(p_min : ImVec2, p_max : ImVec2, col : UInt32, rounding : Float32 = 0.0, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags::All) : Void
      LibImGui.ImDrawList_AddRectFilled(self, p_min, p_max, col, rounding, rounding_corners)
    end

    def add_rect_filled_multi_color(p_min : ImVec2, p_max : ImVec2, col_upr_left : UInt32, col_upr_right : UInt32, col_bot_right : UInt32, col_bot_left : UInt32) : Void
      LibImGui.ImDrawList_AddRectFilledMultiColor(self, p_min, p_max, col_upr_left, col_upr_right, col_bot_right, col_bot_left)
    end

    def add_text(pos : ImVec2, col : UInt32, text_begin : Slice(UInt8) | String) : Void
      LibImGui.ImDrawList_AddTextVec2(self, pos, col, text_begin, (text_begin.to_unsafe + text_begin.bytesize))
    end

    def add_text(font : ImFont, font_size : Float32, pos : ImVec2, col : UInt32, text_begin : Slice(UInt8) | String, wrap_width : Float32 = 0.0, cpu_fine_clip_rect : ImVec4* = Pointer(ImVec4).null) : Void
      LibImGui.ImDrawList_AddTextFontPtr(self, font, font_size, pos, col, text_begin, (text_begin.to_unsafe + text_begin.bytesize), wrap_width, cpu_fine_clip_rect)
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

    def path_rect(rect_min : ImVec2, rect_max : ImVec2, rounding : Float32 = 0.0, rounding_corners : ImDrawCornerFlags = ImDrawCornerFlags::All) : Void
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

  alias ImDrawListSharedData = LibImGui::ImDrawListSharedData

  class ImDrawListSplitter
    include DirectClassType(LibImGui::ImDrawListSplitter)

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

  class ImFont
    include DirectClassType(LibImGui::ImFont)

    def index_advance_x : LibImGui::ImVector(Float32)
      @this.index_advance_x
    end

    def index_advance_x=(index_advance_x : LibImGui::ImVector(Float32))
      @this.index_advance_x = index_advance_x
    end

    def fallback_advance_x : Float32
      @this.fallback_advance_x
    end

    def fallback_advance_x=(fallback_advance_x : Float32)
      @this.fallback_advance_x = fallback_advance_x
    end

    def font_size : Float32
      @this.font_size
    end

    def font_size=(font_size : Float32)
      @this.font_size = font_size
    end

    def index_lookup : LibImGui::ImVector(ImWchar)
      @this.index_lookup
    end

    def index_lookup=(index_lookup : LibImGui::ImVector(ImWchar))
      @this.index_lookup = index_lookup
    end

    def glyphs : LibImGui::ImVector(ImFontGlyph)
      @this.glyphs
    end

    def glyphs=(glyphs : LibImGui::ImVector(ImFontGlyph))
      @this.glyphs = glyphs
    end

    def fallback_glyph : ImFontGlyph*
      @this.fallback_glyph.value
    end

    def fallback_glyph=(fallback_glyph : ImFontGlyph*)
      @this.fallback_glyph = fallback_glyph
    end

    def display_offset : ImVec2
      @this.display_offset
    end

    def display_offset=(display_offset : ImVec2)
      @this.display_offset = display_offset
    end

    def container_atlas : ImFontAtlas
      ImFontAtlas.new(@this.container_atlas)
    end

    def container_atlas=(container_atlas : ImFontAtlas)
      @this.container_atlas = container_atlas
    end

    def config_data : ImFontConfig
      ImFontConfig.new(@this.config_data)
    end

    def config_data=(config_data : ImFontConfig)
      @this.config_data = config_data
    end

    def config_data_count : Int16
      @this.config_data_count
    end

    def config_data_count=(config_data_count : Int16)
      @this.config_data_count = config_data_count
    end

    def fallback_char : ImWchar
      @this.fallback_char
    end

    def fallback_char=(fallback_char : ImWchar)
      @this.fallback_char = fallback_char
    end

    def ellipsis_char : ImWchar
      @this.ellipsis_char
    end

    def ellipsis_char=(ellipsis_char : ImWchar)
      @this.ellipsis_char = ellipsis_char
    end

    def dirty_lookup_tables : Bool
      @this.dirty_lookup_tables
    end

    def dirty_lookup_tables=(dirty_lookup_tables : Bool)
      @this.dirty_lookup_tables = dirty_lookup_tables
    end

    def scale : Float32
      @this.scale
    end

    def scale=(scale : Float32)
      @this.scale = scale
    end

    def ascent : Float32
      @this.ascent
    end

    def ascent=(ascent : Float32)
      @this.ascent = ascent
    end

    def descent : Float32
      @this.descent
    end

    def descent=(descent : Float32)
      @this.descent = descent
    end

    def metrics_total_surface : Int32
      @this.metrics_total_surface
    end

    def metrics_total_surface=(metrics_total_surface : Int32)
      @this.metrics_total_surface = metrics_total_surface
    end

    def used4k_pages_map : UInt8*
      @this.used4k_pages_map.to_slice
    end

    def used4k_pages_map=(used4k_pages_map : UInt8*)
      @this.used4k_pages_map = used4k_pages_map
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

    def calc_text_size_a(size : Float32, max_width : Float32, wrap_width : Float32, text_begin : Slice(UInt8) | String, remaining : LibC::Char** = Pointer(LibC::Char*).null) : ImGui::ImVec2
      LibImGui.ImFont_CalcTextSizeA(out p_out, self, size, max_width, wrap_width, text_begin, (text_begin.to_unsafe + text_begin.bytesize), remaining)
      p_out
    end

    def calc_word_wrap_position_a(scale : Float32, text : Slice(UInt8) | String, wrap_width : Float32) : String
      result = LibImGui.ImFont_CalcWordWrapPositionA(self, scale, text, (text.to_unsafe + text.bytesize), wrap_width)
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
      ImFont.new(result)
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

    def render_text(draw_list : ImDrawList, size : Float32, pos : ImVec2, col : UInt32, clip_rect : ImVec4, text_begin : Slice(UInt8) | String, wrap_width : Float32 = 0.0, cpu_fine_clip : Bool = false) : Void
      LibImGui.ImFont_RenderText(self, draw_list, size, pos, col, clip_rect, text_begin, (text_begin.to_unsafe + text_begin.bytesize), wrap_width, cpu_fine_clip)
    end

    def set_fallback_char(c : ImWchar) : Void
      LibImGui.ImFont_SetFallbackChar(self, c)
    end

    def set_glyph_visible(c : ImWchar, visible : Bool) : Void
      LibImGui.ImFont_SetGlyphVisible(self, c, visible)
    end
  end

  class ImFontAtlas
    include DirectClassType(LibImGui::ImFontAtlas)

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
      @this.tex_uv_scale
    end

    def tex_uv_scale=(tex_uv_scale : ImVec2)
      @this.tex_uv_scale = tex_uv_scale
    end

    def tex_uv_white_pixel : ImVec2
      @this.tex_uv_white_pixel
    end

    def tex_uv_white_pixel=(tex_uv_white_pixel : ImVec2)
      @this.tex_uv_white_pixel = tex_uv_white_pixel
    end

    def fonts : LibImGui::ImVector(ImFont)
      @this.fonts
    end

    def fonts=(fonts : LibImGui::ImVector(ImFont))
      @this.fonts = fonts
    end

    def custom_rects : LibImGui::ImVector(LibImGui::ImFontAtlasCustomRect)
      @this.custom_rects
    end

    def custom_rects=(custom_rects : LibImGui::ImVector(LibImGui::ImFontAtlasCustomRect))
      @this.custom_rects = custom_rects
    end

    def config_data : LibImGui::ImVector(LibImGui::ImFontConfig)
      @this.config_data
    end

    def config_data=(config_data : LibImGui::ImVector(LibImGui::ImFontConfig))
      @this.config_data = config_data
    end

    def custom_rect_ids : Int32*
      @this.custom_rect_ids.to_slice
    end

    def custom_rect_ids=(custom_rect_ids : Int32*)
      @this.custom_rect_ids = custom_rect_ids
    end

    def add_custom_rect_font_glyph(font : ImFont, id : ImWchar, width : Int32, height : Int32, advance_x : Float32, offset : ImVec2 = ImVec2.new(0, 0)) : Int32
      LibImGui.ImFontAtlas_AddCustomRectFontGlyph(self, font, id, width, height, advance_x, offset)
    end

    def add_custom_rect_regular(width : Int32, height : Int32) : Int32
      LibImGui.ImFontAtlas_AddCustomRectRegular(self, width, height)
    end

    def add_font(font_cfg : ImFontConfig) : ImFont
      result = LibImGui.ImFontAtlas_AddFont(self, font_cfg)
      ImFont.new(result)
    end

    def add_font_default(font_cfg : ImFontConfig? = nil) : ImFont
      result = LibImGui.ImFontAtlas_AddFontDefault(self, font_cfg)
      ImFont.new(result)
    end

    def add_font_from_file_ttf(filename : String, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromFileTTF(self, filename, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    def add_font_from_memory_compressed_base85_ttf(compressed_font_data_base85 : String, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self, compressed_font_data_base85, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    def add_font_from_memory_compressed_ttf(compressed_font_data : Void*, compressed_font_size : Int32, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryCompressedTTF(self, compressed_font_data, compressed_font_size, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
    end

    def add_font_from_memory_ttf(font_data : Void*, font_size : Int32, size_pixels : Float32, font_cfg : ImFontConfig? = nil, glyph_ranges : ImWchar* = Pointer(ImWchar).null) : ImFont
      result = LibImGui.ImFontAtlas_AddFontFromMemoryTTF(self, font_data, font_size, size_pixels, font_cfg, glyph_ranges)
      ImFont.new(result)
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

    def get_mouse_cursor_tex_data_(cursor : ImGuiMouseCursor) : {Bool, ImGui::ImVec2, ImGui::ImVec2, ImGui::ImVec2, ImGui::ImVec2}
      result = LibImGui.ImFontAtlas_GetMouseCursorTexData(self, cursor, out out_offset, out out_size, out out_uv_border, out out_uv_fill)
      {result, out_offset, out_size, out_uv_border.to_slice, out_uv_fill.to_slice}
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
    include DirectClassType(LibImGui::ImFontAtlasCustomRect)

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
      @this.glyph_offset
    end

    def glyph_offset=(glyph_offset : ImVec2)
      @this.glyph_offset = glyph_offset
    end

    def font : ImFont
      ImFont.new(@this.font)
    end

    def font=(font : ImFont)
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
    include DirectClassType(LibImGui::ImFontConfig)

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
      @this.glyph_extra_spacing
    end

    def glyph_extra_spacing=(glyph_extra_spacing : ImVec2)
      @this.glyph_extra_spacing = glyph_extra_spacing
    end

    def glyph_offset : ImVec2
      @this.glyph_offset
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

    def name : LibC::Char*
      @this.name.to_slice
    end

    def name=(name : LibC::Char*)
      @this.name = name
    end

    def dst_font : ImFont
      ImFont.new(@this.dst_font)
    end

    def dst_font=(dst_font : ImFont)
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
    include DirectClassType(LibImGui::ImFontGlyphRangesBuilder)

    def used_chars : LibImGui::ImVector(UInt32)
      @this.used_chars
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

    def add_text(text : Slice(UInt8) | String) : Void
      LibImGui.ImFontGlyphRangesBuilder_AddText(self, text, (text.to_unsafe + text.bytesize))
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

  alias ImGuiColorMod = LibImGui::ImGuiColorMod
  alias ImGuiColumnData = LibImGui::ImGuiColumnData
  alias ImGuiColumns = LibImGui::ImGuiColumns
  alias ImGuiContext = LibImGui::ImGuiContext
  alias ImGuiDataTypeInfo = LibImGui::ImGuiDataTypeInfo
  alias ImGuiDataTypeTempStorage = LibImGui::ImGuiDataTypeTempStorage
  alias ImGuiGroupData = LibImGui::ImGuiGroupData

  struct ImGuiIO
    include StructClassType(LibImGui::ImGuiIO)

    def config_flags : ImGuiConfigFlags
      @this.value.config_flags
    end

    def config_flags=(config_flags : ImGuiConfigFlags)
      @this.value.config_flags = config_flags
    end

    def backend_flags : ImGuiBackendFlags
      @this.value.backend_flags
    end

    def backend_flags=(backend_flags : ImGuiBackendFlags)
      @this.value.backend_flags = backend_flags
    end

    def display_size : ImVec2
      @this.value.display_size
    end

    def display_size=(display_size : ImVec2)
      @this.value.display_size = display_size
    end

    def delta_time : Float32
      @this.value.delta_time
    end

    def delta_time=(delta_time : Float32)
      @this.value.delta_time = delta_time
    end

    def ini_saving_rate : Float32
      @this.value.ini_saving_rate
    end

    def ini_saving_rate=(ini_saving_rate : Float32)
      @this.value.ini_saving_rate = ini_saving_rate
    end

    def ini_filename : String
      String.new(@this.value.ini_filename)
    end

    def ini_filename=(ini_filename : String)
      @this.value.ini_filename = ini_filename
    end

    def log_filename : String
      String.new(@this.value.log_filename)
    end

    def log_filename=(log_filename : String)
      @this.value.log_filename = log_filename
    end

    def mouse_double_click_time : Float32
      @this.value.mouse_double_click_time
    end

    def mouse_double_click_time=(mouse_double_click_time : Float32)
      @this.value.mouse_double_click_time = mouse_double_click_time
    end

    def mouse_double_click_max_dist : Float32
      @this.value.mouse_double_click_max_dist
    end

    def mouse_double_click_max_dist=(mouse_double_click_max_dist : Float32)
      @this.value.mouse_double_click_max_dist = mouse_double_click_max_dist
    end

    def mouse_drag_threshold : Float32
      @this.value.mouse_drag_threshold
    end

    def mouse_drag_threshold=(mouse_drag_threshold : Float32)
      @this.value.mouse_drag_threshold = mouse_drag_threshold
    end

    def key_map : Int32*
      @this.value.key_map.to_slice
    end

    def key_map=(key_map : Int32*)
      @this.value.key_map = key_map
    end

    def key_repeat_delay : Float32
      @this.value.key_repeat_delay
    end

    def key_repeat_delay=(key_repeat_delay : Float32)
      @this.value.key_repeat_delay = key_repeat_delay
    end

    def key_repeat_rate : Float32
      @this.value.key_repeat_rate
    end

    def key_repeat_rate=(key_repeat_rate : Float32)
      @this.value.key_repeat_rate = key_repeat_rate
    end

    def user_data : Void*
      @this.value.user_data
    end

    def user_data=(user_data : Void*)
      @this.value.user_data = user_data
    end

    def fonts : ImFontAtlas
      ImFontAtlas.new(@this.value.fonts)
    end

    def fonts=(fonts : ImFontAtlas)
      @this.value.fonts = fonts
    end

    def font_global_scale : Float32
      @this.value.font_global_scale
    end

    def font_global_scale=(font_global_scale : Float32)
      @this.value.font_global_scale = font_global_scale
    end

    def font_allow_user_scaling : Bool
      @this.value.font_allow_user_scaling
    end

    def font_allow_user_scaling=(font_allow_user_scaling : Bool)
      @this.value.font_allow_user_scaling = font_allow_user_scaling
    end

    def font_default : ImFont
      ImFont.new(@this.value.font_default)
    end

    def font_default=(font_default : ImFont)
      @this.value.font_default = font_default
    end

    def display_framebuffer_scale : ImVec2
      @this.value.display_framebuffer_scale
    end

    def display_framebuffer_scale=(display_framebuffer_scale : ImVec2)
      @this.value.display_framebuffer_scale = display_framebuffer_scale
    end

    def mouse_draw_cursor : Bool
      @this.value.mouse_draw_cursor
    end

    def mouse_draw_cursor=(mouse_draw_cursor : Bool)
      @this.value.mouse_draw_cursor = mouse_draw_cursor
    end

    def config_mac_osx_behaviors : Bool
      @this.value.config_mac_osx_behaviors
    end

    def config_mac_osx_behaviors=(config_mac_osx_behaviors : Bool)
      @this.value.config_mac_osx_behaviors = config_mac_osx_behaviors
    end

    def config_input_text_cursor_blink : Bool
      @this.value.config_input_text_cursor_blink
    end

    def config_input_text_cursor_blink=(config_input_text_cursor_blink : Bool)
      @this.value.config_input_text_cursor_blink = config_input_text_cursor_blink
    end

    def config_windows_resize_from_edges : Bool
      @this.value.config_windows_resize_from_edges
    end

    def config_windows_resize_from_edges=(config_windows_resize_from_edges : Bool)
      @this.value.config_windows_resize_from_edges = config_windows_resize_from_edges
    end

    def config_windows_move_from_title_bar_only : Bool
      @this.value.config_windows_move_from_title_bar_only
    end

    def config_windows_move_from_title_bar_only=(config_windows_move_from_title_bar_only : Bool)
      @this.value.config_windows_move_from_title_bar_only = config_windows_move_from_title_bar_only
    end

    def config_windows_memory_compact_timer : Float32
      @this.value.config_windows_memory_compact_timer
    end

    def config_windows_memory_compact_timer=(config_windows_memory_compact_timer : Float32)
      @this.value.config_windows_memory_compact_timer = config_windows_memory_compact_timer
    end

    def backend_platform_name : String
      String.new(@this.value.backend_platform_name)
    end

    def backend_platform_name=(backend_platform_name : String)
      @this.value.backend_platform_name = backend_platform_name
    end

    def backend_renderer_name : String
      String.new(@this.value.backend_renderer_name)
    end

    def backend_renderer_name=(backend_renderer_name : String)
      @this.value.backend_renderer_name = backend_renderer_name
    end

    def backend_platform_user_data : Void*
      @this.value.backend_platform_user_data
    end

    def backend_platform_user_data=(backend_platform_user_data : Void*)
      @this.value.backend_platform_user_data = backend_platform_user_data
    end

    def backend_renderer_user_data : Void*
      @this.value.backend_renderer_user_data
    end

    def backend_renderer_user_data=(backend_renderer_user_data : Void*)
      @this.value.backend_renderer_user_data = backend_renderer_user_data
    end

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

    def mouse_pos : ImVec2
      @this.value.mouse_pos
    end

    def mouse_pos=(mouse_pos : ImVec2)
      @this.value.mouse_pos = mouse_pos
    end

    def mouse_down : Bool*
      @this.value.mouse_down.to_slice
    end

    def mouse_down=(mouse_down : Bool*)
      @this.value.mouse_down = mouse_down
    end

    def mouse_wheel : Float32
      @this.value.mouse_wheel
    end

    def mouse_wheel=(mouse_wheel : Float32)
      @this.value.mouse_wheel = mouse_wheel
    end

    def mouse_wheel_h : Float32
      @this.value.mouse_wheel_h
    end

    def mouse_wheel_h=(mouse_wheel_h : Float32)
      @this.value.mouse_wheel_h = mouse_wheel_h
    end

    def key_ctrl : Bool
      @this.value.key_ctrl
    end

    def key_ctrl=(key_ctrl : Bool)
      @this.value.key_ctrl = key_ctrl
    end

    def key_shift : Bool
      @this.value.key_shift
    end

    def key_shift=(key_shift : Bool)
      @this.value.key_shift = key_shift
    end

    def key_alt : Bool
      @this.value.key_alt
    end

    def key_alt=(key_alt : Bool)
      @this.value.key_alt = key_alt
    end

    def key_super : Bool
      @this.value.key_super
    end

    def key_super=(key_super : Bool)
      @this.value.key_super = key_super
    end

    def keys_down : Bool*
      @this.value.keys_down.to_slice
    end

    def keys_down=(keys_down : Bool*)
      @this.value.keys_down = keys_down
    end

    def nav_inputs : Float32*
      @this.value.nav_inputs.to_slice
    end

    def nav_inputs=(nav_inputs : Float32*)
      @this.value.nav_inputs = nav_inputs
    end

    def want_capture_mouse : Bool
      @this.value.want_capture_mouse
    end

    def want_capture_mouse=(want_capture_mouse : Bool)
      @this.value.want_capture_mouse = want_capture_mouse
    end

    def want_capture_keyboard : Bool
      @this.value.want_capture_keyboard
    end

    def want_capture_keyboard=(want_capture_keyboard : Bool)
      @this.value.want_capture_keyboard = want_capture_keyboard
    end

    def want_text_input : Bool
      @this.value.want_text_input
    end

    def want_text_input=(want_text_input : Bool)
      @this.value.want_text_input = want_text_input
    end

    def want_set_mouse_pos : Bool
      @this.value.want_set_mouse_pos
    end

    def want_set_mouse_pos=(want_set_mouse_pos : Bool)
      @this.value.want_set_mouse_pos = want_set_mouse_pos
    end

    def want_save_ini_settings : Bool
      @this.value.want_save_ini_settings
    end

    def want_save_ini_settings=(want_save_ini_settings : Bool)
      @this.value.want_save_ini_settings = want_save_ini_settings
    end

    def nav_active : Bool
      @this.value.nav_active
    end

    def nav_active=(nav_active : Bool)
      @this.value.nav_active = nav_active
    end

    def nav_visible : Bool
      @this.value.nav_visible
    end

    def nav_visible=(nav_visible : Bool)
      @this.value.nav_visible = nav_visible
    end

    def framerate : Float32
      @this.value.framerate
    end

    def framerate=(framerate : Float32)
      @this.value.framerate = framerate
    end

    def metrics_render_vertices : Int32
      @this.value.metrics_render_vertices
    end

    def metrics_render_vertices=(metrics_render_vertices : Int32)
      @this.value.metrics_render_vertices = metrics_render_vertices
    end

    def metrics_render_indices : Int32
      @this.value.metrics_render_indices
    end

    def metrics_render_indices=(metrics_render_indices : Int32)
      @this.value.metrics_render_indices = metrics_render_indices
    end

    def metrics_render_windows : Int32
      @this.value.metrics_render_windows
    end

    def metrics_render_windows=(metrics_render_windows : Int32)
      @this.value.metrics_render_windows = metrics_render_windows
    end

    def metrics_active_windows : Int32
      @this.value.metrics_active_windows
    end

    def metrics_active_windows=(metrics_active_windows : Int32)
      @this.value.metrics_active_windows = metrics_active_windows
    end

    def metrics_active_allocations : Int32
      @this.value.metrics_active_allocations
    end

    def metrics_active_allocations=(metrics_active_allocations : Int32)
      @this.value.metrics_active_allocations = metrics_active_allocations
    end

    def mouse_delta : ImVec2
      @this.value.mouse_delta
    end

    def mouse_delta=(mouse_delta : ImVec2)
      @this.value.mouse_delta = mouse_delta
    end

    def key_mods : ImGuiKeyModFlags
      @this.value.key_mods
    end

    def key_mods=(key_mods : ImGuiKeyModFlags)
      @this.value.key_mods = key_mods
    end

    def mouse_pos_prev : ImVec2
      @this.value.mouse_pos_prev
    end

    def mouse_pos_prev=(mouse_pos_prev : ImVec2)
      @this.value.mouse_pos_prev = mouse_pos_prev
    end

    def mouse_clicked_pos : ImVec2*
      @this.value.mouse_clicked_pos.to_slice
    end

    def mouse_clicked_pos=(mouse_clicked_pos : ImVec2*)
      @this.value.mouse_clicked_pos = mouse_clicked_pos
    end

    def mouse_clicked_time : Float64*
      @this.value.mouse_clicked_time.to_slice
    end

    def mouse_clicked_time=(mouse_clicked_time : Float64*)
      @this.value.mouse_clicked_time = mouse_clicked_time
    end

    def mouse_clicked : Bool*
      @this.value.mouse_clicked.to_slice
    end

    def mouse_clicked=(mouse_clicked : Bool*)
      @this.value.mouse_clicked = mouse_clicked
    end

    def mouse_double_clicked : Bool*
      @this.value.mouse_double_clicked.to_slice
    end

    def mouse_double_clicked=(mouse_double_clicked : Bool*)
      @this.value.mouse_double_clicked = mouse_double_clicked
    end

    def mouse_released : Bool*
      @this.value.mouse_released.to_slice
    end

    def mouse_released=(mouse_released : Bool*)
      @this.value.mouse_released = mouse_released
    end

    def mouse_down_owned : Bool*
      @this.value.mouse_down_owned.to_slice
    end

    def mouse_down_owned=(mouse_down_owned : Bool*)
      @this.value.mouse_down_owned = mouse_down_owned
    end

    def mouse_down_was_double_click : Bool*
      @this.value.mouse_down_was_double_click.to_slice
    end

    def mouse_down_was_double_click=(mouse_down_was_double_click : Bool*)
      @this.value.mouse_down_was_double_click = mouse_down_was_double_click
    end

    def mouse_down_duration : Float32*
      @this.value.mouse_down_duration.to_slice
    end

    def mouse_down_duration=(mouse_down_duration : Float32*)
      @this.value.mouse_down_duration = mouse_down_duration
    end

    def mouse_down_duration_prev : Float32*
      @this.value.mouse_down_duration_prev.to_slice
    end

    def mouse_down_duration_prev=(mouse_down_duration_prev : Float32*)
      @this.value.mouse_down_duration_prev = mouse_down_duration_prev
    end

    def mouse_drag_max_distance_abs : ImVec2*
      @this.value.mouse_drag_max_distance_abs.to_slice
    end

    def mouse_drag_max_distance_abs=(mouse_drag_max_distance_abs : ImVec2*)
      @this.value.mouse_drag_max_distance_abs = mouse_drag_max_distance_abs
    end

    def mouse_drag_max_distance_sqr : Float32*
      @this.value.mouse_drag_max_distance_sqr.to_slice
    end

    def mouse_drag_max_distance_sqr=(mouse_drag_max_distance_sqr : Float32*)
      @this.value.mouse_drag_max_distance_sqr = mouse_drag_max_distance_sqr
    end

    def keys_down_duration : Float32*
      @this.value.keys_down_duration.to_slice
    end

    def keys_down_duration=(keys_down_duration : Float32*)
      @this.value.keys_down_duration = keys_down_duration
    end

    def keys_down_duration_prev : Float32*
      @this.value.keys_down_duration_prev.to_slice
    end

    def keys_down_duration_prev=(keys_down_duration_prev : Float32*)
      @this.value.keys_down_duration_prev = keys_down_duration_prev
    end

    def nav_inputs_down_duration : Float32*
      @this.value.nav_inputs_down_duration.to_slice
    end

    def nav_inputs_down_duration=(nav_inputs_down_duration : Float32*)
      @this.value.nav_inputs_down_duration = nav_inputs_down_duration
    end

    def nav_inputs_down_duration_prev : Float32*
      @this.value.nav_inputs_down_duration_prev.to_slice
    end

    def nav_inputs_down_duration_prev=(nav_inputs_down_duration_prev : Float32*)
      @this.value.nav_inputs_down_duration_prev = nav_inputs_down_duration_prev
    end

    def pen_pressure : Float32
      @this.value.pen_pressure
    end

    def pen_pressure=(pen_pressure : Float32)
      @this.value.pen_pressure = pen_pressure
    end

    def input_queue_surrogate : ImWchar16
      @this.value.input_queue_surrogate
    end

    def input_queue_surrogate=(input_queue_surrogate : ImWchar16)
      @this.value.input_queue_surrogate = input_queue_surrogate
    end

    def input_queue_characters : LibImGui::ImVector(ImWchar)
      @this.value.input_queue_characters
    end

    def input_queue_characters=(input_queue_characters : LibImGui::ImVector(ImWchar))
      @this.value.input_queue_characters = input_queue_characters
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
    include DirectClassType(LibImGui::ImGuiInputTextCallbackData)

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

    def insert_chars(pos : Int32, text : Slice(UInt8) | String) : Void
      LibImGui.ImGuiInputTextCallbackData_InsertChars(self, pos, text, (text.to_unsafe + text.bytesize))
    end
  end

  alias ImGuiInputTextState = LibImGui::ImGuiInputTextState
  alias ImGuiItemHoveredDataBackup = LibImGui::ImGuiItemHoveredDataBackup

  class ImGuiListClipper
    include DirectClassType(LibImGui::ImGuiListClipper)

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

  alias ImGuiMenuColumns = LibImGui::ImGuiMenuColumns
  alias ImGuiNavMoveResult = LibImGui::ImGuiNavMoveResult
  alias ImGuiNextItemData = LibImGui::ImGuiNextItemData
  alias ImGuiNextWindowData = LibImGui::ImGuiNextWindowData

  class ImGuiOnceUponAFrame
    include DirectClassType(LibImGui::ImGuiOnceUponAFrame)

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

  struct ImGuiPayload
    include StructClassType(LibImGui::ImGuiPayload)

    def data : Void*
      @this.value.data
    end

    def data=(data : Void*)
      @this.value.data = data
    end

    def data_size : Int32
      @this.value.data_size
    end

    def data_size=(data_size : Int32)
      @this.value.data_size = data_size
    end

    def source_id : ImGuiID
      @this.value.source_id
    end

    def source_id=(source_id : ImGuiID)
      @this.value.source_id = source_id
    end

    def source_parent_id : ImGuiID
      @this.value.source_parent_id
    end

    def source_parent_id=(source_parent_id : ImGuiID)
      @this.value.source_parent_id = source_parent_id
    end

    def data_frame_count : Int32
      @this.value.data_frame_count
    end

    def data_frame_count=(data_frame_count : Int32)
      @this.value.data_frame_count = data_frame_count
    end

    def data_type : LibC::Char*
      @this.value.data_type.to_slice
    end

    def data_type=(data_type : LibC::Char*)
      @this.value.data_type = data_type
    end

    def preview : Bool
      @this.value.preview
    end

    def preview=(preview : Bool)
      @this.value.preview = preview
    end

    def delivery : Bool
      @this.value.delivery
    end

    def delivery=(delivery : Bool)
      @this.value.delivery = delivery
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

  alias ImGuiPopupData = LibImGui::ImGuiPopupData
  alias ImGuiPtrOrIndex = LibImGui::ImGuiPtrOrIndex
  alias ImGuiSettingsHandler = LibImGui::ImGuiSettingsHandler
  alias ImGuiShrinkWidthItem = LibImGui::ImGuiShrinkWidthItem

  class ImGuiSizeCallbackData
    include DirectClassType(LibImGui::ImGuiSizeCallbackData)

    def user_data : Void*
      @this.user_data
    end

    def user_data=(user_data : Void*)
      @this.user_data = user_data
    end

    def pos : ImVec2
      @this.pos
    end

    def pos=(pos : ImVec2)
      @this.pos = pos
    end

    def current_size : ImVec2
      @this.current_size
    end

    def current_size=(current_size : ImVec2)
      @this.current_size = current_size
    end

    def desired_size : ImVec2
      @this.desired_size
    end

    def desired_size=(desired_size : ImVec2)
      @this.desired_size = desired_size
    end
  end

  class ImGuiStorage
    include DirectClassType(LibImGui::ImGuiStorage)

    def data : LibImGui::ImVector(LibImGui::ImGuiStoragePair)
      @this.data
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

    def get_void_ptr_ref(key : ImGuiID, default_val : Void* = Pointer(Void).null) : Void*
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

  alias ImGuiStoragePair = LibImGui::ImGuiStoragePair

  struct ImGuiStyle
    include StructClassType(LibImGui::ImGuiStyle)

    def alpha : Float32
      @this.value.alpha
    end

    def alpha=(alpha : Float32)
      @this.value.alpha = alpha
    end

    def window_padding : ImVec2
      @this.value.window_padding
    end

    def window_padding=(window_padding : ImVec2)
      @this.value.window_padding = window_padding
    end

    def window_rounding : Float32
      @this.value.window_rounding
    end

    def window_rounding=(window_rounding : Float32)
      @this.value.window_rounding = window_rounding
    end

    def window_border_size : Float32
      @this.value.window_border_size
    end

    def window_border_size=(window_border_size : Float32)
      @this.value.window_border_size = window_border_size
    end

    def window_min_size : ImVec2
      @this.value.window_min_size
    end

    def window_min_size=(window_min_size : ImVec2)
      @this.value.window_min_size = window_min_size
    end

    def window_title_align : ImVec2
      @this.value.window_title_align
    end

    def window_title_align=(window_title_align : ImVec2)
      @this.value.window_title_align = window_title_align
    end

    def window_menu_button_position : ImGuiDir
      @this.value.window_menu_button_position
    end

    def window_menu_button_position=(window_menu_button_position : ImGuiDir)
      @this.value.window_menu_button_position = window_menu_button_position
    end

    def child_rounding : Float32
      @this.value.child_rounding
    end

    def child_rounding=(child_rounding : Float32)
      @this.value.child_rounding = child_rounding
    end

    def child_border_size : Float32
      @this.value.child_border_size
    end

    def child_border_size=(child_border_size : Float32)
      @this.value.child_border_size = child_border_size
    end

    def popup_rounding : Float32
      @this.value.popup_rounding
    end

    def popup_rounding=(popup_rounding : Float32)
      @this.value.popup_rounding = popup_rounding
    end

    def popup_border_size : Float32
      @this.value.popup_border_size
    end

    def popup_border_size=(popup_border_size : Float32)
      @this.value.popup_border_size = popup_border_size
    end

    def frame_padding : ImVec2
      @this.value.frame_padding
    end

    def frame_padding=(frame_padding : ImVec2)
      @this.value.frame_padding = frame_padding
    end

    def frame_rounding : Float32
      @this.value.frame_rounding
    end

    def frame_rounding=(frame_rounding : Float32)
      @this.value.frame_rounding = frame_rounding
    end

    def frame_border_size : Float32
      @this.value.frame_border_size
    end

    def frame_border_size=(frame_border_size : Float32)
      @this.value.frame_border_size = frame_border_size
    end

    def item_spacing : ImVec2
      @this.value.item_spacing
    end

    def item_spacing=(item_spacing : ImVec2)
      @this.value.item_spacing = item_spacing
    end

    def item_inner_spacing : ImVec2
      @this.value.item_inner_spacing
    end

    def item_inner_spacing=(item_inner_spacing : ImVec2)
      @this.value.item_inner_spacing = item_inner_spacing
    end

    def touch_extra_padding : ImVec2
      @this.value.touch_extra_padding
    end

    def touch_extra_padding=(touch_extra_padding : ImVec2)
      @this.value.touch_extra_padding = touch_extra_padding
    end

    def indent_spacing : Float32
      @this.value.indent_spacing
    end

    def indent_spacing=(indent_spacing : Float32)
      @this.value.indent_spacing = indent_spacing
    end

    def columns_min_spacing : Float32
      @this.value.columns_min_spacing
    end

    def columns_min_spacing=(columns_min_spacing : Float32)
      @this.value.columns_min_spacing = columns_min_spacing
    end

    def scrollbar_size : Float32
      @this.value.scrollbar_size
    end

    def scrollbar_size=(scrollbar_size : Float32)
      @this.value.scrollbar_size = scrollbar_size
    end

    def scrollbar_rounding : Float32
      @this.value.scrollbar_rounding
    end

    def scrollbar_rounding=(scrollbar_rounding : Float32)
      @this.value.scrollbar_rounding = scrollbar_rounding
    end

    def grab_min_size : Float32
      @this.value.grab_min_size
    end

    def grab_min_size=(grab_min_size : Float32)
      @this.value.grab_min_size = grab_min_size
    end

    def grab_rounding : Float32
      @this.value.grab_rounding
    end

    def grab_rounding=(grab_rounding : Float32)
      @this.value.grab_rounding = grab_rounding
    end

    def tab_rounding : Float32
      @this.value.tab_rounding
    end

    def tab_rounding=(tab_rounding : Float32)
      @this.value.tab_rounding = tab_rounding
    end

    def tab_border_size : Float32
      @this.value.tab_border_size
    end

    def tab_border_size=(tab_border_size : Float32)
      @this.value.tab_border_size = tab_border_size
    end

    def tab_min_width_for_unselected_close_button : Float32
      @this.value.tab_min_width_for_unselected_close_button
    end

    def tab_min_width_for_unselected_close_button=(tab_min_width_for_unselected_close_button : Float32)
      @this.value.tab_min_width_for_unselected_close_button = tab_min_width_for_unselected_close_button
    end

    def color_button_position : ImGuiDir
      @this.value.color_button_position
    end

    def color_button_position=(color_button_position : ImGuiDir)
      @this.value.color_button_position = color_button_position
    end

    def button_text_align : ImVec2
      @this.value.button_text_align
    end

    def button_text_align=(button_text_align : ImVec2)
      @this.value.button_text_align = button_text_align
    end

    def selectable_text_align : ImVec2
      @this.value.selectable_text_align
    end

    def selectable_text_align=(selectable_text_align : ImVec2)
      @this.value.selectable_text_align = selectable_text_align
    end

    def display_window_padding : ImVec2
      @this.value.display_window_padding
    end

    def display_window_padding=(display_window_padding : ImVec2)
      @this.value.display_window_padding = display_window_padding
    end

    def display_safe_area_padding : ImVec2
      @this.value.display_safe_area_padding
    end

    def display_safe_area_padding=(display_safe_area_padding : ImVec2)
      @this.value.display_safe_area_padding = display_safe_area_padding
    end

    def mouse_cursor_scale : Float32
      @this.value.mouse_cursor_scale
    end

    def mouse_cursor_scale=(mouse_cursor_scale : Float32)
      @this.value.mouse_cursor_scale = mouse_cursor_scale
    end

    def anti_aliased_lines : Bool
      @this.value.anti_aliased_lines
    end

    def anti_aliased_lines=(anti_aliased_lines : Bool)
      @this.value.anti_aliased_lines = anti_aliased_lines
    end

    def anti_aliased_fill : Bool
      @this.value.anti_aliased_fill
    end

    def anti_aliased_fill=(anti_aliased_fill : Bool)
      @this.value.anti_aliased_fill = anti_aliased_fill
    end

    def curve_tessellation_tol : Float32
      @this.value.curve_tessellation_tol
    end

    def curve_tessellation_tol=(curve_tessellation_tol : Float32)
      @this.value.curve_tessellation_tol = curve_tessellation_tol
    end

    def circle_segment_max_error : Float32
      @this.value.circle_segment_max_error
    end

    def circle_segment_max_error=(circle_segment_max_error : Float32)
      @this.value.circle_segment_max_error = circle_segment_max_error
    end

    def colors : ImVec4*
      @this.value.colors.to_slice
    end

    def colors=(colors : ImVec4*)
      @this.value.colors = colors
    end

    def self.new : ImGuiStyle
      result = LibImGui.ImGuiStyle_ImGuiStyle
      ImGuiStyle.new(result)
    end

    def scale_all_sizes(scale_factor : Float32) : Void
      LibImGui.ImGuiStyle_ScaleAllSizes(self, scale_factor)
    end
  end

  alias ImGuiStyleMod = LibImGui::ImGuiStyleMod
  alias ImGuiTabBar = LibImGui::ImGuiTabBar
  alias ImGuiTabItem = LibImGui::ImGuiTabItem

  class ImGuiTextBuffer
    include DirectClassType(LibImGui::ImGuiTextBuffer)

    def buf : LibImGui::ImVector(LibC::Char)
      @this.buf
    end

    def buf=(buf : LibImGui::ImVector(LibC::Char))
      @this.buf = buf
    end

    def self.new : ImGuiTextBuffer
      result = LibImGui.ImGuiTextBuffer_ImGuiTextBuffer
      ImGuiTextBuffer.new(result)
    end

    def append(str : Slice(UInt8) | String) : Void
      LibImGui.ImGuiTextBuffer_append(self, str, (str.to_unsafe + str.bytesize))
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
    include DirectClassType(LibImGui::ImGuiTextFilter)

    def input_buf : LibC::Char*
      @this.input_buf.to_slice
    end

    def input_buf=(input_buf : LibC::Char*)
      @this.input_buf = input_buf
    end

    def filters : LibImGui::ImVector(LibImGui::ImGuiTextRange)
      @this.filters
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

    def pass_filter(text : Slice(UInt8) | String) : Bool
      LibImGui.ImGuiTextFilter_PassFilter(self, text, (text.to_unsafe + text.bytesize))
    end
  end

  alias ImGuiTextRange = LibImGui::ImGuiTextRange
  alias ImGuiWindow = LibImGui::ImGuiWindow
  alias ImGuiWindowSettings = LibImGui::ImGuiWindowSettings
  alias ImGuiWindowTempData = LibImGui::ImGuiWindowTempData
  alias ImRect = LibImGui::ImRect
  alias ImVec1 = LibImGui::ImVec1

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

  alias ImVec2ih = LibImGui::ImVec2ih

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

  def self.accept_drag_drop_payload(type : String, flags : ImGuiDragDropFlags = ImGuiDragDropFlags.new(0)) : ImGuiPayload
    result = LibImGui.igAcceptDragDropPayload(type, flags)
    ImGuiPayload.new(result)
  end

  def self.align_text_to_frame_padding : Void
    LibImGui.igAlignTextToFramePadding
  end

  def self.arrow_button(str_id : String, dir : ImGuiDir) : Bool
    LibImGui.igArrowButton(str_id, dir)
  end

  def self.begin_(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBegin(name, p_open, flags)
  end

  macro begin(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.begin_", 1, true, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.begin_child(str_id : String, size : ImVec2 = ImVec2.new(0, 0), border : Bool = false, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBeginChildStr(str_id, size, border, flags)
  end

  def self.begin_child(id : ImGuiID, size : ImVec2 = ImVec2.new(0, 0), border : Bool = false, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBeginChildID(id, size, border, flags)
  end

  def self.begin_child_frame(id : ImGuiID, size : ImVec2, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBeginChildFrame(id, size, flags)
  end

  def self.begin_combo(label : String, preview_value : String, flags : ImGuiComboFlags = ImGuiComboFlags.new(0)) : Bool
    LibImGui.igBeginCombo(label, preview_value, flags)
  end

  def self.begin_drag_drop_source(flags : ImGuiDragDropFlags = ImGuiDragDropFlags.new(0)) : Bool
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

  def self.begin_popup(str_id : String, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBeginPopup(str_id, flags)
  end

  def self.begin_popup_context_item(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.igBeginPopupContextItem(str_id, popup_flags)
  end

  def self.begin_popup_context_void(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.igBeginPopupContextVoid(str_id, popup_flags)
  end

  def self.begin_popup_context_window(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.igBeginPopupContextWindow(str_id, popup_flags)
  end

  def self.begin_popup_modal_(name : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiWindowFlags = ImGuiWindowFlags.new(0)) : Bool
    LibImGui.igBeginPopupModal(name, p_open, flags)
  end

  macro begin_popup_modal(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.begin_popup_modal_", 1, true, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.begin_tab_bar(str_id : String, flags : ImGuiTabBarFlags = ImGuiTabBarFlags.new(0)) : Bool
    LibImGui.igBeginTabBar(str_id, flags)
  end

  def self.begin_tab_item_(label : String, p_open : Bool* = Pointer(Bool).null, flags : ImGuiTabItemFlags = ImGuiTabItemFlags.new(0)) : Bool
    LibImGui.igBeginTabItem(label, p_open, flags)
  end

  macro begin_tab_item(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.begin_tab_item_", 1, true, {{*args}}, {{**kwargs}}) {{block}}
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

  def self.calc_text_size(text : Slice(UInt8) | String, hide_text_after_double_hash : Bool = false, wrap_width : Float32 = -1.0) : ImGui::ImVec2
    LibImGui.igCalcTextSize(out p_out, text, (text.to_unsafe + text.bytesize), hide_text_after_double_hash, wrap_width)
    p_out
  end

  def self.capture_keyboard_from_app(want_capture_keyboard_value : Bool = true) : Void
    LibImGui.igCaptureKeyboardFromApp(want_capture_keyboard_value)
  end

  def self.capture_mouse_from_app(want_capture_mouse_value : Bool = true) : Void
    LibImGui.igCaptureMouseFromApp(want_capture_mouse_value)
  end

  def self.checkbox_(label : String, v : Bool*) : Bool
    LibImGui.igCheckbox(label, v)
  end

  macro checkbox(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.checkbox_", 1, true, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.checkbox_flags_(label : String, flags : UInt32*, flags_value : UInt32) : Bool
    LibImGui.igCheckboxFlags(label, flags, flags_value)
  end

  macro checkbox_flags(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.checkbox_flags_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.close_current_popup : Void
    LibImGui.igCloseCurrentPopup
  end

  def self.collapsing_header_(label : String, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.igCollapsingHeaderTreeNodeFlags(label, flags)
  end

  def self.collapsing_header_(label : String, p_open : Bool*, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.igCollapsingHeaderBoolPtr(label, p_open, flags)
  end

  macro collapsing_header(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.collapsing_header_", 1, true, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.color_button(desc_id : String, col : ImVec4, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
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

  def self.color_edit3_(label : String, col : ImVec4* | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.igColorEdit3(label, col.as(Float32*), flags)
  end

  macro color_edit3(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.color_edit3_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.color_edit4_(label : String, col : ImVec4* | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.igColorEdit4(label, col.as(Float32*), flags)
  end

  macro color_edit4(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.color_edit4_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.color_picker3_(label : String, col : ImVec4* | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0)) : Bool
    LibImGui.igColorPicker3(label, col.as(Float32*), flags)
  end

  macro color_picker3(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.color_picker3_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.color_picker4_(label : String, col : ImVec4* | Float32*, flags : ImGuiColorEditFlags = ImGuiColorEditFlags.new(0), ref_col : Float32* = Pointer(Float32).null) : Bool
    LibImGui.igColorPicker4(label, col.as(Float32*), flags, ref_col)
  end

  macro color_picker4(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.color_picker4_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.columns(count : Int32 = 1, id : String? = nil, border : Bool = true) : Void
    LibImGui.igColumns(count, id, border)
  end

  def self.combo_(label : String, current_item : Int32*, items : LibC::Char**, items_count : Int32, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.igComboStr_arr(label, current_item, items, items_count, popup_max_height_in_items)
  end

  macro combo(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.combo_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.combo_(label : String, current_item : Int32*, items_separated_by_zeros : String, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.igComboStr(label, current_item, items_separated_by_zeros, popup_max_height_in_items)
  end

  macro combo(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.combo_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.combo_(label : String, current_item : Int32*, items_getter : (Void*, Int32, LibC::Char**) -> Bool, data : Void*, items_count : Int32, popup_max_height_in_items : Int32 = -1) : Bool
    LibImGui.igComboFnBoolPtr(label, current_item, items_getter, data, items_count, popup_max_height_in_items)
  end

  macro combo(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.combo_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.create_context(shared_font_atlas : ImFontAtlas? = nil) : ImGuiContext
    result = LibImGui.igCreateContext(shared_font_atlas)
    result.value
  end

  def self.debug_check_version_and_data_layout(version_str : String, sz_io : LibC::SizeT, sz_style : LibC::SizeT, sz_vec2 : LibC::SizeT, sz_vec4 : LibC::SizeT, sz_drawvert : LibC::SizeT, sz_drawidx : LibC::SizeT) : Bool
    LibImGui.igDebugCheckVersionAndDataLayout(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx)
  end

  def self.destroy_context(ctx : ImGuiContext? = nil) : Void
    LibImGui.igDestroyContext(ctx)
  end

  def self.drag_float_(label : String, v : Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", power : Float32 = 1.0) : Bool
    LibImGui.igDragFloat(label, v, v_speed, v_min, v_max, format, power)
  end

  macro drag_float(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_float_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.drag_float2_(label : String, v : ImVec2* | Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", power : Float32 = 1.0) : Bool
    LibImGui.igDragFloat2(label, v.as(Float32*), v_speed, v_min, v_max, format, power)
  end

  macro drag_float2(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_float2_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.drag_float3_(label : String, v : Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", power : Float32 = 1.0) : Bool
    LibImGui.igDragFloat3(label, v, v_speed, v_min, v_max, format, power)
  end

  macro drag_float3(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_float3_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.drag_float4_(label : String, v : ImVec4* | Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", power : Float32 = 1.0) : Bool
    LibImGui.igDragFloat4(label, v.as(Float32*), v_speed, v_min, v_max, format, power)
  end

  macro drag_float4(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_float4_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.drag_float_range2_(label : String, v_current_min : Float32*, v_current_max : Float32*, v_speed : Float32 = 1.0, v_min : Float32 = 0.0, v_max : Float32 = 0.0, format : String = "%.3f", format_max : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igDragFloatRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, power)
  end

  macro drag_float_range2(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_float_range2_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.drag_int_(label : String, v : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d") : Bool
    LibImGui.igDragInt(label, v, v_speed, v_min, v_max, format)
  end

  macro drag_int(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_int_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.drag_int2_(label : String, v : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d") : Bool
    LibImGui.igDragInt2(label, v, v_speed, v_min, v_max, format)
  end

  macro drag_int2(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_int2_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.drag_int3_(label : String, v : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d") : Bool
    LibImGui.igDragInt3(label, v, v_speed, v_min, v_max, format)
  end

  macro drag_int3(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_int3_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.drag_int4_(label : String, v : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d") : Bool
    LibImGui.igDragInt4(label, v, v_speed, v_min, v_max, format)
  end

  macro drag_int4(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_int4_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.drag_int_range2_(label : String, v_current_min : Int32*, v_current_max : Int32*, v_speed : Float32 = 1.0, v_min : Int32 = 0, v_max : Int32 = 0, format : String = "%d", format_max : String? = nil) : Bool
    LibImGui.igDragIntRange2(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max)
  end

  macro drag_int_range2(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_int_range2_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  def self.drag_scalar_(label : String, p_data : {{t}}*, v_speed : Float32, p_min : {{t}}? = nil, p_max : {{t}}? = nil, format : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igDragScalar(label, ImGuiDataType::{{k.id}}, p_data, v_speed, p_min && (p_min_ = p_min; pointerof(p_min_)), p_max && (p_max_ = p_max; pointerof(p_max_)), format, power)
  end
  {% end %}

  macro drag_scalar(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_scalar_", 2, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  def self.drag_scalar_n_(label : String, p_data : {{t}}*, components : Int32, v_speed : Float32, p_min : {{t}}* = Pointer({{t}}).null, p_max : {{t}}* = Pointer({{t}}).null, format : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igDragScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, v_speed, p_min, p_max, format, power)
  end
  {% end %}

  macro drag_scalar_n(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.drag_scalar_n_", 2, false, {{*args}}, {{**kwargs}}) {{block}}
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
    result.value
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
    result.value
  end

  def self.get_font : ImFont
    result = LibImGui.igGetFont
    ImFont.new(result)
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

  def self.get_id(str_id_begin : Slice(UInt8) | String) : ImGuiID
    LibImGui.igGetIDStrStr(str_id_begin, (str_id_begin.to_unsafe + str_id_begin.bytesize))
  end

  def self.get_id(ptr_id : Reference | Void*) : ImGuiID
    LibImGui.igGetIDPtr(ptr_id.as(Void*))
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

  def self.get_mouse_drag_delta(button : ImGuiMouseButton = ImGuiMouseButton.new(0), lock_threshold : Float32 = -1.0) : ImGui::ImVec2
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

  def self.input_double_(label : String, v : Float64*, step : Float64 = 0.0, step_fast : Float64 = 0.0, format : String = "%.6f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputDouble(label, v, step, step_fast, format, flags)
  end

  macro input_double(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_double_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.input_float_(label : String, v : Float32*, step : Float32 = 0.0, step_fast : Float32 = 0.0, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputFloat(label, v, step, step_fast, format, flags)
  end

  macro input_float(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_float_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.input_float2_(label : String, v : ImVec2* | Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputFloat2(label, v.as(Float32*), format, flags)
  end

  macro input_float2(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_float2_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.input_float3_(label : String, v : Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputFloat3(label, v, format, flags)
  end

  macro input_float3(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_float3_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.input_float4_(label : String, v : ImVec4* | Float32*, format : String = "%.3f", flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputFloat4(label, v.as(Float32*), format, flags)
  end

  macro input_float4(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_float4_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.input_int_(label : String, v : Int32*, step : Int32 = 1, step_fast : Int32 = 100, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputInt(label, v, step, step_fast, flags)
  end

  macro input_int(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_int_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.input_int2_(label : String, v : Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputInt2(label, v, flags)
  end

  macro input_int2(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_int2_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.input_int3_(label : String, v : Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputInt3(label, v, flags)
  end

  macro input_int3(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_int3_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.input_int4_(label : String, v : Int32*, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputInt4(label, v, flags)
  end

  macro input_int4(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_int4_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  def self.input_scalar_(label : String, p_data : {{t}}*, p_step : {{t}}? = nil, p_step_fast : {{t}}? = nil, format : String? = nil, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputScalar(label, ImGuiDataType::{{k.id}}, p_data, p_step && (p_step_ = p_step; pointerof(p_step_)), p_step_fast && (p_step_fast_ = p_step_fast; pointerof(p_step_fast_)), format, flags)
  end
  {% end %}

  macro input_scalar(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_scalar_", 2, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  def self.input_scalar_n_(label : String, p_data : {{t}}*, components : Int32, p_step : {{t}}* = Pointer({{t}}).null, p_step_fast : {{t}}* = Pointer({{t}}).null, format : String? = nil, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0)) : Bool
    LibImGui.igInputScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, p_step, p_step_fast, format, flags)
  end
  {% end %}

  macro input_scalar_n(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_scalar_n_", 2, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.input_text_(label : String, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.igInputText(label, buf, buf_size, flags, callback, user_data)
  end

  macro input_text(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_text_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.input_text_multiline_(label : String, buf : LibC::Char*, buf_size : LibC::SizeT, size : ImVec2 = ImVec2.new(0, 0), flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.igInputTextMultiline(label, buf, buf_size, size, flags, callback, user_data)
  end

  macro input_text_multiline(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_text_multiline_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.input_text_with_hint_(label : String, hint : String, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGuiInputTextFlags = ImGuiInputTextFlags.new(0), callback : ImGuiInputTextCallback? = nil, user_data : Void* = Pointer(Void).null) : Bool
    LibImGui.igInputTextWithHint(label, hint, buf, buf_size, flags, callback, user_data)
  end

  macro input_text_with_hint(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.input_text_with_hint_", 2, false, {{*args}}, {{**kwargs}}) {{block}}
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

  def self.is_item_clicked(mouse_button : ImGuiMouseButton = ImGuiMouseButton.new(0)) : Bool
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

  def self.is_item_hovered(flags : ImGuiHoveredFlags = ImGuiHoveredFlags.new(0)) : Bool
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

  def self.is_mouse_pos_valid(mouse_pos : ImVec2* = Pointer(ImVec2).null) : Bool
    LibImGui.igIsMousePosValid(mouse_pos)
  end

  def self.is_mouse_released(button : ImGuiMouseButton) : Bool
    LibImGui.igIsMouseReleased(button)
  end

  def self.is_popup_open(str_id : String, flags : ImGuiPopupFlags = ImGuiPopupFlags.new(0)) : Bool
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

  def self.is_window_focused(flags : ImGuiFocusedFlags = ImGuiFocusedFlags.new(0)) : Bool
    LibImGui.igIsWindowFocused(flags)
  end

  def self.is_window_hovered(flags : ImGuiHoveredFlags = ImGuiHoveredFlags.new(0)) : Bool
    LibImGui.igIsWindowHovered(flags)
  end

  def self.label_text(label : String, fmt : String, *args) : Void
    LibImGui.igLabelText(label, fmt, *args)
  end

  def self.list_box_(label : String, current_item : Int32*, items : LibC::Char**, items_count : Int32, height_in_items : Int32 = -1) : Bool
    LibImGui.igListBoxStr_arr(label, current_item, items, items_count, height_in_items)
  end

  macro list_box(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.list_box_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.list_box_(label : String, current_item : Int32*, items_getter : (Void*, Int32, LibC::Char**) -> Bool, data : Void*, items_count : Int32, height_in_items : Int32 = -1) : Bool
    LibImGui.igListBoxFnBoolPtr(label, current_item, items_getter, data, items_count, height_in_items)
  end

  macro list_box(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.list_box_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
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

  def self.menu_item_(label : String, shortcut : String? = nil, selected : Bool = false, enabled : Bool = true) : Bool
    LibImGui.igMenuItemBool(label, shortcut, selected, enabled)
  end

  def self.menu_item_(label : String, shortcut : String, p_selected : Bool*, enabled : Bool = true) : Bool
    LibImGui.igMenuItemBoolPtr(label, shortcut, p_selected, enabled)
  end

  macro menu_item(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.menu_item_", 2, true, {{*args}}, {{**kwargs}}) {{block}}
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

  def self.open_popup(str_id : String, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(0)) : Void
    LibImGui.igOpenPopup(str_id, popup_flags)
  end

  def self.open_popup_context_item(str_id : String? = nil, popup_flags : ImGuiPopupFlags = ImGuiPopupFlags.new(1)) : Bool
    LibImGui.igOpenPopupContextItem(str_id, popup_flags)
  end

  def self.plot_histogram(label : String, values : Float32*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0), stride : Int32 = sizeof(Float32)) : Void
    LibImGui.igPlotHistogramFloatPtr(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
  end

  def self.plot_histogram(label : String, values_getter : (Void*, Int32) -> Float32, data : Void*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.igPlotHistogramFnFloatPtr(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size)
  end

  def self.plot_lines(label : String, values : Float32*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0), stride : Int32 = sizeof(Float32)) : Void
    LibImGui.igPlotLinesFloatPtr(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride)
  end

  def self.plot_lines(label : String, values_getter : (Void*, Int32) -> Float32, data : Void*, values_count : Int32, values_offset : Int32 = 0, overlay_text : String? = nil, scale_min : Float32 = Float32::MAX, scale_max : Float32 = Float32::MAX, graph_size : ImVec2 = ImVec2.new(0, 0)) : Void
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

  def self.push_font(font : ImFont) : Void
    LibImGui.igPushFont(font)
  end

  def self.push_id(str_id : String) : Void
    LibImGui.igPushIDStr(str_id)
  end

  def self.push_id(str_id_begin : Slice(UInt8) | String) : Void
    LibImGui.igPushIDStrStr(str_id_begin, (str_id_begin.to_unsafe + str_id_begin.bytesize))
  end

  def self.push_id(ptr_id : Reference | Void*) : Void
    LibImGui.igPushIDPtr(ptr_id.as(Void*))
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

  def self.radio_button_(label : String, active : Bool) : Bool
    LibImGui.igRadioButtonBool(label, active)
  end

  def self.radio_button_(label : String, v : Int32*, v_button : Int32) : Bool
    LibImGui.igRadioButtonIntPtr(label, v, v_button)
  end

  macro radio_button(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.radio_button_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.render : Void
    LibImGui.igRender
  end

  def self.reset_mouse_drag_delta(button : ImGuiMouseButton = ImGuiMouseButton.new(0)) : Void
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

  def self.selectable_(label : String, selected : Bool = false, flags : ImGuiSelectableFlags = ImGuiSelectableFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igSelectableBool(label, selected, flags, size)
  end

  def self.selectable_(label : String, p_selected : Bool*, flags : ImGuiSelectableFlags = ImGuiSelectableFlags.new(0), size : ImVec2 = ImVec2.new(0, 0)) : Bool
    LibImGui.igSelectableBoolPtr(label, p_selected, flags, size)
  end

  macro selectable(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.selectable_", 1, true, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.separator : Void
    LibImGui.igSeparator
  end

  def self.set_allocator_functions(alloc_func : (LibC::SizeT, Void*) -> Void*, free_func : (Void*, Void*) -> Void, user_data : Void* = Pointer(Void).null) : Void
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

  def self.set_drag_drop_payload_(type : String, data : Void*, sz : LibC::SizeT, cond : ImGuiCond = ImGuiCond.new(0)) : Bool
    LibImGui.igSetDragDropPayload(type, data, sz, cond)
  end

  macro set_drag_drop_payload(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.set_drag_drop_payload_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
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

  def self.set_next_item_open(is_open : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetNextItemOpen(is_open, cond)
  end

  def self.set_next_item_width(item_width : Float32) : Void
    LibImGui.igSetNextItemWidth(item_width)
  end

  def self.set_next_window_bg_alpha(alpha : Float32) : Void
    LibImGui.igSetNextWindowBgAlpha(alpha)
  end

  def self.set_next_window_collapsed(collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetNextWindowCollapsed(collapsed, cond)
  end

  def self.set_next_window_content_size(size : ImVec2) : Void
    LibImGui.igSetNextWindowContentSize(size)
  end

  def self.set_next_window_focus : Void
    LibImGui.igSetNextWindowFocus
  end

  def self.set_next_window_pos(pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0), pivot : ImVec2 = ImVec2.new(0, 0)) : Void
    LibImGui.igSetNextWindowPos(pos, cond, pivot)
  end

  def self.set_next_window_size(size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetNextWindowSize(size, cond)
  end

  def self.set_next_window_size_constraints(size_min : ImVec2, size_max : ImVec2, custom_callback : ImGuiSizeCallback? = nil, custom_callback_data : Void* = Pointer(Void).null) : Void
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

  def self.set_window_collapsed(collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetWindowCollapsedBool(collapsed, cond)
  end

  def self.set_window_collapsed(name : String, collapsed : Bool, cond : ImGuiCond = ImGuiCond.new(0)) : Void
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

  def self.set_window_pos(pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetWindowPosVec2(pos, cond)
  end

  def self.set_window_pos(name : String, pos : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetWindowPosStr(name, pos, cond)
  end

  def self.set_window_size(size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetWindowSizeVec2(size, cond)
  end

  def self.set_window_size(name : String, size : ImVec2, cond : ImGuiCond = ImGuiCond.new(0)) : Void
    LibImGui.igSetWindowSizeStr(name, size, cond)
  end

  def self.show_about_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.igShowAboutWindow(p_open)
  end

  def self.show_demo_window(p_open : Bool* = Pointer(Bool).null) : Void
    LibImGui.igShowDemoWindow(p_open)
  end

  def self.show_font_selector(label : String) : Void
    LibImGui.igShowFontSelector(label)
  end

  def self.show_metrics_window(p_open : Bool* = Pointer(Bool).null) : Void
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

  def self.slider_angle_(label : String, v_rad : Float32*, v_degrees_min : Float32 = -360.0, v_degrees_max : Float32 = +360.0, format : String = "%.0 deg") : Bool
    LibImGui.igSliderAngle(label, v_rad, v_degrees_min, v_degrees_max, format)
  end

  macro slider_angle(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.slider_angle_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.slider_float_(label : String, v : Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", power : Float32 = 1.0) : Bool
    LibImGui.igSliderFloat(label, v, v_min, v_max, format, power)
  end

  macro slider_float(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.slider_float_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.slider_float2_(label : String, v : ImVec2* | Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", power : Float32 = 1.0) : Bool
    LibImGui.igSliderFloat2(label, v.as(Float32*), v_min, v_max, format, power)
  end

  macro slider_float2(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.slider_float2_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.slider_float3_(label : String, v : Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", power : Float32 = 1.0) : Bool
    LibImGui.igSliderFloat3(label, v, v_min, v_max, format, power)
  end

  macro slider_float3(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.slider_float3_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.slider_float4_(label : String, v : ImVec4* | Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", power : Float32 = 1.0) : Bool
    LibImGui.igSliderFloat4(label, v.as(Float32*), v_min, v_max, format, power)
  end

  macro slider_float4(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.slider_float4_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.slider_int_(label : String, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d") : Bool
    LibImGui.igSliderInt(label, v, v_min, v_max, format)
  end

  macro slider_int(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.slider_int_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.slider_int2_(label : String, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d") : Bool
    LibImGui.igSliderInt2(label, v, v_min, v_max, format)
  end

  macro slider_int2(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.slider_int2_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.slider_int3_(label : String, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d") : Bool
    LibImGui.igSliderInt3(label, v, v_min, v_max, format)
  end

  macro slider_int3(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.slider_int3_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.slider_int4_(label : String, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d") : Bool
    LibImGui.igSliderInt4(label, v, v_min, v_max, format)
  end

  macro slider_int4(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.slider_int4_", 1, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  def self.slider_scalar_(label : String, p_data : {{t}}*, p_min : {{t}}, p_max : {{t}}, format : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igSliderScalar(label, ImGuiDataType::{{k.id}}, p_data, p_min && (p_min_ = p_min; pointerof(p_min_)), p_max && (p_max_ = p_max; pointerof(p_max_)), format, power)
  end
  {% end %}

  macro slider_scalar(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.slider_scalar_", 2, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  def self.slider_scalar_n_(label : String, p_data : {{t}}*, components : Int32, p_min : {{t}}*, p_max : {{t}}*, format : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igSliderScalarN(label, ImGuiDataType::{{k.id}}, p_data, components, p_min, p_max, format, power)
  end
  {% end %}

  macro slider_scalar_n(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.slider_scalar_n_", 2, false, {{*args}}, {{**kwargs}}) {{block}}
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

  def self.text_unformatted(text : Slice(UInt8) | String) : Void
    LibImGui.igTextUnformatted(text, (text.to_unsafe + text.bytesize))
  end

  def self.text_wrapped(fmt : String, *args) : Void
    LibImGui.igTextWrapped(fmt, *args)
  end

  def self.tree_node_(label : String) : Bool
    LibImGui.igTreeNodeStr(label)
  end

  def self.tree_node_(str_id : String, fmt : String, *args) : Bool
    LibImGui.igTreeNodeStrStr(str_id, fmt, *args)
  end

  def self.tree_node_(ptr_id : Reference | Void*, fmt : String, *args) : Bool
    LibImGui.igTreeNodePtr(ptr_id.as(Void*), fmt, *args)
  end

  macro tree_node(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.tree_node_", 0, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.tree_node_ex_(label : String, flags : ImGuiTreeNodeFlags = ImGuiTreeNodeFlags.new(0)) : Bool
    LibImGui.igTreeNodeExStr(label, flags)
  end

  def self.tree_node_ex_(str_id : String, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Bool
    LibImGui.igTreeNodeExStrStr(str_id, flags, fmt, *args)
  end

  def self.tree_node_ex_(ptr_id : Reference | Void*, flags : ImGuiTreeNodeFlags, fmt : String, *args) : Bool
    LibImGui.igTreeNodeExPtr(ptr_id.as(Void*), flags, fmt, *args)
  end

  macro tree_node_ex(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.tree_node_ex_", 0, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.tree_pop : Void
    LibImGui.igTreePop
  end

  def self.tree_push(str_id : String) : Void
    LibImGui.igTreePushStr(str_id)
  end

  def self.tree_push(ptr_id : Reference | Void* = Pointer(Reference | Void).null) : Void
    LibImGui.igTreePushPtr(ptr_id.as(Void*))
  end

  def self.unindent(indent_w : Float32 = 0.0) : Void
    LibImGui.igUnindent(indent_w)
  end

  def self.v_slider_float_(label : String, size : ImVec2, v : Float32*, v_min : Float32, v_max : Float32, format : String = "%.3f", power : Float32 = 1.0) : Bool
    LibImGui.igVSliderFloat(label, size, v, v_min, v_max, format, power)
  end

  macro v_slider_float(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.v_slider_float_", 2, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  def self.v_slider_int_(label : String, size : ImVec2, v : Int32*, v_min : Int32, v_max : Int32, format : String = "%d") : Bool
    LibImGui.igVSliderInt(label, size, v, v_min, v_max, format)
  end

  macro v_slider_int(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.v_slider_int_", 2, false, {{*args}}, {{**kwargs}}) {{block}}
  end

  {% for k, t in {S8: Int8, U8: UInt8, S16: Int16, U16: UInt16, S32: Int32, U32: UInt32, S64: Int64, U64: UInt64, Float: Float32, Double: Float64} %}
  def self.v_slider_scalar_(label : String, size : ImVec2, p_data : {{t}}*, p_min : {{t}}, p_max : {{t}}, format : String? = nil, power : Float32 = 1.0) : Bool
    LibImGui.igVSliderScalar(label, size, ImGuiDataType::{{k.id}}, p_data, p_min && (p_min_ = p_min; pointerof(p_min_)), p_max && (p_max_ = p_max; pointerof(p_max_)), format, power)
  end
  {% end %}

  macro v_slider_scalar(*args, **kwargs, &block)
    ::ImGui._pointer_wrapper("::ImGui.v_slider_scalar_", 3, false, {{*args}}, {{**kwargs}}) {{block}}
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
