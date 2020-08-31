module ImGui
  @[Flags]
  enum ImDrawCornerFlags
    None     = 0
    TopLeft  = 1 << 0
    TopRight = 1 << 1
    BotLeft  = 1 << 2
    BotRight = 1 << 3
    Top      = TopLeft | TopRight
    Bot      = BotLeft | BotRight
    Left     = TopLeft | BotLeft
    Right    = TopRight | BotRight
  end
  alias TopLevel::ImDrawCornerFlags = ImGui::ImDrawCornerFlags

  @[Flags]
  enum ImDrawListFlags
    None                   = 0
    AntiAliasedLines       = 1 << 0
    AntiAliasedLinesUseTex = 1 << 1
    AntiAliasedFill        = 1 << 2
    AllowVtxOffset         = 1 << 3
  end
  alias TopLevel::ImDrawListFlags = ImGui::ImDrawListFlags

  @[Flags]
  enum ImFontAtlasFlags
    None               = 0
    NoPowerOfTwoHeight = 1 << 0
    NoMouseCursors     = 1 << 1
    NoBakedLines       = 1 << 2
  end
  alias TopLevel::ImFontAtlasFlags = ImGui::ImFontAtlasFlags

  enum ImGuiAxis
    None = -1
    X    =  0
    Y    =  1
  end
  alias TopLevel::ImGuiAxis = ImGui::ImGuiAxis

  @[Flags]
  enum ImGuiBackendFlags
    None                 = 0
    HasGamepad           = 1 << 0
    HasMouseCursors      = 1 << 1
    HasSetMousePos       = 1 << 2
    RendererHasVtxOffset = 1 << 3
  end
  alias TopLevel::ImGuiBackendFlags = ImGui::ImGuiBackendFlags

  @[Flags]
  enum ImGuiButtonFlags
    None                = 0
    MouseButtonLeft     = 1 << 0
    MouseButtonRight    = 1 << 1
    MouseButtonMiddle   = 1 << 2
    MouseButtonMask_    = MouseButtonLeft | MouseButtonRight | MouseButtonMiddle
    MouseButtonDefault_ = MouseButtonLeft
  end
  alias TopLevel::ImGuiButtonFlags = ImGui::ImGuiButtonFlags

  enum ImGuiCol
    Text                  =  0
    TextDisabled          =  1
    WindowBg              =  2
    ChildBg               =  3
    PopupBg               =  4
    Border                =  5
    BorderShadow          =  6
    FrameBg               =  7
    FrameBgHovered        =  8
    FrameBgActive         =  9
    TitleBg               = 10
    TitleBgActive         = 11
    TitleBgCollapsed      = 12
    MenuBarBg             = 13
    ScrollbarBg           = 14
    ScrollbarGrab         = 15
    ScrollbarGrabHovered  = 16
    ScrollbarGrabActive   = 17
    CheckMark             = 18
    SliderGrab            = 19
    SliderGrabActive      = 20
    Button                = 21
    ButtonHovered         = 22
    ButtonActive          = 23
    Header                = 24
    HeaderHovered         = 25
    HeaderActive          = 26
    Separator             = 27
    SeparatorHovered      = 28
    SeparatorActive       = 29
    ResizeGrip            = 30
    ResizeGripHovered     = 31
    ResizeGripActive      = 32
    Tab                   = 33
    TabHovered            = 34
    TabActive             = 35
    TabUnfocused          = 36
    TabUnfocusedActive    = 37
    PlotLines             = 38
    PlotLinesHovered      = 39
    PlotHistogram         = 40
    PlotHistogramHovered  = 41
    TextSelectedBg        = 42
    DragDropTarget        = 43
    NavHighlight          = 44
    NavWindowingHighlight = 45
    NavWindowingDimBg     = 46
    ModalWindowDimBg      = 47
  end
  alias TopLevel::ImGuiCol = ImGui::ImGuiCol

  @[Flags]
  enum ImGuiColorEditFlags
    None             = 0
    NoAlpha          = 1 << 1
    NoPicker         = 1 << 2
    NoOptions        = 1 << 3
    NoSmallPreview   = 1 << 4
    NoInputs         = 1 << 5
    NoTooltip        = 1 << 6
    NoLabel          = 1 << 7
    NoSidePreview    = 1 << 8
    NoDragDrop       = 1 << 9
    NoBorder         = 1 << 10
    AlphaBar         = 1 << 16
    AlphaPreview     = 1 << 17
    AlphaPreviewHalf = 1 << 18
    HDR              = 1 << 19
    DisplayRGB       = 1 << 20
    DisplayHSV       = 1 << 21
    DisplayHex       = 1 << 22
    Uint8            = 1 << 23
    Float            = 1 << 24
    PickerHueBar     = 1 << 25
    PickerHueWheel   = 1 << 26
    InputRGB         = 1 << 27
    InputHSV         = 1 << 28
    OptionsDefault_  = Uint8 | DisplayRGB | InputRGB | PickerHueBar
    DisplayMask_     = DisplayRGB | DisplayHSV | DisplayHex
    DataTypeMask_    = Uint8 | Float
    PickerMask_      = PickerHueWheel | PickerHueBar
    InputMask_       = InputRGB | InputHSV
  end
  alias TopLevel::ImGuiColorEditFlags = ImGui::ImGuiColorEditFlags

  @[Flags]
  enum ImGuiColumnsFlags
    None                   = 0
    NoBorder               = 1 << 0
    NoResize               = 1 << 1
    NoPreserveWidths       = 1 << 2
    NoForceWithinWindow    = 1 << 3
    GrowParentContentsSize = 1 << 4
  end
  alias TopLevel::ImGuiColumnsFlags = ImGui::ImGuiColumnsFlags

  @[Flags]
  enum ImGuiComboFlags
    None           = 0
    PopupAlignLeft = 1 << 0
    HeightSmall    = 1 << 1
    HeightRegular  = 1 << 2
    HeightLarge    = 1 << 3
    HeightLargest  = 1 << 4
    NoArrowButton  = 1 << 5
    NoPreview      = 1 << 6
    HeightMask_    = HeightSmall | HeightRegular | HeightLarge | HeightLargest
  end
  alias TopLevel::ImGuiComboFlags = ImGui::ImGuiComboFlags

  enum ImGuiCond
    None         = 0
    Always       = 1 << 0
    Once         = 1 << 1
    FirstUseEver = 1 << 2
    Appearing    = 1 << 3
  end
  alias TopLevel::ImGuiCond = ImGui::ImGuiCond

  @[Flags]
  enum ImGuiConfigFlags
    None                 = 0
    NavEnableKeyboard    = 1 << 0
    NavEnableGamepad     = 1 << 1
    NavEnableSetMousePos = 1 << 2
    NavNoCaptureKeyboard = 1 << 3
    NoMouse              = 1 << 4
    NoMouseCursorChange  = 1 << 5
    IsSRGB               = 1 << 20
    IsTouchScreen        = 1 << 21
  end
  alias TopLevel::ImGuiConfigFlags = ImGui::ImGuiConfigFlags

  enum ImGuiDataType
    S8     = 0
    U8     = 1
    S16    = 2
    U16    = 3
    S32    = 4
    U32    = 5
    S64    = 6
    U64    = 7
    Float  = 8
    Double = 9
  end
  alias TopLevel::ImGuiDataType = ImGui::ImGuiDataType

  enum ImGuiDir
    None  = -1
    Left  =  0
    Right =  1
    Up    =  2
    Down  =  3
  end
  alias TopLevel::ImGuiDir = ImGui::ImGuiDir

  @[Flags]
  enum ImGuiDragDropFlags
    None                     = 0
    SourceNoPreviewTooltip   = 1 << 0
    SourceNoDisableHover     = 1 << 1
    SourceNoHoldToOpenOthers = 1 << 2
    SourceAllowNullID        = 1 << 3
    SourceExtern             = 1 << 4
    SourceAutoExpirePayload  = 1 << 5
    AcceptBeforeDelivery     = 1 << 10
    AcceptNoDrawDefaultRect  = 1 << 11
    AcceptNoPreviewTooltip   = 1 << 12
    AcceptPeekOnly           = AcceptBeforeDelivery | AcceptNoDrawDefaultRect
  end
  alias TopLevel::ImGuiDragDropFlags = ImGui::ImGuiDragDropFlags

  @[Flags]
  enum ImGuiFocusedFlags
    None                = 0
    ChildWindows        = 1 << 0
    RootWindow          = 1 << 1
    AnyWindow           = 1 << 2
    RootAndChildWindows = RootWindow | ChildWindows
  end
  alias TopLevel::ImGuiFocusedFlags = ImGui::ImGuiFocusedFlags

  @[Flags]
  enum ImGuiHoveredFlags
    None                         = 0
    ChildWindows                 = 1 << 0
    RootWindow                   = 1 << 1
    AnyWindow                    = 1 << 2
    AllowWhenBlockedByPopup      = 1 << 3
    AllowWhenBlockedByActiveItem = 1 << 5
    AllowWhenOverlapped          = 1 << 6
    AllowWhenDisabled            = 1 << 7
    RectOnly                     = AllowWhenBlockedByPopup | AllowWhenBlockedByActiveItem | AllowWhenOverlapped
    RootAndChildWindows          = RootWindow | ChildWindows
  end
  alias TopLevel::ImGuiHoveredFlags = ImGui::ImGuiHoveredFlags

  enum ImGuiInputReadMode
    Down       = 0
    Pressed    = 1
    Released   = 2
    Repeat     = 3
    RepeatSlow = 4
    RepeatFast = 5
  end
  alias TopLevel::ImGuiInputReadMode = ImGui::ImGuiInputReadMode

  enum ImGuiInputSource
    None        = 0
    Mouse       = 1
    Nav         = 2
    NavKeyboard = 3
    NavGamepad  = 4
  end
  alias TopLevel::ImGuiInputSource = ImGui::ImGuiInputSource

  @[Flags]
  enum ImGuiInputTextFlags
    None                = 0
    CharsDecimal        = 1 << 0
    CharsHexadecimal    = 1 << 1
    CharsUppercase      = 1 << 2
    CharsNoBlank        = 1 << 3
    AutoSelectAll       = 1 << 4
    EnterReturnsTrue    = 1 << 5
    CallbackCompletion  = 1 << 6
    CallbackHistory     = 1 << 7
    CallbackAlways      = 1 << 8
    CallbackCharFilter  = 1 << 9
    AllowTabInput       = 1 << 10
    CtrlEnterForNewLine = 1 << 11
    NoHorizontalScroll  = 1 << 12
    AlwaysInsertMode    = 1 << 13
    ReadOnly            = 1 << 14
    Password            = 1 << 15
    NoUndoRedo          = 1 << 16
    CharsScientific     = 1 << 17
    CallbackResize      = 1 << 18
    Multiline           = 1 << 20
    NoMarkEdited        = 1 << 21
  end
  alias TopLevel::ImGuiInputTextFlags = ImGui::ImGuiInputTextFlags

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
    Default_                 = 0
  end
  alias TopLevel::ImGuiItemFlags = ImGui::ImGuiItemFlags

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
  end
  alias TopLevel::ImGuiItemStatusFlags = ImGui::ImGuiItemStatusFlags

  @[Flags]
  enum ImGuiKeyModFlags
    None  = 0
    Ctrl  = 1 << 0
    Shift = 1 << 1
    Alt   = 1 << 2
    Super = 1 << 3
  end
  alias TopLevel::ImGuiKeyModFlags = ImGui::ImGuiKeyModFlags

  enum ImGuiKey
    Tab         =  0
    LeftArrow   =  1
    RightArrow  =  2
    UpArrow     =  3
    DownArrow   =  4
    PageUp      =  5
    PageDown    =  6
    Home        =  7
    End         =  8
    Insert      =  9
    Delete      = 10
    Backspace   = 11
    Space       = 12
    Enter       = 13
    Escape      = 14
    KeyPadEnter = 15
    A           = 16
    C           = 17
    V           = 18
    X           = 19
    Y           = 20
    Z           = 21
  end
  alias TopLevel::ImGuiKey = ImGui::ImGuiKey

  enum ImGuiLayoutType
    Horizontal = 0
    Vertical   = 1
  end
  alias TopLevel::ImGuiLayoutType = ImGui::ImGuiLayoutType

  enum ImGuiLogType
    None      = 0
    TTY       = 1
    File      = 2
    Buffer    = 3
    Clipboard = 4
  end
  alias TopLevel::ImGuiLogType = ImGui::ImGuiLogType

  enum ImGuiMouseButton
    Left   = 0
    Right  = 1
    Middle = 2
  end
  alias TopLevel::ImGuiMouseButton = ImGui::ImGuiMouseButton

  enum ImGuiMouseCursor
    None       = -1
    Arrow      =  0
    TextInput  =  1
    ResizeAll  =  2
    ResizeNS   =  3
    ResizeEW   =  4
    ResizeNESW =  5
    ResizeNWSE =  6
    Hand       =  7
    NotAllowed =  8
  end
  alias TopLevel::ImGuiMouseCursor = ImGui::ImGuiMouseCursor

  @[Flags]
  enum ImGuiNavDirSourceFlags
    None      = 0
    Keyboard  = 1 << 0
    PadDPad   = 1 << 1
    PadLStick = 1 << 2
  end
  alias TopLevel::ImGuiNavDirSourceFlags = ImGui::ImGuiNavDirSourceFlags

  enum ImGuiNavForward
    None          = 0
    ForwardQueued = 1
    ForwardActive = 2
  end
  alias TopLevel::ImGuiNavForward = ImGui::ImGuiNavForward

  @[Flags]
  enum ImGuiNavHighlightFlags
    None        = 0
    TypeDefault = 1 << 0
    TypeThin    = 1 << 1
    AlwaysDraw  = 1 << 2
    NoRounding  = 1 << 3
  end
  alias TopLevel::ImGuiNavHighlightFlags = ImGui::ImGuiNavHighlightFlags

  enum ImGuiNavInput
    Activate       =  0
    Cancel         =  1
    Input          =  2
    Menu           =  3
    DpadLeft       =  4
    DpadRight      =  5
    DpadUp         =  6
    DpadDown       =  7
    LStickLeft     =  8
    LStickRight    =  9
    LStickUp       = 10
    LStickDown     = 11
    FocusPrev      = 12
    FocusNext      = 13
    TweakSlow      = 14
    TweakFast      = 15
    KeyMenu_       = 16
    KeyLeft_       = 17
    KeyRight_      = 18
    KeyUp_         = 19
    KeyDown_       = 20
    InternalStart_ = KeyMenu_
  end
  alias TopLevel::ImGuiNavInput = ImGui::ImGuiNavInput

  enum ImGuiNavLayer
    Main = 0
    Menu = 1
  end
  alias TopLevel::ImGuiNavLayer = ImGui::ImGuiNavLayer

  @[Flags]
  enum ImGuiNavMoveFlags
    None                = 0
    LoopX               = 1 << 0
    LoopY               = 1 << 1
    WrapX               = 1 << 2
    WrapY               = 1 << 3
    AllowCurrentNavId   = 1 << 4
    AlsoScoreVisibleSet = 1 << 5
    ScrollToEdge        = 1 << 6
  end
  alias TopLevel::ImGuiNavMoveFlags = ImGui::ImGuiNavMoveFlags

  @[Flags]
  enum ImGuiNextItemDataFlags
    None     = 0
    HasWidth = 1 << 0
    HasOpen  = 1 << 1
  end
  alias TopLevel::ImGuiNextItemDataFlags = ImGui::ImGuiNextItemDataFlags

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
  alias TopLevel::ImGuiNextWindowDataFlags = ImGui::ImGuiNextWindowDataFlags

  enum ImGuiPlotType
    Lines     = 0
    Histogram = 1
  end
  alias TopLevel::ImGuiPlotType = ImGui::ImGuiPlotType

  @[Flags]
  enum ImGuiPopupFlags
    None                    =    0
    MouseButtonLeft         =    0
    MouseButtonRight        =    1
    MouseButtonMiddle       =    2
    MouseButtonMask_        = 0x1F
    MouseButtonDefault_     =    1
    NoOpenOverExistingPopup = 1 << 5
    NoOpenOverItems         = 1 << 6
    AnyPopupId              = 1 << 7
    AnyPopupLevel           = 1 << 8
    AnyPopup                = AnyPopupId | AnyPopupLevel
  end
  alias TopLevel::ImGuiPopupFlags = ImGui::ImGuiPopupFlags

  enum ImGuiPopupPositionPolicy
    Default  = 0
    ComboBox = 1
  end
  alias TopLevel::ImGuiPopupPositionPolicy = ImGui::ImGuiPopupPositionPolicy

  @[Flags]
  enum ImGuiSelectableFlags
    None             = 0
    DontClosePopups  = 1 << 0
    SpanAllColumns   = 1 << 1
    AllowDoubleClick = 1 << 2
    Disabled         = 1 << 3
    AllowItemOverlap = 1 << 4
  end
  alias TopLevel::ImGuiSelectableFlags = ImGui::ImGuiSelectableFlags

  @[Flags]
  enum ImGuiSeparatorFlags
    None           = 0
    Horizontal     = 1 << 0
    Vertical       = 1 << 1
    SpanAllColumns = 1 << 2
  end
  alias TopLevel::ImGuiSeparatorFlags = ImGui::ImGuiSeparatorFlags

  @[Flags]
  enum ImGuiSliderFlags
    None            = 0
    ClampOnInput    = 1 << 4
    Logarithmic     = 1 << 5
    NoRoundToFormat = 1 << 6
    NoInput         = 1 << 7
    InvalidMask_    = 0x7000000F
  end
  alias TopLevel::ImGuiSliderFlags = ImGui::ImGuiSliderFlags

  enum ImGuiStyleVar
    Alpha               =  0
    WindowPadding       =  1
    WindowRounding      =  2
    WindowBorderSize    =  3
    WindowMinSize       =  4
    WindowTitleAlign    =  5
    ChildRounding       =  6
    ChildBorderSize     =  7
    PopupRounding       =  8
    PopupBorderSize     =  9
    FramePadding        = 10
    FrameRounding       = 11
    FrameBorderSize     = 12
    ItemSpacing         = 13
    ItemInnerSpacing    = 14
    IndentSpacing       = 15
    ScrollbarSize       = 16
    ScrollbarRounding   = 17
    GrabMinSize         = 18
    GrabRounding        = 19
    TabRounding         = 20
    ButtonTextAlign     = 21
    SelectableTextAlign = 22
  end
  alias TopLevel::ImGuiStyleVar = ImGui::ImGuiStyleVar

  @[Flags]
  enum ImGuiTabBarFlags
    None                         = 0
    Reorderable                  = 1 << 0
    AutoSelectNewTabs            = 1 << 1
    TabListPopupButton           = 1 << 2
    NoCloseWithMiddleMouseButton = 1 << 3
    NoTabListScrollingButtons    = 1 << 4
    NoTooltip                    = 1 << 5
    FittingPolicyResizeDown      = 1 << 6
    FittingPolicyScroll          = 1 << 7
    FittingPolicyMask_           = FittingPolicyResizeDown | FittingPolicyScroll
    FittingPolicyDefault_        = FittingPolicyResizeDown
  end
  alias TopLevel::ImGuiTabBarFlags = ImGui::ImGuiTabBarFlags

  @[Flags]
  enum ImGuiTabItemFlags
    None                         = 0
    UnsavedDocument              = 1 << 0
    SetSelected                  = 1 << 1
    NoCloseWithMiddleMouseButton = 1 << 2
    NoPushId                     = 1 << 3
    NoTooltip                    = 1 << 4
  end
  alias TopLevel::ImGuiTabItemFlags = ImGui::ImGuiTabItemFlags

  @[Flags]
  enum ImGuiTextFlags
    None                       = 0
    NoWidthForLargeClippedText = 1 << 0
  end
  alias TopLevel::ImGuiTextFlags = ImGui::ImGuiTextFlags

  @[Flags]
  enum ImGuiTooltipFlags
    None                    = 0
    OverridePreviousTooltip = 1 << 0
  end
  alias TopLevel::ImGuiTooltipFlags = ImGui::ImGuiTooltipFlags

  @[Flags]
  enum ImGuiTreeNodeFlags
    None                 = 0
    Selected             = 1 << 0
    Framed               = 1 << 1
    AllowItemOverlap     = 1 << 2
    NoTreePushOnOpen     = 1 << 3
    NoAutoOpenOnLog      = 1 << 4
    DefaultOpen          = 1 << 5
    OpenOnDoubleClick    = 1 << 6
    OpenOnArrow          = 1 << 7
    Leaf                 = 1 << 8
    Bullet               = 1 << 9
    FramePadding         = 1 << 10
    SpanAvailWidth       = 1 << 11
    SpanFullWidth        = 1 << 12
    NavLeftJumpsBackHere = 1 << 13
    CollapsingHeader     = Framed | NoTreePushOnOpen | NoAutoOpenOnLog
  end
  alias TopLevel::ImGuiTreeNodeFlags = ImGui::ImGuiTreeNodeFlags

  @[Flags]
  enum ImGuiWindowFlags
    None                      = 0
    NoTitleBar                = 1 << 0
    NoResize                  = 1 << 1
    NoMove                    = 1 << 2
    NoScrollbar               = 1 << 3
    NoScrollWithMouse         = 1 << 4
    NoCollapse                = 1 << 5
    AlwaysAutoResize          = 1 << 6
    NoBackground              = 1 << 7
    NoSavedSettings           = 1 << 8
    NoMouseInputs             = 1 << 9
    MenuBar                   = 1 << 10
    HorizontalScrollbar       = 1 << 11
    NoFocusOnAppearing        = 1 << 12
    NoBringToFrontOnFocus     = 1 << 13
    AlwaysVerticalScrollbar   = 1 << 14
    AlwaysHorizontalScrollbar = 1 << 15
    AlwaysUseWindowPadding    = 1 << 16
    NoNavInputs               = 1 << 18
    NoNavFocus                = 1 << 19
    UnsavedDocument           = 1 << 20
    NoNav                     = NoNavInputs | NoNavFocus
    NoDecoration              = NoTitleBar | NoResize | NoScrollbar | NoCollapse
    NoInputs                  = NoMouseInputs | NoNavInputs | NoNavFocus
    NavFlattened              = 1 << 23
    ChildWindow               = 1 << 24
    Tooltip                   = 1 << 25
    Popup                     = 1 << 26
    Modal                     = 1 << 27
    ChildMenu                 = 1 << 28
  end
  alias TopLevel::ImGuiWindowFlags = ImGui::ImGuiWindowFlags
  alias ImDrawCallback = LibImGui::ImDrawCallback
  alias ImDrawIdx = LibImGui::ImDrawIdx
  alias ImFileHandle = LibImGui::ImFileHandle
  alias ImGuiID = LibImGui::ImGuiID
  alias ImGuiInputTextCallback = LibImGui::ImGuiInputTextCallback
  alias ImGuiSizeCallback = LibImGui::ImGuiSizeCallback
  alias ImPoolIdx = LibImGui::ImPoolIdx
  alias ImTextureID = LibImGui::ImTextureID
  alias ImWchar = LibImGui::ImWchar
  alias ImWchar16 = LibImGui::ImWchar16
  alias ImWchar32 = LibImGui::ImWchar32

  @[Extern]
  struct ImColor
    property value : ImVec4

    def initialize(@value : ImVec4)
    end
  end

  alias TopLevel::ImColor = ImGui::ImColor

  @[Extern]
  struct ImDrawChannel
    @_cmd_buffer : LibImGui::ImVectorInternal
    @_idx_buffer : LibImGui::ImVectorInternal

    def initialize(@_cmd_buffer : LibImGui::ImVectorInternal, @_idx_buffer : LibImGui::ImVectorInternal)
    end
  end

  alias TopLevel::ImDrawChannel = ImGui::ImDrawChannel

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
  struct ImFontGlyph
    property codepoint : UInt32
    property visible : UInt32
    property advance_x : Float32
    property x0 : Float32
    property y0 : Float32
    property x1 : Float32
    property y1 : Float32
    property u0 : Float32
    property v0 : Float32
    property u1 : Float32
    property v1 : Float32

    def initialize(@codepoint : UInt32, @visible : UInt32, @advance_x : Float32, @x0 : Float32, @y0 : Float32, @x1 : Float32, @y1 : Float32, @u0 : Float32, @v0 : Float32, @u1 : Float32, @v1 : Float32)
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

  @[Extern]
  struct ImGuiListClipper
    property display_start : Int32
    property display_end : Int32
    property items_count : Int32
    property step_no : Int32
    property items_height : Float32
    property start_pos_y : Float32

    def initialize(@display_start : Int32, @display_end : Int32, @items_count : Int32, @step_no : Int32, @items_height : Float32, @start_pos_y : Float32)
    end
  end

  alias TopLevel::ImGuiListClipper = ImGui::ImGuiListClipper

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
  struct ImGuiTextBuffer
    property buf : LibImGui::ImVectorInternal

    def initialize(@buf : LibImGui::ImVectorInternal)
    end
  end

  alias TopLevel::ImGuiTextBuffer = ImGui::ImGuiTextBuffer

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

  @[Extern]
  struct ImVector
  end

  alias TopLevel::ImVector = ImGui::ImVector
end
