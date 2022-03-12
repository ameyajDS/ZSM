VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "Edt32x30.ocx"
Begin VB.Form frmDesignation 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Designations"
   ClientHeight    =   6990
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8580
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   11115
   ScaleWidth      =   15240
   WindowState     =   2  'Maximized
   Begin VB.Frame fraDesignation 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5175
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   12735
      Begin EditLib.fpText txtID 
         Height          =   300
         Left            =   2040
         TabIndex        =   15
         Top             =   720
         Width           =   615
         _Version        =   131073
         _ExtentX        =   1085
         _ExtentY        =   529
         _StockProps     =   68
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
         MaxLength       =   255
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
         MouseIcon       =   "frmDesignation.frx":0000
      End
      Begin EditLib.fpDateTime txtEffectiveFrom 
         Height          =   300
         Left            =   2040
         TabIndex        =   14
         Top             =   2640
         Width           =   1515
         _Version        =   131073
         _ExtentX        =   2672
         _ExtentY        =   529
         _StockProps     =   68
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
         ButtonDefaultAction=   -1  'True
         ButtonDisable   =   0   'False
         ButtonHide      =   0   'False
         ButtonIncrement =   1
         ButtonMin       =   0
         ButtonMax       =   100
         ButtonStyle     =   3
         ButtonWidth     =   0
         ButtonWrap      =   -1  'True
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
         UserEntry       =   1
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
         Text            =   "14-Oct-2003"
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
         PopUpType       =   0
         DateCalcY2KSplit=   60
         MouseIcon       =   "frmDesignation.frx":001C
      End
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   300
         Left            =   4560
         TabIndex        =   13
         Top             =   2640
         Width           =   1515
         _Version        =   131073
         _ExtentX        =   2672
         _ExtentY        =   529
         _StockProps     =   68
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
         ButtonDefaultAction=   -1  'True
         ButtonDisable   =   0   'False
         ButtonHide      =   0   'False
         ButtonIncrement =   1
         ButtonMin       =   0
         ButtonMax       =   100
         ButtonStyle     =   3
         ButtonWidth     =   0
         ButtonWrap      =   -1  'True
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
         UserEntry       =   1
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
         Text            =   "14-Oct-2003"
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
         PopUpType       =   0
         DateCalcY2KSplit=   60
         MouseIcon       =   "frmDesignation.frx":0038
      End
      Begin EditLib.fpText txtDesignationCode 
         Height          =   300
         Left            =   2880
         TabIndex        =   0
         Top             =   720
         Width           =   960
         _Version        =   131073
         _ExtentX        =   1693
         _ExtentY        =   529
         _StockProps     =   68
         BackColor       =   14737632
         ForeColor       =   0
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
         MaxLength       =   255
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
         MouseIcon       =   "frmDesignation.frx":0054
      End
      Begin EditLib.fpText txtDesignationName 
         Height          =   300
         Left            =   4560
         TabIndex        =   2
         Top             =   720
         Width           =   4095
         _Version        =   131073
         _ExtentX        =   7223
         _ExtentY        =   529
         _StockProps     =   68
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
         MaxLength       =   255
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
         MouseIcon       =   "frmDesignation.frx":0070
      End
      Begin EditLib.fpLongInteger txtMinAge 
         Height          =   300
         Left            =   2040
         TabIndex        =   10
         Top             =   1680
         Width           =   345
         _Version        =   131073
         _ExtentX        =   609
         _ExtentY        =   529
         _StockProps     =   68
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
         MaxValue        =   "2147483647"
         MinValue        =   "-2147483648"
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
         MouseIcon       =   "frmDesignation.frx":008C
      End
      Begin EditLib.fpLongInteger txtMaxStartingAge 
         Height          =   300
         Left            =   4560
         TabIndex        =   11
         Top             =   1680
         Width           =   375
         _Version        =   131073
         _ExtentX        =   661
         _ExtentY        =   529
         _StockProps     =   68
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
         MaxValue        =   "2147483647"
         MinValue        =   "-2147483648"
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
         MouseIcon       =   "frmDesignation.frx":00A8
      End
      Begin EditLib.fpLongInteger txtRetirementAge 
         Height          =   300
         Left            =   7200
         TabIndex        =   12
         Top             =   1680
         Width           =   375
         _Version        =   131073
         _ExtentX        =   661
         _ExtentY        =   529
         _StockProps     =   68
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
         MaxValue        =   "2147483647"
         MinValue        =   "-2147483648"
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
         MouseIcon       =   "frmDesignation.frx":00C4
      End
      Begin VB.Label lblId 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ID"
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
         Height          =   240
         Left            =   2040
         TabIndex        =   16
         Top             =   480
         Width           =   180
      End
      Begin VB.Label lblEffectiveTill 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
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
         Height          =   240
         Left            =   4560
         TabIndex        =   9
         Top             =   2400
         Width           =   1200
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
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
         Height          =   240
         Left            =   2040
         TabIndex        =   8
         Top             =   2400
         Width           =   1410
      End
      Begin VB.Label lblRetirementAge 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Retirement Age "
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
         Height          =   240
         Left            =   7200
         TabIndex        =   7
         Top             =   1440
         Width           =   1530
      End
      Begin VB.Label lblMaximumStartingAge 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Maximum Starting Age "
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
         Height          =   240
         Left            =   4560
         TabIndex        =   6
         Top             =   1440
         Width           =   2175
      End
      Begin VB.Label lblDesignationName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Designation Name"
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
         Height          =   240
         Left            =   4560
         TabIndex        =   5
         Top             =   480
         Width           =   1710
      End
      Begin VB.Label lblMinimumAge 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Minimum Age "
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
         Height          =   240
         Left            =   2040
         TabIndex        =   4
         Top             =   1440
         Width           =   1380
      End
      Begin VB.Label lblDesignationCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Designation Code "
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
         Height          =   240
         Left            =   2880
         TabIndex        =   3
         Top             =   480
         Width           =   1590
      End
   End
