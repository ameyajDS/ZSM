/* ==================================================================================
    Source File		:	upgrade_v5.42.sql.exclude
    Author(s)		:	Manish Saluja
    Started On		:	Tue Dec 18 18:11 IST 2011
    Last updated	:	Dec 26, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.42
			..... Added table satsang_centres_seeds and populate it for Mumbai and Nagpur with default values
			..... Table additionally_exported_sewadars added
			..... Table centres_tables_id_changes added
			Post-requisite -> source 37_setup_seeds.sql
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

EXEC DROPROLE 'ZSM', 'ZSM_CU';
EXEC CREATEROLE 'ZSM', 'ZSM_CU', 'CentreUser', 'DCC.ZOS.ZSM.exe';
EXEC sp_grantDBAccess 'ZSM_CU';

UPDATE packages
	SET	version_no = 5.42,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO

USE ZSM
GO

--	==================================================================================
--		Table satsang_centres_seeds
--	==================================================================================

CREATE	TABLE	satsang_centres_seeds
(
	satsang_centre_id	satsang_centre_id	NOT NULL		CONSTRAINT	SatsangCentresSeeds_FK_SatsangCentreID
																	REFERENCES	satsang_centres_details,
		--- Contains the name of the table
	object_id			VARCHAR (50)		NOT NULL,
	min_value			INTEGER				NOT NULL,
	max_value			INTEGER				NOT NULL,
	seed_value			INTEGER				NOT NULL,
	is_zone				Boolean				NOT NULL,

		CONSTRAINT	SatsangCentresSeeds_PK_SatsangCentreID_ObjectID
			PRIMARY KEY	NONCLUSTERED	(	satsang_centre_id, object_id	),

		CONSTRAINT	SatsangCentresSeeds_CK_MinValue_MaxValue
			CHECK	(	min_value	<=	max_value	),

		CONSTRAINT	SatsangCentresSeeds_CK_SeedValue_MinValue_MaxValue
			CHECK	(	seed_value	BETWEEN	min_value	AND	max_value	)
)
GO

EXEC 	sp_addextendedproperty
		'SatsangCentresSeeds_CK_MinValue_MaxValue', 'Minimum Seed Value should be smaller Maximum Seed Value',
		'USER',	'dbo', 'TABLE',	'satsang_centres_seeds'
GO

EXEC 	sp_addextendedproperty
		'SatsangCentresSeeds_CK_SeedValue_MinValue_MaxValue', 'Seed Value should be between Minimum and Maximum Seed Values',
		'USER',	'dbo', 'TABLE',	'satsang_centres_seeds'
GO


-- =============================================================================
--	Table	additionally_exported_sewadars
-- =============================================================================

CREATE	TABLE	additionally_exported_sewadars
(
	exported_to_centre_id 	satsang_centre_id	NOT NULL	CONSTRAINT	AdditionallyExported_FK_ExportedToCentreID
																REFERENCES	satsang_centres_details,

	sewadar_id				sewadar_id			NOT NULL	CONSTRAINT	AdditionallyExported_FK_SewadarID
																REFERENCES	sewadars,

	satsang_centre_id 		satsang_centre_id		NOT NULL,
	sewadar_grno			sewadar_grno			NOT NULL,
	
		CONSTRAINT	AdditionallyExported_PK_ExportedToCentreID_SewadarGRNo_SewaID
			PRIMARY KEY	NONCLUSTERED	(	exported_to_centre_id, sewadar_id	),

		CONSTRAINT	AdditionallyExported_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO


--	==================================================================================
--	Table	centres_tables_id_changes
-- =============================================================================
CREATE	TABLE	centres_tables_id_changes
(
	satsang_centre_id	satsang_centre_id	NOT NULL		CONSTRAINT	CentresTablesIdChanges_FK_SatsangCentreID
																	REFERENCES	satsang_centres_details,
		--- Contains the name of the table
	object_id			VARCHAR (50)		NOT NULL,
	changed_on			DATETIME			NOT NULL		CONSTRAINT	CentresTablesIdChanges_DF_ChangedOn
																	DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	imported_id			INTEGER				NOT NULL,
	exported_id			INTEGER				NOT NULL,

		CONSTRAINT	CentresTablesIdChanges_PK_SatsangCentreID_ObjectID_ImportedID
			PRIMARY KEY	NONCLUSTERED	(	satsang_centre_id, object_id, imported_id	),
		CONSTRAINT	CentresTablesIdChanges_UK_ObjectID_ExportedID
			UNIQUE	NONCLUSTERED		(	object_id, exported_id	)

)
GO

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
