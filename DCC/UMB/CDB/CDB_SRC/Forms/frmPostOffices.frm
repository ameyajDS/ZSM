VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "EDT32X30.OCX"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.OCX"
Begin VB.Form frmPostOffices 
   BackColor       =   &H00C0C0C0&
   Caption         =   "POST OFFICES"
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
   ForeColor       =   &H00800000&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   8595
   ScaleWidth      =   8880
   WindowState     =   2  'Maximized
   Begin VB.Frame fraPostOffice 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   15225
      Left            =   0
      TabIndex        =   22
      Top             =   0
      Width           =   19350
      Begin EditLib.fpText txtPOCode 
         Height          =   345
         Left            =   6255
         TabIndex        =   3
         Top             =   510
         Width           =   1560
         _Version        =   196608
         _ExtentX        =   2752
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
         CharValidationText=   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
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
      Begin EditLib.fpText txtPOName 
         Height          =   345
         Left            =   3720
         TabIndex        =   5
         Top             =   1220
         Width           =   4095
         _Version        =   196608
         _ExtentX        =   7223
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
         TabIndex        =   7
         Top             =   1960
         Width           =   4095
         _Version        =   196608
         _ExtentX        =   7223
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
         TabIndex        =   9
         Top             =   2700
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
      Begin EditLib.fpDateTime txtEffectiveFrom 
         Height          =   345
         Left            =   3720
         TabIndex        =   17
         Top             =   4920
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
      Begin EditLib.fpLongInteger txtID 
         Height          =   345
         Left            =   3720
         TabIndex        =   1
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
      Begin EditLib.fpText txtPinOrZipCode 
         Height          =   345
         Left            =   3720
         TabIndex        =   13
         Top             =   4185
         Width           =   855
         _Version        =   196608
         _ExtentX        =   1508
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
         InvalidColor    =   12632256
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
         CharValidationText=   "1234567890"
         MaxLength       =   6
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
      Begin EditLib.fpText txtDistrictOrCity 
         Height          =   345
         Left            =   3720
         TabIndex        =   11
         Top             =   3440
         Width           =   4095
         _Version        =   196608
         _ExtentX        =   7223
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
      Begin EditLib.fpText txtSTDCode 
         Height          =   345
         Left            =   6240
         TabIndex        =   15
         Top             =   4180
         Width           =   1200
         _Version        =   196608
         _ExtentX        =   2117
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
         NullColor       =   -2147483637
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   1
         ControlType     =   0
         Text            =   ""
         CharValidationText=   "1234567890 -"
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
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   345
         Left            =   6240
         TabIndex        =   19
         Top             =   4920
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
         AutoBeep        =   0   'False
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
         TabIndex        =   18
         Top             =   4680
         Width           =   1200
      End
      Begin VB.Label lblStdCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "STD Code "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6240
         TabIndex        =   14
         Top             =   3940
         Width           =   945
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
      Begin VB.Label lblDistrictOrCity 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "District / City"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   10
         Top             =   3200
         Width           =   1140
      End
      Begin VB.Label lblStateName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "State"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   8
         Top             =   2460
         Width           =   465
      End
      Begin VB.Label lblCountryName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Country"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   6
         Top             =   1720
         Width           =   675
      End
      Begin VB.Label lblPostOfficeName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Name"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   4
         Top             =   980
         Width           =   510
      End
      Begin VB.Label lblEffectiveFrom 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   16
         Top             =   4680
         Width           =   1290
      End
      Begin VB.Label lblPinOrZipcode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Pin / Zip Code "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   12
         Top             =   3940
         Width           =   1290
      End
      Begin VB.Label lblPostOfficeCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Code "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6255
         TabIndex        =   2
         Top             =   240
         Width           =   510
      End
   End
   Begin VB.Frame fraListPO 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   20175
      Left            =   0
      TabIndex        =   20
      Top             =   -30
      Width           =   24975
      Begin FPSpread.vaSpread sprListPO 
         Height          =   7695
         Left            =   120
         TabIndex        =   21
         TabStop         =   0   'False
         Tag             =   "Post Office List Spread"
         Top             =   120
         Width           =   13575
         _Version        =   393216
         _ExtentX        =   23945
         _ExtentY        =   13573
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
         SpreadDesigner  =   "frmPostOffices.frx":0000
      End
   End
