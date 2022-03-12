VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "EDT32X30.OCX"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.OCX"
Begin VB.Form frmMeasuringUnits 
   BackColor       =   &H00C0C0C0&
   Caption         =   "MEASURING UNITS"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
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
   ForeColor       =   &H00800000&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.Frame fraMeasuringUnits 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   10755
      Left            =   -480
      TabIndex        =   19
      Top             =   0
      Width           =   12555
      Begin EditLib.fpDoubleSingle fpToleranceOverage 
         Height          =   345
         Left            =   7320
         TabIndex        =   25
         Top             =   2640
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
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   0   'False
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   0   'False
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   -2147483637
         InvalidOption   =   0
         MarginLeft      =   3
         MarginTop       =   3
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   -2147483637
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   0
         ControlType     =   0
         Text            =   "0"
         DecimalPlaces   =   -1
         DecimalPoint    =   ""
         FixedPoint      =   0   'False
         LeadZero        =   0
         MaxValue        =   "9000000000"
         MinValue        =   "-9000000000"
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
      Begin EditLib.fpDoubleSingle fpToleranceShort 
         Height          =   345
         Left            =   5400
         TabIndex        =   4
         Top             =   2640
         Width           =   1095
         _Version        =   196608
         _ExtentX        =   1931
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
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   0   'False
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   0   'False
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   -2147483637
         InvalidOption   =   0
         MarginLeft      =   3
         MarginTop       =   3
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   -2147483637
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   0
         ControlType     =   0
         Text            =   "0"
         DecimalPlaces   =   -1
         DecimalPoint    =   ""
         FixedPoint      =   0   'False
         LeadZero        =   0
         MaxValue        =   "9000000000"
         MinValue        =   "-9000000000"
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
      Begin EditLib.fpText txtToleranceOverage 
         Height          =   345
         Left            =   7440
         TabIndex        =   6
         Top             =   5040
         Visible         =   0   'False
         Width           =   1335
         _Version        =   196608
         _ExtentX        =   2355
         _ExtentY        =   609
         Enabled         =   0   'False
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
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   0   'False
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   0   'False
         AutoCase        =   0
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   -2147483637
         InvalidOption   =   0
         MarginLeft      =   3
         MarginTop       =   3
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   -2147483637
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   0
         ControlType     =   0
         Text            =   ""
         CharValidationText=   "1234567890."
         MaxLength       =   5
         MultiLine       =   0   'False
         PasswordChar    =   ""
         IncHoriz        =   0.25
         BorderGrayAreaColor=   -2147483637
         NoPrefix        =   0   'False
         ScrollV         =   0   'False
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
      Begin EditLib.fpText txtToleranceShort 
         Height          =   345
         Left            =   5280
         TabIndex        =   5
         Top             =   5040
         Visible         =   0   'False
         Width           =   1095
         _Version        =   196608
         _ExtentX        =   1931
         _ExtentY        =   609
         Enabled         =   0   'False
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
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   0   'False
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   0   'False
         AutoCase        =   0
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   -2147483637
         InvalidOption   =   0
         MarginLeft      =   3
         MarginTop       =   3
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   -2147483637
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   0
         ControlType     =   0
         Text            =   ""
         CharValidationText=   "1234567890."
         MaxLength       =   5
         MultiLine       =   0   'False
         PasswordChar    =   ""
         IncHoriz        =   0.25
         BorderGrayAreaColor=   -2147483637
         NoPrefix        =   0   'False
         ScrollV         =   0   'False
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
      Begin VB.ComboBox cmbTypeOfUnit 
         BackColor       =   &H00E0E0E0&
         Height          =   360
         ItemData        =   "frmMeasuringUnits.frx":0000
         Left            =   3600
         List            =   "frmMeasuringUnits.frx":0002
         TabIndex        =   22
         Text            =   "Combo1"
         Top             =   2640
         Width           =   1215
      End
      Begin EditLib.fpLongInteger txtID 
         Height          =   350
         Left            =   3720
         TabIndex        =   1
         Top             =   480
         Width           =   855
         _Version        =   196608
         _ExtentX        =   1508
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
         AutoBeep        =   -1  'True
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
         MaxValue        =   "9999"
         MinValue        =   "1"
         NegFormat       =   1
         NegToggle       =   0   'False
         Separator       =   ""
         UseSeparator    =   0   'False
         IncInt          =   1
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
      Begin EditLib.fpText txtMeasuringName 
         Height          =   350
         Left            =   7080
         TabIndex        =   8
         Top             =   480
         Width           =   2535
         _Version        =   196608
         _ExtentX        =   4471
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
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   0   'False
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   0   'False
         AutoCase        =   0
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   -2147483637
         InvalidOption   =   0
         MarginLeft      =   3
         MarginTop       =   3
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   -2147483637
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   0
         ControlType     =   0
         Text            =   ""
         CharValidationText=   ""
         MaxLength       =   20
         MultiLine       =   0   'False
         PasswordChar    =   ""
         IncHoriz        =   0.25
         BorderGrayAreaColor=   -2147483637
         NoPrefix        =   0   'False
         ScrollV         =   0   'False
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
      Begin EditLib.fpText txtMeasuringCode 
         Height          =   350
         Left            =   5325
         TabIndex        =   3
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
         AlignTextH      =   0
         AlignTextV      =   0
         AllowNull       =   0   'False
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   0   'False
         AutoCase        =   1
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   -2147483637
         InvalidOption   =   0
         MarginLeft      =   3
         MarginTop       =   3
         MarginRight     =   3
         MarginBottom    =   3
         NullColor       =   -2147483637
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   0
         ControlType     =   0
         Text            =   ""
         CharValidationText=   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
         MaxLength       =   4
         MultiLine       =   0   'False
         PasswordChar    =   ""
         IncHoriz        =   0.25
         BorderGrayAreaColor=   -2147483637
         NoPrefix        =   0   'False
         ScrollV         =   0   'False
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
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   345
         Left            =   6240
         TabIndex        =   16
         Top             =   3840
         Width           =   1575
         _Version        =   196608
         _ExtentX        =   2778
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
         BorderStyle     =   1
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
         DateCalcMethod  =   0
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
         BorderGrayAreaColor=   -2147483637
         ThreeDOnFocusInvert=   0   'False
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   0
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
         TabIndex        =   14
         Top             =   3840
         Width           =   1575
         _Version        =   196608
         _ExtentX        =   2778
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
         BorderStyle     =   1
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
         DateCalcMethod  =   0
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
         BorderGrayAreaColor=   -2147483637
         ThreeDOnFocusInvert=   0   'False
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   0
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
      Begin EditLib.fpLongInteger txtUnitDecimals 
         Height          =   350
         Left            =   3720
         TabIndex        =   10
         Top             =   1220
         Width           =   465
         _Version        =   196608
         _ExtentX        =   820
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
         BorderStyle     =   1
         BorderColor     =   -2147483642
         BorderWidth     =   1
         ButtonDisable   =   0   'False
         ButtonHide      =   0   'False
         ButtonIncrement =   1
         ButtonMin       =   0
         ButtonMax       =   100
         ButtonStyle     =   1
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
         MaxValue        =   "5"
         MinValue        =   "0"
         NegFormat       =   1
         NegToggle       =   0   'False
         Separator       =   ""
         UseSeparator    =   0   'False
         IncInt          =   1
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
      Begin VB.Frame fraNumberFormat 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Number Format Type"
         ForeColor       =   &H00800000&
         Height          =   675
         Left            =   6180
         TabIndex        =   20
         Top             =   980
         Width           =   3435
         Begin EditLib.fpBoolean optMillions 
            Height          =   375
            Left            =   1980
            TabIndex        =   12
            Top             =   270
            Width           =   1365
            _Version        =   196608
            _ExtentX        =   2408
            _ExtentY        =   661
            Enabled         =   -1  'True
            MousePointer    =   0
            Object.TabStop         =   0   'False
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ThreeDInsideStyle=   0
            ThreeDInsideHighlightColor=   -2147483633
            ThreeDInsideShadowColor=   -2147483642
            ThreeDInsideWidth=   1
            ThreeDOutsideStyle=   0
            ThreeDOutsideHighlightColor=   16777215
            ThreeDOutsideShadowColor=   -2147483632
            ThreeDOutsideWidth=   1
            ThreeDFrameWidth=   0
            BorderStyle     =   0
            BorderColor     =   -2147483642
            BorderWidth     =   1
            AutoToggle      =   -1  'True
            BooleanStyle    =   0
            ToggleFalse     =   ""
            TextFalse       =   "##,###,###"
            BooleanPicture  =   1
            AlignPictureH   =   3
            AlignPictureV   =   1
            GroupId         =   0
            GroupTag        =   0
            GroupSelect     =   3
            MarginLeft      =   3
            MarginTop       =   3
            MarginRight     =   3
            MarginBottom    =   3
            MultiLine       =   0   'False
            AlignTextH      =   0
            AlignTextV      =   1
            ToggleTrue      =   ""
            TextTrue        =   ""
            Value           =   0
            BooleanMode     =   0
            ThreeDText      =   0
            ThreeDTextHighlightColor=   -2147483637
            ThreeDTextShadowColor=   -2147483637
            ThreeDTextOffset=   1
            BorderGrayAreaColor=   -2147483637
            ToggleGrayed    =   ""
            TextGrayed      =   ""
            AllowMnemonic   =   -1  'True
            BackColor       =   12632256
            ForeColor       =   8388608
            ThreeDOnFocusInvert=   0   'False
            Caption         =   "##,###,###"
            ThreeDFrameColor=   -2147483633
            Appearance      =   0
            BorderDropShadow=   0
            BorderDropShadowColor=   -2147483632
            BorderDropShadowWidth=   3
            BooleanDataType =   0
            OLEDropMode     =   0
         End
         Begin EditLib.fpBoolean optLacs 
            Height          =   315
            Left            =   180
            TabIndex        =   11
            Top             =   270
            Width           =   1485
            _Version        =   196608
            _ExtentX        =   2619
            _ExtentY        =   556
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
            ThreeDInsideStyle=   0
            ThreeDInsideHighlightColor=   -2147483633
            ThreeDInsideShadowColor=   -2147483642
            ThreeDInsideWidth=   1
            ThreeDOutsideStyle=   0
            ThreeDOutsideHighlightColor=   16777215
            ThreeDOutsideShadowColor=   -2147483632
            ThreeDOutsideWidth=   1
            ThreeDFrameWidth=   0
            BorderStyle     =   0
            BorderColor     =   -2147483642
            BorderWidth     =   1
            AutoToggle      =   -1  'True
            BooleanStyle    =   0
            ToggleFalse     =   ""
            TextFalse       =   "##,##,###"
            BooleanPicture  =   1
            AlignPictureH   =   3
            AlignPictureV   =   1
            GroupId         =   0
            GroupTag        =   0
            GroupSelect     =   3
            MarginLeft      =   3
            MarginTop       =   3
            MarginRight     =   3
            MarginBottom    =   3
            MultiLine       =   0   'False
            AlignTextH      =   0
            AlignTextV      =   1
            ToggleTrue      =   ""
            TextTrue        =   ""
            Value           =   0
            BooleanMode     =   0
            ThreeDText      =   0
            ThreeDTextHighlightColor=   -2147483637
            ThreeDTextShadowColor=   -2147483637
            ThreeDTextOffset=   1
            BorderGrayAreaColor=   -2147483637
            ToggleGrayed    =   ""
            TextGrayed      =   ""
            AllowMnemonic   =   -1  'True
            BackColor       =   12632256
            ForeColor       =   8388608
            ThreeDOnFocusInvert=   0   'False
            Caption         =   "##,##,###"
            ThreeDFrameColor=   -2147483633
            Appearance      =   0
            BorderDropShadow=   0
            BorderDropShadowColor=   -2147483632
            BorderDropShadowWidth=   3
            BooleanDataType =   0
            OLEDropMode     =   0
         End
      End
      Begin VB.Label lblToleranceOverage 
         BackColor       =   &H00C0C0C0&
         BackStyle       =   0  'Transparent
         Caption         =   "Tolerance Overage"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   7200
         TabIndex        =   24
         Top             =   2160
         Width           =   1815
      End
      Begin VB.Label lblToleranceShort 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Tolerance Short"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   5325
         TabIndex        =   23
         Top             =   2160
         Width           =   1575
      End
      Begin VB.Label lblTypeOfUnit 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Type Of Unit"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   3720
         TabIndex        =   21
         Top             =   2160
         Width           =   1215
      End
      Begin VB.Label lblMeasuringUnitCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Code "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5325
         TabIndex        =   2
         Top             =   240
         Width           =   510
      End
      Begin VB.Label lblMeasuringUnitName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   7080
         TabIndex        =   7
         Top             =   240
         Width           =   570
      End
      Begin VB.Label lblUnitDecimals 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Digits after Decimal place"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   9
         Top             =   980
         Width           =   2220
      End
      Begin VB.Label lblEffectiveFrom 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   13
         Top             =   3360
         Width           =   1290
      End
      Begin VB.Label lblEffectiveTill 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6240
         TabIndex        =   15
         Top             =   3360
         Width           =   1080
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
   End
   Begin VB.Frame fraListMeasuringUnits 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   11055
      Left            =   0
      TabIndex        =   17
      Top             =   0
      Width           =   12375
      Begin FPSpread.vaSpread sprListMeasuringUnits 
         Height          =   6465
         Left            =   120
         TabIndex        =   18
         TabStop         =   0   'False
         Tag             =   "Measuring Units List Spread"
         Top             =   120
         Width           =   11745
         _Version        =   393216
         _ExtentX        =   20717
         _ExtentY        =   11404
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
         SpreadDesigner  =   "frmMeasuringUnits.frx":0004
      End
   End
