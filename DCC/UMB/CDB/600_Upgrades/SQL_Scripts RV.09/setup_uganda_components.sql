
/* ==================================================================================
    	Source File		:	setup_uganda_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Uganda are set-up
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
WHERE	country_nm	=	'Uganda';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Uganda not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'County',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Agago'            ,	     'Agago',	'AG',	'AO');
INSERT INTO @tbl VALUES ('Pallisa'            ,	     'Agule',	'PS',	'AG');
INSERT INTO @tbl VALUES ('Alebtong'            ,	     'Ajuri',	'AL',	'AJ');
INSERT INTO @tbl VALUES ('Amuria'            ,	     'Amuria',	'AM',	'AU');
INSERT INTO @tbl VALUES ('Yumbe'            ,	     'Aringa',	'YU',	'AR');
INSERT INTO @tbl VALUES ('Arua'            ,	     'Arua',	'AX',	'AU');
INSERT INTO @tbl VALUES ('Pader'            ,	     'Aruu',	'PR',	'AU');
INSERT INTO @tbl VALUES ('Gulu'            ,	     'Aswa',	'GL',	'AW');
INSERT INTO @tbl VALUES ('Arua'            ,	     'Ayivu',	'AX',	'AY');
INSERT INTO @tbl VALUES ('Luwero'            ,	     'Bamunanika',	'LW',	'BM');
INSERT INTO @tbl VALUES ('Kayunga'            ,	     'Bbale',	'KY',	'BA');
INSERT INTO @tbl VALUES ('Napak'            ,	     'Bokora',	'NQ',	'BK');
INSERT INTO @tbl VALUES ('Manafwa'            ,	     'Bubulo',	'MW',	'BB');
INSERT INTO @tbl VALUES ('Sironko'            ,	     'Budadiri',	'SK',	'BD');
INSERT INTO @tbl VALUES ('Budaka'            ,	     'Budaka',	'BD',	'BU');
INSERT INTO @tbl VALUES ('Buyende'            ,	     'Budiope East',	'BY',	'BE');
INSERT INTO @tbl VALUES ('Buyende'            ,	     'Budiope West',	'BY',	'BW');
INSERT INTO @tbl VALUES ('Nakasongola'            ,	     'Budyebo',	'NA',	'BB');
INSERT INTO @tbl VALUES ('Kisoro'            ,	     'Bufumbira',	'KR',	'BF');
INSERT INTO @tbl VALUES ('Kamuli'            ,	     'Bugabula',	'QU',	'BG');
INSERT INTO @tbl VALUES ('Hoima'            ,	     'Bugahya',	'HO',	'BG');
INSERT INTO @tbl VALUES ('Kibaale'            ,	     'Bugangaizi',	'KI',	'BZ');
INSERT INTO @tbl VALUES ('Kibaale'            ,	     'Bugangaizi East',	'KI',	'BE');
INSERT INTO @tbl VALUES ('Bundibugyo'            ,	     'Bughendera',	'BX',	'BG');
INSERT INTO @tbl VALUES ('Iganga'            ,	     'Bugweri',	'IC',	'BG');
INSERT INTO @tbl VALUES ('Hoima'            ,	     'Buhaguzi',	'HO',	'BH');
INSERT INTO @tbl VALUES ('Buhweju'            ,	     'Buhweju',	'BH',	'BH');
INSERT INTO @tbl VALUES ('Buikwe'            ,	     'Buikwe',	'BZ',	'BI');
INSERT INTO @tbl VALUES ('Masindi'            ,	     'Bujenje',	'MZ',	'BJ');
INSERT INTO @tbl VALUES ('Kalangala'            ,	     'Bujumba',	'KN',	'BJ');
INSERT INTO @tbl VALUES ('Isingiro'            ,	     'Bukanga',	'NG',	'BK');
INSERT INTO @tbl VALUES ('Bukedea'            ,	     'Bukedea',	'BE',	'BK');
INSERT INTO @tbl VALUES ('Bukomansimbi'            ,	     'Bukomansimbi',	'BM',	'BM');
INSERT INTO @tbl VALUES ('Kasese'            ,	     'Bukonzo',	'KS',	'BK');
INSERT INTO @tbl VALUES ('Bugiri'            ,	     'Bukooli',	'BI',	'BI');
INSERT INTO @tbl VALUES ('Namayingo'            ,	     'Bukooli Island',	'NY',	'BI');
INSERT INTO @tbl VALUES ('Namayingo'            ,	     'Bukooli South',	'NY',	'BS');
INSERT INTO @tbl VALUES ('Lwengo'            ,	     'Bukoto',	'LE',	'BU');
INSERT INTO @tbl VALUES ('Masaka'            ,	     'Bukoto Central',	'MQ',	'BC');
INSERT INTO @tbl VALUES ('Masaka'            ,	     'Bukoto East',	'MQ',	'BE');
INSERT INTO @tbl VALUES ('Bulambuli'            ,	     'Bulambuli',	'BB',	'BL');
INSERT INTO @tbl VALUES ('Kaliro'            ,	     'Bulamogi',	'RO',	'BL');
INSERT INTO @tbl VALUES ('Buliisa'            ,	     'Buliisa',	'BL',	'BL');
INSERT INTO @tbl VALUES ('Mbale'            ,	     'Bungokho',	'ME',	'BN');
INSERT INTO @tbl VALUES ('Mayuge'            ,	     'Bunya',	'MG',	'BN');
INSERT INTO @tbl VALUES ('Kabarole'            ,	     'Bunyangabu',	'BR',	'BN');
INSERT INTO @tbl VALUES ('Rubirizi'            ,	     'Bunyaruguru',	'RZ',	'BR');
INSERT INTO @tbl VALUES ('Butaleja'            ,	     'Bunyole East',	'BJ',	'BE');
INSERT INTO @tbl VALUES ('Butaleja'            ,	     'Bunyole West',	'BJ',	'BW');
INSERT INTO @tbl VALUES ('Kabarole'            ,	     'Burahya',	'BR',	'BR');
INSERT INTO @tbl VALUES ('Masindi'            ,	     'Buruli',	'MZ',	'BR');
INSERT INTO @tbl VALUES ('Bushenyi'            ,	     'Bushenyi-Ishaka',	'BC',	'BI');
INSERT INTO @tbl VALUES ('Busia'            ,	     'Busia',	'BU',	'BS');
INSERT INTO @tbl VALUES ('Namutumba'            ,	     'Busiki',	'BK',	'BS');
INSERT INTO @tbl VALUES ('Wakiso'            ,	     'Busiro',	'WA',	'BS');
INSERT INTO @tbl VALUES ('Kasese'            ,	     'Busongora',	'KS',	'BS');
INSERT INTO @tbl VALUES ('Mityana'            ,	     'Busujju',	'TY',	'BS');
INSERT INTO @tbl VALUES ('Butambala'            ,	     'Butambala',	'BT',	'BT');
INSERT INTO @tbl VALUES ('Pallisa'            ,	     'Butebo',	'PS',	'BT');
INSERT INTO @tbl VALUES ('Jinja'            ,	     'Butembe',	'JI',	'BT');
INSERT INTO @tbl VALUES ('Buvuma'            ,	     'Buvuma Islands',	'BV',	'BV');
INSERT INTO @tbl VALUES ('Mubende'            ,	     'Buwekula',	'MD',	'BW');
INSERT INTO @tbl VALUES ('Kibaale'            ,	     'Buyaga',	'KI',	'BY');
INSERT INTO @tbl VALUES ('Kibaale'            ,	     'Buyaga West',	'KI',	'BW');
INSERT INTO @tbl VALUES ('Kibaale'            ,	     'Buyanja',	'KI',	'BJ');
INSERT INTO @tbl VALUES ('Kamuli'            ,	     'Buzaaya',	'QU',	'BZ');
INSERT INTO @tbl VALUES ('Bundibugyo'            ,	     'Bwamba',	'BX',	'BW');
INSERT INTO @tbl VALUES ('Nakapiripirit'            ,	     'Chekwii (Kadam)',	'NI',	'CE');
INSERT INTO @tbl VALUES ('Kitgum'            ,	     'Chua',	'QT',	'CU');
INSERT INTO @tbl VALUES ('Kaabong'            ,	     'Dodoth East',	'AB',	'DE');
INSERT INTO @tbl VALUES ('Kaabong'            ,	     'Dodoth West',	'AB',	'DW');
INSERT INTO @tbl VALUES ('Dokolo'            ,	     'Dokolo',	'DO',	'DK');
INSERT INTO @tbl VALUES ('Adjumani'            ,	     'East Moyo',	'AD',	'EA');
INSERT INTO @tbl VALUES ('Wakiso'            ,	     'Entebbe',	'WA',	'ET');
INSERT INTO @tbl VALUES ('Lira'            ,	     'Erute',	'LL',	'EU');
INSERT INTO @tbl VALUES ('Kabarole'            ,	     'Fort Portal',	'BR',	'FR');
INSERT INTO @tbl VALUES ('Gomba'            ,	     'Gomba',	'GM',	'GM');
INSERT INTO @tbl VALUES ('Gulu'            ,	     'Gulu',	'GL',	'GL');
INSERT INTO @tbl VALUES ('Hoima'            ,	     'Hoima',	'HO',	'HO');
INSERT INTO @tbl VALUES ('Ibanda'            ,	     'Ibanda',	'IB',	'IA');
INSERT INTO @tbl VALUES ('Iganga'            ,	     'Iganga',	'IC',	'IG');
INSERT INTO @tbl VALUES ('Bushenyi'            ,	     'Igara',	'BC',	'IG');
INSERT INTO @tbl VALUES ('Budaka'            ,	     'Iki-Iki',	'BD',	'II');
INSERT INTO @tbl VALUES ('Isingiro'            ,	     'Isingiro',	'NG',	'II');
INSERT INTO @tbl VALUES ('Kotido'            ,	     'Jie',	'KF',	'JE');
INSERT INTO @tbl VALUES ('Jinja'            ,	     'Jinja',	'JI',	'JN');
INSERT INTO @tbl VALUES ('Nebbi'            ,	     'Jonam',	'NB',	'JN');
INSERT INTO @tbl VALUES ('Kabale'            ,	     'Kabale',	'KA',	'KB');
INSERT INTO @tbl VALUES ('Kaberamaido'            ,	     'Kaberamaido',	'KD',	'KB');
INSERT INTO @tbl VALUES ('Lyantonde'            ,	     'Kabula',	'LY',	'KB');
INSERT INTO @tbl VALUES ('Jinja'            ,	     'Kagoma',	'JI',	'KG');
INSERT INTO @tbl VALUES ('Ntungamo'            ,	     'Kajara',	'NT',	'KJ');
INSERT INTO @tbl VALUES ('Rakai'            ,	     'Kakuuto',	'RI',	'KK');
INSERT INTO @tbl VALUES ('Kaberamaido'            ,	     'Kalaki',	'KD',	'KL');
INSERT INTO @tbl VALUES ('Kalungu'            ,	     'Kalungu',	'QA',	'KL');
INSERT INTO @tbl VALUES ('Kampala'            ,	     'Kampala',	'KM',	'KM');
INSERT INTO @tbl VALUES ('Amuria'            ,	     'Kapelebyong',	'AM',	'KP');
INSERT INTO @tbl VALUES ('Mubende'            ,	     'Kasambya',	'MD',	'KM');
INSERT INTO @tbl VALUES ('Kasese'            ,	     'Kasese',	'KS',	'KS');
INSERT INTO @tbl VALUES ('Mbarara'            ,	     'Kashari',	'RR',	'KS');
INSERT INTO @tbl VALUES ('Serere'            ,	     'Kasilo',	'SX',	'KS');
INSERT INTO @tbl VALUES ('Mubende'            ,	     'Kassanda',	'MD',	'KS');
INSERT INTO @tbl VALUES ('Rubirizi'            ,	     'Katerera',	'RZ',	'KT');
INSERT INTO @tbl VALUES ('Luwero'            ,	     'Katikamu',	'LW',	'KT');
INSERT INTO @tbl VALUES ('Kiruhuura'            ,	     'Kazo',	'KH',	'KZ');
INSERT INTO @tbl VALUES ('Kamwenge'            ,	     'Kibale',	'KE',	'KB');
INSERT INTO @tbl VALUES ('Kiryandongo'            ,	     'Kibanda',	'QD',	'KB');
INSERT INTO @tbl VALUES ('Kiboga'            ,	     'Kiboga East',	'QO',	'KE');
INSERT INTO @tbl VALUES ('Kyankwanzi'            ,	     'Kiboga West',	'QZ',	'KW');
INSERT INTO @tbl VALUES ('Kibuku'            ,	     'Kibuku',	'QB',	'KB');
INSERT INTO @tbl VALUES ('Iganga'            ,	     'Kigulu',	'IC',	'KG');
INSERT INTO @tbl VALUES ('Amuru'            ,	     'Kilak',	'AY',	'KL');
INSERT INTO @tbl VALUES ('Kanungu'            ,	     'Kinkinzi',	'UU',	'KN');
INSERT INTO @tbl VALUES ('Amolatar'            ,	     'Kioga',	'AT',	'KO');
INSERT INTO @tbl VALUES ('Kamwenge'            ,	     'Kitagwenda',	'KE',	'KT');
INSERT INTO @tbl VALUES ('Koboko'            ,	     'Koboko',	'OK',	'KB');
INSERT INTO @tbl VALUES ('Kole'            ,	     'Kole',	'QL',	'KL');
INSERT INTO @tbl VALUES ('Bukwo'            ,	     'Kongasis',	'BW',	'KO');
INSERT INTO @tbl VALUES ('Rakai'            ,	     'Kooki',	'RI',	'KO');
INSERT INTO @tbl VALUES ('Kumi'            ,	     'Kumi',	'QM',	'KM');
INSERT INTO @tbl VALUES ('Apac'            ,	     'Kwania',	'AQ',	'KA');
INSERT INTO @tbl VALUES ('Kween'            ,	     'Kween',	'QW',	'KW');
INSERT INTO @tbl VALUES ('Wakiso'            ,	     'Kyadondo',	'WA',	'KA');
INSERT INTO @tbl VALUES ('Kyegegwa'            ,	     'Kyaka',	'QG',	'KA');
INSERT INTO @tbl VALUES ('Kalangala'            ,	     'Kyamuswa',	'KN',	'KA');
INSERT INTO @tbl VALUES ('Rakai'            ,	     'Kyotera',	'RI',	'KY');
INSERT INTO @tbl VALUES ('Abim'            ,	     'Labwor',	'AI',	'LB');
INSERT INTO @tbl VALUES ('Lamwo'            ,	     'Lamwo',	'LM',	'LM');
INSERT INTO @tbl VALUES ('Lira'            ,	     'Lira',	'LL',	'LR');
INSERT INTO @tbl VALUES ('Luuka'            ,	     'Luuka',	'LK',	'LU');
INSERT INTO @tbl VALUES ('Sembabule'            ,	     'Lwemiyaga',	'SE',	'LW');
INSERT INTO @tbl VALUES ('Arua'            ,	     'Madi-Okollo',	'AX',	'MD');
INSERT INTO @tbl VALUES ('Bududa'            ,	     'Manjiya',	'BA',	'MN');
INSERT INTO @tbl VALUES ('Nyadri'            ,	     'Maracha',	'MH',	'MR');
INSERT INTO @tbl VALUES ('Apac'            ,	     'Maruzi',	'AQ',	'MR');
INSERT INTO @tbl VALUES ('Masaka'            ,	     'Masaka',	'MQ',	'MS');
INSERT INTO @tbl VALUES ('Masindi'            ,	     'Masindi',	'MZ',	'MS');
INSERT INTO @tbl VALUES ('Moroto'            ,	     'Matheniko',	'MX',	'MT');
INSERT INTO @tbl VALUES ('Sembabule'            ,	     'Mawogola',	'SE',	'MW');
INSERT INTO @tbl VALUES ('Mpigi'            ,	     'Mawokota',	'MJ',	'MW');
INSERT INTO @tbl VALUES ('Mbale'            ,	     'Mbale',	'ME',	'MA');
INSERT INTO @tbl VALUES ('Mbarara'            ,	     'Mbarara',	'RR',	'MA');
INSERT INTO @tbl VALUES ('Mityana'            ,	     'Mityana',	'TY',	'MT');
INSERT INTO @tbl VALUES ('Alebtong'            ,	     'Moroto',	'AL',	'MR');
INSERT INTO @tbl VALUES ('Moroto'            ,	     'Moroto',	'MX',	'MR');
INSERT INTO @tbl VALUES ('Mukono'            ,	     'Mukono',	'MV',	'MC');
INSERT INTO @tbl VALUES ('Kyenjojo'            ,	     'Mwenge',	'QJ',	'ME');
INSERT INTO @tbl VALUES ('Nakaseke'            ,	     'Nakaseke North',	'NK',	'NN');
INSERT INTO @tbl VALUES ('Nakaseke'            ,	     'Nakaseke South',	'NK',	'NS');
INSERT INTO @tbl VALUES ('Nakasongola'            ,	     'Nakasongola',	'NA',	'NS');
INSERT INTO @tbl VALUES ('Mukono'            ,	     'Nakifuma',	'MV',	'NK');
INSERT INTO @tbl VALUES ('Kabale'            ,	     'Ndorwa',	'KA',	'NO');
INSERT INTO @tbl VALUES ('Ngora'            ,	     'Ngora',	'NR',	'NO');
INSERT INTO @tbl VALUES ('Kayunga'            ,	     'Ntenjeru',	'KY',	'NE');
INSERT INTO @tbl VALUES ('Ntoroko'            ,	     'Ntoroko',	'NO',	'NO');
INSERT INTO @tbl VALUES ('Ntungamo'            ,	     'Ntungamo',	'NT',	'NT');
INSERT INTO @tbl VALUES ('Nwoya'            ,	     'Nwoya',	'NW',	'NO');
INSERT INTO @tbl VALUES ('Kiruhuura'            ,	     'Nyabushozi',	'KH',	'NA');
INSERT INTO @tbl VALUES ('Moyo'            ,	     'Obongi',	'MY',	'OO');
INSERT INTO @tbl VALUES ('Zombo'            ,	     'Okoro',	'ZO',	'OO');
INSERT INTO @tbl VALUES ('Gulu'            ,	     'Omoro',	'GL',	'OO');
INSERT INTO @tbl VALUES ('Otuke'            ,	     'Otuke',	'OT',	'OU');
INSERT INTO @tbl VALUES ('Oyam'            ,	     'Oyam',	'OY',	'OA');
INSERT INTO @tbl VALUES ('Nebbi'            ,	     'Padyere',	'NB',	'PD');
INSERT INTO @tbl VALUES ('Pallisa'            ,	     'Pallisa',	'PS',	'PS');
INSERT INTO @tbl VALUES ('Nakapiripirit'            ,	     'Pian',	'NI',	'PA');
INSERT INTO @tbl VALUES ('Rukungiri'            ,	     'Rubabo',	'RK',	'RB');
INSERT INTO @tbl VALUES ('Kabale'            ,	     'Rubanda',	'KA',	'RB');
INSERT INTO @tbl VALUES ('Ntungamo'            ,	     'Ruhaama',	'NT',	'RH');
INSERT INTO @tbl VALUES ('Mitoma'            ,	     'Ruhinda',	'MM',	'RH');
INSERT INTO @tbl VALUES ('Rukungiri'            ,	     'Rujumbura',	'RK',	'RJ');
INSERT INTO @tbl VALUES ('Kabale'            ,	     'Rukiga',	'KA',	'RK');
INSERT INTO @tbl VALUES ('Rukungiri'            ,	     'Rukungiri',	'RK',	'RG');
INSERT INTO @tbl VALUES ('Ntungamo'            ,	     'Rushenyi',	'NT',	'RS');
INSERT INTO @tbl VALUES ('Mbarara'            ,	     'Rwampara',	'RR',	'RA');
INSERT INTO @tbl VALUES ('Busia'            ,	     'Samia Bugwe',	'BU',	'SB');
INSERT INTO @tbl VALUES ('Serere'            ,	     'Serere',	'SX',	'SE');
INSERT INTO @tbl VALUES ('Sheema'            ,	     'Sheema',	'SH',	'SE');
INSERT INTO @tbl VALUES ('Soroti'            ,	     'Soroti',	'ST',	'SO');
INSERT INTO @tbl VALUES ('Arua'            ,	     'Terego',	'AX',	'TR');
INSERT INTO @tbl VALUES ('Kapchorwa'            ,	     'Tingey',	'QP',	'TI');
INSERT INTO @tbl VALUES ('Katakwi'            ,	     'Toroma',	'KK',	'TO');
INSERT INTO @tbl VALUES ('Tororo'            ,	     'Tororo',	'TR',	'TO');
INSERT INTO @tbl VALUES ('Amudat'            ,	     'Upe',	'AZ',	'PO');
INSERT INTO @tbl VALUES ('Katakwi'            ,	     'Usuk',	'KK',	'US');
INSERT INTO @tbl VALUES ('Arua'            ,	     'Vurra',	'AX',	'VU');
INSERT INTO @tbl VALUES ('Tororo'            ,	     'West Budama',	'TR',	'KS');
INSERT INTO @tbl VALUES ('Moyo'            ,	     'West Moyo',	'MY',	'WS');

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

