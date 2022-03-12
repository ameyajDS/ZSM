SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertPostOfficesOrCitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertPostOfficesOrCitie'
			)
	BEGIN
		DROP PROCEDURE  InsertPostOfficesOrCitie
	END
GO
CREATE PROCEDURE InsertPostOfficesOrCitie
(
	@post_office_or_city_id		post_office_or_city_id output,
	@district_id				district_id,
	@post_office_or_city_cd		varchar(10),
	@post_office_or_city_nm		gnc_nm,
	@std_code					varchar(10) = NULL,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO post_offices_or_cities
	(
		district_id, post_office_or_city_cd, post_office_or_city_nm, std_code, effective_from, effective_till
	)
	VALUES
	(
		@district_id, @post_office_or_city_cd, @post_office_or_city_nm, @std_code, @effective_from, @effective_till
	)
	SELECT @post_office_or_city_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdatePostOfficesOrCitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdatePostOfficesOrCitie'
			)
	BEGIN
		DROP PROCEDURE  UpdatePostOfficesOrCitie
	END
GO
CREATE PROCEDURE UpdatePostOfficesOrCitie
(
	@post_office_or_city_id		post_office_or_city_id,
	@district_id				district_id,
	@post_office_or_city_cd		varchar(10),
	@post_office_or_city_nm		gnc_nm,
	@std_code					varchar(10),
	@effective_from				datetime,
	@effective_till				datetime,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    post_offices_or_cities
	SET
		district_id					=	@district_id,
		post_office_or_city_cd		=	@post_office_or_city_cd,
		post_office_or_city_nm		=	@post_office_or_city_nm,
		std_code					=	@std_code,
		effective_from				=	@effective_from,
		effective_till				=	@effective_till
	WHERE post_office_or_city_id = @post_office_or_city_id
	AND txn_ts					=	@txn_ts
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
--	Procedure	DeletePostOfficesOrCitie
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeletePostOfficesOrCitie'
			)
	BEGIN
		DROP PROCEDURE  DeletePostOfficesOrCitie
	END
GO
CREATE PROCEDURE DeletePostOfficesOrCitie
(
	@post_office_or_city_id		post_office_or_city_id,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM post_offices_or_cities
	WHERE post_office_or_city_id = @post_office_or_city_id
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
--	Procedure	ViewPostOfficesOrCitie
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewPostOfficesOrCitie' and TYPE='v'				
			)
	BEGIN
		DROP VIEW  ViewPostOfficesOrCitie
	END
GO
CREATE VIEW ViewPostOfficesOrCitie

WITH ENCRYPTION
AS
	SELECT
		post_office_or_city_id, 
		d.district_or_city_id, 
		post_office_or_city_cd, 
		post_office_or_city_nm, 
		std_code, 
		p.effective_from, 
		p.effective_till, 
		p.txn_ts,		
		d.district_nm, 
		s.state_id, 
		s.state_nm,
		c.country_id,
		c.country_nm
				
	FROM post_offices_or_cities p
	JOIN CDB..districts_or_cities d ON d.district_or_city_id = p.district_id
	JOIN CDB..states s ON s.state_id = d.state_id
	JOIN CDB..countries c ON c.country_id = s.country_id

	
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4
