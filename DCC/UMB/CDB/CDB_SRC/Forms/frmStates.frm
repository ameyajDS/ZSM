VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "EDT32X30.OCX"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.OCX"
Begin VB.Form frmStates 
   BackColor       =   &H00C0C0C0&
   Caption         =   "STATES"
   ClientHeight    =   8520
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
   ForeColor       =   &H00800000&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   8520
   ScaleWidth      =   8880
   WindowState     =   2  'Maximized
   Begin VB.Frame fraState 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   8625
      Left            =   0
      TabIndex        =   12
      Top             =   0
      Width           =   20415
      Begin FPSpread.vaSpread sprStateDistrictsOrCities 
         Height          =   3375
         Left            =   2010
         TabIndex        =   14
         TabStop         =   0   'False
         Tag             =   "Districts or cities spread"
         Top             =   3195
         Visible         =   0   'False
         Width           =   7485
         _Version        =   393216
         _ExtentX        =   13203
         _ExtentY        =   5953
         _StockProps     =   64
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ShadowColor     =   12632256
         SpreadDesigner  =   "frmStates.frx":0000
      End
      Begin EditLib.fpText txtCountryName 
         Height          =   345
         Left            =   3720
         TabIndex        =   6
         Top             =   1965
         Width           =   4095
         _Version        =   196608
         _ExtentX        =   7223
         _ExtentY        =   600
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
      Begin EditLib.fpText txtStateName 
         Height          =   345
         Left            =   3720
         TabIndex        =   4
         Top             =   1215
         Width           =   4095
         _Version        =   196608
         _ExtentX        =   7223
         _ExtentY        =   600
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
      Begin EditLib.fpText txtStateCode 
         Height          =   345
         Left            =   6840
         TabIndex        =   2
         Top             =   480
         Width           =   960
         _Version        =   196608
         _ExtentX        =   1693
         _ExtentY        =   600
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
      Begin EditLib.fpLongInteger txtID 
         Height          =   345
         Left            =   3720
         TabIndex        =   0
         Top             =   480
         Width           =   615
         _Version        =   196608
         _ExtentX        =   1085
         _ExtentY        =   600
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
         MinValue        =   "0"
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
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   345
         Left            =   6240
         TabIndex        =   10
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
         TabIndex        =   8
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
      Begin VB.Label lblEffectiveTill 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6240
         TabIndex        =   9
         Top             =   2460
         Width           =   1080
      End
      Begin VB.Label lblStateCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Code "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6840
         TabIndex        =   1
         Top             =   240
         Width           =   510
      End
      Begin VB.Label lblCountryName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Country"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   5
         Top             =   1725
         Width           =   675
      End
      Begin VB.Label lblStateName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   3
         Top             =   975
         Width           =   570
      End
      Begin VB.Label lblEffectiveFrom 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   7
         Top             =   2460
         Width           =   1290
      End
      Begin VB.Label lblId 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ID"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   13
         Top             =   240
         Width           =   180
      End
   End
   Begin VB.Frame fraListStates 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   7335
      Left            =   0
      TabIndex        =   11
      Top             =   -30
      Width           =   13095
      Begin FPSpread.vaSpread sprListStates 
         Height          =   6465
         Left            =   120
         TabIndex        =   15
         TabStop         =   0   'False
         Tag             =   "States List Spread"
         Top             =   120
         Width           =   11655
         _Version        =   393216
         _ExtentX        =   20558
         _ExtentY        =   11404
         _StockProps     =   64
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ShadowColor     =   12632256
         SpreadDesigner  =   "frmStates.frx":01E2
      End
   End
End
Attribute VB_Name = "frmStates"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Implements clsWindowInterface
Implements clsQueryInterface
Implements clsEditInterface
Implements clsCallingFormInterface
Implements clsCalledFormInterface

'This variable holds the value of the current mode of the form. This is set each time the form is opened in
'different mode with the 'showForm()' method of the 'clsWindowInterface'. And the value of this variable is
'returned, whenever requested through 'getMode()' method of the 'clsWindowInterface'
Dim intMode As Integer

