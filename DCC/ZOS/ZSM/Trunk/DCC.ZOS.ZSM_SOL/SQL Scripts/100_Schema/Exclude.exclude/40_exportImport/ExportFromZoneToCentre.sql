-- This script should be run in Centre's db ONLY like ZSM_NGP
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='ExportFromZoneToCentre'
			)
	BEGIN
		DROP PROCEDURE  ExportFromZoneToCentre
	END
GO
CREATE PROCEDURE ExportFromZoneToCentre
(
	@p_centre_code			CHAR (3),
	@p_is_error_report_only BOOLEAN
)
WITH ENCRYPTION
AS
BEGIN
	
	DECLARE @centre_id	INT,
			@stmt		VARCHAR(2000);

	SELECT @centre_id = satsang_centre_id FROM ZSM..satsang_centres_details
								WHERE 	centre_cd		= @p_centre_code
								AND		is_main_centre	=	'Yes'

	SELECT @stmt = 'ZSM_' + ISNULL(@p_centre_code, '');
	IF DB_NAME() != @stmt
	BEGIN
		RAISERROR('Database name does not match with the Centre', 16, 1)
		RETURN;
	END

	/*
	SELECT * FROM ZSM..sewadars_satsang_centre_transfers
	IF (@@ROWCOUNT > 0)
		RAISERROR('sewadars_satsang_centre_transfers has entries present in the Zone', 16, 1)
	
	SELECT * FROM ZSM..sewadars_badge_issues_and_returns
	IF (@@ROWCOUNT > 0)
		RAISERROR('sewadars_badge_issues_and_returns has entries present in the Zone', 16, 1)
		*/

