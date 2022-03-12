SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
--	Procedure	InsertUpdateScannedBadge
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1
				FROM    INFORMATION_SCHEMA.ROUTINES
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertUpdateScannedBadge'
			)
	BEGIN
		DROP PROCEDURE  InsertUpdateScannedBadge
	END
GO

CREATE PROCEDURE InsertUpdateScannedBadge
(
	@scanning_sub_job_id		scanning_job_id,
	@controlling_dt				SMALLDATETIME,
	@satsang_centre_id			satsang_centre_id,
	@sewadar_grno				sewadar_grno,
	@cntProcedureNm				VARCHAR(60),
	@validating_action			scanning_validating_action		OUTPUT,
	@label1						VARCHAR (40) 					OUTPUT,
	@count1						FLOAT							OUTPUT,
	@label2						VARCHAR (40)					OUTPUT,
	@count2						INTEGER							OUTPUT,
	@message					VARCHAR (100)					OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@scanning_job_id		scanning_job_id,
		@sewa_id				sewa_id,
		@max_sewa_duration		INTEGER,
		@cnt					INTEGER,
		@message_str			VARCHAR (100),
		@formed_sub_job_combntn	VARCHAR(35)
BEGIN
	SET @label2	= 'Total Badges Scanned';
	SET @message	= '';
	SET @message_str	= 'Attendance is complete for Sewadar';
	SET @formed_sub_job_combntn	=	'';
	SET	@validating_action	= 'Add';

	SELECT	@scanning_job_id	=	j.scanning_job_id,
			@sewa_id			=	j.sewa_id,
			@max_sewa_duration	=	w.max_sewa_duration
	FROM	scanning_sub_jobs	s
		JOIN	scanning_jobs	j
			ON	(	s.scanning_sub_job_id	=	@scanning_sub_job_id
				AND	j.scanning_job_id		=	s.scanning_job_id
				)
		LEFT JOIN	sewas	w
			ON	(	w.sewa_id	=	j.sewa_id	);

	IF (@cntProcedureNm IS NOT NULL)
		BEGIN
			EXEC @cntProcedureNm @scanning_sub_job_id, @satsang_centre_id, @sewadar_grno, @count1 OUTPUT;
			SET	@label1	= 'Attendance till date';
		END
	ELSE
		BEGIN
			SET @label1 = '';
			SET @count1 = 0;
		END
		
	SELECT	@count2	=	COUNT (*)
	FROM	scanned_badges
	WHERE	controlling_dt		=	@controlling_dt
	AND		scanning_sub_job_id	=	@scanning_sub_job_id;

	CREATE TABLE #tbl	(	scanning_sub_job_id		INTEGER			NOT NULL	PRIMARY KEY,
							scanned_dtm				SMALLDATETIME	NOT NULL
						);

	INSERT INTO #tbl
			(	scanning_sub_job_id, scanned_dtm	)
		SELECT	scanning_sub_job_id, scanned_dtm
		FROM	scanned_badges	b
		WHERE	b.controlling_dt		=	@controlling_dt
		AND		b.satsang_centre_id		=	@satsang_centre_id
		AND		b.sewadar_grno			=	@sewadar_grno;

	SET @cnt = @@ROWCOUNT;
	IF (@cnt > 1)
		BEGIN
			SELECT	@scanning_sub_job_id	=	scanning_sub_job_id
			FROM	#tbl
			WHERE	scanning_sub_job_id	=	@scanning_sub_job_id;
			IF (@@ROWCOUNT = 0)
				BEGIN
					INSERT INTO #tbl VALUES (@scanning_sub_job_id, GETDATE());

					SELECT	@formed_sub_job_combntn = @formed_sub_job_combntn + CONVERT(VARCHAR, scanning_sub_job_id) + '|'
					FROM	#tbl
					ORDER BY scanned_dtm;

					IF NOT EXISTS	(	SELECT	1
										FROM	scanning_sub_jobs_valid_combinations
										WHERE	scanning_job_id					=	@scanning_job_id
										AND		valid_combination_sub_job_ids	=	@formed_sub_job_combntn
									)
					BEGIN
						SET	@validating_action	= 'Error';
						RETURN;
					END
				END
			ELSE
				BEGIN
					IF (@count1 >= @max_sewa_duration)
						SET	@message	=	@message_str;
					SET	@validating_action	= 'No Action';
					RETURN;
				END
		END
	ELSE IF (@cnt = 1)
		SELECT	@validating_action = v.validating_action
		FROM	scanned_badges	b
		JOIN	scanning_sub_jobs_validations	v
				ON	(	b.scanning_sub_job_id	=	v.recorded_sub_job_id
					AND	b.controlling_dt		=	@controlling_dt
					AND	b.satsang_centre_id		=	@satsang_centre_id
					AND	b.sewadar_grno			=	@sewadar_grno
					)
		WHERE	recording_sub_job_id	=	@scanning_sub_job_id;

	IF (@validating_action = 'Move')
		BEGIN
			SET @count2 = @count2 - 1
			DELETE	scanned_badges
			WHERE	controlling_dt			=	@controlling_dt
			AND		satsang_centre_id		=	@satsang_centre_id
			AND		sewadar_grno			=	@sewadar_grno;
		END

	IF (@validating_action = 'Add' OR @validating_action = 'Move')
		BEGIN
			SET @count2 = @count2 + 1
			INSERT INTO scanned_badges
					(	scanning_sub_job_id, controlling_dt, satsang_centre_id, sewadar_grno	)
				VALUES
					(	@scanning_sub_job_id, @controlling_dt, @satsang_centre_id, @sewadar_grno	);
		END
	IF (@sewa_id IS NOT NULL AND @max_sewa_duration > 0)
	BEGIN
		SELECT	@count1 = @count1 + COALESCE (SUM ((1.00 * credit_cnt) / unit_cnt), 0.00)
		FROM	scanned_badges	b
			JOIN	scanning_sub_jobs	j
				ON	(	b.controlling_dt		<=	@controlling_dt
					AND	b.satsang_centre_id		=	@satsang_centre_id
					AND	b.sewadar_grno			=	@sewadar_grno
					AND	j.scanning_job_id		=	@scanning_job_id
					AND	j.scanning_sub_job_id	=	b.scanning_sub_job_id
					)
			JOIN	sewas_sewa_shifts	s
				ON	(	s.sewa_id				=	@sewa_id
					AND	s.sewa_shift			=	j.scanning_sub_job_nm
					);
		IF (@count1 >= @max_sewa_duration)
			SET	@message	=	@message_str;
	END
