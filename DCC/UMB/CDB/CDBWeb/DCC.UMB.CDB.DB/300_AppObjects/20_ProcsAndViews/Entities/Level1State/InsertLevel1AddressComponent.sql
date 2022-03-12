SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertLevel1AddressComponent
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertLevel1AddressComponent'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertLevel1AddressComponent
	END
GO
CREATE PROCEDURE dbo.InsertLevel1AddressComponent
(
	@level_1_address_component_id		address_component_id output,
	@level_1_address_component_cd		address_component_cd,
	@level_1_address_component_nm		address_component_nm,
	@country_id							country_id,
	@is_authentic						bit,
	@effective_from						date,
	@effective_till						date,
	@state_id							int	 = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO level_1_address_components
	(
		level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic, effective_from, effective_till, state_id
	)
	VALUES
	(
		@level_1_address_component_cd, @level_1_address_component_nm, @country_id, @is_authentic, @effective_from, @effective_till, @state_id
	)
	SELECT @level_1_address_component_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================