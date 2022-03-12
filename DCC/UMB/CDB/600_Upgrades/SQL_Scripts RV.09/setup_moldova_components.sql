
/* ==================================================================================
    	Source File		:	setup_moldova_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Moldova are set-up
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
WHERE	country_nm	=	'Moldova';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Moldova not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Anenii Noi'            ,	     'AN');
INSERT INTO @tbl VALUES ('Balti'            ,	     'BT');
INSERT INTO @tbl VALUES ('Basarabeasca'            ,	     'BA');
INSERT INTO @tbl VALUES ('Bender'            ,	     'BD');
INSERT INTO @tbl VALUES ('Briceni'            ,	     'BR');
INSERT INTO @tbl VALUES ('Cahul'            ,	     'CH');
INSERT INTO @tbl VALUES ('Calarasi'            ,	     'CA');
INSERT INTO @tbl VALUES ('Cantemir'            ,	     'CN');
INSERT INTO @tbl VALUES ('Causeni'            ,	     'CU');
INSERT INTO @tbl VALUES ('Chisinau'            ,	     'CV');
INSERT INTO @tbl VALUES ('Cimislia'            ,	     'CS');
INSERT INTO @tbl VALUES ('Criuleni'            ,	     'CR');
INSERT INTO @tbl VALUES ('Donduseni'            ,	     'DO');
INSERT INTO @tbl VALUES ('Drochia'            ,	     'DR');
INSERT INTO @tbl VALUES ('Dubasari'            ,	     'DB');
INSERT INTO @tbl VALUES ('Edinet'            ,	     'ED');
INSERT INTO @tbl VALUES ('Falesti'            ,	     'FA');
INSERT INTO @tbl VALUES ('Floresti'            ,	     'FL');
INSERT INTO @tbl VALUES ('Gagauzia'            ,	     'GA');
INSERT INTO @tbl VALUES ('Glodeni'            ,	     'GL');
INSERT INTO @tbl VALUES ('Hincesti'            ,	     'HI');
INSERT INTO @tbl VALUES ('Ialoveni'            ,	     'IA');
INSERT INTO @tbl VALUES ('Leova'            ,	     'LE');
INSERT INTO @tbl VALUES ('Nisporeni'            ,	     'NI');
INSERT INTO @tbl VALUES ('Ocnita'            ,	     'OC');
INSERT INTO @tbl VALUES ('Orhei'            ,	     'OH');
INSERT INTO @tbl VALUES ('Rezina'            ,	     'RZ');
INSERT INTO @tbl VALUES ('Riscani'            ,	     'RS');
INSERT INTO @tbl VALUES ('Singerei'            ,	     'SI');
INSERT INTO @tbl VALUES ('Soldanesti'            ,	     'SD');
INSERT INTO @tbl VALUES ('Soroca'            ,	     'SO');
INSERT INTO @tbl VALUES ('Stefan Voda'            ,	     'SV');
INSERT INTO @tbl VALUES ('Straseni'            ,	     'ST');
INSERT INTO @tbl VALUES ('Taraclia'            ,	     'TA');
INSERT INTO @tbl VALUES ('Telenesti'            ,	     'TE');
INSERT INTO @tbl VALUES ('Transnistria'            ,	     'DU');
INSERT INTO @tbl VALUES ('Ungheni'            ,	     'UG');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
