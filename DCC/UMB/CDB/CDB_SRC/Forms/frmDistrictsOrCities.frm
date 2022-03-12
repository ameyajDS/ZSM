VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "EDT32X30.OCX"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.OCX"
Begin VB.Form frmDistrictsOrCities 
   BackColor       =   &H00C0C0C0&
   Caption         =   "DISTRICTS OR CITIES"
   ClientHeight    =   8490
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8880
   ControlBox      =   0   'False
   FillStyle       =   0  'Solid
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00800000&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8490
   ScaleWidth      =   8880
   WindowState     =   2  'Maximized
   Begin VB.Frame fraDistrictsOrCities 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   8505
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   26055
      Begin EditLib.fpLongInteger txtID 
         Height          =   345
         Left            =   3720
         TabIndex        =   0
         Top             =   480
         Width           =   615
         _Version        =   196608
         _ExtentX        =   1085
         _ExtentY        =   617
         Enabled         =   -1  'True
         MousePointer    =   0
         Object.TabStop         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   14737632
         ForeColor       =   -2147483640
         ThreeDInsideStyle=   0
         ThreeDInsideHighlightColor=   -2147483633
         ThreeDInsideShadowColor=   -2147483642
         ThreeDInsideWidth=   1
         ThreeDOutsideStyle=   0
         ThreeDOutsideHighlightColor=   16777215
         ThreeDOutsideShadowColor=   -2147483632
         ThreeDOutsideWidth=   1
         ThreeDFrameWidth=   0
         BorderStyle     =   2
         BorderColor     =   -2147483642
         BorderWidth     =   1
         ButtonDisable   =   0   'False
         ButtonHide      =   0   'False
         ButtonIncrement =   1
         ButtonMin       =   0
         ButtonMax       =   100
         ButtonStyle     =   0
         ButtonWidth     =   0
         ButtonWrap      =   -1  'True
         ButtonDefaultAction=   -1  'True
         ThreeDText      =   0
         ThreeDTextHighlightColor=   -2147483633
         ThreeDTextShadowColor=   -2147483632
         ThreeDTextOffset=   1
         AlignTextH      =   2
         AlignTextV      =   0
         AllowNull       =   -1  'True
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   -1  'True
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   -2147483637
         InvalidOption   =   0
         MarginLeft      =   5
         MarginTop       =   1
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   14737632
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   1
         ControlType     =   0
         Text            =   ""
         MaxValue        =   "99999999"
         MinValue        =   "1"
         NegFormat       =   1
         NegToggle       =   0   'False
         Separator       =   ""
         UseSeparator    =   0   'False
         IncInt          =   1
         BorderGrayAreaColor=   12632256
         ThreeDOnFocusInvert=   0   'False
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   2
         BorderDropShadowColor=   -2147483632
         BorderDropShadowWidth=   3
         ButtonColor     =   -2147483633
         AutoMenu        =   0   'False
         ButtonAlign     =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin EditLib.fpText txtDistrictOrCityCode 
         Height          =   345
         Left            =   6855
         TabIndex        =   2
         Top             =   480
         Width           =   960
         _Version        =   196608
         _ExtentX        =   1693
         _ExtentY        =   617
         Enabled         =   -1  'True
         MousePointer    =   0
         Object.TabStop         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   14737632
         ForeColor       =   -2147483640
         ThreeDInsideStyle=   0
         ThreeDInsideHighlightColor=   -2147483633
         ThreeDInsideShadowColor=   -2147483642
         ThreeDInsideWidth=   1
         ThreeDOutsideStyle=   0
         ThreeDOutsideHighlightColor=   16777215
         ThreeDOutsideShadowColor=   -2147483632
         ThreeDOutsideWidth=   1
         ThreeDFrameWidth=   0
         BorderStyle     =   2
         BorderColor     =   -2147483642
         BorderWidth     =   1
         ButtonDisable   =   0   'False
         ButtonHide      =   0   'False
         ButtonIncrement =   1
         ButtonMin       =   0
         ButtonMax       =   100
         ButtonStyle     =   0
         ButtonWidth     =   0
         ButtonWrap      =   -1  'True
         ButtonDefaultAction=   -1  'True
         ThreeDText      =   0
         ThreeDTextHighlightColor=   -2147483633
         ThreeDTextShadowColor=   -2147483632
         ThreeDTextOffset=   1
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   -1  'True
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   -1  'True
         AutoCase        =   1
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   12632256
         InvalidOption   =   0
         MarginLeft      =   5
         MarginTop       =   1
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   -2147483637
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   1
         ControlType     =   0
         Text            =   ""
         CharValidationText=   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
         MaxLength       =   5
         MultiLine       =   0   'False
         PasswordChar    =   ""
         IncHoriz        =   0.25
         BorderGrayAreaColor=   12632256
         NoPrefix        =   0   'False
         ScrollV         =   0   'False
         ThreeDOnFocusInvert=   0   'False
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   2
         BorderDropShadowColor=   -2147483632
         BorderDropShadowWidth=   3
         ButtonColor     =   -2147483633
         AutoMenu        =   0   'False
         ButtonAlign     =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin EditLib.fpText txtDistrictOrCityName 
         Height          =   345
         Left            =   3720
         TabIndex        =   4
         Top             =   1140
         Width           =   4095
         _Version        =   196608
         _ExtentX        =   7223
         _ExtentY        =   617
         Enabled         =   -1  'True
         MousePointer    =   0
         Object.TabStop         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   14737632
         ForeColor       =   -2147483640
         ThreeDInsideStyle=   0
         ThreeDInsideHighlightColor=   -2147483633
         ThreeDInsideShadowColor=   -2147483642
         ThreeDInsideWidth=   1
         ThreeDOutsideStyle=   0
         ThreeDOutsideHighlightColor=   16777215
         ThreeDOutsideShadowColor=   -2147483632
         ThreeDOutsideWidth=   1
         ThreeDFrameWidth=   0
         BorderStyle     =   2
         BorderColor     =   -2147483642
         BorderWidth     =   1
         ButtonDisable   =   0   'False
         ButtonHide      =   0   'False
         ButtonIncrement =   1
         ButtonMin       =   0
         ButtonMax       =   100
         ButtonStyle     =   0
         ButtonWidth     =   0
         ButtonWrap      =   -1  'True
         ButtonDefaultAction=   -1  'True
         ThreeDText      =   0
         ThreeDTextHighlightColor=   -2147483633
         ThreeDTextShadowColor=   -2147483632
         ThreeDTextOffset=   1
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   -1  'True
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   -1  'True
         AutoCase        =   0
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   -2147483637
         InvalidOption   =   0
         MarginLeft      =   5
         MarginTop       =   1
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   -2147483637
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   1
         ControlType     =   0
         Text            =   ""
         CharValidationText=   ""
         MaxLength       =   35
         MultiLine       =   0   'False
         PasswordChar    =   ""
         IncHoriz        =   0.25
         BorderGrayAreaColor=   12632256
         NoPrefix        =   0   'False
         ScrollV         =   0   'False
         ThreeDOnFocusInvert=   0   'False
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   2
         BorderDropShadowColor=   -2147483632
         BorderDropShadowWidth=   3
         ButtonColor     =   -2147483633
         AutoMenu        =   0   'False
         ButtonAlign     =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin EditLib.fpText txtCountryName 
         Height          =   345
         Left            =   3720
         TabIndex        =   6
         Top             =   1800
         Width           =   4095
         _Version        =   196608
         _ExtentX        =   7223
         _ExtentY        =   617
         Enabled         =   -1  'True
         MousePointer    =   0
         Object.TabStop         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   14737632
         ForeColor       =   -2147483640
         ThreeDInsideStyle=   0
         ThreeDInsideHighlightColor=   -2147483633
         ThreeDInsideShadowColor=   -2147483642
         ThreeDInsideWidth=   1
         ThreeDOutsideStyle=   0
         ThreeDOutsideHighlightColor=   16777215
         ThreeDOutsideShadowColor=   -2147483632
         ThreeDOutsideWidth=   1
         ThreeDFrameWidth=   0
         BorderStyle     =   2
         BorderColor     =   -2147483642
         BorderWidth     =   1
         ButtonDisable   =   0   'False
         ButtonHide      =   0   'False
         ButtonIncrement =   1
         ButtonMin       =   0
         ButtonMax       =   100
         ButtonStyle     =   2
         ButtonWidth     =   0
         ButtonWrap      =   -1  'True
         ButtonDefaultAction=   -1  'True
         ThreeDText      =   0
         ThreeDTextHighlightColor=   -2147483633
         ThreeDTextShadowColor=   -2147483632
         ThreeDTextOffset=   1
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   -1  'True
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   -1  'True
         AutoCase        =   0
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   14737632
         InvalidOption   =   0
         MarginLeft      =   5
         MarginTop       =   1
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   -2147483637
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   1
         ControlType     =   0
         Text            =   ""
         CharValidationText=   ""
         MaxLength       =   35
         MultiLine       =   0   'False
         PasswordChar    =   ""
         IncHoriz        =   0.25
         BorderGrayAreaColor=   12632256
         NoPrefix        =   0   'False
         ScrollV         =   0   'False
         ThreeDOnFocusInvert=   0   'False
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   2
         BorderDropShadowColor=   -2147483632
         BorderDropShadowWidth=   3
         ButtonColor     =   -2147483633
         AutoMenu        =   0   'False
         ButtonAlign     =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin EditLib.fpDateTime txtEffectiveFrom 
         Height          =   345
         Left            =   3720
         TabIndex        =   10
         Top             =   3120
         Width           =   1575
         _Version        =   196608
         _ExtentX        =   2778
         _ExtentY        =   609
         Enabled         =   -1  'True
         MousePointer    =   0
         Object.TabStop         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   14737632
         ForeColor       =   -2147483640
         ThreeDInsideStyle=   0
         ThreeDInsideHighlightColor=   -2147483633
         ThreeDInsideShadowColor=   -2147483642
         ThreeDInsideWidth=   1
         ThreeDOutsideStyle=   0
         ThreeDOutsideHighlightColor=   16777215
         ThreeDOutsideShadowColor=   -2147483632
         ThreeDOutsideWidth=   1
         ThreeDFrameWidth=   0
         BorderStyle     =   2
         BorderColor     =   -2147483642
         BorderWidth     =   1
         ButtonDisable   =   0   'False
         ButtonHide      =   0   'False
         ButtonIncrement =   1
         ButtonMin       =   0
         ButtonMax       =   100
         ButtonStyle     =   3
         ButtonWidth     =   0
         ButtonWrap      =   -1  'True
         ButtonDefaultAction=   -1  'True
         ThreeDText      =   0
         ThreeDTextHighlightColor=   -2147483633
         ThreeDTextShadowColor=   -2147483632
         ThreeDTextOffset=   1
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   -1  'True
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   -1  'True
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   -2147483637
         InvalidOption   =   2
         MarginLeft      =   5
         MarginTop       =   1
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   14737632
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   1
         ControlType     =   0
         Text            =   ""
         DateCalcMethod  =   1
         DateTimeFormat  =   5
         UserDefinedFormat=   "dd-MMM-yyyy"
         DateMax         =   "00000000"
         DateMin         =   "00000000"
         TimeMax         =   "000000"
         TimeMin         =   "000000"
         TimeString1159  =   ""
         TimeString2359  =   ""
         DateDefault     =   "00000000"
         TimeDefault     =   "000000"
         TimeStyle       =   0
         BorderGrayAreaColor=   12632256
         ThreeDOnFocusInvert=   0   'False
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   2
         BorderDropShadowColor=   -2147483632
         BorderDropShadowWidth=   3
         PopUpType       =   1
         DateCalcY2KSplit=   60
         CaretPosition   =   0
         IncYear         =   1
         IncMonth        =   1
         IncDay          =   1
         IncHour         =   1
         IncMinute       =   1
         IncSecond       =   1
         ButtonColor     =   -2147483633
         AutoMenu        =   0   'False
         StartMonth      =   4
         ButtonAlign     =   0
         BoundDataType   =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin FPSpread.vaSpread sprDistrictCityPostOffices 
         Height          =   2985
         Left            =   2280
         TabIndex        =   13
         TabStop         =   0   'False
         Tag             =   "Post Office Spread"
         Top             =   3615
         Visible         =   0   'False
         Width           =   7035
         _Version        =   393216
         _ExtentX        =   12409
         _ExtentY        =   5265
         _StockProps     =   64
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ShadowColor     =   12632256
         SpreadDesigner  =   "frmDistrictsOrCities.frx":0000
      End
      Begin EditLib.fpText txtStateName 
         Height          =   345
         Left            =   3720
         TabIndex        =   8
         Top             =   2460
         Width           =   4095
         _Version        =   196608
         _ExtentX        =   7223
         _ExtentY        =   617
         Enabled         =   -1  'True
         MousePointer    =   0
         Object.TabStop         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   14737632
         ForeColor       =   -2147483640
         ThreeDInsideStyle=   0
         ThreeDInsideHighlightColor=   -2147483633
         ThreeDInsideShadowColor=   -2147483642
         ThreeDInsideWidth=   1
         ThreeDOutsideStyle=   0
         ThreeDOutsideHighlightColor=   16777215
         ThreeDOutsideShadowColor=   -2147483632
         ThreeDOutsideWidth=   1
         ThreeDFrameWidth=   0
         BorderStyle     =   2
         BorderColor     =   -2147483642
         BorderWidth     =   1
         ButtonDisable   =   0   'False
         ButtonHide      =   0   'False
         ButtonIncrement =   1
         ButtonMin       =   0
         ButtonMax       =   100
         ButtonStyle     =   2
         ButtonWidth     =   0
         ButtonWrap      =   -1  'True
         ButtonDefaultAction=   -1  'True
         ThreeDText      =   0
         ThreeDTextHighlightColor=   -2147483633
         ThreeDTextShadowColor=   -2147483632
         ThreeDTextOffset=   1
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   -1  'True
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   -1  'True
         AutoCase        =   0
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   14737632
         InvalidOption   =   0
         MarginLeft      =   5
         MarginTop       =   1
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   -2147483637
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   1
         ControlType     =   0
         Text            =   ""
         CharValidationText=   ""
         MaxLength       =   35
         MultiLine       =   0   'False
         PasswordChar    =   ""
         IncHoriz        =   0.25
         BorderGrayAreaColor=   12632256
         NoPrefix        =   0   'False
         ScrollV         =   0   'False
         ThreeDOnFocusInvert=   0   'False
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   2
         BorderDropShadowColor=   -2147483632
         BorderDropShadowWidth=   3
         ButtonColor     =   -2147483633
         AutoMenu        =   0   'False
         ButtonAlign     =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   345
         Left            =   6240
         TabIndex        =   12
         Top             =   3120
         Width           =   1575
         _Version        =   196608
         _ExtentX        =   2778
         _ExtentY        =   609
         Enabled         =   -1  'True
         MousePointer    =   0
         Object.TabStop         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   14737632
         ForeColor       =   -2147483640
         ThreeDInsideStyle=   0
         ThreeDInsideHighlightColor=   -2147483633
         ThreeDInsideShadowColor=   -2147483642
         ThreeDInsideWidth=   1
         ThreeDOutsideStyle=   0
         ThreeDOutsideHighlightColor=   16777215
         ThreeDOutsideShadowColor=   -2147483632
         ThreeDOutsideWidth=   1
         ThreeDFrameWidth=   0
         BorderStyle     =   2
         BorderColor     =   -2147483642
         BorderWidth     =   1
         ButtonDisable   =   0   'False
         ButtonHide      =   0   'False
         ButtonIncrement =   1
         ButtonMin       =   0
         ButtonMax       =   100
         ButtonStyle     =   3
         ButtonWidth     =   0
         ButtonWrap      =   -1  'True
         ButtonDefaultAction=   -1  'True
         ThreeDText      =   0
         ThreeDTextHighlightColor=   -2147483633
         ThreeDTextShadowColor=   -2147483632
         ThreeDTextOffset=   1
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   -1  'True
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   -1  'True
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   -2147483637
         InvalidOption   =   2
         MarginLeft      =   5
         MarginTop       =   1
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   14737632
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   1
         ControlType     =   0
         Text            =   ""
         DateCalcMethod  =   1
         DateTimeFormat  =   5
         UserDefinedFormat=   "dd-mmm-yyyy"
         DateMax         =   "00000000"
         DateMin         =   "00000000"
         TimeMax         =   "000000"
         TimeMin         =   "000000"
         TimeString1159  =   ""
         TimeString2359  =   ""
         DateDefault     =   "00000000"
         TimeDefault     =   "000000"
         TimeStyle       =   0
         BorderGrayAreaColor=   12632256
         ThreeDOnFocusInvert=   0   'False
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   2
         BorderDropShadowColor=   -2147483632
         BorderDropShadowWidth=   3
         PopUpType       =   1
         DateCalcY2KSplit=   60
         CaretPosition   =   0
         IncYear         =   1
         IncMonth        =   1
         IncDay          =   1
         IncHour         =   1
         IncMinute       =   1
         IncSecond       =   1
         ButtonColor     =   -2147483633
         AutoMenu        =   0   'False
         StartMonth      =   4
         ButtonAlign     =   0
         BoundDataType   =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin VB.Label lblDistrictOrCityCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Code "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6855
         TabIndex        =   1
         Top             =   240
         Width           =   510
      End
      Begin VB.Label lblDistrictOrCityName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   3
         Top             =   900
         Width           =   570
      End
      Begin VB.Label lblState 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "State"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   7
         Top             =   2220
         Width           =   465
      End
      Begin VB.Label lblEffectiveTill 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6240
         TabIndex        =   11
         Top             =   2880
         Width           =   1080
      End
      Begin VB.Label lblCountry 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Country"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   5
         Top             =   1560
         Width           =   675
      End
      Begin VB.Label lblEffectiveFrom 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   9
         Top             =   2880
         Width           =   1290
      End
      Begin VB.Label lblId 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ID"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   17
         Top             =   240
         Width           =   180
      End
   End
   Begin VB.Frame fraListDistrictsOrCities 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   7935
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Width           =   14805
      Begin FPSpread.vaSpread sprListDistrictsOrCities 
         Height          =   6495
         Left            =   120
         TabIndex        =   15
         TabStop         =   0   'False
         Tag             =   "Districts Or Cities List Spread"
         Top             =   120
         Width           =   11760
         _Version        =   393216
         _ExtentX        =   20743
         _ExtentY        =   11456
         _StockProps     =   64
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ShadowColor     =   12632256
         SpreadDesigner  =   "frmDistrictsOrCities.frx":020C
      End
   End
