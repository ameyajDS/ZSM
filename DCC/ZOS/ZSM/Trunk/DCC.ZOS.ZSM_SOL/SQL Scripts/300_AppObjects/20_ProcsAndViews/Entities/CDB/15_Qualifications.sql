SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertQualification'
			)
	BEGIN
		DROP PROCEDURE  InsertQualification
	END
GO
CREATE PROCEDURE InsertQualification
(
	@qualification_id		qualification_id output,
	@qualification_type		qualification_type,
	@qualification_cd		varchar(8),
	@qualification_nm		varchar(35),
	@remarks				varchar(200) = NULL,
	@effective_from			datetime,
	@effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO qualifications
	(
		qualification_type, qualification_cd, qualification_nm, remarks, effective_from, effective_till
	)
	VALUES
	(
		@qualification_type, @qualification_cd, @qualification_nm, @remarks, @effective_from, @effective_till
	)
	SELECT @qualification_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateQualification'
			)
	BEGIN
		DROP PROCEDURE  UpdateQualification
	END
GO
CREATE PROCEDURE UpdateQualification
(
	@qualification_id		qualification_id,
	@qualification_type		qualification_type,
	@qualification_cd		varchar(8),
	@qualification_nm		varchar(35),
	@remarks				varchar(200),
	@effective_from			datetime,
	@effective_till			datetime,
	@txn_ts					timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    qualifications
	SET
		qualification_type		=	@qualification_type,
		qualification_cd		=	@qualification_cd,
		qualification_nm		=	@qualification_nm,
		remarks					=	@remarks,
		effective_from			=	@effective_from,
		effective_till			=	@effective_till
	WHERE  qualification_id = @qualification_id
	AND txn_ts				=	@txn_ts
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
--	Procedure	DeleteQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteQualification'
			)
	BEGIN
		DROP PROCEDURE  DeleteQualification
	END
GO
CREATE PROCEDURE DeleteQualification
(
	@qualification_id		qualification_id,	
	@txn_ts					timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM qualifications_qlfctn_subjects	
	WHERE qualification_id = @qualification_id
	
	DELETE FROM qualifications
	WHERE qualification_id = @qualification_id
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
--	Procedure	QueryQualification
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryQualification'
			)
	BEGIN
		DROP PROCEDURE  QueryQualification
	END
GO
CREATE PROCEDURE QueryQualification
(
	@qualification_id		qualification_id,
	@qualification_type		qualification_type,
	@qualification_cd		varchar(8),
	@qualification_nm		varchar(35),
	@remarks				varchar(200),
	@effective_from			datetime,
	@effective_till			datetime,
	@txn_ts					timestamp
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		qualification_id, 
		qualification_type, 
		qualification_cd, 
		qualification_nm, 
		remarks, 
		effective_from, 
		effective_till, 
		txn_ts
	FROM qualifications
END
GO

-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewQualification
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewQualification' and TYPE='v'
			)
			
	BEGIN
		DROP VIEW  ViewQualification
	END
GO
CREATE VIEW ViewQualification

WITH ENCRYPTION
AS
	SELECT
		qualification_id, 
		qualification_type, 
		qualification_cd, 
		qualification_nm, 
		remarks, 
		effective_from, 
		effective_till, 
		txn_ts
	FROM qualifications
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertQualificationsQlfctnSubject
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertQualificationsQlfctnSubject'
			)
	BEGIN
		DROP PROCEDURE  InsertQualificationsQlfctnSubject
	END
GO
CREATE PROCEDURE InsertQualificationsQlfctnSubject
(
	@qualification_id				qualification_id,
	@qlfctn_subject_id				qlfctn_subject_id,
	@effective_from_subject			datetime,
	@effective_till_subject			datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO qualifications_qlfctn_subjects
	(
		qualification_id, qlfctn_subject_id, effective_from, effective_till
	)
	VALUES
	(
		@qualification_id, @qlfctn_subject_id, @effective_from_subject, @effective_till_subject
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateQualificationsQlfctnSubject
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateQualificationsQlfctnSubject'
			)
	BEGIN
		DROP PROCEDURE  UpdateQualificationsQlfctnSubject
	END
GO
CREATE PROCEDURE UpdateQualificationsQlfctnSubject
(
	@qualification_id		qualification_id,
	@qlfctn_subject_id		qlfctn_subject_id,
	@effective_from_subject			datetime,
	@effective_till_subject			datetime,
	@old_qualification_id		qualification_id,
	@old_qlfctn_subject_id		qlfctn_subject_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    qualifications_qlfctn_subjects
	SET
		qualification_id		=	@qualification_id,
		qlfctn_subject_id		=	@qlfctn_subject_id,
		effective_from			=	@effective_from_subject,
		effective_till			=	@effective_till_subject
	WHERE qualification_id = @old_qualification_id
	AND qlfctn_subject_id		= @old_qlfctn_subject_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteQualificationsQlfctnSubject
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteQualificationsQlfctnSubject'
			)
	BEGIN
		DROP PROCEDURE  DeleteQualificationsQlfctnSubject
	END
GO
CREATE PROCEDURE DeleteQualificationsQlfctnSubject
(
	@old_qualification_id		qualification_id,
	@old_qlfctn_subject_id		qlfctn_subject_id
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM qualifications_qlfctn_subjects	
	WHERE qualification_id = @old_qualification_id
	AND qlfctn_subject_id		= @old_qlfctn_subject_id
	
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryQualificationsQlfctnSubject
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryQualificationsQlfctnSubject'
			)
	BEGIN
		DROP PROCEDURE  QueryQualificationsQlfctnSubject
	END
GO
CREATE PROCEDURE QueryQualificationsQlfctnSubject
(
	@qualification_id		qualification_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT		
		qqs.qlfctn_subject_id, 
		qs.qlfctn_subject_nm,
		qqs.qlfctn_subject_id as old_qlfctn_subject_id,
		qqs.effective_from as effective_from_subject, 
		qqs.effective_till as effective_till_subject
	FROM qualifications_qlfctn_subjects qqs
	JOIN qlfctn_subjects qs ON  qqs.qlfctn_subject_id = qs.qlfctn_subject_id
	WHERE qualification_id = @qualification_id
END
GO
-- =============================================================================

