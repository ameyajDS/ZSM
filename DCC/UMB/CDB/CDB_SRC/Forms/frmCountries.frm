VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "EDT32X30.OCX"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.OCX"
Begin VB.Form frmCountries 
   BackColor       =   &H00C0C0C0&
   Caption         =   "COUNTRIES"
   ClientHeight    =   8595
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8880
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00000000&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8595
   ScaleWidth      =   8880
   WindowState     =   2  'Maximized
   Begin VB.Frame fraCountries 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   7995
      Left            =   0
      TabIndex        =   17
      Top             =   0
      Width           =   16275
      Begin EditLib.fpDoubleSingle txtGMTDiff 
         Height          =   345
         Left            =   6180
         TabIndex        =   9
         Top             =   1965
         Width           =   1215
         _Version        =   196608
         _ExtentX        =   2143
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
         ThreeDOutsideHighlightColor=   -2147483628
         ThreeDOutsideShadowColor=   -2147483632
         ThreeDOutsideWidth=   1
         ThreeDFrameWidth=   0
         BorderStyle     =   1
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
         AutoBeep        =   0   'False
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   14737632
         InvalidOption   =   0
         MarginLeft      =   3
         MarginTop       =   3
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   14737632
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   0
         ControlType     =   0
         Text            =   ""
         DecimalPlaces   =   2
         DecimalPoint    =   ""
         FixedPoint      =   0   'False
         LeadZero        =   0
         MaxValue        =   "13"
         MinValue        =   "-12"
         NegFormat       =   1
         NegToggle       =   0   'False
         Separator       =   ""
         UseSeparator    =   0   'False
         IncInt          =   1
         IncDec          =   1
         BorderGrayAreaColor=   -2147483637
         ThreeDOnFocusInvert=   0   'False
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   0
         BorderDropShadowColor=   -2147483632
         BorderDropShadowWidth=   3
         ButtonColor     =   -2147483633
         AutoMenu        =   0   'False
         ButtonAlign     =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin EditLib.fpLongInteger txtID 
         Height          =   345
         Left            =   3720
         TabIndex        =   1
         Top             =   480
         Width           =   780
         _Version        =   196608
         _ExtentX        =   1376
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
         ThreeDInsideHighlightColor=   0
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
         MaxValue        =   "9999"
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
      Begin EditLib.fpText txtCountryCode 
         Height          =   345
         Left            =   6900
         TabIndex        =   3
         Top             =   480
         Width           =   870
         _Version        =   196608
         _ExtentX        =   1535
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
         AllowNull       =   0   'False
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   -1  'True
         AutoCase        =   1
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
         NullColor       =   14737632
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
      Begin EditLib.fpText txtISDCode 
         Height          =   345
         Left            =   3750
         TabIndex        =   7
         Top             =   1965
         Width           =   1215
         _Version        =   196608
         _ExtentX        =   2143
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
         BackColor       =   12632256
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
         NullColor       =   12632256
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   1
         ControlType     =   0
         Text            =   ""
         CharValidationText=   "0123456789 "
         MaxLength       =   10
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
         Left            =   3735
         TabIndex        =   5
         Top             =   1215
         Width           =   4035
         _Version        =   196608
         _ExtentX        =   7117
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
         AllowNull       =   0   'False
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
         Left            =   6180
         TabIndex        =   13
         Top             =   2700
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
      Begin EditLib.fpDateTime txtEffectiveFrom 
         Height          =   345
         Left            =   3720
         TabIndex        =   11
         Top             =   2700
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
      Begin FPSpread.vaSpread sprCountryStates 
         Height          =   3165
         Left            =   2040
         TabIndex        =   14
         TabStop         =   0   'False
         Tag             =   "States Spread"
         Top             =   3195
         Visible         =   0   'False
         Width           =   7455
         _Version        =   393216
         _ExtentX        =   13150
         _ExtentY        =   5583
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
         ScrollBars      =   2
         ShadowColor     =   12632256
         SpreadDesigner  =   "frmCountries.frx":0000
      End
      Begin VB.Label lblGmtDiff 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "GMT Diff"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6180
         TabIndex        =   8
         Top             =   1725
         Width           =   750
      End
      Begin VB.Label lblCountryCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Code "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6915
         TabIndex        =   2
         Top             =   240
         Width           =   510
      End
      Begin VB.Label lblId 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ID"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   0
         Top             =   240
         Width           =   180
      End
      Begin VB.Label lblCountryName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   4
         Top             =   975
         Width           =   570
      End
      Begin VB.Label lblISDCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ISD Code  "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   6
         Top             =   1725
         Width           =   945
      End
      Begin VB.Label lblEffectiveFrom 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   10
         Top             =   2460
         Width           =   1290
      End
      Begin VB.Label lblEffectiveTill 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6180
         TabIndex        =   12
         Top             =   2460
         Width           =   1080
      End
   End
   Begin VB.Frame fraCountriesSpread 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      ForeColor       =   &H00800000&
      Height          =   7935
      Left            =   0
      TabIndex        =   15
      Top             =   0
      Width           =   17175
      Begin FPSpread.vaSpread sprListCountries 
         Height          =   6450
         Left            =   120
         TabIndex        =   16
         TabStop         =   0   'False
         Tag             =   "Countries List Spread"
         Top             =   120
         Width           =   11700
         _Version        =   393216
         _ExtentX        =   20637
         _ExtentY        =   11377
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
         SpreadDesigner  =   "frmCountries.frx":0217
      End
   End
