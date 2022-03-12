VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "EDT32X30.OCX"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.OCX"
Begin VB.Form frmCameras 
   BackColor       =   &H00C0C0C0&
   Caption         =   "CAMERAS"
   ClientHeight    =   8160
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
   ForeColor       =   &H80000008&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MDIChild        =   -1  'True
   ScaleHeight     =   8160
   ScaleWidth      =   8880
   WindowState     =   2  'Maximized
   Begin VB.Frame fraCameras 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   9795
      Left            =   0
      TabIndex        =   22
      Top             =   0
      Width           =   13215
      Begin EditLib.fpText txtTransferSize 
         Height          =   350
         Left            =   5760
         TabIndex        =   12
         Top             =   1960
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
         CharValidationText=   "1234567890* "
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
      Begin EditLib.fpDateTime txtEffectiveFrom 
         Height          =   350
         Left            =   3720
         TabIndex        =   17
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
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   350
         Left            =   5760
         TabIndex        =   19
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
      Begin EditLib.fpText txtCameraModel 
         Height          =   350
         Left            =   5760
         TabIndex        =   3
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
         CharValidationText=   ""
         MaxLength       =   30
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
      Begin EditLib.fpText txtPictureQuality 
         Height          =   350
         Left            =   3720
         TabIndex        =   5
         Top             =   1220
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
      Begin EditLib.fpText txtFlashMode 
         Height          =   350
         Left            =   5760
         TabIndex        =   7
         Top             =   1220
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
      Begin EditLib.fpLongInteger txtZoomPosition 
         Height          =   350
         Left            =   3720
         TabIndex        =   9
         Top             =   1960
         Width           =   570
         _Version        =   196608
         _ExtentX        =   1005
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
         MaxValue        =   "200"
         MinValue        =   "70"
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
      Begin EditLib.fpLongInteger txtRotationAngle 
         Height          =   350
         Left            =   7650
         TabIndex        =   14
         Top             =   1960
         Width           =   570
         _Version        =   196608
         _ExtentX        =   1005
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
         MaxValue        =   "360"
         MinValue        =   "0"
         NegFormat       =   0
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
      Begin VB.Label lblTransferSize 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Transfer Size "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5760
         TabIndex        =   11
         Top             =   1720
         Width           =   1200
      End
      Begin VB.Label lblZoomPosition 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Zoom Position "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   8
         Top             =   1720
         Width           =   1305
      End
      Begin VB.Label lblEffectiveTill 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5760
         TabIndex        =   18
         Top             =   2460
         Width           =   1080
      End
      Begin VB.Label lblEffectiveFrom 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   16
         Top             =   2460
         Width           =   1290
      End
      Begin VB.Label lblRotationAngle 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Rotation Angle "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   7650
         TabIndex        =   13
         Top             =   1720
         Width           =   1335
      End
      Begin VB.Label lblFlashMode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Flash Mode "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5760
         TabIndex        =   6
         Top             =   980
         Width           =   1080
      End
      Begin VB.Label lblPictureQuality 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Picture Quality "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   4
         Top             =   980
         Width           =   1350
      End
      Begin VB.Label lblCameraModel 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Camera Model"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5760
         TabIndex        =   2
         Top             =   240
         Width           =   1260
      End
      Begin VB.Label lblMM 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "millimeters"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   4320
         TabIndex        =   10
         Top             =   2010
         Width           =   945
      End
      Begin VB.Label lblDegrees 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "degrees"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   8280
         TabIndex        =   15
         Top             =   2010
         Width           =   690
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
   Begin VB.Frame fraListCameras 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   8805
      Left            =   0
      TabIndex        =   20
      Top             =   0
      Width           =   13695
      Begin FPSpread.vaSpread sprListCameras 
         Height          =   6465
         Left            =   120
         TabIndex        =   21
         TabStop         =   0   'False
         Tag             =   "Cameras List Spread"
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
         SpreadDesigner  =   "frmCameras.frx":0000
      End
   End
End
Attribute VB_Name = "frmCameras"
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

'stores the value of txn_ts. the variable is set in the method populateFieldsFromRetrievalSpread of
'clsQueryInterface
Dim varTxnTs As Variant

'The declaration of spread controller for retrieving the records from the Designations table. This spread controller
'is also used to show the records in list mode. This object variable is defined "withEvents" because this code
'module needs to catch the events thrown by this controller (like 'validateCell','validateRow' etc)
Dim sprListCamerasController As clsSpreadController

