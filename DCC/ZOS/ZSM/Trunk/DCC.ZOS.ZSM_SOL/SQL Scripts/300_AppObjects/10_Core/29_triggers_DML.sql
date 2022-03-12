/* ==================================================================================
    Source File		:	26_triggers_DML.sql
    Author(s)		:	Jitendra Loyal (JL), Kavita Darira (KD), Sukhdev B. Darira (SD)
    Started On		:	Sun Nov 28 01:00:00 IST 2010
    Version			:	1.04
    Last updated	:	Jan 23, 2013
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------

    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	 JL : v1.04 : 23-Jan-2013
		*	Trigger credit_specifications_a_iu_DML has been split into two triggers
			credit_specifications_a_i_DML and credit_specifications_b_u_DML because it was
			not functioning for INSERT.
	 JL : v1.03 : 10-Jan-2013
		*	Trigger scanning_jobs_a_i_DML has been written.
	 JL : v1.02 : 12-Jan-2012
		*	Trigger sewadars_registrations_b_i_DML on table sewadars_registrations has been
		    changed to be restricted to Regular Sewadars only; no need to create a transfer
			record for Open and Trainee Sewadars.
	 JL : v1.01 : 08-Jan-2012
		*	Following INSERT and UPDATE triggers have been split into two triggers to
			avoid PRIMARY KEY violation when a record is updated:
				Sewadars (Global Status Change)
				Sewadar Registrations (Status Change)
				Sewadar Registrations (Responsibility Change)
     SD & KD 	: 0.01 : 28-Nov-2010
				* First Draft
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--	Table 	CREDIT_SPECIFICATIONS
--	Column specification_ts is automatically set through trigger(s)/procedure(s)
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'credit_specifications_a_i_DML' AND xtype = 'TR')
	DROP TRIGGER credit_specifications_a_i_DML
GO

CREATE TRIGGER credit_specifications_a_i_DML ON credit_specifications
	WITH ENCRYPTION 
		FOR INSERT
AS
BEGIN
	UPDATE	c
		SET	c.specification_ts	=	GETDATE()
	FROM	credit_specifications	c
		JOIN	inserted	i
			ON	(	c.credit_specification_id	=	i.credit_specification_id	)
END
GO

-- =============================================================================
--	Table 	CREDIT_SPECIFICATIONS
--	Column specification_ts is automatically set through trigger(s)/procedure(s)
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'credit_specifications_b_u_DML' AND xtype = 'TR')
	DROP TRIGGER credit_specifications_b_u_DML
GO

CREATE TRIGGER credit_specifications_b_u_DML ON credit_specifications
	WITH ENCRYPTION 
		FOR UPDATE
AS
	DECLARE
		@v_timestamp_interval		TINYINT
BEGIN
	SELECT	@v_timestamp_interval = system_info_value	
	FROM	system_information_values	
	WHERE	system_info_cd	= 'TsIntInSec';

	UPDATE	c
		SET	c.specification_ts	=	GETDATE()
	FROM	credit_specifications	c
		JOIN	inserted	i
			ON	(	c.credit_specification_id	=	i.credit_specification_id	)
		JOIN	deleted		d
			ON	(	i.credit_specification_id	=	d.credit_specification_id
				AND	DATEDIFF	(	s, 
									COALESCE (i.specification_ts, GETDATE() ), 
									COALESCE (d.specification_ts, GETDATE() ) 
								)	> @v_timestamp_interval
				)
END
GO

-- =============================================================================
--	Table 	SEWAS
--	Columns attendance_ts for timestamps which are automatically set last time when attendance is recorded
--	Triggers written for respective tables, to ensure that the attendance_ts is kept up to date
-- =============================================================================

-- =============================================================================
--	Table 	SEWAS
--	Columns summary_ts for timestamps which are automatically set last time summary is generated
--	This trigger has been eliminated, as per the suggestion of Jiten Sir, on 18-Dec-2010, as per the telecon, with Sukhdev.
-- =============================================================================

-- =============================================================================
--	Table 	SEWAS
--	Columns deleted_ts for timestamps which are automatically set the time when actual attendance records have been deleted
--	This trigger has been eliminated, as per the suggestion of Jiten Sir, on 18-Dec-2010, as per the telecon, with Sukhdev.
-- =============================================================================

-- =============================================================================
--	Table 	SEWADARS
--	Trigger (DML) puts a record in sewadars_status_changes on every change (including INSERT), if there is a change
----		note that changing from NULL values or to NULL values is a change
--- Split the trigger into two separate triggers for INSERT and UPDATE
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_a_iu_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_a_iu_DML
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_a_i_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_a_i_DML
GO

CREATE TRIGGER sewadars_a_i_DML ON sewadars
	WITH ENCRYPTION 
		FOR INSERT
AS
BEGIN
	INSERT INTO sewadars_status_changes 
			(	satsang_centre_id, sewadar_grno, effective_dtm, old_sewadar_status_cd, sewadar_status_cd	)
		SELECT	i.current_satsang_centre_id, i.current_sewadar_grno, GETDATE(), NULL, i.global_sewadar_status_cd
		FROM 	inserted i 
		WHERE	i.global_sewadar_status_cd	IS NOT 	NULL
END
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_b_u_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_b_u_DML
GO

CREATE TRIGGER sewadars_b_u_DML ON sewadars
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	INSERT INTO sewadars_status_changes 
			(	satsang_centre_id, sewadar_grno, effective_dtm, old_sewadar_status_cd, sewadar_status_cd	)
		SELECT	i.current_satsang_centre_id, i.current_sewadar_grno, COALESCE (i.global_sewadar_status_dt, GETDATE()), d.global_sewadar_status_cd, i.global_sewadar_status_cd
		FROM 	inserted i
			JOIN	deleted d
				ON 	(	i.sewadar_id	= 	d.sewadar_id	)
		WHERE	( (	i.global_sewadar_status_cd	IS NOT 	NULL 	AND d.global_sewadar_status_cd	IS 		NULL	)
				OR(	i.global_sewadar_status_cd	IS 		NULL	AND d.global_sewadar_status_cd 	IS NOT 	NULL	)
				OR( i.global_sewadar_status_cd	IS NOT 	NULL	AND	d.global_sewadar_status_cd	IS NOT 	NULL	AND i.global_sewadar_status_cd != d.global_sewadar_status_cd	)
				)							
END
GO

-- =============================================================================
--	Table 	SEWADARS_REGISTRATIONS
--	Trigger (DML) sets the current_sewadar_grno and current_satsang_centre_id in sewadars table on INSERT only
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_a_i_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_a_i_DML
GO

CREATE TRIGGER sewadars_registrations_a_i_DML ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT
AS
BEGIN
	UPDATE s
	SET		s.current_sewadar_grno		=	i.sewadar_grno,
			s.current_satsang_centre_id	=	i.satsang_centre_id
	FROM		inserted	i
		JOIN	sewadars	s 
			ON	(	i.sewadar_id	=	s.sewadar_id	)
	--- Commented following lines as the trigger is on INSERT only - JL
--		LEFT OUTER JOIN	deleted		d
--			ON	(	i.sewadar_id	=	d.sewadar_id	)
--	WHERE	s.sewadar_id	IS NOT 	NULL
--	AND		d.sewadar_id	IS 		NULL
END
GO

-- =============================================================================
--	Table 	SEWADARS_REGISTRATIONS
--	Trigger (DML) puts a record in sewadars_transfers on INSERT only; updates are the other way round
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_b_i_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_b_i_DML
GO

CREATE TRIGGER sewadars_registrations_b_i_DML ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT
AS
BEGIN
	INSERT INTO sewadars_transfers
			(	satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id	)
		SELECT	i.satsang_centre_id, i.sewadar_grno, i.department_dt, NULL, NULL, i.department_id, i.sub_department_id	
		FROM 	inserted i 
		WHERE	sewadar_type	=	'R'				--- We do not want to track the department transfers for Open and Trainee Sewadars
--			JOIN	sewadars_registrations	s
--				ON 	(	i.sewadar_id 	= 	s.sewadar_id	)					
END
GO

-- =============================================================================
--	Table 	SEWADARS_REGISTRATIONS
--	Trigger (DML) puts a record in sewadars_status_changes on every change (including INSERT), if there is a change
----		note that changing from NULL values or to NULL values is a change
--- Split the trigger into two separate triggers for INSERT and UPDATE
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_c_iu_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_c_iu_DML
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_c_i_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_c_i_DML
GO

CREATE TRIGGER sewadars_registrations_c_i_DML ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT
AS
BEGIN
	INSERT INTO sewadars_status_changes 
			(	satsang_centre_id, sewadar_grno, effective_dtm, old_sewadar_status_cd, sewadar_status_cd	)
		SELECT	i.satsang_centre_id, i.sewadar_grno, i.sewadar_status_dtm, NULL, i.sewadar_status_cd	
		FROM 	inserted i 
END
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_e_u_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_e_u_DML
GO

CREATE TRIGGER sewadars_registrations_e_u_DML ON sewadars_registrations
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	INSERT INTO sewadars_status_changes 
			(	satsang_centre_id, sewadar_grno, effective_dtm, old_sewadar_status_cd, sewadar_status_cd	)
		SELECT	i.satsang_centre_id, i.sewadar_grno, i.sewadar_status_dtm, d.sewadar_status_cd, i.sewadar_status_cd	
		FROM 	inserted i 
			JOIN	deleted	d
				ON	(	d.satsang_centre_id	=	i.satsang_centre_id	AND
						d.sewadar_grno		=	i.sewadar_grno
					)
		WHERE	(	(	i.sewadar_status_cd	IS NOT 	NULL	AND d.sewadar_status_cd	IS 		NULL	)
				OR	(	i.sewadar_status_cd	IS 		NULL	AND d.sewadar_status_cd	IS NOT 	NULL	)
				OR	(	i.sewadar_status_cd	IS NOT	NULL	AND	d.sewadar_status_cd	IS NOT 	NULL
					AND	i.sewadar_status_cd !=	d.sewadar_status_cd
					)
				)							
END
GO

-- =============================================================================
--	Table 	SEWADARS_REGISTRATIONS
--	Trigger (DML) puts a record in sewadars_responsibility_changes on every change (including INSERT, if specified), if there is a change
--- Split the trigger into two separate triggers for INSERT and UPDATE
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_d_iu_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_d_iu_DML
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_d_i_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_d_i_DML
GO

CREATE TRIGGER sewadars_registrations_d_i_DML ON sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT
AS
BEGIN
	INSERT INTO sewadars_responsibility_changes 
			(	satsang_centre_id, sewadar_grno, effective_dtm, old_responsibility, responsibility)
		SELECT	i.satsang_centre_id, i.sewadar_grno, GETDATE(), NULL, i.responsibility
		FROM 	inserted i 
		WHERE	i.responsibility	IS NOT 	NULL
END
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_f_u_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_f_u_DML
GO

CREATE TRIGGER sewadars_registrations_f_u_DML ON sewadars_registrations
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	INSERT INTO sewadars_responsibility_changes 
			(	satsang_centre_id, sewadar_grno, effective_dtm, old_responsibility, responsibility)
		SELECT	i.satsang_centre_id, i.sewadar_grno, GETDATE(), d.responsibility, i.responsibility
		FROM 	inserted i 
			JOIN deleted d
				ON	(	d.satsang_centre_id	=	i.satsang_centre_id	AND
						d.sewadar_grno		=	i.sewadar_grno
					)
		WHERE	( (	i.responsibility	IS NOT 	NULL	AND d.responsibility IS 	NULL	)
				OR(	i.responsibility	IS 		NULL	AND d.responsibility IS NOT NULL	)
				OR( i.responsibility	IS NOT 	NULL	AND d.responsibility IS NOT NULL AND 	i.responsibility !=	d.responsibility	)
				)							
END
GO

-- =============================================================================
--	Table 	SEWADARS_TRANSFERS
--	Trigger updates the department_id, sub_department_id in sewadars_registrations table.
--		Only INSERTs possible in this table, hence not including 
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_transfers_a_i_DML' AND xtype = 'TR')
	DROP TRIGGER sewadars_transfers_a_i_DML
GO

CREATE TRIGGER sewadars_transfers_a_i_DML ON sewadars_transfers
	WITH ENCRYPTION 
		FOR INSERT
AS
BEGIN
	UPDATE	swrg
		SET	department_id		= i.department_id,
			sub_department_id	= i.sub_department_id,
			department_dt		= i.effective_dt
	FROM	sewadars_registrations	swrg
		JOIN	inserted	i
			ON	(	i.satsang_centre_id	= swrg.satsang_centre_id
				AND	i.sewadar_grno		= swrg.sewadar_grno
			)
	WHERE	i.old_department_id	IS NOT NULL
END
GO

-- =============================================================================
--	Table 	TEAM_WISE_DAILY_ATTENDANCE
--	Trigger (DML) sets sewas.attendance_ts to Current Date & Time (using GetDate()) on each INSERT/UPDATE
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'team_wise_daily_attendance_a_iu_DML' AND xtype = 'TR')
	DROP TRIGGER team_wise_daily_attendance_a_iu_DML
GO

CREATE TRIGGER team_wise_daily_attendance_a_iu_DML ON team_wise_daily_attendance
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	UPDATE	s
		SET	s.attendance_ts	=	GETDATE()
	FROM	inserted	i
		JOIN	sewa_teams	st
			ON	(	i.sewa_team_id	= st.sewa_team_id	)
		JOIN	sewas	s
			ON	(	st.sewa_id		= s.sewa_id	)
END
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'team_wise_daily_attendance_aa_d_DML' AND xtype = 'TR')
	DROP TRIGGER team_wise_daily_attendance_aa_d_DML
GO

CREATE TRIGGER team_wise_daily_attendance_aa_d_DML ON team_wise_daily_attendance
	WITH ENCRYPTION 
		FOR DELETE
AS
BEGIN
	UPDATE	s
		SET	s.attendance_ts	=	GETDATE()
	FROM	deleted	i
		JOIN	sewa_teams	st
			ON	(	i.sewa_team_id	= st.sewa_team_id	)
		JOIN	sewas	s
			ON	(	st.sewa_id		= s.sewa_id	)
END
GO

-- =============================================================================
--	Table 	ARBITRARY_DAILY_PRESENCES
--	Trigger (DML) sets sewas.attendance_ts to Current Date & Time (using GetDate()) on each INSERT/UPDATE
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_a_iu_DML' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_a_iu_DML
GO

CREATE TRIGGER arbitrary_daily_presences_a_iu_DML ON arbitrary_daily_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	UPDATE	s
		SET	s.attendance_ts	=	GETDATE()
	FROM	sewas	s
		JOIN	inserted	i
			ON	(	i.sewa_id	=	s.sewa_id	)
END
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_daily_presences_aa_d_DML' AND xtype = 'TR')
	DROP TRIGGER arbitrary_daily_presences_aa_d_DML
GO

CREATE TRIGGER arbitrary_daily_presences_aa_d_DML ON arbitrary_daily_presences
	WITH ENCRYPTION 
		FOR DELETE
AS
BEGIN
	UPDATE	s
		SET	s.attendance_ts	=	GETDATE()
	FROM	sewas	s
		JOIN	deleted	i
			ON	(	i.sewa_id	=	s.sewa_id	)
END
GO

-- =============================================================================

-- =============================================================================
--	Table 	ARBITRARY_SHIFT_PRESENCES
--	Trigger (DML) sets sewas.attendance_ts to Current Date & Time (using GetDate()) on each INSERT/UPDATE
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_a_iu_DML' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_a_iu_DML
GO

CREATE TRIGGER arbitrary_shift_presences_a_iu_DML ON arbitrary_shift_presences
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	UPDATE	s
		SET	s.attendance_ts	=	GETDATE()
	FROM	sewas	s
		JOIN	inserted	i
			ON	(	i.sewa_id	=	s.sewa_id	)
END
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_aa_d_DML' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_aa_d_DML
GO

CREATE TRIGGER arbitrary_shift_presences_aa_d_DML ON arbitrary_shift_presences
	WITH ENCRYPTION 
		FOR DELETE
AS
BEGIN
	UPDATE	s
		SET	s.attendance_ts	=	GETDATE()
	FROM	sewas	s
		JOIN	deleted	i
			ON	(	i.sewa_id	=	s.sewa_id	)
END
GO

-- =============================================================================

-- =============================================================================
--	Table 	ARBITRARY_SUMMARISED_EXEMPTIONS
--	Trigger (DML) sets sewas.attendance_ts to Current Date & Time (using GetDate()) on each INSERT/UPDATE
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_summarised_exemptions_a_iu_DML' AND xtype = 'TR')
	DROP TRIGGER arbitrary_summarised_exemptions_a_iu_DML
GO

CREATE TRIGGER arbitrary_summarised_exemptions_a_iu_DML ON arbitrary_summarised_exemptions
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	UPDATE	s
		SET	s.attendance_ts	=	GETDATE()
	FROM	sewas	s
		JOIN	inserted	i
			ON	(	i.sewa_id	=	s.sewa_id	)
END
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_summarised_exemptions_aa_d_DML' AND xtype = 'TR')
	DROP TRIGGER arbitrary_summarised_exemptions_aa_d_DML
GO

CREATE TRIGGER arbitrary_summarised_exemptions_aa_d_DML ON arbitrary_summarised_exemptions
	WITH ENCRYPTION 
		FOR DELETE
AS
BEGIN
	UPDATE	s
		SET	s.attendance_ts	=	GETDATE()
	FROM	sewas	s
		JOIN	deleted	i
			ON	(	i.sewa_id	=	s.sewa_id	)
END
GO

-- =============================================================================
--	Table 	scanning_jobs
--	Trigger (DML) sets INSERTS a records in scanning_sub_jobs when has_sub_jobs is No
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanning_jobs_a_i_DML' AND xtype = 'TR')
	DROP TRIGGER scanning_jobs_a_i_DML
GO

CREATE TRIGGER scanning_jobs_a_i_DML ON scanning_jobs
	WITH ENCRYPTION 
		FOR INSERT
AS
BEGIN
	INSERT INTO	scanning_sub_jobs
			(	scanning_job_id, scanning_sub_job_nm, scanning_sub_job_sq	)
		SELECT	scanning_job_id, scanning_job_nm, 1
		FROM	inserted	x
			JOIN	scanning_job_types	y
				ON	(	x.scanning_job_type_cd	=	y.scanning_job_type_cd	)
		WHERE	y.has_sub_jobs	=	'No';
END
GO

-- =============================================================================

-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console

