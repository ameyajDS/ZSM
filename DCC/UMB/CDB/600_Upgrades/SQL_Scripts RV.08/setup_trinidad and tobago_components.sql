
/* ==================================================================================
    	Source File		:	setup_trinidad and tobago_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Trinidad And Tobago are set-up
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
WHERE	country_nm	=	'Trinidad And Tobago';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Trinidad And Tobago not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'County',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Arima'            ,	     'AR');
INSERT INTO @tbl VALUES ('Chaguanas'            ,	     'CH');
INSERT INTO @tbl VALUES ('Couva/Tabaquite/Talparo'            ,	     'CT');
INSERT INTO @tbl VALUES ('Diego Martin'            ,	     'DM');
INSERT INTO @tbl VALUES ('Eastern Tobago'            ,	     'ET');
INSERT INTO @tbl VALUES ('Mayaro/Rio Claro'            ,	     'MR');
INSERT INTO @tbl VALUES ('Penal/Debe'            ,	     'PD');
INSERT INTO @tbl VALUES ('Point Fortin'            ,	     'PF');
INSERT INTO @tbl VALUES ('Port of Spain'            ,	     'PS');
INSERT INTO @tbl VALUES ('Princes Town'            ,	     'PT');
INSERT INTO @tbl VALUES ('San Fernando'            ,	     'SF');
INSERT INTO @tbl VALUES ('Sangre Grande'            ,	     'SN');
INSERT INTO @tbl VALUES ('San Juan/Laventille'            ,	     'SL');
INSERT INTO @tbl VALUES ('Siparia'            ,	     'SI');
INSERT INTO @tbl VALUES ('Tunapuna/Piarco'            ,	     'TP');
INSERT INTO @tbl VALUES ('Western Tobago'            ,	     'WT');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================