End
Attribute VB_Name = "frmMeasuringUnits"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Implements clsWindowInterface
Implements clsEditInterface
Implements clsQueryInterface

'This variable holds the value of the current mode of the form. This is set each time the form is opened in
'different mode with the 'showForm()' method of the 'clsWindowInterface'. And the value of this variable is
'returned, whenever requested through 'getMode()' method of the 'clsWindowInterface'
Dim intMode As Integer

'stores the value of txn_ts. the variable is filled in the populateFieldsFromRetrievalSpread method
'of clsQueryInterface
Dim varTxnTs As Variant

'The declaration of spread controller for retrieving the records from the Measuring Units table. This spread controller
'is also used to show the records in list mode. This object variable is defined "withEvents" because this code
'module needs to catch the events thrown by this controller (like 'validateCell','validateRow' etc)
Dim WithEvents sprListMeasuringUnitsController As clsSpreadController
Attribute sprListMeasuringUnitsController.VB_VarHelpID = -1

'This enum holds all the column numbers of the spread controller 'sprListMeasuringUnitsController' that shows all the
'records of measuring units. The column numbers are stored into variables named corresponding to column names. These are
'called in functions of spreadController like 'getTextOfCell' or 'setTextOfCell' which requires row & column number.
Private Enum unitColumns
    unitCode = 1
    unitName = 2
    decimals = 3
    noFormat = 4
    txn_ts = 5
    effectivefrom = 6
    effectiveTill = 7
    ' added by hbavna on Oct 1,2011
    type_of_unit = 8
    tolerance_short = 9
    tolerance_overage = 10
    '-----------------------------------------
    unitID = 11
    
