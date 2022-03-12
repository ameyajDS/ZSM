/* ==================================================================================
	Source File		:	01_CDB_primitives.sql
	Author(s)		:	Sukhdev B. Darira / Jitendra Loyal
	Started On		:	Tue Sep 25 12:07:56 IST 2007
	Version			:	0.09
	Module ID		:	CDB (by virtue of RMS)
	Language		:	TRANSACT-SQL
	Last updated	:	Dec 25, 2008
	Reviewed By		:	JL
	Reviewed On		:	Oct 02, 2007
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Defines the data-types for following identifiers:
			TinyInts	:	document_type_id, sewadar_type_id
			SmallInts	:	assistant_service_id, currency_id, phone_type_id, qlfctn_subject_id,
							responsibility_type_id, working_unit_entity_id, working_unit_id
			Integers	:	audit_log_id, sewadar_id (it is a forward reference)
			Strings-	
					10	: 	marital_status
					16	: 	qualification_type
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

-- USE CDB

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--	Identifiers	: Tiny Integers
---- ===================================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'document_type_id')
	EXEC	sp_droptype	'document_type_id'
GO
EXEC	sp_addtype	'document_type_id',		'TINYINT',	'NOT NULL'
GO

---- ===================================================================================


-- =============================================================================
--	Identifiers	: Small Numbers
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'assistant_service_id')
	EXEC	sp_droptype	'assistant_service_id'
GO
EXEC	sp_addtype	'assistant_service_id',		'SMALLINT',		'NULL'
GO

---- ===================================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'currency_id')
	EXEC	sp_droptype	'currency_id'
GO
EXEC	sp_addtype	'currency_id',				'SMALLINT',		'NULL'
GO

---- ===================================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'phone_type_id')
	EXEC	sp_droptype	'phone_type_id'
GO
EXEC	sp_addtype	'phone_type_id',			'SMALLINT',		'NULL'
GO

---- ===================================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'qualification_id')
	EXEC	sp_droptype	'qualification_id'
GO
EXEC	sp_addtype	'qualification_id',			'SMALLINT',		'NULL'
GO

---- ===================================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'qlfctn_subject_id')
	EXEC	sp_droptype	'qlfctn_subject_id'
GO
EXEC	sp_addtype	'qlfctn_subject_id',		'SMALLINT',		'NULL'
GO

---- ===================================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'responsibility_type_id')
	EXEC	sp_droptype	'responsibility_type_id'
GO
EXEC	sp_addtype	'responsibility_type_id',	'SMALLINT',		'NULL'
GO

---- ===================================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'working_unit_entity_id')
	EXEC	sp_droptype	'working_unit_entity_id'
GO
EXEC	sp_addtype	'working_unit_entity_id',	'SMALLINT',		'NULL'
GO

---- ===================================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'working_unit_id')
	EXEC	sp_droptype	'working_unit_id'
GO
EXEC	sp_addtype	'working_unit_id',			'SMALLINT',		'NULL'
GO

---- ===================================================================================

-- =============================================================================
--	Identifiers	: Numbers
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'audit_log_id')
	EXEC	sp_droptype	'audit_log_id'
GO
EXEC	sp_addtype	'audit_log_id',					'INTEGER',		'NULL'
GO

---- ===================================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'sewadar_id')
	EXEC	sp_droptype	'sewadar_id'
GO
EXEC	sp_addtype	'sewadar_id',				'INTEGER',		'NULL'
GO

---- ===================================================================================


-- =============================================================================
--	Identifiers	: Strings 10
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'marital_status')
	EXEC	sp_droptype	'marital_status'
GO
EXEC	sp_addtype	'marital_status',			'VARCHAR(10)',		'NULL'
GO

-- =============================================================================
--	Identifiers	: Strings 16
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'qualification_type')
	EXEC	sp_droptype	'qualification_type'
GO
EXEC	sp_addtype	'qualification_type',		'VARCHAR(16)',		'NULL'
GO

---- ===================================================================================


-- vim:ts=4 sw=4 ht=4
