PRINT '------------------------------- DROPPING DATABASES --------------------------------------'

PRINT 'Droping ZSM databse'
DROP database ZSM
GO

PRINT '------------------------------- RESTORING DATABASES --------------------------------------'

PRINT 'Restoring ZSM databse'
RESTORE DATABASE [ZSM] FROM  DISK = N'C:\CruiseControlBase\WorkingBase\DERA_APPS\DCC\UMB\CruiseControl.NET\DBBackupsForConsolidatedDBBuilds\ZSM\ZSM.bak' 
WITH  FILE = 1,  MOVE N'ZSM_Data' TO N'c:\program files\Microsoft SQL Server\MSSQL\Data\ZSM.mdf',  MOVE N'ZSM_log' TO N'c:\program files\Microsoft SQL Server\MSSQL\Data\ZSM.LDF',  NOUNLOAD,  REPLACE,  STATS = 10
GO


