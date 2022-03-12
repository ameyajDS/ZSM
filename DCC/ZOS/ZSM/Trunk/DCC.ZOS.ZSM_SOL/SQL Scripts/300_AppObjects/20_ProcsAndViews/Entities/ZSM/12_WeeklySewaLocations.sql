SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertWeeklySewaLocation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertWeeklySewaLocation'
			)
	BEGIN
		DROP PROCEDURE  InsertWeeklySewaLocation
	END
GO
CREATE PROCEDURE InsertWeeklySewaLocation
(
	@weekly_sewa_location_id		weekly_sewa_location_id output,
	@weekly_sewa_location_nm		gnc_nm,
	@satsang_centre_id				satsang_centre_id = NULL,
	@remarks						remarks = NULL,
	@effective_from					datetime,
	@effective_till					datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO weekly_sewa_locations
	(
		weekly_sewa_location_nm, satsang_centre_id, remarks, effective_from, effective_till
	)
	VALUES
	(
		@weekly_sewa_location_nm, @satsang_centre_id, @remarks, @effective_from, @effective_till
	)
	SELECT @weekly_sewa_location_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateWeeklySewaLocation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateWeeklySewaLocation'
			)
	BEGIN
		DROP PROCEDURE  UpdateWeeklySewaLocation
	END
GO
CREATE PROCEDURE UpdateWeeklySewaLocation
(
	@weekly_sewa_location_id		weekly_sewa_location_id,
	@weekly_sewa_location_nm		gnc_nm,
	@satsang_centre_id				satsang_centre_id,
	@remarks						remarks,
	@effective_from					datetime,
	@effective_till					datetime,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    weekly_sewa_locations
	SET
		weekly_sewa_location_nm		=	@weekly_sewa_location_nm,
		satsang_centre_id			=	@satsang_centre_id,
		remarks						=	@remarks,
		effective_from				=	@effective_from,
		effective_till				=	@effective_till
	WHERE 
	 weekly_sewa_location_id = @weekly_sewa_location_id
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
--	Procedure	DeleteWeeklySewaLocation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteWeeklySewaLocation'
			)
	BEGIN
		DROP PROCEDURE  DeleteWeeklySewaLocation
	END
GO
CREATE PROCEDURE DeleteWeeklySewaLocation
(
	@weekly_sewa_location_id		weekly_sewa_location_id,	
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM weekly_sewa_locations
	WHERE 
	 weekly_sewa_location_id = @weekly_sewa_location_id
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
--	Procedure	QueryWeeklySewaLocation
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryWeeklySewaLocation'
			)
	BEGIN
		DROP PROCEDURE  QueryWeeklySewaLocation
	END
GO
CREATE PROCEDURE QueryWeeklySewaLocation
(
	@weekly_sewa_location_id		weekly_sewa_location_id,
	@weekly_sewa_location_nm		gnc_nm,
	@satsang_centre_id				satsang_centre_id,
	@remarks						remarks,
	@effective_from					datetime,
	@effective_till					datetime,
	@txn_ts							timestamp
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		weekly_sewa_location_id, 
		weekly_sewa_location_nm, 
		satsang_centre_id, 
		remarks, 
		effective_from, 
		effective_till, 
		txn_ts
	FROM weekly_sewa_locations
	WHERE (1 = 2) --ADD YOUR WHERE CLAUSE
END
GO
-- =============================================================================
---- select * from weekly_sewa_locations

-- =============================================================================
--	Procedure	ViewWeeklySewaLocation
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewWeeklySewaLocation' and TYPE='v'
			)

	BEGIN
		DROP VIEW ViewWeeklySewaLocation
	END
GO
CREATE VIEW ViewWeeklySewaLocation

WITH ENCRYPTION
AS
	SELECT
		wsl.satsang_centre_id, 
		wsl.weekly_sewa_location_id,
		wsl.weekly_sewa_location_nm,
		wsl.remarks,
		wsl.effective_from,
		wsl.effective_till,
		wsl.txn_ts
	FROM weekly_sewa_locations	wsl
GO
-- =============================================================================

-- vim:ts=4 sw=4 ht=4