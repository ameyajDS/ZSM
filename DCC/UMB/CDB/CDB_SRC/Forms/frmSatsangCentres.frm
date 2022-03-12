VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "EDT32X30.OCX"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.OCX"
Begin VB.Form frmSatsangCentres 
   BackColor       =   &H00C0C0C0&
   Caption         =   "SATSANG CENTRES"
   ClientHeight    =   8490
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8385
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
   ScaleWidth      =   8385
   WindowState     =   2  'Maximized
   Begin VB.Frame fraSatsangCentre 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   9795
      Left            =   0
      TabIndex        =   39
      Top             =   0
      Width           =   22815
      Begin EditLib.fpText txtFileNo 
         Height          =   375
         Left            =   960
         TabIndex        =   48
         Top             =   3840
         Width           =   5895
         _Version        =   196608
         _ExtentX        =   10398
         _ExtentY        =   661
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
         ButtonColor     =   -2147483633
         AutoMenu        =   0   'False
         ButtonAlign     =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin EditLib.fpText txtDistrictOrCityName 
         Height          =   345
         Left            =   960
         TabIndex        =   16
         Top             =   3060
         Width           =   2895
         _Version        =   196608
         _ExtentX        =   5106
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
      Begin EditLib.fpText txtSatsangCentreName 
         Height          =   345
         Left            =   3720
         TabIndex        =   5
         Top             =   480
         Width           =   3135
         _Version        =   196608
         _ExtentX        =   5530
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
         MaxLength       =   25
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
      Begin EditLib.fpText txtAddressLine2 
         Height          =   345
         Left            =   960
         TabIndex        =   10
         Top             =   1580
         Width           =   5895
         _Version        =   196608
         _ExtentX        =   10398
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
      Begin EditLib.fpText txtSatsangCentreCode 
         Height          =   345
         Left            =   2280
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
      Begin EditLib.fpText txtCountryName 
         Height          =   345
         Left            =   960
         TabIndex        =   12
         Top             =   2320
         Width           =   2895
         _Version        =   196608
         _ExtentX        =   5106
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
      Begin EditLib.fpText txtTelephone 
         Height          =   345
         Left            =   7320
         TabIndex        =   20
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
         CharValidationText=   "1234567890()- "
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
      Begin EditLib.fpText txtID 
         Height          =   345
         Left            =   960
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
         ForeColor       =   128
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
         CharValidationText=   ""
         MaxLength       =   255
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
         Left            =   7320
         TabIndex        =   26
         Top             =   3435
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
      Begin EditLib.fpText txtFaxLines 
         Height          =   345
         Left            =   7320
         TabIndex        =   22
         Top             =   1965
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
         CharValidationText=   "1234567890()- "
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
      Begin EditLib.fpText txtEmailAddress 
         Height          =   345
         Left            =   7320
         TabIndex        =   24
         Top             =   2700
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
      Begin VB.Frame fraSecretary 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Secretary"
         ForeColor       =   &H00800000&
         Height          =   1935
         Left            =   360
         TabIndex        =   40
         Top             =   4440
         Width           =   11055
         Begin EditLib.fpText txtFirstName 
            Height          =   345
            Left            =   1200
            TabIndex        =   30
            Top             =   600
            Width           =   2900
            _Version        =   196608
            _ExtentX        =   5106
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
            ForeColor       =   128
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
         Begin EditLib.fpText txtPersonEmail 
            Height          =   345
            Left            =   4590
            TabIndex        =   36
            TabStop         =   0   'False
            Top             =   1335
            Width           =   6255
            _Version        =   196608
            _ExtentX        =   11033
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
            ForeColor       =   128
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
            ControlType     =   1
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
            Left            =   4590
            TabIndex        =   33
            TabStop         =   0   'False
            Top             =   600
            Width           =   2895
            _Version        =   196608
            _ExtentX        =   5106
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
            ForeColor       =   128
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
            ControlType     =   1
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
         Begin EditLib.fpText txtPersonPhone 
            Height          =   345
            Left            =   1200
            TabIndex        =   35
            TabStop         =   0   'False
            Top             =   1340
            Width           =   3255
            _Version        =   196608
            _ExtentX        =   5741
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
            ForeColor       =   128
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
            ControlType     =   1
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
         Begin EditLib.fpLongInteger txtAge 
            Height          =   345
            Left            =   360
            TabIndex        =   34
            TabStop         =   0   'False
            Top             =   1340
            Width           =   375
            _Version        =   196608
            _ExtentX        =   661
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
            ForeColor       =   128
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
            ControlType     =   1
            Text            =   ""
            MaxValue        =   "99"
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
         Begin EditLib.fpText txtTitle 
            Height          =   345
            Left            =   150
            TabIndex        =   46
            TabStop         =   0   'False
            Top             =   600
            Width           =   915
            _Version        =   196608
            _ExtentX        =   1614
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
            ForeColor       =   128
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
            BorderColor     =   128
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
            ButtonColor     =   -2147483633
            AutoMenu        =   0   'False
            ButtonAlign     =   0
            OLEDropMode     =   0
            OLEDragMode     =   0
         End
         Begin EditLib.fpText txtLastName 
            Height          =   345
            Left            =   7920
            TabIndex        =   32
            Top             =   600
            Width           =   2895
            _Version        =   196608
            _ExtentX        =   5115
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
            ForeColor       =   128
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
         Begin VB.Label lblEmailAddress 
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "Email Address(es)"
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   4590
            TabIndex        =   45
            Top             =   1100
            Width           =   1605
         End
         Begin VB.Label lblMiddleName 
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "Middle Name "
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   4590
            TabIndex        =   44
            Top             =   360
            Width           =   1320
         End
         Begin VB.Label lblTitle 
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "Title "
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   120
            TabIndex        =   43
            Top             =   360
            Width           =   420
         End
         Begin VB.Label lbLastName 
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "Last Name "
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   7920
            TabIndex        =   31
            Top             =   360
            Width           =   1005
         End
         Begin VB.Label lbFirstName 
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "First Name "
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   1200
            TabIndex        =   29
            Top             =   360
            Width           =   1140
         End
         Begin VB.Label lblPhone 
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "Cell Phone OR Residence Telephone"
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   1200
            TabIndex        =   42
            Top             =   1100
            Width           =   3210
         End
         Begin VB.Label lblAge 
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "Age"
            ForeColor       =   &H00800000&
            Height          =   240
            Left            =   360
            TabIndex        =   41
            Top             =   1100
            Width           =   345
         End
      End
      Begin VB.ComboBox cmbSatsangCentreType 
         BackColor       =   &H00E0E0E0&
         Height          =   360
         Left            =   7320
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   480
         Width           =   3615
      End
      Begin EditLib.fpText txtAddressLine1 
         Height          =   345
         Left            =   960
         TabIndex        =   9
         Top             =   1200
         Width           =   5895
         _Version        =   196608
         _ExtentX        =   10398
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
      Begin EditLib.fpText txtPinOrZipCode 
         Height          =   345
         Left            =   3960
         TabIndex        =   18
         Top             =   3060
         Width           =   1020
         _Version        =   196608
         _ExtentX        =   1799
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
         AllowNull       =   0   'False
         NoSpecialKeys   =   0
         AutoAdvance     =   0   'False
         AutoBeep        =   0   'False
         AutoCase        =   0
         CaretInsert     =   0
         CaretOverWrite  =   3
         UserEntry       =   0
         HideSelection   =   -1  'True
         InvalidColor    =   12632256
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
         CharValidationText=   "0123456789"
         MaxLength       =   6
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
      Begin EditLib.fpText txtStateName 
         Height          =   345
         Left            =   3960
         TabIndex        =   14
         Top             =   2320
         Width           =   2895
         _Version        =   196608
         _ExtentX        =   5106
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
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   345
         Left            =   9360
         TabIndex        =   28
         Top             =   3435
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
      Begin VB.Label lblFileno 
         BackStyle       =   0  'Transparent
         Caption         =   "File No."
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   960
         TabIndex        =   47
         Top             =   3600
         Width           =   1575
      End
      Begin VB.Label lblEffectiveTill 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
         ForeColor       =   &H00800000&
         Height          =   300
         Left            =   9360
         TabIndex        =   27
         Top             =   3195
         Width           =   1335
      End
      Begin VB.Label lblStateName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "State"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3960
         TabIndex        =   13
         Top             =   2080
         Width           =   465
      End
      Begin VB.Label lblPinOrZipCode 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Pin / Zip Code "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3960
         TabIndex        =   17
         Top             =   2820
         Width           =   1455
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00E0E0E0&
         BorderStyle     =   6  'Inside Solid
         DrawMode        =   16  'Merge Pen
         X1              =   7080
         X2              =   7080
         Y1              =   1080
         Y2              =   3840
      End
      Begin VB.Label lblSatsangCentreCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Code  "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   2280
         TabIndex        =   2
         Top             =   240
         Width           =   570
      End
      Begin VB.Label lblAddressLine1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Address"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   960
         TabIndex        =   8
         Top             =   975
         Width           =   1575
      End
      Begin VB.Label lblSatsangCentreName 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   4
         Top             =   240
         Width           =   2175
      End
      Begin VB.Label lblDistrictOrCity 
         BackColor       =   &H00C0C0C0&
         Caption         =   "District / City "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   960
         TabIndex        =   15
         Top             =   2820
         Width           =   2175
      End
      Begin VB.Label lblCountryName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Country"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   960
         TabIndex        =   11
         Top             =   2080
         Width           =   675
      End
      Begin VB.Label lblId 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ID"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   960
         TabIndex        =   0
         Top             =   240
         Width           =   180
      End
      Begin VB.Label lblEffectiveFrom 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   7320
         TabIndex        =   25
         Top             =   3195
         Width           =   1695
      End
      Begin VB.Label lblTelephone 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Telephone(s) "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   7320
         TabIndex        =   19
         Top             =   975
         Width           =   1215
      End
      Begin VB.Label lblFaxLines 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Fax Line(s) "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   7320
         TabIndex        =   21
         Top             =   1725
         Width           =   1335
      End
      Begin VB.Label lblEmailAdress 
         BackColor       =   &H00C0C0C0&
         Caption         =   "E-Mail Address(es) "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   7320
         TabIndex        =   23
         Top             =   2460
         Width           =   1695
      End
      Begin VB.Label lblSatsangCentreType 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Type "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   7320
         TabIndex        =   6
         Top             =   240
         Width           =   2055
      End
   End
   Begin VB.Frame fraListSatsangCentres 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   11145
      Left            =   0
      TabIndex        =   37
      Top             =   0
      Width           =   15765
      Begin FPSpread.vaSpread sprListSatsangCentres 
         Height          =   6435
         Left            =   120
         TabIndex        =   38
         TabStop         =   0   'False
         Tag             =   "Satsang Centres List Spread"
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
         SpreadDesigner  =   "frmSatsangCentres.frx":0000
      End
   End
