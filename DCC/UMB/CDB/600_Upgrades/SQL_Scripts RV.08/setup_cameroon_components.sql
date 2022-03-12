
/* ==================================================================================
    	Source File		:	setup_cameroon_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Cameroon are set-up
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
WHERE	country_nm	=	'Cameroon';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Cameroon not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Department',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Ouest'            ,	     'Bamboutos',	'OU',	'BA');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Benoue',	'NO',	'BE');
INSERT INTO @tbl VALUES ('Est'            ,	     'Boumba-et-Ngoko',	'ES',	'BN');
INSERT INTO @tbl VALUES ('Nord-Ouest'            ,	     'Boyo',	'NW',	'BO');
INSERT INTO @tbl VALUES ('Nord-Ouest'            ,	     'Bui',	'NW',	'BU');
INSERT INTO @tbl VALUES ('Extreme-Nord'            ,	     'Diamare',	'EN',	'DI');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Dja-et-Lobo',	'SU',	'DL');
INSERT INTO @tbl VALUES ('Adamaoua'            ,	     'Djerem',	'AD',	'DJ');
INSERT INTO @tbl VALUES ('Nord-Ouest'            ,	     'Donga-Mantung',	'NW',	'DM');
INSERT INTO @tbl VALUES ('Sud-Ouest'            ,	     'Fako',	'SW',	'FA');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Faro',	'NO',	'FA');
INSERT INTO @tbl VALUES ('Adamaoua'            ,	     'Faro-et-Deo',	'AD',	'FD');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Haute-Sanaga',	'CE',	'HS');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'Haut-Nkam',	'OU',	'HN');
INSERT INTO @tbl VALUES ('Est'            ,	     'Haut-Nyong',	'ES',	'HN');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'Hauts-Plateaux',	'OU',	'HP');
INSERT INTO @tbl VALUES ('Est'            ,	     'Kadey',	'ES',	'KA');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'Koung-Khi',	'OU',	'KK');
INSERT INTO @tbl VALUES ('Sud-Ouest'            ,	     'Koupe-Manengouba',	'SW',	'KM');
INSERT INTO @tbl VALUES ('Sud-Ouest'            ,	     'Lebialem',	'SW',	'LE');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Lekie',	'CE',	'LE');
INSERT INTO @tbl VALUES ('Extreme-Nord'            ,	     'Logone-et-Chari',	'EN',	'LC');
INSERT INTO @tbl VALUES ('Est'            ,	     'Lom-et-Djerem',	'ES',	'LD');
INSERT INTO @tbl VALUES ('Sud-Ouest'            ,	     'Manyu',	'SW',	'MN');
INSERT INTO @tbl VALUES ('Adamaoua'            ,	     'Mayo-Banyo',	'AD',	'MB');
INSERT INTO @tbl VALUES ('Extreme-Nord'            ,	     'Mayo-Danay',	'EN',	'MD');
INSERT INTO @tbl VALUES ('Extreme-Nord'            ,	     'Mayo-Kani',	'EN',	'KA');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Mayo-Louti',	'NO',	'ML');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Mayo-Rey',	'NO',	'MA');
INSERT INTO @tbl VALUES ('Extreme-Nord'            ,	     'Mayo-Sava',	'EN',	'MS');
INSERT INTO @tbl VALUES ('Extreme-Nord'            ,	     'Mayo-Tsanaga',	'EN',	'MT');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Mbam-et-Inoubou',	'CE',	'MI');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Mbam-et-Kim',	'CE',	'MK');
INSERT INTO @tbl VALUES ('Adamaoua'            ,	     'Mbere',	'AD',	'MR');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Mefou-et-Afamba',	'CE',	'MM');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Mefou-et-Akono',	'CE',	'MN');
INSERT INTO @tbl VALUES ('Sud-Ouest'            ,	     'Meme',	'SW',	'MM');
INSERT INTO @tbl VALUES ('Nord-Ouest'            ,	     'Menchum',	'NW',	'MC');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'Menoua',	'OU',	'ME');
INSERT INTO @tbl VALUES ('Nord-Ouest'            ,	     'Mezam',	'NW',	'ME');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Mfoundi',	'CE',	'MF');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'Mifi',	'OU',	'MF');
INSERT INTO @tbl VALUES ('Nord-Ouest'            ,	     'Momo',	'NW',	'MO');
INSERT INTO @tbl VALUES ('Littoral'            ,	     'Moungo',	'LT',	'MU');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Mvila',	'SU',	'MV');
INSERT INTO @tbl VALUES ('Sud-Ouest'            ,	     'Ndian',	'SW',	'ND');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'Nde',	'OU',	'ND');
INSERT INTO @tbl VALUES ('Nord-Ouest'            ,	     'Ngo-Ketunjia',	'NW',	'NK');
INSERT INTO @tbl VALUES ('Littoral'            ,	     'Nkam',	'LT',	'NK');
INSERT INTO @tbl VALUES ('Ouest'            ,	     'Noun',	'OU',	'NO');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Nyong-et-Kelle',	'CE',	'NK');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Nyong-et-Mfoumou',	'CE',	'NM');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Nyong-et-So''o',	'CE',	'NS');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Ocean',	'SU',	'OC');
INSERT INTO @tbl VALUES ('Littoral'            ,	     'Sanaga-Maritime',	'LT',	'SM');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Vallee-du-Ntem',	'SU',	'VN');
INSERT INTO @tbl VALUES ('Adamaoua'            ,	     'Vina',	'AD',	'VI');
INSERT INTO @tbl VALUES ('Littoral'            ,	     'Wouri',	'LT',	'WO');

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