End
Attribute VB_Name = "frmDesignation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Implements clsWindowInterface
Implements clsEditInterface
Implements clsQueryInterface

Dim intMode As Integer
Dim WithEvents sprListDesignationsController As clsSpreadController
Attribute sprListDesignationsController.VB_VarHelpID = -1

Public Sub clsEditInterface_fireInsertMode()
    intMode = uiManager.INSERT_MODE
    Me.clsWindowInterface_showForm intMode
End Sub

Private Function isReadyToSave() As Boolean
    isReadyToSave = True
    
    If Me.txtDesignationCode.Text = "" Or _
       Me.txtDesignationName.Text = "" Or _
       Me.txtEffectiveFrom.Text = "" Or _
       Me.txtEffectiveTill.Text = "" Then
            isReadyToSave = False
            uiManager.setMessageText "Please fill up the mandatory fields !", WARNING_MESSAGE
            Exit Function
    End If
    
    If (Me.txtMinAge.Text) > (Me.txtMaxStartingAge.Text) Then
        isReadyToSave = False
        uiManager.setMessageText "Minimum Age should be less than Max. Starting Age", WARNING_MESSAGE
        Me.txtMinAge.SetFocus
        Exit Function
    End If
        
    If (Me.txtMaxStartingAge.Text) > (Me.txtRetirementAge.Text) Then
        isReadyToSave = False
        uiManager.setMessageText "Max. Starting Age should be less than Retirement Age", WARNING_MESSAGE
        Me.txtMaxStartingAge.SetFocus
        Exit Function
    End If
        
    If DateDiff("d", Me.txtEffectiveFrom.Text, Me.txtEffectiveTill.Text) < 0 Then
        isReadyToSave = False
        uiManager.setMessageText "Effective From date should be smaller than Effective Till date", WARNING_MESSAGE
        Me.txtEffectiveFrom.SetFocus
        Exit Function
    End If
End Function

Public Sub clsEditInterface_fireSave()
    If Not isReadyToSave Then
        Exit Sub
    End If
    
    
    Dim arrParameterInsert(7) As ADODB.Parameter
       
    Select Case intMode
        Case uiManager.INSERT_MODE
            Set arrParameterInsert(0) = dbManager.CreateParameter("p_strDesgCode", _
                                                                   adChar, _
                                                                   adParamInput, _
                                                                   5, _
                                                                   Trim(Me.txtDesignationCode.Text))
            Set arrParameterInsert(1) = dbManager.CreateParameter("p_strDesgName", _
                                                                   adVarChar, _
                                                                   adParamInput, _
                                                                   35, _
                                                                   Trim(Me.txtDesignationName.Text))
            Set arrParameterInsert(2) = dbManager.CreateParameter("p_intMinimumAge", _
                                                                   adTinyInt, _
                                                                   adParamInput, _
                                                                   1, _
                                                                   Trim(Me.txtMinAge.Text))
            Set arrParameterInsert(3) = dbManager.CreateParameter("p_intMaxStartingAge", _
                                                                   adTinyInt, _
                                                                   adParamInput, _
                                                                   1, _
                                                                   Trim(Me.txtMaxStartingAge.Text))
            Set arrParameterInsert(4) = dbManager.CreateParameter("p_intRetirementAge", _
                                                                   adTinyInt, _
                                                                   adParamInput, _
                                                                   1, _
                                                                   Trim(Me.txtRetirementAge.Text))
            Set arrParameterInsert(5) = dbManager.CreateParameter("p_strEffectivefrom", _
                                                                   adDate, _
                                                                   adParamInput, _
                                                                   4, _
                                                                   Trim(Me.txtEffectiveFrom.Text))
            Set arrParameterInsert(6) = dbManager.CreateParameter("p_strEffectiveTill", _
                                                                   adDate, _
                                                                   adParamInput, _
                                                                   4, _
                                                                   Trim(Me.txtEffectiveTill.Text))
            dbManager.ExecuteSP "procInsertDesignation", arrParameterInsert
            
            Me.clsWindowInterface_fireErase
            uiManager.setMessageText "Data Saved Successfully", PLAIN_MESSAGE
            Me.txtEffectiveFrom.Text = "01-Jan-1900"
            Me.txtEffectiveTill.Text = "31-Dec-9999"
            Me.txtDesignationCode.SetFocus
              
        End Select
