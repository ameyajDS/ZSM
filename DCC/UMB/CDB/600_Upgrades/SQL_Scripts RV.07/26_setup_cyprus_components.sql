/* ==================================================================================
    Source File		:	setup_cyprus_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Sat Oct 06 17:05 2014
	Module ID		:	CDB
	Last updated	:	Oct 06, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Cyprus are set-up
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
WHERE	country_nm	=	'Cyprus';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Cyprus not found', 16, 1);
	RETURN;
END

/*	 These statements should NOT be uncommented; and should be used with extreme caution
DELETE	l3
FROM	level_3_address_components	l3
	JOIN	level_2_address_components	l2
		ON	(	l2.level_2_address_component_id	=	l3.level_2_address_component_id
			)
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


DELETE	level_1_address_components
WHERE	country_id	=	@country_id;
*/

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIqUE);

INSERT INTO @tbl VALUES ('Famagusta',	'FA');
INSERT INTO @tbl VALUES ('Kyrenia',	'KY');
INSERT INTO @tbl VALUES ('Larnaca',	'LA');
INSERT INTO @tbl VALUES ('Limassol',	'LI');
INSERT INTO @tbl VALUES ('Nicosia',	'NI');
INSERT INTO @tbl VALUES ('Paphos',	'PA');

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================


