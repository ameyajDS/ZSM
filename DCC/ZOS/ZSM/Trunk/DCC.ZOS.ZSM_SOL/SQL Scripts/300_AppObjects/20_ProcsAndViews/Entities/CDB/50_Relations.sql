SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertRelation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertRelation'
			)
	BEGIN
		DROP PROCEDURE  InsertRelation
	END
GO
CREATE PROCEDURE InsertRelation
(
	@relation_id		relation_id output,
	@relation_nm		varchar(20),
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO relations
	(
		relation_nm, effective_from, effective_till
	)
	VALUES
	(
		@relation_nm, @effective_from, @effective_till
	)
	SELECT @relation_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateRelation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateRelation'
			)
	BEGIN
		DROP PROCEDURE  UpdateRelation
	END
GO
CREATE PROCEDURE UpdateRelation
(
	@relation_id		relation_id,
	@relation_nm		varchar(20),
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    relations
	SET
		relation_nm			=	@relation_nm,
		effective_from		=	@effective_from,
		effective_till		=	@effective_till
	WHERE relation_id = @relation_id
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
--	Procedure	DeleteRelation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteRelation'
			)
	BEGIN
		DROP PROCEDURE  DeleteRelation
	END
GO
CREATE PROCEDURE DeleteRelation
(
	@relation_id		relation_id,
	@txn_ts			timestamp

)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM relations
	WHERE relation_id = @relation_id
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
--	Procedure	QueryRelation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryRelation'
			)
	BEGIN
		DROP PROCEDURE  QueryRelation
	END
GO
CREATE PROCEDURE QueryRelation
(
	@relation_id		relation_id,
	@relation_nm		varchar(20),
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		relation_id, 
		relation_nm, 
		txn_ts, 
		effective_from, 
		effective_till
	FROM relations	
END
GO
-- =============================================================================
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewRelation
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewRelation' and TYPE='v'
			)

	BEGIN
		DROP VIEW  ViewRelation
	END
GO
CREATE VIEW ViewRelation

WITH ENCRYPTION
AS

	SELECT
		relation_id, 
		relation_nm, 
		txn_ts, 
		effective_from, 
		effective_till
	FROM relations


GO


-- vim:ts=4 sw=4 ht=4