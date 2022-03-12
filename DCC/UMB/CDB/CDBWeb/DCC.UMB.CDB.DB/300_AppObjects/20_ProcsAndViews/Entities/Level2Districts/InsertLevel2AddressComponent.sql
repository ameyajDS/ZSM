-- =============================================================================
--	Procedure	InsertLevel2AddressComponent
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertLevel2AddressComponent'
			)
	BEGIN
		DROP PROCEDURE  dbo.InsertLevel2AddressComponent
	END
GO
CREATE PROCEDURE dbo.InsertLevel2AddressComponent
(
	@level_2_address_component_id		address_component_id output,
	@level_2_address_component_cd		address_component_cd,
	@level_2_address_component_nm		address_component_nm,
	@level_1_address_component_id		address_component_id,
	@is_authentic						bit,
	@effective_from						date,
	@effective_till						date,
	@district_id						int	 = NULL
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO level_2_address_components
	(
		level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, district_id
	)
	VALUES
	(
		@level_2_address_component_cd, @level_2_address_component_nm, @level_1_address_component_id, @is_authentic, @effective_from, @effective_till, @district_id
	)
	SELECT @level_2_address_component_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================