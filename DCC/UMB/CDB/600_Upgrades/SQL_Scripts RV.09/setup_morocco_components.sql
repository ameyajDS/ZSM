
/* ==================================================================================
    	Source File		:	setup_morocco_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Morocco are set-up
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
WHERE	country_nm	=	'Morocco';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Morocco not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Prefecture',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Souss - Massa - Draa'            ,	     'Agadir-Ida ou Tanane',	'SM',	'AI');
INSERT INTO @tbl VALUES ('Marrakech - Tensift - Al Haouz'            ,	     'Al Haouz',	'MK',	'AH');
INSERT INTO @tbl VALUES ('Taza - Al Hoceima - Taounate'            ,	     'Al Hoceima',	'TH',	'AH');
INSERT INTO @tbl VALUES ('Oued Ed-Dahab - Lagouira'            ,	     'Aousserd',	'OL',	'AO');
INSERT INTO @tbl VALUES ('Guelmim - Es-Semara'            ,	     'Assa-Zag',	'GE',	'AZ');
INSERT INTO @tbl VALUES ('Tadla - Azilal'            ,	     'Azilal',	'TD',	'AZ');
INSERT INTO @tbl VALUES ('Chaouia - Ouardigha'            ,	     'Ben Slimane',	'CO',	'BS');
INSERT INTO @tbl VALUES ('Tadla - Azilal'            ,	     'Beni Mellal',	'TD',	'BM');
INSERT INTO @tbl VALUES ('Oriental'            ,	     'Berkane',	'OR',	'BE');
INSERT INTO @tbl VALUES ('Laayoune - Boujdour - Sakia El Hamra'            ,	     'Boujdour',	'LB',	'BO');
INSERT INTO @tbl VALUES ('Fes - Boulemane'            ,	     'Boulemane',	'FB',	'BO');
INSERT INTO @tbl VALUES ('Grand Casablanca'            ,	     'Casablanca',	'GC',	'CB');
INSERT INTO @tbl VALUES ('Tanger - Tetouan'            ,	     'Chefchaouen',	'TO',	'CH');
INSERT INTO @tbl VALUES ('Marrakech - Tensift - Al Haouz'            ,	     'Chichaoua',	'MK',	'CH');
INSERT INTO @tbl VALUES ('Souss - Massa - Draa'            ,	     'Chtouka-Ait Baha',	'SM',	'CA');
INSERT INTO @tbl VALUES ('Meknes - Tafilalet'            ,	     'El Hajeb',	'MT',	'EH');
INSERT INTO @tbl VALUES ('Doukkala - Abda'            ,	     'El Jadida',	'DA',	'EJ');
INSERT INTO @tbl VALUES ('Marrakech - Tensift - Al Haouz'            ,	     'El Kelaa des Sraghna',	'MK',	'EK');
INSERT INTO @tbl VALUES ('Meknes - Tafilalet'            ,	     'Errachidia',	'MT',	'ER');
INSERT INTO @tbl VALUES ('Marrakech - Tensift - Al Haouz'            ,	     'Essaouira',	'MK',	'ES');
INSERT INTO @tbl VALUES ('Guelmim - Es-Semara'            ,	     'Es-Semara',	'GE',	'ES');
INSERT INTO @tbl VALUES ('Tanger - Tetouan'            ,	     'Fahs Anjra',	'TO',	'FB');
INSERT INTO @tbl VALUES ('Fes - Boulemane'            ,	     'Fes',	'FB',	'FS');
INSERT INTO @tbl VALUES ('Oriental'            ,	     'Figuig',	'OR',	'FI');
INSERT INTO @tbl VALUES ('Guelmim - Es-Semara'            ,	     'Guelmim',	'GE',	'GU');
INSERT INTO @tbl VALUES ('Meknes - Tafilalet'            ,	     'Ifrane',	'MT',	'IF');
INSERT INTO @tbl VALUES ('Souss - Massa - Draa'            ,	     'Inezgane-Ait Melloul',	'SM',	'IA');
INSERT INTO @tbl VALUES ('Oriental'            ,	     'Jerada',	'OR',	'JE');
INSERT INTO @tbl VALUES ('Gharb - Chrarda - Beni Hssen'            ,	     'Kenitra',	'GB',	'KE');
INSERT INTO @tbl VALUES ('Rabat - Sale - Zemmour - Zaer'            ,	     'Khemisset',	'RZ',	'KH');
INSERT INTO @tbl VALUES ('Meknes - Tafilalet'            ,	     'Khenifra',	'MT',	'KH');
INSERT INTO @tbl VALUES ('Chaouia - Ouardigha'            ,	     'Khouribga',	'CO',	'KH');
INSERT INTO @tbl VALUES ('Laayoune - Boujdour - Sakia El Hamra'            ,	     'Laayoune',	'LB',	'LA');
INSERT INTO @tbl VALUES ('Tanger - Tetouan'            ,	     'Larache',	'TO',	'LA');
INSERT INTO @tbl VALUES ('Marrakech - Tensift - Al Haouz'            ,	     'Marrakech',	'MK',	'MR');
INSERT INTO @tbl VALUES ('Grand Casablanca'            ,	     'Mediouna',	'GC',	'ME');
INSERT INTO @tbl VALUES ('Meknes - Tafilalet'            ,	     'Meknes',	'MT',	'ME');
INSERT INTO @tbl VALUES ('Grand Casablanca'            ,	     'Mohammedia',	'GC',	'MH');
INSERT INTO @tbl VALUES ('Fes - Boulemane'            ,	     'Moulay Yacoub',	'FB',	'ZM');
INSERT INTO @tbl VALUES ('Oriental'            ,	     'Nador',	'OR',	'NA');
INSERT INTO @tbl VALUES ('Grand Casablanca'            ,	     'Nouaceur',	'GC',	'NC');
INSERT INTO @tbl VALUES ('Souss - Massa - Draa'            ,	     'Ouarzazate',	'SM',	'OU');
INSERT INTO @tbl VALUES ('Oued Ed-Dahab - Lagouira'            ,	     'Oued Ed-Dahab',	'OL',	'OE');
INSERT INTO @tbl VALUES ('Oriental'            ,	     'Oujda-Angad',	'OR',	'OA');
INSERT INTO @tbl VALUES ('Rabat - Sale - Zemmour - Zaer'            ,	     'Rabat',	'RZ',	'RA');
INSERT INTO @tbl VALUES ('Doukkala - Abda'            ,	     'Safi',	'DA',	'SA');
INSERT INTO @tbl VALUES ('Rabat - Sale - Zemmour - Zaer'            ,	     'Sale',	'RZ',	'SA');
INSERT INTO @tbl VALUES ('Fes - Boulemane'            ,	     'Sefrou',	'FB',	'SE');
INSERT INTO @tbl VALUES ('Chaouia - Ouardigha'            ,	     'Settat',	'CO',	'SE');
INSERT INTO @tbl VALUES ('Gharb - Chrarda - Beni Hssen'            ,	     'Sidi Kacem',	'GB',	'SK');
INSERT INTO @tbl VALUES ('Rabat - Sale - Zemmour - Zaer'            ,	     'Skhirate-Temara',	'RZ',	'ST');
INSERT INTO @tbl VALUES ('Tanger - Tetouan'            ,	     'Tanger-Assilah',	'TO',	'TA');
INSERT INTO @tbl VALUES ('Guelmim - Es-Semara'            ,	     'Tan-Tan',	'GE',	'TN');
INSERT INTO @tbl VALUES ('Taza - Al Hoceima - Taounate'            ,	     'Taounate',	'TH',	'TN');
INSERT INTO @tbl VALUES ('Oriental'            ,	     'Taourirt',	'OR',	'TA');
INSERT INTO @tbl VALUES ('Souss - Massa - Draa'            ,	     'Taroudannt',	'SM',	'TA');
INSERT INTO @tbl VALUES ('Guelmim - Es-Semara'            ,	     'Tata',	'GE',	'TA');
INSERT INTO @tbl VALUES ('Taza - Al Hoceima - Taounate'            ,	     'Taza',	'TH',	'TZ');
INSERT INTO @tbl VALUES ('Tanger - Tetouan'            ,	     'Tetouan',	'TO',	'TE');
INSERT INTO @tbl VALUES ('Souss - Massa - Draa'            ,	     'Tiznit',	'SM',	'TI');
INSERT INTO @tbl VALUES ('Souss - Massa - Draa'            ,	     'Zagora',	'SM',	'ZA');

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

