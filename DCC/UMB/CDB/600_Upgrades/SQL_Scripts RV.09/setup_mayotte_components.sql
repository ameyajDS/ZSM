
/* ==================================================================================
    	Source File		:	setup_mayotte_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Mayotte are set-up
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
WHERE	country_nm	=	'Mayotte';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Mayotte not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Commune',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Commune'            ,	     'C');
INSERT INTO @tbl VALUES ('Acoua'            ,	     'AC');
INSERT INTO @tbl VALUES ('Bandraboua'            ,	     'BB');
INSERT INTO @tbl VALUES ('Bandrele'            ,	     'BL');
INSERT INTO @tbl VALUES ('Boueni'            ,	     'BO');
INSERT INTO @tbl VALUES ('Chiconi'            ,	     'CC');
INSERT INTO @tbl VALUES ('Chirongui'            ,	     'CR');
INSERT INTO @tbl VALUES ('Dembeni'            ,	     'DE');
INSERT INTO @tbl VALUES ('Dzaoudzi'            ,	     'DZ');
INSERT INTO @tbl VALUES ('Kani-Keli'            ,	     'KK');
INSERT INTO @tbl VALUES ('Koungou'            ,	     'KO');
INSERT INTO @tbl VALUES ('Mamoudzou'            ,	     'MA');
INSERT INTO @tbl VALUES ('Mtsamboro'            ,	     'MB');
INSERT INTO @tbl VALUES ('M''Tsangamouji'            ,	     'MJ');
INSERT INTO @tbl VALUES ('Ouangani'            ,	     'OU');
INSERT INTO @tbl VALUES ('Pamandzi'            ,	     'PA');
INSERT INTO @tbl VALUES ('Sada'            ,	     'SA');
INSERT INTO @tbl VALUES ('Tsingoni'            ,	     'TS');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
