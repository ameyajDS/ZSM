SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertState
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertState'
			)
	BEGIN
		DROP PROCEDURE  InsertState
	END
GO
CREATE PROCEDURE InsertState
(
	@state_id			state_id output,
	@state_cd			varchar(5),
	@state_nm			varchar(55),
	@country_id			country_id,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO states
	(
		state_cd, state_nm, country_id, effective_from, effective_till
	)
	VALUES
	(
		@state_cd, @state_nm, @country_id, @effective_from, @effective_till
	)
	SELECT @state_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateState
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateState'
			)
	BEGIN
		DROP PROCEDURE  UpdateState
	END
GO
CREATE PROCEDURE UpdateState
(
	@state_id			state_id,
	@state_cd			varchar(5),
	@state_nm			varchar(55),
	@country_id			country_id,
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    states
	SET
		state_cd			=	@state_cd,
		state_nm			=	@state_nm,
		country_id			=	@country_id,
		effective_from		=	@effective_from,
		effective_till		=	@effective_till
	WHERE state_id = @state_id
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
--	Procedure	DeleteState
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteState'
			)
	BEGIN
		DROP PROCEDURE  DeleteState
	END
GO
CREATE PROCEDURE DeleteState
(
	@state_id			state_id,	
	@txn_ts				timestamp
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM states
	WHERE state_id = @state_id
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
--	Procedure	QueryState
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryState'
			)
	BEGIN
		DROP PROCEDURE  QueryState
	END
GO
CREATE PROCEDURE QueryState
(
	@state_id			state_id,
	@state_cd			varchar(5),
	@state_nm			varchar(55),
	@country_id			country_id,
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		state_id, 
		state_cd, 
		state_nm, 
		country_id, 
		txn_ts, 
		effective_from, 
		effective_till
	FROM states
	
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewState
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewState' and TYPE='v'
			)
			
	BEGIN
		DROP VIEW  ViewState
	END
GO
CREATE VIEW ViewState

WITH ENCRYPTION
AS

	SELECT
		state_id, 
		state_cd, 
		state_nm, 
		countries.country_id, 
		countries.country_nm,
		states.txn_ts, 
		states.effective_from, 
		states.effective_till
	FROM states
	JOIN countries ON states.country_id = countries.country_id


GO

-- vim:ts=4 sw=4 ht=4