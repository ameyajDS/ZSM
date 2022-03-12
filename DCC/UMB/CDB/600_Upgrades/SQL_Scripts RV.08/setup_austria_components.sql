
/* ==================================================================================
    	Source File		:	setup_austria_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Austria are set-up
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
WHERE	country_nm	=	'Austria';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Austria not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'State',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Amstetten',	'NO',	'AM');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Baden',	'NO',	'BN');
INSERT INTO @tbl VALUES ('Vorarlberg'            ,	     'Bludenz',	'VO',	'BZ');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Braunau am Inn',	'OO',	'BR');
INSERT INTO @tbl VALUES ('Vorarlberg'            ,	     'Bregenz',	'VO',	'BG');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Bruck an der Leitha',	'NO',	'BL');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Bruck-Murzzuschlag',	'ST',	'BZ');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Deutschlandsberg',	'ST',	'DL');
INSERT INTO @tbl VALUES ('Vorarlberg'            ,	     'Dornbirn',	'VO',	'DO');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Eferding',	'OO',	'EF');
INSERT INTO @tbl VALUES ('Burgenland'            ,	     'Eisenstadt',	'BU',	'ES');
INSERT INTO @tbl VALUES ('Burgenland'            ,	     'Eisenstadt Umgebung',	'BU',	'EU');
INSERT INTO @tbl VALUES ('Vorarlberg'            ,	     'Feldkirch',	'VO',	'FK');
INSERT INTO @tbl VALUES ('Carinthia'            ,	     'Feldkirchen',	'KA',	'FE');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Freistadt',	'OO',	'FR');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Ganserndorf',	'NO',	'GF');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Gmund',	'NO',	'GD');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Gmunden',	'OO',	'GM');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Graz',	'ST',	'GZ');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Graz Umgebung',	'ST',	'GU');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Grieskirchen',	'OO',	'GR');
INSERT INTO @tbl VALUES ('Burgenland'            ,	     'Gussing',	'BU',	'GS');
INSERT INTO @tbl VALUES ('Salzburg'            ,	     'Hallein',	'SZ',	'HA');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Hartberg-Furstenfeld',	'ST',	'HF');
INSERT INTO @tbl VALUES ('Carinthia'            ,	     'Hermagor',	'KA',	'HE');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Hollabrunn',	'NO',	'HL');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Horn',	'NO',	'HO');
INSERT INTO @tbl VALUES ('Tyrol'            ,	     'Imst',	'TR',	'IM');
INSERT INTO @tbl VALUES ('Tyrol'            ,	     'Innsbruck',	'TR',	'IN');
INSERT INTO @tbl VALUES ('Tyrol'            ,	     'Innsbruck Land',	'TR',	'IL');
INSERT INTO @tbl VALUES ('Burgenland'            ,	     'Jennersdorf',	'BU',	'JE');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Kirchdorf an der Krems',	'OO',	'KI');
INSERT INTO @tbl VALUES ('Tyrol'            ,	     'Kitzbuhel',	'TR',	'KB');
INSERT INTO @tbl VALUES ('Carinthia'            ,	     'Klagenfurt',	'KA',	'KG');
INSERT INTO @tbl VALUES ('Carinthia'            ,	     'Klagenfurt Land',	'KA',	'KL');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Korneuburg',	'NO',	'KO');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Krems an der Donau Land',	'NO',	'KR');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Krems an der Donau Stadt',	'NO',	'KS');
INSERT INTO @tbl VALUES ('Tyrol'            ,	     'Kufstein',	'TR',	'KU');
INSERT INTO @tbl VALUES ('Tyrol'            ,	     'Landeck',	'TR',	'LA');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Leibnitz',	'ST',	'LB');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Leoben',	'ST',	'LN');
INSERT INTO @tbl VALUES ('Tyrol'            ,	     'Lienz',	'TR',	'LZ');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Liezen',	'ST',	'LI');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Lilienfeld',	'NO',	'LF');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Linz',	'OO',	'LS');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Linz Land',	'OO',	'LL');
INSERT INTO @tbl VALUES ('Burgenland'            ,	     'Mattersburg',	'BU',	'MA');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Melk',	'NO',	'ME');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Mistelbach',	'NO',	'MI');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Modling',	'NO',	'MD');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Murau',	'ST',	'MU');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Murtal',	'ST',	'MT');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Neunkirchen',	'NO',	'NK');
INSERT INTO @tbl VALUES ('Burgenland'            ,	     'Neusiedl am See',	'BU',	'ND');
INSERT INTO @tbl VALUES ('Burgenland'            ,	     'Oberpullendorf',	'BU',	'OP');
INSERT INTO @tbl VALUES ('Burgenland'            ,	     'Oberwart',	'BU',	'OW');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Perg',	'OO',	'PE');
INSERT INTO @tbl VALUES ('Tyrol'            ,	     'Reutte',	'TR',	'RE');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Ried im Innkreis',	'OO',	'RI');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Rohrbach im Muhlkreis',	'OO',	'RO');
INSERT INTO @tbl VALUES ('Burgenland'            ,	     'Rust',	'BU',	'RU');
INSERT INTO @tbl VALUES ('Salzburg'            ,	     'Salzburg',	'SZ',	'SS');
INSERT INTO @tbl VALUES ('Salzburg'            ,	     'Salzburg Umgebung',	'SZ',	'SL');
INSERT INTO @tbl VALUES ('Salzburg'            ,	     'Sankt Johann im Pongau',	'SZ',	'JO');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Sankt Polten',	'NO',	'PS');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Sankt Polten Land',	'NO',	'PL');
INSERT INTO @tbl VALUES ('Carinthia'            ,	     'Sankt Veit an der Glan',	'KA',	'SV');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Scharding',	'OO',	'SD');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Scheibbs',	'NO',	'SB');
INSERT INTO @tbl VALUES ('Tyrol'            ,	     'Schwaz',	'TR',	'SZ');
INSERT INTO @tbl VALUES ('Carinthia'            ,	     'Spittal an der Drau',	'KA',	'SP');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Steyr',	'OO',	'SR');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Steyr Land',	'OO',	'SE');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Sudoststeiermark',	'ST',	'SO');
INSERT INTO @tbl VALUES ('Salzburg'            ,	     'Tamsweg',	'SZ',	'TA');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Tulln',	'NO',	'TU');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Urfahr Umgebung',	'OO',	'UU');
INSERT INTO @tbl VALUES ('Carinthia'            ,	     'Villach',	'KA',	'VI');
INSERT INTO @tbl VALUES ('Carinthia'            ,	     'Villach Land',	'KA',	'VL');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Vocklabruck',	'OO',	'VB');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Voitsberg',	'ST',	'VO');
INSERT INTO @tbl VALUES ('Carinthia'            ,	     'Volkermarkt',	'KA',	'VK');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Waidhofen an der Thaya',	'NO',	'WT');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Waidhofen an der Ybbs',	'NO',	'WY');
INSERT INTO @tbl VALUES ('Styria'            ,	     'Weiz',	'ST',	'WZ');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Wels',	'OO',	'WE');
INSERT INTO @tbl VALUES ('Upper Austria'            ,	     'Wels Land',	'OO',	'WL');
INSERT INTO @tbl VALUES ('Vienna'            ,	     'Wien',	'WI',	'WS');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Wiener Neustadt',	'NO',	'WN');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Wiener Neustadt Land',	'NO',	'WB');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Wien Umgebung',	'NO',	'WU');
INSERT INTO @tbl VALUES ('Carinthia'            ,	     'Wolfsberg',	'KA',	'WO');
INSERT INTO @tbl VALUES ('Salzburg'            ,	     'Zell am See',	'SZ',	'ZE');
INSERT INTO @tbl VALUES ('Lower Austria'            ,	     'Zwettl',	'NO',	'ZT');

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

