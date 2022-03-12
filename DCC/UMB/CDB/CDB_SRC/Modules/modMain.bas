Attribute VB_Name = "modMain"
Option Explicit
Public cameras As frmCameras
Public deptGroups As frmDepartmentGroups
Public depts As frmDepartments
Public designations As frmDesignations
Public EPBAXLines As frmEPABXLines
Public measuringUnits As frmMeasuringUnits
Public occupations As frmOccupations
Public ptLines As frmP_And_T_Lines
Public persons As frmPersons
Public qualifications As frmQualifications
Public relations As frmRelations
Public representatives As frmRepresentatives
Public satsangCenters As frmSatsangCentres
Public skills As frmSkills
Public countries As frmCountries
Public postOffices As frmPostOffices
Public districtsOrCities As frmDistrictsOrCities
Public states As frmStates
Public roles As frmRoles
Public parties As frmParties
Public initiationPlaces As frmInitiationPlaces
Public maritalStatus As frmMaritalStatus
Public sewadarStatus As frmSewadarStatus
Public sewadarTypes As frmSewadarTypes
Public languages As frmLanguages

'--- constants used across the project
Public Const ADD_TYPE_MANDATORY = "Mandatory"
Public Const ADD_TYPE_OPTIONAL = "Optional"
Public Const ADD_TYPE_NOT_REQUIRED = "Not Required"


Public Sub main()
    '########################ADL GENERATED CODE###########################
    ' This method initializes the ADL object. The following objects are
    ' created as a result of this method call.
    ' 1. An object of clsUIManager class, named as "uiManager"
    ' 2. An object of frmMDIMain form, named as "mdiMain"
    ' 3. An object of clsUtils class, named as "utils"
    ' 4. An object of clsLookupManager class, named by "lookupManager"
    ' 5. An object of clsDatabaseManager class, named by "dbManager"
    ' 6. An object of clsApplication class, available as a proeprty of
    ' uiManager object available as uiManager.ApplicationContext
    ' All these objects have public scope and are available to the programmer
    ' throughout the project's code(modules, forms and classes).
    modADLObjects.initializeADLObjects
    '#######################################################################
  
    '###############################START HERE###############################
  
    Set cameras = New frmCameras
    Set deptGroups = New frmDepartmentGroups
    Set depts = New frmDepartments
    Set designations = New frmDesignations
    Set EPBAXLines = New frmEPABXLines
    Set measuringUnits = New frmMeasuringUnits
    Set occupations = New frmOccupations
    Set ptLines = New frmP_And_T_Lines
    Set persons = New frmPersons
    Set qualifications = New frmQualifications
    Set relations = New frmRelations
    Set representatives = New frmRepresentatives
    Set satsangCenters = New frmSatsangCentres
    Set skills = New frmSkills
    Set countries = New frmCountries
    Set postOffices = New frmPostOffices
    Set districtsOrCities = New frmDistrictsOrCities
    Set states = New frmStates
    Set roles = New frmRoles
    Set parties = New frmParties
    Set initiationPlaces = New frmInitiationPlaces
    Set maritalStatus = New frmMaritalStatus
    Set sewadarStatus = New frmSewadarStatus
    Set sewadarTypes = New frmSewadarTypes
    Set languages = New frmLanguages
    
End Sub


Public Function getCurrentDate() As Date
    Dim map As clsRecordHashMap
    Set map = dbManager.executeSQLGetRS("select getDate()")
    getCurrentDate = map.getFieldValueByFieldIndex(0, 0)
End Function


