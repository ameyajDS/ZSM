/* ==================================================================================
    Source File		:	upgrade_v5.56.sql
    Author(s)		:	Ameya Jadhav
    Started On		:	Sun Jul 29, 2012
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.56
				....
		
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
	Schema changes for new report called GenericGroupReportPortrait
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 5.56,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

ALTER TABLE generic_report_details
	ADD grouping_1				VARCHAR(50)		NULL;
GO

ALTER TABLE generic_report_details
	ADD grouping_2				VARCHAR(50)		NULL;
GO

ALTER TABLE generic_report_details
	ADD grouping_3				VARCHAR(50)		NULL;
GO

ALTER TABLE generic_report_headers
	ADD grouping_1_ascending	Boolean			NOT NULL	Default	'Yes';
GO

ALTER TABLE generic_report_headers
	ADD grouping_1_rendered		Boolean			NOT NULL	Default	'Yes';
GO

ALTER TABLE	generic_reports
	ADD	is_area					CHAR(1)			NOT NULL	DEFAULT	'N';
GO

ALTER TABLE	generic_reports
	ADD	area_id_prm				TINYINT			NOT NULL	Default 0;
GO

ALTER TABLE	generic_reports
	ADD	area_nm_prm				TINYINT			NOT NULL	Default 0;
GO

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SwdStsArea',	'Status - For Area Report');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SwdStsArea',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SwdStsArea',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SwdStsArea',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SwdStsArea',	'Retd'	);

-- =============================================================================
