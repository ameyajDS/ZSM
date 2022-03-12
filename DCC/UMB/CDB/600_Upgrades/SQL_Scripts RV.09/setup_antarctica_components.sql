
/* ==================================================================================
    	Source File		:	setup_antarctica_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Antarctica are set-up
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
WHERE	country_nm	=	'Antarctica';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Antarctica not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Claim',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Unclaimed'            ,	     'NT');
INSERT INTO @tbl VALUES ('Chile Claim'            ,	     'CL');
INSERT INTO @tbl VALUES ('Chile/UK Claim'            ,	     'CU');
INSERT INTO @tbl VALUES ('Chile/UK/Argentina Claim'            ,	     'CA');
INSERT INTO @tbl VALUES ('Argentina/UK Claim'            ,	     'AK');
INSERT INTO @tbl VALUES ('United Kingdom Claim'            ,	     'UK');
INSERT INTO @tbl VALUES ('Norway Claim'            ,	     'NO');
INSERT INTO @tbl VALUES ('Australia Claim'            ,	     'AU');
INSERT INTO @tbl VALUES (''            ,	     '');
INSERT INTO @tbl VALUES ('France Claim'            ,	     'FR');
INSERT INTO @tbl VALUES ('New Zealand Claim'            ,	     'NZ');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
