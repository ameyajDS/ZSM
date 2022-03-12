VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "Edt32x30.ocx"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.ocx"
Begin VB.Form frmRepresentatives 
   BackColor       =   &H00C0C0C0&
   Caption         =   "REPRESENTATIVES"
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
   Begin VB.Frame fraRepresentative 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   9135
      Left            =   0
      TabIndex        =   45
      Top             =   0
      Width           =   14655
      Begin EditLib.fpLongInteger txtID 
         Height          =   345
         Left            =   690
         TabIndex        =   1
         Top             =   360
         Width           =   735
         _Version        =   196608
         _ExtentX        =   1296
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
      Begin EditLib.fpText txtLastName 
         Height          =   345
         Left            =   8250
         TabIndex        =   9
         Top             =   1095
         Width           =   2805
         _Version        =   196608
         _ExtentX        =   4939
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
         AutoBeep        =   -1  'True
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
         CharValidationText=   "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'"
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
      Begin EditLib.fpDateTime txtBirthDateTime 
         Height          =   345
         Left            =   2250
         TabIndex        =   13
         Top             =   1845
         Width           =   2145
         _Version        =   196608
         _ExtentX        =   3784
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
         UserDefinedFormat=   "dd MMM yyyy hh:nn"
         DateMax         =   "00000000"
         DateMin         =   "00000000"
         TimeMax         =   "000000"
         TimeMin         =   "000000"
         TimeString1159  =   ""
         TimeString2359  =   ""
         DateDefault     =   "00000000"
         TimeDefault     =   "000000"
         TimeStyle       =   2
         BorderGrayAreaColor=   -2147483637
         ThreeDOnFocusInvert=   0   'False
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   0
         BorderDropShadowColor=   -2147483632
         BorderDropShadowWidth=   3
         PopUpType       =   0
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
      Begin EditLib.fpText txtAddressLine2 
         Height          =   345
         Left            =   690
         TabIndex        =   18
         Top             =   3705
         Width           =   5685
         _Version        =   196608
         _ExtentX        =   10028
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
         MaxLength       =   50
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
      Begin EditLib.fpText txtTerritory 
         Height          =   345
         Left            =   690
         TabIndex        =   15
         Top             =   2580
         Width           =   5730
         _Version        =   196608
         _ExtentX        =   10107
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
         MaxLength       =   100
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
      Begin EditLib.fpText txtAddressLine1 
         Height          =   345
         Left            =   690
         TabIndex        =   17
         Top             =   3315
         Width           =   5685
         _Version        =   196608
         _ExtentX        =   10028
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
         MaxLength       =   50
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
      Begin EditLib.fpText txtMiddleName 
         Height          =   345
         Left            =   5250
         TabIndex        =   7
         Top             =   1095
         Width           =   2805
         _Version        =   196608
         _ExtentX        =   4939
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
         AutoBeep        =   -1  'True
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
         CharValidationText=   "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'"
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
      Begin EditLib.fpText txtEmail 
         Height          =   345
         Left            =   690
         TabIndex        =   28
         Top             =   5925
         Width           =   5685
         _Version        =   196608
         _ExtentX        =   10028
         _ExtentY        =   609
         Enabled         =   -1  'True
         MousePointer    =   0
         Object.TabStop         =   -1  'True
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
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
         MaxLength       =   50
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
      Begin EditLib.fpText txtFirstName 
         Height          =   345
         Left            =   2250
         TabIndex        =   5
         Top             =   1095
         Width           =   2805
         _Version        =   196608
         _ExtentX        =   4939
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
         AutoBeep        =   -1  'True
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
         CharValidationText=   "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'"
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
      Begin EditLib.fpText txtCellNo 
         Height          =   345
         Left            =   6870
         TabIndex        =   30
         Top             =   2580
         Width           =   1905
         _Version        =   196608
         _ExtentX        =   3351
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
         CharValidationText=   "1234567890()- ,ppPPextEXT"
         MaxLength       =   50
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
      Begin EditLib.fpText txtDistrictOrCity 
         Height          =   345
         Left            =   690
         TabIndex        =   24
         Top             =   5175
         Width           =   2775
         _Version        =   196608
         _ExtentX        =   4895
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
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   345
         Left            =   9030
         TabIndex        =   42
         Top             =   5925
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
      Begin EditLib.fpDateTime txtEffectiveFrom 
         Height          =   345
         Left            =   6930
         TabIndex        =   40
         Top             =   5925
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
      Begin EditLib.fpText txtCountryName 
         Height          =   345
         Left            =   690
         TabIndex        =   20
         Top             =   4440
         Width           =   2775
         _Version        =   196608
         _ExtentX        =   4895
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
      Begin VB.ComboBox cmbTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   360
         Left            =   690
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   1095
         Width           =   1425
      End
      Begin VB.Frame fraTelephone 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Telephone"
         ForeColor       =   &H00800000&
         Height          =   1095
         Left            =   6840
         TabIndex        =   47
         Top             =   3075
         Width           =   4215
         Begin EditLib.fpText txtOfficePhoneNo 
            Height          =   345
            Left            =   120
            TabIndex        =   32
            Top             =   600
            Width           =   1900
            _Version        =   196608
            _ExtentX        =   3351
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
            CharValidationText=   "1234567890()- ,ppPPextEXT"
            MaxLength       =   50
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
         Begin EditLib.fpText txtResPhoneNo 
            Height          =   345
            Left            =   2190
            TabIndex        =   34
            Top             =   600
            Width           =   1905
            _Version        =   196608
            _ExtentX        =   3351
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
            CharValidationText=   "1234567890()- ,ppPPextEXT"
            MaxLength       =   50
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
         Begin VB.Label lblResPhoneNo 
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "Residence Phone No."
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   2190
            TabIndex        =   33
            Top             =   360
            Width           =   1890
         End
         Begin VB.Label lblOfficePhoneNo 
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "Office Phone No. "
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   120
            TabIndex        =   31
            Top             =   360
            Width           =   1530
         End
      End
      Begin VB.Frame fraFaxLines 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Fax  Lines"
         ForeColor       =   &H00800000&
         Height          =   1095
         Left            =   6840
         TabIndex        =   46
         Top             =   4320
         Width           =   4215
         Begin EditLib.fpText txtOfficeFaxNo 
            Height          =   350
            Left            =   120
            TabIndex        =   36
            Top             =   600
            Width           =   1900
            _Version        =   196608
            _ExtentX        =   3351
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
            CharValidationText=   "1234567890()- ,ppPPextEXT"
            MaxLength       =   50
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
         Begin EditLib.fpText txtResFaxNo 
            Height          =   345
            Left            =   2190
            TabIndex        =   38
            Top             =   600
            Width           =   1905
            _Version        =   196608
            _ExtentX        =   3351
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
            CharValidationText=   "1234567890()- ,ppPPextEXT"
            MaxLength       =   50
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
         Begin VB.Label lblResFaxNo 
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "Residence Fax No. "
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   2190
            TabIndex        =   37
            Top             =   360
            Width           =   1725
         End
         Begin VB.Label lblOfficeFaxNo 
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "Office Fax No. "
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   120
            TabIndex        =   35
            Top             =   360
            Width           =   1305
         End
      End
      Begin VB.ComboBox cmbGender 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   360
         Left            =   690
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   1845
         Width           =   1410
      End
      Begin EditLib.fpText txtStateName 
         Height          =   345
         Left            =   3600
         TabIndex        =   22
         Top             =   4440
         Width           =   2775
         _Version        =   196608
         _ExtentX        =   4895
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
      Begin EditLib.fpLongInteger txtPinOrZip 
         Height          =   345
         Left            =   3600
         TabIndex        =   26
         Top             =   5175
         Width           =   930
         _Version        =   196608
         _ExtentX        =   1640
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
         NullColor       =   12632256
         OnFocusAlignH   =   0
         OnFocusAlignV   =   0
         OnFocusNoSelect =   0   'False
         OnFocusPosition =   0
         ControlType     =   0
         Text            =   ""
         MaxValue        =   "999999"
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
      Begin VB.Label lblPinOrZipcode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Pin Or Zip Code "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3600
         TabIndex        =   25
         Top             =   4935
         Width           =   1440
      End
      Begin VB.Label lblStateId 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "State "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3600
         TabIndex        =   21
         Top             =   4200
         Width           =   525
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00E0E0E0&
         BorderStyle     =   6  'Inside Solid
         DrawMode        =   16  'Merge Pen
         X1              =   6600
         X2              =   6600
         Y1              =   2370
         Y2              =   6300
      End
      Begin VB.Label lblFirstName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "First Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   2250
         TabIndex        =   4
         Top             =   855
         Width           =   1020
      End
      Begin VB.Label lblTerritory 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Territory "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   690
         TabIndex        =   14
         Top             =   2340
         Width           =   765
      End
      Begin VB.Label lblAddressline1 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Address "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   690
         TabIndex        =   16
         Top             =   3075
         Width           =   780
      End
      Begin VB.Label lblCellNo 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Cell Phone No. "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6870
         TabIndex        =   29
         Top             =   2340
         Width           =   1365
      End
      Begin VB.Label lblEffectiveFrom 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6930
         TabIndex        =   39
         Top             =   5685
         Width           =   1290
      End
      Begin VB.Label lblEffectiveTill 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   9030
         TabIndex        =   41
         Top             =   5685
         Width           =   1080
      End
      Begin VB.Label lblDistrictOrCity 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "District Or City "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   690
         TabIndex        =   23
         Top             =   4935
         Width           =   1350
      End
      Begin VB.Label lblCountryName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Country"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   690
         TabIndex        =   19
         Top             =   4200
         Width           =   675
      End
      Begin VB.Label lblId 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ID"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   690
         TabIndex        =   0
         Top             =   120
         Width           =   180
      End
      Begin VB.Label lblTitle 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Title"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   690
         TabIndex        =   2
         Top             =   855
         Width           =   360
      End
      Begin VB.Label lblEmailAddress 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Email Address(es)"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   690
         TabIndex        =   27
         Top             =   5685
         Width           =   1605
      End
      Begin VB.Label lblMiddleName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Middle Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5250
         TabIndex        =   6
         Top             =   855
         Width           =   1200
      End
      Begin VB.Label lblBirthDateTime 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Date of Birth"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   2250
         TabIndex        =   12
         Top             =   1605
         Width           =   1080
      End
      Begin VB.Label lblGender 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Gender "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   690
         TabIndex        =   10
         Top             =   1605
         Width           =   660
      End
      Begin VB.Label lbLastName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Last Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   8250
         TabIndex        =   8
         Top             =   855
         Width           =   1125
      End
   End
   Begin VB.Frame fraListRepresentatives 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   8415
      Left            =   0
      TabIndex        =   43
      Top             =   0
      Width           =   14175
      Begin FPSpread.vaSpread sprListRepresentatives 
         Height          =   6435
         Left            =   120
         TabIndex        =   44
         TabStop         =   0   'False
         Tag             =   "Representatives List Spread"
         Top             =   120
         Width           =   11745
         _Version        =   393216
         _ExtentX        =   20717
         _ExtentY        =   11351
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
         SpreadDesigner  =   "frmRepresentatives.frx":0000
      End
   End