'stores newly generated state ID returned in fireSave() method of clsEditInterface.
'the variable is called in getReturnValues() method of clsCalledFormInterface to set the
'local variable strIDText in NewMode
Dim intStateID As Long

'stores the value of txn_ts. the variable is filled in populateFieldsFromRetrievalSpread method
'of clsQueryInterface
Dim varTxnTs As Variant

'The declaration of spread controller for retrieving the records from the states
'table. This spread controller is also used to show the records in list mode. This object variable
'is defined "withEvents" because this code module needs to catch the events thrown by this
'controller (like 'validateCell', 'validateRow' etc)
Dim WithEvents sprListStatesController As clsSpreadController
Attribute sprListStatesController.VB_VarHelpID = -1

'The declaration of spread controller for retrieving and browsing the districts or cities
'of the specified states. This object variable is defined "withEvents" because this code module
'needs to catch the events thrown by this controller (like 'validateCell', 'validateRow' etc)
Dim WithEvents sprStateDistrictsOrCitiesController As clsSpreadController
Attribute sprStateDistrictsOrCitiesController.VB_VarHelpID = -1

'This enum holds all the column numbers of the spread controller 'sprListStatesController' that
'shows all the records of states. The column numbers are stored into variables named corresponding
'to column names. These are called in functions of spreadController like 'getTextOfCell'
'or 'setTextOfCell' which requires row number and column number.
Private Enum StateColumns
    stateCode = 1
    stateName = 2
    countryID = 3
    countryName = 4
    txn_ts = 5
    effectivefrom = 6
    effectiveTill = 7
    stateID = 8
End Enum

'Implementation of 'getReturnValues()' method of the clsCalledFormInterface. This method
'returns the displayText and the idText to the calling form throught the setReturnedValues()
'method of the clsCallingFormInterface of the. The arguments passed are by reference.
Public Sub clsCalledFormInterface_getReturnValues(p_strDisplayText As String, _
                                                  p_strIDText As String, _
                                                    p_colAdditionalValues As Collection)
    
    p_strDisplayText = Trim(Me.txtStateName.Text)
    
    Select Case intMode
        Case uiManager.NEW_MODE
            p_strIDText = intStateID
        Case uiManager.UPDATE_MODE, uiManager.REFERENCE_MODE
            p_strIDText = Trim(Me.txtID.Text)
    End Select
    'set the key value pairs in p_colAdditionalValues to have the UNION of all
    'the required keys used in all the calling forms calling this screen.
    'Initially write all the attributes which are available on screen
    p_colAdditionalValues.Add Me.txtEffectiveFrom.Text, "effectiveFrom"
    p_colAdditionalValues.Add Me.txtEffectiveTill.Text, "effectiveTill"
    p_colAdditionalValues.Add txtCountryName.Text, "countryName"
    p_colAdditionalValues.Add txtCountryName.Tag, "countryID"
    p_colAdditionalValues.Add txtStateCode.Text, "stateCode"
End Sub

'Implementation of the 'showCalledForm()' method of the clsCalledFormInterface.In this mehod the form is opened
'in the required mode stated by the parameter 'p_intCallMode'. If the requested mode is UPDATE or REFERENCE
'mode, then the fields are populated with the appropriate record which is fetched from database using the other
'three parameters viz p_strDisplayText, p_strIDText and p_strMultipartText. The retrieval mechanism of this
'record is same as the retrieval mechanism of the form in RETRIEVE MODE

Public Sub clsCalledFormInterface_showCalledForm(ByVal p_intCallMode As Integer, _
                                                 ByVal p_strDisplayText As String, _
                                                 ByVal p_strIDText As String, _
                                                 p_colAdditionalValues As Collection)
                                
