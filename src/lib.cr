require "./custom"
require "./types"

@[Link("cimgui")]
lib LibImGui
  alias ImDrawCallback = (ImDrawList*, ImDrawCmd*) -> Void
  alias ImDrawIdx = LibC::UShort
  alias ImFileHandle = Void*
  alias ImGuiContextHookCallback = (ImGuiContext*, ImGuiContextHook*) -> Void
  alias ImGuiErrorLogCallback = (Void*, LibC::Char*) -> Void
  alias ImGuiID = LibC::UInt
  alias ImGuiInputTextCallback = (ImGuiInputTextCallbackData*) -> LibC::Int
  alias ImGuiSizeCallback = (ImGuiSizeCallbackData*) -> Void
  alias ImGuiTableColumnIdx = Int8
  alias ImGuiTableColumnsSettings = Void
  alias ImGuiTableDrawChannelIdx = UInt8
  alias ImPoolIdx = LibC::Int
  alias ImTextureID = Void*
  alias ImWchar16 = LibC::UShort
  alias ImWchar32 = LibC::UInt
  fun ImVec2_ImVec2Nil : ImGui::ImVec2*
  fun ImVec2_ImVec2Float(_x : LibC::Float, _y : LibC::Float) : ImGui::ImVec2*
  fun ImVec4_ImVec4Nil : ImGui::ImVec4*
  fun ImVec4_ImVec4Float(_x : LibC::Float, _y : LibC::Float, _z : LibC::Float, _w : LibC::Float) : ImGui::ImVec4*
  fun igCreateContext(shared_font_atlas : ImFontAtlas*) : ImGuiContext*
  fun igDestroyContext(ctx : ImGuiContext*)
  fun igGetCurrentContext : ImGuiContext*
  fun igSetCurrentContext(ctx : ImGuiContext*)
  fun igGetIO : ImGuiIO*
  fun igGetStyle : ImGuiStyle*
  fun igNewFrame
  fun igEndFrame
  fun igRender
  fun igGetDrawData : ImDrawData*
  fun igShowDemoWindow(p_open : Bool*)
  fun igShowMetricsWindow(p_open : Bool*)
  fun igShowAboutWindow(p_open : Bool*)
  fun igShowStyleEditor(ref : ImGuiStyle*)
  fun igShowStyleSelector(label : LibC::Char*) : Bool
  fun igShowFontSelector(label : LibC::Char*)
  fun igShowUserGuide
  fun igGetVersion : LibC::Char*
  fun igStyleColorsDark(dst : ImGuiStyle*)
  fun igStyleColorsLight(dst : ImGuiStyle*)
  fun igStyleColorsClassic(dst : ImGuiStyle*)
  fun igBegin(name : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igEnd
  fun igBeginChildStr(str_id : LibC::Char*, size : ImGui::ImVec2, border : Bool, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igBeginChildID(id : ImGuiID, size : ImGui::ImVec2, border : Bool, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igEndChild
  fun igIsWindowAppearing : Bool
  fun igIsWindowCollapsed : Bool
  fun igIsWindowFocused(flags : ImGui::ImGuiFocusedFlags) : Bool
  fun igIsWindowHovered(flags : ImGui::ImGuiHoveredFlags) : Bool
  fun igGetWindowDrawList : ImDrawList*
  fun igGetWindowPos(pOut : ImGui::ImVec2*)
  fun igGetWindowSize(pOut : ImGui::ImVec2*)
  fun igGetWindowWidth : LibC::Float
  fun igGetWindowHeight : LibC::Float
  fun igSetNextWindowPos(pos : ImGui::ImVec2, cond : ImGui::ImGuiCond, pivot : ImGui::ImVec2)
  fun igSetNextWindowSize(size : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun igSetNextWindowSizeConstraints(size_min : ImGui::ImVec2, size_max : ImGui::ImVec2, custom_callback : ImGuiSizeCallback, custom_callback_data : Void*)
  fun igSetNextWindowContentSize(size : ImGui::ImVec2)
  fun igSetNextWindowCollapsed(collapsed : Bool, cond : ImGui::ImGuiCond)
  fun igSetNextWindowFocus
  fun igSetNextWindowBgAlpha(alpha : LibC::Float)
  fun igSetWindowPosVec2(pos : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun igSetWindowPosStr(name : LibC::Char*, pos : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun igSetWindowSizeVec2(size : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun igSetWindowSizeStr(name : LibC::Char*, size : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun igSetWindowCollapsedBool(collapsed : Bool, cond : ImGui::ImGuiCond)
  fun igSetWindowCollapsedStr(name : LibC::Char*, collapsed : Bool, cond : ImGui::ImGuiCond)
  fun igSetWindowFocusNil
  fun igSetWindowFocusStr(name : LibC::Char*)
  fun igSetWindowFontScale(scale : LibC::Float)
  fun igGetContentRegionAvail(pOut : ImGui::ImVec2*)
  fun igGetContentRegionMax(pOut : ImGui::ImVec2*)
  fun igGetWindowContentRegionMin(pOut : ImGui::ImVec2*)
  fun igGetWindowContentRegionMax(pOut : ImGui::ImVec2*)
  fun igGetWindowContentRegionWidth : LibC::Float
  fun igGetScrollX : LibC::Float
  fun igGetScrollY : LibC::Float
  fun igSetScrollXFloat(scroll_x : LibC::Float)
  fun igSetScrollYFloat(scroll_y : LibC::Float)
  fun igGetScrollMaxX : LibC::Float
  fun igGetScrollMaxY : LibC::Float
  fun igSetScrollHereX(center_x_ratio : LibC::Float)
  fun igSetScrollHereY(center_y_ratio : LibC::Float)
  fun igSetScrollFromPosXFloat(local_x : LibC::Float, center_x_ratio : LibC::Float)
  fun igSetScrollFromPosYFloat(local_y : LibC::Float, center_y_ratio : LibC::Float)
  fun igPushFont(font : ImFont*)
  fun igPopFont
  fun igPushStyleColorU32(idx : ImGui::ImGuiCol, col : UInt32)
  fun igPushStyleColorVec4(idx : ImGui::ImGuiCol, col : ImGui::ImVec4)
  fun igPopStyleColor(count : LibC::Int)
  fun igPushStyleVarFloat(idx : ImGui::ImGuiStyleVar, val : LibC::Float)
  fun igPushStyleVarVec2(idx : ImGui::ImGuiStyleVar, val : ImGui::ImVec2)
  fun igPopStyleVar(count : LibC::Int)
  fun igPushAllowKeyboardFocus(allow_keyboard_focus : Bool)
  fun igPopAllowKeyboardFocus
  fun igPushButtonRepeat(repeat : Bool)
  fun igPopButtonRepeat
  fun igPushItemWidth(item_width : LibC::Float)
  fun igPopItemWidth
  fun igSetNextItemWidth(item_width : LibC::Float)
  fun igCalcItemWidth : LibC::Float
  fun igPushTextWrapPos(wrap_local_pos_x : LibC::Float)
  fun igPopTextWrapPos
  fun igGetFont : ImFont*
  fun igGetFontSize : LibC::Float
  fun igGetFontTexUvWhitePixel(pOut : ImGui::ImVec2*)
  fun igGetColorU32Col(idx : ImGui::ImGuiCol, alpha_mul : LibC::Float) : UInt32
  fun igGetColorU32Vec4(col : ImGui::ImVec4) : UInt32
  fun igGetColorU32U32(col : UInt32) : UInt32
  fun igGetStyleColorVec4(idx : ImGui::ImGuiCol) : ImGui::ImVec4*
  fun igSeparator
  fun igSameLine(offset_from_start_x : LibC::Float, spacing : LibC::Float)
  fun igNewLine
  fun igSpacing
  fun igDummy(size : ImGui::ImVec2)
  fun igIndent(indent_w : LibC::Float)
  fun igUnindent(indent_w : LibC::Float)
  fun igBeginGroup
  fun igEndGroup
  fun igGetCursorPos(pOut : ImGui::ImVec2*)
  fun igGetCursorPosX : LibC::Float
  fun igGetCursorPosY : LibC::Float
  fun igSetCursorPos(local_pos : ImGui::ImVec2)
  fun igSetCursorPosX(local_x : LibC::Float)
  fun igSetCursorPosY(local_y : LibC::Float)
  fun igGetCursorStartPos(pOut : ImGui::ImVec2*)
  fun igGetCursorScreenPos(pOut : ImGui::ImVec2*)
  fun igSetCursorScreenPos(pos : ImGui::ImVec2)
  fun igAlignTextToFramePadding
  fun igGetTextLineHeight : LibC::Float
  fun igGetTextLineHeightWithSpacing : LibC::Float
  fun igGetFrameHeight : LibC::Float
  fun igGetFrameHeightWithSpacing : LibC::Float
  fun igPushIDStr(str_id : LibC::Char*)
  fun igPushIDStrStr(str_id_begin : LibC::Char*, str_id_end : LibC::Char*)
  fun igPushIDPtr(ptr_id : Void*)
  fun igPushIDInt(int_id : LibC::Int)
  fun igPopID
  fun igGetIDStr(str_id : LibC::Char*) : ImGuiID
  fun igGetIDStrStr(str_id_begin : LibC::Char*, str_id_end : LibC::Char*) : ImGuiID
  fun igGetIDPtr(ptr_id : Void*) : ImGuiID
  fun igTextUnformatted(text : LibC::Char*, text_end : LibC::Char*)
  fun igText(fmt : LibC::Char*, ...)
  fun igTextColored(col : ImGui::ImVec4, fmt : LibC::Char*, ...)
  fun igTextDisabled(fmt : LibC::Char*, ...)
  fun igTextWrapped(fmt : LibC::Char*, ...)
  fun igLabelText(label : LibC::Char*, fmt : LibC::Char*, ...)
  fun igBulletText(fmt : LibC::Char*, ...)
  fun igButton(label : LibC::Char*, size : ImGui::ImVec2) : Bool
  fun igSmallButton(label : LibC::Char*) : Bool
  fun igInvisibleButton(str_id : LibC::Char*, size : ImGui::ImVec2, flags : ImGui::ImGuiButtonFlags) : Bool
  fun igArrowButton(str_id : LibC::Char*, dir : ImGui::ImGuiDir) : Bool
  fun igImage(user_texture_id : ImTextureID, size : ImGui::ImVec2, uv0 : ImGui::ImVec2, uv1 : ImGui::ImVec2, tint_col : ImGui::ImVec4, border_col : ImGui::ImVec4)
  fun igImageButton(user_texture_id : ImTextureID, size : ImGui::ImVec2, uv0 : ImGui::ImVec2, uv1 : ImGui::ImVec2, frame_padding : LibC::Int, bg_col : ImGui::ImVec4, tint_col : ImGui::ImVec4) : Bool
  fun igCheckbox(label : LibC::Char*, v : Bool*) : Bool
  fun igCheckboxFlagsIntPtr(label : LibC::Char*, flags : LibC::Int*, flags_value : LibC::Int) : Bool
  fun igCheckboxFlagsUintPtr(label : LibC::Char*, flags : LibC::UInt*, flags_value : LibC::UInt) : Bool
  fun igRadioButtonBool(label : LibC::Char*, active : Bool) : Bool
  fun igRadioButtonIntPtr(label : LibC::Char*, v : LibC::Int*, v_button : LibC::Int) : Bool
  fun igProgressBar(fraction : LibC::Float, size_arg : ImGui::ImVec2, overlay : LibC::Char*)
  fun igBullet
  fun igBeginCombo(label : LibC::Char*, preview_value : LibC::Char*, flags : ImGui::ImGuiComboFlags) : Bool
  fun igEndCombo
  fun igComboStr_arr(label : LibC::Char*, current_item : LibC::Int*, items : LibC::Char**, items_count : LibC::Int, popup_max_height_in_items : LibC::Int) : Bool
  fun igComboStr(label : LibC::Char*, current_item : LibC::Int*, items_separated_by_zeros : LibC::Char*, popup_max_height_in_items : LibC::Int) : Bool
  fun igComboFnBoolPtr(label : LibC::Char*, current_item : LibC::Int*, items_getter : (Void*, LibC::Int, LibC::Char**) -> Bool, data : Void*, items_count : LibC::Int, popup_max_height_in_items : LibC::Int) : Bool
  fun igDragFloat(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igDragFloat2(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igDragFloat3(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igDragFloat4(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igDragFloatRange2(label : LibC::Char*, v_current_min : LibC::Float*, v_current_max : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, format_max : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igDragInt(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igDragInt2(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igDragInt3(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igDragInt4(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igDragIntRange2(label : LibC::Char*, v_current_min : LibC::Int*, v_current_max : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, format_max : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igDragScalar(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, v_speed : LibC::Float, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igDragScalarN(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, v_speed : LibC::Float, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igSliderFloat(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igSliderFloat2(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igSliderFloat3(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igSliderFloat4(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igSliderAngle(label : LibC::Char*, v_rad : LibC::Float*, v_degrees_min : LibC::Float, v_degrees_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igSliderInt(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igSliderInt2(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igSliderInt3(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igSliderInt4(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igSliderScalar(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igSliderScalarN(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igVSliderFloat(label : LibC::Char*, size : ImGui::ImVec2, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igVSliderInt(label : LibC::Char*, size : ImGui::ImVec2, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igVSliderScalar(label : LibC::Char*, size : ImGui::ImVec2, data_type : ImGui::ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun igInputText(label : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun igInputTextMultiline(label : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, size : ImGui::ImVec2, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun igInputTextWithHint(label : LibC::Char*, hint : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun igInputFloat(label : LibC::Char*, v : LibC::Float*, step : LibC::Float, step_fast : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputFloat2(label : LibC::Char*, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputFloat3(label : LibC::Char*, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputFloat4(label : LibC::Char*, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputInt(label : LibC::Char*, v : LibC::Int*, step : LibC::Int, step_fast : LibC::Int, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputInt2(label : LibC::Char*, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputInt3(label : LibC::Char*, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputInt4(label : LibC::Char*, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputDouble(label : LibC::Char*, v : LibC::Double*, step : LibC::Double, step_fast : LibC::Double, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputScalar(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, p_step : Void*, p_step_fast : Void*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igInputScalarN(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, p_step : Void*, p_step_fast : Void*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun igColorEdit3(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun igColorEdit4(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun igColorPicker3(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun igColorPicker4(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags, ref_col : LibC::Float*) : Bool
  fun igColorButton(desc_id : LibC::Char*, col : ImGui::ImVec4, flags : ImGui::ImGuiColorEditFlags, size : ImGui::ImVec2) : Bool
  fun igSetColorEditOptions(flags : ImGui::ImGuiColorEditFlags)
  fun igTreeNodeStr(label : LibC::Char*) : Bool
  fun igTreeNodeStrStr(str_id : LibC::Char*, fmt : LibC::Char*, ...) : Bool
  fun igTreeNodePtr(ptr_id : Void*, fmt : LibC::Char*, ...) : Bool
  fun igTreeNodeExStr(label : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun igTreeNodeExStrStr(str_id : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags, fmt : LibC::Char*, ...) : Bool
  fun igTreeNodeExPtr(ptr_id : Void*, flags : ImGui::ImGuiTreeNodeFlags, fmt : LibC::Char*, ...) : Bool
  fun igTreePushStr(str_id : LibC::Char*)
  fun igTreePushPtr(ptr_id : Void*)
  fun igTreePop
  fun igGetTreeNodeToLabelSpacing : LibC::Float
  fun igCollapsingHeaderTreeNodeFlags(label : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun igCollapsingHeaderBoolPtr(label : LibC::Char*, p_visible : Bool*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun igSetNextItemOpen(is_open : Bool, cond : ImGui::ImGuiCond)
  fun igSelectableBool(label : LibC::Char*, selected : Bool, flags : ImGui::ImGuiSelectableFlags, size : ImGui::ImVec2) : Bool
  fun igSelectableBoolPtr(label : LibC::Char*, p_selected : Bool*, flags : ImGui::ImGuiSelectableFlags, size : ImGui::ImVec2) : Bool
  fun igListBoxStr_arr(label : LibC::Char*, current_item : LibC::Int*, items : LibC::Char**, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun igListBoxFnBoolPtr(label : LibC::Char*, current_item : LibC::Int*, items_getter : (Void*, LibC::Int, LibC::Char**) -> Bool, data : Void*, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun igListBoxHeaderVec2(label : LibC::Char*, size : ImGui::ImVec2) : Bool
  fun igListBoxHeaderInt(label : LibC::Char*, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun igListBoxFooter
  fun igPlotLinesFloatPtr(label : LibC::Char*, values : LibC::Float*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2, stride : LibC::Int)
  fun igPlotLinesFnFloatPtr(label : LibC::Char*, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2)
  fun igPlotHistogramFloatPtr(label : LibC::Char*, values : LibC::Float*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2, stride : LibC::Int)
  fun igPlotHistogramFnFloatPtr(label : LibC::Char*, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2)
  fun igValueBool(prefix : LibC::Char*, b : Bool)
  fun igValueInt(prefix : LibC::Char*, v : LibC::Int)
  fun igValueUint(prefix : LibC::Char*, v : LibC::UInt)
  fun igValueFloat(prefix : LibC::Char*, v : LibC::Float, float_format : LibC::Char*)
  fun igBeginMenuBar : Bool
  fun igEndMenuBar
  fun igBeginMainMenuBar : Bool
  fun igEndMainMenuBar
  fun igBeginMenu(label : LibC::Char*, enabled : Bool) : Bool
  fun igEndMenu
  fun igMenuItemBool(label : LibC::Char*, shortcut : LibC::Char*, selected : Bool, enabled : Bool) : Bool
  fun igMenuItemBoolPtr(label : LibC::Char*, shortcut : LibC::Char*, p_selected : Bool*, enabled : Bool) : Bool
  fun igBeginTooltip
  fun igEndTooltip
  fun igSetTooltip(fmt : LibC::Char*, ...)
  fun igBeginPopup(str_id : LibC::Char*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igBeginPopupModal(name : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igEndPopup
  fun igOpenPopup(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags)
  fun igOpenPopupOnItemClick(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags)
  fun igCloseCurrentPopup
  fun igBeginPopupContextItem(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun igBeginPopupContextWindow(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun igBeginPopupContextVoid(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun igIsPopupOpenStr(str_id : LibC::Char*, flags : ImGui::ImGuiPopupFlags) : Bool
  fun igBeginTable(str_id : LibC::Char*, column : LibC::Int, flags : ImGui::ImGuiTableFlags, outer_size : ImGui::ImVec2, inner_width : LibC::Float) : Bool
  fun igEndTable
  fun igTableNextRow(row_flags : ImGui::ImGuiTableRowFlags, min_row_height : LibC::Float)
  fun igTableNextColumn : Bool
  fun igTableSetColumnIndex(column_n : LibC::Int) : Bool
  fun igTableSetupColumn(label : LibC::Char*, flags : ImGui::ImGuiTableColumnFlags, init_width_or_weight : LibC::Float, user_id : UInt32)
  fun igTableSetupScrollFreeze(cols : LibC::Int, rows : LibC::Int)
  fun igTableHeadersRow
  fun igTableHeader(label : LibC::Char*)
  fun igTableGetSortSpecs : ImGuiTableSortSpecs*
  fun igTableGetColumnCount : LibC::Int
  fun igTableGetColumnIndex : LibC::Int
  fun igTableGetRowIndex : LibC::Int
  fun igTableGetColumnNameInt(column_n : LibC::Int) : LibC::Char*
  fun igTableGetColumnFlags(column_n : LibC::Int) : ImGui::ImGuiTableColumnFlags
  fun igTableSetBgColor(target : ImGui::ImGuiTableBgTarget, color : UInt32, column_n : LibC::Int)
  fun igColumns(count : LibC::Int, id : LibC::Char*, border : Bool)
  fun igNextColumn
  fun igGetColumnIndex : LibC::Int
  fun igGetColumnWidth(column_index : LibC::Int) : LibC::Float
  fun igSetColumnWidth(column_index : LibC::Int, width : LibC::Float)
  fun igGetColumnOffset(column_index : LibC::Int) : LibC::Float
  fun igSetColumnOffset(column_index : LibC::Int, offset_x : LibC::Float)
  fun igGetColumnsCount : LibC::Int
  fun igBeginTabBar(str_id : LibC::Char*, flags : ImGui::ImGuiTabBarFlags) : Bool
  fun igEndTabBar
  fun igBeginTabItem(label : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiTabItemFlags) : Bool
  fun igEndTabItem
  fun igTabItemButton(label : LibC::Char*, flags : ImGui::ImGuiTabItemFlags) : Bool
  fun igSetTabItemClosed(tab_or_docked_window_label : LibC::Char*)
  fun igLogToTTY(auto_open_depth : LibC::Int)
  fun igLogToFile(auto_open_depth : LibC::Int, filename : LibC::Char*)
  fun igLogToClipboard(auto_open_depth : LibC::Int)
  fun igLogFinish
  fun igLogButtons
  fun igLogText(fmt : LibC::Char*, ...)
  fun igBeginDragDropSource(flags : ImGui::ImGuiDragDropFlags) : Bool
  fun igSetDragDropPayload(type : LibC::Char*, data : Void*, sz : LibC::SizeT, cond : ImGui::ImGuiCond) : Bool
  fun igEndDragDropSource
  fun igBeginDragDropTarget : Bool
  fun igAcceptDragDropPayload(type : LibC::Char*, flags : ImGui::ImGuiDragDropFlags) : ImGuiPayload*
  fun igEndDragDropTarget
  fun igGetDragDropPayload : ImGuiPayload*
  fun igPushClipRect(clip_rect_min : ImGui::ImVec2, clip_rect_max : ImGui::ImVec2, intersect_with_current_clip_rect : Bool)
  fun igPopClipRect
  fun igSetItemDefaultFocus
  fun igSetKeyboardFocusHere(offset : LibC::Int)
  fun igIsItemHovered(flags : ImGui::ImGuiHoveredFlags) : Bool
  fun igIsItemActive : Bool
  fun igIsItemFocused : Bool
  fun igIsItemClicked(mouse_button : ImGui::ImGuiMouseButton) : Bool
  fun igIsItemVisible : Bool
  fun igIsItemEdited : Bool
  fun igIsItemActivated : Bool
  fun igIsItemDeactivated : Bool
  fun igIsItemDeactivatedAfterEdit : Bool
  fun igIsItemToggledOpen : Bool
  fun igIsAnyItemHovered : Bool
  fun igIsAnyItemActive : Bool
  fun igIsAnyItemFocused : Bool
  fun igGetItemRectMin(pOut : ImGui::ImVec2*)
  fun igGetItemRectMax(pOut : ImGui::ImVec2*)
  fun igGetItemRectSize(pOut : ImGui::ImVec2*)
  fun igSetItemAllowOverlap
  fun igIsRectVisibleNil(size : ImGui::ImVec2) : Bool
  fun igIsRectVisibleVec2(rect_min : ImGui::ImVec2, rect_max : ImGui::ImVec2) : Bool
  fun igGetTime : LibC::Double
  fun igGetFrameCount : LibC::Int
  fun igGetBackgroundDrawList : ImDrawList*
  fun igGetForegroundDrawListNil : ImDrawList*
  fun igGetDrawListSharedData : ImDrawListSharedData*
  fun igGetStyleColorName(idx : ImGui::ImGuiCol) : LibC::Char*
  fun igSetStateStorage(storage : ImGui::ImGuiStorage*)
  fun igGetStateStorage : ImGui::ImGuiStorage*
  fun igCalcListClipping(items_count : LibC::Int, items_height : LibC::Float, out_items_display_start : LibC::Int*, out_items_display_end : LibC::Int*)
  fun igBeginChildFrame(id : ImGuiID, size : ImGui::ImVec2, flags : ImGui::ImGuiWindowFlags) : Bool
  fun igEndChildFrame
  fun igCalcTextSize(pOut : ImGui::ImVec2*, text : LibC::Char*, text_end : LibC::Char*, hide_text_after_double_hash : Bool, wrap_width : LibC::Float)
  fun igColorConvertU32ToFloat4(pOut : ImGui::ImVec4*, in_ : UInt32)
  fun igColorConvertFloat4ToU32(in_ : ImGui::ImVec4) : UInt32
  fun igColorConvertRGBtoHSV(r : LibC::Float, g : LibC::Float, b : LibC::Float, out_h : LibC::Float*, out_s : LibC::Float*, out_v : LibC::Float*)
  fun igColorConvertHSVtoRGB(h : LibC::Float, s : LibC::Float, v : LibC::Float, out_r : LibC::Float*, out_g : LibC::Float*, out_b : LibC::Float*)
  fun igGetKeyIndex(imgui_key : ImGui::ImGuiKey) : LibC::Int
  fun igIsKeyDown(user_key_index : LibC::Int) : Bool
  fun igIsKeyPressed(user_key_index : LibC::Int, repeat : Bool) : Bool
  fun igIsKeyReleased(user_key_index : LibC::Int) : Bool
  fun igGetKeyPressedAmount(key_index : LibC::Int, repeat_delay : LibC::Float, rate : LibC::Float) : LibC::Int
  fun igCaptureKeyboardFromApp(want_capture_keyboard_value : Bool)
  fun igIsMouseDown(button : ImGui::ImGuiMouseButton) : Bool
  fun igIsMouseClicked(button : ImGui::ImGuiMouseButton, repeat : Bool) : Bool
  fun igIsMouseReleased(button : ImGui::ImGuiMouseButton) : Bool
  fun igIsMouseDoubleClicked(button : ImGui::ImGuiMouseButton) : Bool
  fun igIsMouseHoveringRect(r_min : ImGui::ImVec2, r_max : ImGui::ImVec2, clip : Bool) : Bool
  fun igIsMousePosValid(mouse_pos : ImGui::ImVec2*) : Bool
  fun igIsAnyMouseDown : Bool
  fun igGetMousePos(pOut : ImGui::ImVec2*)
  fun igGetMousePosOnOpeningCurrentPopup(pOut : ImGui::ImVec2*)
  fun igIsMouseDragging(button : ImGui::ImGuiMouseButton, lock_threshold : LibC::Float) : Bool
  fun igGetMouseDragDelta(pOut : ImGui::ImVec2*, button : ImGui::ImGuiMouseButton, lock_threshold : LibC::Float)
  fun igResetMouseDragDelta(button : ImGui::ImGuiMouseButton)
  fun igGetMouseCursor : ImGui::ImGuiMouseCursor
  fun igSetMouseCursor(cursor_type : ImGui::ImGuiMouseCursor)
  fun igCaptureMouseFromApp(want_capture_mouse_value : Bool)
  fun igGetClipboardText : LibC::Char*
  fun igSetClipboardText(text : LibC::Char*)
  fun igLoadIniSettingsFromDisk(ini_filename : LibC::Char*)
  fun igLoadIniSettingsFromMemory(ini_data : LibC::Char*, ini_size : LibC::SizeT)
  fun igSaveIniSettingsToDisk(ini_filename : LibC::Char*)
  fun igSaveIniSettingsToMemory(out_ini_size : LibC::SizeT*) : LibC::Char*
  fun igDebugCheckVersionAndDataLayout(version_str : LibC::Char*, sz_io : LibC::SizeT, sz_style : LibC::SizeT, sz_vec2 : LibC::SizeT, sz_vec4 : LibC::SizeT, sz_drawvert : LibC::SizeT, sz_drawidx : LibC::SizeT) : Bool
  fun igSetAllocatorFunctions(alloc_func : (LibC::SizeT, Void*) -> Void*, free_func : (Void*, Void*) -> Void, user_data : Void*)
  fun igMemAlloc(size : LibC::SizeT) : Void*
  fun igMemFree(ptr : Void*)

  struct ImGuiStyle
    alpha : LibC::Float
    window_padding : ImGui::ImVec2
    window_rounding : LibC::Float
    window_border_size : LibC::Float
    window_min_size : ImGui::ImVec2
    window_title_align : ImGui::ImVec2
    window_menu_button_position : ImGui::ImGuiDir
    child_rounding : LibC::Float
    child_border_size : LibC::Float
    popup_rounding : LibC::Float
    popup_border_size : LibC::Float
    frame_padding : ImGui::ImVec2
    frame_rounding : LibC::Float
    frame_border_size : LibC::Float
    item_spacing : ImGui::ImVec2
    item_inner_spacing : ImGui::ImVec2
    cell_padding : ImGui::ImVec2
    touch_extra_padding : ImGui::ImVec2
    indent_spacing : LibC::Float
    columns_min_spacing : LibC::Float
    scrollbar_size : LibC::Float
    scrollbar_rounding : LibC::Float
    grab_min_size : LibC::Float
    grab_rounding : LibC::Float
    log_slider_deadzone : LibC::Float
    tab_rounding : LibC::Float
    tab_border_size : LibC::Float
    tab_min_width_for_close_button : LibC::Float
    color_button_position : ImGui::ImGuiDir
    button_text_align : ImGui::ImVec2
    selectable_text_align : ImGui::ImVec2
    display_window_padding : ImGui::ImVec2
    display_safe_area_padding : ImGui::ImVec2
    mouse_cursor_scale : LibC::Float
    anti_aliased_lines : Bool
    anti_aliased_lines_use_tex : Bool
    anti_aliased_fill : Bool
    curve_tessellation_tol : LibC::Float
    circle_segment_max_error : LibC::Float
    colors : ImGui::ImVec4[53]
  end

  fun ImGuiStyle_ImGuiStyle : ImGuiStyle*
  fun ImGuiStyle_ScaleAllSizes(self : ImGuiStyle*, scale_factor : LibC::Float)

  struct ImGuiIO
    config_flags : ImGui::ImGuiConfigFlags
    backend_flags : ImGui::ImGuiBackendFlags
    display_size : ImGui::ImVec2
    delta_time : LibC::Float
    ini_saving_rate : LibC::Float
    ini_filename : LibC::Char*
    log_filename : LibC::Char*
    mouse_double_click_time : LibC::Float
    mouse_double_click_max_dist : LibC::Float
    mouse_drag_threshold : LibC::Float
    key_map : LibC::Int[22]
    key_repeat_delay : LibC::Float
    key_repeat_rate : LibC::Float
    user_data : Void*
    fonts : ImFontAtlas*
    font_global_scale : LibC::Float
    font_allow_user_scaling : Bool
    font_default : ImFont*
    display_framebuffer_scale : ImGui::ImVec2
    mouse_draw_cursor : Bool
    config_mac_osx_behaviors : Bool
    config_input_text_cursor_blink : Bool
    config_drag_click_to_input_text : Bool
    config_windows_resize_from_edges : Bool
    config_windows_move_from_title_bar_only : Bool
    config_memory_compact_timer : LibC::Float
    backend_platform_name : LibC::Char*
    backend_renderer_name : LibC::Char*
    backend_platform_user_data : Void*
    backend_renderer_user_data : Void*
    backend_language_user_data : Void*
    get_clipboard_text_fn : (Void*) -> LibC::Char*
    set_clipboard_text_fn : (Void*, LibC::Char*) -> Void
    clipboard_user_data : Void*
    ime_set_input_screen_pos_fn : (LibC::Int, LibC::Int) -> Void
    ime_window_handle : Void*
    mouse_pos : ImGui::ImVec2
    mouse_down : Bool[5]
    mouse_wheel : LibC::Float
    mouse_wheel_h : LibC::Float
    key_ctrl : Bool
    key_shift : Bool
    key_alt : Bool
    key_super : Bool
    keys_down : Bool[512]
    nav_inputs : LibC::Float[21]
    want_capture_mouse : Bool
    want_capture_keyboard : Bool
    want_text_input : Bool
    want_set_mouse_pos : Bool
    want_save_ini_settings : Bool
    nav_active : Bool
    nav_visible : Bool
    framerate : LibC::Float
    metrics_render_vertices : LibC::Int
    metrics_render_indices : LibC::Int
    metrics_render_windows : LibC::Int
    metrics_active_windows : LibC::Int
    metrics_active_allocations : LibC::Int
    mouse_delta : ImGui::ImVec2
    key_mods : ImGui::ImGuiKeyModFlags
    mouse_pos_prev : ImGui::ImVec2
    mouse_clicked_pos : ImGui::ImVec2[5]
    mouse_clicked_time : LibC::Double[5]
    mouse_clicked : Bool[5]
    mouse_double_clicked : Bool[5]
    mouse_released : Bool[5]
    mouse_down_owned : Bool[5]
    mouse_down_was_double_click : Bool[5]
    mouse_down_duration : LibC::Float[5]
    mouse_down_duration_prev : LibC::Float[5]
    mouse_drag_max_distance_abs : ImGui::ImVec2[5]
    mouse_drag_max_distance_sqr : LibC::Float[5]
    keys_down_duration : LibC::Float[512]
    keys_down_duration_prev : LibC::Float[512]
    nav_inputs_down_duration : LibC::Float[21]
    nav_inputs_down_duration_prev : LibC::Float[21]
    pen_pressure : LibC::Float
    input_queue_surrogate : ImWchar16
    input_queue_characters : ImVectorInternal
  end

  fun ImGuiIO_AddInputCharacter(self : ImGuiIO*, c : LibC::UInt)
  fun ImGuiIO_AddInputCharacterUTF16(self : ImGuiIO*, c : ImWchar16)
  fun ImGuiIO_AddInputCharactersUTF8(self : ImGuiIO*, str : LibC::Char*)
  fun ImGuiIO_ClearInputCharacters(self : ImGuiIO*)
  fun ImGuiIO_ImGuiIO : ImGuiIO*

  struct ImGuiInputTextCallbackData
    event_flag : ImGui::ImGuiInputTextFlags
    flags : ImGui::ImGuiInputTextFlags
    user_data : Void*
    event_char : ImWchar
    event_key : ImGui::ImGuiKey
    buf : LibC::Char*
    buf_text_len : LibC::Int
    buf_size : LibC::Int
    buf_dirty : Bool
    cursor_pos : LibC::Int
    selection_start : LibC::Int
    selection_end : LibC::Int
  end

  fun ImGuiInputTextCallbackData_ImGuiInputTextCallbackData : ImGuiInputTextCallbackData*
  fun ImGuiInputTextCallbackData_DeleteChars(self : ImGuiInputTextCallbackData*, pos : LibC::Int, bytes_count : LibC::Int)
  fun ImGuiInputTextCallbackData_InsertChars(self : ImGuiInputTextCallbackData*, pos : LibC::Int, text : LibC::Char*, text_end : LibC::Char*)
  fun ImGuiInputTextCallbackData_SelectAll(self : ImGuiInputTextCallbackData*)
  fun ImGuiInputTextCallbackData_ClearSelection(self : ImGuiInputTextCallbackData*)
  fun ImGuiInputTextCallbackData_HasSelection(self : ImGuiInputTextCallbackData*) : Bool

  struct ImGuiSizeCallbackData
    user_data : Void*
    pos : ImGui::ImVec2
    current_size : ImGui::ImVec2
    desired_size : ImGui::ImVec2
  end

  struct ImGuiPayload
    data : Void*
    data_size : LibC::Int
    source_id : ImGuiID
    source_parent_id : ImGuiID
    data_frame_count : LibC::Int
    data_type : LibC::Char[33]
    preview : Bool
    delivery : Bool
  end

  fun ImGuiPayload_ImGuiPayload : ImGuiPayload*
  fun ImGuiPayload_Clear(self : ImGuiPayload*)
  fun ImGuiPayload_IsDataType(self : ImGuiPayload*, type : LibC::Char*) : Bool
  fun ImGuiPayload_IsPreview(self : ImGuiPayload*) : Bool
  fun ImGuiPayload_IsDelivery(self : ImGuiPayload*) : Bool

  struct ImGuiTableColumnSortSpecs
    column_user_id : ImGuiID
    column_index : Int16
    sort_order : Int16
    sort_direction : ImGui::ImGuiSortDirection
  end

  fun ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs : ImGuiTableColumnSortSpecs*

  struct ImGuiTableSortSpecs
    specs : ImGuiTableColumnSortSpecs*
    specs_count : LibC::Int
    specs_dirty : Bool
  end

  fun ImGuiTableSortSpecs_ImGuiTableSortSpecs : ImGuiTableSortSpecs*
  fun ImGuiOnceUponAFrame_ImGuiOnceUponAFrame : ImGui::ImGuiOnceUponAFrame*

  struct ImGuiTextFilter
    input_buf : LibC::Char[256]
    filters : ImVectorInternal
    count_grep : LibC::Int
  end

  fun ImGuiTextFilter_ImGuiTextFilter(default_filter : LibC::Char*) : ImGuiTextFilter*
  fun ImGuiTextFilter_Draw(self : ImGuiTextFilter*, label : LibC::Char*, width : LibC::Float) : Bool
  fun ImGuiTextFilter_PassFilter(self : ImGuiTextFilter*, text : LibC::Char*, text_end : LibC::Char*) : Bool
  fun ImGuiTextFilter_Build(self : ImGuiTextFilter*)
  fun ImGuiTextFilter_Clear(self : ImGuiTextFilter*)
  fun ImGuiTextFilter_IsActive(self : ImGuiTextFilter*) : Bool
  type ImGuiTextRange = Void*
  fun ImGuiTextRange_ImGuiTextRangeNil : ImGuiTextRange*
  fun ImGuiTextRange_ImGuiTextRangeStr(_b : LibC::Char*, _e : LibC::Char*) : ImGuiTextRange*
  fun ImGuiTextRange_empty(self : ImGuiTextRange*) : Bool
  fun ImGuiTextRange_split(self : ImGuiTextRange*, separator : LibC::Char, out : ImVectorInternal*)
  type ImGuiTextBuffer = Void*
  fun ImGuiTextBuffer_ImGuiTextBuffer : ImGuiTextBuffer*
  fun ImGuiTextBuffer_begin(self : ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_end(self : ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_size(self : ImGuiTextBuffer*) : LibC::Int
  fun ImGuiTextBuffer_empty(self : ImGuiTextBuffer*) : Bool
  fun ImGuiTextBuffer_clear(self : ImGuiTextBuffer*)
  fun ImGuiTextBuffer_reserve(self : ImGuiTextBuffer*, capacity : LibC::Int)
  fun ImGuiTextBuffer_c_str(self : ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_append(self : ImGuiTextBuffer*, str : LibC::Char*, str_end : LibC::Char*)
  fun ImGuiTextBuffer_appendf(self : ImGuiTextBuffer*, fmt : LibC::Char*, ...)
  type ImGuiStoragePair = Void*
  fun ImGuiStoragePair_ImGuiStoragePairInt(_key : ImGuiID, _val_i : LibC::Int) : ImGuiStoragePair*
  fun ImGuiStoragePair_ImGuiStoragePairFloat(_key : ImGuiID, _val_f : LibC::Float) : ImGuiStoragePair*
  fun ImGuiStoragePair_ImGuiStoragePairPtr(_key : ImGuiID, _val_p : Void*) : ImGuiStoragePair*
  fun ImGuiStorage_Clear(self : ImGui::ImGuiStorage*)
  fun ImGuiStorage_GetInt(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : LibC::Int) : LibC::Int
  fun ImGuiStorage_SetInt(self : ImGui::ImGuiStorage*, key : ImGuiID, val : LibC::Int)
  fun ImGuiStorage_GetBool(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : Bool) : Bool
  fun ImGuiStorage_SetBool(self : ImGui::ImGuiStorage*, key : ImGuiID, val : Bool)
  fun ImGuiStorage_GetFloat(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : LibC::Float) : LibC::Float
  fun ImGuiStorage_SetFloat(self : ImGui::ImGuiStorage*, key : ImGuiID, val : LibC::Float)
  fun ImGuiStorage_GetVoidPtr(self : ImGui::ImGuiStorage*, key : ImGuiID) : Void*
  fun ImGuiStorage_SetVoidPtr(self : ImGui::ImGuiStorage*, key : ImGuiID, val : Void*)
  fun ImGuiStorage_GetIntRef(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : LibC::Int) : LibC::Int*
  fun ImGuiStorage_GetBoolRef(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : Bool) : Bool*
  fun ImGuiStorage_GetFloatRef(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : LibC::Float) : LibC::Float*
  fun ImGuiStorage_GetVoidPtrRef(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : Void*) : Void**
  fun ImGuiStorage_SetAllInt(self : ImGui::ImGuiStorage*, val : LibC::Int)
  fun ImGuiStorage_BuildSortByKey(self : ImGui::ImGuiStorage*)
  fun ImGuiListClipper_ImGuiListClipper : ImGui::ImGuiListClipper*
  fun ImGuiListClipper_Begin(self : ImGui::ImGuiListClipper*, items_count : LibC::Int, items_height : LibC::Float)
  fun ImGuiListClipper_End(self : ImGui::ImGuiListClipper*)
  fun ImGuiListClipper_Step(self : ImGui::ImGuiListClipper*) : Bool
  fun ImColor_ImColorNil : ImGui::ImColor*
  fun ImColor_ImColorInt(r : LibC::Int, g : LibC::Int, b : LibC::Int, a : LibC::Int) : ImGui::ImColor*
  fun ImColor_ImColorU32(rgba : UInt32) : ImGui::ImColor*
  fun ImColor_ImColorFloat(r : LibC::Float, g : LibC::Float, b : LibC::Float, a : LibC::Float) : ImGui::ImColor*
  fun ImColor_ImColorVec4(col : ImGui::ImVec4) : ImGui::ImColor*
  fun ImColor_SetHSV(self : ImGui::ImColor*, h : LibC::Float, s : LibC::Float, v : LibC::Float, a : LibC::Float)
  fun ImColor_HSV(pOut : ImGui::ImColor*, h : LibC::Float, s : LibC::Float, v : LibC::Float, a : LibC::Float)

  struct ImDrawCmd
    clip_rect : ImGui::ImVec4
    texture_id : ImTextureID
    vtx_offset : LibC::UInt
    idx_offset : LibC::UInt
    elem_count : LibC::UInt
    user_callback : ImDrawCallback
    user_callback_data : Void*
  end

  fun ImDrawCmd_ImDrawCmd : ImDrawCmd*

  struct ImDrawCmdHeader
    clip_rect : ImGui::ImVec4
    texture_id : ImTextureID
    vtx_offset : LibC::UInt
  end

  struct ImDrawListSplitter
    _current : LibC::Int
    _count : LibC::Int
    _channels : ImVectorInternal
  end

  fun ImDrawListSplitter_ImDrawListSplitter : ImDrawListSplitter*
  fun ImDrawListSplitter_Clear(self : ImDrawListSplitter*)
  fun ImDrawListSplitter_ClearFreeMemory(self : ImDrawListSplitter*)
  fun ImDrawListSplitter_Split(self : ImDrawListSplitter*, draw_list : ImDrawList*, count : LibC::Int)
  fun ImDrawListSplitter_Merge(self : ImDrawListSplitter*, draw_list : ImDrawList*)
  fun ImDrawListSplitter_SetCurrentChannel(self : ImDrawListSplitter*, draw_list : ImDrawList*, channel_idx : LibC::Int)

  struct ImDrawList
    cmd_buffer : ImVectorInternal
    idx_buffer : ImVectorInternal
    vtx_buffer : ImVectorInternal
    flags : ImGui::ImDrawListFlags
    _vtx_current_idx : LibC::UInt
    _data : ImDrawListSharedData*
    _owner_name : LibC::Char*
    _vtx_write_ptr : ImGui::ImDrawVert*
    _idx_write_ptr : ImDrawIdx*
    _clip_rect_stack : ImVectorInternal
    _texture_id_stack : ImVectorInternal
    _path : ImVectorInternal
    _cmd_header : ImDrawCmdHeader
    _splitter : ImDrawListSplitter
    _fringe_scale : LibC::Float
  end

  fun ImDrawList_ImDrawList(shared_data : ImDrawListSharedData*) : ImDrawList*
  fun ImDrawList_PushClipRect(self : ImDrawList*, clip_rect_min : ImGui::ImVec2, clip_rect_max : ImGui::ImVec2, intersect_with_current_clip_rect : Bool)
  fun ImDrawList_PushClipRectFullScreen(self : ImDrawList*)
  fun ImDrawList_PopClipRect(self : ImDrawList*)
  fun ImDrawList_PushTextureID(self : ImDrawList*, texture_id : ImTextureID)
  fun ImDrawList_PopTextureID(self : ImDrawList*)
  fun ImDrawList_GetClipRectMin(pOut : ImGui::ImVec2*, self : ImDrawList*)
  fun ImDrawList_GetClipRectMax(pOut : ImGui::ImVec2*, self : ImDrawList*)
  fun ImDrawList_AddLine(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float)
  fun ImDrawList_AddRect(self : ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags, thickness : LibC::Float)
  fun ImDrawList_AddRectFilled(self : ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags)
  fun ImDrawList_AddRectFilledMultiColor(self : ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col_upr_left : UInt32, col_upr_right : UInt32, col_bot_right : UInt32, col_bot_left : UInt32)
  fun ImDrawList_AddQuad(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float)
  fun ImDrawList_AddQuadFilled(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddTriangle(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float)
  fun ImDrawList_AddTriangleFilled(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddCircle(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int, thickness : LibC::Float)
  fun ImDrawList_AddCircleFilled(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int)
  fun ImDrawList_AddNgon(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int, thickness : LibC::Float)
  fun ImDrawList_AddNgonFilled(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int)
  fun ImDrawList_AddTextVec2(self : ImDrawList*, pos : ImGui::ImVec2, col : UInt32, text_begin : LibC::Char*, text_end : LibC::Char*)
  fun ImDrawList_AddTextFontPtr(self : ImDrawList*, font : ImFont*, font_size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, text_begin : LibC::Char*, text_end : LibC::Char*, wrap_width : LibC::Float, cpu_fine_clip_rect : ImGui::ImVec4*)
  fun ImDrawList_AddPolyline(self : ImDrawList*, points : ImGui::ImVec2*, num_points : LibC::Int, col : UInt32, closed : Bool, thickness : LibC::Float)
  fun ImDrawList_AddConvexPolyFilled(self : ImDrawList*, points : ImGui::ImVec2*, num_points : LibC::Int, col : UInt32)
  fun ImDrawList_AddBezierCubic(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float, num_segments : LibC::Int)
  fun ImDrawList_AddBezierQuadratic(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float, num_segments : LibC::Int)
  fun ImDrawList_AddImage(self : ImDrawList*, user_texture_id : ImTextureID, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, uv_min : ImGui::ImVec2, uv_max : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddImageQuad(self : ImDrawList*, user_texture_id : ImTextureID, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, uv1 : ImGui::ImVec2, uv2 : ImGui::ImVec2, uv3 : ImGui::ImVec2, uv4 : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddImageRounded(self : ImDrawList*, user_texture_id : ImTextureID, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, uv_min : ImGui::ImVec2, uv_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags)
  fun ImDrawList_PathClear(self : ImDrawList*)
  fun ImDrawList_PathLineTo(self : ImDrawList*, pos : ImGui::ImVec2)
  fun ImDrawList_PathLineToMergeDuplicate(self : ImDrawList*, pos : ImGui::ImVec2)
  fun ImDrawList_PathFillConvex(self : ImDrawList*, col : UInt32)
  fun ImDrawList_PathStroke(self : ImDrawList*, col : UInt32, closed : Bool, thickness : LibC::Float)
  fun ImDrawList_PathArcTo(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, a_min : LibC::Float, a_max : LibC::Float, num_segments : LibC::Int)
  fun ImDrawList_PathArcToFast(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, a_min_of_12 : LibC::Int, a_max_of_12 : LibC::Int)
  fun ImDrawList_PathBezierCubicCurveTo(self : ImDrawList*, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, num_segments : LibC::Int)
  fun ImDrawList_PathBezierQuadraticCurveTo(self : ImDrawList*, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, num_segments : LibC::Int)
  fun ImDrawList_PathRect(self : ImDrawList*, rect_min : ImGui::ImVec2, rect_max : ImGui::ImVec2, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags)
  fun ImDrawList_AddCallback(self : ImDrawList*, callback : ImDrawCallback, callback_data : Void*)
  fun ImDrawList_AddDrawCmd(self : ImDrawList*)
  fun ImDrawList_CloneOutput(self : ImDrawList*) : ImDrawList*
  fun ImDrawList_ChannelsSplit(self : ImDrawList*, count : LibC::Int)
  fun ImDrawList_ChannelsMerge(self : ImDrawList*)
  fun ImDrawList_ChannelsSetCurrent(self : ImDrawList*, n : LibC::Int)
  fun ImDrawList_PrimReserve(self : ImDrawList*, idx_count : LibC::Int, vtx_count : LibC::Int)
  fun ImDrawList_PrimUnreserve(self : ImDrawList*, idx_count : LibC::Int, vtx_count : LibC::Int)
  fun ImDrawList_PrimRect(self : ImDrawList*, a : ImGui::ImVec2, b : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_PrimRectUV(self : ImDrawList*, a : ImGui::ImVec2, b : ImGui::ImVec2, uv_a : ImGui::ImVec2, uv_b : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_PrimQuadUV(self : ImDrawList*, a : ImGui::ImVec2, b : ImGui::ImVec2, c : ImGui::ImVec2, d : ImGui::ImVec2, uv_a : ImGui::ImVec2, uv_b : ImGui::ImVec2, uv_c : ImGui::ImVec2, uv_d : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_PrimWriteVtx(self : ImDrawList*, pos : ImGui::ImVec2, uv : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_PrimWriteIdx(self : ImDrawList*, idx : ImDrawIdx)
  fun ImDrawList_PrimVtx(self : ImDrawList*, pos : ImGui::ImVec2, uv : ImGui::ImVec2, col : UInt32)

  struct ImDrawData
    valid : Bool
    cmd_lists : ImDrawList**
    cmd_lists_count : LibC::Int
    total_idx_count : LibC::Int
    total_vtx_count : LibC::Int
    display_pos : ImGui::ImVec2
    display_size : ImGui::ImVec2
    framebuffer_scale : ImGui::ImVec2
  end

  fun ImDrawData_ImDrawData : ImDrawData*
  fun ImDrawData_Clear(self : ImDrawData*)
  fun ImDrawData_DeIndexAllBuffers(self : ImDrawData*)
  fun ImDrawData_ScaleClipRects(self : ImDrawData*, fb_scale : ImGui::ImVec2)

  struct ImFontConfig
    font_data : Void*
    font_data_size : LibC::Int
    font_data_owned_by_atlas : Bool
    font_no : LibC::Int
    size_pixels : LibC::Float
    oversample_h : LibC::Int
    oversample_v : LibC::Int
    pixel_snap_h : Bool
    glyph_extra_spacing : ImGui::ImVec2
    glyph_offset : ImGui::ImVec2
    glyph_ranges : ImWchar*
    glyph_min_advance_x : LibC::Float
    glyph_max_advance_x : LibC::Float
    merge_mode : Bool
    rasterizer_flags : LibC::UInt
    rasterizer_multiply : LibC::Float
    ellipsis_char : ImWchar
    name : LibC::Char[40]
    dst_font : ImFont*
  end

  fun ImFontConfig_ImFontConfig : ImFontConfig*
  fun ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder : ImGui::ImFontGlyphRangesBuilder*
  fun ImFontGlyphRangesBuilder_Clear(self : ImGui::ImFontGlyphRangesBuilder*)
  fun ImFontGlyphRangesBuilder_GetBit(self : ImGui::ImFontGlyphRangesBuilder*, n : LibC::SizeT) : Bool
  fun ImFontGlyphRangesBuilder_SetBit(self : ImGui::ImFontGlyphRangesBuilder*, n : LibC::SizeT)
  fun ImFontGlyphRangesBuilder_AddChar(self : ImGui::ImFontGlyphRangesBuilder*, c : ImWchar)
  fun ImFontGlyphRangesBuilder_AddText(self : ImGui::ImFontGlyphRangesBuilder*, text : LibC::Char*, text_end : LibC::Char*)
  fun ImFontGlyphRangesBuilder_AddRanges(self : ImGui::ImFontGlyphRangesBuilder*, ranges : ImWchar*)
  fun ImFontGlyphRangesBuilder_BuildRanges(self : ImGui::ImFontGlyphRangesBuilder*, out_ranges : ImVectorInternal*)

  struct ImFontAtlasCustomRect
    width : LibC::UShort
    height : LibC::UShort
    x : LibC::UShort
    y : LibC::UShort
    glyph_id : LibC::UInt
    glyph_advance_x : LibC::Float
    glyph_offset : ImGui::ImVec2
    font : ImFont*
  end

  fun ImFontAtlasCustomRect_ImFontAtlasCustomRect : ImFontAtlasCustomRect*
  fun ImFontAtlasCustomRect_IsPacked(self : ImFontAtlasCustomRect*) : Bool

  struct ImFontAtlas
    locked : Bool
    flags : ImGui::ImFontAtlasFlags
    tex_id : ImTextureID
    tex_desired_width : LibC::Int
    tex_glyph_padding : LibC::Int
    tex_pixels_alpha8 : LibC::UChar*
    tex_pixels_rgba32 : LibC::UInt*
    tex_width : LibC::Int
    tex_height : LibC::Int
    tex_uv_scale : ImGui::ImVec2
    tex_uv_white_pixel : ImGui::ImVec2
    fonts : ImVectorInternal
    custom_rects : ImVectorInternal
    config_data : ImVectorInternal
    tex_uv_lines : ImGui::ImVec4[64]
    pack_id_mouse_cursors : LibC::Int
    pack_id_lines : LibC::Int
  end

  fun ImFontAtlas_ImFontAtlas : ImFontAtlas*
  fun ImFontAtlas_AddFont(self : ImFontAtlas*, font_cfg : ImFontConfig*) : ImFont*
  fun ImFontAtlas_AddFontDefault(self : ImFontAtlas*, font_cfg : ImFontConfig*) : ImFont*
  fun ImFontAtlas_AddFontFromFileTTF(self : ImFontAtlas*, filename : LibC::Char*, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_AddFontFromMemoryTTF(self : ImFontAtlas*, font_data : Void*, font_size : LibC::Int, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_AddFontFromMemoryCompressedTTF(self : ImFontAtlas*, compressed_font_data : Void*, compressed_font_size : LibC::Int, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self : ImFontAtlas*, compressed_font_data_base85 : LibC::Char*, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_ClearInputData(self : ImFontAtlas*)
  fun ImFontAtlas_ClearTexData(self : ImFontAtlas*)
  fun ImFontAtlas_ClearFonts(self : ImFontAtlas*)
  fun ImFontAtlas_Clear(self : ImFontAtlas*)
  fun ImFontAtlas_Build(self : ImFontAtlas*) : Bool
  fun ImFontAtlas_GetTexDataAsAlpha8(self : ImFontAtlas*, out_pixels : LibC::UChar**, out_width : LibC::Int*, out_height : LibC::Int*, out_bytes_per_pixel : LibC::Int*)
  fun ImFontAtlas_GetTexDataAsRGBA32(self : ImFontAtlas*, out_pixels : LibC::UChar**, out_width : LibC::Int*, out_height : LibC::Int*, out_bytes_per_pixel : LibC::Int*)
  fun ImFontAtlas_IsBuilt(self : ImFontAtlas*) : Bool
  fun ImFontAtlas_SetTexID(self : ImFontAtlas*, id : ImTextureID)
  fun ImFontAtlas_GetGlyphRangesDefault(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesKorean(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesJapanese(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesChineseFull(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesCyrillic(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesThai(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesVietnamese(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_AddCustomRectRegular(self : ImFontAtlas*, width : LibC::Int, height : LibC::Int) : LibC::Int
  fun ImFontAtlas_AddCustomRectFontGlyph(self : ImFontAtlas*, font : ImFont*, id : ImWchar, width : LibC::Int, height : LibC::Int, advance_x : LibC::Float, offset : ImGui::ImVec2) : LibC::Int
  fun ImFontAtlas_GetCustomRectByIndex(self : ImFontAtlas*, index : LibC::Int) : ImFontAtlasCustomRect*
  fun ImFontAtlas_CalcCustomRectUV(self : ImFontAtlas*, rect : ImFontAtlasCustomRect*, out_uv_min : ImGui::ImVec2*, out_uv_max : ImGui::ImVec2*)
  fun ImFontAtlas_GetMouseCursorTexData(self : ImFontAtlas*, cursor : ImGui::ImGuiMouseCursor, out_offset : ImGui::ImVec2*, out_size : ImGui::ImVec2*, out_uv_border : ImGui::ImVec2*, out_uv_fill : ImGui::ImVec2*) : Bool

  struct ImFont
    index_advance_x : ImVectorInternal
    fallback_advance_x : LibC::Float
    font_size : LibC::Float
    index_lookup : ImVectorInternal
    glyphs : ImVectorInternal
    fallback_glyph : ImGui::ImFontGlyph*
    container_atlas : ImFontAtlas*
    config_data : ImFontConfig*
    config_data_count : LibC::Short
    fallback_char : ImWchar
    ellipsis_char : ImWchar
    dirty_lookup_tables : Bool
    scale : LibC::Float
    ascent : LibC::Float
    descent : LibC::Float
    metrics_total_surface : LibC::Int
    used4k_pages_map : UInt8[2]
  end

  fun ImFont_ImFont : ImFont*
  fun ImFont_FindGlyph(self : ImFont*, c : ImWchar) : ImGui::ImFontGlyph*
  fun ImFont_FindGlyphNoFallback(self : ImFont*, c : ImWchar) : ImGui::ImFontGlyph*
  fun ImFont_GetCharAdvance(self : ImFont*, c : ImWchar) : LibC::Float
  fun ImFont_IsLoaded(self : ImFont*) : Bool
  fun ImFont_GetDebugName(self : ImFont*) : LibC::Char*
  fun ImFont_CalcTextSizeA(pOut : ImGui::ImVec2*, self : ImFont*, size : LibC::Float, max_width : LibC::Float, wrap_width : LibC::Float, text_begin : LibC::Char*, text_end : LibC::Char*, remaining : LibC::Char**)
  fun ImFont_CalcWordWrapPositionA(self : ImFont*, scale : LibC::Float, text : LibC::Char*, text_end : LibC::Char*, wrap_width : LibC::Float) : LibC::Char*
  fun ImFont_RenderChar(self : ImFont*, draw_list : ImDrawList*, size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, c : ImWchar)
  fun ImFont_RenderText(self : ImFont*, draw_list : ImDrawList*, size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, clip_rect : ImGui::ImVec4, text_begin : LibC::Char*, text_end : LibC::Char*, wrap_width : LibC::Float, cpu_fine_clip : Bool)
  fun ImFont_BuildLookupTable(self : ImFont*)
  fun ImFont_ClearOutputData(self : ImFont*)
  fun ImFont_GrowIndex(self : ImFont*, new_size : LibC::Int)
  fun ImFont_AddGlyph(self : ImFont*, src_cfg : ImFontConfig*, c : ImWchar, x0 : LibC::Float, y0 : LibC::Float, x1 : LibC::Float, y1 : LibC::Float, u0 : LibC::Float, v0 : LibC::Float, u1 : LibC::Float, v1 : LibC::Float, advance_x : LibC::Float)
  fun ImFont_AddRemapChar(self : ImFont*, dst : ImWchar, src : ImWchar, overwrite_dst : Bool)
  fun ImFont_SetGlyphVisible(self : ImFont*, c : ImWchar, visible : Bool)
  fun ImFont_SetFallbackChar(self : ImFont*, c : ImWchar)
  fun ImFont_IsGlyphRangeUnused(self : ImFont*, c_begin : LibC::UInt, c_last : LibC::UInt) : Bool
  type ImVec1 = Void*
  type ImVec2ih = Void*
  type ImRect = Void*
  type ImBitVector = Void*
  type ImDrawListSharedData = Void*
  type ImDrawDataBuilder = Void*
  type ImGuiDataTypeTempStorage = Void*
  type ImGuiDataTypeInfo = Void*
  type ImGuiColorMod = Void*
  type ImGuiStyleMod = Void*
  type ImGuiGroupData = Void*
  type ImGuiMenuColumns = Void*
  type ImGuiInputTextState = Void*
  type ImGuiPopupData = Void*
  type ImGuiNavMoveResult = Void*
  type ImGuiNextWindowData = Void*
  type ImGuiNextItemData = Void*
  type ImGuiShrinkWidthItem = Void*
  type ImGuiPtrOrIndex = Void*
  type ImGuiOldColumnData = Void*
  type ImGuiOldColumns = Void*
  type ImGuiWindowSettings = Void*
  type ImGuiSettingsHandler = Void*
  type ImGuiMetricsConfig = Void*
  type ImGuiStackSizes = Void*
  type ImGuiContextHook = Void*
  type ImGuiContext = Void*
  type ImGuiWindowTempData = Void*
  type ImGuiWindow = Void*
  type ImGuiLastItemDataBackup = Void*
  type ImGuiTabItem = Void*
  type ImGuiTabBar = Void*
  type ImGuiTableColumn = Void*
  type ImGuiTableCellData = Void*
  type ImGuiTable = Void*
  type ImGuiTableColumnSettings = Void*
  type ImGuiTableSettings = Void*
  type StbUndoRecord = Void*
  type StbUndoState = Void*
  type STB_TexteditState = Void*
  type StbTexteditRow = Void*
end