End
Attribute VB_Name = "frmSatsangCentres"
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

'stores the value of txn_ts. the variable is filled in the populateFieldsFromRetrievalSpread method
'of clsQueryInterface
Dim varTxnTs As Variant

'The declaration of spread controller for retrieving the records from the states
'table. This spread controller is also used to show the records in list mode. This object variable
'is defined "withEvents" because this code module needs to catch the events thrown by this
'controller (like 'validateCell', 'validateRow' etc)
Dim sprListSatsangCentresController As clsSpreadController

'This enum holds all the column numbers of the spread controller 'sprListSatsangCentresController' that
'shows all the records of satsang centres. The column numbers are stored into variables named corresponding
'to column names. These are called in functions of spreadController like 'getTextOfCell'
'or 'setTextOfCell' which requires row number and column number.
Private Enum satsangColumns
    code = 1
    Name = 2
    centreType = 3
    Add1 = 4
    Add2 = 5
    countryID = 6
    Country = 7
    stateID = 8
    state = 9
    distCityID = 10
    distCity = 11
    pinZipCode = 12
    Telephone = 13
    Fax = 14
    EmailAdd = 15
    txn_ts = 16
    effectivefrom = 17
    effectiveTill = 18
    'Added on Oct 13,2011 by Bhavna
    centreID = 19
    FileNo = 20
    Title = 21
    firstName = 22
    middleName = 23
    lastName = 24
    Age = 25
    CellResNo = 26
    personEmail = 27
    personID = 28
