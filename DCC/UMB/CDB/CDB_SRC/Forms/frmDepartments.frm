VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "EDT32X30.OCX"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.OCX"
Begin VB.Form frmDepartments 
   BackColor       =   &H00C0C0C0&
   Caption         =   "DEPARTMENTS"
   ClientHeight    =   8490
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
   MDIChild        =   -1  'True
   ScaleHeight     =   8490
   ScaleWidth      =   8880
   WindowState     =   2  'Maximized
   Begin VB.Frame fraDepartments 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   8655
      Left            =   0
      TabIndex        =   18
      Top             =   0
      Width           =   13275
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   345
         Left            =   3840
         TabIndex        =   12
         Top             =   2700
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
      Begin EditLib.fpText txtDepartmentCode 
         Height          =   345
         Left            =   4395
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
         AutoCase        =   1
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
         CharValidationText=   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
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
      Begin EditLib.fpText txtDepartmentName 
         Height          =   345
         Left            =   6420
         TabIndex        =   4
         Top             =   480
         Width           =   3615
         _Version        =   196608
         _ExtentX        =   6376
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
         MaxLength       =   35
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
      Begin EditLib.fpDateTime txtEffectiveFrom 
         Height          =   345
         Left            =   1770
         TabIndex        =   10
         Top             =   2700
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
      Begin EditLib.fpText txtDepartmentGroup 
         Height          =   345
         Left            =   1770
         TabIndex        =   6
         Top             =   1215
         Width           =   3615
         _Version        =   196608
         _ExtentX        =   6376
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
         MaxLength       =   30
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
      Begin EditLib.fpText txtFaxLine 
         Height          =   345
         Left            =   1770
         TabIndex        =   8
         Top             =   1965
         Width           =   2295
         _Version        =   196608
         _ExtentX        =   4048
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
         BorderStyle     =   1
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
         MaxLength       =   10
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
      Begin EditLib.fpLongInteger txtID 
         Height          =   345
         Left            =   1770
         TabIndex        =   0
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
         MaxValue        =   "99999999"
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
      Begin VB.CommandButton cmdMoveUpPTLines 
         BackColor       =   &H00C0C0C0&
         Height          =   300
         Left            =   6960
         Picture         =   "frmDepartments.frx":0000
         Style           =   1  'Graphical
         TabIndex        =   22
         TabStop         =   0   'False
         Top             =   1080
         Width           =   375
      End
      Begin VB.CommandButton cmdMoveUpEpabxExt 
         BackColor       =   &H00C0C0C0&
         Height          =   300
         Left            =   9120
         Picture         =   "frmDepartments.frx":0104
         Style           =   1  'Graphical
         TabIndex        =   21
         TabStop         =   0   'False
         Top             =   1080
         Width           =   375
      End
      Begin VB.CommandButton cmdMoveDownEpabxExt 
         BackColor       =   &H00C0C0C0&
         Height          =   300
         Left            =   9120
         Picture         =   "frmDepartments.frx":0208
         Style           =   1  'Graphical
         TabIndex        =   20
         TabStop         =   0   'False
         Top             =   2700
         Width           =   375
      End
      Begin VB.CommandButton cmdMoveDownPTLines 
         BackColor       =   &H00C0C0C0&
         Height          =   300
         Left            =   6960
         Picture         =   "frmDepartments.frx":030C
         Style           =   1  'Graphical
         TabIndex        =   19
         TabStop         =   0   'False
         Top             =   2700
         Width           =   375
      End
      Begin FPSpread.vaSpread sprDeptPTLines 
         Height          =   1215
         Left            =   6480
         TabIndex        =   13
         Tag             =   "Department P&TLines Spread"
         Top             =   1440
         Width           =   1320
         _Version        =   393216
         _ExtentX        =   2328
         _ExtentY        =   2143
         _StockProps     =   64
         DisplayRowHeaders=   0   'False
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ScrollBars      =   0
         ShadowColor     =   12632256
         SpreadDesigner  =   "frmDepartments.frx":0410
      End
      Begin FPSpread.vaSpread sprDeptEPABXExts 
         Height          =   1215
         Left            =   8640
         TabIndex        =   14
         Tag             =   "Department EPABX Extension Spread"
         Top             =   1440
         Width           =   1335
         _Version        =   393216
         _ExtentX        =   2355
         _ExtentY        =   2143
         _StockProps     =   64
         DisplayRowHeaders=   0   'False
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ScrollBars      =   0
         ShadowColor     =   12632256
         SpreadDesigner  =   "frmDepartments.frx":0639
      End
      Begin FPSpread.vaSpread sprDeptPersons 
         Height          =   3255
         Left            =   1080
         TabIndex        =   15
         Tag             =   "Department Person Spread"
         Top             =   3195
         Width           =   9705
         _Version        =   393216
         _ExtentX        =   17119
         _ExtentY        =   5741
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
         SpreadDesigner  =   "frmDepartments.frx":0862
      End
      Begin VB.Label lblEffectiveTill 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3840
         TabIndex        =   11
         Top             =   2460
         Width           =   1080
      End
      Begin VB.Label lblEffectiveFrom 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   1770
         TabIndex        =   9
         Top             =   2460
         Width           =   1290
      End
      Begin VB.Label lblFaxLine 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Fax Line(s)"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   1770
         TabIndex        =   7
         Top             =   1725
         Width           =   975
      End
      Begin VB.Label lblDepartmentGroup 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Department Group "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   1770
         TabIndex        =   5
         Top             =   960
         Width           =   1650
      End
      Begin VB.Label lblId 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ID"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   1770
         TabIndex        =   23
         Top             =   240
         Width           =   180
      End
      Begin VB.Label lblDepartmentName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6420
         TabIndex        =   3
         Top             =   240
         Width           =   570
      End
      Begin VB.Label lblDepartmentCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Code "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   4395
         TabIndex        =   1
         Top             =   240
         Width           =   510
      End
   End
   Begin VB.Frame fraListDepartments 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   8655
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   13935
      Begin FPSpread.vaSpread sprListDepartments 
         Height          =   6465
         Left            =   120
         TabIndex        =   17
         TabStop         =   0   'False
         Tag             =   "Department List Spread"
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
         SpreadDesigner  =   "frmDepartments.frx":0A6E
      End
   End
End
Attribute VB_Name = "frmDepartments"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Implements clsWindowInterface
Implements clsEditInterface
Implements clsQueryInterface
Implements clsCallingFormInterface

'This variable holds the value of the current mode of the form. This is set each time the form is opened in
'different mode with the 'showForm()' method of the 'clsWindowInterface'. And the value of this variable is
'returned, whenever requested through 'getMode()' method of the 'clsWindowInterface'
Dim intMode As Integer

'stores the value of txn_ts. the variable is set in the method populateFieldsFromRetrievalSpread of the
'interface clsQueryInterface
Dim varTxnTs As Variant

'stores the value of newly generated department in Insert Mode.
Dim intDeptID As Long

'This variable holds the value of the department group ID. Whenever a value is selected from the database and shown in
'the department group text field, this variable is set to hold the corresponding ID.
Dim intDeptGroupID As Long

Dim strDeleteTemplate As String
Dim strUpdateTemplate As String
Dim strInsertTemplate As String
Dim strSQL As String
Dim strs() As String
Dim displayOrders() As Long
Dim keyColumnNamesInDB() As String
Dim keyColumnIndicesInSpread() As Long
Dim displayOrderStrings() As String

'The declaration of spread controller for retrieving the records from the departments table. This spread
'controller is also used to show the records in list mode. This object variable is defined "withEvents"
'because this code module needs to catch the events thrown by this controller (like 'validateCell',
''validateRow' etc)
Dim WithEvents sprListDepartmentsController As ADL.clsSpreadController
Attribute sprListDepartmentsController.VB_VarHelpID = -1

'The declaration of spread controller for retrieving department persons. This object variable is defined
'"withEvents" because this code module needs to catch the events thrown by this controller
'(like 'validateCell', 'validateRow' etc)
Dim WithEvents sprDeptPersonsController As ADL.clsSpreadController
Attribute sprDeptPersonsController.VB_VarHelpID = -1

