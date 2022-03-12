VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "Edt32x30.ocx"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.ocx"
Begin VB.Form frmPersons 
   BackColor       =   &H00C0C0C0&
   Caption         =   "PERSONS"
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
   Begin VB.Frame fraPersons 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   10095
      Left            =   0
      TabIndex        =   33
      Top             =   0
      Width           =   12195
      Begin EditLib.fpBoolean chkIsDeraResident 
         Height          =   315
         Left            =   5280
         TabIndex        =   14
         Top             =   1830
         Width           =   1935
         _Version        =   196608
         _ExtentX        =   3413
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
         ThreeDOutsideHighlightColor=   -2147483628
         ThreeDOutsideShadowColor=   -2147483632
         ThreeDOutsideWidth=   1
         ThreeDFrameWidth=   0
         BorderStyle     =   0
         BorderColor     =   -2147483642
         BorderWidth     =   1
         AutoToggle      =   -1  'True
         BooleanStyle    =   0
         ToggleFalse     =   ""
         TextFalse       =   "Dera Resident"
         BooleanPicture  =   0
         AlignPictureH   =   3
         AlignPictureV   =   1
         GroupId         =   0
         GroupTag        =   0
         GroupSelect     =   0
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
         ThreeDTextHighlightColor=   -2147483633
         ThreeDTextShadowColor=   -2147483632
         ThreeDTextOffset=   1
         BorderGrayAreaColor=   -2147483637
         ToggleGrayed    =   ""
         TextGrayed      =   ""
         AllowMnemonic   =   -1  'True
         BackColor       =   12632256
         ForeColor       =   -2147483640
         ThreeDOnFocusInvert=   0   'False
         Caption         =   "Dera Resident"
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   0
         BorderDropShadowColor=   -2147483632
         BorderDropShadowWidth=   3
         BooleanDataType =   0
         OLEDropMode     =   0
      End
      Begin EditLib.fpText txtID 
         Height          =   350
         Left            =   510
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
         ForeColor       =   -2147483641
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
      Begin EditLib.fpDateTime txtInitiationDate 
         Height          =   350
         Left            =   510
         TabIndex        =   20
         Top             =   3440
         Width           =   1515
         _Version        =   196608
         _ExtentX        =   2672
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
         UserEntry       =   1
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
      Begin EditLib.fpText txtFirstName 
         Height          =   350
         Left            =   2160
         TabIndex        =   5
         Top             =   1220
         Width           =   2955
         _Version        =   196608
         _ExtentX        =   5212
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
         AutoCase        =   0
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
      Begin EditLib.fpText txtAdditionalInfo 
         Height          =   350
         Left            =   510
         TabIndex        =   26
         Top             =   4180
         Width           =   4575
         _Version        =   196608
         _ExtentX        =   8070
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
      Begin EditLib.fpText txtEmailAddress 
         Height          =   350
         Left            =   5280
         TabIndex        =   18
         Top             =   2700
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
      Begin EditLib.fpText txtLastName 
         Height          =   350
         Left            =   8340
         TabIndex        =   9
         Top             =   1220
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
      Begin EditLib.fpText txtInitiatedBy 
         Height          =   350
         Left            =   2160
         TabIndex        =   22
         Top             =   3440
         Width           =   2775
         _Version        =   196608
         _ExtentX        =   4895
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
      Begin EditLib.fpDateTime txtBirthDateTime 
         Height          =   350
         Left            =   2160
         TabIndex        =   13
         Top             =   1960
         Width           =   2055
         _Version        =   196608
         _ExtentX        =   3625
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
         UserDefinedFormat=   "dd mmm yyyy hh:nn"
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
      Begin EditLib.fpText txtPlace 
         Height          =   350
         Left            =   5280
         TabIndex        =   24
         Top             =   3440
         Width           =   3555
         _Version        =   196608
         _ExtentX        =   6271
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
      Begin EditLib.fpText txtMiddleName 
         Height          =   350
         Left            =   5280
         TabIndex        =   7
         Top             =   1220
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
      Begin EditLib.fpText txtContactInfo 
         Height          =   350
         Left            =   480
         TabIndex        =   16
         Top             =   2700
         Width           =   3765
         _Version        =   196608
         _ExtentX        =   6641
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
         CharValidationText=   "1234567890()- ,ppPPextEXT"
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
      Begin VB.ComboBox cmbGender 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   360
         Left            =   480
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   1960
         Width           =   1170
      End
      Begin VB.ComboBox cmbTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Height          =   360
         Left            =   510
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   1220
         Width           =   1425
      End
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   345
         Left            =   2370
         TabIndex        =   30
         Top             =   4920
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
         Left            =   510
         TabIndex        =   28
         Top             =   4920
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
      Begin VB.Label lblEffectiveTill 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   2370
         TabIndex        =   29
         Top             =   4680
         Width           =   1080
      End
      Begin VB.Label lblEffectiveFrom 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   510
         TabIndex        =   27
         Top             =   4680
         Width           =   1290
      End
      Begin VB.Label lblGender 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Gender "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   480
         TabIndex        =   10
         Top             =   1720
         Width           =   660
      End
      Begin VB.Label lblContactInfo 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Cell Phone No. / Residence Telephone"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   510
         TabIndex        =   15
         Top             =   2460
         Width           =   3345
      End
      Begin VB.Label lblId 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ID"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   510
         TabIndex        =   0
         Top             =   240
         Width           =   180
      End
      Begin VB.Label lblInitiatedBy 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Initiated By"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   2160
         TabIndex        =   21
         Top             =   3200
         Width           =   975
      End
      Begin VB.Label lblInitiation 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Initiation Date"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   510
         TabIndex        =   19
         Top             =   3200
         Width           =   1185
      End
      Begin VB.Label lblEmailAddress 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Email Address(es)"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5280
         TabIndex        =   17
         Top             =   2460
         Width           =   1605
      End
      Begin VB.Label lblMiddleName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Middle Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5280
         TabIndex        =   6
         Top             =   980
         Width           =   1200
      End
      Begin VB.Label lbAdditionalInfo 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Additional Information "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   510
         TabIndex        =   25
         Top             =   3940
         Width           =   1920
      End
      Begin VB.Label lblPlace 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Place"
         ForeColor       =   &H00800000&
         Height          =   300
         Left            =   5280
         TabIndex        =   23
         Top             =   3200
         Width           =   2055
      End
      Begin VB.Label lblTitle 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Title "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   510
         TabIndex        =   2
         Top             =   980
         Width           =   390
      End
      Begin VB.Label lblBirthDateTime 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Birth Date -Time "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   2160
         TabIndex        =   12
         Top             =   1720
         Width           =   1470
      End
      Begin VB.Label lbLastName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Last Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   8340
         TabIndex        =   8
         Top             =   980
         Width           =   1005
      End
      Begin VB.Label lbFirstName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "First Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   2160
         TabIndex        =   4
         Top             =   980
         Width           =   1020
      End
   End
   Begin VB.Frame fraListPersons 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   10035
      Left            =   0
      TabIndex        =   31
      Top             =   0
      Width           =   12135
      Begin FPSpread.vaSpread sprListPersons 
         Height          =   6465
         Left            =   120
         TabIndex        =   32
         TabStop         =   0   'False
         Tag             =   "Persons List Spread"
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
         SpreadDesigner  =   "frmPersons.frx":0000
      End
   End
