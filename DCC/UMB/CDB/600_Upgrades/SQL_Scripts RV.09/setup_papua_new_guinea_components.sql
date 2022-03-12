
/* ==================================================================================
    	Source File		:	setup_papua_new_guinea_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Papua_New_Guinea are set-up
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
WHERE	country_nm	=	'Papua New Guinea';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Papua New Guinea not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Central'            ,	     'Abau',	'CE',	'AB');
INSERT INTO @tbl VALUES ('Sandaun'            ,	     'Aitape-Lumi',	'SA',	'AL');
INSERT INTO @tbl VALUES ('Milne Bay'            ,	     'Alotau',	'MB',	'AL');
INSERT INTO @tbl VALUES ('East Sepik'            ,	     'Ambunti-Dreikikir',	'ES',	'AT');
INSERT INTO @tbl VALUES ('Jiwaka'            ,	     'Anglimp-South Waghi',	'JI',	'SW');
INSERT INTO @tbl VALUES ('East Sepik'            ,	     'Angoram',	'ES',	'AN');
INSERT INTO @tbl VALUES ('Madang'            ,	     'Bogia',	'MD',	'BG');
INSERT INTO @tbl VALUES ('Morobe'            ,	     'Bulolo',	'MR',	'BL');
INSERT INTO @tbl VALUES ('Bougainville'            ,	     'Central Bougainville',	'NS',	'KI');
INSERT INTO @tbl VALUES ('Chimbu'            ,	     'Chuave',	'CH',	'CH');
INSERT INTO @tbl VALUES ('Eastern Highlands'            ,	     'Daulo',	'EH',	'DA');
INSERT INTO @tbl VALUES ('Western Highlands'            ,	     'Dei',	'WL',	'DE');
INSERT INTO @tbl VALUES ('Milne Bay'            ,	     'Esa''ala',	'MB',	'EA');
INSERT INTO @tbl VALUES ('Morobe'            ,	     'Finschhafen',	'MR',	'FI');
INSERT INTO @tbl VALUES ('East New Britain'            ,	     'Gazelle',	'EN',	'GZ');
INSERT INTO @tbl VALUES ('Central'            ,	     'Goilala',	'CE',	'GL');
INSERT INTO @tbl VALUES ('Eastern Highlands'            ,	     'Goroka',	'EH',	'GK');
INSERT INTO @tbl VALUES ('Chimbu'            ,	     'Gumine',	'CH',	'GM');
INSERT INTO @tbl VALUES ('Eastern Highlands'            ,	     'Henganofi',	'EH',	'HE');
INSERT INTO @tbl VALUES ('Morobe'            ,	     'Huon',	'MR',	'HG');
INSERT INTO @tbl VALUES ('Southern Highlands'            ,	     'Ialibu-Pangia',	'SL',	'IP');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Ijivitari',	'NO',	'PP');
INSERT INTO @tbl VALUES ('Southern Highlands'            ,	     'Imbonggu',	'SL',	'IB');
INSERT INTO @tbl VALUES ('Jiwaka'            ,	     'Jimi',	'JI',	'JI');
INSERT INTO @tbl VALUES ('Morobe'            ,	     'Kabwum',	'MR',	'KW');
INSERT INTO @tbl VALUES ('Southern Highlands'            ,	     'Kagua-Erave',	'SL',	'KG');
INSERT INTO @tbl VALUES ('Eastern Highlands'            ,	     'Kainantu',	'EH',	'KA');
INSERT INTO @tbl VALUES ('Central'            ,	     'Kairuku-Hiri',	'CE',	'KH');
INSERT INTO @tbl VALUES ('Enga'            ,	     'Kandep',	'EG',	'KD');
INSERT INTO @tbl VALUES ('West New Britain'            ,	     'Kandrian-Gloucester',	'WN',	'KG');
INSERT INTO @tbl VALUES ('Chimbu'            ,	     'Karimui-Nomane',	'CH',	'KM');
INSERT INTO @tbl VALUES ('New Ireland'            ,	     'Kavieng',	'NI',	'KV');
INSERT INTO @tbl VALUES ('Gulf'            ,	     'Kerema',	'GU',	'KM');
INSERT INTO @tbl VALUES ('Chimbu'            ,	     'Kerowagi',	'CH',	'KG');
INSERT INTO @tbl VALUES ('Gulf'            ,	     'Kikori',	'GU',	'KK');
INSERT INTO @tbl VALUES ('Milne Bay'            ,	     'Kiriwina-Goodenough',	'MB',	'KG');
INSERT INTO @tbl VALUES ('East New Britain'            ,	     'Kokopo',	'EN',	'KO');
INSERT INTO @tbl VALUES ('Hela'            ,	     'Komo-Magarima',	'HE',	'KM');
INSERT INTO @tbl VALUES ('Enga'            ,	     'Kompiam-Ambum',	'EG',	'KM');
INSERT INTO @tbl VALUES ('Hela'            ,	     'Koroba-Lake Kopiago',	'HE',	'KR');
INSERT INTO @tbl VALUES ('Chimbu'            ,	     'Kundiawa-Gembogl',	'CH',	'KD');
INSERT INTO @tbl VALUES ('Morobe'            ,	     'Lae',	'MR',	'LA');
INSERT INTO @tbl VALUES ('Enga'            ,	     'Lagaip-Porgera',	'EG',	'LP');
INSERT INTO @tbl VALUES ('Eastern Highlands'            ,	     'Lufa',	'EH',	'LF');
INSERT INTO @tbl VALUES ('Madang'            ,	     'Madang',	'MD',	'MG');
INSERT INTO @tbl VALUES ('Manus'            ,	     'Manus',	'MN',	'MN');
INSERT INTO @tbl VALUES ('East Sepik'            ,	     'Maprik',	'ES',	'MP');
INSERT INTO @tbl VALUES ('Morobe'            ,	     'Markham',	'MR',	'KP');
INSERT INTO @tbl VALUES ('Southern Highlands'            ,	     'Mendi-Munihu',	'SL',	'MD');
INSERT INTO @tbl VALUES ('Morobe'            ,	     'Menyamya',	'MR',	'MY');
INSERT INTO @tbl VALUES ('Western'            ,	     'Middle Fly',	'WE',	'BM');
INSERT INTO @tbl VALUES ('Madang'            ,	     'Middle Ramu',	'MD',	'MR');
INSERT INTO @tbl VALUES ('Western Highlands'            ,	     'Mount Hagen',	'WL',	'HC');
INSERT INTO @tbl VALUES ('Western Highlands'            ,	     'Mul-Baiyer',	'WL',	'MB');
INSERT INTO @tbl VALUES ('New Ireland'            ,	     'Namatanai',	'NI',	'NA');
INSERT INTO @tbl VALUES ('National Capital District'            ,	     'National Capital District',	'NC',	'NC');
INSERT INTO @tbl VALUES ('Morobe'            ,	     'Nawae',	'MR',	'NW');
INSERT INTO @tbl VALUES ('Southern Highlands'            ,	     'Nipa-Kutubu',	'SL',	'NI');
INSERT INTO @tbl VALUES ('Bougainville'            ,	     'North Bougainville',	'NS',	'BK');
INSERT INTO @tbl VALUES ('Western'            ,	     'North Fly',	'WE',	'KI');
INSERT INTO @tbl VALUES ('Jiwaka'            ,	     'North Waghi',	'JI',	'NW');
INSERT INTO @tbl VALUES ('Sandaun'            ,	     'Nuku',	'SA',	'NU');
INSERT INTO @tbl VALUES ('Eastern Highlands'            ,	     'Obura-Wonenara',	'EH',	'OW');
INSERT INTO @tbl VALUES ('Eastern Highlands'            ,	     'Okapa',	'EH',	'OK');
INSERT INTO @tbl VALUES ('East New Britain'            ,	     'Pomio',	'EN',	'PM');
INSERT INTO @tbl VALUES ('East New Britain'            ,	     'Rabaul',	'EN',	'RL');
INSERT INTO @tbl VALUES ('Madang'            ,	     'Rai Coast',	'MD',	'RC');
INSERT INTO @tbl VALUES ('Central'            ,	     'Rigo',	'CE',	'RG');
INSERT INTO @tbl VALUES ('Milne Bay'            ,	     'Samarai-Murua',	'MB',	'SA');
INSERT INTO @tbl VALUES ('Chimbu'            ,	     'Sina Sina-Yonggomugl',	'CH',	'SN');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Sohe',	'NO',	'KK');
INSERT INTO @tbl VALUES ('Bougainville'            ,	     'South Bougainville',	'NS',	'BN');
INSERT INTO @tbl VALUES ('Western'            ,	     'South Fly',	'WE',	'DA');
INSERT INTO @tbl VALUES ('Madang'            ,	     'Sumkar',	'MD',	'KA');
INSERT INTO @tbl VALUES ('West New Britain'            ,	     'Talasea',	'WN',	'TL');
INSERT INTO @tbl VALUES ('Western Highlands'            ,	     'Tambul-Nebilyer',	'WL',	'TR');
INSERT INTO @tbl VALUES ('Hela'            ,	     'Tari-Pori',	'HE',	'TA');
INSERT INTO @tbl VALUES ('Sandaun'            ,	     'Telefomin',	'SA',	'TE');
INSERT INTO @tbl VALUES ('Morobe'            ,	     'Tewae-Siassi',	'MR',	'SS');
INSERT INTO @tbl VALUES ('Eastern Highlands'            ,	     'Unggai-Bena',	'EH',	'UB');
INSERT INTO @tbl VALUES ('Madang'            ,	     'Usino-Bundi',	'MD',	'UB');
INSERT INTO @tbl VALUES ('Sandaun'            ,	     'Vanimo-Green River',	'SA',	'VA');
INSERT INTO @tbl VALUES ('Enga'            ,	     'Wabag',	'EG',	'WB');
INSERT INTO @tbl VALUES ('Enga'            ,	     'Wapenamanda',	'EG',	'WP');
INSERT INTO @tbl VALUES ('East Sepik'            ,	     'Wewak',	'ES',	'WE');
INSERT INTO @tbl VALUES ('East Sepik'            ,	     'Wosera-Gawi',	'ES',	'WG');
INSERT INTO @tbl VALUES ('East Sepik'            ,	     'Yangoru-Saussia',	'ES',	'YS');

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