'This enum holds all the column numbers of the spread controller 'sprListCamerasController' that shows all the
'records of cameras. The column numbers are stored into variables named corresponding to column names. These are
'called in functions of spreadController like 'getTextOfCell' or 'setTextOfCell' which requires row & column number.
Private Enum cameraColumns
    Model = 1
    picQuality = 2
    flashMode = 3
    zoomPosition = 4
    transferSize = 5
    rotationAngle = 6
    txn_ts = 7
    effectivefrom = 8
    effectiveTill = 9
    ID = 10
End Enum

'private function returning true when the field - camera id is valid, otherwise false
Private Function validateCameraID() As Boolean
    validateCameraID = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE Then
        If Trim(Me.txtID.Text) = "" Then
            Me.txtID.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "Camera ID", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            validateCameraID = False
            Exit Function
        ElseIf intMode <> uiManager.BROWSE_MODE Then
            Dim rsUniqueID As clsRecordHashMap
            Set rsUniqueID = dbManager.executeSQLGetRS("SELECT camera_id FROM cameras WHERE camera_id = " & Trim(Me.txtID.Text))
            If rsUniqueID.getNoOfRecords <> 0 Then
                Me.txtID.SelStart = 0
                Me.txtID.SelLength = Len(Trim(Me.txtID.Text))
                Me.txtID.SetFocus
                logger.logMessage modStandardMessages.ExistInfo, "Camera ID - " & Trim(Me.txtID.Text), WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
                validateCameraID = False
                Exit Function
            End If
        End If
    End If
End Function

'private function returning true when the field - camera model is valid, otherwise false
Private Function validateCameraModel() As Boolean
    validateCameraModel = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtCameraModel.Text) = "" Then
        Me.txtCameraModel.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Camera Model", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateCameraModel = False
    End If
End Function

'private function returning true when the field - Picture Quality is valid, otherwise false
Private Function validatePictureQuality() As Boolean
    validatePictureQuality = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE Then
        If Trim(Me.txtPictureQuality.Text) = "" Then
            Me.txtPictureQuality.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "Picture Quality", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            validatePictureQuality = False
            Exit Function
        
        ElseIf Not (UCase(Trim(Me.txtPictureQuality.Text)) = UCase("good") Or _
                    UCase(Trim(Me.txtPictureQuality.Text)) = UCase("better") Or _
                    UCase(Trim(Me.txtPictureQuality.Text)) = UCase("best")) Then
            logger.logMessage modStandardMessages.OneOfThreeValuesReqd, "Good|Better|Best", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            Me.txtPictureQuality.SelStart = 0
            Me.txtPictureQuality.SelLength = Len(Trim(Me.txtPictureQuality.Text))
            Me.txtPictureQuality.SetFocus
            validatePictureQuality = False
        End If
    End If
End Function

'private function returning true when the field - Flash Mode is valid, otherwise false
Private Function validateFlashMode() As Boolean
    validateFlashMode = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE Then
        If Trim(Me.txtFlashMode.Text) = "" Then
            Me.txtFlashMode.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "Flash Mode", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            validateFlashMode = False
            Exit Function
            
        ElseIf Not (UCase(Trim(Me.txtFlashMode.Text)) = UCase("on") Or _
                    UCase(Trim(Me.txtFlashMode.Text)) = UCase("off") Or _
                    UCase(Trim(Me.txtFlashMode.Text)) = UCase("auto")) Then
            logger.logMessage modStandardMessages.OneOfThreeValuesReqd, "On|Off|Auto", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            Me.txtFlashMode.SelStart = 0
            Me.txtFlashMode.SelLength = Len(Trim(Me.txtFlashMode.Text))
            Me.txtFlashMode.SetFocus
            validateFlashMode = False
        End If
    End If
End Function

'private function returning true when the field - Zoom Position is valid, otherwise false
Private Function validateZoomPosition() As Boolean
    validateZoomPosition = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE Then
        If Trim(Me.txtZoomPosition.Text) = "" Then
            Me.txtZoomPosition.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "Zoom Position", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            validateZoomPosition = False
            Exit Function
            
        ElseIf Trim(Me.txtZoomPosition.Text) < 70 Or Trim(Me.txtZoomPosition.Text) > 200 Then
            logger.logMessage modStandardMessages.OutOfRange, "Zoom Position|70|200", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
            Me.txtZoomPosition.SetFocus
            validateZoomPosition = False
        End If
    End If
End Function

