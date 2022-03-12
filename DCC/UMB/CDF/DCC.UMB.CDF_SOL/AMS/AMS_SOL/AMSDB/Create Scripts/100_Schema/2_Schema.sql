/* ==================================================================================
    Source File		:	2_Schema.sql
    Author(s)		:	JP
    Started On		:	07 Aug 2007
    Version		:	1.00
    Last updated	:	
    Module ID		:	AMS (Assets Management System)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
									 Revision History
    ----------------------------------------------------------------------------------
	
*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS OFF
GO

-- =============================================================================
-- Note:						Tables for Entities
-- =============================================================================

-- =============================================================================
-- 				centre_types
-- =============================================================================
CREATE	TABLE	centre_types(
    	centre_type		centre_type	NOT NULL	CONSTRAINT	PK_centre_types_centre_type
									PRIMARY KEY	CLUSTERED,
 	effective_from		DATETIME    	NOT NULL	Default	GetDate(),
    	effective_till		DATETIME    	NOT NULL	Default	'31-Dec-9999',
	
	CONSTRAINT	CK_centre_types_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO

-- =============================================================================
-- 				zones
-- =============================================================================
CREATE	TABLE	zones(
    	zone_id			zone_id		NOT NULL	IDENTITY (1,1)
							CONSTRAINT	PK_zones_zone_id
								PRIMARY KEY	NONCLUSTERED,
    	zone_nm			VARCHAR(15)	NOT NULL	CONSTRAINT	UK_zones_zone_nm
								UNIQUE		NONCLUSTERED,
 	effective_from		DATETIME    	NOT NULL	Default	GetDate(),
    	effective_till		DATETIME    	NOT NULL	Default	'31-Dec-9999',
	
	CONSTRAINT	CK_zones_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO

-- =============================================================================
-- 				satsang_centres
-- =============================================================================
CREATE	TABLE	satsang_centres(
    	satsang_centre_id	centre_id	NOT NULL	IDENTITY (1,1)
							CONSTRAINT	PK_satsang_centres_satsang_centre_id
								PRIMARY KEY	NONCLUSTERED,
	zone_id			zone_id		NOT NULL	CONSTRAINT	FK_satsang_centres_zone_id
									REFERENCES zones,
	centre_type		centre_type	NOT NULL	CONSTRAINT	FK_satsang_centres_centre_type
									REFERENCES	centre_types,
    	satsang_centre_nm	VARCHAR(25)	NOT NULL	CONSTRAINT	UK_satsang_centres_satsang_centre_nm
									UNIQUE		NONCLUSTERED,
 	effective_from		DATETIME    	NOT NULL	Default	GetDate(),
    	effective_till		DATETIME    	NOT NULL	Default	'31-Dec-9999',
	txn_ts			timestamp	NOT NULL,
	
	CONSTRAINT	CK_satsang_centres_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO

-- =============================================================================
-- 				asset_types
-- =============================================================================
CREATE	TABLE	asset_types(
    	asset_type_id		asset_type_id		NOT NULL	IDENTITY (1,1)
							CONSTRAINT	PK_asset_types_asset_type_id
								PRIMARY KEY	NONCLUSTERED,
    	asset_type_cd		VARCHAR(5)	NOT NULL	CONSTRAINT	UK_asset_types_asset_type_cd
								UNIQUE		NONCLUSTERED,
    	asset_type_nm		VARCHAR(40)	NOT NULL	CONSTRAINT	UK_asset_types_asset_type_nm
								UNIQUE		NONCLUSTERED,
 	effective_from		DATETIME    	NOT NULL	Default	GetDate(),
    	effective_till		DATETIME    	NOT NULL	Default	'31-Dec-9999',
	txn_ts			timestamp	NOT NULL,
	
	CONSTRAINT	CK_asset_types_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO

-- =============================================================================
-- 				items
-- =============================================================================
CREATE	TABLE	items	(
    	item_id		INTEGER		NOT NULL	IDENTITY (1,1)
							CONSTRAINT	PK_items_item_id
								PRIMARY KEY	NONCLUSTERED,
    	item_nm		VARCHAR(30)	NOT NULL	CONSTRAINT	UK_items_item_nm
								UNIQUE		NONCLUSTERED,
	asset_type_id	asset_type_id	NOT NULL	CONSTRAINT FK_items_asset_type_id
							REFERENCES asset_types,
 	effective_from	DATETIME    	NOT NULL	Default	GetDate(),
    	effective_till	DATETIME    	NOT NULL	Default	'31-Dec-9999',
	txn_ts		timestamp	NOT NULL,

	CONSTRAINT	CK_items_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO




-- =============================================================================
-- 				assets
-- =============================================================================
CREATE	TABLE	assets(
    	asset_id		INTEGER		NOT NULL	IDENTITY (1,1)
								CONSTRAINT	PK_assets_asset_id
								PRIMARY KEY	NONCLUSTERED,
	satsang_centre_id	centre_id	NOT NULL	CONSTRAINT	FK_assets_centre_id
								REFERENCES	satsang_centres,
	item_id			INTEGER		NOT NULL	CONSTRAINT	FK_assets_item_id
								REFERENCES	Items,
	make_model		VARCHAR(30)	NOT NULL,
	chasis_no		VARCHAR(20)	NULL,
	details			VARCHAR(30)	NULL,
	engine_no		VARCHAR(20)	NULL,
	quantity		INTEGER		NOT NULL,
	acquisition_dt		DATETIME	NULL,
	acquisition_cost	INTEGER		NULL,
	present_value		INTEGER		NULL,		
	valuation_dt		DATETIME	NULL,
	remarks			VARCHAR(400)	NULL,
	txn_ts			timestamp	NOT NULL,
	
	CONSTRAINT	UK_centre_asset_type_item_make_model
		UNIQUE		NONCLUSTERED (satsang_centre_id, item_id, make_model)
	
)
GO


