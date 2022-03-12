/* ==================================================================================
    Source File		:	procs_fingerprints.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sun Nov 13 16:04 IST 2016
    Last updated	:	Nov 18, 2016
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		SP	ProcessScannedFingerPrints	:	Processes the records only in the date range
											specified.
		
    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	JL : 13 to 18-Nov-2016
		* Initial Version
   ==================================================================================*/


-- =============================================================================
-- Procedure ProcessScannedFingerPrints
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ProcessScannedFingerPrints' AND xtype = 'P')
	DROP PROCEDURE ProcessScannedFingerPrints
GO

CREATE PROCEDURE ProcessScannedFingerPrints
(
	@p_sewa_id			sewa_id,
	@p_start_dt			DATE,
	@p_end_dt			DATE,
	@p_fp_data			FingerPrintData			READONLY,
	@p_controlling_id	INTEGER		OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@sewa_satsang_centre_id		satsang_centre_id,
		@sewa_start_dt				DATE,
		@sewa_finish_dt				DATE,
		@is_satsang_programme		Boolean,
		@sewa_frequency				sewa_frequency,
		@attendance_unit			attendance_unit,
		@attendance_marking			VARCHAR (10),
		@max_controlling_dt			DATE,
		@dt							DATE,
		@start_dtm					DATETIME,
		@end_dtm					DATETIME,
		@sewa_shift1				sewa_shift,
		@sewa_shift2				sewa_shift,
		@sewa_shift3				sewa_shift,
		@sun_sewa_shift				sewa_shift,
		@sun_shift_sq				INT,
		@is_sun						BIT;
BEGIN
	
	--	====================================================================================================
	--	Perform certain checks
	--	====================================================================================================
	SELECT	@sewa_satsang_centre_id		=	satsang_centre_id,
			@sewa_start_dt				=	start_dt,
			@sewa_finish_dt				=	finish_dt,
			@is_satsang_programme		=	is_satsang_programme,
			@sewa_frequency				=	sewa_frequency,
			@attendance_unit			=	attendance_unit,
			@attendance_marking			=	attendance_marking
	FROM	sewas
	WHERE	sewa_id	=	@p_sewa_id;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa for the Sewa ID', NULL, NULL 
		RETURN -1;
	END

	IF (@p_start_dt NOT BETWEEN @sewa_start_dt AND @sewa_finish_dt)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Start date is not within Sewa Period', NULL 
		RETURN -2;
	END

	IF (@p_end_dt NOT BETWEEN @sewa_start_dt AND @sewa_finish_dt)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'End date is not within Sewa Period', NULL 
		RETURN -3;
	END

	IF (@is_satsang_programme = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Sewa is for Satsang Programme', NULL 
		RETURN -4;
	END

	IF (@sewa_frequency != 'Arbitrary' OR @attendance_marking != 'Arbitrary')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Sewa Frequency as well as Attendance marking should be Arbitrary', NULL 
		RETURN -5;
	END

	IF (@attendance_unit != 'Shift')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Attendance Unit for Sewa should be Shift', NULL 
		RETURN -6;
	END

	SELECT	@max_controlling_dt	=	MAX (end_dt)
	FROM	sewas_fp_controlling_dates
	WHERE	sewa_id	=	@p_sewa_id;

	IF (@max_controlling_dt	IS NOT NULL AND @p_start_dt <= @max_controlling_dt)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Start date is earlier than the previous processing', NULL
		RETURN -7;
	END

	SELECT	@sewa_shift1	=	sewa_shift
	FROM	sewas_sewa_shifts
	WHERE	sewa_id		=	@p_sewa_id
	AND		sewa_shift_sq	=	1;

	SELECT	@sewa_shift2	=	sewa_shift
	FROM	sewas_sewa_shifts
	WHERE	sewa_id		=	@p_sewa_id
	AND		sewa_shift_sq	=	2;

	SELECT	@sewa_shift3	=	sewa_shift
	FROM	sewas_sewa_shifts
	WHERE	sewa_id		=	@p_sewa_id
	AND		sewa_shift_sq	=	3;

	SELECT	@sun_shift_sq	=	value_int
	FROM	system_information_values
	WHERE	system_info_cd	=	'SundayShiftSq';

	SELECT	@sun_sewa_shift	=	sewa_shift
	FROM	sewas_sewa_shifts
	WHERE	sewa_id			=	@p_sewa_id
	AND		sewa_shift_sq	=	@sun_shift_sq;

	IF (@sewa_shift1 IS NULL OR @sewa_shift2 IS NULL OR @sewa_shift3 IS NULL OR @sun_sewa_shift IS NULL)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Sewa Shifts (also for Sunday) are NOT defined for the Sewa', NULL
		RETURN -8;
	END

	SET @start_dtm = CONVERT (datetime, CONVERT (varchar, @p_start_dt, 106) + ' 00:00:00')
	SET @end_dtm = CONVERT (datetime, CONVERT (varchar, @p_end_dt, 106) + ' 23:59:59.99')

	DECLARE	@tbl	TABLE
		(	swd_id		INTEGER,
			sc_id		INTEGER,
			swd_grno	CHAR (6),
			sc_dtm		DATETIME,
			remarks		VARCHAR (100)
		)

	INSERT INTO	@tbl
		(	swd_id, sc_dtm	)
		SELECT	sewadar_id, fp_scan_dtm
		FROM	@p_fp_data
		WHERE	fp_scan_dtm	BETWEEN	@start_dtm	AND	@end_dtm;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'records NOT found for specified range of dates', NULL
		RETURN -9;
	END

	DECLARE
		@min_half_day_minutes	SMALLINT,
		@min_full_day_minutes	SMALLINT,
		@cut_off_hours			SMALLINT,
		@entry_begin_hours		SMALLINT,
		@exit_end_hours			SMALLINT,
		@sunday_checkout_hours	SMALLINT;

	SELECT	@min_half_day_minutes	=	value_int
	FROM	system_information_values
	WHERE	system_info_cd	=	'MinHalfDayMin';
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Minimum minutes for a Half day are not specified', NULL
		RETURN -10;
	END

	SELECT	@min_full_day_minutes	=	value_int
	FROM	system_information_values
	WHERE	system_info_cd	=	'MinFullDayMin';
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Minimum minutes for a Full day are not specified', NULL
		RETURN -11;
	END

	SELECT	@cut_off_hours	=	value_int
	FROM	system_information_values
	WHERE	system_info_cd	=	'CutOff2ndHalf';
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Cut-off Hours for Second Half Day are not specified', NULL
		RETURN -12;
	END

	SELECT	@sunday_checkout_hours	=	value_int
	FROM	system_information_values
	WHERE	system_info_cd	=	'SunChkOutAftr';
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Check-out hours for Sunday are not specified', NULL
		RETURN -13;
	END

	SELECT	@entry_begin_hours	=	value_int
	FROM	system_information_values
	WHERE	system_info_cd	=	'EntryBeginHrs';
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Entry Begins time is not specified', NULL
		RETURN -14;
	END

	SELECT	@exit_end_hours	=	value_int
	FROM	system_information_values
	WHERE	system_info_cd	=	'ExitEndHrs';
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Exit Ends time is not specified', NULL
		RETURN -15;
	END

	IF EXISTS	(	SELECT	1
					FROM	arbitrary_shift_presences
					WHERE	sewa_id	=	@p_sewa_id
					AND		presence_dt	BETWEEN	@p_start_dt	AND	@p_end_dt
				)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanned Fingerprints', 'Presences are already recorded for the Sewa', NULL
		RETURN -16;
	END

	DECLARE
		@entry_begins_str	VARCHAR (10),
		@exit_ends_str		VARCHAR (10);

	SET @entry_begins_str = ' ' +	CASE WHEN @entry_begin_hours < 1000	THEN	'0' + CONVERT (VARCHAR, @entry_begin_hours / 100)
																	ELSE	CONVERT (VARCHAR, @entry_begin_hours / 100)
									END
							+ ':' +	CONVERT (VARCHAR, @entry_begin_hours % 100)

	SET @exit_ends_str = ' ' +	CASE WHEN @exit_end_hours < 1000	THEN	'0' + CONVERT (VARCHAR, @exit_end_hours / 100)
																	ELSE	CONVERT (VARCHAR, @exit_end_hours / 100)
									END
							+ ':' +	CONVERT (VARCHAR, @exit_end_hours % 100)

	--	Get Current Satsang Centre ID and Sewadar G.R.No for Sewadars
	UPDATE	t
		SET	sc_id	=	current_satsang_centre_id,
			swd_grno	=	current_sewadar_grno,
			remarks		=	CASE	WHEN	global_sewadar_status_cd	IS NOT NULL	THEN	'Global Status of Sewadar is [' + global_sewadar_status_cd + ']'	END
	FROM	@tbl	t
		JOIN	sewadars	s
			ON	(	t.swd_id	=	s.sewadar_id	);
	
		---- We cannot process if Current Satsang Centre ID or Sewadar G.R.No for Sewadar is not defined
	UPDATE	@tbl
		SET	remarks	=	'Current Satsang Centre and G.R.No. not found'
	WHERE	sc_id	IS NULL
	OR		swd_grno	IS	NULL;


		---- Sewadar Status should be Permanent or Temporary or NI
	UPDATE	t
		SET	remarks	=	CASE	WHEN	sewadar_status_cd	NOT IN	(	'Temp', 'Perm', 'NI'	)
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

		---- We cannot process if entries are before the Entry Begin Hours
	UPDATE	@tbl
		SET	remarks	=	'Record is before the Entry Begins Time'
	WHERE	remarks	IS NULL
	AND		sc_dtm	<	CONVERT (DATETIME, CONVERT (VARCHAR (11), sc_dtm, 106) + @entry_begins_str)


		---- We cannot process if entries are after the Exit End Hours
	UPDATE	@tbl
		SET	remarks	=	'Record is after the Exit Ends Time'
	WHERE	remarks	IS NULL
	AND		sc_dtm	>	CONVERT (DATETIME, CONVERT (VARCHAR (11), sc_dtm, 106) + @exit_ends_str)


	DECLARE	@dtbl	TABLE
		(	dt		DATE	NOT	NULL	PRIMARY	KEY,
			is_sun	BIT		NOT NULL
		);
	
	SET	@dt	=	@p_start_dt;
	IF (SUBSTRING (DATENAME (WEEKDAY, @dt), 1, 3) = 'Sun')
		SET @is_sun = 1;
	ELSE
		SET @is_sun = 0;
	INSERT	INTO	@dtbl	VALUES	(	@dt, @is_sun	);
	WHILE (@dt	<	@p_end_dt)
	BEGIN
		SET	@dt	=	DATEADD (d, 1, @dt);
		IF (SUBSTRING (DATENAME (WEEKDAY, @dt), 1, 3) = 'Sun')
			SET @is_sun = 1;
		ELSE
			SET @is_sun = 0;
		INSERT	INTO	@dtbl	VALUES	(	@dt, @is_sun	);
	END
	
	DECLARE	@agg_tbl	TABLE
		(	swd_id		INTEGER		NOT NULL,
			dt			DATE		NOT NULL,
			is_sun		BIT			NOT NULL,
			min_dtm		DATETIME	NOT NULL,
			max_dtm		DATETIME	NOT NULL,
			shift		sewa_shift		NULL
		)

	INSERT	INTO	@agg_tbl
			(	swd_id, dt, is_sun, min_dtm, max_dtm	)
		SELECT	swd_id, dt, is_sun, MIN (sc_dtm), MAX (sc_dtm)
		FROM	@tbl	t
			JOIN	@dtbl	d
				ON	(	d.dt	=	CONVERT (DATE, t.sc_dtm)	)
		WHERE	t.remarks	IS NULL
		GROUP BY swd_id, dt, is_sun;

	UPDATE	t
		SET	remarks	=	'Only one record found for a day'
	FROM	@tbl	t
		JOIN	@agg_tbl	a
			ON	(	a.swd_id	=	t.swd_id
				AND	a.min_dtm	=	t.sc_dtm
				AND	a.max_dtm	=	t.sc_dtm
				)
	WHERE	remarks	IS	NULL;

	DELETE	@agg_tbl
	WHERE	min_dtm	=	max_dtm;

	UPDATE	t
		SET	remarks	=	'Intermediate record found for a day'
	FROM	@tbl	t
		JOIN	@agg_tbl	a
			ON	(	a.swd_id	=	t.swd_id
				AND	t.sc_dtm	>	a.min_dtm
				AND	t.sc_dtm	<	a.max_dtm
				)
	WHERE	remarks	IS	NULL;

	UPDATE	t
		SET	remarks	=	'Duration is less than minimum allowed'
	FROM	@tbl	t
		JOIN	@agg_tbl	a
			ON	(	t.swd_id	=	a.swd_id
				AND	t.sc_dtm	IN	(	a.min_dtm, a.max_dtm	)
				)
	WHERE	DATEDIFF (mi, a.min_dtm, a.max_dtm)	<	@min_half_day_minutes
	AND		remarks	IS	 NULL;

	DECLARE
		@sun_chkout_str	VARCHAR (10);

	SET @sun_chkout_str = ' ' +	CASE WHEN @sunday_checkout_hours < 1000	THEN	'0' + CONVERT (VARCHAR, @sunday_checkout_hours / 100)
																ELSE	CONVERT (VARCHAR, @sunday_checkout_hours / 100)
								END
						+ ':' +	CONVERT (VARCHAR, @sunday_checkout_hours % 100)

	UPDATE	t
		SET	remarks	=	'Check-out is before the Specified hours on Sunday'
	FROM	@tbl	t
		JOIN	@agg_tbl	a
			ON	(	t.swd_id	=	a.swd_id
				AND	t.sc_dtm	IN	(	a.min_dtm, a.max_dtm	)
				AND	a.is_sun	=	1
				)
	WHERE	a.max_dtm	<	CONVERT (DATETIME, CONVERT (VARCHAR (11), a.dt, 106) + @sun_chkout_str)
	AND		remarks	IS	 NULL;

		---- Delete the intermediate records
	DELETE	a
	FROM	@agg_tbl	a
		JOIN	@tbl	t
			ON	(	t.swd_id	=	a.swd_id
				AND	t.sc_dtm	IN	(	a.min_dtm, a.max_dtm	)
				)
	WHERE	t.remarks	IS	NOT	NULL;

	DECLARE
		@shift_1_cnt	INTEGER,
		@shift_2_cnt	INTEGER,
		@shift_3_cnt	INTEGER,
		@sun_shift_cnt	INTEGER,
		@cut_off_str	VARCHAR (10);
	
	SET @cut_off_str = ' ' +	CASE WHEN @cut_off_hours < 1000	THEN	'0' + CONVERT (VARCHAR, @cut_off_hours / 100)
																ELSE	CONVERT (VARCHAR, @cut_off_hours / 100)
								END
						+ ':' +	CONVERT (VARCHAR, @cut_off_hours % 100)

		--	Assign the specified shift for Sunday
	UPDATE	@agg_tbl
		SET	shift	=	@sun_sewa_shift
	WHERE	is_sun	=	1;
	SET @sun_shift_cnt	=	@@ROWCOUNT;

		--	Assign second shift when sewa minutes exceed the full day sewa minutes
	UPDATE	@agg_tbl
		SET	shift	=	@sewa_shift2
	WHERE	DATEDIFF (mi, min_dtm, max_dtm)	>=	@min_full_day_minutes
	AND		shift	IS	NULL;
	SET @shift_2_cnt	=	@@ROWCOUNT;

		--	Assign third shift for sewa start time after cut-off hours
	UPDATE	@agg_tbl
		SET	shift	=	@sewa_shift3
	WHERE	min_dtm	>=	CONVERT (DATETIME, CONVERT (VARCHAR (11), min_dtm, 106) + @cut_off_str)
	AND		shift	IS	NULL
	SET @shift_3_cnt	=	@@ROWCOUNT;

		--	Assign first shift for remaining records
	UPDATE	@agg_tbl
		SET	shift	=	@sewa_shift1
	WHERE	shift	IS	NULL
	SET @shift_1_cnt	=	@@ROWCOUNT;

	IF (@sun_shift_sq = 1)
		SET @shift_1_cnt = @shift_1_cnt + @sun_shift_cnt;
	ELSE IF (@sun_shift_sq = 2)
		SET @shift_2_cnt = @shift_2_cnt + @sun_shift_cnt;
	ELSE IF (@sun_shift_sq = 3)
		SET @shift_3_cnt = @shift_3_cnt + @sun_shift_cnt;

	---- We are done.... so final INSERTs

	INSERT	INTO	sewas_fp_controlling_dates
			(	sewa_id, start_dt, end_dt, processing_dtm, shift_1_cnt, shift_2_cnt, shift_3_cnt	)
		VALUES
			(	@p_sewa_id, @p_start_dt, @p_end_dt, GetDate(), @shift_1_cnt, @shift_2_cnt, @shift_3_cnt	)
	SET	@p_controlling_id	=	SCOPE_IDENTITY ();

	INSERT	INTO	scanned_fingerprints
		(	controlling_id, sewadar_id, scanned_dtm, satsang_centre_id, sewadar_grno, remarks	)
		SELECT	@p_controlling_id, swd_id, sc_dtm, sc_id, swd_grno, remarks
		FROM	@tbl
		WHERE	remarks	IS NOT NULL;

	INSERT	INTO	scanned_fingerprints_store
		(	controlling_id, sewadar_id, scanned_dtm, satsang_centre_id, sewadar_grno, sewa_shift, is_start	)
		SELECT	@p_controlling_id, t.swd_id, t.sc_dtm, t.sc_id, t.swd_grno, a.shift, CASE WHEN t.sc_dtm = a.min_dtm THEN 1 WHEN t.sc_dtm = a.max_dtm THEN 0 END
		FROM	@agg_tbl	a
			JOIN	@tbl	t
				ON	(	t.swd_id	=	a.swd_id
					AND	t.sc_dtm	IN	(	a.min_dtm, a.max_dtm	)
					);

	INSERT	INTO	arbitrary_shift_presences
		(	sewa_id, satsang_centre_id, sewadar_grno, presence_dt, sewa_shift, is_scanned	)
		SELECT	@p_sewa_id, t.sc_id, t.swd_grno, a.dt, a.shift, 'Yes'
		FROM	@agg_tbl	a
			JOIN	@tbl	t
				ON	(	t.swd_id	=	a.swd_id
					AND	t.sc_dtm	=	a.min_dtm
					);

	INSERT	INTO	sewadars_txn_ts
			(	satsang_centre_id, sewadar_grno, sewa_id, screen_id	)
		SELECT	DISTINCT	t.sc_id, t.swd_grno, @p_sewa_id, 'ATT_06'
		FROM	@agg_tbl	a
			JOIN	@tbl	t
				ON	(	t.swd_id	=	a.swd_id
					AND	t.sc_dtm	=	a.min_dtm
					)
		WHERE	NOT	EXISTS	(	SELECT	1
								FROM	sewadars_txn_ts	x
								WHERE	x.satsang_centre_id	=	t.sc_id
								AND		x.sewadar_grno		=	t.swd_grno
								AND		x.sewa_id			=	@p_sewa_id
								AND		x.screen_id			=	'ATT_06'
							);
END
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewFingerprintControllingDate
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewFingerprintControllingDate' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewFingerprintControllingDate
	END
GO
CREATE VIEW ViewFingerprintControllingDate

WITH ENCRYPTION
AS

	SELECT sf.controlling_id, 
		   sf.sewa_id, 
		   s.sewa_nm, 
		   sf.start_dt, 
		   sf.end_dt, 
		   CONVERT(VARCHAR(28),sf.processing_dtm, 9) as processing_dtm, 
		   sf.shift_1_cnt, 
		   sf.shift_2_cnt, 
		   sf.shift_3_cnt
	FROM sewas_fp_controlling_dates sf
	INNER JOIN sewas s ON (s.sewa_id = sf.sewa_id)
GO


-- =============================================================================
--	Procedure	QueryScannedFingerprints
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryScannedFingerprints'
			)
	BEGIN
		DROP PROCEDURE  QueryScannedFingerprints
	END
GO
CREATE PROCEDURE QueryScannedFingerprints
(
	@p_controlling_id		INTEGER
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sf.controlling_id,
		sf.sewadar_id,
		sf.sewadar_grno,
		s.first_nm + ' '+ SUBSTRING (s.middle_nm, 1, 1) + ' ' + s.last_nm as Name,
		s.gender, 
		s.full_department_nm,		
		s.sewadar_status_nm,
		CONVERT(VARCHAR(28),sf.scanned_dtm, 9) as scanned_dtm,
		sf.satsang_centre_id,		
		remarks
	FROM scanned_fingerprints sf
	INNER JOIN ViewSewadarHeader s ON (sf.sewadar_id = s.sewadar_id)
	WHERE 	sf.controlling_id = @p_controlling_id	
	ORDER BY Name, sf.sewadar_grno, sf.scanned_dtm ASC
END
GO


-- =============================================================================
--	Procedure	QueryScannedFingerprintsStore
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryScannedFingerprintsStore'
			)
	BEGIN
		DROP PROCEDURE  QueryScannedFingerprintsStore
	END
GO
CREATE PROCEDURE QueryScannedFingerprintsStore
(
	@p_controlling_id		INTEGER
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sf.controlling_id,
		sf.sewadar_id,
		sf.sewadar_grno,
		s.first_nm + ' '+ SUBSTRING (s.middle_nm, 1, 1) + ' ' + s.last_nm as Name,
		s.gender, 
		s.full_department_nm,
		CONVERT(VARCHAR(28),sf.scanned_dtm, 9) AS scanned_dtm,
		sf.satsang_centre_id,		
		sf.sewa_shift
	FROM scanned_fingerprints_store sf
	INNER JOIN ViewSewadarHeader s ON (sf.sewadar_id = s.sewadar_id)
	WHERE 	sf.controlling_id = @p_controlling_id	
	ORDER BY Name, sf.sewadar_grno, sf.scanned_dtm ASC
END
GO
-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console

