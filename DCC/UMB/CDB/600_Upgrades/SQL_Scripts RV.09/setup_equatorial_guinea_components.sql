
/* ==================================================================================
    	Source File		:	setup_equatorial_guinea_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Equatorial_Guinea are set-up
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
WHERE	country_nm	=	'Equatorial Guinea';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Equatorial Guinea not found', 16, 1);
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

INSERT INTO @tbl VALUES ('Wele-Nzas'            ,	     'Ayene',	'WN',	'AY');
INSERT INTO @tbl VALUES ('Wele-Nzas'            ,	     'Aconibe',	'WN',	'AC');
INSERT INTO @tbl VALUES ('Annobon'            ,	     'Annobon',	'AN',	'AN');
INSERT INTO @tbl VALUES ('Centro Sur'            ,	     'Acurenam',	'CS',	'AR');
INSERT INTO @tbl VALUES ('Wele-Nzas'            ,	     'Anisok',	'WN',	'AS');
INSERT INTO @tbl VALUES ('Litoral'            ,	     'Bitica',	'LI',	'BC');
INSERT INTO @tbl VALUES ('Centro Sur'            ,	     'Bicurga',	'CS',	'BG');
INSERT INTO @tbl VALUES ('Kie-Ntem'            ,	     'Bidjabidjan',	'KN',	'BJ');
INSERT INTO @tbl VALUES ('Bioko Norte'            ,	     'Baney',	'BN',	'BN');
INSERT INTO @tbl VALUES ('Litoral'            ,	     'Bata',	'LI',	'BT');
INSERT INTO @tbl VALUES ('Litoral'            ,	     'Corisco',	'LI',	'CR');
INSERT INTO @tbl VALUES ('Litoral'            ,	     'Cogo',	'LI',	'CO');
INSERT INTO @tbl VALUES ('Kie-Ntem'            ,	     'Ebebiyin',	'KN',	'EB');
INSERT INTO @tbl VALUES ('Centro Sur'            ,	     'Evinayong',	'CS',	'EV');
INSERT INTO @tbl VALUES ('Bioko Sur'            ,	     'Luba',	'BS',	'LU');
INSERT INTO @tbl VALUES ('Litoral'            ,	     'Machinda',	'LI',	'MC');
INSERT INTO @tbl VALUES ('Wele-Nzas'            ,	     'Mongomeyen',	'WN',	'MM');
INSERT INTO @tbl VALUES ('Litoral'            ,	     'Mbini',	'LI',	'MB');
INSERT INTO @tbl VALUES ('Wele-Nzas'            ,	     'Mongomo',	'WN',	'MG');
INSERT INTO @tbl VALUES ('Bioko Norte'            ,	     'Malabo',	'BN',	'ML');
INSERT INTO @tbl VALUES ('Kie-Ntem'            ,	     'Micomeseng',	'KN',	'MS');
INSERT INTO @tbl VALUES ('Centro Sur'            ,	     'Nkimi',	'CS',	'NM');
INSERT INTO @tbl VALUES ('Kie-Ntem'            ,	     'Nkue',	'KN',	'NK');
INSERT INTO @tbl VALUES ('Kie-Ntem'            ,	     'Nasng',	'KN',	'NS');
INSERT INTO @tbl VALUES ('Centro Sur'            ,	     'Niefang',	'CS',	'NF');
INSERT INTO @tbl VALUES ('Kie-Ntem'            ,	     'Nsok-Nsomo',	'KN',	'NN');
INSERT INTO @tbl VALUES ('Wele-Nzas'            ,	     'Nsork',	'WN',	'NR');
INSERT INTO @tbl VALUES ('Bioko Norte'            ,	     'Rebola',	'BN',	'RB');
INSERT INTO @tbl VALUES ('Litoral'            ,	     'Rio Campo',	'LI',	'RC');
INSERT INTO @tbl VALUES ('Bioko Sur'            ,	     'Riaba',	'BS',	'RI');

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

