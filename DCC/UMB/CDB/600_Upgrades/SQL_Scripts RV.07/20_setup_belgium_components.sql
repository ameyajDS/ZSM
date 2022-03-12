/* ==================================================================================
    Source File		:	setup_belgium_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sat Oct 06 17:01 2014
	Module ID		:	CDB
	Last updated	:	Oct 06, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Belgium are set-up
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
WHERE	country_nm	=	'Belgium';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Belgium not found', 16, 1);
	RETURN;
END

/*	 These statements should NOT be uncommented; and should be used with extreme caution
DELETE	l3
FROM	level_3_address_components	l3
	JOIN	level_2_address_components	l2
		ON	(	l2.level_2_address_component_id	=	l3.level_2_address_component_id
			)
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


DELETE	level_1_address_components
WHERE	country_id	=	@country_id;
*/

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIqUE);

INSERT INTO @tbl VALUES ('Brussels',	'BU');
INSERT INTO @tbl VALUES ('Antwerp',	'AN');
INSERT INTO @tbl VALUES ('East Flanders',	'OV');
INSERT INTO @tbl VALUES ('Flemish Brabant',	'VB');
INSERT INTO @tbl VALUES ('Limburg',	'LI');
INSERT INTO @tbl VALUES ('West Flanders',	'WV');
INSERT INTO @tbl VALUES ('Hainaut',	'HT');
INSERT INTO @tbl VALUES ('Liege',	'LG');
INSERT INTO @tbl VALUES ('Luxembourg',	'LX');
INSERT INTO @tbl VALUES ('Namur',	'NA');
INSERT INTO @tbl VALUES ('Walloon Brabant',	'BW');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl2	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_nm, level_2_cd));


INSERT INTO @tbl2 VALUES ('Brussels',	'Brussel (Bruxelles)',	'BR');
INSERT INTO @tbl2 VALUES ('Antwerp',	'Antwerpen (Anvers)',	'AW');
INSERT INTO @tbl2 VALUES ('Antwerp',	'Mechelen (Malines)',	'MH');
INSERT INTO @tbl2 VALUES ('Antwerp',	'Turnhout',	'TH');
INSERT INTO @tbl2 VALUES ('East Flanders',	'Aalst (Alost)',	'AL');
INSERT INTO @tbl2 VALUES ('East Flanders',	'Dendermonde (Termonde)',	'DM');
INSERT INTO @tbl2 VALUES ('East Flanders',	'Eeklo',	'EK');
INSERT INTO @tbl2 VALUES ('East Flanders',	'Gent (Gand)',	'GT');
INSERT INTO @tbl2 VALUES ('East Flanders',	'Oudenaarde (Audenarde)',	'OD');
INSERT INTO @tbl2 VALUES ('East Flanders',	'Sint-Niklaas (Saint-Nicolas)',	'SN');
INSERT INTO @tbl2 VALUES ('Flemish Brabant',	'Halle-Vilvoorde (Hal-Vilvorde)',	'HV');
INSERT INTO @tbl2 VALUES ('Flemish Brabant',	'Leuven (Louvain)',	'LV');
INSERT INTO @tbl2 VALUES ('Limburg',	'Hasselt',	'HS');
INSERT INTO @tbl2 VALUES ('Limburg',	'Maaseik',	'MS');
INSERT INTO @tbl2 VALUES ('Limburg',	'Tongeren (Tongres)',	'TG');
INSERT INTO @tbl2 VALUES ('West Flanders',	'Brugge (Bruges)',	'BG');
INSERT INTO @tbl2 VALUES ('West Flanders',	'Diksmuide (Dixmude)',	'DK');
INSERT INTO @tbl2 VALUES ('West Flanders',	'Ieper (Ypres)',	'IP');
INSERT INTO @tbl2 VALUES ('West Flanders',	'Kortrijk (Courtrai)',	'KR');
INSERT INTO @tbl2 VALUES ('West Flanders',	'Oostende (Ostende)',	'OS');
INSERT INTO @tbl2 VALUES ('West Flanders',	'Roeselare (Roulers)',	'RS');
INSERT INTO @tbl2 VALUES ('West Flanders',	'Tielt',	'TL');
INSERT INTO @tbl2 VALUES ('West Flanders',	'Veurne (Furnes)',	'VR');
INSERT INTO @tbl2 VALUES ('Hainaut',	'Aat (Ath)',	'AT');
INSERT INTO @tbl2 VALUES ('Hainaut',	'Bergen (Mons)',	'MN');
INSERT INTO @tbl2 VALUES ('Hainaut',	'Charleroi',	'CR');
INSERT INTO @tbl2 VALUES ('Hainaut',	'Doornik (Tournai)',	'TR');
INSERT INTO @tbl2 VALUES ('Hainaut',	'Moeskroen (Mouscron)',	'MC');
INSERT INTO @tbl2 VALUES ('Hainaut',	'Thuin',	'TN');
INSERT INTO @tbl2 VALUES ('Hainaut',	'Zinnik (Soignies)',	'SG');
INSERT INTO @tbl2 VALUES ('Liege',	'Borgworm (Waremme)',	'WR');
INSERT INTO @tbl2 VALUES ('Liege',	'Hoei (Huy)',	'HY');
INSERT INTO @tbl2 VALUES ('Liege',	'Luik (Liege)',	'LG');
INSERT INTO @tbl2 VALUES ('Liege',	'Verviers',	'VV');
INSERT INTO @tbl2 VALUES ('Luxembourg',	'Aarlen (Arlon)',	'AR');
INSERT INTO @tbl2 VALUES ('Luxembourg',	'Bastenaken (Bastogne)',	'BS');
INSERT INTO @tbl2 VALUES ('Luxembourg',	'Marche-en-Famenne',	'MR');
INSERT INTO @tbl2 VALUES ('Luxembourg',	'Neufchateau',	'NC');
INSERT INTO @tbl2 VALUES ('Luxembourg',	'Virton',	'VT');
INSERT INTO @tbl2 VALUES ('Namur',	'Dinant',	'DN');
INSERT INTO @tbl2 VALUES ('Namur',	'Namen (Namur)',	'NM');
INSERT INTO @tbl2 VALUES ('Namur',	'Philippeville',	'PV');
INSERT INTO @tbl2 VALUES ('Walloon Brabant',	'Nijvel (Nivelles)',	'NV');

SET NOCOUNT OFF

INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl2	t
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


