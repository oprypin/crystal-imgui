# Flags & Enumerations  

## Flags for [`ImGui.begin`][]  

### ::: ImGui::ImGuiWindowFlags

- `None`  

- `NoTitleBar`  
 Disable title-bar  

- `NoResize`  
 Disable user resizing with the lower-right grip  

- `NoMove`  
 Disable user moving the window  

- `NoScrollbar`  
 Disable scrollbars (window can still scroll with mouse or programmatically)  

- `NoScrollWithMouse`  
 Disable user vertically scrolling with mouse wheel. On child window, mouse wheel will be forwarded to the parent unless NoScrollbar is also set.  

- `NoCollapse`  
 Disable user collapsing window by double-clicking on it. Also referred to as Window Menu [`ImGui.button`][] (e.g. within a docking node).  

- `AlwaysAutoResize`  
 Resize every window to its content every frame  

- `NoBackground`  
 Disable drawing background color (WindowBg, etc.) and outside border. Similar as using [`ImGui.set_next_window_bg_alpha`][](0.0f).  

- `NoSavedSettings`  
 Never load/save settings in .ini file  

- `NoMouseInputs`  
 Disable catching mouse, hovering test with pass through.  

- `MenuBar`  
 Has a menu-bar  

- `HorizontalScrollbar`  
 Allow horizontal scrollbar to appear (off by default). You may use [`ImGui.set_next_window_content_size`][]([`ImGui::ImVec2`][](width,0.0f)); prior to calling [`ImGui.begin`][] to specify width. Read code in imgui_demo in the "Horizontal Scrolling" section.  

- `NoFocusOnAppearing`  
 Disable taking focus when transitioning from hidden to visible state  

- `NoBringToFrontOnFocus`  
 Disable bringing window to front when taking focus (e.g. clicking on it or programmatically giving it focus)  

- `AlwaysVerticalScrollbar`  
 Always show vertical scrollbar (even if ContentSize.y < Size.y)  

- `AlwaysHorizontalScrollbar`  
 Always show horizontal scrollbar (even if ContentSize.x < Size.x)  

- `AlwaysUseWindowPadding`  
 Ensure child windows without border uses style.WindowPadding (ignored by default for non-bordered child windows, because more convenient)  

- `NoNavInputs`  
 No gamepad/keyboard navigation within the window  

- `NoNavFocus`  
 No focusing toward this window with gamepad/keyboard navigation (e.g. skipped by CTRL+TAB)  

- `UnsavedDocument`  
 Display a dot next to the title. When used in a tab/docking context, tab is selected when clicking the X + closure is not assumed (will wait for user to stop submitting the tab). Otherwise closure is assumed when pressing the X, so if you keep submitting the tab may reappear at end of tab bar.  

- `NoNavInputs`, `NoNavFocus`, `NoNav`  

- `NoTitleBar`, `NoResize`, `NoScrollbar`, `NoCollapse`, `NoDecoration`  

- `NoMouseInputs`, `NoNavInputs`, `NoNavFocus`, `NoInputs`  

#### [Internal]  

- `NavFlattened`  
 [BETA] On child window: allow gamepad/keyboard navigation to cross over parent border to this child or between sibling child windows.  

- `ChildWindow`  
 Don't use! For internal use by BeginChild()  

- `Tooltip`  
 Don't use! For internal use by [`ImGui.begin_tooltip`][]  

- `Popup`  
 Don't use! For internal use by [`ImGui.begin_popup`][]  

- `Modal`  
 Don't use! For internal use by [`ImGui.begin_popup_modal`][]  

- `ChildMenu`  
 Don't use! For internal use by [`ImGui.begin_menu`][]  
 [Obsolete] --> Set io.ConfigWindowsResizeFromEdges=true and make sure mouse cursors are supported by backend (io.BackendFlags & ImGuiBackendFlags_HasMouseCursors)  

## Flags for [`ImGui.input_text`][]  

### ::: ImGui::ImGuiInputTextFlags

- `None`  

- `CharsDecimal`  
 Allow 0123456789.+-*/  

- `CharsHexadecimal`  
 Allow 0123456789ABCDEFabcdef  

- `CharsUppercase`  
 Turn a..z into A..Z  

- `CharsNoBlank`  
 Filter out spaces, tabs  

- `AutoSelectAll`  
 Select entire text when first taking mouse focus  

- `EnterReturnsTrue`  
 Return 'true' when Enter is pressed (as opposed to every time the value was modified). Consider looking at the [`ImGui.is_item_deactivated_after_edit`][] function.  

- `CallbackCompletion`  
 Callback on pressing TAB (for completion handling)  

- `CallbackHistory`  
 Callback on pressing Up/Down arrows (for history handling)  

- `CallbackAlways`  
 Callback on each iteration. User code may query cursor position, modify text buffer.  

- `CallbackCharFilter`  
 Callback on character inputs to replace or discard them. Modify 'EventChar' to replace or discard, or return 1 in callback to discard.  

- `AllowTabInput`  
 Pressing TAB input a '\t' character into the text field  

- `CtrlEnterForNewLine`  
 In multi-line mode, unfocus with Enter, add new line with Ctrl+Enter (default is opposite: unfocus with Ctrl+Enter, add line with Enter).  

- `NoHorizontalScroll`  
 Disable following the cursor horizontally  

- `AlwaysOverwrite`  
 Overwrite mode  

- `ReadOnly`  
 Read-only mode  

- `Password`  
 Password mode, display all characters as '*'  

- `NoUndoRedo`  
 Disable undo/redo. Note that input text owns the text data while active, if you want to provide your own undo/redo stack you need e.g. to call ClearActiveID().  

- `CharsScientific`  
 Allow 0123456789.+-*/eE (Scientific notation input)  

- `CallbackResize`  
 Callback on buffer capacity changes request (beyond 'buf_size' parameter value), allowing the string to grow. Notify when the string wants to be resized (for string types which hold a cache of their Size). You will be provided a new BufSize in the callback and NEED to honor it. (see misc/cpp/imgui_stdlib.h for an example of using this)  

- `CallbackEdit`  
 Callback on any edit (note that [`ImGui.input_text`][] already returns true on edit, the callback is useful mainly to manipulate the underlying buffer while focus is active)  

#### Obsolete names (will be removed soon)  

- `AlwaysOverwrite`  
 [renamed in 1.82] name was not matching behavior  

## Flags for ImGui::TreeNodeEx(), ImGui::CollapsingHeader*()  

### ::: ImGui::ImGuiTreeNodeFlags

- `None`  

- `Selected`  
 Draw as selected  

- `Framed`  
 Draw frame with background (e.g. for CollapsingHeader)  

- `AllowItemOverlap`  
 Hit testing to allow subsequent widgets to overlap this one  

- `NoTreePushOnOpen`  
 Don't do a TreePush() when open (e.g. for CollapsingHeader) = no extra indent nor pushing on ID stack  

- `NoAutoOpenOnLog`  
 Don't automatically and temporarily open node when Logging is active (by default logging will automatically open tree nodes)  

- `DefaultOpen`  
 Default node to be open  

- `OpenOnDoubleClick`  
 Need double-click to open node  

- `OpenOnArrow`  
 Only open when clicking on the arrow part. If ImGuiTreeNodeFlags_OpenOnDoubleClick is also set, single-click arrow or double-click all box to open.  

- `Leaf`  
 No collapsing, no arrow (use as a convenience for leaf nodes).  

- `[`ImGui.bullet`][]`  
 Display a bullet instead of arrow  