End
Attribute VB_Name = "frmPostOffices"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Implements clsWindowInterface
Implements clsQueryInterface
Implements clsEditInterface
Implements clsCallingFormInterface

'This variable holds the value of the current mode of the form. This is set each time the form is opened in
'different mode with the 'showForm()' method of the 'clsWindowInterface'. And the value of this variable is
'returned, whenever requested through 'getMode()' method of the 'clsWindowInterface'
Dim intMode As Integer

'stores the value of txn_ts. the variable is filled in populateFieldsFromRetrievalSpread method
'of clsQueryInterface
Dim varTxnTs As Variant

'The declaration of spread controller for retrieving the records from the post_offices table. This spread
'controller is also used to show the records in list mode. This object variable is defined "withEvents"
'because this code module needs to catch the events thrown by this controller (like 'validateCell',
''validateRow' etc)
Dim WithEvents sprListPOController As clsSpreadController
Attribute sprListPOController.VB_VarHelpID = -1

'This enum holds all the column numbers of the spread controller 'sprListPOController' that shows all the
'records of post offices. The column numbers are stored into variables named corresponding to column names.
'These are called in functions of spreadController like 'getTextOfCell' or 'setTextOfCell' which requires row
'number and column number.
Private Enum POColumns
    POCode = 1
    POName = 2
    countryID = 3
    countryName = 4
    stateID = 5
    stateName = 6
    distCityID = 7
    distCityName = 8
    pinZipCode = 9
    STDCode = 10
    txn_ts = 11
    effectivefrom = 12
    effectiveTill = 13
    POID = 14
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
                                                            
    If p_objActiveControl Is Me.txtCountryName Then
        Set p_objCallForm = modMain.countries
        p_strDisplayText = Me.txtCountryName.Text
        p_strIDText = Me.txtCountryName.Tag
        Set p_colAdditionalValues = Nothing
    End If
    
    If p_objActiveControl Is Me.txtStateName Then
        
        Set p_objCallForm = modMain.states
        p_strDisplayText = Me.txtStateName.Text
        p_strIDText = Me.txtStateName.Tag
        'country id & name are added in collection
        p_colAdditionalValues.Add Me.txtCountryName.Tag, "country_id"
        p_colAdditionalValues.Add Me.txtCountryName.Text, "country_nm"
    End If
    
    If p_objActiveControl Is Me.txtDistrictOrCity Then
        Set p_objCallForm = modMain.districtsOrCities
        p_strDisplayText = Me.txtDistrictOrCity.Text
        p_strIDText = Me.txtDistrictOrCity.Tag
        'state id & name and country id & name are added in the collection
        p_colAdditionalValues.Add Me.txtStateName.Tag, "state_id"
        p_colAdditionalValues.Add Me.txtStateName.Text, "state_nm"
        p_colAdditionalValues.Add Me.txtCountryName.Tag, "country_id"
        p_colAdditionalValues.Add Me.txtCountryName.Text, "country_nm"
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
        Me.txtCountryName.Text = Me.txtCountryName.DataField
        utils.clearControls Me.txtStateName, Me.txtDistrictOrCity
        Me.txtStateName.SetFocus
    End If
    
    If p_objSourceObject Is Me.txtStateName Then
        Me.txtStateName.Text = Me.txtStateName.DataField
        utils.clearControls Me.txtDistrictOrCity
        Me.txtDistrictOrCity.SetFocus
    End If
    
    If p_objSourceObject Is Me.txtDistrictOrCity Then
        Me.txtDistrictOrCity.Text = Me.txtDistrictOrCity.DataField
        Me.txtPinOrZipCode.SetFocus
    End If
    
End Sub

'private function returning true when the field - country name is valid, otherwise false
Private Function validateCountryName() As Boolean
    validateCountryName = True
    
    'check for mandatory field
    If Trim(Me.txtCountryName.Text) = "" Then
        utils.clearControls Me.txtCountryName, Me.txtStateName, Me.txtDistrictOrCity
        If intMode <> uiManager.QUERY_MODE Then
            Me.txtCountryName.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "Country Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
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
        utils.clearControls Me.txtStateName, Me.txtDistrictOrCity
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
    If Trim(Me.txtDistrictOrCity.Text) = "" Then
        utils.clearControls Me.txtDistrictOrCity
        If intMode <> uiManager.QUERY_MODE Then
            Me.txtDistrictOrCity.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "District or City Name", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            validateDistCityName = False
        End If
    End If
