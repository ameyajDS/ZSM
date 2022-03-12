
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	fnSewadarTeamWiseDailyAttCount
-- =============================================================================
IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'fnSewadarTeamWiseDailyAttCount' AND TYPE = 'FN')
DROP FUNCTION [dbo].fnSewadarTeamWiseDailyAttCount
GO
CREATE FUNCTION [dbo].fnSewadarTeamWiseDailyAttCount

(
	@satsang_centre_id	satsang_centre_id,
	@sewadar_grno		sewadar_grno,
	@sewa_id			sewa_id,
	@attendance			CHAR(1)
)
RETURNS INTEGER
AS
BEGIN

DECLARE @count INTEGER
	
	SELECT @count = 
		COUNT(tw.attendance)
	FROM team_wise_daily_attendance tw
	JOIN sewa_team_wise_sewadars st ON st.sewa_team_id = tw.sewa_team_id
					AND st.serial_id = tw.serial_id
	JOIN sewa_teams s ON s.sewa_team_id = st.sewa_team_id
	JOIN ViewSewadarHeaderOnGRNo vs ON st.satsang_centre_id = vs.satsang_centre_id
				  AND st.sewadar_grno = vs.sewadar_grno
	LEFT OUTER JOIN sewa_exemptions se ON se.sewa_exemption_id = tw.sewa_exemption_id
	
	WHERE
		st.sewadar_grno = @sewadar_grno
	AND	st.satsang_centre_id = @satsang_centre_id
	AND tw.attendance = @attendance
	AND s.sewa_id = @sewa_id

	RETURN @count

END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertTeamWiseDailyAttendance
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertTeamWiseDailyAttendance'
			)
	BEGIN
		DROP PROCEDURE  InsertTeamWiseDailyAttendance
	END
GO
CREATE PROCEDURE InsertTeamWiseDailyAttendance
(
	@sewa_team_id			sewa_team_id,
	@serial_id				sewa_team_serial_id,
	@attendance_dt			smalldatetime,
	@is_p					Boolean,
	@is_e					Boolean,
	@is_l					Boolean,
	@is_a					Boolean,
	@sewa_exemption_id		sewa_exemption_id = NULL,
	@is_scanned				Boolean
)
WITH ENCRYPTION
AS
BEGIN
	IF (@is_p = 'Yes' OR  @is_e = 'Yes' OR
		 @is_l = 'Yes' OR @is_a = 'Yes')
	BEGIN
		INSERT INTO team_wise_daily_attendance
		(
			sewa_team_id, serial_id, attendance_dt, attendance, sewa_exemption_id, is_scanned
		)
		VALUES
		(
			@sewa_team_id, @serial_id, @attendance_dt, (CASE WHEN @is_p = 'Yes' THEN 'P'
															 WHEN @is_e = 'Yes' THEN 'E'
															 WHEN @is_l = 'Yes' THEN 'L'
															 WHEN @is_a = 'Yes'	THEN 'A' END	), 
													  @sewa_exemption_id, @is_scanned
		)
	END
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateTeamWiseDailyAttendance
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateTeamWiseDailyAttendance'
			)
	BEGIN
		DROP PROCEDURE  UpdateTeamWiseDailyAttendance
	END
GO
CREATE PROCEDURE UpdateTeamWiseDailyAttendance
(
	@sewa_team_id			sewa_team_id,
	@serial_id				sewa_team_serial_id,
	@attendance_dt			smalldatetime,
	@old_serial_id				sewa_team_serial_id,
	@old_attendance_dt			smalldatetime,
	@is_p					Boolean,
	@is_e					Boolean,
	@is_l					Boolean,
	@is_a					Boolean,
	@sewa_exemption_id		sewa_exemption_id,
	@is_scanned				Boolean
)
WITH ENCRYPTION
AS
BEGIN
	IF (@is_p = 'Yes' OR  @is_e = 'Yes' OR
		 @is_l = 'Yes' OR @is_a = 'Yes')
	BEGIN
	UPDATE    team_wise_daily_attendance
	SET
		serial_id				=	@serial_id,
		attendance_dt			=	@attendance_dt,
		attendance				=	(CASE WHEN @is_p = 'Yes' THEN 'P'
										  WHEN @is_e = 'Yes' THEN 'E'
										  WHEN @is_l = 'Yes' THEN 'L'
										  WHEN @is_a = 'Yes'	THEN 'A' END	),
		sewa_exemption_id		=	@sewa_exemption_id,
		is_scanned				=	@is_scanned
	WHERE
		sewa_team_id			=	@sewa_team_id
	AND	(@old_serial_id IS NULL OR serial_id				=	@old_serial_id)
	AND	(@old_attendance_dt IS NULL OR attendance_dt			=	@old_attendance_dt)
	END
	ELSE
	BEGIN
		EXEC DeleteTeamWiseDailyAttendance	@sewa_team_id, @old_serial_id, @old_attendance_dt
	END

