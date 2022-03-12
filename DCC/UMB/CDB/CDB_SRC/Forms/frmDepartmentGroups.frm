VERSION 5.00
Object = "{CDF3B183-D408-11CE-AE2C-0080C786E37D}#3.0#0"; "EDT32X30.OCX"
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.OCX"
Begin VB.Form frmDepartmentGroups 
   BackColor       =   &H00C0C0C0&
   Caption         =   "DEPARTMENT GROUPS"
   ClientHeight    =   5820
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
   ScaleHeight     =   5820
   ScaleWidth      =   8880
   Visible         =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.Frame fraDepartmentGroups 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   10665
      Left            =   0
      TabIndex        =   13
      Top             =   0
      Width           =   11895
      Begin EditLib.fpText txtDepartmentGroupCode 
         Height          =   350
         Left            =   6735
         TabIndex        =   3
         Top             =   480
         Width           =   600
         _Version        =   196608
         _ExtentX        =   1058
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
         CharValidationText=   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
         MaxLength       =   2
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
         Height          =   350
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
      Begin EditLib.fpText txtDepartmentGroupName 
         Height          =   350
         Left            =   3720
         TabIndex        =   5
         Top             =   1220
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
      Begin EditLib.fpDateTime txtEffectiveTill 
         Height          =   350
         Left            =   5820
         TabIndex        =   9
         Top             =   1960
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
      Begin EditLib.fpDateTime txtEffectiveFrom 
         Height          =   350
         Left            =   3720
         TabIndex        =   7
         Top             =   1960
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
      Begin FPSpread.vaSpread sprDepartmentGroups 
         Height          =   3195
         Left            =   2340
         TabIndex        =   11
         TabStop         =   0   'False
         Tag             =   "Department Spread"
         Top             =   2460
         Visible         =   0   'False
         Width           =   6915
         _Version        =   393216
         _ExtentX        =   12197
         _ExtentY        =   5636
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
         ScrollBars      =   2
         ShadowColor     =   12632256
         SpreadDesigner  =   "frmDepartmentGroups.frx":0000
      End
      Begin VB.Label lblDepartmentGroupName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Code "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   6735
         TabIndex        =   2
         Top             =   240
         Width           =   510
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
      Begin VB.Label lblEffectiveFrom 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective From "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   6
         Top             =   1720
         Width           =   1290
      End
      Begin VB.Label lblDepartmentGroupsName 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Name "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   3720
         TabIndex        =   4
         Top             =   980
         Width           =   570
      End
      Begin VB.Label lblEffectiveTill 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Effective Till "
         ForeColor       =   &H00800000&
         Height          =   240
         Left            =   5820
         TabIndex        =   8
         Top             =   1720
         Width           =   1080
      End
   End
   Begin VB.Frame fraListDepartmentGroups 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      ForeColor       =   &H00800000&
      Height          =   10455
      Left            =   0
      TabIndex        =   10
      Top             =   0
      Width           =   12495
      Begin FPSpread.vaSpread sprListDepartmentGroups 
         Height          =   6465
         Left            =   120
         TabIndex        =   12
         TabStop         =   0   'False
         Tag             =   "Department Groups List Spread"
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
         SpreadDesigner  =   "frmDepartmentGroups.frx":0217
      End
   End
End
Attribute VB_Name = "frmDepartmentGroups"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Implements clsWindowInterface
Implements clsEditInterface
Implements clsQueryInterface
Implements clsCalledFormInterface

'This variable holds the value of the current mode of the form. This is set each
'time the form is opened in different mode with the 'showForm()' method of the
''clsWindowInterface'. And the value of this variable is returned, whenever requested
'through 'getMode()' method of the 'clsWindowInterface'
Dim intMode As Integer

'stores newly generated department group ID returned in fireSave() method of clsEditInterface. the
'variable holding ID is displayed in message bar in Insert Mode as well as is called in
'getReturnValues() method of clsCalledFormInterface to set the local variable strIDText in NewMode
Dim intDeptGroupID As Long

'stores the value of txn_ts. the variable is set in the populateFieldsFromRetrievalSpread method
'of the interface clsQueryInterface
Dim varTxnTs As Variant

'The declaration of spread controller for retrieving and browsing the departments
'of the specified department groups. This object variable is defined "withEvents" because this code module
'needs to catch the events thrown by this controller (like 'validateCell', 'validateRow' etc)
Dim WithEvents sprDepartmentGroupsController As clsSpreadController
Attribute sprDepartmentGroupsController.VB_VarHelpID = -1

