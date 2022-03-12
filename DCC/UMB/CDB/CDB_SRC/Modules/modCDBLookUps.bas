Attribute VB_Name = "modCDBLookUps"
'------------------------------------------------------------------------------
'Summary:
'This module holds the methods for handling lookup functionality. Programmers
'are suggested to deligate the lookup related functionality to this module.
'The typical structure of the function will be as shown below.
'
'''''''''Public Sub showLookUpForStore(p_objCallingForm As Object, '''''''''                                p_objCallingControl As Object, '''''''''                                ByVal p_strSearchString As String)
'''''''''   lookupManager.addColumnToDialog "Store Name", "name", 50
'''''''''   Dim sqlString As String
'''''''''   sqlString = "SELECT " &  "id, code, name, activeStatus " &
'''''''''               "FROM " & "GNM_STORES " &
'''''''''               "WHERE " & "name LIKE ? " &
'''''''''                "ORDER BY " & "name"
''''''''
'''''''''   lookupManager.showLookupDialog sqlString, '''''''''                                    "name", '''''''''                                    "id", '''''''''                                    "No Store Found", '''''''''                                    "Stores", '''''''''                                    p_strSearchString, '''''''''                                    storesMaster, '''''''''                                    p_objCallingForm, '''''''''                                    p_objCallingControl
'''''''''End Sub

Option Explicit

Public Sub showLookUpForCountries(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Name", "country_nm", 70
    lookupManager.addColumnToDialog "Code", "country_cd", 15
    lookupManager.addColumnToDialog "ISD", "isd_code", 15
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlTemplate As String
    sqlTemplate = "SELECT country_id, country_cd, country_nm, isd_code, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM countries " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY country_nm"

    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "country_nm", "country_id", _
                                              p_searchInhierarchy, p_strSearchString, _
                                              "Select countries", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              "country_cd", "country_id", "country_nm")
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForCountries", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForStates(p_objCallingForm As Object, _
                               p_objCallingControl As Object, _
                               p_objCalledForm As Object, _
                               ByVal p_strSearchString As String, _
                               p_searchInhierarchy As ADL.enmLookupSearchModes, _
                               Optional p_colAdditionalValues As Collection = Nothing, _
                               Optional p_showEffectiveDates As Boolean = False)
                                  
On Error GoTo errortag

    lookupManager.addColumnToDialog "Name", "state_nm", 80
    lookupManager.addColumnToDialog "Code", "state_cd", 20
    
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlTemplate As String
    
    'in query mode, multipart value consisting of country id & name may be blank.
    If p_colAdditionalValues Is Nothing Then  ' Changes has been made on 6-March-2008 by Micku
        sqlTemplate = "SELECT s.state_id, s.state_cd, s.state_nm, Upper(Convert(varchar, s.effective_from, 106))effective_from, Upper(Convert(varchar, s.effective_till, 106))effective_till " & _
                      "FROM states s " & _
                      "WHERE s.effective_from <= getdate() AND s.effective_till >= getdate() " & _
                      "AND s.? " & _
                      "ORDER BY s.state_nm"
    Else
        sqlTemplate = "SELECT s.state_id, s.state_cd, s.state_nm, Upper(Convert(varchar, s.effective_from, 106))effective_from, Upper(Convert(varchar, s.effective_till, 106))effective_till " & _
                      "FROM states s, countries c " & _
                      "WHERE s.country_id = c.country_id " & _
                      "AND c.country_id = " & p_colAdditionalValues("country_id") & " " & _
                      "AND s.effective_from <= getdate() AND s.effective_till >= getdate() " & _
                      "AND s.? " & _
                      "ORDER BY s.state_nm"
    End If
    
    
    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "state_nm", _
                                             "state_id", p_searchInhierarchy, p_strSearchString, _
                                             "Select states", p_objCalledForm, p_objCallingForm, _
                                             p_objCallingControl, p_colAdditionalValues, "state_cd", "state_id", "state_nm")
                                     
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForStates", "", ERROR_TYPE, "modCDBLookUps"
    Err.Raise Err.Description
End Sub

Public Sub showLookUpForDistrictsOrCities(p_objCallingForm As Object, _
                                          p_objCallingControl As Object, _
                                          p_objCalledForm As Object, _
                                          ByVal p_strSearchString As String, _
                                          p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                          Optional p_colAdditionalValues As Collection = Nothing, _
                                          Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag

    lookupManager.addColumnToDialog "Name", "district_nm", 80
    lookupManager.addColumnToDialog "Code", "district_cd", 20
    
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
        
    'stateid, statename, countryid, countryname
        
    Dim sqlTemplate As String
    'in query mode, multipartvalue consisting of state id & name, country id & name may be blank
    If p_colAdditionalValues Is Nothing Then
        sqlTemplate = "SELECT d.district_nm, d.district_cd, d.district_or_city_id, Upper(Convert(varchar, d.effective_from, 106))effective_from, Upper(Convert(varchar, d.effective_till, 106))effective_till " & _
                      "FROM districts_or_cities d " & _
                      "WHERE d.effective_from <= getdate() AND d.effective_till >= getdate() " & _
                      "AND d.? " & _
                      "ORDER BY d.district_nm"
    Else
        sqlTemplate = "SELECT d.district_nm, d.district_cd, d.district_or_city_id, Upper(Convert(varchar, d.effective_from, 106))effective_from, Upper(Convert(varchar, d.effective_till, 106))effective_till " & _
                      "FROM districts_or_cities d, states s " & _
                      "WHERE d.state_id = s.state_id " & _
                      "AND s.state_id = " & p_colAdditionalValues("state_id") & " " & _
                      "AND d.effective_from <= getdate() AND d.effective_till >= getdate() " & _
                      "AND d.? " & _
                      "ORDER BY d.district_nm"
    End If
    
    Debug.Print sqlTemplate
    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "district_nm", "district_or_city_id", _
                                              p_strSearchInHierarchy, p_strSearchString, _
                                              "Select Districts Or Cities ", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, p_colAdditionalValues, _
                                              "district_cd", "district_or_city_id", "district_nm")
                                        
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForDistrictsOrCities", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForOccupations(p_objCallingForm As Object, _
                                    p_objCallingControl As Object, _
                                    p_objCalledForm As Object, _
                                    ByVal p_strSearchString As String, _
                                    p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag

    lookupManager.addColumnToDialog "Occupation Name", "occupation_nm", 60
    
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If

    Dim strTemplate As String
   
    strTemplate = "SELECT occupation_id, occupation_cd, occupation_nm, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM occupations " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY occupation_nm"

    Debug.Print strTemplate
    Call lookupManager.showLogicalDialogWithSQL(strTemplate, "occupation_nm", "occupation_id", _
                                              p_strSearchInHierarchy, p_strSearchString, _
                                              "Select Occupation", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              "occupation_cd", "occupation_id", "occupation_nm")
                                        
                                    
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForOccupations", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub


Public Sub showLookUpForDesignations(p_objCallingForm As Object, _
                                     p_objCallingControl As Object, _
                                     p_objCalledForm As Object, _
                                     ByVal p_strSearchString As String, _
                                     p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                     Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Designation Name", "designation_nm", 80
    lookupManager.addColumnToDialog "Dsg Code", "designation_cd", 20
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
        
    Dim sqlTemplate As String
   
    sqlTemplate = "SELECT designation_id, designation_cd, designation_nm, " & _
                  "minimum_age, maximum_starting_age, retirement_age, " & _
                  "Upper(convert(varchar, effective_from, 106))effective_from, " & _
                  "Upper(convert(varchar, effective_till, 106))effective_till " & _
                  "FROM designations " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY designation_nm"

    Debug.Print sqlTemplate
    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "designation_nm", "designation_id", _
                                              p_strSearchInHierarchy, p_strSearchString, _
                                              "Select Designation", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              "designation_cd", "designation_id", "designation_nm")
                                        
                                    
                                    
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForDesignations", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForDeptGroups(p_objCallingForm As Object, _
                                   p_objCallingControl As Object, _
                                   p_objCalledForm As Object, _
                                   ByVal p_strSearchString As String, _
                                   p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag

    lookupManager.addColumnToDialog "Name", "department_group_nm", 80
    lookupManager.addColumnToDialog "Code", "department_group_cd", 20
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlTemplate As String
   
    sqlTemplate = "SELECT department_group_id, department_group_cd, department_group_nm, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM department_groups " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY department_group_nm"

    Debug.Print sqlTemplate
    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "department_group_nm", "department_group_id", _
                                              p_strSearchInHierarchy, p_strSearchString, _
                                              "Select Department Group", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              "department_group_cd", "department_group_id", "department_group_nm")
                                             
                                    
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForDeptGroups", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForFaxPTLines(p_objCallingForm As Object, _
                                   p_objCallingControl As Object, _
                                   p_objCalledForm As Object, _
                                   ByVal p_strSearchString As String, _
                                   p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag

    lookupManager.addColumnToDialog "Fax Line", "telephone_no", 30
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlTemplate As String
   
    sqlTemplate = "SELECT telephone_no, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM p_and_t_lines " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY telephone_no"

    Debug.Print sqlTemplate
    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "telephone_no", "telephone_no", _
                                              p_strSearchInHierarchy, p_strSearchString, _
                                              "Select Fax Lines", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              , , "telephone_no")
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForFaxPTLines", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub



Public Sub showLookUpForEPABXExt(p_objCallingForm As Object, _
                                 p_objCallingControl As Object, _
                                 p_objCalledForm As Object, _
                                 ByVal p_strSearchString As String, _
                                 p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag
    lookupManager.addColumnToDialog "EPABX Extension", "extension_no", 30
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlTemplate As String
   
    sqlTemplate = "SELECT extension_no, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM epabx_lines " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY extension_no"

    Debug.Print sqlTemplate
    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "extension_no", "extension_no", _
                                              p_strSearchInHierarchy, p_strSearchString, _
                                              "Select EPABX Lines", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              , , "extension_no", True, True, True)
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForEPABXExt", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForFirstName(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag
    lookupManager.addColumnToDialog "First Name", "first_nm", 45
    lookupManager.addColumnToDialog "Middle Name", "middle_nm", 30
    lookupManager.addColumnToDialog "Last Name", "last_nm", 25
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlString As String
    sqlString = "SELECT first_nm, middle_nm, last_nm, title, datediff(yyyy, birth_dtm, getdate())age, contact_information, email_addresses, person_id, gender, " & _
                "is_dera_resident, upper(convert(varchar,birth_dtm,106))birth_dtm, additional_information, application_id, screen_id, initiation_id " & _
                ", Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                "FROM persons " & _
                "WHERE getDate() BETWEEN effective_from AND effective_till AND ? " & _
                "ORDER BY first_nm"
    
    Call lookupManager.showLogicalDialogWithSQL(sqlString, "first_nm", "person_id", _
                                              p_strSearchInHierarchy, p_strSearchString, _
                                              "Select Persons", p_objCalledForm, p_objCallingForm, _
                                              p_objCallingControl, Nothing, , "person_id", "first_nm", , , , , 700)
                                        
                                    
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForFirstName", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForLastName(p_objCallingForm As Object, _
                                 p_objCallingControl As Object, _
                                 p_objCalledForm As Object, _
                                 ByVal p_strSearchString As String, _
                                 p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag
    lookupManager.addColumnToDialog "Last Name", "last_nm", 45
    lookupManager.addColumnToDialog "First Name", "first_nm", 30
    lookupManager.addColumnToDialog "Middle Name", "middle_nm", 25
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If

    Dim sqlString As String
      
    sqlString = "SELECT first_nm, middle_nm, last_nm, title, datediff(yyyy,birth_dtm,getdate())age, contact_information, email_addresses, person_id, gender, " & _
                "is_dera_resident, upper(convert(varchar,birth_dtm,106))birth_dtm, additional_information, application_id, screen_id, initiation_id " & _
                ", Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                "FROM persons " & _
                "WHERE getDate() BETWEEN effective_from AND effective_till AND ? " & _
                "ORDER BY last_nm"
                
    Debug.Print sqlString
        
    Call lookupManager.showLogicalDialogWithSQL(sqlString, "last_nm", "person_id", _
                                              p_strSearchInHierarchy, p_strSearchString, _
                                              "Select Persons", p_objCalledForm, p_objCallingForm, _
                                              p_objCallingControl, Nothing, , "person_id", "last_nm", , , , , 700)
                                        
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForLastName", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForMeasuringUnits(p_objCallingForm As Object, _
                                 p_objCallingControl As Object, _
                                 p_objCalledForm As Object, _
                                 ByVal p_strSearchString As String, _
                                 p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag
    lookupManager.addColumnToDialog "Name", "measuring_unit_nm", 30
    lookupManager.addColumnToDialog "Code", "measuring_unit_cd", 30
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlString As String
      
    sqlString = "SELECT measuring_unit_id, measuring_unit_cd, measuring_unit_nm, " & _
                "unit_decimals, number_format_type, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                "FROM measuring_units " & _
                "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                "AND ? " & _
                "ORDER BY measuring_unit_nm"
                
    Debug.Print sqlString
        
    Call lookupManager.showLogicalDialogWithSQL(sqlString, "measuring_unit_nm", "measuring_unit_id", _
                                              p_strSearchInHierarchy, p_strSearchString, _
                                              "Select Measuring Units", p_objCalledForm, p_objCallingForm, _
                                              p_objCallingControl, Nothing, "measuring_unit_cd", _
                                              "measuring_unit_id", "measuring_unit_nm")
                                        
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForMeasuringUnits", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForDepartments(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Name", "department_nm", 80
    lookupManager.addColumnToDialog "Code", "department_cd", 20
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlTemplate As String
    sqlTemplate = "SELECT department_id, department_cd, department_nm, fax_line, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM departments " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY department_nm"

    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "department_nm", "department_id", _
                                              p_searchInhierarchy, p_strSearchString, _
                                              "Select departments", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              "department_cd", "department_id", "department_nm")
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForDepartments", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub


Public Sub showLookUpForSatsangCentres(p_objCallingForm As Object, _
                                       p_objCallingControl As Object, _
                                       p_objCalledForm As Object, _
                                       ByVal p_strSearchString As String, _
                                       p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Name", "satsang_centre_nm", 50
    lookupManager.addColumnToDialog "Code", "satsang_centre_cd", 50
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlTemplate As String
    sqlTemplate = "SELECT satsang_centre_id, satsang_centre_cd, satsang_centre_nm, satsang_centre_type, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM satsang_centres " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY satsang_centre_nm"

    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "satsang_centre_nm", "satsang_centre_id", _
                                              p_searchInhierarchy, p_strSearchString, _
                                              "Select Satsang Centres", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              "satsang_centre_cd", "satsang_centre_id", "satsang_centre_nm")
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForSatsangCentres", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub


Public Sub showLookUpForHospitalUnits(p_objCallingForm As Object, _
                                       p_objCallingControl As Object, _
                                       p_objCalledForm As Object, _
                                       ByVal p_strSearchString As String, _
                                       p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Name", "hospital_unit_nm", 50
    lookupManager.addColumnToDialog "ID", "hospital_unit_id", 50
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlTemplate As String
    sqlTemplate = "SELECT hospital_unit_id, hospital_unit_nm, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM hospital_units " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY hospital_unit_nm"

    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "hospital_unit_nm", "hospital_unit_id", _
                                              p_searchInhierarchy, p_strSearchString, _
                                              "Select Hospital Units", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              , "hospital_unit_id", "hospital_unit_nm")
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForHospitalUnits", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub


Public Sub showLookUpForPersons(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag
    lookupManager.addColumnToDialog "Name", "name", 100
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlString As String
    sqlString = "SELECT first_nm + ' ' + isNull(middle_nm,'') + ' ' + last_nm as name, title, person_id " & _
                ", Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                "FROM persons " & _
                "WHERE getDate() BETWEEN effective_from AND effective_till AND ? " & _
                "ORDER BY first_nm"
    
    Call lookupManager.showLogicalDialogWithSQL(sqlString, "name", "person_id", _
                                              p_strSearchInHierarchy, p_strSearchString, _
                                              "Select Persons", p_objCalledForm, p_objCallingForm, _
                                              p_objCallingControl, Nothing, , "person_id", "first_nm")
                                        
                                    
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForPersons", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForDonor(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                  ByVal p_strAppId As String, _
                                  Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag

    lookupManager.addColumnToDialog "Donor Name", "donor_nm", 80
    lookupManager.addColumnToDialog "Donor Code", "donor_cd", 20
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlString As String
    
    sqlString = "SELECT donor_id, donor_cd, donor_nm, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                "FROM donors " & _
                "WHERE application_id = '" & p_strAppId & "' " & _
                "AND effective_till >= getDate() " & _
                "AND ? " & _
                "ORDER BY donor_nm"
    
    Call lookupManager.showLogicalDialogWithSQL(sqlString, "donor_nm", "donor_id", _
                                              p_strSearchInHierarchy, p_strSearchString, _
                                              "Select Donor", Nothing, p_objCallingForm, _
                                              p_objCallingControl, Nothing, "donor_cd", "donor_id", "donor_nm", , , , , 550)
                                        
                                    
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForDonor", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub


Public Sub showLookUpForManufacturer(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                  ByVal p_strAppId As String, _
                                  Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag

    lookupManager.addColumnToDialog "Manufacturer Name", "manufacturer_nm", 80
    lookupManager.addColumnToDialog "Mfr Code", "manufacturer_cd", 20
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlString As String
    
    sqlString = "SELECT manufacturer_id, manufacturer_cd, manufacturer_nm, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                "FROM manufacturers " & _
                "WHERE application_id = '" & p_strAppId & "' " & _
                "AND effective_till >= getDate() " & _
                "AND ? " & _
                "ORDER BY manufacturer_nm"
    
    Call lookupManager.showLogicalDialogWithSQL(sqlString, "manufacturer_nm", _
                                                "manufacturer_id", p_strSearchInHierarchy, _
                                                p_strSearchString, "Select Manufacturer", _
                                                Nothing, p_objCallingForm, _
                                                p_objCallingControl, Nothing, _
                                                "manufacturer_cd", "manufacturer_id", _
                                                "manufacturer_nm", , , , , 550)
                                    
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForManufacturer", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub



Public Sub showLookUpForSupplier(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_strSearchInHierarchy As ADL.enmLookupSearchModes, _
                                  ByVal p_strAppId As String, _
                                  Optional p_showEffectiveDates As Boolean = False)
On Error GoTo errortag

    lookupManager.addColumnToDialog "Supplier Name", "supplier_nm", 80
    lookupManager.addColumnToDialog "Supplier Code", "supplier_cd", 20
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlString As String
    
    sqlString = "SELECT supplier_id, supplier_cd, supplier_nm, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                "FROM suppliers " & _
                "WHERE application_id = '" & p_strAppId & "' " & _
                "AND effective_till >= getDate() " & _
                "AND ? " & _
                "ORDER BY supplier_nm"
    
    Call lookupManager.showLogicalDialogWithSQL(sqlString, "supplier_nm", _
                                                "supplier_id", p_strSearchInHierarchy, _
                                                p_strSearchString, "Select supplier", _
                                                Nothing, p_objCallingForm, _
                                                p_objCallingControl, Nothing, _
                                                "supplier_cd", "supplier_id", _
                                                "supplier_nm", , , , , 550)
                                    
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForSupplier", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub


Public Sub showLookUpForRoles(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Role Name", "role_nm", 70
    lookupManager.addColumnToDialog "Role Code", "role_cd", 30
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlTemplate As String
    sqlTemplate = "SELECT DISTINCT " & _
                        "r.role_cd, r.role_nm, Upper(Convert(varchar, r.effective_from, 106))effective_from, Upper(Convert(varchar, r.effective_till,106))effective_till, r.address_requirement, " & _
                        "rac.owner_application_id, sa.application_nm " & _
                  "FROM roles r JOIN roles_application_controls rac ON r.role_cd = rac.role_cd " & _
                  "JOIN SysAdmin..applications sa ON rac.owner_application_id = sa.application_id " & _
                  "WHERE r.? " & _
                  "AND getDate() BETWEEN r.effective_from AND r.effective_till " & _
                  "AND rac.owner_application_id = '" & uiManager.ApplicationContext.ARG_APPLICATION_ID & "' " & _
                  "ORDER BY r.role_nm"

    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, _
                                                "role_nm", _
                                                "role_cd", _
                                                p_searchInhierarchy, _
                                                p_strSearchString, _
                                                "Select Roles", _
                                                p_objCalledForm, _
                                                p_objCallingForm, _
                                                p_objCallingControl, _
                                                Nothing, _
                                                "role_cd", , "role_nm")
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForRoles", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForSewadarStatus(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Sewadar Status", "sewadarstatus_nm", 85
    lookupManager.addColumnToDialog "ID", "sewadarstatus_id", 15
        
    Dim sqlTemplate As String
    sqlTemplate = "SELECT sewadarstatus_nm, sewadarstatus_id, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM sewadar_status " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY sewadarstatus_nm"

    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "sewadarstatus_nm", "sewadarstatus_id", _
                                              p_searchInhierarchy, p_strSearchString, _
                                              "Select Sewadar Status", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              , "sewadarstatus_id", "sewadarstatus_nm", _
                                              False, False, False)
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForSewadarStatus", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForSewadarTypes(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Sewadar Type", "sewadartype_nm", 85
    lookupManager.addColumnToDialog "ID", "sewadartype_id", 15
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
        
    Dim sqlTemplate As String
    sqlTemplate = "SELECT sewadartype_nm, sewadartype_id, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM sewadar_types " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY sewadartype_nm"

    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "sewadartype_nm", "sewadartype_id", _
                                              p_searchInhierarchy, p_strSearchString, _
                                              "Select Sewadar Types", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              , "sewadartype_id", "sewadartype_nm", False, False, False)
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForSewadarTypes", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForPostOffices(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_colAdditionalValues As Collection = Nothing, _
                                  Optional p_showEffectiveDates As Boolean = False)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Name", "post_office_nm", 70
    lookupManager.addColumnToDialog "Code", "post_office_cd", 15
    lookupManager.addColumnToDialog "ID", "post_office_id", 15
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
    
    Dim sqlTemplate As String
    If p_colAdditionalValues Is Nothing Then
        sqlTemplate = "SELECT post_office_id, post_office_cd, post_office_nm, " & _
                      "district_or_city_id, pin_or_zip_code, std_code, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                      "FROM post_offices " & _
                      "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                      "AND ? " & _
                      "ORDER BY post_office_nm"
    Else
        sqlTemplate = "SELECT post_office_id, post_office_cd, post_office_nm, " & _
                      "district_or_city_id, pin_or_zip_code, std_code, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                      "FROM post_offices " & _
                      "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                      "AND district_or_city_id = " & p_colAdditionalValues("district_or_city_id") & " " & _
                      "AND ? " & _
                      "ORDER BY post_office_nm"
    End If
    
    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "post_office_nm", "post_office_id", _
                                              p_searchInhierarchy, p_strSearchString, _
                                              "Select post offices", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              "post_office_cd", "post_office_id", "post_office_nm")
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForPostOffices", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForQualifications(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Qualification", "qualification_nm", 80
    lookupManager.addColumnToDialog "Code", "qualification_cd", 15
    lookupManager.addColumnToDialog "ID", "qualification_id", 5
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If
        
    Dim sqlTemplate As String
    sqlTemplate = "SELECT qualification_id, qualification_cd, qualification_nm, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM qualifications " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY qualification_nm"

    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "qualification_nm", "qualification_id", _
                                              p_searchInhierarchy, p_strSearchString, _
                                              "Select Qualifications", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              "qualification_cd", "qualification_id", "qualification_nm", _
                                              False, False, False)
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForQualifications", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub

Public Sub showLookUpForLanguages(p_objCallingForm As Object, _
                                  p_objCallingControl As Object, _
                                  p_objCalledForm As Object, _
                                  ByVal p_strSearchString As String, _
                                  p_searchInhierarchy As ADL.enmLookupSearchModes, _
                                  Optional p_showEffectiveDates As Boolean = False)
                                  
                                   
On Error GoTo errortag
    
    lookupManager.addColumnToDialog "Language", "language_nm", 80
    lookupManager.addColumnToDialog "Code", "language_cd", 20
    If p_showEffectiveDates Then
        lookupManager.addColumnToDialog "Effective From", "effective_from", 20
        lookupManager.addColumnToDialog "Effective Till", "effective_till", 20
    End If

    Dim sqlTemplate As String
    sqlTemplate = "SELECT language_id, language_cd, language_nm, Upper(Convert(varchar, effective_from, 106))effective_from, Upper(Convert(varchar, effective_till, 106))effective_till " & _
                  "FROM languages " & _
                  "WHERE effective_from <= getdate() AND effective_till >= getdate() " & _
                  "AND ? " & _
                  "ORDER BY language_nm"

    Call lookupManager.showLogicalDialogWithSQL(sqlTemplate, "language_nm", "language_id", _
                                              p_searchInhierarchy, p_strSearchString, _
                                              "Select Languages", p_objCalledForm, _
                                              p_objCallingForm, p_objCallingControl, Nothing, _
                                              "language_cd", "language_id", "language_nm")
Exit Sub

errortag:
    errorManager.setErrorAttributes modStandardMessages.UnknownError, "showLookUpForLanguages", "", ERROR_TYPE, "modCDBLookups"
    Err.Raise Err.Number
End Sub



