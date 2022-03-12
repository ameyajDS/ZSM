
/* ==================================================================================
    	Source File		:	setup_gambia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Gambia are set-up
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
WHERE	country_nm	=	'Gambia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Gambia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Banjul'            ,	     'Banjul',	'BJ',	'BJ');
INSERT INTO @tbl VALUES ('North Bank'            ,	     'Central Baddibu',	'NB',	'CB');
INSERT INTO @tbl VALUES ('West Coast'            ,	     'Foni Bintang-Karenai',	'WE',	'FO');
INSERT INTO @tbl VALUES ('West Coast'            ,	     'Foni Bondali',	'WE',	'FB');
INSERT INTO @tbl VALUES ('West Coast'            ,	     'Foni Brefet',	'WE',	'FF');
INSERT INTO @tbl VALUES ('West Coast'            ,	     'Foni Jarrol',	'WE',	'FJ');
INSERT INTO @tbl VALUES ('West Coast'            ,	     'Foni Kansala',	'WE',	'FK');
INSERT INTO @tbl VALUES ('Upper River'            ,	     'Fulladu East',	'UR',	'FE');
INSERT INTO @tbl VALUES ('Central River'            ,	     'Fulladu West',	'MC',	'FW');
INSERT INTO @tbl VALUES ('Central River'            ,	     'Janjanbureh',	'MC',	'JJ');
INSERT INTO @tbl VALUES ('Lower River'            ,	     'Jarra Central',	'LR',	'JC');
INSERT INTO @tbl VALUES ('Lower River'            ,	     'Jarra East',	'LR',	'JE');
INSERT INTO @tbl VALUES ('Lower River'            ,	     'Jarra West',	'LR',	'JW');
INSERT INTO @tbl VALUES ('North Bank'            ,	     'Jokadu',	'NB',	'JO');
INSERT INTO @tbl VALUES ('Banjul'            ,	     'Kanifing',	'BJ',	'KF');
INSERT INTO @tbl VALUES ('Upper River'            ,	     'Kantora',	'UR',	'KT');
INSERT INTO @tbl VALUES ('Lower River'            ,	     'Kiang Central',	'LR',	'KI');
INSERT INTO @tbl VALUES ('Lower River'            ,	     'Kiang East',	'LR',	'KG');
INSERT INTO @tbl VALUES ('Lower River'            ,	     'Kiang West',	'LR',	'KW');
INSERT INTO @tbl VALUES ('West Coast'            ,	     'Kombo Central',	'WE',	'KC');
INSERT INTO @tbl VALUES ('West Coast'            ,	     'Kombo East',	'WE',	'KE');
INSERT INTO @tbl VALUES ('West Coast'            ,	     'Kombo North/Saint Mary',	'WE',	'KN');
INSERT INTO @tbl VALUES ('West Coast'            ,	     'Kombo South',	'WE',	'KS');
INSERT INTO @tbl VALUES ('North Bank'            ,	     'Lower Baddibu',	'NB',	'LB');
INSERT INTO @tbl VALUES ('North Bank'            ,	     'Lower Niumi',	'NB',	'LN');
INSERT INTO @tbl VALUES ('Central River'            ,	     'Lower Saloum',	'MC',	'LS');
INSERT INTO @tbl VALUES ('Central River'            ,	     'Niamina Dankunku',	'MC',	'ND');
INSERT INTO @tbl VALUES ('Central River'            ,	     'Niamina East',	'MC',	'NE');
INSERT INTO @tbl VALUES ('Central River'            ,	     'Niamina West',	'MC',	'NW');
INSERT INTO @tbl VALUES ('Central River'            ,	     'Niani',	'MC',	'NI');
INSERT INTO @tbl VALUES ('Central River'            ,	     'Nianija',	'MC',	'NJ');
INSERT INTO @tbl VALUES ('Central River'            ,	     'Sami',	'MC',	'SM');
INSERT INTO @tbl VALUES ('Upper River'            ,	     'Sandu',	'UR',	'SN');
INSERT INTO @tbl VALUES ('North Bank'            ,	     'Upper Baddibu',	'NB',	'UB');
INSERT INTO @tbl VALUES ('North Bank'            ,	     'Upper Niumi',	'NB',	'UN');
INSERT INTO @tbl VALUES ('Central River'            ,	     'Upper Saloum',	'MC',	'US');
INSERT INTO @tbl VALUES ('Upper River'            ,	     'Wuli',	'UR',	'WU');

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