- `FramePadding`  
 Use FramePadding (even for an unframed text node) to vertically align text baseline to regular widget height. Equivalent to calling [`ImGui.align_text_to_frame_padding`][].  

- `SpanAvailWidth`  
 Extend hit box to the right-most edge, even if not framed. This is not the default in order to allow adding other items on the same line. In the future we may refactor the hit system to be front-to-back, allowing natural overlaps and then this can become the default.  

- `SpanFullWidth`  
 Extend hit box to the left-most and right-most edges (bypass the indented area).  

- `NavLeftJumpsBackHere`  
 (WIP) Nav: left direction may move to this TreeNode() from any of its child (items submitted between TreeNode and [`ImGui.tree_pop`][])  
 FIXME: TODO: Disable automatic scroll on [`ImGui.tree_pop`][] if node got just open and contents is not visible  

- `Framed`, `NoTreePushOnOpen`, `NoAutoOpenOnLog`, `CollapsingHeader`  

Flags for OpenPopup*(), BeginPopupContext*(), IsPopupOpen() functions.  

- To be backward compatible with older API which took an 'int mouse_button = 1' argument, we need to treat
  small flags values as a mouse button index, so we encode the mouse button in the first few bits of the flags.
  It is therefore guaranteed to be legal to pass a mouse button index in [`ImGui::ImGuiPopupFlags`][].
- For the same reason, we exceptionally default the [`ImGui::ImGuiPopupFlags`][] argument of BeginPopupContextXXX functions to 1 instead of 0.
  IMPORTANT: because the default parameter is 1 (==ImGuiPopupFlags_MouseButtonRight), if you rely on the default parameter
  and want to another another flag, you need to pass in the ImGuiPopupFlags_MouseButtonRight flag.
- Multiple buttons currently cannot be combined/or-ed in those functions (we could allow it later).

### ::: ImGui::ImGuiPopupFlags

- `None`  

- `MouseButtonLeft`  
 For BeginPopupContext*(): open on Left Mouse release. Guaranteed to always be == 0 (same as ImGuiMouseButton_Left)  

- `MouseButtonRight`  
 For BeginPopupContext*(): open on Right Mouse release. Guaranteed to always be == 1 (same as ImGuiMouseButton_Right)  

- `MouseButtonMiddle`  
 For BeginPopupContext*(): open on Middle Mouse release. Guaranteed to always be == 2 (same as ImGuiMouseButton_Middle)  

- `MouseButtonMask_`  

- `MouseButtonDefault_`  

- `NoOpenOverExistingPopup`  
 For OpenPopup*(), BeginPopupContext*(): don't open if there's already a popup at the same level of the popup stack  

- `NoOpenOverItems`  
 For [`ImGui.begin_popup_context_window`][]: don't return true when hovering items, only when hovering empty space  

- `AnyPopupId`  
 For IsPopupOpen(): ignore the ImGuiID parameter and test for any popup.  

- `AnyPopupLevel`  
 For IsPopupOpen(): search/test at any level of the popup stack (default test in the current level)  

- `AnyPopupId`, `AnyPopupLevel`, `AnyPopup`  

## Flags for ImGui::Selectable()  

### ::: ImGui::ImGuiSelectableFlags

- `None`  

- `DontClosePopups`  
 Clicking this don't close parent popup window  

- `SpanAllColumns`  
 Selectable frame can span all columns (text will still fit in current column)  

- `AllowDoubleClick`  
 Generate press events on double clicks too  

- `Disabled`  
 Cannot be selected, display grayed out text  

- `AllowItemOverlap`  
 (WIP) Hit testing to allow subsequent widgets to overlap this one  

## Flags for [`ImGui.begin_combo`][]  

### ::: ImGui::ImGuiComboFlags

- `None`  

- `PopupAlignLeft`  
 Align the popup toward the left by default  

- `HeightSmall`  
 Max ~4 items visible. Tip: If you want your combo popup to be a specific size you can use [`ImGui.set_next_window_size_constraints`][] prior to calling [`ImGui.begin_combo`][]  

- `HeightRegular`  
 Max ~8 items visible (default)  

- `HeightLarge`  
 Max ~20 items visible  

- `HeightLargest`  
 As many fitting items as possible  

- `NoArrowButton`  
 Display on the preview box without the square arrow button  

- `NoPreview`  
 Display only a square arrow button  

- `HeightSmall`, `HeightRegular`, `HeightLarge`, `HeightLargest`, `HeightMask_`  

## Flags for [`ImGui.begin_tab_bar`][]  

### ::: ImGui::ImGuiTabBarFlags

- `None`  

- `Reorderable`  
 Allow manually dragging tabs to re-order them + New tabs are appended at the end of list  

- `AutoSelectNewTabs`  
 Automatically select new tabs when they appear  

- `TabListPopupButton`  
 Disable buttons to open the tab list popup  

- `NoCloseWithMiddleMouseButton`  
 Disable behavior of closing tabs (that are submitted with p_open != NULL) with middle mouse button. You can still repro this behavior on user's side with if ([`ImGui.is_item_hovered`][] && [`ImGui.is_mouse_clicked`][](2)) *p_open = false.  

- `NoTabListScrollingButtons`  
 Disable scrolling buttons (apply when fitting policy is ImGuiTabBarFlags_FittingPolicyScroll)  

- `NoTooltip`  
 Disable tooltips when hovering a tab  

- `FittingPolicyResizeDown`  
 Resize tabs when they don't fit  

- `FittingPolicyScroll`  
 Add scroll buttons when tabs don't fit  

- `FittingPolicyResizeDown`, `FittingPolicyScroll`, `FittingPolicyMask_`  

- `FittingPolicyResizeDown`, `FittingPolicyDefault_`  

## Flags for [`ImGui.begin_tab_item`][]  

### ::: ImGui::ImGuiTabItemFlags

- `None`  

- `UnsavedDocument`  
 Display a dot next to the title + tab is selected when clicking the X + closure is not assumed (will wait for user to stop submitting the tab). Otherwise closure is assumed when pressing the X, so if you keep submitting the tab may reappear at end of tab bar.  

- `SetSelected`  
 Trigger flag to programmatically make the tab selected when calling [`ImGui.begin_tab_item`][]  

- `NoCloseWithMiddleMouseButton`  
 Disable behavior of closing tabs (that are submitted with p_open != NULL) with middle mouse button. You can still repro this behavior on user's side with if ([`ImGui.is_item_hovered`][] && [`ImGui.is_mouse_clicked`][](2)) *p_open = false.  

- `NoPushId`  
 Don't call PushID(tab->ID)/[`ImGui.pop_id`][] on [`ImGui.begin_tab_item`][]/[`ImGui.end_tab_item`][]  

- `NoTooltip`  
 Disable tooltip for the given tab  

- `NoReorder`  
 Disable reordering this tab or having another tab cross over this tab  

- `Leading`  
 Enforce the tab position to the left of the tab bar (after the tab list popup button)  

- `Trailing`  
 Enforce the tab position to the right of the tab bar (before the scrolling buttons)  

## Flags for [`ImGui.begin_table`][]  

- Important! Sizing policies have complex and subtle side effects, much more so than you would expect.
  Read comments/demos carefully + experiment with live demos to get acquainted with them.
- The DEFAULT sizing policies are:
      - Default to ImGuiTableFlags_SizingFixedFit    if ScrollX is on, or if host window has ImGuiWindowFlags_AlwaysAutoResize.
      - Default to ImGuiTableFlags_SizingStretchSame if ScrollX is off.
