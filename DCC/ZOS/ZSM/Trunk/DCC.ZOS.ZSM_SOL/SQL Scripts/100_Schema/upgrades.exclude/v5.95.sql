/* ==================================================================================
    Source File		:	upgrade_v5.95.sql
    Author(s)		:	Ameya
    Started On		:	4th March 2018
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
	SET	version_no = 5.95,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO


-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

ALTER DATABASE ZSM
SET COMPATIBILITY_LEVEL = 100


CREATE TYPE [dbo].[SewadarBadgeRecord] AS TABLE
(
	scanning_sub_job_id		scanning_job_id	NOT NULL,
	controlling_dt			smalldatetime NOT NULL,
	satsang_centre_id		satsang_centre_id NOT NULL,
	sewadar_grno 			sewadar_grno NOT NULL,
	scannedDTM				datetime	NOT NULL
)

GRANT EXEC ON TYPE::[dbo].[SewadarBadgeRecord] TO ZSM_RDR 
GRANT EXEC ON TYPE::[dbo].[SewadarBadgeRecord] TO ZSM_ATM 
GRANT EXEC ON TYPE::[dbo].[SewadarBadgeRecord] TO ZSM_USR 
GRANT EXEC ON TYPE::[dbo].[SewadarBadgeRecord] TO ZSM_SUP 
GRANT EXEC ON TYPE::[dbo].[SewadarBadgeRecord] TO ZSM_ADM 
GRANT EXEC ON TYPE::[dbo].[SewadarBadgeRecord] TO ZSM_CU 
GRANT EXEC ON TYPE::[dbo].[SewadarBadgeRecord] TO ZSM_PC 


GO