
/* ==================================================================================
    	Source File		:	setup_guatemala_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Guatemala are set-up
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
WHERE	country_nm	=	'Guatemala';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Guatemala not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Department',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'Acatenango',	'CM',	'AC');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Agua Blanca',	'JU',	'AB');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Aguacatan',	'HU',	'AG');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Almolonga',	'QZ',	'AL');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Alotenango',	'SA',	'AL');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'Amatitlan',	'GU',	'AM');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Antigua Guatemala',	'SA',	'AG');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Asuncion Mita',	'JU',	'AM');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Atescatempa',	'JU',	'AT');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Ayutla',	'SM',	'AY');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Barberena',	'SR',	'BA');
INSERT INTO @tbl VALUES ('Zacapa'            ,	     'Cabanas',	'ZA',	'CA');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Cabrican',	'QZ',	'CB');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Cahabon',	'AV',	'CB');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Cajola',	'QZ',	'CJ');
INSERT INTO @tbl VALUES ('Chiquimula'            ,	     'Camotan',	'CQ',	'CA');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Canilla',	'QC',	'CA');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Cantel',	'QZ',	'CT');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Casillas',	'SR',	'CA');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Catarina',	'SM',	'CA');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Chahal',	'AV',	'CH');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Chajul',	'QC',	'CJ');
INSERT INTO @tbl VALUES ('Retalhuleu'            ,	     'Champerico',	'RE',	'CH');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Chiantla',	'HU',	'CT');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'Chicacao',	'SU',	'CH');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Chicaman',	'QC',	'CM');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Chiche',	'QC',	'CH');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Chichicastenango',	'QC',	'CC');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'Chimaltenango',	'CM',	'CH');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'Chinautla',	'GU',	'CN');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Chinique',	'QC',	'CQ');
INSERT INTO @tbl VALUES ('Chiquimula'            ,	     'Chiquimula',	'CQ',	'CH');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Chiquimulilla',	'SR',	'CH');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Chisec',	'AV',	'CC');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'Chuarrancho',	'GU',	'CR');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'Ciudad Guatemala',	'GU',	'CG');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Ciudad Vieja',	'SA',	'CV');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Coatepeque',	'QZ',	'CP');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Coban',	'AV',	'CO');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Colomba',	'QZ',	'CM');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Colotenango',	'HU',	'CO');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Comapa',	'JU',	'CM');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Comitancillo',	'SM',	'CO');
INSERT INTO @tbl VALUES ('Solola'            ,	     'Concepcion',	'SO',	'CO');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Concepcion Chiquirichapa',	'QZ',	'CC');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Concepcion Huista',	'HU',	'CH');
INSERT INTO @tbl VALUES ('Chiquimula'            ,	     'Concepcion Las Minas',	'CQ',	'CM');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Concepcion Tutuapa',	'SM',	'CT');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Conguaco',	'JU',	'CG');
INSERT INTO @tbl VALUES ('Baja Verapaz'            ,	     'Cubulco',	'BV',	'CU');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Cuilapa',	'SR',	'CU');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Cuilco',	'HU',	'CU');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Cunen',	'QC',	'CU');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'Cuyotenango',	'SU',	'CU');
INSERT INTO @tbl VALUES ('Peten'            ,	     'Dolores',	'PE',	'DO');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'El Adelanto',	'JU',	'EA');
INSERT INTO @tbl VALUES ('Retalhuleu'            ,	     'El Asintal',	'RE',	'EA');
INSERT INTO @tbl VALUES ('Baja Verapaz'            ,	     'El Chol',	'BV',	'EC');
INSERT INTO @tbl VALUES ('Izabal'            ,	     'El Estor',	'IZ',	'EE');
INSERT INTO @tbl VALUES ('El Progreso'            ,	     'El Jicaro',	'PR',	'EJ');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'El Palmar',	'QZ',	'EP');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'El Progreso',	'JU',	'EP');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'El Quetzal',	'SM',	'EQ');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'El Rodeo',	'SM',	'ER');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'El Tejar',	'CM',	'ET');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'El Tumbador',	'SM',	'ET');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'Escuintla',	'ES',	'ES');
INSERT INTO @tbl VALUES ('Chiquimula'            ,	     'Esquipulas',	'CQ',	'ES');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Esquipulas Palo Gordo',	'SM',	'EP');
INSERT INTO @tbl VALUES ('Zacapa'            ,	     'Estanzuela',	'ZA',	'ES');
INSERT INTO @tbl VALUES ('Peten'            ,	     'Flores',	'PE',	'FL');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Flores Costa Cuca',	'QZ',	'FC');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'Fraijanes',	'GU',	'FR');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Fray Bartolome de las Casas',	'AV',	'FB');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Genova',	'QZ',	'GE');
INSERT INTO @tbl VALUES ('Baja Verapaz'            ,	     'Granados',	'BV',	'GR');
INSERT INTO @tbl VALUES ('Zacapa'            ,	     'Gualan',	'ZA',	'GU');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'Guanagazapa',	'ES',	'GU');
INSERT INTO @tbl VALUES ('El Progreso'            ,	     'Guastatoya',	'PR',	'GU');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Guazacapan',	'SR',	'GU');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Huehuetenango',	'HU',	'HU');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Huitan',	'QZ',	'HU');
INSERT INTO @tbl VALUES ('Zacapa'            ,	     'Huite',	'ZA',	'HU');
INSERT INTO @tbl VALUES ('Chiquimula'            ,	     'Ipala',	'CQ',	'IP');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Ixcan',	'QC',	'IX');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Ixchiguan',	'SM',	'IX');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Ixtahuacan',	'HU',	'IX');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'Iztapa',	'ES',	'IZ');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Jacaltenango',	'HU',	'JA');
INSERT INTO @tbl VALUES ('Jalapa'            ,	     'Jalapa',	'JA',	'JA');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Jalpatagua',	'JU',	'JA');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Jerez',	'JU',	'JE');
INSERT INTO @tbl VALUES ('Chiquimula'            ,	     'Jocotan',	'CQ',	'JO');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Jocotenango',	'SA',	'JO');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Joyabaj',	'QC',	'JO');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Jutiapa',	'JU',	'JU');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'La Democracia',	'ES',	'LD');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'La Democracia',	'HU',	'LD');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'La Esperanza',	'QZ',	'LE');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'La Gomera',	'ES',	'LG');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'La Libertad',	'HU',	'LL');
INSERT INTO @tbl VALUES ('Peten'            ,	     'La Libertad',	'PE',	'LL');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Lanquin',	'AV',	'LA');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'La Reforma',	'SM',	'LR');
INSERT INTO @tbl VALUES ('Zacapa'            ,	     'La Union',	'ZA',	'LU');
INSERT INTO @tbl VALUES ('Izabal'            ,	     'Livingston',	'IZ',	'LI');
INSERT INTO @tbl VALUES ('Izabal'            ,	     'Los Amates',	'IZ',	'LA');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Magdalena Milpas Altas',	'SA',	'MM');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Malacatan',	'SM',	'MA');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Malacatancito',	'HU',	'MC');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'Masagua',	'ES',	'MA');
INSERT INTO @tbl VALUES ('Jalapa'            ,	     'Mataquescuintla',	'JA',	'MA');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'Mazatenango',	'SU',	'MA');
INSERT INTO @tbl VALUES ('Peten'            ,	     'Melchor de Mencos',	'PE',	'MM');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'Mixco',	'GU',	'MX');
INSERT INTO @tbl VALUES ('Totonicapan'            ,	     'Momostenango',	'TO',	'MO');
INSERT INTO @tbl VALUES ('Jalapa'            ,	     'Monjas',	'JA',	'MO');
INSERT INTO @tbl VALUES ('Izabal'            ,	     'Morales',	'IZ',	'MO');
INSERT INTO @tbl VALUES ('El Progreso'            ,	     'Morazan',	'PR',	'MO');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Moyuta',	'JU',	'MO');
INSERT INTO @tbl VALUES ('Solola'            ,	     'Nahuala',	'SO',	'NA');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Nebaj',	'QC',	'NE');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Nenton',	'HU',	'NE');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'Nueva Concepcion',	'ES',	'NC');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Nueva Santa Rosa',	'SR',	'NS');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Nuevo Progreso',	'SM',	'NP');
INSERT INTO @tbl VALUES ('Retalhuleu'            ,	     'Nuevo San Carlos',	'RE',	'NS');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Ocos',	'SM',	'OC');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Olintepeque',	'QZ',	'OL');
INSERT INTO @tbl VALUES ('Chiquimula'            ,	     'Olopa',	'CQ',	'OL');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Oratorio',	'SR',	'OR');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Ostuncalco',	'QZ',	'OS');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Pachalum',	'QC',	'PC');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Pajapita',	'SM',	'PA');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'Palencia',	'GU',	'PA');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Palestina de Los Altos',	'QZ',	'PA');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'Palin',	'ES',	'PA');
INSERT INTO @tbl VALUES ('Solola'            ,	     'Panajachel',	'SO',	'PA');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Panzos',	'AV',	'PA');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'Parramos',	'CM',	'PR');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Pasaco',	'JU',	'PA');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Pastores',	'SA',	'PA');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'Patulul',	'SU',	'PA');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'Patzicia',	'CM',	'PC');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Patzite',	'QC',	'PZ');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'Patzun',	'CM',	'PN');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'Pochuta',	'CM',	'PO');
INSERT INTO @tbl VALUES ('Peten'            ,	     'Poptun',	'PE',	'PO');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'Pueblo Nuevo',	'SU',	'PN');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Pueblo Nuevo Vinas',	'SR',	'PN');
INSERT INTO @tbl VALUES ('Izabal'            ,	     'Puerto Barrios',	'IZ',	'PB');
INSERT INTO @tbl VALUES ('Baja Verapaz'            ,	     'Purulha',	'BV',	'PU');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Quesada',	'JU',	'QU');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Quetzaltenango',	'QZ',	'QU');
INSERT INTO @tbl VALUES ('Chiquimula'            ,	     'Quezaltepeque',	'CQ',	'QU');
INSERT INTO @tbl VALUES ('Baja Verapaz'            ,	     'Rabinal',	'BV',	'RA');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Raxruha',	'AV',	'RX');
INSERT INTO @tbl VALUES ('Retalhuleu'            ,	     'Retalhuleu',	'RE',	'RE');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Rio Blanco',	'SM',	'RB');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'Rio Bravo',	'SU',	'RB');
INSERT INTO @tbl VALUES ('Zacapa'            ,	     'Rio Hondo',	'ZA',	'RH');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Sacapulas',	'QC',	'SA');
INSERT INTO @tbl VALUES ('Baja Verapaz'            ,	     'Salama',	'BV',	'SA');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Salcaja',	'QZ',	'SJ');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'Samayac',	'SU',	'SA');
INSERT INTO @tbl VALUES ('El Progreso'            ,	     'San Agustin Acasaguastlan',	'PR',	'AA');
INSERT INTO @tbl VALUES ('Peten'            ,	     'San Andres',	'PE',	'SA');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'San Andres Itzapa',	'CM',	'AI');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'San Andres Sajcabaja',	'QC',	'AS');
INSERT INTO @tbl VALUES ('Solola'            ,	     'San Andres Semetabaj',	'SO',	'AS');
INSERT INTO @tbl VALUES ('Retalhuleu'            ,	     'San Andres Villa Seca',	'RE',	'AV');
INSERT INTO @tbl VALUES ('Totonicapan'            ,	     'San Andres Xecul',	'TO',	'AX');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'San Antonio Aguas Calientes',	'SA',	'AA');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'San Antonio Huista',	'HU',	'AH');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'San Antonio Ilotenango',	'QC',	'AI');
INSERT INTO @tbl VALUES ('El Progreso'            ,	     'San Antonio La Paz',	'PR',	'AP');
INSERT INTO @tbl VALUES ('Solola'            ,	     'San Antonio Palopo',	'SO',	'AP');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'San Antonio Sacatepequez',	'SM',	'AS');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'San Antonio Suchitepequez',	'SU',	'AS');
INSERT INTO @tbl VALUES ('El Progreso'            ,	     'Sanarate',	'PR',	'SR');
INSERT INTO @tbl VALUES ('Totonicapan'            ,	     'San Bartolo',	'TO',	'SB');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'San Bartolome Jocotenango',	'QC',	'BJ');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'San Bartolome Milpas Altas',	'SA',	'BM');
INSERT INTO @tbl VALUES ('Peten'            ,	     'San Benito',	'PE',	'SB');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'San Bernardino',	'SU',	'SB');
INSERT INTO @tbl VALUES ('Jalapa'            ,	     'San Carlos Alzatate',	'JA',	'CA');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'San Carlos Sija',	'QZ',	'CS');
INSERT INTO @tbl VALUES ('El Progreso'            ,	     'San Cristobal Acasaguastlan',	'PR',	'CA');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'San Cristobal Cucho',	'SM',	'CC');
INSERT INTO @tbl VALUES ('Totonicapan'            ,	     'San Cristobal Totonicapan',	'TO',	'CT');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'San Cristobal Verapaz',	'AV',	'CV');
INSERT INTO @tbl VALUES ('Zacapa'            ,	     'San Diego',	'ZA',	'SD');
INSERT INTO @tbl VALUES ('Retalhuleu'            ,	     'San Felipe',	'RE',	'SF');
INSERT INTO @tbl VALUES ('Peten'            ,	     'San Francisco',	'PE',	'SF');
INSERT INTO @tbl VALUES ('Totonicapan'            ,	     'San Francisco El Alto',	'TO',	'FA');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'San Francisco La Union',	'QZ',	'FU');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'San Francisco Zapotitlan',	'SU',	'FZ');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'San Gabriel',	'SU',	'SG');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'San Gaspar Ixchil',	'HU',	'GI');
INSERT INTO @tbl VALUES ('Chiquimula'            ,	     'San Jacinto',	'CQ',	'SJ');
INSERT INTO @tbl VALUES ('Baja Verapaz'            ,	     'San Jeronimo',	'BV',	'SJ');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'San Jose',	'ES',	'SJ');
INSERT INTO @tbl VALUES ('Peten'            ,	     'San Jose',	'PE',	'SJ');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'San Jose Acatempa',	'JU',	'SJ');
INSERT INTO @tbl VALUES ('Solola'            ,	     'San Jose Chacaya',	'SO',	'JC');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'San Jose del Golfo',	'GU',	'JG');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'San Jose El Idolo',	'SU',	'JI');
INSERT INTO @tbl VALUES ('Chiquimula'            ,	     'San Jose La Arada',	'CQ',	'JA');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'San Jose Ojetenam',	'SM',	'JO');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'San Jose Pinula',	'GU',	'JP');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'San Jose Poaquil',	'CM',	'JP');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'San Juan Atitan',	'HU',	'SJ');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'San Juan Bautista',	'SU',	'JB');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'San Juan Chamelco',	'AV',	'JC');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'San Juan Comalapa',	'CM',	'JC');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'San Juan Cotzal',	'QC',	'JC');
INSERT INTO @tbl VALUES ('Chiquimula'            ,	     'San Juan Ermita',	'CQ',	'JE');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'San Juan Ixcoy',	'HU',	'JI');
INSERT INTO @tbl VALUES ('Solola'            ,	     'San Juan La Laguna',	'SO',	'JL');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'San Juan Sacatepequez',	'GU',	'JS');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'San Juan Tecuaco',	'SR',	'JT');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'San Lorenzo',	'SM',	'SL');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'San Lorenzo',	'SU',	'SL');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'San Lucas Sacatepequez',	'SA',	'LS');
INSERT INTO @tbl VALUES ('Solola'            ,	     'San Lucas Toliman',	'SO',	'LT');
INSERT INTO @tbl VALUES ('Peten'            ,	     'San Luis',	'PE',	'SL');
INSERT INTO @tbl VALUES ('Jalapa'            ,	     'San Luis Jilotepeque',	'JA',	'LJ');
INSERT INTO @tbl VALUES ('Jalapa'            ,	     'San Manuel Chaparron',	'JA',	'MC');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'San Marcos',	'SM',	'SM');
INSERT INTO @tbl VALUES ('Solola'            ,	     'San Marcos La Laguna',	'SO',	'ML');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'San Martin Jilotepeque',	'CM',	'MJ');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'San Martin Sacatepequez',	'QZ',	'SS');
INSERT INTO @tbl VALUES ('Retalhuleu'            ,	     'San Martin Zapotitlan',	'RE',	'MZ');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'San Mateo',	'QZ',	'SM');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'San Mateo Ixtatan',	'HU',	'MI');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'San Miguel Acatan',	'HU',	'MA');
INSERT INTO @tbl VALUES ('Baja Verapaz'            ,	     'San Miguel Chicaj',	'BV',	'MC');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'San Miguel Duenas',	'SA',	'MD');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'San Miguel Ixtahuacan',	'SM',	'MI');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'San Miguel Panan',	'SU',	'MP');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'San Miguel Petapa',	'GU',	'MP');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'San Miguel Siguila',	'QZ',	'MS');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'San Miguel Tucuru',	'AV',	'MT');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'San Pablo',	'SM',	'SP');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'San Pablo Jocopilas',	'SU',	'PJ');
INSERT INTO @tbl VALUES ('Solola'            ,	     'San Pablo La Laguna',	'SO',	'PL');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'San Pedro Ayampuc',	'GU',	'SP');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'San Pedro Carcha',	'AV',	'PC');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'San Pedro Jocopilas',	'QC',	'PJ');
INSERT INTO @tbl VALUES ('Solola'            ,	     'San Pedro La Laguna',	'SO',	'SP');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'San Pedro Necta',	'HU',	'PN');
INSERT INTO @tbl VALUES ('Jalapa'            ,	     'San Pedro Pinula',	'JA',	'PP');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'San Pedro Sacatepequez',	'GU',	'PS');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'San Pedro Sacatepequez',	'SM',	'PS');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'San Rafael La Independencia',	'HU',	'RI');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'San Rafael Las Flores',	'SR',	'RF');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'San Rafael Petzal',	'HU',	'RP');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'San Rafael Pie de La Cuesta',	'SM',	'RP');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'San Raimundo',	'GU',	'SR');
INSERT INTO @tbl VALUES ('El Progreso'            ,	     'Sansare',	'PR',	'SS');
INSERT INTO @tbl VALUES ('Retalhuleu'            ,	     'San Sebastian',	'RE',	'SS');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'San Sebastian Coatan',	'HU',	'SS');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'San Sebastian Huehuetenango',	'HU',	'SH');
INSERT INTO @tbl VALUES ('Peten'            ,	     'Santa Ana',	'PE',	'AN');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Santa Ana Huista',	'HU',	'SA');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'Santa Apolonia',	'CM',	'SA');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Santa Barbara',	'HU',	'SB');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'Santa Barbara',	'SU',	'BA');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Santa Catalina La Tinta',	'AV',	'CT');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Santa Catarina Barahona',	'SA',	'CB');
INSERT INTO @tbl VALUES ('Solola'            ,	     'Santa Catarina Ixtahuacan',	'SO',	'CI');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Santa Catarina Mita',	'JU',	'SC');
INSERT INTO @tbl VALUES ('Solola'            ,	     'Santa Catarina Palopo',	'SO',	'CP');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'Santa Catarina Pinula',	'GU',	'CP');
INSERT INTO @tbl VALUES ('Solola'            ,	     'Santa Clara La Laguna',	'SO',	'CL');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'Santa Cruz Balanya',	'CM',	'CB');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Santa Cruz Barillas',	'HU',	'CB');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Santa Cruz del Quiche',	'QC',	'SC');
INSERT INTO @tbl VALUES ('Solola'            ,	     'Santa Cruz La Laguna',	'SO',	'SC');
INSERT INTO @tbl VALUES ('Retalhuleu'            ,	     'Santa Cruz Mulua',	'RE',	'SC');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Santa Cruz Naranjo',	'SR',	'CN');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Santa Cruz Verapaz',	'AV',	'SC');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Santa Eulalia',	'HU',	'SE');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'Santa Lucia Cotzumalguapa',	'ES',	'LC');
INSERT INTO @tbl VALUES ('Totonicapan'            ,	     'Santa Lucia La Reforma',	'TO',	'LR');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Santa Lucia Milpas Altas',	'SA',	'LM');
INSERT INTO @tbl VALUES ('Solola'            ,	     'Santa Lucia Utatlan',	'SO',	'LU');
INSERT INTO @tbl VALUES ('Totonicapan'            ,	     'Santa Maria Chiquimula',	'TO',	'MC');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Santa Maria de Jesus',	'SA',	'MJ');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Santa Maria Ixhuatan',	'SR',	'MI');
INSERT INTO @tbl VALUES ('Solola'            ,	     'Santa Maria Visitacion',	'SO',	'MV');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Santa Rosa de Lima',	'SR',	'RL');
INSERT INTO @tbl VALUES ('Solola'            ,	     'Santiago Atitlan',	'SO',	'SA');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Santiago Chimaltenango',	'HU',	'SC');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Santiago Sacatepequez',	'SA',	'SS');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'Santo Domingo Suchitepequez',	'SU',	'DS');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Santo Domingo Xenacoj',	'SA',	'DX');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'Santo Tomas La Union',	'SU',	'TU');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'San Vicente Pacaya',	'ES',	'VP');
INSERT INTO @tbl VALUES ('Peten'            ,	     'Sayaxche',	'PE',	'SX');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Senahu',	'AV',	'SE');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Sibilia',	'QZ',	'SB');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Sibinal',	'SM',	'SB');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Sipacapa',	'SM',	'SC');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'Siquinala',	'ES',	'SI');
INSERT INTO @tbl VALUES ('Solola'            ,	     'Solola',	'SO',	'SO');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Soloma',	'HU',	'SO');
INSERT INTO @tbl VALUES ('Sacatepequez'            ,	     'Sumpango',	'SA',	'SU');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Tacana',	'SM',	'TN');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Tactic',	'AV',	'TC');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Tajumulco',	'SM',	'TM');
INSERT INTO @tbl VALUES ('Alta Verapaz'            ,	     'Tamahu',	'AV',	'TM');
INSERT INTO @tbl VALUES ('Santa Rosa'            ,	     'Taxisco',	'SR',	'TA');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'Tecpan Guatemala',	'CM',	'TG');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Tectitan',	'HU',	'TE');
INSERT INTO @tbl VALUES ('Zacapa'            ,	     'Teculutan',	'ZA',	'TE');
INSERT INTO @tbl VALUES ('San Marcos'            ,	     'Tejutla',	'SM',	'TE');
INSERT INTO @tbl VALUES ('Escuintla'            ,	     'Tiquisate',	'ES',	'TI');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Todos Santos Cuchumatan',	'HU',	'TS');
INSERT INTO @tbl VALUES ('Totonicapan'            ,	     'Totonicapan',	'TO',	'TO');
INSERT INTO @tbl VALUES ('Huehuetenango'            ,	     'Union Cantinil',	'HU',	'UC');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Uspantan',	'QC',	'US');
INSERT INTO @tbl VALUES ('Zacapa'            ,	     'Usumatlan',	'ZA',	'US');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'Villa Canales',	'GU',	'VC');
INSERT INTO @tbl VALUES ('Guatemala'            ,	     'Villa Nueva',	'GU',	'VN');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'Yepocapa',	'CM',	'YE');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Yupiltepeque',	'JU',	'YU');
INSERT INTO @tbl VALUES ('Zacapa'            ,	     'Zacapa',	'ZA',	'ZA');
INSERT INTO @tbl VALUES ('Quiche'            ,	     'Zacualpa',	'QC',	'ZA');
INSERT INTO @tbl VALUES ('Jutiapa'            ,	     'Zapotitlan',	'JU',	'ZA');
INSERT INTO @tbl VALUES ('Chimaltenango'            ,	     'Zaragoza',	'CM',	'ZA');
INSERT INTO @tbl VALUES ('Quetzaltenango'            ,	     'Zunil',	'QZ',	'ZU');
INSERT INTO @tbl VALUES ('Suchitepequez'            ,	     'Zunilito',	'SU',	'ZU');

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

