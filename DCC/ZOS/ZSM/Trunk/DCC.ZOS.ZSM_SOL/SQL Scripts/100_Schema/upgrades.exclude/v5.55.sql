/* ==================================================================================
    Source File		:	upgrade_v5.55.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Wed Jun 13, 2012
    Last updated	:	Jun 13, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.55
				....System codes added for Default Values of Country, State, District, Sewa Samiti 
					and Security Approvers for Indore
		This should not be run at other centres as these defaults are significant for Mumbai deployment only.
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
	SET	version_no = 5.55,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

	--- Following defaults are used for addresses in Sewadars Details Screen
			--- -Indore Centre
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'IDflCntry',	'Default - Country ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'IDflCntry',	1	);		-- India

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'IDflState',	'Default - State ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'IDflState',	123	);		-- Madhya Pradesh

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'IDflDstrct',	'Default - District ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'IDflDstrct',	315	);		-- Indore

			--- -Mumbai Centre
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'MDflCntry',	'Default - Country ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'MDflCntry',	1	);		-- India

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'MDflState',	'Default - State ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'MDflState',	124	);		-- Maharashtra

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'MDflDstrct',	'Default - District ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'MDflDstrct',	346	);		-- Mumbai

			--- -Kolkata Centre
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'KDflCntry',	'Default - Country ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'KDflCntry',	1	);		-- India

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'KDflState',	'Default - State ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'KDflState',	115	);		-- West Bengal

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'KDflDstrct',	'Default - District ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'KDflDstrct',	544	);		-- Kolkata

			--- -Nagpur Centre
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'NDflCntry',	'Default - Country ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'NDflCntry',	1	);		-- India

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'NDflState',	'Default - State ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'NDflState',	124	);		-- Maharashtra

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'NDflDstrct',	'Default - District ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'NDflDstrct',	356	);		-- Nagpur

	--- Following defaults are used in Sewadars Information Screen
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'IDflSSApr',	'Default - Sewa Samiti Approver');
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'IDflSecApr',	'Default - Security Approver');

GO

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
