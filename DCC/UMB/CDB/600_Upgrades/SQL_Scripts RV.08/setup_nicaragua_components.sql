
/* ==================================================================================
    	Source File		:	setup_nicaragua_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Nicaragua are set-up
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
WHERE	country_nm	=	'Nicaragua';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Nicaragua not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Leon'            ,	     'Achuapa',	'LE',	'AC');
INSERT INTO @tbl VALUES ('Chontales'            ,	     'Acoyapa',	'CO',	'AC');
INSERT INTO @tbl VALUES ('Rivas'            ,	     'Altagracia',	'RI',	'AL');
INSERT INTO @tbl VALUES ('Rivas'            ,	     'Belen',	'RI',	'BE');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'Bluefields',	'AS',	'BL');
INSERT INTO @tbl VALUES ('Boaco'            ,	     'Boaco',	'BO',	'BO');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Norte'            ,	     'Bonanza',	'AN',	'BO');
INSERT INTO @tbl VALUES ('Rivas'            ,	     'Buenos Aires',	'RI',	'BA');
INSERT INTO @tbl VALUES ('Boaco'            ,	     'Camoapa',	'BO',	'CA');
INSERT INTO @tbl VALUES ('Rivas'            ,	     'Cardenas',	'RI',	'CA');
INSERT INTO @tbl VALUES ('Masaya'            ,	     'Catarina',	'MS',	'CA');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'Chichigalpa',	'CI',	'CC');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'Chinandega',	'CI',	'CN');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'Cinco Pinos',	'CI',	'CP');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'Ciudad Antigua',	'NS',	'CA');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'Ciudad Dario',	'MT',	'CD');
INSERT INTO @tbl VALUES ('Managua'            ,	     'Ciudad Sandino',	'MN',	'CS');
INSERT INTO @tbl VALUES ('Chontales'            ,	     'Comalapa',	'CO',	'CO');
INSERT INTO @tbl VALUES ('Esteli'            ,	     'Condega',	'ES',	'CO');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'Corinto',	'CI',	'CO');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'Corn Island',	'AS',	'CI');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'Desembocadura de Rio Grande',	'AS',	'DR');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'Dipilto',	'NS',	'DI');
INSERT INTO @tbl VALUES ('Granada'            ,	     'Diria',	'GR',	'DA');
INSERT INTO @tbl VALUES ('Carazo'            ,	     'Diriamba',	'CA',	'DI');
INSERT INTO @tbl VALUES ('Granada'            ,	     'Diriomo',	'GR',	'DO');
INSERT INTO @tbl VALUES ('Carazo'            ,	     'Dolores',	'CA',	'DO');
INSERT INTO @tbl VALUES ('Rio San Juan'            ,	     'El Almendro',	'SJ',	'EA');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'El Ayote',	'AS',	'EA');
INSERT INTO @tbl VALUES ('Rio San Juan'            ,	     'El Castillo',	'SJ',	'EC');
INSERT INTO @tbl VALUES ('Chontales'            ,	     'El Coral',	'CO',	'EC');
INSERT INTO @tbl VALUES ('Managua'            ,	     'El Crucero',	'MN',	'EC');
INSERT INTO @tbl VALUES ('Jinotega'            ,	     'El Cua',	'JI',	'EC');
INSERT INTO @tbl VALUES ('Leon'            ,	     'El Jicaral',	'LE',	'EJ');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'El Jicaro',	'NS',	'EJ');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'El Rama',	'AS',	'ER');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'El Realejo',	'CI',	'ER');
INSERT INTO @tbl VALUES ('Carazo'            ,	     'El Rosario',	'CA',	'ER');
INSERT INTO @tbl VALUES ('Leon'            ,	     'El Sauce',	'LE',	'ES');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'El Tortuguero',	'AS',	'ET');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'El Tuma - La Dalia',	'MT',	'TD');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'El Viejo',	'CI',	'EV');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'Esquipulas',	'MT',	'ES');
INSERT INTO @tbl VALUES ('Esteli'            ,	     'Esteli',	'ES',	'ES');
INSERT INTO @tbl VALUES ('Granada'            ,	     'Granada',	'GR',	'GR');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'Jalapa',	'NS',	'JA');
INSERT INTO @tbl VALUES ('Jinotega'            ,	     'Jinotega',	'JI',	'JI');
INSERT INTO @tbl VALUES ('Carazo'            ,	     'Jinotepe',	'CA',	'JI');
INSERT INTO @tbl VALUES ('Chontales'            ,	     'Juigalpa',	'CO',	'JU');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'Kukra - Hill',	'AS',	'KH');
INSERT INTO @tbl VALUES ('Masaya'            ,	     'La Concepcion',	'MS',	'LC');
INSERT INTO @tbl VALUES ('Jinotega'            ,	     'La Concordia',	'JI',	'LC');
INSERT INTO @tbl VALUES ('Carazo'            ,	     'La Conquista',	'CA',	'LC');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'La Cruz de Rio Grande',	'AS',	'LC');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'Laguna de Perlas',	'AS',	'LP');
INSERT INTO @tbl VALUES ('Chontales'            ,	     'La Libertad',	'CO',	'LL');
INSERT INTO @tbl VALUES ('Leon'            ,	     'La Paz Centro',	'LE',	'LP');
INSERT INTO @tbl VALUES ('Carazo'            ,	     'La Paz de Carazo',	'CA',	'LP');
INSERT INTO @tbl VALUES ('Leon'            ,	     'Larreynaga',	'LE',	'LM');
INSERT INTO @tbl VALUES ('Madriz'            ,	     'Las Sabanas',	'MD',	'LS');
INSERT INTO @tbl VALUES ('Esteli'            ,	     'La Trinidad',	'ES',	'LT');
INSERT INTO @tbl VALUES ('Leon'            ,	     'Leon',	'LE',	'LE');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'Macuelizo',	'NS',	'MA');
INSERT INTO @tbl VALUES ('Managua'            ,	     'Managua',	'MN',	'MN');
INSERT INTO @tbl VALUES ('Masaya'            ,	     'Masatepe',	'MS',	'MT');
INSERT INTO @tbl VALUES ('Masaya'            ,	     'Masaya',	'MS',	'MY');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'Matagalpa',	'MT',	'MP');
INSERT INTO @tbl VALUES ('Managua'            ,	     'Mateare',	'MN',	'MT');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'Matiguas',	'MT',	'MS');
INSERT INTO @tbl VALUES ('Rio San Juan'            ,	     'Morrito',	'SJ',	'MO');
INSERT INTO @tbl VALUES ('Rivas'            ,	     'Moyogalpa',	'RI',	'MO');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'Mozonte',	'NS',	'MO');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'Muelle de los Bueyes',	'AS',	'MB');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Norte'            ,	     'Mulukuku',	'AN',	'MU');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'Murra',	'NS',	'MU');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'Muy Muy',	'MT',	'MM');
INSERT INTO @tbl VALUES ('Leon'            ,	     'Nagarote',	'LE',	'NA');
INSERT INTO @tbl VALUES ('Granada'            ,	     'Nandaime',	'GR',	'NA');
INSERT INTO @tbl VALUES ('Masaya'            ,	     'Nandasmo',	'MS',	'NA');
INSERT INTO @tbl VALUES ('Masaya'            ,	     'Nindiri',	'MS',	'NN');
INSERT INTO @tbl VALUES ('Masaya'            ,	     'Niquinohomo',	'MS',	'NQ');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'Nueva Guinea',	'AS',	'NG');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'Ocotal',	'NS',	'OC');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Sur'            ,	     'Paiwas',	'AS',	'PW');
INSERT INTO @tbl VALUES ('Madriz'            ,	     'Palacaguina',	'MD',	'PA');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'Posoltega',	'CI',	'PO');
INSERT INTO @tbl VALUES ('Rivas'            ,	     'Potosi',	'RI',	'PO');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Norte'            ,	     'Prinzapolka',	'AN',	'PR');
INSERT INTO @tbl VALUES ('Esteli'            ,	     'Pueblo Nuevo',	'ES',	'PN');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Norte'            ,	     'Puerto Cabezas',	'AN',	'PC');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'Puerto Morazan',	'CI',	'PM');
INSERT INTO @tbl VALUES ('Leon'            ,	     'Quezalguaque',	'LE',	'QU');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'Quilali',	'NS',	'QU');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'Rancho Grande',	'MT',	'RG');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'Rio Blanco',	'MT',	'RB');
INSERT INTO @tbl VALUES ('Rivas'            ,	     'Rivas',	'RI',	'RI');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Norte'            ,	     'Rosita',	'AN',	'RO');
INSERT INTO @tbl VALUES ('Rio San Juan'            ,	     'San Carlos',	'SJ',	'SC');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'San Dionisio',	'MT',	'SD');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'San Fernando',	'NS',	'SF');
INSERT INTO @tbl VALUES ('Chontales'            ,	     'San Francisco de Cuapa',	'CO',	'SF');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'San Francisco del Norte',	'CI',	'SF');
INSERT INTO @tbl VALUES ('Managua'            ,	     'San Francisco Libre',	'MN',	'SF');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'San Isidro',	'MT',	'SI');
INSERT INTO @tbl VALUES ('Rivas'            ,	     'San Jorge',	'RI',	'SJ');
INSERT INTO @tbl VALUES ('Jinotega'            ,	     'San Jose de Bocay',	'JI',	'SJ');
INSERT INTO @tbl VALUES ('Madriz'            ,	     'San Jose de Cusmapa',	'MD',	'SC');
INSERT INTO @tbl VALUES ('Boaco'            ,	     'San Jose de los Remates',	'BO',	'SJ');
INSERT INTO @tbl VALUES ('Esteli'            ,	     'San Juan de Limay',	'ES',	'SJ');
INSERT INTO @tbl VALUES ('Rivas'            ,	     'San Juan del Sur',	'RI',	'SS');
INSERT INTO @tbl VALUES ('Rio San Juan'            ,	     'San Juan de Nicaragua',	'SJ',	'SJ');
INSERT INTO @tbl VALUES ('Masaya'            ,	     'San Juan de Oriente',	'MS',	'SJ');
INSERT INTO @tbl VALUES ('Madriz'            ,	     'San Juan de Rio Coco',	'MD',	'SR');
INSERT INTO @tbl VALUES ('Boaco'            ,	     'San Lorenzo',	'BO',	'SZ');
INSERT INTO @tbl VALUES ('Madriz'            ,	     'San Lucas',	'MD',	'SL');
INSERT INTO @tbl VALUES ('Carazo'            ,	     'San Marcos',	'CA',	'SM');
INSERT INTO @tbl VALUES ('Rio San Juan'            ,	     'San Miguelito',	'SJ',	'SM');
INSERT INTO @tbl VALUES ('Esteli'            ,	     'San Nicolas',	'ES',	'SN');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'San Pedro del Norte',	'CI',	'SP');
INSERT INTO @tbl VALUES ('Chontales'            ,	     'San Pedro de Lovago',	'CO',	'SP');
INSERT INTO @tbl VALUES ('Jinotega'            ,	     'San Rafael del Norte',	'JI',	'SR');
INSERT INTO @tbl VALUES ('Managua'            ,	     'San Rafael del Sur',	'MN',	'SR');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'San Ramon',	'MT',	'SR');
INSERT INTO @tbl VALUES ('Jinotega'            ,	     'San Sebastian de Yali',	'JI',	'SS');
INSERT INTO @tbl VALUES ('Boaco'            ,	     'Santa Lucia',	'BO',	'SL');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'Santa Maria',	'NS',	'SM');
INSERT INTO @tbl VALUES ('Jinotega'            ,	     'Santa Maria de Pantasma',	'JI',	'SM');
INSERT INTO @tbl VALUES ('Leon'            ,	     'Santa Rosa del Penon',	'LE',	'SR');
INSERT INTO @tbl VALUES ('Carazo'            ,	     'Santa Teresa',	'CA',	'ST');
INSERT INTO @tbl VALUES ('Chontales'            ,	     'Santo Domingo',	'CO',	'SD');
INSERT INTO @tbl VALUES ('Chontales'            ,	     'Santo Tomas',	'CO',	'ST');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'Santo Tomas del Norte',	'CI',	'ST');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'Sebaco',	'MT',	'SE');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Norte'            ,	     'Siuna',	'AN',	'SN');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'Somotillo',	'CI',	'SO');
INSERT INTO @tbl VALUES ('Madriz'            ,	     'Somoto',	'MD',	'SO');
INSERT INTO @tbl VALUES ('Leon'            ,	     'Telica',	'LE',	'TE');
INSERT INTO @tbl VALUES ('Madriz'            ,	     'Telpaneca',	'MD',	'TE');
INSERT INTO @tbl VALUES ('Matagalpa'            ,	     'Terrabona',	'MT',	'TE');
INSERT INTO @tbl VALUES ('Boaco'            ,	     'Teustepe',	'BO',	'TE');
INSERT INTO @tbl VALUES ('Managua'            ,	     'Ticuantepe',	'MN',	'TC');
INSERT INTO @tbl VALUES ('Managua'            ,	     'Tipitapa',	'MN',	'TP');
INSERT INTO @tbl VALUES ('Masaya'            ,	     'Tisma',	'MS',	'TI');
INSERT INTO @tbl VALUES ('Rivas'            ,	     'Tola',	'RI',	'TO');
INSERT INTO @tbl VALUES ('Madriz'            ,	     'Totogalpa',	'MD',	'TO');
INSERT INTO @tbl VALUES ('Managua'            ,	     'Villa El Carmen',	'MN',	'VC');
INSERT INTO @tbl VALUES ('Chinandega'            ,	     'Villanueva',	'CI',	'VI');
INSERT INTO @tbl VALUES ('Chontales'            ,	     'Villa Sandino',	'CO',	'VS');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Norte'            ,	     'Waslala',	'AN',	'WL');
INSERT INTO @tbl VALUES ('Region Autonoma del Atlantico Norte'            ,	     'Waspan',	'AN',	'WP');
INSERT INTO @tbl VALUES ('Jinotega'            ,	     'Wiwili de Jinotega',	'JI',	'WI');
INSERT INTO @tbl VALUES ('Nueva Segovia'            ,	     'Wiwili de Nueva Segovia',	'NS',	'WN');
INSERT INTO @tbl VALUES ('Madriz'            ,	     'Yalaguina',	'MD',	'YA');

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

