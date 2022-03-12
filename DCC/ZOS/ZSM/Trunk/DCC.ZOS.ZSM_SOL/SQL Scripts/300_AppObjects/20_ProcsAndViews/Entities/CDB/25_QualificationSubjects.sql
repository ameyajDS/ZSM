SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertQlfctnSubject
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertQlfctnSubject'
			)
	BEGIN
		DROP PROCEDURE  InsertQlfctnSubject
	END
GO
CREATE PROCEDURE InsertQlfctnSubject
(
	@qlfctn_subject_id		qlfctn_subject_id output,
	@qlfctn_subject_cd		varchar(5),
	@qlfctn_subject_nm		varchar(20),
	@description			varchar(50) = NULL,
	@effective_from			datetime,
	@effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO qlfctn_subjects
	(
		qlfctn_subject_cd, qlfctn_subject_nm, description, effective_from, effective_till
	)
	VALUES
	(
		@qlfctn_subject_cd, @qlfctn_subject_nm, @description, @effective_from, @effective_till
	)
	SELECT @qlfctn_subject_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateQlfctnSubject
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateQlfctnSubject'
			)
	BEGIN
		DROP PROCEDURE  UpdateQlfctnSubject
	END
GO
CREATE PROCEDURE UpdateQlfctnSubject
(
	@qlfctn_subject_id		qlfctn_subject_id,
	@qlfctn_subject_cd		varchar(5),
	@qlfctn_subject_nm		varchar(20),
	@description			varchar(50),
	@effective_from			datetime,
	@effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    qlfctn_subjects
	SET
		qlfctn_subject_cd		=	@qlfctn_subject_cd,
		qlfctn_subject_nm		=	@qlfctn_subject_nm,
		description				=	@description,
		effective_from			=	@effective_from,
		effective_till			=	@effective_till
	WHERE
	 	qlfctn_subject_id = @qlfctn_subject_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteQlfctnSubject
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteQlfctnSubject'
			)
	BEGIN
		DROP PROCEDURE  DeleteQlfctnSubject
	END
GO
CREATE PROCEDURE DeleteQlfctnSubject
(
	@qlfctn_subject_id		qlfctn_subject_id
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM qlfctn_subjects
	WHERE
	 	qlfctn_subject_id = @qlfctn_subject_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewQlfctnSubject
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewQlfctnSubject' and TYPE='v'
			)
			
	BEGIN
		DROP VIEW  ViewQlfctnSubject
	END
GO
CREATE VIEW ViewQlfctnSubject

WITH ENCRYPTION
AS
	SELECT
		qlfctn_subject_id, 
		qlfctn_subject_cd, 
		qlfctn_subject_nm, 
		description, 
		effective_from, 
		effective_till
	FROM qlfctn_subjects
GO



-- vim:ts=4 sw=4 ht=4
