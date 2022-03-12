
/* ==================================================================================
    	Source File		:	setup_madagascar_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Madagascar are set-up
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
WHERE	country_nm	=	'Madagascar';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Madagascar not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Region',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Toamasina'            ,	     'Alaotra Mangoro',	'TM',	'AO');
INSERT INTO @tbl VALUES ('Fianarantsoa'            ,	     'Amoron''i Mania',	'FI',	'AM');
INSERT INTO @tbl VALUES ('Antananarivo'            ,	     'Analamanga',	'AV',	'AG');
INSERT INTO @tbl VALUES ('Toamasina'            ,	     'Analanjirofo',	'TM',	'AN');
INSERT INTO @tbl VALUES ('Toliara'            ,	     'Androy',	'TL',	'AD');
INSERT INTO @tbl VALUES ('Toliara'            ,	     'Anosy',	'TL',	'AY');
INSERT INTO @tbl VALUES ('Toliara'            ,	     'Atsimo-Andrefana',	'TL',	'AF');
INSERT INTO @tbl VALUES ('Fianarantsoa'            ,	     'Atsimo-Atsinanana',	'FI',	'AA');
INSERT INTO @tbl VALUES ('Toamasina'            ,	     'Atsinanana',	'TM',	'AI');
INSERT INTO @tbl VALUES ('Mahajanga'            ,	     'Betsiboka',	'MA',	'BE');
INSERT INTO @tbl VALUES ('Mahajanga'            ,	     'Boeny',	'MA',	'BO');
INSERT INTO @tbl VALUES ('Antananarivo'            ,	     'Bongolava',	'AV',	'BO');
INSERT INTO @tbl VALUES ('Antsiranana'            ,	     'Diana',	'AS',	'DI');
INSERT INTO @tbl VALUES ('Fianarantsoa'            ,	     'Haute Matsiatra',	'FI',	'HM');
INSERT INTO @tbl VALUES ('Fianarantsoa'            ,	     'Ihorombe',	'FI',	'HO');
INSERT INTO @tbl VALUES ('Antananarivo'            ,	     'Itasy',	'AV',	'IT');
INSERT INTO @tbl VALUES ('Mahajanga'            ,	     'Melaky',	'MA',	'ME');
INSERT INTO @tbl VALUES ('Toliara'            ,	     'Menabe',	'TL',	'ME');
INSERT INTO @tbl VALUES ('Antsiranana'            ,	     'Sava',	'AS',	'SV');
INSERT INTO @tbl VALUES ('Mahajanga'            ,	     'Sofia',	'MA',	'SF');
INSERT INTO @tbl VALUES ('Antananarivo'            ,	     'Vakinankaratra',	'AV',	'VA');
INSERT INTO @tbl VALUES ('Fianarantsoa'            ,	     'Vatovavy Fitovinany',	'FI',	'VF');

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

