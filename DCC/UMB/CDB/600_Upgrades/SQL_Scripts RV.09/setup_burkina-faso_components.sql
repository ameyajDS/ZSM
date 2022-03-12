
/* ==================================================================================
    	Source File		:	setup_burkina-faso_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Burkina-Faso are set-up
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
WHERE	country_nm	=	'Burkina Faso';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Burkina Faso not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Province',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Boucle du Mouhoun'            ,	     'Bale',	'BO',	'BA');
INSERT INTO @tbl VALUES ('Centre Nord'            ,	     'Bam',	'CN',	'BM');
INSERT INTO @tbl VALUES ('Boucle du Mouhoun'            ,	     'Banwa',	'BO',	'BW');
INSERT INTO @tbl VALUES ('Centre Sud'            ,	     'Bazega',	'CS',	'BZ');
INSERT INTO @tbl VALUES ('Sud-Ouest'            ,	     'Bougouriba',	'SO',	'BB');
INSERT INTO @tbl VALUES ('Centre Est'            ,	     'Boulgou',	'CE',	'BL');
INSERT INTO @tbl VALUES ('Centre Ouest'            ,	     'Boulkiemde',	'CO',	'BK');
INSERT INTO @tbl VALUES ('Cascades'            ,	     'Comoe',	'CD',	'KM');
INSERT INTO @tbl VALUES ('Plateau Central'            ,	     'Ganzourgou',	'PC',	'GZ');
INSERT INTO @tbl VALUES ('Est'            ,	     'Gnagna',	'ES',	'GG');
INSERT INTO @tbl VALUES ('Est'            ,	     'Gourma',	'ES',	'GM');
INSERT INTO @tbl VALUES ('Hauts Bassins'            ,	     'Houet',	'HB',	'HO');
INSERT INTO @tbl VALUES ('Sud-Ouest'            ,	     'Ioba',	'SO',	'IO');
INSERT INTO @tbl VALUES ('Centre'            ,	     'Kadiogo',	'CT',	'KA');
INSERT INTO @tbl VALUES ('Hauts Bassins'            ,	     'Kenedougou',	'HB',	'KN');
INSERT INTO @tbl VALUES ('Est'            ,	     'Komandjoari',	'ES',	'KJ');
INSERT INTO @tbl VALUES ('Est'            ,	     'Kompienga',	'ES',	'KP');
INSERT INTO @tbl VALUES ('Boucle du Mouhoun'            ,	     'Kossi',	'BO',	'KS');
INSERT INTO @tbl VALUES ('Centre Est'            ,	     'Koulpelogo',	'CE',	'KL');
INSERT INTO @tbl VALUES ('Centre Est'            ,	     'Kouritenga',	'CE',	'KR');
INSERT INTO @tbl VALUES ('Plateau Central'            ,	     'Kourweogo',	'PC',	'KW');
INSERT INTO @tbl VALUES ('Cascades'            ,	     'Leraba',	'CD',	'LE');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Loroum',	'NO',	'LO');
INSERT INTO @tbl VALUES ('Boucle du Mouhoun'            ,	     'Mouhoun',	'BO',	'MO');
INSERT INTO @tbl VALUES ('Centre Sud'            ,	     'Nahouri',	'CS',	'NR');
INSERT INTO @tbl VALUES ('Centre Nord'            ,	     'Namentenga',	'CN',	'NM');
INSERT INTO @tbl VALUES ('Boucle du Mouhoun'            ,	     'Nayala',	'BO',	'NY');
INSERT INTO @tbl VALUES ('Sud-Ouest'            ,	     'Noumbiel',	'SO',	'NB');
INSERT INTO @tbl VALUES ('Plateau Central'            ,	     'Oubritenga',	'PC',	'OB');
INSERT INTO @tbl VALUES ('Sahel'            ,	     'Oudalan',	'SA',	'OD');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Passore',	'NO',	'PA');
INSERT INTO @tbl VALUES ('Sud-Ouest'            ,	     'Poni',	'SO',	'PO');
INSERT INTO @tbl VALUES ('Centre Ouest'            ,	     'Sanguie',	'CO',	'SG');
INSERT INTO @tbl VALUES ('Centre Nord'            ,	     'Sanmatenga',	'CN',	'ST');
INSERT INTO @tbl VALUES ('Sahel'            ,	     'Seno',	'SA',	'SE');
INSERT INTO @tbl VALUES ('Centre Ouest'            ,	     'Sissili',	'CO',	'SS');
INSERT INTO @tbl VALUES ('Sahel'            ,	     'Soum',	'SA',	'SM');
INSERT INTO @tbl VALUES ('Boucle du Mouhoun'            ,	     'Sourou',	'BO',	'SR');
INSERT INTO @tbl VALUES ('Est'            ,	     'Tapoa',	'ES',	'TA');
INSERT INTO @tbl VALUES ('Hauts Bassins'            ,	     'Tuy',	'HB',	'TU');
INSERT INTO @tbl VALUES ('Sahel'            ,	     'Yagha',	'SA',	'YG');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Yatenga',	'NO',	'YT');
INSERT INTO @tbl VALUES ('Centre Ouest'            ,	     'Ziro',	'CO',	'ZR');
INSERT INTO @tbl VALUES ('Nord'            ,	     'Zondoma',	'NO',	'ZM');
INSERT INTO @tbl VALUES ('Centre Sud'            ,	     'Zoundweogo',	'CS',	'ZW');

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

