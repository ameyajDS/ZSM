
/* ==================================================================================
    	Source File		:	setup_malta_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Malta are set-up
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
WHERE	country_nm	=	'Malta';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Malta not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Locality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Central'            ,	     'Attard',	'CE',	'AT');
INSERT INTO @tbl VALUES ('Central'            ,	     'Balzan',	'CE',	'BA');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Birgu',	'SE',	'BR');
INSERT INTO @tbl VALUES ('Central'            ,	     'Birkirkara',	'CE',	'BI');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Birzebbugia',	'SO',	'BZ');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Bormla',	'SE',	'BO');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Dingli',	'NO',	'DI');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Fgura',	'SE',	'FG');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Floriana',	'SE',	'FL');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Fontana',	'GO',	'FO');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Ghajnsielem',	'GO',	'GJ');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Gharb',	'GO',	'GB');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Gharghur',	'NO',	'GH');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Ghasri',	'GO',	'GS');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Ghaxaq',	'SO',	'GH');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Gudja',	'SO',	'GU');
INSERT INTO @tbl VALUES ('Central'            ,	     'Gzira',	'CE',	'GZ');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Hamrun',	'SO',	'HA');
INSERT INTO @tbl VALUES ('Central'            ,	     'Iklin',	'CE',	'IK');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Isla',	'SE',	'IS');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Kalkara',	'SE',	'KA');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Kercem',	'GO',	'KE');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Kirkop',	'SO',	'KI');
INSERT INTO @tbl VALUES ('Central'            ,	     'Lija',	'CE',	'LI');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Luqa',	'SO',	'LU');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Marsa',	'SE',	'MX');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Marsascala',	'SE',	'MS');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Marsaxlokk',	'SE',	'MA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Mdina',	'NO',	'MD');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Mellieha',	'NO',	'ME');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Mgarr',	'NO',	'MG');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Mosta',	'NO',	'MO');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Mqabba',	'SO',	'MQ');
INSERT INTO @tbl VALUES ('Central'            ,	     'Msida',	'CE',	'MS');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Mtarfa',	'NO',	'MT');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Munxar',	'GO',	'MU');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Nadur',	'GO',	'NA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Naxxar',	'NO',	'NA');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Paola',	'SE',	'PA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Pembroke',	'NO',	'PE');
INSERT INTO @tbl VALUES ('Central'            ,	     'Pieta',	'CE',	'PI');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Qala',	'GO',	'QA');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Qormi',	'SO',	'QO');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Qrendi',	'SO',	'QR');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Rabat (Gozo)',	'GO',	'RA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Rabat (Malta)',	'NO',	'RA');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Safi',	'SO',	'SA');
INSERT INTO @tbl VALUES ('Central'            ,	     'San Giljan',	'CE',	'SG');
INSERT INTO @tbl VALUES ('Central'            ,	     'San Gwann',	'CE',	'SN');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'San Lawrenz',	'GO',	'SL');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Sannat',	'GO',	'SA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'San Pawl il-Bahar',	'NO',	'SP');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Santa Lucija',	'SO',	'SL');
INSERT INTO @tbl VALUES ('Central'            ,	     'Santa Venera',	'CE',	'SV');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Siggiewi',	'SO',	'SI');
INSERT INTO @tbl VALUES ('Central'            ,	     'Sliema',	'CE',	'SL');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Swieqi',	'NO',	'SW');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Tarxien',	'SE',	'TA');
INSERT INTO @tbl VALUES ('Central'            ,	     'Ta'' Xbiex',	'CE',	'TA');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Valletta',	'SE',	'VA');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Xaghra',	'GO',	'XA');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Xewkija',	'GO',	'XE');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Xghajra',	'SE',	'XG');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Zabbar',	'SE',	'ZA');
INSERT INTO @tbl VALUES ('Gozo'            ,	     'Zebbug (Gozo)',	'GO',	'ZE');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Zebbug (Malta)',	'SO',	'ZB');
INSERT INTO @tbl VALUES ('South Eastern'            ,	     'Zejtun',	'SE',	'ZJ');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Zurrieq',	'SO',	'ZU');

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

