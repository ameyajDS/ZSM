
/* ==================================================================================
    	Source File		:	setup_chad_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Chad are set-up
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
WHERE	country_nm	=	'Chad';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Chad not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Ouaddai'            ,	     'Abdi',	'OA',	'AB');
INSERT INTO @tbl VALUES ('Salamat'            ,	     'Aboudeia',	'SA',	'AD');
INSERT INTO @tbl VALUES ('Guera'            ,	     'Abtouyour',	'GR',	'AB');
INSERT INTO @tbl VALUES ('Ennedi Est'            ,	     'Am-Djarass',	'EE',	'AD');
INSERT INTO @tbl VALUES ('Ouaddai'            ,	     'Assoungha',	'OA',	'AS');
INSERT INTO @tbl VALUES ('Chari-Baguirmi'            ,	     'Baguirmi',	'CG',	'BA');
INSERT INTO @tbl VALUES ('Salamat'            ,	     'Barh Azoum',	'SA',	'AT');
INSERT INTO @tbl VALUES ('Barh el Ghazel'            ,	     'Barh el Gazel Nord',	'BG',	'BN');
INSERT INTO @tbl VALUES ('Barh el Ghazel'            ,	     'Barh el Gazel Ouest',	'BG',	'BO');
INSERT INTO @tbl VALUES ('Barh el Ghazel'            ,	     'Barh el Gazel Sud',	'BG',	'BU');
INSERT INTO @tbl VALUES ('Moyen-Chari'            ,	     'Barh Koh',	'MO',	'BA');
INSERT INTO @tbl VALUES ('Mandoul'            ,	     'Barh Sara',	'MA',	'BA');
INSERT INTO @tbl VALUES ('Guera'            ,	     'Barh Signaka',	'GR',	'BS');
INSERT INTO @tbl VALUES ('Batha'            ,	     'Batha Est',	'BA',	'BE');
INSERT INTO @tbl VALUES ('Batha'            ,	     'Batha Ouest',	'BA',	'BO');
INSERT INTO @tbl VALUES ('Wadi Fira'            ,	     'Biltine',	'BI',	'BL');
INSERT INTO @tbl VALUES ('Borkou'            ,	     'Borkou',	'BR',	'BK');
INSERT INTO @tbl VALUES ('Borkou'            ,	     'Borkou Yala',	'BR',	'BY');
INSERT INTO @tbl VALUES ('Chari-Baguirmi'            ,	     'Chari',	'CG',	'CH');
INSERT INTO @tbl VALUES ('Hadjer-Lamis'            ,	     'Dababa',	'HD',	'DB');
INSERT INTO @tbl VALUES ('Hadjer-Lamis'            ,	     'Dagana',	'HD',	'DG');
INSERT INTO @tbl VALUES ('Wadi Fira'            ,	     'Dar Tama',	'BI',	'DT');
INSERT INTO @tbl VALUES ('Sila'            ,	     'Djourouf al Ahmar',	'SI',	'DA');
INSERT INTO @tbl VALUES ('Logone Occidental'            ,	     'Dodje',	'LO',	'DJ');
INSERT INTO @tbl VALUES ('Ennedi Ouest'            ,	     'Fada',	'EO',	'FA');
INSERT INTO @tbl VALUES ('Batha'            ,	     'Fitri',	'BA',	'FI');
INSERT INTO @tbl VALUES ('Moyen-Chari'            ,	     'Grande Sido',	'MO',	'GR');
INSERT INTO @tbl VALUES ('Logone Occidental'            ,	     'Gueni',	'LO',	'GN');
INSERT INTO @tbl VALUES ('Guera'            ,	     'Guera',	'GR',	'GR');
INSERT INTO @tbl VALUES ('Hadjer-Lamis'            ,	     'Haraze al Biar',	'HD',	'HB');
INSERT INTO @tbl VALUES ('Salamat'            ,	     'Haraze Mangueigne',	'SA',	'HA');
INSERT INTO @tbl VALUES ('Wadi Fira'            ,	     'Iriba',	'BI',	'IB');
INSERT INTO @tbl VALUES ('Mayo-Kebbi Est'            ,	     'Kabbia',	'ME',	'KB');
INSERT INTO @tbl VALUES ('Kanem'            ,	     'Kanem',	'KM',	'KM');
INSERT INTO @tbl VALUES ('Sila'            ,	     'Kimiti',	'SI',	'SI');
INSERT INTO @tbl VALUES ('Logone Oriental'            ,	     'Kouh Est',	'LR',	'KE');
INSERT INTO @tbl VALUES ('Logone Oriental'            ,	     'Kouh Ouest',	'LR',	'KO');
INSERT INTO @tbl VALUES ('Moyen-Chari'            ,	     'Lac Iro',	'MO',	'LI');
INSERT INTO @tbl VALUES ('Mayo-Kebbi Ouest'            ,	     'Lac Lere',	'MW',	'LE');
INSERT INTO @tbl VALUES ('Logone Occidental'            ,	     'Lac Wey',	'LO',	'LW');
INSERT INTO @tbl VALUES ('Chari-Baguirmi'            ,	     'Loug Chari',	'CG',	'LC');
INSERT INTO @tbl VALUES ('Lac'            ,	     'Mamdi',	'LC',	'MA');
INSERT INTO @tbl VALUES ('Mandoul'            ,	     'Mandoul Occidental',	'MA',	'MC');
INSERT INTO @tbl VALUES ('Mandoul'            ,	     'Mandoul Oriental',	'MA',	'MR');
INSERT INTO @tbl VALUES ('Guera'            ,	     'Mangalme',	'GR',	'MG');
INSERT INTO @tbl VALUES ('Mayo-Kebbi Ouest'            ,	     'Mayo Binder',	'MW',	'MB');
INSERT INTO @tbl VALUES ('Mayo-Kebbi Est'            ,	     'Mayo Boneye',	'ME',	'MB');
INSERT INTO @tbl VALUES ('Mayo-Kebbi Ouest'            ,	     'Mayo Dallah',	'MW',	'MD');
INSERT INTO @tbl VALUES ('Mayo-Kebbi Est'            ,	     'Mayo Lemie',	'ME',	'ML');
INSERT INTO @tbl VALUES ('Wadi Fira'            ,	     'Megri',	'BI',	'MG');
INSERT INTO @tbl VALUES ('Mayo-Kebbi Est'            ,	     'Mont Illi',	'ME',	'MI');
INSERT INTO @tbl VALUES ('Logone Oriental'            ,	     'Monts de Lam',	'LR',	'ML');
INSERT INTO @tbl VALUES ('Ennedi Ouest'            ,	     'Mourtcha',	'EO',	'MO');
INSERT INTO @tbl VALUES ('Ville de N''Djamena'            ,	     'N''Djamena',	'NJ',	'NU');
INSERT INTO @tbl VALUES ('Logone Occidental'            ,	     'Ngourkosso',	'LO',	'NK');
INSERT INTO @tbl VALUES ('Kanem'            ,	     'Nord Kanem',	'KM',	'NK');
INSERT INTO @tbl VALUES ('Logone Oriental'            ,	     'Nya',	'LR',	'NY');
INSERT INTO @tbl VALUES ('Logone Oriental'            ,	     'Nya Pende',	'LR',	'NP');
INSERT INTO @tbl VALUES ('Ouaddai'            ,	     'Ouara',	'OA',	'OR');
INSERT INTO @tbl VALUES ('Logone Oriental'            ,	     'Pende',	'LR',	'PD');
INSERT INTO @tbl VALUES ('Tandjile'            ,	     'Tandjile Centre',	'TA',	'TC');
INSERT INTO @tbl VALUES ('Tandjile'            ,	     'Tandjile Est',	'TA',	'TE');
INSERT INTO @tbl VALUES ('Tandjile'            ,	     'Tandjile Ouest',	'TA',	'TW');
INSERT INTO @tbl VALUES ('Tibesti'            ,	     'Tibesti Est',	'TI',	'TE');
INSERT INTO @tbl VALUES ('Tibesti'            ,	     'Tibesti Ouest',	'TI',	'TO');
INSERT INTO @tbl VALUES ('Kanem'            ,	     'Wadi Bissam',	'KM',	'WB');
INSERT INTO @tbl VALUES ('Ennedi Est'            ,	     'Wadi Hawar',	'EE',	'WH');
INSERT INTO @tbl VALUES ('Lac'            ,	     'Wayi',	'LC',	'WA');

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

