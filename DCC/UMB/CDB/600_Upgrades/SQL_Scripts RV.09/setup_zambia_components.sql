
/* ==================================================================================
    	Source File		:	setup_zambia_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Zambia are set-up
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
WHERE	country_nm	=	'Zambia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Zambia not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Eastern'            ,	     'Chadiza',	'ES',	'CD');
INSERT INTO @tbl VALUES ('Muchinga'            ,	     'Chama',	'MU',	'CM');
INSERT INTO @tbl VALUES ('North-Western'            ,	     'Chavuma',	'NW',	'CV');
INSERT INTO @tbl VALUES ('Central'            ,	     'Chibombo',	'CE',	'CB');
INSERT INTO @tbl VALUES ('Luapula'            ,	     'Chiengi',	'LP',	'CE');
INSERT INTO @tbl VALUES ('Copperbelt'            ,	     'Chililabombwe',	'CO',	'CL');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Chilubi',	'NR',	'CI');
INSERT INTO @tbl VALUES ('Copperbelt'            ,	     'Chingola',	'CO',	'CG');
INSERT INTO @tbl VALUES ('Muchinga'            ,	     'Chinsali',	'MU',	'CS');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Chipata',	'ES',	'CP');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Choma',	'SO',	'CO');
INSERT INTO @tbl VALUES ('Lusaka'            ,	     'Chongwe',	'LS',	'LR');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Gwembe',	'SO',	'GW');
INSERT INTO @tbl VALUES ('North-Western'            ,	     'Ikelenge',	'NW',	'IG');
INSERT INTO @tbl VALUES ('Muchinga'            ,	     'Isoka',	'MU',	'IO');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Itezhi Tezhi',	'SO',	'IT');
INSERT INTO @tbl VALUES ('North-Western'            ,	     'Kabompo',	'NW',	'KO');
INSERT INTO @tbl VALUES ('Central'            ,	     'Kabwe',	'CE',	'KB');
INSERT INTO @tbl VALUES ('Lusaka'            ,	     'Kafue',	'LS',	'KF');
INSERT INTO @tbl VALUES ('Western'            ,	     'Kalabo',	'WE',	'KB');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Kalomo',	'SO',	'KL');
INSERT INTO @tbl VALUES ('Copperbelt'            ,	     'Kalulushi',	'CO',	'KU');
INSERT INTO @tbl VALUES ('Western'            ,	     'Kaoma',	'WE',	'KM');
INSERT INTO @tbl VALUES ('Central'            ,	     'Kapiri Mposhi',	'CE',	'KM');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Kaputa',	'NR',	'KP');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Kasama',	'NR',	'KS');
INSERT INTO @tbl VALUES ('North-Western'            ,	     'Kasempa',	'NW',	'KE');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Katete',	'ES',	'KT');
INSERT INTO @tbl VALUES ('Luapula'            ,	     'Kawambwa',	'LP',	'KW');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Kazungula',	'SO',	'KZ');
INSERT INTO @tbl VALUES ('Copperbelt'            ,	     'Kitwe',	'CO',	'KI');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Livingstone',	'SO',	'LI');
INSERT INTO @tbl VALUES ('Lusaka'            ,	     'Luangwa',	'LS',	'LG');
INSERT INTO @tbl VALUES ('Copperbelt'            ,	     'Luanshya',	'CO',	'LS');
INSERT INTO @tbl VALUES ('Copperbelt'            ,	     'Lufwanyama',	'CO',	'LF');
INSERT INTO @tbl VALUES ('Western'            ,	     'Lukulu',	'WE',	'LK');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Lundazi',	'ES',	'LN');
INSERT INTO @tbl VALUES ('Lusaka'            ,	     'Lusaka',	'LS',	'LU');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Luwingu',	'NR',	'LW');
INSERT INTO @tbl VALUES ('Muchinga'            ,	     'Mafinga',	'MU',	'MF');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Mambwe',	'ES',	'MA');
INSERT INTO @tbl VALUES ('Luapula'            ,	     'Mansa',	'LP',	'MA');
INSERT INTO @tbl VALUES ('Copperbelt'            ,	     'Masaiti',	'CO',	'MA');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Mazabuka',	'SO',	'MA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Mbala',	'NR',	'MB');
INSERT INTO @tbl VALUES ('Luapula'            ,	     'Milenge',	'LP',	'MI');
INSERT INTO @tbl VALUES ('Central'            ,	     'Mkushi',	'CE',	'MK');
INSERT INTO @tbl VALUES ('Western'            ,	     'Mongu',	'WE',	'MO');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Monze',	'SO',	'MO');
INSERT INTO @tbl VALUES ('Muchinga'            ,	     'Mpika',	'MU',	'MK');
INSERT INTO @tbl VALUES ('Copperbelt'            ,	     'Mpongwe',	'CO',	'MP');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Mporokoso',	'NR',	'MR');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Mpulungu',	'NR',	'ML');
INSERT INTO @tbl VALUES ('Copperbelt'            ,	     'Mufulira',	'CO',	'MU');
INSERT INTO @tbl VALUES ('North-Western'            ,	     'Mufumbwe',	'NW',	'MU');
INSERT INTO @tbl VALUES ('Central'            ,	     'Mumbwa',	'CE',	'MU');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Mungwi',	'NR',	'MU');
INSERT INTO @tbl VALUES ('Luapula'            ,	     'Mwense',	'LP',	'MW');
INSERT INTO @tbl VALUES ('North-Western'            ,	     'Mwinilunga',	'NW',	'MN');
INSERT INTO @tbl VALUES ('Muchinga'            ,	     'Nakonde',	'MU',	'NK');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Namwala',	'SO',	'NW');
INSERT INTO @tbl VALUES ('Luapula'            ,	     'Nchelenge',	'LP',	'NC');
INSERT INTO @tbl VALUES ('Copperbelt'            ,	     'Ndola',	'CO',	'ND');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Nyimba',	'ES',	'NY');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Petauke',	'ES',	'PE');
INSERT INTO @tbl VALUES ('Luapula'            ,	     'Samfya',	'LP',	'SF');
INSERT INTO @tbl VALUES ('Western'            ,	     'Senanga',	'WE',	'SN');
INSERT INTO @tbl VALUES ('Central'            ,	     'Serenje',	'CE',	'SR');
INSERT INTO @tbl VALUES ('Western'            ,	     'Sesheke',	'WE',	'SS');
INSERT INTO @tbl VALUES ('Western'            ,	     'Shangombo',	'WE',	'SH');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Siavonga',	'SO',	'SV');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Sinazongwe',	'SO',	'SZ');
INSERT INTO @tbl VALUES ('North-Western'            ,	     'Solwezi',	'NW',	'SO');
INSERT INTO @tbl VALUES ('North-Western'            ,	     'Zambezi',	'NW',	'ZA');

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

