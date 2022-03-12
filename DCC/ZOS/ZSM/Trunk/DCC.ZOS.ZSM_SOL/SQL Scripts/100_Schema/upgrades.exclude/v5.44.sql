/* ==================================================================================
    Source File		:	upgrade_v5.43.sql.exclude
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat Dec 30 21:49 IST 2011
    Version			:	1.00
    Last updated	:	Dec 30, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.43
				* System information code SttsRglSwd has been added that allows the Status of Sewadar
				than can be allowed in Sewadars Information Screen.
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
	SET	version_no = 5.44,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================
--	Set the Information Codes and Values for Status that is to be allowed to be used in Sewadars Information Screen
--	for Regular Sewadars
-- =============================================================================
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsInaSrc',	'Inactive Source Sewadars');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	
SELECT 'SttsInaSrc', ss.sewadar_status_cd FROM sewadar_status ss
LEFT OUTER JOIN system_information_values siv ON siv.system_info_cd = 'SttsActv' AND siv.system_info_value = ss.sewadar_status_cd
WHERE siv.system_info_cd IS NULL


-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
