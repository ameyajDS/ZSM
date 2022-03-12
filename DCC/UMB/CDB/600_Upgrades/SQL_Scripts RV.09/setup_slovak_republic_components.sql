
/* ==================================================================================
    	Source File		:	setup_slovak_republic_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Slovak_Republic are set-up
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
WHERE	country_nm	=	'Slovak Republic';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Slovak Republic not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Trencin'            ,	     'Banovce nad Bebravou',	'TC',	'BN');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Banska Bystrica',	'BC',	'BB');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Banska Stiavnica',	'BC',	'BS');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Bardejov',	'PV',	'BJ');
INSERT INTO @tbl VALUES ('Bratislava'            ,	     'Bratislava I',	'BL',	'B1');
INSERT INTO @tbl VALUES ('Bratislava'            ,	     'Bratislava II',	'BL',	'B2');
INSERT INTO @tbl VALUES ('Bratislava'            ,	     'Bratislava III',	'BL',	'B3');
INSERT INTO @tbl VALUES ('Bratislava'            ,	     'Bratislava IV',	'BL',	'B4');
INSERT INTO @tbl VALUES ('Bratislava'            ,	     'Bratislava V',	'BL',	'B5');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Brezno',	'BC',	'BR');
INSERT INTO @tbl VALUES ('Zilina'            ,	     'Bytca',	'ZI',	'BY');
INSERT INTO @tbl VALUES ('Zilina'            ,	     'Cadca',	'ZI',	'CA');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Detva',	'BC',	'DT');
INSERT INTO @tbl VALUES ('Zilina'            ,	     'Dolny Kubin',	'ZI',	'DK');
INSERT INTO @tbl VALUES ('Trnava'            ,	     'Dunajska Streda',	'TA',	'DS');
INSERT INTO @tbl VALUES ('Trnava'            ,	     'Galanta',	'TA',	'GA');
INSERT INTO @tbl VALUES ('Kosice'            ,	     'Gelnica',	'KI',	'GL');
INSERT INTO @tbl VALUES ('Trnava'            ,	     'Hlohovec',	'TA',	'HC');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Humenne',	'PV',	'HE');
INSERT INTO @tbl VALUES ('Trencin'            ,	     'Ilava',	'TC',	'IL');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Kezmarok',	'PV',	'KK');
INSERT INTO @tbl VALUES ('Nitra'            ,	     'Komarno',	'NI',	'KN');
INSERT INTO @tbl VALUES ('Kosice'            ,	     'Kosice I',	'KI',	'K1');
INSERT INTO @tbl VALUES ('Kosice'            ,	     'Kosice II',	'KI',	'K2');
INSERT INTO @tbl VALUES ('Kosice'            ,	     'Kosice III',	'KI',	'K3');
INSERT INTO @tbl VALUES ('Kosice'            ,	     'Kosice IV',	'KI',	'K4');
INSERT INTO @tbl VALUES ('Kosice'            ,	     'Kosice-okolie',	'KI',	'KS');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Krupina',	'BC',	'KA');
INSERT INTO @tbl VALUES ('Zilina'            ,	     'Kysucke Nove Mesto',	'ZI',	'KM');
INSERT INTO @tbl VALUES ('Nitra'            ,	     'Levice',	'NI',	'LV');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Levoca',	'PV',	'LE');
INSERT INTO @tbl VALUES ('Zilina'            ,	     'Liptovsky Mikulas',	'ZI',	'LM');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Lucenec',	'BC',	'LC');
INSERT INTO @tbl VALUES ('Bratislava'            ,	     'Malacky',	'BL',	'MA');
INSERT INTO @tbl VALUES ('Zilina'            ,	     'Martin',	'ZI',	'MT');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Medzilaborce',	'PV',	'ML');
INSERT INTO @tbl VALUES ('Kosice'            ,	     'Michalovce',	'KI',	'MI');
INSERT INTO @tbl VALUES ('Trencin'            ,	     'Myjava',	'TC',	'MY');
INSERT INTO @tbl VALUES ('Zilina'            ,	     'Namestovo',	'ZI',	'NO');
INSERT INTO @tbl VALUES ('Nitra'            ,	     'Nitra',	'NI',	'NR');
INSERT INTO @tbl VALUES ('Trencin'            ,	     'Nove Mesto nad Vahom',	'TC',	'NM');
INSERT INTO @tbl VALUES ('Nitra'            ,	     'Nove Zamky',	'NI',	'NZ');
INSERT INTO @tbl VALUES ('Trencin'            ,	     'Partizanske',	'TC',	'PE');
INSERT INTO @tbl VALUES ('Bratislava'            ,	     'Pezinok',	'BL',	'PK');
INSERT INTO @tbl VALUES ('Trnava'            ,	     'Piestany',	'TA',	'PN');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Poltar',	'BC',	'PT');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Poprad',	'PV',	'PP');
INSERT INTO @tbl VALUES ('Trencin'            ,	     'Povazska Bystrica',	'TC',	'PB');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Presov',	'PV',	'PO');
INSERT INTO @tbl VALUES ('Trencin'            ,	     'Prievidza',	'TC',	'PD');
INSERT INTO @tbl VALUES ('Trencin'            ,	     'Puchov',	'TC',	'PU');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Revuca',	'BC',	'RA');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Rimavska Sobota',	'BC',	'RS');
INSERT INTO @tbl VALUES ('Kosice'            ,	     'Roznava',	'KI',	'RV');
INSERT INTO @tbl VALUES ('Zilina'            ,	     'Ruzomberok',	'ZI',	'RK');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Sabinov',	'PV',	'SB');
INSERT INTO @tbl VALUES ('Nitra'            ,	     'Sala',	'NI',	'SA');
INSERT INTO @tbl VALUES ('Bratislava'            ,	     'Senec',	'BL',	'SC');
INSERT INTO @tbl VALUES ('Trnava'            ,	     'Senica',	'TA',	'SE');
INSERT INTO @tbl VALUES ('Trnava'            ,	     'Skalica',	'TA',	'SI');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Snina',	'PV',	'SV');
INSERT INTO @tbl VALUES ('Kosice'            ,	     'Sobrance',	'KI',	'SO');
INSERT INTO @tbl VALUES ('Kosice'            ,	     'Spisska Nova Ves',	'KI',	'SN');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Stara Lubovna',	'PV',	'SL');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Stropkov',	'PV',	'SP');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Svidnik',	'PV',	'SK');
INSERT INTO @tbl VALUES ('Nitra'            ,	     'Topolcany',	'NI',	'TO');
INSERT INTO @tbl VALUES ('Kosice'            ,	     'Trebisov',	'KI',	'TV');
INSERT INTO @tbl VALUES ('Trencin'            ,	     'Trencin',	'TC',	'TN');
INSERT INTO @tbl VALUES ('Trnava'            ,	     'Trnava',	'TA',	'TT');
INSERT INTO @tbl VALUES ('Zilina'            ,	     'Turcianske Teplice',	'ZI',	'TR');
INSERT INTO @tbl VALUES ('Zilina'            ,	     'Tvrdosin',	'ZI',	'TS');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Velky Krtis',	'BC',	'VK');
INSERT INTO @tbl VALUES ('Presov'            ,	     'Vranov nad Toplou',	'PV',	'VT');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Zarnovica',	'BC',	'ZC');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Ziar nad Hronom',	'BC',	'ZH');
INSERT INTO @tbl VALUES ('Zilina'            ,	     'Zilina',	'ZI',	'ZA');
INSERT INTO @tbl VALUES ('Nitra'            ,	     'Zlate Moravce',	'NI',	'ZM');
INSERT INTO @tbl VALUES ('Banska Bystrica'            ,	     'Zvolen',	'BC',	'ZV');

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