-- Exporting Zone related information starts here
	IF @p_is_error_report_only = 'NO'
	BEGIN
		ALTER	TABLE	sewadars
		DROP	CONSTRAINT	Sewadars_FK_CurrentSatsangCentreID_CurrentSewadarGRNo
		
		EXEC _CopyFromZoneTable 'address_proofs';
		EXEC _CopyFromZoneTable 'address_types';
		EXEC _CopyFromZoneTable 'attendance_units';
		EXEC _CopyFromZoneTable 'badge_part_types';
		EXEC _CopyFromZoneTable 'post_offices_or_cities';
		EXEC _CopyFromZoneTable 'centre_functionaries';
		EXEC _CopyFromZoneTable 'sewadar_status';
		EXEC _CopyFromZoneTable 'sewadar_status_valid_transitions';
		EXEC _CopyFromZoneTable 'generic_attributes';
		EXEC _CopyFromZoneTable 'generic_attributes_list_values';
		EXEC _CopyFromZoneTable 'generic_attributes_status';
		EXEC _CopyFromZoneTable 'sewadar_types';
		EXEC _CopyFromZoneTable 'occupations';
		EXEC _CopyFromZoneTable 'remarks_types';
		EXEC _CopyFromZoneTable 'responsibilities';
		EXEC _CopyFromZoneTable 'scanning_validating_actions';
		EXEC _CopyFromZoneTable 'sewa_frequencies';
		EXEC _CopyFromZoneTable 'sewa_shifts';
		EXEC _CopyFromZoneTable 'sewadar_list_uses';
		EXEC _CopyFromZoneTable 'system_information_codes';
		EXEC _CopyFromZoneTable 'system_information_values';
		EXEC _CopyFromZoneTable 'colours';
		EXEC _CopyFromZoneTable 'badge_templates';
		EXEC _CopyFromZoneTable 'badge_templates_sewadar_status';
		EXEC _CopyFromZoneTable 'satsang_centres_details';
		UPDATE satsang_centres_details SET secretary_signature = NULL WHERE secretary_signature IS NOT NULL AND satsang_centre_id <> @centre_id;
		EXEC _CopyFromZoneTable 'satsang_centre_functionaries';

    -- =================================================================================
	-- sewas
	-- =================================================================================	
		SET @stmt	=	'	WHERE	satsang_centre_id = ' + CONVERT (VARCHAR(12), @centre_id) + '
							OR		EXISTS	(	SELECT	1
												FROM	ZSM..sewas_satsang_centres	b
												WHERE	b.sewa_id	=	a.sewa_id
												AND		b.satsang_centre_id	=	' + CONVERT (VARCHAR(12), @centre_id) + '
											) ';
		EXEC _CopyFromZoneTable 'sewas', NULL, @stmt;
		
		EXEC _CopyFromZoneTable 'sewas_periods',					NULL, ' JOIN sewas s ON (s.sewa_id = a.sewa_id) ';
		EXEC _CopyFromZoneTable 'sewas_sewa_shifts',				NULL, ' JOIN sewas s ON (s.sewa_id = a.sewa_id) ';
		EXEC _CopyFromZoneTable 'sewas_satsang_centres',			NULL, ' JOIN sewas s ON (s.sewa_id = a.sewa_id) ';
		EXEC _CopyFromZoneTable 'sewa_shifts_valid_combinations',	NULL, ' JOIN sewas s ON (s.sewa_id = a.sewa_id) ';

    -- =================================================================================
	-- credit_specifications
	-- =================================================================================
		EXEC _CopyFromZoneTable 'credit_specifications', @centre_id
		EXEC _CopyFromZoneTable 'credit_specifications_sewas', NULL, '	JOIN	credit_specifications s
																			ON	(	a.credit_specification_id = s.credit_specification_id	)';
    -- =================================================================================
	-- weekly_sewa_locations
	-- =================================================================================
		EXEC _CopyFromZoneTable 'weekly_sewa_locations', @centre_id;
		EXEC _CopyFromZoneTable 'departments';
		EXEC _CopyFromZoneTable 'departments_satsang_centres', @centre_id;
		EXEC _CopyFromZoneTable 'sub_departments';
		EXEC _CopyFromZoneTable 'sub_departments_satsang_centres', @centre_id;
		EXEC _CopyFromZoneTable 'sewa_exemptions';
		EXEC _CopyFromZoneTable 'medical_disabilities';
		EXEC _CopyFromZoneTable 'other_address_proofs';

		DELETE FROM ZSM..additionally_exported_sewadars
		WHERE exported_to_centre_id = @centre_id

		INSERT INTO ZSM..additionally_exported_sewadars
					(exported_to_centre_id, sewadar_id, satsang_centre_id, sewadar_grno)
						--- Reference 1
			SELECT	@centre_id, r.reference_1_sewadar_id,s.current_satsang_centre_id, s.current_sewadar_grno 
			FROM	ZSM..sewadars_registrations r 
				JOIN ZSM..sewadars s
					ON s.sewadar_id = r.reference_1_sewadar_id
			WHERE r.satsang_centre_id = @centre_id
		UNION
						--- Reference 2
			SELECT @centre_id, r.reference_2_sewadar_id,s.current_satsang_centre_id, s.current_sewadar_grno 
			FROM ZSM..sewadars_registrations r 
			JOIN ZSM..sewadars s ON s.sewadar_id = r.reference_2_sewadar_id
			WHERE r.satsang_centre_id = @centre_id
		UNION
						--- Sponsor
			SELECT @centre_id, r.sponsorer_id,s.current_satsang_centre_id, s.current_sewadar_grno 
			FROM ZSM..sewadars_registrations r 
			JOIN ZSM..sewadars s ON s.sewadar_id = r.sponsorer_id
			WHERE r.satsang_centre_id = @centre_id
		UNION
						--- Sewa Samiti Approver
			SELECT @centre_id, r.sewa_samiti_approver_id,s.current_satsang_centre_id, s.current_sewadar_grno 
			FROM ZSM..sewadars_registrations r 
			JOIN ZSM..sewadars s ON s.sewadar_id = r.sewa_samiti_approver_id
			WHERE r.satsang_centre_id = @centre_id
		UNION
						--- Security Approver
			SELECT @centre_id, r.security_approver_id,s.current_satsang_centre_id, s.current_sewadar_grno 
			FROM ZSM..sewadars_registrations r 
			JOIN ZSM..sewadars s ON s.sewadar_id = r.security_approver_id
			WHERE r.satsang_centre_id = @centre_id
		UNION
						--- Manually exported Sewadars
			SELECT	exported_to_centre_id, sewadar_id, satsang_centre_id, sewadar_grno
			FROM	ZSM..manually_exported_sewadars
			WHERE	exported_to_centre_id = @centre_id
		
		
				--- Remove those additionally exported Sewadars who are already registered at the Centre
		DELETE	s
		FROM	ZSM..additionally_exported_sewadars s
		WHERE	EXISTS	(	SELECT	1
							FROM	ZSM..sewadars_registrations t 
							WHERE	t.sewadar_grno		= s.sewadar_grno
							AND		t.satsang_centre_id = s.satsang_centre_id
							AND		t.satsang_centre_id = @centre_id
						)
		AND		exported_to_centre_id = @centre_id;

		SET @stmt	=	'	JOIN ZSM..additionally_exported_sewadars ad
								ON	(ad.sewadar_id = a.sewadar_id)
							WHERE ad.exported_to_centre_id = ' + CONVERT (VARCHAR(12), @centre_id) + '	';
		EXEC _CopyFromZoneTable 'sewadars',					NULL, @stmt;
		EXEC _CopyFromZoneTable 'sewadars_details',			NULL, @stmt;

		INSERT INTO sewadars_registrations
				(	satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt,
					sewadar_status_cd, sewadar_status_dtm, responsibility, responsibility_dtm,
					sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id,
					weekly_sewa_location_id, weekly_department_id, sewadar_type, sewa_id, location_district_id
				)
			SELECT	s.satsang_centre_id, s.sewadar_grno, s.sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt,
					sewadar_status_cd, sewadar_status_dtm, responsibility, responsibility_dtm,
					NULL, area_secretary_id, secretary_id, NULL, NULL,
					weekly_sewa_location_id, weekly_department_id, sewadar_type, sewa_id, location_district_id
			FROM	ZSM..sewadars_registrations s
				JOIN	ZSM..additionally_exported_sewadars ad
					ON	(	ad.satsang_centre_id	=	s.satsang_centre_id
						AND	s.sewadar_grno			=	ad.sewadar_grno
						)
			WHERE ad.exported_to_centre_id = @centre_id

		CREATE	TABLE	 #sewadars_registrations
		(
			satsang_centre_id 			INT		NOT NULL,
			sewadar_grno				CHAR(6)			NOT NULL,	
			sewadar_id					INT				NOT NULL,
			PRIMARY KEY (satsang_centre_id, sewadar_grno) 
		);

		INSERT INTO #sewadars_registrations
				(	satsang_centre_id, sewadar_grno, sewadar_id	)
			SELECT	satsang_centre_id, sewadar_grno, sewadar_id
			FROM	ZSM..sewadars_registrations
			WHERE	satsang_centre_id = @centre_id;

		EXEC _CopyFromZoneTable 'sewadars',					NULL, '	WHERE	a.sewadar_id IN (SELECT DISTINCT sewadar_id FROM #sewadars_registrations)
																	AND		NOT EXISTS	(	SELECT 1 FROM sewadars b WHERE a.sewadar_id = b.sewadar_id) ';
		EXEC _CopyFromZoneTable 'sewadars_details',			NULL, '	WHERE	a.sewadar_id IN (SELECT DISTINCT sewadar_id FROM #sewadars_registrations)	
																	AND		NOT EXISTS	(	SELECT 1 FROM sewadars_details b WHERE a.sewadar_id = b.sewadar_id) ';
		EXEC _CopyFromZoneTable 'sewadars_registrations',	@centre_id;
			
		-- Following is for sewadars whose current_satsang_centre <> @centre_id but have an older registration of @centre.
		-- If not inserted, this will result in having a sewadar in sewadars table whose current_grno does not exist in sewadars_registrations table.
		INSERT INTO sewadars_registrations
				(	satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt,
					sewadar_status_cd, sewadar_status_dtm, responsibility, responsibility_dtm,
					sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id,
					weekly_sewa_location_id, weekly_department_id, sewadar_type, sewa_id, location_district_id
				)
			SELECT 	s.satsang_centre_id, s.sewadar_grno, s.sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt,
					sewadar_status_cd, sewadar_status_dtm, responsibility, responsibility_dtm,
					NULL, area_secretary_id, secretary_id, NULL, NULL,
					weekly_sewa_location_id, weekly_department_id, sewadar_type, sewa_id, location_district_id
			FROM	ZSM..sewadars zs
				JOIN	ZSM..sewadars_registrations s
					ON	(	zs.current_satsang_centre_id 	= s.satsang_centre_id
						AND	zs.current_sewadar_grno			= s.sewadar_grno
						)
			WHERE	zs.current_satsang_centre_id <> @centre_id
			AND		EXISTS	(	SELECT	1
								FROM	ZSM..sewadars_registrations t
								WHERE 	t.sewadar_id		=	s.sewadar_id
								AND		t.satsang_centre_id	=	@centre_id
							)
			AND		NOT EXISTS	(	SELECT	1
									FROM	sewadars_registrations u
									WHERE	u.satsang_centre_id	=	s.satsang_centre_id
									AND		u.sewadar_grno		=	s.sewadar_grno
								)
			
		EXEC _CopyFromZoneTable 'sewadars_transfers',				NULL, ' JOIN #sewadars_registrations t	ON	(	a.sewadar_grno = t.sewadar_grno
																												AND a.satsang_centre_id = t.satsang_centre_id
																												)	';
		EXEC _CopyFromZoneTable 'sewadars_status_changes',			NULL, ' JOIN #sewadars_registrations t	ON	(	a.sewadar_grno = t.sewadar_grno
																												AND a.satsang_centre_id = t.satsang_centre_id
																												)	';
		EXEC _CopyFromZoneTable 'sewadars_responsibility_changes',	NULL, ' JOIN #sewadars_registrations t	ON	(	a.sewadar_grno = t.sewadar_grno
																												AND a.satsang_centre_id = t.satsang_centre_id
																												)	';
			
		-- =================================================================================
		-- Sewa Teams and Attendance
		-- =================================================================================
		EXEC _CopyFromZoneTable 'sewa_teams',						NULL, ' JOIN sewas s		ON (s.sewa_id = a.sewa_id) ';
		EXEC _CopyFromZoneTable 'sewa_team_wise_sewadars',			NULL, ' JOIN sewa_teams s	ON (s.sewa_team_id = a.sewa_team_id) ';
		EXEC _CopyFromZoneTable 'team_wise_daily_attendance',		NULL, ' JOIN sewa_teams s	ON (s.sewa_team_id = a.sewa_team_id) ';
		EXEC _CopyFromZoneTable 'arbitrary_daily_presences',		NULL, ' JOIN sewas s		ON (s.sewa_id = a.sewa_id) ';
		EXEC _CopyFromZoneTable 'arbitrary_shift_presences',		NULL, ' JOIN sewas s		ON (s.sewa_id = a.sewa_id) ';
		EXEC _CopyFromZoneTable 'arbitrary_summarised_exemptions',	NULL, ' JOIN sewas s		ON (s.sewa_id = a.sewa_id) ';
		EXEC _CopyFromZoneTable 'sewadar_wise_sewa_summaries',		NULL, ' JOIN sewas s		ON (s.sewa_id = a.sewa_id) ';
		EXEC _CopyFromZoneTable 'sewadars_txn_ts',					NULL, ' JOIN sewas s		ON (s.sewa_id = a.sewa_id) ';
		EXEC _CopyFromZoneTable 'sewa_teams_txn_ts',				NULL, ' JOIN sewa_teams s	ON (s.sewa_team_id = a.sewa_team_id) ';
		-- =================================================================================
		
		EXEC _CopyFromZoneTable 'credit_specifications_sewadars',	NULL, ' JOIN credit_specifications c	ON	(c.credit_specification_id = a.credit_specification_id)	';
		EXEC _CopyFromZoneTable 'generic_attributes_satsang_centres',	@centre_id;

			-- -To allow for creating Open and Trainee Sewadars at Centres, but how these will be merged back is yet to be established
		SET @stmt	=	'	WHERE satsang_centre_id = ' + CONVERT (VARCHAR(12), @centre_id) + '
							AND	  sewa_id IS NOT NULL	';

		EXEC _CopyFromZoneTable 'sequence_controlling_information',	NULL, @stmt;

		EXEC _CopyFromZoneTable 'sewadars_addresses',				NULL, '	WHERE	a.sewadar_id IN (SELECT DISTINCT sewadar_id FROM #sewadars_registrations)	';
		EXEC _CopyFromZoneTable 'sewadars_qualifications',			NULL, '	WHERE	a.sewadar_id IN (SELECT DISTINCT sewadar_id FROM #sewadars_registrations)	';
		EXEC _CopyFromZoneTable 'sewadars_other_disabilities',		NULL, '	WHERE	a.sewadar_id IN (SELECT DISTINCT sewadar_id FROM #sewadars_registrations)	';
		EXEC _CopyFromZoneTable 'sewadars_skills',					NULL, '	WHERE	a.sewadar_id IN (SELECT DISTINCT sewadar_id FROM #sewadars_registrations)	';
		EXEC _CopyFromZoneTable 'sewadars_particulars',				NULL, ' JOIN #sewadars_registrations t	ON	(	a.sewadar_grno = t.sewadar_grno
																												AND a.satsang_centre_id = t.satsang_centre_id
																												)	';

		EXEC _CopyFromZoneTable 'sewadars_attributes',				NULL, ' JOIN #sewadars_registrations t	ON	(	a.sewadar_grno = t.sewadar_grno
																												AND a.satsang_centre_id = t.satsang_centre_id
																												)	';
		EXEC _CopyFromZoneTable 'sewa_exemptions_applicable_sewas',	NULL, ' JOIN sewas s		ON (s.sewa_id = a.sewa_id) ';
		EXEC _CopyFromZoneTable 'scanning_job_types';
		EXEC _CopyFromZoneTable 'generic_reports';
		EXEC _CopyFromZoneTable '_sample_images';
		EXEC _CopyFromZoneTable 'sewadars_badges',					@centre_id;
		EXEC _CopyFromZoneTable 'sewadars_remarks',					NULL, '	WHERE	a.sewadar_id IN (SELECT DISTINCT sewadar_id FROM #sewadars_registrations)	';
																			-- AND a.remarks_type NOT IN ('Remarks')
		
		-- =================================================================================
		-- Sewadar Applications
		-- =================================================================================	
		SET @stmt	=	'	WHERE	application_centre_id = ' + CONVERT (VARCHAR(12), @centre_id);
		EXEC _CopyFromZoneTable 'sewadar_applications',						NULL, @stmt;

		EXEC _CopyFromZoneTable 'sewadar_application_qualifications',		NULL, ' JOIN sewadar_applications s ON (s.application_id = a.sewadar_application_id) ';
		EXEC _CopyFromZoneTable 'sewadar_application_other_disabilities',	NULL, ' JOIN sewadar_applications s ON (s.application_id = a.sewadar_application_id) ';
		EXEC _CopyFromZoneTable 'sewadar_application_skills',				NULL, ' JOIN sewadar_applications s ON (s.application_id = a.sewadar_application_id) ';

		ALTER TABLE	sewadars
			ADD	CONSTRAINT	Sewadars_FK_CurrentSatsangCentreID_CurrentSewadarGRNo
				FOREIGN KEY	(	current_satsang_centre_id, current_sewadar_grno	)
					REFERENCES	sewadars_registrations;
		DROP TABLE	#sewadars_registrations
	END
-- Exporting Zone related information starts here

END
GO