End
Attribute VB_Name = "frmDistrictsOrCities"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Implements clsWindowInterface
Implements clsEditInterface
Implements clsQueryInterface
Implements clsCalledFormInterface
Implements clsCallingFormInterface

'This variable holds the value of the current mode of the form. This is set each time the form is opened in
'different mode with the 'showForm()' method of the 'clsWindowInterface'. And the value of this variable is
'returned, whenever requested through 'getMode()' method of the 'clsWindowInterface'
Dim intMode As Integer

'stores newly generated country ID returned in fireSave() method of clsEditInterface.
'the variable holding ID is displayed in message bar in Insert Mode as well as
'is called in getReturnValues() method of clsCalledFormInterface to set
'the local variable strIDText in NewMode
Dim intDistCityID As Long

'stores value of txn_ts. the variable is filled in 'populateFieldsFromRetrievalSpread' method of
'clsQueryInterface
Dim varTxnTs As Variant

'The declaration of spread controller for retrieving the records from the districts_or_cities table. This
'spread controller is also used to show the records in list mode. This object variable is defined "withEvents"
'because this code module needs to catch the events thrown by this controller (like 'validateCell',
''validateRow' etc)
Dim sprListDistrictsOrCitiesController As clsSpreadController

'The declaration of spread controller for retrieving and browsing the post_offices of the specified states.
'This object variable is defined "withEvents" because this code module needs to catch the events thrown by
'this controller (like 'validateCell', 'validateRow' etc)
Dim sprDistrictCityPostOfficesController As clsSpreadController

