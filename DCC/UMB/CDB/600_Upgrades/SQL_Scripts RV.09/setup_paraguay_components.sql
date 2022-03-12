
/* ==================================================================================
    	Source File		:	setup_paraguay_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Paraguay are set-up
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
WHERE	country_nm	=	'Paraguay';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Paraguay not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Department',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Caazapa'            ,	     'Abai',	'CZ',	'AB');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Acahay',	'PG',	'AC');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Alberdi',	'NE',	'AL');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Altos',	'CR',	'AL');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Alto Vera',	'IT',	'AV');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Antequera',	'SP',	'AN');
INSERT INTO @tbl VALUES ('Central'            ,	     'Aregua',	'CE',	'AR');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Arroyos y Esteros',	'CR',	'AE');
INSERT INTO @tbl VALUES ('Asuncion'            ,	     'Asuncion',	'AS',	'AS');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Atyra',	'CR',	'AT');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Ayolas',	'MI',	'AY');
INSERT INTO @tbl VALUES ('Concepcion'            ,	     'Belen',	'CN',	'BE');
INSERT INTO @tbl VALUES ('Amambay'            ,	     'Bella Vista',	'AM',	'BV');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Bella Vista',	'IT',	'BV');
INSERT INTO @tbl VALUES ('Presidente Hayes'            ,	     'Benjamin Aceval',	'PH',	'BA');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Borja',	'GU',	'BO');
INSERT INTO @tbl VALUES ('Caazapa'            ,	     'Buena Vista',	'CZ',	'BV');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Caacupe',	'CR',	'CC');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Caaguazu',	'CG',	'CG');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Caapucu',	'PG',	'CP');
INSERT INTO @tbl VALUES ('Caazapa'            ,	     'Caazapa',	'CZ',	'CA');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Cambyreta',	'IT',	'CA');
INSERT INTO @tbl VALUES ('Central'            ,	     'Capiata',	'CE',	'CA');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Capiibary',	'SP',	'CA');
INSERT INTO @tbl VALUES ('Amambay'            ,	     'Capitan Bado',	'AM',	'CB');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Capitan Mauricio Jose Troche',	'GU',	'CT');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Capitan Meza',	'IT',	'CZ');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Capitan Miranda',	'IT',	'CM');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Caraguatay',	'CR',	'CR');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Carapegua',	'PG',	'CR');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Carayao',	'CG',	'CR');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Carlos Antonio Lopez',	'IT',	'CL');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Carmen del Parana',	'IT',	'CP');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Cerrito',	'NE',	'CE');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Chore',	'SP',	'CH');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Ciudad del Este',	'AA',	'CE');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Colonia Independencia',	'GU',	'IN');
INSERT INTO @tbl VALUES ('Concepcion'            ,	     'Concepcion',	'CN',	'CO');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Coronel Bogado',	'IT',	'CB');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Coronel Martinez',	'GU',	'CM');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Coronel Oviedo',	'CG',	'CO');
INSERT INTO @tbl VALUES ('Canindeyu'            ,	     'Corpus Christi',	'CY',	'CC');
INSERT INTO @tbl VALUES ('Canindeyu'            ,	     'Curuguaty',	'CY',	'VC');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Desmochados',	'NE',	'DE');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Doctor Botrell',	'GU',	'DB');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Doctor Cecilio Baez',	'CG',	'DB');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Doctor J. Eulogio Estigarribia',	'CG',	'DE');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Doctor Juan Leon Mallorquin',	'AA',	'DM');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Doctor Juan Manuel Frutos',	'CG',	'DF');
INSERT INTO @tbl VALUES ('Caazapa'            ,	     'Doctor Moises S. Bertoni',	'CZ',	'DB');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Domingo Martinez de Irala',	'AA',	'DI');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Edelira',	'IT',	'ED');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Emboscada',	'CR',	'EM');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Encarnacion',	'IT',	'EN');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Escobar',	'PG',	'ES');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Eusebio Ayala',	'CR',	'EU');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Felix Perez Cardozo',	'GU',	'FC');
INSERT INTO @tbl VALUES ('Central'            ,	     'Fernando de la Mora',	'CE',	'FM');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Fram',	'IT',	'FR');
INSERT INTO @tbl VALUES ('Alto Paraguay'            ,	     'Fuerte Olimpo',	'AG',	'FO');
INSERT INTO @tbl VALUES ('Caazapa'            ,	     'Fulgencio Yegros',	'CZ',	'FY');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'General Artigas',	'IT',	'GA');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'General Bernardino Caballero',	'PG',	'GC');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'General Delgado',	'IT',	'GD');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'General Elizardo Aquino',	'SP',	'GA');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'General Eugenio A. Garay',	'GU',	'GG');
INSERT INTO @tbl VALUES ('Canindeyu'            ,	     'General Francisco Caballero Alvarez',	'CY',	'GA');
INSERT INTO @tbl VALUES ('Caazapa'            ,	     'General Higinio Morinigo',	'CZ',	'GM');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'General Isidoro Resquin',	'SP',	'GR');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'General Jose Eduvigis Diaz',	'NE',	'GD');
INSERT INTO @tbl VALUES ('Central'            ,	     'Guarambare',	'CE',	'GU');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Guayaibi',	'SP',	'GU');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Guazu Cua',	'NE',	'GC');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Hernandarias',	'AA',	'HE');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Hohenau',	'IT',	'HO');
INSERT INTO @tbl VALUES ('Concepcion'            ,	     'Horqueta',	'CN',	'HO');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Humaita',	'NE',	'HU');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Iruna',	'AA',	'IR');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Isla Pucu',	'CR',	'IS');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Isla Umbu',	'NE',	'IU');
INSERT INTO @tbl VALUES ('Central'            ,	     'Ita',	'CE',	'IT');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Itacurubi de la Cordillera',	'CR',	'IC');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Itacurubi del Rosario',	'SP',	'IR');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Itakyry',	'AA',	'IT');
INSERT INTO @tbl VALUES ('Canindeyu'            ,	     'Itanara',	'CY',	'IT');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Itape',	'GU',	'IP');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Itapua Poty',	'IT',	'IP');
INSERT INTO @tbl VALUES ('Central'            ,	     'Itaugua',	'CE',	'IG');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Iturbe',	'GU',	'IB');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Jesus',	'IT',	'JE');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Jose A. Fassardi',	'GU',	'JF');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Jose Domingo Ocampos',	'CG',	'JO');
INSERT INTO @tbl VALUES ('Presidente Hayes'            ,	     'Jose Falcon',	'PH',	'JF');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Jose Leandro Oviedo',	'IT',	'JO');
INSERT INTO @tbl VALUES ('Central'            ,	     'Juan Augusto Saldivar',	'CE',	'JS');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Juan de Mena',	'CR',	'JM');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Juan Emilio O''Leary',	'AA',	'JO');
INSERT INTO @tbl VALUES ('Canindeyu'            ,	     'Katuete',	'CY',	'KA');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'La Colmena',	'PG',	'LC');
INSERT INTO @tbl VALUES ('Central'            ,	     'Lambare',	'CE',	'LA');
INSERT INTO @tbl VALUES ('Canindeyu'            ,	     'La Paloma',	'CY',	'LP');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'La Pastora',	'CG',	'LP');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'La Paz',	'IT',	'LP');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Laureles',	'NE',	'LA');
INSERT INTO @tbl VALUES ('Alto Paraguay'            ,	     'La Victoria',	'AG',	'LV');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Lima',	'SP',	'LI');
INSERT INTO @tbl VALUES ('Central'            ,	     'Limpio',	'CE',	'LI');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Loma Grande',	'CR',	'LG');
INSERT INTO @tbl VALUES ('Concepcion'            ,	     'Loreto',	'CN',	'LO');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Los Cedrales',	'AA',	'LC');
INSERT INTO @tbl VALUES ('Central'            ,	     'Luque',	'CE',	'LU');
INSERT INTO @tbl VALUES ('Caazapa'            ,	     'Maciel',	'CZ',	'MA');
INSERT INTO @tbl VALUES ('Central'            ,	     'Mariano Roque Alonso',	'CE',	'MA');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Mariscal Francisco Solano Lopez',	'CG',	'ML');
INSERT INTO @tbl VALUES ('Boqueron'            ,	     'Mariscal Jose Felix Estigarribia',	'BQ',	'ME');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Mayor Jose J. Martinez',	'NE',	'MM');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Mayor Julio D. Otano',	'IT',	'MO');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Mbaracayu',	'AA',	'MB');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Mbocayaty del Guaira',	'GU',	'MG');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Mbocayaty del Yhaguy',	'CR',	'MY');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Mbuyapey',	'PG',	'MB');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Minga Guazu',	'AA',	'MG');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Minga Pora',	'AA',	'MP');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Nacunday',	'AA',	'NC');
INSERT INTO @tbl VALUES ('Presidente Hayes'            ,	     'Nanawa',	'PH',	'NA');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Naranjal',	'AA',	'NR');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Natalicio Talavera',	'GU',	'NT');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Natalio',	'IT',	'NT');
INSERT INTO @tbl VALUES ('Central'            ,	     'Nemby',	'CE',	'NE');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Nueva Alborada',	'IT',	'NA');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Nueva Colombia',	'CR',	'NC');
INSERT INTO @tbl VALUES ('Canindeyu'            ,	     'Nueva Esperanza',	'CY',	'NE');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Nueva Germania',	'SP',	'NG');
INSERT INTO @tbl VALUES ('Central'            ,	     'Nueva Italia',	'CE',	'NI');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Nueva Londres',	'CG',	'NL');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Numi',	'GU',	'NU');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Obligado',	'IT',	'OB');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Paraguari',	'PG',	'PA');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Paso de Patria',	'NE',	'PP');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Paso Yobai',	'GU',	'PY');
INSERT INTO @tbl VALUES ('Amambay'            ,	     'Pedro Juan Caballero',	'AM',	'PC');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Pilar',	'NE',	'PI');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Pirapo',	'IT',	'PI');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Pirayu',	'PG',	'PI');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Piribebuy',	'CR',	'PI');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Presidente Franco',	'AA',	'PF');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Primero de Marzo',	'CR',	'PM');
INSERT INTO @tbl VALUES ('Presidente Hayes'            ,	     'Puerto Pinasco',	'PH',	'PP');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Quiindy',	'PG',	'QI');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Quyquyho',	'PG',	'QQ');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Raul Arsenio Oviedo',	'CG',	'RO');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'R.I. 3 Corrales',	'CG',	'TC');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Repatriacion',	'CG',	'RE');
INSERT INTO @tbl VALUES ('Canindeyu'            ,	     'Salto del Guaira',	'CY',	'SG');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'San Alberto',	'AA',	'SA');
INSERT INTO @tbl VALUES ('Central'            ,	     'San Antonio',	'CE',	'SA');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'San Bernardino',	'CR',	'SB');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'San Cosme y Damian',	'IT',	'SC');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'San Cristobal',	'AA',	'SC');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'San Estanislao',	'SP',	'SE');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'San Ignacio',	'MI',	'SI');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'San Joaquin',	'CG',	'SJ');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'San Jose de los Arroyos',	'CG',	'SA');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'San Jose Obrero',	'CR',	'SO');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'San Juan Bautista de las Misiones',	'MI',	'SJ');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'San Juan Bautista de Neembucu',	'NE',	'SN');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'San Juan del Parana',	'IT',	'SJ');
INSERT INTO @tbl VALUES ('Caazapa'            ,	     'San Juan Nepomuceno',	'CZ',	'SN');
INSERT INTO @tbl VALUES ('Concepcion'            ,	     'San Lazaro',	'CN',	'SL');
INSERT INTO @tbl VALUES ('Central'            ,	     'San Lorenzo',	'CE',	'SL');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'San Miguel',	'MI',	'SG');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'San Pablo',	'SP',	'SP');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'San Patricio',	'MI',	'SP');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'San Pedro del Parana',	'IT',	'SP');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'San Pedro del Ycuamandiyu',	'SP',	'SY');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'San Rafael del Parana',	'IT',	'SR');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'San Roque Gonzalez de Santa Cruz',	'PG',	'SG');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'San Salvador',	'GU',	'SS');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Santa Elena',	'CR',	'SE');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Santa Maria',	'MI',	'SM');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Santa Rita',	'AA',	'SR');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Santa Rosa',	'MI',	'SR');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Santa Rosa del Aguaray',	'SP',	'SR');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Santa Rosa del Mbutuy',	'CG',	'SM');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Santa Rosa del Monday',	'AA',	'SM');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Santiago',	'MI',	'SA');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Sapucai',	'PG',	'SA');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Simon Bolivar',	'CG',	'SB');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Tacuaras',	'NE',	'TA');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Tacuati',	'SP',	'TA');
INSERT INTO @tbl VALUES ('Caazapa'            ,	     'Tavai',	'CZ',	'TA');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Tebicuarymi',	'PG',	'TE');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Tobati',	'CR',	'TO');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Tomas Romero Pereira',	'IT',	'TP');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     '3 de Febrero',	'CG',	'TF');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Trinidad',	'IT',	'TR');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Union',	'SP',	'UN');
INSERT INTO @tbl VALUES ('Cordillera'            ,	     'Valenzuela',	'CR',	'VA');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Vaqueria (San Blas)',	'CG',	'VA');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     '25 de Diciembre',	'SP',	'VD');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Villa del Rosario',	'SP',	'VR');
INSERT INTO @tbl VALUES ('Central'            ,	     'Villa Elisa',	'CE',	'VE');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Villa Florida',	'MI',	'VF');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Villa Franca',	'NE',	'VF');
INSERT INTO @tbl VALUES ('Presidente Hayes'            ,	     'Villa Hayes',	'PH',	'VH');
INSERT INTO @tbl VALUES ('Canindeyu'            ,	     'Villa Igatimi',	'CY',	'VY');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Villalbin',	'NE',	'VI');
INSERT INTO @tbl VALUES ('Neembucu'            ,	     'Villa Oliva',	'NE',	'VO');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Villarrica',	'GU',	'VI');
INSERT INTO @tbl VALUES ('Central'            ,	     'Villeta',	'CE',	'VI');
INSERT INTO @tbl VALUES ('Misiones'            ,	     'Yabebyry',	'MI',	'YA');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Yaguaron',	'PG',	'YA');
INSERT INTO @tbl VALUES ('Guaira'            ,	     'Yataity del Guaira',	'GU',	'YG');
INSERT INTO @tbl VALUES ('San Pedro'            ,	     'Yataity del Norte',	'SP',	'YN');
INSERT INTO @tbl VALUES ('Itapua'            ,	     'Yatytay',	'IT',	'YA');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Ybycui',	'PG',	'YC');
INSERT INTO @tbl VALUES ('Paraguari'            ,	     'Ybytimi',	'PG',	'YT');
INSERT INTO @tbl VALUES ('Concepcion'            ,	     'Yby Ya''u',	'CN',	'YY');
INSERT INTO @tbl VALUES ('Alto Parana'            ,	     'Yguazu',	'AA',	'YG');
INSERT INTO @tbl VALUES ('Caaguazu'            ,	     'Yhu',	'CG',	'YH');
INSERT INTO @tbl VALUES ('Central'            ,	     'Ypacarai',	'CE',	'YC');
INSERT INTO @tbl VALUES ('Central'            ,	     'Ypane',	'CE',	'YN');
INSERT INTO @tbl VALUES ('Canindeyu'            ,	     'Ypejhu',	'CY',	'YP');
INSERT INTO @tbl VALUES ('Caazapa'            ,	     'Yuty',	'CZ',	'YU');

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

