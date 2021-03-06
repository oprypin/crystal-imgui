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
  fun ImVec2_ImVec2Nil = ImVec2_ImVec2Nil : ImGui::ImVec2*
  fun ImVec2_ImVec2Float = ImVec2_ImVec2Float(_x : LibC::Float, _y : LibC::Float) : ImGui::ImVec2*
  fun ImVec4_ImVec4Nil = ImVec4_ImVec4Nil : ImGui::ImVec4*
  fun ImVec4_ImVec4Float = ImVec4_ImVec4Float(_x : LibC::Float, _y : LibC::Float, _z : LibC::Float, _w : LibC::Float) : ImGui::ImVec4*
  fun CreateContext = igCreateContext(shared_font_atlas : ImFontAtlas*) : ImGuiContext*
  fun DestroyContext = igDestroyContext(ctx : ImGuiContext*)
  fun GetCurrentContext = igGetCurrentContext : ImGuiContext*
  fun SetCurrentContext = igSetCurrentContext(ctx : ImGuiContext*)
  fun GetIO = igGetIO : ImGuiIO*
  fun GetStyle = igGetStyle : ImGuiStyle*
  fun NewFrame = igNewFrame
  fun EndFrame = igEndFrame
  fun Render = igRender
  fun GetDrawData = igGetDrawData : ImDrawData*
  fun ShowDemoWindow = igShowDemoWindow(p_open : Bool*)
  fun ShowMetricsWindow = igShowMetricsWindow(p_open : Bool*)
  fun ShowAboutWindow = igShowAboutWindow(p_open : Bool*)
  fun ShowStyleEditor = igShowStyleEditor(ref : ImGuiStyle*)
  fun ShowStyleSelector = igShowStyleSelector(label : LibC::Char*) : Bool
  fun ShowFontSelector = igShowFontSelector(label : LibC::Char*)
  fun ShowUserGuide = igShowUserGuide
  fun GetVersion = igGetVersion : LibC::Char*
  fun StyleColorsDark = igStyleColorsDark(dst : ImGuiStyle*)
  fun StyleColorsLight = igStyleColorsLight(dst : ImGuiStyle*)
  fun StyleColorsClassic = igStyleColorsClassic(dst : ImGuiStyle*)
  fun Begin = igBegin(name : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun End = igEnd
  fun BeginChildStr = igBeginChildStr(str_id : LibC::Char*, size : ImGui::ImVec2, border : Bool, flags : ImGui::ImGuiWindowFlags) : Bool
  fun BeginChildID = igBeginChildID(id : ImGuiID, size : ImGui::ImVec2, border : Bool, flags : ImGui::ImGuiWindowFlags) : Bool
  fun EndChild = igEndChild
  fun IsWindowAppearing = igIsWindowAppearing : Bool
  fun IsWindowCollapsed = igIsWindowCollapsed : Bool
  fun IsWindowFocused = igIsWindowFocused(flags : ImGui::ImGuiFocusedFlags) : Bool
  fun IsWindowHovered = igIsWindowHovered(flags : ImGui::ImGuiHoveredFlags) : Bool
  fun GetWindowDrawList = igGetWindowDrawList : ImDrawList*
  fun GetWindowPos = igGetWindowPos(pOut : ImGui::ImVec2*)
  fun GetWindowSize = igGetWindowSize(pOut : ImGui::ImVec2*)
  fun GetWindowWidth = igGetWindowWidth : LibC::Float
  fun GetWindowHeight = igGetWindowHeight : LibC::Float
  fun SetNextWindowPos = igSetNextWindowPos(pos : ImGui::ImVec2, cond : ImGui::ImGuiCond, pivot : ImGui::ImVec2)
  fun SetNextWindowSize = igSetNextWindowSize(size : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetNextWindowSizeConstraints = igSetNextWindowSizeConstraints(size_min : ImGui::ImVec2, size_max : ImGui::ImVec2, custom_callback : ImGuiSizeCallback, custom_callback_data : Void*)
  fun SetNextWindowContentSize = igSetNextWindowContentSize(size : ImGui::ImVec2)
  fun SetNextWindowCollapsed = igSetNextWindowCollapsed(collapsed : Bool, cond : ImGui::ImGuiCond)
  fun SetNextWindowFocus = igSetNextWindowFocus
  fun SetNextWindowBgAlpha = igSetNextWindowBgAlpha(alpha : LibC::Float)
  fun SetWindowPosVec2 = igSetWindowPosVec2(pos : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowPosStr = igSetWindowPosStr(name : LibC::Char*, pos : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowSizeVec2 = igSetWindowSizeVec2(size : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowSizeStr = igSetWindowSizeStr(name : LibC::Char*, size : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowCollapsedBool = igSetWindowCollapsedBool(collapsed : Bool, cond : ImGui::ImGuiCond)
  fun SetWindowCollapsedStr = igSetWindowCollapsedStr(name : LibC::Char*, collapsed : Bool, cond : ImGui::ImGuiCond)
  fun SetWindowFocusNil = igSetWindowFocusNil
  fun SetWindowFocusStr = igSetWindowFocusStr(name : LibC::Char*)
  fun SetWindowFontScale = igSetWindowFontScale(scale : LibC::Float)
  fun GetContentRegionAvail = igGetContentRegionAvail(pOut : ImGui::ImVec2*)
  fun GetContentRegionMax = igGetContentRegionMax(pOut : ImGui::ImVec2*)
  fun GetWindowContentRegionMin = igGetWindowContentRegionMin(pOut : ImGui::ImVec2*)
  fun GetWindowContentRegionMax = igGetWindowContentRegionMax(pOut : ImGui::ImVec2*)
  fun GetWindowContentRegionWidth = igGetWindowContentRegionWidth : LibC::Float
  fun GetScrollX = igGetScrollX : LibC::Float
  fun GetScrollY = igGetScrollY : LibC::Float
  fun SetScrollXFloat = igSetScrollXFloat(scroll_x : LibC::Float)
  fun SetScrollYFloat = igSetScrollYFloat(scroll_y : LibC::Float)
  fun GetScrollMaxX = igGetScrollMaxX : LibC::Float
  fun GetScrollMaxY = igGetScrollMaxY : LibC::Float
  fun SetScrollHereX = igSetScrollHereX(center_x_ratio : LibC::Float)
  fun SetScrollHereY = igSetScrollHereY(center_y_ratio : LibC::Float)
  fun SetScrollFromPosXFloat = igSetScrollFromPosXFloat(local_x : LibC::Float, center_x_ratio : LibC::Float)
  fun SetScrollFromPosYFloat = igSetScrollFromPosYFloat(local_y : LibC::Float, center_y_ratio : LibC::Float)
  fun PushFont = igPushFont(font : ImFont*)
  fun PopFont = igPopFont
  fun PushStyleColorU32 = igPushStyleColorU32(idx : ImGui::ImGuiCol, col : UInt32)
  fun PushStyleColorVec4 = igPushStyleColorVec4(idx : ImGui::ImGuiCol, col : ImGui::ImVec4)
  fun PopStyleColor = igPopStyleColor(count : LibC::Int)
  fun PushStyleVarFloat = igPushStyleVarFloat(idx : ImGui::ImGuiStyleVar, val : LibC::Float)
  fun PushStyleVarVec2 = igPushStyleVarVec2(idx : ImGui::ImGuiStyleVar, val : ImGui::ImVec2)
  fun PopStyleVar = igPopStyleVar(count : LibC::Int)
  fun PushAllowKeyboardFocus = igPushAllowKeyboardFocus(allow_keyboard_focus : Bool)
  fun PopAllowKeyboardFocus = igPopAllowKeyboardFocus
  fun PushButtonRepeat = igPushButtonRepeat(repeat : Bool)
  fun PopButtonRepeat = igPopButtonRepeat
  fun PushItemWidth = igPushItemWidth(item_width : LibC::Float)
  fun PopItemWidth = igPopItemWidth
  fun SetNextItemWidth = igSetNextItemWidth(item_width : LibC::Float)
  fun CalcItemWidth = igCalcItemWidth : LibC::Float
  fun PushTextWrapPos = igPushTextWrapPos(wrap_local_pos_x : LibC::Float)
  fun PopTextWrapPos = igPopTextWrapPos
  fun GetFont = igGetFont : ImFont*
  fun GetFontSize = igGetFontSize : LibC::Float
  fun GetFontTexUvWhitePixel = igGetFontTexUvWhitePixel(pOut : ImGui::ImVec2*)
  fun GetColorU32Col = igGetColorU32Col(idx : ImGui::ImGuiCol, alpha_mul : LibC::Float) : UInt32
  fun GetColorU32Vec4 = igGetColorU32Vec4(col : ImGui::ImVec4) : UInt32
  fun GetColorU32U32 = igGetColorU32U32(col : UInt32) : UInt32
  fun GetStyleColorVec4 = igGetStyleColorVec4(idx : ImGui::ImGuiCol) : ImGui::ImVec4*
  fun Separator = igSeparator
  fun SameLine = igSameLine(offset_from_start_x : LibC::Float, spacing : LibC::Float)
  fun NewLine = igNewLine
  fun Spacing = igSpacing
  fun Dummy = igDummy(size : ImGui::ImVec2)
  fun Indent = igIndent(indent_w : LibC::Float)
  fun Unindent = igUnindent(indent_w : LibC::Float)
  fun BeginGroup = igBeginGroup
  fun EndGroup = igEndGroup
  fun GetCursorPos = igGetCursorPos(pOut : ImGui::ImVec2*)
  fun GetCursorPosX = igGetCursorPosX : LibC::Float
  fun GetCursorPosY = igGetCursorPosY : LibC::Float
  fun SetCursorPos = igSetCursorPos(local_pos : ImGui::ImVec2)
  fun SetCursorPosX = igSetCursorPosX(local_x : LibC::Float)
  fun SetCursorPosY = igSetCursorPosY(local_y : LibC::Float)
  fun GetCursorStartPos = igGetCursorStartPos(pOut : ImGui::ImVec2*)
  fun GetCursorScreenPos = igGetCursorScreenPos(pOut : ImGui::ImVec2*)
  fun SetCursorScreenPos = igSetCursorScreenPos(pos : ImGui::ImVec2)
  fun AlignTextToFramePadding = igAlignTextToFramePadding
  fun GetTextLineHeight = igGetTextLineHeight : LibC::Float
  fun GetTextLineHeightWithSpacing = igGetTextLineHeightWithSpacing : LibC::Float
  fun GetFrameHeight = igGetFrameHeight : LibC::Float
  fun GetFrameHeightWithSpacing = igGetFrameHeightWithSpacing : LibC::Float
  fun PushIDStr = igPushIDStr(str_id : LibC::Char*)
  fun PushIDStrStr = igPushIDStrStr(str_id_begin : LibC::Char*, str_id_end : LibC::Char*)
  fun PushIDPtr = igPushIDPtr(ptr_id : Void*)
  fun PushIDInt = igPushIDInt(int_id : LibC::Int)
  fun PopID = igPopID
  fun GetIDStr = igGetIDStr(str_id : LibC::Char*) : ImGuiID
  fun GetIDStrStr = igGetIDStrStr(str_id_begin : LibC::Char*, str_id_end : LibC::Char*) : ImGuiID
  fun GetIDPtr = igGetIDPtr(ptr_id : Void*) : ImGuiID
  fun TextUnformatted = igTextUnformatted(text : LibC::Char*, text_end : LibC::Char*)
  fun Text = igText(fmt : LibC::Char*, ...)
  fun TextColored = igTextColored(col : ImGui::ImVec4, fmt : LibC::Char*, ...)
  fun TextDisabled = igTextDisabled(fmt : LibC::Char*, ...)
  fun TextWrapped = igTextWrapped(fmt : LibC::Char*, ...)
  fun LabelText = igLabelText(label : LibC::Char*, fmt : LibC::Char*, ...)
  fun BulletText = igBulletText(fmt : LibC::Char*, ...)
  fun Button = igButton(label : LibC::Char*, size : ImGui::ImVec2) : Bool
  fun SmallButton = igSmallButton(label : LibC::Char*) : Bool
  fun InvisibleButton = igInvisibleButton(str_id : LibC::Char*, size : ImGui::ImVec2, flags : ImGui::ImGuiButtonFlags) : Bool
  fun ArrowButton = igArrowButton(str_id : LibC::Char*, dir : ImGui::ImGuiDir) : Bool
  fun Image = igImage(user_texture_id : ImTextureID, size : ImGui::ImVec2, uv0 : ImGui::ImVec2, uv1 : ImGui::ImVec2, tint_col : ImGui::ImVec4, border_col : ImGui::ImVec4)
  fun ImageButton = igImageButton(user_texture_id : ImTextureID, size : ImGui::ImVec2, uv0 : ImGui::ImVec2, uv1 : ImGui::ImVec2, frame_padding : LibC::Int, bg_col : ImGui::ImVec4, tint_col : ImGui::ImVec4) : Bool
  fun Checkbox = igCheckbox(label : LibC::Char*, v : Bool*) : Bool
  fun CheckboxFlagsIntPtr = igCheckboxFlagsIntPtr(label : LibC::Char*, flags : LibC::Int*, flags_value : LibC::Int) : Bool
  fun CheckboxFlagsUintPtr = igCheckboxFlagsUintPtr(label : LibC::Char*, flags : LibC::UInt*, flags_value : LibC::UInt) : Bool
  fun RadioButtonBool = igRadioButtonBool(label : LibC::Char*, active : Bool) : Bool
  fun RadioButtonIntPtr = igRadioButtonIntPtr(label : LibC::Char*, v : LibC::Int*, v_button : LibC::Int) : Bool
  fun ProgressBar = igProgressBar(fraction : LibC::Float, size_arg : ImGui::ImVec2, overlay : LibC::Char*)
  fun Bullet = igBullet
  fun BeginCombo = igBeginCombo(label : LibC::Char*, preview_value : LibC::Char*, flags : ImGui::ImGuiComboFlags) : Bool
  fun EndCombo = igEndCombo
  fun ComboStr_arr = igComboStr_arr(label : LibC::Char*, current_item : LibC::Int*, items : LibC::Char**, items_count : LibC::Int, popup_max_height_in_items : LibC::Int) : Bool
  fun ComboStr = igComboStr(label : LibC::Char*, current_item : LibC::Int*, items_separated_by_zeros : LibC::Char*, popup_max_height_in_items : LibC::Int) : Bool
  fun ComboFnBoolPtr = igComboFnBoolPtr(label : LibC::Char*, current_item : LibC::Int*, items_getter : (Void*, LibC::Int, LibC::Char**) -> Bool, data : Void*, items_count : LibC::Int, popup_max_height_in_items : LibC::Int) : Bool
  fun DragFloat = igDragFloat(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloat2 = igDragFloat2(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloat3 = igDragFloat3(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloat4 = igDragFloat4(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloatRange2 = igDragFloatRange2(label : LibC::Char*, v_current_min : LibC::Float*, v_current_max : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, format_max : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt = igDragInt(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt2 = igDragInt2(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt3 = igDragInt3(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt4 = igDragInt4(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragIntRange2 = igDragIntRange2(label : LibC::Char*, v_current_min : LibC::Int*, v_current_max : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, format_max : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragScalar = igDragScalar(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, v_speed : LibC::Float, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragScalarN = igDragScalarN(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, v_speed : LibC::Float, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat = igSliderFloat(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat2 = igSliderFloat2(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat3 = igSliderFloat3(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat4 = igSliderFloat4(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderAngle = igSliderAngle(label : LibC::Char*, v_rad : LibC::Float*, v_degrees_min : LibC::Float, v_degrees_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt = igSliderInt(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt2 = igSliderInt2(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt3 = igSliderInt3(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt4 = igSliderInt4(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderScalar = igSliderScalar(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderScalarN = igSliderScalarN(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun VSliderFloat = igVSliderFloat(label : LibC::Char*, size : ImGui::ImVec2, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun VSliderInt = igVSliderInt(label : LibC::Char*, size : ImGui::ImVec2, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun VSliderScalar = igVSliderScalar(label : LibC::Char*, size : ImGui::ImVec2, data_type : ImGui::ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun InputText = igInputText(label : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun InputTextMultiline = igInputTextMultiline(label : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, size : ImGui::ImVec2, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun InputTextWithHint = igInputTextWithHint(label : LibC::Char*, hint : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun InputFloat = igInputFloat(label : LibC::Char*, v : LibC::Float*, step : LibC::Float, step_fast : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputFloat2 = igInputFloat2(label : LibC::Char*, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputFloat3 = igInputFloat3(label : LibC::Char*, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputFloat4 = igInputFloat4(label : LibC::Char*, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt = igInputInt(label : LibC::Char*, v : LibC::Int*, step : LibC::Int, step_fast : LibC::Int, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt2 = igInputInt2(label : LibC::Char*, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt3 = igInputInt3(label : LibC::Char*, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt4 = igInputInt4(label : LibC::Char*, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputDouble = igInputDouble(label : LibC::Char*, v : LibC::Double*, step : LibC::Double, step_fast : LibC::Double, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputScalar = igInputScalar(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, p_step : Void*, p_step_fast : Void*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputScalarN = igInputScalarN(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, p_step : Void*, p_step_fast : Void*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun ColorEdit3 = igColorEdit3(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun ColorEdit4 = igColorEdit4(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun ColorPicker3 = igColorPicker3(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun ColorPicker4 = igColorPicker4(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags, ref_col : LibC::Float*) : Bool
  fun ColorButton = igColorButton(desc_id : LibC::Char*, col : ImGui::ImVec4, flags : ImGui::ImGuiColorEditFlags, size : ImGui::ImVec2) : Bool
  fun SetColorEditOptions = igSetColorEditOptions(flags : ImGui::ImGuiColorEditFlags)
  fun TreeNodeStr = igTreeNodeStr(label : LibC::Char*) : Bool
  fun TreeNodeStrStr = igTreeNodeStrStr(str_id : LibC::Char*, fmt : LibC::Char*, ...) : Bool
  fun TreeNodePtr = igTreeNodePtr(ptr_id : Void*, fmt : LibC::Char*, ...) : Bool
  fun TreeNodeExStr = igTreeNodeExStr(label : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun TreeNodeExStrStr = igTreeNodeExStrStr(str_id : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags, fmt : LibC::Char*, ...) : Bool
  fun TreeNodeExPtr = igTreeNodeExPtr(ptr_id : Void*, flags : ImGui::ImGuiTreeNodeFlags, fmt : LibC::Char*, ...) : Bool
  fun TreePushStr = igTreePushStr(str_id : LibC::Char*)
  fun TreePushPtr = igTreePushPtr(ptr_id : Void*)
  fun TreePop = igTreePop
  fun GetTreeNodeToLabelSpacing = igGetTreeNodeToLabelSpacing : LibC::Float
  fun CollapsingHeaderTreeNodeFlags = igCollapsingHeaderTreeNodeFlags(label : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun CollapsingHeaderBoolPtr = igCollapsingHeaderBoolPtr(label : LibC::Char*, p_visible : Bool*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun SetNextItemOpen = igSetNextItemOpen(is_open : Bool, cond : ImGui::ImGuiCond)
  fun SelectableBool = igSelectableBool(label : LibC::Char*, selected : Bool, flags : ImGui::ImGuiSelectableFlags, size : ImGui::ImVec2) : Bool
  fun SelectableBoolPtr = igSelectableBoolPtr(label : LibC::Char*, p_selected : Bool*, flags : ImGui::ImGuiSelectableFlags, size : ImGui::ImVec2) : Bool
  fun BeginListBox = igBeginListBox(label : LibC::Char*, size : ImGui::ImVec2) : Bool
  fun EndListBox = igEndListBox
  fun ListBoxStr_arr = igListBoxStr_arr(label : LibC::Char*, current_item : LibC::Int*, items : LibC::Char**, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun ListBoxFnBoolPtr = igListBoxFnBoolPtr(label : LibC::Char*, current_item : LibC::Int*, items_getter : (Void*, LibC::Int, LibC::Char**) -> Bool, data : Void*, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun PlotLinesFloatPtr = igPlotLinesFloatPtr(label : LibC::Char*, values : LibC::Float*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2, stride : LibC::Int)
  fun PlotLinesFnFloatPtr = igPlotLinesFnFloatPtr(label : LibC::Char*, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2)
  fun PlotHistogramFloatPtr = igPlotHistogramFloatPtr(label : LibC::Char*, values : LibC::Float*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2, stride : LibC::Int)
  fun PlotHistogramFnFloatPtr = igPlotHistogramFnFloatPtr(label : LibC::Char*, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2)
  fun ValueBool = igValueBool(prefix : LibC::Char*, b : Bool)
  fun ValueInt = igValueInt(prefix : LibC::Char*, v : LibC::Int)
  fun ValueUint = igValueUint(prefix : LibC::Char*, v : LibC::UInt)
  fun ValueFloat = igValueFloat(prefix : LibC::Char*, v : LibC::Float, float_format : LibC::Char*)
  fun BeginMenuBar = igBeginMenuBar : Bool
  fun EndMenuBar = igEndMenuBar
  fun BeginMainMenuBar = igBeginMainMenuBar : Bool
  fun EndMainMenuBar = igEndMainMenuBar
  fun BeginMenu = igBeginMenu(label : LibC::Char*, enabled : Bool) : Bool
  fun EndMenu = igEndMenu
  fun MenuItemBool = igMenuItemBool(label : LibC::Char*, shortcut : LibC::Char*, selected : Bool, enabled : Bool) : Bool
  fun MenuItemBoolPtr = igMenuItemBoolPtr(label : LibC::Char*, shortcut : LibC::Char*, p_selected : Bool*, enabled : Bool) : Bool
  fun BeginTooltip = igBeginTooltip
  fun EndTooltip = igEndTooltip
  fun SetTooltip = igSetTooltip(fmt : LibC::Char*, ...)
  fun BeginPopup = igBeginPopup(str_id : LibC::Char*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun BeginPopupModal = igBeginPopupModal(name : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun EndPopup = igEndPopup
  fun OpenPopup = igOpenPopup(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags)
  fun OpenPopupOnItemClick = igOpenPopupOnItemClick(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags)
  fun CloseCurrentPopup = igCloseCurrentPopup
  fun BeginPopupContextItem = igBeginPopupContextItem(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun BeginPopupContextWindow = igBeginPopupContextWindow(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun BeginPopupContextVoid = igBeginPopupContextVoid(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun IsPopupOpenStr = igIsPopupOpenStr(str_id : LibC::Char*, flags : ImGui::ImGuiPopupFlags) : Bool
  fun BeginTable = igBeginTable(str_id : LibC::Char*, column : LibC::Int, flags : ImGui::ImGuiTableFlags, outer_size : ImGui::ImVec2, inner_width : LibC::Float) : Bool
  fun EndTable = igEndTable
  fun TableNextRow = igTableNextRow(row_flags : ImGui::ImGuiTableRowFlags, min_row_height : LibC::Float)
  fun TableNextColumn = igTableNextColumn : Bool
  fun TableSetColumnIndex = igTableSetColumnIndex(column_n : LibC::Int) : Bool
  fun TableSetupColumn = igTableSetupColumn(label : LibC::Char*, flags : ImGui::ImGuiTableColumnFlags, init_width_or_weight : LibC::Float, user_id : UInt32)
  fun TableSetupScrollFreeze = igTableSetupScrollFreeze(cols : LibC::Int, rows : LibC::Int)
  fun TableHeadersRow = igTableHeadersRow
  fun TableHeader = igTableHeader(label : LibC::Char*)
  fun TableGetSortSpecs = igTableGetSortSpecs : ImGuiTableSortSpecs*
  fun TableGetColumnCount = igTableGetColumnCount : LibC::Int
  fun TableGetColumnIndex = igTableGetColumnIndex : LibC::Int
  fun TableGetRowIndex = igTableGetRowIndex : LibC::Int
  fun TableGetColumnNameInt = igTableGetColumnNameInt(column_n : LibC::Int) : LibC::Char*
  fun TableGetColumnFlags = igTableGetColumnFlags(column_n : LibC::Int) : ImGui::ImGuiTableColumnFlags
  fun TableSetBgColor = igTableSetBgColor(target : ImGui::ImGuiTableBgTarget, color : UInt32, column_n : LibC::Int)
  fun Columns = igColumns(count : LibC::Int, id : LibC::Char*, border : Bool)
  fun NextColumn = igNextColumn
  fun GetColumnIndex = igGetColumnIndex : LibC::Int
  fun GetColumnWidth = igGetColumnWidth(column_index : LibC::Int) : LibC::Float
  fun SetColumnWidth = igSetColumnWidth(column_index : LibC::Int, width : LibC::Float)
  fun GetColumnOffset = igGetColumnOffset(column_index : LibC::Int) : LibC::Float
  fun SetColumnOffset = igSetColumnOffset(column_index : LibC::Int, offset_x : LibC::Float)
  fun GetColumnsCount = igGetColumnsCount : LibC::Int
  fun BeginTabBar = igBeginTabBar(str_id : LibC::Char*, flags : ImGui::ImGuiTabBarFlags) : Bool
  fun EndTabBar = igEndTabBar
  fun BeginTabItem = igBeginTabItem(label : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiTabItemFlags) : Bool
  fun EndTabItem = igEndTabItem
  fun TabItemButton = igTabItemButton(label : LibC::Char*, flags : ImGui::ImGuiTabItemFlags) : Bool
  fun SetTabItemClosed = igSetTabItemClosed(tab_or_docked_window_label : LibC::Char*)
  fun LogToTTY = igLogToTTY(auto_open_depth : LibC::Int)
  fun LogToFile = igLogToFile(auto_open_depth : LibC::Int, filename : LibC::Char*)
  fun LogToClipboard = igLogToClipboard(auto_open_depth : LibC::Int)
  fun LogFinish = igLogFinish
  fun LogButtons = igLogButtons
  fun LogText = igLogText(fmt : LibC::Char*, ...)
  fun BeginDragDropSource = igBeginDragDropSource(flags : ImGui::ImGuiDragDropFlags) : Bool
  fun SetDragDropPayload = igSetDragDropPayload(type : LibC::Char*, data : Void*, sz : LibC::SizeT, cond : ImGui::ImGuiCond) : Bool
  fun EndDragDropSource = igEndDragDropSource
  fun BeginDragDropTarget = igBeginDragDropTarget : Bool
  fun AcceptDragDropPayload = igAcceptDragDropPayload(type : LibC::Char*, flags : ImGui::ImGuiDragDropFlags) : ImGuiPayload*
  fun EndDragDropTarget = igEndDragDropTarget
  fun GetDragDropPayload = igGetDragDropPayload : ImGuiPayload*
  fun PushClipRect = igPushClipRect(clip_rect_min : ImGui::ImVec2, clip_rect_max : ImGui::ImVec2, intersect_with_current_clip_rect : Bool)
  fun PopClipRect = igPopClipRect
  fun SetItemDefaultFocus = igSetItemDefaultFocus
  fun SetKeyboardFocusHere = igSetKeyboardFocusHere(offset : LibC::Int)
  fun IsItemHovered = igIsItemHovered(flags : ImGui::ImGuiHoveredFlags) : Bool
  fun IsItemActive = igIsItemActive : Bool
  fun IsItemFocused = igIsItemFocused : Bool
  fun IsItemClicked = igIsItemClicked(mouse_button : ImGui::ImGuiMouseButton) : Bool
  fun IsItemVisible = igIsItemVisible : Bool
  fun IsItemEdited = igIsItemEdited : Bool
  fun IsItemActivated = igIsItemActivated : Bool
  fun IsItemDeactivated = igIsItemDeactivated : Bool
  fun IsItemDeactivatedAfterEdit = igIsItemDeactivatedAfterEdit : Bool
  fun IsItemToggledOpen = igIsItemToggledOpen : Bool
  fun IsAnyItemHovered = igIsAnyItemHovered : Bool
  fun IsAnyItemActive = igIsAnyItemActive : Bool
  fun IsAnyItemFocused = igIsAnyItemFocused : Bool
  fun GetItemRectMin = igGetItemRectMin(pOut : ImGui::ImVec2*)
  fun GetItemRectMax = igGetItemRectMax(pOut : ImGui::ImVec2*)
  fun GetItemRectSize = igGetItemRectSize(pOut : ImGui::ImVec2*)
  fun SetItemAllowOverlap = igSetItemAllowOverlap
  fun GetMainViewport = igGetMainViewport : ImGuiViewport*
  fun IsRectVisibleNil = igIsRectVisibleNil(size : ImGui::ImVec2) : Bool
  fun IsRectVisibleVec2 = igIsRectVisibleVec2(rect_min : ImGui::ImVec2, rect_max : ImGui::ImVec2) : Bool
  fun GetTime = igGetTime : LibC::Double
  fun GetFrameCount = igGetFrameCount : LibC::Int
  fun GetBackgroundDrawListNil = igGetBackgroundDrawListNil : ImDrawList*
  fun GetForegroundDrawListNil = igGetForegroundDrawListNil : ImDrawList*
  fun GetDrawListSharedData = igGetDrawListSharedData : ImDrawListSharedData*
  fun GetStyleColorName = igGetStyleColorName(idx : ImGui::ImGuiCol) : LibC::Char*
  fun SetStateStorage = igSetStateStorage(storage : ImGui::ImGuiStorage*)
  fun GetStateStorage = igGetStateStorage : ImGui::ImGuiStorage*
  fun CalcListClipping = igCalcListClipping(items_count : LibC::Int, items_height : LibC::Float, out_items_display_start : LibC::Int*, out_items_display_end : LibC::Int*)
  fun BeginChildFrame = igBeginChildFrame(id : ImGuiID, size : ImGui::ImVec2, flags : ImGui::ImGuiWindowFlags) : Bool
  fun EndChildFrame = igEndChildFrame
  fun CalcTextSize = igCalcTextSize(pOut : ImGui::ImVec2*, text : LibC::Char*, text_end : LibC::Char*, hide_text_after_double_hash : Bool, wrap_width : LibC::Float)
  fun ColorConvertU32ToFloat4 = igColorConvertU32ToFloat4(pOut : ImGui::ImVec4*, in_ : UInt32)
  fun ColorConvertFloat4ToU32 = igColorConvertFloat4ToU32(in_ : ImGui::ImVec4) : UInt32
  fun ColorConvertRGBtoHSV = igColorConvertRGBtoHSV(r : LibC::Float, g : LibC::Float, b : LibC::Float, out_h : LibC::Float*, out_s : LibC::Float*, out_v : LibC::Float*)
  fun ColorConvertHSVtoRGB = igColorConvertHSVtoRGB(h : LibC::Float, s : LibC::Float, v : LibC::Float, out_r : LibC::Float*, out_g : LibC::Float*, out_b : LibC::Float*)
  fun GetKeyIndex = igGetKeyIndex(imgui_key : ImGui::ImGuiKey) : LibC::Int
  fun IsKeyDown = igIsKeyDown(user_key_index : LibC::Int) : Bool
  fun IsKeyPressed = igIsKeyPressed(user_key_index : LibC::Int, repeat : Bool) : Bool
  fun IsKeyReleased = igIsKeyReleased(user_key_index : LibC::Int) : Bool
  fun GetKeyPressedAmount = igGetKeyPressedAmount(key_index : LibC::Int, repeat_delay : LibC::Float, rate : LibC::Float) : LibC::Int
  fun CaptureKeyboardFromApp = igCaptureKeyboardFromApp(want_capture_keyboard_value : Bool)
  fun IsMouseDown = igIsMouseDown(button : ImGui::ImGuiMouseButton) : Bool
  fun IsMouseClicked = igIsMouseClicked(button : ImGui::ImGuiMouseButton, repeat : Bool) : Bool
  fun IsMouseReleased = igIsMouseReleased(button : ImGui::ImGuiMouseButton) : Bool
  fun IsMouseDoubleClicked = igIsMouseDoubleClicked(button : ImGui::ImGuiMouseButton) : Bool
  fun IsMouseHoveringRect = igIsMouseHoveringRect(r_min : ImGui::ImVec2, r_max : ImGui::ImVec2, clip : Bool) : Bool
  fun IsMousePosValid = igIsMousePosValid(mouse_pos : ImGui::ImVec2*) : Bool
  fun IsAnyMouseDown = igIsAnyMouseDown : Bool
  fun GetMousePos = igGetMousePos(pOut : ImGui::ImVec2*)
  fun GetMousePosOnOpeningCurrentPopup = igGetMousePosOnOpeningCurrentPopup(pOut : ImGui::ImVec2*)
  fun IsMouseDragging = igIsMouseDragging(button : ImGui::ImGuiMouseButton, lock_threshold : LibC::Float) : Bool
  fun GetMouseDragDelta = igGetMouseDragDelta(pOut : ImGui::ImVec2*, button : ImGui::ImGuiMouseButton, lock_threshold : LibC::Float)
  fun ResetMouseDragDelta = igResetMouseDragDelta(button : ImGui::ImGuiMouseButton)
  fun GetMouseCursor = igGetMouseCursor : ImGui::ImGuiMouseCursor
  fun SetMouseCursor = igSetMouseCursor(cursor_type : ImGui::ImGuiMouseCursor)
  fun CaptureMouseFromApp = igCaptureMouseFromApp(want_capture_mouse_value : Bool)
  fun GetClipboardText = igGetClipboardText : LibC::Char*
  fun SetClipboardText = igSetClipboardText(text : LibC::Char*)
  fun LoadIniSettingsFromDisk = igLoadIniSettingsFromDisk(ini_filename : LibC::Char*)
  fun LoadIniSettingsFromMemory = igLoadIniSettingsFromMemory(ini_data : LibC::Char*, ini_size : LibC::SizeT)
  fun SaveIniSettingsToDisk = igSaveIniSettingsToDisk(ini_filename : LibC::Char*)
  fun SaveIniSettingsToMemory = igSaveIniSettingsToMemory(out_ini_size : LibC::SizeT*) : LibC::Char*
  fun DebugCheckVersionAndDataLayout = igDebugCheckVersionAndDataLayout(version_str : LibC::Char*, sz_io : LibC::SizeT, sz_style : LibC::SizeT, sz_vec2 : LibC::SizeT, sz_vec4 : LibC::SizeT, sz_drawvert : LibC::SizeT, sz_drawidx : LibC::SizeT) : Bool
  fun SetAllocatorFunctions = igSetAllocatorFunctions(alloc_func : (LibC::SizeT, Void*) -> Void*, free_func : (Void*, Void*) -> Void, user_data : Void*)
  fun MemAlloc = igMemAlloc(size : LibC::SizeT) : Void*
  fun MemFree = igMemFree(ptr : Void*)

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

  fun ImGuiStyle_ImGuiStyle = ImGuiStyle_ImGuiStyle : ImGuiStyle*
  fun ImGuiStyle_ScaleAllSizes = ImGuiStyle_ScaleAllSizes(self : ImGuiStyle*, scale_factor : LibC::Float)

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

  fun ImGuiIO_AddInputCharacter = ImGuiIO_AddInputCharacter(self : ImGuiIO*, c : LibC::UInt)
  fun ImGuiIO_AddInputCharacterUTF16 = ImGuiIO_AddInputCharacterUTF16(self : ImGuiIO*, c : ImWchar16)
  fun ImGuiIO_AddInputCharactersUTF8 = ImGuiIO_AddInputCharactersUTF8(self : ImGuiIO*, str : LibC::Char*)
  fun ImGuiIO_ClearInputCharacters = ImGuiIO_ClearInputCharacters(self : ImGuiIO*)
  fun ImGuiIO_ImGuiIO = ImGuiIO_ImGuiIO : ImGuiIO*

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

  fun ImGuiInputTextCallbackData_ImGuiInputTextCallbackData = ImGuiInputTextCallbackData_ImGuiInputTextCallbackData : ImGuiInputTextCallbackData*
  fun ImGuiInputTextCallbackData_DeleteChars = ImGuiInputTextCallbackData_DeleteChars(self : ImGuiInputTextCallbackData*, pos : LibC::Int, bytes_count : LibC::Int)
  fun ImGuiInputTextCallbackData_InsertChars = ImGuiInputTextCallbackData_InsertChars(self : ImGuiInputTextCallbackData*, pos : LibC::Int, text : LibC::Char*, text_end : LibC::Char*)
  fun ImGuiInputTextCallbackData_SelectAll = ImGuiInputTextCallbackData_SelectAll(self : ImGuiInputTextCallbackData*)
  fun ImGuiInputTextCallbackData_ClearSelection = ImGuiInputTextCallbackData_ClearSelection(self : ImGuiInputTextCallbackData*)
  fun ImGuiInputTextCallbackData_HasSelection = ImGuiInputTextCallbackData_HasSelection(self : ImGuiInputTextCallbackData*) : Bool

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

  fun ImGuiPayload_ImGuiPayload = ImGuiPayload_ImGuiPayload : ImGuiPayload*
  fun ImGuiPayload_Clear = ImGuiPayload_Clear(self : ImGuiPayload*)
  fun ImGuiPayload_IsDataType = ImGuiPayload_IsDataType(self : ImGuiPayload*, type : LibC::Char*) : Bool
  fun ImGuiPayload_IsPreview = ImGuiPayload_IsPreview(self : ImGuiPayload*) : Bool
  fun ImGuiPayload_IsDelivery = ImGuiPayload_IsDelivery(self : ImGuiPayload*) : Bool

  struct ImGuiTableColumnSortSpecs
    column_user_id : ImGuiID
    column_index : Int16
    sort_order : Int16
    sort_direction : ImGui::ImGuiSortDirection
  end

  fun ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs = ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs : ImGuiTableColumnSortSpecs*

  struct ImGuiTableSortSpecs
    specs : ImGuiTableColumnSortSpecs*
    specs_count : LibC::Int
    specs_dirty : Bool
  end

  fun ImGuiTableSortSpecs_ImGuiTableSortSpecs = ImGuiTableSortSpecs_ImGuiTableSortSpecs : ImGuiTableSortSpecs*
  fun ImGuiOnceUponAFrame_ImGuiOnceUponAFrame = ImGuiOnceUponAFrame_ImGuiOnceUponAFrame : ImGui::ImGuiOnceUponAFrame*

  struct ImGuiTextFilter
    input_buf : LibC::Char[256]
    filters : ImVectorInternal
    count_grep : LibC::Int
  end

  fun ImGuiTextFilter_ImGuiTextFilter = ImGuiTextFilter_ImGuiTextFilter(default_filter : LibC::Char*) : ImGuiTextFilter*
  fun ImGuiTextFilter_Draw = ImGuiTextFilter_Draw(self : ImGuiTextFilter*, label : LibC::Char*, width : LibC::Float) : Bool
  fun ImGuiTextFilter_PassFilter = ImGuiTextFilter_PassFilter(self : ImGuiTextFilter*, text : LibC::Char*, text_end : LibC::Char*) : Bool
  fun ImGuiTextFilter_Build = ImGuiTextFilter_Build(self : ImGuiTextFilter*)
  fun ImGuiTextFilter_Clear = ImGuiTextFilter_Clear(self : ImGuiTextFilter*)
  fun ImGuiTextFilter_IsActive = ImGuiTextFilter_IsActive(self : ImGuiTextFilter*) : Bool
  type ImGuiTextRange = Void*
  fun ImGuiTextRange_ImGuiTextRangeNil = ImGuiTextRange_ImGuiTextRangeNil : ImGuiTextRange*
  fun ImGuiTextRange_ImGuiTextRangeStr = ImGuiTextRange_ImGuiTextRangeStr(_b : LibC::Char*, _e : LibC::Char*) : ImGuiTextRange*
  fun ImGuiTextRange_empty = ImGuiTextRange_empty(self : ImGuiTextRange*) : Bool
  fun ImGuiTextRange_split = ImGuiTextRange_split(self : ImGuiTextRange*, separator : LibC::Char, out : ImVectorInternal*)
  type ImGuiTextBuffer = Void*
  fun ImGuiTextBuffer_ImGuiTextBuffer = ImGuiTextBuffer_ImGuiTextBuffer : ImGuiTextBuffer*
  fun ImGuiTextBuffer_begin = ImGuiTextBuffer_begin(self : ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_end = ImGuiTextBuffer_end(self : ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_size = ImGuiTextBuffer_size(self : ImGuiTextBuffer*) : LibC::Int
  fun ImGuiTextBuffer_empty = ImGuiTextBuffer_empty(self : ImGuiTextBuffer*) : Bool
  fun ImGuiTextBuffer_clear = ImGuiTextBuffer_clear(self : ImGuiTextBuffer*)
  fun ImGuiTextBuffer_reserve = ImGuiTextBuffer_reserve(self : ImGuiTextBuffer*, capacity : LibC::Int)
  fun ImGuiTextBuffer_c_str = ImGuiTextBuffer_c_str(self : ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_append = ImGuiTextBuffer_append(self : ImGuiTextBuffer*, str : LibC::Char*, str_end : LibC::Char*)
  fun ImGuiTextBuffer_appendf = ImGuiTextBuffer_appendf(self : ImGuiTextBuffer*, fmt : LibC::Char*, ...)
  type ImGuiStoragePair = Void*
  fun ImGuiStoragePair_ImGuiStoragePairInt = ImGuiStoragePair_ImGuiStoragePairInt(_key : ImGuiID, _val_i : LibC::Int) : ImGuiStoragePair*
  fun ImGuiStoragePair_ImGuiStoragePairFloat = ImGuiStoragePair_ImGuiStoragePairFloat(_key : ImGuiID, _val_f : LibC::Float) : ImGuiStoragePair*
  fun ImGuiStoragePair_ImGuiStoragePairPtr = ImGuiStoragePair_ImGuiStoragePairPtr(_key : ImGuiID, _val_p : Void*) : ImGuiStoragePair*
  fun ImGuiStorage_Clear = ImGuiStorage_Clear(self : ImGui::ImGuiStorage*)
  fun ImGuiStorage_GetInt = ImGuiStorage_GetInt(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : LibC::Int) : LibC::Int
  fun ImGuiStorage_SetInt = ImGuiStorage_SetInt(self : ImGui::ImGuiStorage*, key : ImGuiID, val : LibC::Int)
  fun ImGuiStorage_GetBool = ImGuiStorage_GetBool(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : Bool) : Bool
  fun ImGuiStorage_SetBool = ImGuiStorage_SetBool(self : ImGui::ImGuiStorage*, key : ImGuiID, val : Bool)
  fun ImGuiStorage_GetFloat = ImGuiStorage_GetFloat(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : LibC::Float) : LibC::Float
  fun ImGuiStorage_SetFloat = ImGuiStorage_SetFloat(self : ImGui::ImGuiStorage*, key : ImGuiID, val : LibC::Float)
  fun ImGuiStorage_GetVoidPtr = ImGuiStorage_GetVoidPtr(self : ImGui::ImGuiStorage*, key : ImGuiID) : Void*
  fun ImGuiStorage_SetVoidPtr = ImGuiStorage_SetVoidPtr(self : ImGui::ImGuiStorage*, key : ImGuiID, val : Void*)
  fun ImGuiStorage_GetIntRef = ImGuiStorage_GetIntRef(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : LibC::Int) : LibC::Int*
  fun ImGuiStorage_GetBoolRef = ImGuiStorage_GetBoolRef(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : Bool) : Bool*
  fun ImGuiStorage_GetFloatRef = ImGuiStorage_GetFloatRef(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : LibC::Float) : LibC::Float*
  fun ImGuiStorage_GetVoidPtrRef = ImGuiStorage_GetVoidPtrRef(self : ImGui::ImGuiStorage*, key : ImGuiID, default_val : Void*) : Void**
  fun ImGuiStorage_SetAllInt = ImGuiStorage_SetAllInt(self : ImGui::ImGuiStorage*, val : LibC::Int)
  fun ImGuiStorage_BuildSortByKey = ImGuiStorage_BuildSortByKey(self : ImGui::ImGuiStorage*)
  fun ImGuiListClipper_ImGuiListClipper = ImGuiListClipper_ImGuiListClipper : ImGui::ImGuiListClipper*
  fun ImGuiListClipper_Begin = ImGuiListClipper_Begin(self : ImGui::ImGuiListClipper*, items_count : LibC::Int, items_height : LibC::Float)
  fun ImGuiListClipper_End = ImGuiListClipper_End(self : ImGui::ImGuiListClipper*)
  fun ImGuiListClipper_Step = ImGuiListClipper_Step(self : ImGui::ImGuiListClipper*) : Bool
  fun ImColor_ImColorNil = ImColor_ImColorNil : ImGui::ImColor*
  fun ImColor_ImColorInt = ImColor_ImColorInt(r : LibC::Int, g : LibC::Int, b : LibC::Int, a : LibC::Int) : ImGui::ImColor*
  fun ImColor_ImColorU32 = ImColor_ImColorU32(rgba : UInt32) : ImGui::ImColor*
  fun ImColor_ImColorFloat = ImColor_ImColorFloat(r : LibC::Float, g : LibC::Float, b : LibC::Float, a : LibC::Float) : ImGui::ImColor*
  fun ImColor_ImColorVec4 = ImColor_ImColorVec4(col : ImGui::ImVec4) : ImGui::ImColor*
  fun ImColor_SetHSV = ImColor_SetHSV(self : ImGui::ImColor*, h : LibC::Float, s : LibC::Float, v : LibC::Float, a : LibC::Float)
  fun ImColor_HSV = ImColor_HSV(pOut : ImGui::ImColor*, h : LibC::Float, s : LibC::Float, v : LibC::Float, a : LibC::Float)

  struct ImDrawCmd
    clip_rect : ImGui::ImVec4
    texture_id : ImTextureID
    vtx_offset : LibC::UInt
    idx_offset : LibC::UInt
    elem_count : LibC::UInt
    user_callback : ImDrawCallback
    user_callback_data : Void*
  end

  fun ImDrawCmd_ImDrawCmd = ImDrawCmd_ImDrawCmd : ImDrawCmd*

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

  fun ImDrawListSplitter_ImDrawListSplitter = ImDrawListSplitter_ImDrawListSplitter : ImDrawListSplitter*
  fun ImDrawListSplitter_Clear = ImDrawListSplitter_Clear(self : ImDrawListSplitter*)
  fun ImDrawListSplitter_ClearFreeMemory = ImDrawListSplitter_ClearFreeMemory(self : ImDrawListSplitter*)
  fun ImDrawListSplitter_Split = ImDrawListSplitter_Split(self : ImDrawListSplitter*, draw_list : ImDrawList*, count : LibC::Int)
  fun ImDrawListSplitter_Merge = ImDrawListSplitter_Merge(self : ImDrawListSplitter*, draw_list : ImDrawList*)
  fun ImDrawListSplitter_SetCurrentChannel = ImDrawListSplitter_SetCurrentChannel(self : ImDrawListSplitter*, draw_list : ImDrawList*, channel_idx : LibC::Int)

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

  fun ImDrawList_ImDrawList = ImDrawList_ImDrawList(shared_data : ImDrawListSharedData*) : ImDrawList*
  fun ImDrawList_PushClipRect = ImDrawList_PushClipRect(self : ImDrawList*, clip_rect_min : ImGui::ImVec2, clip_rect_max : ImGui::ImVec2, intersect_with_current_clip_rect : Bool)
  fun ImDrawList_PushClipRectFullScreen = ImDrawList_PushClipRectFullScreen(self : ImDrawList*)
  fun ImDrawList_PopClipRect = ImDrawList_PopClipRect(self : ImDrawList*)
  fun ImDrawList_PushTextureID = ImDrawList_PushTextureID(self : ImDrawList*, texture_id : ImTextureID)
  fun ImDrawList_PopTextureID = ImDrawList_PopTextureID(self : ImDrawList*)
  fun ImDrawList_GetClipRectMin = ImDrawList_GetClipRectMin(pOut : ImGui::ImVec2*, self : ImDrawList*)
  fun ImDrawList_GetClipRectMax = ImDrawList_GetClipRectMax(pOut : ImGui::ImVec2*, self : ImDrawList*)
  fun ImDrawList_AddLine = ImDrawList_AddLine(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float)
  fun ImDrawList_AddRect = ImDrawList_AddRect(self : ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags, thickness : LibC::Float)
  fun ImDrawList_AddRectFilled = ImDrawList_AddRectFilled(self : ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags)
  fun ImDrawList_AddRectFilledMultiColor = ImDrawList_AddRectFilledMultiColor(self : ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col_upr_left : UInt32, col_upr_right : UInt32, col_bot_right : UInt32, col_bot_left : UInt32)
  fun ImDrawList_AddQuad = ImDrawList_AddQuad(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float)
  fun ImDrawList_AddQuadFilled = ImDrawList_AddQuadFilled(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddTriangle = ImDrawList_AddTriangle(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float)
  fun ImDrawList_AddTriangleFilled = ImDrawList_AddTriangleFilled(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddCircle = ImDrawList_AddCircle(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int, thickness : LibC::Float)
  fun ImDrawList_AddCircleFilled = ImDrawList_AddCircleFilled(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int)
  fun ImDrawList_AddNgon = ImDrawList_AddNgon(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int, thickness : LibC::Float)
  fun ImDrawList_AddNgonFilled = ImDrawList_AddNgonFilled(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int)
  fun ImDrawList_AddTextVec2 = ImDrawList_AddTextVec2(self : ImDrawList*, pos : ImGui::ImVec2, col : UInt32, text_begin : LibC::Char*, text_end : LibC::Char*)
  fun ImDrawList_AddTextFontPtr = ImDrawList_AddTextFontPtr(self : ImDrawList*, font : ImFont*, font_size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, text_begin : LibC::Char*, text_end : LibC::Char*, wrap_width : LibC::Float, cpu_fine_clip_rect : ImGui::ImVec4*)
  fun ImDrawList_AddPolyline = ImDrawList_AddPolyline(self : ImDrawList*, points : ImGui::ImVec2*, num_points : LibC::Int, col : UInt32, closed : Bool, thickness : LibC::Float)
  fun ImDrawList_AddConvexPolyFilled = ImDrawList_AddConvexPolyFilled(self : ImDrawList*, points : ImGui::ImVec2*, num_points : LibC::Int, col : UInt32)
  fun ImDrawList_AddBezierCubic = ImDrawList_AddBezierCubic(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float, num_segments : LibC::Int)
  fun ImDrawList_AddBezierQuadratic = ImDrawList_AddBezierQuadratic(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float, num_segments : LibC::Int)
  fun ImDrawList_AddImage = ImDrawList_AddImage(self : ImDrawList*, user_texture_id : ImTextureID, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, uv_min : ImGui::ImVec2, uv_max : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddImageQuad = ImDrawList_AddImageQuad(self : ImDrawList*, user_texture_id : ImTextureID, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, uv1 : ImGui::ImVec2, uv2 : ImGui::ImVec2, uv3 : ImGui::ImVec2, uv4 : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddImageRounded = ImDrawList_AddImageRounded(self : ImDrawList*, user_texture_id : ImTextureID, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, uv_min : ImGui::ImVec2, uv_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags)
  fun ImDrawList_PathClear = ImDrawList_PathClear(self : ImDrawList*)
  fun ImDrawList_PathLineTo = ImDrawList_PathLineTo(self : ImDrawList*, pos : ImGui::ImVec2)
  fun ImDrawList_PathLineToMergeDuplicate = ImDrawList_PathLineToMergeDuplicate(self : ImDrawList*, pos : ImGui::ImVec2)
  fun ImDrawList_PathFillConvex = ImDrawList_PathFillConvex(self : ImDrawList*, col : UInt32)
  fun ImDrawList_PathStroke = ImDrawList_PathStroke(self : ImDrawList*, col : UInt32, closed : Bool, thickness : LibC::Float)
  fun ImDrawList_PathArcTo = ImDrawList_PathArcTo(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, a_min : LibC::Float, a_max : LibC::Float, num_segments : LibC::Int)
  fun ImDrawList_PathArcToFast = ImDrawList_PathArcToFast(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, a_min_of_12 : LibC::Int, a_max_of_12 : LibC::Int)
  fun ImDrawList_PathBezierCubicCurveTo = ImDrawList_PathBezierCubicCurveTo(self : ImDrawList*, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, num_segments : LibC::Int)
  fun ImDrawList_PathBezierQuadraticCurveTo = ImDrawList_PathBezierQuadraticCurveTo(self : ImDrawList*, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, num_segments : LibC::Int)
  fun ImDrawList_PathRect = ImDrawList_PathRect(self : ImDrawList*, rect_min : ImGui::ImVec2, rect_max : ImGui::ImVec2, rounding : LibC::Float, rounding_corners : ImGui::ImDrawCornerFlags)
  fun ImDrawList_AddCallback = ImDrawList_AddCallback(self : ImDrawList*, callback : ImDrawCallback, callback_data : Void*)
  fun ImDrawList_AddDrawCmd = ImDrawList_AddDrawCmd(self : ImDrawList*)
  fun ImDrawList_CloneOutput = ImDrawList_CloneOutput(self : ImDrawList*) : ImDrawList*
  fun ImDrawList_ChannelsSplit = ImDrawList_ChannelsSplit(self : ImDrawList*, count : LibC::Int)
  fun ImDrawList_ChannelsMerge = ImDrawList_ChannelsMerge(self : ImDrawList*)
  fun ImDrawList_ChannelsSetCurrent = ImDrawList_ChannelsSetCurrent(self : ImDrawList*, n : LibC::Int)
  fun ImDrawList_PrimReserve = ImDrawList_PrimReserve(self : ImDrawList*, idx_count : LibC::Int, vtx_count : LibC::Int)
  fun ImDrawList_PrimUnreserve = ImDrawList_PrimUnreserve(self : ImDrawList*, idx_count : LibC::Int, vtx_count : LibC::Int)
  fun ImDrawList_PrimRect = ImDrawList_PrimRect(self : ImDrawList*, a : ImGui::ImVec2, b : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_PrimRectUV = ImDrawList_PrimRectUV(self : ImDrawList*, a : ImGui::ImVec2, b : ImGui::ImVec2, uv_a : ImGui::ImVec2, uv_b : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_PrimQuadUV = ImDrawList_PrimQuadUV(self : ImDrawList*, a : ImGui::ImVec2, b : ImGui::ImVec2, c : ImGui::ImVec2, d : ImGui::ImVec2, uv_a : ImGui::ImVec2, uv_b : ImGui::ImVec2, uv_c : ImGui::ImVec2, uv_d : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_PrimWriteVtx = ImDrawList_PrimWriteVtx(self : ImDrawList*, pos : ImGui::ImVec2, uv : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_PrimWriteIdx = ImDrawList_PrimWriteIdx(self : ImDrawList*, idx : ImDrawIdx)
  fun ImDrawList_PrimVtx = ImDrawList_PrimVtx(self : ImDrawList*, pos : ImGui::ImVec2, uv : ImGui::ImVec2, col : UInt32)

  struct ImDrawData
    valid : Bool
    cmd_lists_count : LibC::Int
    total_idx_count : LibC::Int
    total_vtx_count : LibC::Int
    cmd_lists : ImDrawList**
    display_pos : ImGui::ImVec2
    display_size : ImGui::ImVec2
    framebuffer_scale : ImGui::ImVec2
  end

  fun ImDrawData_ImDrawData = ImDrawData_ImDrawData : ImDrawData*
  fun ImDrawData_Clear = ImDrawData_Clear(self : ImDrawData*)
  fun ImDrawData_DeIndexAllBuffers = ImDrawData_DeIndexAllBuffers(self : ImDrawData*)
  fun ImDrawData_ScaleClipRects = ImDrawData_ScaleClipRects(self : ImDrawData*, fb_scale : ImGui::ImVec2)

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
    font_builder_flags : LibC::UInt
    rasterizer_multiply : LibC::Float
    ellipsis_char : ImWchar
    name : LibC::Char[40]
    dst_font : ImFont*
  end

  fun ImFontConfig_ImFontConfig = ImFontConfig_ImFontConfig : ImFontConfig*
  fun ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder = ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder : ImGui::ImFontGlyphRangesBuilder*
  fun ImFontGlyphRangesBuilder_Clear = ImFontGlyphRangesBuilder_Clear(self : ImGui::ImFontGlyphRangesBuilder*)
  fun ImFontGlyphRangesBuilder_GetBit = ImFontGlyphRangesBuilder_GetBit(self : ImGui::ImFontGlyphRangesBuilder*, n : LibC::SizeT) : Bool
  fun ImFontGlyphRangesBuilder_SetBit = ImFontGlyphRangesBuilder_SetBit(self : ImGui::ImFontGlyphRangesBuilder*, n : LibC::SizeT)
  fun ImFontGlyphRangesBuilder_AddChar = ImFontGlyphRangesBuilder_AddChar(self : ImGui::ImFontGlyphRangesBuilder*, c : ImWchar)
  fun ImFontGlyphRangesBuilder_AddText = ImFontGlyphRangesBuilder_AddText(self : ImGui::ImFontGlyphRangesBuilder*, text : LibC::Char*, text_end : LibC::Char*)
  fun ImFontGlyphRangesBuilder_AddRanges = ImFontGlyphRangesBuilder_AddRanges(self : ImGui::ImFontGlyphRangesBuilder*, ranges : ImWchar*)
  fun ImFontGlyphRangesBuilder_BuildRanges = ImFontGlyphRangesBuilder_BuildRanges(self : ImGui::ImFontGlyphRangesBuilder*, out_ranges : ImVectorInternal*)

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

  fun ImFontAtlasCustomRect_ImFontAtlasCustomRect = ImFontAtlasCustomRect_ImFontAtlasCustomRect : ImFontAtlasCustomRect*
  fun ImFontAtlasCustomRect_IsPacked = ImFontAtlasCustomRect_IsPacked(self : ImFontAtlasCustomRect*) : Bool

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
    font_builder_io : ImFontBuilderIO*
    font_builder_flags : LibC::UInt
    pack_id_mouse_cursors : LibC::Int
    pack_id_lines : LibC::Int
  end

  fun ImFontAtlas_ImFontAtlas = ImFontAtlas_ImFontAtlas : ImFontAtlas*
  fun ImFontAtlas_AddFont = ImFontAtlas_AddFont(self : ImFontAtlas*, font_cfg : ImFontConfig*) : ImFont*
  fun ImFontAtlas_AddFontDefault = ImFontAtlas_AddFontDefault(self : ImFontAtlas*, font_cfg : ImFontConfig*) : ImFont*
  fun ImFontAtlas_AddFontFromFileTTF = ImFontAtlas_AddFontFromFileTTF(self : ImFontAtlas*, filename : LibC::Char*, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_AddFontFromMemoryTTF = ImFontAtlas_AddFontFromMemoryTTF(self : ImFontAtlas*, font_data : Void*, font_size : LibC::Int, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_AddFontFromMemoryCompressedTTF = ImFontAtlas_AddFontFromMemoryCompressedTTF(self : ImFontAtlas*, compressed_font_data : Void*, compressed_font_size : LibC::Int, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_AddFontFromMemoryCompressedBase85TTF = ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self : ImFontAtlas*, compressed_font_data_base85 : LibC::Char*, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_ClearInputData = ImFontAtlas_ClearInputData(self : ImFontAtlas*)
  fun ImFontAtlas_ClearTexData = ImFontAtlas_ClearTexData(self : ImFontAtlas*)
  fun ImFontAtlas_ClearFonts = ImFontAtlas_ClearFonts(self : ImFontAtlas*)
  fun ImFontAtlas_Clear = ImFontAtlas_Clear(self : ImFontAtlas*)
  fun ImFontAtlas_Build = ImFontAtlas_Build(self : ImFontAtlas*) : Bool
  fun ImFontAtlas_GetTexDataAsAlpha8 = ImFontAtlas_GetTexDataAsAlpha8(self : ImFontAtlas*, out_pixels : LibC::UChar**, out_width : LibC::Int*, out_height : LibC::Int*, out_bytes_per_pixel : LibC::Int*)
  fun ImFontAtlas_GetTexDataAsRGBA32 = ImFontAtlas_GetTexDataAsRGBA32(self : ImFontAtlas*, out_pixels : LibC::UChar**, out_width : LibC::Int*, out_height : LibC::Int*, out_bytes_per_pixel : LibC::Int*)
  fun ImFontAtlas_IsBuilt = ImFontAtlas_IsBuilt(self : ImFontAtlas*) : Bool
  fun ImFontAtlas_SetTexID = ImFontAtlas_SetTexID(self : ImFontAtlas*, id : ImTextureID)
  fun ImFontAtlas_GetGlyphRangesDefault = ImFontAtlas_GetGlyphRangesDefault(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesKorean = ImFontAtlas_GetGlyphRangesKorean(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesJapanese = ImFontAtlas_GetGlyphRangesJapanese(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesChineseFull = ImFontAtlas_GetGlyphRangesChineseFull(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon = ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesCyrillic = ImFontAtlas_GetGlyphRangesCyrillic(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesThai = ImFontAtlas_GetGlyphRangesThai(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_GetGlyphRangesVietnamese = ImFontAtlas_GetGlyphRangesVietnamese(self : ImFontAtlas*) : ImWchar*
  fun ImFontAtlas_AddCustomRectRegular = ImFontAtlas_AddCustomRectRegular(self : ImFontAtlas*, width : LibC::Int, height : LibC::Int) : LibC::Int
  fun ImFontAtlas_AddCustomRectFontGlyph = ImFontAtlas_AddCustomRectFontGlyph(self : ImFontAtlas*, font : ImFont*, id : ImWchar, width : LibC::Int, height : LibC::Int, advance_x : LibC::Float, offset : ImGui::ImVec2) : LibC::Int
  fun ImFontAtlas_GetCustomRectByIndex = ImFontAtlas_GetCustomRectByIndex(self : ImFontAtlas*, index : LibC::Int) : ImFontAtlasCustomRect*
  fun ImFontAtlas_CalcCustomRectUV = ImFontAtlas_CalcCustomRectUV(self : ImFontAtlas*, rect : ImFontAtlasCustomRect*, out_uv_min : ImGui::ImVec2*, out_uv_max : ImGui::ImVec2*)
  fun ImFontAtlas_GetMouseCursorTexData = ImFontAtlas_GetMouseCursorTexData(self : ImFontAtlas*, cursor : ImGui::ImGuiMouseCursor, out_offset : ImGui::ImVec2*, out_size : ImGui::ImVec2*, out_uv_border : ImGui::ImVec2*, out_uv_fill : ImGui::ImVec2*) : Bool

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

  fun ImFont_ImFont = ImFont_ImFont : ImFont*
  fun ImFont_FindGlyph = ImFont_FindGlyph(self : ImFont*, c : ImWchar) : ImGui::ImFontGlyph*
  fun ImFont_FindGlyphNoFallback = ImFont_FindGlyphNoFallback(self : ImFont*, c : ImWchar) : ImGui::ImFontGlyph*
  fun ImFont_GetCharAdvance = ImFont_GetCharAdvance(self : ImFont*, c : ImWchar) : LibC::Float
  fun ImFont_IsLoaded = ImFont_IsLoaded(self : ImFont*) : Bool
  fun ImFont_GetDebugName = ImFont_GetDebugName(self : ImFont*) : LibC::Char*
  fun ImFont_CalcTextSizeA = ImFont_CalcTextSizeA(pOut : ImGui::ImVec2*, self : ImFont*, size : LibC::Float, max_width : LibC::Float, wrap_width : LibC::Float, text_begin : LibC::Char*, text_end : LibC::Char*, remaining : LibC::Char**)
  fun ImFont_CalcWordWrapPositionA = ImFont_CalcWordWrapPositionA(self : ImFont*, scale : LibC::Float, text : LibC::Char*, text_end : LibC::Char*, wrap_width : LibC::Float) : LibC::Char*
  fun ImFont_RenderChar = ImFont_RenderChar(self : ImFont*, draw_list : ImDrawList*, size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, c : ImWchar)
  fun ImFont_RenderText = ImFont_RenderText(self : ImFont*, draw_list : ImDrawList*, size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, clip_rect : ImGui::ImVec4, text_begin : LibC::Char*, text_end : LibC::Char*, wrap_width : LibC::Float, cpu_fine_clip : Bool)
  fun ImFont_BuildLookupTable = ImFont_BuildLookupTable(self : ImFont*)
  fun ImFont_ClearOutputData = ImFont_ClearOutputData(self : ImFont*)
  fun ImFont_GrowIndex = ImFont_GrowIndex(self : ImFont*, new_size : LibC::Int)
  fun ImFont_AddGlyph = ImFont_AddGlyph(self : ImFont*, src_cfg : ImFontConfig*, c : ImWchar, x0 : LibC::Float, y0 : LibC::Float, x1 : LibC::Float, y1 : LibC::Float, u0 : LibC::Float, v0 : LibC::Float, u1 : LibC::Float, v1 : LibC::Float, advance_x : LibC::Float)
  fun ImFont_AddRemapChar = ImFont_AddRemapChar(self : ImFont*, dst : ImWchar, src : ImWchar, overwrite_dst : Bool)
  fun ImFont_SetGlyphVisible = ImFont_SetGlyphVisible(self : ImFont*, c : ImWchar, visible : Bool)
  fun ImFont_SetFallbackChar = ImFont_SetFallbackChar(self : ImFont*, c : ImWchar)
  fun ImFont_IsGlyphRangeUnused = ImFont_IsGlyphRangeUnused(self : ImFont*, c_begin : LibC::UInt, c_last : LibC::UInt) : Bool

  struct ImGuiViewport
    flags : ImGui::ImGuiViewportFlags
    pos : ImGui::ImVec2
    size : ImGui::ImVec2
    work_pos : ImGui::ImVec2
    work_size : ImGui::ImVec2
  end

  fun ImGuiViewport_ImGuiViewport = ImGuiViewport_ImGuiViewport : ImGuiViewport*
  fun ImGuiViewport_GetCenter = ImGuiViewport_GetCenter(pOut : ImGui::ImVec2*, self : ImGuiViewport*)
  fun ImGuiViewport_GetWorkCenter = ImGuiViewport_GetWorkCenter(pOut : ImGui::ImVec2*, self : ImGuiViewport*)
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
  type ImGuiViewportP = Void*
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
  type ImFontBuilderIO = Void*
  type StbUndoRecord = Void*
  type StbUndoState = Void*
  type STB_TexteditState = Void*
  type StbTexteditRow = Void*
end