'The declaration of spread controller for retrieving department P&T lines. This object variable is defined
'"withEvents" because this code module needs to catch the events thrown by this controller
'(like 'validateCell', 'validateRow' etc)
Dim WithEvents sprDeptPTLinesController As ADL.clsSpreadController
Attribute sprDeptPTLinesController.VB_VarHelpID = -1

'The declaration of spread controller for retrieving department EPABX extensions. This object variable is defined
'"withEvents" because this code module needs to catch the events thrown by this controller
'(like 'validateCell', 'validateRow' etc)
Dim WithEvents sprDeptEPABXExtsController As ADL.clsSpreadController
Attribute sprDeptEPABXExtsController.VB_VarHelpID = -1

'This enum holds all the column numbers of the spread controller 'sprListDepartmentsController' that shows all the
'records of departments. The column numbers are stored into variables named corresponding to column names.
'These are called in functions of spreadController like 'getTextOfCell' or 'setTextOfCell' which requires row
'number and column number.
Private Enum departmentColumns
    code = 1
    Name = 2
    deptGroupID = 3
    deptGroupName = 4
    faxLine = 5
    txn_ts = 6
    effectivefrom = 7
    effectiveTill = 8
    ID = 9
End Enum

'This enum holds all the column numbers of the spread controller 'sprDeptPersonsController' that shows all the
'records of department persons. The column numbers are stored into variables named corresponding to column names.
'These are called in functions of spreadController like 'getTextOfCell' or 'setTextOfCell' which requires row
'number and column number.
Private Enum deptPersonColumns
    Title = 1
    firstName
    lastName
    Age
    originalDesigID
    DesignationID
    Designation
    sewadarStatusID
    sewadarStatus
    sewadarTypeID
    sewadarType
    originalEffFrom
    effectivefrom
    effectiveTill
    originalID
    ID
End Enum

'This enum holds all the column numbers of the spread controller 'sprDeptPTLinesController' that shows all the
'records of department P&T lines. The column numbers are stored into variables named corresponding to column names.
'These are called in functions of spreadController like 'getTextOfCell' or 'setTextOfCell' which requires row
'number and column number.
Private Enum deptPTLinesColumns
    deptPandTLine = 1
    olddeptPandTLine = 2
    displayOrder = 3
End Enum

'This enum holds all the column numbers of the spread controller 'sprDeptEPABXExtsController' that shows all the
'records of department EPABX extensions. The column numbers are stored into variables named corresponding to column names.
'These are called in functions of spreadController like 'getTextOfCell' or 'setTextOfCell' which requires row
'number and column number.
Private Enum deptEpabxExtensionColumns
    deptEpabxExtension = 1
    olddeptEpabxExtension = 2
    displayOrder = 3
End Enum

'implementation of the getForeignKeyInformation() method of the clsCallingFormInterface. This method returns the
'foreign key information of a particular control stated by parameter p_objActiveControl. The values are set into
'the parameters themselves as these parameters are coming by reference. This information is used by ADL to open
'the called form in a specific mode, when user clicks on the new/reference menu items in the operations menu.
Public Sub clsCallingFormInterface_getForeignKeyInformation(p_objActiveControl As Object, _
                                            p_objCallForm As Object, _
                                            p_strDisplayText As String, _
                                            p_strIDText As String, _
                                            p_colAdditionalValues As Collection)
    
    If p_objActiveControl Is Me.txtDepartmentGroup Then
        Set p_objCallForm = modMain.deptGroups
        p_strDisplayText = Me.txtDepartmentGroup.Text
        p_strIDText = Me.txtDepartmentGroup.Tag
        Set p_colAdditionalValues = Nothing
    End If
    
    If p_objActiveControl Is Me.txtFaxLine Then
        Set p_objCallForm = Nothing
        p_strDisplayText = Me.txtFaxLine.Text
        Set p_colAdditionalValues = Nothing
    End If
    
    If p_objActiveControl Is Me.sprDeptEPABXExts Then
        Set p_objCallForm = Nothing
        p_strDisplayText = sprDeptEPABXExtsController.getTextOfCell(Me.sprDeptEPABXExts.ActiveRow, deptEpabxExtensionColumns.deptEpabxExtension)
        Set p_colAdditionalValues = Nothing
    End If
    
    If p_objActiveControl Is Me.sprDeptPTLines Then
        Set p_objCallForm = Nothing
        p_strDisplayText = sprDeptPTLinesController.getTextOfCell(Me.sprDeptPTLines.ActiveRow, deptPTLinesColumns.deptPandTLine)
        Set p_colAdditionalValues = Nothing
    End If
    
    If p_objActiveControl Is Me.sprDeptPersons Then
        
        If Me.sprDeptPersons.ActiveCol = deptPersonColumns.firstName Then
            Set p_objCallForm = modMain.persons
            p_strDisplayText = sprDeptPersonsController.getTextOfCell(Me.sprDeptPersons.ActiveRow, deptPersonColumns.firstName)
            p_strIDText = sprDeptPersonsController.getTextOfCell(Me.sprDeptPersons.ActiveRow, deptPersonColumns.ID)
            Set p_colAdditionalValues = Nothing
            
        ElseIf Me.sprDeptPersons.ActiveCol = deptPersonColumns.lastName Then
            Set p_objCallForm = modMain.persons
            p_strDisplayText = sprDeptPersonsController.getTextOfCell(Me.sprDeptPersons.ActiveRow, deptPersonColumns.lastName)
            p_strIDText = sprDeptPersonsController.getTextOfCell(Me.sprDeptPersons.ActiveRow, deptPersonColumns.ID)
            Set p_colAdditionalValues = Nothing
                    
        ElseIf Me.sprDeptPersons.ActiveCol = deptPersonColumns.Designation Then
            Set p_objCallForm = modMain.designations
            p_strDisplayText = sprDeptPersonsController.getTextOfCell(Me.sprDeptPersons.ActiveRow, deptPersonColumns.Designation)
            p_strIDText = sprDeptPersonsController.getTextOfCell(Me.sprDeptPersons.ActiveRow, deptPersonColumns.DesignationID)
            Set p_colAdditionalValues = Nothing
            
        End If
    End If

End Sub

'Implementation of setReturnedValues() of the clsCallingFormInterface. It sets the return values, from the
'called form, back into the controls. The value stated by p_strDisplayText is set to the field which called
'the called form and the value stated by p_strIDText is stored in a variable for backend processing with database.
Public Sub clsCallingFormInterface_setReturnedValues(p_objSourceObject As Object, _
                                                     ByVal p_strDisplayText As String, _
                                                     ByVal p_strIDText As String, _
                                                     p_colAdditionalValues As Collection)
On Error GoTo errortag

    If p_objSourceObject Is Me.txtDepartmentGroup Then
        Me.txtFaxLine.SetFocus
    End If
    
    If p_objSourceObject Is Me.txtFaxLine Then
        Me.txtEffectiveFrom.SetFocus
    End If
    
    If p_objSourceObject Is Me.sprDeptEPABXExts Then
        sprDeptEPABXExtsController.setTextOfCell Me.sprDeptEPABXExts.ActiveRow, _
                                                 deptEpabxExtensionColumns.deptEpabxExtension, _
                                                 p_strDisplayText
    End If
    
    If p_objSourceObject Is Me.sprDeptPTLines Then
        sprDeptPTLinesController.setTextOfCell Me.sprDeptPTLines.ActiveRow, _
                                               deptPTLinesColumns.deptPandTLine, _
                                               p_strDisplayText
    End If
    
    If p_objSourceObject Is Me.sprDeptPersons Then
    
        If Me.sprDeptPersons.ActiveCol = deptPersonColumns.firstName Or _
           Me.sprDeptPersons.ActiveCol = deptPersonColumns.lastName Then
            
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.Title, _
                                                   p_colAdditionalValues("title")
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.firstName, _
                                                   p_colAdditionalValues("first_nm")
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.lastName, _
                                                   p_colAdditionalValues("last_nm")
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.Age, _
                                                   p_colAdditionalValues("age")
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.ID, _
                                                   p_colAdditionalValues("person_id")
        
        ElseIf Me.sprDeptPersons.ActiveCol = deptPersonColumns.Designation Then
            
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.DesignationID, _
                                                   p_colAdditionalValues("designation_id")
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.Designation, _
                                                   p_colAdditionalValues("designation_nm")
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.effectivefrom, _
                                                   p_colAdditionalValues("effective_from")
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.effectiveTill, _
                                                   p_colAdditionalValues("effective_till")
                                                   
        ElseIf Me.sprDeptPersons.ActiveCol = deptPersonColumns.sewadarStatus Then
        
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.sewadarStatusID, _
                                                   p_strIDText
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.sewadarStatus, _
                                                   p_strDisplayText
        
        ElseIf Me.sprDeptPersons.ActiveCol = deptPersonColumns.sewadarType Then
        
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.sewadarTypeID, _
                                                   p_strIDText
            sprDeptPersonsController.setTextOfCell Me.sprDeptPersons.ActiveRow, _
                                                   deptPersonColumns.sewadarType, _
                                                   p_strDisplayText
        
        End If
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsCallingFormInterface_setReturnedValues", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "error while saving or updating data"
    Err.Raise Err.Number