End Function

'private function returning true when the field - post office code is valid, otherwise false
Private Function validatePOCode() As Boolean
    validatePOCode = True
    
    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtPOCode.Text) = "" Then
        Me.txtPOCode.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Post Office Code", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validatePOCode = False
    End If
End Function

'private function returning true when the field - post office name is valid, otherwise false
Private Function validatePOName() As Boolean
    validatePOName = True
    
    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtPOName.Text) = "" Then
        Me.txtPOName.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Post Office Name", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validatePOName = False
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
    
    'validate event of last focused control is called
    Me.ValidateControls
    
    If Not validatePOCode Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf Not validatePOName Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf Not validateCountryName Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf Not validateStateName Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf Not validateDistCityName Then
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
    strSQL = "CDB..insUpdPostOffices '" & Trim(UCase(Me.txtPOCode.Text)) & "','" & _
                                          Replace(Trim(Me.txtPOName.Text), "'", "''") & "'," & _
                                          Me.txtDistrictOrCity.Tag & ",'" & _
                                          Trim(Me.txtPinOrZipCode.Text) & "','" & _
                                          Trim(Me.txtSTDCode.Text) & "','" & _
                                          Trim(Me.txtEffectiveFrom.Text) & "','" & _
                                          Trim(Me.txtEffectiveTill.Text) & "'," & _
                                          IIf(Me.txtID.Text = "", "NULL", Trim(Me.txtID.Text)) & "," & _
                                          IIf(varTxnTs = "", "NULL", varTxnTs)
    dbManager.beginTrans
    
    Select Case intMode
    
        Case uiManager.INSERT_MODE
            strSQL = strSQL & ", 0"     '0 - INSERT
            Dim rsPO As clsRecordHashMap
            Set rsPO = dbManager.executeSQLGetRS(strSQL)
            dbManager.commitTrans

            logger.logMessage "ObjectSaveMsg", "Post Office - '" & Trim(Me.txtPOName.Text) & "'|" & rsPO.getFieldValueByFieldIndex(0, 0), PLAIN_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            Me.clsWindowInterface_showForm uiManager.INSERT_MODE
            Me.txtPOCode.SetFocus
            
        Case uiManager.BROWSE_MODE
        
            strSQL = strSQL & ", 1"     '1 - UPDATE
            dbManager.executeSQL strSQL
            'dbManager.CommitTrans
            dbManager.commitTrans
            sprListPOController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, _
                                          Me.sprListPO.ActiveRow
            Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListPO.ActiveRow
            varTxnTs = sprListPOController.getTextOfCell(Me.sprListPO.ActiveRow, POColumns.txn_ts)
            logger.logMessage "SaveMsg", "", PLAIN_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            
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
    dbManager.executeSQL "CDB..delPostOffices " & Trim(Me.txtID.Text) & "," & varTxnTs
    dbManager.commitTrans
Exit Sub

errortag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireRemove", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "error occured while performing the delete query"
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
'the retrieval is done in the sprListPOController, so that is returned to the caller.
Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController
    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListPOController
End Function

