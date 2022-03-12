
/* ==================================================================================
    	Source File		:	setup_jordan_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Jordan are set-up
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
WHERE	country_nm	=	'Jordan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Jordan not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Subdistrict',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Ma`an'            ,	     'Adroh',	'MN',	'AD');
INSERT INTO @tbl VALUES ('Irbid'            ,	     'Aghwar Shamaliyyeh',	'IR',	'AS');
INSERT INTO @tbl VALUES ('Balqa'            ,	     'Ain El-Basha',	'BA',	'AB');
INSERT INTO @tbl VALUES ('Ajlun'            ,	     'Ajloun',	'AJ',	'AJ');
INSERT INTO @tbl VALUES ('Balqa'            ,	     'Al-Ardhah',	'BA',	'AR');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Al-Jami''ah',	'AM',	'AA');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Amman',	'AM',	'AM');
INSERT INTO @tbl VALUES ('Aqaba'            ,	     'Aqaba',	'AQ',	'AQ');
INSERT INTO @tbl VALUES ('Madaba'            ,	     'Ariedh',	'MD',	'AH');
INSERT INTO @tbl VALUES ('Karak'            ,	     'Ayy',	'KA',	'AY');
INSERT INTO @tbl VALUES ('Zarqa'            ,	     'Azraq',	'AZ',	'ZQ');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Badiah Shamaliyyeh Gharbiyyeh',	'MA',	'BG');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Bal''ama',	'MA',	'BM');
INSERT INTO @tbl VALUES ('Irbid'            ,	     'Bani Ebaid',	'IR',	'BE');
INSERT INTO @tbl VALUES ('Irbid'            ,	     'Bani Kenanah',	'IR',	'BK');
INSERT INTO @tbl VALUES ('Zarqa'            ,	     'Bierain',	'AZ',	'BR');
INSERT INTO @tbl VALUES ('Jarash'            ,	     'Borma',	'JA',	'BO');
INSERT INTO @tbl VALUES ('Tafilah'            ,	     'Bsaira',	'AT',	'BS');
INSERT INTO @tbl VALUES ('Balqa'            ,	     'Dair Alla',	'BA',	'DA');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Dair El-Kahf',	'MA',	'DK');
INSERT INTO @tbl VALUES ('Zarqa'            ,	     'Dhlail',	'AZ',	'DL');
INSERT INTO @tbl VALUES ('Madaba'            ,	     'Dieban',	'MD',	'DB');
INSERT INTO @tbl VALUES ('Aqaba'            ,	     'Dieseh',	'AQ',	'DS');
INSERT INTO @tbl VALUES ('Ajlun'            ,	     'Erjan',	'AJ',	'EJ');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Erwaished',	'MA',	'ER');
INSERT INTO @tbl VALUES ('Madaba'            ,	     'Faisaliyyeh',	'MD',	'FS');
INSERT INTO @tbl VALUES ('Karak'            ,	     'Faqqoo''',	'KA',	'FA');
INSERT INTO @tbl VALUES ('Karak'            ,	     'Ghour El-Mazra''ah',	'KA',	'MZ');
INSERT INTO @tbl VALUES ('Karak'            ,	     'Ghour Essafi',	'KA',	'SF');
INSERT INTO @tbl VALUES ('Zarqa'            ,	     'Hashemiyyeh',	'AZ',	'HH');
INSERT INTO @tbl VALUES ('Tafilah'            ,	     'Hesa',	'AT',	'HE');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Hesban',	'AM',	'HB');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Hoasha',	'MA',	'HO');
INSERT INTO @tbl VALUES ('Ma`an'            ,	     'Husseiniyyeh',	'MN',	'HU');
INSERT INTO @tbl VALUES ('Ma`an'            ,	     'Iel',	'MN',	'IE');
INSERT INTO @tbl VALUES ('Balqa'            ,	     'Ira & Yarqa',	'BA',	'IY');
INSERT INTO @tbl VALUES ('Irbid'            ,	     'Irbid',	'IR',	'IR');
INSERT INTO @tbl VALUES ('Ma`an'            ,	     'Jafer',	'MN',	'JF');
INSERT INTO @tbl VALUES ('Jarash'            ,	     'Jarash',	'JA',	'JA');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Jizeh',	'AM',	'JI');
INSERT INTO @tbl VALUES ('Madaba'            ,	     'Jraineh',	'MD',	'JR');
INSERT INTO @tbl VALUES ('Karak'            ,	     'Karak',	'KA',	'KA');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Khaldiyyeh',	'MA',	'KD');
INSERT INTO @tbl VALUES ('Ajlun'            ,	     'Kofranjah',	'AJ',	'KF');
INSERT INTO @tbl VALUES ('Irbid'            ,	     'Kora',	'IR',	'KO');
INSERT INTO @tbl VALUES ('Ma`an'            ,	     'Ma''an',	'MN',	'MN');
INSERT INTO @tbl VALUES ('Madaba'            ,	     'Madaba',	'MD',	'MD');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Mafraq',	'MA',	'MA');
INSERT INTO @tbl VALUES ('Balqa'            ,	     'Mahes & Fohais',	'BA',	'MF');
INSERT INTO @tbl VALUES ('Madaba'            ,	     'Ma''ien',	'MD',	'MI');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Manshiyyeh',	'MA',	'MH');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Marka',	'AM',	'MK');
INSERT INTO @tbl VALUES ('Jarash'            ,	     'Mastabah',	'JA',	'MT');
INSERT INTO @tbl VALUES ('Karak'            ,	     'Mazar Janoobi',	'KA',	'MJ');
INSERT INTO @tbl VALUES ('Irbid'            ,	     'Mazar Shamali',	'IR',	'MS');
INSERT INTO @tbl VALUES ('Madaba'            ,	     'Mlaih',	'MD',	'ML');
INSERT INTO @tbl VALUES ('Karak'            ,	     'Mo''aab',	'KA',	'MB');
INSERT INTO @tbl VALUES ('Karak'            ,	     'Moojeb',	'KA',	'ME');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Mowaqqar',	'AM',	'MO');
INSERT INTO @tbl VALUES ('Ma`an'            ,	     'Mraighah',	'MN',	'MG');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Na''oor',	'AM',	'NA');
INSERT INTO @tbl VALUES ('Ma`an'            ,	     'Petra',	'MN',	'PE');
INSERT INTO @tbl VALUES ('Karak'            ,	     'Qasr',	'KA',	'QA');
INSERT INTO @tbl VALUES ('Karak'            ,	     'Qetraneh',	'KA',	'QT');
INSERT INTO @tbl VALUES ('Aqaba'            ,	     'Quaira',	'AQ',	'QR');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Quaismeh',	'AM',	'QM');
INSERT INTO @tbl VALUES ('Irbid'            ,	     'Ramtha',	'IR',	'RA');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Rhab',	'MA',	'RH');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Rojom Eshami',	'AM',	'RE');
INSERT INTO @tbl VALUES ('Zarqa'            ,	     'Russeifa',	'AZ',	'RS');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Sabha',	'MA',	'SA');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Sahab',	'AM',	'SH');
INSERT INTO @tbl VALUES ('Ajlun'            ,	     'Sakhrah',	'AJ',	'SK');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Salhiyyeh',	'MA',	'SL');
INSERT INTO @tbl VALUES ('Balqa'            ,	     'Salt',	'BA',	'ST');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Sama Serhan',	'MA',	'SS');
INSERT INTO @tbl VALUES ('Ma`an'            ,	     'Shoabak',	'MN',	'SB');
INSERT INTO @tbl VALUES ('Balqa'            ,	     'Shooneh Janoobiyyeh',	'BA',	'SJ');
INSERT INTO @tbl VALUES ('Tafilah'            ,	     'Tafileh',	'AT',	'AT');
INSERT INTO @tbl VALUES ('Irbid'            ,	     'Tayybeh',	'IR',	'TA');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Um Ejjmal',	'MA',	'UJ');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Um El-Basatien',	'AM',	'UB');
INSERT INTO @tbl VALUES ('Mafraq'            ,	     'Um El-Qottain',	'MA',	'UQ');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Um Rsas',	'AM',	'UR');
INSERT INTO @tbl VALUES ('Aqaba'            ,	     'Wadi Arabah',	'AQ',	'WA');
INSERT INTO @tbl VALUES ('Amman'            ,	     'Wadi Essier',	'AM',	'WE');
INSERT INTO @tbl VALUES ('Irbid'            ,	     'Wastiyyah',	'IR',	'WS');
INSERT INTO @tbl VALUES ('Zarqa'            ,	     'Zarqa',	'AZ',	'AZ');
INSERT INTO @tbl VALUES ('Balqa'            ,	     'Zayy',	'BA',	'ZY');

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

