VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{C1A8AF28-1257-101B-8FB0-0020AF039CA3}#1.1#0"; "MCI32.OCX"
Begin VB.MDIForm frmMDIMain 
   BackColor       =   &H00C0C0C0&
   Caption         =   "CENTRAL DATABASE"
   ClientHeight    =   4575
   ClientLeft      =   1410
   ClientTop       =   975
   ClientWidth     =   8610
   LinkTopic       =   "MDIForm1"
   Picture         =   "frmMDIMain.frx":0000
   WindowState     =   2  'Maximized
   Begin MSComctlLib.ImageList ImageList2 
      Left            =   180
      Top             =   9765
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   23
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":10492
            Key             =   "Save"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":105A4
            Key             =   "Insert"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":106B6
            Key             =   "Delete"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":107C8
            Key             =   "Query"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":108DA
            Key             =   "Erase"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":109EC
            Key             =   "First"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":10AFE
            Key             =   "Next"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":10C10
            Key             =   "Previous"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":10D22
            Key             =   "Last"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":10E34
            Key             =   "Preview"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":11376
            Key             =   "Print"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":11488
            Key             =   "Cancel"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":1159A
            Key             =   "Close"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":116AC
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":11AFE
            Key             =   "Exit"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":11C10
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":12062
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":125A4
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":12AE6
            Key             =   "Retrieve"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":12BF8
            Key             =   "Tabular"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":12D0A
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":13384
            Key             =   "printPreview"
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":139FE
            Key             =   "print"
         EndProperty
      EndProperty
   End
   Begin VB.Timer tmrBlinkErrorMessage 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   1530
      Top             =   9675
   End
   Begin VB.Timer tmrResetErrorMessage 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   945
      Top             =   9675
   End
   Begin VB.PictureBox Picture1 
      Align           =   1  'Align Top
      BorderStyle     =   0  'None
      Height          =   240
      Left            =   0
      ScaleHeight     =   240
      ScaleWidth      =   21480
      TabIndex        =   1
      Top             =   570
      Width           =   21480
      Begin VB.Label lblMessage 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Left            =   0
         TabIndex        =   2
         Top             =   0
         Width           =   11880
      End
   End
   Begin MSComctlLib.StatusBar statusBar 
      Align           =   2  'Align Bottom
      Height          =   300
      Left            =   0
      TabIndex        =   0
      Top             =   12390
      Width           =   21480
      _ExtentX        =   37888
      _ExtentY        =   529
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Object.Width           =   8819
            MinWidth        =   8819
            Key             =   "status"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Object.Width           =   5292
            MinWidth        =   5292
            Key             =   "windowMode"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Object.Width           =   1764
            MinWidth        =   1764
            Key             =   "screenID"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Object.Width           =   5292
            MinWidth        =   5292
            Key             =   "userID_Role"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Object.Width           =   5292
            MinWidth        =   5292
            Key             =   "date_Time"
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.Toolbar tlb1 
      Align           =   1  'Align Top
      Height          =   570
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   21480
      _ExtentX        =   37888
      _ExtentY        =   1005
      ButtonWidth     =   1191
      ButtonHeight    =   953
      Appearance      =   1
      Style           =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   19
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Save"
            Key             =   "Save"
            Object.ToolTipText     =   "Save this Instance"
            ImageKey        =   "Save"
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   1
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "Save"
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Insert"
            Key             =   "Insert"
            Object.ToolTipText     =   "Switch to Insert Mode"
            ImageKey        =   "Insert"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Query"
            Key             =   "Query"
            Object.ToolTipText     =   "Switch to Query Mode"
            ImageKey        =   "Query"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Get"
            Key             =   "Retrieve"
            Object.ToolTipText     =   "Retrieve Instances"
            ImageKey        =   "Retrieve"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Cancel"
            Key             =   "Cancel"
            Object.ToolTipText     =   "Cancel Retrieve"
            ImageKey        =   "Cancel"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "First"
            Key             =   "First"
            Object.ToolTipText     =   "Move to First Instance"
            ImageKey        =   "First"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Back"
            Key             =   "Previous"
            Object.ToolTipText     =   "Move to Previous Instance"
            ImageKey        =   "Previous"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Next"
            Key             =   "Next"
            Object.ToolTipText     =   "Move to Next Instance"
            ImageKey        =   "Next"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Last"
            Key             =   "Last"
            Object.ToolTipText     =   "Move to Last Instance"
            ImageKey        =   "Last"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "  List  "
            Key             =   "List"
            Object.ToolTipText     =   "Toggle Between Browse and Tabular Mode"
            ImageKey        =   "Tabular"
            Style           =   1
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Delete"
            Key             =   "Delete"
            Object.ToolTipText     =   "Delete this Instance"
            ImageKey        =   "Delete"
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Print"
            Key             =   "print"
            Object.ToolTipText     =   "Generate and print this report"
            ImageKey        =   "print"
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Preview"
            Key             =   "printPreview"
            Object.ToolTipText     =   "Preview a report"
            ImageKey        =   "printPreview"
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Clear"
            Key             =   "Erase"
            Object.ToolTipText     =   "Erase the Contents of Screen"
            ImageKey        =   "Erase"
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Close"
            Key             =   "Close"
            Object.ToolTipText     =   "Close this Screen"
            ImageKey        =   "Close"
         EndProperty
         BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Excel"
            Key             =   "ExportToExcel"
            Object.ToolTipText     =   "Export Grid Data to Excel"
            ImageKey        =   "exporttoexcel"
         EndProperty
         BeginProperty Button19 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Exit"
            Key             =   "Exit"
            Object.ToolTipText     =   "Exit from the Application"
            ImageKey        =   "Exit"
         EndProperty
      EndProperty
      Begin MCI.MMControl objMMControl 
         Height          =   330
         Left            =   11040
         TabIndex        =   4
         Top             =   90
         Visible         =   0   'False
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         _Version        =   393216
         PrevVisible     =   0   'False
         NextVisible     =   0   'False
         PlayVisible     =   0   'False
         PauseVisible    =   0   'False
         BackVisible     =   0   'False
         StepVisible     =   0   'False
         StopVisible     =   0   'False
         RecordVisible   =   0   'False
         EjectVisible    =   0   'False
         DeviceType      =   ""
         FileName        =   ""
      End
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   0
      Top             =   7920
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   24
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":14078
            Key             =   "Save"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":1418A
            Key             =   "Insert"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":1429C
            Key             =   "Delete"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":143AE
            Key             =   "Query"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":144C0
            Key             =   "Erase"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":145D2
            Key             =   "First"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":146E4
            Key             =   "Next"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":147F6
            Key             =   "Previous"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":14908
            Key             =   "Last"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":14A1A
            Key             =   "Preview"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":14F5C
            Key             =   "Print"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":1506E
            Key             =   "Cancel"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":15180
            Key             =   "Close"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":15292
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":156E4
            Key             =   "Exit"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":157F6
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":15C48
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":1618A
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":166CC
            Key             =   "Retrieve"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":167DE
            Key             =   "Tabular"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":168F0
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":16F6A
            Key             =   "printPreview"
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":175E4
            Key             =   "print"
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMDIMain.frx":17C5E
            Key             =   "exporttoexcel"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuOperations 
      Caption         =   "&Operations"
      Begin VB.Menu mnuOprSave 
         Caption         =   "&Save "
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuOprInsertMode 
         Caption         =   "&InsertMode"
         Shortcut        =   ^I
      End
      Begin VB.Menu mnuOprNew 
         Caption         =   "&New"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnuOprReference 
         Caption         =   "&Reference"
         Shortcut        =   ^R
      End
      Begin VB.Menu mnuOprQueryMode 
         Caption         =   "&Query Mode"
         Shortcut        =   ^Q
      End
      Begin VB.Menu mnuOprRetrieve 
         Caption         =   "&Get"
         Shortcut        =   ^G
      End
      Begin VB.Menu mnuOprCancel 
         Caption         =   "&Cancel"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnuOprFirst 
         Caption         =   "First"
      End
      Begin VB.Menu mnuOprBackward 
         Caption         =   "&Backward"
         Shortcut        =   ^B
      End
      Begin VB.Menu mnuOprForward 
         Caption         =   "&Forward"
         Shortcut        =   ^F
      End
      Begin VB.Menu mnuOprLast 
         Caption         =   "Last"
      End
      Begin VB.Menu mnuOprRemove 
         Caption         =   "&Delete"
         Shortcut        =   +{DEL}
      End
      Begin VB.Menu mnuOprListMode 
         Caption         =   "List"
         Shortcut        =   ^T
      End
      Begin VB.Menu mnuOprBrowseMode 
         Caption         =   "Browse Mode"
      End
      Begin VB.Menu mnuOprErase 
         Caption         =   "Eras&e (Clear)"
         Shortcut        =   ^E
      End
      Begin VB.Menu mnuOprClose 
         Caption         =   "Cl&ose"
         Shortcut        =   ^{F4}
      End
      Begin VB.Menu mnuOprPreview 
         Caption         =   "Preview"
      End
      Begin VB.Menu mnuOprPrint 
         Caption         =   "&Print"
         Shortcut        =   ^P
      End
      Begin VB.Menu mnuOprExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuLocations 
      Caption         =   "&Location"
      Begin VB.Menu mnuSatsangcentres 
         Caption         =   "&Satsang Centres"
      End
      Begin VB.Menu mnucountries 
         Caption         =   "&Countries"
      End
      Begin VB.Menu mnuStates 
         Caption         =   "&States"
      End
      Begin VB.Menu mnuDistrictsOrCities 
         Caption         =   "&Districts Or Cities"
      End
      Begin VB.Menu mnuPostoffices 
         Caption         =   "&Post Offices"
      End
      Begin VB.Menu mnuInitiationPlaces 
         Caption         =   "&Initiation Places"
      End
   End
   Begin VB.Menu mnuDepts 
      Caption         =   "&Departmental"
      Begin VB.Menu mnuDept 
         Caption         =   "&Departments"
      End
      Begin VB.Menu mnuDeptGroups 
         Caption         =   "&Department Groups"
      End
   End
   Begin VB.Menu mnuPersonal 
      Caption         =   "&Personal"
      Begin VB.Menu mnuRep 
         Caption         =   "&Representatives"
      End
      Begin VB.Menu mnuPersons 
         Caption         =   "&Persons"
      End
      Begin VB.Menu mnuSeperator 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDesignations 
         Caption         =   "&Designations"
      End
      Begin VB.Menu mnuOccupations 
         Caption         =   "&Occupations"
      End
      Begin VB.Menu mnuQualifications 
         Caption         =   "&Qualifications"
      End
      Begin VB.Menu mnuSkills 
         Caption         =   "&Skills"
      End
      Begin VB.Menu mnuSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuRelations 
         Caption         =   "&Relations"
      End
      Begin VB.Menu mnuMaritalStatus 
         Caption         =   "&Marital Status"
      End
      Begin VB.Menu mnuSep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSewadarStatus 
         Caption         =   "Se&wadar Status"
      End
      Begin VB.Menu mnuSewadarTypes 
         Caption         =   "Sewadar &Types"
      End
   End
   Begin VB.Menu mnuMisc 
      Caption         =   "&Miscellaneous"
      Begin VB.Menu mnuMeasuringUnits 
         Caption         =   "&Measuring Units"
      End
      Begin VB.Menu mnuPTLines 
         Caption         =   "&P and T Lines"
      End
      Begin VB.Menu mnuEPABXExtensions 
         Caption         =   "&EPABX Extensions"
      End
      Begin VB.Menu mnuLanguages 
         Caption         =   "&Languages"
      End
   End
   Begin VB.Menu mnuPeripherals 
      Caption         =   "&Peripherals"
      Begin VB.Menu mnuCameras 
         Caption         =   "&Cameras"
      End
      Begin VB.Menu mnuPrinters 
         Caption         =   "&Printers"
      End
      Begin VB.Menu mnuScanners 
         Caption         =   "&Scanners"
      End
   End
   Begin VB.Menu mnuExternalEntities 
      Caption         =   "&External Entities"
      Begin VB.Menu mnuRoles 
         Caption         =   "&Roles"
      End
      Begin VB.Menu mnuParties 
         Caption         =   "&Parties"
      End
   End
   Begin VB.Menu mnuWindow 
      Caption         =   "&Window"
      WindowList      =   -1  'True
      Begin VB.Menu mnuWinCascaded 
         Caption         =   "&Cascaded"
      End
      Begin VB.Menu mnuWinLayered 
         Caption         =   "&Layered"
      End
      Begin VB.Menu mnuSpacer1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWinHelp 
         Caption         =   "&Help"
         Shortcut        =   {F1}
      End
      Begin VB.Menu mnuWinAbout 
         Caption         =   "&About"
      End
   End
   Begin VB.Menu mnuPopupMenu 
      Caption         =   "Popup Menu"
      Visible         =   0   'False
      Begin VB.Menu mnuDeleteRow 
         Caption         =   "&DeleteRow"
      End
      Begin VB.Menu mnuInsertAbove 
         Caption         =   "Insert A&bove"
      End
      Begin VB.Menu mnuInsertBelow 
         Caption         =   "Insert B&elow"
      End
      Begin VB.Menu mnuFreeze 
         Caption         =   "Freeze"
      End
      Begin VB.Menu mnuUnFreeze 
         Caption         =   "UnFreeze"
      End
      Begin VB.Menu mnuExportToExcel 
         Caption         =   "Export to Excel"
      End
   End
