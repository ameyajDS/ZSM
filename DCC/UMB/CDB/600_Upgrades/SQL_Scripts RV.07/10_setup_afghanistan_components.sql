/* ==================================================================================
    Source File		:	setup_afghanistan_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sat Oct 04 16:13 2014
	Module ID		:	CDB
	Last updated	:	Oct 04, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Afganistan are set-up
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
WHERE	country_nm	=	'Afghanistan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Afganistan not found', 16, 1);
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

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Badakhshan',	'Arghanj Khwa',	'BD',	'AK');
INSERT INTO @tbl VALUES ('Badakhshan',	'Argo',	'BD',	'AR');
INSERT INTO @tbl VALUES ('Badakhshan',	'Baharak',	'BD',	'BA');
INSERT INTO @tbl VALUES ('Badakhshan',	'Darwaz',	'BD',	'DA');
INSERT INTO @tbl VALUES ('Badakhshan',	'Darwazi Bala',	'BD',	'DB');
INSERT INTO @tbl VALUES ('Badakhshan',	'Darayim',	'BD',	'DY');
INSERT INTO @tbl VALUES ('Badakhshan',	'Fayz Abad',	'BD',	'FA');
INSERT INTO @tbl VALUES ('Badakhshan',	'Ishkashim',	'BD',	'IK');
INSERT INTO @tbl VALUES ('Badakhshan',	'Jurm',	'BD',	'JU');
INSERT INTO @tbl VALUES ('Badakhshan',	'Kuf Ab',	'BD',	'KA');
INSERT INTO @tbl VALUES ('Badakhshan',	'Khash',	'BD',	'KH');
INSERT INTO @tbl VALUES ('Badakhshan',	'Kishim',	'BD',	'KI');
INSERT INTO @tbl VALUES ('Badakhshan',	'Kuran wa Munjan',	'BD',	'KM');
INSERT INTO @tbl VALUES ('Badakhshan',	'Kohistan',	'BD',	'KS');
INSERT INTO @tbl VALUES ('Badakhshan',	'Khwahan',	'BD',	'KW');
INSERT INTO @tbl VALUES ('Badakhshan',	'Ragh',	'BD',	'RA');
INSERT INTO @tbl VALUES ('Badakhshan',	'Shahri Buzurg',	'BD',	'SB');
INSERT INTO @tbl VALUES ('Badakhshan',	'Shuhada',	'BD',	'SD');
INSERT INTO @tbl VALUES ('Badakhshan',	'Shighnan',	'BD',	'SG');
INSERT INTO @tbl VALUES ('Badakhshan',	'Shiki',	'BD',	'SK');
INSERT INTO @tbl VALUES ('Badakhshan',	'Tagab',	'BD',	'TA');
INSERT INTO @tbl VALUES ('Badakhshan',	'Tishkan',	'BD',	'TI');
INSERT INTO @tbl VALUES ('Badakhshan',	'Wakhan',	'BD',	'WA');
INSERT INTO @tbl VALUES ('Badakhshan',	'Warduj',	'BD',	'WJ');
INSERT INTO @tbl VALUES ('Badakhshan',	'Yamgan',	'BD',	'YG');
INSERT INTO @tbl VALUES ('Badakhshan',	'Yaftali Sufla',	'BD',	'YS');
INSERT INTO @tbl VALUES ('Badakhshan',	'Yawan',	'BD',	'YW');
INSERT INTO @tbl VALUES ('Badakhshan',	'Zebak',	'BD',	'ZE');
INSERT INTO @tbl VALUES ('Badghis',	'Ab Kamari',	'BG',	'AK');
INSERT INTO @tbl VALUES ('Badghis',	'Ghormach',	'BG',	'GH');
INSERT INTO @tbl VALUES ('Badghis',	'Jawand',	'BG',	'JA');
INSERT INTO @tbl VALUES ('Badghis',	'Muqur',	'BG',	'MQ');
INSERT INTO @tbl VALUES ('Badghis',	'Murghab',	'BG',	'MR');
INSERT INTO @tbl VALUES ('Badghis',	'Qadis',	'BG',	'QD');
INSERT INTO @tbl VALUES ('Badghis',	'Qala-i-Naw',	'BG',	'QN');
INSERT INTO @tbl VALUES ('Balkh',	'Balkh',	'BK',	'BA');
INSERT INTO @tbl VALUES ('Balkh',	'Chahar Bolak',	'BK',	'CB');
INSERT INTO @tbl VALUES ('Balkh',	'Chahar Kint',	'BK',	'CK');
INSERT INTO @tbl VALUES ('Balkh',	'Chimtal',	'BK',	'CM');
INSERT INTO @tbl VALUES ('Balkh',	'Dawlat Abad',	'BK',	'DA');
INSERT INTO @tbl VALUES ('Balkh',	'Dihdadi',	'BK',	'DI');
INSERT INTO @tbl VALUES ('Balkh',	'Kaldar',	'BK',	'KA');
INSERT INTO @tbl VALUES ('Balkh',	'Khulm',	'BK',	'KH');
INSERT INTO @tbl VALUES ('Balkh',	'Kishindih',	'BK',	'KI');
INSERT INTO @tbl VALUES ('Balkh',	'Marmul',	'BK',	'MM');
INSERT INTO @tbl VALUES ('Balkh',	'Mazari Sharif',	'BK',	'MS');
INSERT INTO @tbl VALUES ('Balkh',	'Nahri Shahi',	'BK',	'NS');
INSERT INTO @tbl VALUES ('Balkh',	'Sholgara',	'BK',	'SL');
INSERT INTO @tbl VALUES ('Balkh',	'Shortepa',	'BK',	'SR');
INSERT INTO @tbl VALUES ('Balkh',	'Zari',	'BK',	'ZA');
INSERT INTO @tbl VALUES ('Baghlan',	'Andarab',	'BL',	'AN');
INSERT INTO @tbl VALUES ('Baghlan',	'Baghlani Jadid',	'BL',	'BJ');
INSERT INTO @tbl VALUES ('Baghlan',	'Burka',	'BL',	'BU');
INSERT INTO @tbl VALUES ('Baghlan',	'Dahana-i-Ghori',	'BL',	'DG');
INSERT INTO @tbl VALUES ('Baghlan',	'Dushi',	'BL',	'DO');
INSERT INTO @tbl VALUES ('Baghlan',	'Dih Salah',	'BL',	'DS');
INSERT INTO @tbl VALUES ('Baghlan',	'Farang wa Gharu',	'BL',	'FG');
INSERT INTO @tbl VALUES ('Baghlan',	'Guzargahi Nur',	'BL',	'GN');
INSERT INTO @tbl VALUES ('Baghlan',	'Khost wa Firing',	'BL',	'KF');
INSERT INTO @tbl VALUES ('Baghlan',	'Khinjan',	'BL',	'KH');
INSERT INTO @tbl VALUES ('Baghlan',	'Khwaja Hijran',	'BL',	'KW');
INSERT INTO @tbl VALUES ('Baghlan',	'Nahrin',	'BL',	'NA');
INSERT INTO @tbl VALUES ('Baghlan',	'Puli Hisar',	'BL',	'PH');
INSERT INTO @tbl VALUES ('Baghlan',	'Puli Khumri',	'BL',	'PK');
INSERT INTO @tbl VALUES ('Baghlan',	'Tala wa Barfak',	'BL',	'TB');
INSERT INTO @tbl VALUES ('Bamian',	'Bamyan',	'BM',	'BA');
INSERT INTO @tbl VALUES ('Bamian',	'Kahmard',	'BM',	'KA');
INSERT INTO @tbl VALUES ('Bamian',	'Panjab',	'BM',	'PA');
INSERT INTO @tbl VALUES ('Bamian',	'Sayghan',	'BM',	'SA');
INSERT INTO @tbl VALUES ('Bamian',	'Shibar',	'BM',	'SH');
INSERT INTO @tbl VALUES ('Bamian',	'Waras',	'BM',	'WA');
INSERT INTO @tbl VALUES ('Bamian',	'Yakawlang',	'BM',	'YA');
INSERT INTO @tbl VALUES ('Daikondi',	'Gizab',	'DK',	'GI');
INSERT INTO @tbl VALUES ('Daikondi',	'Ishtarlay',	'DK',	'IS');
INSERT INTO @tbl VALUES ('Daikondi',	'Kajran',	'DK',	'KA');
INSERT INTO @tbl VALUES ('Daikondi',	'Khadir',	'DK',	'KH');
INSERT INTO @tbl VALUES ('Daikondi',	'Kiti',	'DK',	'KI');
INSERT INTO @tbl VALUES ('Daikondi',	'Miramor',	'DK',	'MI');
INSERT INTO @tbl VALUES ('Daikondi',	'Nili',	'DK',	'NI');
INSERT INTO @tbl VALUES ('Daikondi',	'Shahristan',	'DK',	'SR');
INSERT INTO @tbl VALUES ('Daikondi',	'Sangi Takht',	'DK',	'ST');
INSERT INTO @tbl VALUES ('Faryab',	'Almar',	'FB',	'AL');
INSERT INTO @tbl VALUES ('Faryab',	'Andkhoy',	'FB',	'AN');
INSERT INTO @tbl VALUES ('Faryab',	'Bilchiragh',	'FB',	'BI');
INSERT INTO @tbl VALUES ('Faryab',	'Dawlat Abad',	'FB',	'DA');
INSERT INTO @tbl VALUES ('Faryab',	'Gurziwan',	'FB',	'DR');
INSERT INTO @tbl VALUES ('Faryab',	'Khani Chahar Bagh',	'FB',	'KC');
INSERT INTO @tbl VALUES ('Faryab',	'Kohistan',	'FB',	'KO');
INSERT INTO @tbl VALUES ('Faryab',	'Khwaja Sabz Posh',	'FB',	'KS');
INSERT INTO @tbl VALUES ('Faryab',	'Maymana',	'FB',	'MA');
INSERT INTO @tbl VALUES ('Faryab',	'Pashtun Kot',	'FB',	'PK');
INSERT INTO @tbl VALUES ('Faryab',	'Qaysar',	'FB',	'QA');
INSERT INTO @tbl VALUES ('Faryab',	'Qaramqol',	'FB',	'QQ');
INSERT INTO @tbl VALUES ('Faryab',	'Qurghan',	'FB',	'QU');
INSERT INTO @tbl VALUES ('Faryab',	'Shirin Tagab',	'FB',	'ST');
INSERT INTO @tbl VALUES ('Farah',	'Anar Dara',	'FH',	'AD');
INSERT INTO @tbl VALUES ('Farah',	'Bakwa',	'FH',	'BA');
INSERT INTO @tbl VALUES ('Farah',	'Bala Buluk',	'FH',	'BB');
INSERT INTO @tbl VALUES ('Farah',	'Farah',	'FH',	'FH');
INSERT INTO @tbl VALUES ('Farah',	'Gulistan',	'FH',	'GU');
INSERT INTO @tbl VALUES ('Farah',	'Khaki Safed',	'FH',	'KS');
INSERT INTO @tbl VALUES ('Farah',	'Lash wa Juwayn',	'FH',	'LJ');
INSERT INTO @tbl VALUES ('Farah',	'Pur Chaman',	'FH',	'PC');
INSERT INTO @tbl VALUES ('Farah',	'Pusht Rod',	'FH',	'PR');
INSERT INTO @tbl VALUES ('Farah',	'Qala-i-Kah',	'FH',	'QK');
INSERT INTO @tbl VALUES ('Farah',	'Shib Koh',	'FH',	'SK');
INSERT INTO @tbl VALUES ('Ghowr',	'Charsada',	'GR',	'CD');
INSERT INTO @tbl VALUES ('Ghowr',	'Chaghcharan',	'GR',	'CH');
INSERT INTO @tbl VALUES ('Ghowr',	'Du Layna',	'GR',	'DL');
INSERT INTO @tbl VALUES ('Ghowr',	'Dawlat Yar',	'GR',	'DY');
INSERT INTO @tbl VALUES ('Ghowr',	'Lal wa Sarjangal',	'GR',	'LS');
INSERT INTO @tbl VALUES ('Ghowr',	'Pasaband',	'GR',	'PA');
INSERT INTO @tbl VALUES ('Ghowr',	'Saghar',	'GR',	'SA');
INSERT INTO @tbl VALUES ('Ghowr',	'Shahrak',	'GR',	'SH');
INSERT INTO @tbl VALUES ('Ghowr',	'Taywara',	'GR',	'TA');
INSERT INTO @tbl VALUES ('Ghowr',	'Tulak',	'GR',	'TU');
INSERT INTO @tbl VALUES ('Ghazni',	'Ab Band',	'GZ',	'AB');
INSERT INTO @tbl VALUES ('Ghazni',	'Ajristan',	'GZ',	'AJ');
INSERT INTO @tbl VALUES ('Ghazni',	'Andar',	'GZ',	'AN');
INSERT INTO @tbl VALUES ('Ghazni',	'Bahrami Shahid',	'GZ',	'BA');
INSERT INTO @tbl VALUES ('Ghazni',	'Dih Yak',	'GZ',	'DI');
INSERT INTO @tbl VALUES ('Ghazni',	'Gelan',	'GZ',	'GE');
INSERT INTO @tbl VALUES ('Ghazni',	'Ghazni',	'GZ',	'GH');
INSERT INTO @tbl VALUES ('Ghazni',	'Giro',	'GZ',	'GI');
INSERT INTO @tbl VALUES ('Ghazni',	'Jaghuri',	'GZ',	'JR');
INSERT INTO @tbl VALUES ('Ghazni',	'Khwaja Umari',	'GZ',	'KO');
INSERT INTO @tbl VALUES ('Ghazni',	'Malistan',	'GZ',	'MA');
INSERT INTO @tbl VALUES ('Ghazni',	'Muqur',	'GZ',	'MU');
INSERT INTO @tbl VALUES ('Ghazni',	'Nawa',	'GZ',	'NA');
INSERT INTO @tbl VALUES ('Ghazni',	'Nawur',	'GZ',	'NR');
INSERT INTO @tbl VALUES ('Ghazni',	'Qarabagh',	'GZ',	'QA');
INSERT INTO @tbl VALUES ('Ghazni',	'Rashidan',	'GZ',	'RA');
INSERT INTO @tbl VALUES ('Ghazni',	'Waghaz',	'GZ',	'WA');
INSERT INTO @tbl VALUES ('Ghazni',	'Wali Muhammadi Shahid',	'GZ',	'WM');
INSERT INTO @tbl VALUES ('Ghazni',	'Zana Khan',	'GZ',	'ZK');
INSERT INTO @tbl VALUES ('Helmand',	'Baghran',	'HM',	'BU');
INSERT INTO @tbl VALUES ('Helmand',	'Dishu',	'HM',	'DI');
INSERT INTO @tbl VALUES ('Helmand',	'Garmser',	'HM',	'GA');
INSERT INTO @tbl VALUES ('Helmand',	'Kajaki',	'HM',	'KA');
INSERT INTO @tbl VALUES ('Helmand',	'Lashkar Gah',	'HM',	'LA');
INSERT INTO @tbl VALUES ('Helmand',	'Musa Qala',	'HM',	'MQ');
INSERT INTO @tbl VALUES ('Helmand',	'Nad Ali',	'HM',	'NA');
INSERT INTO @tbl VALUES ('Helmand',	'Nawa-i-Barak Zayi',	'HM',	'NB');
INSERT INTO @tbl VALUES ('Helmand',	'Nahri Sarraj',	'HM',	'NS');
INSERT INTO @tbl VALUES ('Helmand',	'Naw Zad',	'HM',	'NZ');
INSERT INTO @tbl VALUES ('Helmand',	'Reg',	'HM',	'RE');
INSERT INTO @tbl VALUES ('Helmand',	'Sangin',	'HM',	'SA');
INSERT INTO @tbl VALUES ('Helmand',	'Washer',	'HM',	'WA');
INSERT INTO @tbl VALUES ('Herat',	'Adraskan',	'HR',	'AD');
INSERT INTO @tbl VALUES ('Herat',	'Chishti Sharif',	'HR',	'CS');
INSERT INTO @tbl VALUES ('Herat',	'Farsi',	'HR',	'FA');
INSERT INTO @tbl VALUES ('Herat',	'Ghoryan',	'HR',	'GH');
INSERT INTO @tbl VALUES ('Herat',	'Gulran',	'HR',	'GL');
INSERT INTO @tbl VALUES ('Herat',	'Guzara',	'HR',	'GZ');
INSERT INTO @tbl VALUES ('Herat',	'Hirat',	'HR',	'HI');
INSERT INTO @tbl VALUES ('Herat',	'Injil',	'HR',	'IN');
INSERT INTO @tbl VALUES ('Herat',	'Karukh',	'HR',	'KA');
INSERT INTO @tbl VALUES ('Herat',	'Kushki Kuhna',	'HR',	'KK');
INSERT INTO @tbl VALUES ('Herat',	'Kohsan',	'HR',	'KN');
INSERT INTO @tbl VALUES ('Herat',	'Kushk',	'HR',	'KU');
INSERT INTO @tbl VALUES ('Herat',	'Obe',	'HR',	'OB');
INSERT INTO @tbl VALUES ('Herat',	'Pashtun Zarghun',	'HR',	'PZ');
INSERT INTO @tbl VALUES ('Herat',	'Shindand',	'HR',	'SH');
INSERT INTO @tbl VALUES ('Herat',	'Zinda Jan',	'HR',	'ZJ');
INSERT INTO @tbl VALUES ('Jowzjan',	'Aqcha',	'JW',	'AQ');
INSERT INTO @tbl VALUES ('Jowzjan',	'Darzab',	'JW',	'DA');
INSERT INTO @tbl VALUES ('Jowzjan',	'Fayz Abad',	'JW',	'FA');
INSERT INTO @tbl VALUES ('Jowzjan',	'Khamyab',	'JW',	'KM');
INSERT INTO @tbl VALUES ('Jowzjan',	'Khaniqa',	'JW',	'KN');
INSERT INTO @tbl VALUES ('Jowzjan',	'Khwaja Du Koh',	'JW',	'KO');
INSERT INTO @tbl VALUES ('Jowzjan',	'Mardyan',	'JW',	'MA');
INSERT INTO @tbl VALUES ('Jowzjan',	'Mingajik',	'JW',	'MI');
INSERT INTO @tbl VALUES ('Jowzjan',	'Qarqin',	'JW',	'QA');
INSERT INTO @tbl VALUES ('Jowzjan',	'Qush Tepa',	'JW',	'SC');
INSERT INTO @tbl VALUES ('Jowzjan',	'Shibirghan',	'JW',	'SH');
INSERT INTO @tbl VALUES ('Kabul',	'Bagrami',	'KB',	'BA');
INSERT INTO @tbl VALUES ('Kabul',	'Chahar Asyab',	'KB',	'CA');
INSERT INTO @tbl VALUES ('Kabul',	'Dih Sabz',	'KB',	'DS');
INSERT INTO @tbl VALUES ('Kabul',	'Farza',	'KB',	'FS');
INSERT INTO @tbl VALUES ('Kabul',	'Guldara',	'KB',	'GD');
INSERT INTO @tbl VALUES ('Kabul',	'Istalif',	'KB',	'IS');
INSERT INTO @tbl VALUES ('Kabul',	'Kabul',	'KB',	'KB');
INSERT INTO @tbl VALUES ('Kabul',	'Khaki Jabbar',	'KB',	'KJ');
INSERT INTO @tbl VALUES ('Kabul',	'Kalakan',	'KB',	'KL');
INSERT INTO @tbl VALUES ('Kabul',	'Mir Bacha Kot',	'KB',	'MK');
INSERT INTO @tbl VALUES ('Kabul',	'Musayi',	'KB',	'MU');
INSERT INTO @tbl VALUES ('Kabul',	'Paghman',	'KB',	'PA');
INSERT INTO @tbl VALUES ('Kabul',	'Qarabagh',	'KB',	'QB');
INSERT INTO @tbl VALUES ('Kabul',	'Shakardara',	'KB',	'SD');
INSERT INTO @tbl VALUES ('Kabul',	'Surobi',	'KB',	'SU');
INSERT INTO @tbl VALUES ('Kandahar',	'Arghandab',	'KD',	'AD');
INSERT INTO @tbl VALUES ('Kandahar',	'Arghistan',	'KD',	'AS');
INSERT INTO @tbl VALUES ('Kandahar',	'Daman',	'KD',	'DM');
INSERT INTO @tbl VALUES ('Kandahar',	'Ghorak',	'KD',	'GH');
INSERT INTO @tbl VALUES ('Kandahar',	'Kandahar',	'KD',	'KA');
INSERT INTO @tbl VALUES ('Kandahar',	'Khakrez',	'KD',	'KH');
INSERT INTO @tbl VALUES ('Kandahar',	'Miya Nishin',	'KD',	'MN');
INSERT INTO @tbl VALUES ('Kandahar',	'Maruf',	'KD',	'MR');
INSERT INTO @tbl VALUES ('Kandahar',	'Maywand',	'KD',	'MY');
INSERT INTO @tbl VALUES ('Kandahar',	'Nesh',	'KD',	'NE');
INSERT INTO @tbl VALUES ('Kandahar',	'Panjwayi',	'KD',	'PA');
INSERT INTO @tbl VALUES ('Kandahar',	'Reg',	'KD',	'RE');
INSERT INTO @tbl VALUES ('Kandahar',	'Spin Boldak',	'KD',	'SB');
INSERT INTO @tbl VALUES ('Kandahar',	'Shorabak',	'KD',	'SR');
INSERT INTO @tbl VALUES ('Kandahar',	'Shah Wali Kot',	'KD',	'SW');
INSERT INTO @tbl VALUES ('Kandahar',	'Zhari',	'KD',	'ZH');
INSERT INTO @tbl VALUES ('Kapisa',	'Alasay',	'KP',	'AL');
INSERT INTO @tbl VALUES ('Kapisa',	'Koh Band',	'KP',	'KB');
INSERT INTO @tbl VALUES ('Kapisa',	'Mahmud Raqi',	'KP',	'MR');
INSERT INTO @tbl VALUES ('Kapisa',	'Nijrab',	'KP',	'NI');
INSERT INTO @tbl VALUES ('Kapisa',	'Kohistan',	'KP',	'PA');
INSERT INTO @tbl VALUES ('Kapisa',	'Hisa-i-Duwumi Kohistan',	'KP',	'PJ');
INSERT INTO @tbl VALUES ('Kapisa',	'Tagab',	'KP',	'TA');
INSERT INTO @tbl VALUES ('Konar',	'Asad Abad',	'KR',	'AA');
INSERT INTO @tbl VALUES ('Konar',	'Bar Kunar',	'KR',	'BK');
INSERT INTO @tbl VALUES ('Konar',	'Chapa Dara',	'KR',	'CD');
INSERT INTO @tbl VALUES ('Konar',	'Chawkay',	'KR',	'CH');
INSERT INTO @tbl VALUES ('Konar',	'Dangam',	'KR',	'DA');
INSERT INTO @tbl VALUES ('Konar',	'Dara-i-Pech',	'KR',	'DP');
INSERT INTO @tbl VALUES ('Konar',	'Ghazi Abad',	'KR',	'GA');
INSERT INTO @tbl VALUES ('Konar',	'Khas Kunar',	'KR',	'KK');
INSERT INTO @tbl VALUES ('Konar',	'Marawara',	'KR',	'MA');
INSERT INTO @tbl VALUES ('Konar',	'Nari',	'KR',	'NA');
INSERT INTO @tbl VALUES ('Konar',	'Narang',	'KR',	'NB');
INSERT INTO @tbl VALUES ('Konar',	'Nurgal',	'KR',	'NU');
INSERT INTO @tbl VALUES ('Konar',	'Sirkanay',	'KR',	'SI');
INSERT INTO @tbl VALUES ('Konar',	'Shaygal wa Shiltan',	'KR',	'SS');
INSERT INTO @tbl VALUES ('Konar',	'Wata Pur',	'KR',	'WP');
INSERT INTO @tbl VALUES ('Khowst',	'Bak',	'KT',	'BA');
INSERT INTO @tbl VALUES ('Khowst',	'Gurbuz',	'KT',	'GU');
INSERT INTO @tbl VALUES ('Khowst',	'Jaji Maydan',	'KT',	'JM');
INSERT INTO @tbl VALUES ('Khowst',	'Khost',	'KT',	'KH');
INSERT INTO @tbl VALUES ('Khowst',	'Musa Khel',	'KT',	'MK');
INSERT INTO @tbl VALUES ('Khowst',	'Mando Zayi',	'KT',	'MZ');
INSERT INTO @tbl VALUES ('Khowst',	'Nadir Shah Kot',	'KT',	'NS');
INSERT INTO @tbl VALUES ('Khowst',	'Qalandar',	'KT',	'QA');
INSERT INTO @tbl VALUES ('Khowst',	'Sabari',	'KT',	'SB');
INSERT INTO @tbl VALUES ('Khowst',	'Shamal',	'KT',	'SM');
INSERT INTO @tbl VALUES ('Khowst',	'Spera',	'KT',	'SP');
INSERT INTO @tbl VALUES ('Khowst',	'Tani',	'KT',	'TA');
INSERT INTO @tbl VALUES ('Khowst',	'Tere Zayi',	'KT',	'TZ');
INSERT INTO @tbl VALUES ('Kondoz',	'Ali Abad',	'KZ',	'AA');
INSERT INTO @tbl VALUES ('Kondoz',	'Chahar Dara',	'KZ',	'CD');
INSERT INTO @tbl VALUES ('Kondoz',	'Archi',	'KZ',	'DA');
INSERT INTO @tbl VALUES ('Kondoz',	'Imam Sahib',	'KZ',	'HI');
INSERT INTO @tbl VALUES ('Kondoz',	'Khan Abad',	'KZ',	'KA');
INSERT INTO @tbl VALUES ('Kondoz',	'Kunduz',	'KZ',	'KU');
INSERT INTO @tbl VALUES ('Kondoz',	'Qalay-i-Zal',	'KZ',	'QZ');
INSERT INTO @tbl VALUES ('Laghman',	'Alingar',	'LA',	'AN');
INSERT INTO @tbl VALUES ('Laghman',	'Alishing',	'LA',	'AS');
INSERT INTO @tbl VALUES ('Laghman',	'Dawlat Shah',	'LA',	'DS');
INSERT INTO @tbl VALUES ('Laghman',	'Mihtarlam',	'LA',	'MI');
INSERT INTO @tbl VALUES ('Laghman',	'Qarghayi',	'LA',	'QA');
INSERT INTO @tbl VALUES ('Lowgar',	'Azra',	'LW',	'AZ');
INSERT INTO @tbl VALUES ('Lowgar',	'Baraki Barak',	'LW',	'BB');
INSERT INTO @tbl VALUES ('Lowgar',	'Charkh',	'LW',	'CH');
INSERT INTO @tbl VALUES ('Lowgar',	'Khushi',	'LW',	'KH');
INSERT INTO @tbl VALUES ('Lowgar',	'Kharwar',	'LW',	'KW');
INSERT INTO @tbl VALUES ('Lowgar',	'Muhammad Agha',	'LW',	'MA');
INSERT INTO @tbl VALUES ('Lowgar',	'Puli Alam',	'LW',	'PA');
INSERT INTO @tbl VALUES ('Nangarhar',	'Achin',	'NG',	'AC');
INSERT INTO @tbl VALUES ('Nangarhar',	'Bihsud',	'NG',	'BI');
INSERT INTO @tbl VALUES ('Nangarhar',	'Bati Kot',	'NG',	'BK');
INSERT INTO @tbl VALUES ('Nangarhar',	'Chaparhar',	'NG',	'CH');
INSERT INTO @tbl VALUES ('Nangarhar',	'Dur Baba',	'NG',	'DB');
INSERT INTO @tbl VALUES ('Nangarhar',	'Dih Bala',	'NG',	'DL');
INSERT INTO @tbl VALUES ('Nangarhar',	'Dara-i-Nur',	'NG',	'DN');
INSERT INTO @tbl VALUES ('Nangarhar',	'Goshta',	'NG',	'GO');
INSERT INTO @tbl VALUES ('Nangarhar',	'Hisarak',	'NG',	'HI');
INSERT INTO @tbl VALUES ('Nangarhar',	'Jalal Abad',	'NG',	'JA');
INSERT INTO @tbl VALUES ('Nangarhar',	'Kama',	'NG',	'KA');
INSERT INTO @tbl VALUES ('Nangarhar',	'Khogyani',	'NG',	'KH');
INSERT INTO @tbl VALUES ('Nangarhar',	'Kuz Kunar',	'NG',	'KK');
INSERT INTO @tbl VALUES ('Nangarhar',	'Kot',	'NG',	'KO');
INSERT INTO @tbl VALUES ('Nangarhar',	'Lal Pur',	'NG',	'LP');
INSERT INTO @tbl VALUES ('Nangarhar',	'Muhmand Dara',	'NG',	'MD');
INSERT INTO @tbl VALUES ('Nangarhar',	'Nazyan',	'NG',	'NA');
INSERT INTO @tbl VALUES ('Nangarhar',	'Pachir wa Agam',	'NG',	'PA');
INSERT INTO @tbl VALUES ('Nangarhar',	'Rodat',	'NG',	'RO');
INSERT INTO @tbl VALUES ('Nangarhar',	'Surkh Rod',	'NG',	'SR');
INSERT INTO @tbl VALUES ('Nangarhar',	'Shinwar',	'NG',	'SW');
INSERT INTO @tbl VALUES ('Nangarhar',	'Sherzad',	'NG',	'SZ');
INSERT INTO @tbl VALUES ('Nimruz',	'Chahar Burjak',	'NM',	'CB');
INSERT INTO @tbl VALUES ('Nimruz',	'Chakhansur',	'NM',	'CH');
INSERT INTO @tbl VALUES ('Nimruz',	'Kang',	'NM',	'KA');
INSERT INTO @tbl VALUES ('Nimruz',	'Khash Rod',	'NM',	'KR');
INSERT INTO @tbl VALUES ('Nimruz',	'Zaranj',	'NM',	'ZA');
INSERT INTO @tbl VALUES ('Nurestan',	'Bargi Matal',	'NR',	'BM');
INSERT INTO @tbl VALUES ('Nurestan',	'Du Ab',	'NR',	'DA');
INSERT INTO @tbl VALUES ('Nurestan',	'Kamdesh',	'NR',	'KA');
INSERT INTO @tbl VALUES ('Nurestan',	'Mandol',	'NR',	'MA');
INSERT INTO @tbl VALUES ('Nurestan',	'Nurgaram',	'NR',	'NG');
INSERT INTO @tbl VALUES ('Nurestan',	'Nuristan',	'NR',	'NU');
INSERT INTO @tbl VALUES ('Nurestan',	'Waygal',	'NR',	'WG');
INSERT INTO @tbl VALUES ('Nurestan',	'Wama',	'NR',	'WM');
INSERT INTO @tbl VALUES ('Oruzgan',	'Chora',	'OZ',	'CH');
INSERT INTO @tbl VALUES ('Oruzgan',	'Dihrawud',	'OZ',	'DI');
INSERT INTO @tbl VALUES ('Oruzgan',	'Khas Uruzgan',	'OZ',	'KU');
INSERT INTO @tbl VALUES ('Oruzgan',	'Shahidi Hassas',	'OZ',	'SH');
INSERT INTO @tbl VALUES ('Oruzgan',	'Tirin Kot',	'OZ',	'TK');
INSERT INTO @tbl VALUES ('Panjshir',	'Bazarak',	'PJ',	'BA');
INSERT INTO @tbl VALUES ('Panjshir',	'Dara',	'PJ',	'DA');
INSERT INTO @tbl VALUES ('Panjshir',	'Hisa-i-Awali Panjsher',	'PJ',	'HA');
INSERT INTO @tbl VALUES ('Panjshir',	'Paryan',	'PJ',	'PA');
INSERT INTO @tbl VALUES ('Panjshir',	'Rukha',	'PJ',	'RU');
INSERT INTO @tbl VALUES ('Panjshir',	'Shutul',	'PJ',	'SH');
INSERT INTO @tbl VALUES ('Panjshir',	'Unaba',	'PJ',	'UN');
INSERT INTO @tbl VALUES ('Paktika',	'Barmal',	'PK',	'BU');
INSERT INTO @tbl VALUES ('Paktika',	'Dila',	'PK',	'DI');
INSERT INTO @tbl VALUES ('Paktika',	'Gayan',	'PK',	'GA');
INSERT INTO @tbl VALUES ('Paktika',	'Gomal',	'PK',	'GO');
INSERT INTO @tbl VALUES ('Paktika',	'Jani Khel',	'PK',	'JK');
INSERT INTO @tbl VALUES ('Paktika',	'Mata Khan',	'PK',	'MK');
INSERT INTO @tbl VALUES ('Paktika',	'Nika',	'PK',	'NI');
INSERT INTO @tbl VALUES ('Paktika',	'Omna',	'PK',	'OM');
INSERT INTO @tbl VALUES ('Paktika',	'Sarobi',	'PK',	'SB');
INSERT INTO @tbl VALUES ('Paktika',	'Sar Hawza',	'PK',	'SH');
INSERT INTO @tbl VALUES ('Paktika',	'Sharan',	'PK',	'SN');
INSERT INTO @tbl VALUES ('Paktika',	'Turwo',	'PK',	'TU');
INSERT INTO @tbl VALUES ('Paktika',	'Urgun',	'PK',	'UR');
INSERT INTO @tbl VALUES ('Paktika',	'Waza Khwa',	'PK',	'WA');
INSERT INTO @tbl VALUES ('Paktika',	'Wor Mamay',	'PK',	'WO');
INSERT INTO @tbl VALUES ('Paktika',	'Yosuf Khel',	'PK',	'YK');
INSERT INTO @tbl VALUES ('Paktika',	'Yahya Khel',	'PK',	'YY');
INSERT INTO @tbl VALUES ('Paktika',	'Ziruk',	'PK',	'ZI');
INSERT INTO @tbl VALUES ('Paktika',	'Zarghun Shahr',	'PK',	'ZS');
INSERT INTO @tbl VALUES ('Paktia',	'Ahmadabad',	'PT',	'AH');
INSERT INTO @tbl VALUES ('Paktia',	'Chamkani',	'PT',	'CH');
INSERT INTO @tbl VALUES ('Paktia',	'Dand wa Patan',	'PT',	'DP');
INSERT INTO @tbl VALUES ('Paktia',	'Gardez',	'PT',	'GA');
INSERT INTO @tbl VALUES ('Paktia',	'Jadran',	'PT',	'JD');
INSERT INTO @tbl VALUES ('Paktia',	'Jaji',	'PT',	'JJ');
INSERT INTO @tbl VALUES ('Paktia',	'Jani Khel',	'PT',	'JK');
INSERT INTO @tbl VALUES ('Paktia',	'Lija Mangal',	'PT',	'LM');
INSERT INTO @tbl VALUES ('Paktia',	'Sayid Karam',	'PT',	'SK');
INSERT INTO @tbl VALUES ('Paktia',	'Shwak',	'PT',	'SW');
INSERT INTO @tbl VALUES ('Paktia',	'Zurmat',	'PT',	'ZU');
INSERT INTO @tbl VALUES ('Parvan',	'Bagram',	'PV',	'BA');
INSERT INTO @tbl VALUES ('Parvan',	'Chaharikar',	'PV',	'CH');
INSERT INTO @tbl VALUES ('Parvan',	'Ghorband',	'PV',	'GH');
INSERT INTO @tbl VALUES ('Parvan',	'Jabalussaraj',	'PV',	'JA');
INSERT INTO @tbl VALUES ('Parvan',	'Kohi Safi',	'PV',	'KS');
INSERT INTO @tbl VALUES ('Parvan',	'Shekh Ali',	'PV',	'SA');
INSERT INTO @tbl VALUES ('Parvan',	'Shinwari',	'PV',	'SH');
INSERT INTO @tbl VALUES ('Parvan',	'Sayd Khel',	'PV',	'SK');
INSERT INTO @tbl VALUES ('Parvan',	'Salang',	'PV',	'SL');
INSERT INTO @tbl VALUES ('Parvan',	'Surkhi Parsa',	'PV',	'SP');
INSERT INTO @tbl VALUES ('Samangan',	'Aybak',	'SM',	'AY');
INSERT INTO @tbl VALUES ('Samangan',	'Dara-i-Sufi Bala',	'SM',	'DB');
INSERT INTO @tbl VALUES ('Samangan',	'Dara-i-Suf',	'SM',	'DS');
INSERT INTO @tbl VALUES ('Samangan',	'Feroz Nakhchir',	'SM',	'FN');
INSERT INTO @tbl VALUES ('Samangan',	'Hazrati Sultan',	'SM',	'HS');
INSERT INTO @tbl VALUES ('Samangan',	'Khuram wa Sarbagh',	'SM',	'KS');
INSERT INTO @tbl VALUES ('Samangan',	'Ruyi Du Ab',	'SM',	'RA');
INSERT INTO @tbl VALUES ('Sar-e Pol',	'Balkhab',	'SP',	'BA');
INSERT INTO @tbl VALUES ('Sar-e Pol',	'Gosfandi',	'SP',	'GO');
INSERT INTO @tbl VALUES ('Sar-e Pol',	'Kohistanat',	'SP',	'KO');
INSERT INTO @tbl VALUES ('Sar-e Pol',	'Sangcharak',	'SP',	'SA');
INSERT INTO @tbl VALUES ('Sar-e Pol',	'Sari Pul',	'SP',	'SP');
INSERT INTO @tbl VALUES ('Sar-e Pol',	'Sozma Qala',	'SP',	'SQ');
INSERT INTO @tbl VALUES ('Sar-e Pol',	'Sayyad',	'SP',	'SY');
INSERT INTO @tbl VALUES ('Takhar',	'Bangi',	'TK',	'BA');
INSERT INTO @tbl VALUES ('Takhar',	'Baharak',	'TK',	'BK');
INSERT INTO @tbl VALUES ('Takhar',	'Chah Ab',	'TK',	'CA');
INSERT INTO @tbl VALUES ('Takhar',	'Chal',	'TK',	'CL');
INSERT INTO @tbl VALUES ('Takhar',	'Darqad',	'TK',	'DA');
INSERT INTO @tbl VALUES ('Takhar',	'Dashti Qala',	'TK',	'DQ');
INSERT INTO @tbl VALUES ('Takhar',	'Farkhar',	'TK',	'FA');
INSERT INTO @tbl VALUES ('Takhar',	'Hazar Sumuch',	'TK',	'HS');
INSERT INTO @tbl VALUES ('Takhar',	'Ishkamish',	'TK',	'IS');
INSERT INTO @tbl VALUES ('Takhar',	'Kalafgan',	'TK',	'KA');
INSERT INTO @tbl VALUES ('Takhar',	'Khwaja Bahawuddin',	'TK',	'KB');
INSERT INTO @tbl VALUES ('Takhar',	'Khwaja Ghar',	'TK',	'KG');
INSERT INTO @tbl VALUES ('Takhar',	'Namak Ab',	'TK',	'NA');
INSERT INTO @tbl VALUES ('Takhar',	'Rustaq',	'TK',	'RU');
INSERT INTO @tbl VALUES ('Takhar',	'Taluqan',	'TK',	'TA');
INSERT INTO @tbl VALUES ('Takhar',	'Warsaj',	'TK',	'WA');
INSERT INTO @tbl VALUES ('Takhar',	'Yangi Qala',	'TK',	'YQ');
INSERT INTO @tbl VALUES ('Vardak',	'Chaki Wardak',	'VR',	'CH');
INSERT INTO @tbl VALUES ('Vardak',	'Day Mirdad',	'VR',	'DA');
INSERT INTO @tbl VALUES ('Vardak',	'Hisa-i-Awali Bihsud',	'VR',	'HB');
INSERT INTO @tbl VALUES ('Vardak',	'Jaghatu',	'VR',	'JG');
INSERT INTO @tbl VALUES ('Vardak',	'Jalrez',	'VR',	'JL');
INSERT INTO @tbl VALUES ('Vardak',	'Markazi Bihsud',	'VR',	'MB');
INSERT INTO @tbl VALUES ('Vardak',	'Maydan Shahr',	'VR',	'MS');
INSERT INTO @tbl VALUES ('Vardak',	'Nirkh',	'VR',	'NI');
INSERT INTO @tbl VALUES ('Vardak',	'Sayd Abad',	'VR',	'SA');
INSERT INTO @tbl VALUES ('Zabol',	'Arghandab',	'ZB',	'AR');
INSERT INTO @tbl VALUES ('Zabol',	'Atghar',	'ZB',	'AT');
INSERT INTO @tbl VALUES ('Zabol',	'Daychopan',	'ZB',	'DA');
INSERT INTO @tbl VALUES ('Zabol',	'Kakar',	'ZB',	'KA');
INSERT INTO @tbl VALUES ('Zabol',	'Mizan',	'ZB',	'MI');
INSERT INTO @tbl VALUES ('Zabol',	'Naw Bahar',	'ZB',	'NB');
INSERT INTO @tbl VALUES ('Zabol',	'Qalat',	'ZB',	'QA');
INSERT INTO @tbl VALUES ('Zabol',	'Shahjoy',	'ZB',	'SJ');
INSERT INTO @tbl VALUES ('Zabol',	'Shinkay',	'ZB',	'SK');
INSERT INTO @tbl VALUES ('Zabol',	'Shamulzayi',	'ZB',	'SZ');
INSERT INTO @tbl VALUES ('Zabol',	'Tarnak wa Jaldak',	'ZB',	'TJ');

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