End
Attribute VB_Name = "frmPersons"
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

'stores newly generated person ID returned in fireSave() method of clsEditInterface. the
'variable holding ID is displayed in message bar in Insert Mode as well as is called in
'getReturnValues() method of clsCalledFormInterface to set the local variable strIDText in NewMode
Dim intPersonID As Long

'stores the value of txn_ts. the variable is filled in the populateFieldsFromRetrievalSpread method of
'the clsQueryInterface
Dim varTxnTs As Variant

Dim intApplicationID As Long
Dim intScreenID As Long

'The declaration of spread controller for retrieving the records from the persons table. This spread controller
'is also used to show the records in list mode. This object variable is defined "withEvents" because this code
'module needs to catch the events thrown by this controller (like 'validateCell','validateRow' etc)
Dim sprListPersonsController As clsSpreadController

'This enum holds all the column numbers of the spread controller 'sprListPersonsController' that shows all the
'records of persons. The column numbers are stored into variables named corresponding to column names. These are
'called in functions of spreadController like 'getTextOfCell' or 'setTextOfCell' which requires row & column number.
Private Enum personColumns
    Title = 1
    firstName
    middleName
    lastName
    deraResident
    birthDate
    gender
    CellResNo
    EmailAdd
    addInfo
    initiationDate
    initiatedBy
    initiationPlace
    initiationID
    applID
    screenID
    effectivefrom
    effectiveTill
    txn_ts
    personID
