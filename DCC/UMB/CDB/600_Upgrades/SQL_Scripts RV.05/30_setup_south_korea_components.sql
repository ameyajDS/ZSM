/* ==================================================================================
    Source File		:	setup_south_korea_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Mon Sep 15 18:08 2014
	Module ID		:	CDB
	Last updated	:	Sep 15, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of South Korea are set-up
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
WHERE	country_nm	=	'South Korea';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country South Korea not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIqUE);

INSERT INTO @tbl VALUES ( 'Busan', 'PU')
INSERT INTO @tbl VALUES ( 'Chungcheongbuk-do', 'HB')
INSERT INTO @tbl VALUES ( 'Chungcheongnam-do', 'HN')
INSERT INTO @tbl VALUES ( 'Daegu', 'TG')
INSERT INTO @tbl VALUES ( 'Daejeon', 'TJ')
INSERT INTO @tbl VALUES ( 'Gangwon-do', 'KW')
INSERT INTO @tbl VALUES ( 'Gwangju', 'KJ')
INSERT INTO @tbl VALUES ( 'Gyeonggi-do', 'KG')
INSERT INTO @tbl VALUES ( 'Gyeongsangbuk-do', 'KB')
INSERT INTO @tbl VALUES ( 'Gyeongsangnam-do', 'KN')
INSERT INTO @tbl VALUES ( 'Incheon', 'IN')
INSERT INTO @tbl VALUES ( 'Jeju-do', 'CJ')
INSERT INTO @tbl VALUES ( 'Jeollabuk-do', 'CB')
INSERT INTO @tbl VALUES ( 'Jeollanam-do', 'CN')
INSERT INTO @tbl VALUES ( 'Sejong', 'SJ')
INSERT INTO @tbl VALUES ( 'Seoul', 'SO')
INSERT INTO @tbl VALUES ( 'Ulsan', 'UL')

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================


UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================


