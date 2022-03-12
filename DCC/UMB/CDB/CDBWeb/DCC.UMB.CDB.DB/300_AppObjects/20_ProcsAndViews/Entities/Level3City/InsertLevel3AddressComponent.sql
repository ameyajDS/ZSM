SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertLevel3AddressComponent
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertLevel3AddressComponent'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertLevel3AddressComponent
	END
GO
CREATE PROCEDURE dbo.InsertLevel3AddressComponent
(
	@level_3_address_component_id		address_component_id output,
	@level_3_address_component_cd		address_component_cd,
	@level_3_address_component_nm		address_component_big_nm,
	@level_2_address_component_id		address_component_id,
	@is_authentic						bit,
	@effective_from						date,
	@effective_till						date,
	@post_office_id						int	 = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO level_3_address_components
	(
		level_3_address_component_cd, level_3_address_component_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, post_office_id
	)
	VALUES
	(
		@level_3_address_component_cd, @level_3_address_component_nm, @level_2_address_component_id, @is_authentic, @effective_from, @effective_till, @post_office_id
	)
	SELECT @level_3_address_component_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================