End Sub

'private function returning true when the field - Department code is valid, otherwise false
Private Function validateDepartmentCode() As Boolean
    
    validateDepartmentCode = True
    
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtDepartmentCode.Text) = "") Then
        Me.txtDepartmentCode.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Department Code", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateDepartmentCode = False
    End If
    
End Function

'private function returning true when the field - Department name is valid, otherwise false
Private Function validateDepartmentName() As Boolean

    validateDepartmentName = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtDepartmentName.Text) = "" Then
        Me.txtDepartmentName.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Department Name", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateDepartmentName = False
    End If
    
End Function

'private function returning true when the field - Department Group name is valid, otherwise false
Private Function validateDeptGroupName() As Boolean

    validateDeptGroupName = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtDepartmentGroup.Text) = "" Then
        Me.txtDepartmentGroup.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Department Group Name", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateDeptGroupName = False
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

'Implementation of isReadyToSave function of the interface clsEditInterface. No invalid data
'should enter into database. Thus before saving record, certain checks are carried out in this function. If all
'the checks are cleared then the function returns boolean value 'True' otherwise returns boolean value 'False'
'and a descriptive error or warning message is generated.
Public Function clsEditInterface_isReadyToSave() As Boolean
    clsEditInterface_isReadyToSave = True
    
    'validate event of the last focused control is called before save
    Me.ValidateControls
    
    Dim ptlineCols(0) As Long
    ptlineCols(0) = deptPTLinesColumns.deptPandTLine
    If sprDeptPTLinesController.getTextOfCell(Me.sprDeptPTLines.ActiveRow, Me.sprDeptPTLines.ActiveCol) <> "" Then
        If sprDeptPTLinesController.isCellValueRepeatedInColumn(ptlineCols, sprDeptPTLines.ActiveRow, True) = True Then
            logger.logMessage modStandardMessages.ValueRepeated, "P and T Lines " & sprDeptPTLinesController.getTextOfCell(sprDeptPTLines.ActiveRow, Me.sprDeptPTLines.ActiveCol), ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            clsEditInterface_isReadyToSave = False
        End If
    End If
    
    Dim epabxCols(0) As Long
    epabxCols(0) = deptEpabxExtensionColumns.deptEpabxExtension
    If sprDeptEPABXExtsController.getTextOfCell(Me.sprDeptEPABXExts.ActiveRow, Me.sprDeptEPABXExts.ActiveCol) <> "" Then
        If sprDeptEPABXExtsController.isCellValueRepeatedInColumn(epabxCols, sprDeptEPABXExts.ActiveRow, True) = True Then
            logger.logMessage modStandardMessages.ValueRepeated, "EPABX Extension " & sprDeptEPABXExtsController.getTextOfCell(sprDeptEPABXExts.ActiveRow, Me.sprDeptEPABXExts.ActiveCol), ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            clsEditInterface_isReadyToSave = False
        End If
    End If
    
    If (Not validateDepartmentCode) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateDepartmentName) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateDeptGroupName) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateEffectiveFrom) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateEffectiveTill) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    End If
    
End Function

Private Function prepareSpreadsForSave() As Boolean
    prepareSpreadsForSave = True
    
    If Me.sprDeptEPABXExts.MaxRows > 0 Then
        If Not sprDeptEPABXExtsController.prepareSpreadForSave Then
            prepareSpreadsForSave = False
        End If
    End If
    If Me.sprDeptPersons.MaxRows > 0 Then
        If Not sprDeptPersonsController.prepareSpreadForSave Then
            prepareSpreadsForSave = False
        End If
    End If
    If Me.sprDeptPTLines.MaxRows > 0 Then
        If Not sprDeptPTLinesController.prepareSpreadForSave Then
            prepareSpreadsForSave = False
        End If
    End If
End Function

Private Sub saveHeader()
On Error GoTo errortag
    strSQL = "CDB..insUpdDepartments '" & Trim(UCase(Me.txtDepartmentCode.Text)) & "','" & _
                                          Replace(Trim(Me.txtDepartmentName.Text), "'", "''") & "'," & _
                                          Me.txtDepartmentGroup.Tag & "," & _
                                          IIf(Me.txtFaxLine.Text = "", "NULL", "'" & Trim(Me.txtFaxLine.Text) & "'") & ",'" & _
                                          Trim(Me.txtEffectiveFrom.Text) & "','" & _
                                          Trim(Me.txtEffectiveTill.Text) & "'," & _
                                          IIf(Me.txtID.Text = "", "NULL", Trim(Me.txtID.Text)) & "," & _
                                          IIf(varTxnTs = "", "NULL", varTxnTs)
     
    Select Case intMode
        Case uiManager.INSERT_MODE
            strSQL = strSQL & ",0"      '0 - INSERT
            Dim rsDept As clsRecordHashMap
            Set rsDept = dbManager.executeSQLGetRS(strSQL)
            Me.txtID.Text = rsDept.getFieldValueByFieldIndex(0, 0)
        
        Case uiManager.BROWSE_MODE
            strSQL = strSQL & ",1"      '1 - UPDATE
            dbManager.executeSQL strSQL
    End Select
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "saveHeader", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'code for inserting,updating & deleting a row of department_p_and_t_lines
Private Sub savePTLines()
On Error GoTo errortag
    '[[First step in setDisplayOrder
    keyColumnNamesInDB = utils.createStringArray("p_and_t_line")
    keyColumnIndicesInSpread = utils.createLongArray(deptPTLinesColumns.olddeptPandTLine)
    displayOrderStrings = sprDeptPTLinesController.setDisplayOrder1("department_p_and_t_lines", _
                                                                     keyColumnNamesInDB, _
                                                                     "display_order", _
                                                                     keyColumnIndicesInSpread, _
                                                                     deptPTLinesColumns.displayOrder, _
                                                                     " department_id = " & Trim(Me.txtID.Text))
    'Call dbManager.addJobsToBatch(displayOrderStrings)
    Dim i As Long
    For i = 0 To UBound(displayOrderStrings)
        dbManager.executeSQL displayOrderStrings(i)
    Next i
    ']]
    
    strDeleteTemplate = "CDB..delDeptPTLines " & Trim(Me.txtID.Text) & ", @@"
    strUpdateTemplate = "CDB..insUpdDeptPTLines " & Trim(Me.txtID.Text) & ", @@, @@, Null, 1"            '1 - UPDATE
    strInsertTemplate = "CDB..insUpdDeptPTLines " & Trim(Me.txtID.Text) & ", @@, Null, DISPLAY_ORDER, 0"  '0 - INSERT
           
    If sprDeptPTLinesController.getNumberOfRowsForState(DELETED_STATE) <> 0 Then
        Dim deleteStrings() As String
        deleteStrings = sprDeptPTLinesController.getDeleteStrings(strDeleteTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            deptPTLinesColumns.deptPandTLine)
        
        For i = 0 To UBound(deleteStrings)
            dbManager.executeSQL deleteStrings(i)
        Next i
    End If
    
    If sprDeptPTLinesController.getNumberOfRowsForState(UPDATED_STATE) <> 0 Then
    Dim updateStrings() As String
    updateStrings = sprDeptPTLinesController.getUpdateStrings(strUpdateTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            deptPTLinesColumns.deptPandTLine, _
                                                                            deptPTLinesColumns.olddeptPandTLine)
    
        For i = 0 To UBound(updateStrings)
            dbManager.executeSQL updateStrings(i)
        Next i
    End If
    
    If sprDeptPTLinesController.getNumberOfRowsForState(NEW_STATE) <> 0 Then
        strs = sprDeptPTLinesController.getInsertStrings(strInsertTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            deptPTLinesColumns.deptPandTLine)
                                                                            
                                                                                    
        displayOrders = sprDeptPTLinesController.getDisplayOrderForRows(sprDeptPTLinesController.getRowIndicesWithRowState(NEW_STATE))
        
        For i = 0 To UBound(strs)
            strs(i) = Replace(strs(i), "DISPLAY_ORDER", displayOrders(i))
            dbManager.executeSQL (strs(i))
        Next i
        
    End If
    
    '[[second stage of display order
        keyColumnIndicesInSpread = utils.createLongArray(deptPTLinesColumns.deptPandTLine)
        displayOrderStrings = sprDeptPTLinesController.setDisplayOrder2("department_p_and_t_lines", _
                                                                         keyColumnNamesInDB, _
                                                                         "display_order", _
                                                                         keyColumnIndicesInSpread, _
                                                                         deptPTLinesColumns.displayOrder, _
                                                                         " department_id = " & Trim(Me.txtID.Text))
        For i = 0 To UBound(displayOrderStrings)
            dbManager.executeSQL displayOrderStrings(i)
        Next i
    ']]
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "savePTLines", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub


' code for inserting,updating & deleting a row of department_epabx_extensions
Private Sub saveEPABXExtn()
On Error GoTo errortag
    '[[First step in setDisplayOrder
    keyColumnNamesInDB = utils.createStringArray("epabx_extension")
    keyColumnIndicesInSpread = utils.createLongArray(deptEpabxExtensionColumns.olddeptEpabxExtension)
    displayOrderStrings = sprDeptEPABXExtsController.setDisplayOrder1("department_epabx_extensions", _
                                                              keyColumnNamesInDB, _
                                                              "display_order", _
                                                              keyColumnIndicesInSpread, _
                                                                deptEpabxExtensionColumns.displayOrder, _
                                                             " department_id = " & Trim(Me.txtID.Text))
    Dim i As Long
    For i = 0 To UBound(displayOrderStrings)
        dbManager.executeSQL displayOrderStrings(i)
    Next i
    ']]
    
    strDeleteTemplate = "CDB..delEPABXExtensions " & Trim(Me.txtID.Text) & ",@@"
    strUpdateTemplate = "CDB..insUpdDeptEPABXExtensions " & Trim(Me.txtID.Text) & ", @@, @@, Null, 1"            '1 - UPDATE
    strInsertTemplate = "CDB..insUpdDeptEPABXExtensions " & Trim(Me.txtID.Text) & ", @@, NULL, DISPLAY_ORDER, 0"  '0 - INSERT
    
    If sprDeptEPABXExtsController.getNumberOfRowsForState(DELETED_STATE) <> 0 Then
        Dim deletedStrings() As String
        deletedStrings = sprDeptEPABXExtsController.getDeleteStrings(strDeleteTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            deptEpabxExtensionColumns.deptEpabxExtension)
        For i = 0 To UBound(deletedStrings)
            dbManager.executeSQL deletedStrings(i)
        Next i
    End If
    
    If sprDeptEPABXExtsController.getNumberOfRowsForState(UPDATED_STATE) <> 0 Then
        Dim updateStrings() As String
        updateStrings = sprDeptEPABXExtsController.getUpdateStrings(strUpdateTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            deptEpabxExtensionColumns.deptEpabxExtension, _
                                                                            deptEpabxExtensionColumns.olddeptEpabxExtension)
        For i = 0 To UBound(updateStrings)
            dbManager.executeSQL updateStrings(i)
        Next i
    End If
    
    If sprDeptEPABXExtsController.getNumberOfRowsForState(NEW_STATE) <> 0 Then
    
        strs = sprDeptEPABXExtsController.getInsertStrings(strInsertTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            deptEpabxExtensionColumns.deptEpabxExtension)
                                                                            
        displayOrders = sprDeptEPABXExtsController.getDisplayOrderForRows(sprDeptEPABXExtsController.getRowIndicesWithRowState(NEW_STATE))
        Dim j As Long
        For j = 0 To UBound(strs)
            strs(j) = Replace(strs(j), "DISPLAY_ORDER", displayOrders(j))
            dbManager.executeSQL strs(j)
        Next j
    End If
    
    displayOrderStrings = sprDeptEPABXExtsController.setDisplayOrder2("department_epabx_extensions", _
                                                              keyColumnNamesInDB, _
                                                              "display_order", _
                                                              keyColumnIndicesInSpread, _
                                                                deptEpabxExtensionColumns.displayOrder, _
                                                             " department_id = " & Trim(Me.txtID.Text))
    For i = 0 To UBound(displayOrderStrings)
        dbManager.executeSQL displayOrderStrings(i)
    Next i
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "saveEPABXExtn", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub


'code for inserting,updating & deleting a row of department_persons
Private Sub saveDeptPersons()
On Error GoTo errortag
    
    strDeleteTemplate = "CDB..delDeptPersons " & "@@," & Trim(Me.txtID.Text) & ", @@, @@"
    strUpdateTemplate = "CDB..insUpdDeptPersons " & "@@, @@," & Trim(Me.txtID.Text) & ", @@, @@, @@, @@, @@, @@, @@, 1"  '1 - UPDATE
    strInsertTemplate = "CDB..insUpdDeptPersons " & "@@, @@," & Trim(Me.txtID.Text) & ", @@, @@, @@, @@, @@, @@, @@, 0"  '0 - INSERT
    Dim i As Long
    
    If sprDeptPersonsController.getNumberOfRowsForState(DELETED_STATE) <> 0 Then
        Dim deletedStrings() As String
        deletedStrings = sprDeptPersonsController.getDeleteStrings(strDeleteTemplate, _
                                                                           "Yes", _
                                                                           "No ", _
                                                                           deptPersonColumns.ID, _
                                                                           deptPersonColumns.DesignationID, _
                                                                           deptPersonColumns.effectivefrom)
        For i = 0 To UBound(deletedStrings)
            dbManager.executeSQL deletedStrings(i)
        Next i
    End If
    
    If sprDeptPersonsController.getNumberOfRowsForState(UPDATED_STATE) <> 0 Then
        Dim updateStrings() As String
        updateStrings = sprDeptPersonsController.getUpdateStrings(strUpdateTemplate, _
                                                                           "Yes", _
                                                                           "No ", _
                                                                           deptPersonColumns.originalID, _
                                                                           deptPersonColumns.ID, _
                                                                           deptPersonColumns.originalDesigID, _
                                                                           deptPersonColumns.DesignationID, _
                                                                           deptPersonColumns.sewadarStatusID, _
                                                                           deptPersonColumns.sewadarTypeID, _
                                                                           deptPersonColumns.originalEffFrom, _
                                                                           deptPersonColumns.effectivefrom, _
                                                                           deptPersonColumns.effectiveTill)
        For i = 0 To UBound(updateStrings)
            dbManager.executeSQL updateStrings(i)
        Next i
    End If
    
    If sprDeptPersonsController.getNumberOfRowsForState(NEW_STATE) <> 0 Then
        Dim insertStrings() As String
        insertStrings = sprDeptPersonsController.getInsertStrings(strInsertTemplate, _
                                                                           "Yes", _
                                                                           "No ", _
                                                                           deptPersonColumns.originalID, _
                                                                           deptPersonColumns.ID, _
                                                                           deptPersonColumns.originalDesigID, _
                                                                           deptPersonColumns.DesignationID, _
                                                                           deptPersonColumns.sewadarStatusID, _
                                                                           deptPersonColumns.sewadarTypeID, _
                                                                           deptPersonColumns.originalEffFrom, _
                                                                           deptPersonColumns.effectivefrom, _
                                                                           deptPersonColumns.effectiveTill)
        For i = 0 To UBound(insertStrings)
            dbManager.executeSQL insertStrings(i)
        Next i
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "saveDeptPersons", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub


'Implementation of the fireSave() method of the clsEditInterface. Here the form is saved by creating parameters
'that are passed to the dbManager's ExecuteBatch() method. The form can be saved when it is in either insert or
'new or browse or update mode. But before saving the form, the private boolean function isReadyToSave() is called
'to check if the form is ready for saving.
Public Sub clsEditInterface_fireSave()

On Error GoTo errortag
    
    If Not prepareSpreadsForSave Then
        Exit Sub
    End If
    
    dbManager.beginTrans
    saveHeader
    savePTLines
    saveEPABXExtn
    saveDeptPersons
    
    'dbManager.executeBatch
    dbManager.commitTrans
    
    Select Case intMode
        Case uiManager.INSERT_MODE
            logger.logMessage modStandardMessages.ObjectSaveMsg, "Department - '" & Trim(Me.txtDepartmentName.Text) & "'|" & Trim(Me.txtID.Text), PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Me.clsWindowInterface_showForm uiManager.INSERT_MODE
            Me.txtDepartmentCode.SetFocus
            
        Case uiManager.BROWSE_MODE
            'commenting the code b'coz when all the rows in sub-spread is deleted then the update row will not give proper results
            sprListDepartmentsController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, Me.sprListDepartments.ActiveRow
            Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListDepartments.ActiveRow
            varTxnTs = sprListDepartmentsController.getTextOfCell(Me.sprListDepartments.ActiveRow, departmentColumns.txn_ts)
            logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        
        Case Default
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
    dbManager.executeSQL "CDB..delDepartments " & Trim(Me.txtID.Text) & "," & varTxnTs
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
'the retrieval is done in the sprListDepartmentsController, so that is returned to the caller.
Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController
    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListDepartmentsController
End Function

'Implementation of the getSQLStringForRetrieval() function of the clsQueryInterface. This function
'returns the sql string which should be used by ADL to retrieve records in Retrieve mode.
'The query is build based upon the user entries in the different fields of the form.
Public Function clsQueryInterface_getSQLStringForRetrieval() As String

    Dim qryDepartments As String
    Dim strJoinTables As String
    Dim strJoinConditions As String
    
    Dim varPTLine As Variant
    Dim varEPABXExt As Variant
    Dim varPerson As Variant
    Dim varDesignation As Variant
    
    varPTLine = Trim(sprDeptPTLinesController.getTextOfCell(Me.sprDeptPTLines.ActiveRow, deptPTLinesColumns.deptPandTLine))
    varEPABXExt = Trim(sprDeptEPABXExtsController.getTextOfCell(Me.sprDeptEPABXExts.ActiveRow, deptEpabxExtensionColumns.deptEpabxExtension))
    varPerson = Trim(sprDeptPersonsController.getTextOfCell(Me.sprDeptPersons.ActiveRow, deptPersonColumns.firstName))
    varDesignation = Trim(sprDeptPersonsController.getTextOfCell(Me.sprDeptPersons.ActiveRow, deptPersonColumns.Designation))
    
    
    qryDepartments = "SELECT distinct d.department_cd, d.department_nm, dg.department_group_id, " & _
                     "dg.department_group_nm, d.fax_line, Cast(d.txn_ts As BigInt), " & _
                     "Convert(varchar, d.effective_from, 106)effective_from, " & _
                     "Convert(varchar, d.effective_till, 106)effective_till, d.department_id " & _
                     "FROM departments d, department_groups dg "
              
    If varEPABXExt <> "" Then
        strJoinTables = strJoinTables & ", department_epabx_extensions dee "
        strJoinConditions = strJoinConditions & "AND d.department_id = dee.department_id "
    End If

    If varPTLine <> "" Then
        strJoinTables = strJoinTables & ", department_p_and_t_lines dpt "
        strJoinConditions = strJoinConditions & "AND d.department_id = dpt.department_id "
    End If

    If varPerson <> "" Or varDesignation <> "" Then
        strJoinTables = strJoinTables & ", department_persons dp, persons p, designations dgs "
        strJoinConditions = strJoinConditions & "AND d.department_id = dp.department_id " & _
                                                "AND dp.person_id = p.person_id " & _
                                                "AND dp.designation_id = dgs.designation_id "
    End If

    qryDepartments = qryDepartments & _
                     strJoinTables & _
                     "WHERE d.department_group_id = dg.department_group_id " & _
                     strJoinConditions

    
    If Trim(Me.txtDepartmentCode.Text) <> "" Then
        qryDepartments = qryDepartments & "AND d.department_cd LIKE '%" & Trim(Me.txtDepartmentCode.Text) & "%' "
    End If
    
    If Trim(Me.txtDepartmentName.Text) <> "" Then
        qryDepartments = qryDepartments & "AND d.department_nm LIKE '%" & Replace(Trim(Me.txtDepartmentName.Text), "'", "''") & "%' "
    End If

    If Trim(Me.txtDepartmentGroup.Text) <> "" Then
        qryDepartments = qryDepartments & "AND dg.department_group_nm LIKE '%" & Replace(Trim(Me.txtDepartmentGroup.Text), "'", "''") & "%' "
    End If

    If Trim(Me.txtEffectiveFrom.Text) <> "" Then
        qryDepartments = qryDepartments & "AND d.effective_from = '" & Trim(Me.txtEffectiveFrom.Text) & "' "
    End If

    If Trim(Me.txtEffectiveTill.Text) <> "" Then
        qryDepartments = qryDepartments & "AND d.effective_till = '" & Trim(Me.txtEffectiveTill.Text) & "' "
    End If

    If Trim(Me.txtFaxLine.Text) <> "" Then
        qryDepartments = qryDepartments & "AND d.fax_line LIKE '%" & Trim(Me.txtFaxLine.Text) & "%' "
    End If

    If Trim(Me.txtID.Text) <> "" Then
        qryDepartments = qryDepartments & "AND d.department_id = " & Trim(Me.txtID.Text) & " "
    End If
    
    If varEPABXExt <> "" Then
        qryDepartments = qryDepartments & "AND dee.epabx_extension LIKE '%" & CStr(varEPABXExt) & "%' "
    End If
    
    If varPTLine <> "" Then
        qryDepartments = qryDepartments & "AND dpt.p_and_t_line LIKE '%" & CStr(varPTLine) & "%' "
    End If
    
    If varPerson <> "" Then
        qryDepartments = qryDepartments & "AND p.first_nm LIKE '%" & Replace(CStr(varPerson), "'", "''") & "%' "
    End If

    If varDesignation <> "" Then
        qryDepartments = qryDepartments & "AND dgs.designation_nm LIKE '%" & Replace(CStr(varDesignation), "'", "''") & "%' "
    End If
    
    qryDepartments = qryDepartments & "ORDER BY d.department_id"
    
    clsQueryInterface_getSQLStringForRetrieval = qryDepartments
        
End Function