On Error GoTo errorTag
                                
    Me.clsWindowInterface_showForm p_intCallMode
    
    Select Case intMode
    
        Case uiManager.NEW_MODE
            Me.txtCountryName.Tag = p_colAdditionalValues.Item("country_id")
            Me.txtCountryName.Text = p_colAdditionalValues.Item("country_nm")
            Me.txtCountryName.DataField = p_colAdditionalValues.Item("country_nm")
        
        Case uiManager.UPDATE_MODE, uiManager.REFERENCE_MODE
            Me.txtID.Text = p_colAdditionalValues.Item("state_id")
            sprListStatesController.retrieveRecords Me.clsQueryInterface_getSQLStringForRetrieval
            clsQueryInterface_populateFieldsFromRetrievalSpread (1)
            
    End Select
    
Exit Sub
    
errorTag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsCalledFormInterface_showCalledForm", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    Err.Raise Err.Number
End Sub

'implementation of the getForeignKeyInformation() method of the clsCallingFormInterface. This method returns the
'foreign key information of a particular control stated by parameter p_objActiveControl. The values are
'set into the parameters themselves as these parameters are coming by reference. This information is used
'by ADL to open the called form in a specific mode, when user clicks on the new/reference menu items
'in the operations menu.
Public Sub clsCallingFormInterface_getForeignKeyInformation(p_objActiveControl As Object, _
                                                            p_objCallForm As Object, _
                                                            p_strDisplayText As String, _
                                                            p_strIDText As String, _
                                                            p_colAdditionalValues As Collection)
    If p_objActiveControl Is Me.txtCountryName Then
        Set p_objCallForm = modMain.countries
        p_strDisplayText = Me.txtCountryName.Text
        p_strIDText = Me.txtCountryName.Tag
        'country screen does not need any additional values
        Set p_colAdditionalValues = Nothing
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
        Me.txtEffectiveFrom.SetFocus
    End If
    
End Sub

'private function returning true when the field - state code is valid, otherwise false
Private Function validateStateCode() As Boolean
    
    validateStateCode = True
    
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtStateCode.Text) = "") Then
            Me.txtStateCode.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "State Code", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
            validateStateCode = False
    End If
    
End Function

'private function returning true when the field - state name is valid, otherwise false
Private Function validateStateName() As Boolean
    
    validateStateName = True
    
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtStateName.Text) = "") Then
            Me.txtStateName.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "State Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
            validateStateName = False
    End If

End Function

'private function returning true when the field - country name is valid, otherwise false
Private Function validateCountryName() As Boolean
    
    validateCountryName = True
    
    'check for mandatory field
    If Trim(Me.txtCountryName.Text) = "" Then
        'clearing datafield, tag and text value of the foreign key control
        utils.clearControls Me.txtCountryName
        If (intMode <> uiManager.QUERY_MODE) Then
                Me.txtCountryName.SetFocus
                logger.logMessage modStandardMessages.ValueReqd, "Country Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
                validateCountryName = False
        End If
    End If
End Function

'private function returning true when the field - effective from is valid, otherwise false
Private Function validateEffectiveFrom() As Boolean
    validateEffectiveFrom = True
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE) Then
        If Trim(Me.txtEffectiveFrom.Text) = "" Then
            Me.txtEffectiveFrom.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "Effective From", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
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
            logger.logMessage modStandardMessages.ValueReqd, "Effective From", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
            validateEffectiveTill = False
        
        'comparing effective from and effective till dates
        ElseIf Trim(Me.txtEffectiveFrom.Text) <> "" Then
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
    
    'validate event of last focused control is called before save.
    Me.ValidateControls
    
    If (validateStateCode = False) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    End If
    If (validateStateName = False) Then
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

