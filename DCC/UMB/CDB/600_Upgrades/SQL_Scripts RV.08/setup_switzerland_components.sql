
/* ==================================================================================
    	Source File		:	setup_switzerland_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Switzerland are set-up
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
WHERE	country_nm	=	'Switzerland';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Switzerland not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Canton',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Aargau'            ,	     'Aarau',	'AG',	'AA');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Aarberg',	'BE',	'AB');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Aarwangen',	'BE',	'AW');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Affoltern',	'ZH',	'AT');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Aigle',	'VD',	'AI');
INSERT INTO @tbl VALUES ('Graubunden'            ,	     'Albula',	'GR',	'AB');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Alttoggenburg',	'SG',	'AT');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Andelfingen',	'ZH',	'AF');
INSERT INTO @tbl VALUES ('Appenzell Inner Rhodes'            ,	     'Appenzell Inner-Rhoden',	'AI',	'AI');
INSERT INTO @tbl VALUES ('Thurgau'            ,	     'Arbon',	'TG',	'AB');
INSERT INTO @tbl VALUES ('Basel-Landschaft'            ,	     'Arlesheim',	'BL',	'AH');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Aubonne',	'VD',	'AU');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Avenches',	'VD',	'AV');
INSERT INTO @tbl VALUES ('Aargau'            ,	     'Baden',	'AG',	'BA');
INSERT INTO @tbl VALUES ('Basel-Stadt'            ,	     'Basel-Stadt',	'BS',	'BS');
INSERT INTO @tbl VALUES ('Ticino'            ,	     'Bellinzona',	'TI',	'BZ');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Bern',	'BE',	'BE');
INSERT INTO @tbl VALUES ('Graubunden'            ,	     'Bernina',	'GR',	'BN');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Biel',	'BE',	'BI');
INSERT INTO @tbl VALUES ('Thurgau'            ,	     'Bischofszell',	'TG',	'BZ');
INSERT INTO @tbl VALUES ('Ticino'            ,	     'Blenio',	'TI',	'BL');
INSERT INTO @tbl VALUES ('Neuchatel'            ,	     'Boudry',	'NE',	'BO');
INSERT INTO @tbl VALUES ('Aargau'            ,	     'Bremgarten',	'AG',	'BG');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Brig',	'VS',	'BR');
INSERT INTO @tbl VALUES ('Aargau'            ,	     'Brugg',	'AG',	'BR');
INSERT INTO @tbl VALUES ('Solothurn'            ,	     'Bucheggberg',	'SO',	'BB');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Bulach',	'ZH',	'BU');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Buren',	'BE',	'BU');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Burgdorf',	'BE',	'BD');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Conthey',	'VS',	'CO');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Cossonay',	'VD',	'CO');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Courtelary',	'BE',	'CL');
INSERT INTO @tbl VALUES ('Jura'            ,	     'Delemont',	'JU',	'DE');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Dielsdorf',	'ZH',	'DD');
INSERT INTO @tbl VALUES ('Thurgau'            ,	     'Diessenhofen',	'TG',	'DH');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Dietikon',	'ZH',	'DT');
INSERT INTO @tbl VALUES ('Solothurn'            ,	     'Dorneck',	'SO',	'DE');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Echallens',	'VD',	'EC');
INSERT INTO @tbl VALUES ('Schwyz'            ,	     'Einsiedeln',	'SZ',	'ES');
INSERT INTO @tbl VALUES ('Lucerne'            ,	     'Entlebuch',	'LU',	'EB');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Entremont',	'VS',	'EM');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Erlach',	'BE',	'EL');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Fraubrunnen',	'BE',	'FB');
INSERT INTO @tbl VALUES ('Thurgau'            ,	     'Frauenfeld',	'TG',	'FF');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Frutigen',	'BE',	'FT');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Gaster',	'SG',	'GA');
INSERT INTO @tbl VALUES ('Solothurn'            ,	     'Gau',	'SO',	'GA');
INSERT INTO @tbl VALUES ('Geneva'            ,	     'Geneve',	'GE',	'GE');
INSERT INTO @tbl VALUES ('Schwyz'            ,	     'Gersau',	'SZ',	'GS');
INSERT INTO @tbl VALUES ('Glarus'            ,	     'Glarus',	'GL',	'GL');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Goms',	'VS',	'GO');
INSERT INTO @tbl VALUES ('Solothurn'            ,	     'Gosgen',	'SO',	'GG');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Gossau',	'SG',	'GO');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Grandson',	'VD',	'GR');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Herens',	'VS',	'HE');
INSERT INTO @tbl VALUES ('Appenzell Outer Rhodes'            ,	     'Hinterland',	'AR',	'HL');
INSERT INTO @tbl VALUES ('Graubunden'            ,	     'Hinterrhein',	'GR',	'HR');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Hinwil',	'ZH',	'HW');
INSERT INTO @tbl VALUES ('Lucerne'            ,	     'Hochdorf',	'LU',	'HD');
INSERT INTO @tbl VALUES ('Schwyz'            ,	     'Hofe',	'SZ',	'HO');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Horgen',	'ZH',	'HG');
INSERT INTO @tbl VALUES ('Graubunden'            ,	     'Imboden',	'GR',	'IB');
INSERT INTO @tbl VALUES ('Graubunden'            ,	     'Inn',	'GR',	'IN');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Interlaken',	'BE',	'IL');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Konolfingen',	'BE',	'KF');
INSERT INTO @tbl VALUES ('Thurgau'            ,	     'Kreuzlingen',	'TG',	'KL');
INSERT INTO @tbl VALUES ('Aargau'            ,	     'Kulm',	'AG',	'KU');
INSERT INTO @tbl VALUES ('Schwyz'            ,	     'Kussnacht',	'SZ',	'KN');
INSERT INTO @tbl VALUES ('Fribourg'            ,	     'La Broye',	'FR',	'BR');
INSERT INTO @tbl VALUES ('Fribourg'            ,	     'Lac',	'FR',	'LA');
INSERT INTO @tbl VALUES ('Neuchatel'            ,	     'La Chaux-de-Fonds',	'NE',	'CF');
INSERT INTO @tbl VALUES ('Fribourg'            ,	     'La Glane',	'FR',	'GL');
INSERT INTO @tbl VALUES ('Fribourg'            ,	     'La Gruyere',	'FR',	'GR');
INSERT INTO @tbl VALUES ('Graubunden'            ,	     'Landquart',	'GR',	'LQ');
INSERT INTO @tbl VALUES ('Bern'            ,	     'La Neuveville',	'BE',	'LN');
INSERT INTO @tbl VALUES ('Fribourg'            ,	     'La Sarine',	'FR',	'SA');
INSERT INTO @tbl VALUES ('Basel-Landschaft'            ,	     'Laufen',	'BL',	'LF');
INSERT INTO @tbl VALUES ('Aargau'            ,	     'Laufenburg',	'AG',	'LA');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Laupen',	'BE',	'LP');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Lausanne',	'VD',	'LS');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'La Vallee',	'VD',	'LV');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Lavaux',	'VD',	'LX');
INSERT INTO @tbl VALUES ('Fribourg'            ,	     'La Veveyse',	'FR',	'VE');
INSERT INTO @tbl VALUES ('Solothurn'            ,	     'Lebern',	'SO',	'LB');
INSERT INTO @tbl VALUES ('Neuchatel'            ,	     'Le Locle',	'NE',	'LO');
INSERT INTO @tbl VALUES ('Aargau'            ,	     'Lenzburg',	'AG',	'LB');
INSERT INTO @tbl VALUES ('Jura'            ,	     'Les Franches-Montagnes',	'JU',	'FM');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Leuk',	'VS',	'LE');
INSERT INTO @tbl VALUES ('Ticino'            ,	     'Leventina',	'TI',	'LT');
INSERT INTO @tbl VALUES ('Basel-Landschaft'            ,	     'Liestal',	'BL',	'LT');
INSERT INTO @tbl VALUES ('Ticino'            ,	     'Locarno',	'TI',	'LO');
INSERT INTO @tbl VALUES ('Ticino'            ,	     'Lugano',	'TI',	'LG');
INSERT INTO @tbl VALUES ('Lucerne'            ,	     'Luzern',	'LU',	'LU');
INSERT INTO @tbl VALUES ('Graubunden'            ,	     'Maloja',	'GR',	'ML');
INSERT INTO @tbl VALUES ('Schwyz'            ,	     'March',	'SZ',	'MA');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Martigny',	'VS',	'MA');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Meilen',	'ZH',	'ML');
INSERT INTO @tbl VALUES ('Ticino'            ,	     'Mendrisio',	'TI',	'MD');
INSERT INTO @tbl VALUES ('Appenzell Outer Rhodes'            ,	     'Mittelland',	'AR',	'ML');
INSERT INTO @tbl VALUES ('Graubunden'            ,	     'Moesa',	'GR',	'MS');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Monthey',	'VS',	'MO');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Morges',	'VD',	'MO');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Moudon',	'VD',	'MD');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Moutier',	'BE',	'MT');
INSERT INTO @tbl VALUES ('Thurgau'            ,	     'Munchwilen',	'TG',	'MW');
INSERT INTO @tbl VALUES ('Aargau'            ,	     'Muri',	'AG',	'MU');
INSERT INTO @tbl VALUES ('Neuchatel'            ,	     'Neuchatel',	'NE',	'NE');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Neutoggenburg',	'SG',	'NT');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Nidau',	'BE',	'ND');
INSERT INTO @tbl VALUES ('Nidwalden'            ,	     'Nidwalden',	'NW',	'NW');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Niedersimmental',	'BE',	'NS');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Nyon',	'VD',	'NY');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Oberhasli',	'BE',	'OH');
INSERT INTO @tbl VALUES ('Schaffhausen'            ,	     'Oberklettgau',	'SH',	'OK');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Oberrheintal',	'SG',	'OR');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Obersimmental',	'BE',	'OS');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Obertoggenburg',	'SG',	'OT');
INSERT INTO @tbl VALUES ('Obwalden'            ,	     'Obwalden',	'OW',	'OW');
INSERT INTO @tbl VALUES ('Solothurn'            ,	     'Olten',	'SO',	'OL');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Orbe',	'VD',	'OB');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Oron',	'VD',	'OR');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Payerne',	'VD',	'PA');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Pays-d''Enhaut',	'VD',	'PE');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Pfaffikon',	'ZH',	'PF');
INSERT INTO @tbl VALUES ('Graubunden'            ,	     'Plessur',	'GR',	'PS');
INSERT INTO @tbl VALUES ('Jura'            ,	     'Porrentruy',	'JU',	'PO');
INSERT INTO @tbl VALUES ('Graubunden'            ,	     'Prattigau/Davos',	'GR',	'PD');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Raron',	'VS',	'RA');
INSERT INTO @tbl VALUES ('Schaffhausen'            ,	     'Reiat',	'SH',	'RE');
INSERT INTO @tbl VALUES ('Aargau'            ,	     'Rheinfelden',	'AG',	'RF');
INSERT INTO @tbl VALUES ('Ticino'            ,	     'Riviera',	'TI',	'RI');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Rolle',	'VD',	'RO');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Rorschach',	'SG',	'RS');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Saanen',	'BE',	'SA');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Saint-Maurice',	'VS',	'SM');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Sankt Gallen',	'SG',	'SG');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Sargans',	'SG',	'SA');
INSERT INTO @tbl VALUES ('Schaffhausen'            ,	     'Schaffhausen',	'SH',	'SH');
INSERT INTO @tbl VALUES ('Schaffhausen'            ,	     'Schleitheim',	'SH',	'SM');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Schwarzenburg',	'BE',	'SB');
INSERT INTO @tbl VALUES ('Schwyz'            ,	     'Schwyz',	'SZ',	'SZ');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'See',	'SG',	'SE');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Seftigen',	'BE',	'ST');
INSERT INTO @tbl VALUES ('Fribourg'            ,	     'Sense',	'FR',	'SI');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Sierre',	'VS',	'SR');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Signau',	'BE',	'SN');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Sion',	'VS',	'SI');
INSERT INTO @tbl VALUES ('Basel-Landschaft'            ,	     'Sissach',	'BL',	'SS');
INSERT INTO @tbl VALUES ('Solothurn'            ,	     'Solothurn',	'SO',	'SO');
INSERT INTO @tbl VALUES ('Thurgau'            ,	     'Steckborn',	'TG',	'SB');
INSERT INTO @tbl VALUES ('Schaffhausen'            ,	     'Stein',	'SH',	'ST');
INSERT INTO @tbl VALUES ('Lucerne'            ,	     'Sursee',	'LU',	'SS');
INSERT INTO @tbl VALUES ('Graubunden'            ,	     'Surselva',	'GR',	'SS');
INSERT INTO @tbl VALUES ('Solothurn'            ,	     'Thal',	'SO',	'TH');
INSERT INTO @tbl VALUES ('Solothurn'            ,	     'Thierstein',	'SO',	'TS');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Thun',	'BE',	'TH');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Trachselwald',	'BE',	'TW');
INSERT INTO @tbl VALUES ('Schaffhausen'            ,	     'Unterklettgau',	'SH',	'UK');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Unterrheintal',	'SG',	'UR');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Untertoggenburg',	'SG',	'UT');
INSERT INTO @tbl VALUES ('Uri'            ,	     'Uri',	'UR',	'UR');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Uster',	'ZH',	'US');
INSERT INTO @tbl VALUES ('Neuchatel'            ,	     'Val-de-Ruz',	'NE',	'VR');
INSERT INTO @tbl VALUES ('Neuchatel'            ,	     'Val-de-Travers',	'NE',	'VT');
INSERT INTO @tbl VALUES ('Ticino'            ,	     'Vallemaggia',	'TI',	'VM');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Vevey',	'VD',	'VE');
INSERT INTO @tbl VALUES ('Valais'            ,	     'Visp',	'VS',	'VI');
INSERT INTO @tbl VALUES ('Appenzell Outer Rhodes'            ,	     'Vorderland',	'AR',	'VL');
INSERT INTO @tbl VALUES ('Basel-Landschaft'            ,	     'Waldenburg',	'BL',	'WB');
INSERT INTO @tbl VALUES ('Bern'            ,	     'Wangen',	'BE',	'WG');
INSERT INTO @tbl VALUES ('Solothurn'            ,	     'Wasseramt',	'SO',	'WA');
INSERT INTO @tbl VALUES ('Thurgau'            ,	     'Weinfelden',	'TG',	'WF');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Werdenberg',	'SG',	'WB');
INSERT INTO @tbl VALUES ('Sankt Gallen'            ,	     'Wil',	'SG',	'WI');
INSERT INTO @tbl VALUES ('Lucerne'            ,	     'Willisau',	'LU',	'WS');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Winterthur',	'ZH',	'WT');
INSERT INTO @tbl VALUES ('Vaud'            ,	     'Yverdon',	'VD',	'YV');
INSERT INTO @tbl VALUES ('Aargau'            ,	     'Zofingen',	'AG',	'ZF');
INSERT INTO @tbl VALUES ('Zug'            ,	     'Zug',	'ZG',	'ZG');
INSERT INTO @tbl VALUES ('Zurich'            ,	     'Zurich',	'ZH',	'ZH');
INSERT INTO @tbl VALUES ('Aargau'            ,	     'Zurzach',	'AG',	'ZZ');

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

