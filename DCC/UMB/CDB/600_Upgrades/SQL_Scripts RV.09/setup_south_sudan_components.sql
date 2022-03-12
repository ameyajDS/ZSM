
/* ==================================================================================
    	Source File		:	setup_south_sudan_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of South_Sudan are set-up
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
WHERE	country_nm	=	'South Sudan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country South Sudan not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'State',
		level_2_address_component	=	'County',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Unity'            ,	     'Abiemnhom',	'WH',	'AB');
INSERT INTO @tbl VALUES ('Warap'            ,	     'Abyei',	'WR',	'AB');
INSERT INTO @tbl VALUES ('Jungoli'            ,	     'Akobo',	'JG',	'AK');
INSERT INTO @tbl VALUES ('North Bahr-al-Ghazal'            ,	     'Aweil Centre',	'NB',	'AC');
INSERT INTO @tbl VALUES ('North Bahr-al-Ghazal'            ,	     'Aweil East',	'NB',	'AE');
INSERT INTO @tbl VALUES ('North Bahr-al-Ghazal'            ,	     'Aweil North',	'NB',	'AN');
INSERT INTO @tbl VALUES ('North Bahr-al-Ghazal'            ,	     'Aweil South',	'NB',	'AS');
INSERT INTO @tbl VALUES ('North Bahr-al-Ghazal'            ,	     'Aweil West',	'NB',	'AW');
INSERT INTO @tbl VALUES ('Lakes'            ,	     'Awerial',	'EB',	'AW');
INSERT INTO @tbl VALUES ('Jungoli'            ,	     'Ayod',	'JG',	'AY');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Baliet',	'UN',	'BA');
INSERT INTO @tbl VALUES ('Jungoli'            ,	     'Bor South',	'JG',	'BS');
INSERT INTO @tbl VALUES ('East Equatoria'            ,	     'Budi',	'EE',	'BU');
INSERT INTO @tbl VALUES ('Lakes'            ,	     'Cueibit',	'EB',	'CU');
INSERT INTO @tbl VALUES ('Jungoli'            ,	     'Duk',	'JG',	'DU');
INSERT INTO @tbl VALUES ('West Equatoria'            ,	     'Ezo',	'WE',	'EZ');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Fashoda',	'UN',	'FA');
INSERT INTO @tbl VALUES ('Warap'            ,	     'Gogrial Eest',	'WR',	'GE');
INSERT INTO @tbl VALUES ('Warap'            ,	     'Gogrial West',	'WR',	'GW');
INSERT INTO @tbl VALUES ('Unity'            ,	     'Guit',	'WH',	'GU');
INSERT INTO @tbl VALUES ('West Equatoria'            ,	     'Ibba',	'WE',	'IB');
INSERT INTO @tbl VALUES ('East Equatoria'            ,	     'Ikotos',	'EE',	'IK');
INSERT INTO @tbl VALUES ('Central Equatoria'            ,	     'Juba',	'BG',	'JU');
INSERT INTO @tbl VALUES ('West Bahr-al-Ghazal'            ,	     'Jur River',	'WB',	'JR');
INSERT INTO @tbl VALUES ('Central Equatoria'            ,	     'Kajo Keji',	'BG',	'KK');
INSERT INTO @tbl VALUES ('East Equatoria'            ,	     'Kapoeta East',	'EE',	'KE');
INSERT INTO @tbl VALUES ('East Equatoria'            ,	     'Kapoeta North',	'EE',	'KN');
INSERT INTO @tbl VALUES ('East Equatoria'            ,	     'Kapoeta South',	'EE',	'KS');
INSERT INTO @tbl VALUES ('Jungoli'            ,	     'Khorflus',	'JG',	'KH');
INSERT INTO @tbl VALUES ('Unity'            ,	     'Koch',	'WH',	'KO');
INSERT INTO @tbl VALUES ('Central Equatoria'            ,	     'Lainya',	'BG',	'LA');
INSERT INTO @tbl VALUES ('Unity'            ,	     'Leer',	'WH',	'LE');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Longochuk',	'UN',	'LO');
INSERT INTO @tbl VALUES ('East Equatoria'            ,	     'Lopa/Lafon',	'EE',	'LO');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Luakpiny/Nasir',	'UN',	'LU');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Maban',	'UN',	'MB');
INSERT INTO @tbl VALUES ('East Equatoria'            ,	     'Magwi',	'EE',	'MA');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Maiwut',	'UN',	'MW');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Malakal',	'UN',	'ML');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Manyo',	'UN',	'MN');
INSERT INTO @tbl VALUES ('West Equatoria'            ,	     'Maridi',	'WE',	'MA');
INSERT INTO @tbl VALUES ('Unity'            ,	     'Mayendit',	'WH',	'MD');
INSERT INTO @tbl VALUES ('Unity'            ,	     'Mayom',	'WH',	'MM');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Melut',	'UN',	'ME');
INSERT INTO @tbl VALUES ('Central Equatoria'            ,	     'Morobo',	'BG',	'MO');
INSERT INTO @tbl VALUES ('West Equatoria'            ,	     'Mundri East',	'WE',	'ME');
INSERT INTO @tbl VALUES ('West Equatoria'            ,	     'Mundri West',	'WE',	'MW');
INSERT INTO @tbl VALUES ('West Equatoria'            ,	     'Mvolo',	'WE',	'MV');
INSERT INTO @tbl VALUES ('West Equatoria'            ,	     'Nagero',	'WE',	'NA');
INSERT INTO @tbl VALUES ('Jungoli'            ,	     'Nyirol',	'JG',	'NY');
INSERT INTO @tbl VALUES ('West Equatoria'            ,	     'Nzara',	'WE',	'NZ');
INSERT INTO @tbl VALUES ('Jungoli'            ,	     'Old Fangak',	'JG',	'OF');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Panyikang',	'UN',	'PA');
INSERT INTO @tbl VALUES ('Unity'            ,	     'Pariang',	'WH',	'PR');
INSERT INTO @tbl VALUES ('Unity'            ,	     'Payinjar',	'WH',	'PJ');
INSERT INTO @tbl VALUES ('Jungoli'            ,	     'Pibor',	'JG',	'PI');
INSERT INTO @tbl VALUES ('Jungoli'            ,	     'Pochalla',	'JG',	'PO');
INSERT INTO @tbl VALUES ('West Bahr-al-Ghazal'            ,	     'Raga',	'WB',	'RA');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Renk',	'UN',	'RE');
INSERT INTO @tbl VALUES ('Unity'            ,	     'Rubkona',	'WH',	'RU');
INSERT INTO @tbl VALUES ('Lakes'            ,	     'Rumbek Centre',	'EB',	'RC');
INSERT INTO @tbl VALUES ('Lakes'            ,	     'Rumbek East',	'EB',	'RE');
INSERT INTO @tbl VALUES ('Lakes'            ,	     'Rumbek North',	'EB',	'RN');
INSERT INTO @tbl VALUES ('West Equatoria'            ,	     'Tambura',	'WE',	'TA');
INSERT INTO @tbl VALUES ('Central Equatoria'            ,	     'Terekeka',	'BG',	'TE');
INSERT INTO @tbl VALUES ('Warap'            ,	     'Tonj East',	'WR',	'TE');
INSERT INTO @tbl VALUES ('Warap'            ,	     'Tonj North',	'WR',	'TN');
INSERT INTO @tbl VALUES ('Warap'            ,	     'Tonj South',	'WR',	'TS');
INSERT INTO @tbl VALUES ('East Equatoria'            ,	     'Torit',	'EE',	'TO');
INSERT INTO @tbl VALUES ('Warap'            ,	     'Twic',	'WR',	'TW');
INSERT INTO @tbl VALUES ('Jungoli'            ,	     'Twic East',	'JG',	'TE');
INSERT INTO @tbl VALUES ('Upper Nile'            ,	     'Ulang',	'UN',	'UL');
INSERT INTO @tbl VALUES ('West Bahr-al-Ghazal'            ,	     'Wau',	'WB',	'WA');
INSERT INTO @tbl VALUES ('Lakes'            ,	     'Wulu',	'EB',	'WU');
INSERT INTO @tbl VALUES ('Jungoli'            ,	     'Wuror',	'JG',	'WU');
INSERT INTO @tbl VALUES ('West Equatoria'            ,	     'Yambio',	'WE',	'YA');
INSERT INTO @tbl VALUES ('Central Equatoria'            ,	     'Yei',	'BG',	'YE');
INSERT INTO @tbl VALUES ('Lakes'            ,	     'Yirol East',	'EB',	'YE');
INSERT INTO @tbl VALUES ('Lakes'            ,	     'Yirol West',	'EB',	'YW');

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

