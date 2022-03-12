/* ==================================================================================
    Source File		:	v6.15.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Fri Feb 18 2022
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v6.15
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
	SET	version_no = 6.15,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

USE ZSM
GO

-- =============================================================================

DECLARE
	@dept_id	INTEGER;

INSERT	INTO	sewadar_types	VALUES	(	'G',	'Guide',	GetDate(),	'31-Dec-9999'	);

--INSERT	INTO	departments	
--			(	department_cd, department_nm, colour_id, has_sub_departments	)
--		VALUES
--			(	'GD', 'Guide', 1, 'No'	);
--	SET	@dept_id	=	SCOPE_IDENTITY ();

--INSERT INTO		departments_satsang_centres
--		VALUES	(	@dept_id, 6015, '%', 'No', 'No', 'Yes', 'No', GetDate(), '31-Dec-9999');


-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
