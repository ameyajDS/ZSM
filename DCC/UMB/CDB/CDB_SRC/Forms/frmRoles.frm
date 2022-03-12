VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "Edt32x30.ocx"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.ocx"
Begin VB.Form frmRoles 
   BackColor       =   &H00C0C0C0&
   Caption         =   "ROLES"
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
   Begin VB.Frame fraRoles 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Height          =   8535
      Left            =   60
      TabIndex        =   14
      Top             =   0
      Width           =   12885
      Begin FPSpread.vaSpread sprApplication 
         Height          =   3315
         Left            =   1020
         TabIndex        =   6
         Top             =   1170
         Width           =   6345
         _Version        =   393216
         _ExtentX        =   11192
         _ExtentY        =   5847
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
         SpreadDesigner  =   "frmRoles.frx":0000
      End
      Begin EditLib.fpBoolean chkUpdatePartyRoles 
         Height          =   315
         Left            =   3180
         TabIndex        =   7
         Top             =   4920
         Width           =   2025
         _Version        =   196608
         _ExtentX        =   3572
         _ExtentY        =   556
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
         TextFalse       =   "Update Party Roles"
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
         Caption         =   "Update Party Roles"
         ThreeDFrameColor=   -2147483633
         Appearance      =   0
         BorderDropShadow=   0
         BorderDropShadowColor=   -2147483632
         BorderDropShadowWidth=   3
         BooleanDataType =   0
         OLEDropMode     =   0
      End
      Begin VB.ComboBox cmbAddReqd 
         BackColor       =   &H00E0E0E0&
         Height          =   360
         Left            =   5280
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   480
         Width           =   2085
      End
      Begin EditLib.fpDateTime txtEffectiveFrom 
         Height          =   345
         Left            =   2100
         TabIndex        =   9
         Top             =   5670
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
         ButtonColor     =   12632256
         AutoMenu        =   0   'False
         StartMonth      =   4
         ButtonAlign     =   0
         BoundDataType   =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   345
         Left            =   4380
         TabIndex        =   11
         Top             =   5655
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
         ButtonColor     =   12632256
         AutoMenu        =   0   'False
         StartMonth      =   4
         ButtonAlign     =   0
         BoundDataType   =   0
         OLEDropMode     =   0
         OLEDragMode     =   0
      End
      Begin EditLib.fpText txtRoleName 
         Height          =   345
         Left            =   2430
         TabIndex        =   3
         Top             =   480
         Width           =   2355
         _Version        =   196608
         _ExtentX        =   4154
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
         MaxLength       =   15
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
      Begin EditLib.fpText txtRoleCode 
         Height          =   345
         Left            =   990
         TabIndex        =   1
         Top             =   480
         Width           =   915
         _Version        =   196608
         _ExtentX        =   1614
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
         MaxLength       =   3
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
      Begin VB.Label lblAddReqd 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Address Requirement"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5280
         TabIndex        =   4
         Top             =   240
         Width           =   1875
      End
      Begin VB.Label lblRoleCode 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Role Code"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   990
         TabIndex        =   0
         Top             =   240
         Width           =   900
      End
      Begin VB.Label lblRoleName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Role Name"
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   2430
         TabIndex        =   2
         Top             =   240
         Width           =   960
      End
      Begin VB.Label lblEffectiveFrom 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   2100
         TabIndex        =   8
         Top             =   5415
         Width           =   1290
      End
      Begin VB.Label lblEffectiveTill 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   4380
         TabIndex        =   10
         Top             =   5415
         Width           =   1080
      End
   End
   Begin VB.Frame fraListRoles 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Height          =   7845
      Left            =   0
      TabIndex        =   13
      Top             =   0
      Width           =   13635
      Begin FPSpread.vaSpread sprListRoles 
         Height          =   6465
         Left            =   270
         TabIndex        =   12
         TabStop         =   0   'False
         Top             =   210
         Width           =   11755
         _Version        =   393216
         _ExtentX        =   20735
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
         SpreadDesigner  =   "frmRoles.frx":01E2
      End
   End
End
Attribute VB_Name = "frmRoles"
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

Dim intMode As Integer
Dim strTxnTs As String