- When ScrollX is off:
      - Table defaults to ImGuiTableFlags_SizingStretchSame -> all [`ImGui.columns`][] defaults to ImGuiTableColumnFlags_WidthStretch with same weight.
      - [`ImGui.columns`][] sizing policy allowed: Stretch (default), Fixed/Auto.
      - Fixed [`ImGui.columns`][] (if any) will generally obtain their requested width (unless the table cannot fit them all).
      - Stretch [`ImGui.columns`][] will share the remaining width according to their respective weight.
      - Mixed Fixed/Stretch columns is possible but has various side-effects on resizing behaviors.
     The typical use of mixing sizing policies is: any number of LEADING Fixed columns, followed by one or two TRAILING Stretch columns.
     (this is because the visible order of columns have subtle but necessary effects on how they react to manual resizing).
- When ScrollX is on:
      - Table defaults to ImGuiTableFlags_SizingFixedFit -> all [`ImGui.columns`][] defaults to ImGuiTableColumnFlags_WidthFixed
      - [`ImGui.columns`][] sizing policy allowed: Fixed/Auto mostly.
      - Fixed [`ImGui.columns`][] can be enlarged as needed. Table will show an horizontal scrollbar if needed.
      - When using auto-resizing (non-resizable) fixed columns, querying the content width to use item right-alignment e.g. [`ImGui.set_next_item_width`][](-FLT_MIN) doesn't make sense, would create a feedback loop.
      - Using Stretch columns OFTEN DOES NOT MAKE SENSE if ScrollX is on, UNLESS you have specified a value for 'inner_width' in [`ImGui.begin_table`][].
     If you specify a value for 'inner_width' then effectively the scrolling space is known and Stretch or mixed Fixed/Stretch columns become meaningful again.
- Read on documentation at the top of imgui_tables.cpp for details.

### ::: ImGui::ImGuiTableFlags

#### Features  

- `None`  

- `Resizable`  
 Enable resizing columns.  

- `Reorderable`  
 Enable reordering columns in header row (need calling [`ImGui.table_setup_column`][] + [`ImGui.table_headers_row`][] to display headers)  

- `Hideable`  
 Enable hiding/disabling columns in context menu.  

- `Sortable`  
 Enable sorting. Call [`ImGui.table_get_sort_specs`][] to obtain sort specs. Also see ImGuiTableFlags_SortMulti and ImGuiTableFlags_SortTristate.  

- `NoSavedSettings`  
 Disable persisting columns order, width and sort settings in the .ini file.  

- `ContextMenuInBody`  
 Right-click on columns body/contents will display table context menu. By default it is available in [`ImGui.table_headers_row`][].  
Decorations  

- `RowBg`  
 Set each RowBg color with ImGuiCol_TableRowBg or ImGuiCol_TableRowBgAlt (equivalent of calling [`ImGui.table_set_bg_color`][] with ImGuiTableBgFlags_RowBg0 on each row manually)  

- `BordersInnerH`  
 Draw horizontal borders between rows.  

- `BordersOuterH`  
 Draw horizontal borders at the top and bottom.  

- `BordersInnerV`  
 Draw vertical borders between columns.  

- `BordersOuterV`  
 Draw vertical borders on the left and right sides.  

- `BordersInnerH`, `BordersOuterH`, `BordersH`  
 Draw horizontal borders.  

- `BordersInnerV`, `BordersOuterV`, `BordersV`  
 Draw vertical borders.  

- `BordersInnerH`, `BordersInnerV`, `BordersInner`  
 Draw inner borders.  

- `BordersOuterH`, `BordersOuterV`, `BordersOuter`  
 Draw outer borders.  

- `BordersInner`, `BordersOuter`, `Borders`  
 Draw all borders.  

- `NoBordersInBody`  
 [ALPHA] Disable vertical borders in columns Body (borders will always appears in Headers). -> May move to style  

- `NoBordersInBodyUntilResize`  
 [ALPHA] Disable vertical borders in columns Body until hovered for resize (borders will always appears in Headers). -> May move to style  
Sizing Policy (read above for defaults)  

- `SizingFixedFit`  
 [`ImGui.columns`][] default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching contents width.  

- `SizingFixedSame`  
 [`ImGui.columns`][] default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching the maximum contents width of all columns. Implicitly enable ImGuiTableFlags_NoKeepColumnsVisible.  

- `SizingStretchProp`  
 [`ImGui.columns`][] default to _WidthStretch with default weights proportional to each columns contents widths.  

- `SizingStretchSame`  
 [`ImGui.columns`][] default to _WidthStretch with default weights all equal, unless overridden by [`ImGui.table_setup_column`][].  
Sizing Extra Options  

- `NoHostExtendX`  
 Make outer width auto-fit to columns, overriding outer_size.x value. Only available when ScrollX/ScrollY are disabled and Stretch columns are not used.  

- `NoHostExtendY`  
 Make outer height stop exactly at outer_size.y (prevent auto-extending table past the limit). Only available when ScrollX/ScrollY are disabled. Data below the limit will be clipped and not visible.  

- `NoKeepColumnsVisible`  
 Disable keeping column always minimally visible when ScrollX is off and table gets too small. Not recommended if columns are resizable.  

- `PreciseWidths`  
 Disable distributing remainder width to stretched columns (width allocation on a 100-wide table with 3 columns: Without this flag: 33,33,34. With this flag: 33,33,33). With larger number of columns, resizing will appear to be less smooth.  
Clipping  

- `NoClip`  
 Disable clipping rectangle for every individual columns (reduce draw command count, items will be able to overflow into other columns). Generally incompatible with [`ImGui.table_setup_scroll_freeze`][].  
Padding  

- `PadOuterX`  
 Default if BordersOuterV is on. Enable outer-most padding. Generally desirable if you have headers.  

- `NoPadOuterX`  
 Default if BordersOuterV is off. Disable outer-most padding.  

- `NoPadInnerX`  
 Disable inner padding between columns (double inner padding if BordersOuterV is on, single inner padding if BordersOuterV is off).  
Scrolling  

- `ScrollX`  
 Enable horizontal scrolling. Require 'outer_size' parameter of [`ImGui.begin_table`][] to specify the container size. Changes default sizing policy. Because this create a child window, ScrollY is currently generally recommended when using ScrollX.  

- `ScrollY`  
 Enable vertical scrolling. Require 'outer_size' parameter of [`ImGui.begin_table`][] to specify the container size.  
Sorting  

- `SortMulti`  
 Hold shift when clicking headers to sort on multiple column. [`ImGui.table_get_sort_specs`][] may return specs where (SpecsCount > 1).  

- `SortTristate`  
 Allow no sorting, disable default sorting. [`ImGui.table_get_sort_specs`][] may return specs where (SpecsCount == 0).  

#### [Internal] Combinations and masks  

- `SizingFixedFit`, `SizingFixedSame`, `SizingStretchProp`, `SizingStretchSame`, `SizingMask_`  

#### Obsolete names (will be removed soon)  

- `SizingFixedFit`, `SizingStretchSame`  
 WIP Tables 2020/12  

- `SizingFixedFit`, `SizingStretchSame`  
 WIP Tables 2021/01  

## Flags for [`ImGui.table_setup_column`][]  

### ::: ImGui::ImGuiTableColumnFlags

#### Input configuration flags  

- `None`  

- `Disabled`  
 Overriding/master disable flag: hide column, won't show in context menu (unlike calling [`ImGui.table_set_column_enabled`][] which manipulates the user accessible state)  

