/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	May 12 16:15 IST 2015
    Last updated	:	Jun 26, 2014
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script for upgrading CDB to Revision.10
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------
		12-May-2015 : JL : Initial Version
			* FRRO Country Name column added in countries table.
			* Table for Alternate Address Component Names is added.
   ==================================================================================*/

-- =============================================================================

ALTER	TABLE	countries
	ADD	frro_country_nm		VARCHAR (100)		NULL
GO

-- =============================================================================

CREATE	TABLE	alternate_address_component_names
(
	alternate_address_component_id	address_component_id	NOT NULL	IDENTITY (1, 1)
																		CONSTRAINT	AlternateAddressComponentNames_PK_Level1AddressComponentID
																			PRIMARY KEY	NONCLUSTERED,

    country_id						country_id					NULL	CONSTRAINT	AlternateAddressComponentNames_FK_CountryID
																			REFERENCES	countries,
	level_1_address_component_id	address_component_id		NULL	CONSTRAINT	AlternateAddressComponentNames_FK_Level1AddressComponentID
																			REFERENCES	level_1_address_components,
	level_2_address_component_id	address_component_id		NULL	CONSTRAINT	AlternateAddressComponentNames_FK_Level2AddressComponentID
																			REFERENCES	level_2_address_components,
	level_3_address_component_id	address_component_id		NULL	CONSTRAINT	AlternateAddressComponentNames_FK_Level3AddressComponentID
																			REFERENCES	level_3_address_components,

	alternate_address_component_nm	NVARCHAR (200)			NOT NULL,

	alternate_address_component_sq	SMALLINT					NULL,

	txn_ts							TIMESTAMP				NOT NULL,

		CONSTRAINT	AlternateAddressComponentNames_UK_CountryID_Level1AddrCmpID_Level2AddrCmpID_Level3AddrCmpID_AlternateAddrCmpName
			UNIQUE	CLUSTERED	(	country_id, level_1_address_component_id, level_2_address_component_id, level_3_address_component_id, alternate_address_component_nm	),

		CONSTRAINT	AlternateAddressComponentNames_CK_CountryID_Level1AddressComponentID_Level2AddressComponentID_Level3AddressComponentID
			CHECK	(	(	country_id	IS	NOT	NULL	AND	level_1_address_component_id	IS		NULL	AND	level_2_address_component_id	IS		NULL	AND	level_3_address_component_id	IS		NULL	)
					OR	(	country_id	IS		NULL	AND	level_1_address_component_id	IS	NOT	NULL	AND	level_2_address_component_id	IS		NULL	AND	level_3_address_component_id	IS		NULL	)
					OR	(	country_id	IS		NULL	AND	level_1_address_component_id	IS		NULL	AND	level_2_address_component_id	IS	NOT	NULL	AND	level_3_address_component_id	IS		NULL	)
					OR	(	country_id	IS		NULL	AND	level_1_address_component_id	IS		NULL	AND	level_2_address_component_id	IS		NULL	AND	level_3_address_component_id	IS	NOT	NULL	)
					)
)

GO

-- =============================================================================

-- vim:ts=4 sw=4 ht=4