Dim WithEvents sprListRolesController As clsSpreadController
Attribute sprListRolesController.VB_VarHelpID = -1
Dim WithEvents sprApplicationController As clsSpreadController
Attribute sprApplicationController.VB_VarHelpID = -1

Private Enum sprListRolesColNames
    roleCD = 1
    roleNm
    addReqd
    effFrom
    effTill
    txnTs
End Enum

Private Enum sprApplicationColNames
    oldOwnerAppID = 1
    ownerAppID
    ownerApp
    oldAppID
    appID
    App
    read
    Update
End Enum

Private Sub setEnableDisableControls()

    Me.chkUpdatePartyRoles.Visible = False
    
    Select Case Me.clsWindowInterface_getMode

        Case uiManager.INSERT_MODE, uiManager.NEW_MODE

            Me.clsWindowInterface_fireErase
            Me.txtEffectiveFrom.Text = Format(modMain.getCurrentDate, "dd MMM yyyy")
            Me.txtEffectiveTill.Text = "31 DEC 9999"

            modControlsSettings.setStateToNormal Me.txtRoleCode
            Me.chkUpdatePartyRoles.BooleanMode = BooleanModeTwoState
            sprApplicationController.setSpreadMode Me.clsWindowInterface_getMode

            Me.fraRoles.ZOrder 0
            Me.txtRoleCode.SetFocus
            
        Case uiManager.QUERY_MODE

            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtRoleCode
            Me.chkUpdatePartyRoles.BooleanMode = BooleanModeThreeState
            sprApplicationController.setSpreadMode Me.clsWindowInterface_getMode, True

            Me.fraRoles.ZOrder 0
            Me.txtRoleCode.SetFocus

        Case uiManager.BROWSE_MODE, uiManager.UPDATE_MODE

            modControlsSettings.setStateToReadOnly Me.txtRoleCode
            Me.chkUpdatePartyRoles.BooleanMode = BooleanModeTwoState
            sprApplicationController.setSpreadMode Me.clsWindowInterface_getMode

            Me.fraRoles.ZOrder 0
            Me.txtRoleName.SetFocus
            
            Me.chkUpdatePartyRoles.Value = ValueFalse
            Me.chkUpdatePartyRoles.Visible = True

        Case uiManager.LIST_MODE
            Me.fraListRoles.ZOrder 0

        Case uiManager.REFERENCE_MODE
            modControlsSettings.setStateToReadOnly Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtRoleCode, _
                                                   Me.txtRoleName, Me.cmbAddReqd, Me.chkUpdatePartyRoles
            Me.chkUpdatePartyRoles.BooleanMode = BooleanModeTwoState
            sprApplicationController.setSpreadMode Me.clsWindowInterface_getMode
            Me.fraRoles.ZOrder 0

    End Select

End Sub

Private Sub setSpreadController()

    Set sprListRolesController = New clsSpreadController
    sprListRolesController.registerSpreadInstance uiManager, Me.sprListRoles, LIST_SPREAD, Me

    sprListRolesController.addColumn "Role Code", 10, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT
    sprListRolesController.addColumn "Role Name", 40, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT
    sprListRolesController.addColumn "Address Requirement", 20, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT
    sprListRolesController.addColumn "Effective From", 15, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , CENTER_ALIGNMENT
    sprListRolesController.addColumn "Effective Till", 15, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , CENTER_ALIGNMENT
    sprListRolesController.addColumn "TxnTs", 0, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , CENTER_ALIGNMENT

    Set sprApplicationController = New clsSpreadController
    sprApplicationController.registerSpreadInstance uiManager, Me.sprApplication, NORMAL_SPREAD, Me, , , , MANDATORY_SPREAD

    sprApplicationController.addColumn "Old Owner App ID", 0, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , CENTER_ALIGNMENT
    sprApplicationController.addColumn "Owner App ID", 0, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , CENTER_ALIGNMENT
    sprApplicationController.addColumn "Owner Application", 38, edit_CELL_TYPE, EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_ENABLED, , , LEFT_ALIGNMENT
    sprApplicationController.addColumn "Old App ID", 0, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , CENTER_ALIGNMENT
    sprApplicationController.addColumn "App ID", 0, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN, , LOOKUP_DISABLED, , , CENTER_ALIGNMENT
    sprApplicationController.addColumn "Application", 38, edit_CELL_TYPE, EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_ENABLED, , , LEFT_ALIGNMENT
    sprApplicationController.addColumn "Read", 12, CHECKBOX_CELL_TYPE, EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT
    sprApplicationController.addColumn "Update", 12, CHECKBOX_CELL_TYPE, EDITABLE_COLUMN, MANDATORY_COLUMN, , LOOKUP_DISABLED, , , LEFT_ALIGNMENT

