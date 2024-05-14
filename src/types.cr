module ImGui
  VERSION               = "1.90.4"
  VERSION_NUM           = 19040
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
  alias ImGuiSelectionUserData = LibImGui::ImGuiSelectionUserData
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
    NoNavInputs               = 1 << 16
    NoNavFocus                = 1 << 17
    UnsavedDocument           = 1 << 18
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

  @[Flags]
  enum ImGuiChildFlags
    None                   = 0
    Border                 = 1 << 0
    AlwaysUseWindowPadding = 1 << 1
    ResizeX                = 1 << 2
    ResizeY                = 1 << 3
    AutoResizeX            = 1 << 4
    AutoResizeY            = 1 << 5
    AlwaysAutoResize       = 1 << 6
    FrameStyle             = 1 << 7
  end
  alias TopLevel::ImGuiChildFlags = ImGui::ImGuiChildFlags

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
    AlwaysOverwrite     = 1 << 13
    ReadOnly            = 1 << 14
    Password            = 1 << 15
    NoUndoRedo          = 1 << 16
    CharsScientific     = 1 << 17
    CallbackResize      = 1 << 18
    CallbackEdit        = 1 << 19
    EscapeClearsAll     = 1 << 20
  end
  alias TopLevel::ImGuiInputTextFlags = ImGui::ImGuiInputTextFlags

  @[Flags]
  enum ImGuiTreeNodeFlags
    None                 = 0
    Selected             = 1 << 0
    Framed               = 1 << 1
    AllowOverlap         = 1 << 2
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
    SpanAllColumns       = 1 << 13
    NavLeftJumpsBackHere = 1 << 14
    CollapsingHeader     = Framed | NoTreePushOnOpen | NoAutoOpenOnLog
  end
  alias TopLevel::ImGuiTreeNodeFlags = ImGui::ImGuiTreeNodeFlags

  @[Flags]
  enum ImGuiPopupFlags
    None                    =    0
    MouseButtonLeft         =    0
    MouseButtonRight        =    1
    MouseButtonMiddle       =    2
    MouseButtonMask_        = 0x1F
    MouseButtonDefault_     =    1
    NoReopen                = 1 << 5
    NoOpenOverExistingPopup = 1 << 7
    NoOpenOverItems         = 1 << 8
    AnyPopupId              = 1 << 10
    AnyPopupLevel           = 1 << 11
    AnyPopup                = AnyPopupId | AnyPopupLevel
  end
  alias TopLevel::ImGuiPopupFlags = ImGui::ImGuiPopupFlags

  @[Flags]
  enum ImGuiSelectableFlags
    None             = 0
    DontClosePopups  = 1 << 0
    SpanAllColumns   = 1 << 1
    AllowDoubleClick = 1 << 2
    Disabled         = 1 << 3
    AllowOverlap     = 1 << 4
  end
  alias TopLevel::ImGuiSelectableFlags = ImGui::ImGuiSelectableFlags

  @[Flags]
  enum ImGuiComboFlags
    None            = 0
    PopupAlignLeft  = 1 << 0
    HeightSmall     = 1 << 1
    HeightRegular   = 1 << 2
    HeightLarge     = 1 << 3
    HeightLargest   = 1 << 4
    NoArrowButton   = 1 << 5
    NoPreview       = 1 << 6
    WidthFitPreview = 1 << 7
    HeightMask_     = HeightSmall | HeightRegular | HeightLarge | HeightLargest
  end
  alias TopLevel::ImGuiComboFlags = ImGui::ImGuiComboFlags

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
    NoReorder                    = 1 << 5
    Leading                      = 1 << 6
    Trailing                     = 1 << 7
    NoAssumedClosure             = 1 << 8
  end
  alias TopLevel::ImGuiTabItemFlags = ImGui::ImGuiTabItemFlags

  @[Flags]
  enum ImGuiFocusedFlags
    None                = 0
    ChildWindows        = 1 << 0
    RootWindow          = 1 << 1
    AnyWindow           = 1 << 2
    NoPopupHierarchy    = 1 << 3
    RootAndChildWindows = RootWindow | ChildWindows
  end
  alias TopLevel::ImGuiFocusedFlags = ImGui::ImGuiFocusedFlags

  @[Flags]
  enum ImGuiHoveredFlags
    None                         = 0
    ChildWindows                 = 1 << 0
    RootWindow                   = 1 << 1
    AnyWindow                    = 1 << 2
    NoPopupHierarchy             = 1 << 3
    AllowWhenBlockedByPopup      = 1 << 5
    AllowWhenBlockedByActiveItem = 1 << 7
    AllowWhenOverlappedByItem    = 1 << 8
    AllowWhenOverlappedByWindow  = 1 << 9
    AllowWhenDisabled            = 1 << 10
    NoNavOverride                = 1 << 11
    AllowWhenOverlapped          = AllowWhenOverlappedByItem | AllowWhenOverlappedByWindow
    RectOnly                     = AllowWhenBlockedByPopup | AllowWhenBlockedByActiveItem | AllowWhenOverlapped
    RootAndChildWindows          = RootWindow | ChildWindows
    ForTooltip                   = 1 << 12
    Stationary                   = 1 << 13
    DelayNone                    = 1 << 14
    DelayShort                   = 1 << 15
    DelayNormal                  = 1 << 16
    NoSharedDelay                = 1 << 17
  end
  alias TopLevel::ImGuiHoveredFlags = ImGui::ImGuiHoveredFlags

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

  enum ImGuiSortDirection
    None       = 0
    Ascending  = 1
    Descending = 2
  end
  alias TopLevel::ImGuiSortDirection = ImGui::ImGuiSortDirection

  enum ImGuiKey
    None                =   0
    Tab                 = 512
    LeftArrow           = 513
    RightArrow          = 514
    UpArrow             = 515
    DownArrow           = 516
    PageUp              = 517
    PageDown            = 518
    Home                = 519
    End                 = 520
    Insert              = 521
    Delete              = 522
    Backspace           = 523
    Space               = 524
    Enter               = 525
    Escape              = 526
    LeftCtrl            = 527
    LeftShift           = 528
    LeftAlt             = 529
    LeftSuper           = 530
    RightCtrl           = 531
    RightShift          = 532
    RightAlt            = 533
    RightSuper          = 534
    Menu                = 535
    Num0                = 536
    Num1                = 537
    Num2                = 538
    Num3                = 539
    Num4                = 540
    Num5                = 541
    Num6                = 542
    Num7                = 543
    Num8                = 544
    Num9                = 545
    A                   = 546
    B                   = 547
    C                   = 548
    D                   = 549
    E                   = 550
    F                   = 551
    G                   = 552
    H                   = 553
    I                   = 554
    J                   = 555
    K                   = 556
    L                   = 557
    M                   = 558
    N                   = 559
    O                   = 560
    P                   = 561
    Q                   = 562
    R                   = 563
    S                   = 564
    T                   = 565
    U                   = 566
    V                   = 567
    W                   = 568
    X                   = 569
    Y                   = 570
    Z                   = 571
    F1                  = 572
    F2                  = 573
    F3                  = 574
    F4                  = 575
    F5                  = 576
    F6                  = 577
    F7                  = 578
    F8                  = 579
    F9                  = 580
    F10                 = 581
    F11                 = 582
    F12                 = 583
    F13                 = 584
    F14                 = 585
    F15                 = 586
    F16                 = 587
    F17                 = 588
    F18                 = 589
    F19                 = 590
    F20                 = 591
    F21                 = 592
    F22                 = 593
    F23                 = 594
    F24                 = 595
    Apostrophe          = 596
    Comma               = 597
    Minus               = 598
    Period              = 599
    Slash               = 600
    Semicolon           = 601
    Equal               = 602
    LeftBracket         = 603
    Backslash           = 604
    RightBracket        = 605
    GraveAccent         = 606
    CapsLock            = 607
    ScrollLock          = 608
    NumLock             = 609
    PrintScreen         = 610
    Pause               = 611
    Keypad0             = 612
    Keypad1             = 613
    Keypad2             = 614
    Keypad3             = 615
    Keypad4             = 616
    Keypad5             = 617
    Keypad6             = 618
    Keypad7             = 619
    Keypad8             = 620
    Keypad9             = 621
    KeypadDecimal       = 622
    KeypadDivide        = 623
    KeypadMultiply      = 624
    KeypadSubtract      = 625
    KeypadAdd           = 626
    KeypadEnter         = 627
    KeypadEqual         = 628
    AppBack             = 629
    AppForward          = 630
    GamepadStart        = 631
    GamepadBack         = 632
    GamepadFaceLeft     = 633
    GamepadFaceRight    = 634
    GamepadFaceUp       = 635
    GamepadFaceDown     = 636
    GamepadDpadLeft     = 637
    GamepadDpadRight    = 638
    GamepadDpadUp       = 639
    GamepadDpadDown     = 640
    GamepadL1           = 641
    GamepadR1           = 642
    GamepadL2           = 643
    GamepadR2           = 644
    GamepadL3           = 645
    GamepadR3           = 646
    GamepadLStickLeft   = 647
    GamepadLStickRight  = 648
    GamepadLStickUp     = 649
    GamepadLStickDown   = 650
    GamepadRStickLeft   = 651
    GamepadRStickRight  = 652
    GamepadRStickUp     = 653
    GamepadRStickDown   = 654
    MouseLeft           = 655
    MouseRight          = 656
    MouseMiddle         = 657
    MouseX1             = 658
    MouseX2             = 659
    MouseWheelX         = 660
    MouseWheelY         = 661
    ReservedForModCtrl  = 662
    ReservedForModShift = 663
    ReservedForModAlt   = 664
    ReservedForModSuper = 665
    COUNT               = 666
    Mod_None            =   0
    Mod_Ctrl            = 1 << 12
    Mod_Shift           = 1 << 13
    Mod_Alt             = 1 << 14
    Mod_Super           = 1 << 15
    Mod_Shortcut        = 1 << 11
    Mod_Mask_           = 0xF800
  end
  alias TopLevel::ImGuiKey = ImGui::ImGuiKey

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

  @[Flags]
  enum ImGuiBackendFlags
    None                 = 0
    HasGamepad           = 1 << 0
    HasMouseCursors      = 1 << 1
    HasSetMousePos       = 1 << 2
    RendererHasVtxOffset = 1 << 3
  end
  alias TopLevel::ImGuiBackendFlags = ImGui::ImGuiBackendFlags

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
    TableHeaderBg         = 42
    TableBorderStrong     = 43
    TableBorderLight      = 44
    TableRowBg            = 45
    TableRowBgAlt         = 46
    TextSelectedBg        = 47
    DragDropTarget        = 48
    NavHighlight          = 49
    NavWindowingHighlight = 50
    NavWindowingDimBg     = 51
    ModalWindowDimBg      = 52
  end
  alias TopLevel::ImGuiCol = ImGui::ImGuiCol

  enum ImGuiStyleVar
    Alpha                   =  0
    DisabledAlpha           =  1
    WindowPadding           =  2
    WindowRounding          =  3
    WindowBorderSize        =  4
    WindowMinSize           =  5
    WindowTitleAlign        =  6
    ChildRounding           =  7
    ChildBorderSize         =  8
    PopupRounding           =  9
    PopupBorderSize         = 10
    FramePadding            = 11
    FrameRounding           = 12
    FrameBorderSize         = 13
    ItemSpacing             = 14
    ItemInnerSpacing        = 15
    IndentSpacing           = 16
    CellPadding             = 17
    ScrollbarSize           = 18
    ScrollbarRounding       = 19
    GrabMinSize             = 20
    GrabRounding            = 21
    TabRounding             = 22
    TabBarBorderSize        = 23
    ButtonTextAlign         = 24
    SelectableTextAlign     = 25
    SeparatorTextBorderSize = 26
    SeparatorTextAlign      = 27
    SeparatorTextPadding    = 28
  end
  alias TopLevel::ImGuiStyleVar = ImGui::ImGuiStyleVar

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
    DefaultOptions_  = Uint8 | DisplayRGB | InputRGB | PickerHueBar
    DisplayMask_     = DisplayRGB | DisplayHSV | DisplayHex
    DataTypeMask_    = Uint8 | Float
    PickerMask_      = PickerHueWheel | PickerHueBar
    InputMask_       = InputRGB | InputHSV
  end
  alias TopLevel::ImGuiColorEditFlags = ImGui::ImGuiColorEditFlags

  @[Flags]
  enum ImGuiSliderFlags
    None            = 0
    AlwaysClamp     = 1 << 4
    Logarithmic     = 1 << 5
    NoRoundToFormat = 1 << 6
    NoInput         = 1 << 7
    InvalidMask_    = 0x7000000F
  end
  alias TopLevel::ImGuiSliderFlags = ImGui::ImGuiSliderFlags

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

  enum ImGuiMouseSource
    Mouse       = 0
    TouchScreen = 1
    Pen         = 2
  end
  alias TopLevel::ImGuiMouseSource = ImGui::ImGuiMouseSource

  enum ImGuiCond
    None         = 0
    Always       = 1 << 0
    Once         = 1 << 1
    FirstUseEver = 1 << 2
    Appearing    = 1 << 3
  end
  alias TopLevel::ImGuiCond = ImGui::ImGuiCond

  @[Flags]
  enum ImGuiTableFlags
    None                       = 0
    Resizable                  = 1 << 0
    Reorderable                = 1 << 1
    Hideable                   = 1 << 2
    Sortable                   = 1 << 3
    NoSavedSettings            = 1 << 4
    ContextMenuInBody          = 1 << 5
    RowBg                      = 1 << 6
    BordersInnerH              = 1 << 7
    BordersOuterH              = 1 << 8
    BordersInnerV              = 1 << 9
    BordersOuterV              = 1 << 10
    BordersH                   = BordersInnerH | BordersOuterH
    BordersV                   = BordersInnerV | BordersOuterV
    BordersInner               = BordersInnerV | BordersInnerH
    BordersOuter               = BordersOuterV | BordersOuterH
    Borders                    = BordersInner | BordersOuter
    NoBordersInBody            = 1 << 11
    NoBordersInBodyUntilResize = 1 << 12
    SizingFixedFit             = 1 << 13
    SizingFixedSame            = 2 << 13
    SizingStretchProp          = 3 << 13
    SizingStretchSame          = 4 << 13
    NoHostExtendX              = 1 << 16
    NoHostExtendY              = 1 << 17
    NoKeepColumnsVisible       = 1 << 18
    PreciseWidths              = 1 << 19
    NoClip                     = 1 << 20
    PadOuterX                  = 1 << 21
    NoPadOuterX                = 1 << 22
    NoPadInnerX                = 1 << 23
    ScrollX                    = 1 << 24
    ScrollY                    = 1 << 25
    SortMulti                  = 1 << 26
    SortTristate               = 1 << 27
    HighlightHoveredColumn     = 1 << 28
    SizingMask_                = SizingFixedFit | SizingFixedSame | SizingStretchProp | SizingStretchSame
  end
  alias TopLevel::ImGuiTableFlags = ImGui::ImGuiTableFlags

  @[Flags]
  enum ImGuiTableColumnFlags
    None                 = 0
    Disabled             = 1 << 0
    DefaultHide          = 1 << 1
    DefaultSort          = 1 << 2
    WidthStretch         = 1 << 3
    WidthFixed           = 1 << 4
    NoResize             = 1 << 5
    NoReorder            = 1 << 6
    NoHide               = 1 << 7
    NoClip               = 1 << 8
    NoSort               = 1 << 9
    NoSortAscending      = 1 << 10
    NoSortDescending     = 1 << 11
    NoHeaderLabel        = 1 << 12
    NoHeaderWidth        = 1 << 13
    PreferSortAscending  = 1 << 14
    PreferSortDescending = 1 << 15
    IndentEnable         = 1 << 16
    IndentDisable        = 1 << 17
    AngledHeader         = 1 << 18
    IsEnabled            = 1 << 24
    IsVisible            = 1 << 25
    IsSorted             = 1 << 26
    IsHovered            = 1 << 27
    WidthMask_           = WidthStretch | WidthFixed
    IndentMask_          = IndentEnable | IndentDisable
    StatusMask_          = IsEnabled | IsVisible | IsSorted | IsHovered
    NoDirectResize_      = 1 << 30
  end
  alias TopLevel::ImGuiTableColumnFlags = ImGui::ImGuiTableColumnFlags

  @[Flags]
  enum ImGuiTableRowFlags
    None    = 0
    Headers = 1 << 0
  end
  alias TopLevel::ImGuiTableRowFlags = ImGui::ImGuiTableRowFlags

  enum ImGuiTableBgTarget
    None   = 0
    RowBg0 = 1
    RowBg1 = 2
    CellBg = 3
  end
  alias TopLevel::ImGuiTableBgTarget = ImGui::ImGuiTableBgTarget

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

  @[Flags]
  enum ImDrawFlags
    None                    = 0
    Closed                  = 1 << 0
    RoundCornersTopLeft     = 1 << 4
    RoundCornersTopRight    = 1 << 5
    RoundCornersBottomLeft  = 1 << 6
    RoundCornersBottomRight = 1 << 7
    RoundCornersNone        = 1 << 8
    RoundCornersTop         = RoundCornersTopLeft | RoundCornersTopRight
    RoundCornersBottom      = RoundCornersBottomLeft | RoundCornersBottomRight
    RoundCornersLeft        = RoundCornersBottomLeft | RoundCornersTopLeft
    RoundCornersRight       = RoundCornersBottomRight | RoundCornersTopRight
    RoundCornersAll         = RoundCornersTopLeft | RoundCornersTopRight | RoundCornersBottomLeft | RoundCornersBottomRight
    RoundCornersDefault_    = RoundCornersAll
    RoundCornersMask_       = RoundCornersAll | RoundCornersNone
  end
  alias TopLevel::ImDrawFlags = ImGui::ImDrawFlags

  @[Flags]
  enum ImDrawListFlags
    None                   = 0
    AntiAliasedLines       = 1 << 0
    AntiAliasedLinesUseTex = 1 << 1
    AntiAliasedFill        = 1 << 2
    AllowVtxOffset         = 1 << 3
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

  @[Flags]
  enum ImFontAtlasFlags
    None               = 0
    NoPowerOfTwoHeight = 1 << 0
    NoMouseCursors     = 1 << 1
    NoBakedLines       = 1 << 2
  end
  alias TopLevel::ImFontAtlasFlags = ImGui::ImFontAtlasFlags

  @[Flags]
  enum ImGuiViewportFlags
    None              = 0
    IsPlatformWindow  = 1 << 0
    IsPlatformMonitor = 1 << 1
    OwnedByApp        = 1 << 2
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
    AllowOverlap             = 1 << 9
    Inputable                = 1 << 10
    HasSelectionUserData     = 1 << 11
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
    Visible          = 1 << 8
    HasClipRect      = 1 << 9
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
    HasChildFlags     = 1 << 8
  end

  # :nodoc:
  @[Flags]
  enum ImGuiNextItemDataFlags
    None        = 0
    HasWidth    = 1 << 0
    HasOpen     = 1 << 1
    HasShortcut = 1 << 2
  end

  # :nodoc:
  enum ImGuiPopupPositionPolicy
    Default  = 0
    ComboBox = 1
    Tooltip  = 2
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
    None                             = 0
    Repeat                           = 1 << 0
    RepeatRateDefault                = 1 << 1
    RepeatRateNavMove                = 1 << 2
    RepeatRateNavTweak               = 1 << 3
    RepeatUntilRelease               = 1 << 4
    RepeatUntilKeyModsChange         = 1 << 5
    RepeatUntilKeyModsChangeFromNone = 1 << 6
    RepeatUntilOtherKeyPress         = 1 << 7
    CondHovered                      = 1 << 8
    CondActive                       = 1 << 9
    CondDefault_                     = CondHovered | CondActive
    LockThisFrame                    = 1 << 10
    LockUntilRelease                 = 1 << 11
    RouteFocused                     = 1 << 12
    RouteGlobalLow                   = 1 << 13
    RouteGlobal                      = 1 << 14
    RouteGlobalHigh                  = 1 << 15
    RouteAlways                      = 1 << 16
    RouteUnlessBgFocused             = 1 << 17
    RepeatRateMask_                  = RepeatRateDefault | RepeatRateNavMove | RepeatRateNavTweak
    RepeatUntilMask_                 = RepeatUntilRelease | RepeatUntilKeyModsChange | RepeatUntilKeyModsChangeFromNone | RepeatUntilOtherKeyPress
    RepeatMask_                      = Repeat | RepeatRateMask_ | RepeatUntilMask_
    CondMask_                        = CondHovered | CondActive
    RouteMask_                       = RouteFocused | RouteGlobal | RouteGlobalLow | RouteGlobalHigh
    SupportedByIsKeyPressed          = RepeatMask_
    SupportedByIsMouseClicked        = Repeat
    SupportedByShortcut              = RepeatMask_ | RouteMask_ | RouteAlways | RouteUnlessBgFocused
    SupportedBySetKeyOwner           = LockThisFrame | LockUntilRelease
    SupportedBySetItemKeyOwner       = SupportedBySetKeyOwner | CondMask_
  end

  # :nodoc:
  @[Flags]
  enum ImGuiActivateFlags
    None               = 0
    PreferInput        = 1 << 0
    PreferTweak        = 1 << 1
    TryToPreserveState = 1 << 2
    FromTabbing        = 1 << 3
    FromShortcut       = 1 << 4
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
    None       = 0
    Compact    = 1 << 1
    AlwaysDraw = 1 << 2
    NoRounding = 1 << 3
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
  enum ImGuiTypingSelectFlags
    None                = 0
    AllowBackspace      = 1 << 0
    AllowSingleCharMode = 1 << 1
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
    None               = 0
    EventActiveId      = 1 << 0
    EventFocus         = 1 << 1
    EventPopup         = 1 << 2
    EventNav           = 1 << 3
    EventClipper       = 1 << 4
    EventSelection     = 1 << 5
    EventIO            = 1 << 6
    EventInputRouting  = 1 << 7
    EventMask_         = EventActiveId | EventFocus | EventPopup | EventNav | EventClipper | EventSelection | EventIO | EventInputRouting
    OutputToTTY        = 1 << 20
    OutputToTestEngine = 1 << 21
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
