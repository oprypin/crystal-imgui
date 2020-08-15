require "./custom"
require "./types"

@[Link("cimgui")]
lib LibImGui
  fun ImColor_HSV(pOut : ImGui::ImColor*, self : ImGui::ImColor*, h : LibC::Float, s : LibC::Float, v : LibC::Float, a : LibC::Float) : Void
  fun ImColor_ImColorNil : ImGui::ImColor*
  fun ImColor_ImColorInt(r : LibC::Int, g : LibC::Int, b : LibC::Int, a : LibC::Int) : ImGui::ImColor*
  fun ImColor_ImColorU32(rgba : UInt32) : ImGui::ImColor*
  fun ImColor_ImColorFloat(r : LibC::Float, g : LibC::Float, b : LibC::Float, a : LibC::Float) : ImGui::ImColor*
  fun ImColor_ImColorVec4(col : ImGui::ImVec4) : ImGui::ImColor*
  fun ImColor_SetHSV(self : ImGui::ImColor*, h : LibC::Float, s : LibC::Float, v : LibC::Float, a : LibC::Float) : Void
  fun ImColor_destroy(self : ImGui::ImColor*) : Void
  fun ImDrawCmd_ImDrawCmd : ImGui::ImDrawCmd*
  fun ImDrawCmd_destroy(self : ImGui::ImDrawCmd*) : Void
  fun ImDrawData_Clear(self : ImGui::ImDrawData*) : Void
  fun ImDrawData_DeIndexAllBuffers(self : ImGui::ImDrawData*) : Void
  fun ImDrawData_ImDrawData : ImGui::ImDrawData*
  fun ImDrawData_ScaleClipRects(self : ImGui::ImDrawData*, fb_scale : ImGui::ImVec2) : Void
  fun ImDrawData_destroy(self : ImGui::ImDrawData*) : Void
  fun ImDrawListSharedData_destroy(self : ImGui::ImDrawListSharedData*) : Void
  fun ImDrawListSplitter_Clear(self : ImGui::ImDrawListSplitter*) : Void
  fun ImDrawListSplitter_ClearFreeMemory(self : ImGui::ImDrawListSplitter*) : Void
  fun ImDrawListSplitter_ImDrawListSplitter : ImGui::ImDrawListSplitter*
  fun ImDrawListSplitter_Merge(self : ImGui::ImDrawListSplitter*, draw_list : ImGui::ImDrawList*) : Void
  fun ImDrawListSplitter_SetCurrentChannel(self : ImGui::ImDrawListSplitter*, draw_list : ImGui::ImDrawList*, channel_idx : LibC::Int) : Void
  fun ImDrawListSplitter_Split(self : ImGui::ImDrawListSplitter*, draw_list : ImGui::ImDrawList*, count : LibC::Int) : Void
  fun ImDrawListSplitter_destroy(self : ImGui::ImDrawListSplitter*) : Void
  fun ImDrawList_AddBezierCurve(self : ImGui::ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float, num_segments : LibC::Int) : Void
  fun ImDrawList_AddCallback(self : ImGui::ImDrawList*, callback : ImGui::ImDrawCallback, callback_data : Void*) : Void
  fun ImDrawList_AddCircle(self : ImGui::ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int, thickness : LibC::Float) : Void
  fun ImDrawList_AddCircleFilled(self : ImGui::ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int) : Void
  fun ImDrawList_AddConvexPolyFilled(self : ImGui::ImDrawList*, points : ImGui::ImVec2*, num_points : LibC::Int, col : UInt32) : Void
  fun ImDrawList_AddDrawCmd(self : ImGui::ImDrawList*) : Void
  fun ImDrawList_AddImage(self : ImGui::ImDrawList*, user_texture_id : ImGui::ImTextureID, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, uv_min : ImGui::ImVec2, uv_max : ImGui::ImVec2, col : UInt32) : Void
  fun ImDrawList_AddImageQuad(self : ImGui::ImDrawList*, user_texture_id : ImGui::ImTextureID, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, uv1 : ImGui::ImVec2, uv2 : ImGui::ImVec2, uv3 : ImGui::ImVec2, uv4 : ImGui::ImVec2, col : UInt32) : Void
  fun ImDrawList_AddImageRounded(self : ImGui::ImDrawList*, user_texture_id : ImGui::ImTextureID, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, uv_min : ImGui::ImVec2, uv_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags) : Void
  fun ImDrawList_AddLine(self : ImGui::ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float) : Void
  fun ImDrawList_AddNgon(self : ImGui::ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int, thickness : LibC::Float) : Void
  fun ImDrawList_AddNgonFilled(self : ImGui::ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int) : Void
  fun ImDrawList_AddPolyline(self : ImGui::ImDrawList*, points : ImGui::ImVec2*, num_points : LibC::Int, col : UInt32, closed : Bool, thickness : LibC::Float) : Void
  fun ImDrawList_AddQuad(self : ImGui::ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float) : Void
  fun ImDrawList_AddQuadFilled(self : ImGui::ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32) : Void
  fun ImDrawList_AddRect(self : ImGui::ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags, thickness : LibC::Float) : Void
  fun ImDrawList_AddRectFilled(self : ImGui::ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags) : Void
  fun ImDrawList_AddRectFilledMultiColor(self : ImGui::ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col_upr_left : UInt32, col_upr_right : UInt32, col_bot_right : UInt32, col_bot_left : UInt32) : Void
  fun ImDrawList_AddTextVec2(self : ImGui::ImDrawList*, pos : ImGui::ImVec2, col : UInt32, text_begin : LibC::Char*, text_end : LibC::Char*) : Void
  fun ImDrawList_AddTextFontPtr(self : ImGui::ImDrawList*, font : ImGui::ImFont*, font_size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, text_begin : LibC::Char*, text_end : LibC::Char*, wrap_width : LibC::Float, cpu_fine_clip_rect : ImGui::ImVec4*) : Void
  fun ImDrawList_AddTriangle(self : ImGui::ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float) : Void
  fun ImDrawList_AddTriangleFilled(self : ImGui::ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, col : UInt32) : Void
  fun ImDrawList_ChannelsMerge(self : ImGui::ImDrawList*) : Void
  fun ImDrawList_ChannelsSetCurrent(self : ImGui::ImDrawList*, n : LibC::Int) : Void
  fun ImDrawList_ChannelsSplit(self : ImGui::ImDrawList*, count : LibC::Int) : Void
  fun ImDrawList_CloneOutput(self : ImGui::ImDrawList*) : ImGui::ImDrawList*
  fun ImDrawList_GetClipRectMax(pOut : ImGui::ImVec2*, self : ImGui::ImDrawList*) : Void
  fun ImDrawList_GetClipRectMin(pOut : ImGui::ImVec2*, self : ImGui::ImDrawList*) : Void
  fun ImDrawList_ImDrawList(shared_data : ImGui::ImDrawListSharedData*) : ImGui::ImDrawList*
  fun ImDrawList_PathArcTo(self : ImGui::ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, a_min : LibC::Float, a_max : LibC::Float, num_segments : LibC::Int) : Void
  fun ImDrawList_PathArcToFast(self : ImGui::ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, a_min_of_12 : LibC::Int, a_max_of_12 : LibC::Int) : Void
  fun ImDrawList_PathBezierCurveTo(self : ImGui::ImDrawList*, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, num_segments : LibC::Int) : Void
  fun ImDrawList_PathClear(self : ImGui::ImDrawList*) : Void
  fun ImDrawList_PathFillConvex(self : ImGui::ImDrawList*, col : UInt32) : Void
  fun ImDrawList_PathLineTo(self : ImGui::ImDrawList*, pos : ImGui::ImVec2) : Void
  fun ImDrawList_PathLineToMergeDuplicate(self : ImGui::ImDrawList*, pos : ImGui::ImVec2) : Void
  fun ImDrawList_PathRect(self : ImGui::ImDrawList*, rect_min : ImGui::ImVec2, rect_max : ImGui::ImVec2, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags) : Void
  fun ImDrawList_PathStroke(self : ImGui::ImDrawList*, col : UInt32, closed : Bool, thickness : LibC::Float) : Void
  fun ImDrawList_PopClipRect(self : ImGui::ImDrawList*) : Void
  fun ImDrawList_PopTextureID(self : ImGui::ImDrawList*) : Void
  fun ImDrawList_PrimQuadUV(self : ImGui::ImDrawList*, a : ImGui::ImVec2, b : ImGui::ImVec2, c : ImGui::ImVec2, d : ImGui::ImVec2, uv_a : ImGui::ImVec2, uv_b : ImGui::ImVec2, uv_c : ImGui::ImVec2, uv_d : ImGui::ImVec2, col : UInt32) : Void
  fun ImDrawList_PrimRect(self : ImGui::ImDrawList*, a : ImGui::ImVec2, b : ImGui::ImVec2, col : UInt32) : Void
  fun ImDrawList_PrimRectUV(self : ImGui::ImDrawList*, a : ImGui::ImVec2, b : ImGui::ImVec2, uv_a : ImGui::ImVec2, uv_b : ImGui::ImVec2, col : UInt32) : Void
  fun ImDrawList_PrimReserve(self : ImGui::ImDrawList*, idx_count : LibC::Int, vtx_count : LibC::Int) : Void
  fun ImDrawList_PrimUnreserve(self : ImGui::ImDrawList*, idx_count : LibC::Int, vtx_count : LibC::Int) : Void
  fun ImDrawList_PrimVtx(self : ImGui::ImDrawList*, pos : ImGui::ImVec2, uv : ImGui::ImVec2, col : UInt32) : Void
  fun ImDrawList_PrimWriteIdx(self : ImGui::ImDrawList*, idx : ImGui::ImDrawIdx) : Void
  fun ImDrawList_PrimWriteVtx(self : ImGui::ImDrawList*, pos : ImGui::ImVec2, uv : ImGui::ImVec2, col : UInt32) : Void
  fun ImDrawList_PushClipRect(self : ImGui::ImDrawList*, clip_rect_min : ImGui::ImVec2, clip_rect_max : ImGui::ImVec2, intersect_with_current_clip_rect : Bool) : Void
  fun ImDrawList_PushClipRectFullScreen(self : ImGui::ImDrawList*) : Void
  fun ImDrawList_PushTextureID(self : ImGui::ImDrawList*, texture_id : ImGui::ImTextureID) : Void
  fun ImDrawList_destroy(self : ImGui::ImDrawList*) : Void
  fun ImFontAtlasCustomRect_ImFontAtlasCustomRect : ImGui::ImFontAtlasCustomRect*
  fun ImFontAtlasCustomRect_IsPacked(self : ImGui::ImFontAtlasCustomRect*) : Bool
  fun ImFontAtlasCustomRect_destroy(self : ImGui::ImFontAtlasCustomRect*) : Void
  fun ImFontAtlas_AddCustomRectFontGlyph(self : ImGui::ImFontAtlas*, font : ImGui::ImFont*, id : ImGui::ImWchar, width : LibC::Int, height : LibC::Int, advance_x : LibC::Float, offset : ImGui::ImVec2) : LibC::Int
  fun ImFontAtlas_AddCustomRectRegular(self : ImGui::ImFontAtlas*, width : LibC::Int, height : LibC::Int) : LibC::Int
  fun ImFontAtlas_AddFont(self : ImGui::ImFontAtlas*, font_cfg : ImGui::ImFontConfig*) : ImGui::ImFont*
  fun ImFontAtlas_AddFontDefault(self : ImGui::ImFontAtlas*, font_cfg : ImGui::ImFontConfig*) : ImGui::ImFont*
  fun ImFontAtlas_AddFontFromFileTTF(self : ImGui::ImFontAtlas*, filename : LibC::Char*, size_pixels : LibC::Float, font_cfg : ImGui::ImFontConfig*, glyph_ranges : ImGui::ImWchar*) : ImGui::ImFont*
  fun ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self : ImGui::ImFontAtlas*, compressed_font_data_base85 : LibC::Char*, size_pixels : LibC::Float, font_cfg : ImGui::ImFontConfig*, glyph_ranges : ImGui::ImWchar*) : ImGui::ImFont*
  fun ImFontAtlas_AddFontFromMemoryCompressedTTF(self : ImGui::ImFontAtlas*, compressed_font_data : Void*, compressed_font_size : LibC::Int, size_pixels : LibC::Float, font_cfg : ImGui::ImFontConfig*, glyph_ranges : ImGui::ImWchar*) : ImGui::ImFont*
  fun ImFontAtlas_AddFontFromMemoryTTF(self : ImGui::ImFontAtlas*, font_data : Void*, font_size : LibC::Int, size_pixels : LibC::Float, font_cfg : ImGui::ImFontConfig*, glyph_ranges : ImGui::ImWchar*) : ImGui::ImFont*
  fun ImFontAtlas_Build(self : ImGui::ImFontAtlas*) : Bool
  fun ImFontAtlas_CalcCustomRectUV(self : ImGui::ImFontAtlas*, rect : ImGui::ImFontAtlasCustomRect*, out_uv_min : ImGui::ImVec2*, out_uv_max : ImGui::ImVec2*) : Void
  fun ImFontAtlas_Clear(self : ImGui::ImFontAtlas*) : Void
  fun ImFontAtlas_ClearFonts(self : ImGui::ImFontAtlas*) : Void
  fun ImFontAtlas_ClearInputData(self : ImGui::ImFontAtlas*) : Void
  fun ImFontAtlas_ClearTexData(self : ImGui::ImFontAtlas*) : Void
  fun ImFontAtlas_GetCustomRectByIndex(self : ImGui::ImFontAtlas*, index : LibC::Int) : ImGui::ImFontAtlasCustomRect*
  fun ImFontAtlas_GetGlyphRangesChineseFull(self : ImGui::ImFontAtlas*) : ImGui::ImWchar*
  fun ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self : ImGui::ImFontAtlas*) : ImGui::ImWchar*
  fun ImFontAtlas_GetGlyphRangesCyrillic(self : ImGui::ImFontAtlas*) : ImGui::ImWchar*
  fun ImFontAtlas_GetGlyphRangesDefault(self : ImGui::ImFontAtlas*) : ImGui::ImWchar*
  fun ImFontAtlas_GetGlyphRangesJapanese(self : ImGui::ImFontAtlas*) : ImGui::ImWchar*
  fun ImFontAtlas_GetGlyphRangesKorean(self : ImGui::ImFontAtlas*) : ImGui::ImWchar*
  fun ImFontAtlas_GetGlyphRangesThai(self : ImGui::ImFontAtlas*) : ImGui::ImWchar*
  fun ImFontAtlas_GetGlyphRangesVietnamese(self : ImGui::ImFontAtlas*) : ImGui::ImWchar*
  fun ImFontAtlas_GetMouseCursorTexData(self : ImGui::ImFontAtlas*, cursor : ImGui::ImGuiMouseCursor, out_offset : ImGui::ImVec2*, out_size : ImGui::ImVec2*, out_uv_border : ImGui::ImVec2[2], out_uv_fill : ImGui::ImVec2[2]) : Bool
  fun ImFontAtlas_GetTexDataAsAlpha8(self : ImGui::ImFontAtlas*, out_pixels : LibC::UChar**, out_width : LibC::Int*, out_height : LibC::Int*, out_bytes_per_pixel : LibC::Int*) : Void
  fun ImFontAtlas_GetTexDataAsRGBA32(self : ImGui::ImFontAtlas*, out_pixels : LibC::UChar**, out_width : LibC::Int*, out_height : LibC::Int*, out_bytes_per_pixel : LibC::Int*) : Void
  fun ImFontAtlas_ImFontAtlas : ImGui::ImFontAtlas*
  fun ImFontAtlas_IsBuilt(self : ImGui::ImFontAtlas*) : Bool
  fun ImFontAtlas_SetTexID(self : ImGui::ImFontAtlas*, id : ImGui::ImTextureID) : Void
  fun ImFontAtlas_destroy(self : ImGui::ImFontAtlas*) : Void
  fun ImFontConfig_ImFontConfig : ImGui::ImFontConfig*
  fun ImFontConfig_destroy(self : ImGui::ImFontConfig*) : Void
  fun ImFontGlyphRangesBuilder_AddChar(self : ImGui::ImFontGlyphRangesBuilder*, c : ImGui::ImWchar) : Void
  fun ImFontGlyphRangesBuilder_AddRanges(self : ImGui::ImFontGlyphRangesBuilder*, ranges : ImGui::ImWchar*) : Void
  fun ImFontGlyphRangesBuilder_AddText(self : ImGui::ImFontGlyphRangesBuilder*, text : LibC::Char*, text_end : LibC::Char*) : Void
  fun ImFontGlyphRangesBuilder_BuildRanges(self : ImGui::ImFontGlyphRangesBuilder*, out_ranges : Void*) : Void
  fun ImFontGlyphRangesBuilder_Clear(self : ImGui::ImFontGlyphRangesBuilder*) : Void
  fun ImFontGlyphRangesBuilder_GetBit(self : ImGui::ImFontGlyphRangesBuilder*, n : LibC::SizeT) : Bool
  fun ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder : ImGui::ImFontGlyphRangesBuilder*
  fun ImFontGlyphRangesBuilder_SetBit(self : ImGui::ImFontGlyphRangesBuilder*, n : LibC::SizeT) : Void
  fun ImFontGlyphRangesBuilder_destroy(self : ImGui::ImFontGlyphRangesBuilder*) : Void
  fun ImFont_AddGlyph(self : ImGui::ImFont*, c : ImGui::ImWchar, x0 : LibC::Float, y0 : LibC::Float, x1 : LibC::Float, y1 : LibC::Float, u0 : LibC::Float, v0 : LibC::Float, u1 : LibC::Float, v1 : LibC::Float, advance_x : LibC::Float) : Void
  fun ImFont_AddRemapChar(self : ImGui::ImFont*, dst : ImGui::ImWchar, src : ImGui::ImWchar, overwrite_dst : Bool) : Void
  fun ImFont_BuildLookupTable(self : ImGui::ImFont*) : Void
  fun ImFont_CalcTextSizeA(pOut : ImGui::ImVec2*, self : ImGui::ImFont*, size : LibC::Float, max_width : LibC::Float, wrap_width : LibC::Float, text_begin : LibC::Char*, text_end : LibC::Char*, remaining : LibC::Char**) : Void
  fun ImFont_CalcWordWrapPositionA(self : ImGui::ImFont*, scale : LibC::Float, text : LibC::Char*, text_end : LibC::Char*, wrap_width : LibC::Float) : LibC::Char*
  fun ImFont_ClearOutputData(self : ImGui::ImFont*) : Void
  fun ImFont_FindGlyph(self : ImGui::ImFont*, c : ImGui::ImWchar) : ImGui::ImFontGlyph*
  fun ImFont_FindGlyphNoFallback(self : ImGui::ImFont*, c : ImGui::ImWchar) : ImGui::ImFontGlyph*
  fun ImFont_GetCharAdvance(self : ImGui::ImFont*, c : ImGui::ImWchar) : LibC::Float
  fun ImFont_GetDebugName(self : ImGui::ImFont*) : LibC::Char*
  fun ImFont_GrowIndex(self : ImGui::ImFont*, new_size : LibC::Int) : Void
  fun ImFont_ImFont : ImGui::ImFont*
  fun ImFont_IsGlyphRangeUnused(self : ImGui::ImFont*, c_begin : LibC::UInt, c_last : LibC::UInt) : Bool
  fun ImFont_IsLoaded(self : ImGui::ImFont*) : Bool
  fun ImFont_RenderChar(self : ImGui::ImFont*, draw_list : ImGui::ImDrawList*, size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, c : ImGui::ImWchar) : Void
  fun ImFont_RenderText(self : ImGui::ImFont*, draw_list : ImGui::ImDrawList*, size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, clip_rect : ImGui::ImVec4, text_begin : LibC::Char*, text_end : LibC::Char*, wrap_width : LibC::Float, cpu_fine_clip : Bool) : Void
  fun ImFont_SetFallbackChar(self : ImGui::ImFont*, c : ImGui::ImWchar) : Void
  fun ImFont_SetGlyphVisible(self : ImGui::ImFont*, c : ImGui::ImWchar, visible : Bool) : Void
  fun ImFont_destroy(self : ImGui::ImFont*) : Void
  fun ImGuiColumnData_destroy(self : ImGui::ImGuiColumnData*) : Void
  fun ImGuiColumns_destroy(self : ImGui::ImGuiColumns*) : Void
  fun ImGuiContext_destroy(self : ImGui::ImGuiContext*) : Void
  fun ImGuiIO_AddInputCharacter(self : ImGui::ImGuiIO*, c : LibC::UInt) : Void
  fun ImGuiIO_AddInputCharacterUTF16(self : ImGui::ImGuiIO*, c : ImGui::ImWchar16) : Void
  fun ImGuiIO_AddInputCharactersUTF8(self : ImGui::ImGuiIO*, str : LibC::Char*) : Void
  fun ImGuiIO_ClearInputCharacters(self : ImGui::ImGuiIO*) : Void
  fun ImGuiIO_ImGuiIO : ImGui::ImGuiIO*
  fun ImGuiIO_destroy(self : ImGui::ImGuiIO*) : Void
  fun ImGuiInputTextCallbackData_DeleteChars(self : ImGui::ImGuiInputTextCallbackData*, pos : LibC::Int, bytes_count : LibC::Int) : Void
  fun ImGuiInputTextCallbackData_HasSelection(self : ImGui::ImGuiInputTextCallbackData*) : Bool
  fun ImGuiInputTextCallbackData_ImGuiInputTextCallbackData : ImGui::ImGuiInputTextCallbackData*
  fun ImGuiInputTextCallbackData_InsertChars(self : ImGui::ImGuiInputTextCallbackData*, pos : LibC::Int, text : LibC::Char*, text_end : LibC::Char*) : Void
  fun ImGuiInputTextCallbackData_destroy(self : ImGui::ImGuiInputTextCallbackData*) : Void
  fun ImGuiInputTextState_destroy(self : ImGui::ImGuiInputTextState*) : Void
  fun ImGuiItemHoveredDataBackup_destroy(self : ImGui::ImGuiItemHoveredDataBackup*) : Void
  fun ImGuiListClipper_Begin(self : ImGui::ImGuiListClipper*, items_count : LibC::Int, items_height : LibC::Float) : Void
  fun ImGuiListClipper_End(self : ImGui::ImGuiListClipper*) : Void
  fun ImGuiListClipper_ImGuiListClipper(items_count : LibC::Int, items_height : LibC::Float) : ImGui::ImGuiListClipper*
  fun ImGuiListClipper_Step(self : ImGui::ImGuiListClipper*) : Bool
  fun ImGuiListClipper_destroy(self : ImGui::ImGuiListClipper*) : Void
  fun ImGuiMenuColumns_destroy(self : ImGui::ImGuiMenuColumns*) : Void
  fun ImGuiNavMoveResult_destroy(self : ImGui::ImGuiNavMoveResult*) : Void
  fun ImGuiNextItemData_destroy(self : ImGui::ImGuiNextItemData*) : Void
  fun ImGuiNextWindowData_destroy(self : ImGui::ImGuiNextWindowData*) : Void
  fun ImGuiOnceUponAFrame_ImGuiOnceUponAFrame : ImGui::ImGuiOnceUponAFrame*
  fun ImGuiOnceUponAFrame_destroy(self : ImGui::ImGuiOnceUponAFrame*) : Void
  fun ImGuiPayload_Clear(self : ImGui::ImGuiPayload*) : Void
  fun ImGuiPayload_ImGuiPayload : ImGui::ImGuiPayload*
  fun ImGuiPayload_IsDataType(self : ImGui::ImGuiPayload*, type : LibC::Char*) : Bool
  fun ImGuiPayload_IsDelivery(self : ImGui::ImGuiPayload*) : Bool
  fun ImGuiPayload_IsPreview(self : ImGui::ImGuiPayload*) : Bool
  fun ImGuiPayload_destroy(self : ImGui::ImGuiPayload*) : Void
  fun ImGuiPopupData_destroy(self : ImGui::ImGuiPopupData*) : Void
  fun ImGuiPtrOrIndex_destroy(self : ImGui::ImGuiPtrOrIndex*) : Void
  fun ImGuiSettingsHandler_destroy(self : ImGui::ImGuiSettingsHandler*) : Void
  fun ImGuiStoragePair_ImGuiStoragePairInt(_key : ImGui::ImGuiID, _val_i : LibC::Int) : ImGui::ImGuiStoragePair*
  fun ImGuiStoragePair_ImGuiStoragePairFloat(_key : ImGui::ImGuiID, _val_f : LibC::Float) : ImGui::ImGuiStoragePair*
  fun ImGuiStoragePair_ImGuiStoragePairPtr(_key : ImGui::ImGuiID, _val_p : Void*) : ImGui::ImGuiStoragePair*
  fun ImGuiStoragePair_destroy(self : ImGui::ImGuiStoragePair*) : Void
  fun ImGuiStorage_BuildSortByKey(self : ImGui::ImGuiStorage*) : Void
  fun ImGuiStorage_Clear(self : ImGui::ImGuiStorage*) : Void
  fun ImGuiStorage_GetBool(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID, default_val : Bool) : Bool
  fun ImGuiStorage_GetBoolRef(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID, default_val : Bool) : Bool*
  fun ImGuiStorage_GetFloat(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID, default_val : LibC::Float) : LibC::Float
  fun ImGuiStorage_GetFloatRef(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID, default_val : LibC::Float) : LibC::Float*
  fun ImGuiStorage_GetInt(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID, default_val : LibC::Int) : LibC::Int
  fun ImGuiStorage_GetIntRef(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID, default_val : LibC::Int) : LibC::Int*
  fun ImGuiStorage_GetVoidPtr(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID) : Void*
  fun ImGuiStorage_GetVoidPtrRef(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID, default_val : Void*) : Void**
  fun ImGuiStorage_SetAllInt(self : ImGui::ImGuiStorage*, val : LibC::Int) : Void
  fun ImGuiStorage_SetBool(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID, val : Bool) : Void
  fun ImGuiStorage_SetFloat(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID, val : LibC::Float) : Void
  fun ImGuiStorage_SetInt(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID, val : LibC::Int) : Void
  fun ImGuiStorage_SetVoidPtr(self : ImGui::ImGuiStorage*, key : ImGui::ImGuiID, val : Void*) : Void
  fun ImGuiStyleMod_destroy(self : ImGui::ImGuiStyleMod*) : Void
  fun ImGuiStyle_ImGuiStyle : ImGui::ImGuiStyle*
  fun ImGuiStyle_ScaleAllSizes(self : ImGui::ImGuiStyle*, scale_factor : LibC::Float) : Void
  fun ImGuiStyle_destroy(self : ImGui::ImGuiStyle*) : Void
  fun ImGuiTabBar_destroy(self : ImGui::ImGuiTabBar*) : Void
  fun ImGuiTabItem_destroy(self : ImGui::ImGuiTabItem*) : Void
  fun ImGuiTextBuffer_ImGuiTextBuffer : ImGui::ImGuiTextBuffer*
  fun ImGuiTextBuffer_append(self : ImGui::ImGuiTextBuffer*, str : LibC::Char*, str_end : LibC::Char*) : Void
  fun ImGuiTextBuffer_appendf(self : ImGui::ImGuiTextBuffer*, fmt : LibC::Char*, ...) : Void
  fun ImGuiTextBuffer_begin(self : ImGui::ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_c_str(self : ImGui::ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_clear(self : ImGui::ImGuiTextBuffer*) : Void
  fun ImGuiTextBuffer_destroy(self : ImGui::ImGuiTextBuffer*) : Void
  fun ImGuiTextBuffer_empty(self : ImGui::ImGuiTextBuffer*) : Bool
  fun ImGuiTextBuffer_end(self : ImGui::ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_reserve(self : ImGui::ImGuiTextBuffer*, capacity : LibC::Int) : Void
  fun ImGuiTextBuffer_size(self : ImGui::ImGuiTextBuffer*) : LibC::Int
  fun ImGuiTextFilter_Build(self : ImGui::ImGuiTextFilter*) : Void
  fun ImGuiTextFilter_Clear(self : ImGui::ImGuiTextFilter*) : Void
  fun ImGuiTextFilter_Draw(self : ImGui::ImGuiTextFilter*, label : LibC::Char*, width : LibC::Float) : Bool
  fun ImGuiTextFilter_ImGuiTextFilter(default_filter : LibC::Char*) : ImGui::ImGuiTextFilter*
  fun ImGuiTextFilter_IsActive(self : ImGui::ImGuiTextFilter*) : Bool
  fun ImGuiTextFilter_PassFilter(self : ImGui::ImGuiTextFilter*, text : LibC::Char*, text_end : LibC::Char*) : Bool
  fun ImGuiTextFilter_destroy(self : ImGui::ImGuiTextFilter*) : Void
  fun ImGuiTextRange_ImGuiTextRangeNil : ImGui::ImGuiTextRange*
  fun ImGuiTextRange_ImGuiTextRangeStr(_b : LibC::Char*, _e : LibC::Char*) : ImGui::ImGuiTextRange*
  fun ImGuiTextRange_destroy(self : ImGui::ImGuiTextRange*) : Void
  fun ImGuiTextRange_empty(self : ImGui::ImGuiTextRange*) : Bool
  fun ImGuiTextRange_split(self : ImGui::ImGuiTextRange*, separator : LibC::Char, out : Void*) : Void
  fun ImGuiWindowSettings_destroy(self : ImGui::ImGuiWindowSettings*) : Void
  fun ImGuiWindowTempData_destroy(self : ImGui::ImGuiWindowTempData*) : Void
  fun ImGuiWindow_destroy(self : ImGui::ImGuiWindow*) : Void
  fun ImRect_destroy(self : ImGui::ImRect*) : Void
  fun ImVec1_destroy(self : ImGui::ImVec1*) : Void
  fun ImVec2_ImVec2Nil : ImGui::ImVec2*
  fun ImVec2_ImVec2Float(_x : LibC::Float, _y : LibC::Float) : ImGui::ImVec2*
  fun ImVec2_destroy(self : ImGui::ImVec2*) : Void
  fun ImVec2ih_destroy(self : ImGui::ImVec2ih*) : Void
  fun ImVec4_ImVec4Nil : ImGui::ImVec4*
  fun ImVec4_ImVec4Float(_x : LibC::Float, _y : LibC::Float, _z : LibC::Float, _w : LibC::Float) : ImGui::ImVec4*
  fun ImVec4_destroy(self : ImGui::ImVec4*) : Void
  fun igAcceptDragDropPayload(type : LibC::Char*, flags : ImGui::ImGuiDragDropFlags) : ImGui::ImGuiPayload*
  fun igAlignTextToFramePadding : Void
  fun igArrowButton(str_id : LibC::Char*, dir : ImGui::ImGuiDir) : Bool
  fun igBegin(name : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igBeginChildStr(str_id : LibC::Char*, size : ImGui::ImVec2, border : Bool, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igBeginChildID(id : ImGui::ImGuiID, size : ImGui::ImVec2, border : Bool, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igBeginChildFrame(id : ImGui::ImGuiID, size : ImGui::ImVec2, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igBeginCombo(label : LibC::Char*, preview_value : LibC::Char*, flags : ImGui::ImGuiComboFlags) : Bool
  fun igBeginDragDropSource(flags : ImGui::ImGuiDragDropFlags) : Bool
  fun igBeginDragDropTarget : Bool
  fun igBeginGroup : Void
  fun igBeginMainMenuBar : Bool
  fun igBeginMenu(label : LibC::Char*, enabled : Bool) : Bool
  fun igBeginMenuBar : Bool
  fun igBeginPopup(str_id : LibC::Char*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igBeginPopupContextItem(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun igBeginPopupContextVoid(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun igBeginPopupContextWindow(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun igBeginPopupModal(name : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igBeginTabBar(str_id : LibC::Char*, flags : ImGui::ImGuiTabBarFlags) : Bool
  fun igBeginTabItem(label : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiTabItemFlags) : Bool
  fun igBeginTooltip : Void
  fun igBullet : Void
  fun igBulletText(fmt : LibC::Char*, ...) : Void
  fun igButton(label : LibC::Char*, size : ImGui::ImVec2) : Bool
  fun igCalcItemWidth : LibC::Float
  fun igCalcListClipping(items_count : LibC::Int, items_height : LibC::Float, out_items_display_start : LibC::Int*, out_items_display_end : LibC::Int*) : Void
  fun igCalcTextSize(pOut : ImGui::ImVec2*, text : LibC::Char*, text_end : LibC::Char*, hide_text_after_double_hash : Bool, wrap_width : LibC::Float) : Void
  fun igCaptureKeyboardFromApp(want_capture_keyboard_value : Bool) : Void
  fun igCaptureMouseFromApp(want_capture_mouse_value : Bool) : Void
  fun igCheckbox(label : LibC::Char*, v : Bool*) : Bool
  fun igCheckboxFlags(label : LibC::Char*, flags : LibC::UInt*, flags_value : LibC::UInt) : Bool
  fun igCloseCurrentPopup : Void
  fun igCollapsingHeaderTreeNodeFlags(label : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun igCollapsingHeaderBoolPtr(label : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun igColorButton(desc_id : LibC::Char*, col : ImGui::ImVec4, flags : ImGui::ImGuiColorEditFlags, size : ImGui::ImVec2) : Bool
  fun igColorConvertFloat4ToU32(in : ImGui::ImVec4) : UInt32
  fun igColorConvertHSVtoRGB(h : LibC::Float, s : LibC::Float, v : LibC::Float, out_r : LibC::Float*, out_g : LibC::Float*, out_b : LibC::Float*) : Void
  fun igColorConvertRGBtoHSV(r : LibC::Float, g : LibC::Float, b : LibC::Float, out_h : LibC::Float*, out_s : LibC::Float*, out_v : LibC::Float*) : Void
  fun igColorConvertU32ToFloat4(pOut : ImGui::ImVec4*, in : UInt32) : Void
  fun igColorEdit3(label : LibC::Char*, col : LibC::Float[3], flags : ImGui::ImGuiColorEditFlags) : Bool
  fun igColorEdit4(label : LibC::Char*, col : LibC::Float[4], flags : ImGui::ImGuiColorEditFlags) : Bool
  fun igColorPicker3(label : LibC::Char*, col : LibC::Float[3], flags : ImGui::ImGuiColorEditFlags) : Bool
  fun igColorPicker4(label : LibC::Char*, col : LibC::Float[4], flags : ImGui::ImGuiColorEditFlags, ref_col : LibC::Float*) : Bool
  fun igColumns(count : LibC::Int, id : LibC::Char*, border : Bool) : Void
  fun igComboStr_arr(label : LibC::Char*, current_item : LibC::Int*, items : LibC::Char**, items_count : LibC::Int, popup_max_height_in_items : LibC::Int) : Bool
  fun igComboStr(label : LibC::Char*, current_item : LibC::Int*, items_separated_by_zeros : LibC::Char*, popup_max_height_in_items : LibC::Int) : Bool
  fun igComboFnBoolPtr(label : LibC::Char*, current_item : LibC::Int*, items_getter : (Void*, LibC::Int, LibC::Char**) -> Bool, data : Void*, items_count : LibC::Int, popup_max_height_in_items : LibC::Int) : Bool
  fun igCreateContext(shared_font_atlas : ImGui::ImFontAtlas*) : ImGui::ImGuiContext*
  fun igDebugCheckVersionAndDataLayout(version_str : LibC::Char*, sz_io : LibC::SizeT, sz_style : LibC::SizeT, sz_vec2 : LibC::SizeT, sz_vec4 : LibC::SizeT, sz_drawvert : LibC::SizeT, sz_drawidx : LibC::SizeT) : Bool
  fun igDestroyContext(ctx : ImGui::ImGuiContext*) : Void
  fun igDragFloat(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, power : LibC::Float) : Bool
  fun igDragFloat2(label : LibC::Char*, v : LibC::Float[2], v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, power : LibC::Float) : Bool
  fun igDragFloat3(label : LibC::Char*, v : LibC::Float[3], v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, power : LibC::Float) : Bool
  fun igDragFloat4(label : LibC::Char*, v : LibC::Float[4], v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, power : LibC::Float) : Bool
  fun igDragFloatRange2(label : LibC::Char*, v_current_min : LibC::Float*, v_current_max : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, format_max : LibC::Char*, power : LibC::Float) : Bool
  fun igDragInt(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*) : Bool
  fun igDragInt2(label : LibC::Char*, v : LibC::Int[2], v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*) : Bool
  fun igDragInt3(label : LibC::Char*, v : LibC::Int[3], v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*) : Bool
  fun igDragInt4(label : LibC::Char*, v : LibC::Int[4], v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*) : Bool
  fun igDragIntRange2(label : LibC::Char*, v_current_min : LibC::Int*, v_current_max : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, format_max : LibC::Char*) : Bool
  fun igDragScalar(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, v_speed : LibC::Float, p_min : Void*, p_max : Void*, format : LibC::Char*, power : LibC::Float) : Bool
  fun igDragScalarN(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, v_speed : LibC::Float, p_min : Void*, p_max : Void*, format : LibC::Char*, power : LibC::Float) : Bool
  fun igDummy(size : ImGui::ImVec2) : Void
  fun igEnd : Void
  fun igEndChild : Void
  fun igEndChildFrame : Void
  fun igEndCombo : Void
  fun igEndDragDropSource : Void
  fun igEndDragDropTarget : Void
  fun igEndFrame : Void
  fun igEndGroup : Void
  fun igEndMainMenuBar : Void
  fun igEndMenu : Void
  fun igEndMenuBar : Void
  fun igEndPopup : Void
  fun igEndTabBar : Void
  fun igEndTabItem : Void
  fun igEndTooltip : Void
  fun igGetBackgroundDrawList : ImGui::ImDrawList*
  fun igGetClipboardText : LibC::Char*
  fun igGetColorU32Col(idx : ImGui::ImGuiCol, alpha_mul : LibC::Float) : UInt32
  fun igGetColorU32Vec4(col : ImGui::ImVec4) : UInt32
  fun igGetColorU32U32(col : UInt32) : UInt32
  fun igGetColumnIndex : LibC::Int
  fun igGetColumnOffset(column_index : LibC::Int) : LibC::Float
  fun igGetColumnWidth(column_index : LibC::Int) : LibC::Float
  fun igGetColumnsCount : LibC::Int
  fun igGetContentRegionAvail(pOut : ImGui::ImVec2*) : Void
  fun igGetContentRegionMax(pOut : ImGui::ImVec2*) : Void
  fun igGetCurrentContext : ImGui::ImGuiContext*
  fun igGetCursorPos(pOut : ImGui::ImVec2*) : Void
  fun igGetCursorPosX : LibC::Float
  fun igGetCursorPosY : LibC::Float
  fun igGetCursorScreenPos(pOut : ImGui::ImVec2*) : Void
  fun igGetCursorStartPos(pOut : ImGui::ImVec2*) : Void
  fun igGetDragDropPayload : ImGui::ImGuiPayload*
  fun igGetDrawData : ImGui::ImDrawData*
  fun igGetDrawListSharedData : ImGui::ImDrawListSharedData*
  fun igGetFont : ImGui::ImFont*
  fun igGetFontSize : LibC::Float
  fun igGetFontTexUvWhitePixel(pOut : ImGui::ImVec2*) : Void
  fun igGetForegroundDrawListNil : ImGui::ImDrawList*
  fun igGetFrameCount : LibC::Int
  fun igGetFrameHeight : LibC::Float
  fun igGetFrameHeightWithSpacing : LibC::Float
  fun igGetIDStr(str_id : LibC::Char*) : ImGui::ImGuiID
  fun igGetIDStrStr(str_id_begin : LibC::Char*, str_id_end : LibC::Char*) : ImGui::ImGuiID
  fun igGetIDPtr(ptr_id : Void*) : ImGui::ImGuiID
  fun igGetIO : ImGui::ImGuiIO*
  fun igGetItemRectMax(pOut : ImGui::ImVec2*) : Void
  fun igGetItemRectMin(pOut : ImGui::ImVec2*) : Void
  fun igGetItemRectSize(pOut : ImGui::ImVec2*) : Void
  fun igGetKeyIndex(imgui_key : ImGui::ImGuiKey) : LibC::Int
  fun igGetKeyPressedAmount(key_index : LibC::Int, repeat_delay : LibC::Float, rate : LibC::Float) : LibC::Int
  fun igGetMouseCursor : ImGui::ImGuiMouseCursor
  fun igGetMouseDragDelta(pOut : ImGui::ImVec2*, button : ImGui::ImGuiMouseButton, lock_threshold : LibC::Float) : Void
  fun igGetMousePos(pOut : ImGui::ImVec2*) : Void
  fun igGetMousePosOnOpeningCurrentPopup(pOut : ImGui::ImVec2*) : Void
  fun igGetScrollMaxX : LibC::Float
  fun igGetScrollMaxY : LibC::Float
  fun igGetScrollX : LibC::Float
  fun igGetScrollY : LibC::Float
  fun igGetStateStorage : ImGui::ImGuiStorage*
  fun igGetStyle : ImGui::ImGuiStyle*
  fun igGetStyleColorName(idx : ImGui::ImGuiCol) : LibC::Char*
  fun igGetStyleColorVec4(idx : ImGui::ImGuiCol) : ImGui::ImVec4*
  fun igGetTextLineHeight : LibC::Float
  fun igGetTextLineHeightWithSpacing : LibC::Float
  fun igGetTime : LibC::Double
  fun igGetTreeNodeToLabelSpacing : LibC::Float
  fun igGetVersion : LibC::Char*
  fun igGetWindowContentRegionMax(pOut : ImGui::ImVec2*) : Void
  fun igGetWindowContentRegionMin(pOut : ImGui::ImVec2*) : Void
  fun igGetWindowContentRegionWidth : LibC::Float
  fun igGetWindowDrawList : ImGui::ImDrawList*
  fun igGetWindowHeight : LibC::Float
  fun igGetWindowPos(pOut : ImGui::ImVec2*) : Void
  fun igGetWindowSize(pOut : ImGui::ImVec2*) : Void
  fun igGetWindowWidth : LibC::Float
  fun igImage(user_texture_id : ImGui::ImTextureID, size : ImGui::ImVec2, uv0 : ImGui::ImVec2, uv1 : ImGui::ImVec2, tint_col : ImGui::ImVec4, border_col : ImGui::ImVec4) : Void
  fun igImageButton(user_texture_id : ImGui::ImTextureID, size : ImGui::ImVec2, uv0 : ImGui::ImVec2, uv1 : ImGui::ImVec2, frame_padding : LibC::Int, bg_col : ImGui::ImVec4, tint_col : ImGui::ImVec4) : Bool
  fun igIndent(indent_w : LibC::Float) : Void
  fun igInputDouble(label : LibC::Char*, v : LibC::Double*, step : LibC::Double, step_fast : LibC::Double, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputFloat(label : LibC::Char*, v : LibC::Float*, step : LibC::Float, step_fast : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputFloat2(label : LibC::Char*, v : LibC::Float[2], format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputFloat3(label : LibC::Char*, v : LibC::Float[3], format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputFloat4(label : LibC::Char*, v : LibC::Float[4], format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputInt(label : LibC::Char*, v : LibC::Int*, step : LibC::Int, step_fast : LibC::Int, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputInt2(label : LibC::Char*, v : LibC::Int[2], flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputInt3(label : LibC::Char*, v : LibC::Int[3], flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputInt4(label : LibC::Char*, v : LibC::Int[4], flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputScalar(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, p_step : Void*, p_step_fast : Void*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputScalarN(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, p_step : Void*, p_step_fast : Void*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputText(label : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGui::ImGuiInputTextFlags, callback : ImGui::ImGuiInputTextCallback, user_data : Void*) : Bool
  fun igInputTextMultiline(label : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, size : ImGui::ImVec2, flags : ImGui::ImGuiInputTextFlags, callback : ImGui::ImGuiInputTextCallback, user_data : Void*) : Bool
  fun igInputTextWithHint(label : LibC::Char*, hint : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGui::ImGuiInputTextFlags, callback : ImGui::ImGuiInputTextCallback, user_data : Void*) : Bool
  fun igInvisibleButton(str_id : LibC::Char*, size : ImGui::ImVec2) : Bool
  fun igIsAnyItemActive : Bool
  fun igIsAnyItemFocused : Bool
  fun igIsAnyItemHovered : Bool
  fun igIsAnyMouseDown : Bool
  fun igIsItemActivated : Bool
  fun igIsItemActive : Bool
  fun igIsItemClicked(mouse_button : ImGui::ImGuiMouseButton) : Bool
  fun igIsItemDeactivated : Bool
  fun igIsItemDeactivatedAfterEdit : Bool
  fun igIsItemEdited : Bool
  fun igIsItemFocused : Bool
  fun igIsItemHovered(flags : ImGui::ImGuiHoveredFlags) : Bool
  fun igIsItemToggledOpen : Bool
  fun igIsItemVisible : Bool
  fun igIsKeyDown(user_key_index : LibC::Int) : Bool
  fun igIsKeyPressed(user_key_index : LibC::Int, repeat : Bool) : Bool
  fun igIsKeyReleased(user_key_index : LibC::Int) : Bool
  fun igIsMouseClicked(button : ImGui::ImGuiMouseButton, repeat : Bool) : Bool
  fun igIsMouseDoubleClicked(button : ImGui::ImGuiMouseButton) : Bool
  fun igIsMouseDown(button : ImGui::ImGuiMouseButton) : Bool
  fun igIsMouseDragging(button : ImGui::ImGuiMouseButton, lock_threshold : LibC::Float) : Bool
  fun igIsMouseHoveringRect(r_min : ImGui::ImVec2, r_max : ImGui::ImVec2, clip : Bool) : Bool
  fun igIsMousePosValid(mouse_pos : ImGui::ImVec2*) : Bool
  fun igIsMouseReleased(button : ImGui::ImGuiMouseButton) : Bool
  fun igIsPopupOpenStr(str_id : LibC::Char*, flags : ImGui::ImGuiPopupFlags) : Bool
  fun igIsRectVisibleNil(size : ImGui::ImVec2) : Bool
  fun igIsRectVisibleVec2(rect_min : ImGui::ImVec2, rect_max : ImGui::ImVec2) : Bool
  fun igIsWindowAppearing : Bool
  fun igIsWindowCollapsed : Bool
  fun igIsWindowFocused(flags : ImGui::ImGuiFocusedFlags) : Bool
  fun igIsWindowHovered(flags : ImGui::ImGuiHoveredFlags) : Bool
  fun igLabelText(label : LibC::Char*, fmt : LibC::Char*, ...) : Void
  fun igListBoxStr_arr(label : LibC::Char*, current_item : LibC::Int*, items : LibC::Char**, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun igListBoxFnBoolPtr(label : LibC::Char*, current_item : LibC::Int*, items_getter : (Void*, LibC::Int, LibC::Char**) -> Bool, data : Void*, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun igListBoxFooter : Void
  fun igListBoxHeaderVec2(label : LibC::Char*, size : ImGui::ImVec2) : Bool
  fun igListBoxHeaderInt(label : LibC::Char*, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun igLoadIniSettingsFromDisk(ini_filename : LibC::Char*) : Void
  fun igLoadIniSettingsFromMemory(ini_data : LibC::Char*, ini_size : LibC::SizeT) : Void
  fun igLogButtons : Void
  fun igLogFinish : Void
  fun igLogText(fmt : LibC::Char*, ...) : Void
  fun igLogToClipboard(auto_open_depth : LibC::Int) : Void
  fun igLogToFile(auto_open_depth : LibC::Int, filename : LibC::Char*) : Void
  fun igLogToTTY(auto_open_depth : LibC::Int) : Void
  fun igMemAlloc(size : LibC::SizeT) : Void*
  fun igMemFree(ptr : Void*) : Void
  fun igMenuItemBool(label : LibC::Char*, shortcut : LibC::Char*, selected : Bool, enabled : Bool) : Bool
  fun igMenuItemBoolPtr(label : LibC::Char*, shortcut : LibC::Char*, p_selected : Bool*, enabled : Bool) : Bool
  fun igNewFrame : Void
  fun igNewLine : Void
  fun igNextColumn : Void
  fun igOpenPopup(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Void
  fun igOpenPopupContextItem(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun igPlotHistogramFloatPtr(label : LibC::Char*, values : LibC::Float*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2, stride : LibC::Int) : Void
  fun igPlotHistogramFnFloatPtr(label : LibC::Char*, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2) : Void
  fun igPlotLinesFloatPtr(label : LibC::Char*, values : LibC::Float*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2, stride : LibC::Int) : Void
  fun igPlotLinesFnFloatPtr(label : LibC::Char*, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2) : Void
  fun igPopAllowKeyboardFocus : Void
  fun igPopButtonRepeat : Void
  fun igPopClipRect : Void
  fun igPopFont : Void
  fun igPopID : Void
  fun igPopItemWidth : Void
  fun igPopStyleColor(count : LibC::Int) : Void
  fun igPopStyleVar(count : LibC::Int) : Void
  fun igPopTextWrapPos : Void
  fun igProgressBar(fraction : LibC::Float, size_arg : ImGui::ImVec2, overlay : LibC::Char*) : Void
  fun igPushAllowKeyboardFocus(allow_keyboard_focus : Bool) : Void
  fun igPushButtonRepeat(repeat : Bool) : Void
  fun igPushClipRect(clip_rect_min : ImGui::ImVec2, clip_rect_max : ImGui::ImVec2, intersect_with_current_clip_rect : Bool) : Void
  fun igPushFont(font : ImGui::ImFont*) : Void
  fun igPushIDStr(str_id : LibC::Char*) : Void
  fun igPushIDStrStr(str_id_begin : LibC::Char*, str_id_end : LibC::Char*) : Void
  fun igPushIDPtr(ptr_id : Void*) : Void
  fun igPushIDInt(int_id : LibC::Int) : Void
  fun igPushItemWidth(item_width : LibC::Float) : Void
  fun igPushStyleColorU32(idx : ImGui::ImGuiCol, col : UInt32) : Void
  fun igPushStyleColorVec4(idx : ImGui::ImGuiCol, col : ImGui::ImVec4) : Void
  fun igPushStyleVarFloat(idx : ImGui::ImGuiStyleVar, val : LibC::Float) : Void
  fun igPushStyleVarVec2(idx : ImGui::ImGuiStyleVar, val : ImGui::ImVec2) : Void
  fun igPushTextWrapPos(wrap_local_pos_x : LibC::Float) : Void
  fun igRadioButtonBool(label : LibC::Char*, active : Bool) : Bool
  fun igRadioButtonIntPtr(label : LibC::Char*, v : LibC::Int*, v_button : LibC::Int) : Bool
  fun igRender : Void
  fun igResetMouseDragDelta(button : ImGui::ImGuiMouseButton) : Void
  fun igSameLine(offset_from_start_x : LibC::Float, spacing : LibC::Float) : Void
  fun igSaveIniSettingsToDisk(ini_filename : LibC::Char*) : Void
  fun igSaveIniSettingsToMemory(out_ini_size : LibC::SizeT*) : LibC::Char*
  fun igSelectableBool(label : LibC::Char*, selected : Bool, flags : ImGui::ImGuiSelectableFlags, size : ImGui::ImVec2) : Bool
  fun igSelectableBoolPtr(label : LibC::Char*, p_selected : Bool*, flags : ImGui::ImGuiSelectableFlags, size : ImGui::ImVec2) : Bool
  fun igSeparator : Void
  fun igSetAllocatorFunctions(alloc_func : (LibC::SizeT, Void*) -> Void*, free_func : (Void*, Void*) -> Void, user_data : Void*) : Void
  fun igSetClipboardText(text : LibC::Char*) : Void
  fun igSetColorEditOptions(flags : ImGui::ImGuiColorEditFlags) : Void
  fun igSetColumnOffset(column_index : LibC::Int, offset_x : LibC::Float) : Void
  fun igSetColumnWidth(column_index : LibC::Int, width : LibC::Float) : Void
  fun igSetCurrentContext(ctx : ImGui::ImGuiContext*) : Void
  fun igSetCursorPos(local_pos : ImGui::ImVec2) : Void
  fun igSetCursorPosX(local_x : LibC::Float) : Void
  fun igSetCursorPosY(local_y : LibC::Float) : Void
  fun igSetCursorScreenPos(pos : ImGui::ImVec2) : Void
  fun igSetDragDropPayload(type : LibC::Char*, data : Void*, sz : LibC::SizeT, cond : ImGui::ImGuiCond) : Bool
  fun igSetItemAllowOverlap : Void
  fun igSetItemDefaultFocus : Void
  fun igSetKeyboardFocusHere(offset : LibC::Int) : Void
  fun igSetMouseCursor(cursor_type : ImGui::ImGuiMouseCursor) : Void
  fun igSetNextItemOpen(is_open : Bool, cond : ImGui::ImGuiCond) : Void
  fun igSetNextItemWidth(item_width : LibC::Float) : Void
  fun igSetNextWindowBgAlpha(alpha : LibC::Float) : Void
  fun igSetNextWindowCollapsed(collapsed : Bool, cond : ImGui::ImGuiCond) : Void
  fun igSetNextWindowContentSize(size : ImGui::ImVec2) : Void
  fun igSetNextWindowFocus : Void
  fun igSetNextWindowPos(pos : ImGui::ImVec2, cond : ImGui::ImGuiCond, pivot : ImGui::ImVec2) : Void
  fun igSetNextWindowSize(size : ImGui::ImVec2, cond : ImGui::ImGuiCond) : Void
  fun igSetNextWindowSizeConstraints(size_min : ImGui::ImVec2, size_max : ImGui::ImVec2, custom_callback : ImGui::ImGuiSizeCallback, custom_callback_data : Void*) : Void
  fun igSetScrollFromPosXFloat(local_x : LibC::Float, center_x_ratio : LibC::Float) : Void
  fun igSetScrollFromPosYFloat(local_y : LibC::Float, center_y_ratio : LibC::Float) : Void
  fun igSetScrollHereX(center_x_ratio : LibC::Float) : Void
  fun igSetScrollHereY(center_y_ratio : LibC::Float) : Void
  fun igSetScrollXFloat(scroll_x : LibC::Float) : Void
  fun igSetScrollYFloat(scroll_y : LibC::Float) : Void
  fun igSetStateStorage(storage : ImGui::ImGuiStorage*) : Void
  fun igSetTabItemClosed(tab_or_docked_window_label : LibC::Char*) : Void
  fun igSetTooltip(fmt : LibC::Char*, ...) : Void
  fun igSetWindowCollapsedBool(collapsed : Bool, cond : ImGui::ImGuiCond) : Void
  fun igSetWindowCollapsedStr(name : LibC::Char*, collapsed : Bool, cond : ImGui::ImGuiCond) : Void
  fun igSetWindowFocusNil : Void
  fun igSetWindowFocusStr(name : LibC::Char*) : Void
  fun igSetWindowFontScale(scale : LibC::Float) : Void
  fun igSetWindowPosVec2(pos : ImGui::ImVec2, cond : ImGui::ImGuiCond) : Void
  fun igSetWindowPosStr(name : LibC::Char*, pos : ImGui::ImVec2, cond : ImGui::ImGuiCond) : Void
  fun igSetWindowSizeVec2(size : ImGui::ImVec2, cond : ImGui::ImGuiCond) : Void
  fun igSetWindowSizeStr(name : LibC::Char*, size : ImGui::ImVec2, cond : ImGui::ImGuiCond) : Void
  fun igShowAboutWindow(p_open : Bool*) : Void
  fun igShowDemoWindow(p_open : Bool*) : Void
  fun igShowFontSelector(label : LibC::Char*) : Void
  fun igShowMetricsWindow(p_open : Bool*) : Void
  fun igShowStyleEditor(ref : ImGui::ImGuiStyle*) : Void
  fun igShowStyleSelector(label : LibC::Char*) : Bool
  fun igShowUserGuide : Void
  fun igSliderAngle(label : LibC::Char*, v_rad : LibC::Float*, v_degrees_min : LibC::Float, v_degrees_max : LibC::Float, format : LibC::Char*) : Bool
  fun igSliderFloat(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, power : LibC::Float) : Bool
  fun igSliderFloat2(label : LibC::Char*, v : LibC::Float[2], v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, power : LibC::Float) : Bool
  fun igSliderFloat3(label : LibC::Char*, v : LibC::Float[3], v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, power : LibC::Float) : Bool
  fun igSliderFloat4(label : LibC::Char*, v : LibC::Float[4], v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, power : LibC::Float) : Bool
  fun igSliderInt(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*) : Bool
  fun igSliderInt2(label : LibC::Char*, v : LibC::Int[2], v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*) : Bool
  fun igSliderInt3(label : LibC::Char*, v : LibC::Int[3], v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*) : Bool
  fun igSliderInt4(label : LibC::Char*, v : LibC::Int[4], v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*) : Bool
  fun igSliderScalar(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : LibC::Char*, power : LibC::Float) : Bool
  fun igSliderScalarN(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, p_min : Void*, p_max : Void*, format : LibC::Char*, power : LibC::Float) : Bool
  fun igSmallButton(label : LibC::Char*) : Bool
  fun igSpacing : Void
  fun igStyleColorsClassic(dst : ImGui::ImGuiStyle*) : Void
  fun igStyleColorsDark(dst : ImGui::ImGuiStyle*) : Void
  fun igStyleColorsLight(dst : ImGui::ImGuiStyle*) : Void
  fun igText(fmt : LibC::Char*, ...) : Void
  fun igTextColored(col : ImGui::ImVec4, fmt : LibC::Char*, ...) : Void
  fun igTextDisabled(fmt : LibC::Char*, ...) : Void
  fun igTextUnformatted(text : LibC::Char*, text_end : LibC::Char*) : Void
  fun igTextWrapped(fmt : LibC::Char*, ...) : Void
  fun igTreeNodeStr(label : LibC::Char*) : Bool
  fun igTreeNodeStrStr(str_id : LibC::Char*, fmt : LibC::Char*, ...) : Bool
  fun igTreeNodePtr(ptr_id : Void*, fmt : LibC::Char*, ...) : Bool
  fun igTreeNodeExStr(label : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun igTreeNodeExStrStr(str_id : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags, fmt : LibC::Char*, ...) : Bool
  fun igTreeNodeExPtr(ptr_id : Void*, flags : ImGui::ImGuiTreeNodeFlags, fmt : LibC::Char*, ...) : Bool
  fun igTreePop : Void
  fun igTreePushStr(str_id : LibC::Char*) : Void
  fun igTreePushPtr(ptr_id : Void*) : Void
  fun igUnindent(indent_w : LibC::Float) : Void
  fun igVSliderFloat(label : LibC::Char*, size : ImGui::ImVec2, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, power : LibC::Float) : Bool
  fun igVSliderInt(label : LibC::Char*, size : ImGui::ImVec2, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*) : Bool
  fun igVSliderScalar(label : LibC::Char*, size : ImGui::ImVec2, data_type : ImGui::ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : LibC::Char*, power : LibC::Float) : Bool
  fun igValueBool(prefix : LibC::Char*, b : Bool) : Void
  fun igValueInt(prefix : LibC::Char*, v : LibC::Int) : Void
  fun igValueUint(prefix : LibC::Char*, v : LibC::UInt) : Void
  fun igValueFloat(prefix : LibC::Char*, v : LibC::Float, float_format : LibC::Char*) : Void
end
