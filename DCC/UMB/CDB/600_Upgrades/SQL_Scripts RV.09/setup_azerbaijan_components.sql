
/* ==================================================================================
    	Source File		:	setup_azerbaijan_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Azerbaijan are set-up
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
WHERE	country_nm	=	'Azerbaijan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Azerbaijan not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;


-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Absheron'            ,	     'AR');
INSERT INTO @tbl VALUES ('Aghdam'            ,	     'AM');
INSERT INTO @tbl VALUES ('Aghdash'            ,	     'AS');
INSERT INTO @tbl VALUES ('Aghjabedi'            ,	     'AC');
INSERT INTO @tbl VALUES ('Aghstafa'            ,	     'AF');
INSERT INTO @tbl VALUES ('Aghsu'            ,	     'AU');
INSERT INTO @tbl VALUES ('Astara'            ,	     'AA');
INSERT INTO @tbl VALUES ('Babek'            ,	     'BK');
INSERT INTO @tbl VALUES ('Baku'            ,	     'BA');
INSERT INTO @tbl VALUES ('Balaken'            ,	     'BL');
INSERT INTO @tbl VALUES ('Barda'            ,	     'BR');
INSERT INTO @tbl VALUES ('Beilagan'            ,	     'BQ');
INSERT INTO @tbl VALUES ('Bilasuvar'            ,	     'BS');
INSERT INTO @tbl VALUES ('Dashkesan'            ,	     'DS');
INSERT INTO @tbl VALUES ('Fizuli'            ,	     'FU');
INSERT INTO @tbl VALUES ('Gabala'            ,	     'QA');
INSERT INTO @tbl VALUES ('Gadabey'            ,	     'GD');
INSERT INTO @tbl VALUES ('Gakh'            ,	     'QX');
INSERT INTO @tbl VALUES ('Ganja'            ,	     'GA');
INSERT INTO @tbl VALUES ('Gazakh'            ,	     'QZ');
INSERT INTO @tbl VALUES ('Geranboy'            ,	     'GR');
INSERT INTO @tbl VALUES ('Gobustan'            ,	     'QO');
INSERT INTO @tbl VALUES ('Goychay'            ,	     'GY');
INSERT INTO @tbl VALUES ('Goygol'            ,	     'XR');
INSERT INTO @tbl VALUES ('Guba'            ,	     'QB');
INSERT INTO @tbl VALUES ('Gubadly'            ,	     'QD');
INSERT INTO @tbl VALUES ('Gusar'            ,	     'QR');
INSERT INTO @tbl VALUES ('Hacuqabul'            ,	     'HA');
INSERT INTO @tbl VALUES ('Imishli'            ,	     'IM');
INSERT INTO @tbl VALUES ('Ismailly'            ,	     'IS');
INSERT INTO @tbl VALUES ('Jalilabad'            ,	     'CL');
INSERT INTO @tbl VALUES ('Jebrail'            ,	     'CB');
INSERT INTO @tbl VALUES ('Julfa'            ,	     'CF');
INSERT INTO @tbl VALUES ('Kangarli'            ,	     'KG');
INSERT INTO @tbl VALUES ('Kelbajar'            ,	     'KA');
INSERT INTO @tbl VALUES ('Khachmaz'            ,	     'XZ');
INSERT INTO @tbl VALUES ('Khankendy'            ,	     'XA');
INSERT INTO @tbl VALUES ('Khojaly'            ,	     'XC');
INSERT INTO @tbl VALUES ('Khojavend'            ,	     'XD');
INSERT INTO @tbl VALUES ('Khyzy'            ,	     'XI');
INSERT INTO @tbl VALUES ('Kyurdamir'            ,	     'KU');
INSERT INTO @tbl VALUES ('Lachin'            ,	     'LC');
INSERT INTO @tbl VALUES ('Lenkaran'            ,	     'LN');
INSERT INTO @tbl VALUES ('Lerik'            ,	     'LE');
INSERT INTO @tbl VALUES ('Masally'            ,	     'MA');
INSERT INTO @tbl VALUES ('Mingechevir'            ,	     'MI');
INSERT INTO @tbl VALUES ('Naftalan'            ,	     'NA');
INSERT INTO @tbl VALUES ('Nakhchivan'            ,	     'NX');
INSERT INTO @tbl VALUES ('Neftchala'            ,	     'NE');
INSERT INTO @tbl VALUES ('Oghuz'            ,	     'OG');
INSERT INTO @tbl VALUES ('Ordubad'            ,	     'OR');
INSERT INTO @tbl VALUES ('Saatly'            ,	     'ST');
INSERT INTO @tbl VALUES ('Sabirabad'            ,	     'SB');
INSERT INTO @tbl VALUES ('Salyan'            ,	     'SL');
INSERT INTO @tbl VALUES ('Samuh'            ,	     'SX');
INSERT INTO @tbl VALUES ('Sedarak'            ,	     'SD');
INSERT INTO @tbl VALUES ('Shabran'            ,	     'DV');
INSERT INTO @tbl VALUES ('Shahbuz'            ,	     'SH');
INSERT INTO @tbl VALUES ('Shamakhy'            ,	     'SI');
INSERT INTO @tbl VALUES ('Shamkir'            ,	     'SM');
INSERT INTO @tbl VALUES ('Sheki'            ,	     'SK');
INSERT INTO @tbl VALUES ('Sherur'            ,	     'SE');
INSERT INTO @tbl VALUES ('Shirvan'            ,	     'AB');
INSERT INTO @tbl VALUES ('Shusha'            ,	     'SU');
INSERT INTO @tbl VALUES ('Siazan'            ,	     'SY');
INSERT INTO @tbl VALUES ('Sumgayit'            ,	     'SQ');
INSERT INTO @tbl VALUES ('Terter'            ,	     'TA');
INSERT INTO @tbl VALUES ('Tovuz'            ,	     'TO');
INSERT INTO @tbl VALUES ('Ujar'            ,	     'UC');
INSERT INTO @tbl VALUES ('Yardymly'            ,	     'YR');
INSERT INTO @tbl VALUES ('Yevlakh'            ,	     'YE');
INSERT INTO @tbl VALUES ('Zagatala'            ,	     'ZQ');
INSERT INTO @tbl VALUES ('Zangilan'            ,	     'ZG');
INSERT INTO @tbl VALUES ('Zerdab'            ,	     'ZR');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