End Enum

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
    
    If p_objActiveControl Is Me.txtDistrictOrCityName Then
        
        Set p_objCallForm = modMain.districtsOrCities
        p_strDisplayText = Me.txtDistrictOrCityName.Text
        p_strIDText = Me.txtDistrictOrCityName.TabIndex
        'state id & name, country id & name are added in collection
        p_colAdditionalValues.Add Me.txtStateName.Tag, "state_id"
        p_colAdditionalValues.Add Me.txtStateName.Text, "state_nm"
        p_colAdditionalValues.Add Me.txtCountryName.Tag, "country_id"
        p_colAdditionalValues.Add Me.txtCountryName.Text, "country_nm"
    End If
    
    If p_objActiveControl Is Me.txtFirstName Then
        Set p_objCallForm = modMain.persons
        p_strDisplayText = Me.txtFirstName.Text
        p_strIDText = Me.txtFirstName.Tag
        Set p_colAdditionalValues = Nothing
    End If
    
    If p_objActiveControl Is Me.txtLastName Then
        Set p_objCallForm = modMain.persons
        p_strDisplayText = Me.txtLastName.Text
        p_strIDText = Me.txtLastName.Tag
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
        Me.txtCountryName.Text = Me.txtCountryName.DataField
        utils.clearControls Me.txtStateName, Me.txtDistrictOrCityName
        Me.txtStateName.SetFocus
    End If
    
    If p_objSourceObject Is Me.txtStateName Then
        Me.txtStateName.Text = Me.txtStateName.DataField
        utils.clearControls Me.txtDistrictOrCityName
        Me.txtDistrictOrCityName.SetFocus
    End If
    
    If p_objSourceObject Is Me.txtDistrictOrCityName Then
        Me.txtDistrictOrCityName.Text = Me.txtDistrictOrCityName.DataField
        Me.txtPinOrZipCode.SetFocus
    End If
    
    If p_objSourceObject Is Me.txtFirstName Or p_objSourceObject Is Me.txtLastName Then
'        Dim rsPersons As clsRecordHashMap
'        Set rsPersons = dbManager.executeSQLGetRS("SELECT first_nm, middle_nm, last_nm, title, email_addresses, contact_information, birth_dtm " & _
'                                                  "FROM persons WHERE person_id = " & p_strIDText)
'
        Me.txtTitle.Text = p_colAdditionalValues("title") '.getFieldValueByFieldName("title", 0)
        Me.txtFirstName.Text = p_colAdditionalValues("first_nm") 'rsPersons.getFieldValueByFieldName("first_nm", 0)
        Me.txtFirstName.DataField = Me.txtFirstName.Text
        Me.txtMiddleName.Text = p_colAdditionalValues("middle_nm") 'rsPersons.getFieldValueByFieldName("middle_nm", 0)
        Me.txtLastName.Text = p_colAdditionalValues("last_nm") 'rsPersons.getFieldValueByFieldName("last_nm", 0)
        Me.txtLastName.DataField = Me.txtLastName.Text
        Me.txtAge.Text = p_colAdditionalValues("age") 'DateDiff("yyyy", rsPersons.getFieldValueByFieldName("birth_dtm", 0), Date)
        Me.txtPersonPhone.Text = p_colAdditionalValues("contact_information") 'rsPersons.getFieldValueByFieldName("contact_information", 0)
        Me.txtPersonEmail.Text = p_colAdditionalValues("email_addresses") 'rsPersons.getFieldValueByFieldName("email_addresses", 0)
        
        If p_objSourceObject Is Me.txtLastName Then
            Me.txtFirstName.Tag = Me.txtLastName.Tag
        End If
        
        Me.txtSatsangCentreCode.SetFocus
    End If
End Sub

'private function returning true when the field - satsang centre code code is valid, otherwise false
Private Function validateSatsangCentreCode() As Boolean
    validateSatsangCentreCode = True
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtSatsangCentreCode.Text) = "") Then
        Me.txtSatsangCentreCode.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Satsang Centre Code", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateSatsangCentreCode = False
    End If
End Function

'private function returning true when the field - satsang centre name is valid, otherwise false
Private Function validateSatsangCentreName() As Boolean
    validateSatsangCentreName = True
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtSatsangCentreName.Text) = "") Then
        Me.txtSatsangCentreName.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Satsang Centre Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateSatsangCentreName = False
    End If
End Function

'private function returning true when the field - satsang centre type is valid, otherwise false
Private Function validateSatsangCentreType() As Boolean
    validateSatsangCentreType = True
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.cmbSatsangCentreType = "")) Then
        Me.cmbSatsangCentreType.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Satsang Centre Type", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateSatsangCentreType = False
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
    If (Trim(Me.txtCountryName.Text) = "") Then
        utils.clearControls Me.txtCountryName, Me.txtStateName, Me.txtDistrictOrCityName
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
    If (Trim(Me.txtStateName.Text) = "") Then
        utils.clearControls Me.txtStateName, Me.txtDistrictOrCityName
        If (intMode <> uiManager.QUERY_MODE) Then
            Me.txtStateName.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "State Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
            validateStateName = False
        End If
    End If
End Function

'Added on Oct 13,2011 by Bhavna
'private function returning true when the field - state name is valid, otherwise false
Private Function validateFileNo() As Boolean
    validateFileNo = True
    'check for mandatory field
    If (Trim(Me.txtFileNo.Text) = "") Then
        utils.clearControls Me.txtFileNo, Me.txtDistrictOrCityName
        If (intMode <> uiManager.QUERY_MODE) Then
            Me.txtFileNo.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "File Number", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
            validateFileNo = False
        End If
    End If
End Function
'private function returning true when the field - district_or_city name is valid, otherwise false
Private Function validateDistCityName() As Boolean
    validateDistCityName = True
    'check for mandatory field
    If (Trim(Me.txtDistrictOrCityName.Text) = "") Then
        utils.clearControls Me.txtDistrictOrCityName
        If (intMode <> uiManager.QUERY_MODE) Then
            Me.txtDistrictOrCityName.SetFocus
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
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtTitle.Text) = "") Then
        Me.txtTitle.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Title", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateTitle = False
    End If
End Function

'private function returning true when the field - first name is valid, otherwise false
Private Function validateFirstName() As Boolean
    validateFirstName = True
    'check for mandatory field
    If (Trim(Me.txtFirstName.Text) = "") Then
        utils.clearControls Me.txtFirstName, Me.txtMiddleName, Me.txtLastName, Me.txtTitle, Me.txtAge, Me.txtPersonEmail, Me.txtPersonPhone
        If (intMode <> uiManager.QUERY_MODE) Then
            Me.txtFirstName.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "First Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
            validateFirstName = False
        End If
    End If
End Function

'private function returning true when the field - last name is valid, otherwise false
Private Function validateLastName() As Boolean
    validateLastName = True
    'check for mandatory field
    If (Trim(Me.txtLastName.Text) = "") Then
        utils.clearControls Me.txtFirstName, Me.txtMiddleName, Me.txtLastName, Me.txtTitle, Me.txtAge, Me.txtPersonEmail, Me.txtPersonPhone
        If (intMode <> uiManager.QUERY_MODE) Then
            Me.txtLastName.SetFocus
            logger.logMessage modStandardMessages.ValueReqd, "Last Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
            validateLastName = False
        End If
    End If