- `DefaultHide`  
 Default as a hidden/disabled column.  

- `DefaultSort`  
 Default as a sorting column.  

- `WidthStretch`  
 Column will stretch. Preferable with horizontal scrolling disabled (default if table sizing policy is _SizingStretchSame or _SizingStretchProp).  

- `WidthFixed`  
 Column will not stretch. Preferable with horizontal scrolling enabled (default if table sizing policy is _SizingFixedFit and table is resizable).  

- `NoResize`  
 Disable manual resizing.  

- `NoReorder`  
 Disable manual reordering this column, this will also prevent other columns from crossing over this column.  

- `NoHide`  
 Disable ability to hide/disable this column.  

- `NoClip`  
 Disable clipping for this column (all NoClip columns will render in a same draw command).  

- `NoSort`  
 Disable ability to sort on this field (even if ImGuiTableFlags_Sortable is set on the table).  

- `NoSortAscending`  
 Disable ability to sort in the ascending direction.  

- `NoSortDescending`  
 Disable ability to sort in the descending direction.  

- `NoHeaderLabel`  
 [`ImGui.table_headers_row`][] will not submit label for this column. Convenient for some small columns. Name will still appear in context menu.  

- `NoHeaderWidth`  
 Disable header text width contribution to automatic column width.  

- `PreferSortAscending`  
 Make the initial sort direction Ascending when first sorting on this column (default).  

- `PreferSortDescending`  
 Make the initial sort direction Descending when first sorting on this column.  

- `IndentEnable`  
 Use current [`ImGui.indent`][] value when entering cell (default for column 0).  

- `IndentDisable`  
 Ignore current [`ImGui.indent`][] value when entering cell (default for columns > 0). Indentation changes _within_ the cell will still be honored.  

#### Output status flags, read-only via [`ImGui.table_get_column_flags`][]  

- `IsEnabled`  
 Status: is enabled == not hidden by user/api (referred to as "Hide" in _DefaultHide and _NoHide) flags.  

- `IsVisible`  
 Status: is visible == is enabled AND not clipped by scrolling.  

- `IsSorted`  
 Status: is currently part of the sort specs  

- `IsHovered`  
 Status: is hovered by mouse  

#### [Internal] Combinations and masks  

- `WidthStretch`, `WidthFixed`, `WidthMask_`  

- `IndentEnable`, `IndentDisable`, `IndentMask_`  

- `IsEnabled`, `IsVisible`, `IsSorted`, `IsHovered`, `StatusMask_`  

- `NoDirectResize_`  
 [Internal] Disable user resizing this column directly (it may however we resized indirectly from its left edge)  

#### Obsolete names (will be removed soon)  

- `WidthFixed`, `NoResize`  
 Column will not stretch and keep resizing based on submitted contents.  

## Flags for [`ImGui.table_next_row`][]  

### ::: ImGui::ImGuiTableRowFlags

- `None`  

- `Headers`  
 Identify header row (set default background color + width of its contents accounted differently for auto column width)  

## Enum for [`ImGui.table_set_bg_color`][]  
Background colors are rendering in 3 layers:  

  - Layer 0: draw with RowBg0 color if set, otherwise draw with ColumnBg0 if set.
  - Layer 1: draw with RowBg1 color if set, otherwise draw with ColumnBg1 if set.
  - Layer 2: draw with CellBg color if set.

The purpose of the two row/columns layers is to let you decide if a background color changes should override or blend with the existing color.  
When using ImGuiTableFlags_RowBg on the table, each row has the RowBg0 color automatically set for odd/even rows.  
If you set the color of RowBg0 target, your color will override the existing RowBg0 color.  
If you set the color of RowBg1 or ColumnBg1 target, your color will blend over the RowBg0 color.  

### ::: ImGui::ImGuiTableBgTarget

- `None`  

- `RowBg0`  
 Set row background color 0 (generally used for background, automatically set when ImGuiTableFlags_RowBg is used)  

- `RowBg1`  
 Set row background color 1 (generally used for selection marking)  

- `CellBg`  
 Set cell background color (top-most color)  

## Flags for [`ImGui.is_window_focused`][]  

### ::: ImGui::ImGuiFocusedFlags

- `None`  

- `ChildWindows`  
 Return true if any children of the window is focused  

- `RootWindow`  
 Test from root window (top most parent of the current hierarchy)  

- `AnyWindow`  
 Return true if any window is focused. Important: If you are trying to tell how to dispatch your low-level inputs, do NOT use this. Use 'io.WantCaptureMouse' instead! Please read the FAQ!  

- `NoPopupHierarchy`  
 Do not consider popup hierarchy (do not treat popup emitter as parent of popup) (when used with _ChildWindows or _RootWindow)  
 Consider docking hierarchy (treat dockspace host as parent of docked window) (when used with _ChildWindows or _RootWindow)  

- `ChildWindows`, `RootWindow`, `RootAndChildWindows`  

## Flags for [`ImGui.is_item_hovered`][], [`ImGui.is_window_hovered`][]  
Note: if you are trying to check whether your mouse should be dispatched to Dear ImGui or to your app, you should use 'io.WantCaptureMouse' instead! Please read the FAQ!  
Note: windows with the ImGuiWindowFlags_NoInputs flag are ignored by [`ImGui.is_window_hovered`][] calls.  

### ::: ImGui::ImGuiHoveredFlags

- `None`  
 Return true if directly over the item/window, not obstructed by another window, not obstructed by an active popup or modal blocking inputs under them.  

- `ChildWindows`  
 [`ImGui.is_window_hovered`][] only: Return true if any children of the window is hovered  

- `RootWindow`  
 [`ImGui.is_window_hovered`][] only: Test from root window (top most parent of the current hierarchy)  

- `AnyWindow`  
 [`ImGui.is_window_hovered`][] only: Return true if any window is hovered  

- `NoPopupHierarchy`  
 [`ImGui.is_window_hovered`][] only: Do not consider popup hierarchy (do not treat popup emitter as parent of popup) (when used with _ChildWindows or _RootWindow)  
 [`ImGui.is_window_hovered`][] only: Consider docking hierarchy (treat dockspace host as parent of docked window) (when used with _ChildWindows or _RootWindow)  

- `AllowWhenBlockedByPopup`  
 Return true even if a popup window is normally blocking access to this item/window  
 Return true even if a modal popup window is normally blocking access to this item/window. FIXME-TODO: Unavailable yet.  

- `AllowWhenBlockedByActiveItem`  
 Return true even if an active item is blocking access to this item/window. Useful for Drag and Drop patterns.  

- `AllowWhenOverlapped`  
 [`ImGui.is_item_hovered`][] only: Return true even if the position is obstructed or overlapped by another window  

- `AllowWhenDisabled`  
 [`ImGui.is_item_hovered`][] only: Return true even if the item is disabled  

- `NoNavOverride`  
 Disable using gamepad/keyboard navigation state when active, always query mouse.  

- `AllowWhenBlockedByPopup`, `AllowWhenBlockedByActiveItem`, `AllowWhenOverlapped`, `RectOnly`  

- `ChildWindows`, `RootWindow`, `RootAndChildWindows`  

## Flags for [`ImGui.begin_drag_drop_source`][], [`ImGui.accept_drag_drop_payload`][]  

### ::: ImGui::ImGuiDragDropFlags

- `None`  

[`ImGui.begin_drag_drop_source`][] flags  

