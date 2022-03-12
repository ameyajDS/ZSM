
/* ==================================================================================
    	Source File		:	setup_congo-brazzaville_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Congo-Brazzaville are set-up
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
WHERE	country_nm	=	'Congo-Brazzaville';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Congo-Brazzaville not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Department',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Abala',	'PL',	'AB');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Allembe',	'PL',	'AL');
INSERT INTO @tbl VALUES ('Brazzaville'            ,	     'Bacongo',	'BR',	'BA');
INSERT INTO @tbl VALUES ('Lekoumou'            ,	     'Bambama',	'LE',	'BA');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Banda',	'NI',	'BA');
INSERT INTO @tbl VALUES ('Likouala'            ,	     'Betou',	'LI',	'BE');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Boko',	'PO',	'BO');
INSERT INTO @tbl VALUES ('Bouenza'            ,	     'Boko-Songho',	'BO',	'BS');
INSERT INTO @tbl VALUES ('Likouala'            ,	     'Bouaniela',	'LI',	'BO');
INSERT INTO @tbl VALUES ('Cuvette'            ,	     'Boundji',	'CU',	'BO');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Divenie',	'NI',	'DI');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Djambala',	'PL',	'DJ');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Dolisie',	'NI',	'DO');
INSERT INTO @tbl VALUES ('Likouala'            ,	     'Dongou',	'LI',	'DO');
INSERT INTO @tbl VALUES ('Likouala'            ,	     'Enyelle',	'LI',	'EN');
INSERT INTO @tbl VALUES ('Likouala'            ,	     'Epena',	'LI',	'EP');
INSERT INTO @tbl VALUES ('Cuvette-Ouest'            ,	     'Etoumbi',	'CO',	'ET');
INSERT INTO @tbl VALUES ('Cuvette-Ouest'            ,	     'Ewo',	'CO',	'EW');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Gamboma',	'PL',	'GA');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Goma Tse-Tse',	'PO',	'GT');
INSERT INTO @tbl VALUES ('Kouilou'            ,	     'Hinda',	'KL',	'HI');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Igne',	'PO',	'IG');
INSERT INTO @tbl VALUES ('Likouala'            ,	     'Impfondo',	'LI',	'IM');
INSERT INTO @tbl VALUES ('Kouilou'            ,	     'Kakamoeka',	'KL',	'KA');
INSERT INTO @tbl VALUES ('Bouenza'            ,	     'Kayes',	'BO',	'KA');
INSERT INTO @tbl VALUES ('Cuvette-Ouest'            ,	     'Kelle',	'CO',	'KE');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Kibangou',	'NI',	'KB');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Kimba',	'PO',	'KM');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Kimongo',	'NI',	'KM');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Kindamba',	'PO',	'KD');
INSERT INTO @tbl VALUES ('Bouenza'            ,	     'Kingoue',	'BO',	'KI');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Kinkala',	'PO',	'KK');
INSERT INTO @tbl VALUES ('Lekoumou'            ,	     'Komono',	'LE',	'KO');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Lekana',	'PL',	'LE');
INSERT INTO @tbl VALUES ('Likouala'            ,	     'Liranga',	'LI',	'LI');
INSERT INTO @tbl VALUES ('Pointe-Noire'            ,	     'Loandjili',	'PN',	'LO');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Londela-Kayes',	'NI',	'LK');
INSERT INTO @tbl VALUES ('Bouenza'            ,	     'Loudima',	'BO',	'LO');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Louingui',	'PO',	'LG');
INSERT INTO @tbl VALUES ('Cuvette'            ,	     'Loukolela',	'CU',	'LO');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Loumo',	'PO',	'LM');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Louvakou',	'NI',	'LO');
INSERT INTO @tbl VALUES ('Pointe-Noire'            ,	     'Lumumba',	'PN',	'LU');
INSERT INTO @tbl VALUES ('Bouenza'            ,	     'Mabombo',	'BO',	'MB');
INSERT INTO @tbl VALUES ('Kouilou'            ,	     'Madingo-Kayes',	'KL',	'MK');
INSERT INTO @tbl VALUES ('Bouenza'            ,	     'Madingou',	'BO',	'MD');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Makabana',	'NI',	'MK');
INSERT INTO @tbl VALUES ('Brazzaville'            ,	     'Makelekele',	'BR',	'MA');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Makotipoko',	'PL',	'MA');
INSERT INTO @tbl VALUES ('Cuvette'            ,	     'Makoua',	'CU',	'MA');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Mayama',	'PO',	'MA');
INSERT INTO @tbl VALUES ('Lekoumou'            ,	     'Mayeye',	'LE',	'MA');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Mayoko',	'NI',	'MY');
INSERT INTO @tbl VALUES ('Cuvette-Ouest'            ,	     'Mbama',	'CO',	'MA');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Mbandza-Ndounga',	'PO',	'MN');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Mbinda',	'NI',	'MB');
INSERT INTO @tbl VALUES ('Cuvette-Ouest'            ,	     'Mbomo',	'CO',	'MO');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Mbon',	'PL',	'MB');
INSERT INTO @tbl VALUES ('Brazzaville'            ,	     'Mfilou',	'BR',	'MF');
INSERT INTO @tbl VALUES ('Bouenza'            ,	     'Mfouati',	'BO',	'MF');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Mindouli',	'PO',	'MI');
INSERT INTO @tbl VALUES ('Sangha'            ,	     'Mokeko',	'SA',	'MO');
INSERT INTO @tbl VALUES ('Cuvette'            ,	     'Mossaka',	'CU',	'MO');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Mossendjo',	'NI',	'MO');
INSERT INTO @tbl VALUES ('Brazzaville'            ,	     'Moungali',	'BR',	'MO');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Moungoundou Nord',	'NI',	'MN');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Moungoundou Sud',	'NI',	'MS');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Moutamba',	'NI',	'MT');
INSERT INTO @tbl VALUES ('Bouenza'            ,	     'Mouyondzi',	'BO',	'MO');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Mpouya',	'PL',	'MP');
INSERT INTO @tbl VALUES ('Pointe-Noire'            ,	     'Mvoumvou',	'PN',	'MV');
INSERT INTO @tbl VALUES ('Kouilou'            ,	     'Mvouti',	'KL',	'MV');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Ngabe',	'PO',	'NG');
INSERT INTO @tbl VALUES ('Sangha'            ,	     'Ngbala',	'SA',	'NG');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Ngo',	'PL',	'NG');
INSERT INTO @tbl VALUES ('Cuvette'            ,	     'Ngoko',	'CU',	'NG');
INSERT INTO @tbl VALUES ('Bouenza'            ,	     'Nkayi',	'BO',	'NK');
INSERT INTO @tbl VALUES ('Cuvette'            ,	     'Ntokou',	'CU',	'NT');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Nyanga',	'NI',	'NY');
INSERT INTO @tbl VALUES ('Kouilou'            ,	     'Nzambi',	'KL',	'NZ');
INSERT INTO @tbl VALUES ('Cuvette-Ouest'            ,	     'Okoyo',	'CO',	'OK');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Ollombo',	'PL',	'OL');
INSERT INTO @tbl VALUES ('Plateaux'            ,	     'Ongoni',	'PL',	'ON');
INSERT INTO @tbl VALUES ('Brazzaville'            ,	     'Ouenze',	'BR',	'OU');
INSERT INTO @tbl VALUES ('Sangha'            ,	     'Ouesso',	'SA',	'OU');
INSERT INTO @tbl VALUES ('Cuvette'            ,	     'Owando',	'CU',	'OW');
INSERT INTO @tbl VALUES ('Cuvette'            ,	     'Oyo',	'CU',	'OY');
INSERT INTO @tbl VALUES ('Sangha'            ,	     'Pikounda',	'SA',	'PI');
INSERT INTO @tbl VALUES ('Brazzaville'            ,	     'Poto-Poto',	'BR',	'PP');
INSERT INTO @tbl VALUES ('Sangha'            ,	     'Sembe',	'SA',	'SE');
INSERT INTO @tbl VALUES ('Lekoumou'            ,	     'Sibiti',	'LE',	'SI');
INSERT INTO @tbl VALUES ('Sangha'            ,	     'Souanke',	'SA',	'SO');
INSERT INTO @tbl VALUES ('Brazzaville'            ,	     'Talangai',	'BR',	'TA');
INSERT INTO @tbl VALUES ('Kouilou'            ,	     'Tchamba Nzassi',	'KL',	'TN');
INSERT INTO @tbl VALUES ('Cuvette'            ,	     'Tchikapika',	'CU',	'TC');
INSERT INTO @tbl VALUES ('Pointe-Noire'            ,	     'Tie-Tie',	'PN',	'TT');
INSERT INTO @tbl VALUES ('Bouenza'            ,	     'Tsiaki',	'BO',	'TS');
INSERT INTO @tbl VALUES ('Pool'            ,	     'Vindza',	'PO',	'VI');
INSERT INTO @tbl VALUES ('Bouenza'            ,	     'Yamba',	'BO',	'YA');
INSERT INTO @tbl VALUES ('Niari'            ,	     'Yaya',	'NI',	'YA');
INSERT INTO @tbl VALUES ('Lekoumou'            ,	     'Zanaga',	'LE',	'ZA');

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

