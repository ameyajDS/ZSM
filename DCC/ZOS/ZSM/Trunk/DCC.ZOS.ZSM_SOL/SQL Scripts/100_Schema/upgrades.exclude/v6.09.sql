/* ==================================================================================
    Source File		:	v6.09.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Wed Dec 25 12:09 IST 2019
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v6.09
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
	SET	version_no = 6.09,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================

ALTER	TABLE	scanning_jobs
	DROP	CONSTRAINT	ScanningJobs_CK_IsConcluded_IsClosed_SewadarListId
GO

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