'Implementation of the getSQLStringForRetrieval() function of the clsQueryInterface. This function
'returns the sql string which should be used by ADL to retrieve records in Retrieve mode.
'The query is build based upon the user entries in the different fields of the form.
Public Function clsQueryInterface_getSQLStringForRetrieval() As String
    
    Dim qryPostOffices As String
    
    qryPostOffices = "SELECT p.post_office_cd, p.post_office_nm, c.country_id, c.country_nm, s.state_id, s.state_nm, d.district_or_city_id, d.district_nm, p.pin_or_zip_code, " & _
                     "p.std_code, Cast(p.txn_ts AS BigInt), Convert(varchar, p.effective_from, 106)effective_from, Convert(varchar, p.effective_till, 106)effective_till, p.post_office_id " & _
                     "FROM post_offices p, countries c, states s, districts_or_cities d " & _
                     "WHERE p.district_or_city_id = d.district_or_city_id AND d.state_id = s.state_id AND s.country_id = c.country_id "
                 
    If Trim(Me.txtCountryName.Text) <> "" Then
        qryPostOffices = qryPostOffices & "AND c.country_nm LIKE '%" & Replace(Trim(Me.txtCountryName.Text), "'", "''") & "%' "
    End If

    If Trim(Me.txtDistrictOrCity.Text) <> "" Then
        qryPostOffices = qryPostOffices & "AND d.district_nm LIKE '%" & Replace(Trim(Me.txtDistrictOrCity.Text), "'", "''") & "%' "
    End If

    If Trim(Me.txtEffectiveFrom.Text) <> "" Then
        qryPostOffices = qryPostOffices & "AND p.effective_from = '" & Trim(Me.txtEffectiveFrom.Text) & "' "
    End If

    If Trim(Me.txtEffectiveTill.Text) <> "" Then
        qryPostOffices = qryPostOffices & "AND p.effective_till = '" & Trim(Me.txtEffectiveTill.Text) & "' "
    End If

    If Trim(Me.txtPinOrZipCode.Text) <> "" Then
        qryPostOffices = qryPostOffices & "AND p.pin_or_zip_code LIKE '%" & Trim(Me.txtPinOrZipCode.Text) & "%' "
    End If

    If Trim(Me.txtPOCode.Text) <> "" Then
        qryPostOffices = qryPostOffices & "AND p.post_office_cd LIKE '%" & Trim(Me.txtPOCode.Text) & "%' "
    End If

    If Trim(Me.txtPOName.Text) <> "" Then
        qryPostOffices = qryPostOffices & "AND p.post_office_nm LIKE '%" & Replace(Trim(Me.txtPOName.Text), "'", "''") & "%' "
    End If

    If Trim(Me.txtStateName.Text) <> "" Then
        qryPostOffices = qryPostOffices & "AND s.state_nm LIKE '%" & Replace(Trim(Me.txtStateName.Text), "'", "''") & "%' "
    End If

    If Trim(Me.txtSTDCode.Text) <> "" Then
        qryPostOffices = qryPostOffices & "AND p.std_code LIKE '%" & Trim(Me.txtSTDCode.Text) & "%' "
    End If

    If Trim(Me.txtID.Text) <> "" Then
        qryPostOffices = qryPostOffices & "AND p.post_office_id = " & Trim(Me.txtID.Text) & " "
    End If
    
    qryPostOffices = qryPostOffices & "ORDER BY c.country_id, s.state_id, d.district_or_city_id, post_office_id"
    
    clsQueryInterface_getSQLStringForRetrieval = qryPostOffices
    
End Function

'Implementation of the populateFieldsFromRetrievalSpread() method of the clsQueryInterface. All the fields are
'populated from the spread where the records are retrieved. Parameter p_lonrow states the row of the spread
'whose values are to be set in respective fields.
Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)

    Me.txtPOCode.Text = Trim(CStr(sprListPOController.getTextOfCell(p_lonRow, POColumns.POCode)))
    Me.txtPOName.Text = CStr(sprListPOController.getTextOfCell(p_lonRow, POColumns.POName))
    Me.txtCountryName.Tag = sprListPOController.getTextOfCell(p_lonRow, POColumns.countryID)
    Me.txtCountryName.Text = CStr(sprListPOController.getTextOfCell(p_lonRow, POColumns.countryName))
    Me.txtStateName.Tag = sprListPOController.getTextOfCell(p_lonRow, POColumns.stateID)
    Me.txtStateName.Text = CStr(sprListPOController.getTextOfCell(p_lonRow, POColumns.stateName))
    Me.txtDistrictOrCity.Tag = sprListPOController.getTextOfCell(p_lonRow, POColumns.distCityID)
    Me.txtDistrictOrCity.Text = CStr(sprListPOController.getTextOfCell(p_lonRow, POColumns.distCityName))
    Me.txtPinOrZipCode.Text = CStr(sprListPOController.getTextOfCell(p_lonRow, POColumns.pinZipCode))
    Me.txtSTDCode.Text = CStr(sprListPOController.getTextOfCell(p_lonRow, POColumns.STDCode))
    varTxnTs = sprListPOController.getTextOfCell(p_lonRow, POColumns.txn_ts)
    Me.txtEffectiveFrom.Text = Format(CDate(sprListPOController.getTextOfCell(p_lonRow, POColumns.effectivefrom)), "dd-mmm-yyyy")
    Me.txtEffectiveTill.Text = Format(CDate(sprListPOController.getTextOfCell(p_lonRow, POColumns.effectiveTill)), "dd-mmm-yyyy")
    Me.txtID.Text = sprListPOController.getTextOfCell(p_lonRow, POColumns.POID)
    
    Me.txtCountryName.DataField = Me.txtCountryName.Text
    Me.txtStateName.DataField = Me.txtStateName.Text
    Me.txtDistrictOrCity.DataField = Me.txtDistrictOrCity.Text
        
