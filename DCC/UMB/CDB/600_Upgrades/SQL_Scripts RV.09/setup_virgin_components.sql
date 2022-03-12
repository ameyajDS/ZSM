
/* ==================================================================================
    	Source File		:	setup_virgin_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Virgin are set-up
	==================================================================================
		Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- ======================================================================

DECLARE
	@country_id		INT;

-- ======================================================================
SELECT	@country_id	=	country_id
FROM	countries
WHERE	country_nm	=	'Virgin Islands, U.S.';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Virgin not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'Subdistrict',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Saint Croix'            ,	     'Anna''s Hope Village',	'SC',	'AH');
INSERT INTO @tbl VALUES ('Saint John'            ,	     'Central',	'SJ',	'CE');
INSERT INTO @tbl VALUES ('Saint Thomas'            ,	     'Charlotte Amalie',	'ST',	'CA');
INSERT INTO @tbl VALUES ('Saint Croix'            ,	     'Christiansted',	'SC',	'CH');
INSERT INTO @tbl VALUES ('Saint John'            ,	     'Coral Bay',	'SJ',	'CB');
INSERT INTO @tbl VALUES ('Saint John'            ,	     'Cruz Bay',	'SJ',	'CZ');
INSERT INTO @tbl VALUES ('Saint Croix'            ,	     'East End',	'SC',	'EE');
INSERT INTO @tbl VALUES ('Saint John'            ,	     'East End',	'SJ',	'EE');
INSERT INTO @tbl VALUES ('Saint Thomas'            ,	     'East End',	'ST',	'EE');
INSERT INTO @tbl VALUES ('Saint Croix'            ,	     'Frederiksted',	'SC',	'FR');
INSERT INTO @tbl VALUES ('Saint Croix'            ,	     'Northcentral',	'SC',	'NC');
INSERT INTO @tbl VALUES ('Saint Thomas'            ,	     'Northside',	'ST',	'NS');
INSERT INTO @tbl VALUES ('Saint Croix'            ,	     'Northwest',	'SC',	'NW');
INSERT INTO @tbl VALUES ('Saint Croix'            ,	     'Sion Farm',	'SC',	'SF');
INSERT INTO @tbl VALUES ('Saint Croix'            ,	     'Southcentral',	'SC',	'SC');
INSERT INTO @tbl VALUES ('Saint Thomas'            ,	     'Southside',	'ST',	'SS');
INSERT INTO @tbl VALUES ('Saint Croix'            ,	     'Southwest',	'SC',	'SW');
INSERT INTO @tbl VALUES ('Saint Thomas'            ,	     'Tutu',	'ST',	'TU');
INSERT INTO @tbl VALUES ('Saint Thomas'            ,	     'Water Island',	'ST',	'WI');
INSERT INTO @tbl VALUES ('Saint Thomas'            ,	     'West End',	'ST',	'WE');

SET NOCOUNT OFF

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	DISTINCT @country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================


INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl	t
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.level_1_address_component_nm	=	t.level_1_nm
				AND	l1.country_id					=	@country_id
				)

-- ======================================================================

UPDATE	l2
	SET	is_authentic	=	1
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================