End Sub

Public Sub clsQueryInterface_fireBrowse()
    intMode = uiManager.BROWSE_MODE
    Me.clsWindowInterface_showForm intMode
End Sub

Public Sub clsQueryInterface_fireCancel()

End Sub

Public Sub clsQueryInterface_fireList()
    intMode = uiManager.LIST_MODE
    Me.clsWindowInterface_showForm intMode
End Sub

Public Sub clsQueryInterface_fireQuery()
    intMode = uiManager.QUERY_MODE
    Me.clsWindowInterface_showForm intMode
End Sub

Public Sub clsQueryInterface_fireRemove()
End Sub

Public Sub clsQueryInterface_fireRetrieve()
    intMode = uiManager.RETRIEVE_MODE
    Me.clsWindowInterface_showForm intMode
End Sub

Public Sub clsQueryInterface_fireSort()

End Sub

Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController

End Function

Public Function clsQueryInterface_getSQLStringForRetrieval() As String

End Function

Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)

End Sub

Public Sub clsWindowInterface_fireClose()

End Sub

Public Sub clsWindowInterface_fireErase()
    Me.txtDesignationCode.Text = ""
    Me.txtDesignationName.Text = ""
    Me.txtMinAge.Text = ""
    Me.txtMaxStartingAge.Text = ""
    Me.txtRetirementAge.Text = ""
    Me.txtEffectiveFrom.Text = ""
    Me.txtEffectiveTill.Text = ""
    Me.txtID.Text = ""
    
    If Not Me.sprListDesignations Is Nothing Then
        sprListDesignationsController.setSpreadMode intMode
    End If
End Sub

Public Sub clsWindowInterface_fireExit(Cancel As Boolean)

End Sub

Public Sub clsWindowInterface_fireHelp()

End Sub

Public Function clsWindowInterface_getMode() As Integer
    clsWindowInterface_getMode = intMode
End Function

Public Function clsWindowInterface_getScreenID() As String
    clsWindowInterface_getScreenID = "ACT_02"
End Function

Public Sub clsWindowInterface_showForm(p_intMode As Integer)
    intMode = p_intMode
    If Not mdiMain.ActiveForm Is Me Then
        setSpreadController
    End If
    Me.Visible = True
    Me.ZOrder 0
    setEnableDisableControls intMode
End Sub

Private Sub setSpreadController()
    Set sprListDesignationsController = New clsSpreadController
    sprListDesignationsController.registerSpreadInstance uiManager, Me.sprlistspread, Me
    sprListDesignationsController.setHeaderHeight 600
                                         
     
    sprListDesignationsController.addColumn "Desg.Code", _
                                             16, _
                                             STATIC_TEXT_CELL_TYPE, _
                                             False, _
                                             True
    sprListDesignationsController.addColumn "Designation Name", _
                                             30, _
                                             STATIC_TEXT_CELL_TYPE, _
                                             False, _
                                             True
    sprListDesignationsController.addColumn "Min. Age", _
                                             5, _
                                             STATIC_TEXT_CELL_TYPE, _
                                             False, _
                                             False
    sprListDesignationsController.addColumn "Max. Starting Age Name", _
                                             10, _
                                             STATIC_TEXT_CELL_TYPE, _
                                             False, _
                                             False
    sprListDesignationsController.addColumn "Retirement Age", _
                                             16, _
                                             STATIC_TEXT_CELL_TYPE, _
                                             False, _
                                             False
    sprListDesignationsController.addColumn "Txn Ts", _
                                             0, _
                                             STATIC_TEXT_CELL_TYPE, _
                                             False, _
                                             True
    sprListDesignationsController.addColumn "Effective From", _
                                             14, _
                                             STATIC_TEXT_CELL_TYPE, _
                                             False, _
                                             True
    sprListDesignationsController.addColumn "Effective Till", _
                                             14, _
                                             STATIC_TEXT_CELL_TYPE, _
                                             False, _
                                             True
    sprListDesignationsController.addColumn "Desg. ID", _
                                             12, _
                                             STATIC_TEXT_CELL_TYPE, _
                                             False, _
                                             True
