/* ==================================================================================
    Source File		:	upgrade_v5.93.sql
    Author(s)		:	Niharika
    Started On		:	24 Dec, 2017
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 5.93,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO


-- =============================================================================
--		ZSM changes
-- =============================================================================



USE ZSM
GO

-- =============================================================================
-- DataType user_no, application_id, user_id, user_role_id, person_nm
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'user_no')
	EXEC	sp_droptype	'user_no'
GO
EXEC	sp_addtype	'user_no',		'INTEGER',		'NULL'
GO



IF EXISTS (SELECT * FROM systypes WHERE name = 'application_id')
	EXEC	sp_droptype	'application_id'
GO
EXEC	sp_addtype	'application_id',	'CHAR (7)',		'NULL'
GO

IF EXISTS (SELECT * FROM systypes WHERE name = 'user_id')
	EXEC	sp_droptype	'user_id'
GO
EXEC	sp_addtype	'user_id',		'VARCHAR (10)',		'NULL'
GO

IF EXISTS (SELECT * FROM systypes WHERE name = 'user_role_id')
	EXEC	sp_droptype	'user_role_id'
GO
EXEC	sp_addtype	'user_role_id',		'VARCHAR (10)',		'NULL'
GO

IF EXISTS (SELECT * FROM systypes WHERE name = 'person_nm')
	EXEC	sp_droptype	'person_nm'
GO
EXEC	sp_addtype	'person_nm',		'VARCHAR (30)',		'NULL'
GO