End
Attribute VB_Name = "frmRepresentatives"
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

'This variable holds the value of the personID. Whenever a value is selected from the database and shown in
'the person text field, this variable is set to hold the corresponding ID.
Dim intPersonID As Long

'stores the value of txn_ts. the variable is filled in populateFieldsFromRetrievalSpread method of the
'clsQueryInterface
Dim varTxnTs As Variant

'stores the value of txn_ts from person table
Dim varPerTxnTs As Variant

'The declaration of spread controller for retrieving the records from the representatives table. This
'spread controller is also used to show the records in list mode. This object variable is defined "withEvents"
'because this code module needs to catch the events thrown by this controller (like 'validateCell',
''validateRow' etc)
Dim sprListRepresentativesController As clsSpreadController

'This enum holds all the column numbers of the spread controller 'sprListRepresentativesController' that
'shows all the records of representatives. The column numbers are stored into variables named corresponding
'to column names. These are called in functions of spreadController like 'getTextOfCell' or 'setTextOfCell'
'which requires row number and column number.
Private Enum reprColumns
    personID = 1
    Title = 2
    firstName = 3
    middleName = 4
    lastName = 5
    gender = 6
    birthDate = 7
    EmailAdd = 8
    perTxn_ts = 9
    Territory = 10
    Address1 = 11
    Address2 = 12
    countryID = 13
    countryName = 14
    stateID = 15
    stateName = 16
    distCityID = 17
    distCityName = 18
    pinZipCode = 19
    cellPhone = 20
    offPhone = 21
    resPhone = 22
    offFax = 23
    resFax = 24
    txn_ts = 25
    effectivefrom = 26
    effectiveTill = 27
    reprID = 28
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
        'country id & name is set as multipart text
        p_colAdditionalValues.Add Me.txtCountryName.Tag, "country_id"
        p_colAdditionalValues.Add Me.txtCountryName.Text, "country_nm"
    End If
    
    If p_objActiveControl Is Me.txtDistrictOrCity Then
        Set p_objCallForm = modMain.districtsOrCities
        p_strDisplayText = Me.txtDistrictOrCity.Text
        p_strIDText = Me.txtDistrictOrCity.Tag
        'state id & name, country id & name is set as multipart text
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
        Me.txtPinOrZip.SetFocus
    End If