End Sub

Public Sub clsWindowInterface_fireClose()

End Sub

'Implementation of the fireErase() method of the clsWindowInterface. All the Controls and spreads of the form are
'cleared of any data. clearSpread() method of the spreadController is called for clearing the spreads.
Public Sub clsWindowInterface_fireErase()

    'clearing the controls
    utils.clearControls Me.txtCountryName, Me.txtDistrictOrCity, Me.txtID, _
                                  Me.txtPinOrZipCode, Me.txtPOCode, Me.txtPOName, _
                                  Me.txtStateName, Me.txtSTDCode
    
    'dates are cleared only in query mode, otherwise default or existing values are set
    Select Case intMode
        Case uiManager.QUERY_MODE
            Me.txtEffectiveFrom.Text = ""
            Me.txtEffectiveTill.Text = ""
        Case uiManager.INSERT_MODE
            Me.txtEffectiveFrom.Text = Format(Date, "dd-mmm-yyyy")
            Me.txtEffectiveTill.Text = "31-Dec-9999"
    End Select
    
    'clearing the spread
    If Not Me.sprListPO Is Nothing Then
        sprListPOController.clearSpread
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
    clsWindowInterface_getScreenID = "LOC_05"
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

    'initializing and adding columns to sprDistrictCityPostOfficesController of post offices
    Set sprListPOController = New clsSpreadController
    sprListPOController.registerSpreadInstance uiManager, Me.sprListPO, LIST_SPREAD, Me, , , SCROLLABLE
    sprListPOController.setHeaderHeight 600
    
    sprListPOController.addColumn "P.O.    Code", 10, STATIC_TEXT_CELL_TYPE, False, True
    sprListPOController.addColumn "Post Office Name", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListPOController.addColumn "Country ID", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListPOController.addColumn "Country Name", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListPOController.addColumn "State ID", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListPOController.addColumn "State Name", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListPOController.addColumn "Dist. / City ID", 8, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListPOController.addColumn "District / City Name", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListPOController.addColumn "Pin/Zip Code", 10, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListPOController.addColumn "STD Code", 10, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListPOController.addColumn "Txn Ts", 0, STATIC_TEXT_CELL_TYPE, False, True
    sprListPOController.addColumn "Effective From", 10, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListPOController.addColumn "Effective Till", 10, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListPOController.addColumn "P.O. ID", 6, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls()

    Select Case intMode
    
        Case uiManager.INSERT_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            sprListPOController.setSpreadMode intMode
            Me.fraPostOffice.ZOrder 0
            Me.txtPOCode.SetFocus
            
        Case uiManager.QUERY_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID
            sprListPOController.setSpreadMode intMode
            Me.fraPostOffice.ZOrder 0
            Me.txtID.SetFocus
            
        Case uiManager.RETRIEVE_MODE
        
            sprListPOController.setSpreadMode intMode
            Me.fraPostOffice.ZOrder 0
            
        Case uiManager.BROWSE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID
            sprListPOController.setSpreadMode intMode
            Me.fraPostOffice.ZOrder 0
            Me.txtPOCode.SetFocus
                        
        Case uiManager.LIST_MODE
        
            sprListPOController.setSpreadMode intMode
            Me.fraListPO.ZOrder 0
            
   End Select
   
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.lblCountryName, Me.lblDistrictOrCity, Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblId, Me.lblPinOrZipCode, Me.lblPostOfficeCode, Me.lblPostOfficeName, Me.lblStateName, Me.lblStdCode, _
                                                         Me.txtCountryName, Me.txtDistrictOrCity, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID, Me.txtPinOrZipCode, Me.txtPOCode, Me.txtPOName, Me.txtStateName, Me.txtSTDCode
    modControlsSettings.setStateToNormal Me.txtCountryName, Me.txtDistrictOrCity, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID, Me.txtPinOrZipCode, Me.txtPOCode, Me.txtPOName, Me.txtStateName, Me.txtSTDCode
    Me.txtCountryName.ButtonStyle = ButtonStylePopUp
    Me.txtStateName.ButtonStyle = ButtonStylePopUp
    Me.txtDistrictOrCity.ButtonStyle = ButtonStylePopUp
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookupForCountries() is the common place
'where the lookup on the country has been provided
Private Sub txtCountryName_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    modCDBLookUps.showLookUpForCountries Me, Me.txtCountryName, modMain.countries, Me.txtCountryName.Text, enmLookupSearchModes.absolute
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtCountryName_ButtonHit", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed during lookup"
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

