SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertColour
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertColour'
			)
	BEGIN
		DROP PROCEDURE  InsertColour
	END
GO
CREATE PROCEDURE InsertColour
(
	@colour_id				colour_id ,
	@colour_nm				gnc_short_nm,
	@red_component			colour_component,
	@green_component		colour_component,
	@blue_component			colour_component,
	@remarks				remarks = NULL,
	@effective_from			datetime,
	@effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO colours
	(
		colour_id,colour_nm, red_component, green_component, blue_component, remarks, effective_from, effective_till
	)
	VALUES
	(
		@colour_id,@colour_nm, @red_component, @green_component, @blue_component, @remarks, @effective_from, @effective_till
	)
	SELECT @colour_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateColour
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateColour'
			)
	BEGIN
		DROP PROCEDURE  UpdateColour
	END
GO
CREATE PROCEDURE UpdateColour
(
	@colour_id				colour_id,
	@colour_nm				gnc_short_nm,
	@red_component			colour_component,
	@green_component		colour_component,
	@blue_component			colour_component,
	@remarks				remarks,
	@effective_from			datetime,
	@effective_till			datetime,
	@txn_ts					timestamp,
	@old_colour_id				colour_id
)
WITH ENCRYPTION
AS
BEGIN
	
	UPDATE    colours
	SET	
		colour_id			=   @colour_id,	
		colour_nm			=	@colour_nm,
		red_component		=	@red_component,
		green_component		=	@green_component,
		blue_component		=	@blue_component,
		remarks				=	@remarks,
		effective_from		=	@effective_from,
		effective_till		=	@effective_till
	WHERE colour_id			=	@old_colour_id
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
--	Procedure	DeleteColour
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteColour'
			)
	BEGIN
		DROP PROCEDURE  DeleteColour
	END
GO
CREATE PROCEDURE DeleteColour
(
	@old_colour_id				colour_id,
	@txn_ts					timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM colours
	WHERE colour_id			=	@old_colour_id
	AND txn_ts			=	@txn_ts
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
--	Procedure	ViewColour
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewColour' and TYPE='V'	
			)
	BEGIN
		DROP VIEW  ViewColour
	END
GO
CREATE VIEW ViewColour

WITH ENCRYPTION
AS

	SELECT
		colours.*,
		colour_id as old_colour_id
	FROM colours
	

GO

-- =============================================================================
--	Procedure	GetMaxColourId	
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='GetMaxColourId'
			)
	BEGIN
		DROP PROCEDURE  GetMaxColourId
	END
GO
CREATE PROCEDURE GetMaxColourId
(
	@colour_id				colour_id output
	
)
WITH ENCRYPTION
AS
BEGIN
	--DECLARE @colour_id_result int
	SELECT  @colour_id = (select  MAX(colour_id)+ 1  from colours )
	
END
GO
-- =============================================================================
