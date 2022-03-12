Echo Starting creation of Application Setup file.
c:\CDFTOOLS\DCC.UMB.CDF.Tools.exe -GENERATE_APP_SETUP -FFP="DCC\ZOS\ZSM\Trunk\DCC.ZOS.ZSM_SOL\SQL Scripts\300_AppObjects\40_AppSetup\30_SetupApplication.ods"
Echo Done creation of Application Setup file.

Echo Starting deletion of consolidated db file (if existed from previous build)
if exist "DCC\ZOS\ZSM\Trunk\DCC.ZOS.ZSM_SOL\SQL Scripts\ZSM_ConsolidateBuildDatabase*.txt" del "DCC\ZOS\ZSM\Trunk\DCC.ZOS.ZSM_SOL\SQL Scripts\ZSM_ConsolidateBuildDatabase*.txt" 
Echo Done deletion of consolidated db file

Echo Starting creation of consolidated db file.
c:\CDFTOOLS\DCC.UMB.CDF.Tools.exe -GENERATE_DB_BATCH_COMMAND_LINE -PDP="DCC\ZOS\ZSM\Trunk\DCC.ZOS.ZSM_SOL\SQL Scripts" -FFP="DCC\ZOS\ZSM\Trunk\DCC.ZOS.ZSM_SOL\SQL Scripts\ZSM_ConsolidateBuildDatabase_%BUILD_NUMBER%.txt"
Echo Done creation of consolidated db file.

Echo Starting deletion of procs only db file (it existed from previous build)
if exist "DCC\ZOS\ZSM\Trunk\DCC.ZOS.ZSM_SOL\SQL Scripts\300_AppObjects\ZSM_Procs_Only*.txt"  DEL "DCC\ZOS\ZSM\Trunk\DCC.ZOS.ZSM_SOL\SQL Scripts\300_AppObjects\ZSM_Procs_Only*.txt" 
Echo Done deletion of procs only db file

Echo Starting creation of consolidated db file.
c:\CDFTOOLS\DCC.UMB.CDF.Tools.exe -GENERATE_DB_BATCH_COMMAND_LINE -PDP="DCC\ZOS\ZSM\Trunk\DCC.ZOS.ZSM_SOL\SQL Scripts\300_AppObjects" -FFP="DCC\ZOS\ZSM\Trunk\DCC.ZOS.ZSM_SOL\SQL Scripts\300_AppObjects\ZSM_Procs_Only_%BUILD_NUMBER%.txt"

Echo Done creation of consolidated db file.



