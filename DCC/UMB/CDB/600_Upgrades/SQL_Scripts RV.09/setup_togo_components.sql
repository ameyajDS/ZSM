
/* ==================================================================================
    	Source File		:	setup_togo_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Togo are set-up
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
WHERE	country_nm	=	'Togo';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Togo not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Prefecture',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Agou',	'PL',	'AG');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Akebou',	'PL',	'AK');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Amou',	'PL',	'AM');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Anie',	'PL',	'AN');
INSERT INTO @tbl VALUES ('Kara'            ,	     'Assoli',	'KA',	'AS');
INSERT INTO @tbl VALUES ('Maritime'            ,	     'Ave',	'MA',	'AV');
INSERT INTO @tbl VALUES ('Maritime'            ,	     'Bas-Mono',	'MA',	'BM');
INSERT INTO @tbl VALUES ('Kara'            ,	     'Bassar',	'KA',	'BA');
INSERT INTO @tbl VALUES ('Kara'            ,	     'Binah',	'KA',	'BI');
INSERT INTO @tbl VALUES ('Centrale'            ,	     'Blitta',	'CE',	'BL');
INSERT INTO @tbl VALUES ('Savanes'            ,	     'Cinkasse',	'SA',	'CI');
INSERT INTO @tbl VALUES ('Kara'            ,	     'Dankpen',	'KA',	'DP');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Danyi',	'PL',	'DY');
INSERT INTO @tbl VALUES ('Kara'            ,	     'Doufelgou',	'KA',	'DO');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Est-Mono',	'PL',	'ES');
INSERT INTO @tbl VALUES ('Maritime'            ,	     'Golfe',	'MA',	'GF');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Haho',	'PL',	'HA');
INSERT INTO @tbl VALUES ('Kara'            ,	     'Keran',	'KA',	'KE');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Kloto',	'PL',	'KT');
INSERT INTO @tbl VALUES ('Kara'            ,	     'Kozah',	'KA',	'KO');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Kpele',	'PL',	'KP');
INSERT INTO @tbl VALUES ('Savanes'            ,	     'Kpendjal',	'SA',	'KP');
INSERT INTO @tbl VALUES ('Maritime'            ,	     'Lacs',	'MA',	'LC');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Moyen-Mono',	'PL',	'MO');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Ogou',	'PL',	'OU');
INSERT INTO @tbl VALUES ('Savanes'            ,	     'Oti',	'SA',	'OT');
INSERT INTO @tbl VALUES ('Centrale'            ,	     'Sotouboua',	'CE',	'SO');
INSERT INTO @tbl VALUES ('Savanes'            ,	     'Tandjouare',	'SA',	'TA');
INSERT INTO @tbl VALUES ('Centrale'            ,	     'Tchamba',	'CE',	'TB');
INSERT INTO @tbl VALUES ('Centrale'            ,	     'Tchaoudjo',	'CE',	'TD');
INSERT INTO @tbl VALUES ('Savanes'            ,	     'Tone',	'SA',	'TN');
INSERT INTO @tbl VALUES ('Maritime'            ,	     'Vo',	'MA',	'VO');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Wawa',	'PL',	'WW');
INSERT INTO @tbl VALUES ('Maritime'            ,	     'Yoto',	'MA',	'YO');
INSERT INTO @tbl VALUES ('Maritime'            ,	     'Zio',	'MA',	'ZI');

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

