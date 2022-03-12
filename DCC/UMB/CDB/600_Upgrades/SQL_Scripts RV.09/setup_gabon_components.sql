
/* ==================================================================================
    	Source File		:	setup_gabon_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Gabon are set-up
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
WHERE	country_nm	=	'Gabon';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Gabon not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Department',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Moyen-Ogooue'            ,	     'Abanga-Bigne',	'MO',	'AB');
INSERT INTO @tbl VALUES ('Nyanga'            ,	     'Basse-Banio',	'NY',	'BB');
INSERT INTO @tbl VALUES ('Haut-Ogooue'            ,	     'Bayi-Brikolo',	'HO',	'BY');
INSERT INTO @tbl VALUES ('Ogooue-Maritime'            ,	     'Bendje',	'OM',	'BD');
INSERT INTO @tbl VALUES ('Ngounie'            ,	     'Boumi-Louetsi',	'NG',	'BM');
INSERT INTO @tbl VALUES ('Haut-Ogooue'            ,	     'Djoue',	'HO',	'DJ');
INSERT INTO @tbl VALUES ('Haut-Ogooue'            ,	     'Djouori-Agnili',	'HO',	'DA');
INSERT INTO @tbl VALUES ('Ngounie'            ,	     'Dola',	'NG',	'DL');
INSERT INTO @tbl VALUES ('Nyanga'            ,	     'Douigny',	'NY',	'DG');
INSERT INTO @tbl VALUES ('Nyanga'            ,	     'Doutsila',	'NY',	'DT');
INSERT INTO @tbl VALUES ('Ngounie'            ,	     'Douya-Onoye',	'NG',	'DY');
INSERT INTO @tbl VALUES ('Ogooue-Maritime'            ,	     'Etimboue',	'OM',	'ET');
INSERT INTO @tbl VALUES ('Woleu-Ntem'            ,	     'Haut-Komo',	'WN',	'HK');
INSERT INTO @tbl VALUES ('Woleu-Ntem'            ,	     'Haut-Ntem',	'WN',	'HN');
INSERT INTO @tbl VALUES ('Nyanga'            ,	     'Haute-Banio',	'NY',	'HB');
INSERT INTO @tbl VALUES ('Ogooue-Ivindo'            ,	     'Ivindo',	'OI',	'IV');
INSERT INTO @tbl VALUES ('Estuaire'            ,	     'Komo',	'ES',	'KO');
INSERT INTO @tbl VALUES ('Estuaire'            ,	     'Komo-Mondah',	'ES',	'KM');
INSERT INTO @tbl VALUES ('Haut-Ogooue'            ,	     'Lebombi-Leyou',	'HO',	'LL');
INSERT INTO @tbl VALUES ('Haut-Ogooue'            ,	     'Lekabi-Lewolo',	'HO',	'LV');
INSERT INTO @tbl VALUES ('Haut-Ogooue'            ,	     'Lekoko',	'HO',	'LE');
INSERT INTO @tbl VALUES ('Haut-Ogooue'            ,	     'Lekoni-Lekori',	'HO',	'LN');
INSERT INTO @tbl VALUES ('Estuaire'            ,	     'Libreville',	'ES',	'LV');
INSERT INTO @tbl VALUES ('Ogooue-Lolo'            ,	     'Lolo-Bouenguidi',	'OL',	'LG');
INSERT INTO @tbl VALUES ('Ogooue-Lolo'            ,	     'Lombo-Bouenguidi',	'OL',	'LB');
INSERT INTO @tbl VALUES ('Ogooue-Ivindo'            ,	     'Lope',	'OI',	'LP');
INSERT INTO @tbl VALUES ('Ngounie'            ,	     'Louetsi-Bibaka',	'NG',	'LI');
INSERT INTO @tbl VALUES ('Ngounie'            ,	     'Louetsi-Wano',	'NG',	'LW');
INSERT INTO @tbl VALUES ('Nyanga'            ,	     'Mongo',	'NY',	'MN');
INSERT INTO @tbl VALUES ('Ngounie'            ,	     'Mougalaba',	'NG',	'MB');
INSERT INTO @tbl VALUES ('Nyanga'            ,	     'Mougoutsi',	'NY',	'MT');
INSERT INTO @tbl VALUES ('Ogooue-Lolo'            ,	     'Mouloundou',	'OL',	'ML');
INSERT INTO @tbl VALUES ('Haut-Ogooue'            ,	     'Mpassa',	'HO',	'MP');
INSERT INTO @tbl VALUES ('Ogooue-Ivindo'            ,	     'Mvoung',	'OI',	'MV');
INSERT INTO @tbl VALUES ('Ngounie'            ,	     'Ndolou',	'NG',	'NL');
INSERT INTO @tbl VALUES ('Ogooue-Maritime'            ,	     'Ndougou',	'OM',	'NG');
INSERT INTO @tbl VALUES ('Estuaire'            ,	     'Noya',	'ES',	'NY');
INSERT INTO @tbl VALUES ('Woleu-Ntem'            ,	     'Ntem',	'WN',	'NT');
INSERT INTO @tbl VALUES ('Ogooue-Lolo'            ,	     'Offoue-Onoye',	'OL',	'OO');
INSERT INTO @tbl VALUES ('Moyen-Ogooue'            ,	     'Ogooue et Lacs',	'MO',	'OL');
INSERT INTO @tbl VALUES ('Haut-Ogooue'            ,	     'Ogooue-Letili',	'HO',	'OT');
INSERT INTO @tbl VALUES ('Ngounie'            ,	     'Ogoulou',	'NG',	'OU');
INSERT INTO @tbl VALUES ('Woleu-Ntem'            ,	     'Okano',	'WN',	'OK');
INSERT INTO @tbl VALUES ('Haut-Ogooue'            ,	     'Plateaux',	'HO',	'PX');
INSERT INTO @tbl VALUES ('Haut-Ogooue'            ,	     'Sebe-Brikolo',	'HO',	'SB');
INSERT INTO @tbl VALUES ('Ngounie'            ,	     'Tsamba-Magotsi',	'NG',	'TM');
INSERT INTO @tbl VALUES ('Woleu-Ntem'            ,	     'Woleu',	'WN',	'WO');
INSERT INTO @tbl VALUES ('Ogooue-Ivindo'            ,	     'Zadie',	'OI',	'ZA');

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