End Enum

'Implementation of 'getReturnValues()' method of the clsCalledFormInterface. This method returns the displayText
'and the idText to the calling form throught the setReturnedValues() method of the clsCallingFormInterface of
'the. The arguments passed are by reference.
Public Sub clsCalledFormInterface_getReturnValues(p_strDisplayText As String, _
                                                  p_strIDText As String, _
                                                    p_colAdditionalValues As Collection)
                                                  
    p_strDisplayText = Trim(Me.txtFirstName.Text)
    Dim intAge As Long
    intAge = DateDiff("yyyy", Me.txtBirthDateTime.Text, Date)
    
    p_colAdditionalValues.Add Me.cmbTitle, "title"
    p_colAdditionalValues.Add Me.txtFirstName.Text, "first_nm"
    p_colAdditionalValues.Add Me.txtMiddleName.Text, "middle_nm"
    p_colAdditionalValues.Add Me.txtLastName.Text, "last_nm"
    p_colAdditionalValues.Add intAge, "age"
    p_colAdditionalValues.Add intPersonID, "person_id"
    p_colAdditionalValues.Add Me.txtContactInfo.Text, "contact_information"
    p_colAdditionalValues.Add Me.txtEmailAddress.Text, "email_addresses"
    
    Select Case intMode
        Case uiManager.NEW_MODE
            p_strIDText = intPersonID
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
        Case uiManager.UPDATE_MODE, uiManager.REFERENCE_MODE
            Me.txtID.Text = p_strIDText
            sprListPersonsController.retrieveRecords Me.clsQueryInterface_getSQLStringForRetrieval
            clsQueryInterface_populateFieldsFromRetrievalSpread (1)
    End Select
Exit Sub
            
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsCalledFormInterface_showCalledForm", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsCallingFormInterface_getForeignKeyInformation(p_objActiveControl As Object, _
                                            p_objCallForm As Object, _
                                            p_strDisplayText As String, _
                                            p_strIDText As String, _
                                            p_colAdditionalValues As Collection)

End Sub

Public Sub clsCallingFormInterface_setReturnedValues(p_objSourceObject As Object, _
                                                     ByVal p_strDisplayText As String, _
                                                     ByVal p_strIDText As String, _
                                                    p_colAdditionalValues As Collection)

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
        If (Trim(Me.cmbTitle.Text) = "Ms." Or Trim(Me.cmbTitle.Text) = "Dr. (Ms)") Then
            If Trim(Me.cmbGender.Text) = "Male" Then
                logger.logMessage modStandardMessages.InvalidValue, "Gender - " & Trim(Me.cmbGender.Text) & "|Title - " & Trim(Me.cmbTitle.Text), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
                Me.cmbGender.SetFocus
                validateGender = False
            End If
        Else
            If Trim(Me.cmbGender.Text) = "Female" Then
                logger.logMessage modStandardMessages.InvalidValue, "Gender - " & Trim(Me.cmbGender.Text) & "|Title - " & Trim(Me.cmbTitle.Text), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
                Me.cmbGender.SetFocus
                validateGender = False
            End If
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
        Me.txtBirthDateTime.SetFocus
        logger.logMessage modStandardMessages.LesserOrEqualValueReqd, "Birth Date|Current Date - " & Format(Date, "dd MMM yyyy"), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateBirthDate = False
    ElseIf Len(Trim(Me.txtBirthDateTime.Text)) < 11 Then
        Me.txtBirthDateTime.SetFocus
        logger.logMessage modStandardMessages.InvalidValue, Trim(Me.txtBirthDateTime.Text) & "|Birth Date", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateBirthDate = False
    ElseIf DateDiff("d", Trim(Me.txtBirthDateTime.Text), "01 Jan 1900") > 0 Then
        logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Birth Date|01 Jan 1900", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateBirthDate = False
    End If

End Function

