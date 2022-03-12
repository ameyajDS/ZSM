
/* ==================================================================================
    	Source File		:	setup_indonesia_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Indonesia are set-up
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
WHERE	country_nm	=	'Indonesia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Indonesia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Regency',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Aceh'            ,	     'Aceh Barat',	'AC',	'AB');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Aceh Barat Daya',	'AC',	'AD');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Aceh Besar',	'AC',	'AR');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Aceh Jaya',	'AC',	'AJ');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Aceh Selatan',	'AC',	'AS');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Aceh Singkil',	'AC',	'AN');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Aceh Tamiang',	'AC',	'AM');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Aceh Tengah',	'AC',	'AT');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Aceh Tenggara',	'AC',	'AG');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Aceh Timur',	'AC',	'AI');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Aceh Utara',	'AC',	'AU');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Agam',	'SB',	'AG');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Alor',	'NT',	'AL');
INSERT INTO @tbl VALUES ('Maluku'            ,	     'Ambon',	'MA',	'AM');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Asahan',	'SU',	'AN');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Asmat',	'PA',	'AS');
INSERT INTO @tbl VALUES ('Bali'            ,	     'Badung',	'BA',	'BD');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Balangan',	'KS',	'BA');
INSERT INTO @tbl VALUES ('Kalimantan Timur'            ,	     'Balikpapan',	'KM',	'BA');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Banda Aceh',	'AC',	'BA');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Bandar Lampung',	'LA',	'BL');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Bandung',	'JR',	'BU');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Bandung Barat',	'JR',	'BB');
INSERT INTO @tbl VALUES ('Sulawesi Tengah'            ,	     'Banggai',	'ST',	'BA');
INSERT INTO @tbl VALUES ('Sulawesi Tengah'            ,	     'Banggai Kepulauan',	'ST',	'BK');
INSERT INTO @tbl VALUES ('Bangka-Belitung'            ,	     'Bangka',	'BB',	'BA');
INSERT INTO @tbl VALUES ('Bangka-Belitung'            ,	     'Bangka Barat',	'BB',	'BB');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Bangkalan',	'JI',	'BK');
INSERT INTO @tbl VALUES ('Bangka-Belitung'            ,	     'Bangka Selatan',	'BB',	'BS');
INSERT INTO @tbl VALUES ('Bangka-Belitung'            ,	     'Bangka Tengah',	'BB',	'BG');
INSERT INTO @tbl VALUES ('Bali'            ,	     'Bangli',	'BA',	'BN');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Banjar',	'KS',	'BN');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Banjar Baru',	'KS',	'BB');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Banjarmasin',	'KS',	'BM');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Banjarnegara',	'JT',	'BN');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Bantaeng',	'SE',	'BT');
INSERT INTO @tbl VALUES ('Yogyakarta'            ,	     'Bantul',	'YO',	'BA');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Banyuasin',	'SL',	'BA');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Banyumas',	'JT',	'BY');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Banyuwangi',	'JI',	'BW');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Barito Kuala',	'KS',	'BK');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Barito Selatan',	'KT',	'BS');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Barito Timur',	'KT',	'BT');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Barito Utara',	'KT',	'BU');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Barru',	'SE',	'BR');
INSERT INTO @tbl VALUES ('Kepulauan Riau'            ,	     'Batam',	'KR',	'BA');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Batang',	'JT',	'BT');
INSERT INTO @tbl VALUES ('Jambi'            ,	     'Batang Hari',	'JA',	'BA');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Batu',	'JI',	'BA');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Batu Bara',	'SU',	'BB');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Baubau',	'SG',	'BA');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Bekasi',	'JR',	'BS');
INSERT INTO @tbl VALUES ('Bangka-Belitung'            ,	     'Belitung',	'BB',	'BE');
INSERT INTO @tbl VALUES ('Bangka-Belitung'            ,	     'Belitung Timur',	'BB',	'BT');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Belu',	'NT',	'BE');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Bener Meriah',	'AC',	'BM');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Bengkalis',	'RI',	'BK');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Bengkayang',	'KB',	'BE');
INSERT INTO @tbl VALUES ('Bengkulu'            ,	     'Bengkulu',	'BE',	'BE');
INSERT INTO @tbl VALUES ('Bengkulu'            ,	     'Bengkulu Selatan',	'BE',	'BS');
INSERT INTO @tbl VALUES ('Bengkulu'            ,	     'Bengkulu Tengah',	'BE',	'BN');
INSERT INTO @tbl VALUES ('Bengkulu'            ,	     'Bengkulu Utara',	'BE',	'BT');
INSERT INTO @tbl VALUES ('Kalimantan Timur'            ,	     'Berau',	'KM',	'BE');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Biak Numfor',	'PA',	'BN');
INSERT INTO @tbl VALUES ('Nusa Tenggara Barat'            ,	     'Bima',	'NB',	'BI');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Binjai',	'SU',	'BI');
INSERT INTO @tbl VALUES ('Kepulauan Riau'            ,	     'Bintan',	'KR',	'KR');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Bireuen',	'AC',	'BI');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Bitung',	'SW',	'BI');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Blitar',	'JI',	'BR');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Blora',	'JT',	'BL');
INSERT INTO @tbl VALUES ('Gorontalo'            ,	     'Boalemo',	'GO',	'BO');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Bogor',	'JR',	'BR');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Bojonegoro',	'JI',	'BJ');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Bolaang Mongondow',	'SW',	'BO');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Bolaang Mongondow Selatan',	'SW',	'BS');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Bolaang Mongondow Timur',	'SW',	'BT');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Bolaang Mongondow Utara',	'SW',	'BU');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Bombana',	'SG',	'BO');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Bondowoso',	'JI',	'BD');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Bone',	'SE',	'BO');
INSERT INTO @tbl VALUES ('Gorontalo'            ,	     'Bone Bolango',	'GO',	'BB');
INSERT INTO @tbl VALUES ('Kalimantan Timur'            ,	     'Bontang',	'KM',	'BO');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Boven Digoel',	'PA',	'BD');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Boyolali',	'JT',	'BO');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Brebes',	'JT',	'BR');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Bukittinggi',	'SB',	'BU');
INSERT INTO @tbl VALUES ('Bali'            ,	     'Buleleng',	'BA',	'BL');
INSERT INTO @tbl VALUES ('Kalimantan Utara'            ,	     'Bulongan',	'KU',	'BL');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Bulukumba',	'SE',	'BU');
INSERT INTO @tbl VALUES ('Jambi'            ,	     'Bungo',	'JA',	'BT');
INSERT INTO @tbl VALUES ('Sulawesi Tengah'            ,	     'Buol',	'ST',	'BT');
INSERT INTO @tbl VALUES ('Maluku'            ,	     'Buru',	'MA',	'BR');
INSERT INTO @tbl VALUES ('Maluku'            ,	     'Buru Selatan',	'MA',	'BS');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Buton',	'SG',	'BN');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Buton Utara',	'SG',	'BT');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Ciamis',	'JR',	'CS');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Cianjur',	'JR',	'CJ');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Cilacap',	'JT',	'CI');
INSERT INTO @tbl VALUES ('Banten'            ,	     'Cilegon',	'BT',	'CL');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Cimahi',	'JR',	'CI');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Cirebon',	'JR',	'CR');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Dairi',	'SU',	'DA');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Deiyai',	'PA',	'DE');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Deli Serdang',	'SU',	'DS');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Demak',	'JT',	'DE');
INSERT INTO @tbl VALUES ('Bali'            ,	     'Denpasar',	'BA',	'DE');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Depok',	'JR',	'DE');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Dharmasraya',	'SB',	'DH');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Dogiyai',	'PA',	'DG');
INSERT INTO @tbl VALUES ('Nusa Tenggara Barat'            ,	     'Dompu',	'NB',	'DO');
INSERT INTO @tbl VALUES ('Sulawesi Tengah'            ,	     'Donggala',	'ST',	'DG');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Dumai',	'RI',	'DU');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Empat Lawang',	'SL',	'EL');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Ende',	'NT',	'EN');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Enrekang',	'SE',	'EN');
INSERT INTO @tbl VALUES ('Papua Barat'            ,	     'Fak-Fak',	'IB',	'FA');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Flores Timur',	'NT',	'FT');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Garut',	'JR',	'GA');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Gayo Lues',	'AC',	'GL');
INSERT INTO @tbl VALUES ('Bali'            ,	     'Gianyar',	'BA',	'GI');
INSERT INTO @tbl VALUES ('Gorontalo'            ,	     'Gorontalo',	'GO',	'GO');
INSERT INTO @tbl VALUES ('Gorontalo'            ,	     'Gorontalo Utara',	'GO',	'GU');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Gowa',	'SE',	'GO');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Gresik',	'JI',	'GR');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Grobogan',	'JT',	'GR');
INSERT INTO @tbl VALUES ('Yogyakarta'            ,	     'Gunung Kidul',	'YO',	'GK');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Gunung Mas',	'KT',	'GM');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Gunungsitoli',	'SU',	'GS');
INSERT INTO @tbl VALUES ('Maluku Utara'            ,	     'Halmahera Barat',	'MU',	'HB');
INSERT INTO @tbl VALUES ('Maluku Utara'            ,	     'Halmahera Selatan',	'MU',	'HS');
INSERT INTO @tbl VALUES ('Maluku Utara'            ,	     'Halmahera Tengah',	'MU',	'HT');
INSERT INTO @tbl VALUES ('Maluku Utara'            ,	     'Halmahera Timur',	'MU',	'HI');
INSERT INTO @tbl VALUES ('Maluku Utara'            ,	     'Halmahera Utara',	'MU',	'HR');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Hulu Sungai Selatan',	'KS',	'HS');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Hulu Sungai Tengah',	'KS',	'HT');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Hulu Sungai Utara',	'KS',	'HU');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Humbang Hasundutan',	'SU',	'HH');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Indragiri Hilir',	'RI',	'II');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Indragiri Hulu',	'RI',	'IU');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Indramayu',	'JR',	'IN');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Intan Jaya',	'PA',	'IJ');
INSERT INTO @tbl VALUES ('Jakarta Raya'            ,	     'Jakarta Barat',	'JK',	'JB');
INSERT INTO @tbl VALUES ('Jakarta Raya'            ,	     'Jakarta Pusat',	'JK',	'JP');
INSERT INTO @tbl VALUES ('Jakarta Raya'            ,	     'Jakarta Selatan',	'JK',	'JS');
INSERT INTO @tbl VALUES ('Jakarta Raya'            ,	     'Jakarta Timur',	'JK',	'JT');
INSERT INTO @tbl VALUES ('Jakarta Raya'            ,	     'Jakarta Utara',	'JK',	'JU');
INSERT INTO @tbl VALUES ('Jambi'            ,	     'Jambi',	'JA',	'JA');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Jayapura',	'PA',	'JR');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Jayawijaya',	'PA',	'JW');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Jember',	'JI',	'JE');
INSERT INTO @tbl VALUES ('Bali'            ,	     'Jembrana',	'BA',	'JE');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Jeneponto',	'SE',	'JE');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Jepara',	'JT',	'JE');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Jombang',	'JI',	'JO');
INSERT INTO @tbl VALUES ('Papua Barat'            ,	     'Kaimana',	'IB',	'KA');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Kampar',	'RI',	'KA');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Kapuas',	'KT',	'KA');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Kapuas Hulu',	'KB',	'KH');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Karanganyar',	'JT',	'KA');
INSERT INTO @tbl VALUES ('Bali'            ,	     'Karang Asem',	'BA',	'KA');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Karawang',	'JR',	'KA');
INSERT INTO @tbl VALUES ('Kepulauan Riau'            ,	     'Karimun',	'KR',	'KA');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Karo',	'SU',	'KA');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Katingan',	'KT',	'KG');
INSERT INTO @tbl VALUES ('Bengkulu'            ,	     'Kaur',	'BE',	'KA');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Kayong Utara',	'KB',	'KU');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Kebumen',	'JT',	'KB');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Kediri',	'JI',	'KR');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Keerom',	'PA',	'KE');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Kendal',	'JT',	'KN');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Kendari',	'SG',	'KM');
INSERT INTO @tbl VALUES ('Bengkulu'            ,	     'Kepahiang',	'BE',	'KE');
INSERT INTO @tbl VALUES ('Kepulauan Riau'            ,	     'Kepulauan Anambas',	'KR',	'KM');
INSERT INTO @tbl VALUES ('Maluku'            ,	     'Kepulauan Aru',	'MA',	'KA');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Kepulauan Mentawai',	'SB',	'KM');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Kepulauan Meranti',	'RI',	'KM');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Kepulauan Sangihe',	'SW',	'SG');
INSERT INTO @tbl VALUES ('Jakarta Raya'            ,	     'Kepulauan Seribu',	'JK',	'KS');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Kep. Siau Tagolandang Biaro',	'SW',	'SB');
INSERT INTO @tbl VALUES ('Maluku Utara'            ,	     'Kepulauan Sula',	'MU',	'KS');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Kepulauan Talaud',	'SW',	'KS');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Kepulauan Yapen',	'PA',	'YW');
INSERT INTO @tbl VALUES ('Jambi'            ,	     'Kerinci',	'JA',	'KR');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Ketapang',	'KB',	'KP');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Klaten',	'JT',	'KL');
INSERT INTO @tbl VALUES ('Bali'            ,	     'Klungkung',	'BA',	'KL');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Kolaka',	'SG',	'KO');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Kolaka Utara',	'SG',	'KU');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Konawe',	'SG',	'KN');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Konawe Selatan',	'SG',	'KS');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Konawe Utara',	'SG',	'KW');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Kota Baru',	'KS',	'KB');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Kotamobagu',	'SW',	'KM');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Kotawaringin Barat',	'KT',	'KB');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Kotawaringin Timur',	'KT',	'KT');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Kuantan Singingi',	'RI',	'KS');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Kubu Raya',	'KB',	'KR');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Kudus',	'JT',	'KU');
INSERT INTO @tbl VALUES ('Yogyakarta'            ,	     'Kulon Progo',	'YO',	'KP');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Kuningan',	'JR',	'KU');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Kupang',	'NT',	'KP');
INSERT INTO @tbl VALUES ('Kalimantan Timur'            ,	     'Kutai Barat',	'KM',	'KB');
INSERT INTO @tbl VALUES ('Kalimantan Timur'            ,	     'Kutai Kartanegara',	'KM',	'KU');
INSERT INTO @tbl VALUES ('Kalimantan Timur'            ,	     'Kutai Timur',	'KM',	'KT');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Labuhan Batu',	'SU',	'LH');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Labuhanbatu Selatan',	'SU',	'LS');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Labuhanbatu Utara',	'SU',	'LU');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Lahat',	'SL',	'LT');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Lamandau',	'KT',	'LA');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Lamongan',	'JI',	'LA');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Lampung Barat',	'LA',	'LB');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Lampung Selatan',	'LA',	'LP');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Lampung Tengah',	'LA',	'LT');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Lampung Timur',	'LA',	'LI');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Lampung Utara',	'LA',	'LU');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Landak',	'KB',	'LA');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Langkat',	'SU',	'LA');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Langsa',	'AC',	'LA');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Lanny Jaya',	'PA',	'LJ');
INSERT INTO @tbl VALUES ('Banten'            ,	     'Lebak',	'BT',	'LE');
INSERT INTO @tbl VALUES ('Bengkulu'            ,	     'Lebong',	'BE',	'LE');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Lembata',	'NT',	'LE');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Lhokseumawe',	'AC',	'LH');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Lima Puluh Koto',	'SB',	'LP');
INSERT INTO @tbl VALUES ('Kepulauan Riau'            ,	     'Lingga',	'KR',	'LI');
INSERT INTO @tbl VALUES ('Nusa Tenggara Barat'            ,	     'Lombok Barat',	'NB',	'LR');
INSERT INTO @tbl VALUES ('Nusa Tenggara Barat'            ,	     'Lombok Tengah',	'NB',	'LT');
INSERT INTO @tbl VALUES ('Nusa Tenggara Barat'            ,	     'Lombok Timur',	'NB',	'LI');
INSERT INTO @tbl VALUES ('Nusa Tenggara Barat'            ,	     'Lombok Utara',	'NB',	'LU');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Lubuk Linggau',	'SL',	'LL');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Lumajang',	'JI',	'LU');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Luwu',	'SE',	'LW');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Luwu Timur',	'SE',	'LT');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Luwu Utara',	'SE',	'LU');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Madiun',	'JI',	'MN');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Magelang',	'JT',	'MR');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Magetan',	'JI',	'MT');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Majalengka',	'JR',	'MA');
INSERT INTO @tbl VALUES ('Sulawesi Barat'            ,	     'Majene',	'SR',	'MJ');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Makassar',	'SE',	'UP');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Malang',	'JI',	'MG');
INSERT INTO @tbl VALUES ('Kalimantan Utara'            ,	     'Malinau',	'KU',	'MA');
INSERT INTO @tbl VALUES ('Maluku'            ,	     'Maluku Barat Daya',	'MA',	'MD');
INSERT INTO @tbl VALUES ('Maluku'            ,	     'Maluku Tengah',	'MA',	'MT');
INSERT INTO @tbl VALUES ('Maluku'            ,	     'Maluku Tenggara',	'MA',	'MN');
INSERT INTO @tbl VALUES ('Maluku'            ,	     'Maluku Tenggara Barat',	'MA',	'MB');
INSERT INTO @tbl VALUES ('Sulawesi Barat'            ,	     'Mamasa',	'SR',	'MA');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Mamberamo Raya',	'PA',	'MR');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Mamberamo Tengah',	'PA',	'MT');
INSERT INTO @tbl VALUES ('Sulawesi Barat'            ,	     'Mamuju',	'SR',	'MM');
INSERT INTO @tbl VALUES ('Sulawesi Barat'            ,	     'Mamuju Utara',	'SR',	'MU');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Manado',	'SW',	'MA');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Mandailing Natal',	'SU',	'MN');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Manggarai',	'NT',	'MG');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Manggarai Barat',	'NT',	'MB');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Manggarai Timur',	'NT',	'MT');
INSERT INTO @tbl VALUES ('Papua Barat'            ,	     'Manokwari',	'IB',	'MA');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Mappi',	'PA',	'MP');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Maros',	'SE',	'MR');
INSERT INTO @tbl VALUES ('Nusa Tenggara Barat'            ,	     'Mataram',	'NB',	'MA');
INSERT INTO @tbl VALUES ('Papua Barat'            ,	     'Maybrat',	'IB',	'MB');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Medan',	'SU',	'ME');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Melawi',	'KB',	'ME');
INSERT INTO @tbl VALUES ('Jambi'            ,	     'Merangin',	'JA',	'SB');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Merauke',	'PA',	'ME');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Mesuji',	'LA',	'MJ');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Metro',	'LA',	'ME');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Mimika',	'PA',	'MI');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Minahasa',	'SW',	'MI');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Minahasa Selatan',	'SW',	'ML');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Minahasa Tenggara',	'SW',	'MT');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Minahasa Utara',	'SW',	'MU');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Mojokerto',	'JI',	'MK');
INSERT INTO @tbl VALUES ('Sulawesi Tengah'            ,	     'Morowali',	'ST',	'MO');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Muara Enim',	'SL',	'ME');
INSERT INTO @tbl VALUES ('Jambi'            ,	     'Muaro Jambi',	'JA',	'MJ');
INSERT INTO @tbl VALUES ('Bengkulu'            ,	     'Mukomuko',	'BE',	'MU');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Muna',	'SG',	'MU');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Murung Raya',	'KT',	'MR');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Musi Banyuasin',	'SL',	'MB');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Musi Rawas',	'SL',	'MR');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Nabire',	'PA',	'NB');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Nagan Raya',	'AC',	'NR');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Nagekeo',	'NT',	'NK');
INSERT INTO @tbl VALUES ('Kepulauan Riau'            ,	     'Natuna',	'KR',	'NT');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Nduga',	'PA',	'ND');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Ngada',	'NT',	'ND');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Nganjuk',	'JI',	'NJ');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Ngawi',	'JI',	'NW');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Nias',	'SU',	'NA');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Nias Barat',	'SU',	'NB');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Nias Selatan',	'SU',	'NS');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Nias Utara',	'SU',	'NU');
INSERT INTO @tbl VALUES ('Kalimantan Utara'            ,	     'Nunukan',	'KU',	'NU');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Ogan Ilir',	'SL',	'OI');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Ogan Komering Ilir',	'SL',	'OH');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Ogan Komering Ulu',	'SL',	'OU');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Ogan Komering Ulu Selatan',	'SL',	'OS');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Ogan Komering Ulu Timur',	'SL',	'OT');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Pacitan',	'JI',	'PC');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Padang',	'SB',	'PD');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Padang Lawas',	'SU',	'PL');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Padang Lawas Utara',	'SU',	'PU');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Padang Panjang',	'SB',	'PJ');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Padang Pariaman',	'SB',	'PP');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Padang Sidempuan',	'SU',	'PD');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Pagar Alam',	'SL',	'PG');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Pakpak Bharat',	'SU',	'PB');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Palangka Raya',	'KT',	'PR');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Palembang',	'SL',	'PA');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Palopo',	'SE',	'PA');
INSERT INTO @tbl VALUES ('Sulawesi Tengah'            ,	     'Palu',	'ST',	'PA');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Pamekasan',	'JI',	'PK');
INSERT INTO @tbl VALUES ('Banten'            ,	     'Pandeglang',	'BT',	'PA');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Pangkajene Kepulauan',	'SE',	'PK');
INSERT INTO @tbl VALUES ('Bangka-Belitung'            ,	     'Pangkal Pinang',	'BB',	'PP');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Paniai',	'PA',	'PN');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Pare-Pare',	'SE',	'PP');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Pariaman',	'SB',	'PA');
INSERT INTO @tbl VALUES ('Sulawesi Tengah'            ,	     'Parigi Moutong',	'ST',	'PM');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Pasaman',	'SB',	'PM');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Pasaman Barat',	'SB',	'PB');
INSERT INTO @tbl VALUES ('Kalimantan Timur'            ,	     'Pasir',	'KM',	'PA');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Pasuruan',	'JI',	'PR');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Pati',	'JT',	'PA');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Payakumbuh',	'SB',	'PY');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Pegunungan Bintang',	'PA',	'PB');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Pekalongan',	'JT',	'PR');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Pekan Baru',	'RI',	'PB');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Pelalawan',	'RI',	'PE');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Pemalang',	'JT',	'PL');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Pematang Siantar',	'SU',	'PS');
INSERT INTO @tbl VALUES ('Kalimantan Timur'            ,	     'Penajam Paser Utara',	'KM',	'PP');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Pesawaran',	'LA',	'PA');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Pesisir Selatan',	'SB',	'PS');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Pidie',	'AC',	'PD');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Pidie Jaya',	'AC',	'PJ');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Pinrang',	'SE',	'PI');
INSERT INTO @tbl VALUES ('Gorontalo'            ,	     'Pohuwato',	'GO',	'PO');
INSERT INTO @tbl VALUES ('Sulawesi Barat'            ,	     'Polewali Mandar',	'SR',	'PM');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Ponorogo',	'JI',	'PG');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Pontianak',	'KB',	'PR');
INSERT INTO @tbl VALUES ('Sulawesi Tengah'            ,	     'Poso',	'ST',	'PO');
INSERT INTO @tbl VALUES ('Sumatera Selatan'            ,	     'Prabumulih',	'SL',	'PR');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Pringsewu',	'LA',	'PG');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Probolinggo',	'JI',	'PL');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Pulang Pisau',	'KT',	'PP');
INSERT INTO @tbl VALUES ('Maluku Utara'            ,	     'Pulau Morotai',	'MU',	'PM');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Puncak',	'PA',	'PU');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Puncak Jaya',	'PA',	'PC');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Purbalingga',	'JT',	'PB');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Purwakarta',	'JR',	'PU');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Purworejo',	'JT',	'PW');
INSERT INTO @tbl VALUES ('Papua Barat'            ,	     'Raja Ampat',	'IB',	'RA');
INSERT INTO @tbl VALUES ('Bengkulu'            ,	     'Rejang Lebong',	'BE',	'RL');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Rembang',	'JT',	'RE');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Rokan Hilir',	'RI',	'RI');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Rokan Hulu',	'RI',	'RH');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Rote Ndao',	'NT',	'RN');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Sabang',	'AC',	'SA');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Sabu Raijua',	'NT',	'SJ');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Salatiga',	'JT',	'SA');
INSERT INTO @tbl VALUES ('Kalimantan Timur'            ,	     'Samarinda',	'KM',	'SA');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Sambas',	'KB',	'SM');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Samosir',	'SU',	'SA');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Sampang',	'JI',	'SA');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Sanggau',	'KB',	'SN');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Sarmi',	'PA',	'SR');
INSERT INTO @tbl VALUES ('Jambi'            ,	     'Sarolangun',	'JA',	'SA');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Sawahlunto',	'SB',	'SL');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Sawahlunto/Sijunjung',	'SB',	'SS');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Sekadau',	'KB',	'SE');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Selayar',	'SE',	'SE');
INSERT INTO @tbl VALUES ('Bengkulu'            ,	     'Seluma',	'BE',	'SE');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Semarang',	'JT',	'SR');
INSERT INTO @tbl VALUES ('Maluku'            ,	     'Seram Bagian Barat',	'MA',	'SB');
INSERT INTO @tbl VALUES ('Maluku'            ,	     'Seram Bagian Timur',	'MA',	'ST');
INSERT INTO @tbl VALUES ('Banten'            ,	     'Serang',	'BT',	'SR');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Serdang Bedagai',	'SU',	'SD');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Seruyan',	'KT',	'SE');
INSERT INTO @tbl VALUES ('Riau'            ,	     'Siak',	'RI',	'SI');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Sibolga',	'SU',	'SB');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Sidenreng Rappang',	'SE',	'SR');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Sidoarjo',	'JI',	'SD');
INSERT INTO @tbl VALUES ('Sulawesi Tengah'            ,	     'Sigi',	'ST',	'SG');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Sikka',	'NT',	'SI');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Simalungun',	'SU',	'SM');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Simeulue',	'AC',	'SI');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Singkawang',	'KB',	'SK');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Sinjai',	'SE',	'SI');
INSERT INTO @tbl VALUES ('Kalimantan Barat'            ,	     'Sintang',	'KB',	'SI');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Situbondo',	'JI',	'SB');
INSERT INTO @tbl VALUES ('Yogyakarta'            ,	     'Sleman',	'YO',	'SL');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Solok',	'SB',	'SR');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Solok Selatan',	'SB',	'SK');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Soppeng',	'SE',	'SO');
INSERT INTO @tbl VALUES ('Papua Barat'            ,	     'Sorong',	'IB',	'SR');
INSERT INTO @tbl VALUES ('Papua Barat'            ,	     'Sorong Selatan',	'IB',	'SL');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Sragen',	'JT',	'SG');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Subang',	'JR',	'SB');
INSERT INTO @tbl VALUES ('Aceh'            ,	     'Subulussalam',	'AC',	'SU');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Sukabumi',	'JR',	'SR');
INSERT INTO @tbl VALUES ('Kalimantan Tengah'            ,	     'Sukamara',	'KT',	'SU');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Sukoharjo',	'JT',	'SH');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Sumba Barat',	'NT',	'SR');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Sumba Barat Daya',	'NT',	'SD');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Sumba Tengah',	'NT',	'SG');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Sumba Timur',	'NT',	'ST');
INSERT INTO @tbl VALUES ('Nusa Tenggara Barat'            ,	     'Sumbawa',	'NB',	'SU');
INSERT INTO @tbl VALUES ('Nusa Tenggara Barat'            ,	     'Sumbawa Barat',	'NB',	'SB');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Sumedang',	'JR',	'SD');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Sumenep',	'JI',	'SM');
INSERT INTO @tbl VALUES ('Jambi'            ,	     'Sungai Penuh',	'JA',	'SP');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Supiori',	'PA',	'SU');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Surabaya',	'JI',	'SR');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Surakarta',	'JT',	'SK');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Tabalong',	'KS',	'TB');
INSERT INTO @tbl VALUES ('Bali'            ,	     'Tabanan',	'BA',	'TA');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Takalar',	'SE',	'TA');
INSERT INTO @tbl VALUES ('Papua Barat'            ,	     'Tambrauw',	'IB',	'TM');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Tanah Bumbu',	'KS',	'TN');
INSERT INTO @tbl VALUES ('Sumatera Barat'            ,	     'Tanah Datar',	'SB',	'TD');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Tanah Laut',	'KS',	'TL');
INSERT INTO @tbl VALUES ('Kalimantan Utara'            ,	     'Tana Tidung',	'KU',	'TT');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Tana Toraja',	'SE',	'TN');
INSERT INTO @tbl VALUES ('Banten'            ,	     'Tangerang',	'BT',	'TG');
INSERT INTO @tbl VALUES ('Banten'            ,	     'Tangerang Selatan',	'BT',	'TS');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Tanggamus',	'LA',	'TG');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Tanjung Balai',	'SU',	'TB');
INSERT INTO @tbl VALUES ('Jambi'            ,	     'Tanjung Jabung Barat',	'JA',	'TJ');
INSERT INTO @tbl VALUES ('Jambi'            ,	     'Tanjung Jabung Timur',	'JA',	'TT');
INSERT INTO @tbl VALUES ('Kepulauan Riau'            ,	     'Tanjung Pinang',	'KR',	'TP');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Tapanuli Selatan',	'SU',	'TP');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Tapanuli Tengah',	'SU',	'TT');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Tapanuli Utara',	'SU',	'TU');
INSERT INTO @tbl VALUES ('Kalimantan Selatan'            ,	     'Tapin',	'KS',	'TP');
INSERT INTO @tbl VALUES ('Kalimantan Utara'            ,	     'Tarakan',	'KU',	'TA');
INSERT INTO @tbl VALUES ('Jawa Barat'            ,	     'Tasikmalaya',	'JR',	'TA');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Tebing Tinggi',	'SU',	'TG');
INSERT INTO @tbl VALUES ('Jambi'            ,	     'Tebo',	'JA',	'TE');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Tegal',	'JT',	'TR');
INSERT INTO @tbl VALUES ('Papua Barat'            ,	     'Teluk Bintuni',	'IB',	'TK');
INSERT INTO @tbl VALUES ('Papua Barat'            ,	     'Teluk Wondama',	'IB',	'TW');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Temanggung',	'JT',	'TG');
INSERT INTO @tbl VALUES ('Maluku Utara'            ,	     'Ternate',	'MU',	'TE');
INSERT INTO @tbl VALUES ('Maluku Utara'            ,	     'Tidore Kepulauan',	'MU',	'TK');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Timor Tengah Selatan',	'NT',	'TS');
INSERT INTO @tbl VALUES ('Nusa Tenggara Timur'            ,	     'Timor Tengah Utara',	'NT',	'TU');
INSERT INTO @tbl VALUES ('Sumatera Utara'            ,	     'Toba Samosir',	'SU',	'TR');
INSERT INTO @tbl VALUES ('Sulawesi Tengah'            ,	     'Tojo Una-Una',	'ST',	'TU');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Tolikara',	'PA',	'TO');
INSERT INTO @tbl VALUES ('Sulawesi Tengah'            ,	     'Toli-Toli',	'ST',	'TT');
INSERT INTO @tbl VALUES ('Sulawesi Utara'            ,	     'Tomohon',	'SW',	'TO');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Toraja Utara',	'SE',	'TU');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Trenggalek',	'JI',	'TR');
INSERT INTO @tbl VALUES ('Maluku'            ,	     'Tual',	'MA',	'TU');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Tuban',	'JI',	'TB');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Tulang Bawang',	'LA',	'TL');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Tulang Bawang Barat',	'LA',	'TR');
INSERT INTO @tbl VALUES ('Jawa Timur'            ,	     'Tulungagung',	'JI',	'TG');
INSERT INTO @tbl VALUES ('Sulawesi Selatan'            ,	     'Wajo',	'SE',	'WA');
INSERT INTO @tbl VALUES ('Sulawesi Tenggara'            ,	     'Wakatobi',	'SG',	'WA');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Waropen',	'PA',	'WR');
INSERT INTO @tbl VALUES ('Lampung'            ,	     'Way Kanan',	'LA',	'WK');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Wonogiri',	'JT',	'WG');
INSERT INTO @tbl VALUES ('Jawa Tengah'            ,	     'Wonosobo',	'JT',	'WS');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Yahukimo',	'PA',	'YA');
INSERT INTO @tbl VALUES ('Papua'            ,	     'Yalimo',	'PA',	'YL');
INSERT INTO @tbl VALUES ('Yogyakarta'            ,	     'Yogyakarta',	'YO',	'YO');

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