End Sub

'private function returning true when the field - gender is valid, otherwise false
Private Function validateGender() As Boolean
    validateGender = True
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.cmbGender) = "") Then
        Me.cmbGender.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Gender", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateGender = False
    End If
    If Trim(Me.cmbGender.Text) <> "" And Trim(Me.cmbTitle.Text) <> "" Then
        If (Trim(Me.cmbTitle.Text) = "Ms." Or Trim(Me.cmbTitle.Text) = "Dr. (Ms.)" Or Trim(Me.cmbTitle.Text) = "Late Ms." Or Trim(Me.cmbTitle.Text) = "Miss." Or Trim(Me.cmbTitle.Text) = "Mrs.") Then
            If Trim(Me.cmbGender.Text) = "Male" Then
                logger.logMessage modStandardMessages.InvalidValue, "Gender - " & Trim(Me.cmbGender.Text) & "|Title - " & Trim(Me.cmbTitle.Text), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
                Me.cmbGender.SetFocus
                validateGender = False
            End If
        Else
            If (Trim(Me.cmbTitle.Text) = "Mr." Or Trim(Me.cmbTitle.Text) = "Dr." Or Trim(Me.cmbTitle.Text) = "Late Mr.") Then
                If Trim(Me.cmbGender.Text) = "Female" Then
                    logger.logMessage modStandardMessages.InvalidValue, "Gender - " & Trim(Me.cmbGender.Text) & "|Title - " & Trim(Me.cmbTitle.Text), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
                    Me.cmbGender.SetFocus
                    validateGender = False
                End If
            End If
        End If
    End If
End Function

'private function returning true when the field - territory is valid, otherwise false
Private Function validateTerritory() As Boolean
    validateTerritory = True
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtTerritory.Text) = "") Then
        Me.txtTerritory.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Territory", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateTerritory = False
    End If
End Function

'private function returning true when the field - address is valid, otherwise false
Private Function validateAddress() As Boolean
    validateAddress = True
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtAddressLine1.Text) = "") Then
        Me.txtAddressLine1.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Address", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateAddress = False
    End If
End Function

'private function returning true when the field - country name is valid, otherwise false
Private Function validateCountryName() As Boolean
    validateCountryName = True
    'check for mandatory field
    If Trim(Me.txtCountryName.Text) = "" Then
        utils.clearControls Me.txtCountryName, Me.txtStateName, Me.txtDistrictOrCity
        If (intMode <> uiManager.QUERY_MODE) Then
            Me.txtCountryName.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "Country Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
            validateCountryName = False
        End If
    End If
End Function

'private function returning true when the field - state name is valid, otherwise false
Private Function validateStateName() As Boolean
    validateStateName = True
    'check for mandatory field
    If Trim(Me.txtStateName.Text) = "" Then
        utils.clearControls Me.txtStateName, Me.txtDistrictOrCity
        If (intMode <> uiManager.QUERY_MODE) Then
            Me.txtStateName.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "State Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
            validateStateName = False
        End If
    End If
End Function

'private function returning true when the field - district_or_city name is valid, otherwise false
Private Function validateDistCityName() As Boolean
    validateDistCityName = True
    'check for mandatory field
    If Trim(Me.txtDistrictOrCity.Text) = "" Then
        utils.clearControls Me.txtDistrictOrCity
        If (intMode <> uiManager.QUERY_MODE) Then
            Me.txtDistrictOrCity.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "District Or City Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
            validateDistCityName = False
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

