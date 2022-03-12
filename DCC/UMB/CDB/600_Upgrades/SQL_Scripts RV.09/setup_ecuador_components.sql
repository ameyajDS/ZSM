
/* ==================================================================================
    	Source File		:	setup_ecuador_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Ecuador are set-up
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
WHERE	country_nm	=	'Ecuador';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Ecuador not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Canton',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Orellana'            ,	     'Aguarico',	'OR',	'AG');
INSERT INTO @tbl VALUES ('Chimborazo'            ,	     'Alausi',	'CB',	'AL');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Alfredo Baquerizo Moreno',	'GY',	'AB');
INSERT INTO @tbl VALUES ('Tungurahua'            ,	     'Ambato',	'TU',	'AM');
INSERT INTO @tbl VALUES ('Imbabura'            ,	     'Antonio Ante',	'IM',	'AA');
INSERT INTO @tbl VALUES ('Pastaza'            ,	     'Arajuno',	'PA',	'AR');
INSERT INTO @tbl VALUES ('Napo'            ,	     'Archidona',	'NA',	'AR');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Arenillas',	'EO',	'AR');
INSERT INTO @tbl VALUES ('Esmeraldas'            ,	     'Atacames',	'ES',	'AT');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Atahualpa',	'EO',	'AT');
INSERT INTO @tbl VALUES ('Canar'            ,	     'Azogues',	'CN',	'AZ');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Baba',	'LR',	'BB');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Babahoyo',	'LR',	'BH');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Balao',	'GY',	'BO');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Balsas',	'EO',	'BA');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Balzar',	'GY',	'BZ');
INSERT INTO @tbl VALUES ('Tungurahua'            ,	     'Banos',	'TU',	'BA');
INSERT INTO @tbl VALUES ('Canar'            ,	     'Biblian',	'CN',	'BI');
INSERT INTO @tbl VALUES ('Carchi'            ,	     'Bolivar',	'CR',	'BO');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Bolivar',	'MN',	'BO');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Buena Fe',	'LR',	'BF');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Caluma',	'BO',	'CA');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Calvas',	'LJ',	'CV');
INSERT INTO @tbl VALUES ('Canar'            ,	     'Canar',	'CN',	'CA');
INSERT INTO @tbl VALUES ('Napo'            ,	     'Carlos Julio Arosemena Tola',	'NA',	'CA');
INSERT INTO @tbl VALUES ('Sucumbios'            ,	     'Cascales',	'SU',	'CA');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Catamayo',	'LJ',	'CT');
INSERT INTO @tbl VALUES ('Pichincha'            ,	     'Cayambe',	'PC',	'CA');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Celica',	'LJ',	'CE');
INSERT INTO @tbl VALUES ('Zamora-Chinchipe'            ,	     'Centinela del Condor',	'ZC',	'CC');
INSERT INTO @tbl VALUES ('Tungurahua'            ,	     'Cevallos',	'TU',	'CE');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Chaguarpamba',	'LJ',	'CP');
INSERT INTO @tbl VALUES ('Chimborazo'            ,	     'Chambo',	'CB',	'CB');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Chilla',	'EO',	'CH');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Chillanes',	'BO',	'CN');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Chimbo',	'BO',	'CB');
INSERT INTO @tbl VALUES ('Zamora-Chinchipe'            ,	     'Chinchipe',	'ZC',	'CH');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Chone',	'MN',	'CH');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Chordeleg',	'AZ',	'CH');
INSERT INTO @tbl VALUES ('Chimborazo'            ,	     'Chunchi',	'CB',	'CN');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Colimes',	'GY',	'CO');
INSERT INTO @tbl VALUES ('Chimborazo'            ,	     'Colta',	'CB',	'CT');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Coronel Marcelino Mariduena',	'GY',	'CM');
INSERT INTO @tbl VALUES ('Imbabura'            ,	     'Cotacachi',	'IM',	'CO');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Cuenca',	'AZ',	'CU');
INSERT INTO @tbl VALUES ('Chimborazo'            ,	     'Cumanda',	'CB',	'CD');
INSERT INTO @tbl VALUES ('Sucumbios'            ,	     'Cuyabeno',	'SU',	'CU');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Daule',	'GY',	'DA');
INSERT INTO @tbl VALUES ('Canar'            ,	     'Deleg',	'CN',	'DE');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Duran',	'GY',	'DU');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Echeandia',	'BO',	'EC');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'El Carmen',	'MN',	'EC');
INSERT INTO @tbl VALUES ('Napo'            ,	     'El Chaco',	'NA',	'EL');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'El Empalme',	'GY',	'EE');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'El Guabo',	'EO',	'EG');
INSERT INTO @tbl VALUES ('Esmeraldas'            ,	     'Eloy Alfaro',	'ES',	'EA');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'El Pan',	'AZ',	'EP');
INSERT INTO @tbl VALUES ('Zamora-Chinchipe'            ,	     'El Pangui',	'ZC',	'EP');
INSERT INTO @tbl VALUES ('Canar'            ,	     'El Tambo',	'CN',	'ET');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'El Triunfo',	'GY',	'ET');
INSERT INTO @tbl VALUES ('Esmeraldas'            ,	     'Esmeraldas',	'ES',	'ES');
INSERT INTO @tbl VALUES ('Carchi'            ,	     'Espejo',	'CR',	'ES');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Espindola',	'LJ',	'ES');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Flavio Alfaro',	'MN',	'FA');
INSERT INTO @tbl VALUES ('Orellana'            ,	     'Francisco de Orellana',	'OR',	'FO');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'General Antonio Elizalde',	'GY',	'GE');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Giron',	'AZ',	'GR');
INSERT INTO @tbl VALUES ('Sucumbios'            ,	     'Gonzalo Pizarro',	'SU',	'GP');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Gonzanama',	'LJ',	'GO');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Guachapala',	'AZ',	'GC');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Gualaceo',	'AZ',	'GL');
INSERT INTO @tbl VALUES ('Morona-Santiago'            ,	     'Gualaquiza',	'MS',	'GU');
INSERT INTO @tbl VALUES ('Chimborazo'            ,	     'Guamote',	'CB',	'GM');
INSERT INTO @tbl VALUES ('Chimborazo'            ,	     'Guano',	'CB',	'GN');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Guaranda',	'BO',	'GU');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Guayaquil',	'GY',	'GU');
INSERT INTO @tbl VALUES ('Morona-Santiago'            ,	     'Huamboya',	'MS',	'HB');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Huaquillas',	'EO',	'HU');
INSERT INTO @tbl VALUES ('Imbabura'            ,	     'Ibarra',	'IM',	'IB');
INSERT INTO @tbl VALUES ('Galapagos'            ,	     'Isabela',	'GA',	'IS');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Isidro Ayora',	'GY',	'IA');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Jama',	'MN',	'JM');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Jaramijo',	'MN',	'JR');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Jipijapa',	'MN',	'JJ');
INSERT INTO @tbl VALUES ('Orellana'            ,	     'Joya de los Sachas',	'OR',	'JS');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Junin',	'MN',	'JN');
INSERT INTO @tbl VALUES ('Sucumbios'            ,	     'Lago Agrio',	'SU',	'LA');
INSERT INTO @tbl VALUES ('Santa Elena'            ,	     'La Libertad',	'SE',	'LL');
INSERT INTO @tbl VALUES ('Cotopaxi'            ,	     'La Mana',	'CT',	'LM');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Las Lajas',	'EO',	'LL');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Las Naves',	'BO',	'LN');
INSERT INTO @tbl VALUES ('Cotopaxi'            ,	     'Latacunga',	'CT',	'LA');
INSERT INTO @tbl VALUES ('Canar'            ,	     'La Troncal',	'CN',	'LT');
INSERT INTO @tbl VALUES ('Morona-Santiago'            ,	     'Limon Indanza',	'MS',	'LI');
INSERT INTO @tbl VALUES ('Morona-Santiago'            ,	     'Logrono',	'MS',	'LO');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Loja',	'LJ',	'LO');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Lomas de Sargentillo',	'GY',	'LS');
INSERT INTO @tbl VALUES ('Orellana'            ,	     'Loreto',	'OR',	'LO');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Macara',	'LJ',	'MA');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Machala',	'EO',	'MC');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Manta',	'MN',	'MA');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Marcabeli',	'EO',	'MR');
INSERT INTO @tbl VALUES ('Pichincha'            ,	     'Mejia',	'PC',	'ME');
INSERT INTO @tbl VALUES ('Pastaza'            ,	     'Mera',	'PA',	'ME');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Milagro',	'GY',	'MI');
INSERT INTO @tbl VALUES ('Carchi'            ,	     'Mira',	'CR',	'MI');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Mocache',	'LR',	'MC');
INSERT INTO @tbl VALUES ('Tungurahua'            ,	     'Mocha',	'TU',	'MO');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Montalvo',	'LR',	'MN');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Montecristi',	'MN',	'MO');
INSERT INTO @tbl VALUES ('Carchi'            ,	     'Montufar',	'CR',	'MO');
INSERT INTO @tbl VALUES ('Morona-Santiago'            ,	     'Morona',	'MS',	'MO');
INSERT INTO @tbl VALUES ('Esmeraldas'            ,	     'Muisne',	'ES',	'MU');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Nabon',	'AZ',	'NA');
INSERT INTO @tbl VALUES ('Zamora-Chinchipe'            ,	     'Nangaritza',	'ZC',	'NA');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Naranjal',	'GY',	'NL');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Naranjito',	'GY',	'NT');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Nobol',	'GY',	'NB');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Olmedo',	'LJ',	'OL');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Olmedo',	'MN',	'OL');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Ona',	'AZ',	'ON');
INSERT INTO @tbl VALUES ('Imbabura'            ,	     'Otavalo',	'IM',	'OT');
INSERT INTO @tbl VALUES ('Morona-Santiago'            ,	     'Pablo Sexto',	'MS',	'PS');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Pajan',	'MN',	'PA');
INSERT INTO @tbl VALUES ('Zamora-Chinchipe'            ,	     'Palanda',	'ZC',	'PA');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Palenque',	'LR',	'PA');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Palestina',	'GY',	'PA');
INSERT INTO @tbl VALUES ('Chimborazo'            ,	     'Pallatanga',	'CB',	'PA');
INSERT INTO @tbl VALUES ('Morona-Santiago'            ,	     'Palora',	'MS',	'PA');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Paltas',	'LJ',	'PA');
INSERT INTO @tbl VALUES ('Cotopaxi'            ,	     'Pangua',	'CT',	'PA');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Pasaje',	'EO',	'PA');
INSERT INTO @tbl VALUES ('Pastaza'            ,	     'Pastaza',	'PA',	'PA');
INSERT INTO @tbl VALUES ('Tungurahua'            ,	     'Patate',	'TU',	'PA');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Paute',	'AZ',	'PA');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Pedernales',	'MN',	'PE');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Pedro Carbo',	'GY',	'PC');
INSERT INTO @tbl VALUES ('Pichincha'            ,	     'Pedro Moncayo',	'PC',	'PM');
INSERT INTO @tbl VALUES ('Pichincha'            ,	     'Pedro Vicente Maldonado',	'PC',	'PV');
INSERT INTO @tbl VALUES ('Tungurahua'            ,	     'Pelileo',	'TU',	'PE');
INSERT INTO @tbl VALUES ('Chimborazo'            ,	     'Penipe',	'CB',	'PE');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Pichincha',	'MN',	'PI');
INSERT INTO @tbl VALUES ('Tungurahua'            ,	     'Pillaro',	'TU',	'PI');
INSERT INTO @tbl VALUES ('Imbabura'            ,	     'Pimampiro',	'IM',	'PI');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Pinas',	'EO',	'PI');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Pindal',	'LJ',	'PI');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Playas',	'GY',	'PL');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Portovelo',	'EO',	'PO');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Portoviejo',	'MN',	'PO');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Pucara',	'AZ',	'PU');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Pueblo Viejo',	'LR',	'PV');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Puerto Lopez',	'MN',	'PL');
INSERT INTO @tbl VALUES ('Pichincha'            ,	     'Puerto Quito',	'PC',	'PQ');
INSERT INTO @tbl VALUES ('Cotopaxi'            ,	     'Pujili',	'CT',	'PU');
INSERT INTO @tbl VALUES ('Sucumbios'            ,	     'Putumayo',	'SU',	'PU');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Puyango',	'LJ',	'PU');
INSERT INTO @tbl VALUES ('Tungurahua'            ,	     'Quero',	'TU',	'QU');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Quevedo',	'LR',	'QU');
INSERT INTO @tbl VALUES ('Napo'            ,	     'Quijos',	'NA',	'QU');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Quilanga',	'LJ',	'QU');
INSERT INTO @tbl VALUES ('Esmeraldas'            ,	     'Quininde',	'ES',	'QU');
INSERT INTO @tbl VALUES ('Pichincha'            ,	     'Quito',	'PC',	'QU');
INSERT INTO @tbl VALUES ('Chimborazo'            ,	     'Riobamba',	'CB',	'RI');
INSERT INTO @tbl VALUES ('Esmeraldas'            ,	     'Rio Verde',	'ES',	'RV');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Rocafuerte',	'MN',	'RO');
INSERT INTO @tbl VALUES ('Pichincha'            ,	     'Ruminahui',	'PC',	'RU');
INSERT INTO @tbl VALUES ('Cotopaxi'            ,	     'Salcedo',	'CT',	'SL');
INSERT INTO @tbl VALUES ('Santa Elena'            ,	     'Salinas',	'SE',	'SS');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Salitre',	'GY',	'ST');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Samborondon',	'GY',	'SM');
INSERT INTO @tbl VALUES ('Galapagos'            ,	     'San Cristobal',	'GA',	'SC');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'San Fernando',	'AZ',	'SF');
INSERT INTO @tbl VALUES ('Morona-Santiago'            ,	     'San Juan Bosco',	'MS',	'SJ');
INSERT INTO @tbl VALUES ('Esmeraldas'            ,	     'San Lorenzo',	'ES',	'SL');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'San Miguel',	'BO',	'SM');
INSERT INTO @tbl VALUES ('Pichincha'            ,	     'San Miguel de los Bancos',	'PC',	'SM');
INSERT INTO @tbl VALUES ('Imbabura'            ,	     'San Miguel de Urcuqui',	'IM',	'UR');
INSERT INTO @tbl VALUES ('Carchi'            ,	     'San Pedro de Huaca',	'CR',	'SP');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Santa Ana',	'MN',	'SA');
INSERT INTO @tbl VALUES ('Pastaza'            ,	     'Santa Clara',	'PA',	'SC');
INSERT INTO @tbl VALUES ('Galapagos'            ,	     'Santa Cruz',	'GA',	'SZ');
INSERT INTO @tbl VALUES ('Santa Elena'            ,	     'Santa Elena',	'SE',	'SE');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Santa Isabel',	'AZ',	'SI');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Santa Lucia',	'GY',	'SL');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Santa Rosa',	'EO',	'SR');
INSERT INTO @tbl VALUES ('Morona-Santiago'            ,	     'Santiago',	'MS',	'SA');
INSERT INTO @tbl VALUES ('Santo Domingo de los Tsachilas'            ,	     'Santo Domingo de los Tsachilas',	'SD',	'SD');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'San Vicente',	'MN',	'SV');
INSERT INTO @tbl VALUES ('Cotopaxi'            ,	     'Saquisili',	'CT',	'SQ');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Saraguro',	'LJ',	'SA');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Sevilla de Oro',	'AZ',	'SO');
INSERT INTO @tbl VALUES ('Sucumbios'            ,	     'Shushufindi',	'SU',	'SH');
INSERT INTO @tbl VALUES ('Cotopaxi'            ,	     'Sigchos',	'CT',	'SG');
INSERT INTO @tbl VALUES ('Azuay'            ,	     'Sigsig',	'AZ',	'SG');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Simon Bolivar',	'GY',	'SB');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Sozoranga',	'LJ',	'SO');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Sucre',	'MN',	'SU');
INSERT INTO @tbl VALUES ('Morona-Santiago'            ,	     'Sucua',	'MS',	'SU');
INSERT INTO @tbl VALUES ('Sucumbios'            ,	     'Sucumbios',	'SU',	'SU');
INSERT INTO @tbl VALUES ('Canar'            ,	     'Suscal',	'CN',	'SU');
INSERT INTO @tbl VALUES ('Morona-Santiago'            ,	     'Taisha',	'MS',	'TA');
INSERT INTO @tbl VALUES ('Napo'            ,	     'Tena',	'NA',	'TE');
INSERT INTO @tbl VALUES ('Tungurahua'            ,	     'Tisaleo',	'TU',	'TI');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Tosagua',	'MN',	'TO');
INSERT INTO @tbl VALUES ('Carchi'            ,	     'Tulcan',	'CR',	'TU');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Urdaneta',	'LR',	'UR');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Valencia',	'LR',	'VA');
INSERT INTO @tbl VALUES ('Manabi'            ,	     'Veinticuatro de Mayo',	'MN',	'VM');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Ventanas',	'LR',	'VE');
INSERT INTO @tbl VALUES ('Los Rios'            ,	     'Vinces',	'LR',	'VI');
INSERT INTO @tbl VALUES ('Zamora-Chinchipe'            ,	     'Yacuambi',	'ZC',	'YC');
INSERT INTO @tbl VALUES ('Guayas'            ,	     'Yaguachi',	'GY',	'YA');
INSERT INTO @tbl VALUES ('Zamora-Chinchipe'            ,	     'Yantzaza',	'ZC',	'YN');
INSERT INTO @tbl VALUES ('Zamora-Chinchipe'            ,	     'Zamora',	'ZC',	'ZA');
INSERT INTO @tbl VALUES ('Loja'            ,	     'Zapotillo',	'LJ',	'ZA');
INSERT INTO @tbl VALUES ('El Oro'            ,	     'Zaruma',	'EO',	'ZA');

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

