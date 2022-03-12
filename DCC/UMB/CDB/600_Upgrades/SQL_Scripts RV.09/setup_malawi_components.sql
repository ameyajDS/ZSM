
/* ==================================================================================
    	Source File		:	setup_malawi_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	12-10-2014
	Module ID		:	CDB
	Last updated		:	12-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Malawi are set-up
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
WHERE	country_nm	=	'Malawi';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Malawi not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'District',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Balaka'            ,	     'BA');
INSERT INTO @tbl VALUES ('Blantyre'            ,	     'BL');
INSERT INTO @tbl VALUES ('Chikwawa'            ,	     'CK');
INSERT INTO @tbl VALUES ('Chiradzulu'            ,	     'CR');
INSERT INTO @tbl VALUES ('Chitipa'            ,	     'CT');
INSERT INTO @tbl VALUES ('Dedza'            ,	     'DE');
INSERT INTO @tbl VALUES ('Dowa'            ,	     'DO');
INSERT INTO @tbl VALUES ('Karonga'            ,	     'KR');
INSERT INTO @tbl VALUES ('Kasungu'            ,	     'KS');
INSERT INTO @tbl VALUES ('Likoma'            ,	     'LK');
INSERT INTO @tbl VALUES ('Lilongwe'            ,	     'LI');
INSERT INTO @tbl VALUES ('Machinga'            ,	     'MA');
INSERT INTO @tbl VALUES ('Mangochi'            ,	     'MG');
INSERT INTO @tbl VALUES ('Mchinji'            ,	     'MC');
INSERT INTO @tbl VALUES ('Mulanje'            ,	     'MJ');
INSERT INTO @tbl VALUES ('Mwanza'            ,	     'MN');
INSERT INTO @tbl VALUES ('Mzimba'            ,	     'MZ');
INSERT INTO @tbl VALUES ('Neno'            ,	     'NN');
INSERT INTO @tbl VALUES ('Nkhata Bay'            ,	     'NA');
INSERT INTO @tbl VALUES ('Nkhotakota'            ,	     'NK');
INSERT INTO @tbl VALUES ('Nsanje'            ,	     'NS');
INSERT INTO @tbl VALUES ('Ntcheu'            ,	     'NU');
INSERT INTO @tbl VALUES ('Ntchisi'            ,	     'NI');
INSERT INTO @tbl VALUES ('Phalombe'            ,	     'PH');
INSERT INTO @tbl VALUES ('Rumphi'            ,	     'RU');
INSERT INTO @tbl VALUES ('Salima'            ,	     'SA');
INSERT INTO @tbl VALUES ('Thyolo'            ,	     'TH');
INSERT INTO @tbl VALUES ('Zomba'            ,	     'ZO');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;
-- ======================================================================