'private function returning true when the field - title is valid, otherwise false
Private Function validateTitle() As Boolean
    validateTitle = True
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.cmbTitle) = "") Then
        Me.cmbTitle.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Title", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateTitle = False
    End If
End Function

'private function returning true when the field - first name is valid, otherwise false
Private Function validateFirstName() As Boolean
    validateFirstName = True
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtFirstName.Text) = "") Then
        Me.txtFirstName.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "First Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateFirstName = False
    End If
End Function

'private function returning true when the field - last name is valid, otherwise false
Private Function validateLastName() As Boolean
    validateLastName = True
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtLastName.Text) = "") Then
        Me.txtLastName.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Last Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateLastName = False
    End If
End Function

'private function returning true when the field - age is valid, otherwise false
Private Function validateBirthDate() As Boolean
    validateBirthDate = True
    'check for mandatory field
    If intMode = uiManager.QUERY_MODE Then
        Exit Function
    End If
    
    If Trim(Me.txtBirthDateTime.Text) = "" Then
        Me.txtBirthDateTime.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Date Of Birth", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateBirthDate = False
    ElseIf DateDiff("d", Me.txtBirthDateTime.Text, Date) < 0 Then
        utils.selectText Me.txtBirthDateTime
        logger.logMessage modStandardMessages.LesserOrEqualValueReqd, "Date Of Birth|Current Date - " & Format(Date, "dd MMM yyyy"), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateBirthDate = False
    ElseIf Len(Trim(Me.txtBirthDateTime.Text)) < 11 Then
        utils.selectText Me.txtBirthDateTime
        logger.logMessage modStandardMessages.InvalidValue, Trim(Me.txtBirthDateTime.Text) & "|Birth Date", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateBirthDate = False
    ElseIf DateDiff("d", Trim(Me.txtBirthDateTime.Text), "01 Jan 1900") > 0 Then
        logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Birth Date|01 Jan 1900", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateBirthDate = False
    End If
    
End Function

'Implementation of isReadyToSave method of clsEditInterface. No invalid data should enter into database.
'Thus before saving record, certain checks are carried out in this function. If all the checks are cleared
'then the function returns boolean value 'True' otherwise returns boolean value 'False' and a descriptive
'error or warning message is generated.
Public Function clsEditInterface_isReadyToSave() As Boolean

    clsEditInterface_isReadyToSave = True
    
    'validate event of last focused control is called before save
    Me.ValidateControls
    
    If (Not validateTitle) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateFirstName) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateLastName) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateGender) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateBirthDate) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateTerritory) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateAddress) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateCountryName) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateStateName) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateDistCityName) Then
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

'Implementation of the fireSave() method of the clsEditInterface. Here the form is saved by creating parameters
'that are passed to the dbManager's ExecuteBatch() method. The form can be saved when it is in either insert or
'new or browse or update mode. But before saving the form, the private boolean function isReadyToSave() is called
'to check if the form is ready for saving.
Public Sub clsEditInterface_fireSave()
On Error GoTo errortag

    Me.txtAddressLine1.Text = IIf(Right(Trim(Me.txtAddressLine1.Text), 1) = ",", Left(Trim(Me.txtAddressLine1.Text), Len(Trim(Me.txtAddressLine1.Text)) - 1), Trim(Me.txtAddressLine1.Text))
    If Me.txtAddressLine2.Text <> "" Then
        Me.txtAddressLine2.Text = IIf(Right(Trim(Me.txtAddressLine2.Text), 1) = ",", Left(Trim(Me.txtAddressLine2.Text), Len(Trim(Me.txtAddressLine2.Text)) - 1), Trim(Me.txtAddressLine2.Text))
    End If


    Dim strSQL As String
    strSQL = "CDB..insUpdRepresentatives '" & Trim(Me.cmbTitle) & "','" & _
                                         Replace(Trim(Me.txtFirstName.Text), "'", "''") & "','" & _
                                         Replace(Trim(Me.txtMiddleName.Text), "'", "''") & "','" & _
                                         Replace(Trim(Me.txtLastName.Text), "'", "''") & "','" & _
                                         Trim(Me.cmbGender) & "','" & _
                                         Trim(Me.txtBirthDateTime.Text) & "','" & _
                                         Replace(Trim(Me.txtEmail.Text), "'", "''") & "','" & _
                                         Replace(Trim(Me.txtTerritory.Text), "'", "''") & "','" & _
                                         Replace(Trim(Me.txtAddressLine1.Text), "'", "''") & "','" & _
                                         Replace(Trim(Me.txtAddressLine2.Text), "'", "''") & "','" & _
                                         Me.txtDistrictOrCity.Tag & "','" & _
                                         Trim(Me.txtPinOrZip.Text) & "','" & _
                                         Trim(Me.txtCellNo.Text) & "','" & _
                                         Trim(Me.txtOfficePhoneNo.Text) & "','" & _
                                         Trim(Me.txtResPhoneNo.Text) & "','" & _
                                         Trim(Me.txtOfficeFaxNo.Text) & "','" & _
                                         Trim(Me.txtResFaxNo.Text) & "','" & _
                                         Trim(Me.txtEffectiveFrom.Text) & "','" & _
                                         Trim(Me.txtEffectiveTill.Text) & "'," & _
                                         IIf(varTxnTs = "", "NULL", varTxnTs) & "," & _
                                         IIf(varPerTxnTs = "", "NULL", varPerTxnTs) & ",'" & _
                                         uiManager.ApplicationContext.ARG_PACKAGE_ID & "','" & _
                                         Me.clsWindowInterface_getScreenID & "'," & _
                                         IIf(intPersonID = 0, "NULL", intPersonID) & "," & _
                                         IIf(Me.txtID.Text = "", "NULL", Trim(Me.txtID.Text))
    dbManager.beginTrans
    
    Select Case intMode
    
        Case uiManager.INSERT_MODE
        
            strSQL = strSQL & ",0"      '0 - INSERT
            Dim rsRepresentatives As clsRecordHashMap
            Set rsRepresentatives = dbManager.executeSQLGetRS(strSQL)
            dbManager.commitTrans
            
            logger.logMessage modStandardMessages.ObjectSaveMsg, "Representative - '" & Trim(Me.txtFirstName.Text) & " " & Trim(Me.txtMiddleName.Text) & " " & Trim(Me.txtLastName.Text) & "'|" & rsRepresentatives.getFieldValueByFieldIndex(0, 0), PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            'the screen has to get cleared of any data and get ready to insert more data
            Me.clsWindowInterface_showForm uiManager.INSERT_MODE
            Me.cmbTitle.SetFocus
            
        Case uiManager.BROWSE_MODE
            
            strSQL = strSQL & ",1"      '1 - UPDATE
            dbManager.executeSQL strSQL
            dbManager.commitTrans
            sprListRepresentativesController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, _
                                                       Me.sprListRepresentatives.ActiveRow
            Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListRepresentatives.ActiveRow
            varTxnTs = sprListRepresentativesController.getTextOfCell(Me.sprListRepresentatives.ActiveRow, reprColumns.txn_ts)
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
    dbManager.executeSQL "CDB..delRepresentatives " & Trim(Me.txtID.Text) & "," & varTxnTs
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
'the retrieval is done in the "sprListRepresentativesController", so that is returned to the caller.
Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController
    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListRepresentativesController
End Function

'Implementation of the getSQLStringForRetrieval() function of the clsQueryInterface. This function
'returns the sql string which should be used by ADL to retrieve records in Retrieve mode.
'The query is build based upon the user entries in the different fields of the form.
Public Function clsQueryInterface_getSQLStringForRetrieval() As String

    Dim qryRepresentatives As String

    qryRepresentatives = "SELECT p.person_id, p.title, p.first_nm, p.middle_nm, p.last_nm, p.gender, left(Convert(varchar, p.birth_dtm,113),17)birth_dtm, p.email_addresses, Cast(p.txn_ts As BigInt), "
    qryRepresentatives = qryRepresentatives & "r.territory, r.address_line_1, r.address_line_2, c.country_id, c.country_nm, s.state_id, s.state_nm, d.district_or_city_id, d.district_nm, "
    qryRepresentatives = qryRepresentatives & "r.pin_or_zip_code, p.contact_information, r.telephones_office, r.telephones_residence, r.fax_lines_office, "
    qryRepresentatives = qryRepresentatives & "r.fax_lines_residence, Cast(r.txn_ts As BigInt), Convert(varchar, r.effective_from, 106)effective_from, Convert(varchar, r.effective_till, 106)effective_till, r.representative_id "
    qryRepresentatives = qryRepresentatives & "FROM persons p, representatives r, countries c, states s, districts_or_cities d "
    qryRepresentatives = qryRepresentatives & "WHERE p.person_id = r.person_id AND s.country_id = c.country_id AND d.state_id = s.state_id "
    qryRepresentatives = qryRepresentatives & "AND r.district_or_city_id = d.district_or_city_id "
                                
    If Trim(Me.txtAddressLine1.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.address_line_1 LIKE '%" & Replace(Trim(Me.txtAddressLine1.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.txtAddressLine2.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.address_line_2 LIKE '%" & Replace(Trim(Me.txtAddressLine2.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.txtBirthDateTime.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND p.birth_dtm = '" & Trim(Me.txtBirthDateTime.Text) & "' "
    End If
    
    If Trim(Me.txtCellNo.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.cell_phone_no LIKE '%" & Trim(Me.txtCellNo.Text) & "%' "
    End If
    
    If Trim(Me.txtCountryName.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND c.country_nm LIKE '%" & Replace(Trim(Me.txtCountryName.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.txtDistrictOrCity.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND d.district_nm LIKE '%" & Replace(Trim(Me.txtDistrictOrCity.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.txtEffectiveFrom.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.effective_from = '" & Trim(Me.txtEffectiveFrom.Text) & "' "
    End If
    
    If Trim(Me.txtEffectiveTill.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.effective_till = '" & Trim(Me.txtEffectiveTill.Text) & "' "
    End If
    
    If Trim(Me.txtEmail.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND p.email_addresses LIKE '%" & Replace(Trim(Me.txtEmail.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.txtFirstName.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND p.first_nm LIKE '%" & Replace(Trim(Me.txtFirstName.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.txtID.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.representative_id = " & Trim(Me.txtID.Text) & " "
    End If
    
    If Trim(Me.txtLastName.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND p.last_nm LIKE '%" & Replace(Trim(Me.txtLastName.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.txtMiddleName.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND p.middle_nm LIKE '%" & Replace(Trim(Me.txtMiddleName.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.txtOfficeFaxNo.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.fax_lines_office LIKE '%" & Trim(Me.txtOfficeFaxNo.Text) & "%' "
    End If
    
    If Trim(Me.txtOfficePhoneNo.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.telephones_office LIKE '%" & Trim(Me.txtOfficePhoneNo.Text) & "%' "
    End If
    
    If Trim(Me.txtPinOrZip.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.pin_or_zip_code LIKE '%" & Trim(Me.txtPinOrZip.Text) & "%' "
    End If
    
    If Trim(Me.txtResFaxNo.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.fax_lines_residence LIKE '%" & Trim(Me.txtResFaxNo.Text) & "%' "
    End If
    
    If Trim(Me.txtResPhoneNo.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.telephones_residence LIKE '%" & Trim(Me.txtResPhoneNo.Text) & "%' "
    End If
    
    If Trim(Me.txtStateName.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND s.state_nm LIKE '%" & Replace(Trim(Me.txtStateName.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.txtTerritory.Text) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND r.territory LIKE '%" & Replace(Trim(Me.txtTerritory.Text), "'", "''") & "%' "
    End If
    
    If Trim(Me.cmbGender) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND p.gender LIKE '%" & Trim(Me.cmbGender) & "%' "
    End If
    
    If Trim(Me.cmbTitle) <> "" Then
        qryRepresentatives = qryRepresentatives & "AND p.title LIKE '%" & Replace(Trim(Me.cmbTitle), "'", "''") & "%' "
    End If
                            
    qryRepresentatives = qryRepresentatives & "ORDER BY representative_id"
    
    clsQueryInterface_getSQLStringForRetrieval = qryRepresentatives
    
End Function

'Implementation of the populateFieldsFromRetrievalSpread() method of the clsQueryInterface. All the fields are
'populated from the spread where the records are retrieved. Parameter p_lonrow states the row of the spread
'whose values are to be set in respective fields.
Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)
    
    intPersonID = sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.personID)
    Me.txtID.Text = sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.reprID)
    
    Me.cmbTitle = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.Title))
    Me.txtFirstName.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.firstName))
    Me.txtMiddleName.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.middleName))
    Me.txtLastName.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.lastName))
    Me.cmbGender = Trim(CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.gender)))
    Me.txtBirthDateTime.Text = Format(CDate(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.birthDate)), "dd-mmm-yyyy hh:nn")
    Me.txtEmail.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.EmailAdd))
    Me.txtTerritory.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.Territory))
    Me.txtAddressLine1.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.Address1))
    Me.txtAddressLine2.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.Address2))
    
    Me.txtCountryName.Tag = sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.countryID)
    Me.txtCountryName.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.countryName))
    Me.txtCountryName.DataField = Me.txtCountryName.Text
    Me.txtStateName.Tag = sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.stateID)
    Me.txtStateName.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.stateName))
    Me.txtStateName.DataField = Me.txtStateName.Text
    Me.txtDistrictOrCity.Tag = sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.distCityID)
    Me.txtDistrictOrCity.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.distCityName))
    Me.txtDistrictOrCity.DataField = Me.txtDistrictOrCity.Text
    Me.txtPinOrZip.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.pinZipCode))
    
    Me.txtCellNo.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.cellPhone))
    Me.txtOfficePhoneNo.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.offPhone))
    Me.txtResPhoneNo.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.resPhone))
    Me.txtOfficeFaxNo.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.offFax))
    Me.txtResFaxNo.Text = CStr(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.resFax))
    
    varTxnTs = sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.txn_ts)
    varPerTxnTs = sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.perTxn_ts)
    Me.txtEffectiveFrom.Text = Format(CDate(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.effectivefrom)), "dd-mmm-yyyy")
    Me.txtEffectiveTill.Text = Format(CDate(sprListRepresentativesController.getTextOfCell(p_lonRow, reprColumns.effectiveTill)), "dd-mmm-yyyy")
    