'private function returning true when the field - Transfer Size is valid, otherwise false
Private Function validateTransferSize() As Boolean
    validateTransferSize = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtTransferSize.Text) = "" Then
        Me.txtTransferSize.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Transfer Size", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateTransferSize = False
    End If
End Function

'private function returning true when the field - c is valid, otherwise false
Private Function validateRotationAngle() As Boolean
    validateRotationAngle = True

    If Trim(Me.txtRotationAngle.Text) <> "" And Not (Trim(Me.txtRotationAngle.Text) = 90 Or _
                                                     Trim(Me.txtRotationAngle.Text) = 180 Or _
                                                     Trim(Me.txtRotationAngle.Text) = 270) Then
        Me.txtRotationAngle.SelStart = 0
        Me.txtRotationAngle.SelLength = Len(Trim(Me.txtRotationAngle.Text))
        Me.txtRotationAngle.SetFocus
        logger.logMessage modStandardMessages.OneOfThreeValuesReqd, "90|180|270", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateRotationAngle = False
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

'Implementation of isReadyToSave function the interface clsEditInterface. No invalid data
'should enter into database. Thus before saving record, certain checks are carried out in this function. If all
'the checks are cleared then the function returns boolean value 'True' otherwise returns boolean value 'False'
'and a descriptive error or warning message is generated.
Public Function clsEditInterface_isReadyToSave() As Boolean
    clsEditInterface_isReadyToSave = True
    
    'validate event of the last focused control is called before save
    Me.ValidateControls
    
    If (Not validateCameraID) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateCameraModel) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validatePictureQuality) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateFlashMode) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateZoomPosition) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateTransferSize) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateRotationAngle) Then
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
    
    Dim strSQL As String
    strSQL = "CDB..insUpdCameras " & (Trim(Me.txtID.Text)) & ",'" & _
                                     Replace(Trim(Me.txtCameraModel.Text), "'", "''") & "','" & _
                                     Trim(Me.txtPictureQuality.Text) & "','" & _
                                     Trim(Me.txtFlashMode.Text) & "'," & _
                                     Trim(Me.txtZoomPosition.Text) & ",'" & _
                                     Trim(Me.txtTransferSize.Text) & "'," & _
                                     IIf(Me.txtRotationAngle.Text = "", "NULL", Trim(Me.txtRotationAngle.Text)) & ",'" & _
                                     Trim(Me.txtEffectiveFrom.Text) & "','" & _
                                     Trim(Me.txtEffectiveTill.Text) & "'," & _
                                     IIf(varTxnTs = "", "NULL", varTxnTs)
    
    dbManager.beginTrans

    Select Case intMode
        Case uiManager.INSERT_MODE
            strSQL = strSQL & ",0"      '0 - INSERT
            dbManager.executeSQL strSQL
            dbManager.commitTrans
            
            logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Me.clsWindowInterface_showForm uiManager.INSERT_MODE
            Me.txtID.SetFocus

        Case uiManager.BROWSE_MODE
            strSQL = strSQL & ",1"      '1 - UPDATE
            dbManager.executeSQL strSQL
            dbManager.commitTrans
            sprListCamerasController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, _
                                               Me.sprListCameras.ActiveRow
            Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListCameras.ActiveRow
            varTxnTs = sprListCamerasController.getTextOfCell(Me.sprListCameras.ActiveRow, cameraColumns.txn_ts)
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
    dbManager.executeSQL "CDB..delCameras " & Trim(Me.txtID.Text) & "," & varTxnTs
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
'the retrieval is done in the "sprListDesignationsController", so that is returned to the caller.
Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController
    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListCamerasController
End Function

