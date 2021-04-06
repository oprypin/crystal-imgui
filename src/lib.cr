require "./custom"
require "./types"

@[Link("cimgui")]
lib LibImGui
  alias ImBitArrayPtr = UInt32*
  alias ImDrawCallback = (ImDrawList*, ImDrawCmd*) -> Void
  alias ImDrawIdx = LibC::UShort
  alias ImFileHandle = Void*
  alias ImGuiContextHookCallback = (ImGuiContext*, ImGuiContextHook*) -> Void
  alias ImGuiErrorLogCallback = (Void*, LibC::Char*) -> Void
  alias ImGuiID = LibC::UInt
  alias ImGuiInputTextCallback = (ImGuiInputTextCallbackData*) -> LibC::Int
  alias ImGuiInputTextDeactivateData = Void
  alias ImGuiKeyChord = LibC::Int
  alias ImGuiKeyRoutingIndex = Int16
  alias ImGuiMemAllocFunc = (LibC::SizeT, Void*) -> Void*
  alias ImGuiMemFreeFunc = (Void*, Void*) -> Void
  alias ImGuiSizeCallback = (ImGuiSizeCallbackData*) -> Void
  alias ImGuiTableColumnIdx = Int16
  alias ImGuiTableColumnsSettings = Void
  alias ImGuiTableDrawChannelIdx = UInt16
  alias ImPoolIdx = LibC::Int
  alias ImTextureID = Void*
  alias ImWchar16 = LibC::UShort
  alias ImWchar32 = LibC::UInt
  fun ImVec2_ImVec2_Nil = ImVec2_ImVec2_Nil : ImGui::ImVec2*
  fun ImVec2_ImVec2_Float = ImVec2_ImVec2_Float(_x : LibC::Float, _y : LibC::Float) : ImGui::ImVec2*
  fun ImVec4_ImVec4_Nil = ImVec4_ImVec4_Nil : ImGui::ImVec4*
  fun ImVec4_ImVec4_Float = ImVec4_ImVec4_Float(_x : LibC::Float, _y : LibC::Float, _z : LibC::Float, _w : LibC::Float) : ImGui::ImVec4*
  fun ImStrv_ImStrv_Nil = ImStrv_ImStrv_Nil : ImGui::ImStrv*
  fun ImStrv_ImStrv_Str = ImStrv_ImStrv_Str(b : LibC::Char*) : ImGui::ImStrv*
  fun ImStrv_ImStrv_StrStr = ImStrv_ImStrv_StrStr(b : LibC::Char*, e : LibC::Char*) : ImGui::ImStrv*
  fun ImStrv_length = ImStrv_length(self : ImGui::ImStrv*) : LibC::SizeT
  fun ImStrv_empty = ImStrv_empty(self : ImGui::ImStrv*) : Bool
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
  fun ShowDebugLogWindow = igShowDebugLogWindow(p_open : Bool*)
  fun ShowStackToolWindow = igShowStackToolWindow(p_open : Bool*)
  fun ShowAboutWindow = igShowAboutWindow(p_open : Bool*)
  fun ShowStyleEditor = igShowStyleEditor(ref : ImGuiStyle*)
  fun ShowStyleSelector_Strv = igShowStyleSelector_Strv(label : ImGui::ImStrv) : Bool
  fun ShowStyleSelector_Str = igShowStyleSelector_Str(label : LibC::Char*) : Bool
  fun ShowFontSelector_Strv = igShowFontSelector_Strv(label : ImGui::ImStrv)
  fun ShowFontSelector_Str = igShowFontSelector_Str(label : LibC::Char*)
  fun ShowUserGuide = igShowUserGuide
  fun GetVersion = igGetVersion : LibC::Char*
  fun StyleColorsDark = igStyleColorsDark(dst : ImGuiStyle*)
  fun StyleColorsLight = igStyleColorsLight(dst : ImGuiStyle*)
  fun StyleColorsClassic = igStyleColorsClassic(dst : ImGuiStyle*)
  fun Begin_Strv = igBegin_Strv(name : ImGui::ImStrv, p_open : Bool*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun Begin_Str = igBegin_Str(name : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun End = igEnd
  fun BeginChild_Strv = igBeginChild_Strv(str_id : ImGui::ImStrv, size : ImGui::ImVec2, border : Bool, flags : ImGui::ImGuiWindowFlags) : Bool
  fun BeginChild_ID = igBeginChild_ID(id : ImGuiID, size : ImGui::ImVec2, border : Bool, flags : ImGui::ImGuiWindowFlags) : Bool
  fun BeginChild_Str = igBeginChild_Str(str_id : LibC::Char*, size : ImGui::ImVec2, border : Bool, flags : ImGui::ImGuiWindowFlags) : Bool
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
  fun SetNextWindowScroll = igSetNextWindowScroll(scroll : ImGui::ImVec2)
  fun SetNextWindowBgAlpha = igSetNextWindowBgAlpha(alpha : LibC::Float)
  fun SetWindowPos_Vec2 = igSetWindowPos_Vec2(pos : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowPos_Strv = igSetWindowPos_Strv(name : ImGui::ImStrv, pos : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowPos_WindowPtr = igSetWindowPos_WindowPtr(window : ImGuiWindow*, pos : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowPos_Str = igSetWindowPos_Str(name : LibC::Char*, pos : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowSize_Vec2 = igSetWindowSize_Vec2(size : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowSize_Strv = igSetWindowSize_Strv(name : ImGui::ImStrv, size : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowSize_WindowPtr = igSetWindowSize_WindowPtr(window : ImGuiWindow*, size : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowSize_Str = igSetWindowSize_Str(name : LibC::Char*, size : ImGui::ImVec2, cond : ImGui::ImGuiCond)
  fun SetWindowCollapsed_Bool = igSetWindowCollapsed_Bool(collapsed : Bool, cond : ImGui::ImGuiCond)
  fun SetWindowCollapsed_Strv = igSetWindowCollapsed_Strv(name : ImGui::ImStrv, collapsed : Bool, cond : ImGui::ImGuiCond)
  fun SetWindowCollapsed_WindowPtr = igSetWindowCollapsed_WindowPtr(window : ImGuiWindow*, collapsed : Bool, cond : ImGui::ImGuiCond)
  fun SetWindowCollapsed_Str = igSetWindowCollapsed_Str(name : LibC::Char*, collapsed : Bool, cond : ImGui::ImGuiCond)
  fun SetWindowFocus_Nil = igSetWindowFocus_Nil
  fun SetWindowFocus_Strv = igSetWindowFocus_Strv(name : ImGui::ImStrv)
  fun SetWindowFocus_Str = igSetWindowFocus_Str(name : LibC::Char*)
  fun SetWindowFontScale = igSetWindowFontScale(scale : LibC::Float)
  fun GetContentRegionAvail = igGetContentRegionAvail(pOut : ImGui::ImVec2*)
  fun GetContentRegionMax = igGetContentRegionMax(pOut : ImGui::ImVec2*)
  fun GetWindowContentRegionMin = igGetWindowContentRegionMin(pOut : ImGui::ImVec2*)
  fun GetWindowContentRegionMax = igGetWindowContentRegionMax(pOut : ImGui::ImVec2*)
  fun GetScrollX = igGetScrollX : LibC::Float
  fun GetScrollY = igGetScrollY : LibC::Float
  fun SetScrollX_Float = igSetScrollX_Float(scroll_x : LibC::Float)
  fun SetScrollX_WindowPtr = igSetScrollX_WindowPtr(window : ImGuiWindow*, scroll_x : LibC::Float)
  fun SetScrollY_Float = igSetScrollY_Float(scroll_y : LibC::Float)
  fun SetScrollY_WindowPtr = igSetScrollY_WindowPtr(window : ImGuiWindow*, scroll_y : LibC::Float)
  fun GetScrollMaxX = igGetScrollMaxX : LibC::Float
  fun GetScrollMaxY = igGetScrollMaxY : LibC::Float
  fun SetScrollHereX = igSetScrollHereX(center_x_ratio : LibC::Float)
  fun SetScrollHereY = igSetScrollHereY(center_y_ratio : LibC::Float)
  fun SetScrollFromPosX_Float = igSetScrollFromPosX_Float(local_x : LibC::Float, center_x_ratio : LibC::Float)
  fun SetScrollFromPosX_WindowPtr = igSetScrollFromPosX_WindowPtr(window : ImGuiWindow*, local_x : LibC::Float, center_x_ratio : LibC::Float)
  fun SetScrollFromPosY_Float = igSetScrollFromPosY_Float(local_y : LibC::Float, center_y_ratio : LibC::Float)
  fun SetScrollFromPosY_WindowPtr = igSetScrollFromPosY_WindowPtr(window : ImGuiWindow*, local_y : LibC::Float, center_y_ratio : LibC::Float)
  fun PushFont = igPushFont(font : ImFont*)
  fun PopFont = igPopFont
  fun PushStyleColor_U32 = igPushStyleColor_U32(idx : ImGui::ImGuiCol, col : UInt32)
  fun PushStyleColor_Vec4 = igPushStyleColor_Vec4(idx : ImGui::ImGuiCol, col : ImGui::ImVec4)
  fun PopStyleColor = igPopStyleColor(count : LibC::Int)
  fun PushStyleVar_Float = igPushStyleVar_Float(idx : ImGui::ImGuiStyleVar, val : LibC::Float)
  fun PushStyleVar_Vec2 = igPushStyleVar_Vec2(idx : ImGui::ImGuiStyleVar, val : ImGui::ImVec2)
  fun PopStyleVar = igPopStyleVar(count : LibC::Int)
  fun PushTabStop = igPushTabStop(tab_stop : Bool)
  fun PopTabStop = igPopTabStop
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
  fun GetColorU32_Col = igGetColorU32_Col(idx : ImGui::ImGuiCol, alpha_mul : LibC::Float) : UInt32
  fun GetColorU32_Vec4 = igGetColorU32_Vec4(col : ImGui::ImVec4) : UInt32
  fun GetColorU32_U32 = igGetColorU32_U32(col : UInt32) : UInt32
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
  fun PushID_Strv = igPushID_Strv(str_id : ImGui::ImStrv)
  fun PushID_Ptr = igPushID_Ptr(ptr_id : Void*)
  fun PushID_Int = igPushID_Int(int_id : LibC::Int)
  fun PushID_Str = igPushID_Str(str_id : LibC::Char*)
  fun PopID = igPopID
  fun GetID_Strv = igGetID_Strv(str_id : ImGui::ImStrv) : ImGuiID
  fun GetID_Ptr = igGetID_Ptr(ptr_id : Void*) : ImGuiID
  fun GetID_Str = igGetID_Str(str_id : LibC::Char*) : ImGuiID
  fun TextUnformatted_Strv = igTextUnformatted_Strv(text : ImGui::ImStrv)
  fun TextUnformatted_Str = igTextUnformatted_Str(text : LibC::Char*)
  fun Text = igText(fmt : LibC::Char*, ...)
  fun TextColored = igTextColored(col : ImGui::ImVec4, fmt : LibC::Char*, ...)
  fun TextDisabled = igTextDisabled(fmt : LibC::Char*, ...)
  fun TextWrapped = igTextWrapped(fmt : LibC::Char*, ...)
  fun LabelText_Strv = igLabelText_Strv(label : ImGui::ImStrv, fmt : LibC::Char*, ...)
  fun LabelText_Str = igLabelText_Str(label : LibC::Char*, fmt : LibC::Char*, ...)
  fun BulletText = igBulletText(fmt : LibC::Char*, ...)
  fun SeparatorText_Strv = igSeparatorText_Strv(label : ImGui::ImStrv)
  fun SeparatorText_Str = igSeparatorText_Str(label : LibC::Char*)
  fun Button_Strv = igButton_Strv(label : ImGui::ImStrv, size : ImGui::ImVec2) : Bool
  fun Button_Str = igButton_Str(label : LibC::Char*, size : ImGui::ImVec2) : Bool
  fun SmallButton_Strv = igSmallButton_Strv(label : ImGui::ImStrv) : Bool
  fun SmallButton_Str = igSmallButton_Str(label : LibC::Char*) : Bool
  fun InvisibleButton_Strv = igInvisibleButton_Strv(str_id : ImGui::ImStrv, size : ImGui::ImVec2, flags : ImGui::ImGuiButtonFlags) : Bool
  fun InvisibleButton_Str = igInvisibleButton_Str(str_id : LibC::Char*, size : ImGui::ImVec2, flags : ImGui::ImGuiButtonFlags) : Bool
  fun ArrowButton_Strv = igArrowButton_Strv(str_id : ImGui::ImStrv, dir : ImGui::ImGuiDir) : Bool
  fun ArrowButton_Str = igArrowButton_Str(str_id : LibC::Char*, dir : ImGui::ImGuiDir) : Bool
  fun Checkbox_Strv = igCheckbox_Strv(label : ImGui::ImStrv, v : Bool*) : Bool
  fun Checkbox_Str = igCheckbox_Str(label : LibC::Char*, v : Bool*) : Bool
  fun CheckboxFlags_StrvIntPtr = igCheckboxFlags_StrvIntPtr(label : ImGui::ImStrv, flags : LibC::Int*, flags_value : LibC::Int) : Bool
  fun CheckboxFlags_StrvUintPtr = igCheckboxFlags_StrvUintPtr(label : ImGui::ImStrv, flags : LibC::UInt*, flags_value : LibC::UInt) : Bool
  fun CheckboxFlags_StrvS64Ptr = igCheckboxFlags_StrvS64Ptr(label : ImGui::ImStrv, flags : Int64*, flags_value : Int64) : Bool
  fun CheckboxFlags_StrvU64Ptr = igCheckboxFlags_StrvU64Ptr(label : ImGui::ImStrv, flags : UInt64*, flags_value : UInt64) : Bool
  fun CheckboxFlags_StrIntPtr = igCheckboxFlags_StrIntPtr(label : LibC::Char*, flags : LibC::Int*, flags_value : LibC::Int) : Bool
  fun CheckboxFlags_StrUintPtr = igCheckboxFlags_StrUintPtr(label : LibC::Char*, flags : LibC::UInt*, flags_value : LibC::UInt) : Bool
  fun CheckboxFlags_StrS64Ptr = igCheckboxFlags_StrS64Ptr(label : LibC::Char*, flags : Int64*, flags_value : Int64) : Bool
  fun CheckboxFlags_StrU64Ptr = igCheckboxFlags_StrU64Ptr(label : LibC::Char*, flags : UInt64*, flags_value : UInt64) : Bool
  fun RadioButton_StrvBool = igRadioButton_StrvBool(label : ImGui::ImStrv, active : Bool) : Bool
  fun RadioButton_StrvIntPtr = igRadioButton_StrvIntPtr(label : ImGui::ImStrv, v : LibC::Int*, v_button : LibC::Int) : Bool
  fun RadioButton_StrBool = igRadioButton_StrBool(label : LibC::Char*, active : Bool) : Bool
  fun RadioButton_StrIntPtr = igRadioButton_StrIntPtr(label : LibC::Char*, v : LibC::Int*, v_button : LibC::Int) : Bool
  fun ProgressBar_Strv = igProgressBar_Strv(fraction : LibC::Float, size_arg : ImGui::ImVec2, overlay : ImGui::ImStrv)
  fun ProgressBar_Str = igProgressBar_Str(fraction : LibC::Float, size_arg : ImGui::ImVec2, overlay : LibC::Char*)
  fun Bullet = igBullet
  fun Image = igImage(user_texture_id : ImTextureID, size : ImGui::ImVec2, uv0 : ImGui::ImVec2, uv1 : ImGui::ImVec2, tint_col : ImGui::ImVec4, border_col : ImGui::ImVec4)
  fun ImageButton_Strv = igImageButton_Strv(str_id : ImGui::ImStrv, user_texture_id : ImTextureID, size : ImGui::ImVec2, uv0 : ImGui::ImVec2, uv1 : ImGui::ImVec2, bg_col : ImGui::ImVec4, tint_col : ImGui::ImVec4) : Bool
  fun ImageButton_Str = igImageButton_Str(str_id : LibC::Char*, user_texture_id : ImTextureID, size : ImGui::ImVec2, uv0 : ImGui::ImVec2, uv1 : ImGui::ImVec2, bg_col : ImGui::ImVec4, tint_col : ImGui::ImVec4) : Bool
  fun BeginCombo_Strv = igBeginCombo_Strv(label : ImGui::ImStrv, preview_value : ImGui::ImStrv, flags : ImGui::ImGuiComboFlags) : Bool
  fun BeginCombo_Str = igBeginCombo_Str(label : LibC::Char*, preview_value : LibC::Char*, flags : ImGui::ImGuiComboFlags) : Bool
  fun EndCombo = igEndCombo
  fun Combo_StrvStr_arr = igCombo_StrvStr_arr(label : ImGui::ImStrv, current_item : LibC::Int*, items : LibC::Char**, items_count : LibC::Int, popup_max_height_in_items : LibC::Int) : Bool
  fun Combo_StrvStr = igCombo_StrvStr(label : ImGui::ImStrv, current_item : LibC::Int*, items_separated_by_zeros : LibC::Char*, popup_max_height_in_items : LibC::Int) : Bool
  fun Combo_FnStrvBoolPtr = igCombo_FnStrvBoolPtr(label : ImGui::ImStrv, current_item : LibC::Int*, items_getter : (Void*, LibC::Int, LibC::Char**) -> Bool, data : Void*, items_count : LibC::Int, popup_max_height_in_items : LibC::Int) : Bool
  fun Combo_StrStr_arr = igCombo_StrStr_arr(label : LibC::Char*, current_item : LibC::Int*, items : LibC::Char**, items_count : LibC::Int, popup_max_height_in_items : LibC::Int) : Bool
  fun Combo_StrStr = igCombo_StrStr(label : LibC::Char*, current_item : LibC::Int*, items_separated_by_zeros : LibC::Char*, popup_max_height_in_items : LibC::Int) : Bool
  fun Combo_FnStrBoolPtr = igCombo_FnStrBoolPtr(label : LibC::Char*, current_item : LibC::Int*, items_getter : (Void*, LibC::Int, LibC::Char**) -> Bool, data : Void*, items_count : LibC::Int, popup_max_height_in_items : LibC::Int) : Bool
  fun DragFloat_Strv = igDragFloat_Strv(label : ImGui::ImStrv, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloat_Str = igDragFloat_Str(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloat2_Strv = igDragFloat2_Strv(label : ImGui::ImStrv, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloat2_Str = igDragFloat2_Str(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloat3_Strv = igDragFloat3_Strv(label : ImGui::ImStrv, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloat3_Str = igDragFloat3_Str(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloat4_Strv = igDragFloat4_Strv(label : ImGui::ImStrv, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloat4_Str = igDragFloat4_Str(label : LibC::Char*, v : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloatRange2_Strv = igDragFloatRange2_Strv(label : ImGui::ImStrv, v_current_min : LibC::Float*, v_current_max : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, format_max : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragFloatRange2_Str = igDragFloatRange2_Str(label : LibC::Char*, v_current_min : LibC::Float*, v_current_max : LibC::Float*, v_speed : LibC::Float, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, format_max : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt_Strv = igDragInt_Strv(label : ImGui::ImStrv, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt_Str = igDragInt_Str(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt2_Strv = igDragInt2_Strv(label : ImGui::ImStrv, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt2_Str = igDragInt2_Str(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt3_Strv = igDragInt3_Strv(label : ImGui::ImStrv, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt3_Str = igDragInt3_Str(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt4_Strv = igDragInt4_Strv(label : ImGui::ImStrv, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragInt4_Str = igDragInt4_Str(label : LibC::Char*, v : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragIntRange2_Strv = igDragIntRange2_Strv(label : ImGui::ImStrv, v_current_min : LibC::Int*, v_current_max : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, format_max : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragIntRange2_Str = igDragIntRange2_Str(label : LibC::Char*, v_current_min : LibC::Int*, v_current_max : LibC::Int*, v_speed : LibC::Float, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, format_max : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragScalar_Strv = igDragScalar_Strv(label : ImGui::ImStrv, data_type : ImGui::ImGuiDataType, p_data : Void*, v_speed : LibC::Float, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragScalar_Str = igDragScalar_Str(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, v_speed : LibC::Float, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragScalarN_Strv = igDragScalarN_Strv(label : ImGui::ImStrv, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, v_speed : LibC::Float, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun DragScalarN_Str = igDragScalarN_Str(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, v_speed : LibC::Float, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat_Strv = igSliderFloat_Strv(label : ImGui::ImStrv, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat_Str = igSliderFloat_Str(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat2_Strv = igSliderFloat2_Strv(label : ImGui::ImStrv, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat2_Str = igSliderFloat2_Str(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat3_Strv = igSliderFloat3_Strv(label : ImGui::ImStrv, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat3_Str = igSliderFloat3_Str(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat4_Strv = igSliderFloat4_Strv(label : ImGui::ImStrv, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderFloat4_Str = igSliderFloat4_Str(label : LibC::Char*, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderAngle_Strv = igSliderAngle_Strv(label : ImGui::ImStrv, v_rad : LibC::Float*, v_degrees_min : LibC::Float, v_degrees_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderAngle_Str = igSliderAngle_Str(label : LibC::Char*, v_rad : LibC::Float*, v_degrees_min : LibC::Float, v_degrees_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt_Strv = igSliderInt_Strv(label : ImGui::ImStrv, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt_Str = igSliderInt_Str(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt2_Strv = igSliderInt2_Strv(label : ImGui::ImStrv, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt2_Str = igSliderInt2_Str(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt3_Strv = igSliderInt3_Strv(label : ImGui::ImStrv, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt3_Str = igSliderInt3_Str(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt4_Strv = igSliderInt4_Strv(label : ImGui::ImStrv, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderInt4_Str = igSliderInt4_Str(label : LibC::Char*, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderScalar_Strv = igSliderScalar_Strv(label : ImGui::ImStrv, data_type : ImGui::ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderScalar_Str = igSliderScalar_Str(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderScalarN_Strv = igSliderScalarN_Strv(label : ImGui::ImStrv, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderScalarN_Str = igSliderScalarN_Str(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun VSliderFloat_Strv = igVSliderFloat_Strv(label : ImGui::ImStrv, size : ImGui::ImVec2, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun VSliderFloat_Str = igVSliderFloat_Str(label : LibC::Char*, size : ImGui::ImVec2, v : LibC::Float*, v_min : LibC::Float, v_max : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun VSliderInt_Strv = igVSliderInt_Strv(label : ImGui::ImStrv, size : ImGui::ImVec2, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun VSliderInt_Str = igVSliderInt_Str(label : LibC::Char*, size : ImGui::ImVec2, v : LibC::Int*, v_min : LibC::Int, v_max : LibC::Int, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun VSliderScalar_Strv = igVSliderScalar_Strv(label : ImGui::ImStrv, size : ImGui::ImVec2, data_type : ImGui::ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun VSliderScalar_Str = igVSliderScalar_Str(label : LibC::Char*, size : ImGui::ImVec2, data_type : ImGui::ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun InputText_Strv = igInputText_Strv(label : ImGui::ImStrv, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun InputText_Str = igInputText_Str(label : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun InputTextMultiline_Strv = igInputTextMultiline_Strv(label : ImGui::ImStrv, buf : LibC::Char*, buf_size : LibC::SizeT, size : ImGui::ImVec2, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun InputTextMultiline_Str = igInputTextMultiline_Str(label : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, size : ImGui::ImVec2, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun InputTextWithHint_Strv = igInputTextWithHint_Strv(label : ImGui::ImStrv, hint : ImGui::ImStrv, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun InputTextWithHint_Str = igInputTextWithHint_Str(label : LibC::Char*, hint : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun InputFloat_Strv = igInputFloat_Strv(label : ImGui::ImStrv, v : LibC::Float*, step : LibC::Float, step_fast : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputFloat_Str = igInputFloat_Str(label : LibC::Char*, v : LibC::Float*, step : LibC::Float, step_fast : LibC::Float, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputFloat2_Strv = igInputFloat2_Strv(label : ImGui::ImStrv, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputFloat2_Str = igInputFloat2_Str(label : LibC::Char*, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputFloat3_Strv = igInputFloat3_Strv(label : ImGui::ImStrv, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputFloat3_Str = igInputFloat3_Str(label : LibC::Char*, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputFloat4_Strv = igInputFloat4_Strv(label : ImGui::ImStrv, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputFloat4_Str = igInputFloat4_Str(label : LibC::Char*, v : LibC::Float*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt_Strv = igInputInt_Strv(label : ImGui::ImStrv, v : LibC::Int*, step : LibC::Int, step_fast : LibC::Int, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt_Str = igInputInt_Str(label : LibC::Char*, v : LibC::Int*, step : LibC::Int, step_fast : LibC::Int, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt2_Strv = igInputInt2_Strv(label : ImGui::ImStrv, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt2_Str = igInputInt2_Str(label : LibC::Char*, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt3_Strv = igInputInt3_Strv(label : ImGui::ImStrv, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt3_Str = igInputInt3_Str(label : LibC::Char*, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt4_Strv = igInputInt4_Strv(label : ImGui::ImStrv, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputInt4_Str = igInputInt4_Str(label : LibC::Char*, v : LibC::Int*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputDouble_Strv = igInputDouble_Strv(label : ImGui::ImStrv, v : LibC::Double*, step : LibC::Double, step_fast : LibC::Double, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputDouble_Str = igInputDouble_Str(label : LibC::Char*, v : LibC::Double*, step : LibC::Double, step_fast : LibC::Double, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputScalar_Strv = igInputScalar_Strv(label : ImGui::ImStrv, data_type : ImGui::ImGuiDataType, p_data : Void*, p_step : Void*, p_step_fast : Void*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputScalar_Str = igInputScalar_Str(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, p_step : Void*, p_step_fast : Void*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputScalarN_Strv = igInputScalarN_Strv(label : ImGui::ImStrv, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, p_step : Void*, p_step_fast : Void*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun InputScalarN_Str = igInputScalarN_Str(label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, components : LibC::Int, p_step : Void*, p_step_fast : Void*, format : LibC::Char*, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun ColorEdit3_Strv = igColorEdit3_Strv(label : ImGui::ImStrv, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun ColorEdit3_Str = igColorEdit3_Str(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun ColorEdit4_Strv = igColorEdit4_Strv(label : ImGui::ImStrv, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun ColorEdit4_Str = igColorEdit4_Str(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun ColorPicker3_Strv = igColorPicker3_Strv(label : ImGui::ImStrv, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun ColorPicker3_Str = igColorPicker3_Str(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags) : Bool
  fun ColorPicker4_Strv = igColorPicker4_Strv(label : ImGui::ImStrv, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags, ref_col : LibC::Float*) : Bool
  fun ColorPicker4_Str = igColorPicker4_Str(label : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags, ref_col : LibC::Float*) : Bool
  fun ColorButton_Strv = igColorButton_Strv(desc_id : ImGui::ImStrv, col : ImGui::ImVec4, flags : ImGui::ImGuiColorEditFlags, size : ImGui::ImVec2) : Bool
  fun ColorButton_Str = igColorButton_Str(desc_id : LibC::Char*, col : ImGui::ImVec4, flags : ImGui::ImGuiColorEditFlags, size : ImGui::ImVec2) : Bool
  fun SetColorEditOptions = igSetColorEditOptions(flags : ImGui::ImGuiColorEditFlags)
  fun TreeNode_Strv = igTreeNode_Strv(label : ImGui::ImStrv) : Bool
  fun TreeNode_StrvStr = igTreeNode_StrvStr(str_id : ImGui::ImStrv, fmt : LibC::Char*, ...) : Bool
  fun TreeNode_Ptr = igTreeNode_Ptr(ptr_id : Void*, fmt : LibC::Char*, ...) : Bool
  fun TreeNode_StrStr = igTreeNode_StrStr(str_id : LibC::Char*, fmt : LibC::Char*, ...) : Bool
  fun TreeNode_Str = igTreeNode_Str(label : LibC::Char*) : Bool
  fun TreeNodeEx_Strv = igTreeNodeEx_Strv(label : ImGui::ImStrv, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun TreeNodeEx_StrvStr = igTreeNodeEx_StrvStr(str_id : ImGui::ImStrv, flags : ImGui::ImGuiTreeNodeFlags, fmt : LibC::Char*, ...) : Bool
  fun TreeNodeEx_Ptr = igTreeNodeEx_Ptr(ptr_id : Void*, flags : ImGui::ImGuiTreeNodeFlags, fmt : LibC::Char*, ...) : Bool
  fun TreeNodeEx_StrStr = igTreeNodeEx_StrStr(str_id : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags, fmt : LibC::Char*, ...) : Bool
  fun TreeNodeEx_Str = igTreeNodeEx_Str(label : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun TreePush_Strv = igTreePush_Strv(str_id : ImGui::ImStrv)
  fun TreePush_Ptr = igTreePush_Ptr(ptr_id : Void*)
  fun TreePush_Str = igTreePush_Str(str_id : LibC::Char*)
  fun TreePop = igTreePop
  fun GetTreeNodeToLabelSpacing = igGetTreeNodeToLabelSpacing : LibC::Float
  fun CollapsingHeader_StrvTreeNodeFlags = igCollapsingHeader_StrvTreeNodeFlags(label : ImGui::ImStrv, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun CollapsingHeader_StrvBoolPtr = igCollapsingHeader_StrvBoolPtr(label : ImGui::ImStrv, p_visible : Bool*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun CollapsingHeader_StrTreeNodeFlags = igCollapsingHeader_StrTreeNodeFlags(label : LibC::Char*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun CollapsingHeader_StrBoolPtr = igCollapsingHeader_StrBoolPtr(label : LibC::Char*, p_visible : Bool*, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun SetNextItemOpen = igSetNextItemOpen(is_open : Bool, cond : ImGui::ImGuiCond)
  fun Selectable_StrvBool = igSelectable_StrvBool(label : ImGui::ImStrv, selected : Bool, flags : ImGui::ImGuiSelectableFlags, size : ImGui::ImVec2) : Bool
  fun Selectable_StrvBoolPtr = igSelectable_StrvBoolPtr(label : ImGui::ImStrv, p_selected : Bool*, flags : ImGui::ImGuiSelectableFlags, size : ImGui::ImVec2) : Bool
  fun Selectable_StrBool = igSelectable_StrBool(label : LibC::Char*, selected : Bool, flags : ImGui::ImGuiSelectableFlags, size : ImGui::ImVec2) : Bool
  fun Selectable_StrBoolPtr = igSelectable_StrBoolPtr(label : LibC::Char*, p_selected : Bool*, flags : ImGui::ImGuiSelectableFlags, size : ImGui::ImVec2) : Bool
  fun BeginListBox_Strv = igBeginListBox_Strv(label : ImGui::ImStrv, size : ImGui::ImVec2) : Bool
  fun BeginListBox_Str = igBeginListBox_Str(label : LibC::Char*, size : ImGui::ImVec2) : Bool
  fun EndListBox = igEndListBox
  fun ListBox_StrvStr_arr = igListBox_StrvStr_arr(label : ImGui::ImStrv, current_item : LibC::Int*, items : LibC::Char**, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun ListBox_FnStrvBoolPtr = igListBox_FnStrvBoolPtr(label : ImGui::ImStrv, current_item : LibC::Int*, items_getter : (Void*, LibC::Int, LibC::Char**) -> Bool, data : Void*, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun ListBox_StrStr_arr = igListBox_StrStr_arr(label : LibC::Char*, current_item : LibC::Int*, items : LibC::Char**, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun ListBox_FnStrBoolPtr = igListBox_FnStrBoolPtr(label : LibC::Char*, current_item : LibC::Int*, items_getter : (Void*, LibC::Int, LibC::Char**) -> Bool, data : Void*, items_count : LibC::Int, height_in_items : LibC::Int) : Bool
  fun PlotLines_StrvFloatPtr = igPlotLines_StrvFloatPtr(label : ImGui::ImStrv, values : LibC::Float*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : ImGui::ImStrv, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2, stride : LibC::Int)
  fun PlotLines_FnStrvFloatPtr = igPlotLines_FnStrvFloatPtr(label : ImGui::ImStrv, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : ImGui::ImStrv, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2)
  fun PlotLines_StrFloatPtr = igPlotLines_StrFloatPtr(label : LibC::Char*, values : LibC::Float*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2, stride : LibC::Int)
  fun PlotLines_FnStrFloatPtr = igPlotLines_FnStrFloatPtr(label : LibC::Char*, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2)
  fun PlotHistogram_StrvFloatPtr = igPlotHistogram_StrvFloatPtr(label : ImGui::ImStrv, values : LibC::Float*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : ImGui::ImStrv, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2, stride : LibC::Int)
  fun PlotHistogram_FnStrvFloatPtr = igPlotHistogram_FnStrvFloatPtr(label : ImGui::ImStrv, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : ImGui::ImStrv, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2)
  fun PlotHistogram_StrFloatPtr = igPlotHistogram_StrFloatPtr(label : LibC::Char*, values : LibC::Float*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2, stride : LibC::Int)
  fun PlotHistogram_FnStrFloatPtr = igPlotHistogram_FnStrFloatPtr(label : LibC::Char*, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, graph_size : ImGui::ImVec2)
  fun Value_StrvBool = igValue_StrvBool(prefix : ImGui::ImStrv, b : Bool)
  fun Value_StrvInt = igValue_StrvInt(prefix : ImGui::ImStrv, v : LibC::Int)
  fun Value_StrvUint = igValue_StrvUint(prefix : ImGui::ImStrv, v : LibC::UInt)
  fun Value_StrvFloat = igValue_StrvFloat(prefix : ImGui::ImStrv, v : LibC::Float, float_format : ImGui::ImStrv)
  fun Value_StrBool = igValue_StrBool(prefix : LibC::Char*, b : Bool)
  fun Value_StrInt = igValue_StrInt(prefix : LibC::Char*, v : LibC::Int)
  fun Value_StrUint = igValue_StrUint(prefix : LibC::Char*, v : LibC::UInt)
  fun Value_StrFloat = igValue_StrFloat(prefix : LibC::Char*, v : LibC::Float, float_format : LibC::Char*)
  fun BeginMenuBar = igBeginMenuBar : Bool
  fun EndMenuBar = igEndMenuBar
  fun BeginMainMenuBar = igBeginMainMenuBar : Bool
  fun EndMainMenuBar = igEndMainMenuBar
  fun BeginMenu_Strv = igBeginMenu_Strv(label : ImGui::ImStrv, enabled : Bool) : Bool
  fun BeginMenu_Str = igBeginMenu_Str(label : LibC::Char*, enabled : Bool) : Bool
  fun EndMenu = igEndMenu
  fun MenuItem_StrvStrvBool = igMenuItem_StrvStrvBool(label : ImGui::ImStrv, shortcut : ImGui::ImStrv, selected : Bool, enabled : Bool) : Bool
  fun MenuItem_StrvStrvBoolPtr = igMenuItem_StrvStrvBoolPtr(label : ImGui::ImStrv, shortcut : ImGui::ImStrv, p_selected : Bool*, enabled : Bool) : Bool
  fun MenuItem_StrStrBool = igMenuItem_StrStrBool(label : LibC::Char*, shortcut : LibC::Char*, selected : Bool, enabled : Bool) : Bool
  fun MenuItem_StrStrBoolPtr = igMenuItem_StrStrBoolPtr(label : LibC::Char*, shortcut : LibC::Char*, p_selected : Bool*, enabled : Bool) : Bool
  fun BeginTooltip = igBeginTooltip : Bool
  fun EndTooltip = igEndTooltip
  fun SetTooltip = igSetTooltip(fmt : LibC::Char*, ...)
  fun BeginPopup_Strv = igBeginPopup_Strv(str_id : ImGui::ImStrv, flags : ImGui::ImGuiWindowFlags) : Bool
  fun BeginPopup_Str = igBeginPopup_Str(str_id : LibC::Char*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun BeginPopupModal_Strv = igBeginPopupModal_Strv(name : ImGui::ImStrv, p_open : Bool*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun BeginPopupModal_Str = igBeginPopupModal_Str(name : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiWindowFlags) : Bool
  fun EndPopup = igEndPopup
  fun OpenPopup_Strv = igOpenPopup_Strv(str_id : ImGui::ImStrv, popup_flags : ImGui::ImGuiPopupFlags)
  fun OpenPopup_ID = igOpenPopup_ID(id : ImGuiID, popup_flags : ImGui::ImGuiPopupFlags)
  fun OpenPopup_Str = igOpenPopup_Str(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags)
  fun OpenPopupOnItemClick_Strv = igOpenPopupOnItemClick_Strv(str_id : ImGui::ImStrv, popup_flags : ImGui::ImGuiPopupFlags)
  fun OpenPopupOnItemClick_Str = igOpenPopupOnItemClick_Str(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags)
  fun CloseCurrentPopup = igCloseCurrentPopup
  fun BeginPopupContextItem_Strv = igBeginPopupContextItem_Strv(str_id : ImGui::ImStrv, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun BeginPopupContextItem_Str = igBeginPopupContextItem_Str(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun BeginPopupContextWindow_Strv = igBeginPopupContextWindow_Strv(str_id : ImGui::ImStrv, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun BeginPopupContextWindow_Str = igBeginPopupContextWindow_Str(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun BeginPopupContextVoid_Strv = igBeginPopupContextVoid_Strv(str_id : ImGui::ImStrv, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun BeginPopupContextVoid_Str = igBeginPopupContextVoid_Str(str_id : LibC::Char*, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun IsPopupOpen_Strv = igIsPopupOpen_Strv(str_id : ImGui::ImStrv, flags : ImGui::ImGuiPopupFlags) : Bool
  fun IsPopupOpen_ID = igIsPopupOpen_ID(id : ImGuiID, popup_flags : ImGui::ImGuiPopupFlags) : Bool
  fun IsPopupOpen_Str = igIsPopupOpen_Str(str_id : LibC::Char*, flags : ImGui::ImGuiPopupFlags) : Bool
  fun BeginTable_Strv = igBeginTable_Strv(str_id : ImGui::ImStrv, column : LibC::Int, flags : ImGui::ImGuiTableFlags, outer_size : ImGui::ImVec2, inner_width : LibC::Float) : Bool
  fun BeginTable_Str = igBeginTable_Str(str_id : LibC::Char*, column : LibC::Int, flags : ImGui::ImGuiTableFlags, outer_size : ImGui::ImVec2, inner_width : LibC::Float) : Bool
  fun EndTable = igEndTable
  fun TableNextRow = igTableNextRow(row_flags : ImGui::ImGuiTableRowFlags, min_row_height : LibC::Float)
  fun TableNextColumn = igTableNextColumn : Bool
  fun TableSetColumnIndex = igTableSetColumnIndex(column_n : LibC::Int) : Bool
  fun TableSetupColumn_Strv = igTableSetupColumn_Strv(label : ImGui::ImStrv, flags : ImGui::ImGuiTableColumnFlags, init_width_or_weight : LibC::Float, user_id : ImGuiID)
  fun TableSetupColumn_Str = igTableSetupColumn_Str(label : LibC::Char*, flags : ImGui::ImGuiTableColumnFlags, init_width_or_weight : LibC::Float, user_id : ImGuiID)
  fun TableSetupScrollFreeze = igTableSetupScrollFreeze(cols : LibC::Int, rows : LibC::Int)
  fun TableHeadersRow = igTableHeadersRow
  fun TableHeader_Strv = igTableHeader_Strv(label : ImGui::ImStrv)
  fun TableHeader_Str = igTableHeader_Str(label : LibC::Char*)
  fun TableGetSortSpecs = igTableGetSortSpecs : ImGuiTableSortSpecs*
  fun TableGetColumnCount = igTableGetColumnCount : LibC::Int
  fun TableGetColumnIndex = igTableGetColumnIndex : LibC::Int
  fun TableGetRowIndex = igTableGetRowIndex : LibC::Int
  fun TableGetColumnName_Int = igTableGetColumnName_Int(column_n : LibC::Int) : LibC::Char*
  fun TableGetColumnName_TablePtr = igTableGetColumnName_TablePtr(table : ImGuiTable*, column_n : LibC::Int) : LibC::Char*
  fun TableGetColumnFlags = igTableGetColumnFlags(column_n : LibC::Int) : ImGui::ImGuiTableColumnFlags
  fun TableSetColumnEnabled = igTableSetColumnEnabled(column_n : LibC::Int, v : Bool)
  fun TableSetBgColor = igTableSetBgColor(target : ImGui::ImGuiTableBgTarget, color : UInt32, column_n : LibC::Int)
  fun Columns_Strv = igColumns_Strv(count : LibC::Int, id : ImGui::ImStrv, border : Bool)
  fun Columns_Str = igColumns_Str(count : LibC::Int, id : LibC::Char*, border : Bool)
  fun NextColumn = igNextColumn
  fun GetColumnIndex = igGetColumnIndex : LibC::Int
  fun GetColumnWidth = igGetColumnWidth(column_index : LibC::Int) : LibC::Float
  fun SetColumnWidth = igSetColumnWidth(column_index : LibC::Int, width : LibC::Float)
  fun GetColumnOffset = igGetColumnOffset(column_index : LibC::Int) : LibC::Float
  fun SetColumnOffset = igSetColumnOffset(column_index : LibC::Int, offset_x : LibC::Float)
  fun GetColumnsCount = igGetColumnsCount : LibC::Int
  fun BeginTabBar_Strv = igBeginTabBar_Strv(str_id : ImGui::ImStrv, flags : ImGui::ImGuiTabBarFlags) : Bool
  fun BeginTabBar_Str = igBeginTabBar_Str(str_id : LibC::Char*, flags : ImGui::ImGuiTabBarFlags) : Bool
  fun EndTabBar = igEndTabBar
  fun BeginTabItem_Strv = igBeginTabItem_Strv(label : ImGui::ImStrv, p_open : Bool*, flags : ImGui::ImGuiTabItemFlags) : Bool
  fun BeginTabItem_Str = igBeginTabItem_Str(label : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiTabItemFlags) : Bool
  fun EndTabItem = igEndTabItem
  fun TabItemButton_Strv = igTabItemButton_Strv(label : ImGui::ImStrv, flags : ImGui::ImGuiTabItemFlags) : Bool
  fun TabItemButton_Str = igTabItemButton_Str(label : LibC::Char*, flags : ImGui::ImGuiTabItemFlags) : Bool
  fun SetTabItemClosed_Strv = igSetTabItemClosed_Strv(tab_or_docked_window_label : ImGui::ImStrv)
  fun SetTabItemClosed_Str = igSetTabItemClosed_Str(tab_or_docked_window_label : LibC::Char*)
  fun LogToTTY = igLogToTTY(auto_open_depth : LibC::Int)
  fun LogToFile_Strv = igLogToFile_Strv(auto_open_depth : LibC::Int, filename : ImGui::ImStrv)
  fun LogToFile_Str = igLogToFile_Str(auto_open_depth : LibC::Int, filename : LibC::Char*)
  fun LogToClipboard = igLogToClipboard(auto_open_depth : LibC::Int)
  fun LogFinish = igLogFinish
  fun LogButtons = igLogButtons
  fun LogText = igLogText(fmt : LibC::Char*, ...)
  fun BeginDragDropSource = igBeginDragDropSource(flags : ImGui::ImGuiDragDropFlags) : Bool
  fun SetDragDropPayload_Strv = igSetDragDropPayload_Strv(type : ImGui::ImStrv, data : Void*, sz : LibC::SizeT, cond : ImGui::ImGuiCond) : Bool
  fun SetDragDropPayload_Str = igSetDragDropPayload_Str(type : LibC::Char*, data : Void*, sz : LibC::SizeT, cond : ImGui::ImGuiCond) : Bool
  fun EndDragDropSource = igEndDragDropSource
  fun BeginDragDropTarget = igBeginDragDropTarget : Bool
  fun AcceptDragDropPayload_Strv = igAcceptDragDropPayload_Strv(type : ImGui::ImStrv, flags : ImGui::ImGuiDragDropFlags) : ImGuiPayload*
  fun AcceptDragDropPayload_Str = igAcceptDragDropPayload_Str(type : LibC::Char*, flags : ImGui::ImGuiDragDropFlags) : ImGuiPayload*
  fun EndDragDropTarget = igEndDragDropTarget
  fun GetDragDropPayload = igGetDragDropPayload : ImGuiPayload*
  fun BeginDisabled = igBeginDisabled(disabled : Bool)
  fun EndDisabled = igEndDisabled
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
  fun GetItemID = igGetItemID : ImGuiID
  fun GetItemRectMin = igGetItemRectMin(pOut : ImGui::ImVec2*)
  fun GetItemRectMax = igGetItemRectMax(pOut : ImGui::ImVec2*)
  fun GetItemRectSize = igGetItemRectSize(pOut : ImGui::ImVec2*)
  fun SetItemAllowOverlap = igSetItemAllowOverlap
  fun GetMainViewport = igGetMainViewport : ImGuiViewport*
  fun GetBackgroundDrawList_Nil = igGetBackgroundDrawList_Nil : ImDrawList*
  fun GetBackgroundDrawList_ViewportPtr = igGetBackgroundDrawList_ViewportPtr(viewport : ImGuiViewport*) : ImDrawList*
  fun GetForegroundDrawList_Nil = igGetForegroundDrawList_Nil : ImDrawList*
  fun GetForegroundDrawList_WindowPtr = igGetForegroundDrawList_WindowPtr(window : ImGuiWindow*) : ImDrawList*
  fun GetForegroundDrawList_ViewportPtr = igGetForegroundDrawList_ViewportPtr(viewport : ImGuiViewport*) : ImDrawList*
  fun IsRectVisible_Nil = igIsRectVisible_Nil(size : ImGui::ImVec2) : Bool
  fun IsRectVisible_Vec2 = igIsRectVisible_Vec2(rect_min : ImGui::ImVec2, rect_max : ImGui::ImVec2) : Bool
  fun GetTime = igGetTime : LibC::Double
  fun GetFrameCount = igGetFrameCount : LibC::Int
  fun GetDrawListSharedData = igGetDrawListSharedData : ImDrawListSharedData*
  fun GetStyleColorName = igGetStyleColorName(idx : ImGui::ImGuiCol) : LibC::Char*
  fun SetStateStorage = igSetStateStorage(storage : ImGui::ImGuiStorage*)
  fun GetStateStorage = igGetStateStorage : ImGui::ImGuiStorage*
  fun BeginChildFrame = igBeginChildFrame(id : ImGuiID, size : ImGui::ImVec2, flags : ImGui::ImGuiWindowFlags) : Bool
  fun EndChildFrame = igEndChildFrame
  fun CalcTextSize_Strv = igCalcTextSize_Strv(pOut : ImGui::ImVec2*, text : ImGui::ImStrv, hide_text_after_double_hash : Bool, wrap_width : LibC::Float)
  fun CalcTextSize_Str = igCalcTextSize_Str(pOut : ImGui::ImVec2*, text : LibC::Char*, hide_text_after_double_hash : Bool, wrap_width : LibC::Float)
  fun ColorConvertU32ToFloat4 = igColorConvertU32ToFloat4(pOut : ImGui::ImVec4*, in_ : UInt32)
  fun ColorConvertFloat4ToU32 = igColorConvertFloat4ToU32(in_ : ImGui::ImVec4) : UInt32
  fun ColorConvertRGBtoHSV = igColorConvertRGBtoHSV(r : LibC::Float, g : LibC::Float, b : LibC::Float, out_h : LibC::Float*, out_s : LibC::Float*, out_v : LibC::Float*)
  fun ColorConvertHSVtoRGB = igColorConvertHSVtoRGB(h : LibC::Float, s : LibC::Float, v : LibC::Float, out_r : LibC::Float*, out_g : LibC::Float*, out_b : LibC::Float*)
  fun IsKeyDown_Nil = igIsKeyDown_Nil(key : ImGui::ImGuiKey) : Bool
  fun IsKeyDown_ID = igIsKeyDown_ID(key : ImGui::ImGuiKey, owner_id : ImGuiID) : Bool
  fun IsKeyPressed_Bool = igIsKeyPressed_Bool(key : ImGui::ImGuiKey, repeat : Bool) : Bool
  fun IsKeyPressed_ID = igIsKeyPressed_ID(key : ImGui::ImGuiKey, owner_id : ImGuiID, flags : ImGui::ImGuiInputFlags) : Bool
  fun IsKeyReleased_Nil = igIsKeyReleased_Nil(key : ImGui::ImGuiKey) : Bool
  fun IsKeyReleased_ID = igIsKeyReleased_ID(key : ImGui::ImGuiKey, owner_id : ImGuiID) : Bool
  fun GetKeyPressedAmount = igGetKeyPressedAmount(key : ImGui::ImGuiKey, repeat_delay : LibC::Float, rate : LibC::Float) : LibC::Int
  fun GetKeyName = igGetKeyName(key : ImGui::ImGuiKey) : LibC::Char*
  fun SetNextFrameWantCaptureKeyboard = igSetNextFrameWantCaptureKeyboard(want_capture_keyboard : Bool)
  fun IsMouseDown_Nil = igIsMouseDown_Nil(button : ImGui::ImGuiMouseButton) : Bool
  fun IsMouseDown_ID = igIsMouseDown_ID(button : ImGui::ImGuiMouseButton, owner_id : ImGuiID) : Bool
  fun IsMouseClicked_Bool = igIsMouseClicked_Bool(button : ImGui::ImGuiMouseButton, repeat : Bool) : Bool
  fun IsMouseClicked_ID = igIsMouseClicked_ID(button : ImGui::ImGuiMouseButton, owner_id : ImGuiID, flags : ImGui::ImGuiInputFlags) : Bool
  fun IsMouseReleased_Nil = igIsMouseReleased_Nil(button : ImGui::ImGuiMouseButton) : Bool
  fun IsMouseReleased_ID = igIsMouseReleased_ID(button : ImGui::ImGuiMouseButton, owner_id : ImGuiID) : Bool
  fun IsMouseDoubleClicked = igIsMouseDoubleClicked(button : ImGui::ImGuiMouseButton) : Bool
  fun GetMouseClickedCount = igGetMouseClickedCount(button : ImGui::ImGuiMouseButton) : LibC::Int
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
  fun SetNextFrameWantCaptureMouse = igSetNextFrameWantCaptureMouse(want_capture_mouse : Bool)
  fun GetClipboardText = igGetClipboardText : LibC::Char*
  fun SetClipboardText_Strv = igSetClipboardText_Strv(text : ImGui::ImStrv)
  fun SetClipboardText_Str = igSetClipboardText_Str(text : LibC::Char*)
  fun LoadIniSettingsFromDisk_Strv = igLoadIniSettingsFromDisk_Strv(ini_filename : ImGui::ImStrv)
  fun LoadIniSettingsFromDisk_Str = igLoadIniSettingsFromDisk_Str(ini_filename : LibC::Char*)
  fun LoadIniSettingsFromMemory_Strv = igLoadIniSettingsFromMemory_Strv(ini_data : ImGui::ImStrv)
  fun LoadIniSettingsFromMemory_Str = igLoadIniSettingsFromMemory_Str(ini_data : LibC::Char*)
  fun SaveIniSettingsToDisk_Strv = igSaveIniSettingsToDisk_Strv(ini_filename : ImGui::ImStrv)
  fun SaveIniSettingsToDisk_Str = igSaveIniSettingsToDisk_Str(ini_filename : LibC::Char*)
  fun SaveIniSettingsToMemory = igSaveIniSettingsToMemory(out_ini_size : LibC::SizeT*) : LibC::Char*
  fun DebugTextEncoding_Strv = igDebugTextEncoding_Strv(text : ImGui::ImStrv)
  fun DebugTextEncoding_Str = igDebugTextEncoding_Str(text : LibC::Char*)
  fun DebugCheckVersionAndDataLayout_Strv = igDebugCheckVersionAndDataLayout_Strv(version_str : ImGui::ImStrv, sz_io : LibC::SizeT, sz_style : LibC::SizeT, sz_vec2 : LibC::SizeT, sz_vec4 : LibC::SizeT, sz_drawvert : LibC::SizeT, sz_drawidx : LibC::SizeT) : Bool
  fun DebugCheckVersionAndDataLayout_Str = igDebugCheckVersionAndDataLayout_Str(version_str : LibC::Char*, sz_io : LibC::SizeT, sz_style : LibC::SizeT, sz_vec2 : LibC::SizeT, sz_vec4 : LibC::SizeT, sz_drawvert : LibC::SizeT, sz_drawidx : LibC::SizeT) : Bool
  fun SetAllocatorFunctions = igSetAllocatorFunctions(alloc_func : ImGuiMemAllocFunc, free_func : ImGuiMemFreeFunc, user_data : Void*)
  fun GetAllocatorFunctions = igGetAllocatorFunctions(p_alloc_func : ImGuiMemAllocFunc*, p_free_func : ImGuiMemFreeFunc*, p_user_data : Void**)
  fun MemAlloc = igMemAlloc(size : LibC::SizeT) : Void*
  fun MemFree = igMemFree(ptr : Void*)

  struct ImGuiStyle
    alpha : LibC::Float
    disabled_alpha : LibC::Float
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
    separator_text_border_size : LibC::Float
    separator_text_align : ImGui::ImVec2
    separator_text_padding : ImGui::ImVec2
    display_window_padding : ImGui::ImVec2
    display_safe_area_padding : ImGui::ImVec2
    mouse_cursor_scale : LibC::Float
    anti_aliased_lines : Bool
    anti_aliased_lines_use_tex : Bool
    anti_aliased_fill : Bool
    curve_tessellation_tol : LibC::Float
    circle_tessellation_max_error : LibC::Float
    colors : ImGui::ImVec4[53]
  end

  fun ImGuiStyle_ImGuiStyle = ImGuiStyle_ImGuiStyle : ImGuiStyle*
  fun ImGuiStyle_ScaleAllSizes = ImGuiStyle_ScaleAllSizes(self : ImGuiStyle*, scale_factor : LibC::Float)

  struct ImGuiKeyData
    down : Bool
    down_duration : LibC::Float
    down_duration_prev : LibC::Float
    analog_value : LibC::Float
  end

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
    key_repeat_delay : LibC::Float
    key_repeat_rate : LibC::Float
    hover_delay_normal : LibC::Float
    hover_delay_short : LibC::Float
    user_data : Void*
    fonts : ImFontAtlas*
    font_global_scale : LibC::Float
    font_allow_user_scaling : Bool
    font_default : ImFont*
    display_framebuffer_scale : ImGui::ImVec2
    mouse_draw_cursor : Bool
    config_mac_osx_behaviors : Bool
    config_input_trickle_event_queue : Bool
    config_input_text_cursor_blink : Bool
    config_input_text_enter_keep_active : Bool
    config_drag_click_to_input_text : Bool
    config_windows_resize_from_edges : Bool
    config_windows_move_from_title_bar_only : Bool
    config_memory_compact_timer : LibC::Float
    config_debug_begin_return_value_once : Bool
    config_debug_begin_return_value_loop : Bool
    backend_platform_name : LibC::Char*
    backend_renderer_name : LibC::Char*
    backend_platform_user_data : Void*
    backend_renderer_user_data : Void*
    backend_language_user_data : Void*
    get_clipboard_text_fn : (Void*) -> LibC::Char*
    set_clipboard_text_fn : (Void*, LibC::Char*) -> Void
    clipboard_user_data : Void*
    set_platform_ime_data_fn : (ImGuiViewport*, ImGuiPlatformImeData*) -> Void
    _unused_padding : Void*
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
    key_map : LibC::Int[652]
    keys_down : Bool[652]
    nav_inputs : LibC::Float[16]
    ctx : ImGuiContext*
    mouse_pos : ImGui::ImVec2
    mouse_down : Bool[5]
    mouse_wheel : LibC::Float
    mouse_wheel_h : LibC::Float
    mouse_source : ImGui::ImGuiMouseSource
    key_ctrl : Bool
    key_shift : Bool
    key_alt : Bool
    key_super : Bool
    key_mods : ImGuiKeyChord
    keys_data : ImGuiKeyData[652]
    want_capture_mouse_unless_popup_close : Bool
    mouse_pos_prev : ImGui::ImVec2
    mouse_clicked_pos : ImGui::ImVec2[5]
    mouse_clicked_time : LibC::Double[5]
    mouse_clicked : Bool[5]
    mouse_double_clicked : Bool[5]
    mouse_clicked_count : UInt16[5]
    mouse_clicked_last_count : UInt16[5]
    mouse_released : Bool[5]
    mouse_down_owned : Bool[5]
    mouse_down_owned_unless_popup_close : Bool[5]
    mouse_wheel_request_axis_swap : Bool
    mouse_down_duration : LibC::Float[5]
    mouse_down_duration_prev : LibC::Float[5]
    mouse_drag_max_distance_sqr : LibC::Float[5]
    pen_pressure : LibC::Float
    app_focus_lost : Bool
    app_accepting_events : Bool
    backend_using_legacy_key_arrays : Int8
    backend_using_legacy_nav_input_array : Bool
    input_queue_surrogate : ImWchar16
    input_queue_characters : ImVectorInternal
  end

  fun ImGuiIO_AddKeyEvent = ImGuiIO_AddKeyEvent(self : ImGuiIO*, key : ImGui::ImGuiKey, down : Bool)
  fun ImGuiIO_AddKeyAnalogEvent = ImGuiIO_AddKeyAnalogEvent(self : ImGuiIO*, key : ImGui::ImGuiKey, down : Bool, v : LibC::Float)
  fun ImGuiIO_AddMousePosEvent = ImGuiIO_AddMousePosEvent(self : ImGuiIO*, x : LibC::Float, y : LibC::Float)
  fun ImGuiIO_AddMouseButtonEvent = ImGuiIO_AddMouseButtonEvent(self : ImGuiIO*, button : LibC::Int, down : Bool)
  fun ImGuiIO_AddMouseWheelEvent = ImGuiIO_AddMouseWheelEvent(self : ImGuiIO*, wheel_x : LibC::Float, wheel_y : LibC::Float)
  fun ImGuiIO_AddMouseSourceEvent = ImGuiIO_AddMouseSourceEvent(self : ImGuiIO*, source : ImGui::ImGuiMouseSource)
  fun ImGuiIO_AddFocusEvent = ImGuiIO_AddFocusEvent(self : ImGuiIO*, focused : Bool)
  fun ImGuiIO_AddInputCharacter = ImGuiIO_AddInputCharacter(self : ImGuiIO*, c : LibC::UInt)
  fun ImGuiIO_AddInputCharacterUTF16 = ImGuiIO_AddInputCharacterUTF16(self : ImGuiIO*, c : ImWchar16)
  fun ImGuiIO_AddInputCharactersUTF8 = ImGuiIO_AddInputCharactersUTF8(self : ImGuiIO*, str : LibC::Char*)
  fun ImGuiIO_SetKeyEventNativeData = ImGuiIO_SetKeyEventNativeData(self : ImGuiIO*, key : ImGui::ImGuiKey, native_keycode : LibC::Int, native_scancode : LibC::Int, native_legacy_index : LibC::Int)
  fun ImGuiIO_SetAppAcceptingEvents = ImGuiIO_SetAppAcceptingEvents(self : ImGuiIO*, accepting_events : Bool)
  fun ImGuiIO_ClearInputCharacters = ImGuiIO_ClearInputCharacters(self : ImGuiIO*)
  fun ImGuiIO_ClearInputKeys = ImGuiIO_ClearInputKeys(self : ImGuiIO*)
  fun ImGuiIO_ImGuiIO = ImGuiIO_ImGuiIO : ImGuiIO*

  struct ImGuiInputTextCallbackData
    ctx : ImGuiContext*
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
  fun ImGuiInputTextCallbackData_InsertChars_Strv = ImGuiInputTextCallbackData_InsertChars_Strv(self : ImGuiInputTextCallbackData*, pos : LibC::Int, text : ImGui::ImStrv)
  fun ImGuiInputTextCallbackData_InsertChars_Str = ImGuiInputTextCallbackData_InsertChars_Str(self : ImGuiInputTextCallbackData*, pos : LibC::Int, text : LibC::Char*)
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
  fun ImGuiPayload_IsDataType_Strv = ImGuiPayload_IsDataType_Strv(self : ImGuiPayload*, type : ImGui::ImStrv) : Bool
  fun ImGuiPayload_IsDataType_Str = ImGuiPayload_IsDataType_Str(self : ImGuiPayload*, type : LibC::Char*) : Bool
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

  fun ImGuiTextFilter_ImGuiTextFilter_Strv = ImGuiTextFilter_ImGuiTextFilter_Strv(default_filter : ImGui::ImStrv) : ImGuiTextFilter*
  fun ImGuiTextFilter_ImGuiTextFilter_Str = ImGuiTextFilter_ImGuiTextFilter_Str(default_filter : LibC::Char*) : ImGuiTextFilter*
  fun ImGuiTextFilter_Draw_Strv = ImGuiTextFilter_Draw_Strv(self : ImGuiTextFilter*, label : ImGui::ImStrv, width : LibC::Float) : Bool
  fun ImGuiTextFilter_Draw_Str = ImGuiTextFilter_Draw_Str(self : ImGuiTextFilter*, label : LibC::Char*, width : LibC::Float) : Bool
  fun ImGuiTextFilter_PassFilter_Strv = ImGuiTextFilter_PassFilter_Strv(self : ImGuiTextFilter*, text : ImGui::ImStrv) : Bool
  fun ImGuiTextFilter_PassFilter_Str = ImGuiTextFilter_PassFilter_Str(self : ImGuiTextFilter*, text : LibC::Char*) : Bool
  fun ImGuiTextFilter_Build = ImGuiTextFilter_Build(self : ImGuiTextFilter*)
  fun ImGuiTextFilter_Clear = ImGuiTextFilter_Clear(self : ImGuiTextFilter*)
  fun ImGuiTextFilter_IsActive = ImGuiTextFilter_IsActive(self : ImGuiTextFilter*) : Bool
  type ImGuiTextBuffer = Void*
  fun ImGuiTextBuffer_ImGuiTextBuffer = ImGuiTextBuffer_ImGuiTextBuffer : ImGuiTextBuffer*
  fun ImGuiTextBuffer_begin = ImGuiTextBuffer_begin(self : ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_end = ImGuiTextBuffer_end(self : ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_size = ImGuiTextBuffer_size(self : ImGuiTextBuffer*) : LibC::Int
  fun ImGuiTextBuffer_empty = ImGuiTextBuffer_empty(self : ImGuiTextBuffer*) : Bool
  fun ImGuiTextBuffer_clear = ImGuiTextBuffer_clear(self : ImGuiTextBuffer*)
  fun ImGuiTextBuffer_reserve = ImGuiTextBuffer_reserve(self : ImGuiTextBuffer*, capacity : LibC::Int)
  fun ImGuiTextBuffer_c_str = ImGuiTextBuffer_c_str(self : ImGuiTextBuffer*) : LibC::Char*
  fun ImGuiTextBuffer_append_Strv = ImGuiTextBuffer_append_Strv(self : ImGuiTextBuffer*, str : ImGui::ImStrv)
  fun ImGuiTextBuffer_append_Str = ImGuiTextBuffer_append_Str(self : ImGuiTextBuffer*, str : LibC::Char*)
  fun ImGuiTextBuffer_appendf = ImGuiTextBuffer_appendf(self : ImGuiTextBuffer*, fmt : LibC::Char*, ...)
  type ImGuiStoragePair = Void*
  fun ImGuiStoragePair_ImGuiStoragePair_Int = ImGuiStoragePair_ImGuiStoragePair_Int(_key : ImGuiID, _val_i : LibC::Int) : ImGuiStoragePair*
  fun ImGuiStoragePair_ImGuiStoragePair_Float = ImGuiStoragePair_ImGuiStoragePair_Float(_key : ImGuiID, _val_f : LibC::Float) : ImGuiStoragePair*
  fun ImGuiStoragePair_ImGuiStoragePair_Ptr = ImGuiStoragePair_ImGuiStoragePair_Ptr(_key : ImGuiID, _val_p : Void*) : ImGuiStoragePair*
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
  fun ImGuiListClipper_ForceDisplayRangeByIndices = ImGuiListClipper_ForceDisplayRangeByIndices(self : ImGui::ImGuiListClipper*, item_min : LibC::Int, item_max : LibC::Int)
  fun ImColor_ImColor_Nil = ImColor_ImColor_Nil : ImGui::ImColor*
  fun ImColor_ImColor_Float = ImColor_ImColor_Float(r : LibC::Float, g : LibC::Float, b : LibC::Float, a : LibC::Float) : ImGui::ImColor*
  fun ImColor_ImColor_Vec4 = ImColor_ImColor_Vec4(col : ImGui::ImVec4) : ImGui::ImColor*
  fun ImColor_ImColor_Int = ImColor_ImColor_Int(r : LibC::Int, g : LibC::Int, b : LibC::Int, a : LibC::Int) : ImGui::ImColor*
  fun ImColor_ImColor_U32 = ImColor_ImColor_U32(rgba : UInt32) : ImGui::ImColor*
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
  fun ImDrawCmd_GetTexID = ImDrawCmd_GetTexID(self : ImDrawCmd*) : ImTextureID

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
  fun ImDrawList_AddRect = ImDrawList_AddRect(self : ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, flags : ImGui::ImDrawFlags, thickness : LibC::Float)
  fun ImDrawList_AddRectFilled = ImDrawList_AddRectFilled(self : ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, flags : ImGui::ImDrawFlags)
  fun ImDrawList_AddRectFilledMultiColor = ImDrawList_AddRectFilledMultiColor(self : ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, col_upr_left : UInt32, col_upr_right : UInt32, col_bot_right : UInt32, col_bot_left : UInt32)
  fun ImDrawList_AddQuad = ImDrawList_AddQuad(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float)
  fun ImDrawList_AddQuadFilled = ImDrawList_AddQuadFilled(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddTriangle = ImDrawList_AddTriangle(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float)
  fun ImDrawList_AddTriangleFilled = ImDrawList_AddTriangleFilled(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddCircle = ImDrawList_AddCircle(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int, thickness : LibC::Float)
  fun ImDrawList_AddCircleFilled = ImDrawList_AddCircleFilled(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int)
  fun ImDrawList_AddNgon = ImDrawList_AddNgon(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int, thickness : LibC::Float)
  fun ImDrawList_AddNgonFilled = ImDrawList_AddNgonFilled(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, col : UInt32, num_segments : LibC::Int)
  fun ImDrawList_AddText_Vec2U32Strv = ImDrawList_AddText_Vec2U32Strv(self : ImDrawList*, pos : ImGui::ImVec2, col : UInt32, text : ImGui::ImStrv)
  fun ImDrawList_AddText_FontPtrFloatVec2Strv = ImDrawList_AddText_FontPtrFloatVec2Strv(self : ImDrawList*, font : ImFont*, font_size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, text : ImGui::ImStrv, wrap_width : LibC::Float, cpu_fine_clip_rect : ImGui::ImVec4*)
  fun ImDrawList_AddText_Vec2U32Str = ImDrawList_AddText_Vec2U32Str(self : ImDrawList*, pos : ImGui::ImVec2, col : UInt32, text : LibC::Char*)
  fun ImDrawList_AddText_FontPtrFloatVec2Str = ImDrawList_AddText_FontPtrFloatVec2Str(self : ImDrawList*, font : ImFont*, font_size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, text : LibC::Char*, wrap_width : LibC::Float, cpu_fine_clip_rect : ImGui::ImVec4*)
  fun ImDrawList_AddPolyline = ImDrawList_AddPolyline(self : ImDrawList*, points : ImGui::ImVec2*, num_points : LibC::Int, col : UInt32, flags : ImGui::ImDrawFlags, thickness : LibC::Float)
  fun ImDrawList_AddConvexPolyFilled = ImDrawList_AddConvexPolyFilled(self : ImDrawList*, points : ImGui::ImVec2*, num_points : LibC::Int, col : UInt32)
  fun ImDrawList_AddBezierCubic = ImDrawList_AddBezierCubic(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float, num_segments : LibC::Int)
  fun ImDrawList_AddBezierQuadratic = ImDrawList_AddBezierQuadratic(self : ImDrawList*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, col : UInt32, thickness : LibC::Float, num_segments : LibC::Int)
  fun ImDrawList_AddImage = ImDrawList_AddImage(self : ImDrawList*, user_texture_id : ImTextureID, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, uv_min : ImGui::ImVec2, uv_max : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddImageQuad = ImDrawList_AddImageQuad(self : ImDrawList*, user_texture_id : ImTextureID, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, uv1 : ImGui::ImVec2, uv2 : ImGui::ImVec2, uv3 : ImGui::ImVec2, uv4 : ImGui::ImVec2, col : UInt32)
  fun ImDrawList_AddImageRounded = ImDrawList_AddImageRounded(self : ImDrawList*, user_texture_id : ImTextureID, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, uv_min : ImGui::ImVec2, uv_max : ImGui::ImVec2, col : UInt32, rounding : LibC::Float, flags : ImGui::ImDrawFlags)
  fun ImDrawList_PathClear = ImDrawList_PathClear(self : ImDrawList*)
  fun ImDrawList_PathLineTo = ImDrawList_PathLineTo(self : ImDrawList*, pos : ImGui::ImVec2)
  fun ImDrawList_PathLineToMergeDuplicate = ImDrawList_PathLineToMergeDuplicate(self : ImDrawList*, pos : ImGui::ImVec2)
  fun ImDrawList_PathFillConvex = ImDrawList_PathFillConvex(self : ImDrawList*, col : UInt32)
  fun ImDrawList_PathStroke = ImDrawList_PathStroke(self : ImDrawList*, col : UInt32, flags : ImGui::ImDrawFlags, thickness : LibC::Float)
  fun ImDrawList_PathArcTo = ImDrawList_PathArcTo(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, a_min : LibC::Float, a_max : LibC::Float, num_segments : LibC::Int)
  fun ImDrawList_PathArcToFast = ImDrawList_PathArcToFast(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, a_min_of_12 : LibC::Int, a_max_of_12 : LibC::Int)
  fun ImDrawList_PathBezierCubicCurveTo = ImDrawList_PathBezierCubicCurveTo(self : ImDrawList*, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, num_segments : LibC::Int)
  fun ImDrawList_PathBezierQuadraticCurveTo = ImDrawList_PathBezierQuadraticCurveTo(self : ImDrawList*, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, num_segments : LibC::Int)
  fun ImDrawList_PathRect = ImDrawList_PathRect(self : ImDrawList*, rect_min : ImGui::ImVec2, rect_max : ImGui::ImVec2, rounding : LibC::Float, flags : ImGui::ImDrawFlags)
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
  fun ImDrawList__ResetForNewFrame = ImDrawList__ResetForNewFrame(self : ImDrawList*)
  fun ImDrawList__ClearFreeMemory = ImDrawList__ClearFreeMemory(self : ImDrawList*)
  fun ImDrawList__PopUnusedDrawCmd = ImDrawList__PopUnusedDrawCmd(self : ImDrawList*)
  fun ImDrawList__TryMergeDrawCmds = ImDrawList__TryMergeDrawCmds(self : ImDrawList*)
  fun ImDrawList__OnChangedClipRect = ImDrawList__OnChangedClipRect(self : ImDrawList*)
  fun ImDrawList__OnChangedTextureID = ImDrawList__OnChangedTextureID(self : ImDrawList*)
  fun ImDrawList__OnChangedVtxOffset = ImDrawList__OnChangedVtxOffset(self : ImDrawList*)
  fun ImDrawList__CalcCircleAutoSegmentCount = ImDrawList__CalcCircleAutoSegmentCount(self : ImDrawList*, radius : LibC::Float) : LibC::Int
  fun ImDrawList__PathArcToFastEx = ImDrawList__PathArcToFastEx(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, a_min_sample : LibC::Int, a_max_sample : LibC::Int, a_step : LibC::Int)
  fun ImDrawList__PathArcToN = ImDrawList__PathArcToN(self : ImDrawList*, center : ImGui::ImVec2, radius : LibC::Float, a_min : LibC::Float, a_max : LibC::Float, num_segments : LibC::Int)

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
  fun ImFontGlyphRangesBuilder_AddText_Strv = ImFontGlyphRangesBuilder_AddText_Strv(self : ImGui::ImFontGlyphRangesBuilder*, text : ImGui::ImStrv)
  fun ImFontGlyphRangesBuilder_AddText_Str = ImFontGlyphRangesBuilder_AddText_Str(self : ImGui::ImFontGlyphRangesBuilder*, text : LibC::Char*)
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
    flags : ImGui::ImFontAtlasFlags
    tex_id : ImTextureID
    tex_desired_width : LibC::Int
    tex_glyph_padding : LibC::Int
    locked : Bool
    user_data : Void*
    tex_ready : Bool
    tex_pixels_use_colors : Bool
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
  fun ImFontAtlas_AddFontFromFileTTF_Strv = ImFontAtlas_AddFontFromFileTTF_Strv(self : ImFontAtlas*, filename : ImGui::ImStrv, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_AddFontFromFileTTF_Str = ImFontAtlas_AddFontFromFileTTF_Str(self : ImFontAtlas*, filename : LibC::Char*, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_AddFontFromMemoryTTF = ImFontAtlas_AddFontFromMemoryTTF(self : ImFontAtlas*, font_data : Void*, font_size : LibC::Int, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_AddFontFromMemoryCompressedTTF = ImFontAtlas_AddFontFromMemoryCompressedTTF(self : ImFontAtlas*, compressed_font_data : Void*, compressed_font_size : LibC::Int, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_AddFontFromMemoryCompressedBase85TTF_Strv = ImFontAtlas_AddFontFromMemoryCompressedBase85TTF_Strv(self : ImFontAtlas*, compressed_font_data_base85 : ImGui::ImStrv, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
  fun ImFontAtlas_AddFontFromMemoryCompressedBase85TTF_Str = ImFontAtlas_AddFontFromMemoryCompressedBase85TTF_Str(self : ImFontAtlas*, compressed_font_data_base85 : LibC::Char*, size_pixels : LibC::Float, font_cfg : ImFontConfig*, glyph_ranges : ImWchar*) : ImFont*
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
  fun ImFontAtlas_GetGlyphRangesGreek = ImFontAtlas_GetGlyphRangesGreek(self : ImFontAtlas*) : ImWchar*
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
    ellipsis_char_count : LibC::Short
    ellipsis_width : LibC::Float
    ellipsis_char_step : LibC::Float
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
  fun ImFont_CalcTextSizeA_Strv = ImFont_CalcTextSizeA_Strv(pOut : ImGui::ImVec2*, self : ImFont*, size : LibC::Float, max_width : LibC::Float, wrap_width : LibC::Float, text : ImGui::ImStrv, remaining : LibC::Char**)
  fun ImFont_CalcTextSizeA_Str = ImFont_CalcTextSizeA_Str(pOut : ImGui::ImVec2*, self : ImFont*, size : LibC::Float, max_width : LibC::Float, wrap_width : LibC::Float, text : LibC::Char*, remaining : LibC::Char**)
  fun ImFont_CalcWordWrapPositionA_Strv = ImFont_CalcWordWrapPositionA_Strv(self : ImFont*, scale : LibC::Float, text : ImGui::ImStrv, wrap_width : LibC::Float) : LibC::Char*
  fun ImFont_CalcWordWrapPositionA_Str = ImFont_CalcWordWrapPositionA_Str(self : ImFont*, scale : LibC::Float, text : LibC::Char*, wrap_width : LibC::Float) : LibC::Char*
  fun ImFont_RenderChar = ImFont_RenderChar(self : ImFont*, draw_list : ImDrawList*, size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, c : ImWchar)
  fun ImFont_RenderText_Strv = ImFont_RenderText_Strv(self : ImFont*, draw_list : ImDrawList*, size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, clip_rect : ImGui::ImVec4, text : ImGui::ImStrv, wrap_width : LibC::Float, cpu_fine_clip : Bool)
  fun ImFont_RenderText_Str = ImFont_RenderText_Str(self : ImFont*, draw_list : ImDrawList*, size : LibC::Float, pos : ImGui::ImVec2, col : UInt32, clip_rect : ImGui::ImVec4, text : LibC::Char*, wrap_width : LibC::Float, cpu_fine_clip : Bool)
  fun ImFont_BuildLookupTable = ImFont_BuildLookupTable(self : ImFont*)
  fun ImFont_ClearOutputData = ImFont_ClearOutputData(self : ImFont*)
  fun ImFont_GrowIndex = ImFont_GrowIndex(self : ImFont*, new_size : LibC::Int)
  fun ImFont_AddGlyph = ImFont_AddGlyph(self : ImFont*, src_cfg : ImFontConfig*, c : ImWchar, x0 : LibC::Float, y0 : LibC::Float, x1 : LibC::Float, y1 : LibC::Float, u0 : LibC::Float, v0 : LibC::Float, u1 : LibC::Float, v1 : LibC::Float, advance_x : LibC::Float)
  fun ImFont_AddRemapChar = ImFont_AddRemapChar(self : ImFont*, dst : ImWchar, src : ImWchar, overwrite_dst : Bool)
  fun ImFont_SetGlyphVisible = ImFont_SetGlyphVisible(self : ImFont*, c : ImWchar, visible : Bool)
  fun ImFont_IsGlyphRangeUnused = ImFont_IsGlyphRangeUnused(self : ImFont*, c_begin : LibC::UInt, c_last : LibC::UInt) : Bool

  struct ImGuiViewport
    flags : ImGui::ImGuiViewportFlags
    pos : ImGui::ImVec2
    size : ImGui::ImVec2
    work_pos : ImGui::ImVec2
    work_size : ImGui::ImVec2
    platform_handle_raw : Void*
  end

  fun ImGuiViewport_ImGuiViewport = ImGuiViewport_ImGuiViewport : ImGuiViewport*
  fun ImGuiViewport_GetCenter = ImGuiViewport_GetCenter(pOut : ImGui::ImVec2*, self : ImGuiViewport*)
  fun ImGuiViewport_GetWorkCenter = ImGuiViewport_GetWorkCenter(pOut : ImGui::ImVec2*, self : ImGuiViewport*)

  struct ImGuiPlatformImeData
    want_visible : Bool
    input_pos : ImGui::ImVec2
    input_line_height : LibC::Float
  end

  fun ImGuiPlatformImeData_ImGuiPlatformImeData = ImGuiPlatformImeData_ImGuiPlatformImeData : ImGuiPlatformImeData*
  fun GetKeyIndex = igGetKeyIndex(key : ImGui::ImGuiKey) : ImGui::ImGuiKey
  fun ImHashData = igImHashData(data : Void*, data_size : LibC::SizeT, seed : ImGuiID) : ImGuiID
  fun ImHashStr_Strv = igImHashStr_Strv(str : ImGui::ImStrv, seed : ImGuiID) : ImGuiID
  fun ImHashStr_Strsize_t = igImHashStr_Strsize_t(data : LibC::Char*, data_size : LibC::SizeT, seed : ImGuiID) : ImGuiID
  fun ImHashStr_StrID = igImHashStr_StrID(str : LibC::Char*, seed : ImGuiID) : ImGuiID
  fun ImQsort = igImQsort(base : Void*, count : LibC::SizeT, size_of_element : LibC::SizeT, compare_func : (Void, Void) -> LibC::Int)
  fun ImAlphaBlendColors = igImAlphaBlendColors(col_a : UInt32, col_b : UInt32) : UInt32
  fun ImIsPowerOfTwo_Int = igImIsPowerOfTwo_Int(v : LibC::Int) : Bool
  fun ImIsPowerOfTwo_U64 = igImIsPowerOfTwo_U64(v : UInt64) : Bool
  fun ImUpperPowerOfTwo = igImUpperPowerOfTwo(v : LibC::Int) : LibC::Int
  fun ImStrcmp_Strv = igImStrcmp_Strv(str1 : ImGui::ImStrv, str2 : ImGui::ImStrv) : LibC::Int
  fun ImStrcmp_Str = igImStrcmp_Str(str1 : LibC::Char*, str2 : LibC::Char*) : LibC::Int
  fun ImStricmp = igImStricmp(str1 : LibC::Char*, str2 : LibC::Char*) : LibC::Int
  fun ImStrnicmp = igImStrnicmp(str1 : LibC::Char*, str2 : LibC::Char*, count : LibC::SizeT) : LibC::Int
  fun ImStrncpy_Strv = igImStrncpy_Strv(dst : LibC::Char*, src : ImGui::ImStrv, count : LibC::SizeT)
  fun ImStrncpy_Str = igImStrncpy_Str(dst : LibC::Char*, src : LibC::Char*, count : LibC::SizeT)
  fun ImStrdup_Str = igImStrdup_Str(str : LibC::Char*) : LibC::Char*
  fun ImStrdup_Strv = igImStrdup_Strv(str : ImGui::ImStrv) : LibC::Char*
  fun ImStrdupcpy_Strv = igImStrdupcpy_Strv(dst : LibC::Char*, p_dst_size : LibC::SizeT*, str : ImGui::ImStrv) : LibC::Char*
  fun ImStrdupcpy_Str = igImStrdupcpy_Str(dst : LibC::Char*, p_dst_size : LibC::SizeT*, str : LibC::Char*) : LibC::Char*
  fun ImStrchrRange = igImStrchrRange(str_begin : LibC::Char*, str_end : LibC::Char*, c : LibC::Char) : LibC::Char*
  fun ImStrlenW = igImStrlenW(str : ImWchar*) : LibC::Int
  fun ImStreolRange = igImStreolRange(str : LibC::Char*, str_end : LibC::Char*) : LibC::Char*
  fun ImStrbolW = igImStrbolW(buf_mid_line : ImWchar*, buf_begin : ImWchar*) : ImWchar*
  fun ImStristr = igImStristr(haystack : LibC::Char*, haystack_end : LibC::Char*, needle : LibC::Char*, needle_end : LibC::Char*) : LibC::Char*
  fun ImStrstr_Strv = igImStrstr_Strv(haystack : ImGui::ImStrv, needle : ImGui::ImStrv) : LibC::Char*
  fun ImStrstr_Str = igImStrstr_Str(haystack : LibC::Char*, needle : LibC::Char*) : LibC::Char*
  fun ImStrTrimBlanks = igImStrTrimBlanks(str : LibC::Char*)
  fun ImStrSkipBlank = igImStrSkipBlank(str : LibC::Char*) : LibC::Char*
  fun ImToUpper = igImToUpper(c : LibC::Char) : LibC::Char
  fun ImCharIsBlankA = igImCharIsBlankA(c : LibC::Char) : Bool
  fun ImCharIsBlankW = igImCharIsBlankW(c : LibC::UInt) : Bool
  fun ImFormatString = igImFormatString(buf : LibC::Char*, buf_size : LibC::SizeT, fmt : LibC::Char*, ...) : LibC::Int
  fun ImFormatStringToTempBuffer = igImFormatStringToTempBuffer(out_buf : ImGui::ImStrv*, fmt : LibC::Char*, ...)
  fun ImParseFormatFindStart = igImParseFormatFindStart(format : LibC::Char*) : LibC::Char*
  fun ImParseFormatFindEnd = igImParseFormatFindEnd(format : LibC::Char*) : LibC::Char*
  fun ImParseFormatTrimDecorations = igImParseFormatTrimDecorations(format : LibC::Char*, buf : LibC::Char*, buf_size : LibC::SizeT) : LibC::Char*
  fun ImParseFormatSanitizeForPrinting = igImParseFormatSanitizeForPrinting(fmt_in : LibC::Char*, fmt_out : LibC::Char*, fmt_out_size : LibC::SizeT)
  fun ImParseFormatSanitizeForScanning = igImParseFormatSanitizeForScanning(fmt_in : LibC::Char*, fmt_out : LibC::Char*, fmt_out_size : LibC::SizeT) : LibC::Char*
  fun ImParseFormatPrecision = igImParseFormatPrecision(format : LibC::Char*, default_value : LibC::Int) : LibC::Int
  fun ImTextCharToUtf8 = igImTextCharToUtf8(out_buf : LibC::Char*, c : LibC::UInt) : LibC::Char*
  fun ImTextStrToUtf8 = igImTextStrToUtf8(out_buf : LibC::Char*, out_buf_size : LibC::Int, in_text : ImWchar*, in_text_end : ImWchar*) : LibC::Int
  fun ImTextCharFromUtf8 = igImTextCharFromUtf8(out_char : LibC::UInt*, in_text : LibC::Char*, in_text_end : LibC::Char*) : LibC::Int
  fun ImTextStrFromUtf8 = igImTextStrFromUtf8(out_buf : ImWchar*, out_buf_size : LibC::Int, in_text : LibC::Char*, in_text_end : LibC::Char*, in_remaining : LibC::Char**) : LibC::Int
  fun ImTextCountCharsFromUtf8 = igImTextCountCharsFromUtf8(in_text : LibC::Char*, in_text_end : LibC::Char*) : LibC::Int
  fun ImTextCountUtf8BytesFromChar = igImTextCountUtf8BytesFromChar(in_text : LibC::Char*, in_text_end : LibC::Char*) : LibC::Int
  fun ImTextCountUtf8BytesFromStr = igImTextCountUtf8BytesFromStr(in_text : ImWchar*, in_text_end : ImWchar*) : LibC::Int
  fun ImFileOpen_Strv = igImFileOpen_Strv(filename : ImGui::ImStrv, mode : ImGui::ImStrv) : ImFileHandle
  fun ImFileOpen_Str = igImFileOpen_Str(filename : LibC::Char*, mode : LibC::Char*) : ImFileHandle
  fun ImFileClose = igImFileClose(file : ImFileHandle) : Bool
  fun ImFileGetSize = igImFileGetSize(file : ImFileHandle) : UInt64
  fun ImFileRead = igImFileRead(data : Void*, size : UInt64, count : UInt64, file : ImFileHandle) : UInt64
  fun ImFileWrite = igImFileWrite(data : Void*, size : UInt64, count : UInt64, file : ImFileHandle) : UInt64
  fun ImFileLoadToMemory_Strv = igImFileLoadToMemory_Strv(filename : ImGui::ImStrv, mode : ImGui::ImStrv, out_file_size : LibC::SizeT*, padding_bytes : LibC::Int) : Void*
  fun ImFileLoadToMemory_Str = igImFileLoadToMemory_Str(filename : LibC::Char*, mode : LibC::Char*, out_file_size : LibC::SizeT*, padding_bytes : LibC::Int) : Void*
  fun ImPow_Float = igImPow_Float(x : LibC::Float, y : LibC::Float) : LibC::Float
  fun ImPow_double = igImPow_double(x : LibC::Double, y : LibC::Double) : LibC::Double
  fun ImLog_Float = igImLog_Float(x : LibC::Float) : LibC::Float
  fun ImLog_double = igImLog_double(x : LibC::Double) : LibC::Double
  fun ImAbs_Int = igImAbs_Int(x : LibC::Int) : LibC::Int
  fun ImAbs_Float = igImAbs_Float(x : LibC::Float) : LibC::Float
  fun ImAbs_double = igImAbs_double(x : LibC::Double) : LibC::Double
  fun ImSign_Float = igImSign_Float(x : LibC::Float) : LibC::Float
  fun ImSign_double = igImSign_double(x : LibC::Double) : LibC::Double
  fun ImRsqrt_Float = igImRsqrt_Float(x : LibC::Float) : LibC::Float
  fun ImRsqrt_double = igImRsqrt_double(x : LibC::Double) : LibC::Double
  fun ImMin = igImMin(pOut : ImGui::ImVec2*, lhs : ImGui::ImVec2, rhs : ImGui::ImVec2)
  fun ImMax = igImMax(pOut : ImGui::ImVec2*, lhs : ImGui::ImVec2, rhs : ImGui::ImVec2)
  fun ImClamp = igImClamp(pOut : ImGui::ImVec2*, v : ImGui::ImVec2, mn : ImGui::ImVec2, mx : ImGui::ImVec2)
  fun ImLerp_Vec2Float = igImLerp_Vec2Float(pOut : ImGui::ImVec2*, a : ImGui::ImVec2, b : ImGui::ImVec2, t : LibC::Float)
  fun ImLerp_Vec2Vec2 = igImLerp_Vec2Vec2(pOut : ImGui::ImVec2*, a : ImGui::ImVec2, b : ImGui::ImVec2, t : ImGui::ImVec2)
  fun ImLerp_Vec4 = igImLerp_Vec4(pOut : ImGui::ImVec4*, a : ImGui::ImVec4, b : ImGui::ImVec4, t : LibC::Float)
  fun ImSaturate = igImSaturate(f : LibC::Float) : LibC::Float
  fun ImLengthSqr_Vec2 = igImLengthSqr_Vec2(lhs : ImGui::ImVec2) : LibC::Float
  fun ImLengthSqr_Vec4 = igImLengthSqr_Vec4(lhs : ImGui::ImVec4) : LibC::Float
  fun ImInvLength = igImInvLength(lhs : ImGui::ImVec2, fail_value : LibC::Float) : LibC::Float
  fun ImFloor_Float = igImFloor_Float(f : LibC::Float) : LibC::Float
  fun ImFloor_Vec2 = igImFloor_Vec2(pOut : ImGui::ImVec2*, v : ImGui::ImVec2)
  fun ImFloorSigned_Float = igImFloorSigned_Float(f : LibC::Float) : LibC::Float
  fun ImFloorSigned_Vec2 = igImFloorSigned_Vec2(pOut : ImGui::ImVec2*, v : ImGui::ImVec2)
  fun ImModPositive = igImModPositive(a : LibC::Int, b : LibC::Int) : LibC::Int
  fun ImDot = igImDot(a : ImGui::ImVec2, b : ImGui::ImVec2) : LibC::Float
  fun ImRotate = igImRotate(pOut : ImGui::ImVec2*, v : ImGui::ImVec2, cos_a : LibC::Float, sin_a : LibC::Float)
  fun ImLinearSweep = igImLinearSweep(current : LibC::Float, target : LibC::Float, speed : LibC::Float) : LibC::Float
  fun ImMul = igImMul(pOut : ImGui::ImVec2*, lhs : ImGui::ImVec2, rhs : ImGui::ImVec2)
  fun ImIsFloatAboveGuaranteedIntegerPrecision = igImIsFloatAboveGuaranteedIntegerPrecision(f : LibC::Float) : Bool
  fun ImExponentialMovingAverage = igImExponentialMovingAverage(avg : LibC::Float, sample : LibC::Float, n : LibC::Int) : LibC::Float
  fun ImBezierCubicCalc = igImBezierCubicCalc(pOut : ImGui::ImVec2*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, t : LibC::Float)
  fun ImBezierCubicClosestPoint = igImBezierCubicClosestPoint(pOut : ImGui::ImVec2*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, p : ImGui::ImVec2, num_segments : LibC::Int)
  fun ImBezierCubicClosestPointCasteljau = igImBezierCubicClosestPointCasteljau(pOut : ImGui::ImVec2*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, p4 : ImGui::ImVec2, p : ImGui::ImVec2, tess_tol : LibC::Float)
  fun ImBezierQuadraticCalc = igImBezierQuadraticCalc(pOut : ImGui::ImVec2*, p1 : ImGui::ImVec2, p2 : ImGui::ImVec2, p3 : ImGui::ImVec2, t : LibC::Float)
  fun ImLineClosestPoint = igImLineClosestPoint(pOut : ImGui::ImVec2*, a : ImGui::ImVec2, b : ImGui::ImVec2, p : ImGui::ImVec2)
  fun ImTriangleContainsPoint = igImTriangleContainsPoint(a : ImGui::ImVec2, b : ImGui::ImVec2, c : ImGui::ImVec2, p : ImGui::ImVec2) : Bool
  fun ImTriangleClosestPoint = igImTriangleClosestPoint(pOut : ImGui::ImVec2*, a : ImGui::ImVec2, b : ImGui::ImVec2, c : ImGui::ImVec2, p : ImGui::ImVec2)
  fun ImTriangleBarycentricCoords = igImTriangleBarycentricCoords(a : ImGui::ImVec2, b : ImGui::ImVec2, c : ImGui::ImVec2, p : ImGui::ImVec2, out_u : LibC::Float*, out_v : LibC::Float*, out_w : LibC::Float*)
  fun ImTriangleArea = igImTriangleArea(a : ImGui::ImVec2, b : ImGui::ImVec2, c : ImGui::ImVec2) : LibC::Float
  fun ImGetDirQuadrantFromDelta = igImGetDirQuadrantFromDelta(dx : LibC::Float, dy : LibC::Float) : ImGui::ImGuiDir
  type ImVec1 = Void*
  fun ImVec1_ImVec1_Nil = ImVec1_ImVec1_Nil : ImVec1*
  fun ImVec1_ImVec1_Float = ImVec1_ImVec1_Float(_x : LibC::Float) : ImVec1*
  type ImVec2ih = Void*
  fun ImVec2ih_ImVec2ih_Nil = ImVec2ih_ImVec2ih_Nil : ImVec2ih*
  fun ImVec2ih_ImVec2ih_short = ImVec2ih_ImVec2ih_short(_x : LibC::Short, _y : LibC::Short) : ImVec2ih*
  fun ImVec2ih_ImVec2ih_Vec2 = ImVec2ih_ImVec2ih_Vec2(rhs : ImGui::ImVec2) : ImVec2ih*
  type ImRect = Void*
  fun ImRect_ImRect_Nil = ImRect_ImRect_Nil : ImRect*
  fun ImRect_ImRect_Vec2 = ImRect_ImRect_Vec2(min : ImGui::ImVec2, max : ImGui::ImVec2) : ImRect*
  fun ImRect_ImRect_Vec4 = ImRect_ImRect_Vec4(v : ImGui::ImVec4) : ImRect*
  fun ImRect_ImRect_Float = ImRect_ImRect_Float(x1 : LibC::Float, y1 : LibC::Float, x2 : LibC::Float, y2 : LibC::Float) : ImRect*
  fun ImRect_GetCenter = ImRect_GetCenter(pOut : ImGui::ImVec2*, self : ImRect*)
  fun ImRect_GetSize = ImRect_GetSize(pOut : ImGui::ImVec2*, self : ImRect*)
  fun ImRect_GetWidth = ImRect_GetWidth(self : ImRect*) : LibC::Float
  fun ImRect_GetHeight = ImRect_GetHeight(self : ImRect*) : LibC::Float
  fun ImRect_GetArea = ImRect_GetArea(self : ImRect*) : LibC::Float
  fun ImRect_GetTL = ImRect_GetTL(pOut : ImGui::ImVec2*, self : ImRect*)
  fun ImRect_GetTR = ImRect_GetTR(pOut : ImGui::ImVec2*, self : ImRect*)
  fun ImRect_GetBL = ImRect_GetBL(pOut : ImGui::ImVec2*, self : ImRect*)
  fun ImRect_GetBR = ImRect_GetBR(pOut : ImGui::ImVec2*, self : ImRect*)
  fun ImRect_Contains_Vec2 = ImRect_Contains_Vec2(self : ImRect*, p : ImGui::ImVec2) : Bool
  fun ImRect_Contains_Rect = ImRect_Contains_Rect(self : ImRect*, r : ImRect) : Bool
  fun ImRect_Overlaps = ImRect_Overlaps(self : ImRect*, r : ImRect) : Bool
  fun ImRect_Add_Vec2 = ImRect_Add_Vec2(self : ImRect*, p : ImGui::ImVec2)
  fun ImRect_Add_Rect = ImRect_Add_Rect(self : ImRect*, r : ImRect)
  fun ImRect_Expand_Float = ImRect_Expand_Float(self : ImRect*, amount : LibC::Float)
  fun ImRect_Expand_Vec2 = ImRect_Expand_Vec2(self : ImRect*, amount : ImGui::ImVec2)
  fun ImRect_Translate = ImRect_Translate(self : ImRect*, d : ImGui::ImVec2)
  fun ImRect_TranslateX = ImRect_TranslateX(self : ImRect*, dx : LibC::Float)
  fun ImRect_TranslateY = ImRect_TranslateY(self : ImRect*, dy : LibC::Float)
  fun ImRect_ClipWith = ImRect_ClipWith(self : ImRect*, r : ImRect)
  fun ImRect_ClipWithFull = ImRect_ClipWithFull(self : ImRect*, r : ImRect)
  fun ImRect_Floor = ImRect_Floor(self : ImRect*)
  fun ImRect_IsInverted = ImRect_IsInverted(self : ImRect*) : Bool
  fun ImRect_ToVec4 = ImRect_ToVec4(pOut : ImGui::ImVec4*, self : ImRect*)
  fun ImBitArrayGetStorageSizeInBytes = igImBitArrayGetStorageSizeInBytes(bitcount : LibC::Int) : LibC::SizeT
  fun ImBitArrayClearAllBits = igImBitArrayClearAllBits(arr : UInt32*, bitcount : LibC::Int)
  fun ImBitArrayTestBit = igImBitArrayTestBit(arr : UInt32*, n : LibC::Int) : Bool
  fun ImBitArrayClearBit = igImBitArrayClearBit(arr : UInt32*, n : LibC::Int)
  fun ImBitArraySetBit = igImBitArraySetBit(arr : UInt32*, n : LibC::Int)
  fun ImBitArraySetBitRange = igImBitArraySetBitRange(arr : UInt32*, n : LibC::Int, n2 : LibC::Int)
  type ImBitVector = Void*
  fun ImBitVector_Create = ImBitVector_Create(self : ImBitVector*, sz : LibC::Int)
  fun ImBitVector_Clear = ImBitVector_Clear(self : ImBitVector*)
  fun ImBitVector_TestBit = ImBitVector_TestBit(self : ImBitVector*, n : LibC::Int) : Bool
  fun ImBitVector_SetBit = ImBitVector_SetBit(self : ImBitVector*, n : LibC::Int)
  fun ImBitVector_ClearBit = ImBitVector_ClearBit(self : ImBitVector*, n : LibC::Int)
  type ImGuiTextIndex = Void*
  fun ImGuiTextIndex_clear = ImGuiTextIndex_clear(self : ImGuiTextIndex*)
  fun ImGuiTextIndex_size = ImGuiTextIndex_size(self : ImGuiTextIndex*) : LibC::Int
  fun ImGuiTextIndex_get_line_begin = ImGuiTextIndex_get_line_begin(self : ImGuiTextIndex*, base : LibC::Char*, n : LibC::Int) : LibC::Char*
  fun ImGuiTextIndex_get_line_end = ImGuiTextIndex_get_line_end(self : ImGuiTextIndex*, base : LibC::Char*, n : LibC::Int) : LibC::Char*
  fun ImGuiTextIndex_append = ImGuiTextIndex_append(self : ImGuiTextIndex*, base : LibC::Char*, old_size : LibC::Int, new_size : LibC::Int)
  type ImDrawListSharedData = Void*
  fun ImDrawListSharedData_ImDrawListSharedData = ImDrawListSharedData_ImDrawListSharedData : ImDrawListSharedData*
  fun ImDrawListSharedData_SetCircleTessellationMaxError = ImDrawListSharedData_SetCircleTessellationMaxError(self : ImDrawListSharedData*, max_error : LibC::Float)
  type ImDrawDataBuilder = Void*
  fun ImDrawDataBuilder_Clear = ImDrawDataBuilder_Clear(self : ImDrawDataBuilder*)
  fun ImDrawDataBuilder_ClearFreeMemory = ImDrawDataBuilder_ClearFreeMemory(self : ImDrawDataBuilder*)
  fun ImDrawDataBuilder_GetDrawListCount = ImDrawDataBuilder_GetDrawListCount(self : ImDrawDataBuilder*) : LibC::Int
  fun ImDrawDataBuilder_FlattenIntoSingleLayer = ImDrawDataBuilder_FlattenIntoSingleLayer(self : ImDrawDataBuilder*)
  type ImGuiDataVarInfo = Void*
  fun ImGuiDataVarInfo_GetVarPtr = ImGuiDataVarInfo_GetVarPtr(self : ImGuiDataVarInfo*, parent : Void*) : Void*
  type ImGuiDataTypeTempStorage = Void*
  type ImGuiDataTypeInfo = Void*
  type ImGuiColorMod = Void*
  type ImGuiStyleMod = Void*
  fun ImGuiStyleMod_ImGuiStyleMod_Int = ImGuiStyleMod_ImGuiStyleMod_Int(idx : ImGui::ImGuiStyleVar, v : LibC::Int) : ImGuiStyleMod*
  fun ImGuiStyleMod_ImGuiStyleMod_Float = ImGuiStyleMod_ImGuiStyleMod_Float(idx : ImGui::ImGuiStyleVar, v : LibC::Float) : ImGuiStyleMod*
  fun ImGuiStyleMod_ImGuiStyleMod_Vec2 = ImGuiStyleMod_ImGuiStyleMod_Vec2(idx : ImGui::ImGuiStyleVar, v : ImGui::ImVec2) : ImGuiStyleMod*
  type ImGuiComboPreviewData = Void*
  fun ImGuiComboPreviewData_ImGuiComboPreviewData = ImGuiComboPreviewData_ImGuiComboPreviewData : ImGuiComboPreviewData*
  type ImGuiGroupData = Void*
  type ImGuiMenuColumns = Void*
  fun ImGuiMenuColumns_ImGuiMenuColumns = ImGuiMenuColumns_ImGuiMenuColumns : ImGuiMenuColumns*
  fun ImGuiMenuColumns_Update = ImGuiMenuColumns_Update(self : ImGuiMenuColumns*, spacing : LibC::Float, window_reappearing : Bool)
  fun ImGuiMenuColumns_DeclColumns = ImGuiMenuColumns_DeclColumns(self : ImGuiMenuColumns*, w_icon : LibC::Float, w_label : LibC::Float, w_shortcut : LibC::Float, w_mark : LibC::Float) : LibC::Float
  fun ImGuiMenuColumns_CalcNextTotalWidth = ImGuiMenuColumns_CalcNextTotalWidth(self : ImGuiMenuColumns*, update_offsets : Bool)
  type ImGuiInputTextDeactivatedState = Void*
  fun ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState = ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState : ImGuiInputTextDeactivatedState*
  fun ImGuiInputTextDeactivatedState_ClearFreeMemory = ImGuiInputTextDeactivatedState_ClearFreeMemory(self : ImGuiInputTextDeactivatedState*)
  type ImGuiInputTextState = Void*
  fun ImGuiInputTextState_ImGuiInputTextState = ImGuiInputTextState_ImGuiInputTextState : ImGuiInputTextState*
  fun ImGuiInputTextState_ClearText = ImGuiInputTextState_ClearText(self : ImGuiInputTextState*)
  fun ImGuiInputTextState_ClearFreeMemory = ImGuiInputTextState_ClearFreeMemory(self : ImGuiInputTextState*)
  fun ImGuiInputTextState_GetUndoAvailCount = ImGuiInputTextState_GetUndoAvailCount(self : ImGuiInputTextState*) : LibC::Int
  fun ImGuiInputTextState_GetRedoAvailCount = ImGuiInputTextState_GetRedoAvailCount(self : ImGuiInputTextState*) : LibC::Int
  fun ImGuiInputTextState_OnKeyPressed = ImGuiInputTextState_OnKeyPressed(self : ImGuiInputTextState*, key : LibC::Int)
  fun ImGuiInputTextState_CursorAnimReset = ImGuiInputTextState_CursorAnimReset(self : ImGuiInputTextState*)
  fun ImGuiInputTextState_CursorClamp = ImGuiInputTextState_CursorClamp(self : ImGuiInputTextState*)
  fun ImGuiInputTextState_HasSelection = ImGuiInputTextState_HasSelection(self : ImGuiInputTextState*) : Bool
  fun ImGuiInputTextState_ClearSelection = ImGuiInputTextState_ClearSelection(self : ImGuiInputTextState*)
  fun ImGuiInputTextState_GetCursorPos = ImGuiInputTextState_GetCursorPos(self : ImGuiInputTextState*) : LibC::Int
  fun ImGuiInputTextState_GetSelectionStart = ImGuiInputTextState_GetSelectionStart(self : ImGuiInputTextState*) : LibC::Int
  fun ImGuiInputTextState_GetSelectionEnd = ImGuiInputTextState_GetSelectionEnd(self : ImGuiInputTextState*) : LibC::Int
  fun ImGuiInputTextState_SelectAll = ImGuiInputTextState_SelectAll(self : ImGuiInputTextState*)
  type ImGuiPopupData = Void*
  fun ImGuiPopupData_ImGuiPopupData = ImGuiPopupData_ImGuiPopupData : ImGuiPopupData*
  type ImGuiNextWindowData = Void*
  fun ImGuiNextWindowData_ImGuiNextWindowData = ImGuiNextWindowData_ImGuiNextWindowData : ImGuiNextWindowData*
  fun ImGuiNextWindowData_ClearFlags = ImGuiNextWindowData_ClearFlags(self : ImGuiNextWindowData*)
  type ImGuiNextItemData = Void*
  fun ImGuiNextItemData_ImGuiNextItemData = ImGuiNextItemData_ImGuiNextItemData : ImGuiNextItemData*
  fun ImGuiNextItemData_ClearFlags = ImGuiNextItemData_ClearFlags(self : ImGuiNextItemData*)
  type ImGuiLastItemData = Void*
  fun ImGuiLastItemData_ImGuiLastItemData = ImGuiLastItemData_ImGuiLastItemData : ImGuiLastItemData*
  type ImGuiStackSizes = Void*
  fun ImGuiStackSizes_ImGuiStackSizes = ImGuiStackSizes_ImGuiStackSizes : ImGuiStackSizes*
  fun ImGuiStackSizes_SetToContextState = ImGuiStackSizes_SetToContextState(self : ImGuiStackSizes*, ctx : ImGuiContext*)
  fun ImGuiStackSizes_CompareWithContextState = ImGuiStackSizes_CompareWithContextState(self : ImGuiStackSizes*, ctx : ImGuiContext*)
  type ImGuiWindowStackData = Void*
  type ImGuiShrinkWidthItem = Void*
  type ImGuiPtrOrIndex = Void*
  fun ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr = ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr(ptr : Void*) : ImGuiPtrOrIndex*
  fun ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int = ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int(index : LibC::Int) : ImGuiPtrOrIndex*
  type ImGuiInputEventMousePos = Void*
  type ImGuiInputEventMouseWheel = Void*
  type ImGuiInputEventMouseButton = Void*
  type ImGuiInputEventKey = Void*
  type ImGuiInputEventText = Void*
  type ImGuiInputEventAppFocused = Void*
  type ImGuiInputEvent = Void*
  fun ImGuiInputEvent_ImGuiInputEvent = ImGuiInputEvent_ImGuiInputEvent : ImGuiInputEvent*
  type ImGuiKeyRoutingData = Void*
  fun ImGuiKeyRoutingData_ImGuiKeyRoutingData = ImGuiKeyRoutingData_ImGuiKeyRoutingData : ImGuiKeyRoutingData*
  type ImGuiKeyRoutingTable = Void*
  fun ImGuiKeyRoutingTable_ImGuiKeyRoutingTable = ImGuiKeyRoutingTable_ImGuiKeyRoutingTable : ImGuiKeyRoutingTable*
  fun ImGuiKeyRoutingTable_Clear = ImGuiKeyRoutingTable_Clear(self : ImGuiKeyRoutingTable*)
  type ImGuiKeyOwnerData = Void*
  fun ImGuiKeyOwnerData_ImGuiKeyOwnerData = ImGuiKeyOwnerData_ImGuiKeyOwnerData : ImGuiKeyOwnerData*
  type ImGuiListClipperRange = Void*
  fun ImGuiListClipperRange_FromIndices = ImGuiListClipperRange_FromIndices(min : LibC::Int, max : LibC::Int) : ImGuiListClipperRange
  fun ImGuiListClipperRange_FromPositions = ImGuiListClipperRange_FromPositions(y1 : LibC::Float, y2 : LibC::Float, off_min : LibC::Int, off_max : LibC::Int) : ImGuiListClipperRange
  type ImGuiListClipperData = Void*
  fun ImGuiListClipperData_ImGuiListClipperData = ImGuiListClipperData_ImGuiListClipperData : ImGuiListClipperData*
  fun ImGuiListClipperData_Reset = ImGuiListClipperData_Reset(self : ImGuiListClipperData*, clipper : ImGui::ImGuiListClipper*)
  type ImGuiNavItemData = Void*
  fun ImGuiNavItemData_ImGuiNavItemData = ImGuiNavItemData_ImGuiNavItemData : ImGuiNavItemData*
  fun ImGuiNavItemData_Clear = ImGuiNavItemData_Clear(self : ImGuiNavItemData*)
  type ImGuiOldColumnData = Void*
  fun ImGuiOldColumnData_ImGuiOldColumnData = ImGuiOldColumnData_ImGuiOldColumnData : ImGuiOldColumnData*
  type ImGuiOldColumns = Void*
  fun ImGuiOldColumns_ImGuiOldColumns = ImGuiOldColumns_ImGuiOldColumns : ImGuiOldColumns*
  type ImGuiViewportP = Void*
  fun ImGuiViewportP_ImGuiViewportP = ImGuiViewportP_ImGuiViewportP : ImGuiViewportP*
  fun ImGuiViewportP_CalcWorkRectPos = ImGuiViewportP_CalcWorkRectPos(pOut : ImGui::ImVec2*, self : ImGuiViewportP*, off_min : ImGui::ImVec2)
  fun ImGuiViewportP_CalcWorkRectSize = ImGuiViewportP_CalcWorkRectSize(pOut : ImGui::ImVec2*, self : ImGuiViewportP*, off_min : ImGui::ImVec2, off_max : ImGui::ImVec2)
  fun ImGuiViewportP_UpdateWorkRect = ImGuiViewportP_UpdateWorkRect(self : ImGuiViewportP*)
  fun ImGuiViewportP_GetMainRect = ImGuiViewportP_GetMainRect(pOut : ImRect*, self : ImGuiViewportP*)
  fun ImGuiViewportP_GetWorkRect = ImGuiViewportP_GetWorkRect(pOut : ImRect*, self : ImGuiViewportP*)
  fun ImGuiViewportP_GetBuildWorkRect = ImGuiViewportP_GetBuildWorkRect(pOut : ImRect*, self : ImGuiViewportP*)
  type ImGuiWindowSettings = Void*
  fun ImGuiWindowSettings_ImGuiWindowSettings = ImGuiWindowSettings_ImGuiWindowSettings : ImGuiWindowSettings*
  fun ImGuiWindowSettings_GetName = ImGuiWindowSettings_GetName(self : ImGuiWindowSettings*) : LibC::Char*
  type ImGuiSettingsHandler = Void*
  fun ImGuiSettingsHandler_ImGuiSettingsHandler = ImGuiSettingsHandler_ImGuiSettingsHandler : ImGuiSettingsHandler*
  type ImGuiLocEntry = Void*
  type ImGuiMetricsConfig = Void*
  type ImGuiStackLevelInfo = Void*
  fun ImGuiStackLevelInfo_ImGuiStackLevelInfo = ImGuiStackLevelInfo_ImGuiStackLevelInfo : ImGuiStackLevelInfo*
  type ImGuiStackTool = Void*
  fun ImGuiStackTool_ImGuiStackTool = ImGuiStackTool_ImGuiStackTool : ImGuiStackTool*
  type ImGuiContextHook = Void*
  fun ImGuiContextHook_ImGuiContextHook = ImGuiContextHook_ImGuiContextHook : ImGuiContextHook*
  type ImGuiContext = Void*
  fun ImGuiContext_ImGuiContext = ImGuiContext_ImGuiContext(shared_font_atlas : ImFontAtlas*) : ImGuiContext*
  type ImGuiWindowTempData = Void*
  type ImGuiWindow = Void*
  fun ImGuiWindow_ImGuiWindow_Strv = ImGuiWindow_ImGuiWindow_Strv(context : ImGuiContext*, name : ImGui::ImStrv) : ImGuiWindow*
  fun ImGuiWindow_ImGuiWindow_Str = ImGuiWindow_ImGuiWindow_Str(context : ImGuiContext*, name : LibC::Char*) : ImGuiWindow*
  fun ImGuiWindow_GetID_Strv = ImGuiWindow_GetID_Strv(self : ImGuiWindow*, str : ImGui::ImStrv) : ImGuiID
  fun ImGuiWindow_GetID_Str = ImGuiWindow_GetID_Str(self : ImGuiWindow*, str : LibC::Char*) : ImGuiID
  fun ImGuiWindow_GetID_StrStr = ImGuiWindow_GetID_StrStr(self : ImGuiWindow*, str : LibC::Char*, str_end : LibC::Char*) : ImGuiID
  fun ImGuiWindow_GetID_Ptr = ImGuiWindow_GetID_Ptr(self : ImGuiWindow*, ptr : Void*) : ImGuiID
  fun ImGuiWindow_GetID_Int = ImGuiWindow_GetID_Int(self : ImGuiWindow*, n : LibC::Int) : ImGuiID
  fun ImGuiWindow_GetIDFromRectangle = ImGuiWindow_GetIDFromRectangle(self : ImGuiWindow*, r_abs : ImRect) : ImGuiID
  fun ImGuiWindow_Rect = ImGuiWindow_Rect(pOut : ImRect*, self : ImGuiWindow*)
  fun ImGuiWindow_CalcFontSize = ImGuiWindow_CalcFontSize(self : ImGuiWindow*) : LibC::Float
  fun ImGuiWindow_TitleBarHeight = ImGuiWindow_TitleBarHeight(self : ImGuiWindow*) : LibC::Float
  fun ImGuiWindow_TitleBarRect = ImGuiWindow_TitleBarRect(pOut : ImRect*, self : ImGuiWindow*)
  fun ImGuiWindow_MenuBarHeight = ImGuiWindow_MenuBarHeight(self : ImGuiWindow*) : LibC::Float
  fun ImGuiWindow_MenuBarRect = ImGuiWindow_MenuBarRect(pOut : ImRect*, self : ImGuiWindow*)
  type ImGuiTabItem = Void*
  fun ImGuiTabItem_ImGuiTabItem = ImGuiTabItem_ImGuiTabItem : ImGuiTabItem*
  type ImGuiTabBar = Void*
  fun ImGuiTabBar_ImGuiTabBar = ImGuiTabBar_ImGuiTabBar : ImGuiTabBar*
  type ImGuiTableColumn = Void*
  fun ImGuiTableColumn_ImGuiTableColumn = ImGuiTableColumn_ImGuiTableColumn : ImGuiTableColumn*
  type ImGuiTableCellData = Void*
  type ImGuiTableInstanceData = Void*
  fun ImGuiTableInstanceData_ImGuiTableInstanceData = ImGuiTableInstanceData_ImGuiTableInstanceData : ImGuiTableInstanceData*
  type ImGuiTable = Void*
  fun ImGuiTable_ImGuiTable = ImGuiTable_ImGuiTable : ImGuiTable*
  type ImGuiTableTempData = Void*
  fun ImGuiTableTempData_ImGuiTableTempData = ImGuiTableTempData_ImGuiTableTempData : ImGuiTableTempData*
  type ImGuiTableColumnSettings = Void*
  fun ImGuiTableColumnSettings_ImGuiTableColumnSettings = ImGuiTableColumnSettings_ImGuiTableColumnSettings : ImGuiTableColumnSettings*
  type ImGuiTableSettings = Void*
  fun ImGuiTableSettings_ImGuiTableSettings = ImGuiTableSettings_ImGuiTableSettings : ImGuiTableSettings*
  fun ImGuiTableSettings_GetColumnSettings = ImGuiTableSettings_GetColumnSettings(self : ImGuiTableSettings*) : ImGuiTableColumnSettings*
  fun GetCurrentWindowRead = igGetCurrentWindowRead : ImGuiWindow*
  fun GetCurrentWindow = igGetCurrentWindow : ImGuiWindow*
  fun FindWindowByID = igFindWindowByID(id : ImGuiID) : ImGuiWindow*
  fun FindWindowByName_Strv = igFindWindowByName_Strv(name : ImGui::ImStrv) : ImGuiWindow*
  fun FindWindowByName_Str = igFindWindowByName_Str(name : LibC::Char*) : ImGuiWindow*
  fun UpdateWindowParentAndRootLinks = igUpdateWindowParentAndRootLinks(window : ImGuiWindow*, flags : ImGui::ImGuiWindowFlags, parent_window : ImGuiWindow*)
  fun CalcWindowNextAutoFitSize = igCalcWindowNextAutoFitSize(pOut : ImGui::ImVec2*, window : ImGuiWindow*)
  fun IsWindowChildOf = igIsWindowChildOf(window : ImGuiWindow*, potential_parent : ImGuiWindow*, popup_hierarchy : Bool) : Bool
  fun IsWindowWithinBeginStackOf = igIsWindowWithinBeginStackOf(window : ImGuiWindow*, potential_parent : ImGuiWindow*) : Bool
  fun IsWindowAbove = igIsWindowAbove(potential_above : ImGuiWindow*, potential_below : ImGuiWindow*) : Bool
  fun IsWindowNavFocusable = igIsWindowNavFocusable(window : ImGuiWindow*) : Bool
  fun SetWindowHitTestHole = igSetWindowHitTestHole(window : ImGuiWindow*, pos : ImGui::ImVec2, size : ImGui::ImVec2)
  fun SetWindowHiddendAndSkipItemsForCurrentFrame = igSetWindowHiddendAndSkipItemsForCurrentFrame(window : ImGuiWindow*)
  fun WindowRectAbsToRel = igWindowRectAbsToRel(pOut : ImRect*, window : ImGuiWindow*, r : ImRect)
  fun WindowRectRelToAbs = igWindowRectRelToAbs(pOut : ImRect*, window : ImGuiWindow*, r : ImRect)
  fun FocusWindow = igFocusWindow(window : ImGuiWindow*)
  fun FocusTopMostWindowUnderOne = igFocusTopMostWindowUnderOne(under_this_window : ImGuiWindow*, ignore_window : ImGuiWindow*)
  fun BringWindowToFocusFront = igBringWindowToFocusFront(window : ImGuiWindow*)
  fun BringWindowToDisplayFront = igBringWindowToDisplayFront(window : ImGuiWindow*)
  fun BringWindowToDisplayBack = igBringWindowToDisplayBack(window : ImGuiWindow*)
  fun BringWindowToDisplayBehind = igBringWindowToDisplayBehind(window : ImGuiWindow*, above_window : ImGuiWindow*)
  fun FindWindowDisplayIndex = igFindWindowDisplayIndex(window : ImGuiWindow*) : LibC::Int
  fun FindBottomMostVisibleWindowWithinBeginStack = igFindBottomMostVisibleWindowWithinBeginStack(window : ImGuiWindow*) : ImGuiWindow*
  fun SetCurrentFont = igSetCurrentFont(font : ImFont*)
  fun GetDefaultFont = igGetDefaultFont : ImFont*
  fun Initialize = igInitialize
  fun Shutdown = igShutdown
  fun UpdateInputEvents = igUpdateInputEvents(trickle_fast_inputs : Bool)
  fun UpdateHoveredWindowAndCaptureFlags = igUpdateHoveredWindowAndCaptureFlags
  fun StartMouseMovingWindow = igStartMouseMovingWindow(window : ImGuiWindow*)
  fun UpdateMouseMovingWindowNewFrame = igUpdateMouseMovingWindowNewFrame
  fun UpdateMouseMovingWindowEndFrame = igUpdateMouseMovingWindowEndFrame
  fun AddContextHook = igAddContextHook(context : ImGuiContext*, hook : ImGuiContextHook*) : ImGuiID
  fun RemoveContextHook = igRemoveContextHook(context : ImGuiContext*, hook_to_remove : ImGuiID)
  fun CallContextHooks = igCallContextHooks(context : ImGuiContext*, type : ImGui::ImGuiContextHookType)
  fun SetWindowViewport = igSetWindowViewport(window : ImGuiWindow*, viewport : ImGuiViewportP*)
  fun MarkIniSettingsDirty_Nil = igMarkIniSettingsDirty_Nil
  fun MarkIniSettingsDirty_WindowPtr = igMarkIniSettingsDirty_WindowPtr(window : ImGuiWindow*)
  fun ClearIniSettings = igClearIniSettings
  fun AddSettingsHandler = igAddSettingsHandler(handler : ImGuiSettingsHandler*)
  fun RemoveSettingsHandler_Strv = igRemoveSettingsHandler_Strv(type_name : ImGui::ImStrv)
  fun RemoveSettingsHandler_Str = igRemoveSettingsHandler_Str(type_name : LibC::Char*)
  fun FindSettingsHandler_Strv = igFindSettingsHandler_Strv(type_name : ImGui::ImStrv) : ImGuiSettingsHandler*
  fun FindSettingsHandler_Str = igFindSettingsHandler_Str(type_name : LibC::Char*) : ImGuiSettingsHandler*
  fun CreateNewWindowSettings_Strv = igCreateNewWindowSettings_Strv(name : ImGui::ImStrv) : ImGuiWindowSettings*
  fun CreateNewWindowSettings_Str = igCreateNewWindowSettings_Str(name : LibC::Char*) : ImGuiWindowSettings*
  fun FindWindowSettingsByID = igFindWindowSettingsByID(id : ImGuiID) : ImGuiWindowSettings*
  fun FindWindowSettingsByWindow = igFindWindowSettingsByWindow(window : ImGuiWindow*) : ImGuiWindowSettings*
  fun ClearWindowSettings_Strv = igClearWindowSettings_Strv(name : ImGui::ImStrv)
  fun ClearWindowSettings_Str = igClearWindowSettings_Str(name : LibC::Char*)
  fun LocalizeRegisterEntries = igLocalizeRegisterEntries(entries : ImGuiLocEntry*, count : LibC::Int)
  fun LocalizeGetMsg = igLocalizeGetMsg(key : ImGui::ImGuiLocKey) : LibC::Char*
  fun ScrollToItem = igScrollToItem(flags : ImGui::ImGuiScrollFlags)
  fun ScrollToRect = igScrollToRect(window : ImGuiWindow*, rect : ImRect, flags : ImGui::ImGuiScrollFlags)
  fun ScrollToRectEx = igScrollToRectEx(pOut : ImGui::ImVec2*, window : ImGuiWindow*, rect : ImRect, flags : ImGui::ImGuiScrollFlags)
  fun ScrollToBringRectIntoView = igScrollToBringRectIntoView(window : ImGuiWindow*, rect : ImRect)
  fun GetItemStatusFlags = igGetItemStatusFlags : ImGui::ImGuiItemStatusFlags
  fun GetItemFlags = igGetItemFlags : ImGui::ImGuiItemFlags
  fun GetActiveID = igGetActiveID : ImGuiID
  fun GetFocusID = igGetFocusID : ImGuiID
  fun SetActiveID = igSetActiveID(id : ImGuiID, window : ImGuiWindow*)
  fun SetFocusID = igSetFocusID(id : ImGuiID, window : ImGuiWindow*)
  fun ClearActiveID = igClearActiveID
  fun GetHoveredID = igGetHoveredID : ImGuiID
  fun SetHoveredID = igSetHoveredID(id : ImGuiID)
  fun KeepAliveID = igKeepAliveID(id : ImGuiID)
  fun MarkItemEdited = igMarkItemEdited(id : ImGuiID)
  fun PushOverrideID = igPushOverrideID(id : ImGuiID)
  fun GetIDWithSeed_Str = igGetIDWithSeed_Str(str_id_begin : LibC::Char*, str_id_end : LibC::Char*, seed : ImGuiID) : ImGuiID
  fun GetIDWithSeed_Int = igGetIDWithSeed_Int(n : LibC::Int, seed : ImGuiID) : ImGuiID
  fun ItemSize_Vec2 = igItemSize_Vec2(size : ImGui::ImVec2, text_baseline_y : LibC::Float)
  fun ItemSize_Rect = igItemSize_Rect(bb : ImRect, text_baseline_y : LibC::Float)
  fun ItemAdd = igItemAdd(bb : ImRect, id : ImGuiID, nav_bb : ImRect*, extra_flags : ImGui::ImGuiItemFlags) : Bool
  fun ItemHoverable = igItemHoverable(bb : ImRect, id : ImGuiID) : Bool
  fun IsWindowContentHoverable = igIsWindowContentHoverable(window : ImGuiWindow*, flags : ImGui::ImGuiHoveredFlags) : Bool
  fun IsClippedEx = igIsClippedEx(bb : ImRect, id : ImGuiID) : Bool
  fun SetLastItemData = igSetLastItemData(item_id : ImGuiID, in_flags : ImGui::ImGuiItemFlags, status_flags : ImGui::ImGuiItemStatusFlags, item_rect : ImRect)
  fun CalcItemSize = igCalcItemSize(pOut : ImGui::ImVec2*, size : ImGui::ImVec2, default_w : LibC::Float, default_h : LibC::Float)
  fun CalcWrapWidthForPos = igCalcWrapWidthForPos(pos : ImGui::ImVec2, wrap_pos_x : LibC::Float) : LibC::Float
  fun PushMultiItemsWidths = igPushMultiItemsWidths(components : LibC::Int, width_full : LibC::Float)
  fun IsItemToggledSelection = igIsItemToggledSelection : Bool
  fun GetContentRegionMaxAbs = igGetContentRegionMaxAbs(pOut : ImGui::ImVec2*)
  fun ShrinkWidths = igShrinkWidths(items : ImGuiShrinkWidthItem*, count : LibC::Int, width_excess : LibC::Float)
  fun PushItemFlag = igPushItemFlag(option : ImGui::ImGuiItemFlags, enabled : Bool)
  fun PopItemFlag = igPopItemFlag
  fun GetStyleVarInfo = igGetStyleVarInfo(idx : ImGui::ImGuiStyleVar) : ImGuiDataVarInfo*
  fun LogBegin = igLogBegin(type : ImGui::ImGuiLogType, auto_open_depth : LibC::Int)
  fun LogToBuffer = igLogToBuffer(auto_open_depth : LibC::Int)
  fun LogRenderedText_Strv = igLogRenderedText_Strv(ref_pos : ImGui::ImVec2*, text : ImGui::ImStrv)
  fun LogRenderedText_StrStr = igLogRenderedText_StrStr(ref_pos : ImGui::ImVec2*, text : LibC::Char*, text_end : LibC::Char*)
  fun LogRenderedText_Str = igLogRenderedText_Str(ref_pos : ImGui::ImVec2*, text : LibC::Char*)
  fun LogSetNextTextDecoration = igLogSetNextTextDecoration(prefix : LibC::Char*, suffix : LibC::Char*)
  fun BeginChildEx_Strv = igBeginChildEx_Strv(name : ImGui::ImStrv, id : ImGuiID, size_arg : ImGui::ImVec2, border : Bool, flags : ImGui::ImGuiWindowFlags) : Bool
  fun BeginChildEx_Str = igBeginChildEx_Str(name : LibC::Char*, id : ImGuiID, size_arg : ImGui::ImVec2, border : Bool, flags : ImGui::ImGuiWindowFlags) : Bool
  fun OpenPopupEx = igOpenPopupEx(id : ImGuiID, popup_flags : ImGui::ImGuiPopupFlags)
  fun ClosePopupToLevel = igClosePopupToLevel(remaining : LibC::Int, restore_focus_to_window_under_popup : Bool)
  fun ClosePopupsOverWindow = igClosePopupsOverWindow(ref_window : ImGuiWindow*, restore_focus_to_window_under_popup : Bool)
  fun ClosePopupsExceptModals = igClosePopupsExceptModals
  fun BeginPopupEx = igBeginPopupEx(id : ImGuiID, extra_flags : ImGui::ImGuiWindowFlags) : Bool
  fun BeginTooltipEx = igBeginTooltipEx(tooltip_flags : ImGui::ImGuiTooltipFlags, extra_window_flags : ImGui::ImGuiWindowFlags) : Bool
  fun GetPopupAllowedExtentRect = igGetPopupAllowedExtentRect(pOut : ImRect*, window : ImGuiWindow*)
  fun GetTopMostPopupModal = igGetTopMostPopupModal : ImGuiWindow*
  fun GetTopMostAndVisiblePopupModal = igGetTopMostAndVisiblePopupModal : ImGuiWindow*
  fun FindBestWindowPosForPopup = igFindBestWindowPosForPopup(pOut : ImGui::ImVec2*, window : ImGuiWindow*)
  fun FindBestWindowPosForPopupEx = igFindBestWindowPosForPopupEx(pOut : ImGui::ImVec2*, ref_pos : ImGui::ImVec2, size : ImGui::ImVec2, last_dir : ImGui::ImGuiDir*, r_outer : ImRect, r_avoid : ImRect, policy : ImGui::ImGuiPopupPositionPolicy)
  fun BeginViewportSideBar_Strv = igBeginViewportSideBar_Strv(name : ImGui::ImStrv, viewport : ImGuiViewport*, dir : ImGui::ImGuiDir, size : LibC::Float, window_flags : ImGui::ImGuiWindowFlags) : Bool
  fun BeginViewportSideBar_Str = igBeginViewportSideBar_Str(name : LibC::Char*, viewport : ImGuiViewport*, dir : ImGui::ImGuiDir, size : LibC::Float, window_flags : ImGui::ImGuiWindowFlags) : Bool
  fun BeginMenuEx_Strv = igBeginMenuEx_Strv(label : ImGui::ImStrv, icon : ImGui::ImStrv, enabled : Bool) : Bool
  fun BeginMenuEx_Str = igBeginMenuEx_Str(label : LibC::Char*, icon : LibC::Char*, enabled : Bool) : Bool
  fun MenuItemEx_Strv = igMenuItemEx_Strv(label : ImGui::ImStrv, icon : ImGui::ImStrv, shortcut : ImGui::ImStrv, selected : Bool, enabled : Bool) : Bool
  fun MenuItemEx_Str = igMenuItemEx_Str(label : LibC::Char*, icon : LibC::Char*, shortcut : LibC::Char*, selected : Bool, enabled : Bool) : Bool
  fun BeginComboPopup = igBeginComboPopup(popup_id : ImGuiID, bb : ImRect, flags : ImGui::ImGuiComboFlags) : Bool
  fun BeginComboPreview = igBeginComboPreview : Bool
  fun EndComboPreview = igEndComboPreview
  fun NavInitWindow = igNavInitWindow(window : ImGuiWindow*, force_reinit : Bool)
  fun NavInitRequestApplyResult = igNavInitRequestApplyResult
  fun NavMoveRequestButNoResultYet = igNavMoveRequestButNoResultYet : Bool
  fun NavMoveRequestSubmit = igNavMoveRequestSubmit(move_dir : ImGui::ImGuiDir, clip_dir : ImGui::ImGuiDir, move_flags : ImGui::ImGuiNavMoveFlags, scroll_flags : ImGui::ImGuiScrollFlags)
  fun NavMoveRequestForward = igNavMoveRequestForward(move_dir : ImGui::ImGuiDir, clip_dir : ImGui::ImGuiDir, move_flags : ImGui::ImGuiNavMoveFlags, scroll_flags : ImGui::ImGuiScrollFlags)
  fun NavMoveRequestResolveWithLastItem = igNavMoveRequestResolveWithLastItem(result : ImGuiNavItemData*)
  fun NavMoveRequestCancel = igNavMoveRequestCancel
  fun NavMoveRequestApplyResult = igNavMoveRequestApplyResult
  fun NavMoveRequestTryWrapping = igNavMoveRequestTryWrapping(window : ImGuiWindow*, move_flags : ImGui::ImGuiNavMoveFlags)
  fun ActivateItem = igActivateItem(id : ImGuiID)
  fun SetNavWindow = igSetNavWindow(window : ImGuiWindow*)
  fun SetNavID = igSetNavID(id : ImGuiID, nav_layer : ImGui::ImGuiNavLayer, focus_scope_id : ImGuiID, rect_rel : ImRect)
  fun IsNamedKey = igIsNamedKey(key : ImGui::ImGuiKey) : Bool
  fun IsNamedKeyOrModKey = igIsNamedKeyOrModKey(key : ImGui::ImGuiKey) : Bool
  fun IsLegacyKey = igIsLegacyKey(key : ImGui::ImGuiKey) : Bool
  fun IsKeyboardKey = igIsKeyboardKey(key : ImGui::ImGuiKey) : Bool
  fun IsGamepadKey = igIsGamepadKey(key : ImGui::ImGuiKey) : Bool
  fun IsMouseKey = igIsMouseKey(key : ImGui::ImGuiKey) : Bool
  fun IsAliasKey = igIsAliasKey(key : ImGui::ImGuiKey) : Bool
  fun ConvertShortcutMod = igConvertShortcutMod(key_chord : ImGuiKeyChord) : ImGuiKeyChord
  fun ConvertSingleModFlagToKey = igConvertSingleModFlagToKey(ctx : ImGuiContext*, key : ImGui::ImGuiKey) : ImGui::ImGuiKey
  fun GetKeyData_ContextPtr = igGetKeyData_ContextPtr(ctx : ImGuiContext*, key : ImGui::ImGuiKey) : ImGuiKeyData*
  fun GetKeyData_Key = igGetKeyData_Key(key : ImGui::ImGuiKey) : ImGuiKeyData*
  fun GetKeyChordName = igGetKeyChordName(key_chord : ImGuiKeyChord, out_buf : LibC::Char*, out_buf_size : LibC::Int)
  fun MouseButtonToKey = igMouseButtonToKey(button : ImGui::ImGuiMouseButton) : ImGui::ImGuiKey
  fun IsMouseDragPastThreshold = igIsMouseDragPastThreshold(button : ImGui::ImGuiMouseButton, lock_threshold : LibC::Float) : Bool
  fun GetKeyMagnitude2d = igGetKeyMagnitude2d(pOut : ImGui::ImVec2*, key_left : ImGui::ImGuiKey, key_right : ImGui::ImGuiKey, key_up : ImGui::ImGuiKey, key_down : ImGui::ImGuiKey)
  fun GetNavTweakPressedAmount = igGetNavTweakPressedAmount(axis : ImGui::ImGuiAxis) : LibC::Float
  fun CalcTypematicRepeatAmount = igCalcTypematicRepeatAmount(t0 : LibC::Float, t1 : LibC::Float, repeat_delay : LibC::Float, repeat_rate : LibC::Float) : LibC::Int
  fun GetTypematicRepeatRate = igGetTypematicRepeatRate(flags : ImGui::ImGuiInputFlags, repeat_delay : LibC::Float*, repeat_rate : LibC::Float*)
  fun SetActiveIdUsingAllKeyboardKeys = igSetActiveIdUsingAllKeyboardKeys
  fun IsActiveIdUsingNavDir = igIsActiveIdUsingNavDir(dir : ImGui::ImGuiDir) : Bool
  fun GetKeyOwner = igGetKeyOwner(key : ImGui::ImGuiKey) : ImGuiID
  fun SetKeyOwner = igSetKeyOwner(key : ImGui::ImGuiKey, owner_id : ImGuiID, flags : ImGui::ImGuiInputFlags)
  fun SetKeyOwnersForKeyChord = igSetKeyOwnersForKeyChord(key : ImGuiKeyChord, owner_id : ImGuiID, flags : ImGui::ImGuiInputFlags)
  fun SetItemKeyOwner = igSetItemKeyOwner(key : ImGui::ImGuiKey, flags : ImGui::ImGuiInputFlags)
  fun TestKeyOwner = igTestKeyOwner(key : ImGui::ImGuiKey, owner_id : ImGuiID) : Bool
  fun GetKeyOwnerData = igGetKeyOwnerData(ctx : ImGuiContext*, key : ImGui::ImGuiKey) : ImGuiKeyOwnerData*
  fun Shortcut = igShortcut(key_chord : ImGuiKeyChord, owner_id : ImGuiID, flags : ImGui::ImGuiInputFlags) : Bool
  fun SetShortcutRouting = igSetShortcutRouting(key_chord : ImGuiKeyChord, owner_id : ImGuiID, flags : ImGui::ImGuiInputFlags) : Bool
  fun TestShortcutRouting = igTestShortcutRouting(key_chord : ImGuiKeyChord, owner_id : ImGuiID) : Bool
  fun GetShortcutRoutingData = igGetShortcutRoutingData(key_chord : ImGuiKeyChord) : ImGuiKeyRoutingData*
  fun PushFocusScope = igPushFocusScope(id : ImGuiID)
  fun PopFocusScope = igPopFocusScope
  fun GetCurrentFocusScope = igGetCurrentFocusScope : ImGuiID
  fun IsDragDropActive = igIsDragDropActive : Bool
  fun BeginDragDropTargetCustom = igBeginDragDropTargetCustom(bb : ImRect, id : ImGuiID) : Bool
  fun ClearDragDrop = igClearDragDrop
  fun IsDragDropPayloadBeingAccepted = igIsDragDropPayloadBeingAccepted : Bool
  fun RenderDragDropTargetRect = igRenderDragDropTargetRect(bb : ImRect)
  fun SetWindowClipRectBeforeSetChannel = igSetWindowClipRectBeforeSetChannel(window : ImGuiWindow*, clip_rect : ImRect)
  fun BeginColumns_Strv = igBeginColumns_Strv(str_id : ImGui::ImStrv, count : LibC::Int, flags : ImGui::ImGuiOldColumnFlags)
  fun BeginColumns_Str = igBeginColumns_Str(str_id : LibC::Char*, count : LibC::Int, flags : ImGui::ImGuiOldColumnFlags)
  fun EndColumns = igEndColumns
  fun PushColumnClipRect = igPushColumnClipRect(column_index : LibC::Int)
  fun PushColumnsBackground = igPushColumnsBackground
  fun PopColumnsBackground = igPopColumnsBackground
  fun GetColumnsID_Strv = igGetColumnsID_Strv(str_id : ImGui::ImStrv, count : LibC::Int) : ImGuiID
  fun GetColumnsID_Str = igGetColumnsID_Str(str_id : LibC::Char*, count : LibC::Int) : ImGuiID
  fun FindOrCreateColumns = igFindOrCreateColumns(window : ImGuiWindow*, id : ImGuiID) : ImGuiOldColumns*
  fun GetColumnOffsetFromNorm = igGetColumnOffsetFromNorm(columns : ImGuiOldColumns*, offset_norm : LibC::Float) : LibC::Float
  fun GetColumnNormFromOffset = igGetColumnNormFromOffset(columns : ImGuiOldColumns*, offset : LibC::Float) : LibC::Float
  fun TableOpenContextMenu = igTableOpenContextMenu(column_n : LibC::Int)
  fun TableSetColumnWidth = igTableSetColumnWidth(column_n : LibC::Int, width : LibC::Float)
  fun TableSetColumnSortDirection = igTableSetColumnSortDirection(column_n : LibC::Int, sort_direction : ImGui::ImGuiSortDirection, append_to_sort_specs : Bool)
  fun TableGetHoveredColumn = igTableGetHoveredColumn : LibC::Int
  fun TableGetHeaderRowHeight = igTableGetHeaderRowHeight : LibC::Float
  fun TablePushBackgroundChannel = igTablePushBackgroundChannel
  fun TablePopBackgroundChannel = igTablePopBackgroundChannel
  fun GetCurrentTable = igGetCurrentTable : ImGuiTable*
  fun TableFindByID = igTableFindByID(id : ImGuiID) : ImGuiTable*
  fun BeginTableEx_Strv = igBeginTableEx_Strv(name : ImGui::ImStrv, id : ImGuiID, columns_count : LibC::Int, flags : ImGui::ImGuiTableFlags, outer_size : ImGui::ImVec2, inner_width : LibC::Float) : Bool
  fun BeginTableEx_Str = igBeginTableEx_Str(name : LibC::Char*, id : ImGuiID, columns_count : LibC::Int, flags : ImGui::ImGuiTableFlags, outer_size : ImGui::ImVec2, inner_width : LibC::Float) : Bool
  fun TableBeginInitMemory = igTableBeginInitMemory(table : ImGuiTable*, columns_count : LibC::Int)
  fun TableBeginApplyRequests = igTableBeginApplyRequests(table : ImGuiTable*)
  fun TableSetupDrawChannels = igTableSetupDrawChannels(table : ImGuiTable*)
  fun TableUpdateLayout = igTableUpdateLayout(table : ImGuiTable*)
  fun TableUpdateBorders = igTableUpdateBorders(table : ImGuiTable*)
  fun TableUpdateColumnsWeightFromWidth = igTableUpdateColumnsWeightFromWidth(table : ImGuiTable*)
  fun TableDrawBorders = igTableDrawBorders(table : ImGuiTable*)
  fun TableDrawContextMenu = igTableDrawContextMenu(table : ImGuiTable*)
  fun TableBeginContextMenuPopup = igTableBeginContextMenuPopup(table : ImGuiTable*) : Bool
  fun TableMergeDrawChannels = igTableMergeDrawChannels(table : ImGuiTable*)
  fun TableGetInstanceData = igTableGetInstanceData(table : ImGuiTable*, instance_no : LibC::Int) : ImGuiTableInstanceData*
  fun TableGetInstanceID = igTableGetInstanceID(table : ImGuiTable*, instance_no : LibC::Int) : ImGuiID
  fun TableSortSpecsSanitize = igTableSortSpecsSanitize(table : ImGuiTable*)
  fun TableSortSpecsBuild = igTableSortSpecsBuild(table : ImGuiTable*)
  fun TableGetColumnNextSortDirection = igTableGetColumnNextSortDirection(column : ImGuiTableColumn*) : ImGui::ImGuiSortDirection
  fun TableFixColumnSortDirection = igTableFixColumnSortDirection(table : ImGuiTable*, column : ImGuiTableColumn*)
  fun TableGetColumnWidthAuto = igTableGetColumnWidthAuto(table : ImGuiTable*, column : ImGuiTableColumn*) : LibC::Float
  fun TableBeginRow = igTableBeginRow(table : ImGuiTable*)
  fun TableEndRow = igTableEndRow(table : ImGuiTable*)
  fun TableBeginCell = igTableBeginCell(table : ImGuiTable*, column_n : LibC::Int)
  fun TableEndCell = igTableEndCell(table : ImGuiTable*)
  fun TableGetCellBgRect = igTableGetCellBgRect(pOut : ImRect*, table : ImGuiTable*, column_n : LibC::Int)
  fun TableGetColumnResizeID = igTableGetColumnResizeID(table : ImGuiTable*, column_n : LibC::Int, instance_no : LibC::Int) : ImGuiID
  fun TableGetMaxColumnWidth = igTableGetMaxColumnWidth(table : ImGuiTable*, column_n : LibC::Int) : LibC::Float
  fun TableSetColumnWidthAutoSingle = igTableSetColumnWidthAutoSingle(table : ImGuiTable*, column_n : LibC::Int)
  fun TableSetColumnWidthAutoAll = igTableSetColumnWidthAutoAll(table : ImGuiTable*)
  fun TableRemove = igTableRemove(table : ImGuiTable*)
  fun TableGcCompactTransientBuffers_TablePtr = igTableGcCompactTransientBuffers_TablePtr(table : ImGuiTable*)
  fun TableGcCompactTransientBuffers_TableTempDataPtr = igTableGcCompactTransientBuffers_TableTempDataPtr(table : ImGuiTableTempData*)
  fun TableGcCompactSettings = igTableGcCompactSettings
  fun TableLoadSettings = igTableLoadSettings(table : ImGuiTable*)
  fun TableSaveSettings = igTableSaveSettings(table : ImGuiTable*)
  fun TableResetSettings = igTableResetSettings(table : ImGuiTable*)
  fun TableGetBoundSettings = igTableGetBoundSettings(table : ImGuiTable*) : ImGuiTableSettings*
  fun TableSettingsAddSettingsHandler = igTableSettingsAddSettingsHandler
  fun TableSettingsCreate = igTableSettingsCreate(id : ImGuiID, columns_count : LibC::Int) : ImGuiTableSettings*
  fun TableSettingsFindByID = igTableSettingsFindByID(id : ImGuiID) : ImGuiTableSettings*
  fun GetCurrentTabBar = igGetCurrentTabBar : ImGuiTabBar*
  fun BeginTabBarEx = igBeginTabBarEx(tab_bar : ImGuiTabBar*, bb : ImRect, flags : ImGui::ImGuiTabBarFlags) : Bool
  fun TabBarFindTabByID = igTabBarFindTabByID(tab_bar : ImGuiTabBar*, tab_id : ImGuiID) : ImGuiTabItem*
  fun TabBarFindTabByOrder = igTabBarFindTabByOrder(tab_bar : ImGuiTabBar*, order : LibC::Int) : ImGuiTabItem*
  fun TabBarGetCurrentTab = igTabBarGetCurrentTab(tab_bar : ImGuiTabBar*) : ImGuiTabItem*
  fun TabBarGetTabOrder = igTabBarGetTabOrder(tab_bar : ImGuiTabBar*, tab : ImGuiTabItem*) : LibC::Int
  fun TabBarGetTabName = igTabBarGetTabName(tab_bar : ImGuiTabBar*, tab : ImGuiTabItem*) : LibC::Char*
  fun TabBarRemoveTab = igTabBarRemoveTab(tab_bar : ImGuiTabBar*, tab_id : ImGuiID)
  fun TabBarCloseTab = igTabBarCloseTab(tab_bar : ImGuiTabBar*, tab : ImGuiTabItem*)
  fun TabBarQueueFocus = igTabBarQueueFocus(tab_bar : ImGuiTabBar*, tab : ImGuiTabItem*)
  fun TabBarQueueReorder = igTabBarQueueReorder(tab_bar : ImGuiTabBar*, tab : ImGuiTabItem*, offset : LibC::Int)
  fun TabBarQueueReorderFromMousePos = igTabBarQueueReorderFromMousePos(tab_bar : ImGuiTabBar*, tab : ImGuiTabItem*, mouse_pos : ImGui::ImVec2)
  fun TabBarProcessReorder = igTabBarProcessReorder(tab_bar : ImGuiTabBar*) : Bool
  fun TabItemEx_Strv = igTabItemEx_Strv(tab_bar : ImGuiTabBar*, label : ImGui::ImStrv, p_open : Bool*, flags : ImGui::ImGuiTabItemFlags, docked_window : ImGuiWindow*) : Bool
  fun TabItemEx_Str = igTabItemEx_Str(tab_bar : ImGuiTabBar*, label : LibC::Char*, p_open : Bool*, flags : ImGui::ImGuiTabItemFlags, docked_window : ImGuiWindow*) : Bool
  fun TabItemCalcSize_Strv = igTabItemCalcSize_Strv(pOut : ImGui::ImVec2*, label : ImGui::ImStrv, has_close_button_or_unsaved_marker : Bool)
  fun TabItemCalcSize_WindowPtr = igTabItemCalcSize_WindowPtr(pOut : ImGui::ImVec2*, window : ImGuiWindow*)
  fun TabItemCalcSize_Str = igTabItemCalcSize_Str(pOut : ImGui::ImVec2*, label : LibC::Char*, has_close_button_or_unsaved_marker : Bool)
  fun TabItemBackground = igTabItemBackground(draw_list : ImDrawList*, bb : ImRect, flags : ImGui::ImGuiTabItemFlags, col : UInt32)
  fun TabItemLabelAndCloseButton_Strv = igTabItemLabelAndCloseButton_Strv(draw_list : ImDrawList*, bb : ImRect, flags : ImGui::ImGuiTabItemFlags, frame_padding : ImGui::ImVec2, label : ImGui::ImStrv, tab_id : ImGuiID, close_button_id : ImGuiID, is_contents_visible : Bool, out_just_closed : Bool*, out_text_clipped : Bool*)
  fun TabItemLabelAndCloseButton_Str = igTabItemLabelAndCloseButton_Str(draw_list : ImDrawList*, bb : ImRect, flags : ImGui::ImGuiTabItemFlags, frame_padding : ImGui::ImVec2, label : LibC::Char*, tab_id : ImGuiID, close_button_id : ImGuiID, is_contents_visible : Bool, out_just_closed : Bool*, out_text_clipped : Bool*)
  fun RenderText_Strv = igRenderText_Strv(pos : ImGui::ImVec2, text : ImGui::ImStrv, hide_text_after_hash : Bool)
  fun RenderText_StrStr = igRenderText_StrStr(pos : ImGui::ImVec2, text : LibC::Char*, text_end : LibC::Char*, hide_text_after_hash : Bool)
  fun RenderText_StrBool = igRenderText_StrBool(pos : ImGui::ImVec2, text : LibC::Char*, hide_text_after_hash : Bool)
  fun RenderTextWrapped_Strv = igRenderTextWrapped_Strv(pos : ImGui::ImVec2, text : ImGui::ImStrv, wrap_width : LibC::Float)
  fun RenderTextWrapped_StrStr = igRenderTextWrapped_StrStr(pos : ImGui::ImVec2, text : LibC::Char*, text_end : LibC::Char*, wrap_width : LibC::Float)
  fun RenderTextWrapped_StrFloat = igRenderTextWrapped_StrFloat(pos : ImGui::ImVec2, text : LibC::Char*, wrap_width : LibC::Float)
  fun RenderTextClipped_Strv = igRenderTextClipped_Strv(pos_min : ImGui::ImVec2, pos_max : ImGui::ImVec2, text : ImGui::ImStrv, text_size_if_known : ImGui::ImVec2*, align : ImGui::ImVec2, clip_rect : ImRect*)
  fun RenderTextClipped_StrStr = igRenderTextClipped_StrStr(pos_min : ImGui::ImVec2, pos_max : ImGui::ImVec2, text : LibC::Char*, text_end : LibC::Char*, text_size_if_known : ImGui::ImVec2*, align : ImGui::ImVec2, clip_rect : ImRect*)
  fun RenderTextClipped_StrVec2Ptr = igRenderTextClipped_StrVec2Ptr(pos_min : ImGui::ImVec2, pos_max : ImGui::ImVec2, text : LibC::Char*, text_size_if_known : ImGui::ImVec2*, align : ImGui::ImVec2, clip_rect : ImRect*)
  fun RenderTextClippedEx_Strv = igRenderTextClippedEx_Strv(draw_list : ImDrawList*, pos_min : ImGui::ImVec2, pos_max : ImGui::ImVec2, text : ImGui::ImStrv, text_size_if_known : ImGui::ImVec2*, align : ImGui::ImVec2, clip_rect : ImRect*)
  fun RenderTextClippedEx_StrStr = igRenderTextClippedEx_StrStr(draw_list : ImDrawList*, pos_min : ImGui::ImVec2, pos_max : ImGui::ImVec2, text : LibC::Char*, text_end : LibC::Char*, text_size_if_known : ImGui::ImVec2*, align : ImGui::ImVec2, clip_rect : ImRect*)
  fun RenderTextClippedEx_StrVec2Ptr = igRenderTextClippedEx_StrVec2Ptr(draw_list : ImDrawList*, pos_min : ImGui::ImVec2, pos_max : ImGui::ImVec2, text : LibC::Char*, text_size_if_known : ImGui::ImVec2*, align : ImGui::ImVec2, clip_rect : ImRect*)
  fun RenderTextEllipsis_Strv = igRenderTextEllipsis_Strv(draw_list : ImDrawList*, pos_min : ImGui::ImVec2, pos_max : ImGui::ImVec2, clip_max_x : LibC::Float, ellipsis_max_x : LibC::Float, text : ImGui::ImStrv, text_size_if_known : ImGui::ImVec2*)
  fun RenderTextEllipsis_Str = igRenderTextEllipsis_Str(draw_list : ImDrawList*, pos_min : ImGui::ImVec2, pos_max : ImGui::ImVec2, clip_max_x : LibC::Float, ellipsis_max_x : LibC::Float, text : LibC::Char*, text_size_if_known : ImGui::ImVec2*)
  fun RenderFrame = igRenderFrame(p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, fill_col : UInt32, border : Bool, rounding : LibC::Float)
  fun RenderFrameBorder = igRenderFrameBorder(p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, rounding : LibC::Float)
  fun RenderColorRectWithAlphaCheckerboard = igRenderColorRectWithAlphaCheckerboard(draw_list : ImDrawList*, p_min : ImGui::ImVec2, p_max : ImGui::ImVec2, fill_col : UInt32, grid_step : LibC::Float, grid_off : ImGui::ImVec2, rounding : LibC::Float, flags : ImGui::ImDrawFlags)
  fun RenderNavHighlight = igRenderNavHighlight(bb : ImRect, id : ImGuiID, flags : ImGui::ImGuiNavHighlightFlags)
  fun FindRenderedTextEnd_Strv = igFindRenderedTextEnd_Strv(text : ImGui::ImStrv) : LibC::Char*
  fun FindRenderedTextEnd_StrStr = igFindRenderedTextEnd_StrStr(text : LibC::Char*, text_end : LibC::Char*) : LibC::Char*
  fun FindRenderedTextEnd_Str = igFindRenderedTextEnd_Str(text : LibC::Char*) : LibC::Char*
  fun RenderMouseCursor = igRenderMouseCursor(pos : ImGui::ImVec2, scale : LibC::Float, mouse_cursor : ImGui::ImGuiMouseCursor, col_fill : UInt32, col_border : UInt32, col_shadow : UInt32)
  fun RenderArrow = igRenderArrow(draw_list : ImDrawList*, pos : ImGui::ImVec2, col : UInt32, dir : ImGui::ImGuiDir, scale : LibC::Float)
  fun RenderBullet = igRenderBullet(draw_list : ImDrawList*, pos : ImGui::ImVec2, col : UInt32)
  fun RenderCheckMark = igRenderCheckMark(draw_list : ImDrawList*, pos : ImGui::ImVec2, col : UInt32, sz : LibC::Float)
  fun RenderArrowPointingAt = igRenderArrowPointingAt(draw_list : ImDrawList*, pos : ImGui::ImVec2, half_sz : ImGui::ImVec2, direction : ImGui::ImGuiDir, col : UInt32)
  fun RenderRectFilledRangeH = igRenderRectFilledRangeH(draw_list : ImDrawList*, rect : ImRect, col : UInt32, x_start_norm : LibC::Float, x_end_norm : LibC::Float, rounding : LibC::Float)
  fun RenderRectFilledWithHole = igRenderRectFilledWithHole(draw_list : ImDrawList*, outer : ImRect, inner : ImRect, col : UInt32, rounding : LibC::Float)
  fun TextEx_Strv = igTextEx_Strv(text : ImGui::ImStrv, flags : ImGui::ImGuiTextFlags)
  fun TextEx_StrStr = igTextEx_StrStr(text : LibC::Char*, text_end : LibC::Char*, flags : ImGui::ImGuiTextFlags)
  fun TextEx_StrTextFlags = igTextEx_StrTextFlags(text : LibC::Char*, flags : ImGui::ImGuiTextFlags)
  fun ButtonEx_Strv = igButtonEx_Strv(label : ImGui::ImStrv, size_arg : ImGui::ImVec2, flags : ImGui::ImGuiButtonFlags) : Bool
  fun ButtonEx_Str = igButtonEx_Str(label : LibC::Char*, size_arg : ImGui::ImVec2, flags : ImGui::ImGuiButtonFlags) : Bool
  fun ArrowButtonEx_Strv = igArrowButtonEx_Strv(str_id : ImGui::ImStrv, dir : ImGui::ImGuiDir, size_arg : ImGui::ImVec2, flags : ImGui::ImGuiButtonFlags) : Bool
  fun ArrowButtonEx_Str = igArrowButtonEx_Str(str_id : LibC::Char*, dir : ImGui::ImGuiDir, size_arg : ImGui::ImVec2, flags : ImGui::ImGuiButtonFlags) : Bool
  fun ImageButtonEx = igImageButtonEx(id : ImGuiID, texture_id : ImTextureID, size : ImGui::ImVec2, uv0 : ImGui::ImVec2, uv1 : ImGui::ImVec2, bg_col : ImGui::ImVec4, tint_col : ImGui::ImVec4, flags : ImGui::ImGuiButtonFlags) : Bool
  fun SeparatorEx = igSeparatorEx(flags : ImGui::ImGuiSeparatorFlags)
  fun SeparatorTextEx_Strv = igSeparatorTextEx_Strv(id : ImGuiID, label : ImGui::ImStrv, extra_width : LibC::Float)
  fun SeparatorTextEx_Str = igSeparatorTextEx_Str(id : ImGuiID, label : LibC::Char*, extra_width : LibC::Float)
  fun CloseButton = igCloseButton(id : ImGuiID, pos : ImGui::ImVec2) : Bool
  fun CollapseButton = igCollapseButton(id : ImGuiID, pos : ImGui::ImVec2) : Bool
  fun Scrollbar = igScrollbar(axis : ImGui::ImGuiAxis)
  fun ScrollbarEx = igScrollbarEx(bb : ImRect, id : ImGuiID, axis : ImGui::ImGuiAxis, p_scroll_v : Int64*, avail_v : Int64, contents_v : Int64, flags : ImGui::ImDrawFlags) : Bool
  fun GetWindowScrollbarRect = igGetWindowScrollbarRect(pOut : ImRect*, window : ImGuiWindow*, axis : ImGui::ImGuiAxis)
  fun GetWindowScrollbarID = igGetWindowScrollbarID(window : ImGuiWindow*, axis : ImGui::ImGuiAxis) : ImGuiID
  fun GetWindowResizeCornerID = igGetWindowResizeCornerID(window : ImGuiWindow*, n : LibC::Int) : ImGuiID
  fun GetWindowResizeBorderID = igGetWindowResizeBorderID(window : ImGuiWindow*, dir : ImGui::ImGuiDir) : ImGuiID
  fun ButtonBehavior = igButtonBehavior(bb : ImRect, id : ImGuiID, out_hovered : Bool*, out_held : Bool*, flags : ImGui::ImGuiButtonFlags) : Bool
  fun DragBehavior = igDragBehavior(id : ImGuiID, data_type : ImGui::ImGuiDataType, p_v : Void*, v_speed : LibC::Float, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags) : Bool
  fun SliderBehavior = igSliderBehavior(bb : ImRect, id : ImGuiID, data_type : ImGui::ImGuiDataType, p_v : Void*, p_min : Void*, p_max : Void*, format : LibC::Char*, flags : ImGui::ImGuiSliderFlags, out_grab_bb : ImRect*) : Bool
  fun SplitterBehavior = igSplitterBehavior(bb : ImRect, id : ImGuiID, axis : ImGui::ImGuiAxis, size1 : LibC::Float*, size2 : LibC::Float*, min_size1 : LibC::Float, min_size2 : LibC::Float, hover_extend : LibC::Float, hover_visibility_delay : LibC::Float, bg_col : UInt32) : Bool
  fun TreeNodeBehavior_Strv = igTreeNodeBehavior_Strv(id : ImGuiID, flags : ImGui::ImGuiTreeNodeFlags, label : ImGui::ImStrv) : Bool
  fun TreeNodeBehavior_Str = igTreeNodeBehavior_Str(id : ImGuiID, flags : ImGui::ImGuiTreeNodeFlags, label : LibC::Char*) : Bool
  fun TreePushOverrideID = igTreePushOverrideID(id : ImGuiID)
  fun TreeNodeSetOpen = igTreeNodeSetOpen(id : ImGuiID, open : Bool)
  fun TreeNodeUpdateNextOpen = igTreeNodeUpdateNextOpen(id : ImGuiID, flags : ImGui::ImGuiTreeNodeFlags) : Bool
  fun DataTypeGetInfo = igDataTypeGetInfo(data_type : ImGui::ImGuiDataType) : ImGuiDataTypeInfo*
  fun DataTypeFormatString = igDataTypeFormatString(buf : LibC::Char*, buf_size : LibC::Int, data_type : ImGui::ImGuiDataType, p_data : Void*, format : LibC::Char*) : LibC::Int
  fun DataTypeApplyOp = igDataTypeApplyOp(data_type : ImGui::ImGuiDataType, op : LibC::Int, output : Void*, arg_1 : Void*, arg_2 : Void*)
  fun DataTypeApplyFromText = igDataTypeApplyFromText(buf : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, format : LibC::Char*) : Bool
  fun DataTypeCompare = igDataTypeCompare(data_type : ImGui::ImGuiDataType, arg_1 : Void*, arg_2 : Void*) : LibC::Int
  fun DataTypeClamp = igDataTypeClamp(data_type : ImGui::ImGuiDataType, p_data : Void*, p_min : Void*, p_max : Void*) : Bool
  fun InputTextEx_Strv = igInputTextEx_Strv(label : ImGui::ImStrv, hint : ImGui::ImStrv, buf : LibC::Char*, buf_size : LibC::Int, size_arg : ImGui::ImVec2, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun InputTextEx_Str = igInputTextEx_Str(label : LibC::Char*, hint : LibC::Char*, buf : LibC::Char*, buf_size : LibC::Int, size_arg : ImGui::ImVec2, flags : ImGui::ImGuiInputTextFlags, callback : ImGuiInputTextCallback, user_data : Void*) : Bool
  fun InputTextDeactivateHook = igInputTextDeactivateHook(id : ImGuiID)
  fun TempInputText_Strv = igTempInputText_Strv(bb : ImRect, id : ImGuiID, label : ImGui::ImStrv, buf : LibC::Char*, buf_size : LibC::Int, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun TempInputText_Str = igTempInputText_Str(bb : ImRect, id : ImGuiID, label : LibC::Char*, buf : LibC::Char*, buf_size : LibC::Int, flags : ImGui::ImGuiInputTextFlags) : Bool
  fun TempInputScalar_Strv = igTempInputScalar_Strv(bb : ImRect, id : ImGuiID, label : ImGui::ImStrv, data_type : ImGui::ImGuiDataType, p_data : Void*, format : LibC::Char*, p_clamp_min : Void*, p_clamp_max : Void*) : Bool
  fun TempInputScalar_Str = igTempInputScalar_Str(bb : ImRect, id : ImGuiID, label : LibC::Char*, data_type : ImGui::ImGuiDataType, p_data : Void*, format : LibC::Char*, p_clamp_min : Void*, p_clamp_max : Void*) : Bool
  fun TempInputIsActive = igTempInputIsActive(id : ImGuiID) : Bool
  fun GetInputTextState = igGetInputTextState(id : ImGuiID) : ImGuiInputTextState*
  fun ColorTooltip_Strv = igColorTooltip_Strv(text : ImGui::ImStrv, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags)
  fun ColorTooltip_Str = igColorTooltip_Str(text : LibC::Char*, col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags)
  fun ColorEditOptionsPopup = igColorEditOptionsPopup(col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags)
  fun ColorPickerOptionsPopup = igColorPickerOptionsPopup(ref_col : LibC::Float*, flags : ImGui::ImGuiColorEditFlags)
  fun PlotEx_Strv = igPlotEx_Strv(plot_type : ImGui::ImGuiPlotType, label : ImGui::ImStrv, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : ImGui::ImStrv, scale_min : LibC::Float, scale_max : LibC::Float, size_arg : ImGui::ImVec2) : LibC::Int
  fun PlotEx_Str = igPlotEx_Str(plot_type : ImGui::ImGuiPlotType, label : LibC::Char*, values_getter : (Void*, LibC::Int) -> LibC::Float, data : Void*, values_count : LibC::Int, values_offset : LibC::Int, overlay_text : LibC::Char*, scale_min : LibC::Float, scale_max : LibC::Float, size_arg : ImGui::ImVec2) : LibC::Int
  fun ShadeVertsLinearColorGradientKeepAlpha = igShadeVertsLinearColorGradientKeepAlpha(draw_list : ImDrawList*, vert_start_idx : LibC::Int, vert_end_idx : LibC::Int, gradient_p0 : ImGui::ImVec2, gradient_p1 : ImGui::ImVec2, col0 : UInt32, col1 : UInt32)
  fun ShadeVertsLinearUV = igShadeVertsLinearUV(draw_list : ImDrawList*, vert_start_idx : LibC::Int, vert_end_idx : LibC::Int, a : ImGui::ImVec2, b : ImGui::ImVec2, uv_a : ImGui::ImVec2, uv_b : ImGui::ImVec2, clamp : Bool)
  fun GcCompactTransientMiscBuffers = igGcCompactTransientMiscBuffers
  fun GcCompactTransientWindowBuffers = igGcCompactTransientWindowBuffers(window : ImGuiWindow*)
  fun GcAwakeTransientWindowBuffers = igGcAwakeTransientWindowBuffers(window : ImGuiWindow*)
  fun DebugLog = igDebugLog(fmt : LibC::Char*, ...)
  fun ErrorCheckEndFrameRecover = igErrorCheckEndFrameRecover(log_callback : ImGuiErrorLogCallback, user_data : Void*)
  fun ErrorCheckEndWindowRecover = igErrorCheckEndWindowRecover(log_callback : ImGuiErrorLogCallback, user_data : Void*)
  fun ErrorCheckUsingSetCursorPosToExtendParentBoundaries = igErrorCheckUsingSetCursorPosToExtendParentBoundaries
  fun DebugLocateItem = igDebugLocateItem(target_id : ImGuiID)
  fun DebugLocateItemOnHover = igDebugLocateItemOnHover(target_id : ImGuiID)
  fun DebugLocateItemResolveWithLastItem = igDebugLocateItemResolveWithLastItem
  fun DebugDrawItemRect = igDebugDrawItemRect(col : UInt32)
  fun DebugStartItemPicker = igDebugStartItemPicker
  fun ShowFontAtlas = igShowFontAtlas(atlas : ImFontAtlas*)
  fun DebugHookIdInfo = igDebugHookIdInfo(id : ImGuiID, data_type : ImGui::ImGuiDataType, data_id : Void*, data_id_end : Void*)
  fun DebugNodeColumns = igDebugNodeColumns(columns : ImGuiOldColumns*)
  fun DebugNodeDrawList = igDebugNodeDrawList(window : ImGuiWindow*, draw_list : ImDrawList*, label : LibC::Char*)
  fun DebugNodeDrawCmdShowMeshAndBoundingBox = igDebugNodeDrawCmdShowMeshAndBoundingBox(out_draw_list : ImDrawList*, draw_list : ImDrawList*, draw_cmd : ImDrawCmd*, show_mesh : Bool, show_aabb : Bool)
  fun DebugNodeFont = igDebugNodeFont(font : ImFont*)
  fun DebugNodeFontGlyph = igDebugNodeFontGlyph(font : ImFont*, glyph : ImGui::ImFontGlyph*)
  fun DebugNodeStorage = igDebugNodeStorage(storage : ImGui::ImGuiStorage*, label : LibC::Char*)
  fun DebugNodeTabBar = igDebugNodeTabBar(tab_bar : ImGuiTabBar*, label : LibC::Char*)
  fun DebugNodeTable = igDebugNodeTable(table : ImGuiTable*)
  fun DebugNodeTableSettings = igDebugNodeTableSettings(settings : ImGuiTableSettings*)
  fun DebugNodeInputTextState = igDebugNodeInputTextState(state : ImGuiInputTextState*)
  fun DebugNodeWindow = igDebugNodeWindow(window : ImGuiWindow*, label : LibC::Char*)
  fun DebugNodeWindowSettings = igDebugNodeWindowSettings(settings : ImGuiWindowSettings*)
  fun DebugNodeWindowsList = igDebugNodeWindowsList(windows : ImVectorInternal*, label : LibC::Char*)
  fun DebugNodeWindowsListByBeginStackParent = igDebugNodeWindowsListByBeginStackParent(windows : ImGuiWindow**, windows_size : LibC::Int, parent_in_begin_stack : ImGuiWindow*)
  fun DebugNodeViewport = igDebugNodeViewport(viewport : ImGuiViewportP*)
  fun DebugRenderKeyboardPreview = igDebugRenderKeyboardPreview(draw_list : ImDrawList*)
  fun DebugRenderViewportThumbnail = igDebugRenderViewportThumbnail(draw_list : ImDrawList*, viewport : ImGuiViewportP*, bb : ImRect)
  fun IsKeyPressedMap = igIsKeyPressedMap(key : ImGui::ImGuiKey, repeat : Bool) : Bool
  type ImFontBuilderIO = Void*
  fun ImFontAtlasGetBuilderForStbTruetype = igImFontAtlasGetBuilderForStbTruetype : ImFontBuilderIO*
  fun ImFontAtlasBuildInit = igImFontAtlasBuildInit(atlas : ImFontAtlas*)
  fun ImFontAtlasBuildSetupFont = igImFontAtlasBuildSetupFont(atlas : ImFontAtlas*, font : ImFont*, font_config : ImFontConfig*, ascent : LibC::Float, descent : LibC::Float)
  fun ImFontAtlasBuildPackCustomRects = igImFontAtlasBuildPackCustomRects(atlas : ImFontAtlas*, stbrp_context_opaque : Void*)
  fun ImFontAtlasBuildFinish = igImFontAtlasBuildFinish(atlas : ImFontAtlas*)
  fun ImFontAtlasBuildRender8bppRectFromString = igImFontAtlasBuildRender8bppRectFromString(atlas : ImFontAtlas*, x : LibC::Int, y : LibC::Int, w : LibC::Int, h : LibC::Int, in_str : LibC::Char*, in_marker_char : LibC::Char, in_marker_pixel_value : LibC::UChar)
  fun ImFontAtlasBuildRender32bppRectFromString = igImFontAtlasBuildRender32bppRectFromString(atlas : ImFontAtlas*, x : LibC::Int, y : LibC::Int, w : LibC::Int, h : LibC::Int, in_str : LibC::Char*, in_marker_char : LibC::Char, in_marker_pixel_value : LibC::UInt)
  fun ImFontAtlasBuildMultiplyCalcLookupTable = igImFontAtlasBuildMultiplyCalcLookupTable(out_table : LibC::UChar*, in_multiply_factor : LibC::Float)
  fun ImFontAtlasBuildMultiplyRectAlpha8 = igImFontAtlasBuildMultiplyRectAlpha8(table : LibC::UChar*, pixels : LibC::UChar*, x : LibC::Int, y : LibC::Int, w : LibC::Int, h : LibC::Int, stride : LibC::Int)
  type StbUndoRecord = Void*
  type StbUndoState = Void*
  type STB_TexteditState = Void*
  type StbTexteditRow = Void*
end
