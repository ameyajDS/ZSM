/* ==================================================================================
    Source File		:	upgrade_v5.41.sql.exclude
    Author(s)		:	Jitendra Loyal
    Started On		:	Mon Dec 19 14:02 IST 2011
    Last updated	:	Dec 19, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.41
			Status of Sewadars Particulars screen is managed using System Information Code
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
	SET	version_no = 5.41,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM

-- =============================================================================
--	Set the Information Codes and Values for different uses of Status 
-- =============================================================================

DELETE FROM		system_information_values	
WHERE	system_info_cd	IN 	(	'SttsPrtclr'	);

DELETE FROM		system_information_codes
WHERE	system_info_cd	IN 	(	'SttsPrtclr'	);

-- =============================================================================

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsPrtclr',	'Status - Sewadar Particular');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPrtclr',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPrtclr',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPrtclr',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPrtclr',	'UnFt'	);

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
