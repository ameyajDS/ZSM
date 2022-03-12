/* ==================================================================================
    Source File		:	procs_archive.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Aug 02 13:04 IST 2012
    Version			:	1.00
    Last updated	:	Aug 05, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Stored Procedures
				_MoveTableData
				_CopyTableData
				_DeleteTableData
				_CleanUpArchive
			Read the assumptions/notes near the table definition
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------
     JL : 05-Aug-2011
		* _DeleteTableData fixed for the defects.
     JL : 02-Aug-2011
		*   Initial version
   ==================================================================================*/




-- ====================================================================================================
-- Stored Procedure _MoveTableData
--		Important
--			Data is deleted in the Source Database after moving to Destination Database
--		Following is assumed:
--			+ First three parameters must be specified.
--			+ The current database should be either the Source or Destination database.
--			+ Timestamp Columns are ignored.
--			+ Table having Identity column should have disabled use of Identity prior to call to this SP.
--			+ Table name is not more than 50 characters.
--			+ Database name is not more than 20 characters.
--			+ Ordering can be specified (over-ruled) with the default ordering.
-- ====================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_MoveTableData' AND xtype = 'P')
	DROP PROCEDURE _MoveTableData
GO

CREATE PROCEDURE _MoveTableData
(
	@p_table_nm	VARCHAR (50),
	@p_src_db	VARCHAR (20),
	@p_dst_db	VARCHAR (20),
	@p_order_by	VARCHAR (30)	=	'1, 2'
)
WITH ENCRYPTION
AS
	DECLARE
		@mcnt	INT,
		@dcnt	INT,
		@stmt	VARCHAR (8000),
		@cols	VARCHAR (3000);
BEGIN
	IF (@p_table_nm IS NULL OR @p_table_nm = '')
	BEGIN
		RAISERROR ('Mandatory Parameter - Name of Table is not specified', 16, 1);
		RETURN;
	END

	IF (@p_src_db IS NULL OR @p_src_db = '' OR @p_dst_db IS NULL OR @p_dst_db = '')
	BEGIN
		RAISERROR ('Mandatory Parameter(s) - Name of Source and / or Destination Database is not specified for table [%s]', 16, 1, @p_table_nm);
		RETURN;
	END

	IF (DB_NAME () NOT IN (@p_src_db, @p_dst_db))
	BEGIN
		RAISERROR ('Current Database should be either Source Database or Destination Database for table [%s]', 16, 1, @p_table_nm);
		RETURN;
	END

	IF (@p_order_by IS NULL OR @p_order_by = '')
		SET @p_order_by = ''
	ELSE
		SET @p_order_by = '	ORDER BY ' + @p_order_by;

	SET	@cols = '';
	SELECT	@cols = @cols + COLUMN_NAME + ', '
	FROM	INFORMATION_SCHEMA.COLUMNS
	WHERE	TABLE_NAME	=	@p_table_nm
	AND		DATA_TYPE	!=	'TIMESTAMP';
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Invalid table "%s" - no column found for it', 16, 1, @p_table_nm);
		RETURN;
	END

	SET @cols = SUBSTRING (@cols, 1, LEN (@cols) - 1);

	BEGIN TRAN

	SET @stmt =	'IF (	(	SELECT	COUNT (*)
							FROM	' + @p_src_db + '..' + @p_table_nm + '
						) > 0
					)	'
				+ '	INSERT	INTO	' + @p_dst_db + '..' + @p_table_nm
				+ '			( ' +	@cols + ' ) '
				+ '		SELECT	' + @cols
				+ '		FROM	' + @p_src_db + '..' + @p_table_nm	 
				+		@p_order_by + ';';
	EXEC (@stmt);
	SET @mcnt = @@ROWCOUNT;
	SET @dcnt = @@ROWCOUNT;

	IF (@mcnt > 0)
	BEGIN
		SET @stmt =	'	DELETE	FROM	'
					+ @p_src_db + '..' + @p_table_nm + ';'
		EXEC (@stmt);

		SET @dcnt = @@ROWCOUNT;
	END
	
	IF (@mcnt > 0 AND @dcnt > 0 AND @mcnt = @dcnt)
		COMMIT
	ELSE
	BEGIN
		ROLLBACK;
		PRINT 'No data found for table [' + @p_table_nm + ']';
	END

END
GO


