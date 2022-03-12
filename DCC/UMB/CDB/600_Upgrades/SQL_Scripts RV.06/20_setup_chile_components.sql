/* ==================================================================================
    Source File		:	setup_chile_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Mon Sep 29 18:33 2014
	Module ID		:	CDB
	Last updated	:	Sep 29, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Chile are set-up
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
WHERE	country_nm	=	'Chile';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Chile not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Commune',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

/*	 These statements should NOT be uncommented; and should be used with extreme caution
DELETE	l3
FROM	level_3_address_components	l3
	JOIN	level_2_address_components	l2
		ON	(	l2.level_2_address_component_id	=	l3.level_2_address_component_id
			)
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


DELETE	level_1_address_components
WHERE	country_id	=	@country_id;
*/

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Arica',	'Arica',	'AA',	'AR');
INSERT INTO @tbl VALUES ('Arica',	'Camarones',	'AA',	'CA');
INSERT INTO @tbl VALUES ('Parinacota',	'General Lagos',	'PN',	'GE');
INSERT INTO @tbl VALUES ('Parinacota',	'Putre',	'PN',	'PU');
INSERT INTO @tbl VALUES ('El Tamarugal',	'Camina',	'ET',	'CA');
INSERT INTO @tbl VALUES ('El Tamarugal',	'Colchane',	'ET',	'CO');
INSERT INTO @tbl VALUES ('El Tamarugal',	'Huara',	'ET',	'HU');
INSERT INTO @tbl VALUES ('El Tamarugal',	'Pica',	'ET',	'PI');
INSERT INTO @tbl VALUES ('El Tamarugal',	'Pozo Almonte',	'ET',	'PO');
INSERT INTO @tbl VALUES ('Iquique',	'Iquique',	'IQ',	'IQ');
INSERT INTO @tbl VALUES ('Iquique',	'Alto Hospicio',	'IQ',	'AL');
INSERT INTO @tbl VALUES ('Tocopilla',	'Maria Elena',	'TO',	'MA');
INSERT INTO @tbl VALUES ('Tocopilla',	'Tocopilla',	'TO',	'TO');
INSERT INTO @tbl VALUES ('El Loa',	'Calama',	'EL',	'CA');
INSERT INTO @tbl VALUES ('El Loa',	'Ollague',	'EL',	'OL');
INSERT INTO @tbl VALUES ('El Loa',	'San Pedro de Atacama',	'EL',	'SA');
INSERT INTO @tbl VALUES ('Antofagasta',	'Antofagasta',	'AN',	'AN');
INSERT INTO @tbl VALUES ('Antofagasta',	'Mejillones',	'AN',	'ME');
INSERT INTO @tbl VALUES ('Antofagasta',	'Sierra Gorda',	'AN',	'SI');
INSERT INTO @tbl VALUES ('Antofagasta',	'Taltal',	'AN',	'TA');
INSERT INTO @tbl VALUES ('Chanaral',	'Chanaral',	'CAL',	'CH');
INSERT INTO @tbl VALUES ('Chanaral',	'Diego de Almagro',	'CAL',	'DI');
INSERT INTO @tbl VALUES ('Copiapo',	'Copiapo',	'CPP',	'CO');
INSERT INTO @tbl VALUES ('Copiapo',	'Caldera',	'CPP',	'CA');
INSERT INTO @tbl VALUES ('Copiapo',	'Tierra Amarilla',	'CPP',	'TI');
INSERT INTO @tbl VALUES ('Huasco',	'Vallenar',	'HU',	'VA');
INSERT INTO @tbl VALUES ('Huasco',	'Freirina',	'HU',	'FR');
INSERT INTO @tbl VALUES ('Huasco',	'Huasco',	'HU',	'HU');
INSERT INTO @tbl VALUES ('Huasco',	'Alto del Carmen',	'HU',	'AL');
INSERT INTO @tbl VALUES ('Elqui',	'Andacollo',	'EQ',	'AN');
INSERT INTO @tbl VALUES ('Elqui',	'Coquimbo',	'EQ',	'CO');
INSERT INTO @tbl VALUES ('Elqui',	'La Higuera',	'EQ',	'LA');
INSERT INTO @tbl VALUES ('Elqui',	'La Serena',	'EQ',	'LS');
INSERT INTO @tbl VALUES ('Elqui',	'Paiguano',	'EQ',	'PA');
INSERT INTO @tbl VALUES ('Elqui',	'Vicuna',	'EQ',	'VI');
INSERT INTO @tbl VALUES ('Limari',	'Ovalle',	'LM',	'OV');
INSERT INTO @tbl VALUES ('Limari',	'Rio Hurtado',	'LM',	'RI');
INSERT INTO @tbl VALUES ('Limari',	'Monte Patria',	'LM',	'MO');
INSERT INTO @tbl VALUES ('Limari',	'Combarbala',	'LM',	'CO');
INSERT INTO @tbl VALUES ('Limari',	'Punitaqui',	'LM',	'PU');
INSERT INTO @tbl VALUES ('Choapa',	'Illapel',	'CHP',	'IL');
INSERT INTO @tbl VALUES ('Choapa',	'Salamanca',	'CHP',	'SA');
INSERT INTO @tbl VALUES ('Choapa',	'Los Vilos',	'CHP',	'LO');
INSERT INTO @tbl VALUES ('Choapa',	'Canela',	'CHP',	'CA');
INSERT INTO @tbl VALUES ('Petorca',	'La Ligua',	'PE',	'LA');
INSERT INTO @tbl VALUES ('Petorca',	'Cabildo',	'PE',	'CA');
INSERT INTO @tbl VALUES ('Petorca',	'Zapallar',	'PE',	'ZA');
INSERT INTO @tbl VALUES ('Petorca',	'Papudo',	'PE',	'PA');
INSERT INTO @tbl VALUES ('Petorca',	'Petorca',	'PE',	'PE');
INSERT INTO @tbl VALUES ('Los Andes',	'Los Andes',	'LO',	'LO');
INSERT INTO @tbl VALUES ('Los Andes',	'San Esteban',	'LO',	'SA');
INSERT INTO @tbl VALUES ('Los Andes',	'Calle Larga',	'LO',	'CA');
INSERT INTO @tbl VALUES ('Los Andes',	'Rinconada',	'LO',	'RI');
INSERT INTO @tbl VALUES ('San Felipe de Aconcagua',	'San Felipe',	'SF',	'SF');
INSERT INTO @tbl VALUES ('San Felipe de Aconcagua',	'Llaillay',	'SF',	'LL');
INSERT INTO @tbl VALUES ('San Felipe de Aconcagua',	'Putaendo',	'SF',	'PU');
INSERT INTO @tbl VALUES ('San Felipe de Aconcagua',	'Santa Maria',	'SF',	'SM');
INSERT INTO @tbl VALUES ('San Felipe de Aconcagua',	'Catemu',	'SF',	'CA');
INSERT INTO @tbl VALUES ('San Felipe de Aconcagua',	'Panquehue',	'SF',	'PA');
INSERT INTO @tbl VALUES ('Quillota',	'Quillota',	'QU',	'QU');
INSERT INTO @tbl VALUES ('Quillota',	'La Calera',	'QU',	'LC');
INSERT INTO @tbl VALUES ('Quillota',	'Nogales',	'QU',	'NO');
INSERT INTO @tbl VALUES ('Quillota',	'Hijuelas',	'QU',	'HI');
INSERT INTO @tbl VALUES ('Quillota',	'La Cruz',	'QU',	'LZ');
INSERT INTO @tbl VALUES ('Valparaiso',	'Valparaiso',	'VP',	'VA');
INSERT INTO @tbl VALUES ('Valparaiso',	'Vina del Mar',	'VP',	'VI');
INSERT INTO @tbl VALUES ('Valparaiso',	'Concon',	'VP',	'CO');
INSERT INTO @tbl VALUES ('Valparaiso',	'Quintero',	'VP',	'QU');
INSERT INTO @tbl VALUES ('Valparaiso',	'Puchuncavi',	'VP',	'PU');
INSERT INTO @tbl VALUES ('Valparaiso',	'Casablanca',	'VP',	'CA');
INSERT INTO @tbl VALUES ('Valparaiso',	'Juan Fernandez',	'VP',	'JU');
INSERT INTO @tbl VALUES ('Marga Marga',	'Quilpue',	'MM',	'QU');
INSERT INTO @tbl VALUES ('Marga Marga',	'Limache',	'MM',	'LI');
INSERT INTO @tbl VALUES ('Marga Marga',	'Olmue',	'MM',	'OL');
INSERT INTO @tbl VALUES ('Marga Marga',	'Villa Alemana',	'MM',	'VI');
INSERT INTO @tbl VALUES ('San Antonio',	'Algarrobo',	'SA',	'AL');
INSERT INTO @tbl VALUES ('San Antonio',	'El Quisco',	'SA',	'EQ');
INSERT INTO @tbl VALUES ('San Antonio',	'El Tabo',	'SA',	'ET');
INSERT INTO @tbl VALUES ('San Antonio',	'Cartagena',	'SA',	'CA');
INSERT INTO @tbl VALUES ('San Antonio',	'San Antonio',	'SA',	'SA');
INSERT INTO @tbl VALUES ('San Antonio',	'Santo Domingo',	'SA',	'SD');
INSERT INTO @tbl VALUES ('Isla de Pascua',	'Isla de Pascua',	'IS',	'IS');
INSERT INTO @tbl VALUES ('Cachapoal',	'Codegua',	'CA',	'CD');
INSERT INTO @tbl VALUES ('Cachapoal',	'Coinco',	'CA',	'CN');
INSERT INTO @tbl VALUES ('Cachapoal',	'Coltauco',	'CA',	'CL');
INSERT INTO @tbl VALUES ('Cachapoal',	'Donihue',	'CA',	'DO');
INSERT INTO @tbl VALUES ('Cachapoal',	'Graneros',	'CA',	'GR');
INSERT INTO @tbl VALUES ('Cachapoal',	'Las Cabras',	'CA',	'LA');
INSERT INTO @tbl VALUES ('Cachapoal',	'Machali',	'CA',	'MC');
INSERT INTO @tbl VALUES ('Cachapoal',	'Malloa',	'CA',	'ML');
INSERT INTO @tbl VALUES ('Cachapoal',	'Olivar',	'CA',	'OL');
INSERT INTO @tbl VALUES ('Cachapoal',	'Peumo',	'CA',	'PE');
INSERT INTO @tbl VALUES ('Cachapoal',	'Pichidegua',	'CA',	'PI');
INSERT INTO @tbl VALUES ('Cachapoal',	'Quinta de Tilcoco',	'CA',	'QU');
INSERT INTO @tbl VALUES ('Cachapoal',	'Rancagua',	'CA',	'RA');
INSERT INTO @tbl VALUES ('Cachapoal',	'Requinoa',	'CA',	'RQ');
INSERT INTO @tbl VALUES ('Cachapoal',	'Rengo',	'CA',	'RE');
INSERT INTO @tbl VALUES ('Cachapoal',	'Mostazal',	'CA',	'MO');
INSERT INTO @tbl VALUES ('Cachapoal',	'San Vicente de Tagua Tagua',	'CA',	'SA');
INSERT INTO @tbl VALUES ('Colchagua',	'Chepica',	'CL',	'CP');
INSERT INTO @tbl VALUES ('Colchagua',	'Chimbarongo',	'CL',	'CB');
INSERT INTO @tbl VALUES ('Colchagua',	'Lolol',	'CL',	'LO');
INSERT INTO @tbl VALUES ('Colchagua',	'Nancagua',	'CL',	'NA');
INSERT INTO @tbl VALUES ('Colchagua',	'Palmilla',	'CL',	'PA');
INSERT INTO @tbl VALUES ('Colchagua',	'Peralillo',	'CL',	'PE');
INSERT INTO @tbl VALUES ('Colchagua',	'Placilla',	'CL',	'PL');
INSERT INTO @tbl VALUES ('Colchagua',	'Pumanque',	'CL',	'PU');
INSERT INTO @tbl VALUES ('Colchagua',	'San Fernando',	'CL',	'SF');
INSERT INTO @tbl VALUES ('Colchagua',	'Santa Cruz',	'CL',	'SC');
INSERT INTO @tbl VALUES ('Cardenal Caro',	'La Estrella',	'CC',	'LA');
INSERT INTO @tbl VALUES ('Cardenal Caro',	'Litueche',	'CC',	'LI');
INSERT INTO @tbl VALUES ('Cardenal Caro',	'Marchigue',	'CC',	'MA');
INSERT INTO @tbl VALUES ('Cardenal Caro',	'Navidad',	'CC',	'NA');
INSERT INTO @tbl VALUES ('Cardenal Caro',	'Paredones',	'CC',	'PA');
INSERT INTO @tbl VALUES ('Cardenal Caro',	'Pichilemu',	'CC',	'PI');
INSERT INTO @tbl VALUES ('Curico',	'Curico',	'CU',	'CU');
INSERT INTO @tbl VALUES ('Curico',	'Hualane',	'CU',	'HU');
INSERT INTO @tbl VALUES ('Curico',	'Licanten',	'CU',	'LI');
INSERT INTO @tbl VALUES ('Curico',	'Molina',	'CU',	'MO');
INSERT INTO @tbl VALUES ('Curico',	'Rauco',	'CU',	'RA');
INSERT INTO @tbl VALUES ('Curico',	'Romeral',	'CU',	'RO');
INSERT INTO @tbl VALUES ('Curico',	'Sagrada Familia, Chile',	'CU',	'SA');
INSERT INTO @tbl VALUES ('Curico',	'Teno',	'CU',	'TE');
INSERT INTO @tbl VALUES ('Curico',	'Vichuquen',	'CU',	'VI');
INSERT INTO @tbl VALUES ('Talca',	'Talca',	'TA',	'TA');
INSERT INTO @tbl VALUES ('Talca',	'San Clemente',	'TA',	'SA');
INSERT INTO @tbl VALUES ('Talca',	'Pelarco',	'TA',	'PL');
INSERT INTO @tbl VALUES ('Talca',	'Pencahue',	'TA',	'PC');
INSERT INTO @tbl VALUES ('Talca',	'Maule',	'TA',	'MA');
INSERT INTO @tbl VALUES ('Talca',	'San Rafael',	'TA',	'SR');
INSERT INTO @tbl VALUES ('Talca',	'Curepto',	'TA',	'CU');
INSERT INTO @tbl VALUES ('Talca',	'Constitucion',	'TA',	'CO');
INSERT INTO @tbl VALUES ('Talca',	'Empedrado',	'TA',	'EM');
INSERT INTO @tbl VALUES ('Talca',	'Rio Claro',	'TA',	'RI');
INSERT INTO @tbl VALUES ('Linares',	'Linares',	'LN',	'LN');
INSERT INTO @tbl VALUES ('Linares',	'San Javier de Loncomilla',	'LN',	'SA');
INSERT INTO @tbl VALUES ('Linares',	'Parral',	'LN',	'PA');
INSERT INTO @tbl VALUES ('Linares',	'Villa Alegre',	'LN',	'VI');
INSERT INTO @tbl VALUES ('Linares',	'Longavi',	'LN',	'LO');
INSERT INTO @tbl VALUES ('Linares',	'Colbun',	'LN',	'CO');
INSERT INTO @tbl VALUES ('Linares',	'Retiro',	'LN',	'RE');
INSERT INTO @tbl VALUES ('Linares',	'Yerbas Buenas',	'LN',	'YE');
INSERT INTO @tbl VALUES ('Cauquenes',	'Cauquenes',	'CQ',	'CA');
INSERT INTO @tbl VALUES ('Cauquenes',	'Chanco',	'CQ',	'CH');
INSERT INTO @tbl VALUES ('Cauquenes',	'Pelluhue',	'CQ',	'PE');
INSERT INTO @tbl VALUES ('Nuble',	'Bulnes',	'NU',	'BU');
INSERT INTO @tbl VALUES ('Nuble',	'Chillan',	'NU',	'CN');
INSERT INTO @tbl VALUES ('Nuble',	'Chillan Viejo',	'NU',	'CV');
INSERT INTO @tbl VALUES ('Nuble',	'Cobquecura',	'NU',	'CQ');
INSERT INTO @tbl VALUES ('Nuble',	'Coelemu',	'NU',	'CL');
INSERT INTO @tbl VALUES ('Nuble',	'Coihueco',	'NU',	'CH');
INSERT INTO @tbl VALUES ('Nuble',	'El Carmen',	'NU',	'EL');
INSERT INTO @tbl VALUES ('Nuble',	'Ninhue',	'NU',	'NH');
INSERT INTO @tbl VALUES ('Nuble',	'Niquen',	'NU',	'NQ');
INSERT INTO @tbl VALUES ('Nuble',	'Pemuco',	'NU',	'PE');
INSERT INTO @tbl VALUES ('Nuble',	'Pinto',	'NU',	'PI');
INSERT INTO @tbl VALUES ('Nuble',	'Portezuelo',	'NU',	'PO');
INSERT INTO @tbl VALUES ('Nuble',	'Quillon',	'NU',	'QL');
INSERT INTO @tbl VALUES ('Nuble',	'Quirihue',	'NU',	'QR');
INSERT INTO @tbl VALUES ('Nuble',	'Ranquil',	'NU',	'RA');
INSERT INTO @tbl VALUES ('Nuble',	'San Carlos',	'NU',	'SC');
INSERT INTO @tbl VALUES ('Nuble',	'San Fabian',	'NU',	'SF');
INSERT INTO @tbl VALUES ('Nuble',	'San Ignacio',	'NU',	'SI');
INSERT INTO @tbl VALUES ('Nuble',	'San Nicolas',	'NU',	'SN');
INSERT INTO @tbl VALUES ('Nuble',	'Treguaco',	'NU',	'TR');
INSERT INTO @tbl VALUES ('Nuble',	'Yungay',	'NU',	'YU');
INSERT INTO @tbl VALUES ('Biobio',	'Alto Biobio',	'BI',	'AL');
INSERT INTO @tbl VALUES ('Biobio',	'Antuco',	'BI',	'AN');
INSERT INTO @tbl VALUES ('Biobio',	'Cabrero',	'BI',	'CA');
INSERT INTO @tbl VALUES ('Biobio',	'Laja',	'BI',	'LA');
INSERT INTO @tbl VALUES ('Biobio',	'Los Angeles',	'BI',	'LO');
INSERT INTO @tbl VALUES ('Biobio',	'Mulchen',	'BI',	'MU');
INSERT INTO @tbl VALUES ('Biobio',	'Nacimiento',	'BI',	'NA');
INSERT INTO @tbl VALUES ('Biobio',	'Negrete',	'BI',	'NE');
INSERT INTO @tbl VALUES ('Biobio',	'Quilaco',	'BI',	'QA');
INSERT INTO @tbl VALUES ('Biobio',	'Quilleco',	'BI',	'QE');
INSERT INTO @tbl VALUES ('Biobio',	'San Rosendo',	'BI',	'SR');
INSERT INTO @tbl VALUES ('Biobio',	'Santa Barbara',	'BI',	'SB');
INSERT INTO @tbl VALUES ('Biobio',	'Tucapel',	'BI',	'TU');
INSERT INTO @tbl VALUES ('Biobio',	'Yumbel',	'BI',	'YU');
INSERT INTO @tbl VALUES ('Concepcion',	'Concepcion',	'CO',	'CN');
INSERT INTO @tbl VALUES ('Concepcion',	'Coronel',	'CO',	'CR');
INSERT INTO @tbl VALUES ('Concepcion',	'Chiguayante',	'CO',	'CH');
INSERT INTO @tbl VALUES ('Concepcion',	'Florida',	'CO',	'FL');
INSERT INTO @tbl VALUES ('Concepcion',	'Hualpen',	'CO',	'HP');
INSERT INTO @tbl VALUES ('Concepcion',	'Hualqui',	'CO',	'HQ');
INSERT INTO @tbl VALUES ('Concepcion',	'Lota',	'CO',	'LO');
INSERT INTO @tbl VALUES ('Concepcion',	'Penco',	'CO',	'PE');
INSERT INTO @tbl VALUES ('Concepcion',	'San Pedro de la Paz',	'CO',	'SP');
INSERT INTO @tbl VALUES ('Concepcion',	'Santa Juana',	'CO',	'SJ');
INSERT INTO @tbl VALUES ('Concepcion',	'Talcahuano',	'CO',	'TA');
INSERT INTO @tbl VALUES ('Concepcion',	'Tome',	'CO',	'TO');
INSERT INTO @tbl VALUES ('Arauco',	'Arauco',	'AR',	'AR');
INSERT INTO @tbl VALUES ('Arauco',	'Canete',	'AR',	'CA');
INSERT INTO @tbl VALUES ('Arauco',	'Contulmo',	'AR',	'CO');
INSERT INTO @tbl VALUES ('Arauco',	'Curanilahue',	'AR',	'CU');
INSERT INTO @tbl VALUES ('Arauco',	'Lebu',	'AR',	'LE');
INSERT INTO @tbl VALUES ('Arauco',	'Los Alamos',	'AR',	'LO');
INSERT INTO @tbl VALUES ('Arauco',	'Tirua',	'AR',	'TI');
INSERT INTO @tbl VALUES ('Malleco',	'Angol',	'MA',	'AN');
INSERT INTO @tbl VALUES ('Malleco',	'Collipulli',	'MA',	'CO');
INSERT INTO @tbl VALUES ('Malleco',	'Curacautin',	'MA',	'CU');
INSERT INTO @tbl VALUES ('Malleco',	'Ercilla',	'MA',	'ER');
INSERT INTO @tbl VALUES ('Malleco',	'Lonquimay',	'MA',	'LQ');
INSERT INTO @tbl VALUES ('Malleco',	'Los Sauces',	'MA',	'LS');
INSERT INTO @tbl VALUES ('Malleco',	'Lumaco',	'MA',	'LU');
INSERT INTO @tbl VALUES ('Malleco',	'Puren',	'MA',	'PU');
INSERT INTO @tbl VALUES ('Malleco',	'Renaico',	'MA',	'RE');
INSERT INTO @tbl VALUES ('Malleco',	'Traiguen',	'MA',	'TR');
INSERT INTO @tbl VALUES ('Malleco',	'Victoria',	'MA',	'VI');
INSERT INTO @tbl VALUES ('Cautin',	'Temuco',	'CT',	'TE');
INSERT INTO @tbl VALUES ('Cautin',	'Carahue',	'CT',	'CA');
INSERT INTO @tbl VALUES ('Cautin',	'Cholchol',	'CT',	'CH');
INSERT INTO @tbl VALUES ('Cautin',	'Cunco',	'CT',	'CN');
INSERT INTO @tbl VALUES ('Cautin',	'Curarrehue',	'CT',	'CR');
INSERT INTO @tbl VALUES ('Cautin',	'Freire',	'CT',	'FR');
INSERT INTO @tbl VALUES ('Cautin',	'Galvarino',	'CT',	'GA');
INSERT INTO @tbl VALUES ('Cautin',	'Gorbea',	'CT',	'GO');
INSERT INTO @tbl VALUES ('Cautin',	'Lautaro',	'CT',	'LA');
INSERT INTO @tbl VALUES ('Cautin',	'Loncoche',	'CT',	'LO');
INSERT INTO @tbl VALUES ('Cautin',	'Melipeuco',	'CT',	'ME');
INSERT INTO @tbl VALUES ('Cautin',	'Nueva Imperial',	'CT',	'NU');
INSERT INTO @tbl VALUES ('Cautin',	'Padre Las Casas',	'CT',	'PA');
INSERT INTO @tbl VALUES ('Cautin',	'Perquenco',	'CT',	'PE');
INSERT INTO @tbl VALUES ('Cautin',	'Pitrufquen',	'CT',	'PI');
INSERT INTO @tbl VALUES ('Cautin',	'Pucon',	'CT',	'PU');
INSERT INTO @tbl VALUES ('Cautin',	'Saavedra',	'CT',	'SA');
INSERT INTO @tbl VALUES ('Cautin',	'Teodoro Schmidt',	'CT',	'TS');
INSERT INTO @tbl VALUES ('Cautin',	'Tolten',	'CT',	'TO');
INSERT INTO @tbl VALUES ('Cautin',	'Vilcun',	'CT',	'VC');
INSERT INTO @tbl VALUES ('Cautin',	'Villarrica',	'CT',	'VR');
INSERT INTO @tbl VALUES ('Valdivia',	'Valdivia',	'VA',	'VD');
INSERT INTO @tbl VALUES ('Valdivia',	'Corral',	'VA',	'CO');
INSERT INTO @tbl VALUES ('Valdivia',	'Lanco',	'VA',	'LA');
INSERT INTO @tbl VALUES ('Valdivia',	'Los Lagos',	'VA',	'LO');
INSERT INTO @tbl VALUES ('Valdivia',	'Mariquina',	'VA',	'MQ');
INSERT INTO @tbl VALUES ('Valdivia',	'Mafil',	'VA',	'MF');
INSERT INTO @tbl VALUES ('Valdivia',	'Paillaco',	'VA',	'PL');
INSERT INTO @tbl VALUES ('Valdivia',	'Panguipulli',	'VA',	'PG');
INSERT INTO @tbl VALUES ('Ranco',	'La Union',	'RA',	'LU');
INSERT INTO @tbl VALUES ('Ranco',	'Futrono',	'RA',	'FU');
INSERT INTO @tbl VALUES ('Ranco',	'Lago Ranco',	'RA',	'LR');
INSERT INTO @tbl VALUES ('Ranco',	'Rio Bueno',	'RA',	'RI');
INSERT INTO @tbl VALUES ('Osorno',	'Osorno',	'OS',	'OS');
INSERT INTO @tbl VALUES ('Osorno',	'Puerto Octay',	'OS',	'PO');
INSERT INTO @tbl VALUES ('Osorno',	'Purranque',	'OS',	'PR');
INSERT INTO @tbl VALUES ('Osorno',	'Puyehue',	'OS',	'PY');
INSERT INTO @tbl VALUES ('Osorno',	'Rio Negro',	'OS',	'RI');
INSERT INTO @tbl VALUES ('Osorno',	'San Pablo',	'OS',	'SP');
INSERT INTO @tbl VALUES ('Osorno',	'San Juan de la Costa',	'OS',	'SJ');
INSERT INTO @tbl VALUES ('Llanquihue',	'Calbuco',	'LL',	'CA');
INSERT INTO @tbl VALUES ('Llanquihue',	'Cochamo',	'LL',	'CO');
INSERT INTO @tbl VALUES ('Llanquihue',	'Fresia',	'LL',	'FR');
INSERT INTO @tbl VALUES ('Llanquihue',	'Frutillar',	'LL',	'FT');
INSERT INTO @tbl VALUES ('Llanquihue',	'Llanquihue',	'LL',	'LL');
INSERT INTO @tbl VALUES ('Llanquihue',	'Los Muermos',	'LL',	'LO');
INSERT INTO @tbl VALUES ('Llanquihue',	'Maullin',	'LL',	'MA');
INSERT INTO @tbl VALUES ('Llanquihue',	'Puerto Montt',	'LL',	'PM');
INSERT INTO @tbl VALUES ('Llanquihue',	'Puerto Varas',	'LL',	'PV');
INSERT INTO @tbl VALUES ('Chiloe',	'Ancud',	'CH',	'AN');
INSERT INTO @tbl VALUES ('Chiloe',	'Castro',	'CH',	'CA');
INSERT INTO @tbl VALUES ('Chiloe',	'Chonchi',	'CH',	'CH');
INSERT INTO @tbl VALUES ('Chiloe',	'Curaco de Velez',	'CH',	'CU');
INSERT INTO @tbl VALUES ('Chiloe',	'Dalcahue',	'CH',	'DA');
INSERT INTO @tbl VALUES ('Chiloe',	'Puqueldon',	'CH',	'PU');
INSERT INTO @tbl VALUES ('Chiloe',	'Queilen',	'CH',	'QI');
INSERT INTO @tbl VALUES ('Chiloe',	'Quellon',	'CH',	'QL');
INSERT INTO @tbl VALUES ('Chiloe',	'Quemchi',	'CH',	'QM');
INSERT INTO @tbl VALUES ('Chiloe',	'Quinchao',	'CH',	'QN');
INSERT INTO @tbl VALUES ('Palena',	'Futaleufu',	'PA',	'FU');
INSERT INTO @tbl VALUES ('Palena',	'Hualaihue',	'PA',	'HU');
INSERT INTO @tbl VALUES ('Palena',	'Palena',	'PA',	'PA');
INSERT INTO @tbl VALUES ('Coihaique',	'Coihaique',	'CHQ',	'CO');
INSERT INTO @tbl VALUES ('Coihaique',	'Lago Verde',	'CHQ',	'LA');
INSERT INTO @tbl VALUES ('Aisen',	'Aisen',	'AI',	'AI');
INSERT INTO @tbl VALUES ('Aisen',	'Cisnes',	'AI',	'CI');
INSERT INTO @tbl VALUES ('Aisen',	'Guaitecas',	'AI',	'GU');
INSERT INTO @tbl VALUES ('General Carrera',	'Chile Chico',	'GE',	'CH');
INSERT INTO @tbl VALUES ('General Carrera',	'Rio Ibanez',	'GE',	'RI');
INSERT INTO @tbl VALUES ('Capitan Prat',	'Cochrane',	'CP',	'CO');
INSERT INTO @tbl VALUES ('Capitan Prat',	'O''Higgins',	'CP',	'OH');
INSERT INTO @tbl VALUES ('Capitan Prat',	'Tortel',	'CP',	'TO');
INSERT INTO @tbl VALUES ('Ultima Esperanza',	'Puerto Natales',	'UL',	'PU');
INSERT INTO @tbl VALUES ('Ultima Esperanza',	'Torres del Paine',	'UL',	'TO');
INSERT INTO @tbl VALUES ('Magallanes',	'Laguna Blanca',	'MG',	'LA');
INSERT INTO @tbl VALUES ('Magallanes',	'Punta Arenas',	'MG',	'PU');
INSERT INTO @tbl VALUES ('Magallanes',	'Rio Verde',	'MG',	'RI');
INSERT INTO @tbl VALUES ('Magallanes',	'San Gregorio',	'MG',	'SA');
INSERT INTO @tbl VALUES ('Tierra del Fuego',	'Porvenir',	'TI',	'PO');
INSERT INTO @tbl VALUES ('Tierra del Fuego',	'Primavera',	'TI',	'PR');
INSERT INTO @tbl VALUES ('Tierra del Fuego',	'Timaukel',	'TI',	'TI');
INSERT INTO @tbl VALUES ('Antartica Chilena',	'Cabo de Hornos',	'AC',	'CA');
INSERT INTO @tbl VALUES ('Antartica Chilena',	'Antartica',	'AC',	'AN');
INSERT INTO @tbl VALUES ('Chacabuco',	'Colina',	'CB',	'CO');
INSERT INTO @tbl VALUES ('Chacabuco',	'Lampa',	'CB',	'LA');
INSERT INTO @tbl VALUES ('Chacabuco',	'Tiltil',	'CB',	'TI');
INSERT INTO @tbl VALUES ('Cordillera',	'Puente Alto',	'CD',	'PU');
INSERT INTO @tbl VALUES ('Cordillera',	'San Jose de Maipo',	'CD',	'SA');
INSERT INTO @tbl VALUES ('Cordillera',	'Pirque',	'CD',	'PI');
INSERT INTO @tbl VALUES ('Maipo',	'San Bernardo',	'MP',	'SA');
INSERT INTO @tbl VALUES ('Maipo',	'Buin',	'MP',	'BU');
INSERT INTO @tbl VALUES ('Maipo',	'Paine',	'MP',	'PA');
INSERT INTO @tbl VALUES ('Maipo',	'Calera de Tango',	'MP',	'CA');
INSERT INTO @tbl VALUES ('Talagante',	'Isla de Maipo',	'TG',	'IS');
INSERT INTO @tbl VALUES ('Talagante',	'El Monte',	'TG',	'EL');
INSERT INTO @tbl VALUES ('Talagante',	'Padre Hurtado',	'TG',	'PA');
INSERT INTO @tbl VALUES ('Talagante',	'Penaflor',	'TG',	'PE');
INSERT INTO @tbl VALUES ('Talagante',	'Talagante',	'TG',	'TA');
INSERT INTO @tbl VALUES ('Melipilla',	'Curacavi',	'ME',	'CU');
INSERT INTO @tbl VALUES ('Melipilla',	'Maria Pinto',	'ME',	'MA');
INSERT INTO @tbl VALUES ('Melipilla',	'Melipilla',	'ME',	'ME');
INSERT INTO @tbl VALUES ('Melipilla',	'San Pedro',	'ME',	'SA');
INSERT INTO @tbl VALUES ('Melipilla',	'Alhue',	'ME',	'AL');
INSERT INTO @tbl VALUES ('Santiago',	'Cerrillos',	'ST',	'CL');
INSERT INTO @tbl VALUES ('Santiago',	'Cerro Navia',	'ST',	'CN');
INSERT INTO @tbl VALUES ('Santiago',	'Conchali',	'ST',	'CO');
INSERT INTO @tbl VALUES ('Santiago',	'El Bosque',	'ST',	'EL');
INSERT INTO @tbl VALUES ('Santiago',	'Estacion Central',	'ST',	'ES');
INSERT INTO @tbl VALUES ('Santiago',	'Huechuraba',	'ST',	'HU');
INSERT INTO @tbl VALUES ('Santiago',	'Independencia',	'ST',	'IN');
INSERT INTO @tbl VALUES ('Santiago',	'La Cisterna',	'ST',	'LC');
INSERT INTO @tbl VALUES ('Santiago',	'La Granja',	'ST',	'LG');
INSERT INTO @tbl VALUES ('Santiago',	'La Florida',	'ST',	'LF');
INSERT INTO @tbl VALUES ('Santiago',	'La Pintana',	'ST',	'LP');
INSERT INTO @tbl VALUES ('Santiago',	'La Reina',	'ST',	'LR');
INSERT INTO @tbl VALUES ('Santiago',	'Las Condes',	'ST',	'LN');
INSERT INTO @tbl VALUES ('Santiago',	'Lo Barnechea',	'ST',	'LB');
INSERT INTO @tbl VALUES ('Santiago',	'Lo Espejo',	'ST',	'LE');
INSERT INTO @tbl VALUES ('Santiago',	'Lo Prado',	'ST',	'LD');
INSERT INTO @tbl VALUES ('Santiago',	'Macul',	'ST',	'MC');
INSERT INTO @tbl VALUES ('Santiago',	'Maipu',	'ST',	'MP');
INSERT INTO @tbl VALUES ('Santiago',	'Nunoa',	'ST',	'NU');
INSERT INTO @tbl VALUES ('Santiago',	'Pedro Aguirre Cerda',	'ST',	'PA');
INSERT INTO @tbl VALUES ('Santiago',	'Penalolen',	'ST',	'PE');
INSERT INTO @tbl VALUES ('Santiago',	'Providencia',	'ST',	'PR');
INSERT INTO @tbl VALUES ('Santiago',	'Pudahuel',	'ST',	'PU');
INSERT INTO @tbl VALUES ('Santiago',	'Quilicura',	'ST',	'QU');
INSERT INTO @tbl VALUES ('Santiago',	'Quinta Normal',	'ST',	'QN');
INSERT INTO @tbl VALUES ('Santiago',	'Recoleta',	'ST',	'RL');
INSERT INTO @tbl VALUES ('Santiago',	'Renca',	'ST',	'RE');
INSERT INTO @tbl VALUES ('Santiago',	'San Miguel',	'ST',	'SM');
INSERT INTO @tbl VALUES ('Santiago',	'San Joaquin',	'ST',	'SJ');
INSERT INTO @tbl VALUES ('Santiago',	'San Ramon',	'ST',	'SR');
INSERT INTO @tbl VALUES ('Santiago',	'Santiago',	'ST',	'SA');
INSERT INTO @tbl VALUES ('Santiago',	'Vitacura',	'ST',	'VI');

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