'This enum holds all the column numbers of the spread controller 'sprListDistrictsOrCitiesController' that
'shows all the records of districts or cities. The column numbers are stored into variables named corresponding
'to column names. These are called in functions of spreadController like 'getTextOfCell' or 'setTextOfCell'
'which requires row number and column number.
Private Enum distCityColumns
    distCityCode = 1
    distCityName = 2
    countryID = 3
    countryName = 4
    stateID = 5
    stateName = 6
    txn_ts = 7
    effectivefrom = 8
    effectiveTill = 9
    distCityID = 10
End Enum

'Implementation of 'getReturnValues()' method of the clsCalledFormInterface. This method returns the displayText
'and the idText to the calling form throught the setReturnedValues() method of the clsCallingFormInterface of
'the. The arguments passed are by reference.
Public Sub clsCalledFormInterface_getReturnValues(p_strDisplayText As String, _
                                                  p_strIDText As String, _
                                                  p_colAdditionalValues As Collection)
    
    p_strDisplayText = Me.txtDistrictOrCityName.Text
    
    Select Case intMode
        Case uiManager.NEW_MODE
            'variable intDistCityID holds the newly created District Or City ID
            p_strIDText = intDistCityID
        Case uiManager.UPDATE_MODE, uiManager.REFERENCE_MODE
            p_strIDText = Me.txtID.Text
    End Select