Private Sub txtCountryName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call txtCountryName_ButtonHit(0, 0)
    End If
End Sub

Private Sub txtCountryName_Validate(Cancel As Boolean)
On Error GoTo errortag

    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup for country can be called when country is not empty in mode other than QUERY mode
    If (validateCountryName) Then
        'lookup called
        If (Me.txtCountryName.DataField <> Me.txtCountryName.Text) Then
            modCDBLookUps.showLookUpForCountries Me, Me.txtCountryName, modMain.countries, Me.txtCountryName.Text, enmLookupSearchModes.Logical
        End If
        'enforcing the control to hold a value selected from the lookup
        If (Me.txtCountryName.DataField <> Me.txtCountryName.Text) Then
            logger.logMessage modStandardMessages.NotExist, "Country Name - '" & Trim(Me.txtCountryName.Text) & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
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

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookupForCountries() is the common place
'where the lookup on the country has been provided
Private Sub txtDistrictOrCity_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    If Me.txtStateName.Text <> "" Then
        Dim additionalValues As New Collection
        additionalValues.Add Me.txtStateName.Tag, "state_id"
        additionalValues.Add Me.txtStateName.Text, "state_nm"
        additionalValues.Add Me.txtCountryName.Tag, "country_id"
        additionalValues.Add Me.txtCountryName.Text, "country_nm"
        modCDBLookUps.showLookUpForDistrictsOrCities Me, Me.txtDistrictOrCity, modMain.districtsOrCities, Me.txtDistrictOrCity.Text, enmLookupSearchModes.absolute, additionalValues
    'in query mode, when state is not specified, show all districts or cities
    ElseIf intMode = uiManager.QUERY_MODE Then
        modCDBLookUps.showLookUpForDistrictsOrCities Me, Me.txtDistrictOrCity, modMain.districtsOrCities, Me.txtDistrictOrCity.Text, enmLookupSearchModes.absolute
    Else
        Me.txtDistrictOrCity.Text = ""
        logger.logMessage modStandardMessages.ValueReqd, "State", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        Me.txtStateName.SetFocus
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtDistrictOrCity_ButtonHit", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed during lookup"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtDistrictOrCity_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please hit the button for Lookup Dialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtDistrictOrCity_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call txtDistrictOrCity_ButtonHit(0, 0)
    End If
End Sub

