
/* ==================================================================================
    	Source File		:	setup_tajikistan_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Tajikistan are set-up
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
WHERE	country_nm	=	'Tajikistan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Tajikistan not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Raion',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Sogd'            ,	     'Ajninskij',	'LE',	'AJ');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Ashtskij',	'LE',	'AS');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Babodzhon Gafurova',	'LE',	'BA');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Bal''dzhuvonskij',	'KL',	'BA');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Beshkentskij',	'KL',	'BE');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Bohtarskij',	'KL',	'BO');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Chkalovsk',	'LE',	'CH');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Dangarinskij',	'KL',	'DA');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Darbandskij',	'RR',	'DA');
INSERT INTO @tbl VALUES ('Badakhshoni Kuni'            ,	     'Darvozskij',	'BK',	'DA');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Dzhilinkul''skij',	'KL',	'DZ');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Dzhirgatal''skij',	'RR',	'DZ');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Fajzabadskij',	'RR',	'FA');
INSERT INTO @tbl VALUES ('Dushanbe'            ,	     'Frunzenskij',	'DU',	'FR');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Ganchinskij',	'LE',	'GA');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Garmskij',	'RR',	'GA');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Gissarskij',	'RR',	'GI');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Gozimanlikskij',	'KL',	'GO');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Hodzhamastonskij',	'KL',	'HJ');
INSERT INTO @tbl VALUES ('Badakhshoni Kuni'            ,	     'Horog',	'BK',	'HO');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Hovalingskij',	'KL',	'HV');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Hudzhand',	'LE',	'HU');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'imeni Dzhabbera Rasulova',	'LE',	'DR');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Isfara',	'LE',	'IC');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Isfarinskij',	'LE',	'IR');
INSERT INTO @tbl VALUES ('Badakhshoni Kuni'            ,	     'Ishkashimskij',	'BK',	'IS');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Javanskij',	'KL',	'JA');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Kabodijonskij',	'KL',	'KA');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Kajrakkum',	'LE',	'KK');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Kanibadam',	'LE',	'KC');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Kanibadamskij',	'LE',	'KR');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Kofarnihon',	'RR',	'KC');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Kofarnihonskij',	'RR',	'KR');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Kolhozabadskij',	'KL',	'KO');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Kuhistoni Mastchohskij',	'LE',	'KM');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Kuljab',	'KL',	'KC');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Kuljabskij',	'KL',	'KR');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Kumsangirskij',	'KL',	'KM');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Kurgan-Tjube',	'KL',	'KT');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Leninskij',	'RR',	'LE');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Matchinskij',	'LE',	'MA');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Moskovskij',	'KL',	'MO');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Muminobodskij',	'KL',	'MU');
INSERT INTO @tbl VALUES ('Badakhshoni Kuni'            ,	     'Murgabskij',	'BK',	'MU');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Nauskij',	'LE',	'NA');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Nurek',	'KL',	'NC');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Nurekskij',	'KL',	'NR');
INSERT INTO @tbl VALUES ('Dushanbe'            ,	     'Oktjabr''skij',	'DU',	'OK');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Parharskij',	'KL',	'PA');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Pendzhikent',	'LE',	'PC');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Pendzhikentskij',	'LE',	'PR');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Pjandzheskij',	'KL',	'PJ');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Rogun',	'RR',	'RC');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Rogunskij',	'RR',	'RR');
INSERT INTO @tbl VALUES ('Badakhshoni Kuni'            ,	     'Roshtkalinskij',	'BK',	'RO');
INSERT INTO @tbl VALUES ('Badakhshoni Kuni'            ,	     'Rushanskij',	'BK',	'RU');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Sarband',	'KL',	'SC');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Sarbandskij',	'KL',	'SR');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Shaartuzskij',	'KL',	'ST');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Shahrinavskij',	'RR',	'SH');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Shahristanskij',	'LE',	'SH');
INSERT INTO @tbl VALUES ('Badakhshoni Kuni'            ,	     'Shugnanskij',	'BK',	'SH');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Shuroobodskij',	'KL',	'SB');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Sovetskij',	'KL',	'SO');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Taboshar',	'LE',	'TA');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Tadzhikabadskij',	'RR',	'TJ');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Tavildarinskij',	'RR',	'TV');
INSERT INTO @tbl VALUES ('Dushanbe'            ,	     'Tsentral''nyj',	'DU',	'TS');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Tursunzade',	'RR',	'TC');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Tursunzadevskij',	'RR',	'TR');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Ura-Tjube',	'LE',	'UC');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Ura-Tjubinskij',	'LE',	'UR');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Vahshskij',	'KL',	'VA');
INSERT INTO @tbl VALUES ('Badakhshoni Kuni'            ,	     'Vanchskij',	'BK',	'VA');
INSERT INTO @tbl VALUES ('Regions of Republican Subordination'            ,	     'Varzobskij',	'RR',	'VA');
INSERT INTO @tbl VALUES ('Khatlon'            ,	     'Vosejskij',	'KL',	'VO');
INSERT INTO @tbl VALUES ('Sogd'            ,	     'Zafarobodskij',	'LE',	'ZA');
INSERT INTO @tbl VALUES ('Dushanbe'            ,	     'Zheleznodorozhnyj',	'DU',	'ZH');

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

