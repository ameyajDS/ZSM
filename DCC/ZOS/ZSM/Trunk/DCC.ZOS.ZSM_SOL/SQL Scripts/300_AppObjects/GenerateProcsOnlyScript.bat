if exist "ZSM_Procs_Only.sql" del "ZSM_Procs_Only.sql"
"..\..\..\..\..\..\UMB\CDF\Trunk\DCC.UMB.CDF_SOL\DCC.UMB.CDF.Tools\bin\Debug\DCC.UMB.CDF.Tools.exe" "-GENERATE_APP_SETUP" "-FFP=40_AppSetup\30_SetupApplication.ods"
"..\..\..\..\..\..\UMB\CDF\Trunk\DCC.UMB.CDF_SOL\DCC.UMB.CDF.Tools\bin\Debug\DCC.UMB.CDF.Tools.exe"  "-GENERATE_DB_BATCH_COMMAND_LINE" "-PDP=." "-FFP=ZSM_Procs_Only.sql"

