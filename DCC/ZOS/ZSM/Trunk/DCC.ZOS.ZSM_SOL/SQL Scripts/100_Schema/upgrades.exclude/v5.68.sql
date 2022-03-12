/* ==================================================================================
    Source File		:	upgrade_v5.68.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	5 May, 2013
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.68
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
	SET	version_no = 5.68,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

ALTER	TABLE	generic_reports
	ADD report_main_ordering			VARCHAR (512)			NOT NULL
		Default	'IF ISNULL ({sewadars_registrations.sub_department_id}) THEN {departments.department_nm} ELSE {departments.department_nm} + '' ('' + {sub_departments.sub_department_nm} + '')'' ';

ALTER	TABLE	generic_reports
	ADD is_main_ascending_order			Boolean					NOT NULL	Default	'Yes';
                                                	
GO
-- =============================================================================
