SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertGenericAttribute
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertGenericAttribute'
			)
	BEGIN
		DROP PROCEDURE  InsertGenericAttribute
	END
GO
CREATE PROCEDURE InsertGenericAttribute
(
	@attribute_id				attribute_id output,
	@attribute_nm				gnc_nm,
	@attribute_group			gnc_nm,
	@attribute_sq				display_order,
	@attribute_type				gnc_short_nm,
	@attribute_length			tinyint = NULL,
	@attribute_scale			tinyint = NULL,
	@is_temporal				Boolean,
	@is_mandatory				Boolean,
	@is_status_applicable		Boolean = NULL,
	@remarks					remarks = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO generic_attributes
	(
		attribute_nm, attribute_group, attribute_sq, attribute_type, attribute_length, attribute_scale, is_temporal, is_mandatory, is_status_applicable, remarks
	)
	VALUES
	(
		@attribute_nm, @attribute_group, @attribute_sq, @attribute_type, @attribute_length, @attribute_scale, @is_temporal, @is_mandatory, @is_status_applicable, @remarks
	)
	SELECT @attribute_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateGenericAttribute
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateGenericAttribute'
			)
	BEGIN
		DROP PROCEDURE  UpdateGenericAttribute
	END
GO
CREATE PROCEDURE UpdateGenericAttribute
(
	@attribute_id				attribute_id,
	@attribute_nm				gnc_nm,
	@attribute_group			gnc_nm,
	@attribute_sq				display_order,
	@attribute_type				gnc_short_nm,
	@attribute_length			tinyint,
	@attribute_scale			tinyint,
	@is_temporal				Boolean,
	@is_mandatory				Boolean,
	@is_status_applicable		Boolean,
	@remarks					remarks,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    generic_attributes
	SET
		attribute_nm				=	@attribute_nm,
		attribute_group				=	@attribute_group,
		attribute_sq				=	@attribute_sq,
		attribute_type				=	@attribute_type,
		attribute_length			=	@attribute_length,
		attribute_scale				=	@attribute_scale,
		is_temporal					=	@is_temporal,
		is_mandatory				=	@is_mandatory,
		is_status_applicable		=	@is_status_applicable,
		remarks						=	@remarks
	WHERE attribute_id = @attribute_id
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
--	Procedure	DeleteGenericAttribute
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteGenericAttribute'
			)
	BEGIN
		DROP PROCEDURE  DeleteGenericAttribute
	END
GO
CREATE PROCEDURE DeleteGenericAttribute
(
	@attribute_id				attribute_id,
	@attribute_nm				gnc_nm,
	@attribute_group			gnc_nm,
	@attribute_sq				display_order,
	@attribute_type				gnc_short_nm,
	@attribute_length			tinyint,
	@attribute_scale			tinyint,
	@is_temporal				Boolean,
	@is_mandatory				Boolean,
	@is_status_applicable		Boolean,
	@remarks					remarks,
	@txn_ts						timestamp
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM generic_attributes_list_values 
	WHERE attribute_id = @attribute_id
	
	DELETE FROM generic_attributes_status 
	WHERE attribute_id = @attribute_id
	
	DELETE FROM generic_attributes_satsang_centres 
	WHERE attribute_id = @attribute_id

	DELETE FROM generic_attributes
	WHERE attribute_id = @attribute_id
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
--	Procedure	ViewGenericAttribute
-- =============================================================================

IF EXISTS(SELECT * FROM sysobjects WHERE NAME = 'ViewGenericAttribute' AND TYPE='v')
BEGIN
	DROP VIEW ViewGenericAttribute
END
GO
CREATE VIEW ViewGenericAttribute  
AS 
	SELECT
		attribute_id, 
		attribute_nm, 
		attribute_group, 
		attribute_sq, 
		attribute_type, 
		attribute_length, 
		attribute_scale, 
		is_temporal, 
		is_mandatory, 
		is_status_applicable, 
		remarks, 
		txn_ts
	FROM generic_attributes
GO

-- =============================================================================

-- vim:ts=4 sw=4 ht=4
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertGenericAttributesListValue
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertGenericAttributesListValue'
			)
	BEGIN
		DROP PROCEDURE  InsertGenericAttributesListValue
	END
