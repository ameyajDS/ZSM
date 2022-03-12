
/* ==================================================================================
   	Source File		:	setup_denmark_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	13-10-2014
	Module ID		:	CDB
	Last updated	:	13-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Denmark are set-up
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
WHERE	country_nm	=	'Denmark';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Denmark not found', 16, 1);
	RETURN;
END

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY , level_1_cd varchar (5) UNIQUE );

INSERT INTO @tbl VALUES ('Capital',	'HS');
INSERT INTO @tbl VALUES ('Central Jutland',	'MJ');
INSERT INTO @tbl VALUES ('North Jutland',	'ND');
INSERT INTO @tbl VALUES ('South Denmark',	'SD');
INSERT INTO @tbl VALUES ('Zealand',	'SL');

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

DECLARE	@tbl2	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl2 VALUES ('Capital',	'Albertslund',	'AB');
INSERT INTO @tbl2 VALUES ('Capital',	'Allerod',	'AL');
INSERT INTO @tbl2 VALUES ('Capital',	'Ballerup',	'BA');
INSERT INTO @tbl2 VALUES ('Capital',	'Bornholms',	'BO');
INSERT INTO @tbl2 VALUES ('Capital',	'Brondby',	'BR');
INSERT INTO @tbl2 VALUES ('Capital',	'Christianso',	'CH');
INSERT INTO @tbl2 VALUES ('Capital',	'Dragor',	'DR');
INSERT INTO @tbl2 VALUES ('Capital',	'Egedal',	'EG');
INSERT INTO @tbl2 VALUES ('Capital',	'Fredensborg',	'FN');
INSERT INTO @tbl2 VALUES ('Capital',	'Frederiksberg',	'FB');
INSERT INTO @tbl2 VALUES ('Capital',	'Frederikssund',	'FS');
INSERT INTO @tbl2 VALUES ('Capital',	'Frederiksvaerk Hundested',	'FH');
INSERT INTO @tbl2 VALUES ('Capital',	'Fureso',	'FU');
INSERT INTO @tbl2 VALUES ('Capital',	'Gentofte',	'GE');
INSERT INTO @tbl2 VALUES ('Capital',	'Gladsaxe',	'GX');
INSERT INTO @tbl2 VALUES ('Capital',	'Glostrup',	'GP');
INSERT INTO @tbl2 VALUES ('Capital',	'Gribskov',	'GR');
INSERT INTO @tbl2 VALUES ('Capital',	'Helsingor',	'HG');
INSERT INTO @tbl2 VALUES ('Capital',	'Herlev',	'HV');
INSERT INTO @tbl2 VALUES ('Capital',	'Hillerod',	'HI');
INSERT INTO @tbl2 VALUES ('Capital',	'Hoje Taastrup',	'HT');
INSERT INTO @tbl2 VALUES ('Capital',	'Horsholm',	'HO');
INSERT INTO @tbl2 VALUES ('Capital',	'Hvidovre',	'HD');
INSERT INTO @tbl2 VALUES ('Capital',	'Ishoj',	'IS');
INSERT INTO @tbl2 VALUES ('Capital',	'Kobenhavns',	'KO');
INSERT INTO @tbl2 VALUES ('Capital',	'Lyngby Taarbaek',	'LT');
INSERT INTO @tbl2 VALUES ('Capital',	'Rodovre',	'RO');
INSERT INTO @tbl2 VALUES ('Capital',	'Rudersdal',	'RU');
INSERT INTO @tbl2 VALUES ('Capital',	'Tarnby',	'TA');
INSERT INTO @tbl2 VALUES ('Capital',	'Vallensbaek',	'VA');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Arhus',	'AR');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Favrskov',	'FA');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Hedensted',	'HD');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Herning',	'HG');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Holstebro',	'HB');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Horsens',	'HS');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Ikast Brande',	'IB');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Lemvig',	'LE');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Norddjurs',	'NO');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Odder',	'OD');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Randers',	'RA');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Ringkobing Skjern',	'RS');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Samso',	'SA');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Silkeborg',	'SI');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Skanderborg',	'SD');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Skive',	'SV');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Struer',	'ST');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Syddjurs',	'SY');
INSERT INTO @tbl2 VALUES ('Central Jutland',	'Viborg',	'VI');
INSERT INTO @tbl2 VALUES ('North Jutland',	'Aalborg',	'AA');
INSERT INTO @tbl2 VALUES ('North Jutland',	'Bronderslev Dronninglund',	'BD');
INSERT INTO @tbl2 VALUES ('North Jutland',	'Frederikshavn',	'FR');
INSERT INTO @tbl2 VALUES ('North Jutland',	'Hjorring',	'HJ');
INSERT INTO @tbl2 VALUES ('North Jutland',	'Jammerbugt',	'JA');
INSERT INTO @tbl2 VALUES ('North Jutland',	'Laeso',	'LA');
INSERT INTO @tbl2 VALUES ('North Jutland',	'Mariager Fjord',	'MF');
INSERT INTO @tbl2 VALUES ('North Jutland',	'Morso',	'MO');
INSERT INTO @tbl2 VALUES ('North Jutland',	'Rebild',	'RE');
INSERT INTO @tbl2 VALUES ('North Jutland',	'Thisted',	'TH');
INSERT INTO @tbl2 VALUES ('North Jutland',	'Vesthimmerland',	'VE');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Aabenraa',	'AA');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Aero',	'AE');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Assens',	'AS');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Billund',	'BI');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Bogense',	'BO');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Esbjerg',	'ES');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Faborg Midtfyn',	'FM');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Fano',	'FA');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Fredericia',	'FR');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Haderslev',	'HA');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Kerteminde',	'KE');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Kolding',	'KO');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Langeland',	'LA');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Middelfart',	'MI');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Nyborg',	'NY');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Odense',	'OD');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Sonderborg',	'SO');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Svendborg',	'SV');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Tonder',	'TO');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Varde',	'VA');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Vejen',	'VN');
INSERT INTO @tbl2 VALUES ('South Denmark',	'Vejle',	'VL');
INSERT INTO @tbl2 VALUES ('Zealand',	'Faxe',	'FA');
INSERT INTO @tbl2 VALUES ('Zealand',	'Greve',	'GR');
INSERT INTO @tbl2 VALUES ('Zealand',	'Guldborgsund',	'GU');
INSERT INTO @tbl2 VALUES ('Zealand',	'Holbaek',	'HO');
INSERT INTO @tbl2 VALUES ('Zealand',	'Kalundborg',	'KA');
INSERT INTO @tbl2 VALUES ('Zealand',	'Koge',	'KO');
INSERT INTO @tbl2 VALUES ('Zealand',	'Lejre',	'LE');
INSERT INTO @tbl2 VALUES ('Zealand',	'Lolland',	'LO');
INSERT INTO @tbl2 VALUES ('Zealand',	'Naestved',	'NA');
INSERT INTO @tbl2 VALUES ('Zealand',	'Odsherred',	'OD');
INSERT INTO @tbl2 VALUES ('Zealand',	'Ringsted',	'RI');
INSERT INTO @tbl2 VALUES ('Zealand',	'Roskilde',	'RO');
INSERT INTO @tbl2 VALUES ('Zealand',	'Slagelse',	'SL');
INSERT INTO @tbl2 VALUES ('Zealand',	'Solrod',	'SD');
INSERT INTO @tbl2 VALUES ('Zealand',	'Soro',	'SO');
INSERT INTO @tbl2 VALUES ('Zealand',	'Stevns',	'ST');
INSERT INTO @tbl2 VALUES ('Zealand',	'Vordingborg',	'VO');

SET NOCOUNT OFF



-- ======================================================================


INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl2	t
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

