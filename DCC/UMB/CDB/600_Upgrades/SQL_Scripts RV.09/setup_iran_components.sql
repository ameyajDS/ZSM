
/* ==================================================================================
    	Source File		:	setup_iran_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Iran are set-up
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
WHERE	country_nm	=	'Iran';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Iran not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'County',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Abadan',	'KZ',	'AB');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Abadeh',	'FA',	'AB');
INSERT INTO @tbl VALUES ('Yazd'            ,	     'Abarkuh',	'YA',	'AB');
INSERT INTO @tbl VALUES ('Ilam'            ,	     'Abdanan',	'IL',	'AB');
INSERT INTO @tbl VALUES ('Zanjan'            ,	     'Abhar',	'ZA',	'AB');
INSERT INTO @tbl VALUES ('Hormozgan'            ,	     'Abumusa',	'HG',	'AB');
INSERT INTO @tbl VALUES ('Qazvin'            ,	     'Abyek',	'QZ',	'AB');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Ahar',	'EA',	'AH');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Ahvaz',	'KZ',	'AH');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Ajabshir',	'EA',	'AJ');
INSERT INTO @tbl VALUES ('Golestan'            ,	     'Aliabad',	'GO',	'AL');
INSERT INTO @tbl VALUES ('Lorestan'            ,	     'Aligudarz',	'LO',	'AL');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Amlash',	'GI',	'AM');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Amol',	'MN',	'AM');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Anbarabad',	'KE',	'AN');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Andimeshk',	'KZ',	'AN');
INSERT INTO @tbl VALUES ('Golestan'            ,	     'Aq Qala',	'GO',	'AQ');
INSERT INTO @tbl VALUES ('Markazi'            ,	     'Arak',	'MK',	'AR');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Aran and Bidgol',	'ES',	'AB');
INSERT INTO @tbl VALUES ('Yazd'            ,	     'Ardakan',	'YA',	'AR');
INSERT INTO @tbl VALUES ('Chahar Mahall and Bakhtiari'            ,	     'Ardal',	'CM',	'AR');
INSERT INTO @tbl VALUES ('Ardebil'            ,	     'Ardebil',	'AR',	'AR');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Ardestan',	'ES',	'AR');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Arsanjan',	'FA',	'AR');
INSERT INTO @tbl VALUES ('Hamadan'            ,	     'Asadabad',	'HD',	'AS');
INSERT INTO @tbl VALUES ('Markazi'            ,	     'Ashtiyan',	'MK',	'AS');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Astaneh-ye-Ashrafiyeh',	'GI',	'AA');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Astara',	'GI',	'AS');
INSERT INTO @tbl VALUES ('Golestan'            ,	     'Azadshahr',	'GO',	'AZ');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Azarshahr',	'EA',	'AZ');
INSERT INTO @tbl VALUES ('Lorestan'            ,	     'Azna',	'LO',	'AZ');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Babol',	'MN',	'BL');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Babolsar',	'MN',	'BS');
INSERT INTO @tbl VALUES ('Yazd'            ,	     'Bafq',	'YA',	'BA');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Baft',	'KE',	'BF');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Baghemalek',	'KZ',	'BG');
INSERT INTO @tbl VALUES ('Hamadan'            ,	     'Bahar',	'HD',	'BA');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Bam',	'KE',	'BM');
INSERT INTO @tbl VALUES ('Hormozgan'            ,	     'Bandar-e-Abbas',	'HG',	'BA');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Bandar-e-Anzali',	'GI',	'BA');
INSERT INTO @tbl VALUES ('Golestan'            ,	     'Bandar-e-Gaz',	'GO',	'BG');
INSERT INTO @tbl VALUES ('Hormozgan'            ,	     'Bandar-e-Jask',	'HG',	'BJ');
INSERT INTO @tbl VALUES ('Hormozgan'            ,	     'Bandar-e-Lengeh',	'HG',	'BL');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Bandar-e-Mahshahr',	'KZ',	'BM');
INSERT INTO @tbl VALUES ('Kordestan'            ,	     'Baneh',	'KD',	'BA');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Bardeskan',	'KV',	'BA');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Bardsir',	'KE',	'BR');
INSERT INTO @tbl VALUES ('Hormozgan'            ,	     'Bastak',	'HG',	'BS');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Behbahan',	'KZ',	'BE');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Behshahr',	'MN',	'BR');
INSERT INTO @tbl VALUES ('Kordestan'            ,	     'Bijar',	'KD',	'BI');
INSERT INTO @tbl VALUES ('Ardebil'            ,	     'Bilehsavar',	'AR',	'BI');
INSERT INTO @tbl VALUES ('South Khorasan'            ,	     'Birjand',	'KJ',	'BI');
INSERT INTO @tbl VALUES ('North Khorasan'            ,	     'Bojnurd',	'KS',	'BO');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Bonab',	'EA',	'BN');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Borkhar and Meymeh',	'ES',	'BM');
INSERT INTO @tbl VALUES ('Chahar Mahall and Bakhtiari'            ,	     'Borujen',	'CM',	'BO');
INSERT INTO @tbl VALUES ('Lorestan'            ,	     'Borujerd',	'LO',	'BO');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Bostanabad',	'EA',	'BO');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Bovanat',	'FA',	'BO');
INSERT INTO @tbl VALUES ('Kohgiluyeh and Buyer Ahmad'            ,	     'Boyer Ahmad',	'KB',	'BA');
INSERT INTO @tbl VALUES ('Qazvin'            ,	     'Boyinzahra',	'QZ',	'BO');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Bukan',	'WA',	'BU');
INSERT INTO @tbl VALUES ('Bushehr'            ,	     'Bushehr',	'BS',	'BU');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Chadegan',	'ES',	'CH');
INSERT INTO @tbl VALUES ('Sistan and Baluchestan'            ,	     'Chahbahar',	'SB',	'CH');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Chaldoran',	'WA',	'CH');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Chalus',	'MN',	'CH');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Charoimaq',	'EA',	'CH');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Chenaran',	'KV',	'CH');
INSERT INTO @tbl VALUES ('Lorestan'            ,	     'Dalfan',	'LO',	'DA');
INSERT INTO @tbl VALUES ('Tehran'            ,	     'Damavand',	'TE',	'DA');
INSERT INTO @tbl VALUES ('Semnan'            ,	     'Damghan',	'SM',	'DA');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Darab',	'FA',	'DA');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Darrehgaz',	'KV',	'DA');
INSERT INTO @tbl VALUES ('Ilam'            ,	     'Darrehshahr',	'IL',	'DA');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Dasht-e-Azadegan',	'KZ',	'DA');
INSERT INTO @tbl VALUES ('Bushehr'            ,	     'Dashtestan',	'BS',	'DN');
INSERT INTO @tbl VALUES ('Bushehr'            ,	     'Dashti',	'BS',	'DS');
INSERT INTO @tbl VALUES ('Bushehr'            ,	     'Dayyer',	'BS',	'DY');
INSERT INTO @tbl VALUES ('Ilam'            ,	     'Dehloran',	'IL',	'DE');
INSERT INTO @tbl VALUES ('Markazi'            ,	     'Delijan',	'MK',	'DE');
INSERT INTO @tbl VALUES ('Kohgiluyeh and Buyer Ahmad'            ,	     'Dena',	'KB',	'DE');
INSERT INTO @tbl VALUES ('Bushehr'            ,	     'Deylam',	'BS',	'DM');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Dezful',	'KZ',	'DE');
INSERT INTO @tbl VALUES ('Kordestan'            ,	     'Divandarreh',	'KD',	'DI');
INSERT INTO @tbl VALUES ('Lorestan'            ,	     'Dorud',	'LO',	'DO');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Eqlid',	'FA',	'EQ');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Esfahan',	'ES',	'ES');
INSERT INTO @tbl VALUES ('North Khorasan'            ,	     'Esfarayen',	'KS',	'ES');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Eslamabad-e-Gharb',	'BK',	'EG');
INSERT INTO @tbl VALUES ('Tehran'            ,	     'Eslamshahr',	'TE',	'ES');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Estahban',	'FA',	'ES');
INSERT INTO @tbl VALUES ('Ilam'            ,	     'Eyvan',	'IL',	'EY');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Falavarjan',	'ES',	'FL');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Farashband',	'FA',	'FB');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Faridan',	'ES',	'FD');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Fariman',	'KV',	'FA');
INSERT INTO @tbl VALUES ('Chahar Mahall and Bakhtiari'            ,	     'Farsan',	'CM',	'FA');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Fasa',	'FA',	'FA');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Ferdows',	'KV',	'FE');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Fereydunshahr',	'ES',	'FE');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Firozabad',	'FA',	'FI');
INSERT INTO @tbl VALUES ('Tehran'            ,	     'Firuzkuh',	'TE',	'FI');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Fuman',	'GI',	'FU');
INSERT INTO @tbl VALUES ('Kohgiluyeh and Buyer Ahmad'            ,	     'Gachsaran',	'KB',	'GA');
INSERT INTO @tbl VALUES ('Semnan'            ,	     'Garmsar',	'SM',	'GA');
INSERT INTO @tbl VALUES ('Bushehr'            ,	     'Genaveh',	'BS',	'GE');
INSERT INTO @tbl VALUES ('Ardebil'            ,	     'Germi',	'AR',	'GE');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Gilan-e-Gharb',	'BK',	'GG');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Golpayegan',	'ES',	'GO');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Gonabad',	'KV',	'GO');
INSERT INTO @tbl VALUES ('Golestan'            ,	     'Gonbad-e-Kavus',	'GO',	'GK');
INSERT INTO @tbl VALUES ('Golestan'            ,	     'Gorgan',	'GO',	'GO');
INSERT INTO @tbl VALUES ('Hormozgan'            ,	     'Hajiabad',	'HG',	'HA');
INSERT INTO @tbl VALUES ('Hamadan'            ,	     'Hamadan',	'HD',	'HA');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Handegan',	'KZ',	'HA');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Haris',	'EA',	'HR');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Harsin',	'BK',	'HA');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Hashtrud',	'EA',	'HS');
INSERT INTO @tbl VALUES ('Zanjan'            ,	     'Ijerod',	'ZA',	'IJ');
INSERT INTO @tbl VALUES ('Ilam'            ,	     'Ilam',	'IL',	'IL');
INSERT INTO @tbl VALUES ('Sistan and Baluchestan'            ,	     'Iranshahr',	'SB',	'IR');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Izeh',	'KZ',	'IZ');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Jahrom',	'FA',	'JA');
INSERT INTO @tbl VALUES ('North Khorasan'            ,	     'Jajarm',	'KS',	'JJ');
INSERT INTO @tbl VALUES ('Bushehr'            ,	     'Jam',	'BS',	'JM');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Javanrud',	'BK',	'JA');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Jiroft',	'KE',	'JI');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Jolfa',	'EA',	'JO');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Juybar',	'MN',	'JB');
INSERT INTO @tbl VALUES ('Hamadan'            ,	     'Kabudarahang',	'HD',	'KA');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Kahnuj',	'KE',	'KA');
INSERT INTO @tbl VALUES ('Golestan'            ,	     'Kalaleh',	'GO',	'KA');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Kalat',	'KV',	'KL');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Kaleibar',	'EA',	'KA');
INSERT INTO @tbl VALUES ('Kordestan'            ,	     'Kamyaran',	'KD',	'KA');
INSERT INTO @tbl VALUES ('Bushehr'            ,	     'Kangan',	'BS',	'KA');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Kangavar',	'BK',	'KA');
INSERT INTO @tbl VALUES ('Alborz'            ,	     'Karaj',	'AL',	'KA');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Kashan',	'ES',	'KA');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Kashmar',	'KV',	'KA');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Kazerun',	'FA',	'KA');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Kerman',	'KE',	'KE');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Kermanshah',	'BK',	'KE');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Khaf',	'KV',	'KH');
INSERT INTO @tbl VALUES ('Ardebil'            ,	     'Khalkhal',	'AR',	'KH');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Khansar',	'ES',	'KN');
INSERT INTO @tbl VALUES ('Sistan and Baluchestan'            ,	     'Khash',	'SB',	'KH');
INSERT INTO @tbl VALUES ('Yazd'            ,	     'Khatam',	'YA',	'KH');
INSERT INTO @tbl VALUES ('Zanjan'            ,	     'Khodabandeh',	'ZA',	'KH');
INSERT INTO @tbl VALUES ('Markazi'            ,	     'Khomeyn',	'MK',	'KH');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Khomeynishahr',	'ES',	'KR');
INSERT INTO @tbl VALUES ('Lorestan'            ,	     'Khorramabad',	'LO',	'KH');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Khorrambid',	'FA',	'KH');
INSERT INTO @tbl VALUES ('Zanjan'            ,	     'Khorramdarreh',	'ZA',	'KR');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Khorramshahr',	'KZ',	'KH');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Khoy',	'WA',	'KH');
INSERT INTO @tbl VALUES ('Kohgiluyeh and Buyer Ahmad'            ,	     'Kohgiluyeh',	'KB',	'KO');
INSERT INTO @tbl VALUES ('Markazi'            ,	     'Komeijan',	'MK',	'KJ');
INSERT INTO @tbl VALUES ('Golestan'            ,	     'Kordkuy',	'GO',	'KO');
INSERT INTO @tbl VALUES ('Ardebil'            ,	     'Kowsar',	'AR',	'KO');
INSERT INTO @tbl VALUES ('Lorestan'            ,	     'Kuhdasht',	'LO',	'KU');
INSERT INTO @tbl VALUES ('Chahar Mahall and Bakhtiari'            ,	     'Kuhrang',	'CM',	'KU');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Lahijan',	'GI',	'LA');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Lali',	'KZ',	'LA');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Lamard',	'FA',	'LD');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Langrud',	'GI',	'LG');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Lanjan',	'ES',	'LA');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Lar',	'FA',	'LR');
INSERT INTO @tbl VALUES ('Chahar Mahall and Bakhtiari'            ,	     'Lordakan',	'CM',	'LO');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Mahabad',	'WA',	'MB');
INSERT INTO @tbl VALUES ('Markazi'            ,	     'Mahalat',	'MK',	'MA');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Mahmudabad',	'MN',	'MA');
INSERT INTO @tbl VALUES ('Zanjan'            ,	     'Mahneshan',	'ZA',	'MA');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Maku',	'WA',	'MK');
INSERT INTO @tbl VALUES ('Hamadan'            ,	     'Malayer',	'HD',	'MA');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Malekan',	'EA',	'ML');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Mamasany',	'FA',	'MM');
INSERT INTO @tbl VALUES ('North Khorasan'            ,	     'Maneh and Samalqan',	'KS',	'MS');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Manujan',	'KE',	'MA');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Maragheh',	'EA',	'MG');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Marand',	'EA',	'MD');
INSERT INTO @tbl VALUES ('Kordestan'            ,	     'Marivan',	'KD',	'MA');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Marvdasht',	'FA',	'MD');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Masal',	'GI',	'MA');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Mashhad',	'KV',	'MA');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Masjed Soleyman',	'KZ',	'MS');
INSERT INTO @tbl VALUES ('Ilam'            ,	     'Mehran',	'IL',	'ME');
INSERT INTO @tbl VALUES ('Yazd'            ,	     'Mehriz',	'YA',	'MH');
INSERT INTO @tbl VALUES ('Ardebil'            ,	     'Meshkinshahr',	'AR',	'ME');
INSERT INTO @tbl VALUES ('Yazd'            ,	     'Meybod',	'YA',	'MD');
INSERT INTO @tbl VALUES ('Hormozgan'            ,	     'Minab',	'HG',	'MI');
INSERT INTO @tbl VALUES ('Golestan'            ,	     'Minudasht',	'GO',	'MI');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Miyandoab',	'WA',	'MI');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Miyaneh',	'EA',	'MI');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Mobarakeh',	'ES',	'MO');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Mohr',	'FA',	'MR');
INSERT INTO @tbl VALUES ('Hamadan'            ,	     'Nahavand',	'HD',	'NA');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Najafabad',	'ES',	'NJ');
INSERT INTO @tbl VALUES ('Ardebil'            ,	     'Namin',	'AR',	'NM');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Naqadeh',	'WA',	'NA');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Natanz',	'ES',	'NT');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Nayin',	'ES',	'NY');
INSERT INTO @tbl VALUES ('Alborz'            ,	     'Nazarabad',	'AL',	'NA');
INSERT INTO @tbl VALUES ('Ardebil'            ,	     'Neer',	'AR',	'NR');
INSERT INTO @tbl VALUES ('South Khorasan'            ,	     'Nehbandan',	'KJ',	'NB');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Neka',	'MN',	'NE');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Neyriz',	'FA',	'NE');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Neyshabur',	'KV',	'NS');
INSERT INTO @tbl VALUES ('Sistan and Baluchestan'            ,	     'Nikshahr',	'SB',	'NI');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Noshahr',	'MN',	'NO');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Nur',	'MN',	'NU');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Omidiyeh',	'KZ',	'OM');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Orumiyeh',	'WA',	'OR');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Oshnaviyeh',	'WA',	'OS');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Osku',	'EA',	'OS');
INSERT INTO @tbl VALUES ('Tehran'            ,	     'Pakdasht',	'TE',	'PA');
INSERT INTO @tbl VALUES ('Ardebil'            ,	     'Parsabad',	'AR',	'PA');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Paveh',	'BK',	'PA');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Piranshahr',	'WA',	'PI');
INSERT INTO @tbl VALUES ('Lorestan'            ,	     'Poldokhtar',	'LO',	'PO');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Qaemshahr',	'MN',	'QA');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Qasr-e-Shirin',	'BK',	'QS');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Qayenat',	'KV',	'QA');
INSERT INTO @tbl VALUES ('Qazvin'            ,	     'Qazvin',	'QZ',	'QZ');
INSERT INTO @tbl VALUES ('Hormozgan'            ,	     'Qeshm',	'HG',	'QE');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Qirokarzin',	'FA',	'QI');
INSERT INTO @tbl VALUES ('Qom'            ,	     'Qom',	'QM',	'QM');
INSERT INTO @tbl VALUES ('Kordestan'            ,	     'Qorveh',	'KD',	'QO');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Quchan',	'KV',	'QU');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Rafsanjan',	'KE',	'RA');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Ramhormoz',	'KZ',	'RA');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Ramsar',	'MN',	'RA');
INSERT INTO @tbl VALUES ('Golestan'            ,	     'Ramyan',	'GO',	'RA');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Rasht',	'GI',	'RA');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Rashtkhar',	'KV',	'RA');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Ravar',	'KE',	'RV');
INSERT INTO @tbl VALUES ('Hamadan'            ,	     'Razan',	'HD',	'RA');
INSERT INTO @tbl VALUES ('Tehran'            ,	     'Rey',	'TE',	'RE');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Rezvanshahr',	'GI',	'RZ');
INSERT INTO @tbl VALUES ('Tehran'            ,	     'Robatkarim',	'TE',	'RO');
INSERT INTO @tbl VALUES ('Hormozgan'            ,	     'Rudan',	'HG',	'RU');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Rudbar',	'GI',	'RB');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Rudsar',	'GI',	'RS');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Sabzevar',	'KV',	'AB');
INSERT INTO @tbl VALUES ('Yazd'            ,	     'Sadugh',	'YA',	'SA');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Sahneh',	'BK',	'SH');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Salas-e-Babajani',	'BK',	'SB');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Salmas',	'WA',	'SL');
INSERT INTO @tbl VALUES ('Kordestan'            ,	     'Sanandaj',	'KD',	'SA');
INSERT INTO @tbl VALUES ('Kordestan'            ,	     'Saqqez',	'KD',	'SQ');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Sar-e-Pol-e-Zohab',	'BK',	'SP');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Sarab',	'EA',	'SA');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Sarakhs',	'KV',	'SK');
INSERT INTO @tbl VALUES ('Sistan and Baluchestan'            ,	     'Saravan',	'SB',	'SA');
INSERT INTO @tbl VALUES ('Sistan and Baluchestan'            ,	     'Sarbaz',	'SB',	'SB');
INSERT INTO @tbl VALUES ('South Khorasan'            ,	     'Sarbisheh',	'KJ',	'SB');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Sardasht',	'WA',	'SD');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Sari',	'MN',	'SR');
INSERT INTO @tbl VALUES ('Kordestan'            ,	     'Sarvabad',	'KD',	'SV');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Savadkuh',	'MN',	'SD');
INSERT INTO @tbl VALUES ('Markazi'            ,	     'Saveh',	'MK',	'SH');
INSERT INTO @tbl VALUES ('Alborz'            ,	     'Savojbolagh',	'AL',	'SA');
INSERT INTO @tbl VALUES ('Lorestan'            ,	     'Selseleh',	'LO',	'SE');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Semirom',	'ES',	'SE');
INSERT INTO @tbl VALUES ('Semnan'            ,	     'Semnan',	'SM',	'SE');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Sepidan',	'FA',	'SE');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Shabestar',	'EA',	'SH');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Shadegan',	'KZ',	'SD');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Shaft',	'GI',	'SH');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Shahindezh',	'WA',	'SH');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Shahr-e-Babak',	'KE',	'SB');
INSERT INTO @tbl VALUES ('Chahar Mahall and Bakhtiari'            ,	     'Shahr-e-Kord',	'CM',	'SK');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Shahreza',	'ES',	'SH');
INSERT INTO @tbl VALUES ('Tehran'            ,	     'Shahriyar',	'TE',	'SR');
INSERT INTO @tbl VALUES ('Semnan'            ,	     'Shahrud',	'SM',	'SH');
INSERT INTO @tbl VALUES ('Markazi'            ,	     'Shazand',	'MK',	'SZ');
INSERT INTO @tbl VALUES ('Tehran'            ,	     'Shemiranat',	'TE',	'ST');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Shiraz',	'FA',	'SH');
INSERT INTO @tbl VALUES ('North Khorasan'            ,	     'Shirvan',	'KS',	'SV');
INSERT INTO @tbl VALUES ('Ilam'            ,	     'Shirvan and Chard-e-Aval',	'IL',	'SC');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Shush',	'KZ',	'SS');
INSERT INTO @tbl VALUES ('Khuzestan'            ,	     'Shushtar',	'KZ',	'ST');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Siahkal',	'GI',	'SK');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Sirjan',	'KE',	'SI');
INSERT INTO @tbl VALUES ('Kermanshah'            ,	     'Sonqor',	'BK',	'SO');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Sume''eh Sara',	'GI',	'SU');
INSERT INTO @tbl VALUES ('Yazd'            ,	     'Tabas',	'YA',	'TB');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Tabriz',	'EA',	'TA');
INSERT INTO @tbl VALUES ('Markazi'            ,	     'Tafresh',	'MK',	'TA');
INSERT INTO @tbl VALUES ('Yazd'            ,	     'Taft',	'YA',	'TA');
INSERT INTO @tbl VALUES ('West Azarbaijan'            ,	     'Takab',	'WA',	'TA');
INSERT INTO @tbl VALUES ('Qazvin'            ,	     'Takestan',	'QZ',	'TA');
INSERT INTO @tbl VALUES ('Bushehr'            ,	     'Tangestan',	'BS',	'TA');
INSERT INTO @tbl VALUES ('Zanjan'            ,	     'Tarom',	'ZA',	'TA');
INSERT INTO @tbl VALUES ('Gilan'            ,	     'Tavalesh',	'GI',	'TA');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Taybad',	'KV',	'TD');
INSERT INTO @tbl VALUES ('Tehran'            ,	     'Tehran',	'TE',	'TE');
INSERT INTO @tbl VALUES ('Esfahan'            ,	     'Tiran and Karvan',	'ES',	'TK');
INSERT INTO @tbl VALUES ('Mazandaran'            ,	     'Tonekabon',	'MN',	'TO');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Torbat-e-Heydariyeh',	'KV',	'TH');
INSERT INTO @tbl VALUES ('Razavi Khorasan'            ,	     'Torbat-e-Jam',	'KV',	'TJ');
INSERT INTO @tbl VALUES ('Golestan'            ,	     'Torkaman',	'GO',	'TO');
INSERT INTO @tbl VALUES ('Hamadan'            ,	     'Tuyserkan',	'HD',	'TU');
INSERT INTO @tbl VALUES ('Tehran'            ,	     'Varamin',	'TE',	'VA');
INSERT INTO @tbl VALUES ('East Azarbaijan'            ,	     'Varzaqan',	'EA',	'VA');
INSERT INTO @tbl VALUES ('Yazd'            ,	     'Yazd',	'YA',	'YA');
INSERT INTO @tbl VALUES ('Sistan and Baluchestan'            ,	     'Zabol',	'SB',	'ZB');
INSERT INTO @tbl VALUES ('Sistan and Baluchestan'            ,	     'Zahedan',	'SB',	'ZD');
INSERT INTO @tbl VALUES ('Zanjan'            ,	     'Zanjan',	'ZA',	'ZA');
INSERT INTO @tbl VALUES ('Kerman'            ,	     'Zarand',	'KE',	'ZA');
INSERT INTO @tbl VALUES ('Markazi'            ,	     'Zarandiyeh',	'MK',	'ZA');
INSERT INTO @tbl VALUES ('Fars'            ,	     'Zarrindasht',	'FA',	'ZA');

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