End Function

'private function returning true when the field - age is valid, otherwise false
Private Function validateAge() As Boolean
    validateAge = True
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtAge.Text) = "") Then
        Me.txtAge.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Age", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, ""
        validateAge = False
    End If
End Function

'Implementation of the isReadyToSave method of clsEditInterface. No invalid data
'should enter into database. Thus before saving record, certain checks are carried out in this function. If all
'the checks are cleared then the function returns boolean value 'True' otherwise returns boolean value 'False'
'and a descriptive error or warning message is generated.
Public Function clsEditInterface_isReadyToSave() As Boolean
    
    clsEditInterface_isReadyToSave = True
    
    'validate event of last focused control is called before save
    Me.ValidateControls
    
    'validating the controls
    If (Not validateSatsangCentreCode) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateSatsangCentreName) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateSatsangCentreType) Then
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
    ElseIf (Not validateFirstName) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateLastName) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateTitle) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    ElseIf (Not validateAge) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
        'Added on Oct 13,2011 by Bhavna
     ElseIf (Not validateFileNo) Then
        clsEditInterface_isReadyToSave = False
    End If
    
End Function

'Implementation of the fireSave() method of the clsEditInterface. Here the form is saved by creating parameters
'that are passed to the dbManager's ExecuteBatch() method. The form can be saved when it is in either insert or
'new or browse or update mode. But before saving the form, the private boolean function isReadyToSave() is called
'to check if the form is ready for saving.
Public Sub clsEditInterface_fireSave()
    
On Error GoTo errortag

    Me.txtAddressLine1.Text = IIf(Right(Trim(Me.txtAddressLine1.Text), 1) = ",", Left(Trim(Me.txtAddressLine1.Text), Len(Trim(Me.txtAddressLine1.Text)) - 1), Trim(Me.txtAddressLine1.Text))
    If Trim(Me.txtAddressLine2.Text) <> "" Then
        Me.txtAddressLine2.Text = IIf(Right(Trim(Me.txtAddressLine2.Text), 1) = ",", Left(Trim(Me.txtAddressLine2.Text), Len(Trim(Me.txtAddressLine2.Text)) - 1), Trim(Me.txtAddressLine2.Text))
    End If
    
    Dim strSQL As String
        'strSQL = "CDB..insUpdSatsangCentres '" & UCase(Trim(Me.txtSatsangCentreCode.Text)) & "','" & _
        '                                  Replace(Trim(Me.txtSatsangCentreName.Text), "'", "''") & "','" & _
        '                                  Replace(Trim(Me.cmbSatsangCentreType), "'", "''") & "','" & _
        '                                  Replace(Trim(Me.txtAddressLine1.Text), "'", "''") & "','" & _
        '                                  Replace(Trim(Me.txtAddressLine2.Text), "'", "''") & "'," & _
        '                                  Me.txtDistrictOrCityName.Tag & ",'" & _
        '                                  Trim(Me.txtPinOrZipCode.Text) & "'," & _
        '                                  Me.txtFirstName.Tag & ",'" & _
        '                                  Trim(Me.txtTelephone.Text) & "','" & _
        '                                  Replace(Trim(Me.txtEmailAddress.Text), "'", "''") & "','" & _
        '                                  Trim(Me.txtFaxLines.Text) & "','" & _
        '                                  Trim(Me.txtEffectiveFrom.Text) & "','" & _
        '                                  Trim(Me.txtEffectiveTill.Text) & "'," & _
        '                                  IIf(Me.txtID.Text = "", "NULL", Trim(Me.txtID.Text)) & "," & _
        '                                  IIf(varTxnTs = "", "NULL", varTxnTs)
    
    'Added on Oct13,2011 by Bhavna
    strSQL = "CDB..insUpdSatsangCentres '" & UCase(Trim(Me.txtSatsangCentreCode.Text)) & "','" & _
                                        Replace(Trim(Me.txtSatsangCentreName.Text), "'", "''") & "','" & _
                                        Replace(Trim(Me.cmbSatsangCentreType), "'", "''") & "','" & _
                                        Replace(Trim(Me.txtAddressLine1.Text), "'", "''") & "','" & _
                                        Replace(Trim(Me.txtAddressLine2.Text), "'", "''") & "'," & _
                                        Me.txtDistrictOrCityName.Tag & ",'" & _
                                        Trim(Me.txtPinOrZipCode.Text) & "'," & _
                                        Me.txtFirstName.Tag & ",'" & _
                                        Trim(Me.txtTelephone.Text) & "','" & _
                                        Replace(Trim(Me.txtEmailAddress.Text), "'", "''") & "','" & _
                                        Trim(Me.txtFaxLines.Text) & "','" & _
                                        Trim(Me.txtEffectiveFrom.Text) & "','" & _
                                        Trim(Me.txtEffectiveTill.Text) & "'," & _
                                        IIf(Me.txtID.Text = "", "NULL", Trim(Me.txtID.Text)) & ",'" & _
                                        Replace(Trim(Me.txtFileNo.Text), "'", "''") & "'," & _
                                        IIf(varTxnTs = "", "NULL", varTxnTs)
    dbManager.beginTrans
    
    Select Case intMode
        Case uiManager.INSERT_MODE
            strSQL = strSQL & ",0"      '0 - INSERT
            Dim rsSatsangCentres As clsRecordHashMap
            Set rsSatsangCentres = dbManager.executeSQLGetRS(strSQL)
            
            dbManager.commitTrans
            
            logger.logMessage modStandardMessages.ObjectSaveMsg, "Satsang Centre - '" & Me.txtSatsangCentreName.Text & "'|" & rsSatsangCentres.getFieldValueByFieldIndex(0, 0), PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Me.clsWindowInterface_showForm uiManager.INSERT_MODE
            Me.txtSatsangCentreCode.SetFocus
            
        Case uiManager.BROWSE_MODE
            strSQL = strSQL & ",1"      '1 - UPDATE
            dbManager.executeSQL strSQL
            dbManager.commitTrans
            sprListSatsangCentresController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, _
                                                      Me.sprListSatsangCentres.ActiveRow
            Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListSatsangCentres.ActiveRow
            varTxnTs = sprListSatsangCentresController.getTextOfCell(Me.sprListSatsangCentres.ActiveRow, satsangColumns.txn_ts)
            logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            
        Case Default
            dbManager.commitTrans
            errorManager.setErrorAttributes modStandardMessages.InValidMode, "clsWindowInterface_fireSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Err.Raise Err.Number
            
    End Select
    
Exit Sub
    
errortag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsWindowInterface_fireSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
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
    dbManager.executeSQL "CDB..delSatsangCentres " & Trim(Me.txtID.Text) & "," & _
                                                       varTxnTs & "," & _
                                                       Me.txtFirstName.Tag
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
'the retrieval is done in the "sprListSatsangCentresController", so that is returned to the caller.
Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController
    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListSatsangCentresController
End Function

'Implementation of the getSQLStringForRetrieval() function of the clsQueryInterface. This function
'returns the sql string which should be used by ADL to retrieve records in Retrieve mode.
'The query is build based upon the user entries in the different fields of the form.
Public Function clsQueryInterface_getSQLStringForRetrieval() As String

    Dim qrySatsangCentres As String
    
    qrySatsangCentres = "SELECT s.satsang_centre_cd, s.satsang_centre_nm, s.satsang_centre_type, s.address_line_1, s.address_line_2, c.country_id, "
    qrySatsangCentres = qrySatsangCentres & "c.country_nm, st.state_id, st.state_nm, d.district_or_city_id, d.district_nm, s.pin_or_zip_code, "
    qrySatsangCentres = qrySatsangCentres & "s.telephones, s.fax_lines, s.email_addresses, Cast(s.txn_ts As BigInt), "
    qrySatsangCentres = qrySatsangCentres & "Convert(varchar, s.effective_from, 106)effective_from, Convert(varchar, s.effective_till, 106)effective_till, s.satsang_centre_id, "
    'Added on Oct 13,2011
    qrySatsangCentres = qrySatsangCentres & "s.file_no,"
    qrySatsangCentres = qrySatsangCentres & "p.title, p.first_nm, p.middle_nm, p.last_nm, datediff(yyyy,p.birth_dtm,getdate()) as age, p.contact_information, "
    qrySatsangCentres = qrySatsangCentres & "p.email_addresses, p.person_id "
    qrySatsangCentres = qrySatsangCentres & "FROM satsang_centres s, countries c, states st, districts_or_cities d, persons p "
    qrySatsangCentres = qrySatsangCentres & "WHERE s.district_or_city_id = d.district_or_city_id AND s.secretary = p.person_id AND "
    qrySatsangCentres = qrySatsangCentres & "d.state_id = st.state_id AND st.country_id = c.country_id AND "
    
    If Trim(Me.txtAddressLine1.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.address_line_1 LIKE '%" & Replace(Trim(Me.txtAddressLine1.Text), "'", "''") & "%' AND "
    End If
    
    If Trim(Me.txtAddressLine2.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.address_line_2 LIKE '%" & Replace(Trim(Me.txtAddressLine2.Text), "'", "''") & "%' AND "
    End If
    
    If Trim(Me.txtCountryName.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "c.country_nm LIKE '%" & Replace(Trim(Me.txtCountryName.Text), "'", "''") & "%' AND "
    End If
    
    If Trim(Me.txtDistrictOrCityName.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "d.district_nm LIKE '%" & Replace(Trim(Me.txtDistrictOrCityName.Text), "'", "''") & "%' AND "
    End If
    
    If Trim(Me.txtEffectiveFrom.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.effective_from = '" & Trim(Me.txtEffectiveFrom.Text) & "' AND "
    End If
    
    If Trim(Me.txtEffectiveTill.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.effective_till = '" & Trim(Me.txtEffectiveTill.Text) & "' AND "
    End If
    
    If Trim(Me.txtEmailAddress.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.email_addresses LIKE '%" & Replace(Trim(Me.txtEmailAddress.Text), "'", "''") & "%' AND "
    End If
    
    If Trim(Me.txtFaxLines.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.fax_lines LIKE '%" & Trim(Me.txtFaxLines.Text) & "%' AND "
    End If
    
    If Trim(Me.txtID.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.satsang_centre_id = '" & Trim(Me.txtID.Text) & "' AND "
    End If
    
    If Trim(Me.txtPinOrZipCode.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.pin_or_zip_code LIKE '%" & Trim(Me.txtPinOrZipCode.Text) & "%' AND "
    End If
    
    If Trim(Me.txtSatsangCentreCode.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.satsang_centre_cd LIKE '%" & Trim(Me.txtSatsangCentreCode.Text) & "%' AND "
    End If
    
    If Trim(Me.txtSatsangCentreName.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.satsang_centre_nm LIKE '%" & Replace(Trim(Me.txtSatsangCentreName.Text), "'", "''") & "%' AND "
    End If

    If Trim(Me.txtStateName.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "st.state_nm LIKE '%" & Replace(Trim(Me.txtStateName.Text), "'", "''") & "%' AND "
    End If

    If Trim(Me.txtTelephone.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.telephones LIKE '%" & Trim(Me.txtTelephone.Text) & "%' AND "
    End If

    If Trim(Me.cmbSatsangCentreType) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.satsang_centre_type LIKE '%" & Replace(Trim(Me.cmbSatsangCentreType), "'", "''") & "%' AND "
    End If
    
    If Trim(Me.txtFirstName.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "p.first_nm LIKE '%" & Replace(Trim(Me.txtFirstName.Text), "'", "''") & "%' AND "
    End If
    
    If Trim(Me.txtLastName.Text) <> "" Then
        qrySatsangCentres = qrySatsangCentres & "p.last_nm LIKE '%" & Replace(Trim(Me.txtLastName.Text), "'", "''") & "%' AND "
    End If
    
    If Me.txtFirstName.Tag <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.secretary = '" & Me.txtFirstName.Tag & "' AND "
    End If
    
    'Added on Oct 13,2011 by Bhavna
    If Me.txtFileNo.Tag <> "" Then
        qrySatsangCentres = qrySatsangCentres & "s.file_no = '" & Me.txtFileNo.Tag & "' AND "
    End If
    
    
    qrySatsangCentres = Left(Trim(qrySatsangCentres), Len(Trim(qrySatsangCentres)) - 3)
    qrySatsangCentres = qrySatsangCentres & " ORDER BY satsang_centre_id"

    clsQueryInterface_getSQLStringForRetrieval = qrySatsangCentres
          
End Function

'Implementation of the populateFieldsFromRetrievalSpread() method of the clsQueryInterface. All the fields are
'populated from the spread where the records are retrieved. Parameter p_lonrow states the row of the spread
'whose values are to be set in respective fields.
Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)

    Dim varTemp As Variant

    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.code)
    Me.txtSatsangCentreCode.Text = CStr(Trim(varTemp))
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.Name)
    Me.txtSatsangCentreName.Text = CStr(varTemp)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.centreType)
    Me.cmbSatsangCentreType = CStr(varTemp)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.Add1)
    Me.txtAddressLine1.Text = CStr(varTemp)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.Add2)
    Me.txtAddressLine2.Text = CStr(varTemp)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.countryID)
    Me.txtCountryName.Tag = varTemp
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.Country)
    Me.txtCountryName.Text = CStr(varTemp)
    Me.txtCountryName.DataField = Me.txtCountryName.Text
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.stateID)
    Me.txtStateName.Tag = varTemp
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.state)
    Me.txtStateName.Text = CStr(varTemp)
    Me.txtStateName.DataField = Me.txtStateName.Text
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.distCityID)
    Me.txtDistrictOrCityName.Tag = varTemp
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.distCity)
    Me.txtDistrictOrCityName.Text = CStr(varTemp)
    Me.txtDistrictOrCityName.DataField = Me.txtDistrictOrCityName.Text
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.pinZipCode)
    Me.txtPinOrZipCode.Text = CStr(varTemp)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.Telephone)
    Me.txtTelephone.Text = CStr(varTemp)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.Fax)
    Me.txtFaxLines.Text = CStr(varTemp)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.EmailAdd)
    Me.txtEmailAddress.Text = CStr(varTemp)
    varTxnTs = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.txn_ts)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.effectivefrom)
    Me.txtEffectiveFrom.Text = Format(CDate(varTemp), "dd-mmm-yyyy")
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.effectiveTill)
    Me.txtEffectiveTill.Text = Format(CDate(varTemp), "dd-mmm-yyyy")
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.centreID)
    Me.txtID.Text = varTemp
    
    'Added on Oct13,2011 by Bhavna
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.FileNo)
    Me.txtFileNo.Text = varTemp
    
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.Title)
    Me.txtTitle.Text = CStr(varTemp)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.firstName)
    Me.txtFirstName.Text = CStr(varTemp)
    Me.txtFirstName.DataField = Me.txtFirstName.Text
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.middleName)
    Me.txtMiddleName.Text = CStr(varTemp)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.lastName)
    Me.txtLastName.Text = CStr(varTemp)
    Me.txtLastName.DataField = Me.txtLastName.Text
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.Age)
    Me.txtAge.Text = varTemp
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.CellResNo)
    Me.txtPersonPhone.Text = CStr(varTemp)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.personEmail)
    Me.txtPersonEmail.Text = CStr(varTemp)
    varTemp = sprListSatsangCentresController.getTextOfCell(p_lonRow, satsangColumns.personID)
    Me.txtFirstName.Tag = varTemp
    
End Sub

Public Sub clsWindowInterface_fireClose()

End Sub

'Implementation of the fireErase() method of the clsWindowInterface. All the Controls and spreads of the form are
'cleared of any data. clearSpread() method of the spreadController is called for clearing the spreads.
Public Sub clsWindowInterface_fireErase()
    
    'clearing the controls
    utils.clearControls Me.txtAddressLine1, Me.txtAddressLine2, Me.txtAge, Me.txtCountryName, _
                                  Me.txtDistrictOrCityName, Me.txtEmailAddress, Me.txtFaxLines, _
                                  Me.txtFirstName, Me.txtID, Me.txtLastName, Me.txtMiddleName, _
                                  Me.txtPersonEmail, Me.txtPersonPhone, Me.txtPinOrZipCode, _
                                  Me.txtSatsangCentreCode, Me.txtSatsangCentreName, Me.txtStateName, _
                                  Me.txtTelephone, Me.txtTitle, Me.cmbSatsangCentreType, Me.txtFileNo
       
    'dates are cleared in Query Mode, otherwise default or existing values are set
    Select Case intMode
        Case uiManager.QUERY_MODE
            Me.txtEffectiveFrom.Text = ""
            Me.txtEffectiveTill.Text = ""
        Case uiManager.INSERT_MODE
            Me.txtEffectiveFrom.Text = Format(Date, "dd-mmm-yyyy")
            Me.txtEffectiveTill.Text = "31-Dec-9999"
    End Select
    
    'to clear and load the default values in the satsang centre type combobox
    clearLoadDropdowns
    
    'clear the spread
    If Not Me.sprListSatsangCentres Is Nothing Then
        sprListSatsangCentresController.clearSpread
    End If
    
End Sub

'This is a private method to this code module. It first clears and then loads values into satsang centre type
'comboBox from it's respective tables.
Private Sub clearLoadDropdowns()
On Error GoTo errortag
    'The comboBox is cleared first because this method is called in showForm() method of clsWindowInterface.
    'The latter method is called each time the form gets loaded or switches to different modes. Hence if the
    'combobox is not cleared first then the values will go on adding and adding to them.
    Me.cmbSatsangCentreType.Clear

    Dim rsSelectSatsangCentreType As clsRecordHashMap
    Dim intLoop As Long
    
    dbManager.beginTrans
    Set rsSelectSatsangCentreType = dbManager.executeSQLGetRS("SELECT satsang_centre_type FROM satsang_centre_types")
    For intLoop = 0 To (rsSelectSatsangCentreType.getNoOfRecords - 1)
        Me.cmbSatsangCentreType.AddItem rsSelectSatsangCentreType.getFieldValueByFieldIndex(intLoop, 0)
    Next intLoop
    dbManager.commitTrans
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clearLoadDropDowns", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed while loading combobox - satsang centre type"
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
    clsWindowInterface_getScreenID = "LOC_01"
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
        'to clear and load the Satsang Centre Type comboBox.
        clearLoadDropdowns
    End If
    
    Me.Visible = True
    Me.ZOrder 0
    setEnableDisableControls
    
End Sub