'The declaration of spread controller for retrieving the records from the department groups
'table. This spread controller is also used to show the records in list mode. This object variable
'is defined "withEvents" because this code module needs to catch the events thrown by this
'controller (like 'validateCell', 'validateRow' etc)
Dim WithEvents sprListDepartmentGroupsController As clsSpreadController
Attribute sprListDepartmentGroupsController.VB_VarHelpID = -1

'This enum holds all the column numbers of the spread controller 'sprListDepartmentGroupsController' that
'shows all the records of department groups. The column numbers are stored into variables named corresponding
'to column names. These are called in functions of spreadController like 'getTextOfCell'
'or 'setTextOfCell' which requires row number and column number.
Private Enum deptGroupColumns
    code = 1
    Name = 2
    txn_ts = 3
    effectivefrom = 4
    effectiveTill = 5
    ID = 6
End Enum

'Implementation of 'getReturnValues()' method of the clsCalledFormInterface. This method
'returns the displayText and the idText to the calling form throught the setReturnedValues()
'method of the clsCallingFormInterface of the. The arguments passed are by reference.
Public Sub clsCalledFormInterface_getReturnValues(p_strDisplayText As String, _
                                                  p_strIDText As String, _
                                                    p_colAdditionalValues As Collection)
                                                  
    p_strDisplayText = Me.txtDepartmentGroupName.Text
    
    Select Case intMode
        Case uiManager.NEW_MODE
            p_strIDText = intDeptGroupID
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
            sprListDepartmentGroupsController.retrieveRecords Me.clsQueryInterface_getSQLStringForRetrieval
            clsQueryInterface_populateFieldsFromRetrievalSpread (1)
    End Select
Exit Sub
            
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsCalledFormInterface_showCalledForm", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'private function returning true when the field - department group code is valid, otherwise false
Private Function validateDeptGroupCode() As Boolean
    
    validateDeptGroupCode = True
    
    'check for mandatory field
    If (intMode <> uiManager.QUERY_MODE And Trim(Me.txtDepartmentGroupCode.Text) = "") Then
        Me.txtDepartmentGroupCode.SetFocus
        logger.logMessage modStandardMessages.ValueReqd, "Department Group Code", WARNING_MESSAGE, clsWindowInterface_getScreenID, clsWindowInterface_getMode
        validateDeptGroupCode = False
    End If
    
End Function

'private function returning true when the field - department group name is valid, otherwise false
Private Function validateDeptGroupName() As Boolean

    validateDeptGroupName = True

    'check for mandatory field
    If intMode <> uiManager.QUERY_MODE And Trim(Me.txtDepartmentGroupName.Text) = "" Then
        Me.txtDepartmentGroupName.SetFocus
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

'This is a private function to this code module that checks if the form is ready for saving. No invalid data
'should enter into database. Thus before saving record, certain checks are carried out in this function. If all
'the checks are cleared then the function returns boolean value 'True' otherwise returns boolean value 'False'
'and a descriptive error or warning message is generated.
Public Function clsEditInterface_isReadyToSave() As Boolean
    clsEditInterface_isReadyToSave = True
    
    'validate event of the last focused control is called before save
    Me.ValidateControls
    
    If (Not validateDeptGroupCode) Then
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

'Implementation of the fireSave() method of the clsEditInterface. Here the form is saved by creating parameters
'that are passed to the dbManager's ExecuteBatch() method. The form can be saved when it is in either insert or
'new or browse or update mode. But before saving the form, the private boolean function isReadyToSave() is called
'to check if the form is ready for saving.
Public Sub clsEditInterface_fireSave()

