VERSION 5.00
Object = "{FDAC2480-F4ED-4632-AA78-DCA210A74E49}#6.0#0"; "SPR32X60.OCX"
Begin VB.Form frmRelations 
   BackColor       =   &H00C0C0C0&
   Caption         =   "RELATIONS"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   ControlBox      =   0   'False
   ForeColor       =   &H00800000&
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   WindowState     =   2  'Maximized
   Begin FPSpread.vaSpread sprRelations 
      Height          =   6465
      Left            =   120
      TabIndex        =   0
      Tag             =   "Relations List Spread"
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
      SpreadDesigner  =   "frmRelations.frx":0000
   End
End
Attribute VB_Name = "frmRelations"
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

'The declaration of spread controller for retrieving the records from the states
'table. This spread controller is also used to show the records in list mode. This object variable
'is defined "withEvents" because this code module needs to catch the events thrown by this
'controller (like 'validateCell', 'validateRow' etc)
Dim WithEvents sprRelationsController As clsSpreadController
Attribute sprRelationsController.VB_VarHelpID = -1

'This enum holds all the column numbers of the spread controller 'sprRelationsController' that
'shows all the records of occupations. The column numbers are stored into variables named corresponding
'to column names. These are called in functions of spreadController like 'getTextOfCell'
'or 'setTextOfCell' which requires row number and column number.
Private Enum relationColumns
    Name = 1
    txn_ts = 2
    effectivefrom = 3
    effectiveTill = 4
    ID = 5
End Enum

Public Sub clsEditInterface_fireInsertMode()

End Sub

Public Function clsEditInterface_isReadyToSave() As Boolean
    clsEditInterface_isReadyToSave = True
End Function

'Implementation of the fireSave() method of the clsEditInterface. Here the form is saved by adding procedures to
'dbmanager's addJobToBatch and finally calling dbManager's ExecuteBatch() method. The rows of the spread can be
'saved when it's row state is either New or Updated or Deleted state.
Public Sub clsEditInterface_fireSave()
    
On Error GoTo errortag
    
    If Not sprRelationsController.prepareSpreadForSave Then
        Exit Sub
    End If
    
    Dim saveData As Boolean
    Dim strDeleteTemplate As String
    Dim strUpdateTemplate As String
    Dim strInsertTemplate As String
    
    saveData = False
    strDeleteTemplate = "CDB..delRelations " & "@@,@@"
    strUpdateTemplate = "CDB..insUpdRelations " & "@@,@@,@@,@@,@@,1"      '1 - UPDATE
    strInsertTemplate = "CDB..insUpdRelations " & "@@,@@,@@,NULL,NULL,0"  '0 - INSERT
    
    dbManager.beginTrans
    Dim i As Long
    If sprRelationsController.getNumberOfRowsForState(DELETED_STATE) <> 0 Then
        
         Dim deletedStrings() As String
        deletedStrings = sprRelationsController.getDeleteStrings(strDeleteTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            relationColumns.ID, _
                                                                            relationColumns.txn_ts)
        
        For i = 0 To UBound(deletedStrings)
            saveData = True
            dbManager.executeSQL deletedStrings(i)
        Next i
    End If
    If sprRelationsController.getNumberOfRowsForState(UPDATED_STATE) <> 0 Then
         Dim updateStrings() As String
        updateStrings = sprRelationsController.getUpdateStrings(strUpdateTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            relationColumns.Name, _
                                                                            relationColumns.effectivefrom, _
                                                                            relationColumns.effectiveTill, _
                                                                            relationColumns.ID, _
                                                                            relationColumns.txn_ts)
        
        For i = 0 To UBound(updateStrings)
            saveData = True
            dbManager.executeSQL updateStrings(i)
        Next i
    End If
    If sprRelationsController.getNumberOfRowsForState(NEW_STATE) <> 0 Then
         Dim insertStrings() As String
        insertStrings = sprRelationsController.getInsertStrings(strInsertTemplate, _
                                                                            "Yes", _
                                                                            "No ", _
                                                                            relationColumns.Name, _
                                                                            relationColumns.effectivefrom, _
                                                                            relationColumns.effectiveTill)
        
        For i = 0 To UBound(insertStrings)
            saveData = True
            dbManager.executeSQL insertStrings(i)
        Next i
    End If
    
    If saveData Then
        retrieveRelations
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

'retrieve the existing records of relations to the spread controller "sprRelationsController"
Private Sub retrieveRelations()
On Error GoTo errortag
    Dim strSQL As String
    strSQL = "SELECT relation_nm, Cast(txn_ts As BigInt), Convert(varchar, effective_from, 106)effective_from, " & _
             "Convert(varchar, effective_till, 106)effective_till, relation_id " & _
             "FROM relations"
    sprRelationsController.retrieveRecords strSQL
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
    clsWindowInterface_getScreenID = "PER_06"
End Function

Public Sub clsWindowInterface_setFieldInFocus(ByVal p_strControlNameIndicator As String)

End Sub