GO
CREATE PROCEDURE InsertGenericAttributesListValue
(
	@attribute_id			attribute_id,
	@attribute_value		attribute_value,
	@attribute_value_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO generic_attributes_list_values
	(
		attribute_id, attribute_value, attribute_value_sq
	)
	VALUES
	(
		@attribute_id, @attribute_value, @attribute_value_sq
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateGenericAttributesListValue
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateGenericAttributesListValue'
			)
	BEGIN
		DROP PROCEDURE  UpdateGenericAttributesListValue
	END
GO
CREATE PROCEDURE UpdateGenericAttributesListValue
(
	@attribute_id			attribute_id,
	@attribute_value		attribute_value,
	@old_attribute_value		attribute_value,
	@attribute_value_sq		display_order
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    generic_attributes_list_values
	SET		
		attribute_value			=	@attribute_value,
		attribute_value_sq		=	@attribute_value_sq
	WHERE attribute_id			=	@attribute_id
	AND	attribute_value			=	@old_attribute_value
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteGenericAttributesListValue
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteGenericAttributesListValue'
			)
	BEGIN
		DROP PROCEDURE  DeleteGenericAttributesListValue
	END
GO
CREATE PROCEDURE DeleteGenericAttributesListValue
(
	@attribute_id				attribute_id,
	@old_attribute_value		attribute_value	
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM generic_attributes_list_values
	WHERE attribute_id			=	@attribute_id
	AND	attribute_value			=	@old_attribute_value
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryGenericAttributesListValue
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryGenericAttributesListValue'
			)
	BEGIN
		DROP PROCEDURE  QueryGenericAttributesListValue
	END
GO
CREATE PROCEDURE QueryGenericAttributesListValue
(
	@attribute_id			attribute_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT		
		attribute_value, 
		attribute_value as old_attribute_value,
		attribute_value_sq
	FROM generic_attributes_list_values
	WHERE attribute_id			=	@attribute_id
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertGenericAttributesStatus
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertGenericAttributesStatus'
			)
	BEGIN
		DROP PROCEDURE  InsertGenericAttributesStatus
	END
GO
CREATE PROCEDURE InsertGenericAttributesStatus
(
	@attribute_id			attribute_id,
	@sewadar_status_cd		sewadar_status_cd
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO generic_attributes_status
	(
		attribute_id, sewadar_status_cd
	)
	VALUES
	(
		@attribute_id, @sewadar_status_cd
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateGenericAttributesStatus
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateGenericAttributesStatus'
			)
	BEGIN
		DROP PROCEDURE  UpdateGenericAttributesStatus
	END
GO
CREATE PROCEDURE UpdateGenericAttributesStatus
(
	@attribute_id			attribute_id,
	@sewadar_status_cd		sewadar_status_cd,
	@old_sewadar_status_cd		sewadar_status_cd
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    generic_attributes_status
	SET		
		sewadar_status_cd		=	@sewadar_status_cd
	WHERE attribute_id	= @attribute_id
	AND sewadar_status_cd  = @old_sewadar_status_cd
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteGenericAttributesStatus
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteGenericAttributesStatus'
			)
	BEGIN
		DROP PROCEDURE  DeleteGenericAttributesStatus
	END
GO
CREATE PROCEDURE DeleteGenericAttributesStatus
(
	@attribute_id			attribute_id,
	@old_sewadar_status_cd		sewadar_status_cd
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM generic_attributes_status
	WHERE attribute_id	= @attribute_id
	AND sewadar_status_cd  = @old_sewadar_status_cd
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryGenericAttributesStatus
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryGenericAttributesStatus'
			)
	BEGIN
		DROP PROCEDURE  QueryGenericAttributesStatus
	END
GO
CREATE PROCEDURE QueryGenericAttributesStatus
(
	@attribute_id			attribute_id
	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT		
		g.sewadar_status_cd,
		g.sewadar_status_cd as old_sewadar_status_cd,
		sewadar_status_nm
	FROM generic_attributes_status g
	JOIN sewadar_status s ON g.sewadar_status_cd = s.sewadar_status_cd
	WHERE attribute_id = @attribute_id
END
GO
-- =============================================================================



-- vim:ts=4 sw=4 ht=4
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertGenericAttributesSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertGenericAttributesSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  InsertGenericAttributesSatsangCentre
	END
GO
CREATE PROCEDURE InsertGenericAttributesSatsangCentre
(
	@attribute_id			attribute_id,
	@satsang_centre_id		satsang_centre_id,
	@effective_from			datetime,
	@effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO generic_attributes_satsang_centres
	(
		attribute_id, satsang_centre_id, effective_from, effective_till
	)
	VALUES
	(
		@attribute_id, @satsang_centre_id, @effective_from, @effective_till
	)
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	UpdateGenericAttributesSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateGenericAttributesSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  UpdateGenericAttributesSatsangCentre
	END
GO
CREATE PROCEDURE UpdateGenericAttributesSatsangCentre
(
	@attribute_id				attribute_id,
	@satsang_centre_id			satsang_centre_id,
	@old_satsang_centre_id		satsang_centre_id,
	@effective_from				datetime,
	@effective_till				datetime
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    generic_attributes_satsang_centres
	SET		
		satsang_centre_id		=	@satsang_centre_id,
		effective_from			=	@effective_from,
		effective_till			=	@effective_till
	WHERE attribute_id			=	@attribute_id 
	AND   satsang_centre_id		=	@old_satsang_centre_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	DeleteGenericAttributesSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='DeleteGenericAttributesSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  DeleteGenericAttributesSatsangCentre
	END
GO
CREATE PROCEDURE DeleteGenericAttributesSatsangCentre
(
	@attribute_id			attribute_id,
	@satsang_centre_id		satsang_centre_id,
	@old_satsang_centre_id		satsang_centre_id,
	@effective_from			datetime,
	@effective_till			datetime
)
WITH ENCRYPTION
AS
BEGIN
	DELETE FROM generic_attributes_satsang_centres
	WHERE attribute_id			=	@attribute_id 
	AND   satsang_centre_id		=	@old_satsang_centre_id
END
GO
-- =============================================================================


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryGenericAttributesSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryGenericAttributesSatsangCentre'
			)
	BEGIN
		DROP PROCEDURE  QueryGenericAttributesSatsangCentre
	END
GO
CREATE PROCEDURE QueryGenericAttributesSatsangCentre
(
	@attribute_id			attribute_id

)
WITH ENCRYPTION
AS
BEGIN
	SELECT		
		g.satsang_centre_id, 
		g.satsang_centre_id as old_satsang_centre_id,
		g.effective_from, 
		g.effective_till,
		centre_cd = COALESCE(scd.centre_cd, sc.satsang_centre_cd),		
		centre_nm = COALESCE(scd.centre_nm, sc.satsang_centre_nm)		
	FROM generic_attributes_satsang_centres g
	JOIN satsang_centres_details scd ON scd.satsang_centre_id = g.satsang_centre_id
	JOIN cdb..satsang_centres sc ON sc.satsang_centre_id = scd.satsang_centre_id
	WHERE attribute_id  = @attribute_id
	
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4

-- =============================================================================
--	Procedure	MakeGenericAttributesListValuesSqPositive
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='MakeGenericAttributesListValuesSqPositive'
			)
	BEGIN
		DROP PROCEDURE  MakeGenericAttributesListValuesSqPositive
	END
GO
CREATE PROCEDURE MakeGenericAttributesListValuesSqPositive
(
		@attribute_id			attribute_id
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    generic_attributes_list_values
	SET
		attribute_value_sq = -1*attribute_value_sq
	WHERE
		attribute_id  =	@attribute_id
		
	AND attribute_value_sq < 0
END
GO
-- =============================================================================
--	Procedure	UpdateGenericAttributesListValuesSq
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='UpdateGenericAttributesListValuesSq'
			)
	BEGIN
		DROP PROCEDURE  UpdateGenericAttributesListValuesSq
	END
GO
CREATE PROCEDURE UpdateGenericAttributesListValuesSq
(
	@attribute_id			attribute_id,	
	@attribute_value_sq		display_order	
)
WITH ENCRYPTION
AS
BEGIN
	UPDATE    generic_attributes_list_values
	SET
		attribute_value_sq		=	@attribute_value_sq
		
	WHERE attribute_id		=	@attribute_id
END
GO

-- =============================================================================
--	Function	IsGenericAttributeInUse
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'IsGenericAttributeInUse' AND xtype = 'FN')
	DROP FUNCTION IsGenericAttributeInUse
GO

CREATE	FUNCTION	IsGenericAttributeInUse
(
	@attribute_id		attribute_id
)
	RETURNS Boolean

WITH ENCRYPTION
AS
BEGIN
	DECLARE @count	INT,
			@in_use Boolean;
	SELECT @count = COUNT(*) FROM sewadars_attributes WHERE attribute_id = @attribute_id
	IF (@count > 0)
		SET @in_use = 'Yes'
	ELSE
		SET @in_use = 'No'
	return @in_use
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
