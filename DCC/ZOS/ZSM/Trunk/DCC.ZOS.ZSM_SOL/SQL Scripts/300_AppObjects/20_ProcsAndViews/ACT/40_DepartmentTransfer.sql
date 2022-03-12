SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ValidateDepartmentTransfer
-- =============================================================================

IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='ValidateDepartmentTransfer'
			)
	BEGIN
		DROP PROCEDURE  ValidateDepartmentTransfer
	END
GO
CREATE PROCEDURE ValidateDepartmentTransfer
(
	@p_satsang_centre_id	satsang_centre_id,
	@p_sewadar_grno			sewadar_grno,
	@p_effective_dt			smalldatetime,
	@p_is_team_transfer		VARCHAR (1)			OUTPUT				---- Y[es] / N[o]
)
WITH ENCRYPTION
AS
	DECLARE
		@sewa_id	sewa_id,
		@app_dt		DATETIME,
		@dept_dt	DATETIME,
		@status_cd	sewadar_status_cd,
		@cnt		INT;
BEGIN
	SELECT	@dept_dt	=	department_dt,
			@app_dt		=	appointment_dt,
			@status_cd	=	sewadar_status_cd
	FROM	sewadars_registrations
	WHERE	sewadar_grno = @p_sewadar_grno
	AND		satsang_centre_id = @p_satsang_centre_id;

	IF (@p_effective_dt	<=	@app_dt)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'GreaterValueReqd', NULL, 'Transfer Date', 'Appointment Date', NULL;
		RETURN
	END

	IF (@p_effective_dt	<	@dept_dt)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'GreaterValueReqd', NULL, 'Transfer Date', 'previous Transfer Date', NULL;
		RETURN
	END

	IF (@p_effective_dt	=	@dept_dt)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Department Transfer', 'only one Transfer is allowed in a day', NULL;
		RETURN
	END

	IF NOT EXISTS	(	SELECT	1
						FROM	system_information_values
						WHERE	system_info_cd		=	'SttsGenUse'
						AND		system_info_value	=	@status_cd 
					)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Department Transfer', 'of the Status of Sewadar', NULL;
		RETURN
	END

	SELECT	@sewa_id = sewa_id
	FROM	sewas
	WHERE	satsang_centre_id	=	@p_satsang_centre_id
	AND		attendance_marking	=	'Team-wise'
	AND		@p_effective_dt		BETWEEN start_dt AND finish_dt;

	IF (@@ROWCOUNT > 0)
	BEGIN
		SELECT	@cnt	=	COUNT(*)
		FROM	sewa_team_wise_sewadars stws 
			JOIN sewa_teams st
				ON	(	stws.sewa_team_id		=	st.sewa_team_id
					AND stws.satsang_centre_id	=	@p_satsang_centre_id
					AND stws.sewadar_grno		=	@p_sewadar_grno
					AND	st.sewa_id				=	@sewa_id
					AND	(	stws.transfer_in_dt		IS NULL	OR	(	stws.transfer_in_dt		IS NOT NULL	AND	stws.transfer_in_dt		<= @p_effective_dt	)	)
					AND	(	stws.transfer_out_dt	IS NULL	OR	(	stws.transfer_out_dt	IS NOT NULL	AND	stws.transfer_out_dt	>= @p_effective_dt	)	)
					);
		IF (@cnt = 0)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Department Transfer', 'Sewadar is not yet allocated in any Sewa Team', NULL;
			RETURN
		END

		IF (@cnt > 1)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Department Transfer', 'Sewadar is in more than one Sewa Team [FATAL]', NULL;
			RETURN
		END
		SET @p_is_team_transfer	= 'Y'
	END
	ELSE
		SET @p_is_team_transfer	= 'N'
END
GO


-- =============================================================================
--	Procedure	InsertSewadarsTransfer
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsTransfer'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsTransfer
	END
