
/* ==================================================================================
    	Source File		:	setup_palestinian_territories_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Palestinian_Territories are set-up
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
WHERE	country_nm	=	'Palestinian Territories';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Palestinian Territories not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'Governorate',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('West Bank'            ,	     'Bethlehem',	'WE',	'BL');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Deir Al-Balah',	'GZ',	'DB');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Gaza',	'GZ',	'GZ');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Gaza ash Shamaliyah',	'GZ',	'GS');
INSERT INTO @tbl VALUES ('West Bank'            ,	     'Hebron',	'WE',	'HE');
INSERT INTO @tbl VALUES ('West Bank'            ,	     'Jenin',	'WE',	'JN');
INSERT INTO @tbl VALUES ('West Bank'            ,	     'Jericho',	'WE',	'JC');
INSERT INTO @tbl VALUES ('West Bank'            ,	     'Jerusalem',	'WE',	'JS');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Khan Yunis',	'GZ',	'KY');
INSERT INTO @tbl VALUES ('West Bank'            ,	     'Nablus',	'WE',	'NA');
INSERT INTO @tbl VALUES ('West Bank'            ,	     'Qalqilya',	'WE',	'QA');
INSERT INTO @tbl VALUES ('Gaza'            ,	     'Rafah',	'GZ',	'RA');
INSERT INTO @tbl VALUES ('West Bank'            ,	     'Ramallah and Al-Bireh',	'WE',	'RB');
INSERT INTO @tbl VALUES ('West Bank'            ,	     'Salfit',	'WE',	'SA');
INSERT INTO @tbl VALUES ('West Bank'            ,	     'Tubas',	'WE',	'TB');
INSERT INTO @tbl VALUES ('West Bank'            ,	     'Tulkarm',	'WE',	'TL');

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