End Sub

Public Sub clsCalledFormInterface_getReturnValues(p_strDisplayText As String, _
                                                  p_strIDText As String, _
                                                  p_colAdditionalValues As Collection)
    p_strIDText = Me.txtRoleCode
    p_strDisplayText = Me.txtRoleName

End Sub

Public Sub clsCalledFormInterface_showCalledForm(ByVal p_intCallMode As Integer, _
                                                 ByVal p_strDisplayText As String, _
                                                 ByVal p_strIDText As String, _
                                                 p_colAdditionalValues As Collection)
On Error GoTo errortag

    Me.clsWindowInterface_showForm p_intCallMode

    Select Case Me.clsWindowInterface_getMode
        Case uiManager.BROWSE_MODE, uiManager.REFERENCE_MODE
            Me.txtRoleCode.Text = p_strIDText
            sprListRolesController.retrieveRecords Me.clsQueryInterface_getSQLStringForRetrieval
            Me.clsQueryInterface_populateFieldsFromRetrievalSpread 1
    End Select

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsCalledFormInterface_showCalledForm", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsCallingFormInterface_getForeignKeyInformation(p_objActiveControl As Object, p_objCallForm As Object, p_strDisplayText As String, p_strIDText As String, p_colAdditionalInformation As Collection)

End Sub

Public Sub clsCallingFormInterface_setReturnedValues(p_objSourceObject As Object, _
                                                     ByVal p_strDisplayText As String, _
                                                     ByVal p_strIDText As String, _
                                                     p_colAdditionalValues As Collection)
On Error GoTo errortag

    If (p_objSourceObject Is Me.sprApplication) Then

        '-- Owner Application
        If (Me.sprApplication.ActiveCol = sprApplicationColNames.ownerApp) Then
            sprApplicationController.setTextOfCell Me.sprApplication.ActiveRow, sprApplicationColNames.ownerApp, p_strDisplayText
            sprApplicationController.setTextOfCell Me.sprApplication.ActiveRow, sprApplicationColNames.ownerAppID, p_strIDText
        End If

        '-- Application
        If (Me.sprApplication.ActiveCol = sprApplicationColNames.App) Then
            sprApplicationController.setTextOfCell Me.sprApplication.ActiveRow, sprApplicationColNames.App, p_strDisplayText
            sprApplicationController.setTextOfCell Me.sprApplication.ActiveRow, sprApplicationColNames.appID, p_strIDText
        End If
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

