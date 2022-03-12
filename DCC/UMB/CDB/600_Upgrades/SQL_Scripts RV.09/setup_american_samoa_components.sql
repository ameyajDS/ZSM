
/* ==================================================================================
    	Source File		:	setup_american_samoa_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of American_Samoa are set-up
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
WHERE	country_nm	=	'American Samoa';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country American Samoa not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'County',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Manu''a'            ,	     'Faleasao',	'MA',	'FA');
INSERT INTO @tbl VALUES ('Manu''a'            ,	     'Fitiuta',	'MA',	'FI');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Ituau',	'ET',	'IT');
INSERT INTO @tbl VALUES ('Western'            ,	     'Lealataua',	'WT',	'LL');
INSERT INTO @tbl VALUES ('Western'            ,	     'Leasina',	'WT',	'LS');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Ma''oputasi',	'ET',	'MA');
INSERT INTO @tbl VALUES ('Manu''a'            ,	     'Ofu',	'MA',	'OF');
INSERT INTO @tbl VALUES ('Manu''a'            ,	     'Olosega',	'MA',	'OL');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Sa''ole',	'ET',	'SA');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Sua',	'ET',	'SU');
INSERT INTO @tbl VALUES ('Unorganized'            ,	     'Swains',	'UU',	'SW');
INSERT INTO @tbl VALUES ('Manu''a'            ,	     'Ta''u',	'MA',	'TA');
INSERT INTO @tbl VALUES ('Western'            ,	     'Tualatai',	'WT',	'TI');
INSERT INTO @tbl VALUES ('Western'            ,	     'Tualauta',	'WT',	'TU');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Vaifanua',	'ET',	'VA');

SET NOCOUNT OFF

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	DISTINCT @country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================


INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl	t
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.level_1_address_component_nm	=	t.level_1_nm
				AND	l1.country_id					=	@country_id
				)

-- ======================================================================

UPDATE	l2
	SET	is_authentic	=	1
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================

