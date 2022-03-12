/* ==================================================================================
    Source File		:	upgrade_v5.88.sql
    Author(s)		:	Jiten
    Started On		:	07 Jan, 2017
    Last updated	:	07 Jan, 2017
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		
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
	SET	version_no = 5.88,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

ALTER	TABLE	package_user_roles
	ADD	default_user_role_menu_id	user_role_menu_id	NULL
GO
	

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

-- =============================================================================

ALTER	TABLE	scanning_job_types
	ADD	check_in_sewadar_list	Boolean					NULL
GO

UPDATE	scanning_job_types
	SET	check_in_sewadar_list	=	'No'
WHERE	scanning_job_type_cd	=	'Increasing List';

UPDATE	scanning_job_types
	SET	check_in_sewadar_list	=	'Yes'
WHERE	scanning_job_type_cd	=	'Reducing List';


-- =============================================================================

-- vim:ts=4 ht=8 sw=4
