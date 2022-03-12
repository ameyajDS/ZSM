SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertDistrictsOrCitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertDistrictsOrCitie'
			)
	BEGIN
		DROP PROCEDURE  InsertDistrictsOrCitie
	END
GO
CREATE PROCEDURE InsertDistrictsOrCitie
(
	@district_or_city_id		district_or_city_id output,
	@district_cd				varchar(5),
	@district_nm				varchar(55),
	@state_id					state_id,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO districts_or_cities
	(
		district_cd, district_nm, state_id, effective_from, effective_till
	)
	VALUES
	(
		@district_cd, @district_nm, @state_id, @effective_from, @effective_till
	)
	SELECT @district_or_city_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateDistrictsOrCitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateDistrictsOrCitie'
			)
	BEGIN
		DROP PROCEDURE  UpdateDistrictsOrCitie
	END
GO
CREATE PROCEDURE UpdateDistrictsOrCitie
(
	@district_or_city_id		district_or_city_id,
	@district_cd				varchar(5),
	@district_nm				varchar(55),
	@state_id					state_id,
	@txn_ts						timestamp,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    districts_or_cities
	SET
		district_cd				=	@district_cd,
		district_nm				=	@district_nm,
		state_id				=	@state_id,
		effective_from			=	@effective_from,
		effective_till			=	@effective_till
	WHERE district_or_city_id = @district_or_city_id
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
--	Procedure	DeleteDistrictsOrCitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteDistrictsOrCitie'
			)
	BEGIN
		DROP PROCEDURE  DeleteDistrictsOrCitie
	END
GO
CREATE PROCEDURE DeleteDistrictsOrCitie
(
	@district_or_city_id		district_or_city_id,
	@txn_ts						timestamp
	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM districts_or_cities
	WHERE district_or_city_id = @district_or_city_id
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
--	Procedure	QueryDistrictsOrCitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryDistrictsOrCitie'
			)
	BEGIN
		DROP PROCEDURE  QueryDistrictsOrCitie
	END
GO
CREATE PROCEDURE QueryDistrictsOrCitie
(
	@district_or_city_id		district_or_city_id,
	@district_cd				varchar(5),
	@district_nm				varchar(55),
	@state_id					state_id,
	@txn_ts						timestamp,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		district_or_city_id, 
		district_cd, 
		district_nm, 
		state_id, 
		txn_ts, 
		effective_from, 
		effective_till
	FROM districts_or_cities
	
END
GO
-- =============================================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	ViewDistrictsOrCitie
-- =============================================================================

IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewDistrictsOrCitie' and TYPE='v'
			)

	BEGIN
		DROP VIEW  ViewDistrictsOrCitie
	END
GO
CREATE VIEW ViewDistrictsOrCitie

WITH ENCRYPTION
AS

	SELECT
		district_or_city_id, 
		district_cd, 
		district_nm, 
		s.state_id, 
		s.state_nm,
		d.txn_ts, 
		d.effective_from, 
		d.effective_till,
		c.country_id,
		c.country_nm
	FROM districts_or_cities d
	JOIN states s ON s.state_id = d.state_id
    JOIN CDB..countries c ON c.country_id = s.country_id

GO

-- =============================================================================


-- vim:ts=4 sw=4 ht=4
