
/* ==================================================================================
    	Source File		:	setup_san marino_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of San Marino are set-up
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
WHERE	country_nm	=	'San Marino';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country San Marino not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Municipality',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Acquaviva'            ,	     'AC');
INSERT INTO @tbl VALUES ('Borgo Maggiore'            ,	     'BM');
INSERT INTO @tbl VALUES ('Chiesanuova'            ,	     'CH');
INSERT INTO @tbl VALUES ('Domagnano'            ,	     'DO');
INSERT INTO @tbl VALUES ('Faetano'            ,	     'FA');
INSERT INTO @tbl VALUES ('Fiorentino'            ,	     'FI');
INSERT INTO @tbl VALUES ('Montegiardino'            ,	     'MG');
INSERT INTO @tbl VALUES ('San Marino'            ,	     'SM');
INSERT INTO @tbl VALUES ('Serravalle'            ,	     'SE');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
