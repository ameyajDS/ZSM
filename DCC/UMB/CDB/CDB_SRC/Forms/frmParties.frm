VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "Edt32x30.ocx"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmParties 
   BackColor       =   &H00C0C0C0&
   Caption         =   "PARTIES"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.Frame fraParties 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   8715
      Left            =   0
      TabIndex        =   54
      Top             =   0
      Width           =   13335
      Begin FPSpread.vaSpread sprPartyAdd 
         Height          =   1665
         Left            =   120
         TabIndex        =   59
         TabStop         =   0   'False
         Top             =   6870
         Visible         =   0   'False
         Width           =   11475
         _Version        =   393216
         _ExtentX        =   20241
         _ExtentY        =   2937
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
         SpreadDesigner  =   "frmParties.frx":0000
      End
      Begin TabDlg.SSTab SSTab1 
         Height          =   5085
         Left            =   120
         TabIndex        =   55
         Top             =   1530
         Width           =   11505
         _ExtentX        =   20294
         _ExtentY        =   8969
         _Version        =   393216
         Tabs            =   2
         TabHeight       =   520
         BackColor       =   12632256
         TabCaption(0)   =   "Address"
         TabPicture(0)   =   "frmParties.frx":022E
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "fraPartyAddress"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).ControlCount=   1
         TabCaption(1)   =   "Roles"
         TabPicture(1)   =   "frmParties.frx":024A
         Tab(1).ControlEnabled=   0   'False
         Tab(1).Control(0)=   "fraPartyRoles"
         Tab(1).ControlCount=   1
         Begin VB.Frame fraPartyRoles 
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   0  'None
            Height          =   4725
            Left            =   -74970
            TabIndex        =   57
            Top             =   330
            Width           =   11445
            Begin FPSpread.vaSpread sprPartyRoles 
               Height          =   4545
               Left            =   60
               TabIndex        =   49
               Tag             =   "Party Roles"
               Top             =   120
               Width           =   7455
               _Version        =   393216
               _ExtentX        =   13150
               _ExtentY        =   8017
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
               SpreadDesigner  =   "frmParties.frx":0266
            End
            Begin FPSpread.vaSpread sprPartyApplication 
               Height          =   4545
               Left            =   7620
               TabIndex        =   50
               Tag             =   "Party Application"
               Top             =   120
               Width           =   3735
               _Version        =   393216
               _ExtentX        =   6588
               _ExtentY        =   8017
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
               SpreadDesigner  =   "frmParties.frx":0494
            End
         End
         Begin VB.Frame fraPartyAddress 
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   0  'None
            Height          =   4725
            Left            =   30
            TabIndex        =   56
            Top             =   330
            Width           =   11445
            Begin VB.Frame fraMoveControls 
               BackColor       =   &H00C0C0C0&
               Height          =   4380
               Left            =   10380
               TabIndex        =   58
               Top             =   0
               Width           =   945
               Begin VB.CommandButton cmdAfter 
                  BackColor       =   &H00C0C0C0&
                  Caption         =   "After"
                  Height          =   360
                  Left            =   130
                  Style           =   1  'Graphical
                  TabIndex        =   41
                  ToolTipText     =   "Insert a record after this one"
                  Top             =   450
                  Width           =   675
               End
               Begin VB.CommandButton cmdUp 
                  BackColor       =   &H00C0C0C0&
                  Caption         =   "Up"
                  Height          =   360
                  Left            =   130
                  Style           =   1  'Graphical
                  TabIndex        =   45
                  ToolTipText     =   "Move one record up"
                  Top             =   2150
                  Width           =   675
               End
               Begin VB.CommandButton cmdBefore 
                  BackColor       =   &H00C0C0C0&
                  Caption         =   "Before"
                  Height          =   360
                  Left            =   130
                  Style           =   1  'Graphical
                  TabIndex        =   42
                  ToolTipText     =   "Insert a record before this one"
                  Top             =   900
                  Width           =   675
               End
               Begin VB.CommandButton cmdDelete 
                  BackColor       =   &H00C0C0C0&
                  Caption         =   "Delete"
                  Height          =   360
                  Left            =   130
                  Style           =   1  'Graphical
                  TabIndex        =   47
                  ToolTipText     =   "Delete the current record"
                  Top             =   3155
                  Width           =   675
               End
               Begin VB.CommandButton cmdDown 
                  BackColor       =   &H00C0C0C0&
                  Caption         =   "Down"
                  Height          =   360
                  Left            =   130
                  Style           =   1  'Graphical
                  TabIndex        =   46
                  ToolTipText     =   "Move one record down"
                  Top             =   2600
                  Width           =   675
               End
               Begin VB.CommandButton cmdLast 
                  BackColor       =   &H00C0C0C0&
                  Caption         =   "Last"
                  Height          =   360
                  Left            =   130
                  Style           =   1  'Graphical
                  TabIndex        =   43
                  ToolTipText     =   "Insert a record at the last"
                  Top             =   1350
                  Width           =   675
               End
               Begin VB.Label lblGUID 
                  BackColor       =   &H00C0C0C0&
                  Caption         =   "GUID"
                  Height          =   195
                  Left            =   90
                  TabIndex        =   51
                  Top             =   3915
                  Visible         =   0   'False
                  Width           =   825
               End
               Begin VB.Label lblRecordPositonIndicator 
                  Alignment       =   2  'Center
                  AutoSize        =   -1  'True
                  BackColor       =   &H00C0C0C0&
                  ForeColor       =   &H00000080&
                  Height          =   240
                  Left            =   75
                  TabIndex        =   48
                  Top             =   3690
                  Width           =   780
               End
               Begin VB.Line Line7 
                  BorderColor     =   &H00E0E0E0&
                  X1              =   1145
                  X2              =   0
                  Y1              =   3600
                  Y2              =   3600
               End
               Begin VB.Line Line8 
                  BorderColor     =   &H00E0E0E0&
                  X1              =   1145
                  X2              =   0
                  Y1              =   1825
                  Y2              =   1825
               End
               Begin VB.Line Line9 
                  BorderColor     =   &H00E0E0E0&
                  X1              =   1145
                  X2              =   0
                  Y1              =   3050
                  Y2              =   3050
               End
               Begin VB.Label lblMove 
                  AutoSize        =   -1  'True
                  BackColor       =   &H00C0C0C0&
                  Caption         =   "Move"
                  ForeColor       =   &H00800000&
                  Height          =   240
                  Left            =   242
                  TabIndex        =   44
                  Top             =   1875
                  Width           =   450
               End
               Begin VB.Label lblInsert 
                  AutoSize        =   -1  'True
                  BackColor       =   &H00C0C0C0&
                  Caption         =   "Insert"
                  ForeColor       =   &H00800000&
                  Height          =   240
                  Left            =   240
                  TabIndex        =   40
                  Top             =   200
                  Width           =   480
               End
            End
            Begin VB.ComboBox cmbAddressType 
               BackColor       =   &H00E0E0E0&
               Height          =   360
               Left            =   120
               Style           =   2  'Dropdown List
               TabIndex        =   13
               Top             =   330
               Width           =   2955
            End
            Begin EditLib.fpText txtAddressLine2 
               Height          =   345
               Left            =   120
               TabIndex        =   18
               Top             =   1410
               Width           =   5715
               _Version        =   196608
               _ExtentX        =   10081
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
            Begin EditLib.fpText txtCountryName 
               Height          =   345
               Left            =   120
               TabIndex        =   20
               Top             =   2070
               Width           =   2715
               _Version        =   196608
               _ExtentX        =   4789
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
               ButtonColor     =   12632256
               AutoMenu        =   0   'False
               ButtonAlign     =   0
               OLEDropMode     =   0
               OLEDragMode     =   0
            End
            Begin EditLib.fpText txtTelephone 
               Height          =   345
               Left            =   6210
               TabIndex        =   33
               Top             =   1770
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
            Begin EditLib.fpText txtFaxLines 
               Height          =   345
               Left            =   6210
               TabIndex        =   37
               Top             =   3300
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
               Left            =   6210
               TabIndex        =   39
               Top             =   4095
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
            Begin EditLib.fpText txtAddressLine1 
               Height          =   345
               Left            =   120
               TabIndex        =   17
               Top             =   1035
               Width           =   5715
               _Version        =   196608
               _ExtentX        =   10081
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
            Begin EditLib.fpText txtStateName 
               Height          =   345
               Left            =   3120
               TabIndex        =   22
               Top             =   2070
               Width           =   2715
               _Version        =   196608
               _ExtentX        =   4789
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
               ButtonColor     =   12632256
               AutoMenu        =   0   'False
               ButtonAlign     =   0
               OLEDropMode     =   0
               OLEDragMode     =   0
            End
            Begin EditLib.fpDateTime txtEffectiveTill 
               Height          =   345
               Left            =   3120
               TabIndex        =   27
               Top             =   4110
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
               ButtonColor     =   12632256
               AutoMenu        =   0   'False
               StartMonth      =   4
               ButtonAlign     =   0
               BoundDataType   =   0
               OLEDropMode     =   0
               OLEDragMode     =   0
            End
            Begin EditLib.fpLongInteger txtNO 
               Height          =   345
               Left            =   5010
               TabIndex        =   15
               Top             =   330
               Width           =   795
               _Version        =   196608
               _ExtentX        =   1402
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
               MaxValue        =   "99"
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
            Begin EditLib.fpText txtContactName 
               Height          =   345
               Left            =   6210
               TabIndex        =   29
               Top             =   330
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
            Begin EditLib.fpText txtDesignation 
               Height          =   345
               Left            =   6210
               TabIndex        =   31
               Top             =   1035
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
            Begin EditLib.fpText txtCellPhones 
               Height          =   345
               Left            =   6210
               TabIndex        =   35
               Top             =   2520
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
            Begin EditLib.fpText txtPostOffice 
               Height          =   345
               Left            =   3120
               TabIndex        =   25
               Top             =   2730
               Width           =   2715
               _Version        =   196608
               _ExtentX        =   4789
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
               ButtonColor     =   12632256
               AutoMenu        =   0   'False
               ButtonAlign     =   0
               OLEDropMode     =   0
               OLEDragMode     =   0
            End
            Begin EditLib.fpText txtDistrictOrCityName 
               Height          =   345
               Left            =   120
               TabIndex        =   61
               Top             =   2715
               Width           =   2715
               _Version        =   196608
               _ExtentX        =   4789
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
               ButtonColor     =   12632256
               AutoMenu        =   0   'False
               ButtonAlign     =   0
               OLEDropMode     =   0
               OLEDragMode     =   0
            End
            Begin EditLib.fpDateTime txtEffectiveFrom 
               Height          =   345
               Left            =   120
               TabIndex        =   62
               Top             =   4110
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
               ButtonColor     =   12632256
               AutoMenu        =   0   'False
               StartMonth      =   4
               ButtonAlign     =   0
               BoundDataType   =   0
               OLEDropMode     =   0
               OLEDragMode     =   0
            End
            Begin EditLib.fpText txtPinOrZipCode 
               Height          =   345
               Left            =   120
               TabIndex        =   63
               Top             =   3435
               Width           =   1590
               _Version        =   196608
               _ExtentX        =   2805
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
            Begin VB.Label lblEffectiveFrom 
               BackColor       =   &H00C0C0C0&
               Caption         =   "Effective From "
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   120
               TabIndex        =   65
               Top             =   3870
               Width           =   1695
            End
            Begin VB.Label lblPinOrZipCode 
               BackColor       =   &H00C0C0C0&
               Caption         =   "Pin / Zip Code "
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   120
               TabIndex        =   64
               Top             =   3195
               Width           =   1455
            End
            Begin VB.Label lblPostOffice 
               BackColor       =   &H00C0C0C0&
               Caption         =   "Post Office"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   3120
               TabIndex        =   24
               Top             =   2490
               Width           =   2175
            End
            Begin VB.Label lblPartyAddID 
               BackColor       =   &H00C0C0C0&
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   3420
               TabIndex        =   60
               Top             =   90
               Visible         =   0   'False
               Width           =   1575
            End
            Begin VB.Label lblCellPhones 
               BackColor       =   &H00C0C0C0&
               Caption         =   "Cell Phone(s)"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   6210
               TabIndex        =   34
               Top             =   2280
               Width           =   1215
            End
            Begin VB.Label lblEffectiveTill 
               BackColor       =   &H00C0C0C0&
               Caption         =   "Effective Till "
               ForeColor       =   &H00800000&
               Height          =   300
               Left            =   3120
               TabIndex        =   26
               Top             =   3870
               Width           =   1335
            End
            Begin VB.Label lblStateName 
               AutoSize        =   -1  'True
               BackColor       =   &H00C0C0C0&
               Caption         =   "State"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   3120
               TabIndex        =   21
               Top             =   1830
               Width           =   465
            End
            Begin VB.Label lblAddressLine1 
               BackColor       =   &H00C0C0C0&
               Caption         =   "Address"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   120
               TabIndex        =   16
               Top             =   810
               Width           =   1575
            End
            Begin VB.Label lblDistrictOrCity 
               BackColor       =   &H00C0C0C0&
               Caption         =   "District / City "
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   120
               TabIndex        =   23
               Top             =   2475
               Width           =   2175
            End
            Begin VB.Label lblCountryName 
               AutoSize        =   -1  'True
               BackColor       =   &H00C0C0C0&
               Caption         =   "Country"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   120
               TabIndex        =   19
               Top             =   1830
               Width           =   675
            End
            Begin VB.Label lblTelephone 
               BackColor       =   &H00C0C0C0&
               Caption         =   "Telephone(s) "
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   6210
               TabIndex        =   32
               Top             =   1530
               Width           =   1215
            End
            Begin VB.Label lblFaxLines 
               BackColor       =   &H00C0C0C0&
               Caption         =   "Fax Line(s) "
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   6210
               TabIndex        =   36
               Top             =   3060
               Width           =   1335
            End
            Begin VB.Label lblEmailAdress 
               BackColor       =   &H00C0C0C0&
               Caption         =   "E-Mail Address(es) "
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   6210
               TabIndex        =   38
               Top             =   3855
               Width           =   1695
            End
            Begin VB.Label lblNo 
               AutoSize        =   -1  'True
               BackColor       =   &H00C0C0C0&
               Caption         =   "NO"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   5010
               TabIndex        =   14
               Top             =   90
               Width           =   285
            End
            Begin VB.Label lblAddressType 
               BackColor       =   &H00C0C0C0&
               Caption         =   "Address Type"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   150
               TabIndex        =   12
               Top             =   90
               Width           =   1575
            End
            Begin VB.Label lblContactDesignation 
               BackColor       =   &H00C0C0C0&
               Caption         =   "Contact Designation"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   6210
               TabIndex        =   30
               Top             =   795
               Width           =   2835
            End
            Begin VB.Label lblContactName 
               BackColor       =   &H00C0C0C0&
               Caption         =   "Contact Name"
               ForeColor       =   &H00800000&
               Height          =   240
               Left            =   6210
               TabIndex        =   28
               Top             =   90
               Width           =   1335
            End
         End
      End
      Begin EditLib.fpText txtPartyCode 
         Height          =   345
         Left            =   1080
         TabIndex        =   3
         Top             =   285
         Width           =   2235
         _Version        =   196608
         _ExtentX        =   3942
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
      Begin EditLib.fpText txtPartyName 
         Height          =   345
         Left            =   5700
         TabIndex        =   7
         Top             =   270
         Width           =   5955
         _Version        =   196608
         _ExtentX        =   10504
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
         MaxLength       =   50
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
      Begin EditLib.fpText txtPAN 
         Height          =   345
         Left            =   3390
         TabIndex        =   5
         Top             =   285
         Width           =   2235
         _Version        =   196608
         _ExtentX        =   3942
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
      Begin EditLib.fpLongInteger txtPartyID 
         Height          =   345
         Left            =   150
         TabIndex        =   1
         Top             =   285
         Width           =   795
         _Version        =   196608
         _ExtentX        =   1402
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
         ButtonColor     =   -2147483633
         AutoMenu        =   0   'False
         ButtonAlign     =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin EditLib.fpText txtPartyContactDesignation 
         Height          =   345
         Left            =   150
         TabIndex        =   9
         Top             =   1020
         Width           =   5475
         _Version        =   196608
         _ExtentX        =   9657
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
         MaxLength       =   50
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
      Begin EditLib.fpText txtPartyContactName 
         Height          =   345
         Left            =   5730
         TabIndex        =   11
         Top             =   990
         Width           =   5925
         _Version        =   196608
         _ExtentX        =   10451
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
         MaxLength       =   50
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
      Begin VB.Label lblPartyContactName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Party Contact Name"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5730
         TabIndex        =   10
         Top             =   750
         Width           =   1770
      End
      Begin VB.Label lblPartyContactDesignation 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Party Contact Designation"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   150
         TabIndex        =   8
         Top             =   780
         Width           =   2280
      End
      Begin VB.Label lblPartyName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Party Name"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5700
         TabIndex        =   6
         Top             =   30
         Width           =   1035
      End
      Begin VB.Label lblPAN 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "PAN"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3390
         TabIndex        =   4
         Top             =   45
         Width           =   405
      End
      Begin VB.Label lblPartyCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Party Code"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   1080
         TabIndex        =   2
         Top             =   45
         Width           =   975
      End
      Begin VB.Label lblPartyID 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Party ID"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   150
         TabIndex        =   0
         Top             =   45
         Width           =   705
      End
   End
   Begin VB.Frame fraListParties 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   7095
      Left            =   0
      TabIndex        =   52
      Top             =   0
      Width           =   14145
      Begin FPSpread.vaSpread sprListParties 
         Height          =   6465
         Left            =   240
         TabIndex        =   53
         TabStop         =   0   'False
         Tag             =   "List"
         Top             =   240
         Width           =   11700
         _Version        =   393216
         _ExtentX        =   20637
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
         SpreadDesigner  =   "frmParties.frx":06C2
      End
   End
End
Attribute VB_Name = "frmParties"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Implements clsWindowInterface
Implements clsEditInterface
Implements clsQueryInterface
Implements clsCallingFormInterface

Dim intMode As Integer
Dim strTxnTs As String
Dim strComboValues() As String

Dim strInsTemp As String
Dim strUpdTemp As String
Dim strDelTemp As String
Dim insString() As String
Dim updString() As String
Dim delString() As String

Dim WithEvents sprListPartiesController As clsSpreadController
Attribute sprListPartiesController.VB_VarHelpID = -1
Dim WithEvents sprPartyApplicationController As clsSpreadController
Attribute sprPartyApplicationController.VB_VarHelpID = -1
Dim WithEvents sprPartyRolesController As clsSpreadController
Attribute sprPartyRolesController.VB_VarHelpID = -1
Dim WithEvents sprPartyAddController As clsSpreadController
Attribute sprPartyAddController.VB_VarHelpID = -1

Dim isPartyUpdatable As Boolean
Dim isPartyAddUpdatable As Boolean
Dim isPartyRolesUpdatable As Boolean
Dim strPartyAddID() As String

Private Enum sprListPartyColNames
    partyID = 1
    partyCD
    partyNm
    pan
    partyCntctName
    partyCntctDesignation
    txnTs
End Enum

Private Enum sprPartyAddColNames
    Guid = 1
    partAddID
    addType
    addNo
    cntctNm
    cntctDesig
    addLine1
    addLine2
    countryID
    Country
    stateID
    state
    distCityID
    distCity
    postOfficeID
    postOffice
    pinZip
    cellPhone
    Telephone
    EmailAdd
    Fax
    effFrom
    effTill
    updAddID
End Enum

Private Enum sprPartyRoleColNames
    partyID = 1
    oldRoleCD
    roleCD
    role
    addReqd
    oldAddType
    addType
    addNo
    appID
    App
    effFrom
    effTill
End Enum

Private Enum sprPartyAppColNames
    partyID = 1
    oldRoleCD
    roleCD
    oldAppID
    appID
    App
    read
    Update
End Enum

Private Sub setModeForSpreads()
    sprPartyAddController.setSpreadMode Me.clsWindowInterface_getMode
    sprPartyApplicationController.setSpreadMode Me.clsWindowInterface_getMode
    sprPartyRolesController.setSpreadMode Me.clsWindowInterface_getMode
    sprListPartiesController.setSpreadMode Me.clsWindowInterface_getMode
End Sub

Private Sub setEnableDisableControls()
On Error GoTo errortag
    
    Me.fraParties.ZOrder 0
    modControlsSettings.setStateToReadOnly Me.txtPartyID
    setModeForSpreads
    
    Select Case Me.clsWindowInterface_getMode
        Case uiManager.INSERT_MODE
            Me.clsWindowInterface_fireErase
            Me.txtPartyCode.SetFocus
            Me.cmdUp.Enabled = False
            Me.cmdDown.Enabled = False
        Case uiManager.QUERY_MODE
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtPartyID
            Me.txtPartyID.SetFocus
        Case uiManager.BROWSE_MODE
            Me.txtPartyCode.SetFocus
        Case uiManager.LIST_MODE
            sprListPartiesController.setSpreadMode uiManager.LIST_MODE
            Me.fraListParties.ZOrder 0
    End Select
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "setEnableDisableControls", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Function setAddressTypes() As String
On Error GoTo errortag

    Dim i As Long
    Dim rsAddTypes As clsRecordHashMap
    
    setAddressTypes = ""
    
    Set rsAddTypes = dbManager.executeSQLGetRS("CDB..selAddTypes")
    For i = 0 To rsAddTypes.getNoOfRecords - 1
        setAddressTypes = setAddressTypes & "||" & rsAddTypes.getFieldValueByFieldName("address_type", i)
    Next i

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "setAddressTypes", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Private Sub setSpreadController()
    
    '------- LIST SPREAD
    Set sprListPartiesController = New clsSpreadController
    sprListPartiesController.registerSpreadInstance uiManager, Me.sprListParties, LIST_SPREAD, Me
    
    sprListPartiesController.addColumn "Party ID", 8, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT
    sprListPartiesController.addColumn "Party Code", 25, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, UPPER_CASE
    sprListPartiesController.addColumn "Party Name", 50, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprListPartiesController.addColumn "Party Contact Name", 50, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprListPartiesController.addColumn "Party Contact Designation", 30, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprListPartiesController.addColumn "PAN", 25, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprListPartiesController.addColumn "TxnTs", 0, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT, NO_CASE
    
    '------- PARTY ROLES
    Set sprPartyRolesController = New clsSpreadController
    sprPartyRolesController.registerSpreadInstance uiManager, Me.sprPartyRoles, NORMAL_SPREAD, Me, 0, , SCROLLABLE
    
    Dim strAddType As String
    strAddType = modMain.ADD_TYPE_MANDATORY & "||" & modMain.ADD_TYPE_NOT_REQUIRED & "||" & modMain.ADD_TYPE_OPTIONAL
    
    sprPartyRolesController.addColumn "Party ID", 0, edit_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, , , , , , , True
    sprPartyRolesController.addColumn "Old Role Code", 0, edit_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT
    sprPartyRolesController.addColumn "Role Code", 0, edit_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT
    sprPartyRolesController.addColumn "Role", 20, edit_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_ENABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyRolesController.addColumn "Address Requirement", 0, STATIC_TEXT_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyRolesController.addColumn "Old Address Type", 0, STATIC_TEXT_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyRolesController.addColumn "Address Type", 25, COMBOBOX_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyRolesController.addColumn "No", 5, INTEGER_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, strAddType, , RIGHT_ALIGNMENT, NO_CASE
    sprPartyRolesController.addColumn "Owner App Id", 0, edit_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyRolesController.addColumn "Owner Application", 49, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyRolesController.addColumn "Effective From", 20, DATE_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , CENTER_ALIGNMENT, NO_CASE, , , , , , True
    sprPartyRolesController.addColumn "Effective Till", 20, DATE_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , CENTER_ALIGNMENT, NO_CASE, , , , , , True

    '------- PARTY APPLICATIONS
    Set sprPartyApplicationController = New clsSpreadController
    sprPartyApplicationController.registerSpreadInstance uiManager, Me.sprPartyApplication, NORMAL_SPREAD, Me, 0
    
    sprPartyApplicationController.addColumn "Party ID", 0, edit_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT, , , , , , , True
    sprPartyApplicationController.addColumn "Old Role Code", 0, edit_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT, , , , , , , True
    sprPartyApplicationController.addColumn "Role Code", 0, edit_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT, , , , , , , True
    sprPartyApplicationController.addColumn "Old ApplicationID", 0, edit_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, UPPER_CASE
    sprPartyApplicationController.addColumn "ApplicationID", 0, edit_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, UPPER_CASE
    sprPartyApplicationController.addColumn "Application", 63, edit_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_ENABLED, , , LEFT_ALIGNMENT
    sprPartyApplicationController.addColumn "Read", 16, CHECKBOX_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyApplicationController.addColumn "Update", 21, CHECKBOX_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    
    '------- PARTY ADDRESS
    Set sprPartyAddController = New clsSpreadController
    sprPartyAddController.registerSpreadInstance uiManager, Me.sprPartyAdd, NORMAL_SPREAD, Me, 1
    
    sprPartyAddController.addColumn "GUID", 10, edit_CELL_TYPE, EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT, , , , , , , True
    sprPartyAddController.addColumn "PartyAddID", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT
    sprPartyAddController.addColumn "Address Type", 15, edit_CELL_TYPE, EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT
    sprPartyAddController.addColumn "Address No", 11, edit_CELL_TYPE, EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyAddController.addColumn "Contact Name", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyAddController.addColumn "Contact Designation", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT
    sprPartyAddController.addColumn "Address Line1", 10, edit_CELL_TYPE, EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, UPPER_CASE
    sprPartyAddController.addColumn "Address Line2", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyAddController.addColumn "CountryID", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyAddController.addColumn "Country", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT
    sprPartyAddController.addColumn "StateID", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, UPPER_CASE
    sprPartyAddController.addColumn "State", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyAddController.addColumn "Dist/City ID", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyAddController.addColumn "Dist/City", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT
    sprPartyAddController.addColumn "Post Office ID", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyAddController.addColumn "Post Office", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT
    sprPartyAddController.addColumn "Pin Zip", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, UPPER_CASE
    sprPartyAddController.addColumn "Cell Phone", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyAddController.addColumn "Telephone", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE
    sprPartyAddController.addColumn "Email Add", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , RIGHT_ALIGNMENT
    sprPartyAddController.addColumn "Fax", 10, edit_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, UPPER_CASE
    sprPartyAddController.addColumn "Effective From", 10, DATE_CELL_TYPE, EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE, , , , , , True
    sprPartyAddController.addColumn "Effective Till", 10, DATE_CELL_TYPE, EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE, , , , , , True
    sprPartyAddController.addColumn "Updatable Address ID", 10, STATIC_TEXT_CELL_TYPE, EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT, NO_CASE, , , , , , True
    
