
/* ==================================================================================
    	Source File		:	setup_ivory_coast_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Ivory_Coast are set-up
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
WHERE	country_nm	=	'Ivory Coast';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Ivory Coast not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'Region',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Abidjan'            ,	     'Abidjan',	'AB',	'AB');
INSERT INTO @tbl VALUES ('Lagunes'            ,	     'Agneby-Tiassa',	'LN',	'AT');
INSERT INTO @tbl VALUES ('Woroba'            ,	     'Bafing',	'WB',	'BF');
INSERT INTO @tbl VALUES ('Savanes'            ,	     'Bagoue',	'SV',	'BG');
INSERT INTO @tbl VALUES ('Lacs'            ,	     'Belier',	'LA',	'BL');
INSERT INTO @tbl VALUES ('Woroba'            ,	     'Bere',	'WB',	'BR');
INSERT INTO @tbl VALUES ('Zanzan'            ,	     'Bounkani',	'ZA',	'BK');
INSERT INTO @tbl VALUES ('Montagnes'            ,	     'Cavally',	'MN',	'CV');
INSERT INTO @tbl VALUES ('Denguele'            ,	     'Folon',	'DE',	'FO');
INSERT INTO @tbl VALUES ('Vallee du Bandama'            ,	     'Gbeke',	'VB',	'GE');
INSERT INTO @tbl VALUES ('Bas-Sassandra'            ,	     'Gbokle',	'BA',	'GL');
INSERT INTO @tbl VALUES ('Goh-Djiboua'            ,	     'Goh',	'GD',	'GH');
INSERT INTO @tbl VALUES ('Zanzan'            ,	     'Gontougo',	'ZA',	'GT');
INSERT INTO @tbl VALUES ('Lagunes'            ,	     'Grands Ponts',	'LN',	'GP');
INSERT INTO @tbl VALUES ('Montagnes'            ,	     'Guemon',	'MN',	'GM');
INSERT INTO @tbl VALUES ('Vallee du Bandama'            ,	     'Hambol',	'VB',	'HB');
INSERT INTO @tbl VALUES ('Sassandra-Marahoue'            ,	     'Haut-Sassandra',	'SM',	'HS');
INSERT INTO @tbl VALUES ('Lacs'            ,	     'Iffou',	'LA',	'IF');
INSERT INTO @tbl VALUES ('Comoe'            ,	     'Indenie-Djuablin',	'CM',	'ID');
INSERT INTO @tbl VALUES ('Denguele'            ,	     'Kabadougou',	'DE',	'KB');
INSERT INTO @tbl VALUES ('Lagunes'            ,	     'La Me (Massan)',	'LN',	'ME');
INSERT INTO @tbl VALUES ('Goh-Djiboua'            ,	     'Loh-Djiboua',	'GD',	'LD');
INSERT INTO @tbl VALUES ('Sassandra-Marahoue'            ,	     'Marahoue',	'SM',	'MH');
INSERT INTO @tbl VALUES ('Lacs'            ,	     'Moronou',	'LA',	'MN');
INSERT INTO @tbl VALUES ('Bas-Sassandra'            ,	     'Nawa',	'BA',	'NW');
INSERT INTO @tbl VALUES ('Lacs'            ,	     'N''zi',	'LA',	'NZ');
INSERT INTO @tbl VALUES ('Savanes'            ,	     'Poro',	'SV',	'PR');
INSERT INTO @tbl VALUES ('Bas-Sassandra'            ,	     'San-Pedro',	'BA',	'SP');
INSERT INTO @tbl VALUES ('Comoe'            ,	     'Sud-Comoe',	'CM',	'SC');
INSERT INTO @tbl VALUES ('Savanes'            ,	     'Tchologo',	'SV',	'TL');
INSERT INTO @tbl VALUES ('Montagnes'            ,	     'Tonkpi',	'MN',	'TP');
INSERT INTO @tbl VALUES ('Woroba'            ,	     'Worodougou',	'WB',	'WR');
INSERT INTO @tbl VALUES ('Yamoussoukro'            ,	     'Yamoussoukro',	'YM',	'YM');

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

