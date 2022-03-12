/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Mar 05 18:05 IST 2011
    Version			:	1.00
    Last updated	:	Mar 05, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade to v5.09/v5.10
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/
USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.09,			---- build / release 16382
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

UPDATE packages
	SET	version_no = 5.10,			---- build / release 16391
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

UPDATE packages
	SET	version_no = 5.11,			---- build / release 16398
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

UPDATE packages
	SET	version_no = 5.12,			---- build / release 16402
		version_dt = GetDate()
WHERE	package_id = 'ZSM'


GO
USE ZSM


-- =============================================================================
--	Changes dated 03-Mar-2011			-- [
-- =============================================================================

-- =============================================================================
--	Changes dated 03-Mar-2011			-- ]
-- =============================================================================

