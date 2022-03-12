
/* ==================================================================================
    	Source File		:	setup_north korea_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of North Korea are set-up
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
WHERE	country_nm	=	'North Korea';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country North Korea not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Chagang-do'            ,	     'CH');
INSERT INTO @tbl VALUES ('Hamgyong-bukto'            ,	     'HG');
INSERT INTO @tbl VALUES ('Hamgyong-namdo'            ,	     'HN');
INSERT INTO @tbl VALUES ('Hwanghae-bukto'            ,	     'WK');
INSERT INTO @tbl VALUES ('Hwanghae-namdo'            ,	     'WN');
INSERT INTO @tbl VALUES ('Kangwon-do'            ,	     'KW');
INSERT INTO @tbl VALUES ('Najin Sonbong-si'            ,	     'NJ');
INSERT INTO @tbl VALUES ('P''yongan-bukto'            ,	     'PB');
INSERT INTO @tbl VALUES ('P''yongan-namdo'            ,	     'PM');
INSERT INTO @tbl VALUES ('P''yongyang-si'            ,	     'PY');
INSERT INTO @tbl VALUES ('Yanggang-do'            ,	     'YG');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================
