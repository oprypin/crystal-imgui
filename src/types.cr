module ImGui
  VERSION               = "1.89.8"
  VERSION_NUM           = 18980
  PAYLOAD_TYPE_COLOR_3F = "_COL3F"
  PAYLOAD_TYPE_COLOR_4F = "_COL4F"

  alias ImBitArrayPtr = LibImGui::ImBitArrayPtr
  alias ImDrawCallback = LibImGui::ImDrawCallback
  alias ImDrawIdx = LibImGui::ImDrawIdx
  alias ImFileHandle = LibImGui::ImFileHandle
  alias ImGuiContextHookCallback = LibImGui::ImGuiContextHookCallback
  alias ImGuiErrorLogCallback = LibImGui::ImGuiErrorLogCallback
  alias ImGuiID = LibImGui::ImGuiID
  alias ImGuiInputTextCallback = LibImGui::ImGuiInputTextCallback
  alias ImGuiKeyChord = LibImGui::ImGuiKeyChord
  alias ImGuiKeyRoutingIndex = LibImGui::ImGuiKeyRoutingIndex
  alias ImGuiMemAllocFunc = LibImGui::ImGuiMemAllocFunc
  alias ImGuiMemFreeFunc = LibImGui::ImGuiMemFreeFunc
  alias ImGuiSizeCallback = LibImGui::ImGuiSizeCallback
  alias ImGuiTableColumnIdx = LibImGui::ImGuiTableColumnIdx
  alias ImGuiTableDrawChannelIdx = LibImGui::ImGuiTableDrawChannelIdx
  alias ImPoolIdx = LibImGui::ImPoolIdx
  alias ImTextureID = LibImGui::ImTextureID
  alias ImWchar = LibImGui::ImWchar
  alias ImWchar16 = LibImGui::ImWchar16
  alias ImWchar32 = LibImGui::ImWchar32

  @[Extern]
  struct ImVec2
    property x : Float32
    property y : Float32

    def initialize(@x : Float32, @y : Float32)
    end
  end

  alias TopLevel::ImVec2 = ImGui::ImVec2

  @[Extern]
  struct ImVec4
    property x : Float32
    property y : Float32
    property z : Float32
    property w : Float32

    def initialize(@x : Float32, @y : Float32, @z : Float32, @w : Float32)
    end
  end

  alias TopLevel::ImVec4 = ImGui::ImVec4

  # [enum ImGuiWindowFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L973)
  @[Flags]
  enum ImGuiWindowFlags
    None = 0
    # Disable title-bar
    NoTitleBar = 1 << 0
    # Disable user resizing with the lower-right grip
    NoResize = 1 << 1
    # Disable user moving the window
    NoMove = 1 << 2
    # Disable scrollbars (window can still scroll with mouse or programmatically)
    NoScrollbar = 1 << 3
    # Disable user vertically scrolling with mouse wheel. On child window, mouse wheel will be forwarded to the parent unless NoScrollbar is also set.
    NoScrollWithMouse = 1 << 4
    # Disable user collapsing window by double-clicking on it. Also referred to as Window Menu Button (e.g. within a docking node).
    NoCollapse = 1 << 5
    # Resize every window to its content every frame
    AlwaysAutoResize = 1 << 6
    # Disable drawing background color (WindowBg, etc.) and outside border. Similar as using SetNextWindowBgAlpha(0.0f).
    NoBackground = 1 << 7
    # Never load/save settings in .ini file
    NoSavedSettings = 1 << 8
    # Disable catching mouse, hovering test with pass through.
    NoMouseInputs = 1 << 9
    # Has a menu-bar
    MenuBar = 1 << 10
    # Allow horizontal scrollbar to appear (off by default). You may use SetNextWindowContentSize(ImVec2(width,0.0f)); prior to calling Begin() to specify width. Read code in imgui_demo in the "Horizontal Scrolling" section.
    HorizontalScrollbar = 1 << 11
    # Disable taking focus when transitioning from hidden to visible state
    NoFocusOnAppearing = 1 << 12
    # Disable bringing window to front when taking focus (e.g. clicking on it or programmatically giving it focus)
    NoBringToFrontOnFocus = 1 << 13
    # Always show vertical scrollbar (even if ContentSize.y < Size.y)
    AlwaysVerticalScrollbar = 1 << 14
    # Always show horizontal scrollbar (even if ContentSize.x < Size.x)
    AlwaysHorizontalScrollbar = 1 << 15
    # Ensure child windows without border uses style.WindowPadding (ignored by default for non-bordered child windows, because more convenient)
    AlwaysUseWindowPadding = 1 << 16
    # No gamepad/keyboard navigation within the window
    NoNavInputs = 1 << 18
    # No focusing toward this window with gamepad/keyboard navigation (e.g. skipped by CTRL+TAB)
    NoNavFocus = 1 << 19
    # Display a dot next to the title. When used in a tab/docking context, tab is selected when clicking the X + closure is not assumed (will wait for user to stop submitting the tab). Otherwise closure is assumed when pressing the X, so if you keep submitting the tab may reappear at end of tab bar.
    UnsavedDocument = 1 << 20
    NoNav           = NoNavInputs | NoNavFocus
    NoDecoration    = NoTitleBar | NoResize | NoScrollbar | NoCollapse
    NoInputs        = NoMouseInputs | NoNavInputs | NoNavFocus
    # [BETA] On child window: allow gamepad/keyboard navigation to cross over parent border to this child or between sibling child windows.
    NavFlattened = 1 << 23
    # Don't use! For internal use by BeginChild()
    ChildWindow = 1 << 24
    # Don't use! For internal use by BeginTooltip()
    Tooltip = 1 << 25
    # Don't use! For internal use by BeginPopup()
    Popup = 1 << 26
    # Don't use! For internal use by BeginPopupModal()
    Modal = 1 << 27
    # Don't use! For internal use by BeginMenu()
    ChildMenu = 1 << 28
  end
  alias TopLevel::ImGuiWindowFlags = ImGui::ImGuiWindowFlags

  # [enum ImGuiInputTextFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1011)
  @[Flags]
  enum ImGuiInputTextFlags
    None = 0
    # Allow 0123456789.+-*/
    CharsDecimal = 1 << 0
    # Allow 0123456789ABCDEFabcdef
    CharsHexadecimal = 1 << 1
    # Turn a..z into A..Z
    CharsUppercase = 1 << 2
    # Filter out spaces, tabs
    CharsNoBlank = 1 << 3
    # Select entire text when first taking mouse focus
    AutoSelectAll = 1 << 4
    # Return 'true' when Enter is pressed (as opposed to every time the value was modified). Consider looking at the IsItemDeactivatedAfterEdit() function.
    EnterReturnsTrue = 1 << 5
    # Callback on pressing TAB (for completion handling)
    CallbackCompletion = 1 << 6
    # Callback on pressing Up/Down arrows (for history handling)
    CallbackHistory = 1 << 7
    # Callback on each iteration. User code may query cursor position, modify text buffer.
    CallbackAlways = 1 << 8
    # Callback on character inputs to replace or discard them. Modify 'EventChar' to replace or discard, or return 1 in callback to discard.
    CallbackCharFilter = 1 << 9
    # Pressing TAB input a '\t' character into the text field
    AllowTabInput = 1 << 10
    # In multi-line mode, unfocus with Enter, add new line with Ctrl+Enter (default is opposite: unfocus with Ctrl+Enter, add line with Enter).
    CtrlEnterForNewLine = 1 << 11
    # Disable following the cursor horizontally
    NoHorizontalScroll = 1 << 12
    # Overwrite mode
    AlwaysOverwrite = 1 << 13
    # Read-only mode
    ReadOnly = 1 << 14
    # Password mode, display all characters as '*'
    Password = 1 << 15
    # Disable undo/redo. Note that input text owns the text data while active, if you want to provide your own undo/redo stack you need e.g. to call ClearActiveID().
    NoUndoRedo = 1 << 16
    # Allow 0123456789.+-*/eE (Scientific notation input)
    CharsScientific = 1 << 17
    # Callback on buffer capacity changes request (beyond 'buf_size' parameter value), allowing the string to grow. Notify when the string wants to be resized (for string types which hold a cache of their Size). You will be provided a new BufSize in the callback and NEED to honor it. (see misc/cpp/imgui_stdlib.h for an example of using this)
    CallbackResize = 1 << 18
    # Callback on any edit (note that InputText() already returns true on edit, the callback is useful mainly to manipulate the underlying buffer while focus is active)
    CallbackEdit = 1 << 19
    # Escape key clears content if not empty, and deactivate otherwise (contrast to default behavior of Escape to revert)
    EscapeClearsAll = 1 << 20
  end
  alias TopLevel::ImGuiInputTextFlags = ImGui::ImGuiInputTextFlags

  # [enum ImGuiTreeNodeFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1041)
  @[Flags]
  enum ImGuiTreeNodeFlags
    None = 0
    # Draw as selected
    Selected = 1 << 0
    # Draw frame with background (e.g. for CollapsingHeader)
    Framed = 1 << 1
    # Hit testing to allow subsequent widgets to overlap this one
    AllowOverlap = 1 << 2
    # Don't do a TreePush() when open (e.g. for CollapsingHeader) = no extra indent nor pushing on ID stack
    NoTreePushOnOpen = 1 << 3
    # Don't automatically and temporarily open node when Logging is active (by default logging will automatically open tree nodes)
    NoAutoOpenOnLog = 1 << 4
    # Default node to be open
    DefaultOpen = 1 << 5
    # Need double-click to open node
    OpenOnDoubleClick = 1 << 6
    # Only open when clicking on the arrow part. If ImGuiTreeNodeFlags_OpenOnDoubleClick is also set, single-click arrow or double-click all box to open.
    OpenOnArrow = 1 << 7
    # No collapsing, no arrow (use as a convenience for leaf nodes).
    Leaf = 1 << 8
    # Display a bullet instead of arrow
    Bullet = 1 << 9
    # Use FramePadding (even for an unframed text node) to vertically align text baseline to regular widget height. Equivalent to calling AlignTextToFramePadding().
    FramePadding = 1 << 10
    # Extend hit box to the right-most edge, even if not framed. This is not the default in order to allow adding other items on the same line. In the future we may refactor the hit system to be front-to-back, allowing natural overlaps and then this can become the default.
    SpanAvailWidth = 1 << 11
    # Extend hit box to the left-most and right-most edges (bypass the indented area).
    SpanFullWidth = 1 << 12
    # (WIP) Nav: left direction may move to this TreeNode() from any of its child (items submitted between TreeNode and TreePop)
    NavLeftJumpsBackHere = 1 << 13
    CollapsingHeader     = Framed | NoTreePushOnOpen | NoAutoOpenOnLog
  end
  alias TopLevel::ImGuiTreeNodeFlags = ImGui::ImGuiTreeNodeFlags

  # [enum ImGuiPopupFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1074)
  @[Flags]
  enum ImGuiPopupFlags
    None = 0
    # For BeginPopupContext*(): open on Left Mouse release. Guaranteed to always be == 0 (same as ImGuiMouseButton_Left)
    MouseButtonLeft = 0
    # For BeginPopupContext*(): open on Right Mouse release. Guaranteed to always be == 1 (same as ImGuiMouseButton_Right)
    MouseButtonRight = 1
    # For BeginPopupContext*(): open on Middle Mouse release. Guaranteed to always be == 2 (same as ImGuiMouseButton_Middle)
    MouseButtonMiddle   =    2
    MouseButtonMask_    = 0x1F
    MouseButtonDefault_ =    1
    # For OpenPopup*(), BeginPopupContext*(): don't open if there's already a popup at the same level of the popup stack
    NoOpenOverExistingPopup = 1 << 5
    # For BeginPopupContextWindow(): don't return true when hovering items, only when hovering empty space
    NoOpenOverItems = 1 << 6
    # For IsPopupOpen(): ignore the ImGuiID parameter and test for any popup.
    AnyPopupId = 1 << 7
    # For IsPopupOpen(): search/test at any level of the popup stack (default test in the current level)
    AnyPopupLevel = 1 << 8
    AnyPopup      = AnyPopupId | AnyPopupLevel
  end
  alias TopLevel::ImGuiPopupFlags = ImGui::ImGuiPopupFlags

  # [enum ImGuiSelectableFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1090)
  @[Flags]
  enum ImGuiSelectableFlags
    None = 0
    # Clicking this doesn't close parent popup window
    DontClosePopups = 1 << 0
    # Selectable frame can span all columns (text will still fit in current column)
    SpanAllColumns = 1 << 1
    # Generate press events on double clicks too
    AllowDoubleClick = 1 << 2
    # Cannot be selected, display grayed out text
    Disabled = 1 << 3
    # (WIP) Hit testing to allow subsequent widgets to overlap this one
    AllowOverlap = 1 << 4
  end
  alias TopLevel::ImGuiSelectableFlags = ImGui::ImGuiSelectableFlags

  # [enum ImGuiComboFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1105)
  @[Flags]
  enum ImGuiComboFlags
    None = 0
    # Align the popup toward the left by default
    PopupAlignLeft = 1 << 0
    # Max ~4 items visible. Tip: If you want your combo popup to be a specific size you can use SetNextWindowSizeConstraints() prior to calling BeginCombo()
    HeightSmall = 1 << 1
    # Max ~8 items visible (default)
    HeightRegular = 1 << 2
    # Max ~20 items visible
    HeightLarge = 1 << 3
    # As many fitting items as possible
    HeightLargest = 1 << 4
    # Display on the preview box without the square arrow button
    NoArrowButton = 1 << 5
    # Display only a square arrow button
    NoPreview   = 1 << 6
    HeightMask_ = HeightSmall | HeightRegular | HeightLarge | HeightLargest
  end
  alias TopLevel::ImGuiComboFlags = ImGui::ImGuiComboFlags

  # [enum ImGuiTabBarFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1119)
  @[Flags]
  enum ImGuiTabBarFlags
    None = 0
    # Allow manually dragging tabs to re-order them + New tabs are appended at the end of list
    Reorderable = 1 << 0
    # Automatically select new tabs when they appear
    AutoSelectNewTabs = 1 << 1
    # Disable buttons to open the tab list popup
    TabListPopupButton = 1 << 2
    # Disable behavior of closing tabs (that are submitted with p_open != NULL) with middle mouse button. You can still repro this behavior on user's side with if (IsItemHovered() && IsMouseClicked(2)) *p_open = false.
    NoCloseWithMiddleMouseButton = 1 << 3
    # Disable scrolling buttons (apply when fitting policy is ImGuiTabBarFlags_FittingPolicyScroll)
    NoTabListScrollingButtons = 1 << 4
    # Disable tooltips when hovering a tab
    NoTooltip = 1 << 5
    # Resize tabs when they don't fit
    FittingPolicyResizeDown = 1 << 6
    # Add scroll buttons when tabs don't fit
    FittingPolicyScroll   = 1 << 7
    FittingPolicyMask_    = FittingPolicyResizeDown | FittingPolicyScroll
    FittingPolicyDefault_ = FittingPolicyResizeDown
  end
  alias TopLevel::ImGuiTabBarFlags = ImGui::ImGuiTabBarFlags

  # [enum ImGuiTabItemFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1135)
  @[Flags]
  enum ImGuiTabItemFlags
    None = 0
    # Display a dot next to the title + tab is selected when clicking the X + closure is not assumed (will wait for user to stop submitting the tab). Otherwise closure is assumed when pressing the X, so if you keep submitting the tab may reappear at end of tab bar.
    UnsavedDocument = 1 << 0
    # Trigger flag to programmatically make the tab selected when calling BeginTabItem()
    SetSelected = 1 << 1
    # Disable behavior of closing tabs (that are submitted with p_open != NULL) with middle mouse button. You can still repro this behavior on user's side with if (IsItemHovered() && IsMouseClicked(2)) *p_open = false.
    NoCloseWithMiddleMouseButton = 1 << 2
    # Don't call PushID(tab->ID)/PopID() on BeginTabItem()/EndTabItem()
    NoPushId = 1 << 3
    # Disable tooltip for the given tab
    NoTooltip = 1 << 4
    # Disable reordering this tab or having another tab cross over this tab
    NoReorder = 1 << 5
    # Enforce the tab position to the left of the tab bar (after the tab list popup button)
    Leading = 1 << 6
    # Enforce the tab position to the right of the tab bar (before the scrolling buttons)
    Trailing = 1 << 7
  end
  alias TopLevel::ImGuiTabItemFlags = ImGui::ImGuiTabItemFlags

  # [enum ImGuiTableFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1170)
  @[Flags]
  enum ImGuiTableFlags
    None = 0
    # Enable resizing columns.
    Resizable = 1 << 0
    # Enable reordering columns in header row (need calling TableSetupColumn() + TableHeadersRow() to display headers)
    Reorderable = 1 << 1
    # Enable hiding/disabling columns in context menu.
    Hideable = 1 << 2
    # Enable sorting. Call TableGetSortSpecs() to obtain sort specs. Also see ImGuiTableFlags_SortMulti and ImGuiTableFlags_SortTristate.
    Sortable = 1 << 3
    # Disable persisting columns order, width and sort settings in the .ini file.
    NoSavedSettings = 1 << 4
    # Right-click on columns body/contents will display table context menu. By default it is available in TableHeadersRow().
    ContextMenuInBody = 1 << 5
    # Set each RowBg color with ImGuiCol_TableRowBg or ImGuiCol_TableRowBgAlt (equivalent of calling TableSetBgColor with ImGuiTableBgFlags_RowBg0 on each row manually)
    RowBg = 1 << 6
    # Draw horizontal borders between rows.
    BordersInnerH = 1 << 7
    # Draw horizontal borders at the top and bottom.
    BordersOuterH = 1 << 8
    # Draw vertical borders between columns.
    BordersInnerV = 1 << 9
    # Draw vertical borders on the left and right sides.
    BordersOuterV = 1 << 10
    # Draw horizontal borders.
    BordersH = BordersInnerH | BordersOuterH
    # Draw vertical borders.
    BordersV = BordersInnerV | BordersOuterV
    # Draw inner borders.
    BordersInner = BordersInnerV | BordersInnerH
    # Draw outer borders.
    BordersOuter = BordersOuterV | BordersOuterH
    # Draw all borders.
    Borders = BordersInner | BordersOuter
    # [ALPHA] Disable vertical borders in columns Body (borders will always appear in Headers). -> May move to style
    NoBordersInBody = 1 << 11
    # [ALPHA] Disable vertical borders in columns Body until hovered for resize (borders will always appear in Headers). -> May move to style
    NoBordersInBodyUntilResize = 1 << 12
    # Columns default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching contents width.
    SizingFixedFit = 1 << 13
    # Columns default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching the maximum contents width of all columns. Implicitly enable ImGuiTableFlags_NoKeepColumnsVisible.
    SizingFixedSame = 2 << 13
    # Columns default to _WidthStretch with default weights proportional to each columns contents widths.
    SizingStretchProp = 3 << 13
    # Columns default to _WidthStretch with default weights all equal, unless overridden by TableSetupColumn().
    SizingStretchSame = 4 << 13
    # Make outer width auto-fit to columns, overriding outer_size.x value. Only available when ScrollX/ScrollY are disabled and Stretch columns are not used.
    NoHostExtendX = 1 << 16
    # Make outer height stop exactly at outer_size.y (prevent auto-extending table past the limit). Only available when ScrollX/ScrollY are disabled. Data below the limit will be clipped and not visible.
    NoHostExtendY = 1 << 17
    # Disable keeping column always minimally visible when ScrollX is off and table gets too small. Not recommended if columns are resizable.
    NoKeepColumnsVisible = 1 << 18
    # Disable distributing remainder width to stretched columns (width allocation on a 100-wide table with 3 columns: Without this flag: 33,33,34. With this flag: 33,33,33). With larger number of columns, resizing will appear to be less smooth.
    PreciseWidths = 1 << 19
    # Disable clipping rectangle for every individual columns (reduce draw command count, items will be able to overflow into other columns). Generally incompatible with TableSetupScrollFreeze().
    NoClip = 1 << 20
    # Default if BordersOuterV is on. Enable outermost padding. Generally desirable if you have headers.
    PadOuterX = 1 << 21
    # Default if BordersOuterV is off. Disable outermost padding.
    NoPadOuterX = 1 << 22
    # Disable inner padding between columns (double inner padding if BordersOuterV is on, single inner padding if BordersOuterV is off).
    NoPadInnerX = 1 << 23
    # Enable horizontal scrolling. Require 'outer_size' parameter of BeginTable() to specify the container size. Changes default sizing policy. Because this creates a child window, ScrollY is currently generally recommended when using ScrollX.
    ScrollX = 1 << 24
    # Enable vertical scrolling. Require 'outer_size' parameter of BeginTable() to specify the container size.
    ScrollY = 1 << 25
    # Hold shift when clicking headers to sort on multiple column. TableGetSortSpecs() may return specs where (SpecsCount > 1).
    SortMulti = 1 << 26
    # Allow no sorting, disable default sorting. TableGetSortSpecs() may return specs where (SpecsCount == 0).
    SortTristate = 1 << 27
    SizingMask_  = SizingFixedFit | SizingFixedSame | SizingStretchProp | SizingStretchSame
  end
  alias TopLevel::ImGuiTableFlags = ImGui::ImGuiTableFlags

  # [enum ImGuiTableColumnFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1221)
  @[Flags]
  enum ImGuiTableColumnFlags
    None = 0
    # Overriding/master disable flag: hide column, won't show in context menu (unlike calling TableSetColumnEnabled() which manipulates the user accessible state)
    Disabled = 1 << 0
    # Default as a hidden/disabled column.
    DefaultHide = 1 << 1
    # Default as a sorting column.
    DefaultSort = 1 << 2
    # Column will stretch. Preferable with horizontal scrolling disabled (default if table sizing policy is _SizingStretchSame or _SizingStretchProp).
    WidthStretch = 1 << 3
    # Column will not stretch. Preferable with horizontal scrolling enabled (default if table sizing policy is _SizingFixedFit and table is resizable).
    WidthFixed = 1 << 4
    # Disable manual resizing.
    NoResize = 1 << 5
    # Disable manual reordering this column, this will also prevent other columns from crossing over this column.
    NoReorder = 1 << 6
    # Disable ability to hide/disable this column.
    NoHide = 1 << 7
    # Disable clipping for this column (all NoClip columns will render in a same draw command).
    NoClip = 1 << 8
    # Disable ability to sort on this field (even if ImGuiTableFlags_Sortable is set on the table).
    NoSort = 1 << 9
    # Disable ability to sort in the ascending direction.
    NoSortAscending = 1 << 10
    # Disable ability to sort in the descending direction.
    NoSortDescending = 1 << 11
    # TableHeadersRow() will not submit label for this column. Convenient for some small columns. Name will still appear in context menu.
    NoHeaderLabel = 1 << 12
    # Disable header text width contribution to automatic column width.
    NoHeaderWidth = 1 << 13
    # Make the initial sort direction Ascending when first sorting on this column (default).
    PreferSortAscending = 1 << 14
    # Make the initial sort direction Descending when first sorting on this column.
    PreferSortDescending = 1 << 15
    # Use current Indent value when entering cell (default for column 0).
    IndentEnable = 1 << 16
    # Ignore current Indent value when entering cell (default for columns > 0). Indentation changes _within_ the cell will still be honored.
    IndentDisable = 1 << 17
    # Status: is enabled == not hidden by user/api (referred to as "Hide" in _DefaultHide and _NoHide) flags.
    IsEnabled = 1 << 24
    # Status: is visible == is enabled AND not clipped by scrolling.
    IsVisible = 1 << 25
    # Status: is currently part of the sort specs
    IsSorted = 1 << 26
    # Status: is hovered by mouse
    IsHovered   = 1 << 27
    WidthMask_  = WidthStretch | WidthFixed
    IndentMask_ = IndentEnable | IndentDisable
    StatusMask_ = IsEnabled | IsVisible | IsSorted | IsHovered
    # [Internal] Disable user resizing this column directly (it may however we resized indirectly from its left edge)
    NoDirectResize_ = 1 << 30
  end
  alias TopLevel::ImGuiTableColumnFlags = ImGui::ImGuiTableColumnFlags

  # [enum ImGuiTableRowFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1258)
  @[Flags]
  enum ImGuiTableRowFlags
    None = 0
    # Identify header row (set default background color + width of its contents accounted differently for auto column width)
    Headers = 1 << 0
  end
  alias TopLevel::ImGuiTableRowFlags = ImGui::ImGuiTableRowFlags

  # [enum ImGuiTableBgTarget_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1273)
  enum ImGuiTableBgTarget
    None = 0
    # Set row background color 0 (generally used for background, automatically set when ImGuiTableFlags_RowBg is used)
    RowBg0 = 1
    # Set row background color 1 (generally used for selection marking)
    RowBg1 = 2
    # Set cell background color (top-most color)
    CellBg = 3
  end
  alias TopLevel::ImGuiTableBgTarget = ImGui::ImGuiTableBgTarget

  # [enum ImGuiFocusedFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1282)
  @[Flags]
  enum ImGuiFocusedFlags
    None = 0
    # Return true if any children of the window is focused
    ChildWindows = 1 << 0
    # Test from root window (top most parent of the current hierarchy)
    RootWindow = 1 << 1
    # Return true if any window is focused. Important: If you are trying to tell how to dispatch your low-level inputs, do NOT use this. Use 'io.WantCaptureMouse' instead! Please read the FAQ!
    AnyWindow = 1 << 2
    # Do not consider popup hierarchy (do not treat popup emitter as parent of popup) (when used with _ChildWindows or _RootWindow)
    NoPopupHierarchy    = 1 << 3
    RootAndChildWindows = RootWindow | ChildWindows
  end
  alias TopLevel::ImGuiFocusedFlags = ImGui::ImGuiFocusedFlags

  # [enum ImGuiHoveredFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1296)
  @[Flags]
  enum ImGuiHoveredFlags
    # Return true if directly over the item/window, not obstructed by another window, not obstructed by an active popup or modal blocking inputs under them.
    None = 0
    # IsWindowHovered() only: Return true if any children of the window is hovered
    ChildWindows = 1 << 0
    # IsWindowHovered() only: Test from root window (top most parent of the current hierarchy)
    RootWindow = 1 << 1
    # IsWindowHovered() only: Return true if any window is hovered
    AnyWindow = 1 << 2
    # IsWindowHovered() only: Do not consider popup hierarchy (do not treat popup emitter as parent of popup) (when used with _ChildWindows or _RootWindow)
    NoPopupHierarchy = 1 << 3
    # Return true even if a popup window is normally blocking access to this item/window
    AllowWhenBlockedByPopup = 1 << 5
    # Return true even if an active item is blocking access to this item/window. Useful for Drag and Drop patterns.
    AllowWhenBlockedByActiveItem = 1 << 7
    # IsItemHovered() only: Return true even if the item uses AllowOverlap mode and is overlapped by another hoverable item.
    AllowWhenOverlappedByItem = 1 << 8
    # IsItemHovered() only: Return true even if the position is obstructed or overlapped by another window.
    AllowWhenOverlappedByWindow = 1 << 9
    # IsItemHovered() only: Return true even if the item is disabled
    AllowWhenDisabled = 1 << 10
    # IsItemHovered() only: Disable using gamepad/keyboard navigation state when active, always query mouse
    NoNavOverride       = 1 << 11
    AllowWhenOverlapped = AllowWhenOverlappedByItem | AllowWhenOverlappedByWindow
    RectOnly            = AllowWhenBlockedByPopup | AllowWhenBlockedByActiveItem | AllowWhenOverlapped
    RootAndChildWindows = RootWindow | ChildWindows
    # Shortcut for standard flags when using IsItemHovered() + SetTooltip() sequence.
    ForTooltip = 1 << 12
    # Require mouse to be stationary for style.HoverStationaryDelay (~0.15 sec) _at least one time_. After this, can move on same item/window. Using the stationary test tends to reduces the need for a long delay.
    Stationary = 1 << 13
    # IsItemHovered() only: Return true immediately (default). As this is the default you generally ignore this.
    DelayNone = 1 << 14
    # IsItemHovered() only: Return true after style.HoverDelayShort elapsed (~0.15 sec) (shared between items) + requires mouse to be stationary for style.HoverStationaryDelay (once per item).
    DelayShort = 1 << 15
    # IsItemHovered() only: Return true after style.HoverDelayNormal elapsed (~0.40 sec) (shared between items) + requires mouse to be stationary for style.HoverStationaryDelay (once per item).
    DelayNormal = 1 << 16
    # IsItemHovered() only: Disable shared delay system where moving from one item to the next keeps the previous timer for a short time (standard for tooltips with long delays)
    NoSharedDelay = 1 << 17
  end
  alias TopLevel::ImGuiHoveredFlags = ImGui::ImGuiHoveredFlags

  # [enum ImGuiDragDropFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1334)
  @[Flags]
  enum ImGuiDragDropFlags
    None = 0
    # Disable preview tooltip. By default, a successful call to BeginDragDropSource opens a tooltip so you can display a preview or description of the source contents. This flag disables this behavior.
    SourceNoPreviewTooltip = 1 << 0
    # By default, when dragging we clear data so that IsItemHovered() will return false, to avoid subsequent user code submitting tooltips. This flag disables this behavior so you can still call IsItemHovered() on the source item.
    SourceNoDisableHover = 1 << 1
    # Disable the behavior that allows to open tree nodes and collapsing header by holding over them while dragging a source item.
    SourceNoHoldToOpenOthers = 1 << 2
    # Allow items such as Text(), Image() that have no unique identifier to be used as drag source, by manufacturing a temporary identifier based on their window-relative position. This is extremely unusual within the dear imgui ecosystem and so we made it explicit.
    SourceAllowNullID = 1 << 3
    # External source (from outside of dear imgui), won't attempt to read current item/window info. Will always return true. Only one Extern source can be active simultaneously.
    SourceExtern = 1 << 4
    # Automatically expire the payload if the source cease to be submitted (otherwise payloads are persisting while being dragged)
    SourceAutoExpirePayload = 1 << 5
    # AcceptDragDropPayload() will returns true even before the mouse button is released. You can then call IsDelivery() to test if the payload needs to be delivered.
    AcceptBeforeDelivery = 1 << 10
    # Do not draw the default highlight rectangle when hovering over target.
    AcceptNoDrawDefaultRect = 1 << 11
    # Request hiding the BeginDragDropSource tooltip from the BeginDragDropTarget site.
    AcceptNoPreviewTooltip = 1 << 12
    # For peeking ahead and inspecting the payload before delivery.
    AcceptPeekOnly = AcceptBeforeDelivery | AcceptNoDrawDefaultRect
  end
  alias TopLevel::ImGuiDragDropFlags = ImGui::ImGuiDragDropFlags

  # [enum ImGuiDataType_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1356)
  enum ImGuiDataType
    # signed char / char (with sensible compilers)
    S8 = 0
    # unsigned char
    U8 = 1
    # short
    S16 = 2
    # unsigned short
    U16 = 3
    # int
    S32 = 4
    # unsigned int
    U32 = 5
    # long long / __int64
    S64 = 6
    # unsigned long long / unsigned __int64
    U64 = 7
    # float
    Float = 8
    # double
    Double = 9
  end
  alias TopLevel::ImGuiDataType = ImGui::ImGuiDataType

  # [enum ImGuiDir_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1372)
  enum ImGuiDir
    None  = -1
    Left  =  0
    Right =  1
    Up    =  2
    Down  =  3
  end
  alias TopLevel::ImGuiDir = ImGui::ImGuiDir

  # [enum ImGuiSortDirection_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1383)
  enum ImGuiSortDirection
    None = 0
    # Ascending = 0->9, A->Z etc.
    Ascending = 1
    # Descending = 9->0, Z->A etc.
    Descending = 2
  end
  alias TopLevel::ImGuiSortDirection = ImGui::ImGuiSortDirection

  # [enum ImGuiKey](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1395)
  enum ImGuiKey
    None = 0
    # == ImGuiKey_NamedKey_BEGIN
    Tab        = 512
    LeftArrow  = 513
    RightArrow = 514
    UpArrow    = 515
    DownArrow  = 516
    PageUp     = 517
    PageDown   = 518
    Home       = 519
    End        = 520
    Insert     = 521
    Delete     = 522
    Backspace  = 523
    Space      = 524
    Enter      = 525
    Escape     = 526
    LeftCtrl   = 527
    LeftShift  = 528
    LeftAlt    = 529
    LeftSuper  = 530
    RightCtrl  = 531
    RightShift = 532
    RightAlt   = 533
    RightSuper = 534
    Menu       = 535
    Num0       = 536
    Num1       = 537
    Num2       = 538
    Num3       = 539
    Num4       = 540
    Num5       = 541
    Num6       = 542
    Num7       = 543
    Num8       = 544
    Num9       = 545
    A          = 546
    B          = 547
    C          = 548
    D          = 549
    E          = 550
    F          = 551
    G          = 552
    H          = 553
    I          = 554
    J          = 555
    K          = 556
    L          = 557
    M          = 558
    N          = 559
    O          = 560
    P          = 561
    Q          = 562
    R          = 563
    S          = 564
    T          = 565
    U          = 566
    V          = 567
    W          = 568
    X          = 569
    Y          = 570
    Z          = 571
    F1         = 572
    F2         = 573
    F3         = 574
    F4         = 575
    F5         = 576
    F6         = 577
    F7         = 578
    F8         = 579
    F9         = 580
    F10        = 581
    F11        = 582
    F12        = 583
    # '
    Apostrophe = 584
    # ,
    Comma = 585
    # -
    Minus = 586
    # .
    Period = 587
    # /
    Slash = 588
    # ;
    Semicolon = 589
    # =
    Equal = 590
    # [
    LeftBracket = 591
    # \ (this text inhibit multiline comment caused by backslash)
    Backslash = 592
    # ]
    RightBracket = 593
    # `
    GraveAccent    = 594
    CapsLock       = 595
    ScrollLock     = 596
    NumLock        = 597
    PrintScreen    = 598
    Pause          = 599
    Keypad0        = 600
    Keypad1        = 601
    Keypad2        = 602
    Keypad3        = 603
    Keypad4        = 604
    Keypad5        = 605
    Keypad6        = 606
    Keypad7        = 607
    Keypad8        = 608
    Keypad9        = 609
    KeypadDecimal  = 610
    KeypadDivide   = 611
    KeypadMultiply = 612
    KeypadSubtract = 613
    KeypadAdd      = 614
    KeypadEnter    = 615
    KeypadEqual    = 616
    # Menu (Xbox)      + (Switch)   Start/Options (PS)
    GamepadStart = 617
    # View (Xbox)      - (Switch)   Share (PS)
    GamepadBack = 618
    # X (Xbox)         Y (Switch)   Square (PS)
    # Tap: Toggle Menu. Hold: Windowing mode (Focus/Move/Resize windows)
    GamepadFaceLeft = 619
    # B (Xbox)         A (Switch)   Circle (PS)
    # Cancel / Close / Exit
    GamepadFaceRight = 620
    # Y (Xbox)         X (Switch)   Triangle (PS)
    # Text Input / On-screen Keyboard
    GamepadFaceUp = 621
    # A (Xbox)         B (Switch)   Cross (PS)
    # Activate / Open / Toggle / Tweak
    GamepadFaceDown = 622
    # D-pad Left
    # Move / Tweak / Resize Window (in Windowing mode)
    GamepadDpadLeft = 623
    # D-pad Right
    # Move / Tweak / Resize Window (in Windowing mode)
    GamepadDpadRight = 624
    # D-pad Up
    # Move / Tweak / Resize Window (in Windowing mode)
    GamepadDpadUp = 625
    # D-pad Down
    # Move / Tweak / Resize Window (in Windowing mode)
    GamepadDpadDown = 626
    # L Bumper (Xbox)  L (Switch)   L1 (PS)
    # Tweak Slower / Focus Previous (in Windowing mode)
    GamepadL1 = 627
    # R Bumper (Xbox)  R (Switch)   R1 (PS)
    # Tweak Faster / Focus Next (in Windowing mode)
    GamepadR1 = 628
    # L Trig. (Xbox)   ZL (Switch)  L2 (PS) [Analog]
    GamepadL2 = 629
    # R Trig. (Xbox)   ZR (Switch)  R2 (PS) [Analog]
    GamepadR2 = 630
    # L Stick (Xbox)   L3 (Switch)  L3 (PS)
    GamepadL3 = 631
    # R Stick (Xbox)   R3 (Switch)  R3 (PS)
    GamepadR3 = 632
    # [Analog]
    # Move Window (in Windowing mode)
    GamepadLStickLeft = 633
    # [Analog]
    # Move Window (in Windowing mode)
    GamepadLStickRight = 634
    # [Analog]
    # Move Window (in Windowing mode)
    GamepadLStickUp = 635
    # [Analog]
    # Move Window (in Windowing mode)
    GamepadLStickDown = 636
    # [Analog]
    GamepadRStickLeft = 637
    # [Analog]
    GamepadRStickRight = 638
    # [Analog]
    GamepadRStickUp = 639
    # [Analog]
    GamepadRStickDown   = 640
    MouseLeft           = 641
    MouseRight          = 642
    MouseMiddle         = 643
    MouseX1             = 644
    MouseX2             = 645
    MouseWheelX         = 646
    MouseWheelY         = 647
    ReservedForModCtrl  = 648
    ReservedForModShift = 649
    ReservedForModAlt   = 650
    ReservedForModSuper = 651
    COUNT               = 652
    Mod_None            =   0
    # Ctrl
    Mod_Ctrl = 1 << 12
    # Shift
    Mod_Shift = 1 << 13
    # Option/Menu
    Mod_Alt = 1 << 14
    # Cmd/Super/Windows
    Mod_Super = 1 << 15
    # Alias for Ctrl (non-macOS) _or_ Super (macOS).
    Mod_Shortcut = 1 << 11
    # 5-bits
    Mod_Mask_ = 0xF800
  end
  alias TopLevel::ImGuiKey = ImGui::ImGuiKey

  # [enum ImGuiNavInput](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1524)
  enum ImGuiNavInput
    Activate    =  0
    Cancel      =  1
    Input       =  2
    Menu        =  3
    DpadLeft    =  4
    DpadRight   =  5
    DpadUp      =  6
    DpadDown    =  7
    LStickLeft  =  8
    LStickRight =  9
    LStickUp    = 10
    LStickDown  = 11
    FocusPrev   = 12
    FocusNext   = 13
    TweakSlow   = 14
    TweakFast   = 15
  end
  alias TopLevel::ImGuiNavInput = ImGui::ImGuiNavInput

  # [enum ImGuiConfigFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1533)
  @[Flags]
  enum ImGuiConfigFlags
    None = 0
    # Master keyboard navigation enable flag. Enable full Tabbing + directional arrows + space/enter to activate.
    NavEnableKeyboard = 1 << 0
    # Master gamepad navigation enable flag. Backend also needs to set ImGuiBackendFlags_HasGamepad.
    NavEnableGamepad = 1 << 1
    # Instruct navigation to move the mouse cursor. May be useful on TV/console systems where moving a virtual mouse is awkward. Will update io.MousePos and set io.WantSetMousePos=true. If enabled you MUST honor io.WantSetMousePos requests in your backend, otherwise ImGui will react as if the mouse is jumping around back and forth.
    NavEnableSetMousePos = 1 << 2
    # Instruct navigation to not set the io.WantCaptureKeyboard flag when io.NavActive is set.
    NavNoCaptureKeyboard = 1 << 3
    # Instruct imgui to clear mouse position/buttons in NewFrame(). This allows ignoring the mouse information set by the backend.
    NoMouse = 1 << 4
    # Instruct backend to not alter mouse cursor shape and visibility. Use if the backend cursor changes are interfering with yours and you don't want to use SetMouseCursor() to change mouse cursor. You may want to honor requests from imgui by reading GetMouseCursor() yourself instead.
    NoMouseCursorChange = 1 << 5
    # Application is SRGB-aware.
    IsSRGB = 1 << 20
    # Application is using a touch screen instead of a mouse.
    IsTouchScreen = 1 << 21
  end
  alias TopLevel::ImGuiConfigFlags = ImGui::ImGuiConfigFlags

  # [enum ImGuiBackendFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1549)
  @[Flags]
  enum ImGuiBackendFlags
    None = 0
    # Backend Platform supports gamepad and currently has one connected.
    HasGamepad = 1 << 0
    # Backend Platform supports honoring GetMouseCursor() value to change the OS cursor shape.
    HasMouseCursors = 1 << 1
    # Backend Platform supports io.WantSetMousePos requests to reposition the OS mouse position (only used if ImGuiConfigFlags_NavEnableSetMousePos is set).
    HasSetMousePos = 1 << 2
    # Backend Renderer supports ImDrawCmd::VtxOffset. This enables output of large meshes (64K+ vertices) while still using 16-bit indices.
    RendererHasVtxOffset = 1 << 3
  end
  alias TopLevel::ImGuiBackendFlags = ImGui::ImGuiBackendFlags

  # [enum ImGuiCol_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1559)
  enum ImGuiCol
    Text         = 0
    TextDisabled = 1
    # Background of normal windows
    WindowBg = 2
    # Background of child windows
    ChildBg = 3
    # Background of popups, menus, tooltips windows
    PopupBg      = 4
    Border       = 5
    BorderShadow = 6
    # Background of checkbox, radio button, plot, slider, text input
    FrameBg              =  7
    FrameBgHovered       =  8
    FrameBgActive        =  9
    TitleBg              = 10
    TitleBgActive        = 11
    TitleBgCollapsed     = 12
    MenuBarBg            = 13
    ScrollbarBg          = 14
    ScrollbarGrab        = 15
    ScrollbarGrabHovered = 16
    ScrollbarGrabActive  = 17
    CheckMark            = 18
    SliderGrab           = 19
    SliderGrabActive     = 20
    Button               = 21
    ButtonHovered        = 22
    ButtonActive         = 23
    # Header* colors are used for CollapsingHeader, TreeNode, Selectable, MenuItem
    Header           = 24
    HeaderHovered    = 25
    HeaderActive     = 26
    Separator        = 27
    SeparatorHovered = 28
    SeparatorActive  = 29
    # Resize grip in lower-right and lower-left corners of windows.
    ResizeGrip        = 30
    ResizeGripHovered = 31
    ResizeGripActive  = 32
    # TabItem in a TabBar
    Tab                  = 33
    TabHovered           = 34
    TabActive            = 35
    TabUnfocused         = 36
    TabUnfocusedActive   = 37
    PlotLines            = 38
    PlotLinesHovered     = 39
    PlotHistogram        = 40
    PlotHistogramHovered = 41
    # Table header background
    TableHeaderBg = 42
    # Table outer and header borders (prefer using Alpha=1.0 here)
    TableBorderStrong = 43
    # Table inner borders (prefer using Alpha=1.0 here)
    TableBorderLight = 44
    # Table row background (even rows)
    TableRowBg = 45
    # Table row background (odd rows)
    TableRowBgAlt  = 46
    TextSelectedBg = 47
    # Rectangle highlighting a drop target
    DragDropTarget = 48
    # Gamepad/keyboard: current highlighted item
    NavHighlight = 49
    # Highlight window when using CTRL+TAB
    NavWindowingHighlight = 50
    # Darken/colorize entire screen behind the CTRL+TAB window list, when active
    NavWindowingDimBg = 51
    # Darken/colorize entire screen behind a modal window, when one is active
    ModalWindowDimBg = 52
  end
  alias TopLevel::ImGuiCol = ImGui::ImGuiCol

  # [enum ImGuiStyleVar_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1624)
  enum ImGuiStyleVar
    # float     Alpha
    Alpha = 0
    # float     DisabledAlpha
    DisabledAlpha = 1
    # ImVec2    WindowPadding
    WindowPadding = 2
    # float     WindowRounding
    WindowRounding = 3
    # float     WindowBorderSize
    WindowBorderSize = 4
    # ImVec2    WindowMinSize
    WindowMinSize = 5
    # ImVec2    WindowTitleAlign
    WindowTitleAlign = 6
    # float     ChildRounding
    ChildRounding = 7
    # float     ChildBorderSize
    ChildBorderSize = 8
    # float     PopupRounding
    PopupRounding = 9
    # float     PopupBorderSize
    PopupBorderSize = 10
    # ImVec2    FramePadding
    FramePadding = 11
    # float     FrameRounding
    FrameRounding = 12
    # float     FrameBorderSize
    FrameBorderSize = 13
    # ImVec2    ItemSpacing
    ItemSpacing = 14
    # ImVec2    ItemInnerSpacing
    ItemInnerSpacing = 15
    # float     IndentSpacing
    IndentSpacing = 16
    # ImVec2    CellPadding
    CellPadding = 17
    # float     ScrollbarSize
    ScrollbarSize = 18
    # float     ScrollbarRounding
    ScrollbarRounding = 19
    # float     GrabMinSize
    GrabMinSize = 20
    # float     GrabRounding
    GrabRounding = 21
    # float     TabRounding
    TabRounding = 22
    # ImVec2    ButtonTextAlign
    ButtonTextAlign = 23
    # ImVec2    SelectableTextAlign
    SelectableTextAlign = 24
    # float  SeparatorTextBorderSize
    SeparatorTextBorderSize = 25
    # ImVec2    SeparatorTextAlign
    SeparatorTextAlign = 26
    # ImVec2    SeparatorTextPadding
    SeparatorTextPadding = 27
  end
  alias TopLevel::ImGuiStyleVar = ImGui::ImGuiStyleVar

  # [enum ImGuiButtonFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1659)
  @[Flags]
  enum ImGuiButtonFlags
    None = 0
    # React on left mouse button (default)
    MouseButtonLeft = 1 << 0
    # React on right mouse button
    MouseButtonRight = 1 << 1
    # React on center mouse button
    MouseButtonMiddle   = 1 << 2
    MouseButtonMask_    = MouseButtonLeft | MouseButtonRight | MouseButtonMiddle
    MouseButtonDefault_ = MouseButtonLeft
  end
  alias TopLevel::ImGuiButtonFlags = ImGui::ImGuiButtonFlags

  # [enum ImGuiColorEditFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1672)
  @[Flags]
  enum ImGuiColorEditFlags
    None = 0
    # ColorEdit, ColorPicker, ColorButton: ignore Alpha component (will only read 3 components from the input pointer).
    NoAlpha = 1 << 1
    # ColorEdit: disable picker when clicking on color square.
    NoPicker = 1 << 2
    # ColorEdit: disable toggling options menu when right-clicking on inputs/small preview.
    NoOptions = 1 << 3
    # ColorEdit, ColorPicker: disable color square preview next to the inputs. (e.g. to show only the inputs)
    NoSmallPreview = 1 << 4
    # ColorEdit, ColorPicker: disable inputs sliders/text widgets (e.g. to show only the small preview color square).
    NoInputs = 1 << 5
    # ColorEdit, ColorPicker, ColorButton: disable tooltip when hovering the preview.
    NoTooltip = 1 << 6
    # ColorEdit, ColorPicker: disable display of inline text label (the label is still forwarded to the tooltip and picker).
    NoLabel = 1 << 7
    # ColorPicker: disable bigger color preview on right side of the picker, use small color square preview instead.
    NoSidePreview = 1 << 8
    # ColorEdit: disable drag and drop target. ColorButton: disable drag and drop source.
    NoDragDrop = 1 << 9
    # ColorButton: disable border (which is enforced by default)
    NoBorder = 1 << 10
    # ColorEdit, ColorPicker: show vertical alpha bar/gradient in picker.
    AlphaBar = 1 << 16
    # ColorEdit, ColorPicker, ColorButton: display preview as a transparent color over a checkerboard, instead of opaque.
    AlphaPreview = 1 << 17
    # ColorEdit, ColorPicker, ColorButton: display half opaque / half checkerboard, instead of opaque.
    AlphaPreviewHalf = 1 << 18
    # (WIP) ColorEdit: Currently only disable 0.0f..1.0f limits in RGBA edition (note: you probably want to use ImGuiColorEditFlags_Float flag as well).
    HDR = 1 << 19
    # [Display]
    # ColorEdit: override _display_ type among RGB/HSV/Hex. ColorPicker: select any combination using one or more of RGB/HSV/Hex.
    DisplayRGB = 1 << 20
    # [Display]
    # "
    DisplayHSV = 1 << 21
    # [Display]
    # "
    DisplayHex = 1 << 22
    # [DataType]
    # ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0..255.
    Uint8 = 1 << 23
    # [DataType]
    # ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0.0f..1.0f floats instead of 0..255 integers. No round-trip of value via integers.
    Float = 1 << 24
    # [Picker]
    # ColorPicker: bar for Hue, rectangle for Sat/Value.
    PickerHueBar = 1 << 25
    # [Picker]
    # ColorPicker: wheel for Hue, triangle for Sat/Value.
    PickerHueWheel = 1 << 26
    # [Input]
    # ColorEdit, ColorPicker: input and output data in RGB format.
    InputRGB = 1 << 27
    # [Input]
    # ColorEdit, ColorPicker: input and output data in HSV format.
    InputHSV        = 1 << 28
    DefaultOptions_ = Uint8 | DisplayRGB | InputRGB | PickerHueBar
    DisplayMask_    = DisplayRGB | DisplayHSV | DisplayHex
    DataTypeMask_   = Uint8 | Float
    PickerMask_     = PickerHueWheel | PickerHueBar
    InputMask_      = InputRGB | InputHSV
  end
  alias TopLevel::ImGuiColorEditFlags = ImGui::ImGuiColorEditFlags

  # [enum ImGuiSliderFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1718)
  @[Flags]
  enum ImGuiSliderFlags
    None = 0
    # Clamp value to min/max bounds when input manually with CTRL+Click. By default CTRL+Click allows going out of bounds.
    AlwaysClamp = 1 << 4
    # Make the widget logarithmic (linear otherwise). Consider using ImGuiSliderFlags_NoRoundToFormat with this if using a format-string with small amount of digits.
    Logarithmic = 1 << 5
    # Disable rounding underlying value to match precision of the display format string (e.g. %.3f values are rounded to those 3 digits)
    NoRoundToFormat = 1 << 6
    # Disable CTRL+Click or Enter key allowing to input text directly into the widget
    NoInput = 1 << 7
    # [Internal] We treat using those bits as being potentially a 'float power' argument from the previous API that has got miscast to this enum, and will trigger an assert if needed.
    InvalidMask_ = 0x7000000F
  end
  alias TopLevel::ImGuiSliderFlags = ImGui::ImGuiSliderFlags

  # [enum ImGuiMouseButton_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1733)
  enum ImGuiMouseButton
    Left   = 0
    Right  = 1
    Middle = 2
  end
  alias TopLevel::ImGuiMouseButton = ImGui::ImGuiMouseButton

  # [enum ImGuiMouseCursor_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1743)
  enum ImGuiMouseCursor
    None  = -1
    Arrow =  0
    # When hovering over InputText, etc.
    TextInput = 1
    # (Unused by Dear ImGui functions)
    ResizeAll = 2
    # When hovering over a horizontal border
    ResizeNS = 3
    # When hovering over a vertical border or a column
    ResizeEW = 4
    # When hovering over the bottom-left corner of a window
    ResizeNESW = 5
    # When hovering over the bottom-right corner of a window
    ResizeNWSE = 6
    # (Unused by Dear ImGui functions. Use for e.g. hyperlinks)
    Hand = 7
    # When hovering something with disallowed interaction. Usually a crossed circle.
    NotAllowed = 8
  end
  alias TopLevel::ImGuiMouseCursor = ImGui::ImGuiMouseCursor

  # [enum ImGuiMouseSource](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1762)
  enum ImGuiMouseSource
    # Input is coming from an actual mouse.
    Mouse = 0
    # Input is coming from a touch screen (no hovering prior to initial press, less precise initial press aiming, dual-axis wheeling possible).
    TouchScreen = 1
    # Input is coming from a pressure/magnetic pen (often used in conjunction with high-sampling rates).
    Pen = 2
  end
  alias TopLevel::ImGuiMouseSource = ImGui::ImGuiMouseSource

  # [enum ImGuiCond_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L1773)
  enum ImGuiCond
    # No condition (always set the variable), same as _Always
    None = 0
    # No condition (always set the variable), same as _None
    Always = 1 << 0
    # Set the variable once per runtime session (only the first call will succeed)
    Once = 1 << 1
    # Set the variable if the object/window has no persistently saved data (no entry in .ini file)
    FirstUseEver = 1 << 2
    # Set the variable if the object/window is appearing after being hidden/inactive (or the first time)
    Appearing = 1 << 3
  end
  alias TopLevel::ImGuiCond = ImGui::ImGuiCond

  @[Extern]
  struct ImVector
  end

  alias TopLevel::ImVector = ImGui::ImVector

  @[Extern]
  struct ImGuiOnceUponAFrame
    property ref_frame : Int32

    def initialize(@ref_frame : Int32)
    end
  end

  alias TopLevel::ImGuiOnceUponAFrame = ImGui::ImGuiOnceUponAFrame

  @[Extern]
  struct ImGuiStorage
    property data : LibImGui::ImVectorInternal

    def initialize(@data : LibImGui::ImVectorInternal)
    end
  end

  alias TopLevel::ImGuiStorage = ImGui::ImGuiStorage

  @[Extern]
  struct ImGuiListClipper
    property ctx : LibImGui::ImGuiContext*
    property display_start : Int32
    property display_end : Int32
    property items_count : Int32
    property items_height : Float32
    property start_pos_y : Float32
    property temp_data : Void*

    def initialize(@ctx : LibImGui::ImGuiContext*, @display_start : Int32, @display_end : Int32, @items_count : Int32, @items_height : Float32, @start_pos_y : Float32, @temp_data : Void*)
    end
  end

  alias TopLevel::ImGuiListClipper = ImGui::ImGuiListClipper

  @[Extern]
  struct ImColor
    property value : ImVec4

    def initialize(@value : ImVec4)
    end
  end

  alias TopLevel::ImColor = ImGui::ImColor

  @[Extern]
  struct ImDrawVert
    property pos : ImVec2
    property uv : ImVec2
    property col : UInt32

    def initialize(@pos : ImVec2, @uv : ImVec2, @col : UInt32)
    end
  end

  alias TopLevel::ImDrawVert = ImGui::ImDrawVert

  @[Extern]
  struct ImDrawChannel
    @_cmd_buffer : LibImGui::ImVectorInternal
    @_idx_buffer : LibImGui::ImVectorInternal

    def initialize(@_cmd_buffer : LibImGui::ImVectorInternal, @_idx_buffer : LibImGui::ImVectorInternal)
    end
  end

  alias TopLevel::ImDrawChannel = ImGui::ImDrawChannel

  # [enum ImDrawFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L2583)
  @[Flags]
  enum ImDrawFlags
    None = 0
    # PathStroke(), AddPolyline(): specify that shape should be closed (Important: this is always == 1 for legacy reason)
    Closed = 1 << 0
    # AddRect(), AddRectFilled(), PathRect(): enable rounding top-left corner only (when rounding > 0.0f, we default to all corners). Was 0x01.
    RoundCornersTopLeft = 1 << 4
    # AddRect(), AddRectFilled(), PathRect(): enable rounding top-right corner only (when rounding > 0.0f, we default to all corners). Was 0x02.
    RoundCornersTopRight = 1 << 5
    # AddRect(), AddRectFilled(), PathRect(): enable rounding bottom-left corner only (when rounding > 0.0f, we default to all corners). Was 0x04.
    RoundCornersBottomLeft = 1 << 6
    # AddRect(), AddRectFilled(), PathRect(): enable rounding bottom-right corner only (when rounding > 0.0f, we default to all corners). Wax 0x08.
    RoundCornersBottomRight = 1 << 7
    # AddRect(), AddRectFilled(), PathRect(): disable rounding on all corners (when rounding > 0.0f). This is NOT zero, NOT an implicit flag!
    RoundCornersNone   = 1 << 8
    RoundCornersTop    = RoundCornersTopLeft | RoundCornersTopRight
    RoundCornersBottom = RoundCornersBottomLeft | RoundCornersBottomRight
    RoundCornersLeft   = RoundCornersBottomLeft | RoundCornersTopLeft
    RoundCornersRight  = RoundCornersBottomRight | RoundCornersTopRight
    RoundCornersAll    = RoundCornersTopLeft | RoundCornersTopRight | RoundCornersBottomLeft | RoundCornersBottomRight
    # Default to ALL corners if none of the _RoundCornersXX flags are specified.
    RoundCornersDefault_ = RoundCornersAll
    RoundCornersMask_    = RoundCornersAll | RoundCornersNone
  end
  alias TopLevel::ImDrawFlags = ImGui::ImDrawFlags

  # [enum ImDrawListFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L2603)
  @[Flags]
  enum ImDrawListFlags
    None = 0
    # Enable anti-aliased lines/borders (*2 the number of triangles for 1.0f wide line or lines thin enough to be drawn using textures, otherwise *3 the number of triangles)
    AntiAliasedLines = 1 << 0
    # Enable anti-aliased lines/borders using textures when possible. Require backend to render with bilinear filtering (NOT point/nearest filtering).
    AntiAliasedLinesUseTex = 1 << 1
    # Enable anti-aliased edge around filled shapes (rounded rectangles, circles).
    AntiAliasedFill = 1 << 2
    # Can emit 'VtxOffset > 0' to allow large meshes. Set when 'ImGuiBackendFlags_RendererHasVtxOffset' is enabled.
    AllowVtxOffset = 1 << 3
  end
  alias TopLevel::ImDrawListFlags = ImGui::ImDrawListFlags

  @[Extern]
  struct ImFontGlyph
    property colored : UInt32
    property visible : UInt32
    property codepoint : UInt32
    property advance_x : Float32
    property x0 : Float32
    property y0 : Float32
    property x1 : Float32
    property y1 : Float32
    property u0 : Float32
    property v0 : Float32
    property u1 : Float32
    property v1 : Float32

    def initialize(@colored : UInt32, @visible : UInt32, @codepoint : UInt32, @advance_x : Float32, @x0 : Float32, @y0 : Float32, @x1 : Float32, @y1 : Float32, @u0 : Float32, @v0 : Float32, @u1 : Float32, @v1 : Float32)
    end
  end

  alias TopLevel::ImFontGlyph = ImGui::ImFontGlyph

  @[Extern]
  struct ImFontGlyphRangesBuilder
    property used_chars : LibImGui::ImVectorInternal

    def initialize(@used_chars : LibImGui::ImVectorInternal)
    end
  end

  alias TopLevel::ImFontGlyphRangesBuilder = ImGui::ImFontGlyphRangesBuilder

  # [enum ImFontAtlasFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L2841)
  @[Flags]
  enum ImFontAtlasFlags
    None = 0
    # Don't round the height to next power of two
    NoPowerOfTwoHeight = 1 << 0
    # Don't build software mouse cursors into the atlas (save a little texture memory)
    NoMouseCursors = 1 << 1
    # Don't build thick line textures into the atlas (save a little texture memory, allow support for point/nearest filtering). The AntiAliasedLinesUseTex features uses them, otherwise they will be rendered using polygons (more expensive for CPU/GPU).
    NoBakedLines = 1 << 2
  end
  alias TopLevel::ImFontAtlasFlags = ImGui::ImFontAtlasFlags

  # [enum ImGuiViewportFlags_](https://github.com/ocornut/imgui/blob/v1.89.8/imgui.h#L3028)
  @[Flags]
  enum ImGuiViewportFlags
    None = 0
    # Represent a Platform Window
    IsPlatformWindow = 1 << 0
    # Represent a Platform Monitor (unused yet)
    IsPlatformMonitor = 1 << 1
    # Platform Window: is created/managed by the application (rather than a dear imgui backend)
    OwnedByApp = 1 << 2
  end
  alias TopLevel::ImGuiViewportFlags = ImGui::ImGuiViewportFlags

  # :nodoc:
  @[Flags]
  enum ImGuiItemFlags
    None                     = 0
    NoTabStop                = 1 << 0
    ButtonRepeat             = 1 << 1
    Disabled                 = 1 << 2
    NoNav                    = 1 << 3
    NoNavDefaultFocus        = 1 << 4
    SelectableDontClosePopup = 1 << 5
    MixedValue               = 1 << 6
    ReadOnly                 = 1 << 7
    NoWindowHoverableCheck   = 1 << 8
    Itemflags_AllowOverlap   = 1 << 9
    Inputable                = 1 << 10
  end

  # :nodoc:
  @[Flags]
  enum ImGuiItemStatusFlags
    None             = 0
    HoveredRect      = 1 << 0
    HasDisplayRect   = 1 << 1
    Edited           = 1 << 2
    ToggledSelection = 1 << 3
    ToggledOpen      = 1 << 4
    HasDeactivated   = 1 << 5
    Deactivated      = 1 << 6
    HoveredWindow    = 1 << 7
    FocusedByTabbing = 1 << 8
    Visible          = 1 << 9
  end

  # :nodoc:
  @[Flags]
  enum ImGuiSeparatorFlags
    None           = 0
    Horizontal     = 1 << 0
    Vertical       = 1 << 1
    SpanAllColumns = 1 << 2
  end

  # :nodoc:
  @[Flags]
  enum ImGuiFocusRequestFlags
    None                = 0
    RestoreFocusedChild = 1 << 0
    UnlessBelowModal    = 1 << 1
  end

  # :nodoc:
  @[Flags]
  enum ImGuiTextFlags
    None                       = 0
    NoWidthForLargeClippedText = 1 << 0
  end

  # :nodoc:
  @[Flags]
  enum ImGuiTooltipFlags
    None             = 0
    OverridePrevious = 1 << 1
  end

  # :nodoc:
  enum ImGuiLayoutType
    Horizontal = 0
    Vertical   = 1
  end

  # :nodoc:
  enum ImGuiLogType
    None      = 0
    TTY       = 1
    File      = 2
    Buffer    = 3
    Clipboard = 4
  end

  # :nodoc:
  enum ImGuiAxis
    None = -1
    X    =  0
    Y    =  1
  end

  # :nodoc:
  enum ImGuiPlotType
    Lines     = 0
    Histogram = 1
  end

  # :nodoc:
  enum ImGuiPopupPositionPolicy
    Default  = 0
    ComboBox = 1
    Tooltip  = 2
  end

  # :nodoc:
  @[Flags]
  enum ImGuiNextWindowDataFlags
    None              = 0
    HasPos            = 1 << 0
    HasSize           = 1 << 1
    HasContentSize    = 1 << 2
    HasCollapsed      = 1 << 3
    HasSizeConstraint = 1 << 4
    HasFocus          = 1 << 5
    HasBgAlpha        = 1 << 6
    HasScroll         = 1 << 7
  end

  # :nodoc:
  @[Flags]
  enum ImGuiNextItemDataFlags
    None     = 0
    HasWidth = 1 << 0
    HasOpen  = 1 << 1
  end

  # :nodoc:
  enum ImGuiInputEventType
    None        = 0
    MousePos    = 1
    MouseWheel  = 2
    MouseButton = 3
    Key         = 4
    Text        = 5
    Focus       = 6
  end

  # :nodoc:
  enum ImGuiInputSource
    None      = 0
    Mouse     = 1
    Keyboard  = 2
    Gamepad   = 3
    Clipboard = 4
  end

  # :nodoc:
  @[Flags]
  enum ImGuiInputFlags
    None                       = 0
    Repeat                     = 1 << 0
    RepeatRateDefault          = 1 << 1
    RepeatRateNavMove          = 1 << 2
    RepeatRateNavTweak         = 1 << 3
    RepeatRateMask_            = RepeatRateDefault | RepeatRateNavMove | RepeatRateNavTweak
    CondHovered                = 1 << 4
    CondActive                 = 1 << 5
    CondDefault_               = CondHovered | CondActive
    CondMask_                  = CondHovered | CondActive
    LockThisFrame              = 1 << 6
    LockUntilRelease           = 1 << 7
    RouteFocused               = 1 << 8
    RouteGlobalLow             = 1 << 9
    RouteGlobal                = 1 << 10
    RouteGlobalHigh            = 1 << 11
    RouteMask_                 = RouteFocused | RouteGlobal | RouteGlobalLow | RouteGlobalHigh
    RouteAlways                = 1 << 12
    RouteUnlessBgFocused       = 1 << 13
    RouteExtraMask_            = RouteAlways | RouteUnlessBgFocused
    SupportedByIsKeyPressed    = Repeat | RepeatRateMask_
    SupportedByShortcut        = Repeat | RepeatRateMask_ | RouteMask_ | RouteExtraMask_
    SupportedBySetKeyOwner     = LockThisFrame | LockUntilRelease
    SupportedBySetItemKeyOwner = SupportedBySetKeyOwner | CondMask_
  end

  # :nodoc:
  @[Flags]
  enum ImGuiActivateFlags
    None               = 0
    PreferInput        = 1 << 0
    PreferTweak        = 1 << 1
    TryToPreserveState = 1 << 2
  end

  # :nodoc:
  @[Flags]
  enum ImGuiScrollFlags
    None               = 0
    KeepVisibleEdgeX   = 1 << 0
    KeepVisibleEdgeY   = 1 << 1
    KeepVisibleCenterX = 1 << 2
    KeepVisibleCenterY = 1 << 3
    AlwaysCenterX      = 1 << 4
    AlwaysCenterY      = 1 << 5
    NoScrollParent     = 1 << 6
    MaskX_             = KeepVisibleEdgeX | KeepVisibleCenterX | AlwaysCenterX
    MaskY_             = KeepVisibleEdgeY | KeepVisibleCenterY | AlwaysCenterY
  end

  # :nodoc:
  @[Flags]
  enum ImGuiNavHighlightFlags
    None        = 0
    TypeDefault = 1 << 0
    TypeThin    = 1 << 1
    AlwaysDraw  = 1 << 2
    NoRounding  = 1 << 3
  end

  # :nodoc:
  @[Flags]
  enum ImGuiNavMoveFlags
    None                = 0
    LoopX               = 1 << 0
    LoopY               = 1 << 1
    WrapX               = 1 << 2
    WrapY               = 1 << 3
    WrapMask_           = LoopX | LoopY | WrapX | WrapY
    AllowCurrentNavId   = 1 << 4
    AlsoScoreVisibleSet = 1 << 5
    ScrollToEdgeY       = 1 << 6
    Forwarded           = 1 << 7
    DebugNoResult       = 1 << 8
    FocusApi            = 1 << 9
    IsTabbing           = 1 << 10
    IsPageMove          = 1 << 11
    Activate            = 1 << 12
    NoSelect            = 1 << 13
    NoSetNavHighlight   = 1 << 14
  end

  # :nodoc:
  enum ImGuiNavLayer
    Main = 0
    Menu = 1
  end

  # :nodoc:
  @[Flags]
  enum ImGuiOldColumnFlags
    None                   = 0
    NoBorder               = 1 << 0
    NoResize               = 1 << 1
    NoPreserveWidths       = 1 << 2
    NoForceWithinWindow    = 1 << 3
    GrowParentContentsSize = 1 << 4
  end

  # :nodoc:
  enum ImGuiLocKey
    VersionStr           = 0
    TableSizeOne         = 1
    TableSizeAllFit      = 2
    TableSizeAllDefault  = 3
    TableResetOrder      = 4
    WindowingMainMenuBar = 5
    WindowingPopup       = 6
    WindowingUntitled    = 7
  end

  # :nodoc:
  @[Flags]
  enum ImGuiDebugLogFlags
    None           = 0
    EventActiveId  = 1 << 0
    EventFocus     = 1 << 1
    EventPopup     = 1 << 2
    EventNav       = 1 << 3
    EventClipper   = 1 << 4
    EventSelection = 1 << 5
    EventIO        = 1 << 6
    EventMask_     = EventActiveId | EventFocus | EventPopup | EventNav | EventClipper | EventSelection | EventIO
    OutputToTTY    = 1 << 10
  end

  # :nodoc:
  enum ImGuiContextHookType
    NewFramePre     = 0
    NewFramePost    = 1
    EndFramePre     = 2
    EndFramePost    = 3
    RenderPre       = 4
    RenderPost      = 5
    Shutdown        = 6
    PendingRemoval_ = 7
  end
end
