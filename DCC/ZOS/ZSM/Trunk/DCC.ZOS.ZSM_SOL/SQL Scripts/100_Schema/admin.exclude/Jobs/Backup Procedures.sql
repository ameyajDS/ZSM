

/* ==================================================================================
    Author(s)		:	Pramod Arora
    Started On		:	Long Back (Don't remember exactly when)
    Module ID		:	SysAdmin
    Language		:	TRANSACT-SQL
    Reviewed By		:	Jitendra Loyal
    Reviewed On		:	Fri 09 Jun 2018
    ==================================================================================
                                                                           Usage Notes
    ----------------------------------------------------------------------------------
	Creates various backup procedures
        Replace XXX with Centre code (for example RPR, NGP etc)
        Replace E:\ with appropriate drive letter
    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	
    ==================================================================================
*/


USE SysAdmin
SET ANSI_NULLS ON  
GO  
SET QUOTED_IDENTIFIER ON  
GO  


IF OBJECT_ID('sp_Backup_Daily_log', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_Daily_log
GO      

CREATE PROCEDURE [dbo].[sp_Backup_Daily_log]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_Backups\LogXXX' + LEFT(convert(varchar, getDate(), 106), 2) + '.bak'
BACKUP DATABASE [Log] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'Log backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO

      

IF OBJECT_ID('sp_Backup_Daily_SysAdmin', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_Daily_SysAdmin
GO
CREATE PROCEDURE [dbo].[sp_Backup_Daily_SysAdmin]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_Backups\SysXXX' + LEFT(convert(varchar, getDate(), 106), 2) + '.bak'
BACKUP DATABASE [SysAdmin] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'SysAdmin backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO

      

IF OBJECT_ID('sp_Backup_Daily_noon', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_Daily_noon
GO
CREATE PROCEDURE [dbo].[sp_Backup_Daily_noon]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_Backups\ZS' + LEFT(convert(varchar, getDate(), 106), 2) + 'noon.bak'
BACKUP DATABASE [ZSM] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'ZSM Morning backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO


      
IF OBJECT_ID('sp_Backup_Daily_even', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_Daily_even
GO
CREATE PROCEDURE [dbo].[sp_Backup_Daily_even]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_Backups\ZS' + LEFT(convert(varchar, getDate(), 106), 2) + 'even.bak'
BACKUP DATABASE [ZSM] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'ZSM Evening backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO

     
IF OBJECT_ID('sp_Backup_Weekly_CDB', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_Weekly_CDB
GO
CREATE PROCEDURE [dbo].[sp_Backup_Weekly_CDB]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_Sunday_Backups\XXX_CDB_Sun' + LEFT((LEFT(convert(varchar, getDate(), 106), 2)+6)/7,1) + '.bak'
BACKUP DATABASE [CDB] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'CDB backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO


IF OBJECT_ID('sp_Backup_Weekly_Log', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_Weekly_Log
GO
CREATE PROCEDURE [dbo].[sp_Backup_Weekly_Log]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_Sunday_Backups\XXX_Log_Sun' + LEFT((LEFT(convert(varchar, getDate(), 106), 2)+6)/7,1) + '.bak'
BACKUP DATABASE [Log] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'Log backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO


IF OBJECT_ID('sp_Backup_Weekly_SysAdmin', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_Weekly_SysAdmin
GO
CREATE PROCEDURE [dbo].[sp_Backup_Weekly_SysAdmin]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_Sunday_Backups\XXX_SysAdmin_Sun' + LEFT((LEFT(convert(varchar, getDate(), 106), 2)+6)/7,1) + '.bak'
BACKUP DATABASE [SysAdmin] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'SysAdmin backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO


IF OBJECT_ID('sp_Backup_Weekly_ZSM', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_Weekly_ZSM
GO
CREATE PROCEDURE [dbo].[sp_Backup_Weekly_ZSM]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_Sunday_Backups\XXX_ZSM_Sun' + LEFT((LEFT(convert(varchar, getDate(), 106), 2)+6)/7,1) + '.bak'
BACKUP DATABASE [ZSM] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'ZSM backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO


IF OBJECT_ID('sp_Backup_OD_CDB', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_OD_CDB
GO
CREATE PROCEDURE [dbo].[sp_Backup_OD_CDB]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_OnDemand_Backups\XXX_CDB_OD.bak'
BACKUP DATABASE [CDB] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'CDB backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO


IF OBJECT_ID('sp_Backup_OD_Log', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_OD_Log
GO
CREATE PROCEDURE [dbo].[sp_Backup_OD_Log]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_OnDemand_Backups\XXX_Log_OD.bak'
BACKUP DATABASE [Log] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'Log backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO


IF OBJECT_ID('sp_Backup_OD_SysAdmin', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_OD_SysAdmin
GO
CREATE PROCEDURE [dbo].[sp_Backup_OD_SysAdmin]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_OnDemand_Backups\XXX_SysAdmin_OD.bak'
BACKUP DATABASE [SysAdmin] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'SysAdmin backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO


IF OBJECT_ID('sp_Backup_OD_ZSM', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_OD_ZSM
GO
CREATE PROCEDURE [dbo].[sp_Backup_OD_ZSM]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_OnDemand_Backups\XXX_ZSM_OD.bak'
BACKUP DATABASE [ZSM] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'ZSM backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO


IF OBJECT_ID('sp_Backup_OD_ZSM_Photos', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_OD_ZSM_Photos
GO
CREATE PROCEDURE [dbo].[sp_Backup_OD_ZSM_Photos]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_OnDemand_Backups\XXX_ZSM_Photos_OD.bak'
BACKUP DATABASE [ZSM_Photos] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'ZSM_Photos backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO


IF OBJECT_ID('sp_Backup_OD_RMS', 'P') IS NOT NULL
    DROP PROCEDURE sp_Backup_OD_RMS
GO
CREATE PROCEDURE [dbo].[sp_Backup_OD_RMS]   
AS  
SET NOCOUNT ON;  
DECLARE @output varchar(500)
set @output = 'E:\ZSM_OnDemand_Backups\XXX_RMS_OD.bak'
BACKUP DATABASE [RMS] TO  DISK = @output WITH  INIT ,  NOUNLOAD ,  NAME = 'RMS backup',  NOSKIP ,  STATS = 10,  NOFORMAT
GO


