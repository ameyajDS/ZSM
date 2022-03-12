
/* ==================================================================================
    	Source File		:	setup_guernsey_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Guernsey are set-up
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
WHERE	country_nm	=	'Guernsey';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Guernsey not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Parish',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Agana Heights'            ,	     'AH');
INSERT INTO @tbl VALUES ('Agat'            ,	     'AT');
INSERT INTO @tbl VALUES ('Asan'            ,	     'AS');
INSERT INTO @tbl VALUES ('Barrigada'            ,	     'BA');
INSERT INTO @tbl VALUES ('Chalan-Pago-Ordot'            ,	     'CP');
INSERT INTO @tbl VALUES ('Dededo'            ,	     'DD');
INSERT INTO @tbl VALUES ('Hagatna'            ,	     'AN');
INSERT INTO @tbl VALUES ('Inarajan'            ,	     'IN');
INSERT INTO @tbl VALUES ('Mangilao'            ,	     'MA');
INSERT INTO @tbl VALUES ('Merizo'            ,	     'ME');
INSERT INTO @tbl VALUES ('Mongmong-Toto-Maite'            ,	     'MT');
INSERT INTO @tbl VALUES ('Piti'            ,	     'PI');
INSERT INTO @tbl VALUES ('Santa Rita'            ,	     'SR');
INSERT INTO @tbl VALUES ('Sinajana'            ,	     'SJ');
INSERT INTO @tbl VALUES ('Talofofo'            ,	     'TF');
INSERT INTO @tbl VALUES ('Tamuning'            ,	     'TM');
INSERT INTO @tbl VALUES ('Umatac'            ,	     'UM');
INSERT INTO @tbl VALUES ('Yigo'            ,	     'YG');
INSERT INTO @tbl VALUES ('Yona'            ,	     'YN');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