'Implementation of the populateFieldsFromRetrievalSpread() method of the clsQueryInterface. All the fields are
'populated from the spread where the records are retrieved. Parameter p_lonrow states the row of the spread
'whose values are to be set in respective fields.
Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)
On Error GoTo errortag

    Me.txtDepartmentCode.Text = CStr(Trim(sprListDepartmentsController.getTextOfCell(p_lonRow, departmentColumns.code)))
    Me.txtDepartmentName.Text = CStr(sprListDepartmentsController.getTextOfCell(p_lonRow, departmentColumns.Name))
    
    Me.txtDepartmentGroup.Text = CStr(sprListDepartmentsController.getTextOfCell(p_lonRow, departmentColumns.deptGroupName))
    Me.txtDepartmentGroup.DataField = Me.txtDepartmentGroup.Text
    Me.txtDepartmentGroup.Tag = sprListDepartmentsController.getTextOfCell(p_lonRow, departmentColumns.deptGroupID)
    
    Me.txtFaxLine.Text = CStr(sprListDepartmentsController.getTextOfCell(p_lonRow, departmentColumns.faxLine))
    varTxnTs = sprListDepartmentsController.getTextOfCell(p_lonRow, departmentColumns.txn_ts)
    Me.txtEffectiveFrom.Text = Format(CDate(sprListDepartmentsController.getTextOfCell(p_lonRow, departmentColumns.effectivefrom)), "dd-mmm-yyyy")
    Me.txtEffectiveTill.Text = Format(CDate(sprListDepartmentsController.getTextOfCell(p_lonRow, departmentColumns.effectiveTill)), "dd-mmm-yyyy")
    Me.txtID.Text = sprListDepartmentsController.getTextOfCell(p_lonRow, departmentColumns.ID)
    
    strSQL = "SELECT epabx_extension , epabx_extension, display_order FROM department_epabx_extensions " & _
             "WHERE department_id = " & Trim(Me.txtID.Text) & " " & _
             "ORDER BY department_id, display_order "
    sprDeptEPABXExtsController.retrieveRecords (strSQL)
    
    strSQL = "SELECT p_and_t_line, p_and_t_line, display_order FROM department_p_and_t_lines " & _
             "WHERE department_id = " & Trim(Me.txtID.Text) & " " & _
             "ORDER BY department_id, display_order"
    sprDeptPTLinesController.retrieveRecords (strSQL)
    
    strSQL = "SELECT p.title, p.first_nm, p.last_nm, datediff(yyyy, p.birth_dtm, getdate()), " & _
                    "d.designation_id as originalDesigID, d.designation_id, d.designation_nm, " & _
                    "dp.sewadarStatus_id, ss.sewadarstatus_nm, dp.sewadartype_id, st.sewadartype_nm, " & _
                    "Convert(varchar, d.effective_from, 106)originalEffFrom, " & _
                    "Convert(varchar, d.effective_from, 106)effective_from, " & _
                    "Convert(varchar, d.effective_till,106)effective_till, " & _
                    "p.person_id as originalID, p.person_id " & _
             "FROM persons p, designations d, department_persons dp, sewadar_status ss, sewadar_types st " & _
             "WHERE dp.person_id = p.person_id AND dp.designation_id = d.designation_id " & _
             "AND ss.sewadarstatus_id = dp.sewadarstatus_id AND st.sewadartype_id = dp.sewadartype_id " & _
             "AND dp.department_id = " & Trim(Me.txtID.Text) & " " & _
             "ORDER BY dp.department_id"
    sprDeptPersonsController.retrieveRecords (strSQL)
    
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

    utils.clearControls Me.txtDepartmentCode, Me.txtDepartmentGroup, Me.txtDepartmentName, _
                        Me.txtFaxLine, Me.txtID
    
    Select Case intMode
        Case uiManager.QUERY_MODE
            Me.txtEffectiveFrom.Text = ""
            Me.txtEffectiveTill.Text = ""
        Case uiManager.INSERT_MODE
            Me.txtEffectiveFrom.Text = Format(Date, "dd-mmm-yyyy")
            Me.txtEffectiveTill.Text = "31-Dec-9999"
    End Select
    
    If Not Me.sprDeptEPABXExts Is Nothing Then
        sprDeptEPABXExtsController.clearSpread
    End If
    If Not Me.sprDeptPersons Is Nothing Then
        sprDeptPersonsController.clearSpread
    End If
    If Not Me.sprDeptPTLines Is Nothing Then
        sprDeptPTLinesController.clearSpread
    End If
    If Not Me.sprListDepartments Is Nothing Then
        sprListDepartmentsController.clearSpread
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
    clsWindowInterface_getScreenID = "DPT_01"
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
        setSpreadControllers
    End If
    
    Me.Visible = True
    Me.ZOrder 0
    setEnableDisableControls
    
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls()

    Select Case intMode
        
        Case uiManager.INSERT_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            sprDeptEPABXExtsController.setSpreadMode intMode
            sprDeptPersonsController.setSpreadMode intMode
            sprDeptPTLinesController.setSpreadMode intMode
            sprListDepartmentsController.setSpreadMode intMode
            Me.fraDepartments.ZOrder 0
            Me.txtDepartmentCode.SetFocus
                        
        Case uiManager.QUERY_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID
            sprDeptEPABXExtsController.setSpreadMode intMode, True
            sprDeptPersonsController.setSpreadMode intMode, True
            sprDeptPTLinesController.setSpreadMode intMode, True
            sprListDepartmentsController.setSpreadMode intMode
            Me.fraDepartments.ZOrder 0
            Me.txtID.SetFocus
            
        Case uiManager.RETRIEVE_MODE
        
            sprDeptEPABXExtsController.setSpreadMode intMode
            sprDeptPersonsController.setSpreadMode intMode
            sprDeptPTLinesController.setSpreadMode intMode
            sprListDepartmentsController.setSpreadMode intMode
            Me.fraDepartments.ZOrder 0
            
        Case uiManager.BROWSE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID
            sprDeptEPABXExtsController.setSpreadMode intMode
            sprDeptPersonsController.setSpreadMode intMode
            sprDeptPTLinesController.setSpreadMode intMode
            sprListDepartmentsController.setSpreadMode intMode
            Me.fraDepartments.ZOrder 0
            Me.txtDepartmentCode.SetFocus
            
        Case uiManager.LIST_MODE
        
            sprListDepartmentsController.setSpreadMode intMode
            Me.fraListDepartments.ZOrder 0
            
    End Select
    
End Sub

'This is a private method to this code module. Here spread controllers are initialized and columns are
'added to them for all the respective spreads in this form.
Private Sub setSpreadControllers()
        
    'initializing and adding columns to sprListDepartmentsController of departments
    
    Set sprListDepartmentsController = New clsSpreadController
    sprListDepartmentsController.registerSpreadInstance uiManager, sprListDepartments, LIST_SPREAD, Me
    sprListDepartmentsController.setHeaderHeight 600
    
    sprListDepartmentsController.addColumn "Dept.   Code", 8, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN
    sprListDepartmentsController.addColumn "Department", 27, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN
    sprListDepartmentsController.addColumn "Department Group ID", 0, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprListDepartmentsController.addColumn "Department Group", 27, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN
    sprListDepartmentsController.addColumn "Fax Line", 9, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprListDepartmentsController.addColumn "TXN_TS", 0, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprListDepartmentsController.addColumn "Effective    From", 11, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , CENTER_ALIGNMENT
    sprListDepartmentsController.addColumn "Effective    Till", 11, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , CENTER_ALIGNMENT
    sprListDepartmentsController.addColumn "Dept. ID", 6, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
                                            
    'initializing and adding columns to sprDeptPersonsController of department_persons
                                            
    Set sprDeptPersonsController = New clsSpreadController
    sprDeptPersonsController.registerSpreadInstance uiManager, sprDeptPersons, NORMAL_SPREAD, Me, 0, , SCROLLABLE
    sprDeptPersonsController.setHeaderHeight 600
    
    sprDeptPersonsController.addColumn "Title", 6, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , LOOKUP_DISABLED
    sprDeptPersonsController.addColumn "First Name", 30, edit_CELL_TYPE, True, MANDATORY_COLUMN, , LOOKUP_ENABLED
    sprDeptPersonsController.addColumn "Last Name", 30, edit_CELL_TYPE, False, MANDATORY_COLUMN, , LOOKUP_ENABLED
    sprDeptPersonsController.addColumn "Age", 6, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprDeptPersonsController.addColumn "Original Designation Id", 0, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprDeptPersonsController.addColumn "Designation Id", 0, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprDeptPersonsController.addColumn "Designation", 30, edit_CELL_TYPE, True, True, , LOOKUP_ENABLED
    sprDeptPersonsController.addColumn "SewadarStatus Id", 0, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprDeptPersonsController.addColumn "Status", 20, edit_CELL_TYPE, True, True, , LOOKUP_ENABLED
    sprDeptPersonsController.addColumn "SewadarType Id", 0, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprDeptPersonsController.addColumn "Type", 15, edit_CELL_TYPE, True, True, , LOOKUP_ENABLED
    sprDeptPersonsController.addColumn "Original Effective From", 0, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN, , , , , CENTER_ALIGNMENT
    sprDeptPersonsController.addColumn "Effective From", 13, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , CENTER_ALIGNMENT
    sprDeptPersonsController.addColumn "Effective   Till", 13, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , CENTER_ALIGNMENT
    sprDeptPersonsController.addColumn "Original Person ID", 0, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT
    sprDeptPersonsController.addColumn "Person ID", 8, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT
    
    'initializing and adding columns to sprDeptPTLinesController of department_p_and_t_lines
    
    Set sprDeptPTLinesController = New clsSpreadController
    sprDeptPTLinesController.registerSpreadInstance uiManager, sprDeptPTLines, NORMAL_SPREAD, Me, 0
    sprDeptPTLinesController.setHeaderHeight 600
    
    sprDeptPTLinesController.addColumn "  P and T Line  ", 100, edit_CELL_TYPE, True, True, , True, , 10, RIGHT_ALIGNMENT
    sprDeptPTLinesController.addColumn "Old  P and T Line  ", 10, edit_CELL_TYPE, True, False, , LOOKUP_DISABLED, , 10, RIGHT_ALIGNMENT
    sprDeptPTLinesController.addColumn "Display Order", 0, STATIC_TEXT_CELL_TYPE, False, False
                                        
    'initializing and adding columns to sprDeptEPABXExtsController of department_epabx_extensions
                                        
    Set sprDeptEPABXExtsController = New clsSpreadController
    sprDeptEPABXExtsController.registerSpreadInstance uiManager, sprDeptEPABXExts, NORMAL_SPREAD, Me, 0
    sprDeptEPABXExtsController.setHeaderHeight 600
    
    sprDeptEPABXExtsController.addColumn "EPABX   Extension", 100, edit_CELL_TYPE, True, True, , True, , 5, RIGHT_ALIGNMENT
    sprDeptEPABXExtsController.addColumn "Old EPABX   Extension", 10, edit_CELL_TYPE, True, False, , LOOKUP_DISABLED, , 5, RIGHT_ALIGNMENT
    sprDeptEPABXExtsController.addColumn "Display Order", 0, STATIC_TEXT_CELL_TYPE, False, False
    