End
Attribute VB_Name = "frmCountries"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Implements clsWindowInterface
Implements clsQueryInterface
Implements clsEditInterface
Implements clsCalledFormInterface

'This variable holds the value of the current mode of the form. This is set each
'time the form is opened in different mode with the 'showForm()' method of the
''clsWindowInterface'. And the value of this variable is returned, whenever requested
'through 'getMode()' method of the 'clsWindowInterface'
Dim intMode As Integer

'stores newly generated country ID returned in fireSave() method of clsEditInterface. the
'variable holding ID is displayed in message bar in Insert Mode as well as is called in
'getReturnValues() method of clsCalledFormInterface to set the local variable strIDText in NewMode
Dim intCountryID As Long

'stores value of txn_ts. the variable is filled in populateFieldsFromRetrievalSpread method
'of clsQueryInterface
Dim varTxnTs As Variant

'The declaration of spread controller for retrieving the records from the countries
'table. This spread controller is also used to show the records in list mode. This
'object variable is defined "withEvents" because this code module needs to catch the
'events thrown by this controller (like 'validateCell', 'validateRow' etc)
Dim WithEvents sprListCountriesController As clsSpreadController
Attribute sprListCountriesController.VB_VarHelpID = -1

'The declaration of spread controller for retrieving and browsing the states of
'the specified country. This object variable is defined "withEvents" because this
'code module needs to catch the events thrown by this controller (like
''validateCell', 'validateRow' etc)
Dim WithEvents sprCountryStatesController As clsSpreadController
Attribute sprCountryStatesController.VB_VarHelpID = -1

'This enum holds all the column numbers of the spread controller
''sprlistCountriesController' that shows all the records of countries. The column
'numbers are stored into variables named corresponding to column names. These are
'called in functions of spreadController like 'getTextOfCell' or 'setTextOfCell'
'which requires row number and column number.
Private Enum CountryColumns
    CountryCode = 1
    countryName
    ISDCode
    GMTDiff
    txn_ts
    effectivefrom
    effectiveTill
    countryID
End Enum

'Implementation of 'getReturnValues()' method of the clsCalledFormInterface. This method
'returns the displayText and the idText to the calling form through the setReturnedValues()
'method of the clsCallingFormInterface. The arguments passed are by reference.
Public Sub clsCalledFormInterface_getReturnValues(p_strDisplayText As String, _
                                                    p_strIDText As String, _
                                                    p_colAdditionalValues As Collection)
                                                  
    p_strDisplayText = Me.txtCountryName.Text
    
    Select Case intMode
        Case uiManager.NEW_MODE
            p_strIDText = intCountryID
        Case uiManager.UPDATE_MODE
            p_strIDText = Me.txtID.Text
    End Select
    'set the key value pairs in p_colAdditionalValues to have the UNION of all
    'the required keys used in all the calling forms calling this screen.
    'Initially write all the attributes which are available on screen
    p_colAdditionalValues.Add Me.txtEffectiveFrom.Text, "effectiveFrom"
    p_colAdditionalValues.Add Me.txtEffectiveTill.Text, "effectiveTill"
    p_colAdditionalValues.Add Me.txtISDCode.Text, "ISDCode"
    p_colAdditionalValues.Add Me.txtCountryCode.Text, "countryCode"
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
        Case uiManager.UPDATE_MODE, uiManager.REFERENCE_MODE
            Me.txtID.Text = p_colAdditionalValues.Item("country_id")
            sprListCountriesController.retrieveRecords Me.clsQueryInterface_getSQLStringForRetrieval
            clsQueryInterface_populateFieldsFromRetrievalSpread (1)
    End Select
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsCalledFormInterface_showCalledForm", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    Err.Raise Err.Number
End Sub

