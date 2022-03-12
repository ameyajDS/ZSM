SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
--	View	ViewLevel3AddressComponent
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewLevel3AddressComponent' and TYPE='V'	
			)
	BEGIN
		DROP VIEW  ViewLevel3AddressComponent
	END
GO
CREATE VIEW ViewLevel3AddressComponent
AS
	SELECT 
		  l3.level_3_address_component_id
		, l3.level_3_address_component_cd
		, l3.level_3_address_component_nm
		, l2.level_2_address_component_id
		, l2.level_2_address_component_nm as level_2_address_component_id_display
		, l1.level_1_address_component_nm
		, c.country_nm
		, l3.is_authentic
		, l3.txn_ts
		, l3.effective_from
		, l3.effective_till
		, l3.post_office_id
	 FROM dbo.level_3_address_components l3
	 JOIN dbo.level_2_address_components l2 
			ON l3.level_2_address_component_id = l2.level_2_address_component_id
	 JOIN dbo.level_1_address_components l1 
			ON l2.level_1_address_component_id = l1.level_1_address_component_id
     JOIN dbo.countries c 
			ON l1.country_id = c.country_id
GO
-- =============================================================================