End
Attribute VB_Name = "frmMDIMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub lblMessage_Click()
    logger.showStackTrace
End Sub

Private Sub MDIForm_QueryUnload(Cancel As Integer, UnloadMode As Integer)
     Dim bolCancel As Boolean
     bolCancel = False
     closeApplication bolCancel
     If bolCancel = True Then
        Cancel = 1
        Exit Sub
     End If
End Sub

Private Sub mnuCameras_Click()
    uiManager.openForm modMain.cameras, uiManager.INSERT_MODE
End Sub

Private Sub mnucountries_Click()
    uiManager.openForm modMain.countries, uiManager.INSERT_MODE
End Sub

Private Sub mnuDept_Click()
    uiManager.openForm modMain.depts, uiManager.INSERT_MODE
End Sub

Private Sub mnuDeptGroups_Click()
    uiManager.openForm modMain.deptGroups, uiManager.INSERT_MODE
End Sub

Private Sub mnuDesignations_Click()
    uiManager.openForm modMain.designations, uiManager.INSERT_MODE
End Sub

Private Sub mnuDistrictsOrCities_Click()
    uiManager.openForm modMain.districtsOrCities, uiManager.INSERT_MODE
End Sub

Private Sub mnuEPABXExtensions_Click()
    uiManager.openForm modMain.EPBAXLines, uiManager.INSERT_MODE
End Sub

Private Sub mnuInitiationPlaces_Click()
    uiManager.openForm modMain.initiationPlaces, uiManager.TABULAR_MODE
End Sub

Private Sub mnuLanguages_Click()
    uiManager.openForm modMain.languages, uiManager.TABULAR_MODE
End Sub

Private Sub mnuMaritalStatus_Click()
    uiManager.openForm modMain.maritalStatus, uiManager.TABULAR_MODE
End Sub

Private Sub mnuMeasuringUnits_Click()
    uiManager.openForm modMain.measuringUnits, uiManager.INSERT_MODE
End Sub

Private Sub mnuOccupations_Click()
    uiManager.openForm modMain.occupations, uiManager.TABULAR_MODE
End Sub

Private Sub mnuOprBackward_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsQueryInterface_fireBackward() of
    'currently highlighted child window
    uiManager.notifyBackward
    ']]
End Sub

Private Sub mnuOprBrowseMode_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsQueryInterface_fireBrowse() of
    'currently highlighted child window
    uiManager.notifyBrowse
    ']]
End Sub

Private Sub mnuOprCancel_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsQueryInterface_fireCancel() of
    'currently highlighted child window
    uiManager.notifyCancel
    ']]
End Sub

Private Sub mnuOprClose_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsWindowInterface_fireClose() of
    'currently highlighted child window
    uiManager.notifyClose
    ']]
End Sub

Private Sub mnuOprErase_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsWindowInterface_fireErase() of
    'currently highlighted child window
    uiManager.notifyErase
    ']]
End Sub

Private Sub mnuOprExit_Click()
    closeApplication False
    
End Sub

Private Sub mnuOprFirst_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsQueryInterface_fireFirst() of
    'currently highlighted child window
    uiManager.notifyFirst
    ']]
End Sub

Private Sub mnuOprForward_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsQueryInterface_fireForward() of
    'currently highlighted child window
    uiManager.notifyForward
    ']]
End Sub

Private Sub mnuOprInsertMode_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsEditInterface_fireInsert() of
    'currently highlighted child window
    uiManager.notifyInsertMode
    ']]
End Sub

Private Sub mnuOprLast_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsQueryInterface_fireLast() of
    'currently highlighted child window
    uiManager.notifyLast
    ']]
End Sub


Private Sub mnuOprNew_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsEditInterface_fireNew() of
    'currently highlighted child window
    uiManager.notifyNew
    ']]
End Sub




Private Sub mnuOprPreview_Click()
    uiManager.notifyPrintPreview
End Sub

Private Sub mnuOprPrint_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsPrintInterface_firePrint() of
    'currently highlighted child window
    uiManager.notifyPrint
    ']]
End Sub




Private Sub mnuOprQueryMode_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsQueryInterface_fireQueryMode() of
    'currently highlighted child window
    uiManager.notifyQuery
    ']]
End Sub

Private Sub mnuOprReference_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsEditInterface_fireReference() of
    'currently highlighted child window
    uiManager.notifyReference
    ']]
End Sub

Private Sub mnuOprRemove_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsQueryInterface_fireRemove() of
    'currently highlighted child window
    uiManager.notifyRemove
    ']]
End Sub

Private Sub mnuOprRetrieve_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsQueryInterface_fireRetrieve() of
    'currently highlighted child window
    uiManager.notifyRetrieve
    ']]
End Sub

Private Sub mnuOprSave_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsEditInterface_fireSave() of
    'currently highlighted child window
    uiManager.notifySave
    ']]
End Sub

Private Sub mnuOprSaveAs_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsEditInterface_fireSaveAs() of
    'currently highlighted child window
    'uiManager.notifySaveAs
    ']]
End Sub


Private Sub mnuOprListMode_Click()
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsQueryInterface_fireTabularMode() of
    'currently highlighted child window
    uiManager.notifyList
    ']]
End Sub

Private Sub mnuParties_Click()
    uiManager.openForm modMain.parties, uiManager.INSERT_MODE
End Sub

Private Sub mnuPersons_Click()
    uiManager.openForm modMain.persons, uiManager.INSERT_MODE
End Sub

Private Sub mnuPostoffices_Click()
    uiManager.openForm modMain.postOffices, uiManager.INSERT_MODE
End Sub

