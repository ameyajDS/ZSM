
/* ==================================================================================
    	Source File		:	setup_estonia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Estonia are set-up
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
WHERE	country_nm	=	'Estonia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Estonia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'County',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Abja',	'VD',	'AJ');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Aegviidu',	'HA',	'AE');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Ahja',	'PL',	'AH');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Alajoe',	'IV',	'AL');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Alatskivi',	'TA',	'AL');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Albu',	'JR',	'AL');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Ambla',	'JR',	'AM');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Anija',	'HA',	'AN');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Antsla',	'VR',	'AN');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Are',	'PR',	'AR');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Aseri',	'IV',	'AS');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Audru',	'PR',	'AU');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Avanduse',	'LV',	'AV');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Avinurme',	'IV',	'AV');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Elva',	'TA',	'EL');
INSERT INTO @tbl VALUES ('Hiiu'            ,	     'Emmaste',	'HI',	'EM');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Haademeeste',	'PR',	'HM');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Haanja',	'VR',	'HA');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Haapsalu',	'LN',	'HP');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Haaslava',	'TA',	'HA');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Halinga',	'PR',	'HL');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Haljala',	'LV',	'HA');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Halliste',	'VD',	'HA');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Hanila',	'LN',	'HN');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Harku',	'HA',	'HA');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Helme',	'VG',	'HE');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Hummuli',	'VG',	'HU');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Iisaku',	'IV',	'II');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Illuka',	'IV',	'IL');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Imavere',	'JR',	'IM');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Jarva-Jaani',	'JR',	'JA');
INSERT INTO @tbl VALUES ('Rapla'            ,	     'Jarvakandi',	'RA',	'JA');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Joelahtme',	'HA',	'JO');
INSERT INTO @tbl VALUES ('Jogeva'            ,	     'Jogeva',	'JN',	'JL');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Johvi',	'IV',	'JL');
INSERT INTO @tbl VALUES ('Rapla'            ,	     'Juuru',	'RA',	'JU');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Kaarma',	'SA',	'KM');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Kabala',	'JR',	'KB');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Kadrina',	'LV',	'KA');
INSERT INTO @tbl VALUES ('Hiiu'            ,	     'Kaina',	'HI',	'KN');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Kaisma',	'PR',	'KA');
INSERT INTO @tbl VALUES ('Rapla'            ,	     'Kaiu',	'RA',	'KA');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Kallaste',	'TA',	'KL');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Kambja',	'TA',	'KM');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Kanepi',	'PL',	'KA');
INSERT INTO @tbl VALUES ('Hiiu'            ,	     'Kardla',	'HI',	'KR');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Kareda',	'JR',	'KR');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Karksi',	'VD',	'KK');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Karla',	'SA',	'KL');
INSERT INTO @tbl VALUES ('Rapla'            ,	     'Karu',	'RA',	'KR');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Karula',	'VG',	'KA');
INSERT INTO @tbl VALUES ('Jogeva'            ,	     'Kasepaa',	'JN',	'KA');
INSERT INTO @tbl VALUES ('Rapla'            ,	     'Kehtna',	'RA',	'KE');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Keila',	'HA',	'KL');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Kernu',	'HA',	'KR');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Kihelkonna',	'SA',	'KI');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Kihnu',	'PR',	'KI');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Kiili',	'HA',	'KI');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Kilingi-Nomme',	'PR',	'KN');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Kivioli',	'IV',	'KI');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Koeru',	'JR',	'KO');
INSERT INTO @tbl VALUES ('Rapla'            ,	     'Kohila',	'RA',	'KO');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Kohtla',	'IV',	'KV');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Kohtla-Jarve',	'IV',	'KJ');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Kohtla-Nomme',	'IV',	'KN');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Koigi',	'JR',	'KG');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Kolga-Jaani',	'VD',	'KJ');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Kolleste',	'PL',	'KO');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Konguta',	'TA',	'KO');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Koo',	'VD',	'KO');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Koonga',	'PR',	'KO');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Kopu',	'VD',	'KP');
INSERT INTO @tbl VALUES ('Hiiu'            ,	     'Korgessaare',	'HI',	'KO');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Kose',	'HA',	'KS');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Koue',	'HA',	'KO');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Kullamaa',	'LN',	'KU');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Kunda',	'LV',	'KU');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Kuressaare',	'SA',	'KU');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Kuusalu',	'HA',	'KU');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Laekvere',	'LV',	'LA');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Laeva',	'TA',	'LA');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Laheda',	'PL',	'LA');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Laimjala',	'SA',	'LA');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Lasva',	'VR',	'LA');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Lavassaare',	'PR',	'LA');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Lehtse',	'JR',	'LE');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Leisi',	'SA',	'LE');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Lihula',	'LN',	'LH');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Lohusuu',	'IV',	'LO');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Loksa',	'HA',	'LL');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Luganuse',	'IV',	'LU');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Lumanda',	'SA',	'LU');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Luunja',	'TA',	'LU');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Maardu',	'HA',	'MA');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Maetaguse',	'IV',	'MG');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Maidla',	'IV',	'MD');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Maksa',	'TA',	'MA');
INSERT INTO @tbl VALUES ('Rapla'            ,	     'Marjamaa',	'RA',	'MA');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Martna',	'LN',	'MA');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Meeksi',	'TA',	'ME');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Meremae',	'VR',	'ME');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Mikitamae',	'PL',	'MI');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Misso',	'VR',	'MI');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Moisakula',	'VD',	'MO');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Moniste',	'VR',	'MO');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Mooste',	'PL',	'MO');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Muhu',	'SA',	'MH');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Mustjala',	'SA',	'MS');
INSERT INTO @tbl VALUES ('Jogeva'            ,	     'Mustvee',	'JN',	'MU');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Narva',	'IV',	'NA');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Narva-Joesuu',	'IV',	'NJ');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Nissi',	'HA',	'NI');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Noarootsi',	'LN',	'NO');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Noo',	'TA',	'NO');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Nova',	'LN',	'NV');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Oisu',	'JR',	'OI');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Olustvere',	'VD',	'OL');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Orava',	'PL',	'OR');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Orissaare',	'SA',	'OR');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Oru',	'VG',	'OR');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Oru',	'LN',	'OR');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Otepaa',	'VG',	'OT');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Padise',	'HA',	'PE');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Paide',	'JR',	'PL');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Paikuse',	'PR',	'PA');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Paistu',	'VD',	'PU');
INSERT INTO @tbl VALUES ('Jogeva'            ,	     'Pajusi',	'JN',	'PJ');
INSERT INTO @tbl VALUES ('Jogeva'            ,	     'Pala',	'JN',	'PA');
INSERT INTO @tbl VALUES ('Jogeva'            ,	     'Palamuse',	'JN',	'PM');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Paldiski',	'HA',	'PL');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Palupera',	'VG',	'PA');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Parnu',	'PR',	'PR');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Parsti',	'VD',	'PR');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Peipsiaare',	'TA',	'PE');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Pihtla',	'SA',	'PI');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Piirissaare',	'TA',	'PI');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Podrala',	'VG',	'PO');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Poide',	'SA',	'PO');
INSERT INTO @tbl VALUES ('Jogeva'            ,	     'Poltsamaa',	'JN',	'PL');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Polva',	'PL',	'PL');
INSERT INTO @tbl VALUES ('Hiiu'            ,	     'Puhalepa',	'HI',	'PU');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Puhja',	'TA',	'PU');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Puka',	'VG',	'PU');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Pussi',	'IV',	'PU');
INSERT INTO @tbl VALUES ('Jogeva'            ,	     'Puurmani',	'JN',	'PU');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Raasiku',	'HA',	'RS');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Rae',	'HA',	'RE');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Ragavere',	'LV',	'RG');
INSERT INTO @tbl VALUES ('Rapla'            ,	     'Raikkula',	'RA',	'RK');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Rakke',	'LV',	'RK');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Rakvere',	'LV',	'RL');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Rannu',	'TA',	'RA');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Rapina',	'PL',	'RA');
INSERT INTO @tbl VALUES ('Rapla'            ,	     'Rapla',	'RA',	'RP');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Ridala',	'LN',	'RD');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Risti',	'LN',	'RS');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Rongu',	'TA',	'RO');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Roosna-Alliku',	'JR',	'RO');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Rouge',	'VR',	'RO');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Ruhnu',	'SA',	'RU');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Saarde',	'PR',	'SR');
INSERT INTO @tbl VALUES ('Jogeva'            ,	     'Saare',	'JN',	'SA');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Saarepeedi',	'VD',	'SA');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Saksi',	'LV',	'SA');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Saku',	'HA',	'SK');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Salme',	'SA',	'SA');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Sangaste',	'VG',	'SA');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Saue',	'HA',	'SL');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Sauga',	'PR',	'SG');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Sillamae',	'IV',	'SI');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Sindi',	'PR',	'SI');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Somerpalu',	'VR',	'SO');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Someru',	'LV',	'SO');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Sonda',	'IV',	'SO');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Surju',	'PR',	'SU');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Suure-Jaani',	'VD',	'SL');
INSERT INTO @tbl VALUES ('Jogeva'            ,	     'Tabivere',	'JN',	'TA');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Taebla',	'LN',	'TA');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Taheva',	'VG',	'TA');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Tahkuranna',	'PR',	'TK');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Tahtvere',	'TA',	'TA');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Tali',	'PR',	'TL');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Tallinn',	'HA',	'TA');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Tamsalu',	'LV',	'TL');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Tapa',	'LV',	'TP');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Tartu',	'TA',	'TL');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Tarvastu',	'VD',	'TA');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Toila',	'IV',	'TO');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Tolliste',	'VG',	'TL');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Tootsi',	'PR',	'TT');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Torgu',	'SA',	'TO');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Tori',	'PR',	'TR');
INSERT INTO @tbl VALUES ('Jogeva'            ,	     'Torma',	'JN',	'TO');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Torva',	'VG',	'TR');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Tostamaa',	'PR',	'TS');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Tudulinna',	'IV',	'TU');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Turi',	'JR',	'TL');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Ulenurme',	'TA',	'UL');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Urvaste',	'VR',	'UR');
INSERT INTO @tbl VALUES ('Jarva'            ,	     'Vaatsa',	'JR',	'VA');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Vaike-Maarja',	'LV',	'VM');
INSERT INTO @tbl VALUES ('Ida-Viru'            ,	     'Vaivara',	'IV',	'VA');
INSERT INTO @tbl VALUES ('Valga'            ,	     'Valga',	'VG',	'VA');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Valgjarve',	'PL',	'VA');
INSERT INTO @tbl VALUES ('Saare'            ,	     'Valjala',	'SA',	'VA');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Vandra',	'PR',	'VD');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Vandra vald (alev)',	'PR',	'VA');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Vara',	'TA',	'VA');
INSERT INTO @tbl VALUES ('Parnu'            ,	     'Varbla',	'PR',	'VB');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Varska',	'PL',	'VR');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Varstu',	'VR',	'VR');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Vasalemma',	'HA',	'VA');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Vastemoisa',	'VD',	'VA');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Vastse-Kuuste',	'PL',	'VK');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Vastseliina',	'VR',	'VS');
INSERT INTO @tbl VALUES ('Polva'            ,	     'Veriora',	'PL',	'VE');
INSERT INTO @tbl VALUES ('Rapla'            ,	     'Vigala',	'RA',	'VI');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Vihula',	'LV',	'VH');
INSERT INTO @tbl VALUES ('Harju'            ,	     'Viimsi',	'HA',	'VI');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Viiratsi',	'VD',	'VR');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Viljandi',	'VD',	'VJ');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Vinni',	'LV',	'VI');
INSERT INTO @tbl VALUES ('Laane-Viru'            ,	     'Viru-Nigula',	'LV',	'VN');
INSERT INTO @tbl VALUES ('Viljandi'            ,	     'Vohma',	'VD',	'VO');
INSERT INTO @tbl VALUES ('Tartu'            ,	     'Vonnu',	'TA',	'VO');
INSERT INTO @tbl VALUES ('Laane'            ,	     'Vormsi',	'LN',	'VO');
INSERT INTO @tbl VALUES ('Voru'            ,	     'Voru',	'VR',	'VL');

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

