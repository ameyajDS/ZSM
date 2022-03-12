
/* ==================================================================================
    	Source File		:	setup_argentina_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Argentina are set-up
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
WHERE	country_nm	=	'Argentina';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Argentina not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Department',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Adolfo Alsina',	'BA',	'AA');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'Adolfo Alsina',	'RN',	'AA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Adolfo Gonzales Chaves',	'BA',	'AC');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Aguirre',	'SE',	'AG');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Albardon',	'SJ',	'AL');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Alberdi',	'SE',	'AL');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Alberti',	'BA',	'AL');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Almirante Brown',	'BA',	'AB');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Almirante Brown',	'CC',	'AB');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Alumine',	'NQ',	'AL');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Ambato',	'CT',	'AM');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Ancasti',	'CT',	'AC');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Andalgala',	'CT',	'AG');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Anelo',	'NQ',	'AN');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Angaco',	'SJ',	'AN');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Anta',	'SA',	'AN');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Antofagasta de la Sierra',	'CT',	'AS');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Apostoles',	'MN',	'AP');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'Arauco',	'LR',	'AR');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Arrecifes',	'BA',	'BM');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Atamisqui',	'SE',	'AT');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Atreuco',	'LP',	'AT');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Avellaneda',	'BA',	'AV');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'Avellaneda',	'RN',	'AV');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Avellaneda',	'SE',	'AV');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Ayacucho',	'BA',	'AY');
INSERT INTO @tbl VALUES ('San Luis'            ,	     'Ayacucho',	'SL',	'AY');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Azul',	'BA',	'AZ');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Bahia Blanca',	'BA',	'BB');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Balcarce',	'BA',	'BC');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Banda',	'SE',	'BA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Baradero',	'BA',	'BD');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'Bariloche',	'RN',	'BA');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Belen',	'CT',	'BE');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Belgrano',	'SE',	'BE');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'Belgrano',	'SF',	'BE');
INSERT INTO @tbl VALUES ('San Luis'            ,	     'Belgrano',	'SL',	'BE');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Bella Vista',	'CN',	'BV');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Benito Juarez',	'BA',	'BJ');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Berazategui',	'BA',	'BZ');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Berisso',	'BA',	'BS');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Bermejo',	'CC',	'BE');
INSERT INTO @tbl VALUES ('Formosa'            ,	     'Bermejo',	'FM',	'BE');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Beron de Astrada',	'CN',	'BA');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Biedma',	'CH',	'BI');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Bolivar',	'BA',	'BO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Bragado',	'BA',	'BG');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Brandsen',	'BA',	'BR');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Burruyacu',	'TM',	'BU');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Cachi',	'SA',	'CA');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Cafayate',	'SA',	'CF');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Cainguas',	'MN',	'CG');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Calamuchita',	'CB',	'CA');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Caleu Caleu',	'LP',	'CL');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Calingasta',	'SJ',	'CL');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Campana',	'BA',	'CM');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Candelaria',	'MN',	'CD');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Canuelas',	'BA',	'CL');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Capayan',	'CT',	'CA');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Capital (Catamarca)',	'CT',	'CT');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Capital (Cordoba)',	'CB',	'CB');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Capital (Corrientes)',	'CN',	'CN');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'Capital (La Rioja)',	'LR',	'LR');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Capital (Mendoza)',	'MZ',	'MZ');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Capital (Posadas)',	'MN',	'PS');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Capital (Salta)',	'SA',	'SA');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Capital (San Juan)',	'SJ',	'SJ');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Capital (Santa Rosa)',	'LP',	'SR');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Capital (Santiago del Estero)',	'SE',	'SE');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Capital (Tucuman)',	'TM',	'TM');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Capitan Sarmiento',	'BA',	'CS');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Carlos Casares',	'BA',	'CC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Carlos Tejedor',	'BA',	'CT');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Carmen de Areco',	'BA',	'CA');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'Caseros',	'SF',	'CR');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'Castellanos',	'SF',	'CL');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Castelli',	'BA',	'CI');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'Castro Barros',	'LR',	'CB');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Catan Lil',	'NQ',	'CL');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Catrilo',	'LP',	'CA');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Caucete',	'SJ',	'CC');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Cerrillos',	'SA',	'CE');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Chacabuco',	'BA',	'CB');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Chacabuco',	'CC',	'CH');
INSERT INTO @tbl VALUES ('San Luis'            ,	     'Chacabuco',	'SL',	'CH');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Chalileo',	'LP',	'CH');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'Chamical',	'LR',	'CM');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Chapaleufu',	'LP',	'CP');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Chascomus',	'BA',	'CH');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Chical Co',	'LP',	'CC');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Chicligasta',	'TM',	'CH');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Chicoana',	'SA',	'CH');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'Chilecito',	'LR',	'CL');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Chimbas',	'SJ',	'CH');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Chivilcoy',	'BA',	'CV');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Chos Malal',	'NQ',	'CM');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Choya',	'SE',	'CH');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Cochinoca',	'JY',	'CO');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Collon Cura',	'NQ',	'CC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Colon',	'BA',	'CO');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Colon',	'CB',	'CO');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Colon',	'ER',	'CO');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Comandante Fernandez',	'CC',	'CF');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Concepcion',	'CN',	'CO');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Concepcion',	'MN',	'CO');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Concordia',	'ER',	'CC');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'Conesa',	'RN',	'CO');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Confluencia',	'NQ',	'CO');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Conhelo',	'LP',	'CO');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'Constitucion',	'SF',	'CO');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Copo',	'SE',	'CO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Coronel de Marina Leonardo Rosales',	'BA',	'CR');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Coronel Dorrego',	'BA',	'CD');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'Coronel Felipe Varela',	'LR',	'CV');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Coronel Pringles',	'BA',	'CP');
INSERT INTO @tbl VALUES ('San Luis'            ,	     'Coronel Pringles',	'SL',	'CP');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Coronel Suarez',	'BA',	'CE');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Corpen Aike',	'SC',	'CA');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Cruz Alta',	'TM',	'CA');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Cruz del Eje',	'CB',	'CE');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Curaco',	'LP',	'CU');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Curuzu Cuatia',	'CN',	'CC');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Cushamen',	'CH',	'CU');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Daireaux',	'BA',	'DA');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Deseado',	'SC',	'DE');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Diamante',	'ER',	'DI');
INSERT INTO @tbl VALUES ('Ciudad de Buenos Aires'            ,	     'Distrito Federal',	'DF',	'DF');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Doce de Octubre',	'CC',	'DC');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Doctor Manuel Belgrano',	'JY',	'DB');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Dolores',	'BA',	'DO');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Dos de Abril',	'CC',	'DA');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'El Alto',	'CT',	'EA');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'El Carmen',	'JY',	'EC');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'El Cuy',	'RN',	'EC');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Eldorado',	'MN',	'ED');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Empedrado',	'CN',	'EM');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Ensenada',	'BA',	'EN');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Escalante',	'CH',	'ES');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Escobar',	'BA',	'ES');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Esquina',	'CN',	'ES');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Esteban Echeverria',	'BA',	'EB');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Exaltacion de la Cruz',	'BA',	'EC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Ezeiza',	'BA',	'EZ');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Famailla',	'TM',	'FA');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'Famatina',	'LR',	'FA');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Federacion',	'ER',	'FC');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Federal',	'ER',	'FE');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Feliciano',	'ER',	'FL');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Figueroa',	'SE',	'FI');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Florencio Varela',	'BA',	'FC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Florentino Ameghino',	'BA',	'FA');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Florentino Ameghino',	'CH',	'FA');
INSERT INTO @tbl VALUES ('Formosa'            ,	     'Formosa',	'FM',	'FO');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Fray Justo Santa Maria de Oro',	'CC',	'FJ');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Fray Mamerto Esquiu',	'CT',	'FE');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Futaleufu',	'CH',	'FU');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Gaiman',	'CH',	'GM');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'Garay',	'SF',	'GA');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Gastre',	'CH',	'GS');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Alvarado',	'BA',	'GD');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Alvear',	'BA',	'GA');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'General Alvear',	'CN',	'GA');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'General Alvear',	'MZ',	'GA');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'General Angel Vicente Penaloza',	'LR',	'GP');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Arenales',	'BA',	'GE');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Belgrano',	'BA',	'GB');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'General Belgrano',	'CC',	'GB');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'General Belgrano',	'LR',	'GB');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'General Donovan',	'CC',	'GD');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'General Guemes',	'CC',	'GG');
INSERT INTO @tbl VALUES ('Salta'            ,	     'General Guemes',	'SA',	'GG');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Guido',	'BA',	'GG');
INSERT INTO @tbl VALUES ('Salta'            ,	     'General Jose de San Martin',	'SA',	'GM');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'General Juan Facundo Quiroga',	'LR',	'GQ');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Juan Madariaga',	'BA',	'GJ');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General La Madrid',	'BA',	'GM');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'General Lamadrid',	'LR',	'GL');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Las Heras',	'BA',	'GH');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Lavalle',	'BA',	'GL');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'General Lopez',	'SF',	'GL');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'General Manuel Belgrano',	'MN',	'GB');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'General Obligado',	'SF',	'GO');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'General Ocampo',	'LR',	'GO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Paz',	'BA',	'GZ');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'General Paz',	'CN',	'GP');
INSERT INTO @tbl VALUES ('San Luis'            ,	     'General Pedernera',	'SL',	'GP');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Pinto',	'BA',	'GI');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Pueyrredon',	'BA',	'GP');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'General Roca',	'CB',	'GR');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'General Roca',	'RN',	'GR');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Rodriguez',	'BA',	'GR');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General San Martin',	'BA',	'GN');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'General San Martin',	'CB',	'GM');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'General San Martin',	'LR',	'GM');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'General Taboada',	'SE',	'GT');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Viamonte',	'BA',	'GT');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'General Villegas',	'BA',	'GV');
INSERT INTO @tbl VALUES ('San Luis'            ,	     'Gobernador Dupuy',	'SL',	'GD');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Godoy Cruz',	'MZ',	'GC');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Goya',	'CN',	'GO');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Graneros',	'TM',	'GR');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Guachipas',	'SA',	'GU');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Gualeguay',	'ER',	'GG');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Gualeguaychu',	'ER',	'GC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Guamini',	'BA',	'GU');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Guarani',	'MN',	'GU');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Guasayan',	'SE',	'GU');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Guatrache',	'LP',	'GU');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Guaymallen',	'MZ',	'GU');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Guer Aike',	'SC',	'GA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Hipolito Yrigoyen',	'BA',	'HY');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Hucal',	'LP',	'HU');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Huiliches',	'NQ',	'HU');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Humahuaca',	'JY',	'HU');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Hurlingham',	'BA',	'HU');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Iglesia',	'SJ',	'IG');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Iguazu',	'MN',	'IG');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Independencia',	'CC',	'IN');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'Independencia',	'LR',	'IN');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'Iriondo',	'SF',	'IR');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Iruya',	'SA',	'IR');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Ischilin',	'CB',	'IS');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Islas del Ibicuy',	'ER',	'II');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Itati',	'CN',	'IT');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Ituzaingo',	'BA',	'IT');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Ituzaingo',	'CN',	'IZ');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Jachal',	'SJ',	'JA');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Jimenez',	'SE',	'JM');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Jose C. Paz',	'BA',	'JP');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Juan B. Alberdi',	'TM',	'JA');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Juan Felipe Ibarra',	'SE',	'JI');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Juarez Celman',	'CB',	'JC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Junin',	'BA',	'JU');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Junin',	'MZ',	'JU');
INSERT INTO @tbl VALUES ('San Luis'            ,	     'Junin',	'SL',	'JU');
INSERT INTO @tbl VALUES ('Salta'            ,	     'La Caldera',	'SA',	'LC');
INSERT INTO @tbl VALUES ('Salta'            ,	     'La Candelaria',	'SA',	'LD');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'La Capital',	'SF',	'LP');
INSERT INTO @tbl VALUES ('San Luis'            ,	     'La Capital',	'SL',	'LC');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Lacar',	'NQ',	'LA');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'La Cocha',	'TM',	'LC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'La Costa',	'BA',	'LC');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Lago Argentino',	'SC',	'LA');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Lago Buenos Aires',	'SC',	'LB');
INSERT INTO @tbl VALUES ('Formosa'            ,	     'Laishi',	'FM',	'LA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'La Matanza',	'BA',	'LM');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Languineo',	'CH',	'LA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Lanus',	'BA',	'LS');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'La Paz',	'CT',	'LP');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'La Paz',	'ER',	'LP');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'La Paz',	'MZ',	'LP');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'La Plata',	'BA',	'LT');
INSERT INTO @tbl VALUES ('Salta'            ,	     'La Poma',	'SA',	'LP');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Laprida',	'BA',	'LR');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'Las Colonias',	'SF',	'LC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Las Flores',	'BA',	'LF');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Las Heras',	'MZ',	'LH');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Lavalle',	'CN',	'LA');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Lavalle',	'MZ',	'LA');
INSERT INTO @tbl VALUES ('Salta'            ,	     'La Vina',	'SA',	'LV');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Leales',	'TM',	'LE');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Leandro N. Alem',	'BA',	'LA');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Leandro N. Alem',	'MN',	'LA');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Ledesma',	'JY',	'LE');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Libertad',	'CC',	'LI');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Libertador General San Martin',	'CC',	'LM');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Libertador General San Martin',	'MN',	'LM');
INSERT INTO @tbl VALUES ('San Luis'            ,	     'Libertador General San Martin',	'SL',	'LM');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Lihuel Calel',	'LP',	'UC');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Limay Mahuida',	'LP',	'LM');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Lincoln',	'BA',	'LI');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Loberia',	'BA',	'LO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Lobos',	'BA',	'LB');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Lomas de Zamora',	'BA',	'LZ');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Loncopue',	'NQ',	'LO');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Loreto',	'SE',	'LO');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Los Andes',	'SA',	'LA');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Los Lagos',	'NQ',	'LL');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Loventue',	'LP',	'LO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Lujan',	'BA',	'LU');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Lujan de Cuyo',	'MZ',	'LC');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Lules',	'TM',	'LU');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Magallanes',	'SC',	'MA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Magdalena',	'BA',	'ML');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Maipu',	'BA',	'MA');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Maipu',	'CC',	'MA');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Maipu',	'MZ',	'MP');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Malargue',	'MZ',	'ML');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Malvinas Argentinas',	'BA',	'MV');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Maraco',	'LP',	'MA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Mar Chiquita',	'BA',	'MC');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Marcos Juarez',	'CB',	'MJ');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Marcos Paz',	'BA',	'MP');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Martires',	'CH',	'MA');
INSERT INTO @tbl VALUES ('Formosa'            ,	     'Matacos',	'FM',	'MA');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Mayor Luis J. Fontana',	'CC',	'MF');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Mburucuya',	'CN',	'MB');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Mercedes',	'BA',	'MD');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Mercedes',	'CN',	'ME');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Merlo',	'BA',	'ME');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Metan',	'SA',	'ME');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Minas',	'CB',	'MI');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Minas',	'NQ',	'MI');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Mitre',	'SE',	'MI');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Molinos',	'SA',	'MO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Monte',	'BA',	'MT');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Montecarlo',	'MN',	'MO');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Monte Caseros',	'CN',	'MC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Monte Hermoso',	'BA',	'MH');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Monteros',	'TM',	'MO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Moreno',	'BA',	'MR');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Moreno',	'SE',	'MO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Moron',	'BA',	'MN');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Navarro',	'BA',	'NA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Necochea',	'BA',	'NE');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Nogoya',	'ER',	'NO');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Norquin',	'NQ',	'NO');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'Norquinco',	'RN',	'NO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Nueve de Julio',	'BA',	'NJ');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Nueve de Julio',	'CC',	'NJ');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'Nueve de julio',	'RN',	'NJ');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'Nueve de Julio',	'SF',	'NJ');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Nueve de Julio',	'SJ',	'NU');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Obera',	'MN',	'OB');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'O''Higgins',	'CC',	'OH');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Ojo de Agua',	'SE',	'OJ');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Olavarria',	'BA',	'OL');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Oran',	'SA',	'OR');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Paclin',	'CT',	'PA');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Palpala',	'JY',	'PA');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Parana',	'ER',	'PA');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Paso de Indios',	'CH',	'PI');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Paso de los Libres',	'CN',	'PL');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Patagones',	'BA',	'PA');
INSERT INTO @tbl VALUES ('Formosa'            ,	     'Patino',	'FM',	'PA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Pehuajo',	'BA',	'PJ');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Pehuenches',	'NQ',	'PE');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Pellegrini',	'BA',	'PE');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Pellegrini',	'SE',	'PE');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Pergamino',	'BA',	'PG');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'Pichi Mahuida',	'RN',	'PM');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Picunches',	'NQ',	'PI');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Picun Leufu',	'NQ',	'PL');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Pila',	'BA',	'PL');
INSERT INTO @tbl VALUES ('Formosa'            ,	     'Pilagas',	'FM',	'PG');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Pilar',	'BA',	'PX');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'Pilcaniyeu',	'RN',	'PI');
INSERT INTO @tbl VALUES ('Formosa'            ,	     'Pilcomayo',	'FM',	'PM');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Pinamar',	'BA',	'PI');
INSERT INTO @tbl VALUES ('Formosa'            ,	     'Pirane',	'FM',	'PR');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Pocho',	'CB',	'PO');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Pocito',	'SJ',	'PO');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Poman',	'CT',	'PO');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Presidencia de la Plaza',	'CC',	'PP');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Presidente Peron',	'BA',	'PP');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Presidente Roque Saenz Pena',	'CB',	'PP');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Primero de Mayo',	'CC',	'PM');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Puan',	'BA',	'PU');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Puelen',	'LP',	'PU');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Punilla',	'CB',	'PU');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Punta Indio',	'BA',	'PT');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Quebrachos',	'SE',	'QU');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Quemu Quemu',	'LP',	'QQ');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Quilmes',	'BA',	'QU');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Quitilipi',	'CC',	'QU');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Ramallo',	'BA',	'RM');
INSERT INTO @tbl VALUES ('Formosa'            ,	     'Ramon Lista',	'FM',	'RL');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Rancul',	'LP',	'RA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Rauch',	'BA',	'RU');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Rawson',	'CH',	'RA');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Rawson',	'SJ',	'RA');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Realico',	'LP',	'RE');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Rinconada',	'JY',	'RI');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Rio Chico',	'SC',	'RC');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Rio Chico',	'TM',	'RC');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Rio Cuarto',	'CB',	'RC');
INSERT INTO @tbl VALUES ('Tierra del Fuego'            ,	     'Rio Grande',	'TF',	'RG');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Rio Hondo',	'SE',	'RH');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Rio Primero',	'CB',	'RP');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Rio Seco',	'CB',	'RS');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Rio Segundo',	'CB',	'RG');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Rio Senguer',	'CH',	'RS');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Rivadavia',	'BA',	'RI');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Rivadavia',	'MZ',	'RI');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Rivadavia',	'SA',	'RI');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Rivadavia',	'SE',	'RI');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Rivadavia',	'SJ',	'RI');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Robles',	'SE',	'RO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Rojas',	'BA',	'RO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Roque Perez',	'BA',	'RP');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'Rosario',	'SF',	'RO');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Rosario de la Frontera',	'SA',	'RF');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Rosario de Lerma',	'SA',	'RL');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'Rosario Vera Penaloza',	'LR',	'RP');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Saavedra',	'BA',	'SD');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Saladas',	'CN',	'SL');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Saladillo',	'BA',	'SL');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Salavina',	'SE',	'SV');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Salliquelo',	'BA',	'SQ');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Salto',	'BA',	'ST');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'Sanagasta',	'LR',	'SA');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'San Alberto',	'CB',	'SA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'San Andres de Giles',	'BA',	'SG');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'San Antonio',	'JY',	'SA');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'San Antonio',	'RN',	'SA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'San Antonio de Areco',	'BA',	'SA');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'San Blas de los Sauces',	'LR',	'SS');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'San Carlos',	'MZ',	'SC');
INSERT INTO @tbl VALUES ('Salta'            ,	     'San Carlos',	'SA',	'SC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'San Cayetano',	'BA',	'SC');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'San Cosme',	'CN',	'SC');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'San Cristobal',	'SF',	'SC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'San Fernando',	'BA',	'SF');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'San Fernando',	'CC',	'SF');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'San Ignacio',	'MN',	'SI');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'San Isidro',	'BA',	'SI');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'San Javier',	'CB',	'SV');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'San Javier',	'MN',	'SJ');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'San Javier',	'SF',	'SV');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'San Jeronimo',	'SF',	'SR');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'San Justo',	'CB',	'SJ');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'San Justo',	'SF',	'SJ');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'San Lorenzo',	'CC',	'SL');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'San Lorenzo',	'SF',	'SL');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'San Luis del Palmar',	'CN',	'SP');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'San Martin',	'CN',	'SM');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'San Martin',	'MZ',	'SM');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'San Martin',	'SE',	'SM');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'San Martin',	'SF',	'SM');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'San Martin',	'SJ',	'SM');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'San Miguel',	'BA',	'SM');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'San Miguel',	'CN',	'SG');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'San Nicolas',	'BA',	'SN');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'San Pedro',	'BA',	'SP');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'San Pedro',	'JY',	'SP');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'San Pedro',	'MN',	'SP');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'San Rafael',	'MZ',	'SR');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'San Roque',	'CN',	'SR');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'San Salvador',	'ER',	'SS');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Santa Barbara',	'JY',	'SB');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Santa Catalina',	'JY',	'SC');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Santa Lucia',	'SJ',	'SL');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Santa Maria',	'CB',	'SM');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Santa Maria',	'CT',	'SM');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Santa Rosa',	'CT',	'SR');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Santa Rosa',	'MZ',	'ST');
INSERT INTO @tbl VALUES ('Salta'            ,	     'Santa Victoria',	'SA',	'SV');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Santo Tome',	'CN',	'ST');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'San Vicente',	'BA',	'SE');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Sargento Cabral',	'CC',	'SC');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Sarmiento',	'CH',	'SA');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Sarmiento',	'SE',	'SR');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Sarmiento',	'SJ',	'SA');
INSERT INTO @tbl VALUES ('Corrientes'            ,	     'Sauce',	'CN',	'SA');
INSERT INTO @tbl VALUES ('Santiago del Estero'            ,	     'Silipica',	'SE',	'SI');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Simoca',	'TM',	'SI');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Sobremonte',	'CB',	'SO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Suipacha',	'BA',	'SU');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Susques',	'JY',	'SU');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Tafi del Valle',	'TM',	'TD');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Tafi Viejo',	'TM',	'TV');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Tala',	'ER',	'TA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Tandil',	'BA',	'TD');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Tapalque',	'BA',	'TP');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Tapenaga',	'CC',	'TA');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Tehuelches',	'CH',	'TH');
INSERT INTO @tbl VALUES ('Chubut'            ,	     'Telsen',	'CH',	'TN');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Tercero Arriba',	'CB',	'TA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Tigre',	'BA',	'TI');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Tilcara',	'JY',	'TI');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Tinogasta',	'CT',	'TI');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Toay',	'LP',	'TO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Tordillo',	'BA',	'TO');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Tornquist',	'BA',	'TQ');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Totoral',	'CB',	'TO');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Trancas',	'TM',	'TR');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Trenel',	'LP',	'TR');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Trenque Lauquen',	'BA',	'TR');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Tres Arroyos',	'BA',	'TA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Tres de Febrero',	'BA',	'TF');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Tres Lomas',	'BA',	'TL');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Tulumba',	'CB',	'TU');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Tumbaya',	'JY',	'TU');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Tunuyan',	'MZ',	'TN');
INSERT INTO @tbl VALUES ('Mendoza'            ,	     'Tupungato',	'MZ',	'TP');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Ullum',	'SJ',	'UL');
INSERT INTO @tbl VALUES ('Cordoba'            ,	     'Union',	'CB',	'UN');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Uruguay',	'ER',	'UR');
INSERT INTO @tbl VALUES ('Tierra del Fuego'            ,	     'Ushuaia',	'TF',	'US');
INSERT INTO @tbl VALUES ('La Pampa'            ,	     'Utracan',	'LP',	'UT');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'Valcheta',	'RN',	'VA');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Valle Fertil',	'SJ',	'VF');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Valle Grande',	'JY',	'VG');
INSERT INTO @tbl VALUES ('Catamarca'            ,	     'Valle Viejo',	'CT',	'VV');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Veinticinco de Mayo',	'BA',	'VM');
INSERT INTO @tbl VALUES ('Chaco'            ,	     'Veinticinco de Mayo',	'CC',	'VM');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Veinticinco de Mayo',	'MN',	'VM');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'Veinticinco de Mayo',	'RN',	'VM');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Veinticinco de Mayo',	'SJ',	'VM');
INSERT INTO @tbl VALUES ('Santa Fe'            ,	     'Vera',	'SF',	'VE');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Vicente Lopez',	'BA',	'VL');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Victoria',	'ER',	'VC');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Villa Gesell',	'BA',	'VG');
INSERT INTO @tbl VALUES ('Entre Rios'            ,	     'Villaguay',	'ER',	'VG');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Villarino',	'BA',	'VI');
INSERT INTO @tbl VALUES ('La Rioja'            ,	     'Vinchina',	'LR',	'VI');
INSERT INTO @tbl VALUES ('Jujuy'            ,	     'Yavi',	'JY',	'YA');
INSERT INTO @tbl VALUES ('Tucuman'            ,	     'Yerba Buena',	'TM',	'YB');
INSERT INTO @tbl VALUES ('Neuquen'            ,	     'Zapala',	'NQ',	'ZA');
INSERT INTO @tbl VALUES ('Buenos Aires'            ,	     'Zarate',	'BA',	'ZA');
INSERT INTO @tbl VALUES ('San Juan'            ,	     'Zonda',	'SJ',	'ZO');

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

