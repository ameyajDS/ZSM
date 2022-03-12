-- =============================================================================
-- Procedure ProcessScannedAnnualAttendance
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ProcessScannedAnnualAttendance' AND xtype = 'P')
	DROP PROCEDURE ProcessScannedAnnualAttendance
GO

CREATE PROCEDURE ProcessScannedAnnualAttendance
(
	@p_scanning_job_id		scanning_job_id,
	@p_controlling_dt		SMALLDATETIME,
	@p_isConcluded			SMALLINT
)
WITH ENCRYPTION
AS
	DECLARE
		@type_effective_from	DATETIME,
		@type_effective_till	DATETIME,
		@is_date_wise			Boolean,
		@sewa_id				sewa_id,
		@job_effective_from		DATETIME,
		@job_effective_till		DATETIME,
		@job_is_closed			Boolean,
		@is_concluded			Boolean,
		@is_closed				Boolean,
		@cnt					INT,
		@screen_id				CHAR (6),
		@xfr_dtm				DATETIME,
		@max_processed_dt		SMALLDATETIME,
		@min_unprocessed_dt		SMALLDATETIME,
		@max_unprocessed_dt		SMALLDATETIME,
		@sewa_satsang_centre_id		satsang_centre_id,
		@sewa_start_dt				DATE,
		@sewa_finish_dt				DATE,
		@is_satsang_programme		Boolean,
		@sewa_frequency				sewa_frequency,
		@attendance_unit			attendance_unit,
		@attendance_marking			VARCHAR (10),
		@max_controlling_dt			DATE,
		@dt							DATE,
		@scanning_sub_job_id		INT
