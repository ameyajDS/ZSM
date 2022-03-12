SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSkill'
			)
	BEGIN
		DROP PROCEDURE  InsertSkill
	END
GO
CREATE PROCEDURE InsertSkill
(
	@skill_id			skill_id output,
	@skill_nm			varchar(20),
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO skills
	(
		skill_nm, effective_from, effective_till
	)
	VALUES
	(
		@skill_nm, @effective_from, @effective_till
	)
	SELECT @skill_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateSkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateSkill'
			)
	BEGIN
		DROP PROCEDURE  UpdateSkill
	END
GO
CREATE PROCEDURE UpdateSkill
(
	@skill_id			skill_id,
	@skill_nm			varchar(20),
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    skills
	SET
		skill_nm			=	@skill_nm,
		effective_from		=	@effective_from,
		effective_till		=	@effective_till
	WHERE skill_id = @skill_id
	AND txn_ts			=	@txn_ts
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
--	Procedure	DeleteSkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteSkill'
			)
	BEGIN
		DROP PROCEDURE  DeleteSkill
	END
GO
CREATE PROCEDURE DeleteSkill
(
	@skill_id			skill_id,	
	@txn_ts				timestamp
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM skills
	WHERE skill_id = @skill_id
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
--	Procedure	QuerySkill
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySkill'
			)
	BEGIN
		DROP PROCEDURE  QuerySkill
	END
GO
CREATE PROCEDURE QuerySkill
(
	@skill_id			skill_id,
	@skill_nm			varchar(20),
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		skill_id, 
		skill_nm, 
		txn_ts, 
		effective_from, 
		effective_till
	FROM skills
	
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewSkill
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewSkill' and TYPE='v'
			)
	BEGIN
		DROP VIEW  ViewSkill
	END
GO
CREATE VIEW ViewSkill
AS
	SELECT
		skill_id, 
		skill_nm, 
		txn_ts, 
		effective_from, 
		effective_till
	FROM skills
GO

-- vim:ts=4 sw=4 ht=4