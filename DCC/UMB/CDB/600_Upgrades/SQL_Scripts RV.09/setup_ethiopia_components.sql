
/* ==================================================================================
    	Source File		:	setup_ethiopia_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Ethiopia are set-up
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
WHERE	country_nm	=	'Ethiopia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Ethiopia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'State',
		level_2_address_component	=	'Zone',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Addis Ababa'            ,	     'Addis Ababa Zone 1',	'AA',	'ON');
INSERT INTO @tbl VALUES ('Addis Ababa'            ,	     'Addis Ababa Zone 2',	'AA',	'TW');
INSERT INTO @tbl VALUES ('Addis Ababa'            ,	     'Addis Ababa Zone 3',	'AA',	'TH');
INSERT INTO @tbl VALUES ('Addis Ababa'            ,	     'Addis Ababa Zone 4',	'AA',	'FO');
INSERT INTO @tbl VALUES ('Addis Ababa'            ,	     'Addis Ababa Zone 5',	'AA',	'FI');
INSERT INTO @tbl VALUES ('Addis Ababa'            ,	     'Addis Ababa Zone 6',	'AA',	'SI');
INSERT INTO @tbl VALUES ('Afar'            ,	     'Afar Zone 1',	'AF',	'ON');
INSERT INTO @tbl VALUES ('Afar'            ,	     'Afar Zone 2',	'AF',	'TW');
INSERT INTO @tbl VALUES ('Afar'            ,	     'Afar Zone 3',	'AF',	'TH');
INSERT INTO @tbl VALUES ('Afar'            ,	     'Afar Zone 4',	'AF',	'FO');
INSERT INTO @tbl VALUES ('Afar'            ,	     'Afar Zone 5',	'AF',	'FI');
INSERT INTO @tbl VALUES ('Somali'            ,	     'Afder',	'SO',	'AF');
INSERT INTO @tbl VALUES ('Amhara'            ,	     'Agew Awi',	'AM',	'AA');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Arssi',	'OR',	'AR');
INSERT INTO @tbl VALUES ('Benshangul-Gumaz'            ,	     'Asosa',	'BE',	'AS');
INSERT INTO @tbl VALUES ('Amhara'            ,	     'Bahir Dar Special Zone',	'AM',	'BD');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Bale',	'OR',	'BA');
INSERT INTO @tbl VALUES ('Southern Nations, Natio. & People'            ,	     'Bench Maji',	'SN',	'BM');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Borena',	'OR',	'BO');
INSERT INTO @tbl VALUES ('Amhara'            ,	     'Debub Gondar',	'AM',	'DG');
INSERT INTO @tbl VALUES ('Southern Nations, Natio. & People'            ,	     'Debub Omo',	'SN',	'DO');
INSERT INTO @tbl VALUES ('Amhara'            ,	     'Debub Wello',	'AM',	'DW');
INSERT INTO @tbl VALUES ('Tigray'            ,	     'Debubawi',	'TI',	'DB');
INSERT INTO @tbl VALUES ('Somali'            ,	     'Degehabur',	'SO',	'DE');
INSERT INTO @tbl VALUES ('Dire Dawa'            ,	     'Dire Dawa',	'DD',	'DD');
INSERT INTO @tbl VALUES ('Somali'            ,	     'Fiq',	'SO',	'FQ');
INSERT INTO @tbl VALUES ('Southern Nations, Natio. & People'            ,	     'Five Special Wereda',	'SN',	'SW');
INSERT INTO @tbl VALUES ('Gambela Peoples'            ,	     'Gambela Zone 1',	'GA',	'ON');
INSERT INTO @tbl VALUES ('Gambela Peoples'            ,	     'Gambela Zone 2',	'GA',	'TW');
INSERT INTO @tbl VALUES ('Gambela Peoples'            ,	     'Gambela Zone 3',	'GA',	'TH');
INSERT INTO @tbl VALUES ('Gambela Peoples'            ,	     'Gambela Zone 4',	'GA',	'FO');
INSERT INTO @tbl VALUES ('Southern Nations, Natio. & People'            ,	     'Gedeo',	'SN',	'GD');
INSERT INTO @tbl VALUES ('Somali'            ,	     'Gode',	'SO',	'GD');
INSERT INTO @tbl VALUES ('Southern Nations, Natio. & People'            ,	     'Gurage',	'SN',	'GR');
INSERT INTO @tbl VALUES ('Southern Nations, Natio. & People'            ,	     'Hadiya',	'SN',	'HA');
INSERT INTO @tbl VALUES ('Harari People'            ,	     'Harari',	'HA',	'HA');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Illubabor',	'OR',	'IL');
INSERT INTO @tbl VALUES ('Somali'            ,	     'Jigjiga',	'SO',	'JJ');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Jimma',	'OR',	'JM');
INSERT INTO @tbl VALUES ('Benshangul-Gumaz'            ,	     'Kamashi',	'BE',	'KM');
INSERT INTO @tbl VALUES ('Southern Nations, Natio. & People'            ,	     'Keficho Shekicho',	'SN',	'KS');
INSERT INTO @tbl VALUES ('Southern Nations, Natio. & People'            ,	     'Kembata Alaba and Tembaro',	'SN',	'KA');
INSERT INTO @tbl VALUES ('Somali'            ,	     'Korahe',	'SO',	'KO');
INSERT INTO @tbl VALUES ('Somali'            ,	     'Liben',	'SO',	'LI');
INSERT INTO @tbl VALUES ('Tigray'            ,	     'Mehakelegnaw',	'TI',	'MH');
INSERT INTO @tbl VALUES ('Benshangul-Gumaz'            ,	     'Metekel',	'BE',	'MT');
INSERT INTO @tbl VALUES ('Amhara'            ,	     'Mirab Gojam',	'AM',	'MB');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Mirab Harerge',	'OR',	'MB');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Mirab Shewa',	'OR',	'MR');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Mirab Wellega',	'OR',	'MW');
INSERT INTO @tbl VALUES ('Tigray'            ,	     'Mirabawi',	'TI',	'MR');
INSERT INTO @tbl VALUES ('Amhara'            ,	     'Misrak Gojam',	'AM',	'MK');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Misrak Harerge',	'OR',	'MK');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Misrak Shewa',	'OR',	'MS');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Misrak Wellega',	'OR',	'MG');
INSERT INTO @tbl VALUES ('Tigray'            ,	     'Misrakawi',	'TI',	'MS');
INSERT INTO @tbl VALUES ('Amhara'            ,	     'Oromia',	'AM',	'OR');
INSERT INTO @tbl VALUES ('Amhara'            ,	     'Semen Gondar',	'AM',	'SG');
INSERT INTO @tbl VALUES ('Southern Nations, Natio. & People'            ,	     'Semen Omo',	'SN',	'SO');
INSERT INTO @tbl VALUES ('Amhara'            ,	     'Semen Shewa',	'AM',	'SS');
INSERT INTO @tbl VALUES ('Oromia'            ,	     'Semen Shewa',	'OR',	'SS');
INSERT INTO @tbl VALUES ('Amhara'            ,	     'Semen Wello',	'AM',	'SW');
INSERT INTO @tbl VALUES ('Somali'            ,	     'Shinile',	'SO',	'SH');
INSERT INTO @tbl VALUES ('Southern Nations, Natio. & People'            ,	     'Sidama',	'SN',	'SD');
INSERT INTO @tbl VALUES ('Amhara'            ,	     'Wag Hemra',	'AM',	'WH');
INSERT INTO @tbl VALUES ('Somali'            ,	     'Warder',	'SO',	'WA');

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

