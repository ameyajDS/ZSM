SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryLevel2AddressComponent
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryLevel2AddressComponent'
			)
	BEGIN
		DROP PROCEDURE  dbo.QueryLevel2AddressComponent
	END
GO
CREATE PROCEDURE dbo.QueryLevel2AddressComponent
(
	@level_2_address_component_id		address_component_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		level_2_address_component_id, 
		level_2_address_component_cd, 
		level_2_address_component_nm, 
		level_1_address_component_id, 
		is_authentic, 
		txn_ts, 
		effective_from, 
		effective_till, 
		district_id
	FROM level_2_address_components
	WHERE level_2_address_component_id = @level_2_address_component_id
END
GO
-- =============================================================================