SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertOccupation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertOccupation'
			)
	BEGIN
		DROP PROCEDURE  InsertOccupation
	END
GO
CREATE PROCEDURE InsertOccupation
(
	@occupation_id		occupation_id output,
	@occupation_cd		varchar(12),
	@occupation_nm		varchar(40),
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO occupations
	(
		occupation_cd, occupation_nm, effective_from, effective_till
	)
	VALUES
	(
		@occupation_cd, @occupation_nm, @effective_from, @effective_till
	)
	SELECT @occupation_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateOccupation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateOccupation'
			)
	BEGIN
		DROP PROCEDURE  UpdateOccupation
	END
GO
CREATE PROCEDURE UpdateOccupation
(
	@occupation_id		occupation_id,
	@occupation_cd		varchar(12),
	@occupation_nm		varchar(40),
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    occupations
	SET
		occupation_cd		=	@occupation_cd,
		occupation_nm		=	@occupation_nm,
		effective_from		=	@effective_from,
		effective_till		=	@effective_till
	WHERE occupation_id = @occupation_id
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
--	Procedure	DeleteOccupation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteOccupation'
			)
	BEGIN
		DROP PROCEDURE  DeleteOccupation
	END
GO
CREATE PROCEDURE DeleteOccupation
(
	@occupation_id		occupation_id,	
	@txn_ts				timestamp
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM occupations
	WHERE occupation_id = @occupation_id
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
--	Procedure	QueryOccupation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryOccupation'
			)
	BEGIN
		DROP PROCEDURE  QueryOccupation
	END
GO
CREATE PROCEDURE QueryOccupation
(
	@occupation_id		occupation_id,
	@occupation_cd		varchar(12),
	@occupation_nm		varchar(40),
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		occupation_id, 
		occupation_cd, 
		occupation_nm, 
		txn_ts, 
		effective_from, 
		effective_till
	FROM occupations	
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewOccupation
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewOccupation' and TYPE='v'
			)

	BEGIN
		DROP VIEW  ViewOccupation
	END
GO
CREATE VIEW ViewOccupation

WITH ENCRYPTION
AS

	SELECT
		occupation_id, 
		occupation_cd, 
		occupation_nm, 
		txn_ts, 
		effective_from, 
		effective_till
	FROM occupations

GO

-- vim:ts=4 sw=4 ht=4