END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteAllTeamWiseDailyAttendance
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteAllTeamWiseDailyAttendance'
			)
	BEGIN
		DROP PROCEDURE  DeleteAllTeamWiseDailyAttendance
	END
GO
CREATE PROCEDURE DeleteAllTeamWiseDailyAttendance
(
	@sewa_team_id			sewa_team_id,
	@serial_id				sewa_team_serial_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM team_wise_daily_attendance
	WHERE
		sewa_team_id			=	@sewa_team_id
	AND	serial_id				=	@serial_id
END
GO
-- =============================================================================



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteTeamWiseDailyAttendance
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteTeamWiseDailyAttendance'
			)
	BEGIN
		DROP PROCEDURE  DeleteTeamWiseDailyAttendance
	END
GO
CREATE PROCEDURE DeleteTeamWiseDailyAttendance
(
	@sewa_team_id			sewa_team_id,
	@old_serial_id				sewa_team_serial_id,
	@old_attendance_dt			smalldatetime
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM team_wise_daily_attendance
	WHERE
		sewa_team_id			=	@sewa_team_id
	AND	(@old_serial_id IS NULL OR serial_id				=	@old_serial_id)
	AND	(@old_attendance_dt IS NULL OR attendance_dt			=	@old_attendance_dt)
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================================================
--	Procedure	QuerySewadarTeamWiseDailyAttendanceForInsert
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarTeamWiseDailyAttendanceForInsert'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarTeamWiseDailyAttendanceForInsert
	END
GO
CREATE PROCEDURE QuerySewadarTeamWiseDailyAttendanceForInsert
(
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@sewa_id				sewa_id
)
WITH ENCRYPTION
AS
	DECLARE
		@dt				DATETIME,
		@v_start_dt		DATETIME,
		@v_finish_dt	DATETIME
BEGIN
	SELECT	@v_start_dt		=	start_dt,
			@v_finish_dt	=	finish_dt
	FROM	sewas
	WHERE	sewa_id	=	@sewa_id;

	DECLARE	@tbl	TABLE	(dt	DATETIME NOT NULL PRIMARY KEY);

	SET	@dt	=	@v_start_dt;

	WHILE (@dt <= @v_finish_dt)
	BEGIN
		INSERT INTO @tbl VALUES (@dt);
		SET @dt = @dt + 1;
	END

	SELECT
		st.sewa_team_id, 
		s.sewa_team_nm,
		old_serial_id = st.serial_id,  
		sewa_exemption_id = NULL, 
		is_p = 'No',
		is_e = 'No',
		is_l = 'No',
		is_a = 'No',
		st.serial_id,
		attendance_dt = t.dt,
		old_attendance_dt = t.dt,
		--vs.first_nm,
		--vs.sewadar_id,
		sewa_exemption_nm = NULL
	FROM sewa_team_wise_sewadars st 
		JOIN sewa_teams s
			ON	(	s.sewa_team_id			=	st.sewa_team_id
				AND	s.sewa_id				=	@sewa_id
				AND	st.sewadar_grno			=	@sewadar_grno
				AND	st.satsang_centre_id	=	@satsang_centre_id
				)
		JOIN sewadars_registrations vs
			ON	(	st.satsang_centre_id	=	vs.satsang_centre_id
				AND st.sewadar_grno			=	vs.sewadar_grno
				)
		JOIN @tbl t
			ON ( t.dt	=	t.dt)
		LEFT OUTER JOIN team_wise_daily_attendance tw
			ON	(	tw.attendance_dt	=	t.dt
				AND tw.serial_id		=	st.serial_id
				AND tw.sewa_team_id		=	st.sewa_team_id
				)
	WHERE	(	tw.attendance_dt	IS NULL
		AND	(	(	st.transfer_in_dt	IS NOT NULL	AND	st.transfer_out_dt	IS NOT NULL	AND	t.dt	BETWEEN	st.transfer_in_dt	AND	st.transfer_out_dt	)
			OR	(	st.transfer_in_dt	IS NOT NULL	AND	st.transfer_out_dt	IS NULL		AND	t.dt	BETWEEN	st.transfer_in_dt	AND	@v_finish_dt		)
			OR	(	st.transfer_in_dt	IS NULL		AND	st.transfer_out_dt	IS NOT NULL	AND	t.dt	BETWEEN	@v_start_dt			AND	st.transfer_out_dt	)
			OR	(	st.transfer_in_dt	IS NULL		AND	st.transfer_out_dt	IS NULL		AND	t.dt	BETWEEN	@v_start_dt			AND	@v_finish_dt		)
			)
		)
	ORDER BY t.dt;

END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarTeamWiseDailyAttendance
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarTeamWiseDailyAttendance'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarTeamWiseDailyAttendance
	END
GO
CREATE PROCEDURE QuerySewadarTeamWiseDailyAttendance
(
	@satsang_centre_id	satsang_centre_id,
	@sewadar_grno		sewadar_grno,
	@sewa_id			sewa_id
)
WITH ENCRYPTION
AS
BEGIN

	SELECT
		tw.sewa_team_id, 
		s.sewa_team_nm,
		old_serial_id = tw.serial_id,  
		tw.serial_id, 
		tw.attendance_dt, 
		old_attendance_dt = tw.attendance_dt, 
		tw.attendance, 
		tw.sewa_exemption_id, 
		tw.is_scanned,
		is_p = (CASE WHEN tw.attendance = 'P' THEN 'Yes' ELSE 'No' END),
		is_e = (CASE WHEN tw.attendance = 'E' THEN 'Yes' ELSE 'No' END),
		is_l = (CASE WHEN tw.attendance = 'L' THEN 'Yes' ELSE 'No' END),
		is_a = (CASE WHEN tw.attendance = 'A' THEN 'Yes' ELSE 'No' END),
		--st.sewadar_grno,
		se.sewa_exemption_nm
		--grd_full_nm = vs.full_nm	
	FROM team_wise_daily_attendance tw
	JOIN sewa_team_wise_sewadars st ON st.sewa_team_id = tw.sewa_team_id
					AND st.serial_id = tw.serial_id
	JOIN sewa_teams s ON s.sewa_team_id = st.sewa_team_id
	JOIN ViewSewadarHeaderOnGRNo vs ON st.satsang_centre_id = vs.satsang_centre_id
				  AND st.sewadar_grno = vs.sewadar_grno
	LEFT OUTER JOIN sewa_exemptions se ON se.sewa_exemption_id = tw.sewa_exemption_id
	
	WHERE
		st.sewadar_grno = @sewadar_grno
	AND	st.satsang_centre_id = @satsang_centre_id
	--AND st.serial_id = @serial_id
	AND s.sewa_id = @sewa_id
	ORDER BY tw.attendance_dt ASC

END
GO
-- ==============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryTeamWiseDailyAttendanceForInsert
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryTeamWiseDailyAttendanceForInsert'
			)
	BEGIN
		DROP PROCEDURE  QueryTeamWiseDailyAttendanceForInsert
	END