'Implementation of the isReadyToSave function of the interface - clsEditInterface. No invalid data
'should enter into database. Thus before saving record, certain checks are carried out in this function. If all
'the checks are cleared then the function returns boolean value 'True' otherwise returns boolean value 'False'
'and a descriptive error or warning message is generated.
Public Function clsEditInterface_isReadyToSave() As Boolean
    clsEditInterface_isReadyToSave = True
    
    'validate event of last focused control is called
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
    strSQL = "CDB..insUpdPersons '" & Replace(Trim(Me.cmbTitle), "'", "''") & "','" & _
                                      Replace(Trim(Me.txtFirstName.Text), "'", "''") & "'," & _
                                      IIf(Me.txtMiddleName.Text = "", "NULL", "'" & Replace(Trim(Me.txtMiddleName.Text), "'", "''") & "'") & ",'" & _
                                      Replace(Trim(Me.txtLastName.Text), "'", "''") & "'," & _
                                      IIf(Me.chkIsDeraResident.Value = ValueFalse, "'No '", "'Yes'") & ",'" & _
                                      Trim(Me.txtBirthDateTime.Text) & "','" & _
                                      Trim(Me.cmbGender) & "'," & _
                                      IIf(Trim(Me.txtContactInfo.Text) = "", "NULL", "'" & Trim(Me.txtContactInfo.Text) & "'") & "," & _
                                      IIf(Trim(Me.txtEmailAddress.Text) = "", "NULL", "'" & Replace(Trim(Me.txtEmailAddress.Text), "'", "''") & "'") & "," & _
                                      IIf(Trim(Me.txtAdditionalInfo.Text) = "", "NULL", "'" & Replace(Trim(Me.txtAdditionalInfo.Text), "'", "''") & "'") & ",'" & _
                                      uiManager.ApplicationContext.ARG_PACKAGE_ID & "','" & _
                                      Me.clsWindowInterface_getScreenID & "'," & _
                                      IIf(Trim(Me.txtInitiatedBy.Tag) = "", "NULL", "'" & Trim(Me.txtInitiatedBy.Tag) & "'") & ",'" & _
                                      Trim(Me.txtEffectiveFrom.Text) & "','" & _
                                      Trim(Me.txtEffectiveTill.Text) & "'," & _
                                      IIf(Me.txtID.Text = "", 0, Trim(Me.txtID.Text)) & "," & _
                                      IIf(varTxnTs = "", "NULL", varTxnTs)
    dbManager.beginTrans
    
    Select Case intMode
    
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
        
            strSQL = strSQL & ",0"      '0 - INSERT
            Dim rsPersons As clsRecordHashMap
            Set rsPersons = dbManager.executeSQLGetRS(strSQL)
            intPersonID = rsPersons.getFieldValueByFieldIndex(0, 0)
            dbManager.commitTrans
            
            If intMode = uiManager.INSERT_MODE Then
                logger.logMessage modStandardMessages.ObjectSaveMsg, "Person '" & Trim(Me.txtFirstName.Text) & " " & Trim(Me.txtMiddleName.Text) & " " & Trim(Me.txtLastName.Text) & "'|" & intPersonID, PLAIN_MESSAGE
                'in case of insert mode, the screen has to get cleared of any data and get ready to insert more data
                Me.clsWindowInterface_showForm uiManager.INSERT_MODE
                Me.cmbTitle.SetFocus
            End If
            
        Case uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            
            strSQL = strSQL & ",1"      '1 - UPDATE
            dbManager.executeSQL strSQL
            
            If intMode = uiManager.BROWSE_MODE Then
                dbManager.commitTrans
                sprListPersonsController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, _
                                                   Me.sprListPersons.ActiveRow
                Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListPersons.ActiveRow
                varTxnTs = sprListPersonsController.getTextOfCell(Me.sprListPersons.ActiveRow, personColumns.txn_ts)
                logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
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
    Dim sql As String
    sql = "CDB..delPersons " & Trim(Me.txtID.Text) & ",'" & _
                                              uiManager.ApplicationContext.ARG_PACKAGE_ID & "','" & _
                                              Me.clsWindowInterface_getScreenID & "'," & _
                                              varTxnTs
    Debug.Print sql
    dbManager.executeSQL "CDB..delPersons " & Trim(Me.txtID.Text) & ",'" & _
                                              uiManager.ApplicationContext.ARG_PACKAGE_ID & "','" & _
                                              Me.clsWindowInterface_getScreenID & "'," & _
                                              varTxnTs
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
'the retrieval is done in the "sprListPersonsController", so that is returned to the caller.
Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController
    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListPersonsController
End Function

'Implementation of the getSQLStringForRetrieval() function of the clsQueryInterface. This function
'returns the sql string which should be used by ADL to retrieve records in Retrieve mode.
'The query is build based upon the user entries in the different fields of the form.
Public Function clsQueryInterface_getSQLStringForRetrieval() As String

    Dim qryPersons As String

    qryPersons = "SELECT title, first_nm, middle_nm, last_nm, is_dera_resident, left(convert(varchar,birth_dtm,13),17)birth_dtm, " & _
                 "gender, contact_information, email_addresses, additional_information, NULL, NULL, NULL, initiation_id, " & _
                 "application_id, screen_id, Convert(varchar, effective_from, 106)effective_from, Convert(varchar, effective_till, 106)effective_till, " & _
                 "Cast(txn_ts AS BigInt), person_id " & _
                 "FROM persons "
                     
    If Trim(Me.txtFirstName.Text) <> "" Then
        qryPersons = qryPersons & "WHERE first_nm LIKE '%" & Replace(Trim(Me.txtFirstName.Text), "'", "''") & "%' AND "
    Else
        qryPersons = qryPersons & "WHERE first_nm LIKE '%%' AND "
    End If
                     
    If Trim(Me.txtAdditionalInfo.Text) <> "" Then
        qryPersons = qryPersons & "additional_information LIKE '%" & Replace(Trim(Me.txtAdditionalInfo.Text), "'", "''") & "%' AND "
    End If

    If Trim(Me.txtBirthDateTime.Text) <> "" Then
        qryPersons = qryPersons & "birth_dtm = '" & Trim(Me.txtBirthDateTime.Text) & "' AND "
    End If

    If Trim(Me.txtContactInfo.Text) <> "" Then
        qryPersons = qryPersons & "contact_information LIKE '%" & Trim(Me.txtContactInfo.Text) & "%' AND "
    End If

    If Trim(Me.txtEmailAddress.Text) <> "" Then
        qryPersons = qryPersons & "email_addresses LIKE '%" & Replace(Trim(Me.txtEmailAddress.Text), "'", "''") & "%' AND "
    End If

    If Trim(Me.txtID.Text) <> "" Then
        qryPersons = qryPersons & "person_id = " & Me.txtID.Text & " AND "
    End If

    If Trim(Me.txtLastName.Text) <> "" Then
        qryPersons = qryPersons & "last_nm LIKE '%" & Replace(Trim(Me.txtLastName.Text), "'", "''") & "%' AND "
    End If
    
    If Trim(Me.txtMiddleName.Text) <> "" Then
        qryPersons = qryPersons & "middle_nm LIKE '%" & Replace(Trim(Me.txtMiddleName.Text), "'", "''") & "%' AND "
    End If

    If Trim(Me.cmbGender) <> "" Then
        qryPersons = qryPersons & "gender LIKE '%" & Trim(Me.cmbGender) & "%' AND "
    End If

    If Trim(Me.cmbTitle) <> "" Then
        qryPersons = qryPersons & "title LIKE '%" & Replace(Trim(Me.cmbTitle), "'", "''") & "%' AND "
    End If

    If Me.chkIsDeraResident = ValueTrue Then
        qryPersons = qryPersons & "is_dera_resident = 'Yes' AND "
    End If

    If Trim(Me.txtInitiatedBy.Tag) <> "" Then
        qryPersons = qryPersons & "initiation_id = " & Trim(Me.txtInitiatedBy.Tag) & " AND "
    End If
    
    If Trim(Me.txtEffectiveFrom.Text) <> "" Then
        qryPersons = qryPersons & "effective_from = '" & Trim(Me.txtEffectiveFrom.Text) & "' AND "
    End If
    
    If Trim(Me.txtEffectiveTill.Text) <> "" Then
        qryPersons = qryPersons & "effective_till = '" & Trim(Me.txtEffectiveTill.Text) & "' AND "
    End If
    
    qryPersons = Left(Trim(qryPersons), Len(Trim(qryPersons)) - 3)
    qryPersons = qryPersons & " ORDER BY person_id"

    clsQueryInterface_getSQLStringForRetrieval = qryPersons
    
