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

  @[Flags]
  enum ImDrawListFlags
    None             = 0
    AntiAliasedLines = 1 << 0
    AntiAliasedFill  = 1 << 1
    AllowVtxOffset   = 1 << 2
  end

  @[Flags]
  enum ImFontAtlasFlags
    None               = 0
    NoPowerOfTwoHeight = 1 << 0
    NoMouseCursors     = 1 << 1
  end

  enum ImGuiAxis
    None = -1
    X    =  0
    Y    =  1
  end

  @[Flags]
  enum ImGuiBackendFlags
    None                 = 0
    HasGamepad           = 1 << 0
    HasMouseCursors      = 1 << 1
    HasSetMousePos       = 1 << 2
    RendererHasVtxOffset = 1 << 3
  end

  @[Flags]
  enum ImGuiButtonFlags
    None                          = 0
    Repeat                        = 1 << 0
    PressedOnClick                = 1 << 1
    PressedOnClickRelease         = 1 << 2
    PressedOnClickReleaseAnywhere = 1 << 3
    PressedOnRelease              = 1 << 4
    PressedOnDoubleClick          = 1 << 5
    PressedOnDragDropHold         = 1 << 6
    FlattenChildren               = 1 << 7
    AllowItemOverlap              = 1 << 8
    DontClosePopups               = 1 << 9
    Disabled                      = 1 << 10
    AlignTextBaseLine             = 1 << 11
    NoKeyModifiers                = 1 << 12
    NoHoldingActiveId             = 1 << 13
    NoNavFocus                    = 1 << 14
    NoHoveredOnFocus              = 1 << 15
    MouseButtonLeft               = 1 << 16
    MouseButtonRight              = 1 << 17
    MouseButtonMiddle             = 1 << 18
    MouseButtonMask               = MouseButtonLeft | MouseButtonRight | MouseButtonMiddle
    MouseButtonShift              = 16
    MouseButtonDefault            = MouseButtonLeft
    PressedOnMask                 = PressedOnClick | PressedOnClickRelease | PressedOnClickReleaseAnywhere | PressedOnRelease | PressedOnDoubleClick | PressedOnDragDropHold
    PressedOnDefault              = PressedOnClickRelease
  end

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
    COUNT                 = 48
  end

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
    OptionsDefault   = Uint8 | DisplayRGB | InputRGB | PickerHueBar
    DisplayMask      = DisplayRGB | DisplayHSV | DisplayHex
    DataTypeMask     = Uint8 | Float
    PickerMask       = PickerHueWheel | PickerHueBar
    InputMask        = InputRGB | InputHSV
  end

  @[Flags]
  enum ImGuiColumnsFlags
    None                   = 0
    NoBorder               = 1 << 0
    NoResize               = 1 << 1
    NoPreserveWidths       = 1 << 2
    NoForceWithinWindow    = 1 << 3
    GrowParentContentsSize = 1 << 4
  end

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
    HeightMask     = HeightSmall | HeightRegular | HeightLarge | HeightLargest
  end

  enum ImGuiCond
    None         = 0
    Always       = 1 << 0
    Once         = 1 << 1
    FirstUseEver = 1 << 2
    Appearing    = 1 << 3
  end

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

  enum ImGuiDataType
    S8     =  0
    U8     =  1
    S16    =  2
    U16    =  3
    S32    =  4
    U32    =  5
    S64    =  6
    U64    =  7
    Float  =  8
    Double =  9
    COUNT  = 10
  end

  enum ImGuiDir
    None  = -1
    Left  =  0
    Right =  1
    Up    =  2
    Down  =  3
    COUNT =  4
  end

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

  @[Flags]
  enum ImGuiDragFlags
    None     = 0
    Vertical = 1 << 0
  end

  @[Flags]
  enum ImGuiFocusedFlags
    None                = 0
    ChildWindows        = 1 << 0
    RootWindow          = 1 << 1
    AnyWindow           = 1 << 2
    RootAndChildWindows = RootWindow | ChildWindows
  end

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

  enum ImGuiInputReadMode
    Down       = 0
    Pressed    = 1
    Released   = 2
    Repeat     = 3
    RepeatSlow = 4
    RepeatFast = 5
  end

  enum ImGuiInputSource
    None        = 0
    Mouse       = 1
    Nav         = 2
    NavKeyboard = 3
    NavGamepad  = 4
    COUNT       = 5
  end

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
    Default                  = 0
  end

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

  @[Flags]
  enum ImGuiKeyModFlags
    None  = 0
    Ctrl  = 1 << 0
    Shift = 1 << 1
    Alt   = 1 << 2
    Super = 1 << 3
  end

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
    COUNT       = 22
  end

  enum ImGuiLayoutType
    Horizontal = 0
    Vertical   = 1
  end

  enum ImGuiLogType
    None      = 0
    TTY       = 1
    File      = 2
    Buffer    = 3
    Clipboard = 4
  end

  enum ImGuiMouseButton
    Left   = 0
    Right  = 1
    Middle = 2
    COUNT  = 5
  end

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
    COUNT      =  9
  end

  @[Flags]
  enum ImGuiNavDirSourceFlags
    None      = 0
    Keyboard  = 1 << 0
    PadDPad   = 1 << 1
    PadLStick = 1 << 2
  end

  enum ImGuiNavForward
    None          = 0
    ForwardQueued = 1
    ForwardActive = 2
  end

  @[Flags]
  enum ImGuiNavHighlightFlags
    None        = 0
    TypeDefault = 1 << 0
    TypeThin    = 1 << 1
    AlwaysDraw  = 1 << 2
    NoRounding  = 1 << 3
  end

  enum ImGuiNavInput
    Activate      =  0
    Cancel        =  1
    Input         =  2
    Menu          =  3
    DpadLeft      =  4
    DpadRight     =  5
    DpadUp        =  6
    DpadDown      =  7
    LStickLeft    =  8
    LStickRight   =  9
    LStickUp      = 10
    LStickDown    = 11
    FocusPrev     = 12
    FocusNext     = 13
    TweakSlow     = 14
    TweakFast     = 15
    KeyMenu       = 16
    KeyLeft       = 17
    KeyRight      = 18
    KeyUp         = 19
    KeyDown       = 20
    COUNT         = 21
    InternalStart = KeyMenu
  end

  enum ImGuiNavLayer
    Main  = 0
    Menu  = 1
    COUNT = 2
  end

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

  @[Flags]
  enum ImGuiNextItemDataFlags
    None     = 0
    HasWidth = 1 << 0
    HasOpen  = 1 << 1
  end

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

  enum ImGuiPlotType
    Lines     = 0
    Histogram = 1
  end

  @[Flags]
  enum ImGuiPopupFlags
    None                    =    0
    MouseButtonLeft         =    0
    MouseButtonRight        =    1
    MouseButtonMiddle       =    2
    MouseButtonMask         = 0x1F
    MouseButtonDefault      =    1
    NoOpenOverExistingPopup = 1 << 5
    NoOpenOverItems         = 1 << 6
    AnyPopupId              = 1 << 7
    AnyPopupLevel           = 1 << 8
    AnyPopup                = AnyPopupId | AnyPopupLevel
  end

  enum ImGuiPopupPositionPolicy
    Default  = 0
    ComboBox = 1
  end

  @[Flags]
  enum ImGuiSelectableFlags
    None             = 0
    DontClosePopups  = 1 << 0
    SpanAllColumns   = 1 << 1
    AllowDoubleClick = 1 << 2
    Disabled         = 1 << 3
    AllowItemOverlap = 1 << 4
  end

  @[Flags]
  enum ImGuiSeparatorFlags
    None           = 0
    Horizontal     = 1 << 0
    Vertical       = 1 << 1
    SpanAllColumns = 1 << 2
  end

  @[Flags]
  enum ImGuiSliderFlags
    None     = 0
    Vertical = 1 << 0
  end

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
    COUNT               = 23
  end

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
    FittingPolicyMask            = FittingPolicyResizeDown | FittingPolicyScroll
    FittingPolicyDefault         = FittingPolicyResizeDown
  end

  @[Flags]
  enum ImGuiTabItemFlags
    None                         = 0
    UnsavedDocument              = 1 << 0
    SetSelected                  = 1 << 1
    NoCloseWithMiddleMouseButton = 1 << 2
    NoPushId                     = 1 << 3
    NoTooltip                    = 1 << 4
  end

  @[Flags]
  enum ImGuiTextFlags
    None                       = 0
    NoWidthForLargeClippedText = 1 << 0
  end

  @[Flags]
  enum ImGuiTooltipFlags
    None                    = 0
    OverridePreviousTooltip = 1 << 0
  end

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
  alias ImDrawCallback = (ImDrawList*, ImDrawCmd*) -> Void
  alias ImDrawIdx = UInt16
  alias ImFileHandle = Void*
  alias ImGuiID = UInt32
  alias ImGuiInputTextCallback = (ImGuiInputTextCallbackData) -> Int32
  alias ImGuiSizeCallback = (ImGuiSizeCallbackData*) -> Void
  alias ImPoolIdx = Int32
  alias ImTextureID = Void*
  alias ImWchar = ImWchar16
  alias ImWchar16 = UInt16
  alias ImWchar32 = UInt32
  alias ImBitVector = Void

  @[Extern]
  struct ImColor
    property value : ImVec4

    def initialize(@value : ImVec4)
    end
  end

  @[Extern]
  struct ImDrawChannel
    @_cmd_buffer : ImVectorInternal
    @_idx_buffer : ImVectorInternal

    def initialize(@_cmd_buffer : ImVectorInternal, @_idx_buffer : ImVectorInternal)
    end
  end

  @[Extern]
  struct ImDrawCmd
    property clip_rect : ImVec4
    property texture_id : ImTextureID
    property vtx_offset : UInt32
    property idx_offset : UInt32
    property elem_count : UInt32
    property user_callback : ImDrawCallback
    property user_callback_data : Void*

    def initialize(@clip_rect : ImVec4, @texture_id : ImTextureID, @vtx_offset : UInt32, @idx_offset : UInt32, @elem_count : UInt32, @user_callback : ImDrawCallback, @user_callback_data : Void*)
    end
  end

  @[Extern]
  struct ImDrawData
    property valid : Bool
    property cmd_lists : ImDrawList**
    property cmd_lists_count : Int32
    property total_idx_count : Int32
    property total_vtx_count : Int32
    property display_pos : ImVec2
    property display_size : ImVec2
    property framebuffer_scale : ImVec2

    def initialize(@valid : Bool, @cmd_lists : ImDrawList**, @cmd_lists_count : Int32, @total_idx_count : Int32, @total_vtx_count : Int32, @display_pos : ImVec2, @display_size : ImVec2, @framebuffer_scale : ImVec2)
    end
  end

  alias ImDrawDataBuilder = Void

  @[Extern]
  struct ImDrawList
    @cmd_buffer : ImVectorInternal

    def cmd_buffer : ImVector(ImDrawCmd)
      pointerof(@cmd_buffer).as(ImVector(ImDrawCmd)*).value
    end

    def cmd_buffer=(cmd_buffer : ImVector(ImDrawCmd))
      pointerof(@cmd_buffer).value = cmd_buffer.as(ImVectorInternal*).value
    end

    @idx_buffer : ImVectorInternal

    def idx_buffer : ImVector(ImDrawIdx)
      pointerof(@idx_buffer).as(ImVector(ImDrawIdx)*).value
    end

    def idx_buffer=(idx_buffer : ImVector(ImDrawIdx))
      pointerof(@idx_buffer).value = idx_buffer.as(ImVectorInternal*).value
    end

    @vtx_buffer : ImVectorInternal

    def vtx_buffer : ImVector(ImDrawVert)
      pointerof(@vtx_buffer).as(ImVector(ImDrawVert)*).value
    end

    def vtx_buffer=(vtx_buffer : ImVector(ImDrawVert))
      pointerof(@vtx_buffer).value = vtx_buffer.as(ImVectorInternal*).value
    end

    property flags : ImDrawListFlags
    @_data : ImDrawListSharedData*
    @_owner_name : LibC::Char*
    @_vtx_current_idx : UInt32
    @_vtx_write_ptr : ImDrawVert*
    @_idx_write_ptr : ImDrawIdx*
    @_clip_rect_stack : ImVectorInternal
    @_texture_id_stack : ImVectorInternal
    @_path : ImVectorInternal
    @_cmd_header : ImDrawCmd
    @_splitter : ImDrawListSplitter

    def initialize(@cmd_buffer : ImVectorInternal, @idx_buffer : ImVectorInternal, @vtx_buffer : ImVectorInternal, @flags : ImDrawListFlags, @_data : ImDrawListSharedData*, @_owner_name : LibC::Char*, @_vtx_current_idx : UInt32, @_vtx_write_ptr : ImDrawVert*, @_idx_write_ptr : ImDrawIdx*, @_clip_rect_stack : ImVectorInternal, @_texture_id_stack : ImVectorInternal, @_path : ImVectorInternal, @_cmd_header : ImDrawCmd, @_splitter : ImDrawListSplitter)
    end
  end

  alias ImDrawListSharedData = Void

  @[Extern]
  struct ImDrawListSplitter
    @_current : Int32
    @_count : Int32
    @_channels : ImVectorInternal

    def initialize(@_current : Int32, @_count : Int32, @_channels : ImVectorInternal)
    end
  end

  @[Extern]
  struct ImDrawVert
    property pos : ImVec2
    property uv : ImVec2
    property col : UInt32

    def initialize(@pos : ImVec2, @uv : ImVec2, @col : UInt32)
    end
  end

  @[Extern]
  struct ImFont
    @index_advance_x : ImVectorInternal

    def index_advance_x : ImVector(Float32)
      pointerof(@index_advance_x).as(ImVector(Float32)*).value
    end

    def index_advance_x=(index_advance_x : ImVector(Float32))
      pointerof(@index_advance_x).value = index_advance_x.as(ImVectorInternal*).value
    end

    property fallback_advance_x : Float32
    property font_size : Float32
    @index_lookup : ImVectorInternal

    def index_lookup : ImVector(ImWchar)
      pointerof(@index_lookup).as(ImVector(ImWchar)*).value
    end

    def index_lookup=(index_lookup : ImVector(ImWchar))
      pointerof(@index_lookup).value = index_lookup.as(ImVectorInternal*).value
    end

    @glyphs : ImVectorInternal

    def glyphs : ImVector(ImFontGlyph)
      pointerof(@glyphs).as(ImVector(ImFontGlyph)*).value
    end

    def glyphs=(glyphs : ImVector(ImFontGlyph))
      pointerof(@glyphs).value = glyphs.as(ImVectorInternal*).value
    end

    property fallback_glyph : ImFontGlyph*
    property display_offset : ImVec2
    property container_atlas : ImFontAtlas*
    property config_data : ImFontConfig*
    property config_data_count : Int16
    property fallback_char : ImWchar
    property ellipsis_char : ImWchar
    property dirty_lookup_tables : Bool
    property scale : Float32
    property ascent : Float32
    property descent : Float32
    property metrics_total_surface : Int32
    property used4k_pages_map : UInt8

    def initialize(@index_advance_x : ImVectorInternal, @fallback_advance_x : Float32, @font_size : Float32, @index_lookup : ImVectorInternal, @glyphs : ImVectorInternal, @fallback_glyph : ImFontGlyph*, @display_offset : ImVec2, @container_atlas : ImFontAtlas*, @config_data : ImFontConfig*, @config_data_count : Int16, @fallback_char : ImWchar, @ellipsis_char : ImWchar, @dirty_lookup_tables : Bool, @scale : Float32, @ascent : Float32, @descent : Float32, @metrics_total_surface : Int32, @used4k_pages_map : UInt8)
    end
  end

  @[Extern]
  struct ImFontAtlas
    property locked : Bool
    property flags : ImFontAtlasFlags
    property tex_id : ImTextureID
    property tex_desired_width : Int32
    property tex_glyph_padding : Int32
    property tex_pixels_alpha8 : LibC::UChar*
    property tex_pixels_rgba32 : UInt32*
    property tex_width : Int32
    property tex_height : Int32
    property tex_uv_scale : ImVec2
    property tex_uv_white_pixel : ImVec2
    @fonts : ImVectorInternal

    def fonts : ImVector(ImFont*)
      pointerof(@fonts).as(ImVector(ImFont*)*).value
    end

    def fonts=(fonts : ImVector(ImFont*))
      pointerof(@fonts).value = fonts.as(ImVectorInternal*).value
    end

    @custom_rects : ImVectorInternal

    def custom_rects : ImVector(ImFontAtlasCustomRect)
      pointerof(@custom_rects).as(ImVector(ImFontAtlasCustomRect)*).value
    end

    def custom_rects=(custom_rects : ImVector(ImFontAtlasCustomRect))
      pointerof(@custom_rects).value = custom_rects.as(ImVectorInternal*).value
    end

    @config_data : ImVectorInternal

    def config_data : ImVector(ImFontConfig)
      pointerof(@config_data).as(ImVector(ImFontConfig)*).value
    end

    def config_data=(config_data : ImVector(ImFontConfig))
      pointerof(@config_data).value = config_data.as(ImVectorInternal*).value
    end

    property custom_rect_ids : Int32

    def initialize(@locked : Bool, @flags : ImFontAtlasFlags, @tex_id : ImTextureID, @tex_desired_width : Int32, @tex_glyph_padding : Int32, @tex_pixels_alpha8 : LibC::UChar*, @tex_pixels_rgba32 : UInt32*, @tex_width : Int32, @tex_height : Int32, @tex_uv_scale : ImVec2, @tex_uv_white_pixel : ImVec2, @fonts : ImVectorInternal, @custom_rects : ImVectorInternal, @config_data : ImVectorInternal, @custom_rect_ids : Int32)
    end
  end

  @[Extern]
  struct ImFontAtlasCustomRect
    property width : UInt16
    property height : UInt16
    property x : UInt16
    property y : UInt16
    property glyph_id : UInt32
    property glyph_advance_x : Float32
    property glyph_offset : ImVec2
    property font : ImFont*

    def initialize(@width : UInt16, @height : UInt16, @x : UInt16, @y : UInt16, @glyph_id : UInt32, @glyph_advance_x : Float32, @glyph_offset : ImVec2, @font : ImFont*)
    end
  end

  @[Extern]
  struct ImFontConfig
    property font_data : Void*
    property font_data_size : Int32
    property font_data_owned_by_atlas : Bool
    property font_no : Int32
    property size_pixels : Float32
    property oversample_h : Int32
    property oversample_v : Int32
    property pixel_snap_h : Bool
    property glyph_extra_spacing : ImVec2
    property glyph_offset : ImVec2
    property glyph_ranges : ImWchar*
    property glyph_min_advance_x : Float32
    property glyph_max_advance_x : Float32
    property merge_mode : Bool
    property rasterizer_flags : UInt32
    property rasterizer_multiply : Float32
    property ellipsis_char : ImWchar
    property name : LibC::Char
    property dst_font : ImFont*

    def initialize(@font_data : Void*, @font_data_size : Int32, @font_data_owned_by_atlas : Bool, @font_no : Int32, @size_pixels : Float32, @oversample_h : Int32, @oversample_v : Int32, @pixel_snap_h : Bool, @glyph_extra_spacing : ImVec2, @glyph_offset : ImVec2, @glyph_ranges : ImWchar*, @glyph_min_advance_x : Float32, @glyph_max_advance_x : Float32, @merge_mode : Bool, @rasterizer_flags : UInt32, @rasterizer_multiply : Float32, @ellipsis_char : ImWchar, @name : LibC::Char, @dst_font : ImFont*)
    end
  end

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

  @[Extern]
  struct ImFontGlyphRangesBuilder
    @used_chars : ImVectorInternal

    def used_chars : ImVector(UInt32)
      pointerof(@used_chars).as(ImVector(UInt32)*).value
    end

    def used_chars=(used_chars : ImVector(UInt32))
      pointerof(@used_chars).value = used_chars.as(ImVectorInternal*).value
    end

    def initialize(@used_chars : ImVectorInternal)
    end
  end

  alias ImGuiColorMod = Void
  alias ImGuiColumnData = Void
  alias ImGuiColumns = Void
  alias ImGuiContext = Void
  alias ImGuiDataTypeInfo = Void
  alias ImGuiDataTypeTempStorage = Void
  alias ImGuiGroupData = Void

  @[Extern]
  struct ImGuiIO
    property config_flags : ImGuiConfigFlags
    property backend_flags : ImGuiBackendFlags
    property display_size : ImVec2
    property delta_time : Float32
    property ini_saving_rate : Float32
    property ini_filename : LibC::Char*
    property log_filename : LibC::Char*
    property mouse_double_click_time : Float32
    property mouse_double_click_max_dist : Float32
    property mouse_drag_threshold : Float32
    property key_map : Int32
    property key_repeat_delay : Float32
    property key_repeat_rate : Float32
    property user_data : Void*
    property fonts : ImFontAtlas*
    property font_global_scale : Float32
    property font_allow_user_scaling : Bool
    property font_default : ImFont*
    property display_framebuffer_scale : ImVec2
    property mouse_draw_cursor : Bool
    property config_mac_osx_behaviors : Bool
    property config_input_text_cursor_blink : Bool
    property config_windows_resize_from_edges : Bool
    property config_windows_move_from_title_bar_only : Bool
    property config_windows_memory_compact_timer : Float32
    property backend_platform_name : LibC::Char*
    property backend_renderer_name : LibC::Char*
    property backend_platform_user_data : Void*
    property backend_renderer_user_data : Void*
    property backend_language_user_data : Void*
    property get_clipboard_text_fn : (Void*) -> LibC::Char*
    property set_clipboard_text_fn : (Void*, LibC::Char*) -> Void
    property clipboard_user_data : Void*
    property ime_set_input_screen_pos_fn : (Int32, Int32) -> Void
    property ime_window_handle : Void*
    property render_draw_lists_fn_unused : Void*
    property mouse_pos : ImVec2
    property mouse_down : Bool
    property mouse_wheel : Float32
    property mouse_wheel_h : Float32
    property key_ctrl : Bool
    property key_shift : Bool
    property key_alt : Bool
    property key_super : Bool
    property keys_down : Bool
    property nav_inputs : Float32
    property want_capture_mouse : Bool
    property want_capture_keyboard : Bool
    property want_text_input : Bool
    property want_set_mouse_pos : Bool
    property want_save_ini_settings : Bool
    property nav_active : Bool
    property nav_visible : Bool
    property framerate : Float32
    property metrics_render_vertices : Int32
    property metrics_render_indices : Int32
    property metrics_render_windows : Int32
    property metrics_active_windows : Int32
    property metrics_active_allocations : Int32
    property mouse_delta : ImVec2
    property key_mods : ImGuiKeyModFlags
    property mouse_pos_prev : ImVec2
    property mouse_clicked_pos : ImVec2
    property mouse_clicked_time : Float64
    property mouse_clicked : Bool
    property mouse_double_clicked : Bool
    property mouse_released : Bool
    property mouse_down_owned : Bool
    property mouse_down_was_double_click : Bool
    property mouse_down_duration : Float32
    property mouse_down_duration_prev : Float32
    property mouse_drag_max_distance_abs : ImVec2
    property mouse_drag_max_distance_sqr : Float32
    property keys_down_duration : Float32
    property keys_down_duration_prev : Float32
    property nav_inputs_down_duration : Float32
    property nav_inputs_down_duration_prev : Float32
    property pen_pressure : Float32
    property input_queue_surrogate : ImWchar16
    @input_queue_characters : ImVectorInternal

    def input_queue_characters : ImVector(ImWchar)
      pointerof(@input_queue_characters).as(ImVector(ImWchar)*).value
    end

    def input_queue_characters=(input_queue_characters : ImVector(ImWchar))
      pointerof(@input_queue_characters).value = input_queue_characters.as(ImVectorInternal*).value
    end

    def initialize(@config_flags : ImGuiConfigFlags, @backend_flags : ImGuiBackendFlags, @display_size : ImVec2, @delta_time : Float32, @ini_saving_rate : Float32, @ini_filename : LibC::Char*, @log_filename : LibC::Char*, @mouse_double_click_time : Float32, @mouse_double_click_max_dist : Float32, @mouse_drag_threshold : Float32, @key_map : Int32, @key_repeat_delay : Float32, @key_repeat_rate : Float32, @user_data : Void*, @fonts : ImFontAtlas*, @font_global_scale : Float32, @font_allow_user_scaling : Bool, @font_default : ImFont*, @display_framebuffer_scale : ImVec2, @mouse_draw_cursor : Bool, @config_mac_osx_behaviors : Bool, @config_input_text_cursor_blink : Bool, @config_windows_resize_from_edges : Bool, @config_windows_move_from_title_bar_only : Bool, @config_windows_memory_compact_timer : Float32, @backend_platform_name : LibC::Char*, @backend_renderer_name : LibC::Char*, @backend_platform_user_data : Void*, @backend_renderer_user_data : Void*, @backend_language_user_data : Void*, @get_clipboard_text_fn : (Void*) -> LibC::Char*, @set_clipboard_text_fn : (Void*, LibC::Char*) -> Void, @clipboard_user_data : Void*, @ime_set_input_screen_pos_fn : (Int32, Int32) -> Void, @ime_window_handle : Void*, @render_draw_lists_fn_unused : Void*, @mouse_pos : ImVec2, @mouse_down : Bool, @mouse_wheel : Float32, @mouse_wheel_h : Float32, @key_ctrl : Bool, @key_shift : Bool, @key_alt : Bool, @key_super : Bool, @keys_down : Bool, @nav_inputs : Float32, @want_capture_mouse : Bool, @want_capture_keyboard : Bool, @want_text_input : Bool, @want_set_mouse_pos : Bool, @want_save_ini_settings : Bool, @nav_active : Bool, @nav_visible : Bool, @framerate : Float32, @metrics_render_vertices : Int32, @metrics_render_indices : Int32, @metrics_render_windows : Int32, @metrics_active_windows : Int32, @metrics_active_allocations : Int32, @mouse_delta : ImVec2, @key_mods : ImGuiKeyModFlags, @mouse_pos_prev : ImVec2, @mouse_clicked_pos : ImVec2, @mouse_clicked_time : Float64, @mouse_clicked : Bool, @mouse_double_clicked : Bool, @mouse_released : Bool, @mouse_down_owned : Bool, @mouse_down_was_double_click : Bool, @mouse_down_duration : Float32, @mouse_down_duration_prev : Float32, @mouse_drag_max_distance_abs : ImVec2, @mouse_drag_max_distance_sqr : Float32, @keys_down_duration : Float32, @keys_down_duration_prev : Float32, @nav_inputs_down_duration : Float32, @nav_inputs_down_duration_prev : Float32, @pen_pressure : Float32, @input_queue_surrogate : ImWchar16, @input_queue_characters : ImVectorInternal)
    end
  end

  @[Extern]
  struct ImGuiInputTextCallbackData
    property event_flag : ImGuiInputTextFlags
    property flags : ImGuiInputTextFlags
    property user_data : Void*
    property event_char : ImWchar
    property event_key : ImGuiKey
    property buf : LibC::Char*
    property buf_text_len : Int32
    property buf_size : Int32
    property buf_dirty : Bool
    property cursor_pos : Int32
    property selection_start : Int32
    property selection_end : Int32

    def initialize(@event_flag : ImGuiInputTextFlags, @flags : ImGuiInputTextFlags, @user_data : Void*, @event_char : ImWchar, @event_key : ImGuiKey, @buf : LibC::Char*, @buf_text_len : Int32, @buf_size : Int32, @buf_dirty : Bool, @cursor_pos : Int32, @selection_start : Int32, @selection_end : Int32)
    end
  end

  alias ImGuiInputTextState = Void
  alias ImGuiItemHoveredDataBackup = Void

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

  alias ImGuiMenuColumns = Void
  alias ImGuiNavMoveResult = Void
  alias ImGuiNextItemData = Void
  alias ImGuiNextWindowData = Void

  @[Extern]
  struct ImGuiOnceUponAFrame
    property ref_frame : Int32

    def initialize(@ref_frame : Int32)
    end
  end

  @[Extern]
  struct ImGuiPayload
    property data : Void*
    property data_size : Int32
    property source_id : ImGuiID
    property source_parent_id : ImGuiID
    property data_frame_count : Int32
    property data_type : LibC::Char
    property preview : Bool
    property delivery : Bool

    def initialize(@data : Void*, @data_size : Int32, @source_id : ImGuiID, @source_parent_id : ImGuiID, @data_frame_count : Int32, @data_type : LibC::Char, @preview : Bool, @delivery : Bool)
    end
  end

  alias ImGuiPopupData = Void
  alias ImGuiPtrOrIndex = Void
  alias ImGuiSettingsHandler = Void
  alias ImGuiShrinkWidthItem = Void

  @[Extern]
  struct ImGuiSizeCallbackData
    property user_data : Void*
    property pos : ImVec2
    property current_size : ImVec2
    property desired_size : ImVec2

    def initialize(@user_data : Void*, @pos : ImVec2, @current_size : ImVec2, @desired_size : ImVec2)
    end
  end

  @[Extern]
  struct ImGuiStorage
    @data : ImVectorInternal

    def data : ImVector(ImGuiStoragePair)
      pointerof(@data).as(ImVector(ImGuiStoragePair)*).value
    end

    def data=(data : ImVector(ImGuiStoragePair))
      pointerof(@data).value = data.as(ImVectorInternal*).value
    end

    def initialize(@data : ImVectorInternal)
    end
  end

  @[Extern]
  struct ImGuiStoragePair
    property key : ImGuiID

    @[Extern(union: true)]
    struct Union
      property val_i : Int32
      @val_i = uninitialized Int32
      property val_f : Float32
      @val_f = uninitialized Float32
      property val_p : Void*
      @val_p = uninitialized Void*
    end

    property val : Union

    def initialize(@key : ImGuiID, @val : Union)
    end
  end

  @[Extern]
  struct ImGuiStyle
    property alpha : Float32
    property window_padding : ImVec2
    property window_rounding : Float32
    property window_border_size : Float32
    property window_min_size : ImVec2
    property window_title_align : ImVec2
    property window_menu_button_position : ImGuiDir
    property child_rounding : Float32
    property child_border_size : Float32
    property popup_rounding : Float32
    property popup_border_size : Float32
    property frame_padding : ImVec2
    property frame_rounding : Float32
    property frame_border_size : Float32
    property item_spacing : ImVec2
    property item_inner_spacing : ImVec2
    property touch_extra_padding : ImVec2
    property indent_spacing : Float32
    property columns_min_spacing : Float32
    property scrollbar_size : Float32
    property scrollbar_rounding : Float32
    property grab_min_size : Float32
    property grab_rounding : Float32
    property tab_rounding : Float32
    property tab_border_size : Float32
    property tab_min_width_for_unselected_close_button : Float32
    property color_button_position : ImGuiDir
    property button_text_align : ImVec2
    property selectable_text_align : ImVec2
    property display_window_padding : ImVec2
    property display_safe_area_padding : ImVec2
    property mouse_cursor_scale : Float32
    property anti_aliased_lines : Bool
    property anti_aliased_fill : Bool
    property curve_tessellation_tol : Float32
    property circle_segment_max_error : Float32
    property colors : ImVec4

    def initialize(@alpha : Float32, @window_padding : ImVec2, @window_rounding : Float32, @window_border_size : Float32, @window_min_size : ImVec2, @window_title_align : ImVec2, @window_menu_button_position : ImGuiDir, @child_rounding : Float32, @child_border_size : Float32, @popup_rounding : Float32, @popup_border_size : Float32, @frame_padding : ImVec2, @frame_rounding : Float32, @frame_border_size : Float32, @item_spacing : ImVec2, @item_inner_spacing : ImVec2, @touch_extra_padding : ImVec2, @indent_spacing : Float32, @columns_min_spacing : Float32, @scrollbar_size : Float32, @scrollbar_rounding : Float32, @grab_min_size : Float32, @grab_rounding : Float32, @tab_rounding : Float32, @tab_border_size : Float32, @tab_min_width_for_unselected_close_button : Float32, @color_button_position : ImGuiDir, @button_text_align : ImVec2, @selectable_text_align : ImVec2, @display_window_padding : ImVec2, @display_safe_area_padding : ImVec2, @mouse_cursor_scale : Float32, @anti_aliased_lines : Bool, @anti_aliased_fill : Bool, @curve_tessellation_tol : Float32, @circle_segment_max_error : Float32, @colors : ImVec4)
    end
  end

  alias ImGuiStyleMod = Void
  alias ImGuiTabBar = Void
  alias ImGuiTabItem = Void

  @[Extern]
  struct ImGuiTextBuffer
    @buf : ImVectorInternal

    def buf : ImVector(LibC::Char)
      pointerof(@buf).as(ImVector(LibC::Char)*).value
    end

    def buf=(buf : ImVector(LibC::Char))
      pointerof(@buf).value = buf.as(ImVectorInternal*).value
    end

    def initialize(@buf : ImVectorInternal)
    end
  end

  @[Extern]
  struct ImGuiTextFilter
    property input_buf : LibC::Char
    @filters : ImVectorInternal

    def filters : ImVector(ImGuiTextRange)
      pointerof(@filters).as(ImVector(ImGuiTextRange)*).value
    end

    def filters=(filters : ImVector(ImGuiTextRange))
      pointerof(@filters).value = filters.as(ImVectorInternal*).value
    end

    property count_grep : Int32

    def initialize(@input_buf : LibC::Char, @filters : ImVectorInternal, @count_grep : Int32)
    end
  end

  @[Extern]
  struct ImGuiTextRange
    property b : LibC::Char*
    property e : LibC::Char*

    def initialize(@b : LibC::Char*, @e : LibC::Char*)
    end
  end

  alias ImGuiWindow = Void
  alias ImGuiWindowSettings = Void
  alias ImGuiWindowTempData = Void
  alias ImRect = Void
  alias ImVec1 = Void

  @[Extern]
  struct ImVec2
    property x : Float32
    property y : Float32

    def initialize(@x : Float32, @y : Float32)
    end
  end

  alias ImVec2ih = Void

  @[Extern]
  struct ImVec4
    property x : Float32
    property y : Float32
    property z : Float32
    property w : Float32

    def initialize(@x : Float32, @y : Float32, @z : Float32, @w : Float32)
    end
  end
end
