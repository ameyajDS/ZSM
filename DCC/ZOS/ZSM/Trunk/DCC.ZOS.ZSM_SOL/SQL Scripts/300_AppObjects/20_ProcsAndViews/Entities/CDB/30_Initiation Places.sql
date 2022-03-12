SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertInitiationPlace
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertInitiationPlace'
			)
	BEGIN
		DROP PROCEDURE  InsertInitiationPlace
	END
GO
CREATE PROCEDURE InsertInitiationPlace
(
	@place_id			place_id output,
	@place_nm			varchar(35),
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO initiation_places
	(
		place_nm, effective_from, effective_till
	)
	VALUES
	(
		@place_nm, @effective_from, @effective_till
	)
	SELECT @place_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateInitiationPlace
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateInitiationPlace'
			)
	BEGIN
		DROP PROCEDURE  UpdateInitiationPlace
	END
GO
CREATE PROCEDURE UpdateInitiationPlace
(
	@place_id			place_id,
	@place_nm			varchar(35),
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    initiation_places
	SET
		place_nm			=	@place_nm,
		effective_from		=	@effective_from,
		effective_till		=	@effective_till
	WHERE place_id = @place_id
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
--	Procedure	DeleteInitiationPlace
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteInitiationPlace'
			)
	BEGIN
		DROP PROCEDURE  DeleteInitiationPlace
	END
GO
CREATE PROCEDURE DeleteInitiationPlace
(
	@place_id			place_id,	
	@txn_ts				timestamp
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM initiation_places
	WHERE place_id = @place_id
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
--	Procedure	QueryInitiationPlace
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryInitiationPlace'
			)
	BEGIN
		DROP PROCEDURE  QueryInitiationPlace
	END
GO
CREATE PROCEDURE QueryInitiationPlace
(
	@place_id			place_id,
	@place_nm			varchar(35),
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		place_id, 
		place_nm, 
		txn_ts, 
		effective_from, 
		effective_till
	FROM initiation_places
	
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewInitiationPlace
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE   TYPE = 'v'
				AND     NAME='ViewInitiationPlace'
			)
	BEGIN
		DROP VIEW  ViewInitiationPlace
	END
GO
CREATE VIEW ViewInitiationPlace

WITH ENCRYPTION
AS

	SELECT
		place_id, 
		place_nm, 
		txn_ts, 
		effective_from, 
		effective_till
	FROM initiation_places


GO

-- vim:ts=4 sw=4 ht=4