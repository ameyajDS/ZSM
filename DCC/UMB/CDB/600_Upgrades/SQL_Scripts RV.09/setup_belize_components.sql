
/* ==================================================================================
    	Source File		:	setup_belize_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Belize are set-up
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
WHERE	country_nm	=	'Belize';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Belize not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'Subdivision',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Belize'            ,	     'Belize Rural',	'BZ',	'BR');
INSERT INTO @tbl VALUES ('Belize'            ,	     'Belize Urban',	'BZ',	'BU');
INSERT INTO @tbl VALUES ('Cayo'            ,	     'Cayo Rural',	'CY',	'CY');
INSERT INTO @tbl VALUES ('Cayo'            ,	     'Cayo Urban',	'CY',	'CU');
INSERT INTO @tbl VALUES ('Corozal'            ,	     'Corozal Rural',	'CZ',	'CZ');
INSERT INTO @tbl VALUES ('Corozal'            ,	     'Corozal Town',	'CZ',	'CT');
INSERT INTO @tbl VALUES ('Stann Creek'            ,	     'Dangriga',	'SC',	'DA');
INSERT INTO @tbl VALUES ('Orange Walk'            ,	     'Orange Walk Rural',	'OW',	'OR');
INSERT INTO @tbl VALUES ('Orange Walk'            ,	     'Orange Walk Town',	'OW',	'OT');
INSERT INTO @tbl VALUES ('Toledo'            ,	     'Punta Gorda',	'TO',	'PG');
INSERT INTO @tbl VALUES ('Stann Creek'            ,	     'Stann Creek Rural',	'SC',	'SC');
INSERT INTO @tbl VALUES ('Toledo'            ,	     'Toledo Rural',	'TO',	'TO');

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

