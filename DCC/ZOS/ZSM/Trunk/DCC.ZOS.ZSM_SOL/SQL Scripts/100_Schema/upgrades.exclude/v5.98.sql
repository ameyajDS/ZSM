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
	SET	version_no = 5.98,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		Data type password
-- =============================================================================


Use ZSM
Go

IF EXISTS (SELECT * FROM systypes WHERE name = 'password')
	EXEC	sp_droptype	'password'
GO
EXEC	sp_addtype	'password',		'VARCHAR (15)',		'NULL'
GO

