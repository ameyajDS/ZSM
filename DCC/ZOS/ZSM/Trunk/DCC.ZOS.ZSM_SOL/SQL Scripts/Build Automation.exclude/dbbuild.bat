Echo Starting creation of Application Setup file.
%CCNetWorkingDirectory%\..\..\..\..\UMB\CDF\Trunk\DCC.UMB.CDF_SOL\DCC.UMB.CDF.Tools\bin\Debug\DCC.UMB.CDF.Tools.exe -GENERATE_APP_SETUP -FFP="%CCNetWorkingDirectory%\SQL Scripts\300_AppObjects\40_AppSetup\30_SetupApplication.ods"
Echo Done creation of Application Setup file.

Echo Starting deletion of consolidated db file (if existed from previous build)
if exist "%CCNetartifactDirectory%\ZSM_ConsolidateBuildDatabase*.txt" del "%CCNetartifactDirectory%\ZSM_ConsolidateBuildDatabase*.txt" 
Echo Done deletion of consolidated db file

Echo Starting creation of consolidated db file.
%CCNetWorkingDirectory%\..\..\..\..\UMB\CDF\Trunk\DCC.UMB.CDF_SOL\DCC.UMB.CDF.Tools\bin\Debug\DCC.UMB.CDF.Tools.exe -GENERATE_DB_BATCH_COMMAND_LINE -PDP="%CCNetWorkingDirectory%\SQL Scripts" -FFP="%CCNetartifactDirectory%\ZSM_ConsolidateBuildDatabase_%CCNetLabel%.txt"
Echo Done creation of consolidated db file.

Echo Starting deletion of procs only db file (it existed from previous build)
if exist "%CCNetartifactDirectory%\ZSM_Procs_Only*.txt"  DEL "%CCNetartifactDirectory%\ZSM_Procs_Only*.txt" 
Echo Done deletion of procs only db file

Echo Starting creation of consolidated db file.
%CCNetWorkingDirectory%\..\..\..\..\UMB\CDF\Trunk\DCC.UMB.CDF_SOL\DCC.UMB.CDF.Tools\bin\Debug\DCC.UMB.CDF.Tools.exe -GENERATE_DB_BATCH_COMMAND_LINE -PDP="%CCNetWorkingDirectory%\SQL Scripts\300_AppObjects" -FFP="%CCNetartifactDirectory%\ZSM_Procs_Only_%CCNetLabel%.txt"

Echo Done creation of consolidated db file.