GO
CREATE PROCEDURE QueryTeamWiseDailyAttendanceForInsert
(
	@sewa_team_id			sewa_team_id,
	@attendance_dt			smalldatetime
)
WITH ENCRYPTION
AS
BEGIN

	SELECT
		st.sewa_team_id, 
		st.serial_id,  
		old_serial_id = st.serial_id, 
		sewa_exemption_id = NULL, 
		is_p = 'No',
		is_e = 'No',
		is_l = 'No',
		is_a = 'No',
		st.sewadar_grno,
		vs.sewadar_id,
		vs.centre_cd,
		vs.sewadar_status_nm,
		sewa_exemption_nm = NULL,
		enable = (CASE WHEN (	(st.transfer_in_dt IS NULL OR st.transfer_in_dt	<=	@attendance_dt)
								AND	(st.transfer_out_dt IS NULL OR  st.transfer_out_dt	>=	@attendance_dt))
					   THEN (CASE WHEN siv.system_info_cd IS NULL THEN 'No'  ELSE 'Yes' END)
					   ELSE 'No' END),
		grd_full_nm = vs.full_nm	
	FROM sewa_team_wise_sewadars st
	JOIN sewa_teams stt ON stt.sewa_team_id = st.sewa_team_id
	JOIN sewas s ON s.sewa_id = stt.sewa_id 
	JOIN ViewSewadarHeaderOnGRNo vs ON st.satsang_centre_id = vs.satsang_centre_id
				  AND st.sewadar_grno = vs.sewadar_grno
	LEFT OUTER JOIN team_wise_daily_attendance tw ON tw.attendance_dt =@attendance_dt
				  AND tw.serial_id = st.serial_id AND tw.sewa_team_id = st.sewa_team_id
	LEFT OUTER JOIN system_information_values siv ON (siv.system_info_cd = 'SttsActv' AND siv.system_info_value = vs.sewadar_status_cd)
				
	WHERE
		st.sewa_team_id	=	@sewa_team_id
	AND tw.sewa_team_id	IS NULL
	AND @attendance_dt BETWEEN s.start_dt AND s.finish_dt
	ORDER BY st.serial_id ASC