Private Sub saveRoles()
On Error GoTo errortag

    Dim strSQL As String

    Select Case Me.clsWindowInterface_getMode

        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
            strSQL = utils.createSPTypeGenericStatement("CDB..insRoles", _
                            utils.createVariantArray(Me.txtRoleCode, Me.txtRoleName, Me.cmbAddReqd, _
                                                     Me.txtEffectiveFrom, Me.txtEffectiveTill))
            dbManager.executeSQL strSQL

        Case uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            strSQL = utils.createSPTypeGenericStatement("CDB..updRoles", _
                            utils.createVariantArray(Me.txtRoleCode, Me.txtRoleName, Me.cmbAddReqd, _
                                                     Me.txtEffectiveFrom, Me.txtEffectiveTill, strTxnTs))
            dbManager.executeSQL strSQL

    End Select

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "saveRoles", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub saveApplications()
On Error GoTo errortag

    Dim strDeleteTemplate As String
    Dim strUpdateTemplate As String
    Dim strInsertTemplate As String
    Dim state As String
    Dim i As Long

    strDeleteTemplate = "CDB..delRolesAppControls " & Trim(Me.txtRoleCode.Text) & ",@@, @@"
    strUpdateTemplate = "CDB..updRolesAppControls " & Trim(Me.txtRoleCode.Text) & ", @@, @@, @@, @@, @@, @@"
    strInsertTemplate = "CDB..insRolesAppControls " & Trim(Me.txtRoleCode.Text) & ", @@, @@, @@, @@"

    If sprApplicationController.getNumberOfRowsForState(DELETED_STATE) <> 0 Then
        Dim deletedStrings() As String
        state = DELETED_STATE
        deletedStrings = sprApplicationController.getDeleteStrings(strDeleteTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            sprApplicationColNames.ownerAppID, _
                                                                            sprApplicationColNames.appID)
        For i = 0 To UBound(deletedStrings)
            dbManager.executeSQL deletedStrings(i)
        Next i
    End If

    If sprApplicationController.getNumberOfRowsForState(UPDATED_STATE) <> 0 Then
        Dim updateStrings() As String
        state = UPDATED_STATE
        updateStrings = sprApplicationController.getUpdateStrings(strUpdateTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            sprApplicationColNames.oldOwnerAppID, _
                                                                            sprApplicationColNames.ownerAppID, _
                                                                            sprApplicationColNames.oldAppID, _
                                                                            sprApplicationColNames.appID, _
                                                                            sprApplicationColNames.read, _
                                                                            sprApplicationColNames.Update)
        For i = 0 To UBound(updateStrings)
            dbManager.executeSQL updateStrings(i)
        Next i
    End If

    If sprApplicationController.getNumberOfRowsForState(NEW_STATE) <> 0 Then
        Dim insertStrings() As String
        state = NEW_STATE
        insertStrings = sprApplicationController.getInsertStrings(strInsertTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            sprApplicationColNames.ownerAppID, _
                                                                            sprApplicationColNames.appID, _
                                                                            sprApplicationColNames.read, _
                                                                            sprApplicationColNames.Update)

        For i = 0 To UBound(insertStrings)
            dbManager.executeSQL insertStrings(i)
        Next i
    End If

Exit Sub
errortag:
    'Call sprApplicationController.highlightErroneousRow(i, state)
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "saveApplications", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub


Public Sub clsEditInterface_fireSave()
On Error GoTo errortag

    Dim isRollbackable As Boolean

    dbManager.beginTrans
    isRollbackable = True

    saveRoles
    saveApplications

    If ((Me.chkUpdatePartyRoles.Value = ValueTrue) And _
        (Me.clsWindowInterface_getMode = uiManager.UPDATE_MODE Or _
        Me.clsWindowInterface_getMode = uiManager.BROWSE_MODE)) Then
            dbManager.executeSQL utils.createSPTypeGenericStatement("CDB..updPartyRolesChk", _
                                    utils.createVariantArray(Trim(Me.txtRoleCode.Text), Me.chkUpdatePartyRoles.Value))
    End If
    
    dbManager.commitTrans
    isRollbackable = False

    logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Me.chkUpdatePartyRoles.Value = ValueFalse
    
    Select Case Me.clsWindowInterface_getMode

        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
            If Me.clsWindowInterface_getMode = uiManager.INSERT_MODE Then
                Me.clsWindowInterface_showForm uiManager.INSERT_MODE
            End If

        Case uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            sprListRolesController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, Me.sprListRoles.ActiveRow

    End Select

