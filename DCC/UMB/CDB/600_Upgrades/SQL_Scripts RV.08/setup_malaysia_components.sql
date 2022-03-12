
/* ==================================================================================
    	Source File		:	setup_malaysia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Malaysia are set-up
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
WHERE	country_nm	=	'Malaysia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Malaysia not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Melaka'            ,	     'Alor Gajah',	'ME',	'AG');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Asajaya',	'SK',	'AS');
INSERT INTO @tbl VALUES ('Kelantan'            ,	     'Bachok',	'KN',	'BA');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Baling',	'KH',	'BA');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Bandar Baharu',	'KH',	'BB');
INSERT INTO @tbl VALUES ('Pulau Pinang'            ,	     'Barat Daya',	'PG',	'BD');
INSERT INTO @tbl VALUES ('Perak'            ,	     'Batang Padang',	'PK',	'BP');
INSERT INTO @tbl VALUES ('Johor'            ,	     'Batu Pahat',	'JH',	'BP');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Bau',	'SK',	'BA');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Beaufort',	'SA',	'BF');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Belaga',	'SK',	'BL');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Beluran',	'SA',	'BL');
INSERT INTO @tbl VALUES ('Pahang'            ,	     'Bentong',	'PH',	'BN');
INSERT INTO @tbl VALUES ('Pahang'            ,	     'Bera',	'PH',	'BR');
INSERT INTO @tbl VALUES ('Terengganu'            ,	     'Besut',	'TE',	'BE');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Betong',	'SK',	'BT');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Bintulu',	'SK',	'BI');
INSERT INTO @tbl VALUES ('Pahang'            ,	     'Cameron Highlands',	'PH',	'CH');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Dalat',	'SK',	'DL');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Daro',	'SK',	'DR');
INSERT INTO @tbl VALUES ('Terengganu'            ,	     'Dungun',	'TE',	'DU');
INSERT INTO @tbl VALUES ('Selangor'            ,	     'Gombak',	'SL',	'GO');
INSERT INTO @tbl VALUES ('Kelantan'            ,	     'Gua Musang',	'KN',	'GM');
INSERT INTO @tbl VALUES ('Perak'            ,	     'Hilir Perak',	'PK',	'HI');
INSERT INTO @tbl VALUES ('Terengganu'            ,	     'Hulu Terengganu',	'TE',	'HT');
INSERT INTO @tbl VALUES ('Melaka'            ,	     'Jasin',	'ME',	'JA');
INSERT INTO @tbl VALUES ('Negeri Sembilan'            ,	     'Jelebu',	'NS',	'JL');
INSERT INTO @tbl VALUES ('Kelantan'            ,	     'Jeli',	'KN',	'JE');
INSERT INTO @tbl VALUES ('Negeri Sembilan'            ,	     'Jempol',	'NS',	'JM');
INSERT INTO @tbl VALUES ('Pahang'            ,	     'Jerantut',	'PH',	'JE');
INSERT INTO @tbl VALUES ('Johor'            ,	     'Johor Bahru',	'JH',	'JH');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Julau',	'SK',	'JL');
INSERT INTO @tbl VALUES ('Perak'            ,	     'Kampar',	'PK',	'KM');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Kanowit',	'SK',	'KN');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Kapit',	'SK',	'KP');
INSERT INTO @tbl VALUES ('Terengganu'            ,	     'Kemaman',	'TE',	'KE');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Keningau',	'SA',	'KE');
INSERT INTO @tbl VALUES ('Perak'            ,	     'Kerian',	'PK',	'KE');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Kinabatangan',	'SA',	'KI');
INSERT INTO @tbl VALUES ('Perak'            ,	     'Kinta',	'PK',	'KN');
INSERT INTO @tbl VALUES ('Selangor'            ,	     'Klang',	'SL',	'KE');
INSERT INTO @tbl VALUES ('Johor'            ,	     'Kluang',	'JH',	'KE');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Kota Belud',	'SA',	'KB');
INSERT INTO @tbl VALUES ('Kelantan'            ,	     'Kota Bharu',	'KN',	'KB');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Kota Kinabalu',	'SA',	'KK');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Kota Marudu',	'SA',	'KM');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Kota Setar',	'KH',	'KT');
INSERT INTO @tbl VALUES ('Johor'            ,	     'Kota Tinggi',	'JH',	'KT');
INSERT INTO @tbl VALUES ('Perak'            ,	     'Kuala Kangsar',	'PK',	'KK');
INSERT INTO @tbl VALUES ('Kelantan'            ,	     'Kuala Krai',	'KN',	'KK');
INSERT INTO @tbl VALUES ('Selangor'            ,	     'Kuala Langat',	'SL',	'KL');
INSERT INTO @tbl VALUES ('Kuala Lumpur'            ,	     'Kuala Lumpur',	'KL',	'KL');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Kuala Muda',	'KH',	'KM');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Kuala Penyu',	'SA',	'KP');
INSERT INTO @tbl VALUES ('Negeri Sembilan'            ,	     'Kuala Pilah',	'NS',	'KP');
INSERT INTO @tbl VALUES ('Selangor'            ,	     'Kuala Selangor',	'SL',	'KS');
INSERT INTO @tbl VALUES ('Terengganu'            ,	     'Kuala Terengganu',	'TE',	'KT');
INSERT INTO @tbl VALUES ('Pahang'            ,	     'Kuantan',	'PH',	'KU');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Kubang Pasu',	'KH',	'KP');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Kuching',	'SK',	'KU');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Kudat',	'SA',	'KD');
INSERT INTO @tbl VALUES ('Johor'            ,	     'Kulaijaya',	'JH',	'KU');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Kulim',	'KH',	'KU');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Kunak',	'SA',	'KN');
INSERT INTO @tbl VALUES ('Labuan'            ,	     'Labuan',	'LA',	'LA');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Lahad Datu',	'SA',	'LD');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Langkawi',	'KH',	'LA');
INSERT INTO @tbl VALUES ('Perak'            ,	     'Larut and Matang',	'PK',	'LM');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Lawas',	'SK',	'LW');
INSERT INTO @tbl VALUES ('Johor'            ,	     'Ledang',	'JH',	'LD');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Limbang',	'SK',	'LI');
INSERT INTO @tbl VALUES ('Pahang'            ,	     'Lipis',	'PH',	'LI');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Lubok Antu',	'SK',	'LA');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Lundu',	'SK',	'LU');
INSERT INTO @tbl VALUES ('Kelantan'            ,	     'Machang',	'KN',	'MA');
INSERT INTO @tbl VALUES ('Perak'            ,	     'Manjung',	'PK',	'MA');
INSERT INTO @tbl VALUES ('Pahang'            ,	     'Maran',	'PH',	'MA');
INSERT INTO @tbl VALUES ('Terengganu'            ,	     'Marang',	'TE',	'MA');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Marudi',	'SK',	'MR');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Matu',	'SK',	'MT');
INSERT INTO @tbl VALUES ('Melaka'            ,	     'Melaka Tengah',	'ME',	'MT');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Meradong',	'SK',	'ME');
INSERT INTO @tbl VALUES ('Johor'            ,	     'Mersing',	'JH',	'ME');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Miri',	'SK',	'MI');
INSERT INTO @tbl VALUES ('Johor'            ,	     'Muar',	'JH',	'MR');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Mukah',	'SK',	'MU');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Nabawan',	'SA',	'NA');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Padang Terap',	'KH',	'PT');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Pakan',	'SK',	'PA');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Papar',	'SA',	'PA');
INSERT INTO @tbl VALUES ('Kelantan'            ,	     'Pasir Mas',	'KN',	'PM');
INSERT INTO @tbl VALUES ('Kelantan'            ,	     'Pasir Puteh',	'KN',	'PP');
INSERT INTO @tbl VALUES ('Pahang'            ,	     'Pekan',	'PH',	'PE');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Penampang',	'SA',	'PP');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Pendang',	'KH',	'PE');
INSERT INTO @tbl VALUES ('Perak'            ,	     'Perak Tengah',	'PK',	'PT');
INSERT INTO @tbl VALUES ('Perlis'            ,	     'Perlis',	'PL',	'PE');
INSERT INTO @tbl VALUES ('Selangor'            ,	     'Petaling',	'SL',	'PE');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Pitas',	'SA',	'PI');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Pokok Sena',	'KH',	'PS');
INSERT INTO @tbl VALUES ('Johor'            ,	     'Pontian',	'JH',	'PO');
INSERT INTO @tbl VALUES ('Negeri Sembilan'            ,	     'Port Dickson',	'NS',	'PD');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Putatan',	'SA',	'PU');
INSERT INTO @tbl VALUES ('Putrajaya'            ,	     'Putrajaya',	'PJ',	'PJ');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Ranau',	'SA',	'RA');
INSERT INTO @tbl VALUES ('Pahang'            ,	     'Raub',	'PH',	'RA');
INSERT INTO @tbl VALUES ('Negeri Sembilan'            ,	     'Rembau',	'NS',	'RE');
INSERT INTO @tbl VALUES ('Pahang'            ,	     'Rompin',	'PH',	'RO');
INSERT INTO @tbl VALUES ('Selangor'            ,	     'Sabak Bernam',	'SL',	'SB');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Samarahan',	'SK',	'SM');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Sandakan',	'SA',	'SA');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Saratok',	'SK',	'ST');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Sarikei',	'SK',	'SK');
INSERT INTO @tbl VALUES ('Pulau Pinang'            ,	     'Seberang Perai Selatan',	'PG',	'SS');
INSERT INTO @tbl VALUES ('Pulau Pinang'            ,	     'Seberang Perai Tengah',	'PG',	'ST');
INSERT INTO @tbl VALUES ('Pulau Pinang'            ,	     'Seberang Perai Utara',	'PG',	'SU');
INSERT INTO @tbl VALUES ('Johor'            ,	     'Segamat',	'JH',	'SE');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Selangau',	'SK',	'SG');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Semporna',	'SA',	'SE');
INSERT INTO @tbl VALUES ('Selangor'            ,	     'Sepang',	'SL',	'SP');
INSERT INTO @tbl VALUES ('Negeri Sembilan'            ,	     'Seremban',	'NS',	'SE');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Serian',	'SK',	'SE');
INSERT INTO @tbl VALUES ('Terengganu'            ,	     'Setiu',	'TE',	'SE');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Sibu',	'SK',	'SI');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Sik',	'KH',	'SI');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Simunjan',	'SK',	'SJ');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Sipitang',	'SA',	'SI');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Song',	'SK',	'SO');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Sri Aman',	'SK',	'SA');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Tambunan',	'SA',	'TM');
INSERT INTO @tbl VALUES ('Negeri Sembilan'            ,	     'Tampin',	'NS',	'TA');
INSERT INTO @tbl VALUES ('Kelantan'            ,	     'Tanah Merah',	'KN',	'TM');
INSERT INTO @tbl VALUES ('Sarawak'            ,	     'Tatau',	'SK',	'TA');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Tawau',	'SA',	'TW');
INSERT INTO @tbl VALUES ('Pahang'            ,	     'Temerloh',	'PH',	'TE');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Tenom',	'SA',	'TE');
INSERT INTO @tbl VALUES ('Pulau Pinang'            ,	     'Timur Laut',	'PG',	'TL');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Tongod',	'SA',	'TO');
INSERT INTO @tbl VALUES ('Sabah'            ,	     'Tuaran',	'SA',	'TU');
INSERT INTO @tbl VALUES ('Kelantan'            ,	     'Tumpat',	'KN',	'TU');
INSERT INTO @tbl VALUES ('Selangor'            ,	     'Ulu Langat',	'SL',	'HL');
INSERT INTO @tbl VALUES ('Perak'            ,	     'Ulu Perak',	'PK',	'HU');
INSERT INTO @tbl VALUES ('Selangor'            ,	     'Ulu Selangor',	'SL',	'HS');
INSERT INTO @tbl VALUES ('Kedah'            ,	     'Yan',	'KH',	'YA');

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