End Enum


'private function returning true when the field - measuring unit code is valid, otherwise false
Private Function validateMeasuringUnitCode() As Boolean
    validateMeasuringUnitCode = True
    
    'check for mandatory field
    If (intMode = uiManager.QUERY_MODE) Then Exit Function
    If (Trim(Me.txtMeasuringCode.Text) = "") Then
        Me.txtMeasuringCode.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Measuring Unit Code", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateMeasuringUnitCode = False
    End If
    
    
End Function

'added on Oct1,2011  by Bhavna
'private function returning true when the field - type of unit is valid, otherwise false

Private Function validateTypeOfUnit() As Boolean
    validateTypeOfUnit = True

    'check for mandatory field
    If (intMode = uiManager.QUERY_MODE) Then Exit Function
    If (Trim(Me.cmbTypeOfUnit.Text) = "") Then
        Me.cmbTypeOfUnit.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Type Of Unit", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateTypeOfUnit = False
    End If
    
    
End Function

'added on Oct2,2011  by Bhavna
'private function returning true when the field - tolerance short is valid, otherwise false

Private Function validateToleranceShort() As Boolean
    validateToleranceShort = True

    'check for mandatory field
    If (intMode = uiManager.QUERY_MODE) Then Exit Function
    If (Trim(Me.fpToleranceShort.Text) = "") Then
        Me.fpToleranceShort.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Tolerance Short", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateToleranceShort = False
    End If


