SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarsPhoto
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarsPhoto'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarsPhoto
	END
GO
CREATE PROCEDURE QuerySewadarsPhoto
(
	@sewadar_id			sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sewadar_photo, 
		photo_dt
	FROM ZSM_Photos..sewadars_photos sp
	WHERE sewadar_id			=	@sewadar_id
END
GO
-- =============================================================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadar'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadar
	END
GO
CREATE PROCEDURE InsertSewadar
(
	@sewadar_id						sewadar_id output,
	@first_nm						name_part,
	@middle_nm						name_part,
	@last_nm						name_part,
	@gender							Gender,
	@birth_dtm						smalldatetime,
	@is_married						Boolean,
	@initiation_dt					smalldatetime = NULL,
	@initiation_place_id			initiation_place_id = NULL,
	@initiation_by					patron_id = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars
	(
		first_nm, middle_nm, last_nm, gender, birth_dtm, is_married, initiation_dt, initiation_place_id, initiation_by
	)
	VALUES
	(
		@first_nm, @middle_nm, @last_nm, @gender, @birth_dtm, @is_married, @initiation_dt, @initiation_place_id, @initiation_by
	)
	SELECT @sewadar_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadar'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadar
	END
GO
CREATE PROCEDURE UpdateSewadar
(
	@sewadar_id						sewadar_id,
	@first_nm						name_part,
	@middle_nm						name_part,
	@last_nm						name_part,
	@gender							Gender,
	@birth_dtm						smalldatetime,
	@is_married						Boolean,
	@initiation_dt					smalldatetime,
	@initiation_place_id			initiation_place_id,
	@initiation_by					patron_id,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars
	SET
		first_nm						=	@first_nm,
		middle_nm						=	@middle_nm,
		last_nm							=	@last_nm,
		gender							=	@gender,
		birth_dtm						=	@birth_dtm,
		is_married						=	@is_married,
		initiation_dt					=	@initiation_dt,
		initiation_place_id				=	@initiation_place_id,
		initiation_by					=	@initiation_by
	WHERE 
	    sewadar_id = @sewadar_id
	AND txn_ts						=	@txn_ts
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
--	Procedure	UpdateSewadarGlobalStatus
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSewadarGlobalStatus'
			)
	BEGIN
		DROP PROCEDURE  UpdateSewadarGlobalStatus
	END
GO
CREATE PROCEDURE UpdateSewadarGlobalStatus
(
	@sewadar_id						sewadar_id,
	@global_sewadar_status_cd		sewadar_status_cd,
	@global_sewadar_status_dt		smalldatetime,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    sewadars
	SET
		global_sewadar_status_cd		=	@global_sewadar_status_cd,
		global_sewadar_status_dt		=	@global_sewadar_status_dt
	WHERE 
	    sewadar_id = @sewadar_id
	AND txn_ts						=	@txn_ts
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
--	Procedure	DeleteSewadar
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSewadar'
			)
	BEGIN
		DROP PROCEDURE  DeleteSewadar
	END
GO
CREATE PROCEDURE DeleteSewadar
(
	@sewadar_id						sewadar_id,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM sewadars
	WHERE 
	    sewadar_id = @sewadar_id
	AND txn_ts=	@txn_ts
	IF (@@ROWCOUNT != 1)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotDeleted', NULL, NULL, NULL, NULL
	END
	DELETE FROM ZSM_Photos..sewadars_photos
	WHERE
		sewadar_id = @sewadar_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewSewadar
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSewadar' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewSewadar
	END
GO
CREATE VIEW ViewSewadar

WITH ENCRYPTION
AS
	SELECT
		s.sewadar_id, 
		s.first_nm, 
		s.middle_nm, 
		s.last_nm, 
		s.gender, 
		s.birth_dtm, 
		s.age,
		s.is_married, 
		s.initiation_dt, 
		s.initiation_place_id, 
		s.place_nm,
		s.initiation_by, 
		s.satsang_centre_id, -- define where clause on this column 
		s.global_sewadar_status_cd, 
		s.global_sewadar_status_dt,
		s.sewadar_grno, 
		s.sewadar_status_nm,
		s.sewadar_status_dtm,
		--s.global_sewadar_status_nm,
		s.centre_nm,
		s.department_dt,
		s.appointment_dt,
		sp.photo_dt,
		department_nm = s.full_department_nm,
		s.txn_ts
	FROM ViewSewadarHeader s
	LEFT OUTER JOIN ZSM_Photos..sewadars_photos sp ON s.sewadar_id = sp.sewadar_id
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarsRemark
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarsRemark'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarsRemark
	END
GO
CREATE PROCEDURE QuerySewadarsRemark
(
	@sewadar_id			sewadar_id
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sr.remarks_type, 
		remarks_sq, 
		old_remarks_sq = remarks_sq,
		old_remarks_type = sr.remarks_type,
		remarks_type_sq,
		sr.remarks
	FROM sewadars_remarks sr
	JOIN remarks_types rt ON sr.remarks_type = rt.remarks_type
	WHERE
		sewadar_id = @sewadar_id
	ORDER BY remarks_type_sq, remarks_sq
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsPhoto
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsPhoto'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsPhoto
	END
GO
CREATE PROCEDURE InsertSewadarsPhoto
(
	@sewadar_id			sewadar_id,
	@sewadar_photo		image,
	@photo_dt			datetime
)
WITH ENCRYPTION
AS
BEGIN
		IF EXISTS (SELECT
					1 
					FROM ZSM_Photos..sewadars_photos
				    WHERE sewadar_id = @sewadar_id)
		BEGIN
			IF @sewadar_photo IS NULL
			BEGIN
				DELETE FROM ZSM_Photos..sewadars_photos
				WHERE sewadar_id = @sewadar_id
			END
			ELSE
			BEGIN
				UPDATE   ZSM_Photos..sewadars_photos
				SET
					sewadar_photo			=	@sewadar_photo,
					photo_dt			=	@photo_dt
				WHERE	
					sewadar_id = @sewadar_id
			END
		END
		ELSE
		BEGIN
		INSERT INTO ZSM_Photos..sewadars_photos
		(
			sewadar_id, sewadar_photo, photo_dt
		)
		VALUES
		(
			@sewadar_id, @sewadar_photo, @photo_dt
		)
		END
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4

