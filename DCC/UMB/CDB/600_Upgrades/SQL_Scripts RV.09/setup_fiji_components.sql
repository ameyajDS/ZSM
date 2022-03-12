
/* ==================================================================================
    	Source File		:	setup_fiji_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Fiji are set-up
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
WHERE	country_nm	=	'Fiji';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Fiji not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Division',
		level_2_address_component	=	'Province',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Western'            ,	     'Ba',	'WE',	'BA');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Bua',	'NO',	'BU');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Cakaudrove',	'NO',	'CK');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Kadavu',	'EA',	'KD');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Lau',	'EA',	'LU');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Lomaiviti',	'EA',	'LM');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Macuata',	'NO',	'MC');
INSERT INTO @tbl VALUES ('Western'            ,	     'Nadroga-Navosa',	'WE',	'NN');
INSERT INTO @tbl VALUES ('Central'            ,	     'Naitasiri',	'CE',	'NT');
INSERT INTO @tbl VALUES ('Central'            ,	     'Namosi',	'CE',	'NM');
INSERT INTO @tbl VALUES ('Western'            ,	     'Ra',	'WE',	'RA');
INSERT INTO @tbl VALUES ('Central'            ,	     'Rewa',	'CE',	'RW');
INSERT INTO @tbl VALUES ('Rotuma'            ,	     'Rotuma',	'RO',	'RT');
INSERT INTO @tbl VALUES ('Central'            ,	     'Serua',	'CE',	'SR');
INSERT INTO @tbl VALUES ('Central'            ,	     'Tailevu',	'CE',	'TL');

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