End Function

'added on Oct2,2011  by Bhavna
'private function returning true when the field - tolerance overage is valid, otherwise false

Private Function validateToleranceOverage() As Boolean
    validateToleranceOverage = True

    'check for mandatory field
    If (intMode = uiManager.QUERY_MODE) Then Exit Function
    If (Trim(Me.fpToleranceOverage.Text) = "") Then
        Me.fpToleranceOverage.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Tolerance Overage", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateToleranceOverage = False
    End If


End Function
    
'commented on Oct 2,2011

''added on Oct1,2011  by Bhavna
''private function returning true when the field - tolerance short is valid, otherwise false
'
'Private Function validateToleranceShort() As Boolean
'    validateToleranceShort = True
'
'    'check for mandatory field
'    If (intMode = uiManager.QUERY_MODE) Then Exit Function
'    If (Trim(Me.txtToleranceShort.Text) = "") Then
'        Me.txtToleranceShort.SetFocus
'        logger.logMessage modStandardMessages.ValueReqd, "Tolerance Short", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
'        validateToleranceShort = False
'    End If
'
'
'End Function
'
''added on Oct1,2011  by Bhavna
''private function returning true when the field - tolerance overage is valid, otherwise false
'
'Private Function validateToleranceOverage() As Boolean
'    validateToleranceOverage = True
'
'    'check for mandatory field
'    If (intMode = uiManager.QUERY_MODE) Then Exit Function
'    If (Trim(Me.txtToleranceOverage.Text) = "") Then
'        Me.txtToleranceOverage.SetFocus
'        logger.logMessage modStandardMessages.ValueReqd, "Tolerance Overage", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
'        validateToleranceOverage = False
'    End If
'
'
'End Function


