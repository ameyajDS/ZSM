
/* ==================================================================================
    	Source File		:	setup_cambodia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Cambodia are set-up
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
WHERE	country_nm	=	'Cambodia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Cambodia not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Aek Phnum',	'BA',	'AP');
INSERT INTO @tbl VALUES ('Rotanokiri'            ,	     'Andoung Meas',	'RO',	'AM');
INSERT INTO @tbl VALUES ('Takev'            ,	     'Angkor Borei',	'TA',	'AB');
INSERT INTO @tbl VALUES ('Kampot'            ,	     'Angkor Chey',	'KP',	'AC');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Angkor Chum',	'SI',	'AC');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Angkor Thum',	'SI',	'AT');
INSERT INTO @tbl VALUES ('Kandal'            ,	     'Angk Snuol',	'KN',	'AS');
INSERT INTO @tbl VALUES ('Otdar Meanchey'            ,	     'Anlong Veaeng',	'OC',	'AV');
INSERT INTO @tbl VALUES ('Kampong Spoe'            ,	     'Aoral',	'KS',	'AR');
INSERT INTO @tbl VALUES ('Pouthisat'            ,	     'Bakan',	'PO',	'BK');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Banan',	'BA',	'BN');
INSERT INTO @tbl VALUES ('Rotanokiri'            ,	     'Ban Lung',	'RO',	'BL');
INSERT INTO @tbl VALUES ('Otdar Meanchey'            ,	     'Banteay Ampil',	'OC',	'BA');
INSERT INTO @tbl VALUES ('Kampot'            ,	     'Banteay Meas',	'KP',	'BM');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Banteay Srei',	'SI',	'BS');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Ba Phnum',	'PY',	'BP');
INSERT INTO @tbl VALUES ('Kampong Thum'            ,	     'Baray',	'KT',	'BR');
INSERT INTO @tbl VALUES ('Kampong Chhnang'            ,	     'Baribour',	'KG',	'BB');
INSERT INTO @tbl VALUES ('Rotanokiri'            ,	     'Bar Kaev',	'RO',	'BK');
INSERT INTO @tbl VALUES ('Kampong Spoe'            ,	     'Basedth',	'KS',	'BS');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Bat Dambang',	'BA',	'BD');
INSERT INTO @tbl VALUES ('Kampong Cham'            ,	     'Batheay',	'KC',	'BT');
INSERT INTO @tbl VALUES ('Takev'            ,	     'Bati',	'TA',	'BT');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Bavel',	'BA',	'BV');
INSERT INTO @tbl VALUES ('Kaoh Kong'            ,	     'Botum Sakor',	'KK',	'BS');
INSERT INTO @tbl VALUES ('Takev'            ,	     'Bourei Cholsar',	'TA',	'BC');
INSERT INTO @tbl VALUES ('Kampong Cham'            ,	     'Chamkar Leu',	'KC',	'CL');
INSERT INTO @tbl VALUES ('Phnom Penh'            ,	     'Chamkar Mon',	'PP',	'CM');
INSERT INTO @tbl VALUES ('Svay Rieng'            ,	     'Chantrea',	'SR',	'CT');
INSERT INTO @tbl VALUES ('Kampong Spoe'            ,	     'Chbar Mon',	'KS',	'CM');
INSERT INTO @tbl VALUES ('Kampong Cham'            ,	     'Cheung Prey',	'KC',	'CP');
INSERT INTO @tbl VALUES ('Preah Vihear'            ,	     'Chey Saen',	'PH',	'CS');
INSERT INTO @tbl VALUES ('Preah Vihear'            ,	     'Chhaeb',	'PH',	'CB');
INSERT INTO @tbl VALUES ('Kracheh'            ,	     'Chhloung',	'KH',	'CL');
INSERT INTO @tbl VALUES ('Kampot'            ,	     'Chhuk',	'KP',	'CH');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Chi Kraeng',	'SI',	'CK');
INSERT INTO @tbl VALUES ('Preah Vihear'            ,	     'Choam Khsant',	'PH',	'CK');
INSERT INTO @tbl VALUES ('Kampong Chhnang'            ,	     'Chol Kiri',	'KG',	'CK');
INSERT INTO @tbl VALUES ('Otdar Meanchey'            ,	     'Chong Kal',	'OC',	'CK');
INSERT INTO @tbl VALUES ('Kampot'            ,	     'Chum Kiri',	'KP',	'CK');
INSERT INTO @tbl VALUES ('Tbong Khmum'            ,	     'Dambae',	'TB',	'DB');
INSERT INTO @tbl VALUES ('Krong Keb'            ,	     'Damnak Chang''aeur',	'KB',	'DC');
INSERT INTO @tbl VALUES ('Phnom Penh'            ,	     'Dangkao',	'PP',	'DK');
INSERT INTO @tbl VALUES ('Kampot'            ,	     'Dang Tong',	'KP',	'DT');
INSERT INTO @tbl VALUES ('Takev'            ,	     'Doun Kaev',	'TA',	'DK');
INSERT INTO @tbl VALUES ('Phnom Penh'            ,	     'Doun Penh',	'PP',	'DP');
INSERT INTO @tbl VALUES ('Krong Keb'            ,	     'Kaeb',	'KB',	'KB');
INSERT INTO @tbl VALUES ('Mondol Kiri'            ,	     'Kaev Seima',	'MK',	'KS');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Kamchay Mear',	'PY',	'KM');
INSERT INTO @tbl VALUES ('Kampot'            ,	     'Kampong Bay',	'KP',	'KB');
INSERT INTO @tbl VALUES ('Kampong Cham'            ,	     'Kampong Cham',	'KC',	'KP');
INSERT INTO @tbl VALUES ('Kampong Chhnang'            ,	     'Kampong Chhnang',	'KG',	'KC');
INSERT INTO @tbl VALUES ('Kampong Chhnang'            ,	     'Kampong Leaeng',	'KG',	'KL');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Kampong Leav',	'PY',	'KL');
INSERT INTO @tbl VALUES ('Svay Rieng'            ,	     'Kampong Rou',	'SR',	'KR');
INSERT INTO @tbl VALUES ('Kaoh Kong'            ,	     'Kampong Seila',	'KK',	'KP');
INSERT INTO @tbl VALUES ('Kampong Cham'            ,	     'Kampong Siem',	'KC',	'KS');
INSERT INTO @tbl VALUES ('Kampong Thum'            ,	     'Kampong Svay',	'KT',	'KS');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Kampong Trabaek',	'PY',	'KT');
INSERT INTO @tbl VALUES ('Kampot'            ,	     'Kampong Trach',	'KP',	'KT');
INSERT INTO @tbl VALUES ('Kampong Chhnang'            ,	     'Kampong Tralach',	'KG',	'KT');
INSERT INTO @tbl VALUES ('Kampot'            ,	     'Kampot',	'KP',	'KP');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Kamrieng',	'BA',	'KR');
INSERT INTO @tbl VALUES ('Kandal'            ,	     'Kandal Stueng',	'KN',	'KD');
INSERT INTO @tbl VALUES ('Pouthisat'            ,	     'Kandieng',	'PO',	'KD');
INSERT INTO @tbl VALUES ('Kampong Cham'            ,	     'Kang Meas',	'KC',	'KM');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Kanhchriech',	'PY',	'KC');
INSERT INTO @tbl VALUES ('Takev'            ,	     'Kaoh Andaet',	'TA',	'KA');
INSERT INTO @tbl VALUES ('Kaoh Kong'            ,	     'Kaoh Kong',	'KK',	'KK');
INSERT INTO @tbl VALUES ('Mondol Kiri'            ,	     'Kaoh Nheaek',	'MK',	'KN');
INSERT INTO @tbl VALUES ('Kampong Cham'            ,	     'Kaoh Soutin',	'KC',	'KT');
INSERT INTO @tbl VALUES ('Kandal'            ,	     'Kaoh Thum',	'KN',	'KT');
INSERT INTO @tbl VALUES ('Kandal'            ,	     'Khsach Kandal',	'KN',	'KK');
INSERT INTO @tbl VALUES ('Kandal'            ,	     'Kien Svay',	'KN',	'KS');
INSERT INTO @tbl VALUES ('Kaoh Kong'            ,	     'Kiri Sakor',	'KK',	'KS');
INSERT INTO @tbl VALUES ('Takev'            ,	     'Kiri Vong',	'TA',	'KV');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Koas Krala',	'BA',	'KK');
INSERT INTO @tbl VALUES ('Kampong Spoe'            ,	     'Kong Pisei',	'KS',	'KP');
INSERT INTO @tbl VALUES ('Rotanokiri'            ,	     'Koun Mom',	'RO',	'KM');
INSERT INTO @tbl VALUES ('Kracheh'            ,	     'Kracheh',	'KH',	'KR');
INSERT INTO @tbl VALUES ('Pouthisat'            ,	     'Krakor',	'PO',	'KK');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Kralanh',	'SI',	'KL');
INSERT INTO @tbl VALUES ('Tbong Khmum'            ,	     'Krouch Chhmar',	'TB',	'KC');
INSERT INTO @tbl VALUES ('Preah Vihear'            ,	     'Kuleaen',	'PH',	'KL');
INSERT INTO @tbl VALUES ('Kandal'            ,	     'Leuk Daek',	'KN',	'LD');
INSERT INTO @tbl VALUES ('Rotanokiri'            ,	     'Lumphat',	'RO',	'LP');
INSERT INTO @tbl VALUES ('Kandal'            ,	     'Lvea Aem',	'KN',	'LA');
INSERT INTO @tbl VALUES ('Banteay Meanchey'            ,	     'Malai',	'OM',	'ML');
INSERT INTO @tbl VALUES ('Phnom Penh'            ,	     'Mean Chey',	'PP',	'MC');
INSERT INTO @tbl VALUES ('Tbong Khmum'            ,	     'Memot',	'TB',	'MM');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Me Sang',	'PY',	'MS');
INSERT INTO @tbl VALUES ('Krong Preah Sihanouk'            ,	     'Mittakpheap',	'KA',	'MT');
INSERT INTO @tbl VALUES ('Kaoh Kong'            ,	     'Mondol Seima',	'KK',	'MS');
INSERT INTO @tbl VALUES ('Banteay Meanchey'            ,	     'Mongkol Borei',	'OM',	'MB');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Moung Ruessei',	'BA',	'MR');
INSERT INTO @tbl VALUES ('Kandal'            ,	     'Mukh Kampul',	'KN',	'MK');
INSERT INTO @tbl VALUES ('Kampong Spoe'            ,	     'Odongk',	'KS',	'OD');
INSERT INTO @tbl VALUES ('Banteay Meanchey'            ,	     'Ou Chrov',	'OM',	'OC');
INSERT INTO @tbl VALUES ('Rotanokiri'            ,	     'Ou Chum',	'RO',	'OC');
INSERT INTO @tbl VALUES ('Mondol Kiri'            ,	     'Ou Reang',	'MK',	'OR');
INSERT INTO @tbl VALUES ('Tbong Khmum'            ,	     'Ou Reang Ov',	'TB',	'OR');
INSERT INTO @tbl VALUES ('Rotanokiri'            ,	     'Ou Ya Dav',	'RO',	'OY');
INSERT INTO @tbl VALUES ('Krong Pailin'            ,	     'Pailin',	'PL',	'PL');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Peam Chor',	'PY',	'PC');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Peam Ro',	'PY',	'PR');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Pea Reang',	'PY',	'PG');
INSERT INTO @tbl VALUES ('Mondol Kiri'            ,	     'Pechr Chenda',	'MK',	'PC');
INSERT INTO @tbl VALUES ('Pouthisat'            ,	     'Phnum Kravanh',	'PO',	'PK');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Phnum Proek',	'BA',	'PP');
INSERT INTO @tbl VALUES ('Banteay Meanchey'            ,	     'Phnum Srok',	'OM',	'PS');
INSERT INTO @tbl VALUES ('Kampong Spoe'            ,	     'Phnum Sruoch',	'KS',	'PS');
INSERT INTO @tbl VALUES ('Tbong Khmum'            ,	     'Ponhea Kraek',	'TB',	'PK');
INSERT INTO @tbl VALUES ('Kandal'            ,	     'Ponhea Lueu',	'KN',	'PL');
INSERT INTO @tbl VALUES ('Phnom Penh'            ,	     'Prampir Meakkara',	'PP',	'PM');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Prasat Bakong',	'SI',	'PB');
INSERT INTO @tbl VALUES ('Kampong Thum'            ,	     'Prasat Balangk',	'KT',	'PB');
INSERT INTO @tbl VALUES ('Kampong Thum'            ,	     'Prasat Sambour',	'KT',	'PS');
INSERT INTO @tbl VALUES ('Kracheh'            ,	     'Preaek Prasab',	'KH',	'PP');
INSERT INTO @tbl VALUES ('Banteay Meanchey'            ,	     'Preah Netr Preah',	'OM',	'PN');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Preah Sdach',	'PY',	'PS');
INSERT INTO @tbl VALUES ('Kampong Cham'            ,	     'Prey Chhor',	'KC',	'PC');
INSERT INTO @tbl VALUES ('Takev'            ,	     'Prey Kabbas',	'TA',	'PK');
INSERT INTO @tbl VALUES ('Krong Preah Sihanouk'            ,	     'Prey Nob',	'KA',	'PN');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Prey Veaeng',	'PY',	'PV');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Puok',	'SI',	'PK');
INSERT INTO @tbl VALUES ('Kampong Chhnang'            ,	     'Rolea B''ier',	'KG',	'RB');
INSERT INTO @tbl VALUES ('Svay Rieng'            ,	     'Romeas Haek',	'SR',	'RH');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Rotanak Mondol',	'BA',	'RM');
INSERT INTO @tbl VALUES ('Preah Vihear'            ,	     'Rovieng',	'PH',	'RV');
INSERT INTO @tbl VALUES ('Phnom Penh'            ,	     'Ruessei Kaev',	'PP',	'RK');
INSERT INTO @tbl VALUES ('Svay Rieng'            ,	     'Rumduol',	'SR',	'RD');
INSERT INTO @tbl VALUES ('Mondol Kiri'            ,	     'Saen Monourom',	'MK',	'SM');
INSERT INTO @tbl VALUES ('Krong Pailin'            ,	     'Sala Krau',	'PL',	'SK');
INSERT INTO @tbl VALUES ('Kracheh'            ,	     'Sambour',	'KH',	'SB');
INSERT INTO @tbl VALUES ('Kampong Chhnang'            ,	     'Sameakki Mean Chey',	'KG',	'SM');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Samlout',	'BA',	'ST');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Sampov Lun',	'BA',	'SL');
INSERT INTO @tbl VALUES ('Pouthisat'            ,	     'Sampov Meas',	'PO',	'SM');
INSERT INTO @tbl VALUES ('Kampong Spoe'            ,	     'Samraong Tong',	'KS',	'SY');
INSERT INTO @tbl VALUES ('Otdar Meanchey'            ,	     'Samraong',	'OC',	'SR');
INSERT INTO @tbl VALUES ('Takev'            ,	     'Samraong',	'TA',	'SR');
INSERT INTO @tbl VALUES ('Kampong Thum'            ,	     'Sandan',	'KT',	'SD');
INSERT INTO @tbl VALUES ('Kandal'            ,	     'S''ang',	'KN',	'SA');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Sangkae',	'BA',	'SK');
INSERT INTO @tbl VALUES ('Preah Vihear'            ,	     'Sangkom Thmei',	'PH',	'ST');
INSERT INTO @tbl VALUES ('Kampong Thum'            ,	     'Santuk',	'KT',	'ST');
INSERT INTO @tbl VALUES ('Banteay Meanchey'            ,	     'Serei Saophoan',	'OM',	'SS');
INSERT INTO @tbl VALUES ('Stoeng Treng'            ,	     'Sesan',	'ST',	'SS');
INSERT INTO @tbl VALUES ('Stoeng Treng'            ,	     'Siem Bouk',	'ST',	'SB');
INSERT INTO @tbl VALUES ('Stoeng Treng'            ,	     'Siem Pang',	'ST',	'SP');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Siem Reab',	'SI',	'SR');
INSERT INTO @tbl VALUES ('Prey Veng'            ,	     'Sithor Kandal',	'PY',	'SK');
INSERT INTO @tbl VALUES ('Kaoh Kong'            ,	     'Smach Mean Chey',	'KK',	'SM');
INSERT INTO @tbl VALUES ('Kracheh'            ,	     'Snuol',	'KH',	'SN');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Soutr Nikom',	'SI',	'SN');
INSERT INTO @tbl VALUES ('Kaoh Kong'            ,	     'Srae Ambel',	'KK',	'SA');
INSERT INTO @tbl VALUES ('Kampong Cham'            ,	     'Srei Santhor',	'KC',	'SS');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Srei Snam',	'SI',	'SS');
INSERT INTO @tbl VALUES ('Kampong Thum'            ,	     'Stoung',	'KT',	'SG');
INSERT INTO @tbl VALUES ('Krong Preah Sihanouk'            ,	     'Stueng Hav',	'KA',	'SH');
INSERT INTO @tbl VALUES ('Kampong Thum'            ,	     'Stueng Saen',	'KT',	'SS');
INSERT INTO @tbl VALUES ('Stoeng Treng'            ,	     'Stueng Traeng',	'ST',	'ST');
INSERT INTO @tbl VALUES ('Kampong Cham'            ,	     'Stueng Trang',	'KC',	'ST');
INSERT INTO @tbl VALUES ('Banteay Meanchey'            ,	     'Svay Chek',	'OM',	'SC');
INSERT INTO @tbl VALUES ('Svay Rieng'            ,	     'Svay Chrum',	'SR',	'SC');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Svay Leu',	'SI',	'SL');
INSERT INTO @tbl VALUES ('Svay Rieng'            ,	     'Svay Rieng',	'SR',	'SR');
INSERT INTO @tbl VALUES ('Svay Rieng'            ,	     'Svay Teab',	'SR',	'ST');
INSERT INTO @tbl VALUES ('Kandal'            ,	     'Ta Khmau',	'KN',	'TK');
INSERT INTO @tbl VALUES ('Rotanokiri'            ,	     'Ta Veaeng',	'RO',	'TV');
INSERT INTO @tbl VALUES ('Preah Vihear'            ,	     'Tbaeng Mean Chey',	'PH',	'TM');
INSERT INTO @tbl VALUES ('Tbong Khmum'            ,	     'Tboung Khmum',	'TB',	'TK');
INSERT INTO @tbl VALUES ('Stoeng Treng'            ,	     'Thala Barivat',	'ST',	'TB');
INSERT INTO @tbl VALUES ('Kaoh Kong'            ,	     'Thma Bang',	'KK',	'TB');
INSERT INTO @tbl VALUES ('Batdambang'            ,	     'Thma Koul',	'BA',	'TK');
INSERT INTO @tbl VALUES ('Banteay Meanchey'            ,	     'Thma Puok',	'OM',	'TP');
INSERT INTO @tbl VALUES ('Kampong Spoe'            ,	     'Thpong',	'KS',	'TP');
INSERT INTO @tbl VALUES ('Takev'            ,	     'Tram Kak',	'TA',	'TK');
INSERT INTO @tbl VALUES ('Otdar Meanchey'            ,	     'Trapeang Prasat',	'OC',	'TP');
INSERT INTO @tbl VALUES ('Takev'            ,	     'Treang',	'TA',	'TG');
INSERT INTO @tbl VALUES ('Kampong Chhnang'            ,	     'Tuek Phos',	'KG',	'TP');
INSERT INTO @tbl VALUES ('Phnom Penh'            ,	     'Tuol Kouk',	'PP',	'TK');
INSERT INTO @tbl VALUES ('Siemreab'            ,	     'Varin',	'SI',	'VR');
INSERT INTO @tbl VALUES ('Pouthisat'            ,	     'Veal Veaeng',	'PO',	'VV');
INSERT INTO @tbl VALUES ('Rotanokiri'            ,	     'Veun Sai',	'RO',	'VS');

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

