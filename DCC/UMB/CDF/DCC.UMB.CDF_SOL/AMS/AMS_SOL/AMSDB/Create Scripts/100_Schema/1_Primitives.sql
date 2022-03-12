/* ==================================================================================
    Source File		:	1_Primitives.sql
    Author(s)		:	JP
    Started On		:	07 Aug 2007
    Version		:	1.00
    Last updated	:	
    Module ID		:	AMS (Assets Management System)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
									 Revision History
    ----------------------------------------------------------------------------------
    ===================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS OFF
GO

--============================================================================
-- Data Type :	asset_type_id
--============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'asset_type_id')
	EXEC	sp_droptype		'asset_type_id'
GO

EXEC	sp_addtype	'asset_type_id','TINYINT',	'NOT NULL'
GO

--============================================================================
-- Data Type :	centre_id
--============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'centre_id')
	EXEC	sp_droptype		'centre_id'
GO

EXEC	sp_addtype	'centre_id',	'TINYINT',	'NOT NULL'
GO

--============================================================================
-- Data Type :	centre_type
--============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'centre_type')
	EXEC	sp_droptype		'centre_type'
GO

EXEC	sp_addtype	'centre_type',	'VARCHAR(10)',	'NOT NULL'
GO 

--============================================================================
-- Data Type :	zone_id
--============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'zone_id')
	EXEC	sp_droptype		'zone_id'
GO

EXEC	sp_addtype	'zone_id',	'TINYINT',	'NOT NULL'
GO

-- =============================================================================
-- Data Type :	Boolean
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'boolean' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'boolean'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'boolean')
	    EXEC	sp_droptype		'boolean'
	DROP	RULE	boolean
END
GO

CREATE	RULE	boolean		AS	@VALUE	IN	('Yes', 'No')
GO

EXEC	sp_addtype	'boolean',		'CHAR (3)',	'NULL'
GO

EXEC	sp_bindrule	'boolean',		'boolean'
GO