End Sub

Public Sub clsWindowInterface_fireClose()

End Sub

'Implementation of the fireErase() method of the clsWindowInterface. All the Controls and spreads of the form are
'cleared of any data. clearSpread() method of the spreadController is called for clearing the spreads.
Public Sub clsWindowInterface_fireErase()

    utils.clearControls Me.txtAddressLine1, Me.txtAddressLine2, _
                                  Me.txtCellNo, Me.txtCountryName, Me.txtDistrictOrCity, _
                                  Me.txtEmail, Me.txtFirstName, Me.txtID, Me.txtLastName, _
                                  Me.txtMiddleName, Me.txtOfficeFaxNo, Me.txtOfficePhoneNo, _
                                  Me.txtPinOrZip, Me.txtResFaxNo, Me.txtResPhoneNo, _
                                  Me.txtStateName, Me.txtTerritory
    
    Select Case intMode
        Case uiManager.QUERY_MODE
            Me.txtEffectiveFrom.Text = ""
            Me.txtEffectiveTill.Text = ""
            Me.txtBirthDateTime.Text = ""
        Case uiManager.INSERT_MODE
            Me.txtEffectiveFrom.Text = Format(Date, "dd-mmm-yyyy")
            Me.txtEffectiveTill.Text = "31-Dec-9999"
            Me.txtBirthDateTime.Text = ""
    End Select
    
    'to clear and load the default values in the Title and Gender comboBox
    clearLoadDropdowns
    
    If Not Me.sprListRepresentatives Is Nothing Then
        sprListRepresentativesController.setSpreadMode intMode
    End If
    
End Sub