'Implemenation of the showForm() method of the clsWindowInterface. This method shows the form in the mode as
'stated by the parameter 'p_intMode'. This method calls a private method setSpreadController() to initialize the
'spreadController and method setEnableDisableControls() to enable/disable all the controls and spreads of the form
'according to the given mode. Typically this method is called when the form is opened by hitting menus or
Public Sub clsWindowInterface_showForm(p_intMode As Integer)

    intMode = p_intMode
    
    If Not mdiMain.ActiveForm Is Me Then
        setSpreadController
    End If
    
    Me.Visible = True
    Me.ZOrder 0
    setEnableDisableControls intMode
    
    retrieveRelations
    
End Sub

'The method notifies the UIManager of ADL that the form has been activated.
Private Sub Form_Activate()
    uiManager.notifyChildActivated intMode
End Sub

'This is a private method to this code module. Here spread controllers are initialized and columns are
'added to them for all the respective spreads in this form.
Private Sub setSpreadController()
    
    'initializing and adding columns to sprOccupationsController of occupations
    Set sprRelationsController = New clsSpreadController
    sprRelationsController.registerSpreadInstance uiManager, sprRelations, TABULAR_SPREAD, Me
    sprRelationsController.setHeaderHeight 500
    
    sprRelationsController.addColumn "Relation Name", 60, edit_CELL_TYPE, True, True, , , , 20
    sprRelationsController.addColumn "txn_ts", 0, STATIC_TEXT_CELL_TYPE, True, NON_MANDATORY_COLUMN
    sprRelationsController.addColumn "Effective From", 15, DATE_CELL_TYPE, True, True, , , , , CENTER_ALIGNMENT
    sprRelationsController.addColumn "Effective Till", 15, DATE_CELL_TYPE, True, True, , , , , CENTER_ALIGNMENT
    sprRelationsController.addColumn "Relation ID", 10, STATIC_TEXT_CELL_TYPE, False, False, , , , , RIGHT_ALIGNMENT
                                   
End Sub

'This is a private method to this code module. It enables/diables all the controls and spreads
'based upon the current mode of the form.
Private Sub setEnableDisableControls(p_intMode As Integer)
    Select Case p_intMode
        Case uiManager.TABULAR_MODE
            sprRelationsController.setSpreadModeForTabularSpread p_intMode
    End Select
End Sub

Private Sub sprRelationsController_setDefaultValues(ByVal p_lonRow As Long)
    sprRelationsController.setTextOfCell p_lonRow, relationColumns.effectivefrom, Format(Date, "dd mmm yyyy")
    sprRelationsController.setTextOfCell p_lonRow, relationColumns.effectiveTill, "31 Dec 9999"
End Sub

'This is a private method to this module. ValidateCell is the event (of the spread controller) raised when the
'user clicks on any cell of the spread. Here validation checks are carried out for any particular cell value.
Private Sub sprRelationsController_ValidateCell(ByVal p_lonRow As Long, ByVal p_lonColumn As Long, p_bolIsCellValid As Boolean)
    
On Error GoTo errortag
    
    Dim varEffectiveFrom As Variant
    Dim varEffectivetill As Variant
    
    varEffectiveFrom = Trim(sprRelationsController.getTextOfCell(p_lonRow, relationColumns.effectivefrom))
    varEffectivetill = Trim(sprRelationsController.getTextOfCell(p_lonRow, relationColumns.effectiveTill))
    
    Select Case p_lonColumn
        Case relationColumns.effectiveTill
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
            
        Case relationColumns.effectivefrom
            If varEffectiveFrom <> "" Then
                If DateDiff("d", varEffectiveFrom, Date) < 0 Then
                    logger.logMessage modStandardMessages.LesserOrEqualValueReqd, "Effective From|" & Format(Date, "dd mmm yyyy"), WARNING_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
                End If
            End If
            
        Case relationColumns.Name
            If Trim(sprRelationsController.getTextOfCell(p_lonRow, p_lonColumn)) = "" Then
                sprRelationsController.setTextOfCell p_lonRow, p_lonColumn, ""
            End If

    End Select
    
Exit Sub
errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "sprRelationsController_ValidateCell", "", ERROR_TYPE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
    Err.Raise Err.Number
End Sub

Private Sub sprRelationsController_ValidateRow(ByVal p_lonRow As Long, p_bolIsRowValid As Boolean)
    Dim varEffectiveFrom As Variant
    Dim varEffectivetill As Variant
    
    varEffectiveFrom = sprRelationsController.getTextOfCell(p_lonRow, relationColumns.effectivefrom)
    varEffectivetill = sprRelationsController.getTextOfCell(p_lonRow, relationColumns.effectiveTill)
    
    'comparing Effective From and Effective Till dates
    If DateDiff("d", varEffectiveFrom, varEffectivetill) < 0 Then
        logger.logMessage modStandardMessages.GreaterOrEqualValueReqd, "Effective Till|Effective From", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        p_bolIsRowValid = False
    End If
    
    If sprRelationsController.isCellValueRepeatedInColumn(utils.createLongArray(relationColumns.Name), p_lonRow, True) Then
        logger.logMessage modStandardMessages.ValueRepeated, "Relation Name", ERROR_MESSAGE, Me.clsWindowInterface_getScreenID, Me.clsWindowInterface_getMode
        p_bolIsRowValid = False
    End If
End Sub
