
/* ==================================================================================
    	Source File		:	setup_mauritania_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Mauritania are set-up
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
WHERE	country_nm	=	'Mauritania';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Mauritania not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Department',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Hodh el Gharbi'            ,	     'Aioun',	'HG',	'AI');
INSERT INTO @tbl VALUES ('Inchiri'            ,	     'Akjoujt',	'IN',	'AK');
INSERT INTO @tbl VALUES ('Brakna'            ,	     'Aleg',	'BR',	'AL');
INSERT INTO @tbl VALUES ('Hodh ech Chargui'            ,	     'Amourj',	'HC',	'AM');
INSERT INTO @tbl VALUES ('Adrar'            ,	     'Aoujeft',	'AD',	'AO');
INSERT INTO @tbl VALUES ('Nouakchott'            ,	     'Arafat',	'NO',	'AR');
INSERT INTO @tbl VALUES ('Adrar'            ,	     'Atar',	'AD',	'AT');
INSERT INTO @tbl VALUES ('Brakna'            ,	     'Bababe',	'BR',	'BB');
INSERT INTO @tbl VALUES ('Assaba'            ,	     'Barkeol',	'AS',	'BK');
INSERT INTO @tbl VALUES ('Hodh ech Chargui'            ,	     'Bassikounou',	'HC',	'BA');
INSERT INTO @tbl VALUES ('Tiris Zemmour'            ,	     'Bir Moghrein',	'TZ',	'BM');
INSERT INTO @tbl VALUES ('Brakna'            ,	     'Boghe',	'BR',	'BG');
INSERT INTO @tbl VALUES ('Assaba'            ,	     'Boumdeid',	'AS',	'BD');
INSERT INTO @tbl VALUES ('Trarza'            ,	     'Boutilimit',	'TR',	'BT');
INSERT INTO @tbl VALUES ('Dakhlet Nouadhibou'            ,	     'Chami',	'DN',	'CM');
INSERT INTO @tbl VALUES ('Adrar'            ,	     'Chinguetti',	'AD',	'CH');
INSERT INTO @tbl VALUES ('Nouakchott'            ,	     'Dar Naim',	'NO',	'DN');
INSERT INTO @tbl VALUES ('Hodh ech Chargui'            ,	     'Djiguenni',	'HC',	'DJ');
INSERT INTO @tbl VALUES ('Nouakchott'            ,	     'El Mina',	'NO',	'EM');
INSERT INTO @tbl VALUES ('Tiris Zemmour'            ,	     'F''Derik',	'TZ',	'FD');
INSERT INTO @tbl VALUES ('Assaba'            ,	     'Guerou',	'AS',	'GU');
INSERT INTO @tbl VALUES ('Assaba'            ,	     'Kankossa',	'AS',	'KK');
INSERT INTO @tbl VALUES ('Gorgol'            ,	     'Kaedi',	'GO',	'KD');
INSERT INTO @tbl VALUES ('Trarza'            ,	     'Keur-Macene',	'TR',	'KM');
INSERT INTO @tbl VALUES ('Assaba'            ,	     'Kiffa',	'AS',	'KF');
INSERT INTO @tbl VALUES ('Hodh el Gharbi'            ,	     'Kobenni',	'HG',	'KB');
INSERT INTO @tbl VALUES ('Nouakchott'            ,	     'Ksar',	'NO',	'KS');
INSERT INTO @tbl VALUES ('Gorgol'            ,	     'Maghama',	'GO',	'MG');
INSERT INTO @tbl VALUES ('Brakna'            ,	     'Magta-Lahjar',	'BR',	'ML');
INSERT INTO @tbl VALUES ('Brakna'            ,	     'M''Bagne',	'BR',	'MB');
INSERT INTO @tbl VALUES ('Gorgol'            ,	     'M''Bout',	'GO',	'MT');
INSERT INTO @tbl VALUES ('Trarza'            ,	     'Mederdra',	'TR',	'MD');
INSERT INTO @tbl VALUES ('Gorgol'            ,	     'Monguel',	'GO',	'MN');
INSERT INTO @tbl VALUES ('Tagant'            ,	     'Moudjeria',	'TG',	'MJ');
INSERT INTO @tbl VALUES ('Hodh ech Chargui'            ,	     'N''Beiket Lehwach',	'HC',	'NL');
INSERT INTO @tbl VALUES ('Hodh ech Chargui'            ,	     'Nema',	'HC',	'NE');
INSERT INTO @tbl VALUES ('Dakhlet Nouadhibou'            ,	     'Nouadhibou',	'DN',	'ND');
INSERT INTO @tbl VALUES ('Trarza'            ,	     'Ouad-Naga',	'TR',	'ON');
INSERT INTO @tbl VALUES ('Adrar'            ,	     'Ouadane',	'AD',	'OD');
INSERT INTO @tbl VALUES ('Hodh ech Chargui'            ,	     'Oualata',	'HC',	'OT');
INSERT INTO @tbl VALUES ('Guidimaka'            ,	     'Ould Yenge',	'GD',	'OY');
INSERT INTO @tbl VALUES ('Trarza'            ,	     'R''Kiz',	'TR',	'RK');
INSERT INTO @tbl VALUES ('Nouakchott'            ,	     'Riad',	'NO',	'RI');
INSERT INTO @tbl VALUES ('Trarza'            ,	     'Rosso',	'TR',	'RO');
INSERT INTO @tbl VALUES ('Nouakchott'            ,	     'Sebkha',	'NO',	'SK');
INSERT INTO @tbl VALUES ('Guidimaka'            ,	     'Selibaby',	'GD',	'SB');
INSERT INTO @tbl VALUES ('Hodh el Gharbi'            ,	     'Tamchakett',	'HG',	'TA');
INSERT INTO @tbl VALUES ('Nouakchott'            ,	     'Tevragh-Zein',	'NO',	'TZ');
INSERT INTO @tbl VALUES ('Nouakchott'            ,	     'Teyarett',	'NO',	'TY');
INSERT INTO @tbl VALUES ('Tagant'            ,	     'Tichitt',	'TG',	'TC');
INSERT INTO @tbl VALUES ('Tagant'            ,	     'Tidjikja',	'TG',	'TJ');
INSERT INTO @tbl VALUES ('Hodh ech Chargui'            ,	     'Timbedra',	'HC',	'TB');
INSERT INTO @tbl VALUES ('Hodh el Gharbi'            ,	     'Tintane',	'HG',	'TT');
INSERT INTO @tbl VALUES ('Nouakchott'            ,	     'Toujounine',	'NO',	'TO');
INSERT INTO @tbl VALUES ('Tiris Zemmour'            ,	     'Zouerate',	'TZ',	'ZO');

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