'This is a private method to this code module. It first clears and then loads values into Title and Gender
'comboBox from their respective tables.
Private Sub clearLoadDropdowns()
On Error GoTo errortag
    'The comboBox are cleared first because this method is called in showForm() method of clsWindowInterface.
    'The latter method is called each time the form gets loaded or switches to different modes. Hence if the
    'comboboxes are not cleared first then the values will go on adding and adding to them.
    Me.cmbGender.Clear
    Me.cmbTitle.Clear

    Dim rsGetTitle As clsRecordHashMap
    Dim intLoop As Long
    
    dbManager.beginTrans
    Set rsGetTitle = dbManager.executeSQLGetRS("SELECT person_title FROM person_titles")
    For intLoop = 0 To (rsGetTitle.getNoOfRecords - 1)
        Me.cmbTitle.AddItem rsGetTitle.getFieldValueByFieldIndex(intLoop, 0)
    Next intLoop
    dbManager.commitTrans
    
    'There is no table for Gender, so hard code values (as under) are added to Gender ComboBox.
    Me.cmbGender.AddItem "Male"
    Me.cmbGender.AddItem "Female"
    
Exit Sub

errortag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clearDropDowns", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
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
    clsWindowInterface_getScreenID = "PER_01"
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
        'to clear and load the Title and Gender comboBox.
        clearLoadDropdowns
    End If
    
    Me.Visible = True
    Me.ZOrder 0
    setEnableDisableControls
    intPersonID = 0
        
End Sub

'This is a private method to this code module. Here spread controllers are initialized and columns are
'added to them for all the respective spreads in this form.
Private Sub setSpreadController()

    'initializing and adding columns to sprListRepresentativesController of representatives

    Set sprListRepresentativesController = New clsSpreadController
    sprListRepresentativesController.registerSpreadInstance uiManager, Me.sprListRepresentatives, LIST_SPREAD, Me, , , SCROLLABLE
    sprListRepresentativesController.setHeaderHeight 600
    
    sprListRepresentativesController.addColumn "Person ID", 7, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListRepresentativesController.addColumn "Title", 10, STATIC_TEXT_CELL_TYPE, False, True
    sprListRepresentativesController.addColumn "First Name", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListRepresentativesController.addColumn "Middle Name", 30, STATIC_TEXT_CELL_TYPE, False, False
    sprListRepresentativesController.addColumn "Last Name", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListRepresentativesController.addColumn "Gender", 8, STATIC_TEXT_CELL_TYPE, False, True
    sprListRepresentativesController.addColumn "Birth Date", 16, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListRepresentativesController.addColumn "Email Address", 50, STATIC_TEXT_CELL_TYPE, False, False
    sprListRepresentativesController.addColumn "Person Txn Ts", 0, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    
    sprListRepresentativesController.addColumn "Territory", 50, STATIC_TEXT_CELL_TYPE, False, True
    sprListRepresentativesController.addColumn "Address", 50, STATIC_TEXT_CELL_TYPE, False, True
    sprListRepresentativesController.addColumn "Address", 50, STATIC_TEXT_CELL_TYPE, False, False
    sprListRepresentativesController.addColumn "Country ID", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListRepresentativesController.addColumn "Country", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListRepresentativesController.addColumn "State ID", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListRepresentativesController.addColumn "State", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListRepresentativesController.addColumn "Dist. / City ID", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListRepresentativesController.addColumn "District / City", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListRepresentativesController.addColumn "Pin / Zip Code", 8, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListRepresentativesController.addColumn "Cell Phone", 14, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListRepresentativesController.addColumn "Office Phone", 14, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListRepresentativesController.addColumn "Residence Phone", 14, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListRepresentativesController.addColumn "Office Fax", 14, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListRepresentativesController.addColumn "Residence Fax", 14, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListRepresentativesController.addColumn "Txn Ts", 0, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListRepresentativesController.addColumn "Effective From", 11, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListRepresentativesController.addColumn "Effective    Till", 11, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListRepresentativesController.addColumn "Repr. ID", 6, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls()
    
    Select Case intMode
    
        Case uiManager.INSERT_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            sprListRepresentativesController.setSpreadMode intMode
            Me.fraRepresentative.ZOrder 0
            Me.cmbTitle.SetFocus
            
        Case uiManager.QUERY_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID
            sprListRepresentativesController.setSpreadMode intMode
            Me.fraRepresentative.ZOrder 0
            Me.txtID.SetFocus
            
        Case uiManager.RETRIEVE_MODE
        
            sprListRepresentativesController.setSpreadMode intMode
            Me.fraRepresentative.ZOrder 0
            
        Case uiManager.BROWSE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID
            sprListRepresentativesController.setSpreadMode intMode
            Me.fraRepresentative.ZOrder 0
            Me.cmbTitle.SetFocus
            
        Case uiManager.LIST_MODE
        
            sprListRepresentativesController.setSpreadMode intMode
            Me.fraListRepresentatives.ZOrder 0
            
    End Select
    
End Sub

'The method sets the status text of the main screen
Private Sub cmbGender_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub cmbGender_Validate(Cancel As Boolean)
    validateGender
End Sub

