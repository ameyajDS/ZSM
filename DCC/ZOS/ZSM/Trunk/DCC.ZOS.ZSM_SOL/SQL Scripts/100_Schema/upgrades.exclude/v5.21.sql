/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Mar 19 17:08 IST 2011
    Version			:	1.00
    Last updated	:	Mar 25, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade to v5.20
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/
USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.21,			---- build / release 16733
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================
--	Changes dated 4-Apr-2011			-- [
-- =============================================================================

INSERT INTO sewas_periods
		(	start_dt, finish_dt, sewa_id)
	SELECT	start_dt , finish_dt, sewa_id
	FROM	sewas y
	WHERE	NOT EXISTS	(	SELECT	TOP 1 1
							FROM	sewas_periods x
							WHERE	x.sewa_id = y.sewa_id
						)
	AND		y.attendance_marking IN ('Team-wise' ,'Arbitrary');


-- =============================================================================
--	Changes dated 4-Apr-2011			-- ]
-- =============================================================================
