SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
--	View	ViewLevel2AddressComponent
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewLevel2AddressComponent' and TYPE='V'	
			)
	BEGIN
		DROP VIEW  ViewLevel2AddressComponent
	END
GO
CREATE VIEW ViewLevel2AddressComponent
AS
	SELECT 
		   l2.level_2_address_component_id
		 , l2.level_2_address_component_cd
		 , l2.level_2_address_component_nm
		 , l1.level_1_address_component_id
		 , l1.level_1_address_component_nm as level_1_address_component_id_display
		 , c.country_nm
		 , l2.is_authentic
		 , l2.txn_ts
		 , l2.effective_from
		 , l2.effective_till
		 , l2.district_id
	 FROM dbo.level_2_address_components l2
	 JOIN dbo.level_1_address_components l1 
			ON l2.level_1_address_component_id = l1.level_1_address_component_id
     JOIN dbo.countries c ON l1.country_id = c.country_id
GO
-- =============================================================================