End Sub

Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.lblDepartmentCode, Me.lblDepartmentGroup, Me.lblDepartmentName, Me.lblEffectiveTill, Me.lblFaxLine, Me.lblId, Me.lblEffectiveFrom, _
                                                         Me.txtDepartmentCode, Me.txtDepartmentGroup, Me.txtDepartmentName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtFaxLine, Me.txtID
    modControlsSettings.setStateToNormal Me.txtDepartmentCode, Me.txtDepartmentGroup, Me.txtDepartmentName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtFaxLine, Me.txtID
    Me.txtDepartmentGroup.ButtonStyle = ButtonStylePopUp
    Me.txtFaxLine.ButtonStyle = ButtonStylePopUp
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookUpForEPABXExt()
'is the common place where the lookup on the epabx_extensions has been provided
Private Sub sprDeptEPABXExtsController_RequestLookup(ByVal p_lonColumn As Long, ByVal p_lonRow As Long, ByVal p_bolIsLastEditableCell As Boolean, ByVal p_bolIsLastRow As Boolean, ByVal p_enmSearchMode As ADL.enmLookupSearchModes, p_blnLookupResult As Boolean)
On Error GoTo errortag
    If p_lonColumn = deptEpabxExtensionColumns.deptEpabxExtension Then
        modCDBLookUps.showLookUpForEPABXExt Me, Me.sprDeptEPABXExts, modMain.EPBAXLines, sprDeptEPABXExtsController.getTextOfCell(p_lonRow, p_lonColumn), absolute
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprDeptEPABXExtsController_RequestLookup", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub sprDeptEPABXExtsController_ValidateCell(ByVal p_lonRow As Long, ByVal p_lonColumn As Long, p_bolIsCellValid As Boolean)
    Dim epabxCols(0) As Long
    epabxCols(0) = deptEpabxExtensionColumns.deptEpabxExtension
    If sprDeptEPABXExtsController.getTextOfCell(p_lonRow, deptEpabxExtensionColumns.deptEpabxExtension) <> "" Then
        If sprDeptEPABXExtsController.isCellValueRepeatedInColumn(epabxCols, p_lonRow, True) = True Then
            logger.logMessage modStandardMessages.ValueRepeated, "EPABX Extension " & sprDeptEPABXExtsController.getTextOfCell(p_lonRow, Me.sprDeptEPABXExts.ActiveCol), ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            p_bolIsCellValid = False
        End If
    End If
End Sub

Private Sub sprDeptEPABXExtsController_ValidateRow(ByVal p_lonRow As Long, p_bolIsRowValid As Boolean)
    'check for repeated value
    Dim epabxCols(0) As Long
    epabxCols(0) = deptEpabxExtensionColumns.deptEpabxExtension
    If sprDeptEPABXExtsController.getTextOfCell(p_lonRow, deptEpabxExtensionColumns.deptEpabxExtension) <> "" Then
        If sprDeptEPABXExtsController.isCellValueRepeatedInColumn(epabxCols, p_lonRow, True) = True Then
            logger.logMessage modStandardMessages.ValueRepeated, "EPABX Extension " & sprDeptEPABXExtsController.getTextOfCell(p_lonRow, Me.sprDeptEPABXExts.ActiveCol), ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            p_bolIsRowValid = False
        End If
    End If
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookupForPersons() and showLookUpForDesignations()
'is the common place where the lookup on the persons and designations has been provided
Private Sub sprDeptPersonsController_RequestLookup(ByVal p_lonColumn As Long, ByVal p_lonRow As Long, ByVal p_bolIsLastEditableCell As Boolean, ByVal p_bolIsLastRow As Boolean, ByVal p_enmSearchMode As ADL.enmLookupSearchModes, p_blnLookupResult As Boolean)
On Error GoTo errortag
    If p_lonColumn = deptPersonColumns.firstName Then
        modCDBLookUps.showLookUpForFirstName Me, Me.sprDeptPersons, modMain.persons, CStr(sprDeptPersonsController.getTextOfCell(p_lonRow, p_lonColumn)), enmLookupSearchModes.absolute
    End If
    If p_lonColumn = deptPersonColumns.lastName Then
        modCDBLookUps.showLookUpForLastName Me, Me.sprDeptPersons, modMain.persons, CStr(sprDeptPersonsController.getTextOfCell(p_lonRow, p_lonColumn)), enmLookupSearchModes.absolute
    End If
    If p_lonColumn = deptPersonColumns.Designation Then
        modCDBLookUps.showLookUpForDesignations Me, Me.sprDeptPersons, modMain.designations, CStr(sprDeptPersonsController.getTextOfCell(p_lonRow, p_lonColumn)), enmLookupSearchModes.absolute
    End If
    If p_lonColumn = deptPersonColumns.sewadarStatus Then
        modCDBLookUps.showLookUpForSewadarStatus Me, Me.sprDeptPersons, Nothing, CStr(sprDeptPersonsController.getTextOfCell(p_lonRow, p_lonColumn)), enmLookupSearchModes.absolute
    End If
    If p_lonColumn = deptPersonColumns.sewadarType Then
        modCDBLookUps.showLookUpForSewadarTypes Me, Me.sprDeptPersons, Nothing, CStr(sprDeptPersonsController.getTextOfCell(p_lonRow, p_lonColumn)), enmLookupSearchModes.absolute
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprDeptPersonsController_RequestLookup", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