End Sub

Private Sub setEnableDisableControls(p_intMode As Integer)
    Select Case p_intMode
        
        Case uiManager.INSERT_MODE
            Me.clsWindowInterface_fireErase
            Me.txtDesignationCode.Enabled = True
            Me.txtDesignationName.Enabled = True
            Me.txtMinAge.Enabled = True
            Me.txtMaxStartingAge.Enabled = True
            Me.txtRetirementAge.Enabled = True
            Me.txtEffectiveFrom.Enabled = True
            Me.txtEffectiveTill.Enabled = True
            Me.txtID.Enabled = True
            Me.txtEffectiveFrom.Text = "01-Jan-1900"
            Me.txtEffectiveTill.Text = "31-Dec-9999"
            sprListDesignationsController.setSpreadMode intMode
            Me.fraDesignation.ZOrder 0
            
        Case uiManager.QUERY_MODE
            Me.clsWindowInterface_fireErase
            Me.txtDesignationCode.Enabled = True
            Me.txtDesignationName.Enabled = True
            Me.txtMinAge.Enabled = True
            Me.txtMaxStartingAge.Enabled = True
            Me.txtRetirementAge.Enabled = True
            Me.txtEffectiveFrom.Enabled = True
            Me.txtEffectiveTill.Enabled = True
            Me.txtID.Enabled = True
            sprListDesignationsController.setSpreadMode intMode
            Me.fraDesignation.ZOrder 0
            
        Case uiManager.RETRIEVE_MODE
            Me.txtDesignationCode.Enabled = False
            Me.txtDesignationName.Enabled = False
            Me.txtMinAge.Enabled = False
            Me.txtMaxStartingAge.Enabled = False
            Me.txtRetirementAge.Enabled = False
            Me.txtEffectiveFrom.Enabled = False
            Me.txtEffectiveTill.Enabled = False
            Me.txtID.Enabled = False
            sprListDesignationsController.setSpreadMode intMode
            Me.fraDesignation.ZOrder 0
            
        Case uiManager.LIST_MODE
            Me.txtDesignationCode.Enabled = False
            Me.txtDesignationName.Enabled = False
            Me.txtMinAge.Enabled = False
            Me.txtMaxStartingAge.Enabled = False
            Me.txtRetirementAge.Enabled = False
            Me.txtEffectiveFrom.Enabled = False
            Me.txtEffectiveTill.Enabled = False
            Me.txtID.Enabled = False
            sprListDesignationsController.setSpreadMode intMode
            Me.fraDesignation.ZOrder 0
            
        Case uiManager.BROWSE_MODE
            Me.txtDesignationCode.Enabled = True
            Me.txtDesignationName.Enabled = True
            Me.txtMinAge.Enabled = True
            Me.txtMaxStartingAge.Enabled = True
            Me.txtRetirementAge.Enabled = True
            Me.txtEffectiveFrom.Enabled = True
            Me.txtEffectiveTill.Enabled = True
            Me.txtID.Enabled = True
            sprListDesignationsController.setSpreadMode intMode
            Me.fraDesignation.ZOrder 0
                    
        Case uiManager.UPDATE_MODE
            Me.txtDesignationCode.Enabled = True
            Me.txtDesignationName.Enabled = True
            Me.txtMinAge.Enabled = True
            Me.txtMaxStartingAge.Enabled = True
            Me.txtRetirementAge.Enabled = True
            Me.txtEffectiveFrom.Enabled = True
            Me.txtEffectiveTill.Enabled = True
            Me.txtID.Enabled = True
            sprListDesignationsController.setSpreadMode intMode
            Me.fraDesignation.ZOrder 0
            
    End Select
End Sub

Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

Private Sub txtDesignationCode_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtDesignationName_GotFocus()
    uiManager.setStatusText ""
End Sub
Private Sub txtEffectiveFrom_GotFocus()
    uiManager.setStatusText "Please enter date smaller than Effective Till date"
End Sub

Private Sub txtEffectiveTill_GotFocus()
    uiManager.setStatusText "Please enter date greater than Effective From date"
End Sub




