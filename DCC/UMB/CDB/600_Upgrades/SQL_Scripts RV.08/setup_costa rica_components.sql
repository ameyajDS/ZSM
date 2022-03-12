
/* ==================================================================================
    	Source File		:	setup_costa rica_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Costa Rica are set-up
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
WHERE	country_nm	=	'Costa Rica';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Costa Rica not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Guanacaste'            ,	     'Abangares',	'GU',	'AB');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Acosta',	'SJ',	'AC');
INSERT INTO @tbl VALUES ('Puntarenas'            ,	     'Aguirre',	'PU',	'AG');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Alajuela',	'AL',	'AL');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Alajuelita',	'SJ',	'AL');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Alfaro Ruiz',	'AL',	'AR');
INSERT INTO @tbl VALUES ('Cartago'            ,	     'Alvarado',	'CA',	'AL');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Aserri',	'SJ',	'AS');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Atenas',	'AL',	'AT');
INSERT INTO @tbl VALUES ('Guanacaste'            ,	     'Bagaces',	'GU',	'BA');
INSERT INTO @tbl VALUES ('Heredia'            ,	     'Barva',	'HE',	'BA');
INSERT INTO @tbl VALUES ('Heredia'            ,	     'Belen',	'HE',	'BE');
INSERT INTO @tbl VALUES ('Puntarenas'            ,	     'Buenos Aires',	'PU',	'BA');
INSERT INTO @tbl VALUES ('Guanacaste'            ,	     'Canas',	'GU',	'CN');
INSERT INTO @tbl VALUES ('Guanacaste'            ,	     'Carrillo',	'GU',	'CR');
INSERT INTO @tbl VALUES ('Cartago'            ,	     'Cartago',	'CA',	'CA');
INSERT INTO @tbl VALUES ('Puntarenas'            ,	     'Corredores',	'PU',	'CO');
INSERT INTO @tbl VALUES ('Puntarenas'            ,	     'Coto Brus',	'PU',	'CB');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Curridabat',	'SJ',	'CU');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Desamparados',	'SJ',	'DE');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Dota',	'SJ',	'DO');
INSERT INTO @tbl VALUES ('Cartago'            ,	     'El Guarco',	'CA',	'EG');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Escazu',	'SJ',	'ES');
INSERT INTO @tbl VALUES ('Puntarenas'            ,	     'Esparza',	'PU',	'ES');
INSERT INTO @tbl VALUES ('Heredia'            ,	     'Flores',	'HE',	'FL');
INSERT INTO @tbl VALUES ('Puntarenas'            ,	     'Garabito',	'PU',	'GA');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Goicoechea',	'SJ',	'GO');
INSERT INTO @tbl VALUES ('Puntarenas'            ,	     'Golfito',	'PU',	'GO');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Grecia',	'AL',	'GR');
INSERT INTO @tbl VALUES ('Limon'            ,	     'Guacimo',	'LI',	'GU');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Guatuso',	'AL',	'GU');
INSERT INTO @tbl VALUES ('Heredia'            ,	     'Heredia',	'HE',	'HE');
INSERT INTO @tbl VALUES ('Guanacaste'            ,	     'Hojancha',	'GU',	'HO');
INSERT INTO @tbl VALUES ('Cartago'            ,	     'Jimenez',	'CA',	'JI');
INSERT INTO @tbl VALUES ('Guanacaste'            ,	     'La Cruz',	'GU',	'LC');
INSERT INTO @tbl VALUES ('Cartago'            ,	     'La Union',	'CA',	'LU');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Leon Cortes',	'SJ',	'LC');
INSERT INTO @tbl VALUES ('Guanacaste'            ,	     'Liberia',	'GU',	'LI');
INSERT INTO @tbl VALUES ('Limon'            ,	     'Limon',	'LI',	'LI');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Los Chiles',	'AL',	'LC');
INSERT INTO @tbl VALUES ('Limon'            ,	     'Matina',	'LI',	'MA');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Montes de Oca',	'SJ',	'MO');
INSERT INTO @tbl VALUES ('Puntarenas'            ,	     'Montes de Oro',	'PU',	'MO');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Mora',	'SJ',	'MR');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Moravia',	'SJ',	'MV');
INSERT INTO @tbl VALUES ('Guanacaste'            ,	     'Nandayure',	'GU',	'NA');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Naranjo',	'AL',	'NA');
INSERT INTO @tbl VALUES ('Guanacaste'            ,	     'Nicoya',	'GU',	'NI');
INSERT INTO @tbl VALUES ('Cartago'            ,	     'Oreamuno',	'CA',	'OR');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Orotina',	'AL',	'OR');
INSERT INTO @tbl VALUES ('Puntarenas'            ,	     'Osa',	'PU',	'OS');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Palmares',	'AL',	'PA');
INSERT INTO @tbl VALUES ('Cartago'            ,	     'Paraiso',	'CA',	'PA');
INSERT INTO @tbl VALUES ('Puntarenas'            ,	     'Parrita',	'PU',	'PA');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Perez Zeledon',	'SJ',	'PZ');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Poas',	'AL',	'PO');
INSERT INTO @tbl VALUES ('Limon'            ,	     'Pococi',	'LI',	'PO');
INSERT INTO @tbl VALUES ('Puntarenas'            ,	     'Puntarenas',	'PU',	'PU');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Puriscal',	'SJ',	'PU');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'San Carlos',	'AL',	'SC');
INSERT INTO @tbl VALUES ('Heredia'            ,	     'San Isidro',	'HE',	'SI');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'San Jose',	'SJ',	'SJ');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'San Mateo',	'AL',	'SM');
INSERT INTO @tbl VALUES ('Heredia'            ,	     'San Pablo',	'HE',	'SP');
INSERT INTO @tbl VALUES ('Heredia'            ,	     'San Rafael',	'HE',	'SR');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'San Ramon',	'AL',	'SR');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Santa Ana',	'SJ',	'SA');
INSERT INTO @tbl VALUES ('Heredia'            ,	     'Santa Barbara',	'HE',	'SB');
INSERT INTO @tbl VALUES ('Guanacaste'            ,	     'Santa Cruz',	'GU',	'SC');
INSERT INTO @tbl VALUES ('Heredia'            ,	     'Santo Domingo',	'HE',	'SD');
INSERT INTO @tbl VALUES ('Heredia'            ,	     'Sarapiqui',	'HE',	'SA');
INSERT INTO @tbl VALUES ('Limon'            ,	     'Siquirres',	'LI',	'SI');
INSERT INTO @tbl VALUES ('Limon'            ,	     'Talamanca',	'LI',	'TA');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Tarrazu',	'SJ',	'TA');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Tibas',	'SJ',	'TI');
INSERT INTO @tbl VALUES ('Guanacaste'            ,	     'Tilaran',	'GU',	'TI');
INSERT INTO @tbl VALUES ('Cartago'            ,	     'Turrialba',	'CA',	'TU');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Turrubares',	'SJ',	'TU');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Upala',	'AL',	'UP');
INSERT INTO @tbl VALUES ('Alajuela'            ,	     'Valverde Vega',	'AL',	'VV');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'Vazquez de Coronado',	'SJ',	'VC');

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

