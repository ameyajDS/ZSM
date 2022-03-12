SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryLevel1AddressComponent
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryLevel1AddressComponent'
			)
	BEGIN
		DROP PROCEDURE  dbo.QueryLevel1AddressComponent
	END
GO
CREATE PROCEDURE dbo.QueryLevel1AddressComponent
(
	@level_1_address_component_id		address_component_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		level_1_address_component_id, 
		level_1_address_component_cd, 
		level_1_address_component_nm, 
		country_id, 
		is_authentic, 
		txn_ts, 
		effective_from, 
		effective_till, 
		state_id
	FROM level_1_address_components
	WHERE level_1_address_component_id = @level_1_address_component_id
END
GO
-- =============================================================================