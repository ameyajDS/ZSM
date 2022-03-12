
/* ==================================================================================
    	Source File		:	setup_israel_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Israel are set-up
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
WHERE	country_nm	=	'Israel';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Israel not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'Subdistrict',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('HaZafon'            ,	     'Acre',	'HZ',	'AK');
INSERT INTO @tbl VALUES ('HaDarom'            ,	     'Ashqelon',	'HD',	'AS');
INSERT INTO @tbl VALUES ('HaDarom'            ,	     'Beersheba',	'HD',	'BS');
INSERT INTO @tbl VALUES ('HaZafon'            ,	     'Golan',	'HZ',	'GO');
INSERT INTO @tbl VALUES ('Haifa'            ,	     'Hadera',	'HA',	'HD');
INSERT INTO @tbl VALUES ('Haifa'            ,	     'Haifa',	'HA',	'HF');
INSERT INTO @tbl VALUES ('Jerusalem'            ,	     'Jerusalem',	'JM',	'JM');
INSERT INTO @tbl VALUES ('HaZafon'            ,	     'Jezreel',	'HZ',	'JZ');
INSERT INTO @tbl VALUES ('HaZafon'            ,	     'Kinneret',	'HZ',	'KN');
INSERT INTO @tbl VALUES ('HaMerkaz'            ,	     'Petah Tiqwa',	'HM',	'PT');
INSERT INTO @tbl VALUES ('HaMerkaz'            ,	     'Ramla',	'HM',	'RM');
INSERT INTO @tbl VALUES ('HaMerkaz'            ,	     'Rehoboth',	'HM',	'RH');
INSERT INTO @tbl VALUES ('HaMerkaz'            ,	     'Sharon',	'HM',	'SH');
INSERT INTO @tbl VALUES ('Tel Aviv'            ,	     'Tel Aviv',	'TA',	'TA');
INSERT INTO @tbl VALUES ('HaZafon'            ,	     'Zefat',	'HZ',	'ZF');

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

