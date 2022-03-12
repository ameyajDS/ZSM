
/* ==================================================================================
    	Source File		:	setup_armenia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Armenia are set-up
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
WHERE	country_nm	=	'Armenia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Armenia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Aragacot''n'            ,	     'AG');
INSERT INTO @tbl VALUES ('Ararat'            ,	     'AR');
INSERT INTO @tbl VALUES ('Armavir'            ,	     'AV');
INSERT INTO @tbl VALUES ('Erevan'            ,	     'ER');
INSERT INTO @tbl VALUES ('Gelark''unik'''            ,	     'GR');
INSERT INTO @tbl VALUES ('Kotayk'''            ,	     'KT');
INSERT INTO @tbl VALUES ('Lori'            ,	     'LO');
INSERT INTO @tbl VALUES ('Sirak'            ,	     'SH');
INSERT INTO @tbl VALUES ('Syunik'''            ,	     'SU');
INSERT INTO @tbl VALUES ('Tavus'            ,	     'TV');
INSERT INTO @tbl VALUES ('Vayoc''Jor'            ,	     'VD');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================
