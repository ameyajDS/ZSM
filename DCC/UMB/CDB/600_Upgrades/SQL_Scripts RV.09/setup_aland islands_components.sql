
/* ==================================================================================
    	Source File		:	setup_aland islands_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Aland Islands are set-up
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
WHERE	country_nm	=	'Aland Islands';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Aland Islands not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Municipality',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Brando'            ,	     'BR');
INSERT INTO @tbl VALUES ('Eckero'            ,	     'EC');
INSERT INTO @tbl VALUES ('Finstrom'            ,	     'FN');
INSERT INTO @tbl VALUES ('Foglo'            ,	     'FG');
INSERT INTO @tbl VALUES ('Geta'            ,	     'GT');
INSERT INTO @tbl VALUES ('Hammarland'            ,	     'HM');
INSERT INTO @tbl VALUES ('Jomala'            ,	     'JM');
INSERT INTO @tbl VALUES ('Kokar'            ,	     'KK');
INSERT INTO @tbl VALUES ('Kumlinge'            ,	     'KM');
INSERT INTO @tbl VALUES ('Lemland'            ,	     'LE');
INSERT INTO @tbl VALUES ('Lumparland'            ,	     'LU');
INSERT INTO @tbl VALUES ('Mariehamn'            ,	     'MH');
INSERT INTO @tbl VALUES ('Saltvik'            ,	     'SV');
INSERT INTO @tbl VALUES ('Sottunga'            ,	     'ST');
INSERT INTO @tbl VALUES ('Sund'            ,	     'SD');
INSERT INTO @tbl VALUES ('Vardo'            ,	     'VR');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
