Attribute VB_Name = "modLookup"
Public Sub showLookUpForApplication(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_strRoleCD As String)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Application ID", "application_id", 15
    lookupManager.addColumnToDialog "Application Name", "application_nm", 70
    lookupManager.addColumnToDialog "Package ID", "package_id", 15
    
    Dim sqlTemplate As String
    sqlTemplate = "SELECT DISTINCT " & _
                        "sa.application_id, sa.application_nm, sa.package_id, sa.database_nm " & _
                  "FROM SysAdmin..applications sa " & _
                  IIf(Trim(p_strRoleCD) = "", "", _
                        "JOIN roles_application_controls rac ON rac.application_id = sa.application_id " & _
                        "AND rac.role_cd = '" & p_strRoleCD & "' ") & _
                  "WHERE sa.? " & _
                  "ORDER BY sa.application_nm"

    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, _
                                                "application_nm", _
                                                "application_id", _
                                                p_searchInhierarchy, _
                                                p_strSearchString, _
                                                "Select Applications", _
                                                p_objCalledForm, _
                                                p_objCallingForm, _
                                                p_objCallingControl, _
                                                Nothing, _
                                                , "application_id", _
                                                "application_nm", , , , , 600)
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForApplication", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub


Public Sub showLookUpForAddTypesForParties(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  ByVal p_strPartyID As String, _
                                  p_strAddType() As String, _
                                  p_strAddNo() As String)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Address Type", "address_type", 80
    lookupManager.addColumnToDialog "Address No", "address_no", 20
    
    Dim strUnion As String
    strUnion = ""
    
    Dim i As Long
'    If p_strAddType(0) <> "" Then
'        For i = 0 To UBound(p_strAddType)
'            strUnion = strUnion & "UNION SELECT '" & p_strAddType(i) & "' as address_type, '' as party_address_id, " & p_strAddNo(i) & " as address_no FROM party_addresses WHERE ? "
'        Next i
'    End If
    
    Dim sqlTemplate As String
    sqlTemplate = "SELECT " & _
                        "address_type, party_address_id, address_no " & _
                  "FROM party_addresses " & _
                  "WHERE ? " & _
                  "AND party_id = " & p_strPartyID & " " & _
                  "AND Convert(varchar, getDate(), 106) BETWEEN Convert(varchar, effective_from, 106) " & _
                  "AND Convert(varchar, effective_till, 106) " & _
                  "ORDER BY address_type "

    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, _
                                                "address_type", _
                                                "party_address_id", _
                                                p_searchInhierarchy, _
                                                p_strSearchString, _
                                                "Select Address Types of a Party", _
                                                p_objCalledForm, _
                                                p_objCallingForm, _
                                                p_objCallingControl, _
                                                Nothing, _
                                                , "party_address_id", "address_type")
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForRoles", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub




