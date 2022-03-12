
/* ==================================================================================
    	Source File		:	setup_united states minor outlying islands_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of United States Minor Outlying Islands are set-up
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
WHERE	country_nm	=	'United States Minor Outlying Islands';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country United States Minor Outlying Islands not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Territory',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Baker Island'            ,	     'FQ');
INSERT INTO @tbl VALUES ('Howland Island'            ,	     'HQ');
INSERT INTO @tbl VALUES ('Jarvis Island'            ,	     'DQ');
INSERT INTO @tbl VALUES ('Johnston Atoll'            ,	     'JQ');
INSERT INTO @tbl VALUES ('Kingman Reef'            ,	     'KQ');
INSERT INTO @tbl VALUES ('Midway Islands'            ,	     'MQ');
INSERT INTO @tbl VALUES ('Navassa Island'            ,	     'BQ');
INSERT INTO @tbl VALUES ('Palmyra Atoll'            ,	     'LQ');
INSERT INTO @tbl VALUES ('Wake Island'            ,	     'WQ');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