GO
CREATE PROCEDURE InsertSewadarsTransfer
(
	@satsang_centre_id			satsang_centre_id,
	@sewadar_grno				sewadar_grno,
	@effective_dt				smalldatetime,
	@old_department_id			department_id = NULL,
	@old_sub_department_id		department_id = NULL,
	@department_id				department_id,
	@sub_department_id			department_id = NULL,
	@remarks					remarks = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_transfers
	(
		satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks
	)
	VALUES
	(
		@satsang_centre_id, @sewadar_grno, @effective_dt, @old_department_id, @old_sub_department_id, @department_id, @sub_department_id, @remarks
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadarsTransfer
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarsTransfer'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarsTransfer
	END
GO
CREATE PROCEDURE UpdateSewadarsTransfer
(
	@satsang_centre_id			satsang_centre_id,
	@sewadar_grno				sewadar_grno,
	@effective_dt				smalldatetime,
	@old_department_id			department_id,
	@old_sub_department_id		department_id,
	@department_id				department_id,
	@sub_department_id			department_id,
	@remarks					remarks,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars_transfers
	SET
		satsang_centre_id			=	@satsang_centre_id,
		sewadar_grno				=	@sewadar_grno,
		effective_dt				=	@effective_dt,
		old_department_id			=	@old_department_id,
		old_sub_department_id		=	@old_sub_department_id,
		department_id				=	@department_id,
		sub_department_id			=	@sub_department_id,
		remarks						=	@remarks
	WHERE (1 = 2) --ADD YOUR WHERE CLAUSE
	AND txn_ts					=	@txn_ts
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
--	Procedure	DeleteSewadarsTransfer
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadarsTransfer'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadarsTransfer
	END
GO
CREATE PROCEDURE DeleteSewadarsTransfer
(
	@satsang_centre_id			satsang_centre_id,
	@sewadar_grno				sewadar_grno,
	@effective_dt				smalldatetime,
	@old_department_id			department_id,
	@old_sub_department_id		department_id,
	@department_id				department_id,
	@sub_department_id			department_id,
	@remarks					remarks,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadars_transfers
	WHERE (1 = 2) --ADD YOUR WHERE CLAUSE
	AND txn_ts=	@txn_ts
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
--	Procedure	ViewSewadarsTransfers
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewadarsTransfers' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSewadarsTransfers
	END
GO
CREATE VIEW ViewSewadarsTransfers

WITH ENCRYPTION
AS
	SELECT
		st.satsang_centre_id, 
		st.sewadar_grno, 
		vs.sewadar_id,
		vs.full_nm,
		vs.department_dt,
		st.effective_dt, 
		st.old_department_id, 
		st.old_sub_department_id, 
		st.department_id, 
		st.sub_department_id, 
		st.remarks, 
		d.department_nm,
		sd.sub_department_nm,
		old_sub_department_nm = osd.sub_department_nm,
		old_department_nm = od.department_nm,
		vs.sewadar_status_nm,
		vs.sewadar_status_dtm,
		vs.gender,
		st.txn_ts
	FROM sewadars_transfers st
	JOIN ViewSewadarHeader vs ON vs.satsang_centre_id = st.satsang_centre_id AND vs.sewadar_grno = st.sewadar_grno
	JOIN departments d ON d.department_id = st.department_id
	LEFT OUTER JOIN sub_departments sd ON sd.sub_department_id = st.sub_department_id
	LEFT OUTER JOIN departments od ON od.department_id = st.old_department_id
	LEFT OUTER JOIN sub_departments osd ON osd.sub_department_id = st.old_sub_department_id
GO

-- =============================================================================
--    Procedure    ViewCurrentDate
-- =============================================================================

IF EXISTS    (    SELECT  *
					FROM    sysobjects
					WHERE name = 'ViewCurrentDate' and TYPE='v'
			  )

    BEGIN
        DROP VIEW ViewCurrentDate
    END
GO
CREATE VIEW ViewCurrentDate
 
WITH ENCRYPTION
AS
    SELECT CONVERT (datetime, CONVERT (varchar(11), GETDATE(), 106)) CurrentDate
GO


-- =============================================================================
-- Function GetSystemDate
 -- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSystemDate' AND xtype = 'FN')
    DROP FUNCTION GetSystemDate
 GO

CREATE FUNCTION GetSystemDate
(
)
RETURNS    DATETIME
WITH ENCRYPTION
AS
BEGIN
    DECLARE @Now DATETIME
    SELECT @Now = CurrentDate FROM ViewCurrentDate

    Return @Now
 END
GO
-- =============================================================================

-- vim:ts=4 sw=4 ht=4
