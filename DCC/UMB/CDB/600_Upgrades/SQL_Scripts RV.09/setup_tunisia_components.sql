
/* ==================================================================================
    	Source File		:	setup_tunisia_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Tunisia are set-up
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
WHERE	country_nm	=	'Tunisia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Tunisia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Governorate',
		level_2_address_component	=	'Delegation',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Sfax'            ,	     'Agareb',	'SF',	'AG');
INSERT INTO @tbl VALUES ('Jendouba'            ,	     'Ain Draham',	'JE',	'AD');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Akouda',	'SS',	'AK');
INSERT INTO @tbl VALUES ('Kairouan'            ,	     'Alaa',	'KR',	'AL');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'El Alia',	'BZ',	'AL');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Amdoun',	'BJ',	'AM');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'El Amra',	'SF',	'AM');
INSERT INTO @tbl VALUES ('Ariana'            ,	     'Ariana Medina',	'AN',	'AR');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Ayoun',	'KS',	'AY');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Bab Bhar',	'TU',	'BB');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Bab Souika',	'TU',	'BS');
INSERT INTO @tbl VALUES ('Jendouba'            ,	     'Balta Bou Aouane',	'JE',	'BB');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Bardo',	'TU',	'LB');
INSERT INTO @tbl VALUES ('Siliana'            ,	     'Bargou',	'SL',	'BA');
INSERT INTO @tbl VALUES ('Manouba'            ,	     'El Battan',	'MN',	'BT');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Beja Nord',	'BJ',	'BN');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Beja Sud',	'BJ',	'BS');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Bekalta',	'MS',	'BK');
INSERT INTO @tbl VALUES ('Gafsa'            ,	     'Belkhir',	'GF',	'BE');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Bembla',	'MS',	'BM');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'Ben Arous',	'BA',	'BA');
INSERT INTO @tbl VALUES ('Medenine'            ,	     'Ben Guerdane',	'ME',	'BG');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Beni Hassen',	'MS',	'BH');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Beni Khalled',	'NB',	'BD');
INSERT INTO @tbl VALUES ('Medenine'            ,	     'Beni Khedache',	'ME',	'BK');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Beni Khiar',	'NB',	'BR');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Bir Ali Ben Khelifa',	'SF',	'BA');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Bir El Hfay',	'SZ',	'BH');
INSERT INTO @tbl VALUES ('Tataouine'            ,	     'Bir Lahmar',	'TA',	'BL');
INSERT INTO @tbl VALUES ('Zaghouan'            ,	     'Bir Mchergua',	'ZA',	'BM');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Bizerte Nord',	'BZ',	'BN');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Bizerte Sud',	'BZ',	'BS');
INSERT INTO @tbl VALUES ('Manouba'            ,	     'Borj El Amri',	'MN',	'BA');
INSERT INTO @tbl VALUES ('Siliana'            ,	     'Bouarada',	'SL',	'BD');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Bou Argoub',	'NB',	'BA');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Bouficha',	'SS',	'BO');
INSERT INTO @tbl VALUES ('Kairouan'            ,	     'Bouhajla',	'KR',	'SA');
INSERT INTO @tbl VALUES ('Mahdia'            ,	     'Boumerdes',	'MH',	'BO');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'Boumhel',	'BA',	'BE');
INSERT INTO @tbl VALUES ('Siliana'            ,	     'Bourouis',	'SL',	'BR');
INSERT INTO @tbl VALUES ('Jendouba'            ,	     'Bousalem',	'JE',	'BS');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Carthage',	'TU',	'CA');
INSERT INTO @tbl VALUES ('Mahdia'            ,	     'Chebba',	'MH',	'CB');
INSERT INTO @tbl VALUES ('Kairouan'            ,	     'Chebika',	'KR',	'CB');
INSERT INTO @tbl VALUES ('Mahdia'            ,	     'Chorbane',	'MH',	'CR');
INSERT INTO @tbl VALUES ('Kairouan'            ,	     'Chrarda',	'KR',	'CR');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Cite El Khadra',	'TU',	'KH');
INSERT INTO @tbl VALUES ('Le Kef'            ,	     'Dahmani',	'KF',	'DA');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Dar Chaabane El Fehri',	'NB',	'DC');
INSERT INTO @tbl VALUES ('Tozeur'            ,	     'Degueche',	'TO',	'DE');
INSERT INTO @tbl VALUES ('Tataouine'            ,	     'Dhiba',	'TA',	'DH');
INSERT INTO @tbl VALUES ('Medenine'            ,	     'Djerba Ajim',	'ME',	'DA');
INSERT INTO @tbl VALUES ('Medenine'            ,	     'Djerba Houmet Essouk',	'ME',	'DH');
INSERT INTO @tbl VALUES ('Medenine'            ,	     'Djerba Midoun',	'ME',	'DM');
INSERT INTO @tbl VALUES ('Manouba'            ,	     'Douar Hicher',	'MN',	'DH');
INSERT INTO @tbl VALUES ('Kebili'            ,	     'Douz Nord',	'KB',	'DN');
INSERT INTO @tbl VALUES ('Kebili'            ,	     'Douz Sud',	'KB',	'DS');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Enfidha',	'SS',	'EN');
INSERT INTO @tbl VALUES ('Le Kef'            ,	     'Es Sers',	'KF',	'ES');
INSERT INTO @tbl VALUES ('Ariana'            ,	     'Ettadhamen',	'AN',	'ET');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'Ezzahra',	'BA',	'EZ');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Ezzouhour',	'TU',	'EZ');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Ezzouhour',	'KS',	'EZ');
INSERT INTO @tbl VALUES ('Zaghouan'            ,	     'Fahs',	'ZA',	'FA');
INSERT INTO @tbl VALUES ('Kebili'            ,	     'Faouar',	'KB',	'FA');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Feriana',	'KS',	'FE');
INSERT INTO @tbl VALUES ('Jendouba'            ,	     'Fernana',	'JE',	'FE');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'Fouchana',	'BA',	'FO');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Foussana',	'KS',	'FO');
INSERT INTO @tbl VALUES ('Siliana'            ,	     'Gaafour',	'SL',	'GA');
INSERT INTO @tbl VALUES ('Gabes'            ,	     'Gabes Ouest',	'GB',	'GO');
INSERT INTO @tbl VALUES ('Gabes'            ,	     'Gabes Sud',	'GB',	'GS');
INSERT INTO @tbl VALUES ('Gabes'            ,	     'Gabes Medina',	'GB',	'GV');
INSERT INTO @tbl VALUES ('Gafsa'            ,	     'Gafsa Nord',	'GF',	'GN');
INSERT INTO @tbl VALUES ('Gafsa'            ,	     'Gafsa Sud',	'GF',	'GS');
INSERT INTO @tbl VALUES ('Gabes'            ,	     'Ghannouch',	'GB',	'GA');
INSERT INTO @tbl VALUES ('Jendouba'            ,	     'Ghardimaou',	'JE',	'GH');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Ghar El Melh',	'BZ',	'GM');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Ghazala',	'BZ',	'GH');
INSERT INTO @tbl VALUES ('Tataouine'            ,	     'Ghomrassen',	'TA',	'GH');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'El Ghraiba',	'SF',	'GH');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Goubellat',	'BJ',	'GO');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'La Goulette',	'TU',	'LG');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Grombalia',	'NB',	'GR');
INSERT INTO @tbl VALUES ('Gafsa'            ,	     'Guetar',	'GF',	'GU');
INSERT INTO @tbl VALUES ('Kairouan'            ,	     'Haffouz',	'KR',	'HF');
INSERT INTO @tbl VALUES ('Kairouan'            ,	     'Hajeb El Ayoun',	'KR',	'HA');
INSERT INTO @tbl VALUES ('Gabes'            ,	     'Hamma',	'GB',	'HA');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'Hammam Chott',	'BA',	'HC');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Hammamet',	'NB',	'HM');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Hammam Ghezaz',	'NB',	'HG');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'Hammam Lif',	'BA',	'HL');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Hammam Sousse',	'SS',	'HS');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Haouaria',	'NB',	'HR');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Hassi El Ferid',	'KS',	'HF');
INSERT INTO @tbl VALUES ('Tozeur'            ,	     'Hazoua',	'TO',	'HA');
INSERT INTO @tbl VALUES ('Mahdia'            ,	     'Hbira',	'MH',	'HB');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Hencha',	'SF',	'HA');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Hergla',	'SS',	'HE');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Hidra',	'KS',	'HI');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Hrairia',	'TU',	'HA');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Jammel',	'MS',	'JA');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Jebel Jelloud',	'TU',	'JJ');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Jebeniana',	'SF',	'DJ');
INSERT INTO @tbl VALUES ('Manouba'            ,	     'Jedaida',	'MN',	'JE');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Jedeliane',	'KS',	'DJ');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Jelma',	'SZ',	'JI');
INSERT INTO @tbl VALUES ('Mahdia'            ,	     'El Jem',	'MH',	'JE');
INSERT INTO @tbl VALUES ('Jendouba'            ,	     'Jendouba Nord',	'JE',	'JN');
INSERT INTO @tbl VALUES ('Jendouba'            ,	     'Jendouba Sud',	'JE',	'JE');
INSERT INTO @tbl VALUES ('Le Kef'            ,	     'Jerissa',	'KF',	'JE');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Joumine',	'BZ',	'JO');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Kabaria',	'TU',	'KA');
INSERT INTO @tbl VALUES ('Kairouan'            ,	     'Kairouan Nord',	'KR',	'KN');
INSERT INTO @tbl VALUES ('Kairouan'            ,	     'Kairouan Sud',	'KR',	'KS');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Kalaa Kebira',	'SS',	'KK');
INSERT INTO @tbl VALUES ('Le Kef'            ,	     'Kalaa Khesba',	'KF',	'KR');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Kalaa Sghira',	'SS',	'KS');
INSERT INTO @tbl VALUES ('Ariana'            ,	     'Kalaat El Andalous',	'AN',	'KA');
INSERT INTO @tbl VALUES ('Le Kef'            ,	     'Kalaat Senan',	'KF',	'KS');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Kasserine Nord',	'KS',	'KN');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Kasserine Sud',	'KS',	'KS');
INSERT INTO @tbl VALUES ('Kebili'            ,	     'Kebili Nord',	'KB',	'KN');
INSERT INTO @tbl VALUES ('Kebili'            ,	     'Kebili Sud',	'KB',	'KS');
INSERT INTO @tbl VALUES ('Le Kef'            ,	     'Kef Est',	'KF',	'KE');
INSERT INTO @tbl VALUES ('Le Kef'            ,	     'Kef Ouest',	'KF',	'KO');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Kelibia',	'NB',	'KE');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Kerkennah',	'SF',	'KE');
INSERT INTO @tbl VALUES ('Siliana'            ,	     'Kesra',	'SL',	'KI');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Kondar',	'SS',	'KO');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Korba',	'NB',	'KO');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Le Kram',	'TU',	'LK');
INSERT INTO @tbl VALUES ('Siliana'            ,	     'El Krib',	'SL',	'EL');
INSERT INTO @tbl VALUES ('Gafsa'            ,	     'Ksar',	'GF',	'KS');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Ksar Hellal',	'MS',	'KH');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Ksibet El Mediouni',	'MS',	'KM');
INSERT INTO @tbl VALUES ('Le Kef'            ,	     'Ksour',	'KF',	'KU');
INSERT INTO @tbl VALUES ('Mahdia'            ,	     'Ksour Essef',	'MH',	'KE');
INSERT INTO @tbl VALUES ('Siliana'            ,	     'Laroussa',	'SL',	'LA');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'M''Hamdia',	'BA',	'MH');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'M''Saken',	'SS',	'MS');
INSERT INTO @tbl VALUES ('Mahdia'            ,	     'Mahdia',	'MH',	'MA');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Mahres',	'SF',	'MA');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Majel Belabbes',	'KS',	'MB');
INSERT INTO @tbl VALUES ('Siliana'            ,	     'Makthar',	'SL',	'MA');
INSERT INTO @tbl VALUES ('Manouba'            ,	     'Manouba',	'MN',	'MA');
INSERT INTO @tbl VALUES ('Gabes'            ,	     'Mareth',	'GB',	'MR');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'La Marsa',	'TU',	'LM');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Mateur',	'BZ',	'MA');
INSERT INTO @tbl VALUES ('Gabes'            ,	     'Matmata',	'GB',	'MT');
INSERT INTO @tbl VALUES ('Gabes'            ,	     'Matmata Nouvelle',	'GB',	'MN');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Mazzouna',	'SZ',	'MA');
INSERT INTO @tbl VALUES ('Gafsa'            ,	     'Mdhilla',	'GF',	'MD');
INSERT INTO @tbl VALUES ('Medenine'            ,	     'Medenine Nord',	'ME',	'MN');
INSERT INTO @tbl VALUES ('Medenine'            ,	     'Medenine Sud',	'ME',	'MS');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Medina',	'TU',	'MD');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'Megrine',	'BA',	'ME');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Mejez El Bab',	'BJ',	'MB');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Meknassi',	'SZ',	'ME');
INSERT INTO @tbl VALUES ('Mahdia'            ,	     'Melloulech',	'MH',	'ME');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'El Menzah',	'TU',	'MZ');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Menzel Bourguiba',	'BZ',	'MB');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Menzel Bouzaiene',	'SZ',	'MB');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Menzel Bouzelfa',	'NB',	'MB');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Menzel Chaker',	'SF',	'MC');
INSERT INTO @tbl VALUES ('Gabes'            ,	     'Menzel Habib',	'GB',	'MH');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Menzel Jemil',	'BZ',	'MJ');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Menzel Temime',	'NB',	'MT');
INSERT INTO @tbl VALUES ('Gafsa'            ,	     'Metlaoui',	'GF',	'ME');
INSERT INTO @tbl VALUES ('Gabes'            ,	     'Metouia',	'GB',	'ME');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'El Mida',	'NB',	'MI');
INSERT INTO @tbl VALUES ('Ariana'            ,	     'Mnihla',	'AN',	'MN');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Moknine',	'MS',	'MK');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Monastir',	'MS',	'MS');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'Mornag',	'BA',	'MR');
INSERT INTO @tbl VALUES ('Manouba'            ,	     'Mornaguia',	'MN',	'MO');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'El Mourouj',	'BA',	'MJ');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Nabeul',	'NB',	'NA');
INSERT INTO @tbl VALUES ('Zaghouan'            ,	     'Nadhour',	'ZA',	'NA');
INSERT INTO @tbl VALUES ('Kairouan'            ,	     'Nasrallah',	'KR',	'NA');
INSERT INTO @tbl VALUES ('Le Kef'            ,	     'Nebeur',	'KF',	'NE');
INSERT INTO @tbl VALUES ('Tozeur'            ,	     'Nefta',	'TO',	'NA');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Nefza',	'BJ',	'NE');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'Nouvelle Medina',	'BA',	'NM');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Omrane',	'TU',	'OM');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Omrane Superieur',	'TU',	'OS');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'El Ouardia',	'TU',	'OU');
INSERT INTO @tbl VALUES ('Manouba'            ,	     'Oued Ellil',	'MN',	'OE');
INSERT INTO @tbl VALUES ('Jendouba'            ,	     'Oued Mliz',	'JE',	'OM');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Ouerdanine',	'MS',	'OU');
INSERT INTO @tbl VALUES ('Kairouan'            ,	     'Oueslatia',	'KR',	'OU');
INSERT INTO @tbl VALUES ('Mahdia'            ,	     'Ouled Chamekh',	'MH',	'OC');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Ouled Haffouz',	'SZ',	'OH');
INSERT INTO @tbl VALUES ('Gafsa'            ,	     'Oum Larais',	'GF',	'OL');
INSERT INTO @tbl VALUES ('Ben Arous'            ,	     'Rades',	'BA',	'RA');
INSERT INTO @tbl VALUES ('Ariana'            ,	     'Raoued',	'AN',	'RA');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Ras Jebel',	'BZ',	'RJ');
INSERT INTO @tbl VALUES ('Gafsa'            ,	     'Redeyef',	'GF',	'RE');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Regueb',	'SZ',	'RE');
INSERT INTO @tbl VALUES ('Tataouine'            ,	     'Remada',	'TA',	'RE');
INSERT INTO @tbl VALUES ('Siliana'            ,	     'Rouhia',	'SL',	'RO');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Sabalat Ouled Asker',	'SZ',	'SA');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Sahline',	'MS',	'SA');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Sakiet Eddaier',	'SF',	'SD');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Sakiet Ezzit',	'SF',	'SZ');
INSERT INTO @tbl VALUES ('Le Kef'            ,	     'Sakiet Sidi Youssef',	'KF',	'SS');
INSERT INTO @tbl VALUES ('Tataouine'            ,	     'Samar',	'TA',	'SA');
INSERT INTO @tbl VALUES ('Zaghouan'            ,	     'Saouaf',	'ZA',	'SA');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Sayada-Lamta-Bou Hjar',	'MS',	'SL');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Sbeitla',	'KS',	'ST');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Sbiba',	'KS',	'SB');
INSERT INTO @tbl VALUES ('Kairouan'            ,	     'Sbikha',	'KR',	'SB');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Sejnane',	'BZ',	'SE');
INSERT INTO @tbl VALUES ('Gafsa'            ,	     'Sened',	'GF',	'SE');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Sfax Medina',	'SF',	'SM');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Sfax Ouest',	'SF',	'SO');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Sfax Sud',	'SF',	'SS');
INSERT INTO @tbl VALUES ('Gafsa'            ,	     'Sidi Aich',	'GF',	'SA');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Sidi Ali Ben Aoun',	'SZ',	'SB');
INSERT INTO @tbl VALUES ('Mahdia'            ,	     'Sidi Alouane',	'MH',	'SA');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Sidi Bou Ali',	'SS',	'SB');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Sidi Bouzid Est',	'SZ',	'SE');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Sidi Bouzid Ouest',	'SZ',	'SO');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Sidi El Bechir',	'TU',	'SB');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Sidi El Heni',	'SS',	'SH');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Sidi Hassine',	'TU',	'SH');
INSERT INTO @tbl VALUES ('Medenine'            ,	     'Sidi Makhlouf',	'ME',	'SM');
INSERT INTO @tbl VALUES ('Ariana'            ,	     'Sidi Thabet',	'AN',	'ST');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'Sijoumi',	'TU',	'SI');
INSERT INTO @tbl VALUES ('Siliana'            ,	     'Siliana Nord',	'SL',	'SN');
INSERT INTO @tbl VALUES ('Siliana'            ,	     'Siliana Sud',	'SL',	'SS');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Skhira',	'SF',	'SK');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Soliman',	'NB',	'SO');
INSERT INTO @tbl VALUES ('Mahdia'            ,	     'Souassi',	'MH',	'SO');
INSERT INTO @tbl VALUES ('Kebili'            ,	     'Souk El Ahed',	'KB',	'SA');
INSERT INTO @tbl VALUES ('Sidi Bou Zid'            ,	     'Souk Jedid',	'SZ',	'SJ');
INSERT INTO @tbl VALUES ('Ariana'            ,	     'Soukra',	'AN',	'LS');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Sousse Jaouhara',	'SS',	'SJ');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Sousse Medina',	'SS',	'SM');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Sousse Riadh',	'SS',	'SR');
INSERT INTO @tbl VALUES ('Sousse'            ,	     'Sousse Sidi Abdelhamid',	'SS',	'SS');
INSERT INTO @tbl VALUES ('Jendouba'            ,	     'Tabarka',	'JE',	'TA');
INSERT INTO @tbl VALUES ('Tunis'            ,	     'El Tahrir',	'TU',	'TA');
INSERT INTO @tbl VALUES ('Le Kef'            ,	     'Tajerouine',	'KF',	'TE');
INSERT INTO @tbl VALUES ('Nabeul'            ,	     'Takelsa',	'NB',	'TA');
INSERT INTO @tbl VALUES ('Tozeur'            ,	     'Tamaghza',	'TO',	'TA');
INSERT INTO @tbl VALUES ('Tataouine'            ,	     'Tataouine Nord',	'TA',	'TN');
INSERT INTO @tbl VALUES ('Tataouine'            ,	     'Tataouine Sud',	'TA',	'TS');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Teboulba',	'MS',	'TE');
INSERT INTO @tbl VALUES ('Manouba'            ,	     'Tebourba',	'MN',	'TE');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Teboursouk',	'BJ',	'TB');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Testour',	'BJ',	'TT');
INSERT INTO @tbl VALUES ('Kasserine'            ,	     'Thala',	'KS',	'TH');
INSERT INTO @tbl VALUES ('Beja'            ,	     'Thibar',	'BJ',	'TH');
INSERT INTO @tbl VALUES ('Sfax'            ,	     'Thina',	'SF',	'TH');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Tinja',	'BZ',	'TI');
INSERT INTO @tbl VALUES ('Tozeur'            ,	     'Tozeur',	'TO',	'TO');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Utique',	'BZ',	'UT');
INSERT INTO @tbl VALUES ('Zaghouan'            ,	     'Zaghouan',	'ZA',	'ZA');
INSERT INTO @tbl VALUES ('Medenine'            ,	     'Zarzis',	'ME',	'ZA');
INSERT INTO @tbl VALUES ('Bizerte'            ,	     'Zarzouna',	'BZ',	'JA');
INSERT INTO @tbl VALUES ('Monastir'            ,	     'Zeramdine',	'MS',	'ZA');
INSERT INTO @tbl VALUES ('Zaghouan'            ,	     'Zriba',	'ZA',	'ZR');

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

