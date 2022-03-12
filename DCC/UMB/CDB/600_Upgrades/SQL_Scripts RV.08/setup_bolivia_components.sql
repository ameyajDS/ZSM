
/* ==================================================================================
    	Source File		:	setup_bolivia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Bolivia are set-up
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
WHERE	country_nm	=	'Bolivia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Bolivia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Department',
		level_2_address_component	=	'Province',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('La Paz'            ,	     'Abel Iturralde',	'LP',	'AI');
INSERT INTO @tbl VALUES ('Pando'            ,	     'Abuna',	'PA',	'AB');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Alonso de Ibanez',	'PO',	'AI');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Andres Ibanez',	'SC',	'AI');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Angel Sandoval',	'SC',	'AS');
INSERT INTO @tbl VALUES ('Tarija'            ,	     'Aniceto Arce',	'TR',	'AA');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Antonio Quijarro',	'PO',	'AQ');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Arani',	'CB',	'AR');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Aroma',	'LP',	'AR');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Arque',	'CB',	'AQ');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Atahuallpa',	'OR',	'AT');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Ayopaya',	'CB',	'AY');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Bautista Saavedra',	'LP',	'BS');
INSERT INTO @tbl VALUES ('Chuquisaca'            ,	     'Belisario Boeto',	'CQ',	'BB');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Bernardino Bilbao',	'PO',	'GB');
INSERT INTO @tbl VALUES ('Tarija'            ,	     'Burnet O''Connor',	'TR',	'OC');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Capinota',	'CB',	'CP');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Caranavi',	'LP',	'CR');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Carangas',	'OR',	'CR');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Carrasco',	'CB',	'CR');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Cercado',	'CB',	'CE');
INSERT INTO @tbl VALUES ('El Beni'            ,	     'Cercado',	'EB',	'CE');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Cercado',	'OR',	'CE');
INSERT INTO @tbl VALUES ('Tarija'            ,	     'Cercado',	'TR',	'CE');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Chapare',	'CB',	'CH');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Charcas',	'PO',	'CR');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Chayanta',	'PO',	'CY');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Chiquitos',	'SC',	'CQ');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Cordillera',	'SC',	'CR');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Cornelio Saavedra',	'PO',	'CS');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Daniel Campos',	'PO',	'DC');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Eduardo Avaroa',	'OR',	'AV');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Eliodoro Camacho',	'LP',	'CM');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Enrique Baldivieso',	'PO',	'EV');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Esteban Arce',	'CB',	'EA');
INSERT INTO @tbl VALUES ('Tarija'            ,	     'Eustaquio Mendez',	'TR',	'MD');
INSERT INTO @tbl VALUES ('Pando'            ,	     'Federico Roman',	'PA',	'GR');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Florida',	'SC',	'FL');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Franz Tamayo',	'LP',	'FT');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'German Busch',	'SC',	'GB');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'German Jordan',	'CB',	'GJ');
INSERT INTO @tbl VALUES ('Tarija'            ,	     'Gran Chaco',	'TR',	'GC');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Gualberto Villarroel',	'LP',	'GV');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Guarayos',	'SC',	'GR');
INSERT INTO @tbl VALUES ('Chuquisaca'            ,	     'Hernando Siles',	'CQ',	'HS');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Ichilo',	'SC',	'IC');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Ignacio Warnes',	'SC',	'WR');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Ingavi',	'LP',	'IG');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Inquisivi',	'LP',	'IQ');
INSERT INTO @tbl VALUES ('El Beni'            ,	     'Itenez',	'EB',	'IT');
INSERT INTO @tbl VALUES ('Chuquisaca'            ,	     'Jaime Zudanez',	'CQ',	'ZU');
INSERT INTO @tbl VALUES ('El Beni'            ,	     'Jose Ballivian',	'EB',	'GB');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Jose Manuel Pando',	'LP',	'GP');
INSERT INTO @tbl VALUES ('Tarija'            ,	     'Jose Maria Aviles',	'TR',	'AV');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Jose Maria Linares',	'PO',	'JL');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Jose Miguel de Velasco',	'SC',	'VL');
INSERT INTO @tbl VALUES ('Chuquisaca'            ,	     'Juana Azurduay de Padilla',	'CQ',	'AZ');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Ladislao Cabrera',	'OR',	'LC');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Larecaja',	'LP',	'LR');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Litoral',	'OR',	'LT');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Loayza',	'LP',	'LZ');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Los Andes',	'LP',	'LA');
INSERT INTO @tbl VALUES ('Chuquisaca'            ,	     'Luis Calvo',	'CQ',	'LC');
INSERT INTO @tbl VALUES ('Pando'            ,	     'Madre de Dios',	'PA',	'MD');
INSERT INTO @tbl VALUES ('El Beni'            ,	     'Mamore',	'EB',	'MM');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Manco Kapac',	'LP',	'MK');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Manuel Maria Caballero',	'SC',	'MC');
INSERT INTO @tbl VALUES ('Pando'            ,	     'Manuripi',	'PA',	'MN');
INSERT INTO @tbl VALUES ('El Beni'            ,	     'Marban',	'EB',	'MR');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Mizque',	'CB',	'MZ');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Modesto Omiste',	'PO',	'MO');
INSERT INTO @tbl VALUES ('El Beni'            ,	     'Moxos',	'EB',	'MX');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Munecas',	'LP',	'MN');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Narciso Campero',	'CB',	'CM');
INSERT INTO @tbl VALUES ('Pando'            ,	     'Nicolas Suarez',	'PA',	'NS');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Nor Carangas',	'OR',	'NC');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Nor Chichas',	'PO',	'NC');
INSERT INTO @tbl VALUES ('Chuquisaca'            ,	     'Nor Cinti',	'CQ',	'NC');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Nor Lipez',	'PO',	'NL');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Nor Yungas',	'LP',	'NY');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Nuflo de Chavez',	'SC',	'NC');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Obispo Santistevan',	'SC',	'OS');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Omasuyos',	'LP',	'OM');
INSERT INTO @tbl VALUES ('Chuquisaca'            ,	     'Oropeza',	'CQ',	'OR');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Pacajes',	'LP',	'PC');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Pantaleon Dalence',	'OR',	'PD');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Pedro Domingo Murillo',	'LP',	'MR');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Poopo',	'OR',	'PP');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Puerto de Mejillones',	'OR',	'MJ');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Punata',	'CB',	'PN');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Quillacollo',	'CB',	'QC');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Rafael Bustillo',	'PO',	'RB');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Sajama',	'OR',	'SJ');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'San Pedro de Totora',	'OR',	'ST');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Sara',	'SC',	'SG');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Saucari',	'OR',	'SA');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Sebastian Pagador',	'OR',	'SP');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Simon Bolivar',	'CB',	'BV');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Sud Carangas',	'OR',	'SC');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Sud Chichas',	'PO',	'SC');
INSERT INTO @tbl VALUES ('Chuquisaca'            ,	     'Sud Cinti',	'CQ',	'SC');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Sud Lipez',	'PO',	'SL');
INSERT INTO @tbl VALUES ('La Paz'            ,	     'Sud Yungas',	'LP',	'SY');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Tapacari',	'CB',	'TP');
INSERT INTO @tbl VALUES ('Cochabamba'            ,	     'Tiraque',	'CB',	'TR');
INSERT INTO @tbl VALUES ('Oruro'            ,	     'Tomas Barron',	'OR',	'TB');
INSERT INTO @tbl VALUES ('Potosi'            ,	     'Tomas Frias',	'PO',	'TF');
INSERT INTO @tbl VALUES ('Chuquisaca'            ,	     'Tomina',	'CQ',	'TM');
INSERT INTO @tbl VALUES ('El Beni'            ,	     'Vaca Diez',	'EB',	'VD');
INSERT INTO @tbl VALUES ('Santa Cruz'            ,	     'Vallegrande',	'SC',	'VG');
INSERT INTO @tbl VALUES ('El Beni'            ,	     'Yacuma',	'EB',	'YC');
INSERT INTO @tbl VALUES ('Chuquisaca'            ,	     'Yamparaez',	'CQ',	'YM');

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

