
/* ==================================================================================
    	Source File		:	setup_peru_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Peru are set-up
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
WHERE	country_nm	=	'Peru';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Peru not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Province',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Apurimac'            ,	     'Abancay',	'AP',	'AB');
INSERT INTO @tbl VALUES ('Huancavelica'            ,	     'Acobamba',	'HV',	'AC');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Acomayo',	'CS',	'AM');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Aija',	'AN',	'AJ');
INSERT INTO @tbl VALUES ('Loreto'            ,	     'Alto Amazonas',	'LO',	'AA');
INSERT INTO @tbl VALUES ('Huanuco'            ,	     'Ambo',	'HC',	'AO');
INSERT INTO @tbl VALUES ('Apurimac'            ,	     'Andahuaylas',	'AP',	'AH');
INSERT INTO @tbl VALUES ('Huancavelica'            ,	     'Angaraes',	'HV',	'AG');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Anta',	'CS',	'AT');
INSERT INTO @tbl VALUES ('Apurimac'            ,	     'Antabamba',	'AP',	'AN');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Antonio Raymondi',	'AN',	'AR');
INSERT INTO @tbl VALUES ('Arequipa'            ,	     'Arequipa',	'AR',	'AQ');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Ascope',	'LL',	'AS');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Asuncion',	'AN',	'AI');
INSERT INTO @tbl VALUES ('Ucayali'            ,	     'Atalaya',	'UC',	'AL');
INSERT INTO @tbl VALUES ('Piura'            ,	     'Ayabaca',	'PI',	'AY');
INSERT INTO @tbl VALUES ('Apurimac'            ,	     'Aymaraes',	'AP',	'AE');
INSERT INTO @tbl VALUES ('Puno'            ,	     'Azangaro',	'PU',	'AZ');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Bagua',	'AM',	'BG');
INSERT INTO @tbl VALUES ('Lima'            ,	     'Barranca',	'LR',	'BR');
INSERT INTO @tbl VALUES ('San Martin'            ,	     'Bellavista',	'SM',	'BV');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Bolivar',	'LL',	'BL');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Bolognesi',	'AN',	'BO');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Bongara',	'AM',	'BN');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'Cajabamba',	'CJ',	'CJ');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'Cajamarca',	'CJ',	'CM');
INSERT INTO @tbl VALUES ('Lima'            ,	     'Cajatambo',	'LR',	'CJ');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Calca',	'CS',	'CC');
INSERT INTO @tbl VALUES ('Callao'            ,	     'Callao',	'CL',	'CL');
INSERT INTO @tbl VALUES ('Arequipa'            ,	     'Camana',	'AR',	'CM');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Canas',	'CS',	'CA');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Canchis',	'CS',	'CN');
INSERT INTO @tbl VALUES ('Tacna'            ,	     'Candarave',	'TA',	'CD');
INSERT INTO @tbl VALUES ('Lima'            ,	     'Canete',	'LR',	'CT');
INSERT INTO @tbl VALUES ('Ayacucho'            ,	     'Cangallo',	'AY',	'CG');
INSERT INTO @tbl VALUES ('Lima'            ,	     'Canta',	'LR',	'CA');
INSERT INTO @tbl VALUES ('Puno'            ,	     'Carabaya',	'PU',	'CB');
INSERT INTO @tbl VALUES ('Arequipa'            ,	     'Caraveli',	'AR',	'CR');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Carhuaz',	'AN',	'CZ');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Carlos Fermin Fitzcarrald',	'AN',	'CF');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Casma',	'AN',	'CA');
INSERT INTO @tbl VALUES ('Arequipa'            ,	     'Castilla',	'AR',	'CT');
INSERT INTO @tbl VALUES ('Huancavelica'            ,	     'Castrovirreyna',	'HV',	'CV');
INSERT INTO @tbl VALUES ('Arequipa'            ,	     'Caylloma',	'AR',	'CY');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'Celendin',	'CJ',	'CE');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Chachapoyas',	'AM',	'CP');
INSERT INTO @tbl VALUES ('Junin'            ,	     'Chanchamayo',	'JU',	'CM');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Chepen',	'LL',	'CP');
INSERT INTO @tbl VALUES ('Lambayeque'            ,	     'Chiclayo',	'LB',	'CL');
INSERT INTO @tbl VALUES ('Ica'            ,	     'Chincha',	'IC',	'CN');
INSERT INTO @tbl VALUES ('Apurimac'            ,	     'Chincheros',	'AP',	'CH');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'Chota',	'CJ',	'CH');
INSERT INTO @tbl VALUES ('Puno'            ,	     'Chucuito',	'PU',	'CC');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Chumbivilcas',	'CS',	'CI');
INSERT INTO @tbl VALUES ('Junin'            ,	     'Chupaca',	'JU',	'CC');
INSERT INTO @tbl VALUES ('Huancavelica'            ,	     'Churcampa',	'HV',	'CR');
INSERT INTO @tbl VALUES ('Junin'            ,	     'Concepcion',	'JU',	'CN');
INSERT INTO @tbl VALUES ('Arequipa'            ,	     'Condesuyos',	'AR',	'CS');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Condorcanqui',	'AM',	'CQ');
INSERT INTO @tbl VALUES ('Tumbes'            ,	     'Contralmirante Villar',	'TU',	'CV');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'Contumaza',	'CJ',	'CO');
INSERT INTO @tbl VALUES ('Ucayali'            ,	     'Coronel Portillo',	'UC',	'CP');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Corongo',	'AN',	'CG');
INSERT INTO @tbl VALUES ('Apurimac'            ,	     'Cotabambas',	'AP',	'CO');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Cusco',	'CS',	'CS');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'Cutervo',	'CJ',	'CU');
INSERT INTO @tbl VALUES ('Pasco'            ,	     'Daniel Alcides Carrion',	'PA',	'DA');
INSERT INTO @tbl VALUES ('Huanuco'            ,	     'Dos de Mayo',	'HC',	'DM');
INSERT INTO @tbl VALUES ('Puno'            ,	     'El Collao',	'PU',	'EC');
INSERT INTO @tbl VALUES ('San Martin'            ,	     'El Dorado',	'SM',	'ED');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Espinar',	'CS',	'ES');
INSERT INTO @tbl VALUES ('Lambayeque'            ,	     'Ferrenafe',	'LB',	'FE');
INSERT INTO @tbl VALUES ('Moquegua'            ,	     'General Sanchez Cerro',	'MQ',	'GS');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Gran Chimu',	'LL',	'GC');
INSERT INTO @tbl VALUES ('Apurimac'            ,	     'Grau',	'AP',	'GR');
INSERT INTO @tbl VALUES ('Huanuco'            ,	     'Huacaybamba',	'HC',	'HC');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'Hualgayoc',	'CJ',	'HG');
INSERT INTO @tbl VALUES ('San Martin'            ,	     'Huallaga',	'SM',	'HL');
INSERT INTO @tbl VALUES ('Huanuco'            ,	     'Huamalies',	'HC',	'HE');
INSERT INTO @tbl VALUES ('Ayacucho'            ,	     'Huamanga',	'AY',	'HM');
INSERT INTO @tbl VALUES ('Piura'            ,	     'Huancabamba',	'PI',	'HB');
INSERT INTO @tbl VALUES ('Puno'            ,	     'Huancane',	'PU',	'HN');
INSERT INTO @tbl VALUES ('Ayacucho'            ,	     'Huanca Sancos',	'AY',	'HS');
INSERT INTO @tbl VALUES ('Huancavelica'            ,	     'Huancavelica',	'HV',	'HV');
INSERT INTO @tbl VALUES ('Junin'            ,	     'Huancayo',	'JU',	'HO');
INSERT INTO @tbl VALUES ('Ayacucho'            ,	     'Huanta',	'AY',	'HN');
INSERT INTO @tbl VALUES ('Huanuco'            ,	     'Huanuco',	'HC',	'HN');
INSERT INTO @tbl VALUES ('Lima'            ,	     'Huaral',	'LR',	'HR');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Huaraz',	'AN',	'HZ');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Huari',	'AN',	'HI');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Huarmey',	'AN',	'HA');
INSERT INTO @tbl VALUES ('Lima'            ,	     'Huarochiri',	'LR',	'HH');
INSERT INTO @tbl VALUES ('Lima'            ,	     'Huaura',	'LR',	'HU');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Huaylas',	'AN',	'HY');
INSERT INTO @tbl VALUES ('Huancavelica'            ,	     'Huaytara',	'HV',	'HT');
INSERT INTO @tbl VALUES ('Ica'            ,	     'Ica',	'IC',	'IC');
INSERT INTO @tbl VALUES ('Moquegua'            ,	     'Ilo',	'MQ',	'IL');
INSERT INTO @tbl VALUES ('Arequipa'            ,	     'Islay',	'AR',	'IS');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'Jaen',	'CJ',	'JA');
INSERT INTO @tbl VALUES ('Junin'            ,	     'Jauja',	'JU',	'JJ');
INSERT INTO @tbl VALUES ('Tacna'            ,	     'Jorge Basadre',	'TA',	'JB');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Julcan',	'LL',	'JU');
INSERT INTO @tbl VALUES ('Junin'            ,	     'Junin',	'JU',	'JN');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'La Convencion',	'CS',	'LC');
INSERT INTO @tbl VALUES ('Ayacucho'            ,	     'La Mar',	'AY',	'LM');
INSERT INTO @tbl VALUES ('San Martin'            ,	     'Lamas',	'SM',	'LS');
INSERT INTO @tbl VALUES ('Lambayeque'            ,	     'Lambayeque',	'LB',	'LQ');
INSERT INTO @tbl VALUES ('Puno'            ,	     'Lampa',	'PU',	'LA');
INSERT INTO @tbl VALUES ('Arequipa'            ,	     'La Union',	'AR',	'LU');
INSERT INTO @tbl VALUES ('Huanuco'            ,	     'Lauricocha',	'HC',	'LR');
INSERT INTO @tbl VALUES ('Huanuco'            ,	     'Leoncio Prado',	'HC',	'LP');
INSERT INTO @tbl VALUES ('Lima [Province]'            ,	     'Lima',	'LP',	'LI');
INSERT INTO @tbl VALUES ('Loreto'            ,	     'Loreto',	'LO',	'LO');
INSERT INTO @tbl VALUES ('Ayacucho'            ,	     'Lucanas',	'AY',	'LN');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Luya',	'AM',	'LY');
INSERT INTO @tbl VALUES ('Madre de Dios'            ,	     'Manu',	'MD',	'MU');
INSERT INTO @tbl VALUES ('Huanuco'            ,	     'Maranon',	'HC',	'MA');
INSERT INTO @tbl VALUES ('San Martin'            ,	     'Mariscal Caceres',	'SM',	'MC');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Mariscal Luzuriaga',	'AN',	'ML');
INSERT INTO @tbl VALUES ('Moquegua'            ,	     'Mariscal Nieto',	'MQ',	'MN');
INSERT INTO @tbl VALUES ('Loreto'            ,	     'Mariscal Ramon Castilla',	'LO',	'MR');
INSERT INTO @tbl VALUES ('Loreto'            ,	     'Maynas',	'LO',	'MY');
INSERT INTO @tbl VALUES ('Puno'            ,	     'Melgar',	'PU',	'ME');
INSERT INTO @tbl VALUES ('Puno'            ,	     'Moho',	'PU',	'MH');
INSERT INTO @tbl VALUES ('Piura'            ,	     'Morropon',	'PI',	'MO');
INSERT INTO @tbl VALUES ('San Martin'            ,	     'Moyobamba',	'SM',	'MB');
INSERT INTO @tbl VALUES ('Ica'            ,	     'Nazca',	'IC',	'NA');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Ocros',	'AN',	'OC');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Otuzco',	'LL',	'OT');
INSERT INTO @tbl VALUES ('Pasco'            ,	     'Oxapampa',	'PA',	'OX');
INSERT INTO @tbl VALUES ('Lima'            ,	     'Oyon',	'LR',	'OY');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Pacasmayo',	'LL',	'PY');
INSERT INTO @tbl VALUES ('Huanuco'            ,	     'Pachitea',	'HC',	'PE');
INSERT INTO @tbl VALUES ('Ucayali'            ,	     'Padre Abad',	'UC',	'PA');
INSERT INTO @tbl VALUES ('Piura'            ,	     'Paita',	'PI',	'PT');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Pallasca',	'AN',	'PL');
INSERT INTO @tbl VALUES ('Ica'            ,	     'Palpa',	'IC',	'PP');
INSERT INTO @tbl VALUES ('Ayacucho'            ,	     'Parinacochas',	'AY',	'PH');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Paruro',	'CS',	'PR');
INSERT INTO @tbl VALUES ('Pasco'            ,	     'Pasco',	'PA',	'PC');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Pataz',	'LL',	'PZ');
INSERT INTO @tbl VALUES ('Ayacucho'            ,	     'Paucar del Sara Sara',	'AY',	'PS');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Paucartambo',	'CS',	'PM');
INSERT INTO @tbl VALUES ('San Martin'            ,	     'Picota',	'SM',	'PC');
INSERT INTO @tbl VALUES ('Ica'            ,	     'Pisco',	'IC',	'PO');
INSERT INTO @tbl VALUES ('Piura'            ,	     'Piura',	'PI',	'PR');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Pomabamba',	'AN',	'PB');
INSERT INTO @tbl VALUES ('Huanuco'            ,	     'Puerto Inca',	'HC',	'PI');
INSERT INTO @tbl VALUES ('Puno'            ,	     'Puno',	'PU',	'PN');
INSERT INTO @tbl VALUES ('Ucayali'            ,	     'Purus',	'UC',	'PU');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Quispicanchi',	'CS',	'QC');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Recuay',	'AN',	'RE');
INSERT INTO @tbl VALUES ('Loreto'            ,	     'Requena',	'LO',	'RQ');
INSERT INTO @tbl VALUES ('San Martin'            ,	     'Rioja',	'SM',	'RI');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Rodriguez de Mendoza',	'AM',	'RM');
INSERT INTO @tbl VALUES ('Puno'            ,	     'San Antonio de Putina',	'PU',	'SA');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Sanchez Carrion',	'LL',	'SC');
INSERT INTO @tbl VALUES ('Puno'            ,	     'Sandia',	'PU',	'SN');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'San Ignacio',	'CJ',	'SI');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'San Marcos',	'CJ',	'SS');
INSERT INTO @tbl VALUES ('San Martin'            ,	     'San Martin',	'SM',	'SM');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'San Miguel',	'CJ',	'SG');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'San Pablo',	'CJ',	'SP');
INSERT INTO @tbl VALUES ('Puno'            ,	     'San Roman',	'PU',	'SR');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Santa',	'AN',	'ST');
INSERT INTO @tbl VALUES ('Cajamarca'            ,	     'Santa Cruz',	'CJ',	'SZ');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Santiago de Chuco',	'LL',	'SD');
INSERT INTO @tbl VALUES ('Junin'            ,	     'Satipo',	'JU',	'SO');
INSERT INTO @tbl VALUES ('Piura'            ,	     'Sechura',	'PI',	'SE');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Sihuas',	'AN',	'SH');
INSERT INTO @tbl VALUES ('Ayacucho'            ,	     'Sucre',	'AY',	'SU');
INSERT INTO @tbl VALUES ('Piura'            ,	     'Sullana',	'PI',	'SL');
INSERT INTO @tbl VALUES ('Tacna'            ,	     'Tacna',	'TA',	'TC');
INSERT INTO @tbl VALUES ('Madre de Dios'            ,	     'Tahuamanu',	'MD',	'TH');
INSERT INTO @tbl VALUES ('Piura'            ,	     'Talara',	'PI',	'TL');
INSERT INTO @tbl VALUES ('Madre de Dios'            ,	     'Tambopata',	'MD',	'TP');
INSERT INTO @tbl VALUES ('Tacna'            ,	     'Tarata',	'TA',	'TA');
INSERT INTO @tbl VALUES ('Junin'            ,	     'Tarma',	'JU',	'TR');
INSERT INTO @tbl VALUES ('Huancavelica'            ,	     'Tayacaja',	'HV',	'TY');
INSERT INTO @tbl VALUES ('San Martin'            ,	     'Tocache',	'SM',	'TO');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Trujillo',	'LL',	'TJ');
INSERT INTO @tbl VALUES ('Tumbes'            ,	     'Tumbes',	'TU',	'TU');
INSERT INTO @tbl VALUES ('Loreto'            ,	     'Ucayali',	'LO',	'UC');
INSERT INTO @tbl VALUES ('Cusco'            ,	     'Urubamba',	'CS',	'UR');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Utcubamba',	'AM',	'UT');
INSERT INTO @tbl VALUES ('Ayacucho'            ,	     'Victor Fajardo',	'AY',	'VF');
INSERT INTO @tbl VALUES ('Ayacucho'            ,	     'Vilcas Huaman',	'AY',	'VH');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Viru',	'LL',	'VI');
INSERT INTO @tbl VALUES ('Huanuco'            ,	     'Yarowilca',	'HC',	'YW');
INSERT INTO @tbl VALUES ('Junin'            ,	     'Yauli',	'JU',	'YL');
INSERT INTO @tbl VALUES ('Lima'            ,	     'Yauyos',	'LR',	'YY');
INSERT INTO @tbl VALUES ('Ancash'            ,	     'Yungay',	'AN',	'YN');
INSERT INTO @tbl VALUES ('Puno'            ,	     'Yunguyo',	'PU',	'YU');
INSERT INTO @tbl VALUES ('Tumbes'            ,	     'Zarumilla',	'TU',	'ZA');

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