END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryTeamWiseDailyAttendance
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryTeamWiseDailyAttendance'
			)
	BEGIN
		DROP PROCEDURE  QueryTeamWiseDailyAttendance
	END
GO
CREATE PROCEDURE QueryTeamWiseDailyAttendance
(
	@sewa_team_id			sewa_team_id,
	@attendance_dt			smalldatetime
)
WITH ENCRYPTION
AS
BEGIN

	SELECT
		tw.sewa_team_id, 
		tw.serial_id, 
		old_serial_id = tw.serial_id, 
		tw.attendance_dt, 
		tw.attendance, 
		tw.sewa_exemption_id, 
		tw.is_scanned,
		vs.centre_cd,
		is_p = (CASE WHEN tw.attendance = 'P' THEN 'Yes' ELSE 'No' END),
		is_e = (CASE WHEN tw.attendance = 'E' THEN 'Yes' ELSE 'No' END),
		is_l = (CASE WHEN tw.attendance = 'L' THEN 'Yes' ELSE 'No' END),
		is_a = (CASE WHEN tw.attendance = 'A' THEN 'Yes' ELSE 'No' END),
		st.sewadar_grno,
		vs.sewadar_id,
		vs.sewadar_status_nm,
		enable = (CASE WHEN siv.system_info_cd IS NULL THEN 'No' ELSE 'Yes' END),
		se.sewa_exemption_nm,
		grd_full_nm = vs.full_nm	
	FROM team_wise_daily_attendance tw
	JOIN sewa_team_wise_sewadars st ON st.sewa_team_id = tw.sewa_team_id
					AND st.serial_id = tw.serial_id
	JOIN ViewSewadarHeaderOnGRNo vs ON st.satsang_centre_id = vs.satsang_centre_id
				  AND st.sewadar_grno = vs.sewadar_grno
	LEFT OUTER JOIN sewa_exemptions se ON se.sewa_exemption_id = tw.sewa_exemption_id
	LEFT OUTER JOIN system_information_values siv ON (siv.system_info_cd = 'SttsActv' AND siv.system_info_value = vs.sewadar_status_cd)
	WHERE
	
		tw.sewa_team_id	=	@sewa_team_id
	AND	tw.attendance_dt	=	@attendance_dt
	ORDER BY tw.serial_id ASC

END
GO
-- =============================================================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewaTeamsTxnT
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewaTeamsTxnT'
			)
	BEGIN
		DROP PROCEDURE  InsertSewaTeamsTxnT
	END
GO
CREATE PROCEDURE InsertSewaTeamsTxnT
(
	@sewa_team_id		sewa_team_id,
	@attendance_dt		smalldatetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewa_teams_txn_ts
	(
		sewa_team_id, attendance_dt
	)
	VALUES
	(
		@sewa_team_id, @attendance_dt
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewaTeamsTxnT
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewaTeamsTxnT'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewaTeamsTxnT
	END
GO
CREATE PROCEDURE UpdateSewaTeamsTxnT
(
	@sewa_team_id		sewa_team_id,
	@attendance_dt		smalldatetime,
	@txn_ts				timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewa_teams_txn_ts
	SET
		attendance_dt	=	attendance_dt
	WHERE
		txn_ts			=	@txn_ts
	AND	sewa_team_id		=	@sewa_team_id
	AND	attendance_dt		=	@attendance_dt
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotUpdated', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewaTeamsTxnT
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewaTeamsTxnT'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewaTeamsTxnT
	END
GO
CREATE PROCEDURE DeleteSewaTeamsTxnT
(
	@sewa_team_id		sewa_team_id,
	@attendance_dt		smalldatetime,
	@txn_ts				timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM team_wise_daily_attendance
	WHERE
		sewa_team_id			=	@sewa_team_id
	AND	attendance_dt			=	@attendance_dt
	
	DELETE FROM sewa_teams_txn_ts
	WHERE
		txn_ts			=	@txn_ts
	AND	sewa_team_id		=	@sewa_team_id
	AND	attendance_dt		=	@attendance_dt
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewSewaTeamAttendence
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewaTeamAttendence' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSewaTeamAttendence
	END
GO
CREATE VIEW ViewSewaTeamAttendence

WITH ENCRYPTION
AS
	SELECT 
		s.satsang_centre_id, 
		vsc.centre_nm,
		tw.sewa_team_id, 
		tw.attendance_dt,
		st.sewa_team_nm,
		s.sewa_id,
		s.sewa_nm,
		s.finish_dt,
		s.start_dt,
		tw.txn_ts
	FROM sewa_teams st 
	JOIN sewas s ON s.sewa_id = st.sewa_id
	JOIN ViewSatsangCentreDetails vsc ON vsc.satsang_centre_id = s.satsang_centre_id
	LEFT OUTER JOIN sewa_teams_txn_ts tw ON st.sewa_team_id = tw.sewa_team_id
GO

-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewTeamDailyAttendence
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewTeamDailyAttendence' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewTeamDailyAttendence
	END
GO
CREATE VIEW ViewTeamDailyAttendence

WITH ENCRYPTION
AS
	SELECT 
		s.satsang_centre_id, 
		s.sewa_id,
		vs.sewadar_id,
		vs.sewadar_grno,
		vs.full_nm,
		vs.centre_nm,
		vs.age,
		vs.sewadar_status_nm, 
		vs.sewadar_status_dtm, 
		vs.department_nm, 
		vs.sub_department_nm, 
		vs.department_dt,
		s.sewa_nm,
		s.finish_dt,
		s.start_dt,
		stt.screen_id,
		stws.serial_id,
		st.sewa_team_id,
		st.sewa_team_nm,
		enable = (CASE WHEN siv.system_info_cd IS NULL THEN 'No' ELSE (CASE WHEN s.locked_dtm IS NOT NULL THEN 'No' ELSE 'Yes' END) END),
		--p_count = dbo.fnSewadarTeamWiseDailyAttCount(s.satsang_centre_id, sr.sewadar_grno, s.sewa_id, 'P'),
		--l_count = dbo.fnSewadarTeamWiseDailyAttCount(s.satsang_centre_id, sr.sewadar_grno, s.sewa_id, 'L'),
		--e_count = dbo.fnSewadarTeamWiseDailyAttCount(s.satsang_centre_id, sr.sewadar_grno, s.sewa_id, 'E'),
		--a_count = dbo.fnSewadarTeamWiseDailyAttCount(s.satsang_centre_id, sr.sewadar_grno, s.sewa_id, 'A'),
		stt.txn_ts
	FROM ViewSewadarHeaderOnGRNo vs
	JOIN sewa_team_wise_sewadars stws ON stws.sewadar_grno = vs.sewadar_grno AND stws.satsang_centre_id = vs.satsang_centre_id
	JOIN sewa_teams st ON st.sewa_team_id = stws.sewa_team_id
	JOIN sewas s ON s.sewa_id = st.sewa_id
	LEFT OUTER JOIN sewadars_txn_ts stt ON vs.satsang_centre_id = stt.satsang_centre_id AND stt.sewadar_grno = vs.sewadar_grno AND  s.sewa_id = stt.sewa_id
	LEFT OUTER JOIN system_information_values siv
			ON	(	siv.system_info_cd		=	'SttsActv'
				AND siv.system_info_value	=	vs.sewadar_status_cd
				)
	WHERE screen_id IS NULL OR screen_id = 'ATT_05'
GO
-- vim:ts=4 sw=4 ht=4