- `SourceNoPreviewTooltip`  
 By default, a successful call to [`ImGui.begin_drag_drop_source`][] opens a tooltip so you can display a preview or description of the source contents. This flag disable this behavior.  

- `SourceNoDisableHover`  
 By default, when dragging we clear data so that [`ImGui.is_item_hovered`][] will return false, to avoid subsequent user code submitting tooltips. This flag disable this behavior so you can still call [`ImGui.is_item_hovered`][] on the source item.  

- `SourceNoHoldToOpenOthers`  
 Disable the behavior that allows to open tree nodes and collapsing header by holding over them while dragging a source item.  

- `SourceAllowNullID`  
 Allow items such as [`ImGui.text`][], [`ImGui.image`][] that have no unique identifier to be used as drag source, by manufacturing a temporary identifier based on their window-relative position. This is extremely unusual within the dear imgui ecosystem and so we made it explicit.  

- `SourceExtern`  
 External source (from outside of dear imgui), won't attempt to read current item/window info. Will always return true. Only one Extern source can be active simultaneously.  

- `SourceAutoExpirePayload`  
 Automatically expire the payload if the source cease to be submitted (otherwise payloads are persisting while being dragged)  
[`ImGui.accept_drag_drop_payload`][] flags  

- `AcceptBeforeDelivery`  
 [`ImGui.accept_drag_drop_payload`][] will returns true even before the mouse button is released. You can then call IsDelivery() to test if the payload needs to be delivered.  

- `AcceptNoDrawDefaultRect`  
 Do not draw the default highlight rectangle when hovering over target.  

- `AcceptNoPreviewTooltip`  
 Request hiding the [`ImGui.begin_drag_drop_source`][] tooltip from the [`ImGui.begin_drag_drop_target`][] site.  

- `AcceptBeforeDelivery`, `AcceptNoDrawDefaultRect`, `AcceptPeekOnly`  
 For peeking ahead and inspecting the payload before delivery.  

Standard Drag and Drop payload types. You can define you own payload types using short strings. Types starting with '_' are defined by Dear ImGui.  
 float[3]: Standard type for colors, without alpha. User code may use this type.  

 float[4]: Standard type for colors. User code may use this type.  

## A primary data type  

### ::: ImGui::ImGuiDataType

- `S8`  
 signed char / char (with sensible compilers)  

- `U8`  
 unsigned char  

- `S16`  
 short  

- `U16`  
 unsigned short  

- `S32`  
 int  

- `U32`  
 unsigned int  

- `S64`  
 long long / __int64  

- `U64`  
 unsigned long long / unsigned __int64  

- `Float`  
 float  

- `Double`  
 double  

- `COUNT`  

## A cardinal direction  

### ::: ImGui::ImGuiDir

- `None`  

- `Left`  

- `Right`  

- `Up`  

- `Down`  

- `COUNT`  

## A sorting direction  

### ::: ImGui::ImGuiSortDirection

- `None`  

- `Ascending`  
 Ascending = 0->9, A->Z etc.  

- `Descending`  
 Descending = 9->0, Z->A etc.  

Keys value 0 to 511 are left unused as legacy native/opaque key values (< 1.87)  
Keys value >= 512 are named keys (>= 1.87)  

### ::: ImGui::ImGuiKey

#### Keyboard  

- `None`  

- `Tab`  
 == ImGuiKey_NamedKey_BEGIN  

- `LeftArrow`  

- `RightArrow`  

- `UpArrow`  

- `DownArrow`  

- `PageUp`  

- `PageDown`  

- `Home`  

- `[`ImGui.end`][]`  

- `Insert`  

- `Delete`  

- `Backspace`  

- `Space`  

- `Enter`  

- `Escape`  

- `LeftCtrl`, `LeftShift`, `LeftAlt`, `LeftSuper`  

- `RightCtrl`, `RightShift`, `RightAlt`, `RightSuper`  

- `Menu`  

- `Num0`, `Num1`, `Num2`, `Num3`, `Num4`, `Num5`, `Num6`, `Num7`, `Num8`, `Num9`  

- `A`, `B`, `C`, `D`, `E`, `F`, `G`, `H`, `I`, `J`  

- `K`, `L`, `M`, `N`, `O`, `P`, `Q`, `R`, `S`, `T`  

- `U`, `V`, `W`, `X`, `Y`, `Z`  

- `F1`, `F2`, `F3`, `F4`, `F5`, `F6`  

- `F7`, `F8`, `F9`, `F10`, `F11`, `F12`  

- `Apostrophe`  
 '  

- `Comma`  
 ,  

- `Minus`  
 -

- `Period`  
 .  

- `Slash`  
 /  

- `Semicolon`  
 ;  

- `Equal`  
 =  

- `LeftBracket`  
 [  

- `Backslash`  
 \ (this text inhibit multiline comment caused by backslash)  

- `RightBracket`  
 ]  