End Function

'Implementation of the populateFieldsFromRetrievalSpread() method of the clsQueryInterface. All the fields are
'populated from the spread where the records are retrieved. Parameter p_lonrow states the row of the spread
'whose values are to be set in respective fields.
Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)

    Me.cmbTitle = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.Title))
    Me.txtFirstName.Text = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.firstName))
    Me.txtMiddleName.Text = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.middleName))
    Me.txtLastName.Text = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.lastName))
    Me.txtBirthDateTime.Text = Format(CDate(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.birthDate)), "dd-mmm-yyyy hh:nn")
    Me.cmbGender = Trim(CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.gender)))
    Me.txtContactInfo.Text = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.CellResNo))
    Me.txtEmailAddress.Text = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.EmailAdd))
    Me.txtAdditionalInfo.Text = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.addInfo))
    Me.txtInitiationDate.Text = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.initiationDate))
    Me.txtInitiatedBy.Text = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.initiatedBy))
    Me.txtInitiatedBy.DataField = Me.txtInitiatedBy.Text
    Me.txtPlace.Text = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.initiationPlace))
    Me.txtInitiatedBy.Tag = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.initiationID))
    'intApplicationID = sprListPersonsController.getTextOfCell(p_lonRow, personColumns.applID)
    'intScreenID = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.screenID))
    Me.txtEffectiveFrom.Text = Format(CDate(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.effectivefrom)), "dd-mmm-yyyy")
    Me.txtEffectiveTill.Text = Format(CDate(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.effectiveTill)), "dd-mmm-yyyy")
    varTxnTs = CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.txn_ts))
    
    Me.txtID.Text = sprListPersonsController.getTextOfCell(p_lonRow, personColumns.personID)
    
    If Trim(CStr(sprListPersonsController.getTextOfCell(p_lonRow, personColumns.deraResident))) = "No" Then
        Me.chkIsDeraResident.Value = vbUnchecked
    Else
        Me.chkIsDeraResident.Value = vbChecked
    End If

End Sub

Public Sub clsWindowInterface_fireClose()

End Sub

'Implementation of the fireErase() method of the clsWindowInterface. All the Controls and spreads of the form are
'cleared of any data. clearSpread() method of the spreadController is called for clearing the spreads.
Public Sub clsWindowInterface_fireErase()

    utils.clearControls Me.txtAdditionalInfo, Me.txtContactInfo, _
                                  Me.txtEmailAddress, Me.txtFirstName, Me.txtID, Me.txtInitiatedBy, _
                                  Me.txtInitiationDate, Me.txtLastName, Me.txtMiddleName, Me.txtPlace
    
    Select Case intMode
        Case uiManager.QUERY_MODE
            Me.txtEffectiveFrom.Text = ""
            Me.txtEffectiveTill.Text = ""
            Me.txtBirthDateTime.Text = ""
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
            Me.txtEffectiveFrom.Text = Format(Date, "dd-mmm-yyyy")
            Me.txtEffectiveTill.Text = "31-Dec-9999"
            Me.txtBirthDateTime.Text = ""
    End Select
    
    'to clear and load the default values in the Title and Gender comboBox
    clearLoadDropdowns
    
    If Not Me.sprListPersons Is Nothing Then
        sprListPersonsController.clearSpread
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
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clearLoadDropdowns", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
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
    clsWindowInterface_getScreenID = "PER_02"
End Function

Public Sub clsWindowInterface_setFieldInFocus(ByVal p_strControlNameIndicator As String)
    If p_strControlNameIndicator = "Additional Information" Then
        Me.txtAdditionalInfo.SetFocus
    End If
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
    
    'to clear and load the Title and Gender comboBox.
    clearLoadDropdowns
    
End Sub

