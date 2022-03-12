-- This script should be run in Centre's db ONLY like ZSM_NGP
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='ImportFromCentreToZone'
			)
	BEGIN
		DROP PROCEDURE  ImportFromCentreToZone
	END
GO
CREATE PROCEDURE ImportFromCentreToZone
(
	@p_centre_code			CHAR (3),
	@p_is_error_report		BOOLEAN
)
WITH ENCRYPTION
AS
BEGIN
	
	DECLARE @centre_id INT,
			@stmt VARCHAR(101);

	SELECT @centre_id = satsang_centre_id FROM ZSM..satsang_centres_details
								WHERE 	centre_cd		= @p_centre_code
								AND		is_main_centre	=	'Yes'
	SELECT @stmt = 'ZSM_' + @p_centre_code

	IF DB_NAME() != @stmt
	BEGIN
		RAISERROR('Database name does not match with the Centre', 16, 1)
		RETURN;
	END 	

			----- All registrations at the Zone for that Centre
	DECLARE @sewadars_registrations TABLE
	(
		satsang_centre_id 			INT				NOT NULL,
		sewadar_grno				CHAR(6)			NOT NULL,	
		sewadar_id					INT				NOT NULL,
		PRIMARY KEY (satsang_centre_id, sewadar_grno) 
	);

	INSERT INTO @sewadars_registrations
           (satsang_centre_id, sewadar_grno, sewadar_id)
           SELECT sr.satsang_centre_id, sr.sewadar_grno, sr.sewadar_id
           FROM ZSM..sewadars_registrations sr 
           JOIN ZSM..sewadars s ON s.current_satsang_centre_id = sr.satsang_centre_id AND s.current_sewadar_grno = sr.sewadar_grno
           WHERE s.current_satsang_centre_id = @centre_id;

			----- All registrations at the Zone for that Centre above which are still "current" at the Centre
	DECLARE  @center_sewadars_registrations TABLE
	(
		satsang_centre_id 			INT				NOT NULL,
		sewadar_grno				CHAR(6)			NOT NULL,	
		sewadar_id					INT				NOT NULL	UNIQUE,
		PRIMARY KEY (satsang_centre_id, sewadar_grno) 
	);

	INSERT INTO @center_sewadars_registrations
          (satsang_centre_id, sewadar_grno, sewadar_id)
        SELECT t.satsang_centre_id, t.sewadar_grno, t.sewadar_id
		FROM @sewadars_registrations t JOIN sewadars s ON s.current_satsang_centre_id = t.satsang_centre_id AND s.current_sewadar_grno = t.sewadar_grno
		WHERE s.current_satsang_centre_id = @centre_id;
 
			----- All old registrations at the Zone for that Centre
	DECLARE  @center_sewadars_old_registrations TABLE
	(
		satsang_centre_id 			INT				NOT NULL,
		sewadar_grno				CHAR(6)			NOT NULL,	
		sewadar_id					INT				NOT NULL,
		PRIMARY KEY (satsang_centre_id, sewadar_grno) 
	);

	INSERT INTO @center_sewadars_old_registrations
          (satsang_centre_id, sewadar_grno, sewadar_id)
        SELECT t.satsang_centre_id, t.sewadar_grno, t.sewadar_id
		FROM ZSM..sewadars_registrations t
		WHERE 	t.satsang_centre_id	=	@centre_id
		AND	NOT EXISTS	(
			SELECT 1 FROM ZSM..sewadars s
			WHERE	s.current_satsang_centre_id = t.satsang_centre_id 
				AND s.current_sewadar_grno 		= t.sewadar_grno
			);
 
	DECLARE @new_sewadars TABLE
	(
		satsang_centre_id 			INT				NOT NULL,
		sewadar_grno				CHAR(6)			NOT NULL,	
		sewadar_id					INT				NOT NULL,
		PRIMARY KEY (satsang_centre_id, sewadar_grno) 
	);

	INSERT INTO @new_sewadars
			(satsang_centre_id, sewadar_grno, sewadar_id)
		SELECT z.satsang_centre_id, z.sewadar_grno, z.sewadar_id
		FROM	ZSM..sewadars_registrations	z
		WHERE	satsang_centre_id	=	@centre_id
		AND		NOT EXISTS	(	SELECT	1
								FROM	sewadars_registrations	c
								WHERE	c.satsang_centre_id	=	z.satsang_centre_id
								AND		c.sewadar_grno		=	z.sewadar_grno
								);
	
    DECLARE @sewas TABLE(sewa_id INT);

	INSERT INTO @sewas(sewa_id)
		SELECT 	a.sewa_id
		FROM sewas a
		WHERE a.satsang_centre_id = @centre_id;
	
    DECLARE @sewa_teams TABLE(sewa_team_id INT);

	INSERT INTO @sewa_teams(sewa_team_id)
		SELECT 	a.sewa_team_id
		FROM sewa_teams a
		JOIN @sewas s ON s.sewa_id = a.sewa_id;

	-- Error Reporting starts here
	IF @p_is_error_report = 'YES'
	BEGIN
		SELECT s.sewadar_id, s.first_nm, s.last_nm
		FROM sewadars s
		WHERE 
			NOT EXISTS	(	SELECT	1
							FROM	@center_sewadars_registrations csr
							WHERE	csr.sewadar_id	=	s.sewadar_id
						)
		AND NOT EXISTS	(	SELECT	1
							FROM	@center_sewadars_old_registrations csor
							WHERE	csor.sewadar_id	=	s.sewadar_id
						)
		AND NOT EXISTS	(	SELECT	1
							FROM	ZSM..additionally_exported_sewadars aes
							WHERE	aes.sewadar_id	=	s.sewadar_id
							AND		aes.exported_to_centre_id	=	@centre_id
						)
		AND NOT EXISTS	(	SELECT	1
							FROM	ZSM..sewadars_merged sm
							WHERE	sm.src_sewadar_id	=	s.sewadar_id
						)
		IF (@@ROWCOUNT > 0)
			RAISERROR('Sewadar which are added to centre''s sewadar table but not present in Zone. ', 16, 1)
		--    If there is error thrown in above due to change in registration of a sewadar in Zone (say from Nagpur to Zone), these needs to be manually verified before running the script.

		SELECT	first_nm, last_nm, gender, birth_dtm, COUNT(*) AS Cnt
		FROM	(	SELECT	first_nm, last_nm, gender, birth_dtm
					FROM	sewadars
					WHERE	sewadar_id	IN	(	SELECT DISTINCT sewadar_id FROM @center_sewadars_registrations	)
				UNION ALL
					SELECT	first_nm, last_nm, gender, birth_dtm
					FROM	ZSM..sewadars
					WHERE	sewadar_id	NOT IN	(	SELECT DISTINCT sewadar_id FROM @center_sewadars_registrations	)
				)	X
		GROUP BY first_nm, last_nm, gender, birth_dtm
		HAVING COUNT(*) > 1
		IF (@@ROWCOUNT > 0)
			RAISERROR('Information of these Sewadars will violate the UNIQUE constraint on First Name, Last Name, Gender and Date of Birth ', 16, 1)

		-- =================================================================================
		-- team_wise_daily_attendance
		-- =================================================================================

		SELECT	*
		FROM	ZSM..sewa_team_wise_sewadars t
			JOIN	@sewa_teams s ON t.sewa_team_id = s.sewa_team_id
		WHERE	NOT EXISTS	(	SELECT	1
								FROM	sewa_team_wise_sewadars tt
									JOIN	@sewa_teams ss
										ON	(tt.sewa_team_id = ss.sewa_team_id	)
								WHERE	tt.sewa_team_id	=	t.sewa_team_id
								AND		tt.serial_id	=	t.serial_id
							)
		IF (@@ROWCOUNT > 0)
			RAISERROR('Sewa-team wise Sewadars has some records in Zone which are not present in Centre and will be deleted irrevokably', 16, 1)

		-- =================================================================================
		-- sewadars_satsang_centre_transfers and sewadars_merged
		-- =================================================================================

		SELECT * FROM sewadars_satsang_centre_transfers
		IF (@@ROWCOUNT > 0)
			RAISERROR('sewadars_satsang_centre_transfers has entries present in the Centre', 16, 1)
			/*
		SELECT * FROM ZSM..sewadars_satsang_centre_transfers
		IF (@@ROWCOUNT > 0)
			RAISERROR('sewadars_satsang_centre_transfers has entries present in the Zone', 16, 1)
			*/
		SELECT * FROM sewadars_merged
		IF (@@ROWCOUNT > 0)
			RAISERROR('sewadars_merged has entries present in the Centre', 16, 1)

		-- =================================================================================
		-- sewadars_badge_issues_and_returns
		-- =================================================================================

		SELECT * FROM sewadars_badge_issues_and_returns
		IF (@@ROWCOUNT > 0)
			RAISERROR('sewadars_badge_issues_and_returns has entries present in the Centre', 16, 1)
		/*
		SELECT * FROM ZSM..sewadars_badge_issues_and_returns
		IF (@@ROWCOUNT > 0)
			RAISERROR('sewadars_badge_issues_and_returns has entries present in the Zone', 16, 1)
			*/

		-- =================================================================================
		-- sequence_controlling_information
		-- =================================================================================

		--Where sewa_id is NULL (in centre), it is an error
		SELECT * FROM sequence_controlling_information t
		WHERE t.sewa_id IS NULL
		IF (@@ROWCOUNT > 0)
			RAISERROR('sequence_controlling_information: sewa_id is NULL (in centre)', 16, 1)
		
		--For existing sat_cent, seq_id sewa_id is not same in zone and centre is error	    
		SELECT * FROM sequence_controlling_information t
		WHERE t.satsang_centre_id = @centre_id
			AND		EXISTS	(	SELECT	1
							FROM	ZSM..sequence_controlling_information	b
							WHERE	b.satsang_centre_id	=	t.satsang_centre_id
							AND		b.sequence_id		=	t.sequence_id
							AND		b.sewa_id			!=	t.sewa_id
						);
		IF (@@ROWCOUNT > 0)
			RAISERROR('sequence_controlling_information: For existing satsang_centre, seq_id sewa_id is not same in zone and centre', 16, 1)

		-- =================================================================================
		-- sewadars_txn_ts
		-- =================================================================================

		SELECT	*
		FROM	sewadars_txn_ts
		WHERE	satsang_centre_id	!=	@centre_id;
		IF (@@ROWCOUNT > 0)
			RAISERROR('sewadars_txn_ts : Sewadar TXN TIMESTAMP record doesn''t belong to the Centre', 16, 1)		

		SELECT * FROM sewadars_txn_ts  a
		WHERE	satsang_centre_id	=	@centre_id
		AND		NOT EXISTS	(	SELECT	1
								FROM	sewadars_registrations	r
								WHERE	r.satsang_centre_id	=	a.satsang_centre_id
								AND		r.sewadar_grno		=	a.sewadar_grno
							)
		IF (@@ROWCOUNT > 0)
			RAISERROR('sewadars_txn_ts : sewadar doesn''t belong to the Centre', 16, 1)		

		SELECT * FROM sewadars_txn_ts  a
		WHERE	NOT EXISTS	(	SELECT	1
								FROM	@sewas	s
								WHERE	s.sewa_id	=	a.sewa_id
							)
		IF (@@ROWCOUNT > 0)
			RAISERROR('sewadars_txn_ts : sewa doesn''t belong in the Centre', 16, 1)		

		SELECT * FROM ZSM..sewadars_txn_ts a
		JOIN @sewas s ON s.sewa_id = a.sewa_id
		WHERE	NOT EXISTS	(	SELECT	1
								FROM	sewadars_txn_ts t
								WHERE	t.satsang_centre_id = a.satsang_centre_id
								AND 	t.screen_id = a.screen_id
								AND 	t.sewa_id = a.sewa_id
								AND		t.sewadar_grno = a.sewadar_grno
							)	
		AND		NOT	EXISTS	(	SELECT	1
								FROM @new_sewadars ns
								WHERE	ns.satsang_centre_id	=	a.satsang_centre_id
								AND		ns.sewadar_grno			=	a.sewadar_grno
							)
		IF (@@ROWCOUNT > 0)
			PRINT('sewadars_txn_ts present in Zone and NOT in the Centre. These will be deleted from Zone.')

		-- =================================================================================
		-- sewa_teams_txn_ts
		-- =================================================================================

		SELECT * FROM sewa_teams_txn_ts  a
		WHERE	NOT EXISTS	(	SELECT	1
								FROM	@sewa_teams t
								WHERE	t.sewa_team_id	=	a.sewa_team_id
							)
		IF (@@ROWCOUNT > 0)
			RAISERROR('sewa_teams_txn_ts : sewa-team doesn''t belong in the Centre', 16, 1)		
		
		SELECT * FROM ZSM..sewa_teams_txn_ts a
		JOIN @sewa_teams st ON st.sewa_team_id = a.sewa_team_id
		WHERE	NOT	EXISTS	(	SELECT	1
								FROM	sewa_teams_txn_ts t
								WHERE	t.attendance_dt	= a.attendance_dt
								AND		t.sewa_team_id	= a.sewa_team_id
							)	
		IF (@@ROWCOUNT > 0)
			PRINT('sewa_teams_txn_ts present in Zone and NOT in the Centre. These will be deleted from Zone.')

	END
	-- Error Reporting ends here

	-- Import starts here
	IF @p_is_error_report = 'NO'
	BEGIN	        
	
		-- =================================================================================
		-- Sewas
		-- =================================================================================

		-- insert records from centre to zone while preserving identity column
		UPDATE s
		SET
			s.sewa_cd					=	t.sewa_cd,
			s.sewa_nm					=	t.sewa_nm,
			s.start_dt					=	t.start_dt,
			s.finish_dt					=	t.finish_dt,
			s.is_satsang_programme		=	t.is_satsang_programme,
			s.is_scanner_used			=	t.is_scanner_used,
			s.is_leave_allowed			=	t.is_leave_allowed,
			s.is_exemption_allowed		=	t.is_exemption_allowed,
			s.is_default_sewa			=	t.is_default_sewa,
			s.sewa_frequency			=	t.sewa_frequency,
			s.attendance_unit			=	t.attendance_unit,
			s.attendance_marking		=	t.attendance_marking,
			s.min_sewa_duration			=	t.min_sewa_duration,
			s.max_sewa_duration			=	t.max_sewa_duration,
			s.gents_born_after			=	t.gents_born_after,
			s.ladies_born_after			=	t.ladies_born_after,
			s.referred_sewa_id			=	t.referred_sewa_id,
			s.trainee_current_seq_id	=	t.trainee_current_seq_id,
			s.open_sewadar_current_seq_id = 	t.open_sewadar_current_seq_id,
			s.attendance_ts				=	t.attendance_ts,
			s.summary_ts				=	t.summary_ts,
			s.deleted_ts				=	t.deleted_ts,
			s.locked_dtm				=	t.locked_dtm
		FROM ZSM..sewas s
		JOIN sewas t ON s.sewa_id = t.sewa_id
		JOIN @sewas ts ON ts.sewa_id = s.sewa_id

		-- =================================================================================
		-- weekly_sewa_locations
		-- =================================================================================

		UPDATE s
		SET
			s.weekly_sewa_location_nm		=	t.weekly_sewa_location_nm,
			s.remarks						=	t.remarks,
			s.effective_from				=	t.effective_from,
			s.effective_till				=	t.effective_till
		FROM ZSM..weekly_sewa_locations s
		JOIN weekly_sewa_locations t ON s.weekly_sewa_location_id = t.weekly_sewa_location_id
		WHERE t.satsang_centre_id = @centre_id

		-- =================================================================================
		-- sewadars
		-- =================================================================================

		UPDATE	x
			SET	x.first_nm 				=	y.first_nm,
				x.middle_nm 			=	y.middle_nm,
				x.last_nm 				=	y.last_nm,
    			x.birth_dtm				=	y.birth_dtm,
				x.is_married			=	y.is_married,
				x.initiation_dt			=	y.initiation_dt,
				x.initiation_place_id	=	y.initiation_place_id,
				x.initiation_by			=	y.initiation_by
		FROM	ZSM..sewadars x
			JOIN sewadars y ON x.sewadar_id = y.sewadar_id
			WHERE x.sewadar_id IN (SELECT DISTINCT sewadar_id FROM @center_sewadars_registrations)

		-- =================================================================================
		-- sewadar_details
		-- =================================================================================
		UPDATE x
		SET
			x.address_proof					=	y.address_proof,
			x.other_address_proof_id		=	y.other_address_proof_id,
			x.telephone_mobile				=	y.telephone_mobile,
			x.telephone_residence			=	y.telephone_residence,
			x.telephone_office				=	y.telephone_office,
			x.occupation					=	y.occupation,
			x.attends_weekly_satsang		=	y.attends_weekly_satsang,
			x.weekly_satsang_centre_id		=	y.weekly_satsang_centre_id,
			x.has_hypertension				=	y.has_hypertension,
			x.is_diabetic					=	y.is_diabetic,
			x.has_skin_problem				=	y.has_skin_problem,
			x.has_epillepsy					=	y.has_epillepsy
		FROM ZSM..sewadars_details x
		JOIN sewadars_details y ON x.sewadar_id = y.sewadar_id
		WHERE x.sewadar_id IN (SELECT DISTINCT sewadar_id FROM @center_sewadars_registrations)

		-- =================================================================================
		-- sequence_controlling_information
		-- =================================================================================

		/*
		--update the last_no. Insert non-existing records
		UPDATE t
			SET
				t.last_no	=	s.last_no
		FROM ZSM..sequence_controlling_information t
		JOIN sequence_controlling_information s ON (t.satsang_centre_id = s.satsang_centre_id 
													AND t.sequence_id = s.sequence_id
													AND t.sewa_id = s.sewa_id
													AND s.sewa_id IS NOT NULL)
		WHERE t.satsang_centre_id = @centre_id AND t.sewa_id IS NOT NULL
		*/
		
		-- =================================================================================
		-- sewadars_registrations ... Update the references
		-- =================================================================================
		UPDATE x
		SET
			x.reference_1_sewadar_id	=	y.reference_1_sewadar_id,
			x.reference_1_relationship	=	y.reference_1_relationship,
			x.reference_1_nm			=	y.reference_1_nm,
			x.reference_1_centre_id		=	y.reference_1_centre_id,
			x.reference_1_department	=	y.reference_1_department,
                                                                        
			x.reference_2_sewadar_id	=	y.reference_2_sewadar_id,
			x.reference_2_relationship	=	y.reference_2_relationship,
			x.reference_2_nm			=	y.reference_2_nm,
			x.reference_2_centre_id		=	y.reference_2_centre_id,
			x.reference_2_department	=	y.reference_2_department
		FROM	ZSM..sewadars_registrations	x
			JOIN	@center_sewadars_registrations	c
				ON	(	x.satsang_centre_id	=	c.satsang_centre_id
					AND	x.sewadar_grno		=	c.sewadar_grno
					)
			JOIN	sewadars_registrations	y
				ON	(	x.satsang_centre_id	=	y.satsang_centre_id
					AND	x.sewadar_grno		=	y.sewadar_grno
					);
	END
	-- Import ends here

END
GO
