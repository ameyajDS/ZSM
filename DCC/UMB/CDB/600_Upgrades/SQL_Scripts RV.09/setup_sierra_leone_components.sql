
/* ==================================================================================
    	Source File		:	setup_sierra_leone_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Sierra_Leone are set-up
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
WHERE	country_nm	=	'Sierra Leone';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Sierra_Leone not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Southern'            ,	     'Bo',	'SO',	'BO');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Bombali',	'NO',	'BM');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Bonthe',	'SO',	'BN');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Kailahun',	'EA',	'KL');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Kambia',	'NO',	'KM');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Kenema',	'EA',	'KE');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Koinadugu',	'NO',	'KD');
INSERT INTO @tbl VALUES ('Eastern'            ,	     'Kono',	'EA',	'KN');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Moyamba',	'SO',	'MO');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Port Loko',	'NO',	'PL');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Pujehun',	'SO',	'PU');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Sherbro Urban',	'SO',	'SH');
INSERT INTO @tbl VALUES ('Northern'            ,	     'Tonkolili',	'NO',	'TO');
INSERT INTO @tbl VALUES ('Western'            ,	     'Western Rural',	'WE',	'WR');
INSERT INTO @tbl VALUES ('Western'            ,	     'Western Urban',	'WE',	'WU');

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