End Sub

Public Sub clsCallingFormInterface_getForeignKeyInformation(p_objActiveControl As Object, _
                                                            p_objCallForm As Object, _
                                                            p_strDisplayText As String, _
                                                            p_strIDText As String, _
                                                            p_colAdditionalInformation As Collection)
On Error GoTo errortag

    If p_objActiveControl Is Me.txtCountryName Then
        Set p_objCallForm = modMain.countries
        p_strDisplayText = Me.txtCountryName.Text
        p_strIDText = Me.txtCountryName.Tag
    End If
    
    If p_objActiveControl Is Me.txtStateName Then
        Set p_objCallForm = modMain.states
        p_strDisplayText = Me.txtStateName.Text
        p_strIDText = Me.txtStateName.Tag
        p_colAdditionalInformation.Add Trim(Me.txtCountryName.Text), "country_nm"
        p_colAdditionalInformation.Add Trim(Me.txtCountryName.Tag), "country_id"
    End If
    
    If p_objActiveControl Is Me.txtDistrictOrCityName Then
        Set p_objCallForm = modMain.districtsOrCities
        p_strDisplayText = Me.txtDistrictOrCityName.Text
        p_strIDText = Me.txtDistrictOrCityName.Tag
        p_colAdditionalInformation.Add Trim(Me.txtCountryName.Text), "country_nm"
        p_colAdditionalInformation.Add Trim(Me.txtCountryName.Tag), "country_id"
        p_colAdditionalInformation.Add Trim(Me.txtStateName.Text), "state_nm"
        p_colAdditionalInformation.Add Trim(Me.txtStateName.Tag), "state_id"
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsCallingFormInterface_getForeignKeyInformation", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub



Public Sub clsCallingFormInterface_setReturnedValues(p_objSourceObject As Object, _
                                                     ByVal p_strDisplayText As String, _
                                                     ByVal p_strIDText As String, _
                                                     p_colAdditionalValues As Collection)
On Error GoTo errortag
    
    If p_objSourceObject Is Me.sprPartyRoles Then
        If Me.sprPartyRoles.ActiveCol = sprPartyRoleColNames.role Then

            If sprPartyRolesController.searchTextInColumn(sprPartyRoleColNames.roleCD, p_strIDText) > 0 Then
                logger.logMessage modStandardMessages.DupValue, "", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
                Exit Sub
            End If

            sprPartyRolesController.setTextOfCell Me.sprPartyRoles.ActiveRow, sprPartyRoleColNames.roleCD, p_strIDText
            sprPartyRolesController.setTextOfCell Me.sprPartyRoles.ActiveRow, sprPartyRoleColNames.role, p_strDisplayText
            sprPartyRolesController.setTextOfCell Me.sprPartyRoles.ActiveRow, sprPartyRoleColNames.addReqd, p_colAdditionalValues("address_requirement")
            sprPartyRolesController.setTextOfCell Me.sprPartyRoles.ActiveRow, sprPartyRoleColNames.appID, p_colAdditionalValues("owner_application_id")
            sprPartyRolesController.setTextOfCell Me.sprPartyRoles.ActiveRow, sprPartyRoleColNames.App, p_colAdditionalValues("application_nm")
            
            Dim rowIndices() As Long
            rowIndices = sprPartyApplicationController.getRowIndicesHavingTextInMultipleColumns( _
                            utils.createLongArray(sprPartyAppColNames.roleCD), _
                            utils.createVariantArray(p_strIDText))
            If rowIndices(0) > 0 Then Exit Sub
            
            Dim rsPartyApp As clsRecordHashMap
            Dim i As Long
            
            Set rsPartyApp = dbManager.executeSQLGetRS("CDB..selRolesAppControls '" & p_strIDText & "','" & uiManager.ApplicationContext.ARG_APPLICATION_ID & "'")
            If rsPartyApp.getNoOfRecords = 0 Then Exit Sub
            sprPartyApplicationController.hideAllRows
            
            For i = 0 To rsPartyApp.getNoOfRecords - 1
                sprPartyApplicationController.insertRowLast
                sprPartyApplicationController.setTextOfCell Me.sprPartyApplication.ActiveRow, sprPartyAppColNames.App, rsPartyApp.getFieldValueByFieldName("application_nm", i)
                sprPartyApplicationController.setTextOfCell Me.sprPartyApplication.ActiveRow, sprPartyAppColNames.appID, rsPartyApp.getFieldValueByFieldName("application_id", i)
                sprPartyApplicationController.setTextOfCell Me.sprPartyApplication.ActiveRow, sprPartyAppColNames.oldAppID, rsPartyApp.getFieldValueByFieldName("old_application_id", i)
                sprPartyApplicationController.setTextOfCell Me.sprPartyApplication.ActiveRow, sprPartyAppColNames.oldRoleCD, rsPartyApp.getFieldValueByFieldName("old_role_cd", i)
                sprPartyApplicationController.setTextOfCell Me.sprPartyApplication.ActiveRow, sprPartyAppColNames.partyID, Me.txtPartyID.Text
                sprPartyApplicationController.setTextOfCell Me.sprPartyApplication.ActiveRow, sprPartyAppColNames.roleCD, rsPartyApp.getFieldValueByFieldName("role_cd", i)
                sprPartyApplicationController.setTextOfCell Me.sprPartyApplication.ActiveRow, sprPartyAppColNames.read, rsPartyApp.getFieldValueByFieldName("is_read", i)
                sprPartyApplicationController.setTextOfCell Me.sprPartyApplication.ActiveRow, sprPartyAppColNames.Update, rsPartyApp.getFieldValueByFieldName("is_update", i)
            Next i
            
            Exit Sub
        End If
        
    End If
    
    If p_objSourceObject Is Me.sprPartyApplication Then
        sprPartyApplicationController.setTextOfCell Me.sprPartyApplication.ActiveRow, sprPartyAppColNames.appID, p_strIDText
        sprPartyApplicationController.setTextOfCell Me.sprPartyApplication.ActiveRow, sprPartyAppColNames.App, p_strDisplayText
        Exit Sub
    End If
     
    If p_objSourceObject Is Me.txtCountryName Then
        utils.clearControls Me.txtStateName, Me.txtDistrictOrCityName, Me.txtPinOrZipCode
        Me.txtCountryName.SetFocus
        Exit Sub
    End If
    
    If p_objSourceObject Is Me.txtStateName Then
        utils.clearControls Me.txtDistrictOrCityName, Me.txtPinOrZipCode
        Me.txtStateName.SetFocus
        Exit Sub
    End If
    
    If p_objSourceObject Is Me.txtDistrictOrCityName Then
        utils.clearControls Me.txtPinOrZipCode
        Me.txtDistrictOrCityName.SetFocus
        Exit Sub
    End If
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsCallingFormInterface_setReturnedValues", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsEditInterface_fireInsertMode()
On Error GoTo errortag
    Me.clsWindowInterface_showForm uiManager.INSERT_MODE
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsEditInterface_fireInsertMode", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsEditInterface_fireSave()
On Error GoTo errortag

    Dim isRollbackable As Boolean

    dbManager.beginTrans
    isRollbackable = True
    
    saveParties
    savePartyAddresses
    savePartyRoles
    savePartyRoleApplications
    deleteChildRecords
    
    dbManager.commitTrans
    isRollbackable = False
    
    Select Case Me.clsWindowInterface_getMode
        Case uiManager.INSERT_MODE
            logger.logMessage modStandardMessages.ObjectSaveMsg, "Party '" & Trim(Me.txtPartyName.Text) & "'|'" & Trim(Me.txtPartyID.Text) & "'", PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Me.clsWindowInterface_showForm uiManager.INSERT_MODE
        Case uiManager.BROWSE_MODE
            logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            sprListPartiesController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, Me.sprListParties.Row
            Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListParties.Row
    End Select

Exit Sub
errortag:
    If (isRollbackable) Then
        dbManager.rollBackTrans
    End If
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsWindowInterface_fireErase", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub saveParties()
On Error GoTo errortag
    
    Dim strSQL As String
    
    Select Case Me.clsWindowInterface_getMode
        Case uiManager.INSERT_MODE
            strSQL = utils.createSPTypeGenericStatement("CDB..insParties", _
                        utils.createVariantArray(Me.txtPartyCode, Me.txtPartyName, Me.txtPAN, _
                                                 Me.txtPartyContactName, Me.txtPartyContactDesignation))
            Dim rsParties As clsRecordHashMap
            Set rsParties = dbManager.executeSQLGetRS(strSQL)
            Me.txtPartyID.Text = rsParties.getFieldValueByFieldName("party_id", 0)
        
        Case uiManager.BROWSE_MODE