'private function returning true when the field - measuring unit name is valid, otherwise false
Private Function validateMeasuringUnitName() As Boolean
    validateMeasuringUnitName = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtMeasuringName.Text) = "" Then
        Me.txtMeasuringName.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Measuring Unit Name", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateMeasuringUnitName = False
    End If
End Function

'private function returning true when the field - measuring unit decimals is valid, otherwise false
Private Function validateMeasuringUnitDecimals() As Boolean
    validateMeasuringUnitDecimals = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtUnitDecimals.Text) = "" Then
        Me.txtUnitDecimals.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Measuring Unit Decimals", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateMeasuringUnitDecimals = False
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


'Implementation of isReadyToSave function of the interface - clsEditInterface. No invalid data
'should enter into database. Thus before saving record, certain checks are carried out in this function. If all
'the checks are cleared then the function returns boolean value 'True' otherwise returns boolean value 'False'
'and a descriptive error or warning message is generated.
Public Function clsEditInterface_isReadyToSave() As Boolean
    clsEditInterface_isReadyToSave = True
    
    'validate event of the last focused control is called before save
    Me.ValidateControls
    
    If (Not validateMeasuringUnitCode) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateMeasuringUnitName) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateMeasuringUnitDecimals) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
                'add by bhavna on Oct1,2011
    ElseIf (Not validateTypeOfUnit) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateToleranceShort) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateToleranceOverage) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
     '-----------------------------------------------------------------
    ElseIf (Not validateEffectiveFrom) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateEffectiveTill) Then
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
    'edited by bhavna on OCT1,2011
    strSQL = "CDB..insUpdMeasuringUnits '" & Trim(UCase(Me.txtMeasuringCode.Text)) & "','" & _
                                             Replace(Trim(Me.txtMeasuringName.Text), "'", "''") & "'," & _
                                             Trim(Me.txtUnitDecimals.Text) & "," & _
                                             IIf(Me.optLacs.Value = ValueTrue, "'Lacs'", "'Millions'") & ",'" & _
                                             Trim(Me.txtEffectiveFrom.Text) & "','" & _
                                             Trim(Me.txtEffectiveTill.Text) & "'," & _
                                             IIf(Me.txtID.Text = "", "NULL", Trim(Me.txtID.Text)) & "," & _
                                             IIf(varTxnTs = "", "NULL", varTxnTs) & ",'" & _
                                             Replace(Trim(Me.cmbTypeOfUnit.Text), "'", " ''") & "'," & _
                                             (Trim(Me.fpToleranceShort.Text)) & "," & _
                                             (Trim(Me.fpToleranceOverage.Text))

                                             
                                             
    dbManager.beginTrans
    
    Select Case intMode
        Case uiManager.INSERT_MODE
                        
            strSQL = strSQL & ",0"      '0 - INSERT
            Dim rsMeasuringUnits As clsRecordHashMap
            Set rsMeasuringUnits = dbManager.executeSQLGetRS(strSQL)
            dbManager.commitTrans
            
            logger.logMessage modStandardMessages.ObjectSaveMsg, _
                              "Measuring Unit - '" & Trim(Me.txtMeasuringName.Text) & "'|" & rsMeasuringUnits.getFieldValueByFieldIndex(0, 0), _
                              PLAIN_MESSAGE, _
                              Me.clsWindowInterface_getScreenID, _
                              Me.clsWindowInterface_getMode
            
            
            'the screen has to get cleared of any data and get ready to insert more data
            Me.clsWindowInterface_showForm uiManager.INSERT_MODE
            Me.txtMeasuringCode.SetFocus
        
        Case uiManager.BROWSE_MODE
            
            strSQL = strSQL & ",1"      '1 - UPDATE
            dbManager.executeSQL strSQL
            dbManager.commitTrans
            sprListMeasuringUnitsController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, _
                                                      Me.sprListMeasuringUnits.ActiveRow
            Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListMeasuringUnits.ActiveRow
            varTxnTs = sprListMeasuringUnitsController.getTextOfCell(Me.sprListMeasuringUnits.ActiveRow, unitColumns.txn_ts)
            logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            
        Case Default
            dbManager.commitTrans
            errorManager.setErrorAttributes modStandardMessages.InValidMode, "clsEditInterface_fireSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Err.Raise Err.Number
            
    End Select

Exit Sub
    
errortag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsEditInterface_fireSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
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
    dbManager.executeSQL "CDB..delMeasuringUnits " & Trim(Me.txtID.Text) & "," & varTxnTs
    dbManager.commitTrans
