Attribute VB_Name = "modControlsSettings"
Private Const BLUE = &H800000      '&HFF0000
Private Const BLACK = &H80000008
Private Const WHITE = &H80000009
Private Const MAROON = &H80&
Private Const MEDIUM_GRAY = &HC0C0C0

Public Sub setStateToNormal(ParamArray arrControls())
    
    Dim i As Long
    For i = 0 To UBound(arrControls)
        If TypeOf arrControls(i) Is EditLib.fpText Then
            Dim textControl As fpText
            Set textControl = arrControls(i)
            
            textControl.ForeColor = BLACK
            textControl.ControlType = ControlTypeNormal
            textControl.BorderColor = BLACK
        
        ElseIf TypeOf arrControls(i) Is EditLib.fpDateTime Then
            Dim dateTimeControl As fpDateTime
            Set dateTimeControl = arrControls(i)
            
            dateTimeControl.ForeColor = BLACK
            dateTimeControl.ControlType = ControlTypeNormal
            dateTimeControl.BorderColor = BLACK
            dateTimeControl.PopUpType = PopCalendar
            dateTimeControl.ButtonStyle = ButtonStyleDropDown
            
        ElseIf TypeOf arrControls(i) Is EditLib.fpLongInteger Then
            Dim longIntegerControl As fpLongInteger
            Set longIntegerControl = arrControls(i)
            
            longIntegerControl.ForeColor = BLACK
            longIntegerControl.ControlType = ControlTypeNormal
            longIntegerControl.BorderColor = BLACK
            
        ElseIf TypeOf arrControls(i) Is MemoLib.fpMemo Then
            Dim memoControl As fpMemo
            Set memoControl = arrControls(i)
            
            memoControl.ForeColor = BLACK
            memoControl.ControlType = ControlTypeNormal
            memoControl.BorderColor = BLACK
            
        ElseIf TypeOf arrControls(i) Is EditLib.fpDoubleSingle Then
            Dim doubleSingleControl As fpDoubleSingle
            Set doubleSingleControl = arrControls(i)
            
            doubleSingleControl.ForeColor = BLACK
            doubleSingleControl.ControlType = ControlTypeNormal
            doubleSingleControl.BorderColor = BLACK
          
         ElseIf TypeOf arrControls(i) Is EditLib.fpBoolean Then
            Dim booleanControl As fpBoolean
            Set booleanControl = arrControls(i)
            
            booleanControl.ForeColor = BLACK
            
        ElseIf TypeOf arrControls(i) Is VB.ComboBox Then
            Dim comboControl As VB.ComboBox
            Set comboControl = arrControls(i)
            
            comboControl.ForeColor = BLACK
            'comboControl.ControlType = ControlTypeNormal
            
        End If
    Next i
End Sub

Public Sub setStateToReadOnly(ParamArray arrControls())
    
    Dim i As Long
    For i = 0 To UBound(arrControls)
        If TypeOf arrControls(i) Is EditLib.fpText Then
            Dim textControl As fpText
            Set textControl = arrControls(i)
            
            textControl.ForeColor = MAROON
            textControl.ControlType = ControlTypeReadOnly
            textControl.BorderColor = MAROON
        
        ElseIf TypeOf arrControls(i) Is EditLib.fpDateTime Then
            Dim dateTimeControl As fpDateTime
            Set dateTimeControl = arrControls(i)
            
            dateTimeControl.ForeColor = MAROON
            dateTimeControl.ControlType = ControlTypeReadOnly
            dateTimeControl.BorderColor = MAROON
            dateTimeControl.PopUpType = PopDefault
            dateTimeControl.ButtonStyle = ButtonStyleNone
            
        ElseIf TypeOf arrControls(i) Is EditLib.fpLongInteger Then
            Dim longIntegerControl As fpLongInteger
            Set longIntegerControl = arrControls(i)
            
            longIntegerControl.ForeColor = MAROON
            longIntegerControl.ControlType = ControlTypeReadOnly
            longIntegerControl.BorderColor = MAROON
            