END
GO
-- =============================================================================



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteScannedBadge
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1
				FROM    INFORMATION_SCHEMA.ROUTINES
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteScannedBadge'
			)
	BEGIN
		DROP PROCEDURE  DeleteScannedBadge
	END
GO
CREATE PROCEDURE DeleteScannedBadge
(
	@p_scanning_sub_job_id			scanning_job_id,
	@p_controlling_dt				SMALLDATETIME,
	@p_satsang_centre_id			satsang_centre_id,
	@p_sewadar_grno					sewadar_grno,
	@p_delete_success				Boolean		OUTPUT
)
WITH ENCRYPTION
AS
BEGIN
	SET @p_delete_success = 'No';

	DELETE FROM scanned_badges
	WHERE	controlling_dt			=	@p_controlling_dt
	AND		satsang_centre_id		=	@p_satsang_centre_id
	AND		sewadar_grno			=	@p_sewadar_grno
	AND		scanning_sub_job_id		=	@p_scanning_sub_job_id;

	IF (@@ROWCOUNT > 0)
		SET @p_delete_success = 'Yes'
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	GetScannedSewadarInformation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1
				FROM    INFORMATION_SCHEMA.ROUTINES
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='GetScannedSewadarInformation'
			)
	BEGIN
		DROP PROCEDURE  GetScannedSewadarInformation
	END
GO
CREATE PROCEDURE GetScannedSewadarInformation
(
	@sewadar_grno		sewadar_grno,
	@satsang_centre_id	INTEGER
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		s.sewadar_id,
		s.first_nm,
		s.middle_nm,
		s.last_nm,
		s.gender,
		age = DATEDIFF(year, s.birth_dtm, GETDATE()),
		s.current_satsang_centre_id,
		s.global_sewadar_status_cd,
		s.current_sewadar_grno,
		current_sewadar_status_nm = ss_cur.sewadar_status_nm,
		current_sewadar_status_dtm = sr.sewadar_status_dtm,
		current_satsang_centre_cd = sc.satsang_centre_nm,
		sp.sewadar_photo,																			--..... JL .... why photo
		current_department_nm = d.department_nm,
		current_sub_department_nm = ISNULL(sd.sub_department_nm , '')
	FROM sewadars s															--..... JL WHY LEFT JOINs
	LEFT OUTER JOIN sewadars_registrations sr  ON s.current_satsang_centre_id = sr.satsang_centre_id	AND s.current_sewadar_grno = sr.sewadar_grno
	LEFT OUTER JOIN sewadar_status ss_g ON s.global_sewadar_status_cd = ss_g.sewadar_status_cd				---- JL .... why is this join
	LEFT OUTER JOIN sewadar_status ss_cur ON sr.sewadar_status_cd = ss_cur.sewadar_status_cd
	LEFT OUTER JOIN CDB..initiation_places ip ON ip.place_id = s.initiation_place_id				---- JL .... why is this join
	LEFT OUTER JOIN CDB..satsang_centres sc ON sc.satsang_centre_id = s.current_satsang_centre_id
	LEFT OUTER JOIN departments d ON d.department_id = sr.department_id
	LEFT OUTER JOIN sub_departments sd ON sd.sub_department_id = sr.sub_department_id
	LEFT OUTER JOIN ZSM_Photos..sewadars_photos sp ON s.sewadar_id = sp.sewadar_id
	WHERE sr.sewadar_grno = @sewadar_grno
	AND s.current_satsang_centre_id = @satsang_centre_id
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4