'private function returning true when the field - country code is valid, otherwise false
Private Function validateCountryCode() As Boolean
    
    validateCountryCode = True
    
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtCountryCode.Text) = "") Then
        Me.txtCountryCode.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Country Code", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateCountryCode = False
    End If
    
End Function

'private function returning true when the field - country name is valid, otherwise false
Private Function validateCountryName() As Boolean

    validateCountryName = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtCountryName.Text) = "" Then
        Me.txtCountryName.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Country Name", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateCountryName = False
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
        
        'comparing effective from and effective till date
        ElseIf (Trim(Me.txtEffectiveFrom.Text) <> "") Then
            If DateDiff("d", Me.txtEffectiveFrom.Text, Me.txtEffectiveTill.Text) < 0 Then
                Me.txtEffectiveTill.SelStart = 0
                Me.txtEffectiveTill.SelLength = Len(Trim(Me.txtEffectiveTill.Text))
                logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Effective Till|Effective From", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
                validateEffectiveTill = False
            End If
        End If
        
    ElseIf Len(Trim(Me.txtEffectiveTill.Text)) < 11 Then
        Me.txtEffectiveTill.SetFocus
        logger.logMessage modStandardMessages.InvalidValue, "value " & Me.txtEffectiveTill.Text & "|Effective Till", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateEffectiveTill = False
    End If

    
End Function

'Implementation of the isReadyToSave() function of the clsEditInterface. This
'function is called by fireSave() method of the clsEditInterface. Before the data
'is saved in the database, this function checks if each control present on the
'form is having valid values. If all controls are valid then the function returns
'boolean value 'True' otherwise returns boolean value 'False'.
Public Function clsEditInterface_isReadyToSave() As Boolean

    clsEditInterface_isReadyToSave = True
    
    Me.ValidateControls
    
    If (validateCountryCode = False) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    End If
    
    If (validateCountryName = False) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    End If
    
    If (validateEffectiveFrom = False) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    End If
    
    If (validateEffectiveTill = False) Then
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
    strSQL = "CDB..insUpdCountries '" & Trim(UCase(Me.txtCountryCode.Text)) & "','" & _
                                        Replace(Trim(Me.txtCountryName.Text), "'", "''") & "'," & _
                                        IIf(Trim(Me.txtISDCode.Text) = "", "NULL", "'" & Trim(Me.txtISDCode.Text) & "'") & "," & _
                                        Trim(Me.txtGMTDiff.Text) & ",'" & _
                                        Trim(Me.txtEffectiveFrom.Text) & "','" & _
                                        Trim(Me.txtEffectiveTill.Text) & "'," & _
                                        IIf(Me.txtID.Text = "", "NULL", Trim(Me.txtID.Text)) & "," & _
                                        IIf(varTxnTs = "", "NULL", varTxnTs)
                                        
    dbManager.beginTrans
    
    Select Case intMode
    
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
            Dim rsInsUpdCountries As clsRecordHashMap
            
            strSQL = strSQL & ", 0"    '0 - INSERT
            logger.logCommentedMessage strSQL
            Set rsInsUpdCountries = dbManager.executeSQLGetRS(strSQL)
            dbManager.commitTrans
            
            'storing the newly generated country id
            intCountryID = rsInsUpdCountries.getFieldValueByFieldIndex(0, 0)
            
            If intMode = uiManager.INSERT_MODE Then
                logger.logMessage modStandardMessages.ObjectSaveMsg, "Country - '" & Trim(Me.txtCountryName.Text) & "'|" & intCountryID, PLAIN_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            
                'in case of insert mode, the screen has to get cleared of any data and get ready to insert more data
                Me.clsWindowInterface_showForm uiManager.INSERT_MODE
                Me.txtCountryCode.SetFocus
            End If
        
        Case uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            
            strSQL = strSQL & ", 1"    '1 - UPDATE
            Debug.Print strSQL
            dbManager.executeSQL strSQL
                                    
            If intMode = uiManager.BROWSE_MODE Then
                'setting the screen with updated data
                dbManager.commitTrans
                sprListCountriesController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, _
                                                     Me.sprListCountries.ActiveRow
                Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListCountries.ActiveRow
                varTxnTs = sprListCountriesController.getTextOfCell(Me.sprListCountries.ActiveRow, CountryColumns.txn_ts)
                logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            Else
                dbManager.commitTrans
            End If
            
        Case Default
            dbManager.commitTrans
            errorManager.setErrorAttributes modStandardMessages.InValidMode, "clsEditInterface_fireSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
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
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsEditInterface_fireInsertMode", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
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
    dbManager.executeSQL "CDB..delCountries " & Trim(Me.txtID.Text) & "," & varTxnTs
    dbManager.commitTrans
    
