/* ==================================================================================
	Source File		:	primitives.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Thu Nov 21 19:37 IST 2013
	Module ID		:	CDB
	Last updated	:	Nov 27, 2013
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Defines the following generic domains:
			Strings-
					10	:	address_component_cd
					15	:	database_nm, column_value
					30	:	gnc_nm
					40	:	address_component_nm
					50	:	column_nm, table_nm

		Defines the data-types for following identifiers:
			Integers	:	address_component_id, entity_id, entity_operation_id, entity_reference_id
			String -
					10	:	user_role_id
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- Domains : Strings
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'address_component_cd')
	EXEC	sp_droptype	'address_component_cd'
GO

EXEC	sp_addtype	'address_component_cd',		'VARCHAR (10)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'database_nm')
	EXEC	sp_droptype	'database_nm'
GO

EXEC	sp_addtype	'database_nm',				'VARCHAR (15)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'column_value')
	EXEC	sp_droptype	'column_value'
GO

EXEC	sp_addtype	'column_value',				'VARCHAR (15)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'gnc_nm')
	EXEC	sp_droptype	'gnc_nm'
GO

EXEC	sp_addtype	'gnc_nm',					'VARCHAR (30)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'column_nm')
	EXEC	sp_droptype	'column_nm'
GO

EXEC	sp_addtype	'column_nm',				'VARCHAR (50)',		'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'table_nm')
	EXEC	sp_droptype	'table_nm'
GO

EXEC	sp_addtype	'table_nm',					'VARCHAR (50)',		'NULL'
GO
-- =============================================================================

-- =============================================================================
--	Identifiers	: Integers
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'address_component_id')
	EXEC	sp_droptype	'address_component_id'
GO
EXEC	sp_addtype	'address_component_id',		'INTEGER',		'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'address_component_big_nm')
	EXEC	sp_droptype	'address_component_big_nm'
GO
EXEC	sp_addtype	'address_component_big_nm',		'varchar(60)',		'NULL'
GO


---- ===================================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_id')
	EXEC	sp_droptype	'entity_id'
GO
EXEC	sp_addtype	'entity_id',				'INTEGER',			'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_operation_id')
	EXEC	sp_droptype	'entity_operation_id'
GO
EXEC	sp_addtype	'entity_operation_id',		'INTEGER',			'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'entity_reference_id')
	EXEC	sp_droptype	'entity_reference_id'
GO
EXEC	sp_addtype	'entity_reference_id',		'INTEGER',			'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'user_role_id')
	EXEC	sp_droptype	'user_role_id'
GO
EXEC	sp_addtype	'user_role_id',				'VARCHAR (10)',		'NULL'
GO
-- =============================================================================

-- vim:ts=4 sw=4 ht=4