Private Sub mnuPTLines_Click()
    uiManager.openForm modMain.ptLines, uiManager.INSERT_MODE
End Sub

Private Sub mnuQualifications_Click()
    uiManager.openForm modMain.qualifications, uiManager.INSERT_MODE
End Sub

Private Sub mnuRelations_Click()
    uiManager.openForm modMain.relations, uiManager.TABULAR_MODE
End Sub

Private Sub mnuRep_Click()
    uiManager.openForm modMain.representatives, uiManager.INSERT_MODE
End Sub

Private Sub mnuRoles_Click()
    uiManager.openForm modMain.roles, uiManager.INSERT_MODE
End Sub

Private Sub mnuSatsangcentres_Click()
    uiManager.openForm modMain.satsangCenters, uiManager.INSERT_MODE
End Sub

Private Sub mnuSewadarStatus_Click()
    uiManager.openForm modMain.sewadarStatus, uiManager.TABULAR_MODE
End Sub

Private Sub mnuSewadarTypes_Click()
    uiManager.openForm modMain.sewadarTypes, uiManager.TABULAR_MODE
End Sub

Private Sub mnuSkills_Click()
    uiManager.openForm modMain.skills, uiManager.TABULAR_MODE
End Sub

Private Sub mnuStates_Click()
    uiManager.openForm modMain.states, uiManager.INSERT_MODE
End Sub

Private Sub mnuWinAbout_Click()
    uiManager.notifyAbout
End Sub

Private Sub mnuWinCascaded_Click()
    uiManager.notifyCascade
End Sub

Private Sub mnuWinHelp_Click()
     '[[Notify this event to the uiManager which in turn will
    'call the interface method clsWindowInterface_fireHelp() of
    'currently highlighted child window
    uiManager.notifyHelp
    ']]
End Sub

Private Sub mnuWinLayered_Click()
    uiManager.notifyLayered
    
End Sub

Private Sub tlb1_ButtonClick(ByVal Button As MSComctlLib.Button)
Select Case UCase(Button.Key)
        Case "SAVE"
            Call mnuOprSave_Click
        Case "INSERT"
            Call mnuOprInsertMode_Click
        Case "QUERY"
            Call mnuOprQueryMode_Click
        Case "RETRIEVE"
            Call mnuOprRetrieve_Click
        Case "Cancel"
            Call mnuOprCancel_Click
        Case "FIRST"
             Call mnuOprFirst_Click
        Case "PREVIOUS"
             Call mnuOprBackward_Click
        Case "NEXT"
             Call mnuOprForward_Click
        Case "LAST"
             Call mnuOprLast_Click
        Case "LIST"
            If Button.Value = tbrPressed Then
                Button.Caption = "Brws"
                Call mnuOprListMode_Click
            Else
                Button.Caption = "List"
                Call mnuOprBrowseMode_Click
            End If
        Case "DELETE"
            Call mnuOprRemove_Click
        Case "ERASE"
            Call mnuOprErase_Click
        Case "CLOSE"
            Call mnuOprClose_Click
        Case "EXIT"
            Call mnuOprExit_Click
        Case "EXPORTTOEXCEL"
            Call mnuOprExportToExcel 'This is not a menu item as of now
    End Select
End Sub
'add this private method in frmMDIMain
Private Sub mnuOprExportToExcel()
    uiManager.notifyExportToExcel
End Sub
Private Sub closeApplication(p_bolCancel As Boolean)
    '[[Notify this event to the uiManager which in turn will
    'call the interface method clsWindowInterface_fireExit() of
    'all the child windows. A boolean variable "cancel" will be passed
    'by reference, if the cancel returns as true then that means
    'one or the other child window does want to close. So no need of closing the
    'application
    Dim Cancel As Boolean
    Cancel = False
    uiManager.notifyExit Cancel
    If Cancel = True Then
        p_bolCancel = Cancel
        Exit Sub
    Else
        End
    End If
    ']]
End Sub