'            If (Not isPartyUpdatable) Then Exit Sub
            
            strSQL = utils.createSPTypeGenericStatement("CDB..updParties", _
                        utils.createVariantArray(Me.txtPartyID, Me.txtPartyCode, Me.txtPartyName, _
                                                 Me.txtPAN, Me.txtPartyContactName, Me.txtPartyContactDesignation, _
                                                 strTxnTs, uiManager.ApplicationContext.ARG_APPLICATION_ID))
            dbManager.executeSQL strSQL
            
    End Select

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "saveParties", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub savePartyAddresses()
On Error GoTo errortag
    
    strUpdTemp = "CDB..updPartyAddresses " & "@@, " & Trim(Me.txtPartyID.Text) & ", @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, " & uiManager.ApplicationContext.ARG_APPLICATION_ID
    strInsTemp = "CDB..insPartyAddresses " & Trim(Me.txtPartyID.Text) & ", @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, @@, " & uiManager.ApplicationContext.ARG_APPLICATION_ID
    Dim i As Long
    
    If sprPartyAddController.getNumberOfRowsForState(UPDATED_STATE) <> 0 Then
        updString = sprPartyAddController.getUpdateStrings(strUpdTemp, _
                                                            "Yes", _
                                                            "No ", _
                                                            sprPartyAddColNames.partAddID, _
                                                            sprPartyAddColNames.addType, _
                                                            sprPartyAddColNames.addNo, _
                                                            sprPartyAddColNames.cntctNm, _
                                                            sprPartyAddColNames.cntctDesig, _
                                                            sprPartyAddColNames.addLine1, _
                                                            sprPartyAddColNames.addLine2, _
                                                            sprPartyAddColNames.countryID, _
                                                            sprPartyAddColNames.stateID, _
                                                            sprPartyAddColNames.distCityID, _
                                                            sprPartyAddColNames.postOfficeID, _
                                                            sprPartyAddColNames.pinZip, _
                                                            sprPartyAddColNames.cellPhone, _
                                                            sprPartyAddColNames.Telephone, _
                                                            sprPartyAddColNames.EmailAdd, _
                                                            sprPartyAddColNames.Fax, _
                                                            sprPartyAddColNames.effFrom, _
                                                            sprPartyAddColNames.effTill)

        For i = 0 To UBound(updString)
            dbManager.executeSQL updString(i)
        Next i
    End If
    
    If sprPartyAddController.getNumberOfRowsForState(NEW_STATE) <> 0 Then
        insString = sprPartyAddController.getInsertStrings(strInsTemp, _
                                                            "Yes", _
                                                            "No ", _
                                                            sprPartyAddColNames.addType, _
                                                            sprPartyAddColNames.addNo, _
                                                            sprPartyAddColNames.cntctNm, _
                                                            sprPartyAddColNames.cntctDesig, _
                                                            sprPartyAddColNames.addLine1, _
                                                            sprPartyAddColNames.addLine2, _
                                                            sprPartyAddColNames.countryID, _
                                                            sprPartyAddColNames.stateID, _
                                                            sprPartyAddColNames.distCityID, _
                                                            sprPartyAddColNames.postOfficeID, _
                                                            sprPartyAddColNames.pinZip, _
                                                            sprPartyAddColNames.cellPhone, _
                                                            sprPartyAddColNames.Telephone, _
                                                            sprPartyAddColNames.EmailAdd, _
                                                            sprPartyAddColNames.Fax, _
                                                            sprPartyAddColNames.effFrom, _
                                                            sprPartyAddColNames.effTill)
        For i = 0 To UBound(insString)
            dbManager.executeSQL insString(i)
        Next i
    End If


Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "savePartyAddresses", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub savePartyRoles()
On Error GoTo errortag
    
    strUpdTemp = "CDB..updPartyRoles " & Trim(Me.txtPartyID.Text) & ", @@, @@, @@, @@, @@, @@, " & uiManager.ApplicationContext.ARG_APPLICATION_ID
    strInsTemp = "CDB..insPartyRoles " & Trim(Me.txtPartyID.Text) & ", @@, @@, @@, @@, @@"
    Dim i As Long
    
    If sprPartyRolesController.getNumberOfRowsForState(UPDATED_STATE) <> 0 Then
        updString = sprPartyRolesController.getUpdateStrings(strUpdTemp, _
                                                            "Yes", _
                                                            "No ", _
                                                            sprPartyRoleColNames.oldRoleCD, _
                                                            sprPartyRoleColNames.roleCD, _
                                                            sprPartyRoleColNames.addType, _
                                                            sprPartyRoleColNames.appID, _
                                                            sprPartyRoleColNames.effFrom, _
                                                            sprPartyRoleColNames.effTill)
        For i = 0 To UBound(updString)
            dbManager.executeSQL updString(i)
        Next i
    End If
    
    If sprPartyRolesController.getNumberOfRowsForState(NEW_STATE) <> 0 Then
        insString = sprPartyRolesController.getInsertStrings(strInsTemp, _
                                                            "Yes", _
                                                            "No ", _
                                                            sprPartyRoleColNames.roleCD, _
                                                            sprPartyRoleColNames.addType, _
                                                            sprPartyRoleColNames.appID, _
                                                            sprPartyRoleColNames.effFrom, _
                                                            sprPartyRoleColNames.effTill)
        For i = 0 To UBound(insString)
            dbManager.executeSQL insString(i)
        Next i
    End If


Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "savePartyRoles", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub savePartyRoleApplications()
On Error GoTo errortag
    
    strUpdTemp = "CDB..updPartyRoleApplication " & Trim(Me.txtPartyID.Text) & ", @@, @@, @@, @@, @@, @@"
    strInsTemp = "CDB..insPartyRoleApplication " & Trim(Me.txtPartyID.Text) & ", @@, @@, @@, @@"
    Dim i As Long
    
    If sprPartyApplicationController.getNumberOfRowsForState(UPDATED_STATE) <> 0 Then
        updString = sprPartyApplicationController.getUpdateStrings(strUpdTemp, _
                                                            "Yes", _
                                                            "No ", _
                                                            sprPartyAppColNames.oldRoleCD, _
                                                            sprPartyAppColNames.roleCD, _
                                                            sprPartyAppColNames.oldAppID, _
                                                            sprPartyAppColNames.appID, _
                                                            sprPartyAppColNames.read, _
                                                            sprPartyAppColNames.Update)
        For i = 0 To UBound(updString)
            dbManager.executeSQL updString(i)
        Next i
    End If
    
    If sprPartyApplicationController.getNumberOfRowsForState(NEW_STATE) <> 0 Then
        insString = sprPartyApplicationController.getInsertStrings(strInsTemp, _
                                                            "Yes", _
                                                            "No ", _
                                                            sprPartyAppColNames.roleCD, _
                                                            sprPartyAppColNames.appID, _
                                                            sprPartyAppColNames.read, _
                                                            sprPartyAppColNames.Update)
        For i = 0 To UBound(insString)
            dbManager.executeSQL insString(i)
        Next i
    End If


Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "savePartyRoleApplications", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub deleteChildRecords()
On Error GoTo errortag
    
    Dim i As Long
    
    '---- Deleting Party Role Applications
    strDelTemp = "CDB..delPartyRoleApplication " & Trim(Me.txtPartyID.Text) & ", @@, @@"
    If sprPartyApplicationController.getNumberOfRowsForState(DELETED_STATE) <> 0 Then
        delString = sprPartyApplicationController.getDeleteStrings(strDelTemp, _
                                                            "Yes", _
                                                            "No ", _
                                                            sprPartyAppColNames.oldRoleCD, _
                                                            sprPartyAppColNames.oldAppID)
        For i = 0 To UBound(delString)
            dbManager.executeSQL delString(i)
        Next i
    End If
    
    '---- Deleting Party Roles
    strDelTemp = "CDB..delPartyRoles " & Trim(Me.txtPartyID.Text) & ", @@, " & uiManager.ApplicationContext.ARG_APPLICATION_ID
    If sprPartyRolesController.getNumberOfRowsForState(DELETED_STATE) <> 0 Then
        delString = sprPartyRolesController.getDeleteStrings(strDelTemp, _
                                                            "Yes", _
                                                            "No ", _
                                                            sprPartyRoleColNames.oldRoleCD)
        For i = 0 To UBound(delString)
            dbManager.executeSQL delString(i)
        Next i
    End If
    
    '---- Deleting Party Addresses
    strDelTemp = "CDB..delPartyAddresses " & "@@, " & Trim(Me.txtPartyID.Text) & "," & uiManager.ApplicationContext.ARG_APPLICATION_ID
    If sprPartyAddController.getNumberOfRowsForState(DELETED_STATE) <> 0 Then
        delString = sprPartyAddController.getDeleteStrings(strDelTemp, _
                                                            "Yes", _
                                                            "No ", _
                                                            sprPartyAddColNames.partAddID)
        For i = 0 To UBound(delString)
            dbManager.executeSQL delString(i)
        Next i
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "deleteChildRecords", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub


Public Function clsEditInterface_isReadyToSave() As Boolean
On Error GoTo errortag
    
    clsEditInterface_isReadyToSave = True
    Me.ValidateControls
    
    If (Not validatePartyID) Then
        clsEditInterface_isReadyToSave = False
        Me.txtPartyID.SetFocus
        Exit Function
    End If

    If (Not validatePartyCD) Then
        clsEditInterface_isReadyToSave = False
        Me.txtPartyCode.SetFocus
        Exit Function
    End If
    
    If (Not validatePartyNm) Then
        clsEditInterface_isReadyToSave = False
        Me.txtPartyName.SetFocus
        Exit Function
    End If

    If (Not validateLoadDetails) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    End If

    If (Not sprPartyAddController.prepareSpreadForSave) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsWindowInterface_fireErase", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

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

Public Sub clsQueryInterface_fireList()
On Error GoTo errortag
    Me.clsWindowInterface_showForm uiManager.LIST_MODE
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireList", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsQueryInterface_fireQuery()
On Error GoTo errortag
    Me.clsWindowInterface_showForm uiManager.QUERY_MODE
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireQuery", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsQueryInterface_fireRemove()
On Error GoTo errortag

    dbManager.beginTrans
    dbManager.executeSQL "CDB..delParties " & Trim(Me.txtPartyID.Text) & "," & strTxnTs & "," & uiManager.ApplicationContext.ARG_APPLICATION_ID
    dbManager.commitTrans

Exit Sub
errortag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsWindowInterface_fireErase", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

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

Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController
On Error GoTo errortag
    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListPartiesController
Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsWindowInterface_fireErase", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Public Function clsQueryInterface_getSQLStringForRetrieval() As String
On Error GoTo errortag
    
    Dim strSQL As String
    Dim strSelect As String
    
    strSelect = "SELECT DISTINCT " & _
                "p.party_id, " & _
                "p.party_cd, " & _
                "p.party_nm, " & _
                "p.pan, " & _
                "p.party_contact_nm, " & _
                "p.party_contact_designation, " & _
                "Cast(p.txn_ts as BigInt) as txn_ts " & _
             "FROM " & _
                "CDB..parties p " & _
                "LEFT OUTER JOIN CDB..party_addresses pa ON p.party_id = pa.party_id " & _
                "LEFT OUTER JOIN CDB..party_roles pr ON p.party_id = pr.party_id " & _
                "LEFT OUTER JOIN CDB..roles r ON pr.role_cd = r.role_cd " & _
                "LEFT OUTER JOIN CDB..party_role_applications pra ON pr.party_id = pra.party_id AND pr.role_cd = pra.role_cd " & _
                "LEFT OUTER JOIN SysAdmin..applications sa ON sa.application_id = pra.application_id " & _
                "LEFT OUTER JOIN CDB..districts_or_cities dc ON dc.district_or_city_id = pa.district_or_city_id " & _
                "LEFT OUTER JOIN CDB..states s ON s.state_id = dc.state_id " & _
                "LEFT OUTER JOIN CDB..countries c ON c.country_id = s.country_id " & _
                "LEFT OUTER JOIN CDB..address_types adt ON adt.address_type_id = pa.address_type_id " & _
             "WHERE " & _
                "p.party_cd <> ' ' " & _
                "AND p.party_id LIKE '%" & Me.txtPartyID.Text & "%' "
                
    strSQL = "AND p.party_cd LIKE '%" & Me.txtPartyCode.Text & "%' " & _
                "AND p.party_nm LIKE '%" & Me.txtPartyName.Text & "%' "
                If (Trim(Me.txtPAN.Text) <> "") Then
                    strSQL = strSQL & "AND p.pan LIKE '%" & Me.txtPAN.Text & "%' "
                End If
                If (Trim(Me.cmbAddressType.Text) <> "") Then
                    strSQL = strSQL & "AND adt.address_type_nm LIKE '%" & Trim(Me.cmbAddressType.Text) & "%' "
                End If
                If (Trim(Me.txtCountryName.Text) <> "") Then
                    strSQL = strSQL & "AND c.country_nm LIKE '%" & Me.txtCountryName.Text & "%' "
                End If
                If (Trim(Me.txtStateName.Text) <> "") Then
                    strSQL = strSQL & "AND s.state_nm LIKE '%" & Me.txtStateName.Text & "%' "
                End If
                If (Trim(Me.txtDistrictOrCityName.Text) <> "") Then
                    strSQL = strSQL & "AND dc.district_nm LIKE '%" & Me.txtDistrictOrCityName.Text & "%' "
                End If
                If (Trim(sprPartyRolesController.getTextOfCell(1, sprPartyRoleColNames.role)) <> "") Then
                    strSQL = strSQL & "AND r.role_nm LIKE '%" & sprPartyRolesController.getTextOfCell(1, sprPartyRoleColNames.role) & "%' "
                End If
                If (Trim(sprPartyRolesController.getTextOfCell(1, sprPartyRoleColNames.App)) <> "") Then
                    strSQL = strSQL & "AND sa.application_nm LIKE '%" & sprPartyRolesController.getTextOfCell(1, sprPartyRoleColNames.App) & "%' "
                End If
                