On Error GoTo errorTag

    Dim strSQL As String
    Dim rsInsUpdStates As clsRecordHashMap
    
    strSQL = "CDB..insUpdStates '" & Trim(UCase(Me.txtStateCode.Text)) & "','" & _
                                     Replace(Trim(Me.txtStateName.Text), "'", "''") & "'," & _
                                     Me.txtCountryName.Tag & ",'" & _
                                     Trim(Me.txtEffectiveFrom.Text) & "','" & _
                                     Trim(Me.txtEffectiveTill.Text) & "'," & _
                                     IIf(Me.txtID.Text = "", "NULL", Trim(Me.txtID.Text)) & "," & _
                                     IIf(varTxnTs = "", "NULL", varTxnTs)
 
    dbManager.beginTrans
    
    Select Case intMode
        
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
            
            strSQL = strSQL & ", 0"     '0 - INSERT
            Set rsInsUpdStates = dbManager.executeSQLGetRS(strSQL)
            intStateID = rsInsUpdStates.getFieldValueByFieldIndex(0, 0)
            dbManager.commitTrans
            
            If intMode = uiManager.INSERT_MODE Then
                
                logger.logMessage modStandardMessages.ObjectSaveMsg, "State - '" & Trim(Me.txtStateName.Text) & "'|" & intStateID, PLAIN_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
                        
                'in case of insert mode, the screen has to get cleared of any data and get ready to insert more datas
                Me.clsWindowInterface_showForm uiManager.INSERT_MODE
                Me.txtStateCode.SetFocus
            
            End If
        
        Case uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
        
            strSQL = strSQL & ", 1"    '1 - UPDATE
            Debug.Print strSQL
            dbManager.executeSQL strSQL
            dbManager.commitTrans
                
            If intMode = uiManager.BROWSE_MODE Then
                'updating the screen
                sprListStatesController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, _
                                                  Me.sprListStates.ActiveRow
                Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListStates.ActiveRow
                varTxnTs = sprListStatesController.getTextOfCell(Me.sprListStates.ActiveRow, StateColumns.txn_ts)
                logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            End If
            
        Case Default
            dbManager.commitTrans
            errorManager.setErrorAttributes modStandardMessages.InValidMode, "clsEditInterface_fireSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Err.Raise Err.Number
            
    End Select
    
Exit Sub
    
errorTag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsEditInterface_fireSave", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    Err.Raise Err.Number
End Sub

'Implementation of the fireInsertMode() method of the clsQueryInterface.
'This method opens the form in Insert Mode through showForm() method.
Public Sub clsEditInterface_fireInsertMode()

On Error GoTo errorTag
    Me.clsWindowInterface_showForm uiManager.INSERT_MODE
Exit Sub

errorTag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsEditInterface_fireInsertMode", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'Implementation of the fireBrowse() method of the clsQueryInterface.
'This method opens the form in Browse Mode through showForm() method.
Public Sub clsQueryInterface_fireBrowse()

On Error GoTo errorTag
    Me.clsWindowInterface_showForm uiManager.BROWSE_MODE
Exit Sub

errorTag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireBrowse", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsQueryInterface_fireCancel()

End Sub

'Implementation of the fireList() method of the clsQueryInterface.
'This method opens the form in List Mode through showForm() method.
Public Sub clsQueryInterface_fireList()

On Error GoTo errorTag
    Me.clsWindowInterface_showForm uiManager.LIST_MODE
Exit Sub

errorTag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireList", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'Implementation of the fireQuery() method of the clsQueryInterface.
'This method opens the form in Query Mode through showForm() method.
Public Sub clsQueryInterface_fireQuery()

On Error GoTo errorTag
    Me.clsWindowInterface_showForm uiManager.QUERY_MODE
Exit Sub

errorTag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireQuery", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'Implementation of the fireRemove() method of the clsQueryInterface.
' The current record being displayed in the Browse mode mode is removed from database.
Public Sub clsQueryInterface_fireRemove()

On Error GoTo errorTag
        
    dbManager.beginTrans
    dbManager.executeSQL "CDB..delStates " & Me.txtID.Text & "," & varTxnTs
    dbManager.commitTrans

Exit Sub

errorTag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireRemove", "no params", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    Err.Raise Err.Number
End Sub

'Implementation of the fireRetrieve() method of the clsQueryInterface.
'This method opens the form in Retrieve Mode through showForm() method.
Public Sub clsQueryInterface_fireRetrieve()

On Error GoTo errorTag
    Me.clsWindowInterface_showForm uiManager.RETRIEVE_MODE
Exit Sub

errorTag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireRetrieve", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsQueryInterface_fireSort()

End Sub

