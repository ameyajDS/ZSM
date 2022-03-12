
/* ==================================================================================
    	Source File		:	setup_greenland_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Greenland are set-up
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
WHERE	country_nm	=	'Greenland';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Greenland not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Commune',
		level_2_address_component	=	'Municipality',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Qaasuitsup'            ,	     'Aasiaat',	'QS',	'AA');
INSERT INTO @tbl VALUES ('Qaasuitsup'            ,	     'Avanersuaq',	'QS',	'AV');
INSERT INTO @tbl VALUES ('Qaasuitsup'            ,	     'Ilulissat',	'QS',	'IL');
INSERT INTO @tbl VALUES ('Sermersooq'            ,	     'Ittoqqortoormiit',	'SE',	'IT');
INSERT INTO @tbl VALUES ('Sermersooq'            ,	     'Ivittuut',	'SE',	'IV');
INSERT INTO @tbl VALUES ('Qaasuitsup'            ,	     'Kangaatsiaq',	'QS',	'KA');
INSERT INTO @tbl VALUES ('Qeqqata'            ,	     'Maniitsoq',	'QT',	'MA');
INSERT INTO @tbl VALUES ('Kujalleq'            ,	     'Nanortalik',	'KU',	'NN');
INSERT INTO @tbl VALUES ('Kujalleq'            ,	     'Narsaq',	'KU',	'NR');
INSERT INTO @tbl VALUES ('Sermersooq'            ,	     'Nuuk',	'SE',	'NU');
INSERT INTO @tbl VALUES ('Sermersooq'            ,	     'Paamiut',	'SE',	'PA');
INSERT INTO @tbl VALUES ('Kujalleq'            ,	     'Qaqortoq',	'KU',	'QQ');
INSERT INTO @tbl VALUES ('Qaasuitsup'            ,	     'Qasigiannguit',	'QS',	'QG');
INSERT INTO @tbl VALUES ('Qaasuitsup'            ,	     'Qeqertarsuaq',	'QS',	'QE');
INSERT INTO @tbl VALUES ('Qeqqata'            ,	     'Sisimiut',	'QT',	'SI');
INSERT INTO @tbl VALUES ('Sermersooq'            ,	     'Tasiilaq',	'SE',	'TA');
INSERT INTO @tbl VALUES ('Unorganized'            ,	     'Unorganized',	'UO',	'UO');
INSERT INTO @tbl VALUES ('Qaasuitsup'            ,	     'Upernavik',	'QS',	'UP');
INSERT INTO @tbl VALUES ('Qaasuitsup'            ,	     'Uummannaq',	'QS',	'UM');

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