'    Dim strSQL As String
'    strSQL = utils.createSPTypeGenericStatement("qryParties", _
'                utils.createVariantArray(Me.txtPartyID, Me.txtPartyCode, Me.txtPartyName, Me.txtPAN, _
'                                         Trim(Me.cmbAddressType.Text), Me.txtCountryName, Me.txtStateName, _
'                                         Me.txtDistrictOrCityName, _
'                                         sprPartyRolesController.getTextOfCell(1, sprPartyRoleColNames.role), _
'                                         sprPartyRolesController.getTextOfCell(1, sprPartyRoleColNames.App)))
    
    If Me.clsWindowInterface_getMode <> uiManager.BROWSE_MODE Then
        clsQueryInterface_getSQLStringForRetrieval = strSelect & strSQL
    Else
        clsQueryInterface_getSQLStringForRetrieval = strSelect
    End If
    
Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_getSQLStringForRetrieval", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)
On Error GoTo errortag

    Me.txtPartyID.Text = sprListPartiesController.getTextOfCell(p_lonRow, sprListPartyColNames.partyID)
    Me.txtPartyCode.Text = sprListPartiesController.getTextOfCell(p_lonRow, sprListPartyColNames.partyCD)
    Me.txtPartyName.Text = sprListPartiesController.getTextOfCell(p_lonRow, sprListPartyColNames.partyNm)
    Me.txtPAN.Text = sprListPartiesController.getTextOfCell(p_lonRow, sprListPartyColNames.pan)
    strTxnTs = sprListPartiesController.getTextOfCell(p_lonRow, sprListPartyColNames.txnTs)
    Me.txtPartyContactDesignation = sprListPartiesController.getTextOfCell(p_lonRow, sprListPartyColNames.partyCntctDesignation)
    Me.txtPartyContactName = sprListPartiesController.getTextOfCell(p_lonRow, sprListPartyColNames.partyCntctName)
    
    retrievePartyAddresses
    'sprPartyAddController.retrieveRecords "selPartyAddresses " & Trim(Me.txtPartyID.Text) & ",'" & uiManager.ApplicationContext.ARG_APPLICATION_ID & "'"
    loadSummaryToDetail 1
    
    retrievePartyRoles
    'sprPartyRolesController.retrieveRecords "selPartyRoles " & Trim(Me.txtPartyID.Text)
    Dim i As Long
    If Me.sprPartyAdd.MaxRows <> 0 Then
        For i = 0 To Me.sprPartyAdd.MaxRows - 1
            ReDim Preserve strComboValues(i)
            strComboValues(i) = sprPartyAddController.getTextOfCell(i + 1, sprPartyAddColNames.addType)
        Next i
    End If
    If Me.sprPartyRoles.MaxRows <> 0 Then
        Dim rowIndices() As Long
        rowIndices = sprPartyRolesController.getRowIndicesHavingText(sprPartyRoleColNames.partyID, Trim(Me.txtPartyID.Text))
        sprPartyRolesController.setComboBoxColumnValues strComboValues, sprPartyRoleColNames.addType, rowIndices
        
        For i = 1 To Me.sprPartyRoles.MaxRows
            sprPartyRolesController.setTextOfCell i, sprPartyRoleColNames.addType, _
                Trim(sprPartyRolesController.getTextOfCell(i, sprPartyRoleColNames.oldAddType))
        Next i
    End If
    
    populatePartyApplications
    setEnableDisableButtons
    
    'set the update permissions on parties
    'validatePermissions
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_populateFieldsFromRetrievalSpread", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub retrievePartyAddresses()
On Error GoTo errortag
    
    Dim strSQL As String
    
    strSQL = "SELECT " & _
                "pa.party_address_id as old_party_add_id, pa.party_address_id, adt.address_type_nm, " & _
                "pa.address_no, pa.contact_nm, pa.contact_designation, pa.address_line_1, pa.address_line_2, " & _
                "s.country_id, c.country_nm, dc.state_id, s.state_nm, pa.district_or_city_id, dc.district_nm, " & _
                "pa.post_office_id, po.post_office_nm, pa.pin_or_zip_code, pa.cell_phones, pa.telephones, " & _
                "pa.email_addresses, pa.fax_lines, Convert(varchar, pa.effective_from, 106) effective_from, " & _
                "Convert(varchar, pa.effective_till, 106) effective_till, myTemp.default_address_id as updatable_party_address_id " & _
             "FROM " & _
                "CDB..party_addresses pa " & _
                "LEFT OUTER JOIN CDB..post_offices po ON po.post_office_id = pa.post_office_id " & _
                "LEFT OUTER JOIN CDB..districts_or_cities dc ON dc.district_or_city_id = pa.district_or_city_id " & _
                "LEFT OUTER JOIN CDB..states s ON s.state_id = dc.state_id " & _
                "LEFT OUTER JOIN CDB..countries c ON c.country_id = s.country_id " & _
                "LEFT OUTER JOIN (SELECT default_address_id FROM CDB..party_roles WHERE party_id = " & Me.txtPartyID.Text & " " & _
                                  "AND role_cd IN (SELECT role_cd from CDB..party_role_applications where party_id = " & Me.txtPartyID.Text & " " & _
                                  "AND application_id = '" & uiManager.ApplicationContext.ARG_APPLICATION_ID & "' AND is_update = 'Yes'))myTemp " & _
                "ON pa.party_address_id = myTemp.default_address_id " & _
                "LEFT OUTER JOIN CDB..address_types adt ON adt.address_type_id = pa.address_type_id " & _
             "WHERE " & _
                "pa.party_id = " & Me.txtPartyID.Text & " " & _
             "ORDER BY " & _
                "pa.address_no"
        
    sprPartyAddController.retrieveRecords strSQL

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "retrievePartyAddresses", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub retrievePartyRoles()
On Error GoTo errortag

    Dim strSQL As String
    
    strSQL = "SELECT " & _
                "pr.party_id, " & _
                "pr.role_cd as old_role_cd, " & _
                "pr.role_cd, " & _
                "r.role_nm, " & _
                "r.address_requirement, " & _
                "adt.address_type_nm as old_address_type, " & _
                "adt.address_type_nm, " & _
                "Case pa.address_no " & _
                    "when 0 then NULL " & _
                    "Else pa.address_no " & _
                "End as address_no, " & _
                "pr.owner_application_id, " & _
                "sa.application_nm, " & _
                "Convert(varchar, pr.effective_from, 106) effective_from, " & _
                "Convert(varchar, pr.effective_till, 106) effective_till " & _
             "FROM " & _
                "CDB..party_roles pr " & _
                "LEFT OUTER JOIN CDB..roles r ON r.role_cd = pr.role_cd " & _
                "LEFT OUTER JOIN CDB..party_addresses pa ON pa.party_id = pr.party_id AND pa.party_address_id = pr.default_address_id " & _
                "LEFT OUTER JOIN SysAdmin..applications sa ON sa.application_id = pr.owner_application_id " & _
                "LEFT OUTER JOIN CDB..address_types adt ON adt.address_type_id = pa.address_type_id " & _
             "WHERE pr.party_id = " & Me.txtPartyID.Text & " " & _
             "ORDER BY pa.address_no "
        
    sprPartyRolesController.retrieveRecords strSQL

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "retrievePartyRoles", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub validatePermissions()
On Error GoTo errortag

    If sprPartyApplicationController.searchTextInColumn(sprPartyAppColNames.appID, UCase(uiManager.ApplicationContext.ARG_APPLICATION_ID)) = 0 Then
        isPartyUpdatable = False
        modControlsSettings.setStateToReadOnly Me.txtPAN, Me.txtPartyCode, Me.txtPartyID, Me.txtPartyName, Me.txtPartyContactDesignation, Me.txtPartyContactName
    Else
        isPartyUpdatable = True
        modControlsSettings.setStateToNormal Me.txtPAN, Me.txtPartyCode, Me.txtPartyName, Me.txtPartyContactDesignation, Me.txtPartyContactName
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validatePermissions", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub populatePartyApplications()
On Error GoTo errortag

    Dim strSQL As String
    
    strSQL = "SELECT " & _
                "pra.party_id, " & _
                "pra.role_cd as old_role_cd, " & _
                "pra.role_cd, " & _
                "pra.application_id as old_application_id, " & _
                "pra.application_id, " & _
                "sa.application_nm, " & _
                "pra.is_read, " & _
                "pra.is_update " & _
             "FROM " & _
                "CDB..party_role_applications pra " & _
                "LEFT OUTER JOIN SysAdmin..applications sa ON sa.application_id = pra.application_id " & _
             "WHERE " & _
                "pra.party_id = " & Me.txtPartyID.Text & " "

    sprPartyApplicationController.retrieveRecords strSQL
    'sprPartyApplicationController.retrieveRecords "selPartyRoleApplication " & Trim(Me.txtPartyID.Text)
    sprPartyApplicationController.hideAllRows
    
    Dim rowIndices() As Long
    rowIndices = sprPartyApplicationController.getRowIndicesHavingTextInMultipleColumns( _
                    utils.createLongArray(sprPartyAppColNames.partyID, sprPartyAppColNames.roleCD), _
                    utils.createVariantArray(Trim(Me.txtPartyID.Text), sprPartyRolesController.getTextOfCell(1, sprPartyRoleColNames.roleCD)))
    
    If rowIndices(0) = 0 Then Exit Sub
    sprPartyApplicationController.setRowsVisible rowIndices, True

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "populatePartyRoles", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsWindowInterface_fireClose()

End Sub

Private Sub clearLoadDropdowns()
On Error GoTo errortag
    
    Dim i As Long
    Dim rsCMBAddTypes As clsRecordHashMap
    Set rsCMBAddTypes = dbManager.executeSQLGetRS("CDB..selAddTypes")
    
    Me.cmbAddressType.Clear
    
    Me.cmbAddressType.AddItem " "
    For i = 0 To rsCMBAddTypes.getNoOfRecords - 1
        Me.cmbAddressType.AddItem rsCMBAddTypes.getFieldValueByFieldName("address_type_nm", i)
    Next i
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsWindowInterface_fireErase", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsWindowInterface_fireErase()
On Error GoTo errortag
    
    utils.clearControls Me.txtPAN, Me.txtPartyCode, Me.txtPartyID, Me.txtPartyName, Me.txtPartyContactDesignation, Me.txtPartyContactName
    Me.lblRecordPositonIndicator.Caption = ""
    clearPartyAddress
    
    sprListPartiesController.clearSpread
    sprPartyAddController.clearSpread
    sprPartyApplicationController.clearSpread
    sprPartyRolesController.clearSpread
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsWindowInterface_fireErase", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsWindowInterface_fireExit(Cancel As Boolean)

End Sub

Public Sub clsWindowInterface_fireHelp()

End Sub

Public Function clsWindowInterface_getMode() As Integer
    clsWindowInterface_getMode = intMode
End Function

Public Function clsWindowInterface_getScreenID() As String
    clsWindowInterface_getScreenID = "EXT_02"
End Function

Public Sub clsWindowInterface_setFieldInFocus(ByVal p_strControlNameIndicator As String)

End Sub

Public Sub clsWindowInterface_showForm(p_intMode As Integer)
On Error GoTo errortag
    
    intMode = p_intMode
    If Not mdiMain.ActiveForm Is Me Then
        setSpreadController
    End If
    Me.ZOrder 0
    Me.Visible = True
    
    clearLoadDropdowns
    setEnableDisableControls
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsWindowInterface_fireErase", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub cmbAddressType_Validate(Cancel As Boolean)
On Error GoTo errortag
    If (Not validateAddressType) Then Exit Sub
    
'    If (sprPartyAddController.searchTextInColumn(sprPartyAddColNames.addType, Trim(Me.cmbAddressType.Text)) = 0) Then
'        ReDim Preserve strComboValues(UBound(strComboValues) + 1)
'        strComboValues(UBound(strComboValues)) = Trim(Me.cmbAddressType.Text)
'
'        If Me.sprPartyRoles.MaxRows <> 0 Then
'            Dim rowIndices() As Long
'            rowIndices = sprPartyRolesController.getRowIndicesHavingText(sprPartyRoleColNames.partyID, Trim(Me.txtPartyID.Text))
'            sprPartyRolesController.setComboBoxColumnValues strComboValues, sprPartyRoleColNames.addType, rowIndices
'        End If
'    End If
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmbAddressType_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub cmdDelete_Click()
On Error GoTo errortag

    utils.clearControls Me.txtAddressLine1, Me.txtAddressLine2, Me.txtCellPhones, Me.txtContactName, Me.txtCountryName, _
                        Me.txtDesignation, Me.txtDistrictOrCityName, Me.txtEffectiveFrom, Me.txtEffectiveTill, _
                        Me.txtEmailAddress, Me.txtFaxLines, Me.txtNO, Me.txtPinOrZipCode, Me.txtStateName, Me.txtTelephone
    Me.cmbAddressType.Text = " "
    loadDetailToSummary
    
    Dim lonRow As Long
    lonRow = sprPartyAddController.searchTextInColumn(sprPartyAddColNames.Guid, Trim(Me.lblGUID.Caption))
    sprPartyAddController.deleteRow lonRow
    
    'When a new address is added at last but before saving, the same is deleted, then lonRow > maxRows
    If lonRow >= Me.sprPartyAdd.MaxRows Then
        If lonRow <> 1 Then
            loadSummaryToDetail (lonRow - 1)
        End If
    Else
        loadSummaryToDetail (lonRow + 1)
    End If
    
    setEnableDisableButtons
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmdDelete_Click", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