'Implementation of the getSpreadControllerForRetrieval() function of the clsQueryInterface.
'This function returns the spread controller which should be used for retrieval of the
'records in Retrieve mode. Here the retrieval is done in the sprListStatesController,
'so that is returned to the caller.
Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController

    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListStatesController
    
End Function

'Implementation of the getSQLStringForRetrieval() function of the clsQueryInterface. This function
'returns the sql string which should be used by ADL to retrieve records in Retrieve mode.
'The query is build based upon the user entries in the different fields of the form.
Public Function clsQueryInterface_getSQLStringForRetrieval() As String

    Dim strRetrieveStates As String
    
    strRetrieveStates = "SELECT s.state_cd, s.state_nm, s.country_id, c.country_nm, Cast(s.txn_ts AS BigInt), " & _
                                "convert(varchar,s.effective_from,106)effective_from, " & _
                                "convert(varchar,s.effective_till,106)effective_till, s.state_id " & _
                        "FROM states s, countries c WHERE s.country_id = c.country_id "
    
    If Me.txtID.Text <> "" Then
        strRetrieveStates = strRetrieveStates & " AND s.state_id = " & Trim(Me.txtID.Text)
    End If

    If Trim(Me.txtCountryName.Text) <> "" Then
        strRetrieveStates = strRetrieveStates & " AND c.country_nm LIKE '%" & Replace(Trim(Me.txtCountryName.Text), "'", "''") & "%'"
    End If

    If Trim(Me.txtStateCode.Text) <> "" Then
        strRetrieveStates = strRetrieveStates & " AND s.state_cd LIKE '%" & Trim(Me.txtStateCode.Text) & "%'"
    End If

    If Trim(Me.txtStateName.Text) <> "" Then
        strRetrieveStates = strRetrieveStates & " AND s.state_nm LIKE '%" & Replace(Trim(Me.txtStateName.Text), "'", "''") & "%'"
    End If

    If Trim(Me.txtEffectiveFrom.Text) <> "" Then
        strRetrieveStates = strRetrieveStates & " AND s.effective_from = '" & Trim(Me.txtEffectiveFrom.Text) & "'"
    End If

    If Trim(Me.txtEffectiveTill.Text) <> "" Then
        strRetrieveStates = strRetrieveStates & " AND s.effective_till = '" & Trim(Me.txtEffectiveTill.Text) & "'"
    End If

    strRetrieveStates = strRetrieveStates & " ORDER BY s.country_id, state_id"
    
    'the select statement built and returned by the procedure - procRetrieveStates is passed to the function
    Debug.Print strRetrieveStates
    clsQueryInterface_getSQLStringForRetrieval = strRetrieveStates
    
End Function

'Implementation of the populateFieldsFromRetrievalSpread() method of the clsQueryInterface
'All the fields are populated from the spread where the records are retrieved. Parameter p_lonrow
'states the row of the spread whose values are to be set in respective fields.
Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)

On Error GoTo errorTag

    Me.txtStateCode.Text = Trim(CStr(sprListStatesController.getTextOfCell(p_lonRow, StateColumns.stateCode)))
    Me.txtStateName.Text = CStr(sprListStatesController.getTextOfCell(p_lonRow, StateColumns.stateName))
    Me.txtCountryName.Tag = sprListStatesController.getTextOfCell(p_lonRow, StateColumns.countryID)
    Me.txtCountryName.Text = CStr(sprListStatesController.getTextOfCell(p_lonRow, StateColumns.countryName))
    varTxnTs = sprListStatesController.getTextOfCell(Me.sprListStates.ActiveRow, StateColumns.txn_ts)
    Me.txtEffectiveFrom.Text = Format(CDate(sprListStatesController.getTextOfCell(p_lonRow, StateColumns.effectivefrom)), "dd-mmm-yyyy")
    Me.txtEffectiveTill.Text = Format(CDate(sprListStatesController.getTextOfCell(p_lonRow, StateColumns.effectiveTill)), "dd-mmm-yyyy")
    Me.txtID.Text = sprListStatesController.getTextOfCell(p_lonRow, StateColumns.stateID)
    Me.txtCountryName.DataField = Me.txtCountryName.Text
    
    'populating spread me.sprStateDistrictsOrCities with districts or cities details corresponding
    'to given state ID
    Dim strSelectDistCity As String
    strSelectDistCity = "CDB..selDistCity " & Trim(Me.txtID.Text)
    sprStateDistrictsOrCitiesController.retrieveRecords (strSelectDistCity)