'This is a private method to this code module. Here spread controllers are initialized and columns are
'added to them for all the respective spreads in this form.
Private Sub setSpreadController()
    
    'initializing and adding columns to sprListSatsangCentresController of satsang centres

    Set sprListSatsangCentresController = New clsSpreadController
    sprListSatsangCentresController.registerSpreadInstance uiManager, Me.sprListSatsangCentres, LIST_SPREAD, Me, , , SCROLLABLE
    sprListSatsangCentresController.setHeaderHeight 600
    
    sprListSatsangCentresController.addColumn "Centre Code", 8, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Centre Name", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Centre Type", 12, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Address", 50, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Address", 50, STATIC_TEXT_CELL_TYPE, False, False
    sprListSatsangCentresController.addColumn "Country ID", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListSatsangCentresController.addColumn "Country", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "State ID", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListSatsangCentresController.addColumn "State", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Dist/City ID", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListSatsangCentresController.addColumn "District Or City", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Pin / Zip Code", 8, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListSatsangCentresController.addColumn "Telephone(s)", 12, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListSatsangCentresController.addColumn "Fax", 12, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListSatsangCentresController.addColumn "Email Address(es)", 40, STATIC_TEXT_CELL_TYPE, False, False
    sprListSatsangCentresController.addColumn "Txn Ts", 0, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Effective From", 10, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Effective   Till", 10, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Centre ID", 7, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    'Added on Oct 13, 2011 By Bhavna
    sprListSatsangCentresController.addColumn "File No", 20, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Title", 6, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "First Name", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Middle Name", 30, STATIC_TEXT_CELL_TYPE, False, False
    sprListSatsangCentresController.addColumn "Last Name", 30, STATIC_TEXT_CELL_TYPE, False, True
    sprListSatsangCentresController.addColumn "Age", 4, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListSatsangCentresController.addColumn "Cell / Res. Phone", 12, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
    sprListSatsangCentresController.addColumn "Email Address(es)", 40, STATIC_TEXT_CELL_TYPE, False, False
    sprListSatsangCentresController.addColumn "Person ID", 7, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls()

    Select Case intMode
    
        Case uiManager.INSERT_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            sprListSatsangCentresController.setSpreadMode intMode
            Me.fraSatsangCentre.ZOrder 0
            Me.txtSatsangCentreCode.SetFocus
            
        Case uiManager.QUERY_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID
            sprListSatsangCentresController.setSpreadMode intMode
            Me.fraSatsangCentre.ZOrder 0
            Me.txtID.SetFocus
            
        Case uiManager.RETRIEVE_MODE
        
            sprListSatsangCentresController.setSpreadMode intMode
            Me.fraSatsangCentre.ZOrder 0
            
        Case uiManager.BROWSE_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            sprListSatsangCentresController.setSpreadMode intMode
            Me.fraSatsangCentre.ZOrder 0
            Me.txtSatsangCentreCode.SetFocus
            
        Case uiManager.LIST_MODE
        
            sprListSatsangCentresController.setSpreadMode intMode
            Me.fraListSatsangCentres.ZOrder 0
            
    End Select
    
End Sub

'The method sets the status text of the main screen
Private Sub cmbSatsangCentreType_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub cmbSatsangCentreType_Validate(Cancel As Boolean)
    validateSatsangCentreType
End Sub

Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.lbFirstName, Me.lblAddressLine1, Me.lblAge, Me.lbLastName, Me.lblCountryName, Me.lblDistrictOrCity, Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblEmailAddress, Me.lblEmailAdress, Me.lblFaxLines, Me.lblId, Me.lblMiddleName, Me.lblPhone, Me.lblPinOrZipCode, Me.lblSatsangCentreCode, Me.lblSatsangCentreName, Me.lblSatsangCentreType, Me.lblStateName, Me.lblTelephone, Me.lblTitle, _
                                                         Me.txtAddressLine1, Me.txtAddressLine2, Me.txtAge, Me.txtCountryName, Me.txtDistrictOrCityName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtEmailAddress, Me.txtFaxLines, Me.txtFirstName, Me.txtID, Me.txtLastName, Me.txtMiddleName, Me.txtPersonEmail, Me.txtPersonPhone, Me.txtPinOrZipCode, Me.txtSatsangCentreCode, Me.txtSatsangCentreName, Me.txtStateName, Me.txtTelephone, Me.txtTitle, Me.cmbSatsangCentreType
    modControlsSettings.setStateToNormal Me.txtAddressLine1, Me.txtAddressLine2, Me.txtCountryName, Me.txtDistrictOrCityName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtEmailAddress, Me.txtFaxLines, Me.txtFirstName, Me.txtID, Me.txtLastName, Me.txtPinOrZipCode, Me.txtSatsangCentreCode, Me.txtSatsangCentreName, Me.txtStateName, Me.txtTelephone, Me.txtTitle, Me.cmbSatsangCentreType
    modControlsSettings.setStateToReadOnly Me.txtAge, Me.txtMiddleName, Me.txtTitle, Me.txtPersonEmail, Me.txtPersonPhone
    Me.txtCountryName.ButtonStyle = ButtonStylePopUp
    Me.txtStateName.ButtonStyle = ButtonStylePopUp
    Me.txtDistrictOrCityName.ButtonStyle = ButtonStylePopUp
    Me.txtFirstName.ButtonStyle = ButtonStylePopUp
    Me.txtLastName.ButtonStyle = ButtonStylePopUp
End Sub

Private Sub txtAddressLine1_Validate(Cancel As Boolean)
    validateAddress
End Sub

Private Sub txtAge_Validate(Cancel As Boolean)
    validateAge
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
            Me.txtCountryName.SetFocus
            Cancel = True
        End If
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtCountryName_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed during lookup"
    errorManager.handleError
End Sub

Private Sub txtDistrictOrCityName_Validate(Cancel As Boolean)
On Error GoTo errortag

    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup for district or city can be called when it is not empty in mode other than QUERY mode
    If (validateDistCityName) Then
    
        'enforcing to fill state before calling lookup
        If Me.txtStateName.Text = "" Then
            logger.logMessage modStandardMessages.ValueReqd, "State Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Cancel = True
            Me.txtDistrictOrCityName.Text = ""
            Me.txtStateName.SetFocus
            Exit Sub
        End If
        
        'lookup called
        If (Me.txtDistrictOrCityName.DataField <> Me.txtDistrictOrCityName.Text) Then
            Dim additionalValues As New Collection
            additionalValues.Add Me.txtStateName.Tag, "state_id"
            additionalValues.Add Me.txtStateName.Text, "state_nm"
            additionalValues.Add Me.txtCountryName.Tag, "country_id"
            additionalValues.Add Me.txtCountryName.Text, "country_nm"
            modCDBLookUps.showLookUpForDistrictsOrCities Me, Me.txtDistrictOrCityName, modMain.districtsOrCities, Me.txtDistrictOrCityName.Text, enmLookupSearchModes.Logical, additionalValues
        End If
        
        'enforcing the control to hold a value selected from lookup
        If (Me.txtDistrictOrCityName.DataField <> Me.txtDistrictOrCityName.Text) Then
            logger.logMessage modStandardMessages.InvalidValue, "District or City - '" & Trim(Me.txtDistrictOrCityName.Text) & "'|State - '" & Trim(Me.txtStateName.Text) & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Me.txtDistrictOrCityName.SelStart = 0
            Me.txtDistrictOrCityName.SelLength = Len(Trim(Me.txtDistrictOrCityName.Text))
            Me.txtDistrictOrCityName.SetFocus
            Cancel = True
        End If
        
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtDistrictOrCityName_Validate", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
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

Private Sub txtFirstName_Validate(Cancel As Boolean)
On Error GoTo errortag

    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup for first name is called when it is not empty in mode other than QUERY mode
    If (validateFirstName) Then
        'lookup called
        If (Me.txtFirstName.DataField <> Me.txtFirstName.Text) Then
            modCDBLookUps.showLookUpForFirstName Me, Me.txtFirstName, modMain.persons, Me.txtFirstName.Text, enmLookupSearchModes.Logical
        End If
        'enforcing the control to hold a value selected from the lookup
        If (Me.txtFirstName.DataField <> Me.txtFirstName.Text) Then
            logger.logMessage modStandardMessages.NotExist, "First Name - '" & Trim(Me.txtFirstName.Text) & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Me.txtFirstName.SelStart = 0
            Me.txtFirstName.SelLength = Len(Trim(Me.txtFirstName.Text))
            Me.txtFirstName.SetFocus
            Cancel = True
        End If
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtFirstName_Validate", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub txtLastName_Validate(Cancel As Boolean)
On Error GoTo errortag

    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup for last name is called when it is not empty in mode other than QUERY mode
    If (validateLastName) Then
        'lookup called
        If (Me.txtLastName.DataField <> Me.txtLastName.Text) Then
            modCDBLookUps.showLookUpForLastName Me, Me.txtLastName, modMain.persons, Me.txtLastName.Text, enmLookupSearchModes.Logical
        End If
        'enforcing the control to hold a value selected from the lookup
        If (Me.txtLastName.DataField <> Me.txtLastName.Text) Then
            logger.logMessage modStandardMessages.NotExist, "Last Name - '" & Trim(Me.txtLastName.Text) & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Me.txtLastName.SelStart = 0
            Me.txtLastName.SelLength = Len(Trim(Me.txtLastName.Text))
            Me.txtLastName.SetFocus
            Cancel = True
        End If
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtStateName_Validate", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub txtSatsangCentreCode_Validate(Cancel As Boolean)
    validateSatsangCentreCode
End Sub

Private Sub txtSatsangCentreName_Validate(Cancel As Boolean)
    validateSatsangCentreName
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
        If (Me.txtStateName.DataField <> Me.txtStateName.Text) Then
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
Private Sub txtTitle_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

'The method sets the status text of the main screen
Private Sub txtAddressLine1_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtAddressLine2_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtAge_GotFocus()
    uiManager.setStatusText ""
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookUpForCountries() is the common place
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


'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookUpForDistrictsOrCities() is the common place
'where the lookup on the person has been provided
Private Sub txtDistrictOrCityName_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    
    If (Me.txtStateName.Text <> "") Then
        Dim additionalValues As New Collection
        additionalValues.Add Me.txtStateName.Tag, "state_id"
        additionalValues.Add Me.txtStateName.Text, "state_nm"
        additionalValues.Add Me.txtCountryName.Tag, "country_id"
        additionalValues.Add Me.txtCountryName.Text, "country_nm"
        modCDBLookUps.showLookUpForDistrictsOrCities Me, Me.txtDistrictOrCityName, modMain.districtsOrCities, Me.txtDistrictOrCityName.Text, enmLookupSearchModes.absolute, additionalValues
    'in query mode, when state is not specified, show all the existing districts or cities
    ElseIf intMode = uiManager.QUERY_MODE Then
        modCDBLookUps.showLookUpForDistrictsOrCities Me, Me.txtDistrictOrCityName, modMain.districtsOrCities, Me.txtDistrictOrCityName.Text, enmLookupSearchModes.absolute
    Else
        logger.logMessage modStandardMessages.ValueReqd, "District or City Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        Me.txtStateName.SetFocus
    End If
    
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtDistrictOrCityName_ButtonHit", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed during lookup"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtDistrictOrCityName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please hit the button for Lookup Dialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtDistrictOrCityName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call txtDistrictOrCityName_ButtonHit(0, 0)
    End If
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

'The method sets the status text of the main screen
Private Sub txtEffectiveTill_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please enter date greater than Effective From Date"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

'The method sets the status text of the main screen
Private Sub txtEmailAddress_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtFaxLines_GotFocus()
    uiManager.setStatusText ""
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookUpForPersons() is the common place
'where the lookup on the person has been provided

Private Sub txtFirstName_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    modCDBLookUps.showLookUpForFirstName Me, Me.txtFirstName, modMain.persons, Me.txtFirstName.Text, enmLookupSearchModes.absolute
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtFirstName_ButtonHit", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed during lookup"
    errorManager.handleError
End Sub


'The method sets the status text of the main screen
Private Sub txtFirstName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please hit the button for Lookup Dialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtFirstName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call txtFirstName_ButtonHit(0, 0)
    End If
End Sub

'The method sets the status text of the main screen
Private Sub txtID_GotFocus()
    uiManager.setStatusText ""
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookUpForPersons() is the common place
'where the lookup on the person has been provided
Private Sub txtLastName_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    modCDBLookUps.showLookUpForLastName Me, Me.txtLastName, modMain.persons, Me.txtLastName.Text, enmLookupSearchModes.absolute
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtLastName_ButtonHit", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed during lookup"
    errorManager.handleError
End Sub

'The method sets the status text of the main screen
Private Sub txtLastName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please hit the button for Lookup Dialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtLastName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call txtLastName_ButtonHit(0, 0)
    End If
End Sub

'The method sets the status text of the main screen
Private Sub txtMiddleName_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtPersonEmail_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtPersonPhone_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtPinOrZipCode_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtSatsangCentreCode_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtSatsangCentreName_GotFocus()
    uiManager.setStatusText ""
End Sub

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookUpForStates() is the common place
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
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtStateName_ButtonHit", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed during lookup"
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

'The method sets the status text of the main screen
Private Sub txtTelephone_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtTitle_Validate(Cancel As Boolean)
    validateTitle
End Sub
