
/* ==================================================================================
    	Source File		:	setup_el_salvador_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of El_Salvador are set-up
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
WHERE	country_nm	=	'El Salvador';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country El Salvador not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Department',
		level_2_address_component	=	'Municipio',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Acajutla',	'SO',	'AC');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Agua Caliente',	'CH',	'AC');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Aguilares',	'SS',	'AG');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'Ahuachapan',	'AH',	'AH');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Alegria',	'US',	'AL');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Anamoros',	'UN',	'AN');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Antiguo Cuscatlan',	'LI',	'AC');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'Apaneca',	'AH',	'AP');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'Apastepeque',	'SV',	'AP');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Apopa',	'SS',	'AP');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Arambala',	'MO',	'AR');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Arcatao',	'CH',	'AR');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Armenia',	'SO',	'AR');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'Atiquizaya',	'AH',	'AT');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Ayutuxtepeque',	'SS',	'AY');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Azacualpa',	'CH',	'AZ');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Berlin',	'US',	'BE');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Bolivar',	'UN',	'BO');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Cacaopera',	'MO',	'CA');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'California',	'US',	'CA');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Caluco',	'SO',	'CA');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'Candelaria',	'CU',	'CA');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'Candelaria de la Frontera',	'SA',	'CF');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Carolina',	'SM',	'CA');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Chalatenango',	'CH',	'CH');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'Chalchuapa',	'SA',	'CH');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Chapeltique',	'SM',	'CP');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Chilanga',	'MO',	'CH');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Chiltiupan',	'LI',	'CH');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Chinameca',	'SM',	'CM');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Chirilagua',	'SM',	'CR');
INSERT INTO @tbl VALUES ('Cabanas'            ,	     'Cinquera',	'CA',	'CI');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Citala',	'CH',	'CI');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Ciudad Arce',	'LI',	'CA');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Ciudad Barrios',	'SM',	'CB');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'Coatepeque',	'SA',	'CO');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'Cojutepeque',	'CU',	'CO');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Colon',	'LI',	'CL');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Comacaran',	'SM',	'CO');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Comalapa',	'CH',	'CO');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Comasagua',	'LI',	'CM');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Concepcion Batres',	'US',	'CB');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'Concepcion de Ataco',	'AH',	'CA');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Concepcion de Oriente',	'UN',	'CO');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Concepcion Quezaltepeque',	'CH',	'CQ');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Conchagua',	'UN',	'CG');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Corinto',	'MO',	'CO');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Cuisnahuat',	'SO',	'CU');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Cuscatancingo',	'SS',	'CU');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Cuyultitan',	'PA',	'CU');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Delgado',	'SS',	'DE');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Delicias de Concepcion',	'MO',	'DC');
INSERT INTO @tbl VALUES ('Cabanas'            ,	     'Dolores',	'CA',	'DO');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Dulce Nombre de Maria',	'CH',	'DN');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'El Carmen',	'CU',	'EC');
INSERT INTO @tbl VALUES ('La Union'            ,	     'El Carmen',	'UN',	'EC');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'El Carrizal',	'CH',	'EC');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'El Congo',	'SA',	'EC');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'El Divisadero',	'MO',	'ED');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'El Paisnal',	'SS',	'EL');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'El Paraiso',	'CH',	'EP');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'El Porvenir',	'SA',	'EL');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'El Refugio',	'AH',	'ER');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'El Rosario',	'CU',	'ER');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'El Rosario',	'MO',	'ER');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'El Rosario',	'PA',	'EL');
INSERT INTO @tbl VALUES ('La Union'            ,	     'El Sauce',	'UN',	'ES');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'El Transito',	'SM',	'ET');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'El Triunfo',	'US',	'ET');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Ereguayquin',	'US',	'ER');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Estanzuelas',	'US',	'ES');
INSERT INTO @tbl VALUES ('Cabanas'            ,	     'Guacotecti',	'CA',	'GU');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'Guadalupe',	'SV',	'GU');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Gualococti',	'MO',	'GL');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Guatajiagua',	'MO',	'GT');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'Guaymango',	'AH',	'GU');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Guazapa',	'SS',	'GU');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Huizucar',	'LI',	'HU');
INSERT INTO @tbl VALUES ('Cabanas'            ,	     'Ilobasco',	'CA',	'IL');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Ilopango',	'SS',	'IL');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Intipuca',	'UN',	'IN');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Izalco',	'SO',	'IZ');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Jayaque',	'LI',	'JA');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Jerusalen',	'PA',	'JE');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Jicalapa',	'LI',	'JI');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Jiquilisco',	'US',	'JI');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Joateca',	'MO',	'JT');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Jocoaitique',	'MO',	'JQ');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Jocoro',	'MO',	'JR');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Juayua',	'SO',	'JU');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Jucuapa',	'US',	'JP');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Jucuaran',	'US',	'JR');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'Jujutla',	'AH',	'JU');
INSERT INTO @tbl VALUES ('Cabanas'            ,	     'Jutiapa',	'CA',	'JU');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'La Laguna',	'CH',	'LL');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'La Libertad',	'LI',	'LL');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'La Palma',	'CH',	'LP');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'La Reina',	'CH',	'LR');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Las Vueltas',	'CH',	'LV');
INSERT INTO @tbl VALUES ('La Union'            ,	     'La Union',	'UN',	'LU');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Lislique',	'UN',	'LI');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Lolotique',	'SM',	'LO');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Lolotiquillo',	'MO',	'LO');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'Masahuat',	'SA',	'MA');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Meanguera',	'MO',	'ME');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Meanguera del Golfo',	'UN',	'MG');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Mejicanos',	'SS',	'ME');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Mercedes La Ceiba',	'PA',	'MC');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Mercedes Umana',	'US',	'MU');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'Metapan',	'SA',	'ME');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Moncagua',	'SM',	'MO');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'Monte San Juan',	'CU',	'MS');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Nahuizalco',	'SO',	'NZ');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Nahulingo',	'SO',	'NL');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Nejapa',	'SS',	'NE');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Nombre de Jesus',	'CH',	'NJ');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Nueva Concepcion',	'CH',	'NC');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Nueva Esparta',	'UN',	'NE');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Nueva Granada',	'US',	'NG');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Nueva Guadalupe',	'SM',	'NG');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Nueva San Salvador',	'LI',	'NS');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Nueva Trinidad',	'CH',	'NT');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Nuevo Cuscatlan',	'LI',	'NC');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Nuevo Eden de San Juan',	'SM',	'NE');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Ojos de Agua',	'CH',	'OA');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Olocuilta',	'PA',	'OL');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Opico',	'LI',	'OP');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'Oratorio de Concepcion',	'CU',	'OC');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Osicala',	'MO',	'OS');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Ozatlan',	'US',	'OZ');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Panchimalco',	'SS',	'PA');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Paraiso de Osorio',	'PA',	'PO');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Pasaquina',	'UN',	'PA');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Perquin',	'MO',	'PE');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Poloros',	'UN',	'PO');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Potonico',	'CH',	'PO');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Puerto El Triunfo',	'US',	'PT');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Quelepa',	'SM',	'QU');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Quezaltepeque',	'LI',	'QU');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Rosario de Mora',	'SS',	'RM');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Sacacoyo',	'LI',	'SA');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Salcoatitan',	'SO',	'SL');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'San Agustin',	'US',	'SA');
INSERT INTO @tbl VALUES ('La Union'            ,	     'San Alejo',	'UN',	'SA');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'San Antonio',	'SM',	'SA');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Antonio de la Cruz',	'CH',	'SA');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'San Antonio del Monte',	'SO',	'SA');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Antonio Los Ranchos',	'CH',	'SO');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Antonio Masahuat',	'PA',	'SA');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'San Antonio Pajonal',	'SA',	'SP');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'San Bartolome Perulapia',	'CU',	'SB');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'San Buenaventura',	'US',	'SB');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'San Carlos',	'MO',	'SC');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'San Cayetano Istepeque',	'SV',	'SY');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'San Cristobal',	'CU',	'SC');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'San Dionisio',	'US',	'SD');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Emigdio',	'PA',	'SE');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'San Esteban Catarina',	'SV',	'SE');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Fernando',	'CH',	'SD');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'San Fernando',	'MO',	'SF');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Francisco Chinameca',	'PA',	'SF');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'San Francisco Gotera',	'MO',	'SG');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'San Francisco Javier',	'US',	'SF');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Francisco Lempa',	'CH',	'SF');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'San Francisco Menendez',	'AH',	'SF');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Francisco Morazan',	'CH',	'SZ');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'San Gerardo',	'SM',	'SG');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Ignacio',	'CH',	'SI');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'San Ildefonso',	'SV',	'SI');
INSERT INTO @tbl VALUES ('Cabanas'            ,	     'San Isidro',	'CA',	'SI');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'San Isidro',	'MO',	'SI');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Isidro Labrador',	'CH',	'SB');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'San Jorge',	'SM',	'SJ');
INSERT INTO @tbl VALUES ('La Union'            ,	     'San Jose',	'UN',	'SJ');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Jose Cancasque',	'CH',	'SC');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'San Jose Guayabal',	'CU',	'SJ');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Jose Las Flores',	'CH',	'SJ');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'San Jose Villanueva',	'LI',	'SJ');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Juan Nonualco',	'PA',	'SN');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Juan Talpa',	'PA',	'SU');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Juan Tepezontes',	'PA',	'SJ');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'San Julian',	'SO',	'SJ');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'San Lorenzo',	'AH',	'SL');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'San Lorenzo',	'SV',	'SL');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'San Luis de la Reina',	'SM',	'SL');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Luis del Carmen',	'CH',	'SL');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Luis La Herradura',	'PA',	'SH');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Luis Talpa',	'PA',	'SL');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'San Marcos',	'SS',	'SM');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'San Martin',	'SS',	'SN');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'San Matias',	'LI',	'SM');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'San Miguel',	'SM',	'SM');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Miguel de Mercedes',	'CH',	'SM');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Miguel Tepezontes',	'PA',	'SZ');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'San Pablo Tacachico',	'LI',	'SP');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Pedro Masahuat',	'PA',	'SM');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Pedro Nonualco',	'PA',	'SP');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'San Pedro Perulapan',	'CU',	'SP');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'San Pedro Puxtla',	'AH',	'SP');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'San Rafael',	'CH',	'SR');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'San Rafael',	'SM',	'SR');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'San Rafael Cedros',	'CU',	'SF');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'San Rafael Obrajuelo',	'PA',	'SR');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'San Ramon',	'CU',	'SR');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'San Salvador',	'SS',	'SS');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'San Sebastian',	'SV',	'SS');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'San Sebastian Salitrillo',	'SA',	'SS');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'San Simon',	'MO',	'SS');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'Santa Ana',	'SA',	'SA');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Santa Catarina Masahuat',	'SO',	'SC');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'Santa Clara',	'SV',	'SC');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'Santa Cruz Analquito',	'CU',	'SA');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'Santa Cruz Michapa',	'CU',	'SM');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Santa Elena',	'US',	'SE');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Santa Isabel Ishuatan',	'SO',	'SI');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Santa Maria',	'US',	'SM');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Santa Maria Ostuma',	'PA',	'SO');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Santa Rita',	'CH',	'ST');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Santa Rosa de Lima',	'UN',	'SR');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'Santa Rosa Guachipilin',	'SA',	'SR');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'Santiago de la Frontera',	'SA',	'SF');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Santiago de Maria',	'US',	'SG');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Santiago Nonualco',	'PA',	'ST');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Santiago Texacuangos',	'SS',	'SG');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Santo Domingo',	'SO',	'SD');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'Santo Domingo',	'SV',	'SD');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Santo Tomas',	'SS',	'ST');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'San Vicente',	'SV',	'SV');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Sensembra',	'MO',	'SE');
INSERT INTO @tbl VALUES ('Cabanas'            ,	     'Sensuntepeque',	'CA',	'SE');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Sesori',	'SM',	'SE');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Sociedad',	'MO',	'SO');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Sonsonate',	'SO',	'SO');
INSERT INTO @tbl VALUES ('Sonsonate'            ,	     'Sonzacate',	'SO',	'SZ');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Soyapango',	'SS',	'SO');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'Suchitoto',	'CU',	'SU');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'Tacuba',	'AH',	'TA');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Talnique',	'LI',	'TL');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Tamanique',	'LI',	'TM');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Tapalhuaca',	'PA',	'TA');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Tecapan',	'US',	'TE');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'Tecoluca',	'SV',	'TC');
INSERT INTO @tbl VALUES ('Cabanas'            ,	     'Tejutepeque',	'CA',	'TE');
INSERT INTO @tbl VALUES ('Chalatenango'            ,	     'Tejutla',	'CH',	'TE');
INSERT INTO @tbl VALUES ('Cuscatlan'            ,	     'Tenancingo',	'CU',	'TE');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Teotepeque',	'LI',	'TT');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Tepecoyo',	'LI',	'TP');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'Tepetitan',	'SV',	'TP');
INSERT INTO @tbl VALUES ('Santa Ana'            ,	     'Texistepeque',	'SA',	'TE');
INSERT INTO @tbl VALUES ('San Salvador'            ,	     'Tonacatepeque',	'SS',	'TO');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Torola',	'MO',	'TO');
INSERT INTO @tbl VALUES ('Ahuachapan'            ,	     'Turin',	'AH',	'TU');
INSERT INTO @tbl VALUES ('San Miguel'            ,	     'Uluazapa',	'SM',	'UL');
INSERT INTO @tbl VALUES ('Usulutan'            ,	     'Usulutan',	'US',	'US');
INSERT INTO @tbl VALUES ('San Vicente'            ,	     'Verapaz',	'SV',	'VE');
INSERT INTO @tbl VALUES ('Cabanas'            ,	     'Victoria',	'CA',	'VI');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Yamabal',	'MO',	'YA');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Yayantique',	'UN',	'YA');
INSERT INTO @tbl VALUES ('Morazan'            ,	     'Yoloaiquin',	'MO',	'YO');
INSERT INTO @tbl VALUES ('La Union'            ,	     'Yucuaiquin',	'UN',	'YU');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Zacatecoluca',	'PA',	'ZA');
INSERT INTO @tbl VALUES ('La Libertad'            ,	     'Zaragoza',	'LI',	'ZA');

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

