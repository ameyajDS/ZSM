
/* ==================================================================================
    	Source File		:	setup_cuba_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Cuba are set-up
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
WHERE	country_nm	=	'Cuba';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Cuba not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Cienfuegos'            ,	     'Abreus',	'CF',	'AB');
INSERT INTO @tbl VALUES ('Cienfuegos'            ,	     'Aguada de Pasajeros',	'CF',	'AP');
INSERT INTO @tbl VALUES ('Artemisa'            ,	     'Alquizar',	'AR',	'AL');
INSERT INTO @tbl VALUES ('Las Tunas'            ,	     'Amancio',	'LT',	'AM');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Antilla',	'HO',	'AN');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'Arroyo Naranjo',	'CH',	'AN');
INSERT INTO @tbl VALUES ('Artemisa'            ,	     'Artemisa',	'AR',	'AR');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Baguanos',	'HO',	'BG');
INSERT INTO @tbl VALUES ('Artemisa'            ,	     'Bahia Honda',	'AR',	'BH');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Banes',	'HO',	'BN');
INSERT INTO @tbl VALUES ('Guantanamo'            ,	     'Baracoa',	'GU',	'BA');
INSERT INTO @tbl VALUES ('Ciego de Avila'            ,	     'Baragua',	'CA',	'BA');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Bartolome Maso',	'GR',	'BM');
INSERT INTO @tbl VALUES ('Mayabeque'            ,	     'Batabano',	'MQ',	'BB');
INSERT INTO @tbl VALUES ('Artemisa'            ,	     'Bauta',	'AR',	'BU');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Bayamo',	'GR',	'BY');
INSERT INTO @tbl VALUES ('Mayabeque'            ,	     'Bejucal',	'MQ',	'BE');
INSERT INTO @tbl VALUES ('Ciego de Avila'            ,	     'Bolivia',	'CA',	'BO');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'Boyeros',	'CH',	'BO');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Buey Arriba',	'GR',	'BA');
INSERT INTO @tbl VALUES ('Sancti Spiritus'            ,	     'Cabaiguan',	'SS',	'CA');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Cacocum',	'HO',	'CA');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Caibarien',	'VC',	'CB');
INSERT INTO @tbl VALUES ('Guantanamo'            ,	     'Caimanera',	'GU',	'CA');
INSERT INTO @tbl VALUES ('Artemisa'            ,	     'Caimito',	'AR',	'CM');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Calimete',	'MA',	'CM');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Calixto Garcia',	'HO',	'CG');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Camaguey',	'CM',	'CA');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Camajuani',	'VC',	'CM');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Campechuela',	'GR',	'CA');
INSERT INTO @tbl VALUES ('Artemisa'            ,	     'Candelaria',	'AR',	'CA');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Cardenas',	'MA',	'CR');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Carlos Manuel de Cespedes',	'CM',	'CC');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Cauto Cristo',	'GR',	'CC');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'Centro Habana',	'CH',	'CH');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'Cerro',	'CH',	'CE');
INSERT INTO @tbl VALUES ('Ciego de Avila'            ,	     'Chambas',	'CA',	'CH');
INSERT INTO @tbl VALUES ('Ciego de Avila'            ,	     'Ciego de Avila',	'CA',	'CA');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Cienaga de Zapata',	'MA',	'CZ');
INSERT INTO @tbl VALUES ('Cienfuegos'            ,	     'Cienfuegos',	'CF',	'CI');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Cifuentes',	'VC',	'CI');
INSERT INTO @tbl VALUES ('Ciego de Avila'            ,	     'Ciro Redondo',	'CA',	'CR');
INSERT INTO @tbl VALUES ('Las Tunas'            ,	     'Colombia',	'LT',	'CO');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Colon',	'MA',	'CO');
INSERT INTO @tbl VALUES ('Pinar del Rio'            ,	     'Consolacion del Sur',	'PD',	'CS');
INSERT INTO @tbl VALUES ('Santiago de Cuba'            ,	     'Contramaestre',	'SC',	'CO');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Corralillo',	'VC',	'CO');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'Cotorro',	'CH',	'CO');
INSERT INTO @tbl VALUES ('Cienfuegos'            ,	     'Cruces',	'CF',	'CR');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Cueto',	'HO',	'CU');
INSERT INTO @tbl VALUES ('Cienfuegos'            ,	     'Cumanayagua',	'CF',	'CU');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'Diez de Octubre',	'CH',	'DO');
INSERT INTO @tbl VALUES ('Guantanamo'            ,	     'El Salvador',	'GU',	'ES');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Encrucijada',	'VC',	'EN');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Esmeralda',	'CM',	'ES');
INSERT INTO @tbl VALUES ('Ciego de Avila'            ,	     'Florencia',	'CA',	'FL');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Florida',	'CM',	'FL');
INSERT INTO @tbl VALUES ('Sancti Spiritus'            ,	     'Fomento',	'SS',	'FO');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Frank Pais',	'HO',	'FP');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Gibara',	'HO',	'GI');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Guaimaro',	'CM',	'GU');
INSERT INTO @tbl VALUES ('Santiago de Cuba'            ,	     'Guama',	'SC',	'GU');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'Guanabacoa',	'CH',	'GU');
INSERT INTO @tbl VALUES ('Artemisa'            ,	     'Guanajay',	'AR',	'GJ');
INSERT INTO @tbl VALUES ('Pinar del Rio'            ,	     'Guane',	'PD',	'GU');
INSERT INTO @tbl VALUES ('Guantanamo'            ,	     'Guantanamo',	'GU',	'GU');
INSERT INTO @tbl VALUES ('Mayabeque'            ,	     'Guines',	'MQ',	'GS');
INSERT INTO @tbl VALUES ('Artemisa'            ,	     'Guira de Melena',	'AR',	'GM');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Guisa',	'GR',	'GU');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Holguin',	'HO',	'HO');
INSERT INTO @tbl VALUES ('Guantanamo'            ,	     'Imias',	'GU',	'IM');
INSERT INTO @tbl VALUES ('Isla de la Juventud'            ,	     'Isla de la Juventud',	'IJ',	'IJ');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Jaguey Grande',	'MA',	'JG');
INSERT INTO @tbl VALUES ('Mayabeque'            ,	     'Jaruco',	'MQ',	'JA');
INSERT INTO @tbl VALUES ('Sancti Spiritus'            ,	     'Jatibonico',	'SS',	'JA');
INSERT INTO @tbl VALUES ('Las Tunas'            ,	     'Jesus Menendez',	'LT',	'JM');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Jiguani',	'GR',	'JI');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Jimaguayu',	'CM',	'JI');
INSERT INTO @tbl VALUES ('Las Tunas'            ,	     'Jobabo',	'LT',	'JO');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Jovellanos',	'MA',	'JO');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'La Habana del Este',	'CH',	'HE');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'La Habana Vieja',	'CH',	'HV');
INSERT INTO @tbl VALUES ('Cienfuegos'            ,	     'Lajas',	'CF',	'LA');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'La Lisa',	'CH',	'LL');
INSERT INTO @tbl VALUES ('Pinar del Rio'            ,	     'La Palma',	'PD',	'LA');
INSERT INTO @tbl VALUES ('Sancti Spiritus'            ,	     'La Sierpe',	'SS',	'LS');
INSERT INTO @tbl VALUES ('Las Tunas'            ,	     'Las Tunas',	'LT',	'LT');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Limonar',	'MA',	'LI');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Los Arabos',	'MA',	'LA');
INSERT INTO @tbl VALUES ('Pinar del Rio'            ,	     'Los Palacios',	'PD',	'LS');
INSERT INTO @tbl VALUES ('Mayabeque'            ,	     'Madruga',	'MQ',	'MD');
INSERT INTO @tbl VALUES ('Guantanamo'            ,	     'Maisi',	'GU',	'MA');
INSERT INTO @tbl VALUES ('Ciego de Avila'            ,	     'Majagua',	'CA',	'MA');
INSERT INTO @tbl VALUES ('Las Tunas'            ,	     'Majibacoa',	'LT',	'MJ');
INSERT INTO @tbl VALUES ('Las Tunas'            ,	     'Manati',	'LT',	'MN');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Manicaragua',	'VC',	'MA');
INSERT INTO @tbl VALUES ('Pinar del Rio'            ,	     'Mantua',	'PD',	'MA');
INSERT INTO @tbl VALUES ('Guantanamo'            ,	     'Manuel Tames',	'GU',	'MT');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Manzanillo',	'GR',	'MA');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'Marianao',	'CH',	'MA');
INSERT INTO @tbl VALUES ('Artemisa'            ,	     'Mariel',	'AR',	'MR');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Marti',	'MA',	'MR');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Matanzas',	'MA',	'MT');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Mayari',	'HO',	'MA');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Media Luna',	'GR',	'ML');
INSERT INTO @tbl VALUES ('Mayabeque'            ,	     'Melena del Sur',	'MQ',	'MS');
INSERT INTO @tbl VALUES ('Santiago de Cuba'            ,	     'Mella',	'SC',	'ME');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Minas',	'CM',	'MI');
INSERT INTO @tbl VALUES ('Pinar del Rio'            ,	     'Minas de Matahambre',	'PD',	'MM');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Moa',	'HO',	'MO');
INSERT INTO @tbl VALUES ('Ciego de Avila'            ,	     'Moron',	'CA',	'MO');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Najasa',	'CM',	'NA');
INSERT INTO @tbl VALUES ('Guantanamo'            ,	     'Niceto Perez',	'GU',	'NP');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Niquero',	'GR',	'NI');
INSERT INTO @tbl VALUES ('Mayabeque'            ,	     'Nueva Paz',	'MQ',	'NP');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Nuevitas',	'CM',	'NU');
INSERT INTO @tbl VALUES ('Santiago de Cuba'            ,	     'Palma Soriano',	'SC',	'PS');
INSERT INTO @tbl VALUES ('Cienfuegos'            ,	     'Palmira',	'CF',	'PA');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Pedro Betancourt',	'MA',	'PB');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Perico',	'MA',	'PE');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Pilon',	'GR',	'PI');
INSERT INTO @tbl VALUES ('Pinar del Rio'            ,	     'Pinar del Rio',	'PD',	'PR');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Placetas',	'VC',	'PL');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'Playa',	'CH',	'PL');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'Plaza de la Revolucion',	'CH',	'PR');
INSERT INTO @tbl VALUES ('Ciego de Avila'            ,	     'Primero de Enero',	'CA',	'PE');
INSERT INTO @tbl VALUES ('Las Tunas'            ,	     'Puerto Padre',	'LT',	'PP');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Quemado de Guines',	'VC',	'QG');
INSERT INTO @tbl VALUES ('Mayabeque'            ,	     'Quivican',	'MQ',	'QU');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Rafael Freyre',	'HO',	'RF');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Ranchuelo',	'VC',	'RA');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'Regla',	'CH',	'RE');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Remedios',	'VC',	'RE');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Rio Cauto',	'GR',	'RC');
INSERT INTO @tbl VALUES ('Cienfuegos'            ,	     'Rodas',	'CF',	'RO');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Sagua de Tanamo',	'HO',	'ST');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Sagua la Grande',	'VC',	'SG');
INSERT INTO @tbl VALUES ('Artemisa'            ,	     'San Antonio de los Banos',	'AR',	'SA');
INSERT INTO @tbl VALUES ('Guantanamo'            ,	     'San Antonio del Sur',	'GU',	'SA');
INSERT INTO @tbl VALUES ('Artemisa'            ,	     'San Cristobal',	'AR',	'SC');
INSERT INTO @tbl VALUES ('Sancti Spiritus'            ,	     'Sancti Spiritus',	'SS',	'SS');
INSERT INTO @tbl VALUES ('Pinar del Rio'            ,	     'Sandino',	'PD',	'SA');
INSERT INTO @tbl VALUES ('Mayabeque'            ,	     'San Jose de las Lajas',	'MQ',	'SJ');
INSERT INTO @tbl VALUES ('Pinar del Rio'            ,	     'San Juan y Martinez',	'PD',	'SJ');
INSERT INTO @tbl VALUES ('Pinar del Rio'            ,	     'San Luis',	'PD',	'SL');
INSERT INTO @tbl VALUES ('Santiago de Cuba'            ,	     'San Luis',	'SC',	'SL');
INSERT INTO @tbl VALUES ('La Habana'            ,	     'San Miguel del Padron',	'CH',	'SM');
INSERT INTO @tbl VALUES ('Mayabeque'            ,	     'San Nicolas',	'MQ',	'SN');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Santa Clara',	'VC',	'SC');
INSERT INTO @tbl VALUES ('Mayabeque'            ,	     'Santa Cruz del Norte',	'MQ',	'SC');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Santa Cruz del Sur',	'CM',	'SS');
INSERT INTO @tbl VALUES ('Santiago de Cuba'            ,	     'Santiago de Cuba',	'SC',	'SC');
INSERT INTO @tbl VALUES ('Villa Clara'            ,	     'Santo Domingo',	'VC',	'SD');
INSERT INTO @tbl VALUES ('Santiago de Cuba'            ,	     'Segundo Frente',	'SC',	'SF');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Sibanicu',	'CM',	'SI');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Sierra de Cubitas',	'CM',	'SC');
INSERT INTO @tbl VALUES ('Santiago de Cuba'            ,	     'Songo-La Maya',	'SC',	'LM');
INSERT INTO @tbl VALUES ('Sancti Spiritus'            ,	     'Taguasco',	'SS',	'TA');
INSERT INTO @tbl VALUES ('Santiago de Cuba'            ,	     'Tercer Frente',	'SC',	'TF');
INSERT INTO @tbl VALUES ('Sancti Spiritus'            ,	     'Trinidad',	'SS',	'TR');
INSERT INTO @tbl VALUES ('Matanzas'            ,	     'Union de Reyes',	'MA',	'UR');
INSERT INTO @tbl VALUES ('Holguin'            ,	     'Urbano Noris',	'HO',	'UN');
INSERT INTO @tbl VALUES ('Ciego de Avila'            ,	     'Venezuela',	'CA',	'VE');
INSERT INTO @tbl VALUES ('Camaguey'            ,	     'Vertientes',	'CM',	'VE');
INSERT INTO @tbl VALUES ('Pinar del Rio'            ,	     'Vinales',	'PD',	'VI');
INSERT INTO @tbl VALUES ('Sancti Spiritus'            ,	     'Yaguajay',	'SS',	'YA');
INSERT INTO @tbl VALUES ('Granma'            ,	     'Yara',	'GR',	'YA');
INSERT INTO @tbl VALUES ('Guantanamo'            ,	     'Yateras',	'GU',	'YA');

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

