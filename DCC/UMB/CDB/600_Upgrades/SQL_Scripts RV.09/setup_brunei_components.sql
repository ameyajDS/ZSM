
/* ==================================================================================
    	Source File		:	setup_brunei_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Brunei are set-up
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
WHERE	country_nm	=	'Brunei';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Brunei not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	'Mukim',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Temburong'            ,	     'Amo',	'TE',	'AM');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Bandar Seri Begawan',	'BM',	'BB');
INSERT INTO @tbl VALUES ('Temburong'            ,	     'Bangar',	'TE',	'BN');
INSERT INTO @tbl VALUES ('Temburong'            ,	     'Batu Apoi',	'TE',	'BA');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Berakas',	'BM',	'BE');
INSERT INTO @tbl VALUES ('Temburong'            ,	     'Bokok',	'TE',	'BO');
INSERT INTO @tbl VALUES ('Belait'            ,	     'Bukit Sawat',	'BE',	'BS');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Burong Pinggai Ayer',	'BM',	'BP');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Gadong',	'BM',	'GA');
INSERT INTO @tbl VALUES ('Tutong'            ,	     'Keriam',	'TU',	'KE');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Kianggeh',	'BM',	'KG');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Kilanas',	'BM',	'KL');
INSERT INTO @tbl VALUES ('Tutong'            ,	     'Kiudang',	'TU',	'KI');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Kota Batu',	'BM',	'KB');
INSERT INTO @tbl VALUES ('Belait'            ,	     'Kuala Balai',	'BE',	'BA');
INSERT INTO @tbl VALUES ('Belait'            ,	     'Kuala Belait',	'BE',	'BT');
INSERT INTO @tbl VALUES ('Belait'            ,	     'Labi',	'BE',	'LA');
INSERT INTO @tbl VALUES ('Temburong'            ,	     'Labu',	'TE',	'LA');
INSERT INTO @tbl VALUES ('Tutong'            ,	     'Lamunin',	'TU',	'LA');
INSERT INTO @tbl VALUES ('Belait'            ,	     'Liang',	'BE',	'LI');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Lumapas',	'BM',	'LU');
INSERT INTO @tbl VALUES ('Belait'            ,	     'Melilas',	'BE',	'ME');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Mentiri',	'BM',	'ME');
INSERT INTO @tbl VALUES ('Tutong'            ,	     'Pekan Tutong',	'TU',	'PT');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Pengkalan Batu',	'BM',	'PB');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Peramu',	'BM',	'PE');
INSERT INTO @tbl VALUES ('Tutong'            ,	     'Rambai',	'TU',	'RA');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Saba',	'BM',	'SA');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Sengkurong',	'BM',	'SN');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Serasa',	'BM',	'SR');
INSERT INTO @tbl VALUES ('Belait'            ,	     'Seria',	'BE',	'SE');
INSERT INTO @tbl VALUES ('Belait'            ,	     'Sukang',	'BE',	'SU');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Sungai Kebun',	'BM',	'KE');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Sungai Kedayan',	'BM',	'KD');
INSERT INTO @tbl VALUES ('Brunei and Muara'            ,	     'Tamoi',	'BM',	'TA');
INSERT INTO @tbl VALUES ('Tutong'            ,	     'Tanjong Maya',	'TU',	'TM');
INSERT INTO @tbl VALUES ('Tutong'            ,	     'Telisai',	'TU',	'TE');
INSERT INTO @tbl VALUES ('Tutong'            ,	     'Ukong',	'TU',	'UK');

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