End Sub

'Implementation of the 'showCalledForm()' method of the clsCalledFormInterface.In this mehod the form is opened
'in the required mode stated by the parameter 'p_intCallMode'. If the requested mode is UPDATE or REFERENCE mode,
'then the fields are populated with the appropriate record which is fetched from database using the other three
'parameters viz p_strDisplayText, p_strIDText and p_strMultipartText. The retrieval mechanism of this record is
'same as the retrieval mechanism of the form in RETRIEVE MODE
Public Sub clsCalledFormInterface_showCalledForm(ByVal p_intCallMode As Integer, _
                                                 ByVal p_strDisplayText As String, _
                                                 ByVal p_strIDText As String, _
                                                 p_colAdditionalValues As Collection)
    
On Error GoTo errortag

    Me.clsWindowInterface_showForm p_intCallMode
    
    Select Case intMode
        
        Case uiManager.NEW_MODE
            
            'first populate country, otherwise on change, state values shall get deleted
            Me.txtCountryName.Tag = p_colAdditionalValues("country_id")
            Me.txtCountryName.Text = p_colAdditionalValues("country_nm")
            Me.txtCountryName.DataField = p_colAdditionalValues("country_nm")
            
            Me.txtStateName.Tag = p_colAdditionalValues("state_id")
            Me.txtStateName.Text = p_colAdditionalValues("state_nm")
            Me.txtStateName.DataField = p_colAdditionalValues("state_nm")
            
        Case uiManager.UPDATE_MODE, uiManager.REFERENCE_MODE
        
            Me.txtID.Text = p_strIDText
            'setting the screen with the values corresponding to the given District Or City ID
            sprListDistrictsOrCitiesController.retrieveRecords Me.clsQueryInterface_getSQLStringForRetrieval
            clsQueryInterface_populateFieldsFromRetrievalSpread (1)
            
    End Select
    
Exit Sub

errortag:
    errorManager.setErrorAttributes "UnknownError", "clsCalledFormInterface_showCalledForm", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'implementation of the getForeignKeyInformation() method of the clsCallingFormInterface. This method returns the
'foreign key information of a particular control stated by parameter p_objActiveControl. The values are set into
'the parameters themselves as these parameters are coming by reference. This information is used by ADL to open
'the called form in a specific mode, when user clicks on the new/reference menu items in the operations menu.
Public Sub clsCallingFormInterface_getForeignKeyInformation(p_objActiveControl As Object, _
                                                            p_objCallForm As Object, _
                                                            p_strDisplayText As String, _
                                                            p_strIDText As String, _
                                                            p_colAdditionalValues As Collection)
    If p_objActiveControl Is Me.txtCountryName Then
        Set p_objCallForm = modMain.countries
        p_strDisplayText = Me.txtCountryName.Text
        p_strIDText = Me.txtCountryName.Tag
        'country screen does not need any additional values, so set it to nothing explicitly
        Set p_colAdditionalValues = Nothing
    End If

    If p_objActiveControl Is Me.txtStateName Then
        Set p_objCallForm = modMain.states
        p_strDisplayText = Me.txtStateName.Text
        p_strIDText = Me.txtCountryName.Tag
        p_colAdditionalValues.Add Me.txtCountryName.Tag, "country_id"
        p_colAdditionalValues.Add Me.txtCountryName.DataField, "country_nm"
    End If
    
End Sub

'Implementation of setReturnedValues() of the clsCallingFormInterface. It sets the return values, from the
'called form, back into the controls. The value stated by p_strDisplayText is set to the field which called
'the called form and the value stated by p_strIDText is stored in a variable for backend processing with database.
Public Sub clsCallingFormInterface_setReturnedValues(p_objSourceObject As Object, _
                                                     ByVal p_strDisplayText As String, _
                                                     ByVal p_strIDText As String, _
                                                     p_colAdditionalValues As Collection)
    If p_objSourceObject Is Me.txtCountryName Then
        utils.clearControls Me.txtStateName
    End If
    
    If p_objSourceObject Is Me.txtStateName Then
        'focus is set to next control, otherwise lookup is again hit on TAB
        Me.txtEffectiveFrom.SetFocus
    End If
    
End Sub

'private function returning true when the field - country name is valid, otherwise false
Private Function validateCountryName() As Boolean
    validateCountryName = True
    
    'check for mandatory field
    If Trim(Me.txtCountryName.Text) = "" Then
        'clearing datafield & tag and dependent values of foreign key control - country name
        utils.clearControls Me.txtCountryName, Me.txtStateName
        If intMode <> uiManager.QUERY_MODE Then
            Me.txtCountryName.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "Country Name", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            validateCountryName = False
            Exit Function
        End If
    End If
End Function

'private function returning true when the field - state name is valid, otherwise false
Private Function validateStateName() As Boolean
    validateStateName = True

    'check for mandatory field
    If Trim(Me.txtStateName.Text) = "" Then
        utils.clearControls Me.txtStateName
        If intMode <> uiManager.QUERY_MODE Then
            Me.txtStateName.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "State Name", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            validateStateName = False
            Exit Function
        End If
    End If
End Function

'private function returning true when the field - district or city name is valid, otherwise false
Private Function validateDistCityName() As Boolean
    validateDistCityName = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtDistrictOrCityName.Text) = "" Then
        Me.txtDistrictOrCityName.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "District or City Name", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateDistCityName = False
    End If
End Function

'private function returning true when the field - district or city code is valid, otherwise false
Private Function validateDistCityCode() As Boolean
    validateDistCityCode = True
    
    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtDistrictOrCityCode.Text) = "" Then
        Me.txtDistrictOrCityCode.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "District or City Code", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateDistCityCode = False
    End If
End Function

'private function returning true when the field - effective from is valid, otherwise false
Private Function validateEffectiveFrom() As Boolean
    validateEffectiveFrom = True
    
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE) Then
        If Trim(Me.txtEffectiveFrom.Text) = "" Then
            Me.txtEffectiveFrom.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "Effective From", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            validateEffectiveFrom = False
        ElseIf (Trim(Me.txtEffectiveTill.Text) <> "") Then
            If DateDiff("d", Me.txtEffectiveFrom.Text, Me.txtEffectiveTill.Text) < 0 Then
                logger.logMessage modStandardMessages.LesserOrEqualValueReqd, "Effective From|Effective Till", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
                validateEffectiveFrom = False
            End If
        End If
    ElseIf Len(Trim(Me.txtEffectiveFrom.Text)) < 11 Then
        Me.txtEffectiveFrom.SetFocus
        logger.logMessage modStandardMessages.InvalidValue, "value " & Me.txtEffectiveFrom.Text & "|Effective From", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateEffectiveFrom = False
    End If
End Function

'private function returning true when the field - effective till is valid, otherwise false
Private Function validateEffectiveTill() As Boolean
    validateEffectiveTill = True

    If (intMode <> uiManager.QUERY_MODE) Then
    
        'check for mandatory field
        If (Trim(Me.txtEffectiveTill.Text) = "") Then
            Me.txtEffectiveTill.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "Effective Till", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            validateEffectiveTill = False
            Exit Function
        
        'comparing effective from and effective till date
        ElseIf (Trim(Me.txtEffectiveFrom.Text) <> "") Then
            If DateDiff("d", Me.txtEffectiveFrom.Text, Me.txtEffectiveTill.Text) < 0 Then
                Me.txtEffectiveTill.SelStart = 0
                Me.txtEffectiveTill.SelLength = Len(Trim(Me.txtEffectiveTill.Text))
                logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Effective Till|Effective From", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
                validateEffectiveTill = False
                Exit Function
            End If
        End If
        
    ElseIf Len(Trim(Me.txtEffectiveTill.Text)) < 11 Then
        Me.txtEffectiveTill.SetFocus
        logger.logMessage modStandardMessages.InvalidValue, "value " & Me.txtEffectiveTill.Text & "|Effective Till", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateEffectiveTill = False
    End If
    
End Function

'This is a private function to this code module that checks if the form is ready for saving. No invalid data
'should enter into database. Thus before saving record, certain checks are carried out in this function. If all
'the checks are cleared then the function returns boolean value 'True' otherwise returns boolean value 'False'
'and a descriptive error or warning message is generated.
Public Function clsEditInterface_isReadyToSave() As Boolean
    clsEditInterface_isReadyToSave = True
    
    'validate event of last focused control is called before save.
    Me.ValidateControls
    
    'all controls are validated before save
    If Not validateDistCityCode Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf Not validateDistCityName Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf Not validateCountryName Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf Not validateStateName Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf Not validateEffectiveFrom Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf Not validateEffectiveTill Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    End If

End Function

'Implementation of the fireSave() method of the clsEditInterface. Here the form is saved by creating parameters
'that are passed to the dbManager's ExecuteBatch() method. The form can be saved when it is in either insert or
'new or browse or update mode. But before saving the form, the private boolean function isReadyToSave() is called
'to check if the form is ready for saving.
Public Sub clsEditInterface_fireSave()

On Error GoTo errortag

    Dim strSQL As String
    Dim rsInsUpdDistCity As clsRecordHashMap
    
    'passing parameters to the procedure
    strSQL = "CDB..insUpdDistrictsOrCities '" & Trim(UCase(Me.txtDistrictOrCityCode.Text)) & "','" & _
                                                Replace(Trim(Me.txtDistrictOrCityName.Text), "'", "''") & "'," & _
                                                Me.txtStateName.Tag & ",'" & _
                                                Trim(Me.txtEffectiveFrom.Text) & "','" & _
                                                Trim(Me.txtEffectiveTill.Text) & "'," & _
                                                IIf(Me.txtID.Text = "", "NULL", Trim(Me.txtID.Text)) & "," & _
                                                IIf(varTxnTs = "", "Null", varTxnTs)
    dbManager.beginTrans
    
    Select Case intMode
    
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
        
            strSQL = strSQL & ", 0"     '0 - INSERT
            Set rsInsUpdDistCity = dbManager.executeSQLGetRS(strSQL)
            intDistCityID = rsInsUpdDistCity.getFieldValueByFieldIndex(0, 0)
            dbManager.commitTrans
            
            If intMode = uiManager.INSERT_MODE Then
                logger.logMessage modStandardMessages.ObjectSaveMsg, "District Or City - '" & Trim(Me.txtDistrictOrCityName.Text) & "'|" & intDistCityID, PLAIN_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
                'in case of insert mode, the screen has to get cleared of any data and get ready to insert more data
                Me.clsWindowInterface_showForm uiManager.INSERT_MODE
                Me.txtDistrictOrCityCode.SetFocus
            End If
            
        Case uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            
            strSQL = strSQL & ", 1"    '1 - UPDATE
            dbManager.executeSQL strSQL
            
            If intMode = uiManager.BROWSE_MODE Then
                'setting the screen with updated data
                dbManager.commitTrans
                sprListDistrictsOrCitiesController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, _
                                                             Me.sprListDistrictsOrCities.ActiveRow
                Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListDistrictsOrCities.ActiveRow
                varTxnTs = sprListDistrictsOrCitiesController.getTextOfCell(Me.sprListDistrictsOrCities.ActiveRow, distCityColumns.txn_ts)
                logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            Else
                dbManager.commitTrans
            End If
            
        Case Default

            dbManager.commitTrans
            errorManager.setErrorAttributes modStandardMessages.InValidMode, "clsEditInterface_fireSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "error while saving or updating data"
            Err.Raise Err.Number
            
    End Select
    
Exit Sub
    
errortag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsEditInterface_fireSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "error while saving or updating data"
    Err.Raise Err.Number
End Sub

'Implementation of the fireInsertMode() method of the clsQueryInterface.
'This method opens the form in Insert Mode through showForm() method.
Public Sub clsEditInterface_fireInsertMode()
On Error GoTo errortag
    Me.clsWindowInterface_showForm uiManager.INSERT_MODE
Exit Sub

errortag:
    errorManager.setErrorAttributes "UnknownError", "clsEditInterface_fireInsertMode", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'Implementation of the fireBrowse() method of the clsQueryInterface.
'This method opens the form in Browse Mode through showForm() method.
Public Sub clsQueryInterface_fireBrowse()
On Error GoTo errortag
    Me.clsWindowInterface_showForm uiManager.BROWSE_MODE
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireBrowse", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsQueryInterface_fireCancel()

End Sub

'Implementation of the fireList() method of the clsQueryInterface.
'This method opens the form in List Mode through showForm() method.
Public Sub clsQueryInterface_fireList()

On Error GoTo errortag
    Me.clsWindowInterface_showForm uiManager.LIST_MODE
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireList", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'Implementation of the fireQuery() method of the clsQueryInterface.
'This method opens the form in Query Mode through showForm() method.
Public Sub clsQueryInterface_fireQuery()

On Error GoTo errortag
    Me.clsWindowInterface_showForm uiManager.QUERY_MODE
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireQuery", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'Implementation of the fireRemove() method of the clsQueryInterface.
'The current record being displayed in the Browse mode is removed from database.
Public Sub clsQueryInterface_fireRemove()

On Error GoTo errortag
    dbManager.beginTrans
    dbManager.executeSQL "CDB..delDistrictsOrCities " & Trim(Me.txtID.Text) & "," & varTxnTs
    dbManager.commitTrans
Exit Sub

errortag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireRemove", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "error while performing delete query"
    Err.Raise Err.Number
End Sub

'Implementation of the fireRetrieve() method of the clsQueryInterface.
'This method opens the form in Retrieve Mode through showForm() method.
Public Sub clsQueryInterface_fireRetrieve()

On Error GoTo errortag
    Me.clsWindowInterface_showForm uiManager.RETRIEVE_MODE
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireRetrieve", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsQueryInterface_fireSort()

End Sub

'Implementation of the getSpreadControllerForRetrieval() function of the clsQueryInterface. This function
'returns the spread controller which should be used for retrieval of the records in Retrieve mode. Here
'the retrieval is done in the sprListDistrictsOrCitiesController, so that is returned to the caller.
Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController

    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListDistrictsOrCitiesController
    
End Function

'Implementation of the getSQLStringForRetrieval() function of the clsQueryInterface. This function
'returns the sql string which should be used by ADL to retrieve records in Retrieve mode.
'The query is build based upon the user entries in the different fields of the form.
Public Function clsQueryInterface_getSQLStringForRetrieval() As String
    
    Dim qryDistrictsOrCities As String
    
    qryDistrictsOrCities = "SELECT d.district_cd, d.district_nm, c.country_id, c.country_nm, d.state_id, s.state_nm, Cast(d.txn_ts AS BigInt), Convert(varchar,d.effective_from,106)effective_from, Convert(varchar,d.effective_till,106)effective_till, d.district_or_city_id  "
    qryDistrictsOrCities = qryDistrictsOrCities & "FROM districts_or_cities d, countries c, states s "
    qryDistrictsOrCities = qryDistrictsOrCities & "WHERE d.state_id = s.state_id AND s.country_id = c.country_id "
                      
    If Trim(Me.txtCountryName.Text) <> "" Then
        qryDistrictsOrCities = qryDistrictsOrCities & "AND c.country_nm LIKE '%" & Replace(Trim(Me.txtCountryName.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.txtDistrictOrCityCode.Text) <> "" Then
        qryDistrictsOrCities = qryDistrictsOrCities & "AND d.district_cd LIKE '%" & Trim(Me.txtDistrictOrCityCode) & "%' "
    End If
    
    If Trim(Me.txtDistrictOrCityName.Text) <> "" Then
        qryDistrictsOrCities = qryDistrictsOrCities & "AND d.district_nm LIKE '%" & Replace(Trim(Me.txtDistrictOrCityName.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.txtEffectiveFrom.Text) <> "" Then
        qryDistrictsOrCities = qryDistrictsOrCities & "AND d.effective_from = '" & Trim(Me.txtEffectiveFrom.Text) & "' "
    End If

    If Trim(Me.txtEffectiveTill.Text) <> "" Then
        qryDistrictsOrCities = qryDistrictsOrCities & "AND d.effective_till = '" & Trim(Me.txtEffectiveTill.Text) & "' "
    End If

    If Trim(Me.txtStateName.Text) <> "" Then
        qryDistrictsOrCities = qryDistrictsOrCities & "AND s.state_nm LIKE '%" & Replace(Trim(Me.txtStateName.Text), "'", "''") & "%' "
    End If

    If Trim(Me.txtID.Text) <> "" Then
        qryDistrictsOrCities = qryDistrictsOrCities & "AND d.district_or_city_id = " & Me.txtID.Text & " "
    End If
    
    qryDistrictsOrCities = qryDistrictsOrCities & "ORDER BY c.country_id, s.state_id, district_or_city_id"

    'the select statement built and returned by the procedure - procRetrieveDistrictrOrCities is passed to the function
    clsQueryInterface_getSQLStringForRetrieval = qryDistrictsOrCities

End Function

'Implementation of the populateFieldsFromRetrievalSpread() method of the clsQueryInterface. All the fields are
'populated from the spread where the records are retrieved. Parameter p_lonrow states the row of the spread
'whose values are to be set in respective fields.
Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)
    
On Error GoTo errortag

    Me.txtDistrictOrCityCode.Text = CStr(Trim(sprListDistrictsOrCitiesController.getTextOfCell(p_lonRow, distCityColumns.distCityCode)))
    Me.txtDistrictOrCityName.Text = CStr(sprListDistrictsOrCitiesController.getTextOfCell(p_lonRow, distCityColumns.distCityName))
    Me.txtCountryName.Tag = sprListDistrictsOrCitiesController.getTextOfCell(p_lonRow, distCityColumns.countryID)
    Me.txtCountryName.Text = CStr(sprListDistrictsOrCitiesController.getTextOfCell(p_lonRow, distCityColumns.countryName))
    Me.txtStateName.Tag = sprListDistrictsOrCitiesController.getTextOfCell(p_lonRow, distCityColumns.stateID)
    Me.txtStateName.Text = CStr(sprListDistrictsOrCitiesController.getTextOfCell(p_lonRow, distCityColumns.stateName))
    varTxnTs = sprListDistrictsOrCitiesController.getTextOfCell(Me.sprListDistrictsOrCities.Row, distCityColumns.txn_ts)
    Me.txtEffectiveFrom.Text = Format(CDate(sprListDistrictsOrCitiesController.getTextOfCell(p_lonRow, distCityColumns.effectivefrom)), "dd-mmm-yyyy")
    Me.txtEffectiveTill.Text = Format(CDate(sprListDistrictsOrCitiesController.getTextOfCell(p_lonRow, distCityColumns.effectiveTill)), "dd-mmm-yyyy")
    Me.txtID.Text = sprListDistrictsOrCitiesController.getTextOfCell(p_lonRow, distCityColumns.distCityID)
    Me.txtCountryName.DataField = Me.txtCountryName.Text
    Me.txtStateName.DataField = Me.txtStateName.Text
    
    'retrieving post offices corresponding to selected district or city ID
    Dim strSelectPO As String
    strSelectPO = "SELECT post_office_cd, post_office_nm, post_office_id FROM post_offices " & _
                  "WHERE district_or_city_id = " & Me.txtID.Text & _
                  " ORDER BY post_office_id"
    sprDistrictCityPostOfficesController.retrieveRecords (strSelectPO)
    
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_populateFieldsFromRetrievalSpread", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsWindowInterface_fireClose()

End Sub

'Implementation of the fireErase() method of the clsWindowInterface. All the Controls and spreads of the form are
'cleared of any data. clearSpread() method of the spreadController is called for clearing the spreads.
Public Sub clsWindowInterface_fireErase()

    
    utils.clearControls Me.txtCountryName, Me.txtDistrictOrCityCode, _
                        Me.txtDistrictOrCityName, Me.txtID, Me.txtStateName
    
    'only in query mode, dates are erased, otherwise their default values are displayed
    Select Case intMode
        Case uiManager.QUERY_MODE
            Me.txtEffectiveFrom.Text = ""
            Me.txtEffectiveTill.Text = ""
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
            Me.txtEffectiveFrom.Text = Format(Date, "dd-mmm-yyyy")
            Me.txtEffectiveTill.Text = "31-Dec-9999"
    End Select
    
    'the spread is cleared of any data
    If Not Me.sprDistrictCityPostOffices Is Nothing Then
        sprDistrictCityPostOfficesController.clearSpread
    End If
    If Not Me.sprListDistrictsOrCities Is Nothing Then
        sprListDistrictsOrCitiesController.clearSpread
    End If
    
End Sub

Public Sub clsWindowInterface_fireExit(Cancel As Boolean)

End Sub

Public Sub clsWindowInterface_fireHelp()

End Sub

'Implementation of the getMode() function of the clsWindowInterface. The function returns
'the current mode which is stored in public variable 'intMode' to the caller.
Public Function clsWindowInterface_getMode() As Integer

    clsWindowInterface_getMode = intMode
    
End Function

'Implemenation of the getScreenID() function of the clsWindowInteface. The function returns
'the screen id to the caller.
Public Function clsWindowInterface_getScreenID() As String

    clsWindowInterface_getScreenID = "LOC_04"
    
End Function

Public Sub clsWindowInterface_setFieldInFocus(ByVal p_strControlNameIndicator As String)

End Sub

'Implemenation of the showForm() method of the clsWindowInterface. This method shows the form in the mode as
'stated by the parameter 'p_intMode'. This method calls a private method setSpreadController() to initialize the
'spreadController and method setEnableDisableControls() to enable/disable all the controls and spreads of the form
'according to the given mode. Typically this method is called when the form is opened by hitting menus or
'opened by another form or when the form's mode is changed.
Public Sub clsWindowInterface_showForm(p_intMode As Integer)

    intMode = p_intMode
    
    'if the form is already open, the spread is not set again
    If Not mdiMain.ActiveForm Is Me Then
        setSpreadControllers
    End If
    
    Me.Visible = True
    Me.ZOrder 0
    setEnableDisableControls
    
End Sub

'This is a private method to this code module. Here spread controllers are initialized and columns are
'added to them for all the respective spreads in this form.
Private Sub setSpreadControllers()
    
    'initializing and adding columns to sprListDistrictsOrCitiesController of districts or cities
    Set sprListDistrictsOrCitiesController = New clsSpreadController
    sprListDistrictsOrCitiesController.registerSpreadInstance uiManager, Me.sprListDistrictsOrCities, LIST_SPREAD, Me, , , True
    sprListDistrictsOrCitiesController.setHeaderHeight 600
    
    sprListDistrictsOrCitiesController.addColumn "Dist./ City Code", 9, STATIC_TEXT_CELL_TYPE, False, True
    sprListDistrictsOrCitiesController.addColumn "Dist./ City Name", 25, STATIC_TEXT_CELL_TYPE, False, True
    sprListDistrictsOrCitiesController.addColumn "Country ID", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListDistrictsOrCitiesController.addColumn "Country Name", 25, STATIC_TEXT_CELL_TYPE, False, True
    sprListDistrictsOrCitiesController.addColumn "State ID", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListDistrictsOrCitiesController.addColumn "State Name", 25, STATIC_TEXT_CELL_TYPE, False, True
    sprListDistrictsOrCitiesController.addColumn "Txn_Ts", 0, STATIC_TEXT_CELL_TYPE, False, True
    sprListDistrictsOrCitiesController.addColumn "Effective   From", 11, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListDistrictsOrCitiesController.addColumn "Effective   Till", 11, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListDistrictsOrCitiesController.addColumn "Dist. / City ID", 6, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    
    'initializing and adding columns to sprDistrictCityPostOfficesController of post offices
    Set sprDistrictCityPostOfficesController = New clsSpreadController
    sprDistrictCityPostOfficesController.registerSpreadInstance uiManager, Me.sprDistrictCityPostOffices, LIST_SPREAD, Me
    sprDistrictCityPostOfficesController.setHeaderHeight 600
    
    sprDistrictCityPostOfficesController.addColumn "P.O. Code", 12, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN
    sprDistrictCityPostOfficesController.addColumn "Post Office Name", 76, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN
    sprDistrictCityPostOfficesController.addColumn "P.O.   ID", 12, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
                                                    
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls()

    Select Case intMode
    
        Case uiManager.INSERT_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            Me.sprDistrictCityPostOffices.Visible = False
            sprDistrictCityPostOfficesController.setSpreadMode intMode
            sprListDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraDistrictsOrCities.ZOrder 0
            Me.txtDistrictOrCityCode.SetFocus
        
        Case uiManager.QUERY_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID
            Me.sprDistrictCityPostOffices.Visible = False
            sprDistrictCityPostOfficesController.setSpreadMode intMode
            sprListDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraDistrictsOrCities.ZOrder 0
            Me.txtID.SetFocus
            
        Case uiManager.RETRIEVE_MODE
        
            Me.sprDistrictCityPostOffices.Visible = False
            sprDistrictCityPostOfficesController.setSpreadMode intMode
            sprListDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraDistrictsOrCities.ZOrder 0
            
        Case uiManager.BROWSE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID
            Me.sprDistrictCityPostOffices.Visible = True
            sprDistrictCityPostOfficesController.setSpreadMode uiManager.REFERENCE_MODE
            sprListDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraDistrictsOrCities.ZOrder 0
            Me.txtDistrictOrCityCode.SetFocus
            
        Case uiManager.LIST_MODE
        
            sprDistrictCityPostOfficesController.setSpreadMode intMode
            sprListDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraListDistrictsOrCities.ZOrder 0
            
        Case uiManager.NEW_MODE
        
            Me.clsWindowInterface_fireErase
            
            modControlsSettings.setStateToReadOnly Me.txtID, Me.txtCountryName, Me.txtStateName
            Me.txtCountryName.ButtonStyle = ButtonStyleNone
            Me.txtStateName.ButtonStyle = ButtonStyleNone
            
            Me.sprDistrictCityPostOffices.Visible = False
            sprDistrictCityPostOfficesController.setSpreadMode intMode
            sprListDistrictsOrCitiesController.setSpreadMode intMode
            
            Me.fraDistrictsOrCities.ZOrder 0
            Me.txtDistrictOrCityCode.SetFocus
            
        Case uiManager.UPDATE_MODE
            
            modControlsSettings.setStateToReadOnly Me.txtID, Me.txtCountryName, Me.txtStateName
            Me.txtCountryName.ButtonStyle = ButtonStyleNone
            Me.txtStateName.ButtonStyle = ButtonStyleNone
            
            Me.sprDistrictCityPostOffices.Visible = False
            sprDistrictCityPostOfficesController.setSpreadMode uiManager.REFERENCE_MODE
            sprListDistrictsOrCitiesController.setSpreadMode intMode
            
            Me.fraDistrictsOrCities.ZOrder 0
            Me.txtDistrictOrCityCode.SetFocus
            
        Case uiManager.REFERENCE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID, Me.txtCountryName, Me.txtStateName, _
                                                   Me.txtDistrictOrCityCode, Me.txtDistrictOrCityName, _
                                                   Me.txtEffectiveFrom, Me.txtEffectiveTill
            Me.txtCountryName.ButtonStyle = ButtonStyleNone
            Me.txtStateName.ButtonStyle = ButtonStyleNone
            Me.sprDistrictCityPostOffices.Visible = True
            sprDistrictCityPostOfficesController.setSpreadMode intMode
            sprListDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraDistrictsOrCities.ZOrder 0
            
    End Select
    
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.lblCountry, Me.lblDistrictOrCityCode, Me.lblDistrictOrCityName, Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblId, Me.lblState, Me.txtCountryName, Me.txtDistrictOrCityCode, Me.txtDistrictOrCityName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID, Me.txtStateName
    modControlsSettings.setStateToNormal Me.txtCountryName, Me.txtDistrictOrCityCode, Me.txtDistrictOrCityName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID, Me.txtStateName
    Me.txtCountryName.ButtonStyle = ButtonStylePopUp
    Me.txtStateName.ButtonStyle = ButtonStylePopUp
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookupForCountries() is the common place
'where the lookup on the country has been prosvided
Private Sub txtCountryName_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    modCDBLookUps.showLookUpForCountries Me, Me.txtCountryName, modMain.countries, Me.txtCountryName.Text, enmLookupSearchModes.absolute
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtCountryName_ButtonHit", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtCountryName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please Hit the Button for LookupDialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtCountryName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 And (intMode <> uiManager.NEW_MODE Or _
                          intMode <> uiManager.UPDATE_MODE Or _
                          intMode <> uiManager.REFERENCE_MODE) Then
        Call txtCountryName_ButtonHit(0, 0)
    End If
