
/* ==================================================================================
    	Source File		:	setup_kenya_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Kenya are set-up
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
WHERE	country_nm	=	'Kenya';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Kenya not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'County',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIQUE);

INSERT INTO @tbl VALUES ('Baringo'            ,	     'BA');
INSERT INTO @tbl VALUES ('Bomet'            ,	     'BO');
INSERT INTO @tbl VALUES ('Bungoma'            ,	     'BN');
INSERT INTO @tbl VALUES ('Busia'            ,	     'BS');
INSERT INTO @tbl VALUES ('Elgeyo Marakwet'            ,	     'EM');
INSERT INTO @tbl VALUES ('Embu'            ,	     'EB');
INSERT INTO @tbl VALUES ('Garissa'            ,	     'GA');
INSERT INTO @tbl VALUES ('Homa Bay'            ,	     'HB');
INSERT INTO @tbl VALUES ('Isiolo'            ,	     'IS');
INSERT INTO @tbl VALUES ('Kajiado'            ,	     'KJ');
INSERT INTO @tbl VALUES ('Kakamega'            ,	     'KK');
INSERT INTO @tbl VALUES ('Kericho'            ,	     'KR');
INSERT INTO @tbl VALUES ('Kiambu'            ,	     'KB');
INSERT INTO @tbl VALUES ('Kilifi'            ,	     'KF');
INSERT INTO @tbl VALUES ('Kirinyaga'            ,	     'KY');
INSERT INTO @tbl VALUES ('Kisii'            ,	     'KI');
INSERT INTO @tbl VALUES ('Kisumu'            ,	     'KU');
INSERT INTO @tbl VALUES ('Kitui'            ,	     'KT');
INSERT INTO @tbl VALUES ('Kwale'            ,	     'KW');
INSERT INTO @tbl VALUES ('Laikipia'            ,	     'LK');
INSERT INTO @tbl VALUES ('Lamu'            ,	     'LM');
INSERT INTO @tbl VALUES ('Machakos'            ,	     'MC');
INSERT INTO @tbl VALUES ('Makueni'            ,	     'MK');
INSERT INTO @tbl VALUES ('Mandera'            ,	     'MD');
INSERT INTO @tbl VALUES ('Marsabit'            ,	     'MB');
INSERT INTO @tbl VALUES ('Meru'            ,	     'ME');
INSERT INTO @tbl VALUES ('Migori'            ,	     'MG');
INSERT INTO @tbl VALUES ('Mombasa'            ,	     'MM');
INSERT INTO @tbl VALUES ('Murang''a'            ,	     'MU');
INSERT INTO @tbl VALUES ('Nairobi'            ,	     'NB');
INSERT INTO @tbl VALUES ('Nakuru'            ,	     'NK');
INSERT INTO @tbl VALUES ('Nandi'            ,	     'ND');
INSERT INTO @tbl VALUES ('Narok'            ,	     'NR');
INSERT INTO @tbl VALUES ('Nyamira'            ,	     'NM');
INSERT INTO @tbl VALUES ('Nyandarua'            ,	     'NN');
INSERT INTO @tbl VALUES ('Nyeri'            ,	     'NI');
INSERT INTO @tbl VALUES ('Samburu'            ,	     'SA');
INSERT INTO @tbl VALUES ('Siaya'            ,	     'SI');
INSERT INTO @tbl VALUES ('Taita Taveta'            ,	     'TT');
INSERT INTO @tbl VALUES ('Tana River'            ,	     'TR');
INSERT INTO @tbl VALUES ('Tharaka Nithi'            ,	     'NT');
INSERT INTO @tbl VALUES ('Trans Nzoia'            ,	     'TN');
INSERT INTO @tbl VALUES ('Turkana'            ,	     'TU');
INSERT INTO @tbl VALUES ('Uasin Gishu'            ,	     'UG');
INSERT INTO @tbl VALUES ('Vihiga'            ,	     'VI');
INSERT INTO @tbl VALUES ('Wajir'            ,	     'WJ');
INSERT INTO @tbl VALUES ('West Pokot'            ,	     'WP');


INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================
