
/* ==================================================================================
    	Source File		:	setup_uruguay_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Uruguay are set-up
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
WHERE	country_nm	=	'Uruguay';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Uruguay not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Department',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Artigas'            ,	     'AR');
INSERT INTO @tbl VALUES ('Canelones'            ,	     'CA');
INSERT INTO @tbl VALUES ('Cerro Largo'            ,	     'CL');
INSERT INTO @tbl VALUES ('Colonia'            ,	     'CO');
INSERT INTO @tbl VALUES ('Durazno'            ,	     'DU');
INSERT INTO @tbl VALUES ('Flores'            ,	     'FS');
INSERT INTO @tbl VALUES ('Florida'            ,	     'FD');
INSERT INTO @tbl VALUES ('Lavalleja'            ,	     'LA');
INSERT INTO @tbl VALUES ('Maldonado'            ,	     'MA');
INSERT INTO @tbl VALUES ('Montevideo'            ,	     'MO');
INSERT INTO @tbl VALUES ('Paysandu'            ,	     'PA');
INSERT INTO @tbl VALUES ('Rio Negro'            ,	     'RN');
INSERT INTO @tbl VALUES ('Rivera'            ,	     'RV');
INSERT INTO @tbl VALUES ('Rocha'            ,	     'RO');
INSERT INTO @tbl VALUES ('Salto'            ,	     'SA');
INSERT INTO @tbl VALUES ('San Jose'            ,	     'SJ');
INSERT INTO @tbl VALUES ('Soriano'            ,	     'SO');
INSERT INTO @tbl VALUES ('Tacuarembo'            ,	     'TA');
INSERT INTO @tbl VALUES ('Treinta y Tres'            ,	     'TT');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================
