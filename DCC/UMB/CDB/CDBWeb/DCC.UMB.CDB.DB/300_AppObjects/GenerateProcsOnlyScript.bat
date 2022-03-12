del CDB_Procs_Only*.sql
"c:\CDFTools\DCC.UMB.CDF.Tools.exe" "-GENERATE_APP_SETUP" "-FFP=%~dp0\40_AppSetup\30_CDB_SetupApplication.ods"
"c:\CDFTools\DCC.UMB.CDF.Tools.exe"  "-GENERATE_DB_BATCH_COMMAND_LINE" "-PDP=%~dp0\20_ProcsAndViews" "-FFP=CDB_Procs_Only_%BUILD_NUMBER%.sql"