Exit Sub
errortag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireRemove", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing delete query"
    Err.Raise Err.Number
End Sub

'Implementation of the fireRetrieve() method of the clsQueryInterface.
'This method opens the form in Retrieve Mode through showForm() method.
Public Sub clsQueryInterface_fireRetrieve()
    
On Error GoTo errortag
    Me.clsWindowInterface_showForm uiManager.RETRIEVE_MODE
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireRetrieve", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsQueryInterface_fireSort()

End Sub

'Implementation of the getSpreadControllerForRetrieval() function of the clsQueryInterface. This function
'returns the spread controller which should be used for retrieval of the records in Retrieve mode. Here
'the retrieval is done in the sprListCountriesController, so that is returned to the caller.
Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController
    
    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListCountriesController

End Function

'Implementation of the getSQLStringForRetrieval() function of the clsQueryInterface. This function
'returns the sql string which should be used by ADL to retrieve records in Retrieve mode.
'The query is build based upon the user entries in the different fields of the form.
Public Function clsQueryInterface_getSQLStringForRetrieval() As String

On Error GoTo errortag
    
    Dim strRetrieveCountries As String
    
    strRetrieveCountries = "SELECT country_cd, country_nm, isd_code, gmt_diff, cast(txn_ts AS BigInt), convert(varchar,effective_from,106)effective_from, " & _
                           "convert(varchar,effective_till,106)effective_till,country_id FROM countries "
    
    If Trim(Me.txtCountryCode.Text) <> "" Then
        strRetrieveCountries = strRetrieveCountries & " WHERE country_cd LIKE '%" & Replace(Trim(Me.txtCountryCode.Text), "'", "''") & "%'  AND"
    Else
        strRetrieveCountries = strRetrieveCountries & " WHERE country_cd LIKE '%%'  AND"
    End If

    If Trim(Me.txtCountryName.Text) <> "" Then
        strRetrieveCountries = strRetrieveCountries & " country_nm LIKE '%" & Replace(Trim(Me.txtCountryName.Text), "'", "''") & "%'  AND"
    End If

    If Trim(Me.txtISDCode.Text) <> "" Then
        strRetrieveCountries = strRetrieveCountries & " isd_code LIKE '%" & Trim(Me.txtISDCode.Text) & "%'  AND"
    End If

    If Trim(Me.txtGMTDiff.Text) <> "" Then
        strRetrieveCountries = strRetrieveCountries & " gmt_diff LIKE '%" & Trim(Me.txtGMTDiff.Text) & "%'  AND"
    End If

    If Trim(Me.txtEffectiveFrom.Text) <> "" Then
        strRetrieveCountries = strRetrieveCountries & " effective_from = '" & Trim(Me.txtEffectiveFrom.Text) & "'  AND"
    End If

    If Trim(Me.txtEffectiveTill.Text) <> "" Then
        strRetrieveCountries = strRetrieveCountries & " effective_till = '" & Trim(Me.txtEffectiveTill.Text) & "'  AND"
    End If

    If Trim(Me.txtID.Text) <> "" Then
        strRetrieveCountries = strRetrieveCountries & " country_id =  " & Trim(Me.txtID.Text) & "  AND"
    End If

    strRetrieveCountries = Left(strRetrieveCountries, Len(strRetrieveCountries) - 3)
    strRetrieveCountries = strRetrieveCountries & " ORDER BY country_id"
    Debug.Print strRetrieveCountries
    clsQueryInterface_getSQLStringForRetrieval = strRetrieveCountries
    
Exit Function

errortag:
    errorManager.setErrorAttributes "UnknownError", "clsQueryInterface_getSQLStringForRetrieval", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

'Implementation of the populateFieldsFromRetrievalSpread() method of the clsQueryInterface
'All the fields are populated from the spread where the records are retrieved. Parameter p_lonrow
'states the row of the spread whose values are to be set in respective fields.
Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)

On Error GoTo errortag

    Me.txtCountryCode.Text = CStr(Trim(sprListCountriesController.getTextOfCell(p_lonRow, CountryColumns.CountryCode)))
    Me.txtCountryName.Text = CStr(sprListCountriesController.getTextOfCell(p_lonRow, CountryColumns.countryName))
    Me.txtISDCode.Text = CStr(sprListCountriesController.getTextOfCell(p_lonRow, CountryColumns.ISDCode))
    varTxnTs = sprListCountriesController.getTextOfCell(sprListCountries.Row, CountryColumns.txn_ts)
    Me.txtEffectiveFrom.Text = Format(CDate(sprListCountriesController.getTextOfCell(p_lonRow, CountryColumns.effectivefrom)), "dd-mmm-yyyy")
    Me.txtEffectiveTill.Text = Format(CDate(sprListCountriesController.getTextOfCell(p_lonRow, CountryColumns.effectiveTill)), "dd-mmm-yyyy")
    Me.txtID.Text = sprListCountriesController.getTextOfCell(p_lonRow, CountryColumns.countryID)
    Me.txtGMTDiff.Text = sprListCountriesController.getTextOfCell(p_lonRow, CountryColumns.GMTDiff)
    
    'populating spread sprCountryStates with states details corresponding to the country ID
    Dim strSelectStates As String
    strSelectStates = "CDB..selStates " & Trim(Me.txtID.Text)
    sprCountryStatesController.retrieveRecords (strSelectStates)

Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_populateFieldsFromRetrievalSpread", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub



Public Sub clsWindowInterface_fireClose()

End Sub

'Implementation of the fireErase() method of the clsWindowInterface. All the Controls and spreads of the form are
'cleared of any data. clearSpread() method of the spreadController is called for clearing the spreads.
Public Sub clsWindowInterface_fireErase()

    utils.clearControls Me.txtCountryCode, Me.txtCountryName, Me.txtID, Me.txtISDCode, Me.txtGMTDiff
    
    'only in query mode, dates are erased, otherwise their default values are displayed
    Select Case intMode
        Case uiManager.QUERY_MODE
            Me.txtEffectiveFrom.Text = ""
            Me.txtEffectiveTill.Text = ""
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
            Me.txtEffectiveFrom.Text = Format(Date, "dd-mmm-yyyy")
            Me.txtEffectiveTill.Text = "31-Dec-9999"
    End Select
    
    If Not Me.sprListCountries Is Nothing Then
        sprListCountriesController.clearSpread
    End If
    If Not Me.sprCountryStates Is Nothing Then
        sprCountryStatesController.clearSpread
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

    clsWindowInterface_getScreenID = "LOC_02"
    
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
    
    'When the form is already open, the spread is not set again
    If Not mdiMain.ActiveForm Is Me Then
        setSpreadController
    End If
    
    Me.Visible = True
    Me.ZOrder 0
    setEnableDisableControls
    
End Sub

'This is a private method to this code module. Here spread controllers are initialized and columns are
'added to them for all the respective spreads in this form.
Private Sub setSpreadController()
    
    'initializing and adding columns to sprListCountriesController of countries
    Set sprListCountriesController = New clsSpreadController
    sprListCountriesController.registerSpreadInstance uiManager, Me.sprListCountries, LIST_SPREAD, Me
    sprListCountriesController.setHeaderHeight 600
    
    sprListCountriesController.addColumn "Code", 6, STATIC_TEXT_CELL_TYPE, False, True
    sprListCountriesController.addColumn "Country Name", 47, STATIC_TEXT_CELL_TYPE, False, True
    sprListCountriesController.addColumn "ISD Code", 13, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListCountriesController.addColumn "GMT Diff", 8, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListCountriesController.addColumn "Txn_Ts", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListCountriesController.addColumn "Effective From", 11, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListCountriesController.addColumn "Effective   Till", 11, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListCountriesController.addColumn "ID", 6, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    
    'initializing and adding columns to sprCountryStatesController of states
    Set sprCountryStatesController = New clsSpreadController
    sprCountryStatesController.registerSpreadInstance uiManager, Me.sprCountryStates, LIST_SPREAD, Me
    sprCountryStatesController.setHeaderHeight 600
    
    sprCountryStatesController.addColumn "State Code", 15, STATIC_TEXT_CELL_TYPE, False, True, , , , , , UPPER_CASE
    sprCountryStatesController.addColumn "State Name", 75, STATIC_TEXT_CELL_TYPE, False, True
    sprCountryStatesController.addColumn "State   ID", 10, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls()

    Select Case intMode
    
        Case uiManager.INSERT_MODE
            
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            sprListCountriesController.setSpreadMode intMode
            sprCountryStatesController.setSpreadMode intMode
            Me.fraCountries.ZOrder 0
            Me.sprCountryStates.Visible = False
            Me.txtCountryCode.SetFocus
            
        Case uiManager.QUERY_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID
            sprListCountriesController.setSpreadMode intMode
            sprCountryStatesController.setSpreadMode intMode
            Me.fraCountries.ZOrder 0
            Me.sprCountryStates.Visible = False
            Me.txtID.SetFocus
            
        Case uiManager.RETRIEVE_MODE
        
            sprListCountriesController.setSpreadMode intMode
            sprCountryStatesController.setSpreadMode intMode
            Me.fraCountries.ZOrder 0
            Me.sprCountryStates.Visible = False
            
        Case uiManager.BROWSE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID
            sprListCountriesController.setSpreadMode intMode
            sprCountryStatesController.setSpreadMode uiManager.REFERENCE_MODE
            Me.fraCountries.ZOrder 0
            Me.sprCountryStates.Visible = True
            Me.txtCountryCode.SetFocus
            
        Case uiManager.LIST_MODE
        
            sprListCountriesController.setSpreadMode intMode
            sprCountryStatesController.setSpreadMode intMode
            Me.fraCountriesSpread.ZOrder 0
            Me.sprCountryStates.Visible = False
            
        Case uiManager.NEW_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            sprListCountriesController.setSpreadMode intMode
            sprCountryStatesController.setSpreadMode intMode
            Me.fraCountries.ZOrder 0
            Me.sprCountryStates.Visible = False
            Me.txtCountryCode.SetFocus
            
        Case uiManager.UPDATE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID
            sprListCountriesController.setSpreadMode intMode
            sprCountryStatesController.setSpreadMode uiManager.REFERENCE_MODE
            Me.fraCountries.ZOrder 0
            Me.sprCountryStates.Visible = True
            Me.txtCountryCode.SetFocus
                        
        Case uiManager.REFERENCE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtCountryCode, Me.txtCountryName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID, Me.txtISDCode
            sprListCountriesController.setSpreadMode intMode
            sprCountryStatesController.setSpreadMode intMode
            Me.fraCountries.ZOrder 0
            Me.sprCountryStates.Visible = True
            Me.sprListCountries.SetFocus
    End Select
    
End Sub

'The method notifies the UIManager of ADL that the form has been activated in current mode.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

'setting the controls with standardard specifications in normal state
Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.txtID, Me.txtCountryCode, Me.txtCountryName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtISDCode, Me.lblCountryCode, Me.lblCountryName, Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblId, Me.lblISDCode, Me.txtGMTDiff
    modControlsSettings.setStateToNormal Me.lblCountryCode, Me.lblCountryName, Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblId, Me.lblISDCode, Me.txtCountryCode, Me.txtCountryName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtISDCode
End Sub

'The method sets the status text of the main screen
Private Sub txtCountryCode_GotFocus()
    uiManager.setStatusText ""
End Sub

'validating CountryCode
Private Sub txtCountryCode_Validate(Cancel As Boolean)
    'check for mandatory field - CountryCode
    validateCountryCode
End Sub

'The method sets the status text of the main screen
Private Sub txtCountryName_GotFocus()
    uiManager.setStatusText ""
End Sub

'validating CountryName
Private Sub txtCountryName_Validate(Cancel As Boolean)
    'check for mandatory field - CountryName
    validateCountryName
End Sub

'The method sets the status text of the main screen
Private Sub txtEffectiveFrom_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter date smaller than Effective Till Date"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

'validating EffectiveFrom
Private Sub txtEffectiveFrom_Validate(Cancel As Boolean)
    'check for mandatory field - EffectiveFrom
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
            uiManager.setStatusText "Please enter date greater than Effective From Date"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

'validating effectiveTill
Private Sub txtEffectiveTill_Validate(Cancel As Boolean)
    'check for mandatory field - EffectiveTill
    If validateEffectiveTill And intMode <> uiManager.QUERY_MODE Then
        If DateDiff("d", Me.txtEffectiveTill.Text, Date) > 0 Then
            logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Effective Till|" & Format(Date, "dd mmm yyyy"), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        End If
    End If
    If Not validateEffectiveTill And Me.txtEffectiveTill.Text <> "" Then
        Cancel = True
    End If
End Sub

'The method sets the status text of the main screen
Private Sub txtISDCode_GotFocus()
    uiManager.setStatusText ""
End Sub


