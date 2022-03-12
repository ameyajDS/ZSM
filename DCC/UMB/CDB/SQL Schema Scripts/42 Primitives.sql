/* ==================================================================================
	Source File		:	primitives_generic.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	May 20, 2015 17:59 IST
	Module ID		:	CDB
	Last updated	:	May 20, 2015
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Following suffixes are used:
			cd	-	Code
			dsc	-	Description
			id	-	Identifier
			nm	-	Name

		Defines the following generic domains:
			Strings-
					 5	:	entity_tiny_cd			 10	:	entity_tiny_nm
					10	:	entity_small_cd			 25	:	entity_small_nm
					20	:	entity_medium_cd		 50	:	entity_medium_nm
					25	:	entity_large_cd			100	:	entity_large_nm
					50	:	entity_huge_cd			250	:	entity_huge_nm

					250	:	entity_dsc

		Defines the following identifiers:
			SmallInts	:	generic_entity_id
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
		20-May-2015: JL
			* Initial Version
	==================================================================================*/

--	====================================================================================================


-- =============================================================================
-- Domains : Strings
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_tiny_cd')
	EXEC	sp_droptype	'entity_tiny_cd'
GO

EXEC	sp_addtype	'entity_tiny_cd',		'VARCHAR (5)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_tiny_nm')
	EXEC	sp_droptype	'entity_tiny_nm'
GO

EXEC	sp_addtype	'entity_tiny_nm',		'VARCHAR (10)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_small_cd')
	EXEC	sp_droptype	'entity_small_cd'
GO

EXEC	sp_addtype	'entity_small_cd',		'VARCHAR (10)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_small_nm')
	EXEC	sp_droptype	'entity_small_nm'
GO

EXEC	sp_addtype	'entity_small_nm',		'VARCHAR (25)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_medium_cd')
	EXEC	sp_droptype	'entity_medium_cd'
GO

EXEC	sp_addtype	'entity_medium_cd',		'VARCHAR (20)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_medium_nm')
	EXEC	sp_droptype	'entity_medium_nm'
GO

EXEC	sp_addtype	'entity_medium_nm',		'VARCHAR (50)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_large_cd')
	EXEC	sp_droptype	'entity_large_cd'
GO

EXEC	sp_addtype	'entity_large_cd',		'VARCHAR (25)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_large_nm')
	EXEC	sp_droptype	'entity_large_nm'
GO

EXEC	sp_addtype	'entity_large_nm',		'VARCHAR (100)',	'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_huge_cd')
	EXEC	sp_droptype	'entity_huge_cd'
GO

EXEC	sp_addtype	'entity_huge_cd',		'VARCHAR (50)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_huge_nm')
	EXEC	sp_droptype	'entity_huge_nm'
GO

EXEC	sp_addtype	'entity_huge_nm',		'VARCHAR (250)',	'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_dsc')
	EXEC	sp_droptype	'entity_dsc'
GO

EXEC	sp_addtype	'entity_dsc',			'VARCHAR (250)',	'NULL'
GO
-- =============================================================================

-- =============================================================================
--	Identifiers	: Integers
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'generic_entity_id')
	EXEC	sp_droptype	'generic_entity_id'
GO
EXEC	sp_addtype	'generic_entity_id',	'SMALLINT',			'NULL'
GO
-- =============================================================================

-- vim:ts=4 sw=4 ht=4