'Implementation of the getSQLStringForRetrieval() function of the clsQueryInterface. This function
'returns the sql string which should be used by ADL to retrieve records in Retrieve mode.
'The query is build based upon the user entries in the different fields of the form.
Public Function clsQueryInterface_getSQLStringForRetrieval() As String
    
    Dim qryCameras As String
                         
    qryCameras = "SELECT camera_model_nm, picture_quality, flash_mode, zoom_position, transfer_size, " & _
                         "rotation_angle, Cast(txn_ts AS BigInt), Convert(varchar, effective_from, 106)effective_from, " & _
                         "CONVERT(varchar, effective_till, 106)effective_till, camera_id FROM cameras "
                                
    If Trim(Me.txtCameraModel.Text) <> "" Then
        qryCameras = qryCameras & " WHERE camera_model_nm LIKE '%" & Replace(Trim(Me.txtCameraModel.Text), "'", "''") & "%' AND"
    Else
        qryCameras = qryCameras & " WHERE camera_model_nm LIKE '%%' AND"
    End If

    If Trim(Me.txtID.Text) <> "" Then
        qryCameras = qryCameras & " camera_id = " & Trim(Me.txtID.Text) & " AND"
    End If

    If Trim(Me.txtPictureQuality.Text) <> "" Then
        qryCameras = qryCameras & " picture_quality LIKE '%" & Trim(Me.txtPictureQuality.Text) & "%' AND"
    End If

    If Trim(Me.txtFlashMode.Text) <> "" Then
        qryCameras = qryCameras & " flash_mode LIKE '%" & Trim(Me.txtFlashMode.Text) & "%' AND"
    End If

    If Trim(Me.txtZoomPosition.Text) <> "" Then
        qryCameras = qryCameras & " zoom_position = " & Trim(Me.txtZoomPosition.Text) & " AND"
    End If

    If Trim(Me.txtRotationAngle.Text) <> "" Then
        qryCameras = qryCameras & " rotation_angle = " & Trim(Me.txtRotationAngle.Text) & " AND"
    End If

    If Trim(Me.txtTransferSize.Text) <> "" Then
        qryCameras = qryCameras & " transfer_size LIKE '%" & Trim(Me.txtTransferSize.Text) & "%' AND"
    End If

    If Trim(Me.txtEffectiveFrom.Text) <> "" Then
        qryCameras = qryCameras & " effective_from = '" & Trim(Me.txtEffectiveFrom.Text) & "' AND"
    End If

    If Trim(Me.txtEffectiveTill.Text) <> "" Then
        qryCameras = qryCameras & " effective_till = '" & Trim(Me.txtEffectiveTill.Text) & "' AND"
    End If

    qryCameras = Left(qryCameras, Len(qryCameras) - 3)
    qryCameras = qryCameras & " ORDER BY camera_id"

    clsQueryInterface_getSQLStringForRetrieval = qryCameras
        
End Function

'Implementation of the populateFieldsFromRetrievalSpread() method of the clsQueryInterface. All the fields are
'populated from the spread where the records are retrieved. Parameter p_lonrow states the row of the spread
'whose values are to be set in respective fields.
Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)
    
    Me.txtCameraModel.Text = CStr(sprListCamerasController.getTextOfCell(p_lonRow, cameraColumns.Model))
    Me.txtPictureQuality.Text = CStr(sprListCamerasController.getTextOfCell(p_lonRow, cameraColumns.picQuality))
    Me.txtFlashMode.Text = CStr(sprListCamerasController.getTextOfCell(p_lonRow, cameraColumns.flashMode))
    Me.txtZoomPosition.Text = sprListCamerasController.getTextOfCell(p_lonRow, cameraColumns.zoomPosition)
    Me.txtTransferSize.Text = CStr(sprListCamerasController.getTextOfCell(p_lonRow, cameraColumns.transferSize))
    Me.txtRotationAngle.Text = CStr(sprListCamerasController.getTextOfCell(p_lonRow, cameraColumns.rotationAngle))
    varTxnTs = sprListCamerasController.getTextOfCell(p_lonRow, cameraColumns.txn_ts)
    Me.txtEffectiveFrom.Text = Format(CDate(sprListCamerasController.getTextOfCell(p_lonRow, cameraColumns.effectivefrom)), "dd-mmm-yyyy")
    Me.txtEffectiveTill.Text = Format(CDate(sprListCamerasController.getTextOfCell(p_lonRow, cameraColumns.effectiveTill)), "dd-mmm-yyyy")
    Me.txtID.Text = sprListCamerasController.getTextOfCell(p_lonRow, cameraColumns.ID)
    
End Sub

Public Sub clsWindowInterface_fireClose()

End Sub

'Implementation of the fireErase() method of the clsWindowInterface. All the Controls and spreads of the form are
'cleared of any data. clearSpread() method of the spreadController is called for clearing the spreads.
Public Sub clsWindowInterface_fireErase()

    utils.clearControls Me.txtCameraModel, Me.txtFlashMode, Me.txtID, _
                                  Me.txtPictureQuality, Me.txtRotationAngle, Me.txtTransferSize, _
                                  Me.txtZoomPosition
    
    'dates are cleared in query mode, otherwise their default values are set
    Select Case intMode
        Case uiManager.QUERY_MODE
            Me.txtEffectiveFrom.Text = ""
            Me.txtEffectiveTill.Text = ""
        Case uiManager.INSERT_MODE
            Me.txtEffectiveFrom.Text = Format(Date, "dd-mmm-yyyy")
            Me.txtEffectiveTill.Text = "31-Dec-9999"
    End Select
    
    If Not Me.sprListCameras Is Nothing Then
        sprListCamerasController.clearSpread
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
    clsWindowInterface_getScreenID = "MIS_04"
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

    'initializing and adding columns to sprListCamerasController of cameras
    
    Set sprListCamerasController = New clsSpreadController
    sprListCamerasController.registerSpreadInstance uiManager, Me.sprListCameras, LIST_SPREAD, Me
    sprListCamerasController.setHeaderHeight 600
    
    sprListCamerasController.addColumn "Camera Model", 32, STATIC_TEXT_CELL_TYPE, False, True
    sprListCamerasController.addColumn "Picture    Quality", 8, STATIC_TEXT_CELL_TYPE, False, True
    sprListCamerasController.addColumn "Flash Mode", 6, STATIC_TEXT_CELL_TYPE, False, True
    sprListCamerasController.addColumn "Zoom Position", 8, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListCamerasController.addColumn "Transfer Size", 10, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListCamerasController.addColumn "Rotation Angle", 8, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListCamerasController.addColumn "Txn_Ts", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListCamerasController.addColumn "Effective From", 11, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListCamerasController.addColumn "Effective     Till", 11, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListCamerasController.addColumn "ID", 6, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    
End Sub

'This is a private method to this code module. It enables/disables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls()

    Select Case intMode
    
        Case uiManager.INSERT_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID
            sprListCamerasController.setSpreadMode intMode
            Me.fraCameras.ZOrder 0
            Me.txtID.SetFocus
            
        Case uiManager.QUERY_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID
            sprListCamerasController.setSpreadMode intMode
            Me.fraCameras.ZOrder 0
            Me.txtID.SetFocus
            
        Case uiManager.RETRIEVE_MODE
        
            sprListCamerasController.setSpreadMode intMode
            Me.fraCameras.ZOrder 0
            
        Case uiManager.BROWSE_MODE
        
            modControlsSettings.setStateToReadOnly Me.txtID
            Me.txtCameraModel.SetFocus
            sprListCamerasController.setSpreadMode intMode
            Me.fraCameras.ZOrder 0
                        
        Case uiManager.LIST_MODE
        
            sprListCamerasController.setSpreadMode intMode
            Me.fraListCameras.ZOrder 0
            
    End Select
    
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.lblCameraModel, Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblFlashMode, Me.lblId, Me.lblPictureQuality, Me.lblRotationAngle, Me.lblTransferSize, Me.lblZoomPosition, _
                                                         Me.txtCameraModel, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtFlashMode, Me.txtID, Me.txtPictureQuality, Me.txtRotationAngle, Me.txtTransferSize, Me.txtZoomPosition
    modControlsSettings.setStateToNormal Me.txtCameraModel, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtFlashMode, Me.txtID, Me.txtPictureQuality, Me.txtRotationAngle, Me.txtTransferSize, Me.txtZoomPosition
End Sub

'The method sets the status text of the main screen
Private Sub txtCameraModel_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtCameraModel_Validate(Cancel As Boolean)
    validateCameraModel
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

'The method sets the status text of the main screen
Private Sub txtFlashMode_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter either 'On' or 'Off' or 'Auto'"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtFlashMode_Validate(Cancel As Boolean)
    validateFlashMode
End Sub

Private Sub txtID_Validate(Cancel As Boolean)
    validateCameraID
End Sub

'The method sets the status text of the main screen
Private Sub txtPictureQuality_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter either 'Good' or 'Better' or 'Best'"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtPictureQuality_Validate(Cancel As Boolean)
    validatePictureQuality
End Sub

'The method sets the status text of the main screen
Private Sub txtRotationAngle_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter either '90' or '180' or '270'"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtRotationAngle_Validate(Cancel As Boolean)
    validateRotationAngle
End Sub

'The method sets the status text of the main screen
Private Sub txtTransferSize_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtTransferSize_Validate(Cancel As Boolean)
    validateTransferSize
End Sub

'The method sets the status text of the main screen
Private Sub txtZoomPosition_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter values between 70 to 200"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtZoomPosition_Validate(Cancel As Boolean)
    validateZoomPosition
End Sub
