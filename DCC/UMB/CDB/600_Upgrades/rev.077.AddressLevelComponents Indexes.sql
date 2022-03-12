USE CDB
GO

-- =============================================================================

ALTER	TABLE	level_1_address_components
	DROP	CONSTRAINT	Level1AddressComponents_U1_CountryID_Level1AddressComponentCode
ALTER	TABLE	level_1_address_components
	DROP	CONSTRAINT	Level1AddressComponents_U2_CountryID_Level1AddressComponentName

ALTER	TABLE	level_1_address_components
	ADD	CONSTRAINT	Level1AddressComponents_U1_CountryID_Level1AddressComponentCode
				UNIQUE	CLUSTERED	(	country_id, level_1_address_component_cd	)

ALTER	TABLE	level_1_address_components
	ADD	CONSTRAINT	Level1AddressComponents_U2_Level1AddressComponentName_CountryID
				UNIQUE	NONCLUSTERED	(	level_1_address_component_nm, country_id	)

-- =============================================================================

ALTER	TABLE	level_2_address_components
	DROP	CONSTRAINT	Level2AddressComponents_U1_Level1AddressComponentID_Level2AddressComponentCode
ALTER	TABLE	level_2_address_components
	DROP	CONSTRAINT	Level2AddressComponents_U2_Level1AddressComponentID_Level2AddressComponentName

ALTER	TABLE	level_2_address_components
	ADD	CONSTRAINT	Level2AddressComponents_U1_Level1AddressComponentID_Level2AddressComponentCode
				UNIQUE	CLUSTERED	(	level_1_address_component_id, level_2_address_component_cd	)

ALTER	TABLE	level_2_address_components
	ADD	CONSTRAINT	Level2AddressComponents_U2_Level2AddressComponentName_Level1AddressComponentID
				UNIQUE	NONCLUSTERED	(	level_2_address_component_nm, level_1_address_component_id	)

-- =============================================================================

ALTER	TABLE	level_3_address_components
	DROP	CONSTRAINT	Level3AddressComponents_U1_Level2AddressComponentID_Level3AddressComponentCode
ALTER	TABLE	level_3_address_components
	DROP	CONSTRAINT	Level3AddressComponents_U2_Level2AddressComponentID_Level3AddressComponentName

ALTER	TABLE	level_3_address_components
	ADD	CONSTRAINT	Level3AddressComponents_U1_Level2AddressComponentID_Level3AddressComponentCode
				UNIQUE	CLUSTERED	(	level_2_address_component_id, level_3_address_component_cd	)
ALTER	TABLE	level_3_address_components
	ADD	CONSTRAINT	Level3AddressComponents_U2_Level3AddressComponentName_Level2AddressComponentID
				UNIQUE	NONCLUSTERED	(	level_3_address_component_nm, level_2_address_component_id	)

-- =============================================================================