'The method sets the status text of the main screen
Private Sub cmbTitle_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub cmbTitle_Validate(Cancel As Boolean)
    validateTitle
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.lblAddressLine1, Me.lbLastName, Me.lblBirthDateTime, Me.lblCellNo, Me.lblCountryName, Me.lblDistrictOrCity, Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblEmailAddress, Me.lblFirstName, Me.lblGender, Me.lblId, Me.lblMiddleName, Me.lblOfficeFaxNo, Me.lblOfficePhoneNo, Me.lblPinOrZipCode, Me.lblResFaxNo, Me.lblResPhoneNo, Me.lblStateId, Me.lblTerritory, Me.lblTitle, _
                                                         Me.txtAddressLine1, Me.txtAddressLine2, Me.txtBirthDateTime, Me.txtCellNo, Me.txtCountryName, Me.txtDistrictOrCity, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtEmail, Me.txtFirstName, Me.txtID, Me.txtLastName, Me.txtMiddleName, Me.txtOfficeFaxNo, Me.txtOfficePhoneNo, Me.txtPinOrZip, Me.txtResFaxNo, Me.txtResPhoneNo, Me.txtStateName, Me.txtTerritory, Me.cmbGender, Me.cmbTitle
    modControlsSettings.setStateToNormal Me.txtAddressLine1, Me.txtAddressLine2, Me.txtBirthDateTime, Me.txtCellNo, Me.txtCountryName, Me.txtDistrictOrCity, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtEmail, Me.txtFirstName, Me.txtID, Me.txtLastName, Me.txtMiddleName, Me.txtOfficeFaxNo, Me.txtOfficePhoneNo, Me.txtPinOrZip, Me.txtResFaxNo, Me.txtResPhoneNo, Me.txtStateName, Me.txtTerritory, Me.cmbGender, Me.cmbTitle
    Me.txtCountryName.ButtonStyle = ButtonStylePopUp
    Me.txtStateName.ButtonStyle = ButtonStylePopUp
    Me.txtDistrictOrCity.ButtonStyle = ButtonStylePopUp
End Sub

'The method sets the status text of the main screen
Private Sub txtAddressLine1_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtAddressLine1_Validate(Cancel As Boolean)
    validateAddress
End Sub

'The method sets the status text of the main screen
Private Sub txtAddressLine2_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtBirthDateTime_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtBirthDateTime_Validate(Cancel As Boolean)
    validateBirthDate
    If Len(Trim(Me.txtBirthDateTime.Text)) < 11 Then
        utils.selectText Me.txtBirthDateTime
        logger.logMessage modStandardMessages.InvalidValue, Trim(Me.txtBirthDateTime.Text) & "|Birth Date", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        Cancel = True
    End If
End Sub

'The method sets the status text of the main screen
Private Sub txtCellNo_GotFocus()
    uiManager.setStatusText ""
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookUpForPersons() is the common place
'where the lookup on the person has been provided
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
    
    'lookup for country can be called when it is not empty in mode other than QUERY mode
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
            Cancel = True
        End If
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtCountryName_Validate", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub
'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookUpForPersons() is the common place
'where the lookup on the person has been provided
Private Sub txtDistrictOrCity_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    If Me.txtStateName.Text <> "" Then
        Dim additionalValues As New Collection
        additionalValues.Add Me.txtStateName.Tag, "state_id"
        additionalValues.Add Me.txtStateName.Text, "state_nm"
        additionalValues.Add Me.txtCountryName.Tag, "country_id"
        additionalValues.Add Me.txtCountryName.Text, "country_nm"
        modCDBLookUps.showLookUpForDistrictsOrCities Me, Me.txtDistrictOrCity, modMain.districtsOrCities, Me.txtDistrictOrCity.Text, enmLookupSearchModes.absolute, additionalValues
    'in query mode, when state is not specified show all the existing districts or cities
    ElseIf intMode = uiManager.QUERY_MODE Then
        modCDBLookUps.showLookUpForDistrictsOrCities Me, Me.txtDistrictOrCity, modMain.districtsOrCities, Me.txtDistrictOrCity.Text, enmLookupSearchModes.absolute
    Else
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
    
    'lookup for districts or cities can be called when it is not empty in mode other than QUERY mode
    If (validateDistCityName) Then
    
        'enforcing to fill state before calling lookup
        If Me.txtStateName.Text = "" Then
            logger.logMessage modStandardMessages.ValueReqd, "State", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Cancel = True
            Me.txtDistrictOrCity.Text = ""
            Me.txtCountryName.SetFocus
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
            uiManager.setStatusText "Please enter Date smaller than Effective Till Date"
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
Private Sub txtEmail_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtFirstName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Only alphabets and apostrophe are valid characters here"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtFirstName_Validate(Cancel As Boolean)
    validateFirstName
End Sub

'The method sets the status text of the main screen
Private Sub txtID_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtLastName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Only alphabets and apostrophe are valid characters here"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtLastName_Validate(Cancel As Boolean)
    validateLastName
End Sub

'The method sets the status text of the main screen
Private Sub txtMiddleName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Only alphabets and apostrophe are valid characters here"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

'The method sets the status text of the main screen
Private Sub txtOfficeFaxNo_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtOfficePhoneNo_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtPinOrZip_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtResFaxNo_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtResPhoneNo_GotFocus()
    uiManager.setStatusText ""
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookUpForPersons() is the common place
'where the lookup on the person has been provided
Private Sub txtStateName_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    If Me.txtCountryName.Text <> "" Then
        Dim additionalValues As New Collection
        additionalValues.Add Me.txtCountryName.Tag, "country_id"
        additionalValues.Add Me.txtCountryName.Text, "country_nm"
        modCDBLookUps.showLookUpForStates Me, Me.txtStateName, modMain.states, Me.txtStateName.Text, enmLookupSearchModes.absolute, additionalValues
    'in query mode, when country is not specified, show all the existing states
    ElseIf intMode = uiManager.QUERY_MODE Then
        modCDBLookUps.showLookUpForStates Me, Me.txtStateName, modMain.states, Me.txtStateName.Text, enmLookupSearchModes.absolute
    Else
        logger.logMessage modStandardMessages.ValueReqd, "Country Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        Me.txtCountryName.SetFocus
    End If
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtStateName_Validate", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
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
            Cancel = True
        End If
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtStateName_Validate", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub
'The method sets the status text of the main screen
Private Sub txtTerritory_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtTerritory_Validate(Cancel As Boolean)
    validateTerritory
End Sub
