
/* ==================================================================================
    	Source File		:	setup_uzbekistan_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Uzbekistan are set-up
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
WHERE	country_nm	=	'Uzbekistan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Uzbekistan not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Tashkent City'            ,	     'Akmal Ikromov',	'TK',	'AK');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Amudaryo',	'QR',	'AM');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Andijon',	'AN',	'AN');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Angor',	'SU',	'AN');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Angren',	'TA',	'AN');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Arnasoy',	'JI',	'AR');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Asaka',	'AN',	'AC');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Bahoriston',	'QA',	'BO');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Baliqchi',	'AN',	'BA');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Bandixon',	'SU',	'BA');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Baxmal',	'JI',	'BA');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Baxt',	'SI',	'BA');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Bekobod',	'TA',	'BD');
INSERT INTO @tbl VALUES ('Tashkent City'            ,	     'Bektemir',	'TK',	'BE');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Beruniy',	'QR',	'BD');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Beshariq',	'FA',	'BE');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Bog''dod',	'FA',	'BA');
INSERT INTO @tbl VALUES ('Xorazm'            ,	     'Bog''ot',	'KH',	'BO');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Bo''ka',	'TA',	'BK');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Bo''stonliq',	'TA',	'BL');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Boyovut',	'SI',	'BO');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Boysun',	'SU',	'BO');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Bo''zatov',	'QR',	'BO');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Bo''zsuv',	'AN',	'BO');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Buloqboshi',	'AN',	'BU');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Bulung''ur',	'SA',	'BU');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Buvayda',	'FA',	'BU');
INSERT INTO @tbl VALUES ('Buxoro'            ,	     'Buxoro',	'BU',	'BC');
INSERT INTO @tbl VALUES ('Tashkent City'            ,	     'Chilonzor',	'TK',	'CH');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Chimboy',	'QR',	'CC');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Chinoz',	'TA',	'CZ');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Chirchiq',	'TA',	'CQ');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Chiroqchi',	'QA',	'CH');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'Chortoq',	'NG',	'CR');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'Chust',	'NG',	'CS');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Dang''ara',	'FA',	'DA');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Dashtobod',	'JI',	'DA');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Dehqonobod',	'QA',	'DE');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Denov',	'SU',	'DD');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Do''stlik',	'JI',	'DO');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Ellikqala',	'QR',	'EL');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Farg''ona',	'FA',	'FD');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Forish',	'JI',	'FO');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Furqat',	'FA',	'FU');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'G''allaorol',	'JI',	'GA');
INSERT INTO @tbl VALUES ('Buxoro'            ,	     'G''ijduvon',	'BU',	'GC');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Guliston',	'SI',	'GD');
INSERT INTO @tbl VALUES ('Xorazm'            ,	     'Gurlan',	'KH',	'GU');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'G''uzor',	'QA',	'GU');
INSERT INTO @tbl VALUES ('Tashkent City'            ,	     'Hamza',	'TK',	'HA');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'Haqqulobod',	'NG',	'HA');
INSERT INTO @tbl VALUES ('Xorazm'            ,	     'Hazorasp',	'KH',	'HA');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Ishtixon',	'SA',	'IS');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Izboskan',	'AN',	'IZ');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Jalolquduq',	'AN',	'JA');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Jarqo''rg''on',	'SU',	'JA');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Jizzax',	'JI',	'JD');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Jomboy',	'SA',	'JO');
INSERT INTO @tbl VALUES ('Buxoro'            ,	     'Jondor',	'BU',	'JO');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Kasbi',	'QA',	'KA');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Kattaqo''rg''on',	'SA',	'KD');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Kegeyli',	'QR',	'KE');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Kitob',	'QA',	'KI');
INSERT INTO @tbl VALUES ('Buxoro'            ,	     'Kogon',	'BU',	'KC');
INSERT INTO @tbl VALUES ('Navoi'            ,	     'Konimex',	'NW',	'KO');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Koson',	'QA',	'KO');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'Kosonsoy',	'NG',	'KD');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Marg''ilon',	'FA',	'MA');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Marhamat',	'AN',	'MA');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Mehnatobod',	'SI',	'ME');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'Mingbuloq',	'NG',	'MI');
INSERT INTO @tbl VALUES ('Tashkent City'            ,	     'Mirobod',	'TK',	'MB');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Mirzacho''l',	'JI',	'MI');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Mirzaobod',	'SI',	'MI');
INSERT INTO @tbl VALUES ('Tashkent City'            ,	     'Mirzo Ulug''bek',	'TK',	'MU');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Mo''ynoq',	'QR',	'MO');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Muborak',	'QA',	'MU');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Muzrabot',	'SU',	'MU');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'Namangan',	'NG',	'ND');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Narpay',	'SA',	'NA');
INSERT INTO @tbl VALUES ('Navoi'            ,	     'Navbahor',	'NW',	'NA');
INSERT INTO @tbl VALUES ('Navoi'            ,	     'Navoiy',	'NW',	'ND');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Nishon',	'QA',	'NI');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'Norin',	'NG',	'NO');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Nukus',	'QR',	'ND');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Nurobod',	'SA',	'NU');
INSERT INTO @tbl VALUES ('Navoi'            ,	     'Nurota',	'NW',	'NU');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Ohangaron',	'TA',	'OD');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Olmaliq',	'TA',	'OL');
INSERT INTO @tbl VALUES ('Buxoro'            ,	     'Olot',	'BU',	'OL');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Oltiariq',	'FA',	'OL');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Oltinko''l',	'AN',	'OL');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Oltinsoy',	'SU',	'OL');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Oqdaryo',	'SA',	'OD');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Oqoltin',	'SI',	'OQ');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Oqqo''rg''on',	'TA',	'OQ');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Oqtosh',	'SA',	'OT');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'O''rtachirchiq',	'TA',	'OT');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Oxunboboev',	'FA',	'OX');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'O''zbekiston',	'FA',	'OZ');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Parkent',	'TA',	'PA');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Pastdarg''om',	'SA',	'PD');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Paxtachi',	'SA',	'PX');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Paxtakor',	'JI',	'PA');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Paxtaobod',	'AN',	'PA');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Payariq',	'SA',	'PY');
INSERT INTO @tbl VALUES ('Buxoro'            ,	     'Peshku',	'BU',	'PE');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Piskent',	'TA',	'PI');
INSERT INTO @tbl VALUES ('Xorazm'            ,	     'Pitnak',	'KH',	'PI');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'Pop',	'NG',	'PO');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Qamashi',	'QA',	'QA');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Qanliko''l',	'QR',	'QA');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Qarshi',	'QA',	'QD');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Qibray',	'TA',	'QI');
INSERT INTO @tbl VALUES ('Navoi'            ,	     'Qiziltepa',	'NW',	'QI');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Qiziriq',	'SU',	'QI');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Qo''ng''irot',	'QR',	'QC');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Qo''qon',	'FA',	'QO');
INSERT INTO @tbl VALUES ('Buxoro'            ,	     'Qorako''l',	'BU',	'QK');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Qorao''zak',	'QR',	'QO');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Qorasuv',	'AN',	'QS');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Qo''rg''ontepa',	'AN',	'QT');
INSERT INTO @tbl VALUES ('Buxoro'            ,	     'Qorovulbozor',	'BU',	'QV');
INSERT INTO @tbl VALUES ('Xorazm'            ,	     'Qo''shko''pir',	'KH',	'QO');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Qo''shrabot',	'SA',	'QO');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Qumqo''rg''on',	'SU',	'QU');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Quva',	'FA',	'QD');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Quvasoy',	'FA',	'QS');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Quyichirchiq',	'TA',	'QU');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Rishton',	'FA',	'RI');
INSERT INTO @tbl VALUES ('Buxoro'            ,	     'Romitan',	'BU',	'RO');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Samarqand',	'SA',	'SD');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Sariosiyo',	'SU',	'SA');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Sayxunobod',	'SI',	'SA');
INSERT INTO @tbl VALUES ('Tashkent City'            ,	     'Sergeli',	'TK',	'SE');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Shahrisabz',	'QA',	'SD');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Shahrixon',	'AN',	'SD');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Sharof Rashidov',	'SI',	'SR');
INSERT INTO @tbl VALUES ('Tashkent City'            ,	     'Shayxontohur',	'TK',	'SH');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Sherobod',	'SU',	'SB');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Shirin',	'SI',	'SH');
INSERT INTO @tbl VALUES ('Buxoro'            ,	     'Shofirkon',	'BU',	'SH');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Sho''rchi',	'SU',	'SC');
INSERT INTO @tbl VALUES ('Xorazm'            ,	     'Shovot',	'KH',	'SH');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Shumanay',	'QR',	'SH');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Sirdaryo',	'SI',	'SC');
INSERT INTO @tbl VALUES ('Tashkent City'            ,	     'Sobir Rahimov',	'TK',	'SO');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'So''x',	'FA',	'SO');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Taxiatosh',	'QR',	'TT');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Taxtako''pir',	'QR',	'TK');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Termiz',	'SU',	'TD');
INSERT INTO @tbl VALUES ('Navoi'            ,	     'Tomdi',	'NW',	'TO');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'To''raqo''rg''on',	'NG',	'TO');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'To''rtko''l',	'QR',	'TD');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Toshkent',	'TA',	'TO');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Toshloq',	'FA',	'TO');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Toyloq',	'SA',	'TO');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Uchko''prik',	'FA',	'UC');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'Uchqo''rg''on',	'NG',	'UD');
INSERT INTO @tbl VALUES ('Navoi'            ,	     'Uchquduq',	'NW',	'UD');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Ulug''nor',	'AN',	'UL');
INSERT INTO @tbl VALUES ('Xorazm'            ,	     'Urganch',	'KH',	'UD');
INSERT INTO @tbl VALUES ('Samarkand'            ,	     'Urgut',	'SA',	'UD');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Usmon Yusupov',	'QA',	'US');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'Uychi',	'NG',	'UY');
INSERT INTO @tbl VALUES ('Surxondaryo'            ,	     'Uzun',	'SU',	'UZ');
INSERT INTO @tbl VALUES ('Buxoro'            ,	     'Vobkent',	'BU',	'VO');
INSERT INTO @tbl VALUES ('Navoi'            ,	     'Xatirchi',	'NW',	'XA');
INSERT INTO @tbl VALUES ('Xorazm'            ,	     'Xiva',	'KH',	'XC');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Xo''jaobod',	'AN',	'XJ');
INSERT INTO @tbl VALUES ('Karakalpakstan'            ,	     'Xo''jayli',	'QR',	'XD');
INSERT INTO @tbl VALUES ('Andijon'            ,	     'Xonobod',	'AN',	'XN');
INSERT INTO @tbl VALUES ('Xorazm'            ,	     'Xonqa',	'KH',	'XO');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Xovos',	'SI',	'XO');
INSERT INTO @tbl VALUES ('Namangan'            ,	     'Yagiqo''rg''on',	'NG',	'YA');
INSERT INTO @tbl VALUES ('Kashkadarya'            ,	     'Yakkabog''',	'QA',	'YA');
INSERT INTO @tbl VALUES ('Tashkent City'            ,	     'Yakkasaroy',	'TK',	'YA');
INSERT INTO @tbl VALUES ('Xorazm'            ,	     'Yangiariq',	'KH',	'YR');
INSERT INTO @tbl VALUES ('Xorazm'            ,	     'Yangibozor',	'KH',	'YB');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Yangiobod',	'TA',	'YA');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Yangiobod',	'JI',	'YA');
INSERT INTO @tbl VALUES ('Sirdaryo'            ,	     'Yangiyer',	'SI',	'YA');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Yangiyo''l',	'TA',	'YD');
INSERT INTO @tbl VALUES ('Farg`ona'            ,	     'Yozyovon',	'FA',	'YO');
INSERT INTO @tbl VALUES ('Tashkent City'            ,	     'Yunusobod',	'TK',	'YU');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Yuqorichirchiq',	'TA',	'YU');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Zafarobod',	'JI',	'ZF');
INSERT INTO @tbl VALUES ('Tashkent'            ,	     'Zangiota',	'TA',	'ZA');
INSERT INTO @tbl VALUES ('Navoi'            ,	     'Zarafshon',	'NW',	'ZA');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Zarbdor',	'JI',	'ZD');
INSERT INTO @tbl VALUES ('Jizzax'            ,	     'Zomin',	'JI',	'ZO');

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