-- ====================================================================================================
-- Stored Procedure _CopyTableData
--		Following is assumed:
--			+ First three parameters must be specified.
--			+ The current database should be either the Source or Destination database.
--			+ Timestamp Columns are ignored.
--			+ Table having Identity column should have disabled use of Identity prior to call to this SP.
--			+ Table name is not more than 50 characters.
--			+ Database name is not more than 20 characters.
--			+ Ordering can be specified (over-ruled) with the default ordering.
-- ====================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CopyTableData' AND xtype = 'P')
	DROP PROCEDURE _CopyTableData
GO

CREATE PROCEDURE _CopyTableData
(
	@p_table_nm	VARCHAR (50),
	@p_src_db	VARCHAR (20),
	@p_dst_db	VARCHAR (20),
	@p_order_by	VARCHAR (30)	=	'1, 2'
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt	VARCHAR (8000),
		@cols	VARCHAR (3000);
BEGIN
	IF (@p_table_nm IS NULL OR @p_table_nm = '')
	BEGIN
		RAISERROR ('Mandatory Parameter - Name of Table is not specified', 16, 1);
		RETURN;
	END

	IF (@p_src_db IS NULL OR @p_src_db = '' OR @p_dst_db IS NULL OR @p_dst_db = '')
	BEGIN
		RAISERROR ('Mandatory Parameter(s) - Name of Source and / or Destination Database is not specified for table [%s]', 16, 1, @p_table_nm);
		RETURN;
	END

	IF (DB_NAME () NOT IN (@p_src_db, @p_dst_db))
	BEGIN
		RAISERROR ('Current Database should be either Source Database or Destination Database for table [%s]', 16, 1, @p_table_nm);
		RETURN;
	END

	IF (@p_order_by IS NULL OR @p_order_by = '')
		SET @p_order_by = ''
	ELSE
		SET @p_order_by = '	ORDER BY ' + @p_order_by;

	SET	@cols = '';
	SELECT	@cols = @cols + COLUMN_NAME + ', '
	FROM	INFORMATION_SCHEMA.COLUMNS
	WHERE	TABLE_NAME	=	@p_table_nm
	AND		DATA_TYPE	!=	'TIMESTAMP';
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Invalid table "%s" - no column found for it', 16, 1, @p_table_nm);
		RETURN;
	END

	SET @cols = SUBSTRING (@cols, 1, LEN (@cols) - 1);

	SET @stmt =	'	INSERT	INTO	' + @p_dst_db + '..' + @p_table_nm
				+ '			( ' +	@cols + ' ) '
				+ '		SELECT	' + @cols
				+ '		FROM	' + @p_src_db + '..' + @p_table_nm	 
				+		@p_order_by + ';';
	EXEC (@stmt);
END
GO


-- ====================================================================================================
-- Stored Procedure _DeleteTableData
--		Following is assumed:
--			+ Both parameters must be specified.
--			+ The current database should be the database in which table data is to be deleted.
--			+ Table name is not more than 50 characters.
--			+ Database name is not more than 20 characters.
-- ====================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_DeleteTableData' AND xtype = 'P')
	DROP PROCEDURE _DeleteTableData
GO

CREATE PROCEDURE _DeleteTableData
(
	@p_table_nm	VARCHAR (50),
	@p_db		VARCHAR (20)
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt	VARCHAR (8000),
		@cols	VARCHAR (3000);
BEGIN
	IF (@p_table_nm IS NULL OR @p_table_nm = '')
	BEGIN
		RAISERROR ('Mandatory Parameter - Name of Table is not specified', 16, 1);
		RETURN;
	END

	IF (@p_db IS NULL OR @p_db = '')
	BEGIN
		RAISERROR ('Mandatory Parameter - Name of Database is not specified for table [%s]', 16, 1, @p_table_nm);
		RETURN;
	END

	SET @stmt =	'	DELETE	FROM	'
				+ @p_db + '..' + @p_table_nm + ';'
	EXEC (@stmt);

	IF (@@ROWCOUNT = 0)
		RAISERROR ('No data found for table [%s]', 16, 1, @p_table_nm);
END
GO

-- ====================================================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CleanUpArchive' AND xtype = 'P')
	DROP PROCEDURE _CleanUpArchive
GO

CREATE PROCEDURE _CleanUpArchive
WITH ENCRYPTION
AS
BEGIN
	DROP PROCEDURE _MoveTableData;
	DROP PROCEDURE _CopyTableData;
	DROP PROCEDURE _DeleteTableData;
	DROP PROCEDURE _CleanUpArchive;
END

-- =============================================================================
-- vim:ts=4 ht=8 sw=4
