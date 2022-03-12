
/* ==================================================================================
    	Source File		:	setup_iceland_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Iceland are set-up
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
WHERE	country_nm	=	'Iceland';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Iceland not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Northland East'            ,	     'Adaldaelahreppur',	'NE',	'AD');
INSERT INTO @tbl VALUES ('Northland West'            ,	     'Akrahreppur',	'NV',	'AK');
INSERT INTO @tbl VALUES ('Westland'            ,	     'Akraneskaupstadur',	'VL',	'AN');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Akureyrarkaupstadur',	'NE',	'AK');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Arnarneshreppur',	'NE',	'AR');
INSERT INTO @tbl VALUES ('Western Fjords'            ,	     'Arneshreppur',	'VF',	'AR');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Asahreppur',	'SL',	'AS');
INSERT INTO @tbl VALUES ('Western Fjords'            ,	     'Baejarhreppur',	'VF',	'BJ');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Blaskogabyggd',	'SL',	'BL');
INSERT INTO @tbl VALUES ('Northland West'            ,	     'Blonduossbaer',	'NV',	'BL');
INSERT INTO @tbl VALUES ('Western Fjords'            ,	     'Bolungarvikurkaupstadur',	'VF',	'BO');
INSERT INTO @tbl VALUES ('Westland'            ,	     'Borgarbyggd',	'VL',	'BG');
INSERT INTO @tbl VALUES ('Eastland'            ,	     'Borgarfjardarhreppur',	'AL',	'BG');
INSERT INTO @tbl VALUES ('Eastland'            ,	     'Breiddalshreppur',	'AL',	'BD');
INSERT INTO @tbl VALUES ('Westland'            ,	     'Dalabyggd',	'VL',	'DA');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Dalvikurbyggd',	'NE',	'DL');
INSERT INTO @tbl VALUES ('Eastland'            ,	     'Djupavogshreppur',	'AL',	'DJ');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Eyjafjardarsveit',	'NE',	'EF');
INSERT INTO @tbl VALUES ('Westland'            ,	     'Eyja- og Miklaholtshreppur',	'VL',	'EM');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Fjallabyggd',	'NE',	'FJ');
INSERT INTO @tbl VALUES ('Eastland'            ,	     'Fjardabyggd',	'AL',	'FJ');
INSERT INTO @tbl VALUES ('Eastland'            ,	     'Fljotsdalsherad',	'AL',	'FD');
INSERT INTO @tbl VALUES ('Eastland'            ,	     'Fljotsdalshreppur',	'AL',	'FP');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Floahreppur',	'SL',	'FL');
INSERT INTO @tbl VALUES ('Capital'            ,	     'Gardabaer',	'HO',	'GR');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Grimseyjarhreppur',	'NE',	'GM');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Grimsnes- og Grafningshreppur',	'SL',	'GG');
INSERT INTO @tbl VALUES ('Southern Peninsula'            ,	     'Grindavikurbaer',	'SU',	'GV');
INSERT INTO @tbl VALUES ('Westland'            ,	     'Grundarfjardarbaer',	'VL',	'GF');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Grytubakkahreppur',	'NE',	'GT');
INSERT INTO @tbl VALUES ('Capital'            ,	     'Hafnarfjardarkaupstadur',	'HO',	'HK');
INSERT INTO @tbl VALUES ('Westland'            ,	     'Helgafellssveit',	'VL',	'HL');
INSERT INTO @tbl VALUES ('Northland West'            ,	     'Hofdahreppur',	'NV',	'HO');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Horgarbyggd',	'NE',	'HO');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Hrunamannahreppur',	'SL',	'HR');
INSERT INTO @tbl VALUES ('Northland West'            ,	     'Hunathing vestra',	'NV',	'HV');
INSERT INTO @tbl VALUES ('Northland West'            ,	     'Hunavatnshreppur',	'NV',	'HU');
INSERT INTO @tbl VALUES ('Westland'            ,	     'Hvalfjardarsveit',	'VL',	'HV');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Hveragerdisbaer',	'SL',	'HV');
INSERT INTO @tbl VALUES ('Western Fjords'            ,	     'Isafjardarbaer',	'VF',	'IF');
INSERT INTO @tbl VALUES ('Western Fjords'            ,	     'Kaldrananeshreppur',	'VF',	'KA');
INSERT INTO @tbl VALUES ('Capital'            ,	     'Kjosarhreppur',	'HO',	'KS');
INSERT INTO @tbl VALUES ('Capital'            ,	     'Kopavogsbaer',	'HO',	'KV');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Langanesbyggd',	'NE',	'LA');
INSERT INTO @tbl VALUES ('Capital'            ,	     'Mosfellsbaer',	'HO',	'MO');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Myrdalshreppur',	'SL',	'MY');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Nordurthing',	'NE',	'NO');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Rangarthing eystra',	'SL',	'RE');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Rangarthing ytra',	'SL',	'RY');
INSERT INTO @tbl VALUES ('Western Fjords'            ,	     'Reykholahreppur',	'VF',	'RY');
INSERT INTO @tbl VALUES ('Southern Peninsula'            ,	     'Reykjanesbaer',	'SU',	'RY');
INSERT INTO @tbl VALUES ('Capital'            ,	     'Reykjavikurborg',	'HO',	'RY');
INSERT INTO @tbl VALUES ('Southern Peninsula'            ,	     'Sandgerdisbaer',	'SU',	'SN');
INSERT INTO @tbl VALUES ('Capital'            ,	     'Seltjarnarneskaupstadur',	'HO',	'SJ');
INSERT INTO @tbl VALUES ('Eastland'            ,	     'Seydisfjardarkaupstadur',	'AL',	'SF');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Skaftarhreppur',	'SL',	'SK');
INSERT INTO @tbl VALUES ('Northland West'            ,	     'Skagabyggd',	'NV',	'SB');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Skeida- og Gnupverjahreppur',	'SL',	'SG');
INSERT INTO @tbl VALUES ('Westland'            ,	     'Skorradalshreppur',	'VL',	'SK');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Skutustadahreppur',	'NE',	'SK');
INSERT INTO @tbl VALUES ('Westland'            ,	     'Snaefellsbaer',	'VL',	'SN');
INSERT INTO @tbl VALUES ('Western Fjords'            ,	     'Strandabyggd',	'VF',	'ST');
INSERT INTO @tbl VALUES ('Westland'            ,	     'Stykkisholmsbaer',	'VL',	'ST');
INSERT INTO @tbl VALUES ('Western Fjords'            ,	     'Sudavikurhreppur',	'VF',	'SU');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Svalbardshreppur',	'NE',	'SV');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Svalbardsstrandarhreppur',	'NE',	'SS');
INSERT INTO @tbl VALUES ('Capital'            ,	     'Sveitarfelagid Alftanes',	'HO',	'SA');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Sveitarfelagid Arborg',	'SL',	'SA');
INSERT INTO @tbl VALUES ('Southern Peninsula'            ,	     'Sveitarfelagid Gardur',	'SU',	'SG');
INSERT INTO @tbl VALUES ('Eastland'            ,	     'Sveitarfelagid Hornafjordur',	'AL',	'SH');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Sveitarfelagid Olfus',	'SL',	'SO');
INSERT INTO @tbl VALUES ('Northland West'            ,	     'Sveitarfelagid Skagafjordur',	'NV',	'SS');
INSERT INTO @tbl VALUES ('Southern Peninsula'            ,	     'Sveitarfelagid Vogar',	'SU',	'SV');
INSERT INTO @tbl VALUES ('Western Fjords'            ,	     'Talknafjardarhreppur',	'VF',	'TF');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Thingeyjarsveit',	'NE',	'TH');
INSERT INTO @tbl VALUES ('Northland East'            ,	     'Tjorneshreppur',	'NE',	'TJ');
INSERT INTO @tbl VALUES ('Southland'            ,	     'Vestmannaeyjabaer',	'SL',	'VE');
INSERT INTO @tbl VALUES ('Western Fjords'            ,	     'Vesturbyggd',	'VF',	'VS');
INSERT INTO @tbl VALUES ('Eastland'            ,	     'Vopnafjardarhreppur',	'AL',	'VO');

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