Private Sub Form_Load()
On Error GoTo errortag

    modControlsSettings.setStandardControlSpecifications Me.txtAddressLine1, Me.txtAddressLine2, Me.txtContactName, Me.txtCountryName, _
                                                         Me.txtDesignation, Me.txtDistrictOrCityName, Me.txtEffectiveFrom, Me.txtEffectiveTill, _
                                                         Me.txtEmailAddress, Me.txtFaxLines, Me.txtNO, Me.txtPAN, Me.txtPartyCode, Me.txtPartyID, _
                                                         Me.txtPartyName, Me.txtPinOrZipCode, Me.txtStateName, Me.txtTelephone, Me.txtCellPhones, _
                                                         Me.lblAddressLine1, Me.lblAddressType, Me.lblContactDesignation, Me.lblContactName, Me.lblCountryName, _
                                                         Me.lblDistrictOrCity, Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblEmailAdress, Me.lblFaxLines, _
                                                         Me.lblGUID, Me.lblInsert, Me.lblMove, Me.lblNo, Me.lblPAN, Me.lblPartyCode, Me.lblPartyID, Me.lblCellPhones, _
                                                         Me.lblPartyName, Me.lblPinOrZipCode, Me.lblRecordPositonIndicator, Me.lblStateName, Me.lblTelephone, Me.lblPartyAddID, _
                                                         Me.cmbAddressType, Me.cmdAfter, Me.cmdBefore, Me.cmdDelete, Me.cmdDown, Me.cmdLast, Me.cmdUp, _
                                                         Me.txtPostOffice
                                                             
    modControlsSettings.setStateToNormal Me.txtAddressLine1, Me.txtAddressLine2, Me.txtContactName, Me.txtCountryName, _
                                         Me.txtDesignation, Me.txtDistrictOrCityName, Me.txtEffectiveFrom, Me.txtEffectiveTill, _
                                         Me.txtEmailAddress, Me.txtFaxLines, Me.txtNO, Me.txtPAN, Me.txtPartyCode, Me.txtCellPhones, _
                                         Me.txtPartyName, Me.txtPinOrZipCode, Me.txtStateName, Me.txtTelephone, Me.cmbAddressType
    
    ReDim Preserve strComboValues(0)
    strComboValues(0) = ""
   
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "Form_Load", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Function validatePartyID() As Boolean
On Error GoTo errortag
    
    validatePartyID = True
    If ((Me.clsWindowInterface_getMode = uiManager.QUERY_MODE) Or _
       (Me.clsWindowInterface_getMode = uiManager.INSERT_MODE)) Then Exit Function
    
    If (Len(Trim(Me.txtPartyID.Text)) = 0) Then
        validatePartyID = False
        logger.logMessage modStandardMessages.ValueReqd, "Party ID", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validatePartyID", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Private Function validatePartyCD() As Boolean
On Error GoTo errortag
    
    validatePartyCD = True
    If (Me.clsWindowInterface_getMode = uiManager.QUERY_MODE) Then Exit Function
    
    If (Len(Trim(Me.txtPartyCode.Text)) = 0) Then
        validatePartyCD = False
        logger.logMessage modStandardMessages.ValueReqd, "Party Code", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validatePartyCD", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Private Function validateAddress1() As Boolean
On Error GoTo errortag
    
    validateAddress1 = True
    If (Me.clsWindowInterface_getMode = uiManager.QUERY_MODE) Then Exit Function
    
    If (Len(Trim(Me.txtAddressLine1.Text)) = 0) Then
        validateAddress1 = False
        logger.logMessage modStandardMessages.ValueReqd, "Address Line 1", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validateAddress1", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Private Function validatePartyNm() As Boolean
On Error GoTo errortag
    
    validatePartyNm = True
    If (Me.clsWindowInterface_getMode = uiManager.QUERY_MODE) Then Exit Function
    
    If (Len(Trim(Me.txtPartyName.Text)) = 0) Then
        validatePartyNm = False
        logger.logMessage modStandardMessages.ValueReqd, "Party Name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validatePartyNm", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Private Function validateAddressType() As Boolean
On Error GoTo errortag
    
    validateAddressType = True
    If (Me.clsWindowInterface_getMode = uiManager.QUERY_MODE) Then Exit Function
    
    If (Len(Trim(Me.cmbAddressType.Text)) = 0) Then
        validateAddressType = False
        logger.logMessage modStandardMessages.ValueReqd, "Address Type", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validateAddressType", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Private Function validateCountry() As Boolean
On Error GoTo errortag
    
    validateCountry = True
    If (Me.clsWindowInterface_getMode = uiManager.QUERY_MODE) Then Exit Function
    
    If (Len(Trim(Me.txtCountryName.Text)) = 0) Then
        validateCountry = False
        logger.logMessage modStandardMessages.ValueReqd, "Country", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validateCountry", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Private Function validateState() As Boolean
On Error GoTo errortag
    
    validateState = True
    If (Me.clsWindowInterface_getMode = uiManager.QUERY_MODE) Then Exit Function
    
    If (Len(Trim(Me.txtStateName.Text)) = 0) Then
        validateState = False
        logger.logMessage modStandardMessages.ValueReqd, "State", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validateState", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Private Function validateDistCity() As Boolean
On Error GoTo errortag
    
    validateDistCity = True
    If (Me.clsWindowInterface_getMode = uiManager.QUERY_MODE) Then Exit Function
    
    If (Len(Trim(Me.txtDistrictOrCityName.Text)) = 0) Then
        validateDistCity = False
        logger.logMessage modStandardMessages.ValueReqd, "District or City", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validateDistCity", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

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

Private Sub sprPartyAddController_SetDefaultValues(ByVal p_lonRow As Long)
On Error GoTo errortag
    
    sprPartyAddController.setTextOfCell p_lonRow, sprPartyAddColNames.effFrom, Format(modMain.getCurrentDate, "dd MMM yyyy")
    sprPartyAddController.setTextOfCell p_lonRow, sprPartyAddColNames.effTill, "31 DEC 9999"
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprPartyAddController_SetDefaultValues", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub sprPartyApplicationController_RequestLookup(ByVal p_lonColumn As Long, _
                                                        ByVal p_lonRow As Long, _
                                                        ByVal p_bolIsLastEditableCell As Boolean, _
                                                        ByVal p_bolIsLastRow As Boolean, _
                                                        ByVal p_enmSearchMode As ADL.enmLookupSearchModes, _
                                                        p_blnLookupResult As Boolean)
On Error GoTo errortag

    '---- Application
    Select Case p_lonColumn
        Case sprPartyAppColNames.App
            modLookup.showLookUpForApplication Me, Me.sprPartyApplication, Nothing, sprPartyApplicationController.getTextOfCell(p_lonRow, p_lonColumn), p_enmSearchMode, _
                        sprPartyApplicationController.getTextOfCell(p_lonRow, sprPartyAppColNames.roleCD)

    End Select

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprPartyApplicationController_RequestLookup", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub sprPartyApplicationController_SetDefaultValues(ByVal p_lonRow As Long)
On Error GoTo errortag
    
    sprPartyApplicationController.setTextOfCell p_lonRow, sprPartyAppColNames.partyID, Trim(Me.txtPartyID.Text)
    sprPartyApplicationController.setTextOfCell p_lonRow, sprPartyAppColNames.roleCD, sprPartyRolesController.getTextOfCell(Me.sprPartyRoles.ActiveRow, sprPartyRoleColNames.roleCD)
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprPartyApplicationController_SetDefaultValues", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub sprPartyApplicationController_ValidateRow(ByVal p_lonRow As Long, p_bolIsRowValid As Boolean)
On Error GoTo errortag
    
    If (sprPartyApplicationController.getTextOfCell(p_lonRow, sprPartyAppColNames.Update) = vbChecked) Then
        sprPartyApplicationController.setTextOfCell p_lonRow, sprPartyAppColNames.read, vbChecked
    End If
    
    If (sprPartyApplicationController.isCellValueRepeatedInColumn(utils.createLongArray( _
                                                                    sprPartyAppColNames.roleCD, _
                                                                    sprPartyAppColNames.appID) _
                                                                  , p_lonRow, True)) Then
        logger.logMessage modStandardMessages.ValueRepeated, "An application for a role", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        p_bolIsRowValid = False
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprPartyApplicationController_SetDefaultValues", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub


Private Sub sprPartyRolesController_CellEdited(ByVal p_lonColumn As Long, ByVal p_lonRow As Long)
On Error GoTo errortag

    Dim rowNum As Long
    rowNum = sprPartyAddController.searchTextInColumn(sprPartyAddColNames.addType, Trim(sprPartyRolesController.getTextOfCell(p_lonRow, p_lonColumn)))
    
    sprPartyRolesController.setTextOfCell p_lonRow, sprPartyRoleColNames.addNo, _
        IIf(Trim(sprPartyAddController.getTextOfCell(rowNum, sprPartyAddColNames.addNo)) = 0, "", Trim(sprPartyAddController.getTextOfCell(rowNum, sprPartyAddColNames.addNo)))
    
    If Trim(sprPartyRolesController.getTextOfCell(p_lonRow, p_lonColumn)) = "" Then
        sprPartyRolesController.setTextOfCell p_lonRow, sprPartyRoleColNames.addNo, ""
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprPartyRolesController_CellEdited", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub sprPartyRolesController_ConfirmDeleteRow(p_blnIsRowReadyToDelete As Boolean, ByVal p_lonRow As Long)
On Error GoTo errortag

    Dim rowIndices() As Long
    rowIndices = sprPartyApplicationController.getRowIndicesHavingTextInMultipleColumns( _
                    utils.createLongArray(sprPartyAppColNames.partyID, sprPartyAppColNames.roleCD), _
                    utils.createVariantArray(Trim(Me.txtPartyID.Text), sprPartyRolesController.getTextOfCell(p_lonRow, sprPartyRoleColNames.roleCD)))
    If rowIndices(0) = 0 Then Exit Sub
    sprPartyApplicationController.setRowsVisible rowIndices, False
    sprPartyApplicationController.DeleteRows rowIndices
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprPartyRolesController_ConfirmDeleteRow", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub sprPartyRolesController_RequestLookup(ByVal p_lonColumn As Long, _
                                                  ByVal p_lonRow As Long, _
                                                  ByVal p_bolIsLastEditableCell As Boolean, _
                                                  ByVal p_bolIsLastRow As Boolean, _
                                                  ByVal p_enmSearchMode As ADL.enmLookupSearchModes, _
                                                  p_blnLookupResult As Boolean)
On Error GoTo errortag

    Select Case p_lonColumn
        '---- Application
        Case sprPartyRoleColNames.App
            modLookup.showLookUpForApplication Me, sprPartyRoles, Nothing, sprPartyRolesController.getTextOfCell(p_lonRow, p_lonColumn), p_enmSearchMode
            
        '---- Roles
        Case sprPartyRoleColNames.role
            modCDBLookUps.showLookUpForRoles Me, Me.sprPartyRoles, Nothing, sprPartyRolesController.getTextOfCell(p_lonRow, p_lonColumn), p_enmSearchMode
            
        '---- Address Types
        Case sprPartyRoleColNames.addType
            Dim rowIndices() As Long
            Dim addType() As String
            Dim addNo() As String
            Dim i As Long
            
            rowIndices = sprPartyAddController.getRowIndicesHavingTextInMultipleColumns( _
                                utils.createLongArray(sprPartyAddColNames.partAddID), _
                                utils.createVariantArray(""))
            If (rowIndices(0) <> 0) Then
                For i = 0 To UBound(rowIndices)
                    ReDim Preserve addType(i)
                    ReDim Preserve addNo(i)
                    
                    addType(i) = sprPartyAddController.getTextOfCell(rowIndices(i), sprPartyAddColNames.addType)
                    addNo(i) = sprPartyAddController.getTextOfCell(rowIndices(i), sprPartyAddColNames.addNo)
                Next i
            End If
            
            modLookup.showLookUpForAddTypesForParties Me, Me.sprPartyRoles, Nothing, sprPartyRolesController.getTextOfCell(p_lonRow, p_lonColumn), p_enmSearchMode, Trim(Me.txtPartyID.Text), addType, addNo
    End Select

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprPartyRolesController_RequestLookup", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub sprPartyRolesController_RowSelectionChanged(ByVal p_lonNewRow As Long)
On Error GoTo errortag
    
    sprPartyApplicationController.hideAllRows
    
    Dim strRoleCd As String
    Dim strPartyID As String
    Dim rowIndices() As Long
    Dim i As Long
    
    strRoleCd = sprPartyRolesController.getTextOfCell(p_lonNewRow, sprPartyRoleColNames.roleCD)
    strPartyID = sprPartyRolesController.getTextOfCell(p_lonNewRow, sprPartyRoleColNames.partyID)
    
    rowIndices = sprPartyApplicationController.getRowIndicesHavingTextInMultipleColumns( _
                    utils.createLongArray(sprPartyAppColNames.roleCD, sprPartyAppColNames.partyID), _
                    utils.createVariantArray(strRoleCd, strPartyID))
    If rowIndices(0) = 0 Then Exit Sub
    
    For i = 0 To UBound(rowIndices)
        sprPartyApplicationController.setRowVisible rowIndices(i), True
    Next i
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprPartyRolesController_RowSelectionChanged", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub sprPartyRolesController_SetDefaultValues(ByVal p_lonRow As Long)
On Error GoTo errortag
    
    sprPartyRolesController.setTextOfCell p_lonRow, sprPartyRoleColNames.effFrom, Format(modMain.getCurrentDate, "dd MMM yyyy")
    sprPartyRolesController.setTextOfCell p_lonRow, sprPartyRoleColNames.effTill, "31 DEC 2100"
    sprPartyRolesController.setTextOfCell p_lonRow, sprPartyRoleColNames.partyID, Trim(Me.txtPartyID.Text)
    Dim rows(0) As Long
    rows(0) = p_lonRow
    sprPartyRolesController.setComboBoxColumnValues strComboValues, sprPartyRoleColNames.addType, rows

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprPartyRolesController_SetDefaultValues", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub sprPartyRolesController_ValidateCell(ByVal p_lonRow As Long, ByVal p_lonColumn As Long, p_bolIsCellValid As Boolean)
On Error GoTo errortag

    If Trim(sprPartyRolesController.getTextOfCell(p_lonRow, p_lonColumn)) = "" Then
        sprPartyRolesController.setTextOfCell p_lonRow, sprPartyRoleColNames.addNo, ""
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprPartyRolesController_ValidateCell", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub sprPartyRolesController_ValidateRow(ByVal p_lonRow As Long, p_bolIsRowValid As Boolean)
On Error GoTo errortag

    If (sprPartyRolesController.isCellValueRepeatedInColumn(utils.createLongArray(sprPartyRoleColNames.roleCD), _
                                                            p_lonRow, True)) Then
        logger.logMessage modStandardMessages.ValueRepeated, "Role", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        p_bolIsRowValid = False
    End If
    
    If (sprPartyRolesController.getTextOfCell(p_lonRow, sprPartyRoleColNames.addReqd) = modMain.ADD_TYPE_MANDATORY And _
        sprPartyRolesController.getTextOfCell(p_lonRow, sprPartyRoleColNames.addType) = "") Then
            logger.logMessage modStandardMessages.ValueReqd, "Address Type for the role - " & _
                sprPartyRolesController.getTextOfCell(p_lonRow, sprPartyRoleColNames.role), ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            p_bolIsRowValid = False
    End If
    
    If (sprPartyRolesController.getTextOfCell(p_lonRow, sprPartyRoleColNames.addReqd) = modMain.ADD_TYPE_NOT_REQUIRED And _
        sprPartyRolesController.getTextOfCell(p_lonRow, sprPartyRoleColNames.addType) <> "") Then
            logger.logMessage modStandardMessages.ValueReqdSpecs, "Address Type  for the role - " & sprPartyRolesController.getTextOfCell(p_lonRow, sprPartyRoleColNames.role) & _
                "|Address Requirement|either Mandatory or Optional", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            p_bolIsRowValid = False
    End If
    
    If (sprPartyRolesController.getTextOfCell(p_lonRow, sprPartyRoleColNames.addType) = "") Then
        sprPartyRolesController.setTextOfCell p_lonRow, sprPartyRoleColNames.addNo, ""
    End If
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprPartyRolesController_ValidateRow", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub


Private Sub SSTab1_Click(PreviousTab As Integer)
On Error GoTo errortag

    If Me.SSTab1.Caption = "Address" Then Exit Sub
    If (Not validateLoadDetails) Then Exit Sub
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "SSTab1_Click", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    Err.Raise Err.Number
End Sub

Private Sub txtCountryName_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    modCDBLookUps.showLookUpForCountries Me, Me.txtCountryName, modMain.countries, Me.txtCountryName.Text, enmLookupSearchModes.absolute
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtCountryName_ButtonHit", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub txtCountryName_KeyPress(KeyAscii As Integer)
On Error GoTo errortag
    
    If (KeyAscii = vbKeyReturn) Then
        Call txtCountryName_ButtonHit(0, 0)
    End If
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtCountryName_KeyPress", "", ERROR_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode, "error while performing some sql query"
    errorManager.handleError
End Sub

Private Sub txtCountryName_Validate(Cancel As Boolean)
On Error GoTo errortag
    
    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup for country can be called when it is not empty in mode other than QUERY mode
    If (Me.txtCountryName.Text <> "") Then
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
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtCountryName_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub


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

Private Sub txtDistrictOrCityName_KeyPress(KeyAscii As Integer)
On Error GoTo errortag

    If (KeyAscii = vbKeyReturn) Then
        Call txtDistrictOrCityName_ButtonHit(0, 0)
    End If
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtDistrictOrCityName_ButtonHit", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed during lookup"
    errorManager.handleError
End Sub

Private Sub txtDistrictOrCityName_Validate(Cancel As Boolean)
On Error GoTo errortag
    
    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup for district or city can be called when it is not empty in mode other than QUERY mode
    If (Me.txtDistrictOrCityName.Text <> "") Then
    
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
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtDistrictOrCityName_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

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

Private Sub txtPartyCode_Validate(Cancel As Boolean)
On Error GoTo errortag
    validatePartyCD
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtPartyCode_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub txtPartyID_Validate(Cancel As Boolean)
On Error GoTo errortag
    validatePartyID
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtPartyID_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub txtPartyName_Validate(Cancel As Boolean)
On Error GoTo errortag
    validatePartyNm
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtPartyName_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub txtStateName_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    If Me.txtCountryName.Text <> "" Then
        Dim additionalValues As New Collection
        additionalValues.Add Me.txtCountryName.Tag, "country_id"
        additionalValues.Add Me.txtCountryName.DataField, "country_nm"
        modCDBLookUps.showLookUpForStates Me, Me.txtStateName, modMain.states, Me.txtStateName.Text, enmLookupSearchModes.absolute, additionalValues
    'in query mode, when country is not specified, show all the existing states
    ElseIf intMode = uiManager.QUERY_MODE Then
        modCDBLookUps.showLookUpForStates Me, Me.txtStateName, modMain.states, Me.txtStateName.Text, enmLookupSearchModes.absolute
    Else
        Me.txtStateName.Text = ""
        logger.logMessage modStandardMessages.ValueReqd, "Country Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        Me.txtCountryName.SetFocus
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtStateName_ButtonHit", "", ERROR_TYPE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub txtStateName_KeyPress(KeyAscii As Integer)
On Error GoTo errortag
    
    If (KeyAscii = vbKeyReturn) Then
        Call txtStateName_ButtonHit(0, 0)
    End If
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtStateName_KeyPress", "", ERROR_TYPE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub txtStateName_Validate(Cancel As Boolean)
On Error GoTo errortag
    
    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If
    
    'lookup can be called when state is not empty and current mode is other than QUERY mode
    If (Me.txtStateName.Text <> "") Then
        
        'enforcing to fill country before calling lookup for state
        If Me.txtCountryName.Text = "" Then
            logger.logMessage modStandardMessages.ValueReqd, "Country Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Cancel = True
            Me.txtStateName.Text = ""
            Me.txtCountryName.SetFocus
            Exit Sub
            
        'lookup called
        ElseIf Me.txtStateName.DataField <> Me.txtStateName.Text Then
            Dim additionalValues As New Collection
            additionalValues.Add Me.txtCountryName.Tag, "country_id"
            additionalValues.Add Me.txtCountryName.DataField, "country_nm"
            modCDBLookUps.showLookUpForStates Me, Me.txtStateName, modMain.states, Me.txtStateName.Text, enmLookupSearchModes.Logical, additionalValues
        End If
        
        'enforcing the control to hold a value selected from the lookup.
        If Me.txtStateName.DataField <> Me.txtStateName.Text Then
            logger.logMessage modStandardMessages.InvalidValue, "State - '" & Me.txtStateName.Text & "'|Country - '" & Me.txtCountryName.Text & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed during lookup"
            Me.txtStateName.SelStart = 0
            Me.txtStateName.SelLength = Len(Trim(Me.txtStateName.Text))
            Me.txtStateName.SetFocus
            Cancel = True
        End If
        
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtStateName_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub txtPostOffice_ButtonHit(Button As Integer, NewIndex As Integer)
On Error GoTo errortag
    If Me.txtDistrictOrCityName.Text <> "" Then
        Dim additionalValues As New Collection
        additionalValues.Add Me.txtDistrictOrCityName.Tag, "district_or_city_id"
        additionalValues.Add Me.txtDistrictOrCityName.DataField, "district_nm"
        modCDBLookUps.showLookUpForPostOffices Me, Me.txtPostOffice, modMain.postOffices, Me.txtPostOffice.Text, enmLookupSearchModes.absolute, additionalValues
    'in query mode, when country is not specified, show all the existing states
    ElseIf intMode = uiManager.QUERY_MODE Then
        modCDBLookUps.showLookUpForPostOffices Me, Me.txtPostOffice, modMain.postOffices, Me.txtPostOffice.Text, enmLookupSearchModes.absolute
    Else
        Me.txtPostOffice.Text = ""
        logger.logMessage modStandardMessages.ValueReqd, "District/City Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        Me.txtDistrictOrCityName.SetFocus
    End If
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtPostOffice_ButtonHit", "", ERROR_TYPE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub txtPostOffice_KeyPress(KeyAscii As Integer)
On Error GoTo errortag

    If (KeyAscii = vbKeyReturn) Then
        Call txtPostOffice_ButtonHit(0, 0)
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtPostOffice_KeyPress", "", ERROR_TYPE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub txtPostOffice_Validate(Cancel As Boolean)
On Error GoTo errortag

    If (intMode = uiManager.QUERY_MODE) Then
        Exit Sub
    End If

    'lookup can be called when post office is not empty and current mode is other than QUERY mode
    If (Me.txtPostOffice.Text <> "") Then

        'enforcing to fill country before calling lookup for state
        If Me.txtDistrictOrCityName.Text = "" Then
            logger.logMessage modStandardMessages.ValueReqd, "District/City Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            Cancel = True
            Me.txtPostOffice.Text = ""
            Me.txtDistrictOrCityName.SetFocus
            Exit Sub

        'lookup called
        ElseIf Me.txtPostOffice.DataField <> Me.txtPostOffice.Text Then
            Dim additionalValues As New Collection
            additionalValues.Add Me.txtDistrictOrCityName.Tag, "district_or_city_id"
            additionalValues.Add Me.txtDistrictOrCityName.DataField, "district_nm"
            modCDBLookUps.showLookUpForPostOffices Me, Me.txtPostOffice, modMain.postOffices, Me.txtPostOffice.Text, enmLookupSearchModes.Logical, additionalValues
        End If

        'enforcing the control to hold a value selected from the lookup.
        If Me.txtPostOffice.DataField <> Me.txtPostOffice.Text Then
            logger.logMessage modStandardMessages.InvalidValue, "Post Office - '" & Me.txtPostOffice.Text & "'|District Or City - '" & Me.txtDistrictOrCityName.Text & "'", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode, "failed during lookup"
            Me.txtPostOffice.SelStart = 0
            Me.txtPostOffice.SelLength = Len(Trim(Me.txtStateName.Text))
            Me.txtPostOffice.SetFocus
            Cancel = True
        End If

    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtPostOffice_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Function validateLoadDetails() As Boolean
On Error GoTo errortag

    validateLoadDetails = False
    If (Not isPartyAddReadToSave) Then Exit Function
    
    If Len(Trim(Me.cmbAddressType.Text)) <> 0 Then
        If Me.sprPartyAdd.MaxRows < 2 Then
            If Me.sprPartyAdd.MaxRows = 0 Then
                sprPartyAddController.insertRowLast
            End If
            Me.lblGUID.Caption = utils.getGUID
            sprPartyAddController.setTextOfCell 1, sprPartyAddColNames.Guid, Me.lblGUID.Caption
        End If
        loadDetailToSummary
    End If
    
    setEnableDisableButtons
    validateLoadDetails = True
    
Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validateLoadDetails", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Function

Private Function isPartyAddReadToSave() As Boolean
On Error GoTo errortag

    isPartyAddReadToSave = True
    
    If (Not sprPartyApplicationController.prepareSpreadForSave) Then
        isPartyAddReadToSave = False
        Exit Function
    End If
    
    If (Not sprPartyRolesController.prepareSpreadForSave) Then
        isPartyAddReadToSave = False
        Exit Function
    End If
    
    If Len(Trim(Me.cmbAddressType.Text)) = 0 And _
       Len(Trim(Me.txtAddressLine1.Text)) = 0 And _
       Len(Trim(Me.txtCountryName.Text)) = 0 And _
       Len(Trim(Me.txtStateName.Text)) = 0 And _
       Len(Trim(Me.txtDistrictOrCityName.Text)) = 0 And _
       Len(Trim(Me.txtEffectiveFrom.Text)) = 0 And _
       Len(Trim(Me.txtEffectiveTill.Text)) = 0 Then
            Exit Function
    End If
    
