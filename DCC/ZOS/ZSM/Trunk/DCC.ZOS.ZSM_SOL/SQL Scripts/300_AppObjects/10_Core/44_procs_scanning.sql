/* ==================================================================================
    Source File		:	procs_scanning.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sun Jan 09 19:51 IST 2011
    Version			:	1.04
    Last updated	:	Sep 24, 2013
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		This is re-runnable script and thus is pre-qualified with DROP statements.
    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	AK : 10-Oct-2014
		* ProcessConstructionSewaDate raises an error if controlling date is a future date.
	JL : 24-Sep-2013
		* All Stored Procedures that raise error also now return a negative value apart from raising the error.
	JL	:	1.03: 08-Jan-2013
		* Stored Procedure ReduceSewadarList allows deleting and thereafter sets it back within the
		  processing so as to delete from the Scanned Badges.
	JL	:	1.02: 7, 8-Jan-2013
		* New Stored Procedures OpenScanningJob, CloseScanningJob and ReduceSewadarList have been added.
		* Stored Procedure GetSewadarAribitraryShiftPresencesCount has been changed as below:
			+ Parameters Sewa Id and Control Label have been dropped.
			+ Parameter Sub Job ID has been added.
			+ Output parameter Total Count includes exemptions, if any.
		* Stored Procedure GetSewadarArbitraryExemptionCount has been dropped.
	AJ	:	1.01: 29 Jul 2012
		* Updated ProcessConstructionSewaDate to discontinue processing of scan_controlling_date
		  if there are not scanned badges
   ==================================================================================*/

-- =============================================================================
--	Function	GetSewaMaxPresenceAllowedDate
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSewaMaxPresenceAllowedDate' AND xtype = 'FN')
	DROP FUNCTION   GetSewaMaxPresenceAllowedDate
GO
CREATE FUNCTION GetSewaMaxPresenceAllowedDate
(
	@p_sewa_id				sewa_id
)
RETURNS
	DATETIME
WITH ENCRYPTION
AS
BEGIN
	DECLARE
		@dt	DATETIME;

	SELECT	@dt	=	COALESCE (MAX	(d.controlling_dt), j.effective_till- 1, s.finish_dt)
	FROM	sewas	s
		LEFT JOIN	scanning_jobs	j
			ON	(	s.sewa_id	=	j.sewa_id
				)
		LEFT JOIN	scanning_jobs_controlling_dates	d
			ON	(	d.scanning_job_id	=	j.scanning_job_id
				AND	d.last_transfer_dtm	IS NOT NULL
				)
	WHERE	s.sewa_id	=	@p_sewa_id
	GROUP BY	s.sewa_id, j.effective_till, s.finish_dt;
	RETURN @dt;
END
GO
-- =============================================================================



-- =============================================================================
-- Procedure OpenScanningJobDate
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'OpenScanningJobDate' AND xtype = 'P')
	DROP PROCEDURE OpenScanningJobDate
GO

CREATE PROCEDURE OpenScanningJobDate
(
	@p_scanning_job_id		scanning_job_id,
	@p_controlling_dt		SMALLDATETIME
)
WITH ENCRYPTION
AS
	DECLARE
		@type_effective_from	DATETIME,
		@type_effective_till	DATETIME,
		@is_date_wise			Boolean,
		@job_effective_from		DATETIME,
		@job_effective_till		DATETIME,
		@job_is_closed			Boolean,
		@is_concluded			Boolean,
		@is_closed				Boolean,
		@max_controlling_dt		SMALLDATETIME;
BEGIN
	
	SELECT	@is_date_wise			= t.is_date_wise,
			@type_effective_from	= t.effective_from,
			@type_effective_till	= t.effective_till,
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

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Scanning Job for the Controlling Date for opening', NULL, NULL 
		RETURN -1;
	END

	IF (@is_date_wise = 'No')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'the Scanning Job is not Date-wise', NULL 
		RETURN -2;
	END

	IF (@p_controlling_dt NOT BETWEEN @type_effective_from AND @type_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'Effective Period of Scanning Job Type is not current', NULL 
		RETURN -3;
	END

	IF (@p_controlling_dt NOT BETWEEN @job_effective_from AND @job_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'Effective Period of the Scanning Job is not current', NULL 
		RETURN -4;
	END

	IF (@job_is_closed = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'the Scanning Job is closed', NULL 
		RETURN -5;
	END

	IF (@is_concluded = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'the Scanning Job has been concluded', NULL 
		RETURN -6;
	END

	IF (@is_closed = 'No')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'it is already open', NULL 
		RETURN -7;
	END

	SELECT	@max_controlling_dt	=	MAX (controlling_dt)
	FROM	scanning_jobs_controlling_dates
	WHERE	scanning_job_id	=	@p_scanning_job_id;

	IF (@max_controlling_dt	<>	@p_controlling_dt)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'the Date provided is not the latest', NULL 
		RETURN -8;
	END

	UPDATE	scanning_jobs_controlling_dates
		SET	is_closed	=	'No'
	WHERE	scanning_job_id	=	@p_scanning_job_id
	AND		controlling_dt	=	@p_controlling_dt;

	IF (@@ROWCOUNT = 0)
		EXEC SysAdmin..RaiseErrorMessage 'NotAffected', NULL, NULL, NULL, NULL 
END
GO

-- =============================================================================
-- Procedure CloseScanningJobDate
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'CloseScanningJobDate' AND xtype = 'P')
	DROP PROCEDURE CloseScanningJobDate
GO

CREATE PROCEDURE CloseScanningJobDate
(
	@p_scanning_job_id		scanning_job_id,
	@p_controlling_dt		SMALLDATETIME
)
WITH ENCRYPTION
AS
	DECLARE
		@type_effective_from	DATETIME,
		@type_effective_till	DATETIME,
		@is_date_wise			Boolean,
		@job_effective_from		DATETIME,
		@job_effective_till		DATETIME,
		@is_concluded			Boolean,
		@is_closed				Boolean;
BEGIN
	
	SELECT	@is_date_wise			= t.is_date_wise,
			@type_effective_from	= t.effective_from,
			@type_effective_till	= t.effective_till,
			@job_effective_from		= j.effective_from,
			@job_effective_till		= j.effective_till,
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

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Scanning Job for the Controlling Date for closing', NULL, NULL 
		RETURN -1;
	END

	IF (@is_date_wise = 'No')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'the Scanning Job is not Date-wise', NULL 
		RETURN -2;
	END

	IF (@p_controlling_dt NOT BETWEEN @type_effective_from AND @type_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'Effective Period of Scanning Job Type is not current', NULL 
		RETURN -3;
	END

	IF (@p_controlling_dt NOT BETWEEN @job_effective_from AND @job_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'Effective Period of the Scanning Job is not current', NULL 
		RETURN -4;
	END

	IF (@is_concluded = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'the Scanning Job has been concluded', NULL 
		RETURN -5;
	END

	IF (@is_closed = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'it has been already closed', NULL 
		RETURN -6;
	END

	UPDATE	scanning_jobs_controlling_dates
		SET	is_closed	=	'Yes'
	WHERE	scanning_job_id	=	@p_scanning_job_id
	AND		controlling_dt	=	@p_controlling_dt;

	IF (@@ROWCOUNT = 0)
		EXEC SysAdmin..RaiseErrorMessage 'NotAffected', NULL, NULL, NULL, NULL 
END
GO

-- =============================================================================
-- Procedure OpenScanningJob
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'OpenScanningJob' AND xtype = 'P')
	DROP PROCEDURE OpenScanningJob
GO

CREATE PROCEDURE OpenScanningJob
(
	@p_scanning_job_id		scanning_job_id
)
WITH ENCRYPTION
AS
	DECLARE
		@type_effective_from	DATETIME,
		@type_effective_till	DATETIME,
		@is_date_wise			Boolean,
		@job_effective_from		DATETIME,
		@job_effective_till		DATETIME,
		@job_is_closed			Boolean,
		@is_concluded			Boolean;
BEGIN
	
	SELECT	@is_date_wise			= t.is_date_wise,
			@type_effective_from	= t.effective_from,
			@type_effective_till	= t.effective_till,
			@job_effective_from		= j.effective_from,
			@job_effective_till		= j.effective_till,
			@job_is_closed			= j.is_closed,
			@is_concluded			= j.is_concluded
	FROM	scanning_jobs	j
		JOIN	scanning_job_types	t
			ON	(	j.scanning_job_type_cd	=	t.scanning_job_type_cd
				AND	j.scanning_job_id		=	@p_scanning_job_id
				);

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Scanning Job for opening', NULL, NULL 
		RETURN -1;
	END

	IF (@is_date_wise = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'it is Date-wise', NULL 
		RETURN -2;
	END

	IF (GetDate() NOT BETWEEN @type_effective_from AND @type_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'Effective Period of Scanning Job Type is not current', NULL 
		RETURN -3;
	END

	IF (GetDate() NOT BETWEEN @job_effective_from AND @job_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'Effective Period of the Scanning Job is not current', NULL 
		RETURN -4;
	END

	IF (@job_is_closed = 'No')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'it is already open', NULL 
		RETURN -5;
	END

	IF (@is_concluded = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Opening of Scanning Job', 'it has been concluded', NULL 
		RETURN -6;
	END

	UPDATE	scanning_jobs
		SET	is_closed	=	'No'
	WHERE	scanning_job_id	=	@p_scanning_job_id
	AND		is_closed	=	'Yes';

	IF (@@ROWCOUNT = 0)
		EXEC SysAdmin..RaiseErrorMessage 'NotAffected', NULL, NULL, NULL, NULL 
END
GO

-- =============================================================================
-- Procedure CloseScanningJob
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'CloseScanningJob' AND xtype = 'P')
	DROP PROCEDURE CloseScanningJob
GO

CREATE PROCEDURE CloseScanningJob
(
	@p_scanning_job_id		scanning_job_id
)
WITH ENCRYPTION
AS
	DECLARE
		@type_effective_from	DATETIME,
		@type_effective_till	DATETIME,
		@is_date_wise			Boolean,
		@job_effective_from		DATETIME,
		@job_effective_till		DATETIME,
		@is_concluded			Boolean,
		@is_closed				Boolean;
BEGIN
	
	SELECT	@is_date_wise			= t.is_date_wise,
			@type_effective_from	= t.effective_from,
			@type_effective_till	= t.effective_till,
			@job_effective_from		= j.effective_from,
			@job_effective_till		= j.effective_till,
			@is_concluded			= j.is_concluded,
			@is_closed				= j.is_closed
	FROM	scanning_jobs	j
		JOIN	scanning_job_types	t
			ON	(	j.scanning_job_type_cd	=	t.scanning_job_type_cd
				AND	j.scanning_job_id		=	@p_scanning_job_id
				);

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Scanning Job for closing', NULL, NULL 
		RETURN -1;
	END

	IF (@is_date_wise = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'it is Date-wise', NULL 
		RETURN -2;
	END

	IF (GetDate() NOT BETWEEN @type_effective_from AND @type_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'Effective Period of Scanning Job Type is not current', NULL 
		RETURN -3;
	END

	IF (GetDate() NOT BETWEEN @job_effective_from AND @job_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'Effective Period of the Scanning Job is not current', NULL 
		RETURN -4;
	END

	IF (@is_concluded = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'it has been concluded', NULL 
		RETURN -5;
	END

	IF (@is_closed = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'it has been already closed', NULL 
		RETURN -6;
	END

	UPDATE	scanning_jobs
		SET	is_closed	=	'Yes'
	WHERE	scanning_job_id	=	@p_scanning_job_id
	AND		is_closed	=	'No';

	IF (@@ROWCOUNT = 0)
		EXEC SysAdmin..RaiseErrorMessage 'NotAffected', NULL, NULL, NULL, NULL 
END
GO

-- =============================================================================
-- Procedure ProcessConstructionSewaDate
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ProcessConstructionSewaDate' AND xtype = 'P')
	DROP PROCEDURE ProcessConstructionSewaDate
GO

CREATE PROCEDURE ProcessConstructionSewaDate
(
	@p_scanning_job_id		scanning_job_id,
	@p_controlling_dt		SMALLDATETIME
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
		@max_unprocessed_dt		SMALLDATETIME;
BEGIN
	DECLARE @tbl	TABLE 	(	sub_job_id		INTEGER			NOT NULL PRIMARY KEY,
								sub_job_nm		VARCHAR (30)	NOT NULL,
								sewa_shift		VARCHAR (15)
							);
	
	DECLARE @tpls	TABLE 	(	centre_id		INTEGER			NOT NULL,
								grno			CHAR (6)		NOT NULL,
								dt				DATETIME		NOT NULL,
								shift			VARCHAR (15)	NOT NULL,
									PRIMARY KEY	NONCLUSTERED	(	centre_id, grno, dt, shift	)
							);

	SET	@screen_id = 'ATT_06';

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

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Scanning Job for Processing', NULL, NULL 
		RETURN -1;
	END

	IF (@is_date_wise = 'No')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'the Scanning Job is not Date-wise', NULL 
		RETURN -2;
	END

	IF (@p_controlling_dt NOT BETWEEN @type_effective_from AND @type_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'Effective Period of Scanning Job Type is not current', NULL 
		RETURN -3;
	END

	IF (@p_controlling_dt NOT BETWEEN @job_effective_from AND @job_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'Effective Period of the Scanning Job is not current', NULL 
		RETURN -4;
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

	IF (@is_closed = 'No')
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
		RETURN -8;
	END

	SELECT	@min_unprocessed_dt	=	MIN (controlling_dt),
			@max_unprocessed_dt	=	MAX (controlling_dt)
	FROM	scanning_jobs_controlling_dates
	WHERE	scanning_job_id	=	@p_scanning_job_id
	AND		last_transfer_dtm	IS NULL;

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'the Period for Processing could not be found', NULL 
		RETURN -9;
	END

	IF (@p_controlling_dt NOT BETWEEN @min_unprocessed_dt AND @max_unprocessed_dt)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'the Controlling Date is not within the Processing Period', NULL 
		RETURN -10;
	END
	
	SELECT TOP 1 1 FROM scanned_badges
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing', 'No Records scanned, delete the date if nothing to scan', NULL 
		RETURN -11;
	END
	

	INSERT INTO	@tbl
		SELECT	j.scanning_sub_job_id, scanning_sub_job_nm, sewa_shift
		FROM	scanning_sub_jobs	j
			LEFT JOIN	sewas_sewa_shifts	s
				ON	(	s.sewa_id	=	@sewa_id
					AND	j.scanning_sub_job_nm	=	s.sewa_shift
					)
		WHERE	j.scanning_job_id	=	@p_scanning_job_id
		AND		EXISTS	(	SELECT	1
							FROM	scanned_badges
							WHERE	scanning_sub_job_id	=	j.scanning_sub_job_id
							AND		controlling_dt		BETWEEN	@min_unprocessed_dt	AND	@p_controlling_dt
						);

	IF EXISTS	(	SELECT	TOP 1 1
					FROM	@tbl
					WHERE	sewa_shift	IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'Internal', NULL, 'Un-matched Sewa Shifts for Sub Job Names', 'Processing of Scanning Job', NULL 
			RETURN -12;
		END

	IF EXISTS	(	SELECT	TOP 1 1
					FROM	arbitrary_shift_presences
					WHERE	sewa_id			=	@sewa_id
					AND		presence_dt		BETWEEN	@min_unprocessed_dt	AND	@p_controlling_dt
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'attendance is recorded for Sewa in Arb. Shift Presences', NULL
			RETURN -13;
		END

	SET @xfr_dtm = GetDate();

	INSERT INTO	@tpls
		SELECT	satsang_centre_id, sewadar_grno, controlling_dt, scanning_sub_job_nm
		FROM	scanned_badges	b
			JOIN	scanning_sub_jobs	j
				ON	(	j.scanning_job_id		=	@p_scanning_job_id
					AND	b.scanning_sub_job_id	=	j.scanning_sub_job_id
					AND	b.controlling_dt		BETWEEN	@min_unprocessed_dt	AND	@p_controlling_dt
					);

	INSERT INTO	arbitrary_shift_presences
			(	sewa_id, satsang_centre_id, sewadar_grno, presence_dt, sewa_shift, is_scanned	)
		SELECT	@sewa_id, centre_id, grno, dt, shift, 'Yes'
		FROM	@tpls;

	SET @cnt = @@ROWCOUNT;

	DECLARE	@cnt_tbl	TABLE	(	ctrl_dt	SMALLDATETIME	NOT NULL	PRIMARY KEY,
									cnt		INTEGER			NOT NULL
								);
	INSERT INTO	@cnt_tbl
		SELECT	dt, COUNT (*)
		FROM	@tpls
		GROUP BY dt;

	UPDATE	X
		SET	last_transfer_dtm	=	@xfr_dtm,
			total_processed_cnt	=	cnt
	FROM	scanning_jobs_controlling_dates	X
		JOIN	@cnt_tbl	y
			ON	(	X.scanning_job_id	=	@p_scanning_job_id
				AND	X.controlling_dt	=	y.ctrl_dt
				);

	UPDATE	scanning_jobs
		SET	last_transfer_dtm	=	@xfr_dtm,
			total_processed_cnt	=	total_processed_cnt + @cnt
	WHERE	scanning_job_id		=	@p_scanning_job_id;

	INSERT INTO	sewadars_txn_ts
			(	satsang_centre_id, sewadar_grno, sewa_id, screen_id	)
		SELECT	DISTINCT centre_id, grno, @sewa_id, @screen_id
		FROM	@tpls
		WHERE	NOT	EXISTS	(	SELECT	1
								FROM	sewadars_txn_ts
								WHERE	satsang_centre_id	=	centre_id
								AND		sewadar_grno		=	grno
								AND		sewa_id				=	@sewa_id
								AND		screen_id			=	@screen_id
							);

	DELETE	b
	FROM	scanned_badges	b
		JOIN	scanning_sub_jobs	j
			ON	(	j.scanning_job_id		=	@p_scanning_job_id
				AND	b.scanning_sub_job_id	=	j.scanning_sub_job_id
				AND	b.controlling_dt		BETWEEN	@min_unprocessed_dt	AND	@p_controlling_dt
				);
END
GO

-- =============================================================================
-- Procedure AddToSewadarList
--  This procedure adds sewadar_grno to the given Sewadar List during the processing of Scanned Badges.
--- It keeps a copy of scanned_badges in scanned_badges_store before deletion.
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'AddToSewadarList' AND xtype = 'P')
	DROP PROCEDURE AddToSewadarList
GO

CREATE PROCEDURE AddToSewadarList
(
	@p_scanning_job_id		scanning_job_id
)
WITH ENCRYPTION
AS
	DECLARE
		@type_effective_from	DATETIME,
		@type_effective_till	DATETIME,
		@is_date_wise			Boolean,
		@job_effective_from		DATETIME,
		@job_effective_till		DATETIME,
		@job_is_closed			Boolean,
		@is_concluded			Boolean,
		@is_delete_allowed		Boolean,
		@cnt					INT,
		@sewadar_list_id		sewadar_list_id,
		@sub_job_id				scanning_job_id,
		@xfr_dtm				DATETIME;
BEGIN
	SELECT	@is_date_wise			= t.is_date_wise,
			@type_effective_from	= t.effective_from,
			@type_effective_till	= t.effective_till,
			@job_effective_from		= j.effective_from,
			@job_effective_till		= j.effective_till,
			@job_is_closed			= j.is_closed,
			@sewadar_list_id		= j.sewadar_list_id,
			@is_concluded			= j.is_concluded,
			@is_delete_allowed		= j.is_deleting_allowed,
			@sub_job_id				= s.scanning_sub_job_id
	FROM	scanning_jobs	j
		JOIN	scanning_job_types	t
			ON	(	j.scanning_job_type_cd	=	t.scanning_job_type_cd
				AND	j.scanning_job_id		=	@p_scanning_job_id
				)
		JOIN	scanning_sub_jobs	s
			ON	(	s.scanning_job_id	=	j.scanning_job_id	);

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Scanning Job for Processing', NULL, NULL 
		RETURN -1;
	END

	IF (@is_date_wise = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'it is Date-wise', NULL 
		RETURN -2;
	END

	IF (GetDate() NOT BETWEEN @type_effective_from AND @type_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'Effective Period of Scanning Job Type is not current', NULL 
		RETURN -3;
	END

	IF (GetDate() NOT BETWEEN @job_effective_from AND @job_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'Effective Period of the Scanning Job is not current', NULL 
		RETURN -4;
	END

	IF (@job_is_closed = 'No')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'it is Open', NULL 
		RETURN -5;
	END

	IF (@is_concluded = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'it has been concluded', NULL 
		RETURN -6;
	END

	SELECT TOP 1 1 FROM scanned_badges
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing', 'there are no scanned records', NULL 
		RETURN -7;
	END	

	SET @xfr_dtm = GetDate();

	
	INSERT INTO	generic_sewadar_lists_sewadars
			(	sewadar_list_id, satsang_centre_id, sewadar_grno	)
		SELECT	@sewadar_list_id, satsang_centre_id, sewadar_grno
		FROM	scanned_badges	x
		WHERE	scanning_sub_job_id	=	@sub_job_id
		AND		NOT	EXISTS	(	SELECT	1
								FROM	generic_sewadar_lists_sewadars	y
								WHERE	y.sewadar_list_id	=	@sewadar_list_id
								AND		x.satsang_centre_id	=	y.satsang_centre_id
								AND		x.sewadar_grno		=	y.sewadar_grno
							);
	SET @cnt = @@ROWCOUNT;

	INSERT INTO	scanned_badges_store
			(	scanning_sub_job_id, controlling_dt, satsang_centre_id, sewadar_grno, scanned_dtm	)
		SELECT	scanning_sub_job_id, controlling_dt, satsang_centre_id, sewadar_grno, scanned_dtm
		FROM	scanned_badges	a
		WHERE	scanning_sub_job_id	=	@sub_job_id
		AND		NOT EXISTS	(	SELECT	1
								FROM	scanned_badges_store	b
								WHERE	b.scanning_sub_job_id	=	a.scanning_sub_job_id
								AND		b.controlling_dt		=	a.controlling_dt
								AND		b.satsang_centre_id		=	a.satsang_centre_id
								AND		b.sewadar_grno			=	a.sewadar_grno
							);

	UPDATE	scanning_jobs
		SET	is_deleting_allowed	=	'Yes'
	WHERE	scanning_job_id		=	@p_scanning_job_id;

	DELETE
	FROM	scanned_badges
	WHERE	scanning_sub_job_id		=	@sub_job_id;
	
	UPDATE	scanning_jobs
	SET	is_deleting_allowed	=	@is_delete_allowed,
		last_transfer_dtm	=	@xfr_dtm,
		total_processed_cnt	=	COALESCE (total_processed_cnt, 0) + @cnt
	WHERE	scanning_job_id		=	@p_scanning_job_id;
END
GO

-- =============================================================================
-- Procedure ReduceSewadarList
--  This procedure reduces the given Sewadar List during the processing of Scanned Badges.
--- It keeps a copy of scanned_badges in scanned_badges_store before deletion.
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ReduceSewadarList' AND xtype = 'P')
	DROP PROCEDURE ReduceSewadarList
GO

CREATE PROCEDURE ReduceSewadarList
(
	@p_scanning_job_id		scanning_job_id
)
WITH ENCRYPTION
AS
	DECLARE
		@type_effective_from	DATETIME,
		@type_effective_till	DATETIME,
		@is_date_wise			Boolean,
		@job_effective_from		DATETIME,
		@job_effective_till		DATETIME,
		@job_is_closed			Boolean,
		@is_concluded			Boolean,
		@is_delete_allowed		Boolean,
		@cnt					INT,
		@sewadar_list_id		sewadar_list_id,
		@sub_job_id				scanning_job_id,
		@xfr_dtm				DATETIME;
BEGIN
	SELECT	@is_date_wise			= t.is_date_wise,
			@type_effective_from	= t.effective_from,
			@type_effective_till	= t.effective_till,
			@job_effective_from		= j.effective_from,
			@job_effective_till		= j.effective_till,
			@job_is_closed			= j.is_closed,
			@sewadar_list_id		= j.sewadar_list_id,
			@is_concluded			= j.is_concluded,
			@is_delete_allowed		= j.is_deleting_allowed,
			@sub_job_id				= s.scanning_sub_job_id
	FROM	scanning_jobs	j
		JOIN	scanning_job_types	t
			ON	(	j.scanning_job_type_cd	=	t.scanning_job_type_cd
				AND	j.scanning_job_id		=	@p_scanning_job_id
				)
		JOIN	scanning_sub_jobs	s
			ON	(	s.scanning_job_id	=	j.scanning_job_id	);

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Scanning Job for Processing', NULL, NULL 
		RETURN -1;
	END

	IF (@is_date_wise = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'it is Date-wise', NULL 
		RETURN -2;
	END

	IF (GetDate() NOT BETWEEN @type_effective_from AND @type_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'Effective Period of Scanning Job Type is not current', NULL 
		RETURN -3;
	END

	IF (GetDate() NOT BETWEEN @job_effective_from AND @job_effective_till)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Closing of Scanning Job', 'Effective Period of the Scanning Job is not current', NULL 
		RETURN -4;
	END

	IF (@job_is_closed = 'No')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'it is Open', NULL 
		RETURN -5;
	END

	IF (@is_concluded = 'Yes')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing of Scanning Job', 'it has been concluded', NULL 
		RETURN -6;
	END

	SELECT TOP 1 1 FROM scanned_badges
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Processing', 'there are no scanned records', NULL 
		RETURN -7;
	END	

	SET @xfr_dtm = GetDate();

	
	DELETE	X
	FROM	generic_sewadar_lists_sewadars	X
		JOIN	scanned_badges	y
			ON	(	x.satsang_centre_id		=	y.satsang_centre_id
				AND	x.sewadar_grno			=	y.sewadar_grno
				AND	y.scanning_sub_job_id	=	@sub_job_id
				)
	WHERE	x.sewadar_list_id	=	@sewadar_list_id;
	SET @cnt = @@ROWCOUNT;

	INSERT INTO	scanned_badges_store
			(	scanning_sub_job_id, controlling_dt, satsang_centre_id, sewadar_grno, scanned_dtm	)
		SELECT	scanning_sub_job_id, controlling_dt, satsang_centre_id, sewadar_grno, scanned_dtm
		FROM	scanned_badges	a
		WHERE	scanning_sub_job_id	=	@sub_job_id
		AND		NOT EXISTS	(	SELECT	1
								FROM	scanned_badges_store	b
								WHERE	b.scanning_sub_job_id	=	a.scanning_sub_job_id
								AND		b.controlling_dt		=	a.controlling_dt
								AND		b.satsang_centre_id		=	a.satsang_centre_id
								AND		b.sewadar_grno			=	a.sewadar_grno
							);

	UPDATE	scanning_jobs
		SET	is_deleting_allowed	=	'Yes'
	WHERE	scanning_job_id		=	@p_scanning_job_id;

	DELETE
	FROM	scanned_badges
	WHERE	scanning_sub_job_id		=	@sub_job_id;
	
	UPDATE	scanning_jobs
	SET	is_deleting_allowed	=	@is_delete_allowed,
		last_transfer_dtm	=	@xfr_dtm,
		total_processed_cnt	=	COALESCE (total_processed_cnt, 0) + @cnt
	WHERE	scanning_job_id		=	@p_scanning_job_id;
END
GO

-- =============================================================================
-- Procedure GetSewadarArbitraryShiftPresencesCount
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSewadarArbitraryShiftPresencesCount' AND xtype = 'P')
	DROP PROCEDURE GetSewadarArbitraryShiftPresencesCount
GO

CREATE PROCEDURE GetSewadarArbitraryShiftPresencesCount
(
	@p_sub_job_id 			scanning_job_id,
	@p_satsang_centre_id	satsang_centre_id,
	@p_sewadar_grno	 		sewadar_grno,
	@p_total_count			NUMERIC(6,1)		OUTPUT
)
WITH ENCRYPTION
AS		
	DECLARE
		@sewa_id	sewa_id;
BEGIN
	SELECT	@sewa_id	=	sewa_id
	FROM	scanning_jobs	j
		JOIN	scanning_sub_jobs	s
			ON	(	j.scanning_job_id	=	s.scanning_job_id	)
	WHERE	s.scanning_sub_job_id	=	@p_sub_job_id;

	SELECT	@p_total_count = COALESCE (SUM ((1.0 * ss.credit_cnt) / unit_cnt), 0.0)
	FROM	arbitrary_shift_presences sp
		JOIN sewas_sewa_shifts ss
			ON	(	ss.sewa_id				=	sp.sewa_id
				AND	ss.sewa_shift			= 	sp.sewa_shift
				AND sp.sewa_id				=	@sewa_id 
				AND sp.satsang_centre_id	=	@p_satsang_centre_id
				AND sp.sewadar_grno			= 	@p_sewadar_grno
				);

	SELECT	@p_total_count = @p_total_count + COALESCE (exemption_days, 0)
	FROM	arbitrary_summarised_exemptions
	WHERE	sewa_id				= @sewa_id
	AND		satsang_centre_id	= @p_satsang_centre_id
	AND		sewadar_grno		= @p_sewadar_grno;
END
GO
-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console

