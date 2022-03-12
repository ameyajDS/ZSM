
/* ==================================================================================
    	Source File		:	setup_czech_republic_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Czech_Republic are set-up
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
WHERE	country_nm	=	'Czech Republic';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Czech Republic not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Benesov',	'SK',	'BN');
INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Beroun',	'SK',	'BE');
INSERT INTO @tbl VALUES ('Jihomoravsky'            ,	     'Blansko',	'BK',	'BK');
INSERT INTO @tbl VALUES ('Jihomoravsky'            ,	     'Breclav',	'BK',	'BV');
INSERT INTO @tbl VALUES ('Jihomoravsky'            ,	     'Brno',	'BK',	'BM');
INSERT INTO @tbl VALUES ('Jihomoravsky'            ,	     'Brno - venkov',	'BK',	'BO');
INSERT INTO @tbl VALUES ('Moravskoslezsky'            ,	     'Bruntal',	'VK',	'BR');
INSERT INTO @tbl VALUES ('Liberecky'            ,	     'Ceska Lipa',	'LK',	'CL');
INSERT INTO @tbl VALUES ('Jihocesky'            ,	     'Ceske Budejovice',	'CK',	'CB');
INSERT INTO @tbl VALUES ('Jihocesky'            ,	     'Cesky Krumlov',	'CK',	'CK');
INSERT INTO @tbl VALUES ('Karlovarsky'            ,	     'Cheb',	'KK',	'CH');
INSERT INTO @tbl VALUES ('Ustecky'            ,	     'Chomutov',	'UK',	'CV');
INSERT INTO @tbl VALUES ('Pardubicky'            ,	     'Chrudim',	'EK',	'CR');
INSERT INTO @tbl VALUES ('Ustecky'            ,	     'Decin',	'UK',	'DC');
INSERT INTO @tbl VALUES ('Plzensky'            ,	     'Domazlice',	'PK',	'DO');
INSERT INTO @tbl VALUES ('Moravskoslezsky'            ,	     'Frydek-Mistek',	'VK',	'FM');
INSERT INTO @tbl VALUES ('Vysocina'            ,	     'Havlickuv Brod',	'JK',	'HB');
INSERT INTO @tbl VALUES ('Jihomoravsky'            ,	     'Hodonin',	'BK',	'HO');
INSERT INTO @tbl VALUES ('Kralovehradecky'            ,	     'Hradec Kralove',	'HK',	'HK');
INSERT INTO @tbl VALUES ('Liberecky'            ,	     'Jablonec nad Nisou',	'LK',	'JN');
INSERT INTO @tbl VALUES ('Olomoucky'            ,	     'Jesenik',	'OK',	'JE');
INSERT INTO @tbl VALUES ('Kralovehradecky'            ,	     'Jicin',	'HK',	'JC');
INSERT INTO @tbl VALUES ('Vysocina'            ,	     'Jihlava',	'JK',	'JI');
INSERT INTO @tbl VALUES ('Jihocesky'            ,	     'Jindrichuv Hradec',	'CK',	'JH');
INSERT INTO @tbl VALUES ('Karlovarsky'            ,	     'Karlovy Vary',	'KK',	'KV');
INSERT INTO @tbl VALUES ('Moravskoslezsky'            ,	     'Karvina',	'VK',	'KI');
INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Kladno',	'SK',	'KL');
INSERT INTO @tbl VALUES ('Plzensky'            ,	     'Klatovy',	'PK',	'KT');
INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Kolin',	'SK',	'KO');
INSERT INTO @tbl VALUES ('Zlinsky'            ,	     'Kromeriz',	'ZK',	'KM');
INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Kutna Hora',	'SK',	'KH');
INSERT INTO @tbl VALUES ('Liberecky'            ,	     'Liberec',	'LK',	'LB');
INSERT INTO @tbl VALUES ('Ustecky'            ,	     'Litomerice',	'UK',	'LT');
INSERT INTO @tbl VALUES ('Ustecky'            ,	     'Louny',	'UK',	'LN');
INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Melnik',	'SK',	'ME');
INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Mlada Boleslav',	'SK',	'MB');
INSERT INTO @tbl VALUES ('Ustecky'            ,	     'Most',	'UK',	'MO');
INSERT INTO @tbl VALUES ('Kralovehradecky'            ,	     'Nachod',	'HK',	'NA');
INSERT INTO @tbl VALUES ('Moravskoslezsky'            ,	     'Novy Jicin',	'VK',	'NJ');
INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Nymburk',	'SK',	'NB');
INSERT INTO @tbl VALUES ('Olomoucky'            ,	     'Olomouc',	'OK',	'OC');
INSERT INTO @tbl VALUES ('Moravskoslezsky'            ,	     'Opava',	'VK',	'OP');
INSERT INTO @tbl VALUES ('Moravskoslezsky'            ,	     'Ostrava',	'VK',	'OV');
INSERT INTO @tbl VALUES ('Pardubicky'            ,	     'Pardubice',	'EK',	'PU');
INSERT INTO @tbl VALUES ('Vysocina'            ,	     'Pelhrimov',	'JK',	'PE');
INSERT INTO @tbl VALUES ('Jihocesky'            ,	     'Pisek',	'CK',	'PI');
INSERT INTO @tbl VALUES ('Plzensky'            ,	     'Plzen',	'PK',	'PM');
INSERT INTO @tbl VALUES ('Plzensky'            ,	     'Plzen - jih',	'PK',	'PJ');
INSERT INTO @tbl VALUES ('Plzensky'            ,	     'Plzen - sever',	'PK',	'PS');
INSERT INTO @tbl VALUES ('Jihocesky'            ,	     'Prachatice',	'CK',	'PT');
INSERT INTO @tbl VALUES ('Praha'            ,	     'Praha',	'PM',	'AA');
INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Praha - vychod',	'SK',	'PH');
INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Praha - zapad',	'SK',	'PZ');
INSERT INTO @tbl VALUES ('Olomoucky'            ,	     'Prerov',	'OK',	'PR');
INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Pribram',	'SK',	'PB');
INSERT INTO @tbl VALUES ('Olomoucky'            ,	     'Prostejov',	'OK',	'PV');
INSERT INTO @tbl VALUES ('Stredocesky'            ,	     'Rakovnik',	'SK',	'RA');
INSERT INTO @tbl VALUES ('Plzensky'            ,	     'Rokycany',	'PK',	'RO');
INSERT INTO @tbl VALUES ('Kralovehradecky'            ,	     'Rychnov nad Kneznou',	'HK',	'RK');
INSERT INTO @tbl VALUES ('Liberecky'            ,	     'Semily',	'LK',	'SM');
INSERT INTO @tbl VALUES ('Karlovarsky'            ,	     'Sokolov',	'KK',	'SO');
INSERT INTO @tbl VALUES ('Jihocesky'            ,	     'Strakonice',	'CK',	'ST');
INSERT INTO @tbl VALUES ('Olomoucky'            ,	     'Sumperk',	'OK',	'SU');
INSERT INTO @tbl VALUES ('Pardubicky'            ,	     'Svitavy',	'EK',	'SY');
INSERT INTO @tbl VALUES ('Jihocesky'            ,	     'Tabor',	'CK',	'TA');
INSERT INTO @tbl VALUES ('Plzensky'            ,	     'Tachov',	'PK',	'TC');
INSERT INTO @tbl VALUES ('Ustecky'            ,	     'Teplice',	'UK',	'TP');
INSERT INTO @tbl VALUES ('Vysocina'            ,	     'Trebic',	'JK',	'TR');
INSERT INTO @tbl VALUES ('Kralovehradecky'            ,	     'Trutnov',	'HK',	'TU');
INSERT INTO @tbl VALUES ('Zlinsky'            ,	     'Uherske Hradiste',	'ZK',	'UH');
INSERT INTO @tbl VALUES ('Ustecky'            ,	     'Usti nad Labem',	'UK',	'UL');
INSERT INTO @tbl VALUES ('Pardubicky'            ,	     'Usti nad Orlici',	'EK',	'UO');
INSERT INTO @tbl VALUES ('Zlinsky'            ,	     'Vsetin',	'ZK',	'VS');
INSERT INTO @tbl VALUES ('Jihomoravsky'            ,	     'Vyskov',	'BK',	'VY');
INSERT INTO @tbl VALUES ('Vysocina'            ,	     'Zdar nad Sazavou',	'JK',	'ZR');
INSERT INTO @tbl VALUES ('Zlinsky'            ,	     'Zlin',	'ZK',	'ZL');
INSERT INTO @tbl VALUES ('Jihomoravsky'            ,	     'Znojmo',	'BK',	'ZN');

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