'This is a private method to this code module. Here spread controllers are initialized and columns are
'added to them for all the respective spreads in this form.
Private Sub setSpreadController()
    
    'initializing and adding columns to sprListPersonsController of persons
    Set sprListPersonsController = New clsSpreadController
    sprListPersonsController.registerSpreadInstance uiManager, Me.sprListPersons, LIST_SPREAD, Me, , , SCROLLABLE
    sprListPersonsController.setHeaderHeight 500
        
    sprListPersonsController.addColumn "Title", 8, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN
    sprListPersonsController.addColumn "First Name", 30, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN
    sprListPersonsController.addColumn "Middle Name", 30, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN
    sprListPersonsController.addColumn "Last Name", 30, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN
    sprListPersonsController.addColumn "Dera Resident", 8, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN
    sprListPersonsController.addColumn "Birth Date", 16, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , CENTER_ALIGNMENT
    sprListPersonsController.addColumn "Gender", 8, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN
    sprListPersonsController.addColumn "Cell / Residence No.", 15, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprListPersonsController.addColumn "Email Address", 40, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN
    sprListPersonsController.addColumn "Additional Information", 30, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN
    sprListPersonsController.addColumn "Initiation Date", 0, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN
    sprListPersonsController.addColumn "Initiated By", 0, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN
    sprListPersonsController.addColumn "Initiation Place", 0, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN
    sprListPersonsController.addColumn "Initiation ID", 0, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprListPersonsController.addColumn "Application ID", 0, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprListPersonsController.addColumn "Screen ID", 0, STATIC_TEXT_CELL_TYPE, False, NON_MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    sprListPersonsController.addColumn "Effective From", 11, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , CENTER_ALIGNMENT
    sprListPersonsController.addColumn "Effective   Till", 11, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , CENTER_ALIGNMENT
    sprListPersonsController.addColumn "Txn Ts", 0, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , RIGHT_ALIGNMENT
    sprListPersonsController.addColumn "Person ID", 8, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
    
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls()

    Select Case intMode
    
        Case uiManager.INSERT_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID, Me.txtInitiatedBy, Me.txtInitiationDate, Me.txtPlace
            Me.chkIsDeraResident.BooleanMode = BooleanModeTwoState
            Me.chkIsDeraResident.Value = ValueFalse
            sprListPersonsController.setSpreadMode intMode
            Me.fraPersons.ZOrder 0
            Me.cmbTitle.SetFocus
            
        Case uiManager.QUERY_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID, Me.txtInitiatedBy, Me.txtInitiationDate, Me.txtPlace
            Me.chkIsDeraResident.BooleanMode = BooleanModeThreeState
            Me.chkIsDeraResident.Value = ValueGrayed
            
            sprListPersonsController.setSpreadMode intMode
            Me.fraPersons.ZOrder 0
            Me.txtID.SetFocus
            
        Case uiManager.RETRIEVE_MODE
        
            sprListPersonsController.setSpreadMode intMode
            Me.fraPersons.ZOrder 0
            
        Case uiManager.BROWSE_MODE
        
            Me.chkIsDeraResident.BooleanMode = BooleanModeTwoState
            modControlsSettings.setStateToReadOnly Me.txtID, Me.txtInitiatedBy, Me.txtInitiationDate, Me.txtPlace
            sprListPersonsController.setSpreadMode intMode
            Me.fraPersons.ZOrder 0
            Me.cmbTitle.SetFocus
            
        Case uiManager.LIST_MODE
        
            sprListPersonsController.setSpreadMode intMode
            Me.fraListPersons.ZOrder 0
            
        Case uiManager.NEW_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID, Me.txtInitiatedBy, Me.txtInitiationDate, Me.txtPlace
            Me.chkIsDeraResident.BooleanMode = BooleanModeTwoState
            Me.chkIsDeraResident.Value = ValueFalse
            sprListPersonsController.setSpreadMode intMode
            Me.fraPersons.ZOrder 0
            Me.cmbTitle.SetFocus
            
        Case uiManager.UPDATE_MODE
            
            Me.clsWindowInterface_fireErase
            Me.chkIsDeraResident.BooleanMode = BooleanModeTwoState
            modControlsSettings.setStateToReadOnly Me.txtID, Me.txtInitiatedBy, Me.txtInitiationDate, Me.txtPlace
            sprListPersonsController.setSpreadMode intMode
            Me.fraPersons.ZOrder 0
            Me.cmbTitle.SetFocus
            
        Case uiManager.REFERENCE_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtAdditionalInfo, Me.txtBirthDateTime, Me.txtContactInfo, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtEmailAddress, Me.txtFirstName, Me.txtID, Me.txtInitiatedBy, Me.txtInitiationDate, Me.txtLastName, Me.txtMiddleName, Me.txtPlace, _
                                                   Me.cmbGender, Me.cmbTitle, Me.chkIsDeraResident
            sprListPersonsController.setSpreadMode intMode
            Me.fraPersons.ZOrder 0
            
    End Select
End Sub

Private Sub cmbGender_Validate(Cancel As Boolean)
    validateGender
End Sub

Private Sub cmbTitle_Validate(Cancel As Boolean)
    validateTitle
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

'The method sets the status text of the main screen
Private Sub cmbGender_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub cmbTitle_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub chkIsDeraResident_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtEmail_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.lbLastName, Me.lblBirthDateTime, Me.lblContactInfo, Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblEmailAddress, Me.lblGender, Me.lblId, Me.lblInitiatedBy, Me.lblInitiation, Me.lblMiddleName, Me.lblPlace, Me.lblTitle, _
                                                         Me.txtAdditionalInfo, Me.txtBirthDateTime, Me.txtContactInfo, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtEmailAddress, Me.txtFirstName, Me.txtID, Me.txtInitiatedBy, Me.txtInitiationDate, Me.txtLastName, Me.txtMiddleName, Me.txtPlace, _
                                                         Me.cmbGender, Me.cmbTitle, Me.chkIsDeraResident
    modControlsSettings.setStateToNormal Me.txtAdditionalInfo, Me.txtBirthDateTime, Me.txtContactInfo, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtEmailAddress, Me.txtFirstName, Me.txtID, Me.txtInitiatedBy, Me.txtInitiationDate, Me.txtLastName, Me.txtMiddleName, Me.txtPlace, _
                                         Me.cmbGender, Me.cmbTitle, Me.chkIsDeraResident
End Sub

'The method sets the status text of the main screen
Private Sub txtAdditionalInfo_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtBirthDateTime_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtBirthDateTime_Validate(Cancel As Boolean)
    validateBirthDate
    If Trim(Me.txtBirthDateTime.Text) <> "" And Len(Trim(Me.txtBirthDateTime.Text)) < 11 Then
        Me.txtBirthDateTime.SetFocus
        logger.logMessage modStandardMessages.InvalidValue, Trim(Me.txtBirthDateTime.Text) & "|Birth Date", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        Cancel = True
    End If
    
End Sub

'The method sets the status text of the main screen
Private Sub txtContactInfo_GotFocus()
    uiManager.setStatusText ""
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

'The method sets the status text of the main screen
Private Sub txtEmailAddress_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtFirstName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Only alphabets and apostrophe are valid characters in Name"
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

'Deligates the lookup functionality to the common place at modCDBLookUps. The showLookUpForPersons() is the common place
'where the lookup on the person has been provided
Private Sub txtInitiatedBy_ButtonHit(Button As Integer, NewIndex As Integer)
    'modCDBLookUps.showLookUpForPersons Me, Me.txtInitiatedBy, Me.txtInitiatedBy.Text
End Sub

'The method sets the status text of the main screen
Private Sub txtInitiatedBy_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please hit the button for Lookup Dialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

Private Sub txtInitiatedBy_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        'modCDBLookUps.showLookUpForPersons Me, Me.txtInitiatedBy, Me.txtInitiatedBy.Text
    End If
End Sub

'The method sets the status text of the main screen
Private Sub txtInitiationDate_GotFocus()
    uiManager.setStatusText ""
End Sub

'The method sets the status text of the main screen
Private Sub txtLastName_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Only alphabets and apostrophe are valid characters in Name"
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
            uiManager.setStatusText "Only alphabets and apostrophe are valid characters in Name"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub

'The method sets the status text of the main screen
Private Sub txtPlace_GotFocus()
    Select Case intMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE, uiManager.QUERY_MODE, uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            uiManager.setStatusText "Please hit the button for Lookup Dialog to appear"
        Case uiManager.REFERENCE_MODE, uiManager.RETRIEVE_MODE
            uiManager.setStatusText ""
    End Select
End Sub


