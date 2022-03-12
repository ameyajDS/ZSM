/* ==================================================================================
    Source File		:	setup_uae_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sun Aug 31 13:17 2014
	Module ID		:	CDB
	Last updated	:	Aug 31, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of UAE are set-up
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
WHERE	country_nm	=	'United Arab Emirates';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country UAE not found', 16, 1);
	RETURN;
END


-- ======================================================================

INSERT INTO	level_1_address_components
	(	country_id, level_1_address_component_nm, level_1_address_component_cd	) VALUES	(	@country_id,	'Abu Dhabi',		'AZ'	)
INSERT INTO	level_1_address_components
	(	country_id, level_1_address_component_nm, level_1_address_component_cd	) VALUES	(	@country_id,	'Ajman',			'AJ'	)
INSERT INTO	level_1_address_components
	(	country_id, level_1_address_component_nm, level_1_address_component_cd	) VALUES	(	@country_id,	'Fujayrah',			'FU'	)
INSERT INTO	level_1_address_components
	(	country_id, level_1_address_component_nm, level_1_address_component_cd	) VALUES	(	@country_id,	'Ras al Khaymah',	'RK'	)
INSERT INTO	level_1_address_components
	(	country_id, level_1_address_component_nm, level_1_address_component_cd	) VALUES	(	@country_id,	'Sharjah',			'SH'	)
INSERT INTO	level_1_address_components
	(	country_id, level_1_address_component_nm, level_1_address_component_cd	) VALUES	(	@country_id,	'Umm al Qaywayn',	'UQ'	)

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================

