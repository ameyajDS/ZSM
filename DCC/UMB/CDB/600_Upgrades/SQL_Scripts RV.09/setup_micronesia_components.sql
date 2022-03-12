
/* ==================================================================================
    	Source File		:	setup_micronesia_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Micronesia are set-up
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
WHERE	country_nm	=	'Micronesia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Micronesia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'State',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Yap'            ,	     'Dalipebinau',	'YA',	'DA');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Dublon',	'CH',	'DU');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Eauripik',	'YA',	'ER');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Elato',	'YA',	'EL');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Eot',	'CH',	'EO');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Ettal',	'CH',	'ET');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Fais',	'YA',	'FS');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Fala-Beguets',	'CH',	'FB');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Fananu',	'CH',	'FN');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Fanif',	'YA',	'FF');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Faraulep',	'YA',	'FP');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Fefan',	'CH',	'FF');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Gaferut Island',	'YA',	'GI');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Gagil',	'YA',	'GG');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Gilman',	'YA',	'GL');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Ifalik',	'YA',	'IF');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Kanifay',	'YA',	'KA');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Kapingamarangi',	'PO',	'KP');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Kitti',	'PO',	'KT');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Kolonia',	'PO',	'KL');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Kutu',	'CH',	'KU');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Lamotrek',	'YA',	'LA');
INSERT INTO @tbl VALUES ('Kosrae'            ,	     'Lelu',	'KO',	'LE');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Losap',	'CH',	'LO');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Lukunor',	'CH',	'LU');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Madolenihmw',	'PO',	'MA');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Magur',	'CH',	'MA');
INSERT INTO @tbl VALUES ('Kosrae'            ,	     'Malem',	'KO',	'MA');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Map',	'YA',	'MA');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Moch',	'CH',	'MC');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Moen',	'CH',	'MN');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Mokil',	'PO',	'MO');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Murilo',	'CH',	'MU');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Nama',	'CH',	'NA');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Namoluk',	'CH',	'NL');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Nett',	'PO',	'NE');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Ngatik',	'PO',	'NG');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Ngulu',	'YA',	'NG');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Nomwin',	'CH',	'NW');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Nukuoro',	'PO',	'NU');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Onari',	'CH',	'OR');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Oneop',	'CH',	'OP');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Ono',	'CH',	'OO');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Oroluk',	'PO',	'OR');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Param',	'CH',	'PR');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Pingelap',	'PO',	'PI');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Pis-Losap',	'CH',	'PL');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Pisaras',	'CH',	'PS');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Pulap',	'CH',	'PP');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Pulusuk',	'CH',	'PK');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Puluwat',	'CH',	'PW');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Romanum',	'CH',	'RO');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Rull',	'YA',	'RL');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Rumung',	'YA',	'RM');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Ruo',	'CH',	'RU');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Satawal',	'YA',	'SA');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Satawan',	'CH',	'SA');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Sokehs',	'PO',	'SO');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Sorol',	'YA',	'SO');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Ta',	'CH',	'TA');
INSERT INTO @tbl VALUES ('Kosrae'            ,	     'Tafunsak',	'KO',	'TA');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Tamatam',	'CH',	'TM');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Tol',	'CH',	'TL');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Tomil',	'YA',	'TO');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Tsis',	'CH',	'TS');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Udot',	'CH',	'UD');
INSERT INTO @tbl VALUES ('Pohnpei'            ,	     'Uh',	'PO',	'UH');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Ulithi',	'YA',	'UL');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Ulul',	'CH',	'UL');
INSERT INTO @tbl VALUES ('Chuuk'            ,	     'Uman',	'CH',	'UM');
INSERT INTO @tbl VALUES ('Kosrae'            ,	     'Utwe',	'KO',	'UT');
INSERT INTO @tbl VALUES ('Kosrae'            ,	     'Walung',	'KO',	'WA');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Weloy',	'YA',	'WE');
INSERT INTO @tbl VALUES ('Yap'            ,	     'Woleai',	'YA',	'WO');

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