Exit Sub

errortag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireRemove", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
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
'the retrieval is done in the "sprListMeasuringUnitsController", so that is returned to the caller.
Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController
    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListMeasuringUnitsController
End Function

'Implementation of the getSQLStringForRetrieval() function of the clsQueryInterface. This function
'returns the sql string which should be used by ADL to retrieve records in Retrieve mode.
'The query is build based upon the user entries in the different fields of the form.
Public Function clsQueryInterface_getSQLStringForRetrieval() As String

    Dim qryMeasuringUnits As String
    'Added on Oct1,2011 by Bhavna
    qryMeasuringUnits = "SELECT measuring_unit_cd, measuring_unit_nm, unit_decimals, number_format_type, " & _
                        "Cast(txn_ts AS BigInt), Convert(varchar, effective_from, 106)effective_from, " & _
                        "Convert(varchar, effective_till, 106)effective_till,type_of_unit," & _
                        "Convert(varchar(100),tolerance_short),Convert(varchar(100),tolerance_overage), measuring_unit_id " & _
                        "FROM measuring_units "

    If Trim(Me.txtEffectiveFrom.Text) <> "" Then
        qryMeasuringUnits = qryMeasuringUnits & "WHERE effective_from = '" & Trim(Me.txtEffectiveFrom.Text) & "' AND "
    Else
        qryMeasuringUnits = qryMeasuringUnits & "WHERE effective_from LIKE '%%' AND "
    End If
    
    If Trim(Me.txtEffectiveTill.Text) <> "" Then
        qryMeasuringUnits = qryMeasuringUnits & "effective_till = '" & Trim(Me.txtEffectiveTill.Text) & "' AND "
    End If

    If Trim(Me.txtMeasuringCode.Text) <> "" Then
        qryMeasuringUnits = qryMeasuringUnits & "measuring_unit_cd LIKE '%" & Trim(Me.txtMeasuringCode.Text) & "%' AND "
    End If

    If Trim(Me.txtMeasuringName.Text) <> "" Then
        qryMeasuringUnits = qryMeasuringUnits & "measuring_unit_nm LIKE '%" & Trim(Me.txtMeasuringName.Text) & "%' AND "
    End If

    If Me.optLacs.Value = ValueTrue Then
        qryMeasuringUnits = qryMeasuringUnits & "number_format_type = 'Lacs' AND "
    ElseIf Me.optMillions.Value = ValueTrue Then
        qryMeasuringUnits = qryMeasuringUnits & "number_format_type = 'Millions' AND "
    End If
    
    If Trim(Me.txtUnitDecimals.Text) <> "" Then
        qryMeasuringUnits = qryMeasuringUnits & "unit_decimals = " & Trim(Me.txtUnitDecimals.Text) & " AND "
    End If

    
    'added on Oct1,2011 by Bhavna
        
    If Trim(Me.cmbTypeOfUnit.Text) <> "" Then
        qryMeasuringUnits = qryMeasuringUnits & "type_of_unit = '" & Trim(Me.cmbTypeOfUnit.Text) & " 'AND "
    End If
     
    If Trim(Me.txtToleranceOverage.Text) <> "" Then
        qryMeasuringUnits = qryMeasuringUnits & "tolerance_overage = " & Trim(Me.fpToleranceOverage.Text) & " AND "
    End If
    If Trim(Me.txtToleranceShort.Text) <> "" Then
        qryMeasuringUnits = qryMeasuringUnits & "tolerance_short = " & Trim(Me.fpToleranceShort.Text) & " AND "
    End If
     '--------------------------------------------------------------------------------------------
    
    
    If Trim(Me.txtID.Text) <> "" Then
        qryMeasuringUnits = qryMeasuringUnits & "measuring_unit_id = " & Trim(Me.txtID.Text) & " AND "
    End If
    
    qryMeasuringUnits = Left(Trim(qryMeasuringUnits), Len(Trim(qryMeasuringUnits)) - 3)
    qryMeasuringUnits = qryMeasuringUnits & " ORDER BY measuring_unit_id"

    clsQueryInterface_getSQLStringForRetrieval = qryMeasuringUnits

End Function

