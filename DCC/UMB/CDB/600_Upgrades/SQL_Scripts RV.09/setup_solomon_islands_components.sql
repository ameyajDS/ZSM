
/* ==================================================================================
    	Source File		:	setup_solomon_islands_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Solomon_Islands are set-up
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
WHERE	country_nm	=	'Solomon Islands';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Solomon_Islands not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Ward',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Malaita'            ,	     'Aba/Asimeuru',	'ML',	'AA');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Aiaisi',	'ML',	'AI');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Aimela',	'ML',	'AL');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Aola',	'GU',	'AO');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Areare',	'ML',	'AR');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Arosi East',	'MK',	'AE');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Arosi North',	'MK',	'AN');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Arosi South',	'MK',	'AS');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Arosi West',	'MK',	'AW');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Asimae',	'ML',	'AS');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Auki',	'ML',	'AU');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Avuavu',	'GU',	'AV');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Babatana',	'CH',	'BB');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Banagara',	'CH',	'BG');
INSERT INTO @tbl VALUES ('Central'            ,	     'Banika',	'CN',	'BA');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Baolo',	'IS',	'BA');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Batava',	'CH',	'BV');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Bauro Central',	'MK',	'BC');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Bauro East',	'MK',	'BE');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Bauro West',	'MK',	'BW');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Birao',	'GU',	'BI');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Buala',	'IS',	'BU');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Buma',	'ML',	'BU');
INSERT INTO @tbl VALUES ('Western'            ,	     'Central Ranongga',	'WE',	'CR');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Duff Islands',	'TE',	'DI');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Duidui',	'GU',	'DU');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'East Baegu',	'ML',	'EB');
INSERT INTO @tbl VALUES ('Rennell and Bellona'            ,	     'East Gaongau',	'RB',	'EG');
INSERT INTO @tbl VALUES ('Central'            ,	     'East Gela',	'CN',	'EG');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'East Ghaobata',	'GU',	'EG');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'East Tasimboko',	'GU',	'ET');
INSERT INTO @tbl VALUES ('Rennell and Bellona'            ,	     'East Tenggno',	'RB',	'ET');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Fauabu',	'ML',	'FA');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Faumamanu/Kwai',	'ML',	'FK');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Fenualoa',	'TE',	'FE');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Fo''ondo/Gwaiau',	'ML',	'FG');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Fouenda',	'ML',	'FO');
INSERT INTO @tbl VALUES ('Western'            ,	     'Gizo',	'WE',	'GI');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Graciosa Bay',	'TE',	'GB');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Gulalofou',	'ML',	'GU');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Haununu',	'MK',	'HA');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Hovikoilo',	'IS',	'HO');
INSERT INTO @tbl VALUES ('Western'            ,	     'Inner Short Islands',	'WE',	'IS');
INSERT INTO @tbl VALUES ('Western'            ,	     'Irringgila',	'WE',	'IR');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Japuana',	'IS',	'JA');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Kaloka',	'IS',	'KA');
INSERT INTO @tbl VALUES ('Rennell and Bellona'            ,	     'Kanara',	'RB',	'KA');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Katupika',	'CH',	'KA');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Keaimela/Radefasu',	'ML',	'KR');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Kerepagara',	'CH',	'KE');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Kia',	'IS',	'KI');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Kirugela',	'CH',	'KI');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Kmaga',	'IS',	'KM');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Kokota',	'IS',	'KK');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Kola''a Ridge',	'CT',	'HR');
INSERT INTO @tbl VALUES ('Western'            ,	     'Kolobaghea',	'WE',	'KO');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Kolokarako',	'GU',	'KO');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Kolomola',	'IS',	'KO');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Kolotubi',	'IS',	'KT');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Koviloko',	'IS',	'KV');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Kukum',	'CT',	'HK');
INSERT INTO @tbl VALUES ('Western'            ,	     'Kusaghe',	'WE',	'KU');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Kwarekwareo',	'ML',	'KW');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Langalanga',	'ML',	'LA');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Lipe/Temua',	'TE',	'LT');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Longgu',	'GU',	'LO');
INSERT INTO @tbl VALUES ('Central'            ,	     'Lovukol',	'CN',	'LO');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Luanua',	'ML',	'LU');
INSERT INTO @tbl VALUES ('Rennell and Bellona'            ,	     'Lughu',	'RB',	'LU');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Luva Station',	'TE',	'LS');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Malango',	'GU',	'MA');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Malu''u',	'ML',	'ML');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Mandalua/Folotana',	'ML',	'MF');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Manuopo',	'TE',	'MA');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Mareho',	'ML',	'MR');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Matakwalao',	'ML',	'MT');
INSERT INTO @tbl VALUES ('Rennell and Bellona'            ,	     'Matangi',	'RB',	'MA');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Mataniko',	'CT',	'HT');
INSERT INTO @tbl VALUES ('Western'            ,	     'Mbilua',	'WE',	'MB');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Mbuburu',	'CT',	'HB');
INSERT INTO @tbl VALUES ('Western'            ,	     'Mbuin Tusu',	'WE',	'MT');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Moli',	'GU',	'MO');
INSERT INTO @tbl VALUES ('Rennell and Bellona'            ,	     'Mugi Henua',	'RB',	'MH');
INSERT INTO @tbl VALUES ('Western'            ,	     'Munda',	'WE',	'MU');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Nafinua',	'ML',	'NA');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Naha',	'CT',	'HN');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Nanggu/Lord Howe',	'TE',	'NH');
INSERT INTO @tbl VALUES ('Western'            ,	     'Ndovele',	'WE',	'ND');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Nea/Noole',	'TE',	'NN');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Nenumpo',	'TE',	'NP');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Neo',	'TE',	'NE');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Nevenema',	'TE',	'NV');
INSERT INTO @tbl VALUES ('Western'            ,	     'Nggatokae',	'WE',	'NT');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Nggosi',	'CT',	'HG');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Nipua/Nopoli',	'TE',	'NI');
INSERT INTO @tbl VALUES ('Western'            ,	     'Nono',	'WE',	'NN');
INSERT INTO @tbl VALUES ('Western'            ,	     'Noro',	'WE',	'NO');
INSERT INTO @tbl VALUES ('Central'            ,	     'North East Gela',	'CN',	'NE');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'North East Santa Cruz',	'TE',	'CZ');
INSERT INTO @tbl VALUES ('Western'            ,	     'North Kolombangara',	'WE',	'NK');
INSERT INTO @tbl VALUES ('Western'            ,	     'North Ranongga',	'WE',	'NG');
INSERT INTO @tbl VALUES ('Western'            ,	     'North Rendova',	'WE',	'NR');
INSERT INTO @tbl VALUES ('Central'            ,	     'North Savo',	'CN',	'NS');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'North Ulawa',	'MK',	'NU');
INSERT INTO @tbl VALUES ('Western'            ,	     'North Vangunu',	'WE',	'NV');
INSERT INTO @tbl VALUES ('Central'            ,	     'North West Gela',	'CN',	'NW');
INSERT INTO @tbl VALUES ('Western'            ,	     'Nusa Roviana',	'WE',	'NU');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Outer Islands',	'TE',	'OI');
INSERT INTO @tbl VALUES ('Western'            ,	     'Outer Short Islands',	'WE',	'OS');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Panatina',	'CT',	'HP');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Paripao',	'GU',	'PA');
INSERT INTO @tbl VALUES ('Central'            ,	     'Pavuvu',	'CN',	'PA');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Pelau',	'ML',	'PE');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Point Cruz',	'CT',	'HC');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Polo',	'CH',	'PO');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Raroisu''u',	'ML',	'RA');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Rawo',	'MK',	'RA');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Rove/Lengakiki',	'CT',	'HL');
INSERT INTO @tbl VALUES ('Western'            ,	     'Roviana Lagoon',	'WE',	'RL');
INSERT INTO @tbl VALUES ('Rennell and Bellona'            ,	     'Sa''aiho',	'RB',	'SA');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Saghalu',	'GU',	'SG');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Samasodu',	'IS',	'SA');
INSERT INTO @tbl VALUES ('Central'            ,	     'Sandfly/Buenavista',	'CN',	'SB');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Santa Anna',	'MK',	'SA');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Santa Catalina',	'MK',	'SC');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Savulei',	'GU',	'SV');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Senga',	'CH',	'SE');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Siesie',	'ML',	'SS');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Sigana',	'IS',	'SI');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Sikaiana',	'ML',	'SN');
INSERT INTO @tbl VALUES ('Western'            ,	     'Simbo',	'WE',	'SI');
INSERT INTO @tbl VALUES ('Central'            ,	     'South East Gela',	'CN',	'SE');
INSERT INTO @tbl VALUES ('Western'            ,	     'South Kolobangara',	'WE',	'SK');
INSERT INTO @tbl VALUES ('Western'            ,	     'South Ranongga',	'WE',	'SG');
INSERT INTO @tbl VALUES ('Western'            ,	     'South Rendova',	'WE',	'SR');
INSERT INTO @tbl VALUES ('Central'            ,	     'South Savo',	'CN',	'SS');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'South Ulawa',	'MK',	'SU');
INSERT INTO @tbl VALUES ('Central'            ,	     'South West Gela',	'CN',	'SW');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Star Harbor North',	'MK',	'SN');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Star Harbor South',	'MK',	'SS');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Sububenu/Burianiasi',	'ML',	'SB');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Sulufou/Kwarande',	'ML',	'SK');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Susubona',	'IS',	'SU');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Susuka',	'CH',	'SU');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Tai',	'ML',	'TA');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Takwa',	'ML',	'TK');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Talise',	'GU',	'TL');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Tandai',	'GU',	'TD');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Tangarare',	'GU',	'TR');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Tatamba',	'IS',	'TA');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Tavula',	'CH',	'TA');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Tepazaka',	'CH',	'TE');
INSERT INTO @tbl VALUES ('Rennell and Bellona'            ,	     'Te Tau Gantogo',	'RB',	'TT');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Tetekangi',	'GU',	'TK');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Tikopia',	'TE',	'TI');
INSERT INTO @tbl VALUES ('Isabel'            ,	     'Tirotongana',	'IS',	'TI');
INSERT INTO @tbl VALUES ('Central'            ,	     'Tulagi',	'CN',	'TU');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Ugi and Pio',	'MK',	'UP');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Utupua',	'TE',	'UT');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Valasi',	'GU',	'VS');
INSERT INTO @tbl VALUES ('Temotu'            ,	     'Vanikoro',	'TE',	'VA');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Vasiduki',	'CH',	'VA');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Vatukulau',	'GU',	'VT');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Vavaea',	'CT',	'HV');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Viviru',	'CH',	'VI');
INSERT INTO @tbl VALUES ('Western'            ,	     'Vonavona',	'WE',	'VV');
INSERT INTO @tbl VALUES ('Western'            ,	     'Vonunu',	'WE',	'VN');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Vuhokesa',	'CT',	'HS');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Vulolo',	'GU',	'VO');
INSERT INTO @tbl VALUES ('Honiara'            ,	     'Vura',	'CT',	'HU');
INSERT INTO @tbl VALUES ('Choiseul'            ,	     'Wagina',	'CH',	'WA');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Wainoni East',	'MK',	'WE');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Wainoni West',	'MK',	'WW');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'Wanderer Bay',	'GU',	'WB');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Waneagu Silana Sina',	'ML',	'WS');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'Waneagu/Taelanasina',	'ML',	'WT');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'Weather Coast',	'MK',	'WC');
INSERT INTO @tbl VALUES ('Malaita'            ,	     'West Baegu/Fataleka',	'ML',	'WB');
INSERT INTO @tbl VALUES ('Rennell and Bellona'            ,	     'West Gaongau',	'RB',	'WG');
INSERT INTO @tbl VALUES ('Central'            ,	     'West Gela',	'CN',	'WG');
INSERT INTO @tbl VALUES ('Guadalcanal'            ,	     'West Ghaobata',	'GU',	'WG');
INSERT INTO @tbl VALUES ('Rennell and Bellona'            ,	     'West Tenggno',	'RB',	'WT');
INSERT INTO @tbl VALUES ('Makira Ulawa'            ,	     'West Ulawa',	'MK',	'WU');

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

