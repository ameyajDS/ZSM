
/* ==================================================================================
    	Source File		:	setup_montenegro_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Montenegro are set-up
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
WHERE	country_nm	=	'Montenegro';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Montenegro not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Commune',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Andrijevica'            ,	     'AN');
INSERT INTO @tbl VALUES ('Bar'            ,	     'BA');
INSERT INTO @tbl VALUES ('Berane'            ,	     'BR');
INSERT INTO @tbl VALUES ('Bijelo Polje'            ,	     'BP');
INSERT INTO @tbl VALUES ('Budva'            ,	     'BU');
INSERT INTO @tbl VALUES ('Cetinje'            ,	     'CE');
INSERT INTO @tbl VALUES ('Danilovgrad'            ,	     'DA');
INSERT INTO @tbl VALUES ('Gusinje'            ,	     'GU');
INSERT INTO @tbl VALUES ('Herceg Novi'            ,	     'HN');
INSERT INTO @tbl VALUES ('Kolasin'            ,	     'KL');
INSERT INTO @tbl VALUES ('Kotor'            ,	     'KT');
INSERT INTO @tbl VALUES ('Mojkovac'            ,	     'MK');
INSERT INTO @tbl VALUES ('Niksic'            ,	     'NK');
INSERT INTO @tbl VALUES ('Petnjica'            ,	     'PT');
INSERT INTO @tbl VALUES ('Plav'            ,	     'PA');
INSERT INTO @tbl VALUES ('Pljevlja'            ,	     'PL');
INSERT INTO @tbl VALUES ('Pluzine'            ,	     'PU');
INSERT INTO @tbl VALUES ('Podgorica'            ,	     'PG');
INSERT INTO @tbl VALUES ('Rozaje'            ,	     'RO');
INSERT INTO @tbl VALUES ('Savnik'            ,	     'SA');
INSERT INTO @tbl VALUES ('Tivat'            ,	     'TI');
INSERT INTO @tbl VALUES ('Ulcinj'            ,	     'UL');
INSERT INTO @tbl VALUES ('Zabljak'            ,	     'ZA');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