End Sub

'validating CountryName
Private Sub txtCountryName_Validate(Cancel As Boolean)
        
On Error GoTo errortag

    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup for country can be called when it is not empty in mode other than QUERY mode
    If (validateCountryName) Then
        'lookup called
        If (Me.txtCountryName.DataField <> Me.txtCountryName.Text) Then
            modCDBLookUps.showLookUpForCountries Me, Me.txtCountryName, modMain.countries, Me.txtCountryName.Text, enmLookupSearchModes.Logical
        End If
        'enforcing the control to hold a selected value from the lookup
        If (Me.txtCountryName.DataField <> Me.txtCountryName.Text) Then
            logger.logMessage modStandardMessages.NotExist, "Country Name - '" & Me.txtCountryName.Text & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, " failed during lookup"
            Me.txtCountryName.SelStart = 0
            Me.txtCountryName.SelLength = Len(Trim(Me.txtCountryName.Text))
            Me.txtCountryName.SetFocus
            Cancel = True
        End If
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtCountryName_Validate", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtDistrictOrCityCode_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtDistrictOrCityCode_Validate(Cancel As Boolean)
    validateDistCityCode
End Sub

'The method sets the status text of the main screen
Private Sub txtDistrictOrCityName_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtDistrictOrCityName_Validate(Cancel As Boolean)
    validateDistCityName
End Sub

'The method sets the status text of the main screen
Private Sub txtEffectiveFrom_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter date smaller than Effective Till date"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtEffectiveFrom_Validate(Cancel As Boolean)
    If validateEffectiveFrom And intMode <> uiManager.QUERY_MODE Then
        If DateDiff("d", Me.txtEffectiveFrom.Text, Date) < 0 Then
            logger.logMessage modStandardMessages.LesserOrEqualValueReqd, "Effective From|" & Format(Date, "dd mmm yyyy"), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        End If
    End If
    If Not validateEffectiveFrom And Me.txtEffectiveFrom.Text <> "" Then
        Cancel = True
    End If
End Sub

'The method sets the status text of the main screen
Private Sub txtEffectiveTill_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter date greater than Effective From date"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtEffectiveTill_Validate(Cancel As Boolean)
    If validateEffectiveTill And intMode <> uiManager.QUERY_MODE Then
        If DateDiff("d", Me.txtEffectiveTill.Text, Date) > 0 Then
            logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Effective Till|" & Format(Date, "dd mmm yyyy"), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        End If
    End If
    If Not validateEffectiveTill And Me.txtEffectiveTill.Text <> "" Then
        Cancel = True
    End If
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookupForStates() is the common place
'where the lookup on the state has been provided.
Private Sub txtStateName_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    If Me.txtCountryName.Text <> "" Then
        Dim additionalValues As New Collection
        additionalValues.Add Me.txtCountryName.Tag, "country_id"
        additionalValues.Add Me.txtCountryName.DataField, "country_nm"
        modCDBLookUps.showLookUpForStates Me, Me.txtStateName, modMain.states, Me.txtStateName.Text, enmLookupSearchModes.absolute, additionalValues
    'in query mode, when country is not specified, show all the existing states
    ElseIf intMode = uiManager.QUERY_MODE Then
        modCDBLookUps.showLookUpForStates Me, Me.txtStateName, modMain.states, Me.txtStateName.Text, enmLookupSearchModes.absolute
    Else
        Me.txtStateName.Text = ""
        logger.logMessage modStandardMessages.ValueReqd, "Country Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        Me.txtCountryName.SetFocus
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtStateName_ButtonHit", "", ERROR_TYPE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtStateName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please Hit the Button for LookupDialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtStateName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 And (intMode <> uiManager.NEW_MODE Or _
                          intMode <> uiManager.UPDATE_MODE Or _
                          intMode <> uiManager.REFERENCE_MODE) Then
        Call txtStateName_ButtonHit(0, 0)
    End If
End Sub

Private Sub txtStateName_Validate(Cancel As Boolean)
On Error GoTo errortag

    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup can be called when state is not empty and current mode is other than QUERY mode
    If (validateStateName) Then
        
        'enforcing to fill country before calling lookup for state
        If Me.txtCountryName.Text = "" Then
            logger.logMessage modStandardMessages.ValueReqd, "Country Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Cancel = True
            Me.txtStateName.Text = ""
            Me.txtCountryName.SetFocus
            Exit Sub
            
        'lookup called
        ElseIf Me.txtStateName.DataField <> Me.txtStateName.Text Then
            Dim additionalValues As New Collection
            additionalValues.Add Me.txtCountryName.Tag, "country_id"
            additionalValues.Add Me.txtCountryName.DataField, "country_nm"
            modCDBLookUps.showLookUpForStates Me, Me.txtStateName, modMain.states, Me.txtStateName.Text, enmLookupSearchModes.Logical, additionalValues
        End If
        
        'enforcing the control to hold a value selected from the lookup.
        If Me.txtStateName.DataField <> Me.txtStateName.Text Then
            logger.logMessage modStandardMessages.InvalidValue, "State - '" & Me.txtStateName.Text & "'|Country - '" & Me.txtCountryName.Text & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed during lookup"
            Me.txtStateName.SelStart = 0
            Me.txtStateName.SelLength = Len(Trim(Me.txtStateName.Text))
            Me.txtStateName.SetFocus
            Cancel = True
        End If
        
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes "UnknownError", "txtStateName_Validate", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

