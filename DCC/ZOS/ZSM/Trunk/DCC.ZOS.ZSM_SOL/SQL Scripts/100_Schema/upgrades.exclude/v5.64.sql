/* ==================================================================================
    Source File		:	upgrade_v5.64.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	24 Feb, 2013
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.64
				....
		
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
	SET	version_no = 5.64,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

UPDATE	sewadars_details
	SET	has_hypertension = 'No'
WHERE	has_hypertension = 'No';

UPDATE	sewadars_details
	SET	has_skin_problem = 'No'
WHERE	has_skin_problem = 'No';

UPDATE	sewadars_details
	SET	has_epillepsy = 'No'
WHERE	has_epillepsy = 'No';

UPDATE	sewadars_details
	SET	is_diabetic = 'No'
WHERE	is_diabetic = 'No';

GO
-- =============================================================================
