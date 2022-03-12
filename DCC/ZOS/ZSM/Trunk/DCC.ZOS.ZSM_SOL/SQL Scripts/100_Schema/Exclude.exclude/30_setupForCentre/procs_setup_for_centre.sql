/* ==================================================================================
    Source File		:	procs_setup_for_centre.sql
    Author(s)		:	Manish Saluja/Jitendra Loyal
    Started On		:	Thu Jan 19 16:02 IST 2012
    Last updated	:	May 23, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	JL
    Reviewed On		:	
    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------
		-- PREREQUISITE: Execute ..\10_procs_on_zsm_tables.sql
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		JL : 23-May-2012
			Updated for Indore
		JL : 18, 19, 24-Jan-2012
			Initial version
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE ZSM
GO

-- =============================================================================
-- Procedure _AddSeedsForNewSatsangCentre
--	It adds the seeds for a new Satsang Centre in satsang_centres_seeds table
--	for partitioned tables. Only for Centre (and not Zone).
--	It assumes seeds for Nagpur centre is already present in satsang_centres_seeds.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = '_AddSeedsForNewSatsangCentre' AND xtype = 'P')
	DROP PROCEDURE _AddSeedsForNewSatsangCentre
GO

CREATE PROCEDURE _AddSeedsForNewSatsangCentre
(
	@p_centre_code		CHAR (3),
	@p_table_nm			VARCHAR (50),
	@p_identity_action	CHAR (1),
	@p_seed_value		INT
)
WITH ENCRYPTION
AS
DECLARE @min_value		INT,
		@max_value		INT,
		@ngp_centre_id	INT,
		@mum_centre_id	INT,
		@centre_id		INT;
BEGIN

	SET @ngp_centre_id	= 6056;
	SET @mum_centre_id	= 6015;

	SELECT 	@centre_id = satsang_centre_id 
	FROM ZSM..satsang_centres_details
	WHERE 	centre_cd		=	@p_centre_code AND
			is_main_centre	=	'Yes'

--	PRINT @p_table_nm;

	SELECT @min_value = (MAX(max_value) + 1) FROM ZSM..satsang_centres_seeds 
	WHERE object_id = @p_table_nm;
	IF (@min_value IS NOT NULL)
	BEGIN
		SELECT @max_value = @min_value + (max_value - min_value) FROM ZSM..satsang_centres_seeds
		WHERE object_id = @p_table_nm AND satsang_centre_id = @ngp_centre_id;

--		PRINT @min_value;
--		PRINT @max_value;

		INSERT INTO ZSM..satsang_centres_seeds (satsang_centre_id, object_id, min_value, max_value, seed_value, is_zone)
			VALUES (@centre_id, @p_table_nm, @min_value, @max_value, @min_value, 'No');
	END
END 
GO

-- =============================================================================
-- Procedure to setup an Application for a Centre at the Zonal Office
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_SetupForCentre' AND xtype = 'P')
	DROP PROCEDURE _SetupForCentre
GO

CREATE PROCEDURE _SetupForCentre
(
	@p_src_centre_id 		VARCHAR(100),
	@p_src_applctn_id 		CHAR(7),
	@p_centre_nm			VARCHAR(100),
	@p_centre_cd			CHAR(3),
	@p_centre_alphabet		CHAR(1),
	@p_centre_id 			VARCHAR(100),
	@p_application_id 		CHAR(7),
	@p_application_nm 		VARCHAR(60)
)
WITH ENCRYPTION
AS
DECLARE @v_implementation_dt 	SMALLDATETIME;
BEGIN

	SET @v_implementation_dt 	= GETDATE();
	
	--====================================================================================
	--satsang_centres_details
	--=======================
	UPDATE	satsang_centres_details
		SET	is_main_centre	=	'Yes',
			centre_nm		=	@p_centre_nm,
			centre_alphabet	=	@p_centre_alphabet,
			centre_cd		=	@p_centre_cd
	WHERE	satsang_centre_id	=	@p_centre_id;
	
	--====================================================================================
	
	--departments_satsang_centres, sub_departments_satsang_centres
	--============================================================
	INSERT	INTO	departments_satsang_centres
			(	department_id, satsang_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, effective_from	)
		SELECT	department_id, @p_centre_id, genders_allowed, is_common_roster, is_generic, is_weekly, sub_department_mandatory, '01-Jan-1980'
		FROM	departments_satsang_centres	x
		WHERE	satsang_centre_id	=	@p_src_centre_id
		AND		GETDATE	()	BETWEEN	effective_from AND	effective_till
		AND		EXISTS	(	SELECT	1
							FROM	departments	s
							WHERE	s.department_id	=	x.department_id
							AND		department_cd	NOT IN	('OF'	)			---- Nam Dan needs to be enabled at Indore
						);
	
	INSERT	INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id, effective_from	)
		SELECT	sub_department_id, @p_centre_id, '01-Jan-1980'
		FROM	sub_departments_satsang_centres x
		WHERE	satsang_centre_id	=	@p_src_centre_id
		AND		GETDATE	()	BETWEEN	effective_from AND	effective_till
		/*
		AND		EXISTS	(	SELECT	1
							FROM	sub_departments	s
								JOIN	departments	d
									ON	(	s.department_id	=	d.department_id	)
							WHERE	s.sub_department_id	=	x.sub_department_id
							AND	(	(	department_nm	=	'Administration'	AND	sub_department_nm	=	'Office'	)
	--							OR	(	department_nm	=	'Canteen'			AND	sub_department_nm
	--																	IN	(	'Coupons', 'Distribution', 'Kitchen', 'Stores'	)	)			--- 'Cold Drinks'
								OR	(	department_nm	=	'Construction'		)		--  3 sub-departments
	--							OR	(	department_nm	=	'Langar'			AND	sub_department_nm
	--																	IN	(	'Jatha 01', 'Jatha 02', 'Jatha 03', 'Jatha 04', 'Jatha 05', 'Jatha 06'	)	)
								OR	(	department_nm	=	'Pandal'		)		--  1 sub-department
	--							OR	(	department_nm	=	'Sanitation'		AND	sub_department_nm	=	'Safai'	)
								OR	(	department_nm	=	'Sewa Samiti'		)		--  3 sub-departments
	--							OR	(	department_nm	=	'Sound & TV'		)		--  1 sub-department
	--							OR	(	department_nm	=	'Traffic'			AND	sub_department_nm	=	'Transport'	)
								)
						);
	IF (@@ROWCOUNT !=8)
		PRINT	'Sub-departments should be 8';
		*/
	--====================================================================================
	
	/* -----
	--departments, sub-departments
	--============================
	INSERT	INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		SELECT	department_id, 'J12', 'Jatha 12'
		FROM	departments
		WHERE	department_nm	=	'Canteen'
	IF (@@ROWCOUNT != 1)
		PRINT 'Sub-Department Jatha 12 not created'
	
	INSERT	INTO	sub_departments
			(	department_id, sub_department_cd, sub_department_nm	)
		SELECT	department_id, 'J13', 'Jatha 13'
		FROM	departments
		WHERE	department_nm	=	'Canteen'
	IF (@@ROWCOUNT != 1)
		PRINT 'Sub-Department Jatha 13 not created'
	
	INSERT	INTO	sub_departments_satsang_centres
			(	sub_department_id, satsang_centre_id	)
		SELECT	sub_department_id, @p_centre_id
		FROM	sub_departments	a
			JOIN	departments	b
				ON	(	a.department_id = b.department_id	)
		WHERE	department_nm	=	'Canteen'
		AND		sub_department_nm	IN	(	'Jatha 11', 'Jatha 12', 'Jatha 13', 'Jatha 14'	);
	IF (@@ROWCOUNT != 4)
		PRINT	'Sub-departments should be 4';
	----- */
	
	--====================================================================================
	--satsang_centre_seeds
	--====================
	EXEC _Create_ZSM_tables_table
	EXEC _ExecProcOn_ZSMTables_AtZone @p_centre_cd, '_AddSeedsForNewSatsangCentre', 'Yes', '%', 'No', 'P'
	DROP TABLE _ZSM_tables
	--====================================================================================
	
	--[[Insert into Application
	EXEC SysAdmin..insApplication 
	@application_id = @p_application_id, 
	@application_nm = @p_application_nm, 
	@package_id = 'ZSM', @database_nm = 'ZSM', 
	@implementation_dt = @v_implementation_dt, 
	@error_log_level = 'Error', 
	@log_file_size_in_mb = '10',
	@report_title = NULL,
	@report_footer = NULL,
	@path_1 = NULL,
	@path_2 = NULL,
	@path_3 = NULL,
	@argument_1 = @p_centre_id,
	@argument_2 = @p_centre_nm,
	@argument_3 = 'No',			--- Whether the Export to Excel/ PDF is to be enabled
	@argument_4 = NULL, 
	@argument_5 = NULL;
	
	INSERT INTO SysAdmin..application_screen_audits
				(application_id, screen_id, is_insert_logged, is_update_logged, is_delete_logged, is_action_logged, is_print_logged, is_update_changes_logged, is_delete_changes_logged)
		SELECT	@p_application_id, screen_id, is_insert_logged, is_update_logged, is_delete_logged, is_action_logged, is_print_logged, is_update_changes_logged, is_delete_changes_logged
		FROM SysAdmin..application_screen_audits
		WHERE	application_id	=	@p_src_applctn_id;
	
	--====================================================================================
	--	User Privileges as per the Source Application
	--====================================================================================
	INSERT INTO	sysadmin..user_privileges
			(	user_id, user_role_id, application_id, is_backup_allowed	)
		SELECT	user_id, user_role_id, @p_application_id, is_backup_allowed
		FROM	sysadmin..user_privileges
		WHERE	application_id	=	@p_src_applctn_id;
	
	--====================================================================================
END

GO