'Implementation of the populateFieldsFromRetrievalSpread() method of the clsQueryInterface. All the fields are
'populated from the spread where the records are retrieved. Parameter p_lonrow states the row of the spread
'whose values are to be set in respective fields.
Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)
    
    Me.txtMeasuringCode.Text = CStr(Trim(sprListMeasuringUnitsController.getTextOfCell(p_lonRow, unitColumns.unitCode)))
    Me.txtMeasuringName.Text = CStr(sprListMeasuringUnitsController.getTextOfCell(p_lonRow, unitColumns.unitName))
    Me.txtUnitDecimals.Text = sprListMeasuringUnitsController.getTextOfCell(p_lonRow, unitColumns.decimals)
    
    If CStr(Trim(sprListMeasuringUnitsController.getTextOfCell(p_lonRow, unitColumns.noFormat))) = "Lacs" Then
        Me.optMillions.Value = ValueFalse
        Me.optLacs.Value = ValueTrue
    Else
        Me.optLacs.Value = ValueFalse
        Me.optMillions.Value = ValueTrue
    End If
    
    varTxnTs = sprListMeasuringUnitsController.getTextOfCell(p_lonRow, unitColumns.txn_ts)
    Me.txtEffectiveFrom.Text = Format(CDate(sprListMeasuringUnitsController.getTextOfCell(p_lonRow, unitColumns.effectivefrom)), "dd-mmm-yyyy")
    Me.txtEffectiveTill.Text = Format(CDate(sprListMeasuringUnitsController.getTextOfCell(p_lonRow, unitColumns.effectiveTill)), "dd-mmm-yyyy")
    
    'Added on Oct 1,2011 by Bhavna
    Me.cmbTypeOfUnit.Text = sprListMeasuringUnitsController.getTextOfCell(p_lonRow, unitColumns.type_of_unit)
    Me.fpToleranceShort.Text = CStr(Trim(sprListMeasuringUnitsController.getTextOfCell(p_lonRow, unitColumns.tolerance_short)))
    Me.fpToleranceOverage.Text = CStr(Trim(sprListMeasuringUnitsController.getTextOfCell(p_lonRow, unitColumns.tolerance_overage)))
    
    '-------------------------------------------------------------------------------------------------
    Me.txtID.Text = sprListMeasuringUnitsController.getTextOfCell(p_lonRow, unitColumns.unitID)
    
    
End Sub


Public Sub clsWindowInterface_fireClose()

End Sub

'Implementation of the fireErase() method of the clsWindowInterface. All the Controls and spreads of the form are
'cleared of any data. clearSpread() method of the spreadController is called for clearing the spreads.
Public Sub clsWindowInterface_fireErase()

    utils.clearControls Me.txtID, Me.txtMeasuringCode, Me.txtMeasuringName, Me.txtUnitDecimals
    
    'dates are cleared in query mode, otherwise their default or existing values are set
    Select Case intMode
        Case uiManager.QUERY_MODE
            Me.txtEffectiveFrom.Text = ""
            Me.txtEffectiveTill.Text = ""
        Case uiManager.INSERT_MODE
            Me.txtEffectiveFrom.Text = Format(Date, "dd-mmm-yyyy")
            Me.txtEffectiveTill.Text = "31-Dec-9999"
    End Select
    
    'to clear and load the default values in the Title and Gender comboBox
    clearLoadDropdowns
    fpToleranceOverage.Text = ""
    fpToleranceShort.Text = ""
    cmbTypeOfUnit.Text = ""
    
    If Not Me.sprListMeasuringUnits Is Nothing Then
        sprListMeasuringUnitsController.clearSpread
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
    clsWindowInterface_getScreenID = "MIS_01"
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
    
    'The spread controller and the dropdowns are not to be set and loaded each time when this form is already opened.
    If Not mdiMain.ActiveForm Is Me Then
        setSpreadController
        'to clear and load the NumberFormat and UnitDecimals comboBox.
        clearLoadDropdowns
    End If
    
    Me.Visible = True
    Me.ZOrder 0
    setEnableDisableControls
    
End Sub

