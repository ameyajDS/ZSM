/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Feb 10 17:26 IST 2011
    Version			:	1.00
    Last updated	:	Feb 10, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade to v5.03 (current version is v5.02)
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/
USE SysAdmin
GO


UPDATE packages
	SET	version_no = '5.03',
		version_dt = '12-Feb-2011'
WHERE	package_id = 'ZSM'
-- =============================================================================
--	Changes dated 10-Feb-2011			-- [
-- =============================================================================
USE ZSM
Go

ALTER	TABLE	team_wise_daily_attendance
	DROP CONSTRAINT	TeamWiseDailyAttendance_FK_SewaTeamID_AttendanceDt;
GO

-- =============================================================================
--	Changes dated 10-Feb-2011			-- ]
-- =============================================================================