BEGIN
	
	--	====================================================================================================
	--	Perform certain checks
	--	====================================================================================================
	BEGIN TRY
	BEGIN TRANSACTION
		SELECT	@is_date_wise			= t.is_date_wise,
				@type_effective_from	= t.effective_from,
				@type_effective_till	= t.effective_till,
				@sewa_id				= j.sewa_id,
				@job_effective_from		= j.effective_from,
				@job_effective_till		= j.effective_till,
				@job_is_closed			= j.is_closed,
				@is_concluded			= j.is_concluded,
				@is_closed				= d.is_closed
		FROM	scanning_jobs_controlling_dates	d
			JOIN	scanning_jobs	j
				ON	(	d.scanning_job_id	=	j.scanning_job_id
					AND	d.scanning_job_id	=	@p_scanning_job_id
					AND	d.controlling_dt	=	@p_controlling_dt
					)
			JOIN	scanning_job_types	t
				ON	(	j.scanning_job_type_cd	=	t.scanning_job_type_cd	);
	
		SELECT	@sewa_satsang_centre_id		=	satsang_centre_id,
				@sewa_start_dt				=	start_dt,
				@sewa_finish_dt				=	finish_dt,
				@is_satsang_programme		=	is_satsang_programme,
				@sewa_frequency				=	sewa_frequency,
				@attendance_unit			=	attendance_unit,
				@attendance_marking			=	attendance_marking
		FROM	sewas
		WHERE	sewa_id	=	@sewa_id;
	
	

		IF (@@ROWCOUNT = 0)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Scanning Job for Processing', NULL, NULL 
			RETURN -1;
		END
	
		IF (@job_is_closed = 'Yes')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'the Scanning Job is Closed', NULL 
			RETURN -5;
		END

		IF (@is_concluded = 'Yes')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'the Scanning Job has been concluded', NULL 
			RETURN -6;
		END

		IF (@p_isConcluded = 1 and @is_closed = 'No')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'it is open', NULL 
			RETURN -7;
		END

		IF (@p_controlling_dt > GETDATE())
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'Controlling Date is a future date', NULL 
			RETURN -8;
		END

		SELECT	@max_processed_dt	=	MAX (controlling_dt)
		FROM	scanning_jobs_controlling_dates
		WHERE	scanning_job_id	=	@p_scanning_job_id
		AND		last_transfer_dtm	IS NOT NULL;

		IF (@max_processed_dt IS NOT NULL AND @@ROWCOUNT > 0 AND @max_processed_dt	>=	@p_controlling_dt)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'the Processing has been done already', NULL 
			RETURN -9;
		END

		SELECT	@min_unprocessed_dt	=	MIN (controlling_dt),
				@max_unprocessed_dt	=	MAX (controlling_dt)
		FROM	scanning_jobs_controlling_dates
		WHERE	scanning_job_id	=	@p_scanning_job_id
		AND		last_transfer_dtm	IS NULL;

		IF (@@ROWCOUNT = 0)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'the Period for Processing could not be found', NULL 
			RETURN -10;
		END

		IF (@p_controlling_dt NOT BETWEEN @min_unprocessed_dt AND @max_unprocessed_dt)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'the Controlling Date is not within the Processing Period', NULL 
			RETURN -11;
		END
	
		SELECT TOP 1 1 FROM scanned_badges
		IF (@@ROWCOUNT = 0)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'No Records scanned, delete the date if nothing to scan', NULL 
			RETURN -12;
		END
		
		IF (@p_controlling_dt NOT BETWEEN @sewa_start_dt AND @sewa_finish_dt)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'Controlling date is not within Sewa Period', NULL 
			RETURN -13;
		END

		IF (@is_satsang_programme = 'No')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'Sewa is not Satsang Programme', NULL 
			RETURN -14;
		END

		IF (@sewa_frequency != 'Daily' OR @attendance_marking != 'Team-wise')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'Sewa Frequency should be Daily and Attendance marking should be Team-wise', NULL 
			RETURN -15;
		END

		DECLARE	@tbl	TABLE
			(	sc_id		INTEGER,
				swd_grno	CHAR (6),
				sc_dtm		DATETIME,
				remarks		VARCHAR (100)
			)

		INSERT INTO	@tbl
			(	sc_id, swd_grno, sc_dtm	)
			SELECT DISTINCT	satsang_centre_id, sewadar_grno, controlling_dt
			FROM	scanned_badges	b
				JOIN	scanning_sub_jobs	j
					ON	(	j.scanning_job_id		=	@p_scanning_job_id
						AND	b.scanning_sub_job_id	=	j.scanning_sub_job_id
						AND	b.controlling_dt		=   @p_controlling_dt
						);

		SELECT TOP 1 @scanning_sub_job_id = b.scanning_sub_job_id
		FROM	scanned_badges	b
				JOIN	scanning_sub_jobs	j
					ON	(	j.scanning_job_id		=	@p_scanning_job_id
						AND	b.scanning_sub_job_id	=	j.scanning_sub_job_id
						AND	b.controlling_dt		=   @p_controlling_dt
						);
	
				---- Sewadar Status should be Permanent or Temporary or NI
		UPDATE	t
			SET	remarks	=	CASE	WHEN	sewadar_status_cd	NOT IN	(	'Temp', 'Perm', 'NI')
										THEN	'Status of Sewadar is [' + sewadar_status_cd + ']'
							END
		FROM	@tbl	t
			JOIN	sewadars_registrations	s
				ON	(	t.sc_id		=	s.satsang_centre_id
					AND	t.swd_grno	=	s.sewadar_grno
					)
		WHERE	remarks	IS	NULL;
	
		UPDATE	@tbl
			SET	remarks	=	'Satsang Centre of Sewadar does not match with Sewa'
		WHERE	remarks	IS	NULL
		AND		sc_id	!=	@sewa_satsang_centre_id;

		CREATE TABLE #SewaTeamAttendance
		(
			sewa_team_id	int,
			serial_id		int,
			sewadar_grno	char(6),
			attendance_dt	datetime
		)
		DECLARE @sewaTeamCount INT

		SELECT @sewaTeamCount = COUNT(*)
		FROM scanning_jobs_sewa_teams
		WHERE scanning_job_id = @p_scanning_job_id

		IF @sewaTeamCount > 0
		BEGIN 
			INSERT INTO #SewaTeamAttendance
			SELECT st.sewa_team_id, st.serial_id, st.sewadar_grno, t.sc_dtm			
			FROM @tbl t 
			INNER JOIN sewa_team_wise_sewadars st ON (t.swd_grno COLLATE DATABASE_DEFAULT = st.sewadar_grno)
			INNER JOIN scanning_jobs_sewa_teams sjst ON (sjst.sewa_team_id = st.sewa_team_id)
			INNER JOIN sewa_teams stt ON stt.sewa_team_id = sjst.sewa_team_id
			INNER JOIN sewas s ON s.sewa_id = stt.sewa_id 
			WHERE t.remarks IS NULL
			AND st.satsang_centre_id = @sewa_satsang_centre_id
			AND sjst.satsang_centre_id = @sewa_satsang_centre_id
			AND s.sewa_id = @sewa_id
		END
		ELSE
		BEGIN
			INSERT INTO #SewaTeamAttendance
			SELECT st.sewa_team_id, st.serial_id, st.sewadar_grno, t.sc_dtm as attendance_dt
			FROM @tbl t 
			INNER JOIN sewa_team_wise_sewadars st ON (t.swd_grno COLLATE DATABASE_DEFAULT = st.sewadar_grno)
			INNER JOIN sewa_teams stt ON stt.sewa_team_id = st.sewa_team_id
			INNER JOIN sewas s ON s.sewa_id = stt.sewa_id 
			WHERE t.remarks IS NULL
			AND st.satsang_centre_id = @sewa_satsang_centre_id
			AND s.sewa_id = @sewa_id
			
		END
		
		INSERT INTO team_wise_daily_attendance
		SELECT sta.sewa_team_id, sta.serial_id, sta.attendance_dt, 'P', null, 'Yes'
		FROM #SewaTeamAttendance sta 
		LEFT OUTER JOIN team_wise_daily_attendance tda ON 
		(	
				sta.sewa_team_id = tda.sewa_team_id 
			AND sta.serial_id = tda.serial_id 
			AND sta.attendance_dt = tda.attendance_dt 
		)
		WHERE tda.sewa_team_id is null

		MERGE team_wise_daily_attendance AS T
		USING #SewaTeamAttendance AS S
		ON ( 	T.sewa_team_id = S.sewa_team_id 
			AND T.serial_id	   = S.serial_id 
			AND T.attendance_dt = S.attendance_dt 
			AND (T.attendance = 'E' OR T.attendance = 'L'))
		WHEN MATCHED THEN
			UPDATE SET T.attendance = 'P', T.is_scanned = 'Yes', T.sewa_exemption_id = null;
			

		SELECT DISTINCT sewa_team_id 
		INTO #SewaTeamIds 
		FROM #SewaTeamAttendance

		MERGE sewa_teams_txn_ts AS T
		USING #SewaTeamIds AS S
		ON	(T.sewa_team_id = S.sewa_team_id
			AND	 T.attendance_dt = @p_controlling_dt)
			WHEN NOT MATCHED THEN
				INSERT (sewa_team_id, attendance_dt)
				VALUES (S.sewa_team_id, @p_controlling_dt);
						
		DROP TABLE #SewaTeamIds
		DROP TABLE #SewaTeamAttendance

		IF @p_isConcluded = 1
		BEGIN
			--SELECT ALL THE SEWADAR'S WHOSE ATTENDANCE IS MARKED AND SET IT AS ABSENT
			CREATE TABLE #FilteredTeamDailyAttendance(
			[sewa_team_id]		INT NOT NULL,
			[serial_id]			INT NOT NULL,
			[attendance_dt]		[smalldatetime] NOT NULL,
			[attendance]		[char](1) NOT NULL,
			[sewa_exemption_id] SMALLINT NULL,
			[is_scanned]		CHAR(3) NOT NULL
			)
			
			IF @sewaTeamCount > 0
			BEGIN
				INSERT INTO #FilteredTeamDailyAttendance
				SELECT twda.sewa_team_id,twda.serial_id,twda.attendance_dt,twda.attendance,twda.sewa_exemption_id,twda.is_scanned
				FROM team_wise_daily_attendance twda
				INNER JOIN scanning_jobs_sewa_teams sjst ON (twda.sewa_team_id = sjst.sewa_team_id)
				WHERE twda.sewa_team_id IN (select sewa_team_id from sewa_teams where sewa_id = @sewa_id)
				AND sjst.satsang_centre_id = @sewa_satsang_centre_id
				AND sjst.scanning_job_id = @p_scanning_job_id
				AND twda.attendance_dt = @p_controlling_dt
			END
			ELSE
			BEGIN
				INSERT INTO #FilteredTeamDailyAttendance
				SELECT * FROM team_wise_daily_attendance
				WHERE sewa_team_id IN (select sewa_team_id from sewa_teams where sewa_id = @sewa_id)
				AND attendance_dt = @p_controlling_dt
			END

			CREATE TABLE #SewaTeamBySewa
			(
				sewa_team_id	int,
				serial_id		int,
				attendance_dt	datetime
			)
			
			IF @sewaTeamCount > 0
			BEGIN
				INSERT INTO #SewaTeamBySewa
				SELECT st.sewa_team_id, serial_id, @p_controlling_dt AS attendance_dt
				FROM sewa_team_wise_sewadars st
				INNER JOIN scanning_jobs_sewa_teams sjst ON (sjst.sewa_team_id = st.sewa_team_id)
				INNER JOIN sewa_teams stt ON stt.sewa_team_id = sjst.sewa_team_id
				INNER JOIN sewas s ON s.sewa_id = stt.sewa_id 
				WHERE st.satsang_centre_id = @sewa_satsang_centre_id
				AND s.sewa_id = @sewa_id
			END
			ELSE
			BEGIN
				INSERT INTO #SewaTeamBySewa
				SELECT st.sewa_team_id, serial_id, @p_controlling_dt AS attendance_dt
				FROM sewa_team_wise_sewadars st
				INNER JOIN sewa_teams stt ON stt.sewa_team_id = st.sewa_team_id
				INNER JOIN sewas s ON s.sewa_id = stt.sewa_id 
				WHERE st.satsang_centre_id = @sewa_satsang_centre_id
				AND s.sewa_id = @sewa_id
			END	
			INSERT INTO team_wise_daily_attendance
			SELECT st.sewa_team_id, st.serial_id, st.attendance_dt, 'A', null, 'Yes' from #FilteredTeamDailyAttendance tda 
			RIGHT OUTER JOIN #SewaTeamBySewa st ON 
			(		tda.sewa_team_id = st.sewa_team_id 
					AND
					tda.serial_id = st.serial_id 		
					AND 
					tda.attendance_dt = st.attendance_dt
			)
			WHERE tda.sewa_team_id IS NULL

			DECLARE @ScannedAttnCount INT

			SELECT @ScannedAttnCount = COUNT(*) FROM team_wise_daily_attendance
			WHERE sewa_team_id IN (select sewa_team_id from sewa_teams where sewa_id = @sewa_id)
			AND attendance_dt = @p_controlling_dt
			AND attendance = 'P'

			UPDATE scanning_jobs_controlling_dates
			SET	last_transfer_dtm	=	GETDATE(),
				total_processed_cnt	=	@ScannedAttnCount
			WHERE scanning_job_id =  @p_scanning_job_id

			DROP TABLE #FilteredTeamDailyAttendance
			DROP TABLE #SewaTeamBySewa
		END

		MERGE scanned_badges_store AS T
		USING @tbl AS S
			ON (T.scanning_sub_job_id = @scanning_sub_job_id AND
				T.controlling_dt = @p_controlling_dt AND
				T.satsang_centre_id = S.sc_id AND 
				T.sewadar_grno COLLATE DATABASE_DEFAULT = S.swd_grno)
				WHEN MATCHED THEN
					UPDATE SET remarks = S.remarks
				WHEN NOT MATCHED THEN
				INSERT (	scanning_sub_job_id, controlling_dt, satsang_centre_id, sewadar_grno, scanned_dtm, Remarks	)
				VALUES (@scanning_sub_job_id, @p_controlling_dt, S.sc_id, S.swd_grno, S.sc_dtm, S.remarks);

		

		DELETE b FROM scanned_badges	b
		INNER JOIN	scanning_sub_jobs	j
			ON	(	j.scanning_job_id		=	@p_scanning_job_id
				AND	b.scanning_sub_job_id	=	j.scanning_sub_job_id
				AND	b.controlling_dt		=   @p_controlling_dt
				);

		SELECT * FROM @tbl
		WHERE remarks IS NOT NULL

		

	COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		--IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;
			
		DECLARE @ErrorNumber INT = ERROR_NUMBER();
		DECLARE @ErrorLine INT = ERROR_LINE();
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
		DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
		DECLARE @ErrorState INT = ERROR_STATE();
 
		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
END
GO
