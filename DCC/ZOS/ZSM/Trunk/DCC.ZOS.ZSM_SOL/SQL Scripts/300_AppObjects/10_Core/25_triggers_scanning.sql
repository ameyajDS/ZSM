/* ==================================================================================
    Source File		:	25_triggers_scanning.sql
    Author(s)		:	Jitendra Loyal (JL) / Sukhdev B. Darira (SB)
    Started On		:	Sun Nov 28 01:00:00 IST 2010
    Version			:	0.06
    Last updated	:	Sep 24, 2013
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
     AK : 23-Oct-2014
	 	* Trigger generic_sewadar_lists_a_iu moved to 25_triggers_scanning.sql
     JL : 24-Sep-2013
	 	* All triggers after raising the error, rollback the transaction.
	 JL : 0.05 : 08-Jan-2013
	 	* Trigger scanned_badges_a_i reviewed / edited to throw an error when the Controlling Date or 
		  the Scanning Job is closed depending upon whether the Job Type is date-wise or not respectively.
	 AJ : 0.04 : 29-Jul-2012
		* Added new trigger scanning_jobs_controlling_dates_b_i to ensure there 
		  can be no records (controlling_dt) for a scanning_job_id that has 
		  is_closed = Yes And LastTransferDTM as NULL
	 JL : 0.03 : 11-Jun-2012
		* Changes done on 10-Jun in Trigger scanning_jobs_controlling_dates_b_iu rolled back.
	 JL : 0.02 : 10-Jun-2012
		* Trigger scanning_jobs_controlling_dates_b_iu has been modified as it was not
		  ensuring one record of is_closed = 'No' during INSERT.
		* Trigger scanned_badges_a_i has been fixed to consider the controlling date apart
		  from the constant condition moved to WHERE clause (from LEFT OUTER JOIN ON clause).
     SB : 0.01 : 07-Jan-2011
		*  First Draft
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO


-- =============================================================================
--	Table	generic_sewadar_lists
--	Trigger ensures that the satsang_centre_id has is_main_centre set to Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'generic_sewadar_lists_a_iu' AND xtype = 'TR')
	DROP TRIGGER generic_sewadar_lists_a_iu
GO

CREATE TRIGGER generic_sewadar_lists_a_iu ON generic_sewadar_lists
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	satsang_centres_details		stcd
							ON	(	i.satsang_centre_id	= stcd.satsang_centre_id	
								AND	stcd.is_main_centre	= 'Yes'
								)
					WHERE	stcd.satsang_centre_id	IS	NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL,'Satsang Centre', 'a Main Centre', NULL
			ROLLBACK
			RETURN
		END	
END
GO
-- =============================================================================

-- =============================================================================
--	Table 	SCANNING_JOBS_PERIODS
--	Trigger ensures that effective_from/effective_till for scanning_jobs_periods is with in scanning_jobs effective_from/ effective_till date
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanning_jobs_periods_a_iu' AND xtype = 'TR')
	DROP TRIGGER scanning_jobs_periods_a_iu
GO

CREATE TRIGGER scanning_jobs_periods_a_iu	ON	scanning_jobs_periods
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	scanning_jobs	sj
							ON	(	sj.scanning_job_id	=	i.scanning_job_id  )			
					WHERE	sj.effective_from  > i.effective_from
					OR		sj.effective_till  < i.effective_till
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Period Effective From / Till Date', 'within the Scanning Job''s Effective From / Till Date', NULL
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SCANNING_JOBS_PERIODS
--	Trigger ensures that effective_from/effective_till for scanning_jobs_periods is with in sewas start/finish date
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanning_jobs_periods_b_iu' AND xtype = 'TR')
	DROP TRIGGER scanning_jobs_periods_b_iu
GO

CREATE TRIGGER scanning_jobs_periods_b_iu	ON	scanning_jobs_periods
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	scanning_jobs	sj
							ON	(	sj.scanning_job_id	=	i.scanning_job_id  )				
						JOIN	sewas s 
							ON 	(	s.sewa_id	= 	sj.sewa_id	)
					WHERE	s.start_dt	>	i.effective_from
					OR		s.finish_dt	<	i.effective_till
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Period Effective From / Till Date', 'within the Sewa''s Start / Finish Date', NULL
			ROLLBACK
			RETURN
		END
END
GO


-- =============================================================================
--	Table 	SCANNING_JOBS_PERIODS
--	Trigger ensures that effective_from/effective_till for scanning_jobs_periods is with in sewas_periods range, if sewas_periods exist for the sewa
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanning_jobs_periods_c_iu' AND xtype = 'TR')
	DROP TRIGGER scanning_jobs_periods_c_iu
GO

CREATE TRIGGER scanning_jobs_periods_c_iu	ON	scanning_jobs_periods
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT	TOP 1 1
					FROM 	inserted i 
						JOIN	scanning_jobs	sj
							ON	(	sj.scanning_job_id	=	i.scanning_job_id  )						
					WHERE	EXISTS	(	SELECT	TOP 1 1
										FROM	sewas_periods sp
										WHERE	sp.sewa_id	=	sj.sewa_id
									)
					AND		NOT EXISTS (	SELECT	TOP 1 1
											FROM	sewas_periods sp
											WHERE	sp.sewa_id	=	sj.sewa_id
											AND		i.effective_from	BETWEEN	sp.start_dt	AND	sp.finish_dt
											AND		i.effective_till	BETWEEN	sp.start_dt	AND	sp.finish_dt
									)
				)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Scanning Job Periods', 'within the Allotted Sewa Days (periods)', NULL
		ROLLBACK
		RETURN
	END 
END
GO

-- =============================================================================
--	Table 	SCANNING_JOBS_PERIODS
--	Trigger ensures that periods for a scanning-job are non-overlapping
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanning_jobs_periods_d_iu' AND xtype = 'TR')
	DROP TRIGGER scanning_jobs_periods_d_iu
GO

CREATE TRIGGER scanning_jobs_periods_d_iu	ON	scanning_jobs_periods
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT	TOP 1 1
					FROM 	inserted i 
						JOIN	scanning_jobs_periods	sjp
							ON	(	sjp.scanning_job_id	=	i.scanning_job_id
								AND	sjp.effective_from	!=	i.effective_from
								)
					WHERE	i.effective_from BETWEEN sjp.effective_from AND sjp.effective_till
					OR		i.effective_till BETWEEN sjp.effective_from AND sjp.effective_till

				)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'ObjectCannotBe', NULL,'Scanning Job Periods', 'overlapping', NULL
		ROLLBACK
		RETURN
	END 
END
GO

-- =============================================================================
--	Table 	SCANNING_SUB_JOBS_VALIDATIONS
--	Trigger ensures that recorded_sub_job_id and recording_sub_job_id belong to same scanning_job_id
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanning_sub_jobs_validations_a_i' AND xtype = 'TR')
	DROP TRIGGER scanning_sub_jobs_validations_a_i
GO

CREATE TRIGGER scanning_sub_jobs_validations_a_i ON scanning_sub_jobs_validations
	WITH ENCRYPTION 
		FOR INSERT
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
						LEFT OUTER JOIN	scanning_sub_jobs s
							ON	(	i.recorded_sub_job_id	=	s.scanning_sub_job_id	)
						LEFT OUTER JOIN	scanning_sub_jobs ss
							ON	(	i.recording_sub_job_id	=	ss.scanning_sub_job_id	)
						WHERE	s.scanning_job_id		=	ss.scanning_job_id
						AND		ss.scanning_sub_job_id	IS NULL

				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL,'Recorded / Recording Sub Job Id', ' Do not belong to same Scanning Job', NULL
			ROLLBACK
			RETURN
		END	
END
GO

-- =============================================================================
--	Table 	SCANNING_JOBS_CONTROLLING_DATES
--	Trigger ensures that INSERTing controlling_dt is > MAX (controlling_dt) for existing records.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanning_jobs_controlling_dates_a_i' AND xtype = 'TR')
	DROP TRIGGER scanning_jobs_controlling_dates_a_i
GO

CREATE TRIGGER scanning_jobs_controlling_dates_a_i ON scanning_jobs_controlling_dates
	WITH ENCRYPTION 
		FOR INSERT
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM	scanning_jobs_controlling_dates	sjcd		
						--	in order to implement > ANY, we take the MIN from the subquery, since there could be > 1 records inserted at a time, and all should comply
			   		WHERE	controlling_dt	>=	(	SELECT	MIN (controlling_dt)	
													FROM	inserted	i
													WHERE	sjcd.scanning_job_id	= i.scanning_job_id	
													AND		sjcd.controlling_dt		<>	i.controlling_dt	
												)					

				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL,'Controlling Date', '> MAX (controlling_dt) for existing records', NULL
			ROLLBACK
			RETURN
		END	
END
GO

-- =============================================================================
--	Table 	SCANNING_JOBS_CONTROLLING_DATES
--	Trigger ensures that there can be at most one record (controlling_dt) for a scanning_job_id that has is_closed = No
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanning_jobs_controlling_dates_b_iu' AND xtype = 'TR')
	DROP TRIGGER scanning_jobs_controlling_dates_b_iu
GO

CREATE TRIGGER scanning_jobs_controlling_dates_b_iu ON scanning_jobs_controlling_dates
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
	DECLARE	@v_count_of_rec		INTEGER
BEGIN

	SET @v_count_of_rec = 0

	SELECT @v_count_of_rec = COUNT(*)
	FROM 	inserted i
		JOIN	scanning_jobs_controlling_dates	sjcd
			ON	(	i.scanning_job_id	= sjcd.scanning_job_id	
				AND	sjcd.is_closed		= 'No'
				)
	GROUP BY	i.scanning_job_id
								
	IF	(	@v_count_of_rec > 1	 )
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL,'There', 'only One date that is Open', NULL
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SCANNING_JOBS_CONTROLLING_DATES
--	Trigger ensures that contolling_dt is with in scanning_jobs__periods, if scanning_jobs_periods exist for the scanning_job
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanning_jobs_controlling_dates_c_iu' AND xtype = 'TR')
	DROP TRIGGER scanning_jobs_controlling_dates_c_iu
GO

CREATE TRIGGER scanning_jobs_controlling_dates_c_iu ON scanning_jobs_controlling_dates
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
		IF EXISTS	(	SELECT	TOP 1 1
					FROM	inserted i
					WHERE	EXISTS	(	SELECT	TOP 1 1
										FROM	scanning_jobs_periods sjp
										WHERE	sjp.scanning_job_id	=	i.scanning_job_id
									)
					AND		NOT EXISTS (	SELECT	TOP 1 1
											FROM	scanning_jobs_periods sjp
											WHERE	sjp.scanning_job_id	=	i.scanning_job_id
											AND		i.controlling_dt	BETWEEN	sjp.effective_from	AND	sjp.effective_till
									)
				)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Controlling Date', 'within the Allotted Scanning Job Days (periods)', NULL
		ROLLBACK
		RETURN
	END 
END
GO

-- =============================================================================
--	Table 	SCANNING_JOBS_CONTROLLING_DATES
--	Trigger ensures that there can be no records (controlling_dt) for a scanning_job_id that has is_closed = Yes And LastTransferDTM as NULL
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanning_jobs_controlling_dates_d_i' AND xtype = 'TR')
	DROP TRIGGER scanning_jobs_controlling_dates_d_i
GO

CREATE TRIGGER scanning_jobs_controlling_dates_d_i ON scanning_jobs_controlling_dates
	WITH ENCRYPTION 
		FOR INSERT
AS
	DECLARE	@v_count_of_rec		INTEGER
BEGIN

	SET @v_count_of_rec = 0

	SELECT @v_count_of_rec = COUNT(*)
	FROM 	inserted i
		JOIN	scanning_jobs_controlling_dates	sjcd
			ON	(	i.scanning_job_id	= sjcd.scanning_job_id	
				AND	sjcd.is_closed		= 'Yes'
				AND sjcd.last_transfer_dtm IS NULL
				)
	GROUP BY	i.scanning_job_id
								
	IF	(	@v_count_of_rec > 0	 ) 
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL,'There', 'no date that is closed and not processed', NULL
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SCANNED_BADGES
--	Trigger ensures that is_closed in the Controlling Dates is No when record is INSERTed.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanned_badges_a_i' AND xtype = 'TR')
	DROP TRIGGER scanned_badges_a_i
GO

CREATE TRIGGER scanned_badges_a_i ON scanned_badges
	WITH ENCRYPTION 
		FOR INSERT
AS
BEGIN
	IF	NOT EXISTS	(	SELECT TOP 1 1
						FROM 	inserted i 
							JOIN scanning_sub_jobs ssjb
								ON	(	i.scanning_sub_job_id = ssjb.scanning_sub_job_id )
							JOIN scanning_jobs sj
								ON	(	sj.scanning_job_id = ssjb.scanning_job_id )
							JOIN scanning_job_types sjt
								ON	(	sjt.scanning_job_type_cd = sj.scanning_job_type_cd	)	 
							LEFT JOIN	scanning_jobs_controlling_dates	sjcd
								ON	(	ssjb.scanning_job_id	=	sjcd.scanning_job_id	
									AND	sjcd.controlling_dt		=	i.controlling_dt
									)
						WHERE	(	sjt.is_date_wise = 'Yes'	AND	sjcd.is_closed	=	'No'	AND	sjcd.scanning_job_id	IS NOT NULL	)
							OR	(	sjt.is_date_wise = 'No'		AND	sj.is_closed	=	'No'											)
					)
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Controlling Date/Scanning Job', 'having Closed as No', NULL
					ROLLBACK
					RETURN
				END
END
GO

-- =============================================================================
--	Table 	SCANNED_BADGES
--	Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanned_badges_b_iu' AND xtype = 'TR')
	DROP TRIGGER scanned_badges_b_iu
GO

CREATE TRIGGER scanned_badges_b_iu ON scanned_badges
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
						JOIN	scanning_sub_jobs	sj
							ON	(	sj.scanning_sub_job_id	=	i.scanning_sub_job_id	)
						JOIN	scanning_jobs	s
							ON	(	s.scanning_job_id	=	sj.scanning_job_id	)
						JOIN	scanning_job_types	t
							ON	(	t.scanning_job_type_cd	=	s.scanning_job_type_cd	)
						LEFT JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= i.satsang_centre_id
								AND	swrg.sewadar_grno		= i.sewadar_grno
								AND	swrg.satsang_centre_id	= s.satsang_centre_id
								)	
						LEFT OUTER JOIN	sewadars	swdr
							ON	(	swdr.sewadar_id			= swrg.sewadar_id	
								AND	swdr.current_satsang_centre_id	= i.satsang_centre_id
								AND	swdr.current_sewadar_grno		= i.sewadar_grno
								AND	swdr.current_satsang_centre_id	= s.satsang_centre_id
								)
					WHERE	(	(	t.check_in_sewadar_list	=	'No'
								OR	s.sewadar_list_id		IS	NULL
								)
								AND	swdr.sewadar_id	IS	NULL
							)
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL,'Scanned Badges', 'wrt current Satsang Centre & GRNO', NULL
			ROLLBACK
			RETURN
		END	
END
GO

-- =============================================================================
--	Table 	SCANNED_BADGES
--	Trigger ensures that satsang_centre_id, sewadar_grno exists in the generic_sewadar_lists_sewadars.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanned_badges_c_iu' AND xtype = 'TR')
	DROP TRIGGER scanned_badges_c_iu
GO

CREATE TRIGGER scanned_badges_c_iu ON scanned_badges
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i
						JOIN	scanning_sub_jobs	sj
							ON	(	sj.scanning_sub_job_id	=	i.scanning_sub_job_id	)
						JOIN	scanning_jobs	s
							ON	(	s.scanning_job_id	=	sj.scanning_job_id	)
						JOIN	scanning_job_types	t
							ON	(	t.scanning_job_type_cd	=	s.scanning_job_type_cd	)
						LEFT OUTER JOIN	generic_sewadar_lists_sewadars	gsls
							ON	(	i.satsang_centre_id		=	gsls.satsang_centre_id
								AND	i.sewadar_grno			=	gsls.sewadar_grno
								AND	gsls.sewadar_list_id	=	s.sewadar_list_id
								)
					WHERE	(	(	t.check_in_sewadar_list	=	'Yes'	)
							OR	(	t.check_in_sewadar_list	IS	NULL
								AND	s.sewadar_list_id		IS	NOT	NULL
								)
							)
					AND		gsls.sewadar_grno		IS NULL
						
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL,'Sewadar (Satsang Centre & GRNO)', 'existing in Generic Sewadar Lists', NULL
			ROLLBACK
			RETURN
		END	
END
GO

-- =============================================================================
--	Pending:Table 	SCANNED_BADGES
--	Trigger ensures that if system information code is specified for status, the status of sewadar matches with that.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanned_badges_d_iu' AND xtype = 'TR')
	DROP TRIGGER scanned_badges_d_iu
GO

CREATE TRIGGER scanned_badges_d_iu ON scanned_badges
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	scanning_sub_jobs	ssjb
							ON	(	i.scanning_sub_job_id	= ssjb.scanning_sub_job_id	)	
						JOIN	scanning_jobs		sjbs
							ON	(	ssjb.scanning_job_id	= sjbs.scanning_job_id	)
						JOIN	sewadars_registrations	swrg
							ON	(	i.satsang_centre_id		= swrg.satsang_centre_id	
								AND	i.sewadar_grno			= swrg.sewadar_grno
								)
						LEFT OUTER JOIN	system_information_values	sivs
							ON	(	sjbs.status_system_info_cd	= sivs.system_info_cd
								AND	swrg.sewadar_status_cd		= sivs.system_info_value
								)
					WHERE	sivs.system_info_cd		IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL,'Sewadar Status', 'matching with System Info Code of Scanning Job', NULL
			ROLLBACK
			RETURN
		END	
END
GO

-- =============================================================================
--	Table 	SCANNED_BADGES
--	Trigger ensures that if sewadar has global status defined, the record can NOT be manipulated (INSERTed or DELETEd).
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanned_badges_e_id' AND xtype = 'TR')
	DROP TRIGGER scanned_badges_e_id
GO

CREATE TRIGGER scanned_badges_e_id ON scanned_badges
	WITH ENCRYPTION 
		FOR INSERT, DELETE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewadars_registrations	swrg
							ON	(	swrg.satsang_centre_id	= i.satsang_centre_id
								AND	swrg.sewadar_grno		= i.sewadar_grno
								)	
						JOIN	sewadars	swdr
							ON	(	swdr.sewadar_id			= swrg.sewadar_id	
								AND	swdr.global_sewadar_status_cd	IS NOT	NULL
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectCannotBe', NULL,'Scanned Badge', 'INSERTed/DELETEd, coz Sewadar has Global status', NULL
			ROLLBACK
			RETURN
		END	
END
GO

-- =============================================================================
--	Table 	SCANNED_BADGES
--	Trigger ensures that if deleting is not allowed in (SCANNING_JOBS), the scanned badges can NOT be deleted from table SCANNED_BADGES.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanned_badges_f_d' AND xtype = 'TR')
	DROP TRIGGER scanned_badges_f_d
GO

CREATE TRIGGER scanned_badges_f_d ON scanned_badges
	WITH ENCRYPTION 
		FOR DELETE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	deleted	d 
						JOIN	scanning_sub_jobs	ssjb
							ON	(	d.scanning_sub_job_id	= ssjb.scanning_sub_job_id	)
						JOIN	scanning_jobs		sjbs
							ON	(	ssjb.scanning_job_id	= sjbs.scanning_job_id	
								AND	sjbs.is_deleting_allowed	= 'No'
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectCannotBe', NULL,'Scanned Badge', 'DELETED, as DELETING is not ALLOWED for ScannedJob', NULL
			ROLLBACK
			RETURN
		END	
END
GO

-- =============================================================================
--	Table 	SCANNED_BADGES
--	Trigger ensures that contolling_dt is with in scanning_jobs_periods, if scanning_jobs_periods exist for the scanning_job
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanned_badges_g_iu' AND xtype = 'TR')
	DROP TRIGGER scanned_badges_g_iu
GO

CREATE TRIGGER scanned_badges_g_iu ON scanned_badges
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT	TOP 1 1
					FROM	inserted i
						JOIN 	scanning_sub_jobs ssj
							ON  (   i.scanning_sub_job_id = ssj.scanning_sub_job_id)
					WHERE	EXISTS	(	SELECT	TOP 1 1
										FROM	scanning_jobs_periods sjp
										WHERE	sjp.scanning_job_id	=	ssj.scanning_job_id
									)
					AND		NOT EXISTS (	SELECT	TOP 1 1
											FROM	scanning_jobs_periods sjp
											WHERE	sjp.scanning_job_id	=	ssj.scanning_job_id
											AND		i.controlling_dt	BETWEEN	sjp.effective_from	AND	sjp.effective_till
									)
				)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Scanned Badge Controlling Date', 'within the Allotted Scanning Job Days (periods)', NULL
		ROLLBACK
		RETURN
	END 
END
GO
-- =============================================================================
--	Table 	SCANNED_BADGES
--	Trigger ensures that for multiple Scanning Jobs for same Sewa, effective_till_dt should be same
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'scanning_jobs_a_iu' AND xtype = 'TR')
	DROP TRIGGER scanning_jobs_a_iu
GO

CREATE TRIGGER scanning_jobs_a_iu ON scanning_jobs
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT	TOP 1 1
					FROM	inserted i
						JOIN 	scanning_jobs ssj
							ON  (   i.scanning_job_id != ssj.scanning_job_id
								AND i.sewa_id		   = ssj.sewa_id
								AND i.effective_till  != ssj.effective_till)
				)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Scanning Jobs Controlling Date', 'matching effective till date of other existing scanning job for sewa', NULL
		ROLLBACK
		RETURN
	END 
END
GO
-- =============================================================================

-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console
