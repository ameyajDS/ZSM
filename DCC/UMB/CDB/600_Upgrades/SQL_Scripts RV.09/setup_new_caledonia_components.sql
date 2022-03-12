
/* ==================================================================================
    	Source File		:	setup_new_caledonia_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of New_Caledonia are set-up
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
WHERE	country_nm	=	'New Caledonia';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country New Caledonia not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Commune',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Nord'            ,	     'Belep',	'NO',	'BE');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Boulouparis',	'SU',	'BP');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Bourail',	'SU',	'BR');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Canala',	'NO',	'CA');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Dumbea',	'SU',	'DU');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Farino',	'SU',	'FA');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Hienghene',	'NO',	'HI');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Houailou',	'NO',	'HO');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Kaala-Gomen',	'NO',	'KG');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Kone',	'NO',	'KN');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Kouaoua',	'NO',	'KA');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Koumac',	'NO',	'KM');
INSERT INTO @tbl VALUES ('Sud'            ,	     'La Foa',	'SU',	'LF');
INSERT INTO @tbl VALUES ('Iles Loyaute'            ,	     'Lifou',	'IL',	'LI');
INSERT INTO @tbl VALUES ('Sud'            ,	     'l''Ile des Pins',	'SU',	'IP');
INSERT INTO @tbl VALUES ('Iles Loyaute'            ,	     'Mare',	'IL',	'MA');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Moindou',	'SU',	'MO');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Mont-Dore',	'SU',	'MD');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Noumea',	'SU',	'NO');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Ouegoa',	'NO',	'OG');
INSERT INTO @tbl VALUES ('Iles Loyaute'            ,	     'Ouvea',	'IL',	'OV');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Paita',	'SU',	'PA');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Poindimie',	'NO',	'PD');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Ponerihouen',	'NO',	'PH');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Pouebo',	'NO',	'PB');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Pouembout',	'NO',	'PT');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Poum',	'NO',	'PM');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Poya',	'NO',	'PY');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Sarramea',	'SU',	'SA');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Thio',	'SU',	'TH');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Touho',	'NO',	'TO');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Voh',	'NO',	'VO');
INSERT INTO @tbl VALUES ('Sud'            ,	     'Yate',	'SU',	'YA');

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