Exit Sub
errortag:
    If (isRollbackable) Then
        dbManager.rollBackTrans
    End If
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsEditInterface_fireSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Function clsEditInterface_isReadyToSave() As Boolean
On Error GoTo errortag

    clsEditInterface_isReadyToSave = True
    Me.ValidateControls

    If (Not validateRoleCode) Then
        clsEditInterface_isReadyToSave = False
        Me.txtRoleCode.SetFocus
        Exit Function
    End If

    If (Not validateRoleName) Then
        clsEditInterface_isReadyToSave = False
        Me.txtRoleName.SetFocus
        Exit Function
    End If

    If (Not validateAddReqd) Then
        clsEditInterface_isReadyToSave = False
        Me.cmbAddReqd.SetFocus
        Exit Function
    End If

    If (Not validateEffectiveFrom) Then
        clsEditInterface_isReadyToSave = False
        Me.txtEffectiveFrom.SetFocus
        Exit Function
    End If

    If (Not validateEffectiveTill) Then
        clsEditInterface_isReadyToSave = False
        Me.txtEffectiveTill.SetFocus
        Exit Function
    End If

    If (Not sprApplicationController.prepareSpreadForSave) Then
        clsEditInterface_isReadyToSave = False
        Exit Function
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsEditInterface_isReadyToSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
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
    dbManager.executeSQL "CDB..delRoles '" & Trim(Me.txtRoleCode.Text) & "'," & strTxnTs
    dbManager.commitTrans

Exit Sub
errortag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_fireRemove", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
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
    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListRolesController
End Function

Public Function clsQueryInterface_getSQLStringForRetrieval() As String
On Error GoTo errortag

    Dim strSQL As String
    strSQL = "SELECT " & _
                "role_cd, " & _
                "role_nm, " & _
                "address_requirement, " & _
                "Upper(Convert(varchar, effective_from, 106)) effective_from, " & _
                "Upper(Convert(varchar, effective_till, 106)) effective_till, " & _
                "Cast(txn_ts as BigInt) as txn_ts " & _
             "FROM " & _
                "CDB..roles " & _
             "WHERE " & _
                "role_cd LIKE '%" & Me.txtRoleCode.Text & "%' " & _
                "AND role_nm LIKE '%" & Me.txtRoleName.Text & "%' " & _
                "AND address_requirement LIKE '%" & Trim(Me.cmbAddReqd.Text) & "%' "

'    Dim strSQL As String
'    strSQL = utils.createSPTypeGenericStatement("qryRoles", _
'                utils.createVariantArray(Me.txtRoleCode, Me.txtRoleName, Trim(Me.cmbAddReqd.Text), _
'                                         Me.txtEffectiveFrom, Me.txtEffectiveTill))
'                                         , _
'                                         sprApplicationController.getTextOfCell(1, sprApplicationColNames.ownerApp), _
'                                         sprApplicationController.getTextOfCell(1, sprApplicationColNames.App)), _
'                                         False)

    clsQueryInterface_getSQLStringForRetrieval = strSQL

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_getSQLStringForRetrieval", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)
On Error GoTo errortag

    Me.txtRoleCode.Text = sprListRolesController.getTextOfCell(p_lonRow, sprListRolesColNames.roleCD)
    Me.txtRoleName.Text = sprListRolesController.getTextOfCell(p_lonRow, sprListRolesColNames.roleNm)
    Me.cmbAddReqd.Text = sprListRolesController.getTextOfCell(p_lonRow, sprListRolesColNames.addReqd)
    Me.txtEffectiveFrom.Text = sprListRolesController.getTextOfCell(p_lonRow, sprListRolesColNames.effFrom)
    Me.txtEffectiveTill.Text = sprListRolesController.getTextOfCell(p_lonRow, sprListRolesColNames.effTill)
    strTxnTs = sprListRolesController.getTextOfCell(p_lonRow, sprListRolesColNames.txnTs)

    Dim strSQL As String
    strSQL = "SELECT " & _
                "RAC.owner_application_id as old_owner_application_id, " & _
                "RAC.owner_application_id, " & _
                "A1.application_nm as owner_application_nm, " & _
                "RAC.application_id as old_application_id, " & _
                "RAC.application_id, " & _
                "A2.application_nm as application_nm, " & _
                "RAC.is_read, " & _
                "RAC.is_update " & _
             "FROM " & _
                "CDB..roles_application_controls RAC " & _
                "JOIN SysAdmin..applications A1 ON rac.owner_application_id = A1.application_id " & _
                "JOIN SysAdmin..applications A2 ON rac.application_id = A2.application_id " & _
             "WHERE " & _
                "role_cd = '" & Me.txtRoleCode.Text & "'"

