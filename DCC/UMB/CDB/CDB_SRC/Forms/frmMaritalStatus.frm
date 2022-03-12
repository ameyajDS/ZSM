VERSION 5.00
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.OCX"
Begin VB.Form frmMaritalStatus 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Marital Status"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin VB.Frame fraMaritalStatus 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Height          =   7845
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   13035
      Begin FPSpread.vaSpread sprMaritalStatus 
         Height          =   5925
         Left            =   360
         TabIndex        =   1
         Top             =   360
         Width           =   11235
         _Version        =   393216
         _ExtentX        =   19817
         _ExtentY        =   10451
         _StockProps     =   64
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ShadowColor     =   12632256
         SpreadDesigner  =   "frmMaritalStatus.frx":0000
      End
   End
End
Attribute VB_Name = "frmMaritalStatus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Implements clsWindowInterface
Implements clsEditInterface

'This variable holds the value of the current mode of the form. This is set each time the form is opened in
'different mode with the 'showForm()' method of the 'clsWindowInterface'. And the value of this variable is
'returned, whenever requested through 'getMode()' method of the 'clsWindowInterface'
Dim intMode As Integer

'The declaration of spread controller for retrieving the records from the skills
'table. This spread controller is also used to show the records in list mode. This object variable
'is defined "withEvents" because this code module needs to catch the events thrown by this
'controller (like 'validateCell', 'validateRow' etc)
Dim WithEvents sprMaritalStatusController As clsSpreadController
Attribute sprMaritalStatusController.VB_VarHelpID = -1

'This enum holds all the column numbers of the spread controller 'sprMaritalStatusController' that
'shows all the records of occupations. The column numbers are stored into variables named corresponding
'to column names. These are called in functions of spreadController like 'getTextOfCell'
'or 'setTextOfCell' which requires row number and column number.
Private Enum maritalStatusColumns
    Name = 1
    txn_ts = 2
    effectivefrom = 3
    effectiveTill = 4
    ID = 5
End Enum

Private Sub clsEditInterface_fireInsertMode()

End Sub

Public Function clsEditInterface_isReadyToSave() As Boolean
    clsEditInterface_isReadyToSave = True
End Function
'Implementation of the fireSave() method of the clsEditInterface. Here the form is saved by adding procedures to
'dbmanager's addJobToBatch and finally calling dbManager's ExecuteBatch() method. The rows of the spread can be
'saved when it's row state is either New or Updated or Deleted state.
Public Sub clsEditInterface_fireSave()

On Error GoTo errortag

    If Not sprMaritalStatusController.prepareSpreadForSave Then
        Exit Sub
    End If
    
    Dim saveData As Boolean
    Dim strDeleteTemplate As String
    Dim strUpdateTemplate As String
    Dim strInsertTemplate As String
    
    saveData = False
    strDeleteTemplate = "CDB..delMaritalStatus " & "@@, @@"
    strUpdateTemplate = "CDB..updMaritalStatus " & "@@, @@, @@, @@, @@"
    strInsertTemplate = "CDB..insMaritalStatus " & "@@, @@, @@"
    
    dbManager.beginTrans
    Dim i As Long
    Dim sqlStrings() As String
    If sprMaritalStatusController.getNumberOfRowsForState(DELETED_STATE) <> 0 Then
         
        sqlStrings = sprMaritalStatusController.getDeleteStrings(strDeleteTemplate, _
                                                                      "Yes", _
                                                                      "No ", _
                                                                      maritalStatusColumns.ID, _
                                                                      maritalStatusColumns.txn_ts)
        
        For i = 0 To UBound(sqlStrings)
            saveData = True
            dbManager.executeSQL sqlStrings(i)
        Next i
    End If
    If sprMaritalStatusController.getNumberOfRowsForState(UPDATED_STATE) <> 0 Then
         sqlStrings = sprMaritalStatusController.getUpdateStrings(strUpdateTemplate, _
                                                                      "Yes", _
                                                                      "No ", _
                                                                      maritalStatusColumns.ID, _
                                                                      maritalStatusColumns.Name, _
                                                                      maritalStatusColumns.effectivefrom, _
                                                                      maritalStatusColumns.effectiveTill, _
                                                                      maritalStatusColumns.txn_ts)
        
        For i = 0 To UBound(sqlStrings)
            saveData = True
            dbManager.executeSQL sqlStrings(i)
        Next i
    End If
    If sprMaritalStatusController.getNumberOfRowsForState(NEW_STATE) <> 0 Then
         sqlStrings = sprMaritalStatusController.getInsertStrings(strInsertTemplate, _
                                                                      "Yes", _
                                                                      "No ", _
                                                                      maritalStatusColumns.Name, _
                                                                      maritalStatusColumns.effectivefrom, _
                                                                      maritalStatusColumns.effectiveTill)
        
        For i = 0 To UBound(sqlStrings)
            saveData = True
            dbManager.executeSQL sqlStrings(i)
        Next i
    End If
        
    If saveData Then
        retrieveSewadarStatus
        dbManager.commitTrans
        logger.logMessage modStandardMessages.SaveMsg, "", PLAIN_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Else
        dbManager.commitTrans
    End If
    
Exit Sub
    
errortag:
    dbManager.rollBackTrans
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsEditInterface_fireSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

'retrieve the existing records of skills to the spread controller "sprMaritalStatusController"
Private Sub retrieveSewadarStatus()
On Error GoTo errortag
    Dim strSQL As String
    strSQL = "SELECT maritalstatus_nm, Cast(txn_ts As BigInt), Convert(varchar, effective_from, 106)effective_from, " & _
             "Convert(varchar,effective_till,106)effective_till, maritalstatus_id " & _
             "From CDB..marital_status"
    sprMaritalStatusController.retrieveRecords strSQL
