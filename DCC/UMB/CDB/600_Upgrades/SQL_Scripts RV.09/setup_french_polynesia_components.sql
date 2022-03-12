
/* ==================================================================================
    	Source File		:	setup_french_polynesia_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of French_Polynesia are set-up
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
WHERE	country_nm	=	'French Polynesia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country French Polynesia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Subdivision',
		level_2_address_component	=	'Commune',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Anaa',	'TG',	'AN');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Arue',	'WI',	'AE');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Arutua',	'TG',	'AT');
INSERT INTO @tbl VALUES ('Leeward Islands'            ,	     'Bora-Bora',	'LI',	'BB');
INSERT INTO @tbl VALUES ('Clipperton Island'            ,	     'Clipperton Island',	'CI',	'CI');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Faaa',	'WI',	'FA');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Fakarava',	'TG',	'FK');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Fangatau',	'TG',	'FG');
INSERT INTO @tbl VALUES ('Marquesas Islands'            ,	     'Fatu-Hiva',	'MI',	'FH');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Gambier',	'TG',	'GA');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Hao',	'TG',	'HA');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Hikueru',	'TG',	'HI');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Hitiaa O Te Ra',	'WI',	'HT');
INSERT INTO @tbl VALUES ('Marquesas Islands'            ,	     'Hiva-Oa',	'MI',	'HO');
INSERT INTO @tbl VALUES ('Leeward Islands'            ,	     'Huahine',	'LI',	'HU');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Mahina',	'WI',	'MH');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Makemo',	'TG',	'MK');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Manihi',	'TG',	'MN');
INSERT INTO @tbl VALUES ('Leeward Islands'            ,	     'Maupiti',	'LI',	'MP');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Moorea-Maiao',	'WI',	'MM');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Napuka',	'TG',	'NA');
INSERT INTO @tbl VALUES ('Marquesas Islands'            ,	     'Nuku-Hiva',	'MI',	'NH');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Nukutavake',	'TG',	'NT');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Paea',	'WI',	'PA');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Papara',	'WI',	'PR');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Papeete',	'WI',	'PP');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Pirae',	'WI',	'PI');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Pukapuka',	'TG',	'PK');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Punaauia',	'WI',	'PN');
INSERT INTO @tbl VALUES ('Tubuai Islands'            ,	     'Raivavae',	'TI',	'RV');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Rangiroa',	'TG',	'RG');
INSERT INTO @tbl VALUES ('Tubuai Islands'            ,	     'Rapa',	'TI',	'RP');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Reao',	'TG',	'RE');
INSERT INTO @tbl VALUES ('Tubuai Islands'            ,	     'Rimatara',	'TI',	'RI');
INSERT INTO @tbl VALUES ('Tubuai Islands'            ,	     'Rurutu',	'TI',	'RU');
INSERT INTO @tbl VALUES ('Leeward Islands'            ,	     'Tahaa',	'LI',	'TH');
INSERT INTO @tbl VALUES ('Marquesas Islands'            ,	     'Tahuata',	'MI',	'TT');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Taiarapu-Est',	'WI',	'TE');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Taiarapu-Ouest',	'WI',	'TO');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Takaroa',	'TG',	'TA');
INSERT INTO @tbl VALUES ('Leeward Islands'            ,	     'Taputapuatea',	'LI',	'TP');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Tatakoto',	'TG',	'TK');
INSERT INTO @tbl VALUES ('Windward Islands'            ,	     'Teva I Uta',	'WI',	'TU');
INSERT INTO @tbl VALUES ('Tubuai Islands'            ,	     'Tubuai',	'TI',	'TB');
INSERT INTO @tbl VALUES ('Leeward Islands'            ,	     'Tumaraa',	'LI',	'TM');
INSERT INTO @tbl VALUES ('Tuamotu and Gambier Islands'            ,	     'Tureia',	'TG',	'TR');
INSERT INTO @tbl VALUES ('Marquesas Islands'            ,	     'Ua-Huka',	'MI',	'UH');
INSERT INTO @tbl VALUES ('Marquesas Islands'            ,	     'Ua-Pou',	'MI',	'UP');
INSERT INTO @tbl VALUES ('Leeward Islands'            ,	     'Uturoa',	'LI',	'UT');

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