On Error GoTo errortag
    
    Dim strSQL As String
    strSQL = "CDB..insUpdDeptGroups '" & Trim(UCase(Me.txtDepartmentGroupCode.Text)) & "','" & _
                                         Replace(Trim(Me.txtDepartmentGroupName.Text), "'", "''") & "','" & _
                                         Trim(Me.txtEffectiveFrom.Text) & "','" & _
                                         Trim(Me.txtEffectiveTill.Text) & "'," & _
                                         IIf(Me.txtID.Text = "", "NULL", Trim(Me.txtID.Text)) & "," & _
                                         IIf(varTxnTs = "", "NULL", varTxnTs)
    dbManager.beginTrans
    
    Select Case intMode
    
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
                
            strSQL = strSQL & ",0"      '0 - INSERT
            Dim rsDeptGroups As clsRecordHashMap
            Set rsDeptGroups = dbManager.executeSQLGetRS(strSQL)
            intDeptGroupID = rsDeptGroups.getFieldValueByFieldIndex(0, 0)
            dbManager.commitTrans
            
            If intMode = uiManager.INSERT_MODE Then
                logger.logMessage modStandardMessages.ObjectSaveMsg, _
                                  "Department Group - '" & Trim(Me.txtDepartmentGroupName.Text) & _
                                  "'|" & intDeptGroupID, _
                                  PLAIN_MESSAGE, _
                                  Me.clsWindowInterface_getScreenID, _
                                  Me.clsWindowInterface_getMode
            
                'in case of insert mode, the screen has to get cleared of any data and get ready to insert more data
                Me.clsWindowInterface_showForm uiManager.INSERT_MODE
                Me.txtDepartmentGroupCode.SetFocus
            End If
            
        Case uiManager.BROWSE_MODE, uiManager.UPDATE_MODE
            
            strSQL = strSQL & ",1"      '1 - UPDATE
            dbManager.executeSQL strSQL
            dbManager.commitTrans
                
            If intMode = uiManager.BROWSE_MODE Then
                sprListDepartmentGroupsController.updateRow Me.clsQueryInterface_getSQLStringForRetrieval, _
                                                            Me.sprListDepartmentGroups.ActiveRow
                Me.clsQueryInterface_populateFieldsFromRetrievalSpread Me.sprListDepartmentGroups.ActiveRow
                varTxnTs = sprListDepartmentGroupsController.getTextOfCell(Me.sprListDepartmentGroups.ActiveRow, deptGroupColumns.txn_ts)
                logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
            End If
            
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
    dbManager.beginTrans
    dbManager.executeSQL "CDB..delDeptGroups " & Trim(Me.txtID.Text) & "," & varTxnTs
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
'the retrieval is done in the sprListDepartmentGroupsController, so that is returned to the caller.
Public Function clsQueryInterface_getSpreadControllerForRetrieval() As ADL.clsSpreadController

    Set clsQueryInterface_getSpreadControllerForRetrieval = sprListDepartmentGroupsController
    
End Function

'Implementation of the getSQLStringForRetrieval() function of the clsQueryInterface. This function
'returns the sql string which should be used by ADL to retrieve records in Retrieve mode.
'The query is build based upon the user entries in the different fields of the form.
Public Function clsQueryInterface_getSQLStringForRetrieval() As String

    Dim qryDeptGroups As String
    
    qryDeptGroups = "SELECT g.department_group_cd, g.department_group_nm, Cast(g.txn_ts As BigInt), " & _
                    "Convert(varchar, g.effective_from, 106)effective_from, " & _
                    "Convert(varchar, g.effective_till, 106)effective_till, g.department_group_id " & _
                    "FROM department_groups g "
    
    If Trim(Me.txtDepartmentGroupCode.Text) <> "" Then
        qryDeptGroups = qryDeptGroups & "WHERE g.department_group_cd LIKE '%" & Trim(Me.txtDepartmentGroupCode.Text) & "%' AND "
    Else
        qryDeptGroups = qryDeptGroups & "WHERE g.department_group_cd LIKE '%%' AND "
    End If

    If Trim(Me.txtDepartmentGroupName.Text) <> "" Then
        qryDeptGroups = qryDeptGroups & "g.department_group_nm LIKE '%" & Replace(Trim(Me.txtDepartmentGroupName.Text), "'", "''") & "%' AND "
    End If

    If Trim(Me.txtEffectiveFrom.Text) <> "" Then
        qryDeptGroups = qryDeptGroups & "g.effective_from = '" & Trim(Me.txtEffectiveFrom.Text) & "' AND "
    End If

    If Trim(Me.txtEffectiveTill.Text) <> "" Then
        qryDeptGroups = qryDeptGroups & "g.effective_till = '" & Trim(Me.txtEffectiveTill.Text) & "' AND "
    End If

    If Trim(Me.txtID.Text) <> "" Then
        qryDeptGroups = qryDeptGroups & "g.department_group_id = " & Trim(Me.txtID.Text) & " AND "
    End If
    
    qryDeptGroups = Left(Trim(qryDeptGroups), Len(Trim(qryDeptGroups)) - 3)
    qryDeptGroups = qryDeptGroups & " ORDER BY department_group_id"
                                                        
    clsQueryInterface_getSQLStringForRetrieval = qryDeptGroups
    
End Function

'Implementation of the populateFieldsFromRetrievalSpread() method of the clsQueryInterface
'All the fields are populated from the spread where the records are retrieved. Parameter p_lonrow
'states the row of the spread whose values are to be set in respective fields.
Public Sub clsQueryInterface_populateFieldsFromRetrievalSpread(p_lonRow As Long)

    Me.txtDepartmentGroupCode.Text = CStr(Trim(sprListDepartmentGroupsController.getTextOfCell(p_lonRow, deptGroupColumns.code)))
    Me.txtDepartmentGroupName.Text = CStr(sprListDepartmentGroupsController.getTextOfCell(p_lonRow, deptGroupColumns.Name))
    varTxnTs = sprListDepartmentGroupsController.getTextOfCell(p_lonRow, deptGroupColumns.txn_ts)
    Me.txtEffectiveFrom.Text = Format(CDate(sprListDepartmentGroupsController.getTextOfCell(p_lonRow, deptGroupColumns.effectivefrom)), "dd-mmm-yyyy")
    Me.txtEffectiveTill.Text = Format(CDate(sprListDepartmentGroupsController.getTextOfCell(p_lonRow, deptGroupColumns.effectiveTill)), "dd-mmm-yyyy")
    Me.txtID.Text = sprListDepartmentGroupsController.getTextOfCell(p_lonRow, deptGroupColumns.ID)
    
    Dim strSQL As String
    strSQL = "SELECT department_cd , department_nm, department_id " & _
             "FROM departments " & _
             "WHERE department_group_id = " & Me.txtID.Text
             
    sprDepartmentGroupsController.retrieveRecords strSQL

End Sub

Public Sub clsWindowInterface_fireClose()

End Sub

'Implementation of the fireErase() method of the clsWindowInterface. All the Controls and spreads of the form are
'cleared of any data. clearSpread() method of the spreadController is called for clearing the spreads.
Public Sub clsWindowInterface_fireErase()

    utils.clearControls Me.txtDepartmentGroupCode, Me.txtDepartmentGroupName, Me.txtID
    
    'dates are cleared in query mode only, otherwise their default values are set
    Select Case intMode
        Case uiManager.QUERY_MODE
            Me.txtEffectiveFrom.Text = ""
            Me.txtEffectiveTill.Text = ""
        Case uiManager.INSERT_MODE, uiManager.NEW_MODE
            Me.txtEffectiveFrom.Text = Format(Date, "dd-mmm-yyyy")
            Me.txtEffectiveTill.Text = "31-Dec-9999"
    End Select
    
    If Not Me.sprDepartmentGroups Is Nothing Then
        sprDepartmentGroupsController.clearSpread
    End If
    If Not Me.sprListDepartmentGroups Is Nothing Then
        sprListDepartmentGroupsController.clearSpread
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
    clsWindowInterface_getScreenID = "DPT_02"
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

    'initializing and adding columns to sprListCountriesController of departments
    
    Set sprDepartmentGroupsController = New clsSpreadController
    sprDepartmentGroupsController.registerSpreadInstance uiManager, Me.sprDepartmentGroups, LIST_SPREAD, Me
    sprDepartmentGroupsController.setHeaderHeight 600
    
    sprDepartmentGroupsController.addColumn "Dept. Code", 15, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN
    sprDepartmentGroupsController.addColumn "Department Name", 75, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN
    sprDepartmentGroupsController.addColumn "Dept. ID", 10, STATIC_TEXT_CELL_TYPE, False, MANDATORY_COLUMN, , , , , RIGHT_ALIGNMENT
                                            
    'initializing and adding columns to sprListCountriesController of department groups
        
    Set sprListDepartmentGroupsController = New clsSpreadController
    sprListDepartmentGroupsController.registerSpreadInstance uiManager, Me.sprListDepartmentGroups, LIST_SPREAD, Me
    sprListDepartmentGroupsController.setHeaderHeight 600
   
    sprListDepartmentGroupsController.addColumn "Dept. Group Code", 10, STATIC_TEXT_CELL_TYPE, False, True
    sprListDepartmentGroupsController.addColumn "Dept. Group Name", 58, STATIC_TEXT_CELL_TYPE, False, True
    sprListDepartmentGroupsController.addColumn "Txn Ts", 0, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    sprListDepartmentGroupsController.addColumn "Effective From", 12, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListDepartmentGroupsController.addColumn "Effective Till", 12, STATIC_TEXT_CELL_TYPE, False, True, , , , , CENTER_ALIGNMENT
    sprListDepartmentGroupsController.addColumn "Dept. Group ID", 8, STATIC_TEXT_CELL_TYPE, False, True, , , , , RIGHT_ALIGNMENT
    
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls()

    Select Case intMode
        
        Case uiManager.INSERT_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            sprDepartmentGroupsController.setSpreadMode intMode
            sprListDepartmentGroupsController.setSpreadMode intMode
            Me.sprDepartmentGroups.Visible = False
            Me.fraDepartmentGroups.ZOrder 0
            Me.txtDepartmentGroupCode.SetFocus
            
        Case uiManager.QUERY_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToNormal Me.txtID
            sprDepartmentGroupsController.setSpreadMode intMode, True
            sprListDepartmentGroupsController.setSpreadMode intMode
            Me.sprDepartmentGroups.Visible = False
            Me.fraDepartmentGroups.ZOrder 0
            Me.txtID.SetFocus
            
        Case uiManager.RETRIEVE_MODE
        
            sprDepartmentGroupsController.setSpreadMode intMode
            sprListDepartmentGroupsController.setSpreadMode intMode
            Me.sprDepartmentGroups.Visible = False
            Me.fraDepartmentGroups.ZOrder 0
            
        Case uiManager.LIST_MODE
        
            sprDepartmentGroupsController.setSpreadMode intMode
            sprListDepartmentGroupsController.setSpreadMode intMode
            Me.sprDepartmentGroups.Visible = False
            Me.fraListDepartmentGroups.ZOrder 0
            
        Case uiManager.BROWSE_MODE
            
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            sprDepartmentGroupsController.setSpreadMode intMode
            sprListDepartmentGroupsController.setSpreadMode intMode
            Me.sprDepartmentGroups.Visible = True
            Me.fraDepartmentGroups.ZOrder 0
            Me.txtDepartmentGroupCode.SetFocus
            
        Case uiManager.NEW_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            sprDepartmentGroupsController.setSpreadMode intMode
            sprListDepartmentGroupsController.setSpreadMode intMode
            Me.sprDepartmentGroups.Visible = False
            Me.fraDepartmentGroups.ZOrder 0
            Me.txtDepartmentGroupCode.SetFocus
            
        Case uiManager.REFERENCE_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtDepartmentGroupCode, Me.txtDepartmentGroupName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID
            sprDepartmentGroupsController.setSpreadMode intMode
            sprListDepartmentGroupsController.setSpreadMode intMode
            Me.sprDepartmentGroups.Visible = True
            Me.fraDepartmentGroups.ZOrder 0
            
        Case uiManager.UPDATE_MODE
        
            Me.clsWindowInterface_fireErase
            modControlsSettings.setStateToReadOnly Me.txtID
            sprDepartmentGroupsController.setSpreadMode intMode
            sprListDepartmentGroupsController.setSpreadMode intMode
            Me.sprDepartmentGroups.Visible = True
            Me.fraDepartmentGroups.ZOrder 0
            Me.txtDepartmentGroupCode.SetFocus
            
    End Select
    
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

Private Sub Form_Load()
    modControlsSettings.setStandardControlSpecifications Me.lblDepartmentGroupName, Me.lblDepartmentGroupsName, Me.lblEffectiveFrom, Me.lblEffectiveTill, Me.lblId, _
                                                         Me.txtDepartmentGroupCode, Me.txtDepartmentGroupName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID
    modControlsSettings.setStateToNormal Me.txtDepartmentGroupCode, Me.txtDepartmentGroupName, Me.txtEffectiveFrom, Me.txtEffectiveTill, Me.txtID
End Sub

'The method sets the status text of the main screen
Private Sub txtDepartmentGroupCode_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtDepartmentGroupCode_Validate(Cancel As Boolean)
    validateDeptGroupCode
End Sub

'The method sets the status text of the main screen
Private Sub txtDepartmentGroupName_GotFocus()
    uiManager.setStatusText ""
End Sub

Private Sub txtDepartmentGroupName_Validate(Cancel As Boolean)
    validateDeptGroupName
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
            uiManager.setStatusText "Please enter date greater than Effective From Date"
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