Exit Sub

errorTag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_populateFieldsFromRetrievalSpread", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsWindowInterface_fireClose()

End Sub

'Implementation of the fireErase() method of the clsWindowInterface. All the Controls and spreads of the form are
'cleared of any data. clearSpread() method of the spreadController is called for clearing the spreads.
Public Sub clsWindowInterface_fireErase()

    utils.clearControls Me.txtCountryName, Me.txtID, Me.txtStateCode, Me.txtStateName
    
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
    If Not Me.sprListStates Is Nothing Then
        sprListStatesController.clearSpread
    End If
    If Not Me.sprStateDistrictsOrCities Is Nothing Then
        sprStateDistrictsOrCitiesController.clearSpread
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

    clsWindowInterface_getScreenID = "LOC_03"
    
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
    
    'initializing and adding columns to sprListStatesController of states
    Set sprListStatesController = New clsSpreadController
    sprListStatesController.registerSpreadInstance uiManager, Me.sprListStates, LIST_SPREAD, Me
    sprListStatesController.setHeaderHeight 600
    
    sprListStatesController.addColumn "State    Code", 10, STATIC_TEXT_CELL_TYPE, False, True
    sprListStatesController.addColumn "State Name", 31, STATIC_TEXT_CELL_TYPE, False, True
    sprListStatesController.addColumn "Country ID", 0, STATIC_TEXT_CELL_TYPE, False, True
    sprListStatesController.addColumn "Country Name", 31, STATIC_TEXT_CELL_TYPE, False, True
    sprListStatesController.addColumn "Txn_Ts", 0, STATIC_TEXT_CELL_TYPE, False, True
    sprListStatesController.addColumn "Effective    From", 11, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListStatesController.addColumn "Effective    Till", 11, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListStatesController.addColumn "State ID", 6, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    
    'initializing and adding columns to sprStateDistrictsOrCitiesController of districts or cities
    Set sprStateDistrictsOrCitiesController = New clsSpreadController
    sprStateDistrictsOrCitiesController.registerSpreadInstance uiManager, Me.sprStateDistrictsOrCities, LIST_SPREAD, Me
    sprStateDistrictsOrCitiesController.setHeaderHeight 600
    
    sprStateDistrictsOrCitiesController.addColumn "District / City Code", 17, STATIC_TEXT_CELL_TYPE, False, True
    sprStateDistrictsOrCitiesController.addColumn "District / City Name", 68, STATIC_TEXT_CELL_TYPE, False, True
    sprStateDistrictsOrCitiesController.addColumn "Dist. / City ID", 15, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls()
    Select Case intMode
    
        Case uiManager.INSERT_MODE
                 
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            Me.txtCountryName.ButtonStyle = ButtonStylePopUp
            Me.sprStateDistrictsOrCities.Visible = False
            sprListStatesController.setSpreadMode intMode
            sprStateDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraState.ZOrder 0
            Me.txtStateCode.SetFocus
            
        Case uiManager.QUERY_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID
            Me.txtCountryName.ButtonStyle = ButtonStylePopUp
            Me.sprStateDistrictsOrCities.Visible = False
            sprListStatesController.setSpreadMode intMode
            sprStateDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraState.ZOrder 0
            Me.txtID.SetFocus
            
        Case uiManager.RETRIEVE_MODE
        
            Me.txtCountryName.ButtonStyle = ButtonStyleNone
            Me.sprStateDistrictsOrCities.Visible = False
            sprListStatesController.setSpreadMode intMode
            sprStateDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraState.ZOrder 0
            
        Case uiManager.BROWSE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID
            Me.txtCountryName.ButtonStyle = ButtonStylePopUp
            Me.sprStateDistrictsOrCities.Visible = True
            sprListStatesController.setSpreadMode intMode
            sprStateDistrictsOrCitiesController.setSpreadMode uiManager.REFERENCE_MODE
            Me.fraState.ZOrder 0
            Me.txtStateCode.SetFocus
                        
        Case uiManager.LIST_MODE
        
            Me.txtCountryName.ButtonStyle = ButtonStyleNone
            Me.sprStateDistrictsOrCities.Visible = False
            sprListStatesController.setSpreadMode intMode
            sprStateDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraListStates.ZOrder 0
            
        Case uiManager.NEW_MODE
            
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID, Me.txtCountryName
            Me.txtCountryName.ButtonStyle = ButtonStyleNone
            Me.sprStateDistrictsOrCities.Visible = False
            sprListStatesController.setSpreadMode intMode
            sprStateDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraState.ZOrder 0
            Me.txtStateCode.SetFocus
            
        Case uiManager.UPDATE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID, Me.txtCountryName
            Me.txtCountryName.ButtonStyle = ButtonStyleNone
            Me.sprStateDistrictsOrCities.Visible = True
            sprListStatesController.setSpreadMode intMode
            sprStateDistrictsOrCitiesController.setSpreadMode uiManager.REFERENCE_MODE
            Me.fraState.ZOrder 0
            Me.txtStateCode.SetFocus
            
        Case uiManager.REFERENCE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID, Me.txtCountryName, _
                                                   Me.txtEffectiveFrom, Me.txtEffectiveTill, _
                                                   Me.txtStateCode, Me.txtStateName
            Me.txtCountryName.ButtonStyle = ButtonStyleNone
            Me.sprStateDistrictsOrCities.Visible = True
            sprListStatesController.setSpreadMode intMode
            sprStateDistrictsOrCitiesController.setSpreadMode intMode
            Me.fraState.ZOrder 0
            
    End Select
    
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.txtCountryName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID, Me.txtStateCode, Me.txtStateName, Me.lblCountryName, Me.lblEffectiveTill, Me.lblId, Me.lblStateCode, Me.lblStateName, Me.lblEffectiveFrom
    modControlsSettings.setStateToNormal Me.txtCountryName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID, Me.txtStateCode, Me.txtStateName
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookupForCountries() is the common place
'where the lookup on the country has been provided
Private Sub txtCountryName_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errorTag
    modCDBLookUps.showLookUpForCountries Me, Me.txtCountryName, modMain.countries, Me.txtCountryName.Text, enmLookupSearchModes.absolute, True
Exit Sub

errorTag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtCountryName_ButtonHit", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtCountryName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please hit the button for Lookup Dialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

'The method calls the 'txtCountryName_ButtonHit' method for lookup to appear when ENTER key is pressd
Private Sub txtCountryName_KeyPress(KeyAscii As Integer)

    If KeyAscii = 13 And (intMode <> uiManager.NEW_MODE Or _
                          intMode <> uiManager.UPDATE_MODE Or _
                          intMode <> uiManager.REFERENCE_MODE) Then
        Call txtCountryName_ButtonHit(0, 0)
    End If

End Sub

'validating CountryName
Private Sub txtCountryName_Validate(Cancel As Boolean)
On Error GoTo errorTag

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

errorTag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtCountryName_Validate", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtEffectiveFrom_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter Date smaller than Effective Till"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

'validating EffectiveFrom date
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
            uiManager.setStatusText "Please enter Date greater than Effective From"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

'validating effective till date
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

'The method sets the status text of the main screen
Private Sub txtStateCode_GotFocus()
    uiManager.setStatusText ""
End Sub

'validating StateCode
Private Sub txtStateCode_Validate(Cancel As Boolean)
    validateStateCode
End Sub

'The method sets the status text of the main screen
Private Sub txtStateName_GotFocus()
    uiManager.setStatusText ""
End Sub

'validating StateName
Private Sub txtStateName_Validate(Cancel As Boolean)
    validateStateName
End Sub