''''''    If (Not validateAddressType) And (Not validateAddress1) And (Not validateCountry) And _
''''''       (Not validateState) And (Not validateDistCity) And (Not validateEffectiveFrom) And _
''''''       (Not validateEffectiveTill) Then
''''''            Exit Function
''''''    End If
    
    If (Not validateAddressType) Then
        isPartyAddReadToSave = False
        Me.cmbAddressType.SetFocus
        Exit Function
    End If
    
    If (Not validateAddress1) Then
        isPartyAddReadToSave = False
        Me.txtAddressLine1.SetFocus
        Exit Function
    End If
    
    If (Not validateEffectiveFrom) Then
        isPartyAddReadToSave = False
        Me.txtEffectiveFrom.SetFocus
        Exit Function
    End If
    
    If (Not validateEffectiveTill) Then
        isPartyAddReadToSave = False
        Me.txtEffectiveTill.SetFocus
        Exit Function
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "isPartyAddReadToSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Function

Private Sub loadDetailToSummary()
On Error GoTo errortag
    
    Dim lonRow As Long
    lonRow = sprPartyAddController.searchTextInColumn(sprPartyAddColNames.Guid, Trim(Me.lblGUID.Caption))
    
    If lonRow = 0 Then Exit Sub
    
    Dim rowIndices() As Long
    rowIndices = sprPartyAddController.getRowIndicesHavingTextInMultipleColumns( _
                        utils.createLongArray(sprPartyAddColNames.addType), _
                        utils.createVariantArray(Trim(Me.cmbAddressType.Text)))
    If rowIndices(0) = 0 Then
        If Trim(sprPartyAddController.getTextOfCell(lonRow, sprPartyAddColNames.partAddID) = "") Then
            ReDim Preserve strComboValues(UBound(strComboValues) + 1)
            strComboValues(UBound(strComboValues)) = Trim(Me.cmbAddressType.Text)
            
            If Me.sprPartyRoles.MaxRows <> 0 Then
                rowIndices = sprPartyRolesController.getRowIndicesHavingText(sprPartyRoleColNames.partyID, Trim(Me.txtPartyID.Text))
                sprPartyRolesController.setComboBoxColumnValues strComboValues, sprPartyRoleColNames.addType, rowIndices
            End If
        End If
    End If
    
    'not permitted to update
    'If Trim(Me.lblPartyAddID.Caption) <> "" And (Not isPartyAddUpdatable) Then Exit Sub
    
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.partAddID, Me.lblPartyAddID.Caption
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.addType, Me.cmbAddressType.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.addNo, IIf(Len(Trim(Me.txtNO.Text)) = 0, "0", Trim(Me.txtNO.Text))
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.addLine1, Me.txtAddressLine1.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.addLine2, Me.txtAddressLine2.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.countryID, Me.txtCountryName.Tag
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.Country, Me.txtCountryName.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.stateID, Me.txtStateName.Tag
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.state, Me.txtStateName.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.distCityID, Me.txtDistrictOrCityName.Tag
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.distCity, Me.txtDistrictOrCityName.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.postOfficeID, Me.txtPostOffice.Tag
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.postOffice, Me.txtPostOffice.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.pinZip, Me.txtPinOrZipCode.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.cntctDesig, Me.txtDesignation.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.cntctNm, Me.txtContactName.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.cellPhone, Me.txtCellPhones.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.Telephone, Me.txtTelephone.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.EmailAdd, Me.txtEmailAddress.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.Fax, Me.txtFaxLines.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.effFrom, Me.txtEffectiveFrom.Text
    sprPartyAddController.setTextOfCell lonRow, sprPartyAddColNames.effTill, Me.txtEffectiveTill.Text
    
    If sprPartyAddController.getRowState(lonRow) = OLD_STATE Then
        sprPartyAddController.markRowAsUpdated lonRow
    End If
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "loadFrontToBack", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub loadSummaryToDetail(p_lonRow As Long)
On Error GoTo errortag
    
    Me.lblPartyAddID.Caption = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.partAddID)
    Me.lblGUID.Caption = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.Guid)
    
    Me.cmbAddressType.Text = IIf(Len(Trim(sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.addType))) = 0, " ", Trim(sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.addType)))
    Me.txtNO.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.addNo)
    Me.txtNO.Text = IIf(Trim(Me.txtNO.Text) = "0", "", Trim(Me.txtNO.Text))
    Me.txtAddressLine1.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.addLine1)
    Me.txtAddressLine2.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.addLine2)
    Me.txtCellPhones.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.cellPhone)
    Me.txtContactName.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.cntctNm)
    
    Me.txtCountryName.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.Country)
    Me.txtCountryName.DataField = Me.txtCountryName.Text
    Me.txtCountryName.Tag = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.countryID)
    Me.txtDistrictOrCityName.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.distCity)
    Me.txtDistrictOrCityName.DataField = Me.txtDistrictOrCityName.Text
    Me.txtDistrictOrCityName.Tag = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.distCityID)
    Me.txtStateName.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.state)
    Me.txtStateName.DataField = Me.txtStateName.Text
    Me.txtStateName.Tag = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.stateID)
    Me.txtPostOffice.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.postOffice)
    Me.txtPostOffice.DataField = Me.txtPostOffice.Text
    Me.txtPostOffice.Tag = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.postOfficeID)
    
    Me.txtDesignation.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.cntctDesig)
    Me.txtEffectiveFrom.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.effFrom)
    Me.txtEffectiveTill.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.effTill)
    Me.txtEmailAddress.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.EmailAdd)
    Me.txtFaxLines.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.Fax)
    Me.txtPinOrZipCode.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.pinZip)
    Me.txtTelephone.Text = sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.Telephone)
            
'''''    If Trim(Me.lblPartyAddID.Caption) <> "" And _
'''''        Trim(Me.lblPartyAddID.Caption) <> sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.updAddID) And _
'''''        Trim(sprPartyAddController.getTextOfCell(p_lonRow, sprPartyAddColNames.updAddID)) <> "" Then
'''''            isPartyAddUpdatable = False
'''''            modControlsSettings.setStateToReadOnly Me.txtAddressLine1, Me.txtAddressLine2, Me.txtCellPhones, _
'''''                            Me.txtContactName, Me.txtCountryName, Me.txtDesignation, Me.txtDistrictOrCityName, _
'''''                            Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtEmailAddress, Me.txtFaxLines, Me.txtNO, _
'''''                            Me.txtPinOrZipCode, Me.txtStateName, Me.txtTelephone, Me.txtPostOffice
'''''            Me.cmbAddressType.Enabled = False
'''''    Else
'''''            isPartyAddUpdatable = True
'''''            modControlsSettings.setStateToNormal Me.txtAddressLine1, Me.txtAddressLine2, Me.txtCellPhones, _
'''''                            Me.txtContactName, Me.txtCountryName, Me.txtDesignation, Me.txtDistrictOrCityName, _
'''''                            Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtEmailAddress, Me.txtFaxLines, Me.txtNO, _
'''''                            Me.txtPinOrZipCode, Me.txtStateName, Me.txtTelephone, Me.txtPostOffice
'''''            Me.cmbAddressType.Enabled = True
'''''    End If
            
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "loadSummaryToDetail", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub clearPartyAddress()
On Error GoTo errortag

    utils.clearControls Me.txtNO, Me.txtCountryName, Me.txtStateName, Me.txtDistrictOrCityName, _
                        Me.txtPinOrZipCode, Me.txtContactName, Me.txtDesignation, Me.txtCellPhones, _
                        Me.txtTelephone, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtEmailAddress, _
                        Me.txtFaxLines, Me.txtAddressLine1, Me.txtAddressLine2
    Me.cmbAddressType.Text = " "
    Me.lblPartyAddID.Caption = ""
    Me.lblGUID.Caption = ""
    
    If Me.clsWindowInterface_getMode = uiManager.INSERT_MODE Then
        Me.txtEffectiveFrom.Text = Format(modMain.getCurrentDate, "dd MMM yyyy")
        Me.txtEffectiveTill.Text = "31 DEC 9999"
    End If
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clearPartyAddress", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub cmdAfter_Click()
On Error GoTo errortag
    
    If (Not validateLoadDetails) Then Exit Sub
    
    sprPartyAddController.insertRowBelow
    Debug.Print Me.sprPartyAdd.Row
    
    Me.lblGUID.Caption = utils.getGUID
    sprPartyAddController.setTextOfCell Me.sprPartyAdd.ActiveRow, sprPartyAddColNames.Guid, Me.lblGUID.Caption
    
    loadSummaryToDetail (Me.sprPartyAdd.ActiveRow)
    setEnableDisableButtons
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmdAfter_Click", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub cmdBefore_click()
On Error GoTo errortag
    
    If (Not validateLoadDetails) Then Exit Sub
    
    sprPartyAddController.insertRowAbove
    Debug.Print Me.sprPartyAdd.Row
    
    Me.lblGUID.Caption = utils.getGUID
    sprPartyAddController.setTextOfCell Me.sprPartyAdd.ActiveRow, sprPartyAddColNames.Guid, Me.lblGUID.Caption
    
    loadSummaryToDetail (Me.sprPartyAdd.ActiveRow)
    setEnableDisableButtons
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmdBefore_click", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub cmdLast_click()
On Error GoTo errortag
    
    If (Not validateLoadDetails) Then Exit Sub

    sprPartyAddController.insertRowLast
    Debug.Print Me.sprPartyAdd.Row
    
    Me.lblGUID.Caption = utils.getGUID
    sprPartyAddController.setTextOfCell Me.sprPartyAdd.ActiveRow, sprPartyAddColNames.Guid, Me.lblGUID.Caption
    
    loadSummaryToDetail (Me.sprPartyAdd.ActiveRow)
    
    Me.lblRecordPositonIndicator.Caption = Me.sprPartyAdd.MaxRows & "/" & Me.sprPartyAdd.MaxRows
    Me.cmdDown.Enabled = False
    Me.cmdUp.Enabled = True
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmdLast_click", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub cmdUp_click()
On Error GoTo errortag
    
    Dim lonRow As Long
    lonRow = sprPartyAddController.searchTextInColumn(sprPartyAddColNames.Guid, Me.lblGUID.Caption)
    
    If (Not validateLoadDetails) Then Exit Sub
    loadSummaryToDetail (lonRow - 1)
    
    setEnableDisableButtons
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmdUp_click", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub cmdDown_click()
On Error GoTo errortag
    
    Dim lonRow As Long
    lonRow = sprPartyAddController.searchTextInColumn(sprPartyAddColNames.Guid, Me.lblGUID.Caption)
    
    If (Not validateLoadDetails) Then Exit Sub
    loadSummaryToDetail (lonRow + 1)
    
    setEnableDisableButtons
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmdDown_click", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    errorManager.handleError
End Sub

Private Sub setEnableDisableButtons()
On Error GoTo errortag
    
    '[[logic for setting the navigation buttons enabled or disabled
    Dim isFirstRow As Boolean
    Dim isLastRow As Boolean
    Dim isMiddleRow As Boolean
    Dim firstNonDeletedRow As Long
    Dim totalNonDeletedRows As Long
    
    totalNonDeletedRows = sprPartyAdd.MaxRows - sprPartyAddController.getNumberOfRowsForState(DELETED_STATE)
    If Me.sprPartyAdd.MaxRows > 0 And sprPartyAddController.getRowState(Me.sprPartyAdd.Row) <> DELETED_STATE Then
        Me.lblRecordPositonIndicator.Caption = sprPartyAddController.getDisplayOrderForRow(sprPartyAdd.Row) & "/" & totalNonDeletedRows
    End If
    firstNonDeletedRow = sprPartyAddController.getNextNonDeletedRow(0)
    
    Dim lonRow As Long
    lonRow = sprPartyAddController.searchTextInColumn(sprPartyAddColNames.Guid, Me.lblGUID.Caption)
    Me.lblRecordPositonIndicator.Caption = lonRow & "/" & Me.sprPartyAdd.MaxRows
    
    If (lonRow = firstNonDeletedRow) Then
        isFirstRow = True
    End If
    If (lonRow = totalNonDeletedRows) Then
        isLastRow = True
    End If
    If ((isFirstRow = False) And (isLastRow = False)) Then
        isMiddleRow = True
    End If
    'now set the buttons
    If (Not isFirstRow) Then
        Me.cmdBefore.Enabled = isLastRow Or isMiddleRow
        Me.cmdUp.Enabled = isLastRow Or isMiddleRow
        If Me.sprPartyAdd.MaxRows = 0 Then
            Me.cmdUp.Enabled = False
        End If
    Else
        'Me.cmdBefore.Enabled = False
        Me.cmdUp.Enabled = False
    End If
    If (Not isLastRow) Then
        Me.cmdDown.Enabled = isFirstRow Or isMiddleRow
    Else
        Me.cmdDown.Enabled = False
    End If
    ']]
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "setEnableDisableButtons", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub


