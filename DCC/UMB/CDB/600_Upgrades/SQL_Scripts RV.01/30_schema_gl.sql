/* ==================================================================================
	Source File		:	schema.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sun Nov 23 16:15 2013
	Module ID		:	CDB
	Last updated	:	Jun 26, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		* It contains the schema for Geographical Locations (or Address Components at four levels).
		* Refer the following for completeness:
			+ Definition of countries table; this can also be seen in upgrade_rv_01.sql.
			+ Redmine Issues #978 (https://www.dccapps.org/pm/issues/978) and #945 (https://www.dccapps.org/pm/issues/945)
			  for preceding discussions/thoughts.
			+ Redmine Issue #999 (https://www.dccapps.org/pm/issues/999) for the Data-cleanup, which is also used.
		
		Common suffixes used:
			id	Identifier		--- used for System generated identifiers
			cd	Code			--- used for user defined codes
			nm	Name
			dt	Date
			ts	TimeStamp
		Recommendations for end-users for data inputs:
			*   Any piece of information (as far as possible, and unless stated otherwise)
				should be stored in mixed case and NOT in upper case. This stems from the
				fact that graphical outputs occupy lesser width for lower-case alphabets
				thereby permitting to print more amount of information in same width.
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
		26-Jun-2014 : JL
			* Table level_4_address_component dropped.
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- NOTE. Stores the four hierarchical address components below Country.
-- =============================================================================

CREATE	TABLE	level_1_address_components
(
	level_1_address_component_id	address_component_id	NOT NULL	IDENTITY (1, 1)
																		CONSTRAINT	Level1AddressComponents_PK_Level1AddressComponentID
																			PRIMARY KEY	NONCLUSTERED,
	level_1_address_component_cd	address_component_cd	NOT NULL,
	level_1_address_component_nm	address_component_nm	NOT NULL,

    country_id						country_id				NOT NULL	CONSTRAINT	Level1AddressComponents_FK_CountryID
																			REFERENCES	countries,

	is_authentic					BIT						NOT NULL	CONSTRAINT	Level1AddressComponents_DF_IsAuthentic
																			DEFAULT	0,
	txn_ts							TIMESTAMP				NOT NULL,

	effective_from					DATE					NOT NULL	CONSTRAINT 	Level1AddressComponents_DF_EffectiveFrom
																			DEFAULT Convert (VARCHAR (11), GetDate(), 106),

	effective_till					DATE					NOT NULL	CONSTRAINT	Level1AddressComponents_DF_EffectiveTill
																			DEFAULT '31-Dec-9999',

		CONSTRAINT	Level1AddressComponents_U1_CountryID_Level1AddressComponentCode
				UNIQUE	NONCLUSTERED	(	country_id, level_1_address_component_cd	),

		CONSTRAINT	Level1AddressComponents_U2_CountryID_Level1AddressComponentName
				UNIQUE	CLUSTERED	(	country_id, level_1_address_component_nm	),

		CONSTRAINT	Level1AddressComponents_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)
)

GO

-- =============================================================================

CREATE	TABLE	level_2_address_components
(
	level_2_address_component_id	address_component_id	NOT NULL	IDENTITY (1, 1)
																		CONSTRAINT	Level2AddressComponents_PK_Level2AddressComponentID
																			PRIMARY KEY	NONCLUSTERED,
	level_2_address_component_cd	address_component_cd	NOT NULL,
	level_2_address_component_nm	address_component_nm	NOT NULL,

	level_1_address_component_id	address_component_id	NOT NULL	CONSTRAINT	Level2AddressComponents_FK_Level1AddressComponentID
																			REFERENCES	level_1_address_components,

	seismic_zone					tinyint					NULL,		
	is_authentic					BIT						NOT NULL	CONSTRAINT	Level2AddressComponents_DF_IsAuthentic
																			DEFAULT	0,
	txn_ts							TIMESTAMP				NOT NULL,

	effective_from					DATE					NOT NULL	CONSTRAINT 	Level2AddressComponents_DF_EffectiveFrom
																			DEFAULT Convert (VARCHAR (11), GetDate(), 106),

	effective_till					DATE					NOT NULL	CONSTRAINT	Level2AddressComponents_DF_EffectiveTill
																			DEFAULT '31-Dec-9999',

		CONSTRAINT	Level2AddressComponents_U1_Level1AddressComponentID_Level2AddressComponentCode
				UNIQUE	NONCLUSTERED	(	level_1_address_component_id, level_2_address_component_cd	),

		CONSTRAINT	Level2AddressComponents_U2_Level1AddressComponentID_Level2AddressComponentName
				UNIQUE	CLUSTERED	(	level_1_address_component_id, level_2_address_component_nm	),

		CONSTRAINT	Level2AddressComponents_CK_EffectiveDates
				CHECK	(effective_from <= effective_till),

		CONSTRAINT Level2AddressComponents_CK_SeismicZone
				CHECK (seismic_zone is null or seismic_zone = 1 or seismic_zone=2 or seismic_zone=3 or seismic_zone=4 or seismic_zone=5)
)

GO

-- =============================================================================


CREATE	TABLE	level_3_address_components
(
	level_3_address_component_id	address_component_id	NOT NULL	IDENTITY (1, 1)
																		CONSTRAINT	Level3AddressComponents_PK_Level3AddressComponentID
																			PRIMARY KEY	NONCLUSTERED,
	level_3_address_component_cd	address_component_cd	NOT NULL,
	level_3_address_component_nm	address_component_big_nm	NOT NULL,

	level_2_address_component_id	address_component_id	NOT NULL	CONSTRAINT	Level3AddressComponents_FK_Level2AddressComponentID
																			REFERENCES	level_2_address_components,

	is_authentic					BIT						NOT NULL	CONSTRAINT	Level3AddressComponents_DF_IsAuthentic
																			DEFAULT	0,
	txn_ts							TIMESTAMP				NOT NULL,

	effective_from					DATE					NOT NULL	CONSTRAINT 	Level3AddressComponents_DF_EffectiveFrom
																			DEFAULT Convert (VARCHAR (11), GetDate(), 106),

	effective_till					DATE					NOT NULL	CONSTRAINT	Level3AddressComponents_DF_EffectiveTill
																			DEFAULT '31-Dec-9999',

		CONSTRAINT	Level3AddressComponents_U1_Level2AddressComponentID_Level3AddressComponentCode
				UNIQUE	NONCLUSTERED	(	level_2_address_component_id, level_3_address_component_cd	),

		CONSTRAINT	Level3AddressComponents_U2_Level2AddressComponentID_Level3AddressComponentName
				UNIQUE	CLUSTERED	(	level_2_address_component_id, level_3_address_component_nm	),

		CONSTRAINT	Level3AddressComponents_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)
)

GO

-- =============================================================================


/*
CREATE	TABLE	level_4_address_components
(
	level_4_address_component_id	address_component_id	NOT NULL	IDENTITY (1, 1)
																		CONSTRAINT	Level4AddressComponents_PK_Level4AddressComponentID
																			PRIMARY KEY	NONCLUSTERED,
	level_4_address_component_cd	address_component_cd	NOT NULL,
	level_4_address_component_nm	address_component_big_nm	NOT NULL,

	level_3_address_component_id	address_component_id	NOT NULL	CONSTRAINT	Level4AddressComponents_FK_Level3AddressComponentID
																			REFERENCES	level_3_address_components,

	is_authentic					BIT						NOT NULL	CONSTRAINT	Level4AddressComponents_DF_IsAuthentic
																			DEFAULT	0,
	txn_ts							TIMESTAMP				NOT NULL,

	effective_from					DATE					NOT NULL	CONSTRAINT 	Level4AddressComponents_DF_EffectiveFrom
																			DEFAULT Convert (VARCHAR (11), GetDate(), 106),

	effective_till					DATE					NOT NULL	CONSTRAINT	Level4AddressComponents_DF_EffectiveTill
																			DEFAULT '31-Dec-9999',

		CONSTRAINT	Level4AddressComponents_U1_Level3AddressComponentID_Level4AddressComponentCode
				UNIQUE	NONCLUSTERED	(	level_3_address_component_id, level_4_address_component_cd	),

		CONSTRAINT	Level4AddressComponents_U2_Level3AddressComponentID_Level4AddressComponentName
				UNIQUE	CLUSTERED	(	level_3_address_component_id, level_4_address_component_nm	),

		CONSTRAINT	Level4AddressComponents_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)
)

GO
*/

-- =============================================================================

-- vim:ts=4 sw=4 ht=4
