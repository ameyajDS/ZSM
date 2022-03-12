/* ==================================================================================
    Source File		:	upgrade_v5.91.sql
    Author(s)		:	Ameya
    Started On		:	01 Oct, 2017
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 5.91,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO


-- =============================================================================
--		ZSM changes
-- =============================================================================



USE [ZSM]
GO

CREATE TYPE [dbo].[SewadarIdList] AS TABLE(
	[sewadar_id] [dbo].[sewadar_id] NOT NULL
)
GO

GRANT EXEC ON TYPE::[dbo].[SewadarIdList] TO ZSM_RDR 
GRANT EXEC ON TYPE::[dbo].[SewadarIdList] TO ZSM_ATM 
GRANT EXEC ON TYPE::[dbo].[SewadarIdList] TO ZSM_USR 
GRANT EXEC ON TYPE::[dbo].[SewadarIdList] TO ZSM_SUP 
GRANT EXEC ON TYPE::[dbo].[SewadarIdList] TO ZSM_ADM 
GRANT EXEC ON TYPE::[dbo].[SewadarIdList] TO ZSM_CU 
GRANT EXEC ON TYPE::[dbo].[SewadarIdList] TO ZSM_PC 

