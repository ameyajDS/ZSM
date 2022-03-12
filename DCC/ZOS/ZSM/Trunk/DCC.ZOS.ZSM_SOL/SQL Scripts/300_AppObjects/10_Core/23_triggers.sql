/* ==================================================================================
    Source File		:	23_trigger.sql
    Author(s)		:	Jitendra Loyal (JL) / Sukhdev B. Darira (SB)
    Started On		:	Sun Nov 28 01:00:00 IST 2010
    Version			:	0.15
    Last updated	:	Jan 10, 2015
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------

    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
     JL : 10-Jan-2015
	 	* Bug fixes in triggers arbitrary_daily_presences_j_iu and arbitrary_shift_presences_k_iu.
	 	* Triggers arbitrary_daily_presences_j_iu and arbitrary_shift_presences_k_iu modified so that error condition is raised for such
		  rows where the recording is not scanned.
		* Instead of RaiseErrorMessage, RaiseBigErrorMessage has been used so that the complete message is displayed.
     AK : 23-Oct-2014
	 	* Trigger generic_sewadar_lists_a_iu moved to 25_triggers_scanning.sql
     AK : 03-Oct-2014
	 	* Trigger arbitrary_daily_presences_j_iu and arbitrary_shift_presences_k_iu added
     JL : 03-Oct-2014
	 	* Trigger sewa_team_wise_sewadars_f_iu fixed as it was not considering Sewa.
     JL : 29-Jun-2014
	 	* Trigger sewa_team_wise_sewadars_e_iu has been added.
     JL : 10-Jan-2014
	 	* Trigger arbitrary_shift_presences_j_iu has been added.
     JL : 24-Sep-2013
	 	* All triggers after raising the error, rollback the transaction.
	 RB : 0.12 : 31-Jan-2012
		* Trigger team_wise_daily_attendance_g_iu has been added to ensure that the exemption exists in sewa_exemptions_applicable_sewas
		  when its sewa applicability is true.
	 JL : 0.11 : 30-Dec-2011
		* Trigger sewadar_wise_sewa_summaries_c_iu has been changed so that (current_satsang_centre_id, current_sewadar_grno)
		  matches with satsang_centre_id, sewadar_grno when the Attendance Marking is Summary (this is to allow
		  Summarisation for other Sewas by the System).
	 JL : 0.10 : 18-Dec-2011
		* Trigger sewadar_wise_sewa_summaries_d_iu has been dropped which ensured that the sewadar_status was one of specified in System Info Code SttsActv.
	 JL : 0.09 : 17-Dec-2011
		* Trigger sewadars_registrations_p_iu changed so that it should function only when location_district_id is specified.
	 JL : 0.08 : 15-Dec-2011
		* Trigger sewadars_transfers_b_iu has been changed to use System Information Code SttsSysTrf instead of SttsActv
	 JL : 0.07 : 11-Dec-2011
		* Trigger sewadars_registrations_p_iu has been added to ensure that Location District exists in CDB's districts_or_cities table.
	 JL/AK : 0.06 : 10-Dec-2011
		* When responsibility changes, the responsibility date should be later than the previous one.
		  Trigger sewadars_registrations_l_u has been fixed thus.
     SB : 0.05 : 11-Jan-2011
		*  Rectified the triggers, that check the SEWA is locked, and do not allow INSERT, UPDATE or DELETE
     SB : 0.04 : 05-Jan-2011
		*  Rectified the incorrect table name (qualifications_qlfctn_subjects) in the trigger sewadars_qualifications_b_iu 
     SB : 0.03 : 02-Jan-2011
		*  Attempted to rectify the bugs in the triggers based on a LEFT OUTER JOIN concept
     SB : 0.02 : 01-Jan-2011
		*  Attempted to rectify the bugs in the triggers on the table SEWADAR_WISE_SEWA_SUMMARIES
     SB : 0.01 : 28-Nov-2010
		*  First Draft
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--	Table 	SEWADARS
--	Trigger ensures that Initiation_Place_ID exists in CDB (initiation_places)
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_a_iu
GO

CREATE TRIGGER sewadars_a_iu ON sewadars
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
DECLARE
	@v_faults							VARCHAR (500),
	@v_left								TINYINT
BEGIN
	SET		@v_faults = ''

	SELECT	@v_faults = CAST (i.initiation_place_id AS VARCHAR) + ', ' + @v_faults
	FROM 	inserted i 
		LEFT OUTER JOIN	CDB..initiation_places inpl
			ON 	(	inpl.place_id	= i.initiation_place_id	)					
	WHERE	i.initiation_place_id	IS NOT	NULL
	AND		inpl.place_id 			IS 		NULL

	IF	(	LEN (@v_faults) > 0	)
	BEGIN
		SET	@v_left		= ((50 + (LEN(@v_faults)-1) - ABS(50 - (LEN(@v_faults)-1))) / 2)

		IF	(	@v_left	= 50	)
			SET	@v_faults = LEFT (@v_faults, 51 - (CHARINDEX (',', REVERSE (@v_faults)))) + '...'		
		ELSE
			SET	@v_faults	= LEFT (@v_faults, @v_left)

		EXEC SysAdmin..RaiseBigErrorMessage 'RefInt2', NULL, @v_faults, 'Initiation Place', NULL
		ROLLBACK
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	SEWADARS
--	Trigger ensures that Patron_ID exists in CDB (patrons)
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_b_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_b_iu
GO

CREATE TRIGGER sewadars_b_iu ON sewadars
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
DECLARE
	@v_faults							VARCHAR (500),
	@v_left								TINYINT
BEGIN
	SET		@v_faults = ''

	SELECT	@v_faults = CAST (i.initiation_by AS VARCHAR) + ', ' + @v_faults
	FROM 	inserted i 
		LEFT OUTER JOIN	CDB..patrons ptrn
			ON 	(	ptrn.patron_id	= i.initiation_by	)					
	WHERE	i.initiation_by		IS 	NOT	NULL
	AND		ptrn.patron_id 	IS 		NULL

	IF	(	LEN (@v_faults) > 0	)
	BEGIN
		SET	@v_left		= ((50 + (LEN(@v_faults)-1) - ABS(50 - (LEN(@v_faults)-1))) / 2)

		IF	(	@v_left	= 50	)
			SET	@v_faults = LEFT (@v_faults, 51 - (CHARINDEX (',', REVERSE (@v_faults)))) + '...'		
		ELSE
			SET	@v_faults	= LEFT (@v_faults, @v_left)

		EXEC SysAdmin..RaiseBigErrorMessage 'RefInt2', NULL, @v_faults, 'Patron', NULL
		ROLLBACK
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	SEWADARS
--	Trigger ensures that the sewadar_status.is_global = Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_c_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_c_iu
GO

CREATE TRIGGER sewadars_c_iu ON sewadars
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewadar_status	swst
							ON 	(	swst.sewadar_status_cd	= i.global_sewadar_status_cd	)
					WHERE	swst.is_global			= 'Yes'
					AND		swst.sewadar_status_cd	IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar Status', 'Global', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	SEWADARS
--	Trigger ensures that status and status date change together (only one of these cannot be changed)
--		Hence, it is only an UPDATE event trigger.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_d_u' AND xtype = 'TR')
	DROP TRIGGER sewadars_d_u
GO

CREATE TRIGGER sewadars_d_u ON sewadars
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	DECLARE
		@dtm	DATETIME;

	SET	@dtm	=	GetDate();

	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	deleted	d
							ON 	(	d.sewadar_id	= i.sewadar_id	)
					--	values can be changing from NULL to NOT NULL or vice versa, hence COALESCE
					WHERE	(	
								(	COALESCE (i.global_sewadar_status_cd,'X')			!= 	COALESCE (d.global_sewadar_status_cd,'X')	
								AND	COALESCE (i.global_sewadar_status_dt, @dtm )	 =	COALESCE (d.global_sewadar_status_dt, @dtm )
								)
							OR
								(	COALESCE (i.global_sewadar_status_cd,'X')			 = 	COALESCE (d.global_sewadar_status_cd,'X')	
								AND	COALESCE (i.global_sewadar_status_dt, @dtm ) 	!=	COALESCE (d.global_sewadar_status_dt, @dtm )
								)
							)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Status Code & Status Date', 'Changed Together', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	SEWADARS
--	Trigger ensures that status change is as per sewadar_status_transitions
--		Hence, it is only an UPDATE event trigger.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_e_u' AND xtype = 'TR')
	DROP TRIGGER sewadars_e_u
GO

CREATE TRIGGER sewadars_e_u ON sewadars
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	deleted	d
							ON 	(	d.sewadar_id	= i.sewadar_id	
								--	to ensure that the sewadar status code is actually changing, if not, no need to check the validity of transitions
								AND	COALESCE (d.global_sewadar_status_cd,'X')	!= COALESCE (i.global_sewadar_status_cd,'X')	
								)
						LEFT OUTER JOIN	sewadar_status_valid_transitions	ssvt
						--	doing COALESCE operations to ensure status transitions from NULL or to NULL, do not result in an error
							ON	(	COALESCE (d.global_sewadar_status_cd,'X')	= COALESCE (ssvt.old_sewadar_status_cd,'X')
								AND	COALESCE (i.global_sewadar_status_cd,'X')	= COALESCE (ssvt.new_sewadar_status_cd,'X')
								)
					--	only when both the fields are NULL, then the record is not present, since both columns are NULLable
					WHERE	ssvt.new_sewadar_status_cd	IS	NULL
					AND		ssvt.old_sewadar_status_cd	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Status Code', 'As per Valid Status Transitions', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	SEWADARS_QUALIFICATIONS
--	Trigger ensures that Qualification_ID exists in CDB (qualifications)
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_qualifications_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_qualifications_a_iu
GO

CREATE TRIGGER sewadars_qualifications_a_iu ON sewadars_qualifications
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
DECLARE
	@v_faults							VARCHAR (500),
	@v_left								TINYINT
BEGIN
	SET		@v_faults = ''

	SELECT	@v_faults = CAST (i.qualification_id AS VARCHAR) + ', ' + @v_faults
	FROM 	inserted i 
		LEFT OUTER JOIN	CDB..qualifications qlfc
			ON 	(	qlfc.qualification_id	= i.qualification_id	)					
	WHERE	i.qualification_id		IS NOT	NULL
	AND		qlfc.qualification_id 	IS 		NULL

	IF	(	LEN (@v_faults) > 0	)
	BEGIN
		SET	@v_left		= ((50 + (LEN(@v_faults)-1) - ABS(50 - (LEN(@v_faults)-1))) / 2)

		IF	(	@v_left	= 50	)
			SET	@v_faults = LEFT (@v_faults, 51 - (CHARINDEX (',', REVERSE (@v_faults)))) + '...'		
		ELSE
			SET	@v_faults	= LEFT (@v_faults, @v_left)

		EXEC SysAdmin..RaiseBigErrorMessage 'RefInt2', NULL, @v_faults, 'Qualification', NULL
		ROLLBACK
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	SEWADARS_QUALIFICATIONS
--	Trigger ensures that Subject exists in CDB (Qualification_Subjects), as a composite foreign key with qualification id (qualifications_qlfctn_subjects)
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_qualifications_b_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_qualifications_b_iu
GO

CREATE TRIGGER sewadars_qualifications_b_iu ON sewadars_qualifications
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
DECLARE
	@v_faults							VARCHAR (500),
	@v_left								TINYINT
BEGIN
	SET		@v_faults = ''

	SELECT	@v_faults = CAST (i.qualification_id AS VARCHAR) + ', ' + @v_faults
	FROM 	inserted i 
		LEFT OUTER JOIN	CDB..qualifications_qlfctn_subjects qlsb
			ON 	(	qlsb.qualification_id	= i.qualification_id	
				AND	qlsb.qlfctn_subject_id	= i.qlfctn_subject_id	
				)					
	WHERE	i.qlfctn_subject_id		IS NOT	NULL
	AND		qlsb.qlfctn_subject_id	IS 		NULL
				
			

	IF	(	LEN (@v_faults) > 0	)
	BEGIN
		SET	@v_left		= ((50 + (LEN(@v_faults)-1) - ABS(50 - (LEN(@v_faults)-1))) / 2)

		IF	(	@v_left	= 50	)
			SET	@v_faults = LEFT (@v_faults, 51 - (CHARINDEX (',', REVERSE (@v_faults)))) + '...'		
		ELSE
			SET	@v_faults	= LEFT (@v_faults, @v_left)

		EXEC SysAdmin..RaiseBigErrorMessage 'RefInt2', NULL, @v_faults, 'Subject', NULL
		ROLLBACK
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	SEWADARS_SKILLS
--	Trigger ensures that skill_id exists in CDB..skills
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_skills_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_skills_a_iu
GO

CREATE TRIGGER sewadars_skills_a_iu ON sewadars_skills
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
DECLARE
	@v_faults							VARCHAR (500),
	@v_left								TINYINT
BEGIN
	SET		@v_faults = ''

	SELECT	@v_faults = CAST (i.skill_id AS VARCHAR) + ', ' + @v_faults
	FROM 	inserted i 
		LEFT OUTER JOIN	CDB..skills skls
			ON 	(	skls.skill_id	= i.skill_id	)					
	WHERE	i.skill_id		IS NOT	NULL
	AND		skls.skill_id 	IS 		NULL

	IF	(	LEN (@v_faults) > 0	)
	BEGIN
		SET	@v_left		= ((50 + (LEN(@v_faults)-1) - ABS(50 - (LEN(@v_faults)-1))) / 2)

		IF	(	@v_left	= 50	)
			SET	@v_faults = LEFT (@v_faults, 51 - (CHARINDEX (',', REVERSE (@v_faults)))) + '...'		
		ELSE
			SET	@v_faults	= LEFT (@v_faults, @v_left)

		EXEC SysAdmin..RaiseBigErrorMessage 'RefInt2', NULL, @v_faults, 'Skill', NULL
		ROLLBACK
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that the satsang_centre_id has is_main_centre set to Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_a_iu
GO

CREATE TRIGGER sewadars_registrations_a_iu ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	satsang_centres_details	scdt
							ON 	(	scdt.satsang_centre_id	= i.satsang_centre_id	
								AND scdt.is_main_centre		= 'Yes'
								)
					WHERE	scdt.satsang_centre_id			IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Satsang Centre', 'a Main Centre', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that sub_department_id is specified when departments.sub_department_mandatory = Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_b_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_b_iu
GO

CREATE TRIGGER sewadars_registrations_b_iu ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	departments_satsang_centres		dpsc
							ON 	(	dpsc.satsang_centre_id	= i.satsang_centre_id	
								AND	dpsc.department_id		= i.department_id
								)
					WHERE	dpsc.sub_department_mandatory	= 'Yes'
					AND		i.sub_department_id				IS NULL	
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ValueReqd', NULL,'Sub Department', NULL, NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that department_id is same as it is in sub_departments
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_c_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_c_iu
GO

CREATE TRIGGER sewadars_registrations_c_iu ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sub_departments		sbdp
							ON 	(	sbdp.sub_department_id	= i.sub_department_id
								AND	sbdp.department_id		= i.department_id
								)
					--	sub department is present (NOT NULL)
					--	but its department is not present in the sub departments table
					WHERE	i.sub_department_id		IS NOT	NULL
					AND		sbdp.sub_department_id	IS 		NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'InvalidEntry', NULL,'Dept / Sub Dept', NULL, NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that in an update, the changed date is later than the previous one.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_d_u' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_d_u
GO

CREATE TRIGGER sewadars_registrations_d_u ON sewadars_registrations
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	deleted	d
							ON 	(	i.satsang_centre_id	= d.satsang_centre_id
								AND	i.sewadar_grno		= d.sewadar_grno
								)
					WHERE	i.department_dt	<	d.department_dt
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Department Date', 'later than the previous one', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that the sewadar_status.is_global = No
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_e_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_e_iu
GO

CREATE TRIGGER sewadars_registrations_e_iu ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewadar_status	swst
							ON 	(	swst.sewadar_status_cd	= i.sewadar_status_cd	)
					WHERE	swst.is_global			= 'No'
					AND		swst.sewadar_status_cd	IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar Status', 'Not Global', NULL
			ROLLBACK
			RETURN
		END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that if sewadars.global_sewadar_status_cd is NOT NULL, status can not be changed
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_f_u' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_f_u
GO

CREATE TRIGGER sewadars_registrations_f_u ON sewadars_registrations
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	deleted	d
							ON	(	i.satsang_centre_id	 = 	d.satsang_centre_id
								AND	i.sewadar_grno		 = 	d.sewadar_grno
								AND	i.sewadar_status_cd	!=	d.sewadar_status_cd	
								)
						JOIN	sewadars	swds
							ON	(	swds.sewadar_id		 = 	i.sewadar_id	
								AND	swds.global_sewadar_status_cd	IS NOT	NULL
								)		
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Sewadar Status', 'changed', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that status and status date change together (only one of these cannot be changed)
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_g_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_g_iu
GO

CREATE TRIGGER sewadars_registrations_g_iu ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	DECLARE
		@dtm	DATETIME;

	SET	@dtm	=	GetDate();

	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	deleted	d
							ON 	(	i.satsang_centre_id	 = 	d.satsang_centre_id
								AND	i.sewadar_grno		 = 	d.sewadar_grno
								)
					--	values can be changing from NULL to NOT NULL or vice versa, hence COALESCE
					WHERE	(	
								(	COALESCE (i.sewadar_status_cd,'X')			!= 	COALESCE (d.sewadar_status_cd,'X')	
								AND	COALESCE (i.sewadar_status_dtm, @dtm ) =	COALESCE (d.sewadar_status_dtm, @dtm )
								)
							OR
								(	COALESCE (i.sewadar_status_cd,'X')			 = 	COALESCE (d.sewadar_status_cd,'X')	
								AND	COALESCE (i.sewadar_status_dtm, @dtm ) !=	COALESCE (d.sewadar_status_dtm, @dtm )
								)
							)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Status Code & Status Date', 'Changed Together', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that status change is as per sewadar_status_transitions
--		ASSUMPTION: it will be applicable only during UPDATE event
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_h_u' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_h_u
GO

CREATE TRIGGER sewadars_registrations_h_u ON sewadars_registrations
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	deleted	d
							ON 	(	i.satsang_centre_id	 = 	d.satsang_centre_id
								AND	i.sewadar_grno		 = 	d.sewadar_grno	
								AND	i.sewadar_status_cd	!=	d.sewadar_status_cd
								)
						LEFT OUTER JOIN	sewadar_status_valid_transitions	ssvt
						--	doing COALESCE operations to ensure status transitions from NULL, or to NULL, do not result in an error
							ON	(	COALESCE (d.sewadar_status_cd,'X')	= COALESCE (ssvt.old_sewadar_status_cd,'X')
								AND	COALESCE (i.sewadar_status_cd,'X')	= COALESCE (ssvt.new_sewadar_status_cd,'X')
								)
					--	only when both the fields are NULL, then the record is not present, since both columns are NULLable
					WHERE	ssvt.new_sewadar_status_cd	IS	NULL
					AND		ssvt.old_sewadar_status_cd	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Status Code', 'As per Valid Status Transitions', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that it does not result in multiple sewadar_grno for sewadar_id having the sewadar_status_cd where sewadar_status.is_multiple = No
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_i_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_i_iu
GO

CREATE TRIGGER sewadars_registrations_i_iu ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewadar_status	si
							ON 	(	i.sewadar_status_cd	=	si.sewadar_status_cd	)
						LEFT OUTER JOIN	sewadars_registrations r
							ON	(	i.sewadar_id		=	r.sewadar_id
								AND	(	i.satsang_centre_id	<>	r.satsang_centre_id
									OR	i.sewadar_grno		<>	r.sewadar_grno
									)
								)
						LEFT OUTER JOIN	sewadar_status	sr
							ON 	(	r.sewadar_status_cd	=	sr.sewadar_status_cd	)
					WHERE	si.is_multiple	=	'No'
					AND		sr.is_multiple	=	'No'
					AND		r.sewadar_id	IS NOT NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ParameterMisMatch', NULL,'SEWADARS_REGISTRATIONS', 'Sewadar GR No ', ' Multiple - Not Allowed'
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================


-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that in an update, the changed date is later than the previous one.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_j_u' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_j_u
GO

CREATE TRIGGER sewadars_registrations_j_u ON sewadars_registrations
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
		IF EXISTS	(	SELECT TOP 1 1
						FROM 	inserted i 
							JOIN	deleted	d
								ON 	(	i.satsang_centre_id	= d.satsang_centre_id
									AND	i.sewadar_grno		= d.sewadar_grno
									)
						WHERE	i.sewadar_status_dtm	<=	d.sewadar_status_dtm
						AND		i.sewadar_status_cd		!=	d.sewadar_status_cd
					)
			BEGIN
				EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar Status Date', 'later than the previous Status Date', NULL
				ROLLBACK
				RETURN
			END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that responsibility and responsibility date change together (only one of these cannot be changed);
----		note that changing from NULL values or to NULL values is a change.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_k_u' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_k_u
GO

CREATE TRIGGER sewadars_registrations_k_u ON sewadars_registrations
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	DECLARE
		@dtm	DATETIME;

	SET	@dtm	=	GetDate();

	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	deleted	d
							ON 	(	i.satsang_centre_id	 = 	d.satsang_centre_id
								AND	i.sewadar_grno		 = 	d.sewadar_grno
								)
					--	values can be changing from NULL to NOT NULL or vice versa, hence COALESCE
					WHERE	(	
								(	COALESCE (i.responsibility,'X')			!= 	COALESCE (d.responsibility,'X')	
								AND	COALESCE (i.responsibility_dtm, @dtm )	 =	COALESCE (d.responsibility_dtm, @dtm )
								)
							OR
								(	COALESCE (i.responsibility,'X')			 = 	COALESCE (d.responsibility,'X')	
								AND	COALESCE (i.responsibility_dtm, @dtm ) 	!=	COALESCE (d.responsibility_dtm, @dtm )
								)
							)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Responsibility and Resp. Date', 'Changed Together', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that in an update, the changed date is later than the previous one.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_l_u' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_l_u
GO

CREATE TRIGGER sewadars_registrations_l_u ON sewadars_registrations
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	deleted	d
							ON 	(	i.satsang_centre_id	= d.satsang_centre_id
								AND	i.sewadar_grno		= d.sewadar_grno
								)
					WHERE	i.responsibility_dtm	<	d.responsibility_dtm
					AND		i.responsibility		!= 	d.responsibility
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Responsibility Date', 'later than the previous Responsibility Date', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that reference_1_relationship exists in CDB..relations
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_m_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_m_iu
GO

CREATE TRIGGER sewadars_registrations_m_iu ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
DECLARE
	@v_faults							VARCHAR (500),
	@v_left								TINYINT
BEGIN
	SET		@v_faults = ''

	SELECT	@v_faults = CAST (i.reference_1_relationship AS VARCHAR) + ', ' + @v_faults
	FROM 	inserted i 
		LEFT OUTER JOIN	CDB..relations	rels
			ON 	(	rels.relation_id	= i.reference_1_relationship	)					
	WHERE	i.reference_1_relationship	IS NOT	NULL
	AND		rels.relation_id 			IS 		NULL

	IF	(	LEN (@v_faults) > 0	)
	BEGIN
		SET	@v_left		= ((50 + (LEN(@v_faults)-1) - ABS(50 - (LEN(@v_faults)-1))) / 2)

		IF	(	@v_left	= 50	)
			SET	@v_faults = LEFT (@v_faults, 51 - (CHARINDEX (',', REVERSE (@v_faults)))) + '...'		
		ELSE
			SET	@v_faults	= LEFT (@v_faults, @v_left)

		EXEC SysAdmin..RaiseBigErrorMessage 'RefInt2', NULL, @v_faults, 'Reference 1 Relationships', NULL
		ROLLBACK
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that reference_2_relationship exists in CDB..relations
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_n_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_n_iu
GO

CREATE TRIGGER sewadars_registrations_n_iu ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
DECLARE
	@v_faults							VARCHAR (500),
	@v_left								TINYINT
BEGIN
	SET		@v_faults = ''

	SELECT	@v_faults = CAST (i.reference_2_relationship AS VARCHAR) + ', ' + @v_faults
	FROM 	inserted i 
		LEFT OUTER JOIN	CDB..relations	rels
			ON 	(	rels.relation_id	= i.reference_2_relationship	)					
	WHERE	i.reference_2_relationship	IS NOT	NULL
	AND		rels.relation_id 			IS 		NULL

	IF	(	LEN (@v_faults) > 0	)
	BEGIN
		SET	@v_left		= ((50 + (LEN(@v_faults)-1) - ABS(50 - (LEN(@v_faults)-1))) / 2)

		IF	(	@v_left	= 50	)
			SET	@v_faults = LEFT (@v_faults, 51 - (CHARINDEX (',', REVERSE (@v_faults)))) + '...'		
		ELSE
			SET	@v_faults	= LEFT (@v_faults, @v_left)

		EXEC SysAdmin..RaiseBigErrorMessage 'RefInt2', NULL, @v_faults, 'Reference 2 Relationships', NULL
		ROLLBACK
		RETURN
	END
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that Sponsorer's Status in sewadars_registrations.sewadar_status_cd (as per the Current GR No)
---- is one of General Use (system_info_cd = SttsGenUse)
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_o_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_o_iu
GO

CREATE TRIGGER sewadars_registrations_o_iu ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars	swds
							ON	(	swds.sewadar_id		= i.sponsorer_id	)
						LEFT OUTER JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= swds.current_satsang_centre_id	
								AND	swrg.sewadar_grno		= swds.current_sewadar_grno
								)
					WHERE	swrg.sewadar_status_cd	IN	(	SELECT	system_info_value
															FROM	system_information_values
															WHERE	system_info_cd	= 'SttsGenUse'
														)
					--	any NOT NULL column checking to NULL, would ensure the left outer join does not have the right hand side record
					AND		swrg.satsang_centre_id	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sponsor', 'of a General Status', NULL
			ROLLBACK
			RETURN
		END	
END
GO

-- =============================================================================
--	Table 	sewadars_registrations
--	Trigger ensures that the location_district_id exists in CDB..districts_or_cities
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_p_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_p_iu
GO

CREATE TRIGGER sewadars_registrations_p_iu	ON	sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	CDB..districts_or_cities	d
							ON	(	i.location_district_id	=	d.district_or_city_id	)			
					WHERE	d.district_or_city_id			IS NULL
					AND		i.location_district_id			IS NOT NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ParameterMisMatch', NULL,'Sewadars Registrations', 'Location District ', ' not in CDB Districts'
			ROLLBACK
			RETURN
		END
END
GO


-- =============================================================================
--	Table	sewadars_transfers
--	Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_transfers_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_transfers_a_iu
GO

CREATE TRIGGER sewadars_transfers_a_iu ON sewadars_transfers
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= i.satsang_centre_id
								AND	swrg.sewadar_grno		= i.sewadar_grno
								)	
						LEFT OUTER JOIN	sewadars	swdr
							ON	(	swdr.sewadar_id			= swrg.sewadar_id	
								AND	swdr.current_satsang_centre_id	= i.satsang_centre_id
								AND	swdr.current_sewadar_grno		= i.sewadar_grno
								)
					WHERE	swdr.sewadar_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar Transfer', 'wrt current Satsang Centre & GRNO', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadars_transfers
--	Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_transfers_b_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_transfers_b_iu
GO

CREATE TRIGGER sewadars_transfers_b_iu ON sewadars_transfers
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id		= i.satsang_centre_id
								AND	swrg.sewadar_grno			= i.sewadar_grno
								AND	swrg.sewadar_status_cd	IN	(	SELECT	system_info_value
																	FROM	system_information_values
																	WHERE	system_info_cd	= 'SttsSysTrf'
																)
								)
					--	any NOT NULL column checking to NULL, would ensure the left outer join does not have the right hand side record			
					WHERE	swrg.satsang_centre_id	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar', 'Active', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadars_transfers
--	Trigger ensures that old_department_id (and old_sub_department_id), if specified, match
--		the corresponding values in sewadars_registrations using sewadars.current_{satsang_centre_id | sewadar_grno]
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_transfers_c_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_transfers_c_iu
GO

CREATE TRIGGER sewadars_transfers_c_iu ON sewadars_transfers
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id		= i.satsang_centre_id
								AND	swrg.sewadar_grno			= i.sewadar_grno								
								)
						JOIN	sewadars		swds
							ON	(	swds.sewadar_id				= swrg.sewadar_id	)
						LEFT OUTER JOIN	sewadars_registrations	swrgdpt
							ON	(	swrgdpt.satsang_centre_id	= swds.current_satsang_centre_id
								AND	swrgdpt.sewadar_grno		= swds.current_sewadar_grno
								)
					WHERE	i.old_department_id			IS NOT 	NULL	-- to ensure that the old department details have been specified
					AND		i.old_department_id			= swrgdpt.department_id
					AND		i.old_sub_department_id		= swrgdpt.sub_department_id
					AND		swrgdpt.satsang_centre_id	IS	NULL	
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Old Dept. (Sub Dept.)', 'Current Dept. (Sub Dept.)', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadars_transfers
--	Trigger ensures that sub_department_id is specified when departments.sub_department_mandatory = Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_transfers_d_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_transfers_d_iu
GO

CREATE TRIGGER sewadars_transfers_d_iu ON sewadars_transfers
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	departments_satsang_centres		dpsc
							ON 	(	dpsc.satsang_centre_id	= i.satsang_centre_id	
								AND	dpsc.department_id		= i.old_department_id
								)
					WHERE	dpsc.sub_department_mandatory	= 'Yes'
					AND		i.old_sub_department_id				IS NULL	
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ValueReqd', NULL,'Old Sub Department', NULL, NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadars_transfers
--	Trigger ensures that sub_department_id is specified when departments.sub_department_mandatory = Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_transfers_e_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_transfers_e_iu
GO

CREATE TRIGGER sewadars_transfers_e_iu ON sewadars_transfers
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	departments_satsang_centres		dpsc
							ON 	(	dpsc.satsang_centre_id	= i.satsang_centre_id	
								AND	dpsc.department_id		= i.department_id
								)
					WHERE	dpsc.sub_department_mandatory	= 'Yes'
					AND		i.sub_department_id				IS NULL	
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ValueReqd', NULL,'Sub Department', NULL, NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadars_status_changes
--	Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_status_changes_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_status_changes_a_iu
GO

CREATE TRIGGER sewadars_status_changes_a_iu ON sewadars_status_changes
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= i.satsang_centre_id
								AND	swrg.sewadar_grno		= i.sewadar_grno
								)	
						LEFT OUTER JOIN	sewadars	swdr
							ON	(	swdr.sewadar_id			= swrg.sewadar_id	
								AND	swdr.current_satsang_centre_id	= i.satsang_centre_id
								AND	swdr.current_sewadar_grno		= i.sewadar_grno
								)
					WHERE	swdr.sewadar_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar Status Change', 'wrt current Satsang Centre & GRNO', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadars_responsibility_changes
--	Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_responsibility_changes_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_responsibility_changes_a_iu
GO

CREATE TRIGGER sewadars_responsibility_changes_a_iu ON sewadars_responsibility_changes
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= i.satsang_centre_id
								AND	swrg.sewadar_grno		= i.sewadar_grno
								)	
						LEFT OUTER JOIN	sewadars	swdr
							ON	(	swdr.sewadar_id			= swrg.sewadar_id	
								AND	swdr.current_satsang_centre_id	= i.satsang_centre_id
								AND	swdr.current_sewadar_grno		= i.sewadar_grno
								)
					WHERE	swdr.sewadar_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar Responsibility Change', 'wrt current Satsang Centre & GRNO', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadars_responsibility_changes
--	Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_responsibility_changes_b_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_responsibility_changes_b_iu
GO

CREATE TRIGGER sewadars_responsibility_changes_b_iu ON sewadars_responsibility_changes
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id		= i.satsang_centre_id
								AND	swrg.sewadar_grno			= i.sewadar_grno
								AND	swrg.sewadar_status_cd	IN	(	SELECT	system_info_value
																	FROM	system_information_values
																	WHERE	system_info_cd	= 'SttsActv'
																)
								)
					--	any NOT NULL column checking to NULL, would ensure the left outer join does not have the right hand side record			
					WHERE	swrg.satsang_centre_id	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar', 'Active', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadars_particulars	
--	Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_particulars_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_particulars_a_iu
GO

CREATE TRIGGER sewadars_particulars_a_iu ON sewadars_particulars
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= i.satsang_centre_id
								AND	swrg.sewadar_grno		= i.sewadar_grno
								)	
						LEFT OUTER JOIN	sewadars	swdr
							ON	(	swdr.sewadar_id			= swrg.sewadar_id	
								AND	swdr.current_satsang_centre_id	= i.satsang_centre_id
								AND	swdr.current_sewadar_grno		= i.sewadar_grno
								)
					WHERE	swdr.sewadar_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar Particulars', 'wrt current Satsang Centre & GRNO', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadars_attributes
--	Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_attributes_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_attributes_a_iu
GO

CREATE TRIGGER sewadars_attributes_a_iu ON sewadars_attributes
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= i.satsang_centre_id
								AND	swrg.sewadar_grno		= i.sewadar_grno
								)	
						LEFT OUTER JOIN	sewadars	swdr
							ON	(	swdr.sewadar_id			= swrg.sewadar_id	
								AND	swdr.current_satsang_centre_id	= i.satsang_centre_id
								AND	swdr.current_sewadar_grno		= i.sewadar_grno
								)
					WHERE	swdr.sewadar_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar Attributes', 'wrt current Satsang Centre & GRNO', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadars_attributes
--	Trigger ensures that one of these values are set on the basis of attribute_type
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_attributes_b_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_attributes_b_iu
GO

CREATE TRIGGER sewadars_attributes_b_iu ON sewadars_attributes
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT JOIN	generic_attributes g
								ON	(	i.attribute_id	=	g.attribute_id	
									AND	(	( g.attribute_type	=	'Boolean'	AND i.boolean_value	IS NOT NULL)
										OR	( g.attribute_type	=	'Date'		AND i.date_value	IS NOT NULL)
										OR	( g.attribute_type	=	'Timestamp'	AND i.date_value	IS NOT NULL)
										OR	( g.attribute_type	=	'String'	AND i.string_value	IS NOT NULL)
										OR	( g.attribute_type	=	'Integer'	AND i.int_value		IS NOT NULL)
										OR	( g.attribute_type	=	'Number'	AND i.number_value	IS NOT NULL)
										OR	( g.attribute_type	=	'List'		AND i.list_value	IS NOT NULL)
										)

									)
						WHERE	g.attribute_id	IS NULL						
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Attribute Value', ' As per Attribute Type', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadars_attributes
--	Trigger ensures that (a) these two columns are set, and (b) not set on the basis of is_temporal
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_attributes_c_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_attributes_c_iu
GO

CREATE TRIGGER sewadars_attributes_c_iu ON sewadars_attributes
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT JOIN	generic_attributes g
								ON	(	i.attribute_id	=	g.attribute_id	
									AND	(	( i.effective_from	IS NOT NULL	AND i.effective_till IS NOT NULL AND g.is_temporal = 'Yes')
										OR	( i.effective_from	IS NULL	AND i.effective_till IS NULL AND g.is_temporal = 'No')
										)

									)
						WHERE	g.attribute_id	IS NULL						
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Effective Range', ' As per Temporal Value', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================


-- =============================================================================
--	Table	sewa_teams
--	Trigger ensures that the (a) sewa_id has sewa.attendance_marking = Team-wise
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewa_teams_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewa_teams_a_iu
GO

CREATE TRIGGER sewa_teams_a_iu ON sewa_teams
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewas	sws
							ON	(	sws.sewa_id	= i.sewa_id	
								AND	sws.attendance_marking	= 'Team-wise'
								)
					WHERE	sws.sewa_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Attendance Marking of this sewa', 'Team-wise', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewa_team_wise_sewadars
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewa_team_wise_sewadars_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewa_team_wise_sewadars_a_iu
GO

CREATE TRIGGER sewa_team_wise_sewadars_a_iu ON sewa_team_wise_sewadars
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewa_teams	swtm
							ON	(	i.sewa_team_id	= swtm.sewa_team_id	)
						JOIN	sewas	sws
							ON	(	swtm.sewa_id	= sws.sewa_id	
								AND	sws.locked_dtm	IS NOT	NULL
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Sewa', 'modified, since it is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewa_team_wise_sewadars
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewa_team_wise_sewadars_b_d' AND xtype = 'TR')
	DROP TRIGGER sewa_team_wise_sewadars_b_d
GO

CREATE TRIGGER sewa_team_wise_sewadars_b_d ON sewa_team_wise_sewadars
	WITH ENCRYPTION 
		FOR DELETE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	deleted	d 
						JOIN	sewa_teams	swtm
							ON	(	d.sewa_team_id	= swtm.sewa_team_id	)
						JOIN	sewas	sws
							ON	(	swtm.sewa_id	= sws.sewa_id	
								AND	sws.locked_dtm	IS NOT	NULL
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Sewa', 'deleted, since it is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewa_team_wise_sewadars
--	Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewa_team_wise_sewadars_c_iu' AND xtype = 'TR')
	DROP TRIGGER sewa_team_wise_sewadars_c_iu
GO

CREATE TRIGGER sewa_team_wise_sewadars_c_iu ON sewa_team_wise_sewadars
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id		= i.satsang_centre_id
								AND	swrg.sewadar_grno			= i.sewadar_grno
								AND	swrg.sewadar_status_cd	IN	(	SELECT	system_info_value
																	FROM	system_information_values
																	WHERE	system_info_cd	= 'SttsActv'
																)
								)
					--	any NOT NULL column checking to NULL, would ensure the left outer join does not have the right hand side record
					WHERE	swrg.satsang_centre_id	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar', 'Active', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewa_team_wise_sewadars
--	Trigger ensures that attendance_dt (if any) >= transfer_in_dt
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewa_team_wise_sewadars_d_iu' AND xtype = 'TR')
	DROP TRIGGER sewa_team_wise_sewadars_d_iu
GO

CREATE TRIGGER sewa_team_wise_sewadars_d_iu ON sewa_team_wise_sewadars
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	team_wise_daily_attendance	twda
							ON	(	twda.sewa_team_id	= i.sewa_team_id
								AND	twda.serial_id		= i .serial_id								
								AND	twda.attendance_dt	IS NOT NULL
								)
					WHERE	i.transfer_in_dt	IS NOT	NULL
					AND		twda.attendance_dt	<	i.transfer_in_dt
						
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Attendance Date of the Sewa Team', 'later than Transfer IN Date', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewa_team_wise_sewadars
--	Trigger ensures that attendance_dt (if any) <= transfer_out_dt
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewa_team_wise_sewadars_e_iu' AND xtype = 'TR')
	DROP TRIGGER sewa_team_wise_sewadars_e_iu
GO

CREATE TRIGGER sewa_team_wise_sewadars_e_iu ON sewa_team_wise_sewadars
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	team_wise_daily_attendance	twda
							ON	(	twda.sewa_team_id	= i.sewa_team_id
								AND	twda.serial_id		= i .serial_id
								AND	twda.attendance_dt	IS NOT NULL
								)
					WHERE	i.transfer_out_dt	IS NOT	NULL
					AND		twda.attendance_dt	>	i.transfer_out_dt
						
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Transfer OUT Date', 'later than Attendance Date of the Sewa Team', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewa_team_wise_sewadars
--	Trigger ensures that there is only one entry for Sewadar for any day in a Sewa Team for the same Sewa
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewa_team_wise_sewadars_f_iu' AND xtype = 'TR')
	DROP TRIGGER sewa_team_wise_sewadars_f_iu
GO

CREATE TRIGGER sewa_team_wise_sewadars_f_iu ON sewa_team_wise_sewadars
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewa_teams	ti
							ON	(	i.sewa_team_id	=	ti.sewa_team_id
								)
						JOIN	sewa_team_wise_sewadars	s
							ON	(	s.satsang_centre_id	=	i.satsang_centre_id
								AND	s.sewadar_grno		=	i.sewadar_grno
								AND	(	s.sewa_team_id	!=	i.sewa_team_id
									OR	s.serial_id		!=	i.serial_id
									)
								)
						JOIN	sewa_teams	ts
							ON	(	s.sewa_team_id	=	ts.sewa_team_id
								AND	ts.sewa_id		=	ti.sewa_id
								)
					WHERE	COALESCE (i.transfer_in_dt, '01-Jan-2001')	BETWEEN
									COALESCE (s.transfer_in_dt, '01-Jan-2000')	AND	COALESCE (s.transfer_out_dt, '31-Dec-2078')
					OR		COALESCE (i.transfer_out_dt, '31-Dec-2077')	BETWEEN
									COALESCE (s.transfer_in_dt, '01-Jan-2000')	AND	COALESCE (s.transfer_out_dt, '31-Dec-2078')
						
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL, 'Sewadar in this Team', 'added because he/she is in another team', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	team_wise_daily_attendance
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'team_wise_daily_attendance_a_iu' AND xtype = 'TR')
	DROP TRIGGER team_wise_daily_attendance_a_iu
GO

CREATE TRIGGER team_wise_daily_attendance_a_iu ON team_wise_daily_attendance
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
				   		JOIN	sewa_teams		swtm
							ON	(	swtm.sewa_team_id	= i.sewa_team_id	)	
						JOIN	sewas	sws
							ON	(	sws.sewa_id			= swtm.sewa_id	
								AND	sws.locked_dtm		IS NOT	NULL
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Sewa Team Attendance', 'modified, since it is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	team_wise_daily_attendance
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'team_wise_daily_attendance_b_d' AND xtype = 'TR')
	DROP TRIGGER team_wise_daily_attendance_b_d
GO

CREATE TRIGGER team_wise_daily_attendance_b_d ON team_wise_daily_attendance
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	deleted	d
				   		JOIN	sewa_teams		swtm
							ON	(	swtm.sewa_team_id	= d.sewa_team_id	)	
						JOIN	sewas	sws
							ON	(	sws.sewa_id			= swtm.sewa_id	
								AND	sws.locked_dtm		IS NOT	NULL
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Sewa Team Attendance', 'deleted, since it is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	team_wise_daily_attendance
--	Trigger ensures that
---			(a) sewas.is_leave_allowed to record attendance as Leave
---			(b) sewas.is_exemption_allowed to record attendance as Exemption
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'team_wise_daily_attendance_b_iu' AND xtype = 'TR')
	DROP TRIGGER team_wise_daily_attendance_b_iu
GO

CREATE TRIGGER team_wise_daily_attendance_b_iu ON team_wise_daily_attendance
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN

	-- checking the (a) - sewas.is_leave_allowed to record attendance as Leave
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
				   		JOIN	sewa_teams		swtm
							ON	(	i.sewa_team_id		= swtm.sewa_team_id	
								AND	i.attendance		= 'L'
								)	
						LEFT OUTER JOIN	sewas	sws
							ON	(	swtm.sewa_id			= sws.sewa_id	
								AND	sws.is_leave_allowed	= 'Yes'
								)
					WHERE	sws.sewa_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Sewa Team Attendance', 'having a Leave', NULL
			ROLLBACK
			RETURN
		END

	-- checking the (b) - sewas.is_exemption_allowed to record attendance as Exemption
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
				   		JOIN	sewa_teams		swtm
							ON	(	i.sewa_team_id		= swtm.sewa_team_id	
								AND	i.attendance		= 'E'
								)	
						LEFT OUTER JOIN	sewas	sws
							ON	(	swtm.sewa_id				= sws.sewa_id	
								AND	sws.is_exemption_allowed	= 'Yes'
								)
					WHERE	sws.sewa_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Sewa Team Attendance', 'having an Exemption', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	team_wise_daily_attendance
--	Trigger ensures that is_scanned can be set to Yes only if sewas.is_scanner_used is set to Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'team_wise_daily_attendance_c_iu' AND xtype = 'TR')
	DROP TRIGGER team_wise_daily_attendance_c_iu
GO

CREATE TRIGGER team_wise_daily_attendance_c_iu ON team_wise_daily_attendance
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
				   		JOIN	sewa_teams		swtm
							ON	(	i.sewa_team_id		= swtm.sewa_team_id	
								AND	i.is_scanned		= 'Yes'
								)	
						LEFT OUTER JOIN	sewas	sws
							ON	(	swtm.sewa_id		= sws.sewa_id	
								AND	sws.is_scanner_used	= 'Yes'
								)
					WHERE	sws.sewa_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Sewa Team Attendance', 'scanned', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	team_wise_daily_attendance
--	Trigger ensures attendance_dt  is within (BETWEEN) the start_dt and finish_dt of the sewa_id
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'team_wise_daily_attendance_d_iu' AND xtype = 'TR')
	DROP TRIGGER team_wise_daily_attendance_d_iu
GO

CREATE TRIGGER team_wise_daily_attendance_d_iu ON team_wise_daily_attendance
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
				   		JOIN	sewa_teams		swtm
							ON	(	i.sewa_team_id		= swtm.sewa_team_id	)	
						LEFT OUTER JOIN	sewas	sws
							ON	(	swtm.sewa_id		= sws.sewa_id	)
					WHERE	i.attendance_dt		>=	sws.start_dt
					AND		i.attendance_dt		<=	sws.finish_dt
					AND		sws.sewa_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Attendance Date within ', 'sewa start and end date', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	team_wise_daily_attendance
--	Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'team_wise_daily_attendance_e_iu' AND xtype = 'TR')
	DROP TRIGGER team_wise_daily_attendance_e_iu
GO

CREATE TRIGGER team_wise_daily_attendance_e_iu ON team_wise_daily_attendance
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewa_team_wise_sewadars ss
							ON	(	i.sewa_team_id		=	ss.sewa_team_id
								AND	i.serial_id			=	ss.serial_id
								)
						LEFT OUTER JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id		= ss.satsang_centre_id
								AND	swrg.sewadar_grno			= ss.sewadar_grno
								AND	swrg.sewadar_status_cd	IN	(	SELECT	system_info_value
																	FROM	system_information_values
																	WHERE	system_info_cd	= 'SttsActv'
																)
								)
					--	any NOT NULL column checking to NULL, would ensure the left outer join does not have the right hand side record			
					WHERE	swrg.satsang_centre_id	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar', 'Active', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
-- Table team_wise_daily_attendance
-- Trigger ensures attendance_dt is within (BETWEEN) the start_dt and finish_dt of periods of the sewa_id, if any periods for the sewa exists
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'team_wise_daily_attendance_f_iu' AND xtype = 'TR')
	DROP TRIGGER team_wise_daily_attendance_f_iu
GO

CREATE TRIGGER team_wise_daily_attendance_f_iu ON team_wise_daily_attendance
WITH ENCRYPTION 
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT	TOP 1 1
					FROM	inserted i
						JOIN	sewa_teams	swtm
							ON	(	i.sewa_team_id = swtm.sewa_team_id	) 
					WHERE	EXISTS	(	SELECT	TOP 1 1
										FROM	sewas_periods sp
										WHERE	sp.sewa_id	=	swtm.sewa_id
									)
					AND		NOT EXISTS (	SELECT	TOP 1 1
											FROM	sewas_periods sp
											WHERE	sp.sewa_id	=	swtm.sewa_id
											AND		i.attendance_dt	BETWEEN	sp.start_dt	AND	sp.finish_dt
									)
				)
	BEGIN
		EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL, 'Attendance Date', 'within the Allotted Sewa Days (periods)', NULL
		ROLLBACK
		RETURN
	END 
END
GO
-- =============================================================================

-- =============================================================================
--	Table	team_wise_daily_attendance
--	Trigger ensures that when sewa_exemptions.sewa_applicability = Yes, the exemption exists in sewa_exemptions_applicable_sewas
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'team_wise_daily_attendance_g_iu' AND xtype = 'TR')
	DROP TRIGGER team_wise_daily_attendance_g_iu
GO

CREATE TRIGGER team_wise_daily_attendance_g_iu ON team_wise_daily_attendance
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewa_teams	swtm
							ON	(	i.sewa_team_id = swtm.sewa_team_id	)
						LEFT OUTER JOIN	sewa_exemptions	e
							ON	(	i.sewa_exemption_id		=	e.sewa_exemption_id )
						LEFT OUTER JOIN sewa_exemptions_applicable_sewas eas
							ON	(	eas.sewa_id				=	swtm.sewa_id
								AND	eas.sewa_exemption_id	=	i.sewa_exemption_id
								)
					WHERE	e.sewa_applicability	=	'Yes'
					AND		eas.sewa_id				IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewa Exemption', ' Applicable', NULL
			ROLLBACK
			RETURN
		END	
		
END
GO
-- =============================================================================


-- =============================================================================
--	Table	arbitrary_daily_presences
--	Trigger ensures that the sewa_id has sewa.attendance_marking = Arbitrary and attendance_unit = Day
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_a_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_a_iu
GO

CREATE TRIGGER arbitrary_daily_presences_a_iu ON arbitrary_daily_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
				   		JOIN	sewas	sws
							ON	(	i.sewa_id	= sws.sewa_id
								AND	sws.attendance_marking 	= 'Arbitrary'
								AND	sws.attendance_unit		= 'Day'
								)	
					WHERE	sws.sewa_id	IS	NULL	
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewa', 'having attndnc marking=Arbitrary & unit=Day', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_daily_presences	
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_b_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_b_iu
GO

CREATE TRIGGER arbitrary_daily_presences_b_iu ON arbitrary_daily_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewas	sws
							ON	(	sws.sewa_id	= i.sewa_id	
								AND	sws.locked_dtm	IS NOT	NULL
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Arbitrary Daily Presences', 'modified, since the Sewa is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_daily_presences	
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_c_d' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_c_d
GO

CREATE TRIGGER arbitrary_daily_presences_c_d ON arbitrary_daily_presences
	WITH ENCRYPTION 
		FOR DELETE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	deleted	d 
						JOIN	sewas	sws
							ON	(	sws.sewa_id	= d.sewa_id	
								AND	sws.locked_dtm	IS NOT	NULL
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Arbitrary Daily Presences', 'deleted, since the Sewa is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_daily_presences	
--	Trigger ensures that the sewa's satsang centre is same as specified as the column in column satsang_centre
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_d_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_d_iu
GO

CREATE TRIGGER arbitrary_daily_presences_d_iu ON arbitrary_daily_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
				   		LEFT OUTER JOIN	sewas	sws
							ON	(	i.sewa_id	= sws.sewa_id	
								AND	i.satsang_centre_id	= sws.satsang_centre_id
								)	
					WHERE	sws.sewa_id	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Satsang Centre', 'same as the Satsang Centre for the Sewa', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_daily_presences
--	Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_e_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_e_iu
GO

CREATE TRIGGER arbitrary_daily_presences_e_iu ON arbitrary_daily_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= i.satsang_centre_id
								AND	swrg.sewadar_grno		= i.sewadar_grno
								)	
						LEFT OUTER JOIN	sewadars	swdr
							ON	(	swdr.sewadar_id			= swrg.sewadar_id	
								AND	swdr.current_satsang_centre_id	= i.satsang_centre_id
								AND	swdr.current_sewadar_grno		= i.sewadar_grno
								)
					WHERE	swdr.sewadar_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Daily Presences', 'recorded wrt current Satsang Centre & GRNO', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_daily_presences
--	Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_f_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_f_iu
GO

CREATE TRIGGER arbitrary_daily_presences_f_iu ON arbitrary_daily_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id		= i.satsang_centre_id
								AND	swrg.sewadar_grno			= i.sewadar_grno
								AND	swrg.sewadar_status_cd	IN	(	SELECT	system_info_value
																	FROM	system_information_values
																	WHERE	system_info_cd	= 'SttsActv'
																)
								)
					--	any NOT NULL column checking to NULL, would ensure the left outer join does not have the right hand side record			
					WHERE	swrg.satsang_centre_id	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar', 'Active', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_daily_presences
--	Trigger ensures that is_scanned can be set to Yes only if sewas.is_scanner_used is set to Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_g_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_g_iu
GO

CREATE TRIGGER arbitrary_daily_presences_g_iu ON arbitrary_daily_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
						LEFT OUTER JOIN	sewas	sws
							ON	(	i.sewa_id		= sws.sewa_id
								AND	sws.is_scanner_used	= 'Yes'
								)
					WHERE	i.is_scanned	= 'Yes'
					AND		sws.sewa_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Daily Presences', 'Scanned', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_daily_presences
--	Trigger ensures attendance_dt  is within (BETWEEN) the start_dt and finish_dt of the sewa_id
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_h_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_h_iu
GO

CREATE TRIGGER arbitrary_daily_presences_h_iu ON arbitrary_daily_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
						LEFT OUTER JOIN	sewas	sws
							ON	(	i.sewa_id		= sws.sewa_id	)
					WHERE	i.presence_dt		>=	sws.start_dt
					AND		i.presence_dt		<=	sws.finish_dt
					AND		sws.sewa_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Attendance Date within ', 'sewa start and end date', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
-- Table arbitrary_daily_presences
-- Trigger ensures presence_dt is within (BETWEEN) the start_dt and finish_dt of periods of the sewa_id, if any periods for the sewa exists
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_i_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_i_iu
GO

CREATE TRIGGER arbitrary_daily_presences_i_iu ON arbitrary_daily_presences
WITH ENCRYPTION 
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT	TOP 1 1
					FROM	inserted i
					WHERE	EXISTS	(	SELECT	TOP 1 1
										FROM	sewas_periods sp
										WHERE	sp.sewa_id	=	i.sewa_id
									)
					AND		NOT EXISTS (	SELECT	TOP 1 1
											FROM	sewas_periods sp
											WHERE	sp.sewa_id	=	i.sewa_id
											AND		i.presence_dt	BETWEEN	sp.start_dt	AND	sp.finish_dt
									)
				)
	BEGIN
		EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL, 'Attendance Date', 'within the Allotted Sewa Days (periods)', NULL
		ROLLBACK
		RETURN
	END 
END
GO
-- =============================================================================

-- =============================================================================
-- Table arbitrary_daily_presences
-- Trigger ensures that attendence cannot be marked if a scanning job (or sub-job) is NOT processed for a Sewa
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_j_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_j_iu
GO

CREATE TRIGGER arbitrary_daily_presences_j_iu ON arbitrary_daily_presences
WITH ENCRYPTION 
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT	TOP 1 1
					FROM	inserted i
						JOIN	scanning_jobs sj ON	(   i.sewa_id = sj.sewa_id
													AND sj.last_transfer_dtm IS NULL
													AND	i.is_scanned	=	'No'
													)
						JOIN scanning_jobs_controlling_dates sjcd
							ON	(	sjcd.scanning_job_id	=	sj.scanning_job_id
								AND sjcd.controlling_dt <= i.presence_dt
								AND	sjcd.last_transfer_dtm IS NULL
								)
					WHERE	EXISTS	(	SELECT	1
										FROM	scanning_job_types sjt 
										WHERE	sj.scanning_job_type_cd = sjt.scanning_job_type_cd
										AND		sjt.is_date_wise = 'Yes'
									)
				)
	BEGIN
		EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL, 'Arbitrary Daily Presences', 'modified, since scanning job (or sub-job) is NOT processed for the Sewa', NULL
		ROLLBACK
		RETURN
	END 
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_shift_presences
--	Trigger ensures that the sewa_id has sewa.attendance_marking = Arbitrary and attendance_unit = Shift
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_a_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_a_iu
GO

CREATE TRIGGER arbitrary_shift_presences_a_iu ON arbitrary_shift_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
				   		JOIN	sewas	sws
							ON	(	i.sewa_id	= sws.sewa_id
								AND	sws.attendance_marking 	= 'Arbitrary'
								AND	sws.attendance_unit		= 'Shift'
								)	
					WHERE	sws.sewa_id	IS	NULL	
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewa', 'having attndnc marking=Arbitrary & unit=Shift', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_shift_presences
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_b_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_b_iu
GO

CREATE TRIGGER arbitrary_shift_presences_b_iu ON arbitrary_shift_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewas	sws
							ON	(	sws.sewa_id	= i.sewa_id	
								AND	sws.locked_dtm	IS NOT	NULL
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Arbitrary Shift Presences', 'modified, since the Sewa is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_shift_presences
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_c_d' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_c_d
GO

CREATE TRIGGER arbitrary_shift_presences_c_d ON arbitrary_shift_presences
	WITH ENCRYPTION 
		FOR DELETE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	deleted	d 
						JOIN	sewas	sws
							ON	(	sws.sewa_id	= d.sewa_id	
								AND	sws.locked_dtm	IS NOT	NULL
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Arbitrary Shift Presences', 'deleted, since the Sewa is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_shift_presences
--	Trigger ensures that the sewa's satsang centre is same as specified as the column in column satsang_centre
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_d_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_d_iu
GO

CREATE TRIGGER arbitrary_shift_presences_d_iu ON arbitrary_shift_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
				   		LEFT OUTER JOIN	sewas	sws
							ON	(	i.sewa_id	= sws.sewa_id	
								AND	i.satsang_centre_id	= sws.satsang_centre_id
								)	
					WHERE	sws.sewa_id	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Satsang Centre', 'same as the Satsang Centre for the Sewa', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_shift_presences
--	Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_e_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_e_iu
GO

CREATE TRIGGER arbitrary_shift_presences_e_iu ON arbitrary_shift_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= i.satsang_centre_id
								AND	swrg.sewadar_grno		= i.sewadar_grno
								)	
						LEFT OUTER JOIN	sewadars	swdr
							ON	(	swdr.sewadar_id			= swrg.sewadar_id	
								AND	swdr.current_satsang_centre_id	= i.satsang_centre_id
								AND	swdr.current_sewadar_grno		= i.sewadar_grno
								)
					WHERE	swdr.sewadar_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Shift Presences', 'recorded wrt current Satsang Centre & GRNO', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_shift_presences
--	Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_f_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_f_iu
GO

CREATE TRIGGER arbitrary_shift_presences_f_iu ON arbitrary_shift_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id		= i.satsang_centre_id
								AND	swrg.sewadar_grno			= i.sewadar_grno
								AND	swrg.sewadar_status_cd	IN	(	SELECT	system_info_value
																	FROM	system_information_values
																	WHERE	system_info_cd	= 'SttsActv'
																)
								)
					--	any NOT NULL column checking to NULL, would ensure the left outer join does not have the right hand side record			
					WHERE	swrg.satsang_centre_id	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar', 'Active', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_shift_presences
--	Trigger ensures that is_scanned can be set to Yes only if sewas.is_scanner_used is set to Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_g_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_g_iu
GO

CREATE TRIGGER arbitrary_shift_presences_g_iu ON arbitrary_shift_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
						LEFT OUTER JOIN	sewas	sws
							ON	(	i.sewa_id		= sws.sewa_id								
								AND	sws.is_scanner_used	= 'Yes'
								)
					WHERE	i.is_scanned	= 'Yes'	
					AND		sws.sewa_id		IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Shift Presences', 'Scanned', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_shift_presences
--	Trigger ensures attendance_dt  is within (BETWEEN) the start_dt and finish_dt of the sewa_id
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_h_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_h_iu
GO

CREATE TRIGGER arbitrary_shift_presences_h_iu ON arbitrary_shift_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
						LEFT OUTER JOIN	sewas	sws
							ON	(	i.sewa_id		= sws.sewa_id	)
					WHERE	i.presence_dt		>=	sws.start_dt
					AND		i.presence_dt		<=	sws.finish_dt
					AND		sws.sewa_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Attendance Date within ', 'sewa start and end date', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
-- Table arbitrary_shift_presences
-- Trigger ensures presence_dt is within (BETWEEN) the start_dt and finish_dt of periods of the sewa_id, if any periods for the sewa exists
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_i_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_i_iu
GO

CREATE TRIGGER arbitrary_shift_presences_i_iu ON arbitrary_shift_presences
WITH ENCRYPTION 
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT	TOP 1 1
					FROM	inserted i
					WHERE	EXISTS	(	SELECT	TOP 1 1
										FROM	sewas_periods sp
										WHERE	sp.sewa_id	=	i.sewa_id
									)
					AND		NOT EXISTS (	SELECT	TOP 1 1
											FROM	sewas_periods sp
											WHERE	sp.sewa_id	=	i.sewa_id
											AND		i.presence_dt	BETWEEN	sp.start_dt	AND	sp.finish_dt
									)
				)
	BEGIN
		EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL, 'Attendance Date', 'within the Allotted Sewa Days (periods)', NULL
		ROLLBACK
		RETURN
	END 
END
GO

-- =============================================================================
---	Ensures that only allowable sewa shift combinations are permitted for a day for a Sewadar for a Sewa
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_j_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_j_iu
GO

CREATE TRIGGER arbitrary_shift_presences_j_iu ON arbitrary_shift_presences
	WITH ENCRYPTION
		FOR INSERT, UPDATE
AS
BEGIN
	IF	NOT EXISTS	(	SELECT	TOP 1 1
						FROM 	inserted i
							JOIN arbitrary_shift_presences	p
								ON 	( 	i.sewa_id		=	p.sewa_id
									AND	i.sewadar_grno	=	p.sewadar_grno
									AND	i.presence_dt	=	p.presence_dt
									)
							JOIN sewa_shifts_valid_combinations	c
								ON	(	i.sewa_id		=	c.sewa_id
									AND	p.sewa_shift	=	c.recorded_sewa_shift
									AND	i.sewa_shift	=	c.recording_sewa_shift
									)
					)
	AND	EXISTS	(	SELECT	TOP 1 1
					FROM 	inserted i
						JOIN arbitrary_shift_presences	p
							ON 	( 	i.sewa_id		=	p.sewa_id
								AND	i.sewadar_grno	=	p.sewadar_grno
								AND	i.presence_dt	=	p.presence_dt
								AND	i.sewa_shift	!=	p.sewa_shift
								)
				)
	BEGIN
		EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', 'Another Shift on same day', 'as per the allowable Shift Combinations', NULL, NULL
		ROLLBACK
		RETURN
	END
END
GO
-- =============================================================================


-- =============================================================================
-- Table arbitrary_shift_presences
-- Trigger ensures that attendence cannot be marked if a scanning job (or sub-job) is NOT processed for a Sewa
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_k_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_k_iu
GO

CREATE TRIGGER arbitrary_shift_presences_k_iu ON arbitrary_shift_presences
WITH ENCRYPTION 
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT	TOP 1 1
					FROM	inserted i
						JOIN	scanning_jobs sj ON (   i.sewa_id = sj.sewa_id
														AND sj.last_transfer_dtm IS NULL
														AND	i.is_scanned	=	'No'
													)
						JOIN scanning_jobs_controlling_dates sjcd
							ON	(	sjcd.scanning_job_id	=	sj.scanning_job_id
								AND sjcd.controlling_dt <= i.presence_dt
								AND	sjcd.last_transfer_dtm IS NULL
								)
					WHERE	EXISTS	(	SELECT	1
										FROM	scanning_job_types sjt 
										WHERE	sj.scanning_job_type_cd = sjt.scanning_job_type_cd
										AND		sjt.is_date_wise = 'Yes'
									)
				)
	BEGIN
		EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL, 'Arbitrary Shift Presences', 'modified, since scanning job (or sub-job) is NOT processed for the Sewa', NULL
		ROLLBACK
		RETURN
	END 
END
GO

-- =============================================================================
--	Table	arbitrary_summarised_exemptions
--	Trigger ensures that the sewa_id has sewa.attendance_marking = Arbitrary
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_summarised_exemptions_a_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_summarised_exemptions_a_iu
GO

CREATE TRIGGER arbitrary_summarised_exemptions_a_iu ON arbitrary_summarised_exemptions
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
				   		JOIN	sewas	sws
							ON	(	i.sewa_id	= sws.sewa_id
								AND	sws.attendance_marking 	= 'Arbitrary'
								)	
					WHERE	sws.sewa_id	IS	NULL	
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewa', 'having attndnc marking=Arbitrary', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_summarised_exemptions
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_summarised_exemptions_b_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_summarised_exemptions_b_iu
GO

CREATE TRIGGER arbitrary_summarised_exemptions_b_iu ON arbitrary_summarised_exemptions
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewas	sws
							ON	(	sws.sewa_id	= i.sewa_id	
								AND	sws.locked_dtm	IS NOT	NULL
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Arbitrary Shift Presences', 'modified, since the Sewa is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_summarised_exemptions
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_summarised_exemptions_c_d' AND xtype = 'TR')
	DROP TRIGGER arbitrary_summarised_exemptions_c_d
GO

CREATE TRIGGER arbitrary_summarised_exemptions_c_d ON arbitrary_summarised_exemptions
	WITH ENCRYPTION 
		FOR DELETE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	deleted	d 
						JOIN	sewas	sws
							ON	(	sws.sewa_id	= d.sewa_id	
								AND	sws.locked_dtm	IS NOT	NULL
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Arbitrary Shift Presences', 'deleted, since the Sewa is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_summarised_exemptions
--	Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_summarised_exemptions_d_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_summarised_exemptions_d_iu
GO

CREATE TRIGGER arbitrary_summarised_exemptions_d_iu ON arbitrary_summarised_exemptions
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= i.satsang_centre_id
								AND	swrg.sewadar_grno		= i.sewadar_grno
								)	
						LEFT OUTER JOIN	sewadars	swdr
							ON	(	swdr.sewadar_id			= swrg.sewadar_id	
								AND	swdr.current_satsang_centre_id	= i.satsang_centre_id
								AND	swdr.current_sewadar_grno		= i.sewadar_grno
								)
					WHERE	swdr.sewadar_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Arb. Summarized Exemptions', 'recorded wrt current Satsang Centre & GRNO', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_summarised_exemptions
--	Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_summarised_exemptions_e_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_summarised_exemptions_e_iu
GO

CREATE TRIGGER arbitrary_summarised_exemptions_e_iu ON arbitrary_summarised_exemptions
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id		= i.satsang_centre_id
								AND	swrg.sewadar_grno			= i.sewadar_grno
								AND	swrg.sewadar_status_cd	IN	(	SELECT	system_info_value
																	FROM	system_information_values
																	WHERE	system_info_cd	= 'SttsActv'
																)
								)
					--	any NOT NULL column checking to NULL, would ensure the left outer join does not have the right hand side record			
					WHERE	swrg.satsang_centre_id	IS 	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewadar', 'Active', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	arbitrary_summarised_exemptions
--	Trigger ensures that when sewa_exemptions.sewa_applicability = Yes, the exemption exists in sewa_exemptions_applicable_sewas
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_summarised_exemptions_f_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_summarised_exemptions_f_iu
GO

CREATE TRIGGER arbitrary_summarised_exemptions_f_iu ON arbitrary_summarised_exemptions
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewa_exemptions	e
							ON	(	i.sewa_exemption_id		=	e.sewa_exemption_id )
						LEFT OUTER JOIN sewa_exemptions_applicable_sewas eas
							ON	(	i.sewa_id				=	eas.sewa_id
								AND	i.sewa_exemption_id		=	eas.sewa_exemption_id
								)
					WHERE	e.sewa_applicability	=	'Yes'
					AND		eas.sewa_id				IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewa Exemption', ' Applicable', NULL
			ROLLBACK
			RETURN
		END	
		
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadar_wise_sewa_summaries
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadar_wise_sewa_summaries_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewadar_wise_sewa_summaries_a_iu
GO

CREATE TRIGGER sewadar_wise_sewa_summaries_a_iu ON sewadar_wise_sewa_summaries
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewas	sws
							ON	(	i.sewa_id	= sws.sewa_id	)								
						WHERE sws.locked_dtm	IS NOT	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Sewa Summaries', 'modified, since the Sewa is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadar_wise_sewa_summaries
--	Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadar_wise_sewa_summaries_b_d' AND xtype = 'TR')
	DROP TRIGGER sewadar_wise_sewa_summaries_b_d
GO

CREATE TRIGGER sewadar_wise_sewa_summaries_b_d ON sewadar_wise_sewa_summaries
	WITH ENCRYPTION 
		FOR DELETE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	deleted	d 
						JOIN	sewas	sws
							ON	(	d.sewa_id	= sws.sewa_id	)								
						WHERE sws.locked_dtm	IS NOT	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Sewa Summaries', 'deleted, since the Sewa is Locked', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadar_wise_sewa_summaries
--	Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno
--	when the Attendance Marking is Summary (this is to allow Summarisation for other Sewas by the System).
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadar_wise_sewa_summaries_c_iu' AND xtype = 'TR')
	DROP TRIGGER sewadar_wise_sewa_summaries_c_iu
GO

CREATE TRIGGER sewadar_wise_sewa_summaries_c_iu ON sewadar_wise_sewa_summaries
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= i.satsang_centre_id
								AND	swrg.sewadar_grno		= i.sewadar_grno
								)	
						JOIN	sewas	s
							ON	(	s.sewa_id	=	i.sewa_id
								AND	s.attendance_marking 	= 'Summary'
								)
						LEFT OUTER JOIN	sewadars	swdr
							ON	(	swdr.sewadar_id			= swrg.sewadar_id	
								AND	swdr.current_satsang_centre_id	= i.satsang_centre_id
								AND	swdr.current_sewadar_grno		= i.sewadar_grno
								)
					WHERE	swdr.sewadar_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'Sewa Summaries', 'recorded wrt current Satsang Centre & GRNO', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadar_wise_sewa_summaries
--	Trigger ensures that exempt_cnt > 0 only when sewas.is_exemption_allowed is Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadar_wise_sewa_summaries_e_iu' AND xtype = 'TR')
	DROP TRIGGER sewadar_wise_sewa_summaries_e_iu
GO

CREATE TRIGGER sewadar_wise_sewa_summaries_e_iu ON sewadar_wise_sewa_summaries
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewas	sws
							ON	(	i.sewa_id					= sws.sewa_id
								AND	sws.is_exemption_allowed	= 'Yes'
								)
					WHERE	i.exempt_cnt	> 0
					AND		sws.sewa_id	IS	NULL			
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Exemption Count', '> 0, since Exemptions not allowed for this Sewa', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadar_wise_sewa_summaries
--	Trigger ensures that leave_cnt > 0 only when sewas.is_leave_allowed is Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadar_wise_sewa_summaries_f_iu' AND xtype = 'TR')
	DROP TRIGGER sewadar_wise_sewa_summaries_f_iu
GO

CREATE TRIGGER sewadar_wise_sewa_summaries_f_iu ON sewadar_wise_sewa_summaries
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewas	sws
							ON	(	i.sewa_id					= sws.sewa_id								
								AND	sws.is_leave_allowed		= 'Yes'
								)
					WHERE	i.leave_cnt		> 0
					AND		sws.sewa_id		IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Leave Count', '> 0, since Leaves not allowed for this Sewa', NULL
			ROLLBACK
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadar_wise_sewa_summaries
--	Trigger ensures that absent_cnt > 0 only when sewas.attendance_marking is one of Team-wise or Computed
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadar_wise_sewa_summaries_g_iu' AND xtype = 'TR')
	DROP TRIGGER sewadar_wise_sewa_summaries_g_iu
GO

CREATE TRIGGER sewadar_wise_sewa_summaries_g_iu ON sewadar_wise_sewa_summaries
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewas	sws
							ON	(	i.sewa_id				= sws.sewa_id								
								AND	sws.attendance_marking 	IN	('Team-wise', 'Computed')
								)
					WHERE	i.absent_cnt	> 0
					AND		sws.sewa_id		IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Absent Count', '>0, Attndnc Marking isnt Team-wise/Computed', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table	sewadar_wise_sewa_summaries
--	Trigger ensures that (a) overwriting system generated values is not permitted (in other words, updates are not allowed)
-- =============================================================================
-- ..... trigger disabled as it resulted in error while Summarising a Sewa ........... JL ...........
--IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadar_wise_sewa_summaries_h_u' AND xtype = 'TR')
--	DROP TRIGGER sewadar_wise_sewa_summaries_h_u
--GO
--
--CREATE TRIGGER sewadar_wise_sewa_summaries_h_u ON sewadar_wise_sewa_summaries
--	WITH ENCRYPTION 
--		FOR UPDATE
--AS
--BEGIN
--	IF EXISTS	(	SELECT TOP 1 1
--					FROM 	inserted i
--						JOIN deleted d
--							ON (	i.sewa_id				= d.sewa_id
--								AND	i.satsang_centre_id		= d.satsang_centre_id
--								AND	i.sewadar_grno			= d.sewadar_grno
--								)
--				   		WHERE	i.is_system_recorded = 'Yes'
--				)
--		BEGIN
--			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectCannotBe', NULL,'Sewa Summaries', 'modified since it is System Generated', NULL
--			RETURN
--		END	
--END
--GO
--
-- =============================================================================

-- =============================================================================
--	Table	sewadar_wise_sewa_summaries
--	Trigger ensures that (b) is_system_recorded can be No only for sewas where attendance_marking = "Summary"
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadar_wise_sewa_summaries_i_iu' AND xtype = 'TR')
	DROP TRIGGER sewadar_wise_sewa_summaries_i_iu
GO

CREATE TRIGGER sewadar_wise_sewa_summaries_i_iu ON sewadar_wise_sewa_summaries
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewas	sws
							ON	(	sws.sewa_id				= i.sewa_id
								AND	sws.attendance_marking 	= 'Summary'
								)
					WHERE	i.is_system_recorded 	= 'No'
					AND		sws.sewa_id				IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseBigErrorMessage 'ObjectValidity', NULL,'System Recorded', 'No, only when attndnc marking is Summary', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console