Exit Sub
    
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "clsEditInterface_fireSave", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub
Public Sub clsWindowInterface_fireClose()

End Sub

Public Sub clsWindowInterface_fireErase()

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
    clsWindowInterface_getScreenID = "PER_08"
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
    setEnableDisableControls intMode
    
    retrieveSewadarStatus
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

'This is a private method to this code module. Here spread controllers are initialized and columns are
'added to them for all the respective spreads in this form.
Private Sub setSpreadController()

    'initializing and adding columns to sprMaritalStatusController of skills
    Set sprMaritalStatusController = New clsSpreadController
    sprMaritalStatusController.registerSpreadInstance uiManager, sprMaritalStatus, TABULAR_SPREAD, Me
    sprMaritalStatusController.setHeaderHeight 500
    
    sprMaritalStatusController.addColumn "Marital Status", 60, edit_CELL_TYPE, True, True, , , , 20
    sprMaritalStatusController.addColumn "Txn Ts", 0, STATIC_TEXT_CELL_TYPE, NON_EDITABLE_COLUMN, NON_MANDATORY_COLUMN
    sprMaritalStatusController.addColumn "Effective From", 15, DATE_CELL_TYPE, True, True, , , , , CENTER_ALIGNMENT
    sprMaritalStatusController.addColumn "Effective Till", 15, DATE_CELL_TYPE, True, True, , , , , CENTER_ALIGNMENT
    sprMaritalStatusController.addColumn "ID", 9, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
                                   
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls(p_intMode As Integer)
    Select Case p_intMode
        Case uiManager.TABULAR_MODE
            sprMaritalStatusController.setSpreadModeForTabularSpread p_intMode
        Case uiManager.NEW_MODE
            sprMaritalStatusController.setSpreadModeForTabularSpread p_intMode
    End Select
End Sub

Private Sub sprMaritalStatusController_setDefaultValues(ByVal p_lonRow As Long)
    sprMaritalStatusController.setTextOfCell p_lonRow, maritalStatusColumns.effectivefrom, Format(Date, "dd mmm yyyy")
    sprMaritalStatusController.setTextOfCell p_lonRow, maritalStatusColumns.effectiveTill, "31 Dec 9999"
End Sub

'This is a private method to this module. ValidateCell is the event (of the spread controller) raised when the
'user clicks on any cell of the spread. Here validation checks are carried out for any particular cell value.
Private Sub sprMaritalStatusController_ValidateCell(ByVal p_lonRow As Long, _
                                             ByVal p_lonColumn As Long, _
                                             p_bolIsCellValid As Boolean)
On Error GoTo errortag
                                             
    Dim varEffectiveFrom As Variant
    Dim varEffectivetill As Variant
    
    varEffectiveFrom = sprMaritalStatusController.getTextOfCell(p_lonRow, maritalStatusColumns.effectivefrom)
    varEffectivetill = sprMaritalStatusController.getTextOfCell(p_lonRow, maritalStatusColumns.effectiveTill)
    
    Select Case p_lonColumn
        Case maritalStatusColumns.effectiveTill
            'validating Effective Till date that the text entered is in date format only
            If (varEffectiveFrom <> "" And varEffectivetill <> "") Then
                'comparing Effective From and Effective Till dates
                If DateDiff("d", varEffectiveFrom, varEffectivetill) < 0 Then
                    logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Effective Till|Effective From", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
                    p_bolIsCellValid = False
                End If
            End If
            
            If varEffectivetill <> "" Then
                If DateDiff("d", varEffectivetill, Date) < 0 Then
                    logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Effective Till|" & Format(Date, "dd mmm yyyy"), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
                End If
            End If
            
        Case maritalStatusColumns.effectivefrom
            If varEffectiveFrom <> "" Then
                If DateDiff("d", varEffectiveFrom, Date) < 0 Then
                    logger.logMessage modStandardMessages.LesserOrEqualValueReqd, "Effective From|" & Format(Date, "dd mmm yyyy"), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
                End If
            End If
            
        Case maritalStatusColumns.Name
            If Trim(sprMaritalStatusController.getTextOfCell(p_lonRow, p_lonColumn)) = "" Then
                sprMaritalStatusController.setTextOfCell p_lonRow, p_lonColumn, ""
            End If
            
    End Select
    
Exit Sub
    
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprMaritalStatusController_ValidateCell", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub


Private Sub sprMaritalStatusController_ValidateRow(ByVal p_lonRow As Long, p_bolIsRowValid As Boolean)
    Dim varEffectiveFrom As Variant
    Dim varEffectivetill As Variant
    
    varEffectiveFrom = sprMaritalStatusController.getTextOfCell(p_lonRow, maritalStatusColumns.effectivefrom)
    varEffectivetill = sprMaritalStatusController.getTextOfCell(p_lonRow, maritalStatusColumns.effectiveTill)
    
    'comparing Effective From and Effective Till dates
    If DateDiff("d", varEffectiveFrom, varEffectivetill) < 0 Then
        logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Effective Till|Effective From", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        p_bolIsRowValid = False
    End If
    
    If sprMaritalStatusController.isCellValueRepeatedInColumn(utils.createLongArray(maritalStatusColumns.Name), p_lonRow, True) Then
        logger.logMessage modStandardMessages.ValueRepeated, "Skill Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        p_bolIsRowValid = False
    End If
    
End Sub




