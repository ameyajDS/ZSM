/* ==================================================================================
    Source File		:	upgrade_v6.01.sql
    Author(s)		:	Jiten
    Started On		:	31st July 2018
	Last updated	:	31st July 2018
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
	SET	version_no = 6.01,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--	Procedure	GrantTableTypePermissions
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GrantTableTypePermissions' AND xtype = 'P')
	DROP	PROCEDURE	GrantTableTypePermissions
GO

CREATE	PROCEDURE	GrantTableTypePermissions
(
	@p_database_nm		tiny_nm,
	@p_user_list		VARCHAR (1000) -- comma separated list of user roles that needs the object permissions
)
WITH	ENCRYPTION
AS	
	DECLARE	@cursor_statement	NVARCHAR (1000);
BEGIN
	--- declare a cursor to hold all the grant statements (excluding user info) for all the required objects
	SET @cursor_statement = 'USE ' + @p_database_nm + ' ' + 
	'DECLARE @sql_statement	NVARCHAR (2000);
	DECLARE	tt_obj CURSOR FORWARD_ONLY
		FOR	SELECT	''GRANT EXEC ON TYPE::''
				 + name + '' TO ''
			FROM	sys.table_types

	OPEN tt_obj
	FETCH NEXT FROM tt_obj 
		INTO @sql_statement
	WHILE (@@FETCH_STATUS = 0)
		BEGIN
			--PRINT @sql_statement
			EXEC (@sql_statement + ''' + @p_user_list + ''')
			FETCH NEXT FROM tt_obj 
				INTO @sql_statement
		END
	CLOSE tt_obj
	DEALLOCATE tt_obj';

	EXEC sp_executesql @cursor_statement;
END
GO

-- =============================================================================