Private Sub txtDistrictOrCity_Validate(Cancel As Boolean)
On Error GoTo errortag

    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup for district or city can be called when it is not empty in mode other than QUERY mode
    If (validateDistCityName) Then
    
        'enforcing to fill state before calling lookup
        If (Me.txtStateName.Text = "") Then
            logger.logMessage modStandardMessages.ValueReqd, "State", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Cancel = True
            Me.txtDistrictOrCity.Text = ""
            Me.txtStateName.SetFocus
            Exit Sub
        End If
        
        'lookup called
        If (Me.txtDistrictOrCity.DataField <> Me.txtDistrictOrCity.Text) Then
            Dim additionalValues As New Collection
            additionalValues.Add Me.txtStateName.Tag, "state_id"
            additionalValues.Add Me.txtStateName.Text, "state_nm"
            additionalValues.Add Me.txtCountryName.Tag, "country_id"
            additionalValues.Add Me.txtCountryName.Text, "country_nm"
            modCDBLookUps.showLookUpForDistrictsOrCities Me, Me.txtDistrictOrCity, modMain.districtsOrCities, Me.txtDistrictOrCity.Text, enmLookupSearchModes.Logical, additionalValues
        End If
        
        'enforcing the control to hold a value selected from the lookup
        If (Me.txtDistrictOrCity.DataField <> Me.txtDistrictOrCity.Text) Then
            logger.logMessage modStandardMessages.InvalidValue, "District or City - '" & Trim(Me.txtDistrictOrCity.Text) & "'|State - '" & Trim(Me.txtStateName.Text) & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Me.txtDistrictOrCity.SelStart = 0
            Me.txtDistrictOrCity.SelLength = Len(Trim(Me.txtDistrictOrCity.Text))
            Me.txtDistrictOrCity.SetFocus
            Cancel = True
        End If
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtDistrictOrCity_Validate", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
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
            uiManager.setStatusText "Please enter Date greater than Effective From Date"
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

'The method sets the status text of the main screen
Private Sub txtPinOrZipCode_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtPOCode_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtPOCode_Validate(Cancel As Boolean)
    validatePOCode
End Sub

'The method sets the status text of the main screen
Private Sub txtPOName_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtPOName_Validate(Cancel As Boolean)
    validatePOName
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookupForCountries() is the common place
'where the lookup on the country has been provided
Private Sub txtStateName_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    If Me.txtCountryName.Text <> "" Then
        Dim additionalValues As New Collection
        additionalValues.Add Me.txtCountryName.Tag, "country_id"
        additionalValues.Add Me.txtCountryName.Text, "country_nm"
        modCDBLookUps.showLookUpForStates Me, Me.txtStateName, modMain.states, Me.txtStateName.Text, enmLookupSearchModes.absolute, additionalValues
    'in query mode, when the country is not specified, show all the states
    ElseIf intMode = uiManager.QUERY_MODE Then
        modCDBLookUps.showLookUpForStates Me, Me.txtStateName, modMain.states, Me.txtStateName.Text, enmLookupSearchModes.absolute
    Else
        Me.txtStateName.Text = ""
        logger.logMessage modStandardMessages.ValueReqd, "Country Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        Me.txtCountryName.SetFocus
    End If
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtStateName_ButtonHit", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtStateName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please hit the button for Lookup Dialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtStateName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call txtStateName_ButtonHit(0, 0)
    End If
End Sub

Private Sub txtStateName_Validate(Cancel As Boolean)
On Error GoTo errortag

    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup for state can be called when it is not empty in mode other than QUERY mode
    If (validateStateName) Then
        
        'enforcing to fill country before calling lookup
        If Me.txtCountryName.Text = "" Then
            logger.logMessage modStandardMessages.ValueReqd, "Country Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Cancel = True
            Me.txtStateName.Text = ""
            Me.txtCountryName.SetFocus
            Exit Sub
        End If
        
        'lookup called
        If (Me.txtStateName.DataField <> Me.txtStateName.Text) Then
            Dim additionalValues As New Collection
            additionalValues.Add Me.txtCountryName.Tag, "country_id"
            additionalValues.Add Me.txtCountryName.Text, "country_nm"
            modCDBLookUps.showLookUpForStates Me, Me.txtStateName, modMain.states, Me.txtStateName.Text, enmLookupSearchModes.Logical, additionalValues
        End If
        
        'enforcing the control to hold a value selected from the lookup
        If intMode <> uiManager.QUERY_MODE And (Me.txtStateName.DataField <> Me.txtStateName.Text) Then
            logger.logMessage modStandardMessages.InvalidValue, "State - '" & Trim(Me.txtStateName.Text) & "'|Country - '" & Trim(Me.txtCountryName.Text) & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Me.txtStateName.SelStart = 0
            Me.txtStateName.SelLength = Len(Trim(Me.txtStateName.Text))
            Me.txtStateName.SetFocus
            Cancel = True
        End If
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtStateName_Validate", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtSTDCode_GotFocus()
    uiManager.setStatusText ""
End Sub