'        ElseIf TypeOf arrControls(i) Is MemoLib.fpMemo Then
'            Dim memoControl As fpMemo
'            Set memoControl = arrControls(i)
'
'            memoControl.ForeColor = MAROON
'            memoControl.ControlType = ControlTypeReadOnly
'            memoControl.BorderColor = MAROON
            
        ElseIf TypeOf arrControls(i) Is EditLib.fpDoubleSingle Then
            Dim doubleSingleControl As fpDoubleSingle
            Set doubleSingleControl = arrControls(i)
            
            doubleSingleControl.ForeColor = MAROON
            doubleSingleControl.ControlType = ControlTypeReadOnly
            doubleSingleControl.BorderColor = MAROON
          
        ElseIf TypeOf arrControls(i) Is EditLib.fpBoolean Then
            Dim booleanControl As fpBoolean
            Set booleanControl = arrControls(i)
            
            booleanControl.ForeColor = MAROON
            
        ElseIf TypeOf arrControls(i) Is VB.ComboBox Then
            Dim comboControl As VB.ComboBox
            Set comboControl = arrControls(i)
            
            comboControl.ForeColor = MAROON
            'comboControl.ControlType = ControlTypeReadOnly
            
        End If
    Next i
End Sub

Public Sub setStandardControlSpecifications(ParamArray arrControls())
    Dim i As Long
    For i = 0 To UBound(arrControls)
        If TypeOf arrControls(i) Is EditLib.fpText Then
            Dim textControl As fpText
            Set textControl = arrControls(i)
            
            textControl.Height = 340
            textControl.BorderGrayAreaColor = MEDIUM_GRAY
            textControl.AutoBeep = True
            textControl.BorderStyle = BorderStyleRounded
            textControl.MarginLeft = 5
            textControl.MarginTop = 1
            textControl.DropShadowWidth = 3
            textControl.BorderDropShadow = BorderDropShadowOnFocus
            textControl.OnFocusPosition = OnFocusPositionBeginning
            textControl.Font.Name = "Arial"
            textControl.Font.Bold = False
            textControl.FontSize = 10
        
        ElseIf TypeOf arrControls(i) Is EditLib.fpDateTime Then
            Dim dateTimeControl As fpDateTime
            Set dateTimeControl = arrControls(i)
            
            dateTimeControl.AutoBeep = True
            dateTimeControl.AllowNull = True
            dateTimeControl.InvalidOption = ClearData
            dateTimeControl.BorderStyle = BorderStyleRounded
            dateTimeControl.MarginLeft = 5
            dateTimeControl.MarginTop = 1
            dateTimeControl.DropShadowWidth = 3
            dateTimeControl.BorderDropShadow = BorderDropShadowOnFocus
            dateTimeControl.OnFocusPosition = OnFocusPositionBeginning
            dateTimeControl.BorderGrayAreaColor = MEDIUM_GRAY
            dateTimeControl.DateTimeFormat = UserDefined
            dateTimeControl.UserDefinedFormat = "dd MMM yyyy"
            dateTimeControl.Font.Name = "Arial"
            dateTimeControl.FontSize = 10
            dateTimeControl.Font.Bold = False
            dateTimeControl.Height = 340
            
        ElseIf TypeOf arrControls(i) Is EditLib.fpLongInteger Then
            Dim longIntegerControl As fpLongInteger
            Set longIntegerControl = arrControls(i)
            
            longIntegerControl.AutoBeep = True
            longIntegerControl.BorderStyle = BorderStyleRounded
            longIntegerControl.MarginLeft = 5
            longIntegerControl.MarginTop = 1
            longIntegerControl.DropShadowWidth = 3
            longIntegerControl.BorderDropShadow = BorderDropShadowOnFocus
            longIntegerControl.Font.Name = "Arial"
            longIntegerControl.Font.Bold = False
            longIntegerControl.FontSize = 10
            longIntegerControl.BorderGrayAreaColor = MEDIUM_GRAY
            longIntegerControl.Height = 340
            
        ElseIf TypeOf arrControls(i) Is MemoLib.fpMemo Then
            Dim memoControl As fpMemo
            Set memoControl = arrControls(i)
            
            memoControl.ScrollBars = VerticalFixed
            memoControl.AutoBeep = True
            memoControl.BorderStyle = Rounded
            memoControl.BorderDropShadow = BDSOnFocus
            memoControl.DropShadowWidth = 3
            memoControl.Font.Name = "Arial"
            memoControl.Font.Bold = False
            memoControl.FontSize = 10
            memoControl.BorderGrayAreaColor = MEDIUM_GRAY
            memoControl.SelBackColor = BLUE
            memoControl.SelForeColor = WHITE
            
        ElseIf TypeOf arrControls(i) Is EditLib.fpDoubleSingle Then
            Dim doubleSingleControl As fpDoubleSingle
            Set doubleSingleControl = arrControls(i)
            
            doubleSingleControl.UserEntry = DblUserEntryFixedRight
            doubleSingleControl.AutoBeep = True
            doubleSingleControl.BorderStyle = BorderStyleRounded
            doubleSingleControl.MarginLeft = 5
            doubleSingleControl.MarginTop = 1
            doubleSingleControl.BorderDropShadow = BorderDropShadowOnFocus
            doubleSingleControl.DropShadowWidth = 3
            textControl.Font.Name = "Arial"
            doubleSingleControl.Font.Bold = False
            doubleSingleControl.FontSize = 10
            doubleSingleControl.BorderGrayAreaColor = MEDIUM_GRAY
            doubleSingleControl.Height = 340
          
         ElseIf TypeOf arrControls(i) Is EditLib.fpBoolean Then
            Dim booleanControl As fpBoolean
            Set booleanControl = arrControls(i)
            
            textControl.Font.Name = "Arial"
            booleanControl.Font.Bold = False
            booleanControl.FontSize = 10
            booleanControl.Height = 340
            
        ElseIf TypeOf arrControls(i) Is VB.ComboBox Then
            Dim comboControl As VB.ComboBox
            Set comboControl = arrControls(i)
            
            textControl.Font.Name = "Arial"
            comboControl.Font.Bold = False
            comboControl.FontSize = 10
            'comboControl.Style = vbComboDropdownList
            
        ElseIf TypeOf arrControls(i) Is VB.CommandButton Then
            Dim commandControl As VB.CommandButton
            Set commandControl = arrControls(i)
            
            textControl.Font.Name = "Arial"
            commandControl.Font.Bold = False
            commandControl.FontSize = 10
            commandControl.Height = 300
            'commandControl.Style = vbButtonGraphical
        
        ElseIf TypeOf arrControls(i) Is VB.Frame Then
            Dim frameControl As VB.Frame
            Set frameControl = arrControls(i)
            
            textControl.Font.Name = "Arial"
            frameControl.Font.Bold = False
            frameControl.FontSize = 10
            frameControl.BackColor = MEDIUM_GRAY
            'frameControl.ForeColor=blue
            
        ElseIf TypeOf arrControls(i) Is VB.Label Then
            Dim labelControl As VB.Label
            Set labelControl = arrControls(i)
            
            labelControl.Font.Name = "Arial"
            labelControl.Font.Bold = False
            labelControl.FontSize = 10
            labelControl.BackColor = MEDIUM_GRAY
            labelControl.ForeColor = BLUE
            labelControl.Height = 240
            
        ElseIf TypeOf arrControls(i) Is VB.Form Then
            Dim formControl As VB.Form
            Set formControl = arrControls(i)
            
            textControl.Font.Name = "Arial"
            formControl.Font.Bold = False
            formControl.FontSize = 10
            formControl.BackColor = MEDIUM_GRAY
            formControl.ForeColor = BLACK
            formControl.BorderStyle = vbSizable
            
        End If
    Next i
End Sub
