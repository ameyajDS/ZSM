PRINT '------------------------------- DROPPING DATABASES --------------------------------------'

PRINT 'Dropping ZSM database'
DROP database ZSM
GO

PRINT '------------------------------- RESTORING DATABASES --------------------------------------'

PRINT 'Restoring ZSM database'
RESTORE DATABASE [ZSM] FROM  DISK = N'C:\ZSM_TEMP\ZSM.bak' 
WITH  FILE = 1, MOVE N'ZSM_Data' TO N'c:\ZSM_TEMP\ZSM.mdf',  MOVE N'ZSM_log' TO N'c:\ZSM_TEMP\ZSM.LDF', NOUNLOAD,  REPLACE,  STATS = 10
GO
