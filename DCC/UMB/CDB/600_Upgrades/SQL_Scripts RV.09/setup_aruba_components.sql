
/* ==================================================================================
   	Source File		:	setup_aruba_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	13-10-2014
	Module ID		:	CDB
	Last updated	:	13-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Aruba are set-up
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
WHERE	country_nm	=	'Aruba';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Aruba not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	NULL,
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY , level_1_cd varchar (5) UNIQUE );

INSERT INTO @tbl VALUES ('Noord',	'NO');
INSERT INTO @tbl VALUES ('Oranjestad West',	'OW');
INSERT INTO @tbl VALUES ('Oranjestad Oost',	'OO');
INSERT INTO @tbl VALUES ('Paradera',	'PD');
INSERT INTO @tbl VALUES ('Santa Cruz',	'SC');
INSERT INTO @tbl VALUES ('Savaneta',	'SV');
INSERT INTO @tbl VALUES ('San Nicolaas Noord',	'SNN');
INSERT INTO @tbl VALUES ('San Nicolaas Zuid',	'SNZ');

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

SET NOCOUNT OFF


-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================