'    strSQL = utils.createSPTypeGenericStatement("qryRolesAppControls", _
'                    utils.createVariantArray(Me.txtRoleCode))
    sprApplicationController.retrieveRecords strSQL

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsQueryInterface_populateFieldsFromRetrievalSpread", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Public Sub clsWindowInterface_fireClose()

End Sub

Public Sub clsWindowInterface_fireErase()
On Error GoTo errortag

    utils.clearControls Me.txtRoleCode, Me.txtRoleName
    sprApplicationController.clearSpread

    Select Case Me.clsWindowInterface_getMode
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
            Me.txtEffectiveFrom.Text = Format(modMain.getCurrentDate, "dd MMM yyy")
            Me.txtEffectiveTill.Text = "31 DEC 9999"
        Case uiManager.QUERY_MODE
            utils.clearControls Me.txtEffectiveFrom, Me.txtEffectiveTill
    End Select

    clearLoadAddReqd

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
    clsWindowInterface_getScreenID = "EXT_01"
End Function

Public Sub clsWindowInterface_setFieldInFocus(ByVal p_strControlNameIndicator As String)

End Sub

Public Sub clsWindowInterface_showForm(p_intMode As Integer)
On Error GoTo errortag

    intMode = p_intMode
    If Not mdiMain.ActiveForm Is Me Then
        setSpreadController
    End If
    Me.Visible = True
    Me.ZOrder 0
    setEnableDisableControls

    clearLoadAddReqd

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsWindowInterface_showForm", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub clearLoadAddReqd()
On Error GoTo errortag

    Me.cmbAddReqd.Clear
    Me.cmbAddReqd.AddItem modMain.ADD_TYPE_MANDATORY
    Me.cmbAddReqd.AddItem modMain.ADD_TYPE_OPTIONAL
    Me.cmbAddReqd.AddItem modMain.ADD_TYPE_NOT_REQUIRED

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clearLoadAddReqd", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub sprApplicationController_RequestLookup(ByVal p_lonColumn As Long, _
                                                   ByVal p_lonRow As Long, _
                                                   ByVal p_bolIsLastEditableCell As Boolean, _
                                                   ByVal p_bolIsLastRow As Boolean, _
                                                   ByVal p_enmSearchMode As ADL.enmLookupSearchModes, p_blnLookupResult As Boolean)
On Error GoTo errortag

    modLookup.showLookUpForApplication Me, Me.sprApplication, Nothing, sprApplicationController.getTextOfCell(p_lonRow, p_lonColumn), absolute

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprApplicationController_RequestLookup", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub sprApplicationController_ValidateCell(ByVal p_lonRow As Long, _
                                                  ByVal p_lonColumn As Long, _
                                                  p_bolIsCellValid As Boolean)
On Error GoTo errortag

    Select Case p_lonColumn

        Case sprApplicationColNames.appID, sprApplicationColNames.ownerAppID
            Dim appCols() As Long
            appCols = utils.createLongArray(sprApplicationColNames.ownerAppID, sprApplicationColNames.appID)

            If (sprApplicationController.isCellValueRepeatedInColumn(appCols, p_lonRow, True) = True) Then
                logger.logMessage modStandardMessages.ValueRepeated, "Owner Application and Application", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
                p_bolIsCellValid = False
            End If

        Case sprApplicationColNames.Update
            If (sprApplicationController.getTextOfCell(p_lonRow, sprApplicationColNames.Update) = vbChecked) Then
                sprApplicationController.setTextOfCell p_lonRow, sprApplicationColNames.read, vbChecked
            End If

    End Select

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprApplicationController_ValidateCell", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub sprApplicationController_ValidateRow(ByVal p_lonRow As Long, _
                                                 p_bolIsRowValid As Boolean)
On Error GoTo errortag

    Dim appCols() As Long
    appCols = utils.createLongArray(sprApplicationColNames.ownerAppID, sprApplicationColNames.appID)

    If (sprApplicationController.isCellValueRepeatedInColumn(appCols, p_lonRow, True) = True) Then
        logger.logMessage modStandardMessages.ValueRepeated, "Owner Application and Application", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        p_bolIsRowValid = False
        Exit Sub
    End If

    If (sprApplicationController.getTextOfCell(p_lonRow, sprApplicationColNames.Update) <> vbChecked) And _
       (sprApplicationController.getTextOfCell(p_lonRow, sprApplicationColNames.read) <> vbChecked) Then
            logger.logMessage modStandardMessages.OneOfTwoValuesReqd, "Read|Update", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            p_bolIsRowValid = False
    End If

    If (sprApplicationController.getTextOfCell(p_lonRow, sprApplicationColNames.Update) = vbChecked) Then
        sprApplicationController.setTextOfCell p_lonRow, sprApplicationColNames.read, vbChecked
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprApplicationController_ValidateRow", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'validating EffectiveFrom
Private Sub txtEffectiveFrom_Validate(Cancel As Boolean)
On Error GoTo errortag

    'check for mandatory field - EffectiveFrom
    If validateEffectiveFrom And intMode <> uiManager.QUERY_MODE Then
        If DateDiff("d", Me.txtEffectiveFrom.Text, Date) < 0 Then
            logger.logMessage modStandardMessages.LesserOrEqualValueReqd, "Effective From|" & Format(Date, "dd mmm yyyy"), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        End If
    End If
    If Not validateEffectiveFrom And Me.txtEffectiveFrom.Text <> "" Then
        Cancel = True
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtEffectiveFrom_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'validating effectiveTill
Private Sub txtEffectiveTill_Validate(Cancel As Boolean)
On Error GoTo errortag

    'check for mandatory field - EffectiveTill
    If validateEffectiveTill And intMode <> uiManager.QUERY_MODE Then
        If DateDiff("d", Me.txtEffectiveTill.Text, Date) > 0 Then
            logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Effective Till|" & Format(Date, "dd mmm yyyy"), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        End If
    End If
    If Not validateEffectiveTill And Me.txtEffectiveTill.Text <> "" Then
        Cancel = True
    End If

Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtEffectiveTill_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub cmbAddReqd_Validate(Cancel As Boolean)
On Error GoTo errortag
    validateAddReqd
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "cmbAddReqd_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.lblAddReqd, Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblRoleCode, Me.lblRoleName, _
                                                         Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtRoleCode, Me.txtRoleName, _
                                                         Me.cmbAddReqd, _
                                                         Me.chkUpdatePartyRoles
End Sub

Private Function validateRoleCode() As Boolean
On Error GoTo errortag

    validateRoleCode = True
    If Me.clsWindowInterface_getMode = uiManager.QUERY_MODE Then Exit Function

    If Len(Trim(Me.txtRoleCode.Text)) = 0 Then
        logger.logMessage modStandardMessages.ValueReqd, "Role code", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateRoleCode = False
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validateRoleCode", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Private Function validateRoleName() As Boolean
On Error GoTo errortag

    validateRoleName = True
    If Me.clsWindowInterface_getMode = uiManager.QUERY_MODE Then Exit Function

    If Len(Trim(Me.txtRoleName.Text)) = 0 Then
        logger.logMessage modStandardMessages.ValueReqd, "Role name", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateRoleName = False
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validateRoleName", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Private Function validateAddReqd() As Boolean
On Error GoTo errortag

    validateAddReqd = True
    If Me.clsWindowInterface_getMode = uiManager.QUERY_MODE Then Exit Function

    If Len(Trim(Me.cmbAddReqd.Text)) = 0 Then
        logger.logMessage modStandardMessages.ValueReqd, "Address Required", WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        validateAddReqd = False
    End If

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validateAddReqd", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

'private function returning true when the field - effective from is valid, otherwise false
Private Function validateEffectiveFrom() As Boolean
On Error GoTo errortag

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

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validateEffectiveFrom", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

'private function returning true when the field - effective till is valid, otherwise false
Private Function validateEffectiveTill() As Boolean
On Error GoTo errortag

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

Exit Function
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "validateEffectiveTill", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Function

Private Sub txtRoleCode_Validate(Cancel As Boolean)
On Error GoTo errortag
    validateRoleCode
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtRoleCode_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub txtRoleName_Validate(Cancel As Boolean)
On Error GoTo errortag
    validateRoleName
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "txtRoleName_Validate", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub
