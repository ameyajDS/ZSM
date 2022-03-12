SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewaTeamWiseSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewaTeamWiseSewadar'
			)
	BEGIN
		DROP PROCEDURE  InsertSewaTeamWiseSewadar
	END
GO
CREATE PROCEDURE InsertSewaTeamWiseSewadar
(
	@sewa_team_id			sewa_team_id,
	@serial_id				sewa_team_serial_id,
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@transfer_in_dt			smalldatetime = NULL,
	@transfer_out_dt		smalldatetime = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewa_team_wise_sewadars
	(
		sewa_team_id, serial_id, satsang_centre_id, sewadar_grno, transfer_in_dt, transfer_out_dt
	)
	VALUES
	(
		@sewa_team_id, @serial_id, @satsang_centre_id, @sewadar_grno, @transfer_in_dt, @transfer_out_dt
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewaTeamWiseSewadarSq
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewaTeamWiseSewadarSq'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewaTeamWiseSewadarSq
	END
GO
CREATE PROCEDURE UpdateSewaTeamWiseSewadarSq
(
	@sewa_team_id			sewa_team_id,
	@old_serial_id			sewa_team_serial_id,
	@serial_id				sewa_team_serial_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewa_team_wise_sewadars
	SET
		serial_id			=	-1*@serial_id
	WHERE
		sewa_team_id		=	@sewa_team_id
	AND	serial_id			=	@old_serial_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewaTeamWiseSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewaTeamWiseSewadar'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewaTeamWiseSewadar
	END
GO
CREATE PROCEDURE UpdateSewaTeamWiseSewadar
(
	@sewa_team_id			sewa_team_id,
	@serial_id				sewa_team_serial_id,
	@old_serial_id				sewa_team_serial_id,
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno,
	@transfer_in_dt			smalldatetime = NULL,
	@transfer_out_dt		smalldatetime = NULL
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewa_team_wise_sewadars
	SET
		satsang_centre_id		=	@satsang_centre_id,
		sewadar_grno			=	@sewadar_grno,
		transfer_in_dt			=	@transfer_in_dt,
		serial_id				=	@serial_id,
		transfer_out_dt			=	@transfer_out_dt
	WHERE
		sewa_team_id			=	@sewa_team_id
	AND	serial_id				=	@old_serial_id
		
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	MakePositiveSewaTeamWiseSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='MakePositiveSewaTeamWiseSewadar'
			)
	BEGIN
		DROP PROCEDURE  MakePositiveSewaTeamWiseSewadar
	END
GO
CREATE PROCEDURE MakePositiveSewaTeamWiseSewadar
(
	@sewa_team_id			sewa_team_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewa_team_wise_sewadars
	SET
		serial_id			=	-1*serial_id
	WHERE
		sewa_team_id			=	@sewa_team_id
	AND serial_id 			< 	0
		
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteAllSewaTeamWiseSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteAllSewaTeamWiseSewadar'
			)
	BEGIN
		DROP PROCEDURE  DeleteAllSewaTeamWiseSewadar
	END
GO
CREATE PROCEDURE DeleteAllSewaTeamWiseSewadar
(
	@sewa_team_id			sewa_team_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewa_team_wise_sewadars
	WHERE
		sewa_team_id			=	@sewa_team_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteSewaTeamWiseSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewaTeamWiseSewadar'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewaTeamWiseSewadar
	END
GO
CREATE PROCEDURE DeleteSewaTeamWiseSewadar
(
	@sewa_team_id			sewa_team_id,
	@old_serial_id				sewa_team_serial_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewa_team_wise_sewadars
	WHERE
		sewa_team_id			=	@sewa_team_id
	AND	serial_id			=	@old_serial_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewaTeamWiseSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewaTeamWiseSewadar'
			)
	BEGIN
		DROP PROCEDURE  QuerySewaTeamWiseSewadar
	END
GO
CREATE PROCEDURE QuerySewaTeamWiseSewadar
(
	@sewa_team_id			sewa_team_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		old_serial_id = stws.serial_id, 
		stws.serial_id, 
		stws.satsang_centre_id, 
		vsd.centre_cd,
		vsd.centre_nm,
		stws.sewadar_grno,
		stws.transfer_in_dt, 
		stws.transfer_out_dt,
		vs.age, 
		vs.department_nm,
		vs.sub_department_nm,
		vs.full_nm
	FROM sewa_team_wise_sewadars stws
	JOIN ViewSatsangCentreDetails vsd ON vsd.satsang_centre_id = stws.satsang_centre_id
	JOIN ViewSewadarHeader vs ON vs.sewadar_grno = stws.sewadar_grno AND vs.satsang_centre_id = stws.satsang_centre_id
	JOIN sewadars_registrations sr On sr.satsang_centre_id = stws.satsang_centre_id AND sr.sewadar_grno = stws.sewadar_grno
	WHERE
		sewa_team_id = @sewa_team_id
	ORDER BY stws.serial_id ASC
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'fnGetMaxSerialId' AND TYPE = 'FN')
DROP FUNCTION [dbo].[fnGetMaxSerialId]
GO
CREATE FUNCTION [dbo].[fnGetMaxSerialId]
(
	@sewa_team_id 		sewa_team_id
)
RETURNS INTEGER
AS
BEGIN
	-- Declare the return variable here
	
	DECLARE @count INTEGER
	
	
	SELECT @count = MAX(serial_id)+1 FROM sewa_team_wise_sewadars WHERE sewa_team_id = @sewa_team_id
	
	RETURN @count
END
GO



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	GetActiveSerialIdForSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='GetActiveSerialIdForSewadar'
			)
	BEGIN
		DROP PROCEDURE  GetActiveSerialIdForSewadar
	END
GO
CREATE PROCEDURE GetActiveSerialIdForSewadar
(
	@satsang_centre_id	satsang_centre_id,
	@sewadar_grno		sewadar_grno,
	@effective_dt		DATETIME
)
WITH ENCRYPTION
AS
BEGIN	
	
	SELECT stws.serial_id, s.sewa_id, st.sewa_team_id, st.sewa_team_nm FROM sewa_team_wise_sewadars stws 
	JOIN sewa_teams st ON st.sewa_team_id = stws.sewa_team_id
	JOIN sewas s ON s.sewa_id = st.sewa_id
	WHERE stws.sewadar_grno = @sewadar_grno
	AND s.satsang_centre_id	=	@satsang_centre_id
	AND @effective_dt BETWEEN s.start_dt AND s.finish_dt
	AND stws.transfer_out_dt IS NULL

END
GO

-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='MergeTeamsForASewa'
			)
	BEGIN
		DROP PROCEDURE  MergeTeamsForASewa
	END
GO
CREATE PROCEDURE MergeTeamsForASewa
(
	@p_sewa_team_id_1			sewa_team_id,
	@p_sewa_team_id_2			sewa_team_id
)
WITH ENCRYPTION
AS
BEGIN
	
	DECLARE @acceptance_ts_1 DATETIME,
			@acceptance_ts_2 DATETIME,
			@max_serial_no INT;

	SELECT @acceptance_ts_1 = acceptance_ts FROM sewa_teams WHERE sewa_team_id = @p_sewa_team_id_1
	SELECT @acceptance_ts_2 = acceptance_ts FROM sewa_teams WHERE sewa_team_id = @p_sewa_team_id_2

	IF ((@acceptance_ts_1 IS NULL AND @acceptance_ts_2 IS NOT NULL)
	   OR (@acceptance_ts_2 IS NULL AND @acceptance_ts_1 IS NOT NULL))
	BEGIN
		RAISERROR('Either both the teams being merged should have been accepted or both should not have accepted.', 16, 1)
		RETURN;
	END 	
	IF EXISTS (	SELECT	1
				FROM	sewa_team_wise_sewadars
				WHERE	sewa_team_id IN (@p_sewa_team_id_1, @p_sewa_team_id_2)
				AND	(	transfer_in_dt IS NOT NULL
					OR	transfer_out_dt IS NOT NULL
					)
			  )
	BEGIN
		RAISERROR('One or both the Sewa team(s) has at least a transfer. Unable to merge.', 16, 1)
		RETURN;
	END 	
	IF EXISTS ( SELECT	1
				FROM	team_wise_daily_attendance
				WHERE	sewa_team_id IN (@p_sewa_team_id_1, @p_sewa_team_id_2)
			  )
	BEGIN
		RAISERROR('Attendance for any Sewadar should not have been recorded in any of the two teams', 16, 1)
		RETURN;
	END 	
	
	SELECT @max_serial_no = MAX(serial_id) FROM sewa_team_wise_sewadars WHERE sewa_team_id = @p_sewa_team_id_1;

	DECLARE	@tbl TABLE
		(	grno	CHAR (6),
			c_id	INT,
			srl		INT
		);

	INSERT INTO	@tbl
		SELECT	sewadar_grno, satsang_centre_id, serial_id + @max_serial_no
		FROM	sewa_team_wise_sewadars
		WHERE	sewa_team_id = @p_sewa_team_id_2;

	DELETE FROM sewa_team_wise_sewadars
	WHERE sewa_team_id = @p_sewa_team_id_2;

	INSERT INTO sewa_team_wise_sewadars
			(	sewa_team_id, sewadar_grno, satsang_centre_id, serial_id	)
		SELECT	@p_sewa_team_id_1, grno, c_id, srl
		FROM	@tbl;
	
	DELETE FROM sewa_teams
	WHERE sewa_team_id = @p_sewa_team_id_2;
END


-- =============================================================================

-- vim:ts=4 sw=4 ht=4