'This is a private method to this code module. It first clears and then loads values into Title and Gender
'comboBox from their respective tables.
Private Sub clearLoadDropdowns()
    
    'The comboBox are cleared first because this method is called in showForm() method of clsWindowInterface.
    'The latter method is called each time the form gets loaded or switches to different modes. Hence if the
    'comboboxes are not cleared first then the values will go on adding and adding to them.
    
    
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls()

    Select Case intMode
    
        Case uiManager.INSERT_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            modControlsSettings.setStateToNormal Me.txtMeasuringCode
            Me.txtUnitDecimals.Text = 0
            Me.optLacs.Value = ValueTrue
            Me.optLacs.BooleanMode = BooleanModeTwoState
            Me.optMillions.BooleanMode = BooleanModeTwoState
            sprListMeasuringUnitsController.setSpreadMode intMode
            Me.fraMeasuringUnits.ZOrder 0
            Me.txtMeasuringCode.SetFocus
            
        Case uiManager.QUERY_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID, Me.txtMeasuringCode
            Me.optLacs.BooleanMode = BooleanModeThreeState
            Me.optMillions.BooleanMode = BooleanModeThreeState
            Me.optLacs.Value = ValueGrayed
            Me.optMillions.Value = ValueGrayed
            sprListMeasuringUnitsController.setSpreadMode intMode
            Me.fraMeasuringUnits.ZOrder 0
            Me.txtID.SetFocus
            
        Case uiManager.RETRIEVE_MODE
        
            sprListMeasuringUnitsController.setSpreadMode intMode
            Me.fraMeasuringUnits.ZOrder 0
            
        Case uiManager.BROWSE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID, Me.txtMeasuringCode
            Me.optLacs.BooleanMode = BooleanModeTwoState
            Me.optMillions.BooleanMode = BooleanModeTwoState
            sprListMeasuringUnitsController.setSpreadMode intMode
            Me.fraMeasuringUnits.ZOrder 0
            Me.txtMeasuringCode.SetFocus
            
        Case uiManager.LIST_MODE
        
            sprListMeasuringUnitsController.setSpreadMode intMode
            Me.fraListMeasuringUnits.ZOrder 0
    
    End Select
    
End Sub

'This is a private method to this code module. Here spread controllers are initialized and columns are
'added to them for all the respective spreads in this form.
Private Sub setSpreadController()

    'initializing and adding columns to sprListRepresentativesController of representatives
    
    Set sprListMeasuringUnitsController = New clsSpreadController
    sprListMeasuringUnitsController.registerSpreadInstance uiManager, Me.sprListMeasuringUnits, LIST_SPREAD, Me
    sprListMeasuringUnitsController.setHeaderHeight 600
    
    sprListMeasuringUnitsController.addColumn "Measuring Unit Code", 10, STATIC_TEXT_CELL_TYPE, False, True
    sprListMeasuringUnitsController.addColumn "Measuring Unit Name", 40, STATIC_TEXT_CELL_TYPE, False, True
    sprListMeasuringUnitsController.addColumn "Decimals", 8, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListMeasuringUnitsController.addColumn "Number Format", 8, STATIC_TEXT_CELL_TYPE, False, True
    sprListMeasuringUnitsController.addColumn "Txn Ts", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListMeasuringUnitsController.addColumn "Effective From", 12, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListMeasuringUnitsController.addColumn "Effective Till", 12, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    
    'added by Bhavna on Oct 1,2011
    
    sprListMeasuringUnitsController.addColumn "Type Of Unit", 12, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListMeasuringUnitsController.addColumn "Tolerance Short", 10, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListMeasuringUnitsController.addColumn "Tolerance Overage", 10, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
        
   '-----------------------------------------------------------------------------------------------------------------------------
    
    sprListMeasuringUnitsController.addColumn "Measuring Unit ID", 10, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
         
End Sub





Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblId, Me.lblMeasuringUnitCode, Me.lblMeasuringUnitName, Me.lblUnitDecimals, _
                                                         Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID, Me.txtMeasuringCode, Me.txtMeasuringName, Me.txtUnitDecimals, Me.optLacs, Me.optMillions, _
                                                         Me.fraNumberFormat
    modControlsSettings.setStateToNormal Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID, Me.txtMeasuringCode, Me.txtMeasuringName, Me.txtUnitDecimals, Me.optLacs, Me.optMillions
    'Added on 1-Oct-2011 Bhavna
    cmbTypeOfUnit.Clear
    cmbTypeOfUnit.AddItem "Area"
    cmbTypeOfUnit.AddItem "Length"
    cmbTypeOfUnit.AddItem "Number"
    cmbTypeOfUnit.AddItem "Volume"
    cmbTypeOfUnit.AddItem "Weight"
   
    
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

Private Sub txtMeasuringCode_Validate(Cancel As Boolean)
    validateMeasuringUnitCode
End Sub

Private Sub txtMeasuringName_Validate(Cancel As Boolean)
    validateMeasuringUnitName
    'modCDBLookUps.showLookUpForMeasuringUnits Me, Me.txtMeasuringName, modMain.measuringUnits, Me.txtMeasuringName.Text, NON_HIERARCHY
End Sub

'The method sets the status text of the main screen
Private Sub txtUnitDecimals_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

'The method sets the status text of the main screen
Private Sub txtEffectiveFrom_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter Date smaller than Effective Till Date"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

'The method sets the status text of the main screen
Private Sub txtEffectiveTill_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter Date greater than Effective From Date"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

'The method sets the status text of the main screen
Private Sub txtMeasuringCode_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtMeasuringName_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtUnitDecimals_Validate(Cancel As Boolean)
    validateMeasuringUnitDecimals
End Sub