- `GraveAccent`  
 `  

- `CapsLock`  

- `ScrollLock`  

- `NumLock`  

- `PrintScreen`  

- `Pause`  

- `Keypad0`, `Keypad1`, `Keypad2`, `Keypad3`, `Keypad4`  

- `Keypad5`, `Keypad6`, `Keypad7`, `Keypad8`, `Keypad9`  

- `KeypadDecimal`  

- `KeypadDivide`  

- `KeypadMultiply`  

- `KeypadSubtract`  

- `KeypadAdd`  

- `KeypadEnter`  

- `KeypadEqual`  

Gamepad (some of those are analog values, 0.0f to 1.0f)                              // NAVIGATION action  

- `GamepadStart`  
 Menu (Xbox)          + (Switch)   Start/Options (PS) // --  

- `GamepadBack`  
 View (Xbox)          - (Switch)   Share (PS)         // --  

- `GamepadFaceUp`  
 Y (Xbox)             X (Switch)   Triangle (PS)      // -> ImGuiNavInput_Input  

- `GamepadFaceDown`  
 A (Xbox)             B (Switch)   Cross (PS)         // -> ImGuiNavInput_Activate  

- `GamepadFaceLeft`  
 X (Xbox)             Y (Switch)   Square (PS)        // -> ImGuiNavInput_Menu  

- `GamepadFaceRight`  
 B (Xbox)             A (Switch)   Circle (PS)        // -> ImGuiNavInput_Cancel  

- `GamepadDpadUp`  
 D-pad Up                                             // -> ImGuiNavInput_DpadUp  

- `GamepadDpadDown`  
 D-pad Down                                           // -> ImGuiNavInput_DpadDown  

- `GamepadDpadLeft`  
 D-pad Left                                           // -> ImGuiNavInput_DpadLeft  

- `GamepadDpadRight`  
 D-pad Right                                          // -> ImGuiNavInput_DpadRight  

- `GamepadL1`  
 L Bumper (Xbox)      L (Switch)   L1 (PS)            // -> ImGuiNavInput_FocusPrev + ImGuiNavInput_TweakSlow  

- `GamepadR1`  
 R Bumper (Xbox)      R (Switch)   R1 (PS)            // -> ImGuiNavInput_FocusNext + ImGuiNavInput_TweakFast  

- `GamepadL2`  
 L Trigger (Xbox)     ZL (Switch)  L2 (PS) [Analog]  

- `GamepadR2`  
 R Trigger (Xbox)     ZR (Switch)  R2 (PS) [Analog]  

- `GamepadL3`  
 L Thumbstick (Xbox)  L3 (Switch)  L3 (PS)  

- `GamepadR3`  
 R Thumbstick (Xbox)  R3 (Switch)  R3 (PS)  

- `GamepadLStickUp`  
 [Analog]                                             // -> ImGuiNavInput_LStickUp  

- `GamepadLStickDown`  
 [Analog]                                             // -> ImGuiNavInput_LStickDown  

- `GamepadLStickLeft`  
 [Analog]                                             // -> ImGuiNavInput_LStickLeft  

- `GamepadLStickRight`  
 [Analog]                                             // -> ImGuiNavInput_LStickRight  

- `GamepadRStickUp`  
 [Analog]  

- `GamepadRStickDown`  
 [Analog]  

- `GamepadRStickLeft`  
 [Analog]  

- `GamepadRStickRight`  
 [Analog]  

#### Keyboard Modifiers (explicitly submitted by backend via AddKeyEvent() calls)  

- This is mirroring the data also written to io.KeyCtrl, io.KeyShift, io.KeyAlt, io.KeySuper, in a format allowing
  them to be accessed via standard key API, allowing calls such as [`ImGui.is_key_pressed`][], [`ImGui.is_key_released`][], querying duration etc.
- Code polling every keys (e.g. an interface to detect a key press for input mapping) might want to ignore those
  and prefer using the real keys (e.g. ImGuiKey_LeftCtrl, ImGuiKey_RightCtrl instead of ImGuiKey_ModCtrl).
- In theory the value of keyboard modifiers should be roughly equivalent to a logical or of the equivalent left/right keys.
  In practice: it's complicated; mods are often provided from different sources. Keyboard layout, IME, sticky keys and
  backends tend to interfere and break that equivalence. The safer decision is to relay that ambiguity down to the end-user...

- `ModCtrl`, `ModShift`, `ModAlt`, `ModSuper`  

#### [`ImGui.end`][] of list  

- `COUNT`  
 No valid [`ImGui::ImGuiKey`][] is ever greater than this value  

[Internal] Prior to 1.87 we required user to fill io.KeysDown[512] using their own native index + a io.KeyMap[] array.  
We are ditching this method but keeping a legacy path for user code doing e.g. [`ImGui.is_key_pressed`][](MY_NATIVE_KEY_CODE)  

- `NamedKey_BEGIN`  

- `COUNT`, `NamedKey_END`  

- `NamedKey_BEGIN`, `NamedKey_END`, `NamedKey_COUNT`  

- `NamedKey_COUNT`, `KeysData_SIZE`  
 Size of KeysData[]: only hold named keys  

- `NamedKey_BEGIN`, `KeysData_OFFSET`  
 First key stored in io.KeysData[0]. Accesses to io.KeysData[] must use (key - ImGuiKey_KeysData_OFFSET).  

- `COUNT`, `KeysData_SIZE`  
 Size of KeysData[]: hold legacy 0..512 keycodes + named keys  

- `KeysData_OFFSET`  
 First key stored in io.KeysData[0]. Accesses to io.KeysData[] must use (key - ImGuiKey_KeysData_OFFSET).  

- `KeypadEnter`  
 Renamed in 1.87  

Helper "flags" version of key-mods to store and compare multiple key-mods easily. Sometimes used for storage (e.g. io.KeyMods) but otherwise not much used in public API.  

### ::: ImGui::ImGuiModFlags

- `None`  

- `Ctrl`  

- `Shift`  

- `Alt`  
 Menu  

- `Super`  
 Cmd/Super/Windows key  

## Gamepad/Keyboard navigation  
Since >= 1.87 backends you generally don't need to care about this enum since io.NavInputs[] is setup automatically. This might become private/internal some day.  
Keyboard: Set io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard to enable. [`ImGui.new_frame`][] will automatically fill io.NavInputs[] based on your io.AddKeyEvent() calls.  
Gamepad:  Set io.ConfigFlags |= ImGuiConfigFlags_NavEnableGamepad to enable. Backend: set ImGuiBackendFlags_HasGamepad and fill the io.NavInputs[] fields before calling [`ImGui.new_frame`][]. Note that io.NavInputs[] is cleared by [`ImGui.end_frame`][].  
Read instructions in imgui.cpp for more details. Download PNG/PSD at http://dearimgui.org/controls_sheets.  

### ::: ImGui::ImGuiNavInput

#### Gamepad Mapping  

- `Activate`  
 Activate / Open / Toggle / Tweak value       // e.g. Cross  (PS4), A (Xbox), A (Switch), Space (Keyboard)  

- `Cancel`  
 Cancel / Close / Exit                        // e.g. Circle (PS4), B (Xbox), B (Switch), Escape (Keyboard)  

- `Input`  
 [`ImGui.text`][] input / On-Screen keyboard              // e.g. Triang.(PS4), Y (Xbox), X (Switch), Return (Keyboard)  

- `Menu`  
 Tap: Toggle menu / Hold: Focus, Move, Resize // e.g. Square (PS4), X (Xbox), Y (Switch), Alt (Keyboard)  

- `DpadLeft`  
 Move / Tweak / Resize window (w/ PadMenu)    // e.g. D-pad Left/Right/Up/Down (Gamepads), Arrow keys (Keyboard)  

- `DpadRight`  

- `DpadUp`  

- `DpadDown`  

- `LStickLeft`  
 Scroll / Move window (w/ PadMenu)            // e.g. Left Analog Stick Left/Right/Up/Down  

- `LStickRight`  

- `LStickUp`  

- `LStickDown`  

- `FocusPrev`  
 Focus Next window (w/ PadMenu)               // e.g. L1 or L2 (PS4), LB or LT (Xbox), L or ZL (Switch)  

- `FocusNext`  
 Focus Prev window (w/ PadMenu)               // e.g. R1 or R2 (PS4), RB or RT (Xbox), R or ZL (Switch)  

- `TweakSlow`  
 Slower tweaks                                // e.g. L1 or L2 (PS4), LB or LT (Xbox), L or ZL (Switch)  

- `TweakFast`  
 Faster tweaks                                // e.g. R1 or R2 (PS4), RB or RT (Xbox), R or ZL (Switch)  

[Internal] Don't use directly! This is used internally to differentiate keyboard from gamepad inputs for behaviors that require to differentiate them.  
Keyboard behavior that have no corresponding gamepad mapping (e.g. CTRL+TAB) will be directly reading from keyboard keys instead of io.NavInputs[].  

- `KeyLeft_`  
 Move left                                    // = Arrow keys  

- `KeyRight_`  
 Move right  

- `KeyUp_`  
 Move up  

- `KeyDown_`  
 Move down  

- `COUNT`  

Configuration flags stored in io.ConfigFlags. Set by user/application.  

### ::: ImGui::ImGuiConfigFlags

- `None`  

- `NavEnableKeyboard`  
 Master keyboard navigation enable flag. [`ImGui.new_frame`][] will automatically fill io.NavInputs[] based on io.AddKeyEvent() calls  

- `NavEnableGamepad`  
 Master gamepad navigation enable flag. This is mostly to instruct your imgui backend to fill io.NavInputs[]. Backend also needs to set ImGuiBackendFlags_HasGamepad.  

- `NavEnableSetMousePos`  
 Instruct navigation to move the mouse cursor. May be useful on TV/console systems where moving a virtual mouse is awkward. Will update io.MousePos and set io.WantSetMousePos=true. If enabled you MUST honor io.WantSetMousePos requests in your backend, otherwise ImGui will react as if the mouse is jumping around back and forth.  

- `NavNoCaptureKeyboard`  
 Instruct navigation to not set the io.WantCaptureKeyboard flag when io.NavActive is set.  

- `NoMouse`  
 Instruct imgui to clear mouse position/buttons in [`ImGui.new_frame`][]. This allows ignoring the mouse information set by the backend.  

- `NoMouseCursorChange`  
 Instruct backend to not alter mouse cursor shape and visibility. Use if the backend cursor changes are interfering with yours and you don't want to use [`ImGui.set_mouse_cursor`][] to change mouse cursor. You may want to honor requests from imgui by reading [`ImGui.get_mouse_cursor`][] yourself instead.  

User storage (to allow your backend/engine to communicate to code that may be shared between multiple projects. Those flags are NOT used by core Dear ImGui)  

- `IsSRGB`  
 Application is SRGB-aware.  

- `IsTouchScreen`  
 Application is using a touch screen instead of a mouse.  

Backend capabilities flags stored in io.BackendFlags. Set by imgui_impl_xxx or custom backend.  

### ::: ImGui::ImGuiBackendFlags

- `None`  

- `HasGamepad`  
 Backend Platform supports gamepad and currently has one connected.  

- `HasMouseCursors`  
 Backend Platform supports honoring [`ImGui.get_mouse_cursor`][] value to change the OS cursor shape.  

- `HasSetMousePos`  
 Backend Platform supports io.WantSetMousePos requests to reposition the OS mouse position (only used if ImGuiConfigFlags_NavEnableSetMousePos is set).  

- `RendererHasVtxOffset`  
 Backend Renderer supports [`ImGui::ImDrawCmd`][]::VtxOffset. This enables output of large meshes (64K+ vertices) while still using 16-bit indices.  

## Enumeration for PushStyleColor() / [`ImGui.pop_style_color`][]  

### ::: ImGui::ImGuiCol

- `[`ImGui.text`][]`  

- `[`ImGui.text_disabled`][]`  

- `WindowBg`  
 Background of normal windows  

- `ChildBg`  
 Background of child windows  

- `PopupBg`  
 Background of popups, menus, tooltips windows  

- `Border`  

- `BorderShadow`  

- `FrameBg`  
 Background of checkbox, radio button, plot, slider, text input  

- `FrameBgHovered`  

- `FrameBgActive`  

- `TitleBg`  

- `TitleBgActive`  

- `TitleBgCollapsed`  

- `MenuBarBg`  

- `ScrollbarBg`  

- `ScrollbarGrab`  

- `ScrollbarGrabHovered`  

- `ScrollbarGrabActive`  

- `CheckMark`  

- `SliderGrab`  

- `SliderGrabActive`  

- `[`ImGui.button`][]`  

- `ButtonHovered`  

- `ButtonActive`  

- `Header`  
 Header* colors are used for CollapsingHeader, TreeNode, Selectable, MenuItem  

- `HeaderHovered`  

- `HeaderActive`  

- `[`ImGui.separator`][]`  

- `SeparatorHovered`  

- `SeparatorActive`  

- `ResizeGrip`  
 Resize grip in lower-right and lower-left corners of windows.  

- `ResizeGripHovered`  

- `ResizeGripActive`  

- `Tab`  
 TabItem in a TabBar  

- `TabHovered`  

- `TabActive`  

- `TabUnfocused`  

- `TabUnfocusedActive`  

- `PlotLines`  

- `PlotLinesHovered`  

- `PlotHistogram`  

- `PlotHistogramHovered`  

- `TableHeaderBg`  
 Table header background  

- `TableBorderStrong`  
 Table outer and header borders (prefer using Alpha=1.0 here)  

- `TableBorderLight`  
 Table inner borders (prefer using Alpha=1.0 here)  

- `TableRowBg`  
 Table row background (even rows)  

- `TableRowBgAlt`  
 Table row background (odd rows)  

- `TextSelectedBg`  

- `DragDropTarget`  
 Rectangle highlighting a drop target  

- `NavHighlight`  
 Gamepad/keyboard: current highlighted item  

- `NavWindowingHighlight`  
 Highlight window when using CTRL+TAB  

- `NavWindowingDimBg`  
 Darken/colorize entire screen behind the CTRL+TAB window list, when active  

- `ModalWindowDimBg`  
 Darken/colorize entire screen behind a modal window, when one is active  

- `COUNT`  

Enumeration for PushStyleVar() / [`ImGui.pop_style_var`][] to temporarily modify the [`ImGui::ImGuiStyle`][] structure.  

- The enum only refers to fields of [`ImGui::ImGuiStyle`][] which makes sense to be pushed/popped inside UI code.
  During initialization or between frames, feel free to just poke into [`ImGui::ImGuiStyle`][] directly.
- Tip: Use your programming IDE navigation facilities on the names in the _second column_ below to find the actual members and their description.
  In Visual Studio IDE: CTRL+comma ("Edit.GoToAll") can follow symbols in comments, whereas CTRL+F12 ("Edit.GoToImplementation") cannot.
  With Visual Assist installed: ALT+G ("VAssistX.GoToImplementation") can also follow symbols in comments.
- When changing this enum, you need to update the associated internal table GStyleVarInfo[] accordingly. This is where we link enum values to members offset/type.

### ::: ImGui::ImGuiStyleVar

- `Alpha`  
 float     Alpha  

- `DisabledAlpha`  
 float     DisabledAlpha  

- `WindowPadding`  
 [`ImGui::ImVec2`][]    WindowPadding  

- `WindowRounding`  
 float     WindowRounding  

- `WindowBorderSize`  
 float     WindowBorderSize  

- `WindowMinSize`  
 [`ImGui::ImVec2`][]    WindowMinSize  

- `WindowTitleAlign`  
 [`ImGui::ImVec2`][]    WindowTitleAlign  

- `ChildRounding`  
 float     ChildRounding  

- `ChildBorderSize`  
 float     ChildBorderSize  

- `PopupRounding`  
 float     PopupRounding  

- `PopupBorderSize`  
 float     PopupBorderSize  

- `FramePadding`  
 [`ImGui::ImVec2`][]    FramePadding  

- `FrameRounding`  
 float     FrameRounding  

- `FrameBorderSize`  
 float     FrameBorderSize  

- `ItemSpacing`  
 [`ImGui::ImVec2`][]    ItemSpacing  

- `ItemInnerSpacing`  
 [`ImGui::ImVec2`][]    ItemInnerSpacing  

- `IndentSpacing`  
 float     IndentSpacing  

- `CellPadding`  
 [`ImGui::ImVec2`][]    CellPadding  

- `ScrollbarSize`  
 float     ScrollbarSize  

- `ScrollbarRounding`  
 float     ScrollbarRounding  

- `GrabMinSize`  
 float     GrabMinSize  

- `GrabRounding`  
 float     GrabRounding  

- `TabRounding`  
 float     TabRounding  

- `ButtonTextAlign`  
 [`ImGui::ImVec2`][]    ButtonTextAlign  

- `SelectableTextAlign`  
 [`ImGui::ImVec2`][]    SelectableTextAlign  

- `COUNT`  

Flags for [`ImGui.invisible_button`][] [extended in imgui_internal.h]  

### ::: ImGui::ImGuiButtonFlags

- `None`  

- `MouseButtonLeft`  
 React on left mouse button (default)  

- `MouseButtonRight`  
 React on right mouse button  

- `MouseButtonMiddle`  
 React on center mouse button  

#### [Internal]  

- `MouseButtonLeft`, `MouseButtonRight`, `MouseButtonMiddle`, `MouseButtonMask_`  

- `MouseButtonLeft`, `MouseButtonDefault_`  

## Flags for [`ImGui.color_edit3`][] / [`ImGui.color_edit4`][] / [`ImGui.color_picker3`][] / [`ImGui.color_picker4`][] / [`ImGui.color_button`][]  

### ::: ImGui::ImGuiColorEditFlags

- `None`  

- `NoAlpha`  
              // ColorEdit, ColorPicker, [`ImGui.color_button`][]: ignore Alpha component (will only read 3 components from the input pointer).

- `NoPicker`  
              // ColorEdit: disable picker when clicking on color square.

- `NoOptions`  
              // ColorEdit: disable toggling options menu when right-clicking on inputs/small preview.

- `NoSmallPreview`  
              // ColorEdit, ColorPicker: disable color square preview next to the inputs. (e.g. to show only the inputs)

- `NoInputs`  
              // ColorEdit, ColorPicker: disable inputs sliders/text widgets (e.g. to show only the small preview color square).

- `NoTooltip`  
              // ColorEdit, ColorPicker, [`ImGui.color_button`][]: disable tooltip when hovering the preview.

- `NoLabel`  
              // ColorEdit, ColorPicker: disable display of inline text label (the label is still forwarded to the tooltip and picker).

- `NoSidePreview`  
              // ColorPicker: disable bigger color preview on right side of the picker, use small color square preview instead.

- `NoDragDrop`  
              // ColorEdit: disable drag and drop target. [`ImGui.color_button`][]: disable drag and drop source.

- `NoBorder`  
              // [`ImGui.color_button`][]: disable border (which is enforced by default)

User Options (right-click on widget to change some of them).  

- `AlphaBar`  
              // ColorEdit, ColorPicker: show vertical alpha bar/gradient in picker.

- `AlphaPreview`  
              // ColorEdit, ColorPicker, [`ImGui.color_button`][]: display preview as a transparent color over a checkerboard, instead of opaque.

- `AlphaPreviewHalf`  
              // ColorEdit, ColorPicker, [`ImGui.color_button`][]: display half opaque / half checkerboard, instead of opaque.

- `HDR`  
              // (WIP) ColorEdit: Currently only disable 0.0f..1.0f limits in RGBA edition (note: you probably want to use ImGuiColorEditFlags_Float flag as well).

- `DisplayRGB`  
 [Display]    // ColorEdit: override _display_ type among RGB/HSV/Hex. ColorPicker: select any combination using one or more of RGB/HSV/Hex.  

- `DisplayHSV`  
 [Display]    // "  

- `DisplayHex`  
 [Display]    // "  

- `Uint8`  
 [DataType]   // ColorEdit, ColorPicker, [`ImGui.color_button`][]: _display_ values formatted as 0..255.  

- `Float`  
 [DataType]   // ColorEdit, ColorPicker, [`ImGui.color_button`][]: _display_ values formatted as 0.0f..1.0f floats instead of 0..255 integers. No round-trip of value via integers.  

- `PickerHueBar`  
 [Picker]     // ColorPicker: bar for Hue, rectangle for Sat/Value.  

- `PickerHueWheel`  
 [Picker]     // ColorPicker: wheel for Hue, triangle for Sat/Value.  

- `InputRGB`  
 [Input]      // ColorEdit, ColorPicker: input and output data in RGB format.  

- `InputHSV`  
 [Input]      // ColorEdit, ColorPicker: input and output data in HSV format.  

Defaults Options. You can set application defaults using [`ImGui.set_color_edit_options`][]. The intent is that you probably don't want to  
override them in most of your calls. Let the user choose via the option menu and/or call [`ImGui.set_color_edit_options`][] once during startup.  

- `DisplayRGB`, `Uint8`, `PickerHueBar`, `InputRGB`, `DefaultOptions_`  

#### [Internal] Masks  

- `DisplayRGB`, `DisplayHSV`, `DisplayHex`, `DisplayMask_`  

- `Uint8`, `Float`, `DataTypeMask_`  

- `PickerHueBar`, `PickerHueWheel`, `PickerMask_`  

- `InputRGB`, `InputHSV`, `InputMask_`  

#### Obsolete names (will be removed)  
ImGuiColorEditFlags_RGB = ImGuiColorEditFlags_DisplayRGB, ImGuiColorEditFlags_HSV = ImGuiColorEditFlags_DisplayHSV, ImGuiColorEditFlags_HEX = ImGuiColorEditFlags_DisplayHex  // [renamed in 1.69]  

Flags for [`ImGui.drag_float`][], [`ImGui.drag_int`][], [`ImGui.slider_float`][], [`ImGui.slider_int`][] etc.  
We use the same sets of flags for DragXXX() and SliderXXX() functions as the features are the same and it makes it easier to swap them.  

### ::: ImGui::ImGuiSliderFlags

- `None`  

- `AlwaysClamp`  
 Clamp value to min/max bounds when input manually with CTRL+Click. By default CTRL+Click allows going out of bounds.  

- `Logarithmic`  
 Make the widget logarithmic (linear otherwise). Consider using ImGuiSliderFlags_NoRoundToFormat with this if using a format-string with small amount of digits.  

- `NoRoundToFormat`  
 Disable rounding underlying value to match precision of the display format string (e.g. %.3f values are rounded to those 3 digits)  

- `NoInput`  
 Disable CTRL+Click or Enter key allowing to input text directly into the widget  

- `InvalidMask_`  
 [Internal] We treat using those bits as being potentially a 'float power' argument from the previous API that has got miscast to this enum, and will trigger an assert if needed.  

#### Obsolete names (will be removed)  

- `AlwaysClamp`  
 [renamed in 1.79]  

Identify a mouse button.  
Those values are guaranteed to be stable and we frequently use 0/1 directly. Named enums provided for convenience.  

### ::: ImGui::ImGuiMouseButton

- `Left`  

- `Right`  

- `Middle`  

- `COUNT`  

## Enumeration for [`ImGui.get_mouse_cursor`][]  
User code may request backend to display given cursor by calling [`ImGui.set_mouse_cursor`][], which is why we have some cursors that are marked unused here  

### ::: ImGui::ImGuiMouseCursor

- `None`  

- `Arrow`  

- `TextInput`  
 When hovering over [`ImGui.input_text`][], etc.  

- `ResizeAll`  
 (Unused by Dear ImGui functions)  

- `ResizeNS`  
 When hovering over an horizontal border  

- `ResizeEW`  
 When hovering over a vertical border or a column  

- `ResizeNESW`  
 When hovering over the bottom-left corner of a window  

- `ResizeNWSE`  
 When hovering over the bottom-right corner of a window  

- `Hand`  
 (Unused by Dear ImGui functions. Use for e.g. hyperlinks)  

- `NotAllowed`  
 When hovering something with disallowed interaction. Usually a crossed circle.  

- `COUNT`  

## Enumeration for ImGui::SetWindow***(), SetNextWindow***(), SetNextItem***() functions  
Represent a condition.  
Important: Treat as a regular enum! Do NOT combine multiple values using binary operators! All the functions above treat 0 as a shortcut to ImGuiCond_Always.  

### ::: ImGui::ImGuiCond

- `None`  
 No condition (always set the variable), same as _Always  

- `Always`  
 No condition (always set the variable)  

- `Once`  
 Set the variable once per runtime session (only the first call will succeed)  

- `FirstUseEver`  
 Set the variable if the object/window has no persistently saved data (no entry in .ini file)  

- `Appearing`  
 Set the variable if the object/window is appearing after being hidden/inactive (or the first time)  

