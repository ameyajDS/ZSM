
/* ==================================================================================
    	Source File		:	setup_marshall islands_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Marshall Islands are set-up
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
WHERE	country_nm	=	'Marshall Islands';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Marshall Islands not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Municipality',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Ailinginae'            ,	     'AI');
INSERT INTO @tbl VALUES ('Ailinglaplap'            ,	     'AP');
INSERT INTO @tbl VALUES ('Ailuk'            ,	     'AK');
INSERT INTO @tbl VALUES ('Arno'            ,	     'AR');
INSERT INTO @tbl VALUES ('Aur'            ,	     'AU');
INSERT INTO @tbl VALUES ('Bikar'            ,	     'BR');
INSERT INTO @tbl VALUES ('Bikini'            ,	     'BN');
INSERT INTO @tbl VALUES ('Bokak'            ,	     'BO');
INSERT INTO @tbl VALUES ('Ebon'            ,	     'EB');
INSERT INTO @tbl VALUES ('Enewetak'            ,	     'EN');
INSERT INTO @tbl VALUES ('Erikub'            ,	     'ER');
INSERT INTO @tbl VALUES ('Jabat'            ,	     'JB');
INSERT INTO @tbl VALUES ('Jaluit'            ,	     'JL');
INSERT INTO @tbl VALUES ('Jemo'            ,	     'JE');
INSERT INTO @tbl VALUES ('Kili'            ,	     'KI');
INSERT INTO @tbl VALUES ('Kwajalein'            ,	     'KW');
INSERT INTO @tbl VALUES ('Lae'            ,	     'LA');
INSERT INTO @tbl VALUES ('Lib'            ,	     'LB');
INSERT INTO @tbl VALUES ('Likiep'            ,	     'LK');
INSERT INTO @tbl VALUES ('Majuro'            ,	     'MJ');
INSERT INTO @tbl VALUES ('Maloelap'            ,	     'ML');
INSERT INTO @tbl VALUES ('Mejit'            ,	     'ME');
INSERT INTO @tbl VALUES ('Mili'            ,	     'MI');
INSERT INTO @tbl VALUES ('Namorik'            ,	     'NK');
INSERT INTO @tbl VALUES ('Namu'            ,	     'NU');
INSERT INTO @tbl VALUES ('Rongelap'            ,	     'RL');
INSERT INTO @tbl VALUES ('Rongrik'            ,	     'RR');
INSERT INTO @tbl VALUES ('Toke'            ,	     'TO');
INSERT INTO @tbl VALUES ('Ujae'            ,	     'UJ');
INSERT INTO @tbl VALUES ('Ujelang'            ,	     'UL');
INSERT INTO @tbl VALUES ('Utirik'            ,	     'UT');
INSERT INTO @tbl VALUES ('Wotho'            ,	     'WH');
INSERT INTO @tbl VALUES ('Wotje'            ,	     'WJ');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
