SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertCountrie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertCountrie'
			)
	BEGIN
		DROP PROCEDURE  InsertCountrie
	END
GO
CREATE PROCEDURE InsertCountrie
(
	@country_id			country_id output,
	@country_cd			varchar(5),
	@country_nm			varchar(55),
	@isd_code			varchar(10) = NULL,
	@gmt_diff			numeric(4,2),
	@effective_from		datetime,
	@effective_till		datetime

)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO countries
	(
		country_cd, country_nm, isd_code, gmt_diff, effective_from, effective_till
	)
	VALUES
	(
		@country_cd, @country_nm, @isd_code, @gmt_diff, @effective_from, @effective_till
	)
	SELECT @country_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateCountrie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateCountrie'
			)
	BEGIN
		DROP PROCEDURE  UpdateCountrie
	END
GO
CREATE PROCEDURE UpdateCountrie
(
	@country_id			country_id,
	@country_cd			varchar(5),
	@country_nm			varchar(55),
	@isd_code			varchar(10),
	@gmt_diff			numeric(4,2),
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime

)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    countries
	SET
		country_cd			=	@country_cd,
		country_nm			=	@country_nm,
		isd_code			=	@isd_code,
		gmt_diff			=	@gmt_diff,
		effective_from		=	@effective_from,
		effective_till		=	@effective_till
		
	WHERE  country_id = @country_id
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
--	Procedure	DeleteCountrie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteCountrie'
			)
	BEGIN
		DROP PROCEDURE  DeleteCountrie
	END
GO
CREATE PROCEDURE DeleteCountrie
(
	@country_id			country_id,
	@txn_ts				timestamp
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM countries
	WHERE country_id = @country_id
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
--	Procedure	QueryCountrie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryCountrie'
			)
	BEGIN
		DROP PROCEDURE  QueryCountrie
	END
GO
CREATE PROCEDURE QueryCountrie
(
	@country_id			country_id,
	@country_cd			varchar(5),
	@country_nm			varchar(55),
	@isd_code			varchar(10),
	@gmt_diff			numeric(4,2),
	@txn_ts				timestamp,
	@effective_from		datetime,
	@effective_till		datetime

)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		country_id, 
		country_cd, 
		country_nm, 
		isd_code, 
		gmt_diff, 
		txn_ts, 
		effective_from, 
		effective_till
		
	FROM countries
	
END
GO

-- =============================================================================
--	Procedure	ViewCountrie
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewCountrie' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewCountrie
	END
GO
CREATE VIEW ViewCountrie

WITH ENCRYPTION
AS

	SELECT
		country_id, 
		country_cd, 
		country_nm, 
		isd_code, 
		gmt_diff, 
		txn_ts, 
		effective_from, 
		effective_till
		
	FROM countries



GO
-- =============================================================================

-- vim:ts=4 sw=4 ht=4