'This is a private method to this module. ValidateCell is the event (of the spread controller) raised when the
'user clicks on any cell of the spread. Here validation checks are carried out for any particular cell value.
Private Sub sprDeptPersonsController_ValidateCell(ByVal p_lonRow As Long, _
                                                  ByVal p_lonColumn As Long, _
                                                  p_bolIsCellValid As Boolean)
                                                  
    Dim varEffectiveFrom As Variant
    Dim varEffectivetill As Variant
    
    Select Case p_lonColumn
        Case deptPersonColumns.effectiveTill
            varEffectivetill = sprDeptPersonsController.getTextOfCell(p_lonRow, deptPersonColumns.effectiveTill)
            varEffectiveFrom = sprDeptPersonsController.getTextOfCell(p_lonRow, deptPersonColumns.effectivefrom)
                    
            'validating Effective Till date that the text entered is in date format only
            If (varEffectiveFrom <> "" And varEffectivetill <> "") Then
                'comparing Effective From and Effective Till dates
                If DateDiff("d", varEffectiveFrom, varEffectivetill) < 0 Then
                    logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Effective Till|Effective From", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
                    p_bolIsCellValid = False
                End If
            End If
    End Select
    
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookupForFaxPTLines() is the common place
'where the lookup on the p and t lines has been provided
Private Sub sprDeptPTLinesController_RequestLookup(ByVal p_lonColumn As Long, ByVal p_lonRow As Long, ByVal p_bolIsLastEditableCell As Boolean, ByVal p_bolIsLastRow As Boolean, ByVal p_enmSearchMode As ADL.enmLookupSearchModes, p_blnLookupResult As Boolean)
On Error GoTo errortag
    If p_lonColumn = deptPTLinesColumns.deptPandTLine Then
        modCDBLookUps.showLookUpForFaxPTLines Me, Me.sprDeptPTLines, modMain.ptLines, sprDeptPTLinesController.getTextOfCell(p_lonRow, p_lonColumn), absolute
    End If
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprDeptPTLinesController_RequestLookup", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

'The method moves down a row of sprDeptEPABXExtsController of department_epabx_extensions
Private Sub cmdMoveDownEpabxExt_Click()
On Error GoTo errortag
    sprDeptEPABXExtsController.moveRowDown
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmdMoveDownEpabxExt_Click", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

'The method moves down a row of sprDeptPTLinesController of department_p_and_t_lines
Private Sub cmdMoveDownPTLines_Click()
On Error GoTo errortag
    sprDeptPTLinesController.moveRowDown
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmdMoveDownPTLines_Click", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

'The method moves up a row of sprDeptEPABXExtsController of department_epabx_extensions
Private Sub cmdMoveUpEpabxExt_Click()
On Error GoTo errortag
    sprDeptEPABXExtsController.moveRowUp
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmdMoveUpEpabxExt_Click", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

'The method moves up a row of sprDeptPTLinesController of department_p_and_t_lines
Private Sub cmdMoveUpPTLines_Click()
On Error GoTo errortag
    sprDeptPTLinesController.moveRowUp
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmdMoveUpPTLines_Click", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

Private Sub sprDeptPTLinesController_ValidateCell(ByVal p_lonRow As Long, ByVal p_lonColumn As Long, p_bolIsCellValid As Boolean)
    'check for repeated value
    Dim ptlineCols(0) As Long
    ptlineCols(0) = deptPTLinesColumns.deptPandTLine
    If sprDeptPTLinesController.getTextOfCell(p_lonRow, deptPTLinesColumns.deptPandTLine) <> "" Then
        If sprDeptPTLinesController.isCellValueRepeatedInColumn(ptlineCols, p_lonRow, True) = True Then
            logger.logMessage modStandardMessages.ValueRepeated, "P and T Lines " & sprDeptPTLinesController.getTextOfCell(p_lonRow, Me.sprDeptPTLines.ActiveCol), ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            p_bolIsCellValid = False
        End If
    End If
End Sub

Private Sub sprDeptPTLinesController_ValidateRow(ByVal p_lonRow As Long, p_bolIsRowValid As Boolean)
    'check for repeated value
    Dim ptlineCols(0) As Long
    ptlineCols(0) = deptPTLinesColumns.deptPandTLine
    If sprDeptPTLinesController.getTextOfCell(p_lonRow, deptPTLinesColumns.deptPandTLine) <> "" Then
        If sprDeptPTLinesController.isCellValueRepeatedInColumn(ptlineCols, p_lonRow, True) = True Then
            logger.logMessage modStandardMessages.ValueRepeated, "P and T Lines " & sprDeptPTLinesController.getTextOfCell(p_lonRow, Me.sprDeptPTLines.ActiveCol), ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            p_bolIsRowValid = False
        End If
    End If
End Sub

'The method sets the status text of the main screen
Private Sub txtDepartmentCode_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtDepartmentCode_Validate(Cancel As Boolean)
    validateDepartmentCode
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookupForDeptGroups() is the common place
'where the lookup on the department groups has been provided
Private Sub txtDepartmentGroup_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    modCDBLookUps.showLookUpForDeptGroups Me, Me.txtDepartmentGroup, modMain.deptGroups, Me.txtDepartmentGroup.Text, enmLookupSearchModes.absolute
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtDepartmentGroup_ButtonHit", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "error while saving or updating data"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtDepartmentGroup_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please hit the button for Lookup Dialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtDepartmentGroup_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 And (intMode <> uiManager.REFERENCE_MODE) Then
        Call txtDepartmentGroup_ButtonHit(0, 0)
    End If
End Sub

Private Sub txtDepartmentGroup_Validate(Cancel As Boolean)
On Error GoTo errortag

    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup for department group can be called when it is empty in mode other than QUERY mode
    If (validateDeptGroupName) Then
        'lookup called
        If Me.txtDepartmentGroup.DataField <> Me.txtDepartmentGroup.Text Then
            modCDBLookUps.showLookUpForDeptGroups Me, Me.txtDepartmentGroup, modMain.deptGroups, Me.txtDepartmentGroup.Text, enmLookupSearchModes.Logical
        End If
        'enforcing the control to hold a value selected from the lookup
        If (Me.txtDepartmentGroup.DataField <> Me.txtDepartmentGroup.Text) Then
            logger.logMessage modStandardMessages.NotExist, "Department Group Name - '" & Me.txtDepartmentGroup.Text & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, " failed during lookup"
            Me.txtDepartmentGroup.SelStart = 0
            Me.txtDepartmentGroup.SelLength = Len(Trim(Me.txtDepartmentGroup.Text))
            Me.txtDepartmentGroup.SetFocus
            Cancel = True
        End If
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtDepartmentGroup_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "error while saving or updating data"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtDepartmentName_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtDepartmentName_Validate(Cancel As Boolean)
    validateDepartmentName
End Sub

'The method sets the status text of the main screen
Private Sub txtEffectiveFrom_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter date smaller than Effective Till"
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
            uiManager.setStatusText "Please enter date greater than Effective From"
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

Private Sub txtFaxLine_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    modCDBLookUps.showLookUpForFaxPTLines Me, Me.txtFaxLine, modMain.ptLines, Me.txtFaxLine.Text, enmLookupSearchModes.absolute
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtFaxLine_ButtonHit", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "error while saving or updating data"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtFaxLine_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please hit the button for Lookup Dialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtFaxLine_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 And intMode <> uiManager.REFERENCE_MODE Then
        Call txtFaxLine_ButtonHit(0, 0)
    End If
End Sub

Private Sub txtFaxLine_Validate(Cancel As Boolean)
On Error GoTo errortag

    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup for fax line can be called when it is empty in mode other than QUERY mode
    If Trim(Me.txtFaxLine.Text) <> "" Then
        'lookup called
        If Me.txtFaxLine.DataField <> Me.txtFaxLine.Text Then
            modCDBLookUps.showLookUpForFaxPTLines Me, Me.txtFaxLine, Nothing, Me.txtFaxLine.Text, enmLookupSearchModes.Logical
        End If
        'enforcing the control to hold a value selected from the lookup
        If (Me.txtFaxLine.DataField <> Me.txtFaxLine.Text) Then
            logger.logMessage modStandardMessages.NotExist, "Fax Line - '" & Me.txtFaxLine.Text & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, " failed during lookup"
            Me.txtFaxLine.SelStart = 0
            Me.txtFaxLine.SelLength = Len(Trim(Me.txtFaxLine.Text))
            Me.txtFaxLine.SetFocus
            Cancel = True
        End If
        
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtFaxLine_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "error while saving or updating data"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtID_GotFocus()
    uiManager.setStatusText ""
End Sub




