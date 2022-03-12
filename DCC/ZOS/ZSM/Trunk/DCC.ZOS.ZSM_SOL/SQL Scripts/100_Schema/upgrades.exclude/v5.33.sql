/* ==================================================================================
    Source File		:	upgrade_v5.33.sql.exclude
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat Dec 10 18:05 IST 2011
    Version			:	1.00
    Last updated	:	Dec 17, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.33
			..... In the lookup of Sewadars, Sewadars with appropriate Status should only be allowed.
				  The script below configures the Status for various purposes.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
	JL : 17-Dec-2011
		System information codes for SttsTrn and SttsOpen added.
	JL : 15-Dec-2011
		System information code SttsTrnsfr dropped, and SttsScrTrf and SttsSysTrf introduced to
		differentiate between the Transfers allowed from Screen and transfers allowed within System
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.33,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM

-- =============================================================================
--	Set the Information Codes and Values for different uses of Status 
-- =============================================================================

DELETE FROM		system_information_values	
WHERE	system_info_cd	IN 	(	'SttsTrn', 'SttsOpn', 'SttsRefUse', 'SttsApprv', 'SttsTrnsfr', 'SttsAttnd', 'SttsBdgPrn', 'SttsBdgTrnOpn', 'SttsSwSmry', 'SttsScrTrf', 'SttsSysTrf'	);

DELETE FROM		system_information_codes
WHERE	system_info_cd	IN 	(	'SttsTrn', 'SttsOpn', 'SttsRefUse', 'SttsApprv', 'SttsTrnsfr', 'SttsAttnd', 'SttsBdgPrn', 'SttsBdgTrnOpn', 'SttsSwSmry', 'SttsScrTrf', 'SttsSysTrf'	);

-- =============================================================================

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsOpn',	'Status - Open Sewadar');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsOpn',	'Open'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsTrn',	'Status - Trainee Sewadar');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'Sttstrn',	'Trn'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsRefUse',	'Status - Ref Use');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRefUse',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRefUse',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRefUse',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRefUse',	'Retd'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRefUse',	'Shft'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsApprv',	'Status - Approver Use');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsApprv',	'Perm'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsScrTrf',	'Status - Transfers from Screen');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsScrTrf',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsScrTrf',	'Temp'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsSysTrf',	'Status - Transfers in System ');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSysTrf',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSysTrf',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSysTrf',	'Trn'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSysTrf',	'Open'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsAttnd',	'Status - Attendance Use');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsAttnd',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsAttnd',	'Temp'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsSwSmry',	'Status - Sewa Summary Use');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'Retd'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'UnFt'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'Left'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'Shft'	);

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
