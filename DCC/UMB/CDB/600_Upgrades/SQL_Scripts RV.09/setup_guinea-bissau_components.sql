
/* ==================================================================================
    	Source File		:	setup_guinea-bissau_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Guinea-Bissau are set-up
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
WHERE	country_nm	=	'Guinea-Bissau';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Guinea-Bissau not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Sector',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Bafata'            ,	     'Bafata',	'BA',	'BF');
INSERT INTO @tbl VALUES ('Bafata'            ,	     'Bambadinca',	'BA',	'BM');
INSERT INTO @tbl VALUES ('Tombali'            ,	     'Bedanda',	'TO',	'BD');
INSERT INTO @tbl VALUES ('Cacheu'            ,	     'Bigene',	'CA',	'BG');
INSERT INTO @tbl VALUES ('Bissau'            ,	     'Bissau',	'BS',	'BS');
INSERT INTO @tbl VALUES ('Oio'            ,	     'Bissora',	'OI',	'BR');
INSERT INTO @tbl VALUES ('Gabu'            ,	     'Boe',	'GA',	'BE');
INSERT INTO @tbl VALUES ('Bolama'            ,	     'Bolama',	'BL',	'BO');
INSERT INTO @tbl VALUES ('Quinara'            ,	     'Buba',	'QU',	'BB');
INSERT INTO @tbl VALUES ('Bolama'            ,	     'Bubaque',	'BL',	'BQ');
INSERT INTO @tbl VALUES ('Cacheu'            ,	     'Bula',	'CA',	'BL');
INSERT INTO @tbl VALUES ('Cacheu'            ,	     'Cacheu',	'CA',	'CU');
INSERT INTO @tbl VALUES ('Tombali'            ,	     'Cacine',	'TO',	'CC');
INSERT INTO @tbl VALUES ('Cacheu'            ,	     'Caio',	'CA',	'CI');
INSERT INTO @tbl VALUES ('Cacheu'            ,	     'Canchungo',	'CA',	'CN');
INSERT INTO @tbl VALUES ('Bolama'            ,	     'Caravela',	'BL',	'CR');
INSERT INTO @tbl VALUES ('Tombali'            ,	     'Catio',	'TO',	'CO');
INSERT INTO @tbl VALUES ('Bafata'            ,	     'Contuboel',	'BA',	'CB');
INSERT INTO @tbl VALUES ('Bafata'            ,	     'Cosse',	'BA',	'GC');
INSERT INTO @tbl VALUES ('Quinara'            ,	     'Empada',	'QU',	'EM');
INSERT INTO @tbl VALUES ('Oio'            ,	     'Farim',	'OI',	'FM');
INSERT INTO @tbl VALUES ('Quinara'            ,	     'Fulacunda',	'QU',	'FC');
INSERT INTO @tbl VALUES ('Gabu'            ,	     'Gabu',	'GA',	'GB');
INSERT INTO @tbl VALUES ('Bafata'            ,	     'Gamamudo',	'BA',	'GM');
INSERT INTO @tbl VALUES ('Tombali'            ,	     'Komo',	'TO',	'KO');
INSERT INTO @tbl VALUES ('Oio'            ,	     'Mansaba',	'OI',	'MB');
INSERT INTO @tbl VALUES ('Oio'            ,	     'Mansoa',	'OI',	'MO');
INSERT INTO @tbl VALUES ('Oio'            ,	     'Nhacra',	'OI',	'NH');
INSERT INTO @tbl VALUES ('Gabu'            ,	     'Pirada',	'GA',	'PD');
INSERT INTO @tbl VALUES ('Gabu'            ,	     'Pitche',	'GA',	'PT');
INSERT INTO @tbl VALUES ('Biombo'            ,	     'Prabis',	'BM',	'PB');
INSERT INTO @tbl VALUES ('Tombali'            ,	     'Quebo',	'TO',	'QB');
INSERT INTO @tbl VALUES ('Biombo'            ,	     'Quinhamel',	'BM',	'QN');
INSERT INTO @tbl VALUES ('Biombo'            ,	     'Safim',	'BM',	'SF');
INSERT INTO @tbl VALUES ('Cacheu'            ,	     'Sao Domingos',	'CA',	'SD');
INSERT INTO @tbl VALUES ('Gabu'            ,	     'Sonaco',	'GA',	'SN');
INSERT INTO @tbl VALUES ('Quinara'            ,	     'Tite',	'QU',	'TT');
INSERT INTO @tbl VALUES ('Bolama'            ,	     'Uno',	'BL',	'UN');
INSERT INTO @tbl VALUES ('Bafata'            ,	     'Xitole',	'BA',	'XT');

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

