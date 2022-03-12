/* ==================================================================================
    Source File		:	setup_hong_kong_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Mon Sep 15 11:00 2014
	Module ID		:	CDB
	Last updated	:	Sep 15, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Hong Kong are set-up
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
WHERE	country_nm	=	'Hong Kong';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Hong Kong not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIqUE);

INSERT INTO @tbl VALUES ( 'Central and Western', 'CW')
INSERT INTO @tbl VALUES ( 'Eastern', 'EA')
INSERT INTO @tbl VALUES ( 'Southern', 'SO')
INSERT INTO @tbl VALUES ( 'Wan Chai', 'WC')
INSERT INTO @tbl VALUES ( 'Kowloon City', 'KC')
INSERT INTO @tbl VALUES ( 'Kwun Tong', 'KU')
INSERT INTO @tbl VALUES ( 'Sham Shui Po', 'SS')
INSERT INTO @tbl VALUES ( 'Wong Tai Sin', 'WT')
INSERT INTO @tbl VALUES ( 'Yau Tsim Mong', 'YT')
INSERT INTO @tbl VALUES ( 'Kwai Tsing', 'KI')
INSERT INTO @tbl VALUES ( 'North', 'NO')
INSERT INTO @tbl VALUES ( 'Sai Kung', 'SK')
INSERT INTO @tbl VALUES ( 'Sha Tin', 'ST')
INSERT INTO @tbl VALUES ( 'Tai Po', 'TP')
INSERT INTO @tbl VALUES ( 'Tsuen Wan', 'TW')
INSERT INTO @tbl VALUES ( 'Tuen Mun', 'TM')
INSERT INTO @tbl VALUES ( 'Yuen Long', 'YL')
INSERT INTO @tbl VALUES ( 'Islands District', 'IS')

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================


UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================


