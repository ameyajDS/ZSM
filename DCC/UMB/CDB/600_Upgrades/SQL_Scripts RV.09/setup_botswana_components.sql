
/* ==================================================================================
    	Source File		:	setup_botswana_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Botswana are set-up
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
WHERE	country_nm	=	'Botswana';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Botswana not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'Subdistrict',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Southern'            ,	     'Barolong',	'SN',	'BR');
INSERT INTO @tbl VALUES ('Central'            ,	     'Bobonong',	'CT',	'BB');
INSERT INTO @tbl VALUES ('Central'            ,	     'Boteti',	'CT',	'BT');
INSERT INTO @tbl VALUES ('Chobe'            ,	     'Chobe',	'CH',	'CH');
INSERT INTO @tbl VALUES ('Ghanzi'            ,	     'CKGR',	'GH',	'CK');
INSERT INTO @tbl VALUES ('North-West'            ,	     'Delta',	'NC',	'DE');
INSERT INTO @tbl VALUES ('Francistown'            ,	     'Francistown',	'FR',	'FR');
INSERT INTO @tbl VALUES ('Gaborone'            ,	     'Gaborone',	'GB',	'GB');
INSERT INTO @tbl VALUES ('Ghanzi'            ,	     'Ghanzi',	'GH',	'GZ');
INSERT INTO @tbl VALUES ('Jwaneng'            ,	     'Jwaneng',	'JW',	'JW');
INSERT INTO @tbl VALUES ('Kgalagadi'            ,	     'Kgalagadi North',	'KG',	'KN');
INSERT INTO @tbl VALUES ('Kgalagadi'            ,	     'Kgalagadi South',	'KG',	'KS');
INSERT INTO @tbl VALUES ('Kgatleng'            ,	     'Kgatleng',	'KL',	'KG');
INSERT INTO @tbl VALUES ('Kweneng'            ,	     'Kweneng East',	'KW',	'KE');
INSERT INTO @tbl VALUES ('Kweneng'            ,	     'Kweneng West',	'KW',	'KW');
INSERT INTO @tbl VALUES ('Lobatse'            ,	     'Lobatse',	'LB',	'LB');
INSERT INTO @tbl VALUES ('Central'            ,	     'Mahalapye',	'CT',	'MA');
INSERT INTO @tbl VALUES ('North-West'            ,	     'Ngamiland North',	'NC',	'NN');
INSERT INTO @tbl VALUES ('North-West'            ,	     'Ngamiland South',	'NC',	'NS');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Ngwaketse',	'SN',	'NG');
INSERT INTO @tbl VALUES ('Southern'            ,	     'Ngwaketse West',	'SN',	'NW');
INSERT INTO @tbl VALUES ('North-East'            ,	     'North East',	'NR',	'NE');
INSERT INTO @tbl VALUES ('Central'            ,	     'Orapa',	'CT',	'OR');
INSERT INTO @tbl VALUES ('Selibe Phikwe'            ,	     'Selebi-Phikwe',	'SP',	'SL');
INSERT INTO @tbl VALUES ('Central'            ,	     'Serowe/Palapye',	'CT',	'SR');
INSERT INTO @tbl VALUES ('South East'            ,	     'South East',	'SR',	'SE');
INSERT INTO @tbl VALUES ('Sowa Town'            ,	     'Sowa Town',	'ST',	'SW');
INSERT INTO @tbl VALUES ('Central'            ,	     'Tutume',	'CT',	'TT');

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

