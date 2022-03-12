
/* ==================================================================================
    	Source File		:	setup_venezuela_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Venezuela are set-up
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
WHERE	country_nm	=	'Venezuela';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Venezuela not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'State',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Miranda'            ,	     'Acevedo',	'MI',	'AC');
INSERT INTO @tbl VALUES ('Apure'            ,	     'Achaguas',	'AP',	'AC');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Acosta',	'FA',	'AC');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Acosta',	'MO',	'AC');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Agua Blanca',	'PO',	'AB');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Aguasay',	'MO',	'AG');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Alberto Adriani',	'ME',	'AA');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Alberto Arvelo Torrealba',	'BA',	'AT');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Almirante Padilla',	'ZU',	'AP');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Alto Orinoco',	'AM',	'AO');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Anaco',	'AN',	'AN');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Andres Bello',	'ME',	'AB');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Andres Bello',	'MI',	'AB');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Andres Bello',	'TA',	'AB');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Andres Bello',	'TR',	'AB');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Andres Eloy Blanco',	'BA',	'AB');
INSERT INTO @tbl VALUES ('Lara'            ,	     'Andres Eloy Blanco',	'LA',	'AB');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Andres Eloy Blanco',	'SU',	'AB');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Andres Mata',	'SU',	'AM');
INSERT INTO @tbl VALUES ('Nueva Esparta'            ,	     'Antolin del Campo',	'NE',	'AC');
INSERT INTO @tbl VALUES ('Delta Amacuro'            ,	     'Antonio Diaz',	'DA',	'AD');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Antonio Jose de Sucre',	'BA',	'AS');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Antonio Pinto Salinas',	'ME',	'AS');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Antonio Romulo Costa',	'TA',	'AC');
INSERT INTO @tbl VALUES ('Cojedes'            ,	     'Anzoategui',	'CO',	'AN');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Aragua',	'AN',	'AR');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Araure',	'PO',	'AR');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Aricagua',	'ME',	'AR');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Arismendi',	'BA',	'AR');
INSERT INTO @tbl VALUES ('Nueva Esparta'            ,	     'Arismendi',	'NE',	'AR');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Arismendi',	'SU',	'AR');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Aristides Bastidas',	'YA',	'AB');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Arzobispo Chacon',	'ME',	'AC');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Atabapo',	'AM',	'AB');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Atures',	'AM',	'AR');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Autana',	'AM',	'AN');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Ayacucho',	'TA',	'AY');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Baralt',	'ZU',	'BA');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Barinas',	'BA',	'BA');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Baruta',	'MI',	'BA');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Bejuma',	'CA',	'BE');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Benitez',	'SU',	'BN');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Bermudez',	'SU',	'BR');
INSERT INTO @tbl VALUES ('Apure'            ,	     'Biruaca',	'AP',	'BI');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Bocono',	'TR',	'BC');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Bolivar',	'AR',	'BO');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Bolivar',	'BA',	'BO');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Bolivar',	'FA',	'BO');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Bolivar',	'MO',	'BO');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Bolivar',	'SU',	'BO');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Bolivar',	'TA',	'BO');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Bolivar',	'TR',	'BL');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Bolivar',	'YA',	'BO');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Brion',	'MI',	'BR');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Bruzual',	'YA',	'BR');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Buchivacoa',	'FA',	'BU');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Buroz',	'MI',	'BU');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Cabimas',	'ZU',	'CB');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Cacique Manaure',	'FA',	'CM');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Cajigal',	'SU',	'CJ');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Camaguan',	'GU',	'CA');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Camatagua',	'AR',	'CA');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Campo Elias',	'ME',	'CE');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Candelaria',	'TR',	'CN');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Caracciolo Parra Olmedo',	'ME',	'CO');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Carache',	'TR',	'CR');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Cardenal Quintero',	'ME',	'CQ');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Cardenas',	'TA',	'CA');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Caripe',	'MO',	'CA');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Carirubana',	'FA',	'CR');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Carlos Arvelo',	'CA',	'CA');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Caroni',	'BO',	'CA');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Carrizal',	'MI',	'CA');
INSERT INTO @tbl VALUES ('Delta Amacuro'            ,	     'Casacoima',	'DA',	'CA');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Catatumbo',	'ZU',	'CT');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Cedeno',	'BO',	'CE');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Cedeno',	'MO',	'CE');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Chacao',	'MI',	'CH');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Chaguaramas',	'GU',	'CH');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Cocorote',	'YA',	'CO');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Colina',	'FA',	'CL');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Colon',	'ZU',	'CO');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Cordoba',	'TA',	'CO');
INSERT INTO @tbl VALUES ('Lara'            ,	     'Crespo',	'LA',	'CR');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Cristobal Rojas',	'MI',	'CR');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Cruz Paredes',	'BA',	'CP');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Cruz Salmeron Acosta',	'SU',	'CA');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Dabajuro',	'FA',	'DA');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Democracia',	'FA',	'DE');
INSERT INTO @tbl VALUES ('Dependencias Federales'            ,	     'Dependencias Federales',	'DP',	'DP');
INSERT INTO @tbl VALUES ('Nueva Esparta'            ,	     'Diaz',	'NE',	'DI');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Diego Bautista Urbaneja',	'AN',	'DU');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Diego Ibarra',	'CA',	'DI');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'El Callao',	'BO',	'EC');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'El Hatillo',	'MI',	'EH');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'El Socorro',	'GU',	'ES');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Escuque',	'TR',	'ES');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Esteller',	'PO',	'ES');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Ezequiel Zamora',	'BA',	'EZ');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Ezequiel Zamora',	'MO',	'EZ');
INSERT INTO @tbl VALUES ('Cojedes'            ,	     'Falcon',	'CO',	'FA');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Falcon',	'FA',	'FA');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Federacion',	'FA',	'FE');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Fernandez Feo',	'TA',	'FF');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Fernando de Penalver',	'AN',	'FP');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Francisco del Carmen Carvajal',	'AN',	'FC');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Francisco de Miranda',	'AN',	'FM');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Francisco de Miranda',	'GU',	'FM');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Francisco de Miranda',	'TA',	'FM');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Francisco Javier Pulgar',	'ZU',	'FP');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Francisco Linares Alcantara',	'AR',	'FA');
INSERT INTO @tbl VALUES ('Nueva Esparta'            ,	     'Garcia',	'NE',	'GA');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Garcia de Hevia',	'TA',	'GH');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Girardot',	'AR',	'GI');
INSERT INTO @tbl VALUES ('Cojedes'            ,	     'Girardot',	'CO',	'GI');
INSERT INTO @tbl VALUES ('Nueva Esparta'            ,	     'Gomez',	'NE',	'GO');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Gran Sabana',	'BO',	'GS');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Guacara',	'CA',	'GU');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Guaicaipuro',	'MI',	'GU');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Guanare',	'PO',	'GE');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Guanarito',	'PO',	'GT');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Guanta',	'AN',	'GU');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Guaraque',	'ME',	'GU');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Guasimos',	'TA',	'GU');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Heres',	'BO',	'HE');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Independencia',	'AN',	'IN');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Independencia',	'MI',	'IN');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Independencia',	'TA',	'IN');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Independencia',	'YA',	'IN');
INSERT INTO @tbl VALUES ('Lara'            ,	     'Iribarren',	'LA',	'IR');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Jacura',	'FA',	'JA');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Jauregui',	'TA',	'JA');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Jesus Enrique Lossada',	'ZU',	'JL');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Jesus Maria Semprun',	'ZU',	'JS');
INSERT INTO @tbl VALUES ('Lara'            ,	     'Jimenez',	'LA',	'JI');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Jose Angel Lamas',	'AR',	'JL');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Jose Antonio Paez',	'YA',	'JP');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Jose Felipe Marquez Canizales',	'TR',	'JC');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Jose Felix Ribas',	'AR',	'JF');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Jose Felix Ribas',	'GU',	'JF');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Jose Gregorio Monagas',	'AN',	'JM');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Jose Maria Vargas',	'TA',	'JV');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Jose Rafael Revenga',	'AR',	'JR');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Jose Tadeo Monagas',	'GU',	'JT');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Juan Antonio Sotillo',	'AN',	'JS');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Juan German Roscio',	'GU',	'JR');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Juan Jose Mora',	'CA',	'JM');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Juan Manuel Cajigal',	'AN',	'JC');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Juan Vicente Campo Elias',	'TR',	'JE');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Julian Mellado',	'GU',	'JM');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Julio Cesar Salas',	'ME',	'JS');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Junin',	'TA',	'JU');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Justo Briceno',	'ME',	'JB');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'La Canada de Urdaneta',	'ZU',	'LU');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'La Ceiba',	'TR',	'LC');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Lagunillas',	'ZU',	'LA');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Lander',	'MI',	'LA');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Las Mercedes',	'GU',	'LM');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'La Trinidad',	'YA',	'LT');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Leonardo Infante',	'GU',	'LI');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Libertad',	'AN',	'LI');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Libertad',	'TA',	'LI');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Libertador',	'AR',	'LI');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Libertador',	'CA',	'LI');
INSERT INTO @tbl VALUES ('Distrito Capital'            ,	     'Libertador',	'DF',	'LI');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Libertador',	'ME',	'LI');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Libertador',	'MO',	'LI');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Libertador',	'SU',	'LI');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Libertador',	'TA',	'LR');
INSERT INTO @tbl VALUES ('Cojedes'            ,	     'Lima Blanco',	'CO',	'LB');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Lobatera',	'TA',	'LO');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Los Guayos',	'CA',	'LG');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Los Salias',	'MI',	'LS');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Los Taques',	'FA',	'LT');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Machiques de Perija',	'ZU',	'MP');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Manapiare',	'AM',	'MP');
INSERT INTO @tbl VALUES ('Nueva Esparta'            ,	     'Maneiro',	'NE',	'MN');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Manuel Ezequiel Bruzual',	'AN',	'MB');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Manuel Monge',	'YA',	'MM');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Mara',	'ZU',	'MA');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Maracaibo',	'ZU',	'MC');
INSERT INTO @tbl VALUES ('Nueva Esparta'            ,	     'Marcano',	'NE',	'MC');
INSERT INTO @tbl VALUES ('Nueva Esparta'            ,	     'Marino',	'NE',	'MA');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Marino',	'SU',	'MA');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Mario Briceno Iragorry',	'AR',	'MI');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Maroa',	'AM',	'MR');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Maturin',	'MO',	'MA');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Mauroa',	'FA',	'MU');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Mejia',	'SU',	'ME');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Michelena',	'TA',	'MI');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Miranda',	'CA',	'MI');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Miranda',	'FA',	'MD');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Miranda',	'ME',	'MI');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Miranda',	'TR',	'MI');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Miranda',	'ZU',	'MI');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Monsenor Iturriza',	'FA',	'MI');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Monsenor Jose Vicente de Unda',	'PO',	'MU');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Montalban',	'CA',	'MO');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Monte Carmelo',	'TR',	'MC');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Montes',	'SU',	'MO');
INSERT INTO @tbl VALUES ('Lara'            ,	     'Moran',	'LA',	'MO');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Motatan',	'TR',	'MO');
INSERT INTO @tbl VALUES ('Apure'            ,	     'Munoz',	'AP',	'MU');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Naguanagua',	'CA',	'NA');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Nirgua',	'YA',	'NI');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Obispo Ramos de Lora',	'ME',	'OL');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Obispos',	'BA',	'OB');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Ocumare de la Costa de Oro',	'AR',	'OC');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Ortiz',	'GU',	'OR');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Ospino',	'PO',	'OS');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Padre Noguera',	'ME',	'PN');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Padre Pedro Chien',	'BO',	'PC');
INSERT INTO @tbl VALUES ('Apure'            ,	     'Paez',	'AP',	'PA');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Paez',	'MI',	'PA');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Paez',	'PO',	'PZ');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Paez',	'ZU',	'PA');
INSERT INTO @tbl VALUES ('Lara'            ,	     'Palavecino',	'LA',	'PA');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Palmasola',	'FA',	'PA');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Pampan',	'TR',	'PA');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Pampanito',	'TR',	'PT');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Panamericano',	'TA',	'PA');
INSERT INTO @tbl VALUES ('Cojedes'            ,	     'Pao de San Juan Bautista',	'CO',	'EP');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Papelon',	'PO',	'PP');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Paz Castillo',	'MI',	'PC');
INSERT INTO @tbl VALUES ('Delta Amacuro'            ,	     'Pedernales',	'DA',	'PE');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Pedraza',	'BA',	'PE');
INSERT INTO @tbl VALUES ('Apure'            ,	     'Pedro Camejo',	'AP',	'PC');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Pedro Gual',	'MI',	'PG');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Pedro Maria Freites',	'AN',	'PF');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Pedro Maria Urena',	'TA',	'PU');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Pedro Zaraza',	'GU',	'PZ');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Pena',	'YA',	'PE');
INSERT INTO @tbl VALUES ('Nueva Esparta'            ,	     'Peninsula de Macanao',	'NE',	'PM');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Petit',	'FA',	'PE');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Piar',	'BO',	'PI');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Piar',	'MO',	'PI');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Piritu',	'AN',	'PI');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Piritu',	'FA',	'PI');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Plaza',	'MI',	'PL');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Pueblo Llano',	'ME',	'PL');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Puerto Cabello',	'CA',	'PC');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Punceres',	'MO',	'PU');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Rafael Rangel',	'TR',	'RR');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Rafael Urdaneta',	'TA',	'RU');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Rangel',	'ME',	'RA');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Raul Leoni',	'BO',	'RL');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Ribero',	'SU',	'RI');
INSERT INTO @tbl VALUES ('Cojedes'            ,	     'Ricaurte',	'CO',	'RI');
INSERT INTO @tbl VALUES ('Amazonas'            ,	     'Rio Negro',	'AM',	'RN');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Rivas Davila',	'ME',	'RD');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Rojas',	'BA',	'RO');
INSERT INTO @tbl VALUES ('Apure'            ,	     'Romulo Gallegos',	'AP',	'RG');
INSERT INTO @tbl VALUES ('Cojedes'            ,	     'Romulo Gallegos',	'CO',	'RG');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Rosario de Perija',	'ZU',	'RP');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Roscio',	'BO',	'RO');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Samuel Dario Maldonado',	'TA',	'SM');
INSERT INTO @tbl VALUES ('Cojedes'            ,	     'San Carlos',	'CO',	'SC');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'San Casimiro',	'AR',	'SC');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'San Cristobal',	'TA',	'SC');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'San Diego',	'CA',	'SD');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'San Felipe',	'YA',	'SF');
INSERT INTO @tbl VALUES ('Apure'            ,	     'San Fernando',	'AP',	'SF');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'San Francisco',	'FA',	'SF');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'San Francisco',	'ZU',	'SF');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'San Genaro de Boconoito',	'PO',	'SG');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'San Geronimo de Guayabal',	'GU',	'SG');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'San Joaquin',	'CA',	'SJ');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'San Jose de Guanipa',	'AN',	'SG');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'San Jose de Guaribe',	'GU',	'SJ');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'San Juan de Capistrano',	'AN',	'SC');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'San Judas Tadeo',	'TA',	'SJ');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'San Rafael de Carvajal',	'TR',	'SR');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'San Rafael de Onoto',	'PO',	'SO');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'San Sebastian',	'AR',	'SS');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Santa Ana',	'AN',	'SA');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Santa Barbara',	'MO',	'SB');
INSERT INTO @tbl VALUES ('Guarico'            ,	     'Santa Maria de Ipire',	'GU',	'SM');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Santa Rita',	'ZU',	'SR');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Santa Rosalia',	'PO',	'SR');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Santiago Marino',	'AR',	'SM');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Santos Marquina',	'ME',	'SM');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Santos Michelena',	'AR',	'SA');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Seboruco',	'TA',	'SE');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Sifontes',	'BO',	'SI');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Silva',	'FA',	'SI');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Simon Bolivar',	'AN',	'SB');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Simon Bolivar',	'MI',	'SB');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Simon Bolivar',	'ZU',	'SB');
INSERT INTO @tbl VALUES ('Lara'            ,	     'Simon Planas',	'LA',	'SP');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Simon Rodriguez',	'AN',	'SR');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Simon Rodriguez',	'TA',	'SR');
INSERT INTO @tbl VALUES ('Anzoategui'            ,	     'Sir Artur McGregor',	'AN',	'AM');
INSERT INTO @tbl VALUES ('Barinas'            ,	     'Sosa',	'BA',	'SO');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Sotillo',	'MO',	'SO');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Sucre',	'AR',	'SU');
INSERT INTO @tbl VALUES ('Bolivar'            ,	     'Sucre',	'BO',	'SU');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Sucre',	'FA',	'SU');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Sucre',	'ME',	'SU');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Sucre',	'MI',	'SU');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Sucre',	'PO',	'SU');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Sucre',	'SU',	'SU');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Sucre',	'TA',	'SU');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Sucre',	'TR',	'SU');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Sucre',	'YA',	'SU');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Sucre',	'ZU',	'SU');
INSERT INTO @tbl VALUES ('Cojedes'            ,	     'Tinaco',	'CO',	'TI');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Tocopero',	'FA',	'TO');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Torbes',	'TA',	'TO');
INSERT INTO @tbl VALUES ('Lara'            ,	     'Torres',	'LA',	'TO');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Tovar',	'AR',	'TO');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Tovar',	'ME',	'TO');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Trujillo',	'TR',	'TR');
INSERT INTO @tbl VALUES ('Nueva Esparta'            ,	     'Tubores',	'NE',	'TU');
INSERT INTO @tbl VALUES ('Delta Amacuro'            ,	     'Tucupita',	'DA',	'TU');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Tulio Febres Cordero',	'ME',	'TC');
INSERT INTO @tbl VALUES ('Portuguesa'            ,	     'Turen',	'PO',	'TU');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Union',	'FA',	'UN');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Urachiche',	'YA',	'UR');
INSERT INTO @tbl VALUES ('Monagas'            ,	     'Uracoa',	'MO',	'UR');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Urdaneta',	'AR',	'UR');
INSERT INTO @tbl VALUES ('Lara'            ,	     'Urdaneta',	'LA',	'UR');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Urdaneta',	'MI',	'UR');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Urdaneta',	'TR',	'UR');
INSERT INTO @tbl VALUES ('Tachira'            ,	     'Uribante',	'TA',	'UR');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Urumaco',	'FA',	'UR');
INSERT INTO @tbl VALUES ('Sucre'            ,	     'Valdez',	'SU',	'VA');
INSERT INTO @tbl VALUES ('Carabobo'            ,	     'Valencia',	'CA',	'VA');
INSERT INTO @tbl VALUES ('Trujillo'            ,	     'Valera',	'TR',	'VA');
INSERT INTO @tbl VALUES ('Zulia'            ,	     'Valmore Rodriguez',	'ZU',	'VR');
INSERT INTO @tbl VALUES ('Vargas'            ,	     'Vargas',	'VA',	'VA');
INSERT INTO @tbl VALUES ('Yaracuy'            ,	     'Veroes',	'YA',	'VE');
INSERT INTO @tbl VALUES ('Nueva Esparta'            ,	     'Villalba',	'NE',	'VI');
INSERT INTO @tbl VALUES ('Aragua'            ,	     'Zamora',	'AR',	'ZA');
INSERT INTO @tbl VALUES ('Falcon'            ,	     'Zamora',	'FA',	'ZA');
INSERT INTO @tbl VALUES ('Miranda'            ,	     'Zamora',	'MI',	'ZA');
INSERT INTO @tbl VALUES ('Merida'            ,	     'Zea',	'ME',	'ZE');

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

