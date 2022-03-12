SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryLevel3AddressComponent
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryLevel3AddressComponent'
			)
	BEGIN
		DROP PROCEDURE  dbo.QueryLevel3AddressComponent
	END
GO
CREATE PROCEDURE dbo.QueryLevel3AddressComponent
(
	@level_3_address_component_id		address_component_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		level_3_address_component_id, 
		level_3_address_component_cd, 
		level_3_address_component_nm, 
		level_2_address_component_id, 
		is_authentic, 
		txn_ts, 
		effective_from, 
		effective_till, 
		post_office_id
	FROM level_3_address_components
	WHERE level_3_address_component_id = @level_3_address_component_id
END
GO
-- =============================================================================