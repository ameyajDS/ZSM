/* ==================================================================================
    Source File		:	procs_expimp.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Thu Dec 22 22:20:03 IST 2011
    Last updated	:	Oct 01, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
									   									   Usage Notes
    ----------------------------------------------------------------------------------

    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		JL : 01-Oct-2014
			* Procedure _ExportProgrammeCentreLists has been added.
		JL : 18-Jan-2014
			* Procedures _GetTableConditions and _ReportAnomalies have been modified to use COALESCE for comparison, to avoid
			  missing the differences when one the columns IS NULL.
			* Table name is printed for locating the errors, if any, quickly
		JL : 17, 18-Jan-2014
			* Procedure _GetTableConditions has been modified. It takes an additional input parameter as report_anomaly flag,
			  and two additional OUTPUT parameters for JOIN clause and ON condition.
			* Procedure _ReportAnomalies has been modified to support the bits 9 and 10 of report_anomaly column.
		JL : 16-Jan-2014
			* Procedure __GetOrderByClause added, and calls to this were made from 4 stored procedures.
		JL/MS : 14-Jan-2014
			* Procedures __CheckCentreCode, _ReportAnomalies, __GetCentreSewadars, _DeleteZoneRecords, _InsertCentreRecordsInZone,
			  _UpdateRecordCount, _CountZoneRecordsBeforeOperation, _CountRecords, _CountRecordsBefore, _CountRecordsAfter,
			  _CountZoneRecordsBefore and _CountZoneRecordsAfter moved from 10_procs_on_zsm_tables.sql as these are applicable
			  only in ZSM database.
		JL : 29-Dec-2013
			* Procedure _GetTableConditions has been modified so that it now returns (a) SELECT clause comprising of primary
			  of primary key columns only, (b) sets of non-primary key columns from both tables and column value from second
			  is rendered only the values of the column are different in the two sets (otherwise second set column value is NULL,
			  (c) JOIN Clause along without ON clause, (d) JOIN condition comprising of ANDed conditions of Primary Key columns,
			  and, (e) WHERE clause such that the ORed unequal conditions of non-primary key columns.
		JL : 26-Dec-2013
			* Procedure _GetTableConditions has been modified so that it now returns (a) SELECT clause comprising of primary
			  of primary key columns only, (b) sets of non-primary key columns from both tables and a # if the two column values
			  are different, (c) JOIN Clause along without ON clause, (d) JOIN condition comprising of ANDed conditions of
			  Primary Key columns, and, (e) WHERE clause such that the ORed unequal conditions of non-primary key columns.
		JL : 22-Dec-2013
			* Procedure _GetTableConditions has been modified so that it now returns (a) SELECT clause comprising of primary
			  key columns from a table followed by non-primary key columns from both tables and a # if the two column values
			  are different, (b) ANDed conditions of Primary Key columns and (c) WHERE clause such that the ORed unequal
			  conditions of non-primary key columns.
		JL : 21-Dec-2013
			* A new procedure _GetTableConditions has been added which returns (a) ANDed conditions of Primary Key columns
			  and (b) ORed unequal conditions of non-primary key columns for a given in the two respective output parameters
			  for the given table, which is provided as input parameter.
		JL/MS : 12-May-2013
			* ORDER BY clause while copying a table now makes sure that data type is not in text, ntext, and image
		JL : 25-Jan-2013
			* 3rd parameter for has_audit_table has been removed from all Internal Procedures including the changes done previous day.
			* Two new stored procedures _CopyFromZoneTable and _CopyToZoneTable have been added.
		JL : 24-Jan-2013
			* All Internal Procedures now have an additional 3rd parameter for has_audit_table.
			* Internal Procedures _MoveDataToImpTable, _MoveDataFromImpTable, _CopyZSMTable, _DropZSMTable and  _DropImpTable
			  have been changed to consider the audit table for the respective function.
		JL : 22,27-Dec-2011
			Initial version
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- Procedure _MoveDataToImpTable
--	Moves the data from the base table to imp_<table_nm>
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_MoveDataToImpTable' AND xtype = 'P')
	DROP PROCEDURE _MoveDataToImpTable
GO

CREATE PROCEDURE _MoveDataToImpTable
(
	@p_centre_code		CHAR (3),
	@p_table_nm			VARCHAR (50),
	@p_identity_action	CHAR (1),
	@p_seed_value		INT
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt	VARCHAR (1000);
BEGIN
	SET @stmt =	'IF EXISTS	(	SELECT 1 '
				+ '				FROM	INFORMATION_SCHEMA.TABLES	'
				+ '				WHERE	TABLE_NAME	=	''imp_' + @p_table_nm	+ '''	'
				+ '			)	'
				+ '	DROP TABLE imp_' + @p_table_nm	+ ';';
	EXEC (@stmt);

	SET @stmt =	 '	SELECT	*	'
				+ '		INTO	imp_' + @p_table_nm
				+ '	FROM	' + @p_table_nm + ';';
	EXEC (@stmt);
	IF (@p_identity_action = 'P')	--- IDENTITY seed is preserved
	BEGIN
		SET @p_seed_value = IDENT_CURRENT (@p_table_nm);

		UPDATE	_ZSM_tables
			SET	seed_value	=	@p_seed_value
		WHERE	table_nm	=	@p_table_nm;
	END
END
GO


-- =============================================================================
-- Procedure __GetOrderByClause
--	Prepares the ORDER BY clause for the table
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '__GetOrderByClause' AND xtype = 'P')
	DROP PROCEDURE __GetOrderByClause
GO

CREATE PROCEDURE __GetOrderByClause
(
	@p_table_nm			VARCHAR (50),
	@p_order_by_clause	VARCHAR (25)	OUTPUT
)
WITH ENCRYPTION
AS
BEGIN
	SET	@p_order_by_clause = ' ORDER BY ';
	SELECT	@p_order_by_clause = @p_order_by_clause + CONVERT(VARCHAR(2), ORDINAL_POSITION) + ', '
	FROM	(	SELECT TOP 3 ORDINAL_POSITION
				FROM	INFORMATION_SCHEMA.COLUMNS
				WHERE	TABLE_NAME	=	@p_table_nm
				AND 	DATA_TYPE NOT IN ('TEXT', 'NTEXT', 'IMAGE', 'TIMESTAMP')
				ORDER BY ORDINAL_POSITION
			) t;
	
	SET @p_order_by_clause = SUBSTRING (@p_order_by_clause, 1, LEN (@p_order_by_clause) - 1);

END
GO


-- =============================================================================
-- Procedure _MoveDataFromImpTable
--	Moves the data to the base table from imp_<table_nm>
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_MoveDataFromImpTable' AND xtype = 'P')
	DROP PROCEDURE _MoveDataFromImpTable
GO

CREATE PROCEDURE _MoveDataFromImpTable
(
	@p_centre_code		CHAR (3),
	@p_table_nm			VARCHAR (50),
	@p_identity_action	CHAR (1),
	@p_seed_value		INT
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt		VARCHAR (8000),
		@order_by	VARCHAR (25),
		@cols		VARCHAR (3000);
BEGIN
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

	IF (@p_identity_action != 'N')	--- Table has IDENTITY column
		SET @stmt = 'SET IDENTITY_INSERT ' + @p_table_nm + ' ON ; ';
	ELSE
		SET @stmt = '';

	SET @stmt =	@stmt
				+ 'IF EXISTS	(	SELECT 1 '
				+ '				FROM	INFORMATION_SCHEMA.TABLES	'
				+ '				WHERE	TABLE_NAME	=	''imp_' + @p_table_nm	+ '''	'
				+ '			)	'
				+ ' AND EXISTS	(	SELECT	1	'
				+ '					FROM	INFORMATION_SCHEMA.TABLES	'
				+ '					WHERE	TABLE_NAME	=	''' + @p_table_nm	+ '''	'
				+ '				)	'
				+ '	INSERT	INTO	' + @p_table_nm
				+ '			( ' +	@cols + ' ) '
				+ '		SELECT	' + @cols
				+ '		FROM	imp_' + @p_table_nm;

	EXEC __GetOrderByClause @p_table_nm, @order_by OUTPUT;
	SET @stmt =	@stmt + @order_by;

	IF (@p_identity_action != 'N')	--- Table has IDENTITY column
		SET @stmt = @stmt + 'SET IDENTITY_INSERT ' + @p_table_nm + ' OFF ; ';

	EXEC (@stmt);

	IF (@p_identity_action = 'P')	--- IDENTITY seed is preserved
		DBCC CHECKIDENT (@p_table_nm, RESEED, @p_seed_value) WITH NO_INFOMSGS;
END
GO

-- =============================================================================
-- Procedure _CopyFromZoneTable
--	Copies the data from ZSM db to ZSM_XXX db
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CopyFromZoneTable' AND xtype = 'P')
	DROP PROCEDURE _CopyFromZoneTable
GO

CREATE PROCEDURE _CopyFromZoneTable
(
	@p_table_nm			VARCHAR (50),
	@p_centre_id		INT				=	NULL,
	@p_sql_stmt_suffix	VARCHAR (2000)	=	NULL
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt				VARCHAR (8000),
		@identity_action	CHAR (1),
		@order_by			VARCHAR (25),
		@cols				VARCHAR (3000);
BEGIN
	SELECT	@identity_action	=	identity_action
	FROM	_ZSM_tables
	WHERE	table_nm	=	@p_table_nm;
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Table "%s" not found', 16, 1, @p_table_nm);
		RETURN;
	END

PRINT @p_table_nm;

	SET	@cols = '';
	SELECT	@cols = @cols + 'a.' + COLUMN_NAME + ', '
	FROM	INFORMATION_SCHEMA.COLUMNS
	WHERE	TABLE_NAME	=	@p_table_nm
	AND		DATA_TYPE	!=	'TIMESTAMP'
	AND		(	(TABLE_NAME =	'system_information_values' AND COLUMN_NAME != 'system_info_value') -- Filtering the computed columns
			OR	(TABLE_NAME !=	'system_information_values')
			);
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Invalid table "%s" - no column found for it', 16, 1, @p_table_nm);
		RETURN;
	END
	SET @cols = SUBSTRING (@cols, 1, LEN (@cols) - 1);

	IF (@identity_action != 'N')	--- Table has IDENTITY column
		SET @stmt = 'SET IDENTITY_INSERT ' + @p_table_nm + ' ON ; ';
	ELSE
		SET @stmt = '';

	SET @stmt =	@stmt
				+ 'IF EXISTS	(	SELECT	1 '
				+ '					FROM	ZSM.INFORMATION_SCHEMA.TABLES	'
				+ '					WHERE	TABLE_NAME	=	''' + @p_table_nm	+ '''	'
				+ '			)	'
				+ ' AND EXISTS	(	SELECT	1	'
				+ '					FROM	INFORMATION_SCHEMA.TABLES	'
				+ '					WHERE	TABLE_NAME	=	''' + @p_table_nm	+ '''	'
				+ '				)	'
				+ '	INSERT	INTO	' + @p_table_nm
				+ '			( ' +	@cols + ' ) '
				+ '		SELECT	' + @cols
				+ '		FROM	ZSM..' + @p_table_nm + '	a	';

	IF (@p_centre_id IS NOT NULL)
		SET @stmt =	@stmt
				+ '		WHERE	a.satsang_centre_id	=	'	+ CONVERT (VARCHAR (12), @p_centre_id);
	IF (@p_sql_stmt_suffix IS NOT NULL)
		SET @stmt =	@stmt + '	' + @p_sql_stmt_suffix + '	';

	EXEC __GetOrderByClause @p_table_nm, @order_by OUTPUT;
	SET @stmt =	@stmt + @order_by;

	IF (@identity_action != 'N')	--- Table has IDENTITY column
		SET @stmt = @stmt + 'SET IDENTITY_INSERT ' + @p_table_nm + ' OFF ; ';

	EXEC (@stmt);

--	IF (@identity_action = 'P')	--- IDENTITY seed is preserved
--		DBCC CHECKIDENT (@p_table_nm, RESEED, @p_seed_value) WITH NO_INFOMSGS;
END
GO

-- =============================================================================
-- Procedure _CopyToZoneTable
--	Copies the data from ZSM_XXX db to ZSM db
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CopyToZoneTable' AND xtype = 'P')
	DROP PROCEDURE _CopyToZoneTable
GO

CREATE PROCEDURE _CopyToZoneTable
(
	@p_table_nm		VARCHAR (50),
	@p_centre_id	INT				=	NULL
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt				VARCHAR (8000),
		@identity_action	CHAR (1),
		@order_by			VARCHAR (25),
		@cols				VARCHAR (3000);
BEGIN
	SELECT	@identity_action	=	identity_action
	FROM	_ZSM_tables
	WHERE	table_nm	=	@p_table_nm;
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Table "%s" not found', 16, 1, @p_table_nm);
		RETURN;
	END

PRINT @p_table_nm;
	SET	@cols = '';
	SELECT	@cols = @cols + 'a.' + COLUMN_NAME + ', '
	FROM	INFORMATION_SCHEMA.COLUMNS
	WHERE	TABLE_NAME	=	@p_table_nm
	AND		DATA_TYPE	!=	'TIMESTAMP'
	AND		(	(TABLE_NAME =	'system_information_values' AND COLUMN_NAME != 'system_info_value') -- Filtering the computed columns
			OR	(TABLE_NAME !=	'system_information_values')
			);
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Invalid table "%s" - no column found for it', 16, 1, @p_table_nm);
		RETURN;
	END
	SET @cols = SUBSTRING (@cols, 1, LEN (@cols) - 1);

	IF (@identity_action != 'N')	--- Table has IDENTITY column
		SET @stmt = 'SET IDENTITY_INSERT ' + @p_table_nm + ' ON ; ';
	ELSE
		SET @stmt = '';

	SET @stmt =	@stmt
				+ 'IF EXISTS	(	SELECT	1 '
				+ '					FROM	ZSM.INFORMATION_SCHEMA.TABLES	'
				+ '					WHERE	TABLE_NAME	=	''' + @p_table_nm	+ '''	'
				+ '			)	'
				+ ' AND EXISTS	(	SELECT	1	'
				+ '					FROM	INFORMATION_SCHEMA.TABLES	'
				+ '					WHERE	TABLE_NAME	=	''' + @p_table_nm	+ '''	'
				+ '				)	'
				+ '	INSERT	INTO	ZSM..' + @p_table_nm
				+ '			( ' +	@cols + ' ) '
				+ '		SELECT	' + @cols
				+ '		FROM	' + @p_table_nm + '	a	';

	IF (@p_centre_id	IS NOT NULL)
		SET @stmt =	@stmt
				+ '		WHERE	a.satsang_centre_id	=	'	+ CONVERT (VARCHAR (12), @p_centre_id);

	EXEC __GetOrderByClause @p_table_nm, @order_by OUTPUT;
	SET @stmt =	@stmt + @order_by;

	IF (@identity_action != 'N')	--- Table has IDENTITY column
		SET @stmt = @stmt + 'SET IDENTITY_INSERT ' + @p_table_nm + ' OFF ; ';

	EXEC (@stmt);
END
GO

-- =============================================================================
-- Procedure _CopyZSMTable
--	Copies the data from ZSM_OLD db to ZSM db
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CopyZSMTable' AND xtype = 'P')
	DROP PROCEDURE _CopyZSMTable
GO

CREATE PROCEDURE _CopyZSMTable
(
	@p_centre_code		CHAR (3),
	@p_table_nm			VARCHAR (50),
	@p_identity_action	CHAR (1),
	@p_seed_value		INT
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt		VARCHAR (8000),
		@order_by	VARCHAR (25),
		@cols		VARCHAR (3000);
BEGIN
	SET	@cols = '';
	SELECT	@cols = @cols + COLUMN_NAME + ', '
	FROM	INFORMATION_SCHEMA.COLUMNS
	WHERE	TABLE_NAME	=	@p_table_nm
	AND		DATA_TYPE	!=	'TIMESTAMP'
	AND		(	(TABLE_NAME =	'system_information_values' AND COLUMN_NAME != 'system_info_value') -- Filtering the computed columns
			OR	(TABLE_NAME !=	'system_information_values')
			);
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Invalid table "%s" - no column found for it', 16, 1, @p_table_nm);
		RETURN;
	END

PRINT @p_table_nm;
	SET @cols = SUBSTRING (@cols, 1, LEN (@cols) - 1);

	IF (@p_identity_action != 'N')	--- Table has IDENTITY column
		SET @stmt = 'SET IDENTITY_INSERT ' + @p_table_nm + ' ON ; ';
	ELSE
		SET @stmt = '';

	SET @stmt =	@stmt
				+ 'IF EXISTS	(	SELECT 1 '
				+ '				FROM	ZSM_OLD.INFORMATION_SCHEMA.TABLES	'
				+ '				WHERE	TABLE_NAME	=	''' + @p_table_nm	+ '''	'
				+ '			)	'
				+ ' AND EXISTS	(	SELECT	1	'
				+ '					FROM	INFORMATION_SCHEMA.TABLES	'
				+ '					WHERE	TABLE_NAME	=	''' + @p_table_nm	+ '''	'
				+ '				)	'
				+ '	INSERT	INTO	' + @p_table_nm
				+ '			( ' +	@cols + ' ) '
				+ '		SELECT	' + @cols
				+ '		FROM	ZSM_OLD..' + @p_table_nm;

	EXEC __GetOrderByClause @p_table_nm, @order_by OUTPUT;
	SET @stmt =	@stmt + @order_by;

	IF (@p_identity_action != 'N')	--- Table has IDENTITY column
		SET @stmt = @stmt + 'SET IDENTITY_INSERT ' + @p_table_nm + ' OFF ; ';
--print @stmt
	EXEC (@stmt);

	IF (@p_identity_action = 'P')	--- IDENTITY seed is preserved
	BEGIN
		SET @p_seed_value = IDENT_CURRENT ('ZSM_OLD..' + @p_table_nm);
		DBCC CHECKIDENT (@p_table_nm, RESEED, @p_seed_value) WITH NO_INFOMSGS;
	END

	SET @stmt =	  'IF EXISTS	(	SELECT 1 '
				+ '				FROM	ZSM_OLD.INFORMATION_SCHEMA.TABLES	'
				+ '				WHERE	TABLE_NAME	=	''adt_' + @p_table_nm	+ '''	'
				+ '			)	'
				+ ' AND EXISTS	(	SELECT	1	'
				+ '					FROM	INFORMATION_SCHEMA.TABLES	'
				+ '					WHERE	TABLE_NAME	=	''adt_' + @p_table_nm	+ '''	'
				+ '				)	'
				+ '	INSERT	INTO	adt_' + @p_table_nm
				+ '			(	audit_log_id, ' + @cols + ' ) '
				+ '		SELECT	audit_log_id, ' + @cols
				+ '		FROM	ZSM_OLD..adt_' + @p_table_nm;

	SET @stmt =	@stmt + @order_by;

	EXEC (@stmt);
END
GO

-- =============================================================================
-- Procedure _GetTableConditions
--	It gets the tables conditions in four OUTPUT variables as below:
--		1. SELECT clause with Primary Key columns
--			SELECT	a.col1, a.col2,
--		2. Columns from each set wherein the column from second set is displayed only if the column is different from that of first set
--			a.col3, NULL, a.col4, b.col4, a.col5, NULL, a.col6, b.col6  	...
--				where, column values in the two sets are different for col4 and col6
--		3. JOIN Clause without ON condition
--			<tbl> a JOIN <tbl> b
--		4. JOIN condition using PK columns
--				a.col1	=	b.col1	AND	a.col2	=	b.col2		....
--		5. WHERE clause for non-primay key columns being unequal as
--				WHERE	a.col3	!=	b.col3	OR	a.col4	!=	b.col4		....
--- Table aliases are "a" for Centre, "b" for Zone, and "c" for the previously exported table to Centre
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_GetTableConditions' AND xtype = 'P')
	DROP PROCEDURE _GetTableConditions
GO

CREATE PROCEDURE _GetTableConditions
(
	@p_table_nm					VARCHAR (50),
	@p_report_anomaly			INT,
	@p_select_clause			VARCHAR (2000)		OUTPUT,
	@p_non_pk_cols_sets			VARCHAR (MAX)		OUTPUT,
	@p_join_clause				VARCHAR (1000)		OUTPUT,
	@p_join_condition			VARCHAR (1000)		OUTPUT,
	@p_prvexp_join_clause		VARCHAR (1000)		OUTPUT,
	@p_prvexp_join_condition	VARCHAR (1000)		OUTPUT,
	@p_where_clause				VARCHAR (MAX)		OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@cnst_nm	VARCHAR (500),
		@condition	VARCHAR (6000);
BEGIN
	SET @cnst_nm = 	REPLACE (@p_table_nm, '_', '') + '_PK_%';

	DECLARE	@pk_cols	TABLE	(	col_nm	VARCHAR (100),	pos	INT	);

	INSERT INTO @pk_cols
		SELECT	COLUMN_NAME, ORDINAL_POSITION
		FROM	INFORMATION_SCHEMA.KEY_COLUMN_USAGE
		WHERE	TABLE_NAME		=		@p_table_nm
		AND		CONSTRAINT_NAME	LIKE	@cnst_nm;
		
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR ('Invalid table "%s" - no Primary Key column found for it', 16, 1, @p_table_nm);
		RETURN;
	END

	SET	@p_select_clause	=	'SELECT	';
	SELECT	@p_select_clause = @p_select_clause + 'a.' + col_nm + ', '
	FROM	@pk_cols
	ORDER BY	pos;

	SET	@p_join_clause = ' ' + @p_table_nm + ' a JOIN ZSM..' + @p_table_nm + ' b ';
	IF (@p_report_anomaly & 256 = 256 OR @p_report_anomaly & 512 = 512)
		SET	@p_prvexp_join_clause = ' JOIN ZSM_PRVEXP..' + @p_table_nm + ' c ';
	ELSE
		SET	@p_prvexp_join_clause = '';

	SET	@p_join_condition = ' ';
	SELECT	@p_join_condition = @p_join_condition + ' a.' + col_nm + ' = b.' + col_nm + ' AND '
	FROM	@pk_cols
	ORDER BY	pos;

	SET @p_join_condition = SUBSTRING (@p_join_condition, 1, LEN (@p_join_condition) - 3);

	IF (@p_report_anomaly & 256 = 256 OR @p_report_anomaly & 512 = 512)
		SET	@p_prvexp_join_condition = ' ON ' + REPLACE (@p_join_condition, 'b.', 'c.');
	ELSE
		SET	@p_prvexp_join_clause = '';

	SET	@condition = 'WHERE	(';
	SET	@p_non_pk_cols_sets	=	'';
	IF (@p_report_anomaly & 256 = 256 AND @p_report_anomaly & 512 = 0)				-- Owner is Centre
		SELECT	@p_non_pk_cols_sets =	@p_non_pk_cols_sets + 'c.' + COLUMN_NAME + ',CASE WHEN COALESCE(c.' + COLUMN_NAME + ', '''')!=COALESCE(b.' + COLUMN_NAME + ', '''')THEN b.' + COLUMN_NAME + ' END, ',
				@condition		 =	@condition + ' COALESCE (c.' + COLUMN_NAME + ', '''')  != COALESCE (b.' + COLUMN_NAME + ', '''')  OR '
		FROM	INFORMATION_SCHEMA.COLUMNS
		WHERE	TABLE_NAME	=	@p_table_nm
		AND		DATA_TYPE	!=	'TIMESTAMP'
		AND		NOT EXISTS	(	SELECT	1 FROM	@pk_cols WHERE	col_nm	=	COLUMN_NAME	);
	ELSE IF (@p_report_anomaly & 256 = 0 AND @p_report_anomaly & 512 = 512)		-- Owner is Zone
		SELECT	@p_non_pk_cols_sets =	@p_non_pk_cols_sets + 'c.' + COLUMN_NAME + ',CASE WHEN COALESCE(c.' + COLUMN_NAME + ', '''')!=COALESCE(a.' + COLUMN_NAME + ', '''')THEN a.' + COLUMN_NAME + ' END, ',
				@condition		 =	@condition + ' COALESCE (c.' + COLUMN_NAME + ', '''')  != COALESCE(a.' + COLUMN_NAME + ', '''')  OR '
		FROM	INFORMATION_SCHEMA.COLUMNS
		WHERE	TABLE_NAME	=	@p_table_nm
		AND		DATA_TYPE	!=	'TIMESTAMP'
		AND		NOT EXISTS	(	SELECT	1 FROM	@pk_cols WHERE	col_nm	=	COLUMN_NAME	);
	ELSE 																			--- Ownership is mixed (256+512) or Both (0 like post_offices_or_cities)
		SELECT	@p_non_pk_cols_sets =	@p_non_pk_cols_sets + 'a.' + COLUMN_NAME + ',CASE WHEN COALESCE(a.' + COLUMN_NAME + ', '''')!=COALESCE(b.' + COLUMN_NAME + ', '''')THEN b.' + COLUMN_NAME + ' END, ',
			--CASE WHEN COALESCE(a.' + COLUMN_NAME + ', '''')!=COALESCE(b.' + COLUMN_NAME + ', '''')THEN a.' + COLUMN_NAME + ' END, ',
				@condition		 =	@condition + ' COALESCE (a.' + COLUMN_NAME + ', '''')  != COALESCE (b.' + COLUMN_NAME + ', '''')  OR '
		FROM	INFORMATION_SCHEMA.COLUMNS
		WHERE	TABLE_NAME	=	@p_table_nm
		AND		DATA_TYPE	!=	'TIMESTAMP'
		AND		NOT EXISTS	(	SELECT	1 FROM	@pk_cols WHERE	col_nm	=	COLUMN_NAME	);

	IF (@@ROWCOUNT = 0)
	BEGIN
		SET	@p_non_pk_cols_sets	= SUBSTRING (@p_select_clause, 7, LEN (@p_select_clause));
		SET @p_non_pk_cols_sets = SUBSTRING (@p_non_pk_cols_sets, 1, LEN (@p_non_pk_cols_sets) - 1);
		SET @p_where_clause = ' WHERE ( 1 = 1) ';
		RETURN;
	END

	SET @p_non_pk_cols_sets = SUBSTRING (@p_non_pk_cols_sets, 1, LEN (@p_non_pk_cols_sets) - 1);
	SET @p_where_clause = SUBSTRING (@condition, 1, LEN (@condition) - 2) + ' ) ';
END
GO

-- =============================================================================
-- Procedure _DropZSMTable
--	Drops the table <table_nm>
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_DropZSMTable' AND xtype = 'P')
	DROP PROCEDURE _DropZSMTable
GO

CREATE PROCEDURE _DropZSMTable
(
	@p_centre_code		CHAR (3),
	@p_table_nm			VARCHAR (50),
	@p_identity_action	CHAR (1),
	@p_seed_value		INT
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt	VARCHAR (1000);
BEGIN
	SET @stmt =	'IF EXISTS	(	SELECT 1 '
				+ '				FROM	INFORMATION_SCHEMA.TABLES	'
				+ '				WHERE	TABLE_NAME	=	''' + @p_table_nm	+ '''	'
				+ '			)	'
				+ '	DROP	TABLE	' + @p_table_nm + ';';
	EXEC (@stmt);

	SET @stmt =	'IF EXISTS	(	SELECT 1 '
				+ '				FROM	INFORMATION_SCHEMA.TABLES	'
				+ '				WHERE	TABLE_NAME	=	''adt_' + @p_table_nm	+ '''	'
				+ '			)	'
				+ '	DROP	TABLE	adt_' + @p_table_nm + ';';
	EXEC (@stmt);
END
GO

-- =============================================================================
-- Procedure _DropImpTable
--	Drops the table imp_<table_nm>
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_DropImpTable' AND xtype = 'P')
	DROP PROCEDURE _DropImpTable
GO

CREATE PROCEDURE _DropImpTable
(
	@p_centre_code		CHAR (3),
	@p_table_nm			VARCHAR (50),
	@p_identity_action	CHAR (1),
	@p_seed_value		INT
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt	VARCHAR (1000);
BEGIN
	SET @stmt =	'IF EXISTS	(	SELECT 1 '
				+ '				FROM	INFORMATION_SCHEMA.TABLES	'
				+ '				WHERE	TABLE_NAME	=	''imp_' + @p_table_nm	+ '''	'
				+ '			)	'
				+ '	DROP	TABLE	imp_' + @p_table_nm + ';';
	EXEC (@stmt);

	SET @stmt =	'IF EXISTS	(	SELECT 1 '
				+ '				FROM	INFORMATION_SCHEMA.TABLES	'
				+ '				WHERE	TABLE_NAME	=	''imp_adt_' + @p_table_nm	+ '''	'
				+ '			)	'
				+ '	DROP	TABLE	imp_adt_' + @p_table_nm + ';';
	EXEC (@stmt);
END
GO

-- =============================================================================
-- Procedure _InitSeedOfCentreTable
--	It sets the initial values for CHECKIDENT in the centre database
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_InitSeedOfCentreTable' AND xtype = 'P')
	DROP PROCEDURE _InitSeedOfCentreTable
GO
CREATE PROCEDURE _InitSeedOfCentreTable
(
	@p_centre_code		CHAR (3),
	@p_table_nm			VARCHAR (50),
	@p_identity_action	CHAR (1),
	@p_seed_value		INT
)
WITH ENCRYPTION
AS
	DECLARE
		@min_val			INT,
		@min_val_minus_one	INT,
		@stmt				VARCHAR (1000);
BEGIN
	SELECT	@min_val =	s.min_value
	FROM	ZSM..satsang_centres_seeds s
	WHERE	s.object_id = @p_table_nm
	AND		s.satsang_centre_id = (	SELECT 	satsang_centre_id FROM ZSM..satsang_centres_details
									WHERE 	centre_cd		= @p_centre_code
									AND		is_main_centre	=	'Yes'	)
	AND		IDENT_CURRENT(@p_table_nm) < s.min_value;
	
	SET @min_val_minus_one = CASE WHEN (@min_val IS NULL) THEN NULL ELSE (@min_val - 1) END;
	
	IF (@min_val IS NOT NULL)
		BEGIN
			SET @stmt =   '	IF ((SELECT COUNT(*) FROM ' + @p_table_nm + ') <> 0)' -- Some data is inserted (at Zone for Centre)
						+ '		DBCC CHECKIDENT (''' + @p_table_nm + ''', RESEED, ' + CONVERT(VARCHAR, @min_val_minus_one) + ') WITH NO_INFOMSGS;'
						+ ' ELSE' -- Table fresh created. No data inserted
						+ '		DBCC CHECKIDENT (''' + @p_table_nm + ''', RESEED, ' + CONVERT(VARCHAR, @min_val) + ') WITH NO_INFOMSGS;'
			EXEC (@stmt);
	--print @stmt;
		END
END 
GO

-- =============================================================================
-- Procedure _UpdateSatsangCentresSeeds
--	It updates the satsang_centres_seeds.seed_value with the IDENT_CURRENT of 
--	partitioned tables, both for Zone and Centre
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_UpdateSatsangCentresSeeds' AND xtype = 'P')
	DROP PROCEDURE _UpdateSatsangCentresSeeds
GO
CREATE PROCEDURE _UpdateSatsangCentresSeeds
(
	@p_centre_code		CHAR (3),
	@p_table_nm			VARCHAR (50),
	@p_identity_action	CHAR (1),
	@p_seed_value		INT
)
WITH ENCRYPTION
AS
BEGIN
	PRINT @p_table_nm;
	UPDATE ZSM..satsang_centres_seeds
		SET seed_value = IDENT_CURRENT('ZSM..' + @p_table_nm)
	WHERE is_zone = 'Yes' AND object_id = @p_table_nm;

	UPDATE ZSM..satsang_centres_seeds
		SET seed_value = (CASE WHEN (IDENT_CURRENT(@p_table_nm) = (min_value - 1)) 
							THEN min_value ELSE IDENT_CURRENT(@p_table_nm) END)
	WHERE satsang_centre_id = (	SELECT 	satsang_centre_id FROM ZSM..satsang_centres_details
									WHERE 	centre_cd		= @p_centre_code
									AND		is_main_centre	=	'Yes'	)
	AND object_id = @p_table_nm;
END 
GO

-- =============================================================================
-- Procedure __CheckCentreCode
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '__CheckCentreCode' AND xtype = 'P')
	DROP PROCEDURE __CheckCentreCode
GO

CREATE PROCEDURE __CheckCentreCode
(
	@p_centre_code		CHAR (3),
	@p_centre_id		satsang_centre_id	OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt					VARCHAR (100);
BEGIN
	IF (@p_centre_code IS NULL OR @p_centre_code = '')
	BEGIN
		RAISERROR('"Centre Code" must be specified', 16, 1)
		RETURN -1;
	END

	SET @stmt = 'ZSM_' + @p_centre_code;
	IF (@stmt != DB_NAME())
	BEGIN
		RAISERROR('Current Database is not for the ZSM as per the Centre Code specified', 16, 1)
		RETURN -2;
	END

	SELECT	@p_centre_id	=	satsang_centre_id
	FROM	ZSM..satsang_centres_details
	WHERE	centre_cd		=	@p_centre_code
	AND		is_main_centre	=	'Yes';
	IF (@@ROWCOUNT = 0)
	BEGIN
		RAISERROR('Satsang Centre ID not found as per the Centre Code specified', 16, 1)
		RETURN -3;
	END
END
GO


-- =============================================================================
-- Procedure _ReportAnomalies
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_ReportAnomalies' AND xtype = 'P')
	DROP PROCEDURE _ReportAnomalies
GO

CREATE PROCEDURE _ReportAnomalies
(
	@p_centre_code			CHAR (3)
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt					VARCHAR (MAX),
		@select_clause			VARCHAR (2000),
		@non_pk_cols_sets		VARCHAR (MAX),
		@join_clause			VARCHAR (1000),
		@join_condition			VARCHAR (1000),
		@where_clause			VARCHAR (MAX),
		@prvexp_join_clause		VARCHAR (1000),
		@prvexp_join_condition	VARCHAR (1000),
		@tbl_nm					VARCHAR (50),
		@id_col_nm				VARCHAR (50),
		@report_anomaly			INT,
		@dsp_col_list			VARCHAR (1000),
		@dsp_join_clause		VARCHAR (1000),
		@prv_imprt_sewa_clause	VARCHAR (1000),
		@prv_crnt_sewa_clause	VARCHAR (1000),
		@excl_new_swdrs_clause	VARCHAR (1000),
		@centre_id				satsang_centre_id,
		@display_anomaly		INT,
		@rval					INT;
BEGIN
	EXEC	@rval =	__CheckCentreCode	@p_centre_code, @centre_id OUTPUT
	IF (@rval != 0)
		RETURN @rval;

		---- Get the previously imported Sewas (excluding the archived sewas, if any) and which are not current.
	SELECT	c.sewa_id
		INTO	#prv_sewas
	FROM	sewas	c
		JOIN	ZSM..sewas	z
			ON	(	c.sewa_id	=	z.sewa_id)
	WHERE	c.deleted_ts	IS NULL
	AND		c.finish_dt		<	GetDate();


		---- Get the current sewas.
	SELECT	c.sewa_id
		INTO	#crnt_sewas
	FROM	sewas	c
		JOIN	ZSM..sewas	z
			ON	(	c.sewa_id	=	z.sewa_id)
	WHERE	c.finish_dt		>	GetDate();


	SELECT	sewadar_grno
		INTO	#new_sewadars
	FROM	ZSM..sewadars_registrations	z
	WHERE	satsang_centre_id	=	@centre_id
	AND		NOT EXISTS	(	SELECT	1
							FROM	sewadars_registrations	c
							WHERE	c.satsang_centre_id	=	z.satsang_centre_id
							AND		c.sewadar_grno		=	z.sewadar_grno
							);
	UPDATE	_ZSM_tables
		SET	table_sq	=	table_id;

	DECLARE	crsr CURSOR STATIC	FOR
		SELECT	table_nm, report_anomaly, display_anomaly
		FROM	_ZSM_tables
		WHERE	report_anomaly	>	0
		ORDER BY table_sq;
	
	OPEN crsr;

	FETCH crsr
		INTO	@tbl_nm, @report_anomaly, @display_anomaly
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
			--- Table aliases are "a" for Centre, "b" for Zone, and "c" for the previously exported table to Centre
		EXEC _GetTableConditions @tbl_nm,	@report_anomaly,	@select_clause			OUTPUT,
																@non_pk_cols_sets		OUTPUT,
																@join_clause			OUTPUT,
																@join_condition			OUTPUT,
																@prvexp_join_clause		OUTPUT,
																@prvexp_join_condition	OUTPUT,
																@where_clause			OUTPUT;

		
		IF (@display_anomaly & 1 = 1) 			-- 1st bit: Display additional information using sewadar_id	(alias p)
		BEGIN
			SET @dsp_col_list = ' p.first_nm + '' '' + p.middle_nm + '' '' + p.last_nm AS [Sewadar Name], p.Gender, CONVERT (VARCHAR (11), p.birth_dtm, 106) as [DOB], ';
			SET @dsp_join_clause = ' LEFT JOIN	sewadars	p
										ON	(	p.sewadar_id	=	a.sewadar_id	)	';
		END
		ELSE IF (@display_anomaly & 2 = 2) 		-- 2nd bit: Display additional information using satsang_centre_id and sewadar_grno	(alias q)
		BEGIN
			SET @dsp_col_list = ' q.Satsang_Centre_ID, q.Sewadar_GRNo, q.Sewadar_Status_CD, p.Sewadar_ID, p.first_nm + '' '' + p.middle_nm + '' '' + p.last_nm AS [Sewadar Name], p.Gender, CONVERT (VARCHAR (11), p.birth_dtm, 106) as [DOB], ';
			SET @dsp_join_clause = '	LEFT JOIN	sewadars_registrations	q
											ON	(	q.satsang_centre_id	=	a.satsang_centre_id
												AND	q.sewadar_grno		=	a.sewadar_grno
												)
										LEFT JOIN	sewadars	p
											ON	(	p.sewadar_id	=	q.sewadar_id	)	';
		END
		ELSE IF (@display_anomaly & 4 = 4) 		-- 3rd bit: Display additional information using sewa_team_wise_sewadars	(alias r)
		BEGIN
			SET @dsp_col_list = ' r.Serial_ID, q.Satsang_Centre_ID, q.Sewadar_GRNo, q.Sewadar_Status_CD, p.Sewadar_ID, p.first_nm + '' '' + p.middle_nm + '' '' + p.last_nm AS [Sewadar Name], p.Gender, CONVERT (VARCHAR (11), p.birth_dtm, 106) as [DOB], ';
			SET @dsp_join_clause = '	LEFT JOIN	sewa_team_wise_sewadars	r
											ON	(	r.sewa_team_id	=	a.sewa_team_id
												AND	r.serial_id		=	a.serial_id
												)
										LEFT JOIN	sewadars_registrations	q
											ON	(	q.satsang_centre_id	=	r.satsang_centre_id
												AND	q.sewadar_grno		=	r.sewadar_grno
												)
										LEFT JOIN	sewadars	p
											ON	(	p.sewadar_id	=	q.sewadar_id	)	';
		END
		ELSE
		BEGIN
			SET @dsp_col_list = '';
			SET @dsp_join_clause = '';
		END

		IF (@report_anomaly & 8 = 8) 			-- 4th bit: Consider only for previously imported Sewas (excluding Archiving)
		BEGIN
			IF (@display_anomaly & 4 = 4) 		-- Sewadar information is from Sewa Teams
			BEGIN
				SET @prv_imprt_sewa_clause	=	'	AND	EXISTS	(	SELECT	1
																	FROM	sewa_teams	t
																		JOIN	#prv_sewas	s	
																			ON	(	t.sewa_id	=	s.sewa_id	)
																	WHERE	t.sewa_team_id	=	a.sewa_team_id
																)	';
				SET @prv_crnt_sewa_clause	=	'	AND	(	EXISTS	(	SELECT	1
																		FROM	sewa_teams	t
																			JOIN	#prv_sewas	s	
																				ON	(	t.sewa_id	=	s.sewa_id	)
																		WHERE	t.sewa_team_id	=	a.sewa_team_id
																	)
														OR	(	EXISTS	(	SELECT	1
																			FROM	sewa_teams	t
																				JOIN	#crnt_sewas	s	
																					ON	(	t.sewa_id	=	s.sewa_id	)
																			WHERE	t.sewa_team_id	=	a.sewa_team_id
																		)
															AND	NOT	EXISTS	(	SELECT	1
																				FROM	ZSM_PRVEXP..' + @tbl_nm + ' c
																				WHERE ' + REPLACE (@join_condition, 'b.', 'c.') + '
																			)
															)
														)';
			END
			ELSE
			BEGIN
				SET @prv_imprt_sewa_clause	=	'	AND	EXISTS	(	SELECT	1
																	FROM	#prv_sewas	s
																	WHERE	a.sewa_id	=	s.sewa_id
																)	';
				SET @prv_crnt_sewa_clause	=	'	AND	(	EXISTS	(	SELECT	1
																		FROM	#prv_sewas	s
																		WHERE	a.sewa_id	=	s.sewa_id
																	)	
														OR	(	EXISTS	(	SELECT	1
																		FROM	#crnt_sewas	s
																		WHERE	a.sewa_id	=	s.sewa_id
																		)
															AND	NOT	EXISTS	(	SELECT	1
																				FROM	ZSM_PRVEXP..' + @tbl_nm + ' c
																				WHERE ' + REPLACE (@join_condition, 'b.', 'c.') + '
																			)
															)
														)';
			END
		END
		ELSE
		BEGIN
			SET @prv_imprt_sewa_clause	=	'';
			SET @prv_crnt_sewa_clause	=	'';
		END

		IF (@report_anomaly & 16 = 16) 			-- 5th bit: Exclude freshly enrolled Sewadars for the Centre in the Zone
			IF (@display_anomaly & 4 = 4) 		-- Sewadar information is from Sewa Teams
				SET @excl_new_swdrs_clause	=	'	AND	NOT	EXISTS	(	SELECT	1
																		FROM	sewa_team_wise_sewadars	t
																			JOIN	#new_sewadars	n
																				ON	(	t.satsang_centre_id	=	' + CONVERT (VARCHAR, @centre_id) + '
																					AND	t.sewadar_grno		=	n.sewadar_grno
																					)
																		WHERE	a.sewa_team_id	=	t.sewa_team_id
																		AND		a.serial_id		=	t.serial_id
																)	';
			ELSE
				SET @excl_new_swdrs_clause	=	'	AND	NOT	EXISTS	(	SELECT	1
																		FROM	#new_sewadars	n
																		WHERE	a.satsang_centre_id	=	' + CONVERT (VARCHAR, @centre_id) + '
																		AND		a.sewadar_grno		=	n.sewadar_grno
																	)	';
		ELSE
			SET @excl_new_swdrs_clause	=	'';

--print @tbl_nm + ': ' + convert (varchar, @report_anomaly) + ', ' + convert (varchar, @display_anomaly)
		IF (@report_anomaly & 1 = 1)			-- 1st bit:	Report records that exist in Zone but not in Centre
		BEGIN
			SET	@stmt	=	'SELECT	' + @dsp_col_list + ' a.*
							 FROM	ZSM..' + @tbl_nm + ' a	'
								+	@dsp_join_clause	+	'
							 WHERE	NOT EXISTS	(	SELECT	1
													FROM	' + @tbl_nm + ' b
													WHERE	' + @join_condition + '
												) 	'
								+ @prv_crnt_sewa_clause
								+ @excl_new_swdrs_clause;
--print @stmt
			EXEC (@stmt);
			IF (@@ROWCOUNT > 0)
				RAISERROR ('Records found for table "%s" in Zone, which are not present in Centre', 16, 1, @tbl_nm);
		END
		IF (@report_anomaly & 2 = 2) 			-- 2nd bit: Report records that exist in Centre but not in Zone
		BEGIN
			SET	@stmt	=	'SELECT	' + @dsp_col_list + ' a.*
							 FROM	' + @tbl_nm + ' a	'
							 + @dsp_join_clause + '
							 WHERE	NOT EXISTS	(	SELECT	1
													FROM	ZSM..' + @tbl_nm + ' b
													WHERE	' + @join_condition + '
												)	'
								+ @prv_imprt_sewa_clause
								+ @excl_new_swdrs_clause;
--print @stmt
			EXEC (@stmt);
			IF (@@ROWCOUNT > 0)
				RAISERROR ('Records found for table "%s" in Centre, which are not present in Zone', 16, 1, @tbl_nm);
		END
		IF (@report_anomaly & 4 = 4) 			-- 3rd bit: Report records that differ in Centre and Zone
		BEGIN
			IF (@report_anomaly & 256 = 256 AND @report_anomaly & 512 = 512)				-- Ownership is split between Centre and Zone
			BEGIN
				IF (@tbl_nm = 'sewadars')
				BEGIN
					SET	@non_pk_cols_sets	=	'	c.first_nm,						CASE WHEN c.first_nm									!=	b.first_nm										THEN b.first_nm						END,
																					CASE WHEN a.first_nm									!=	b.first_nm										THEN a.first_nm						END,
													c.middle_nm,					CASE WHEN c.middle_nm									!=	b.middle_nm										THEN b.middle_nm					END,
																					CASE WHEN a.middle_nm									!=	b.middle_nm										THEN a.middle_nm					END,
													c.last_nm,						CASE WHEN c.last_nm										!=	b.last_nm										THEN b.last_nm						END,
																					CASE WHEN a.last_nm										!=	b.last_nm										THEN a.last_nm						END,
													c.gender,						CASE WHEN c.gender										!=	b.gender										THEN b.gender						END,
																					CASE WHEN a.gender										!=	b.gender										THEN a.gender						END,
													c.birth_dtm,					CASE WHEN c.birth_dtm									!=	b.birth_dtm										THEN b.birth_dtm					END,
																					CASE WHEN a.birth_dtm									!=	b.birth_dtm										THEN a.birth_dtm					END,
													c.is_married,					CASE WHEN COALESCE (c.is_married, '''')					!=	COALESCE (b.is_married, '''')					THEN b.is_married					END,
																					CASE WHEN COALESCE (a.is_married, '''')					!=	COALESCE (b.is_married, '''')					THEN a.is_married					END,
													c.initiation_dt,				CASE WHEN COALESCE (c.initiation_dt, '''')				!=	COALESCE (b.initiation_dt, '''')				THEN b.initiation_dt				END,
																					CASE WHEN COALESCE (a.initiation_dt, '''')				!=	COALESCE (b.initiation_dt, '''')				THEN a.initiation_dt				END,
													c.initiation_place_id,			CASE WHEN COALESCE (c.initiation_place_id, '''')			!=	COALESCE (b.initiation_place_id, '''')		THEN b.initiation_place_id			END,
																					CASE WHEN COALESCE (a.initiation_place_id, '''')			!=	COALESCE (b.initiation_place_id, '''')		THEN a.initiation_place_id			END,
													c.initiation_by,				CASE WHEN COALESCE (c.initiation_by, '''')				!=	COALESCE (b.initiation_by, '''')				THEN b.initiation_by				END,
																					CASE WHEN COALESCE (a.initiation_by, '''')				!=	COALESCE (b.initiation_by, '''')				THEN a.initiation_by				END,
													c.current_satsang_centre_id,	CASE WHEN COALESCE (c.current_satsang_centre_id, '''')	!=	COALESCE (b.current_satsang_centre_id, '''')	THEN b.current_satsang_centre_id	END,
																					CASE WHEN COALESCE (a.current_satsang_centre_id, '''')	!=	COALESCE (b.current_satsang_centre_id, '''')	THEN a.current_satsang_centre_id	END,
													c.current_sewadar_grno,			CASE WHEN COALESCE (c.current_sewadar_grno, '''')			!=	COALESCE (b.current_sewadar_grno, '''')		THEN b.current_sewadar_grno			END,
																					CASE WHEN COALESCE (a.current_sewadar_grno, '''')			!=	COALESCE (b.current_sewadar_grno, '''')		THEN a.current_sewadar_grno			END,
													c.global_sewadar_status_cd,		CASE WHEN COALESCE (c.global_sewadar_status_cd, '''')		!=	COALESCE (b.global_sewadar_status_cd, '''')	THEN b.global_sewadar_status_cd		END,
																					CASE WHEN COALESCE (a.global_sewadar_status_cd, '''')		!=	COALESCE (b.global_sewadar_status_cd, '''')	THEN a.global_sewadar_status_cd		END,
													c.global_sewadar_status_dt,		CASE WHEN COALESCE (c.global_sewadar_status_dt, '''')		!=	COALESCE (b.global_sewadar_status_dt, '''')	THEN b.global_sewadar_status_dt		END,
																					CASE WHEN COALESCE (a.global_sewadar_status_dt, '''')		!=	COALESCE (b.global_sewadar_status_dt, '''')	THEN a.global_sewadar_status_dt		END
												';
					SET	@where_clause		=	' WHERE	(	c.first_nm										!=	b.first_nm
														OR	c.middle_nm										!=	b.middle_nm
														OR	c.last_nm										!=	b.last_nm
														OR	c.gender										!=	a.gender
														OR	c.birth_dtm										!=	b.birth_dtm
														OR	COALESCE (c.is_married, '''')					!=	COALESCE (b.is_married, '''')
														OR	COALESCE (c.initiation_dt, '''')				!=	COALESCE (b.initiation_dt, '''')
														OR	COALESCE (c.initiation_place_id, '''')			!=	COALESCE (b.initiation_place_id, '''')
														OR	COALESCE (c.initiation_by, '''')				!=	COALESCE (b.initiation_by, '''')
														OR	COALESCE (c.current_satsang_centre_id, '''')	!=	COALESCE (a.current_satsang_centre_id, '''')
														OR	COALESCE (c.current_sewadar_grno, '''')			!=	COALESCE (a.current_sewadar_grno, '''')
														OR	COALESCE (c.global_sewadar_status_cd, '''')		!=	COALESCE (a.global_sewadar_status_cd, '''')
														OR	COALESCE (c.global_sewadar_status_dt, '''')		!=	COALESCE (a.global_sewadar_status_dt, '''')
														)
												';
				END
			END
			IF (@report_anomaly & 256 = 256 OR @report_anomaly & 512 = 512)				-- Ownership is either with Centre or Zone or split between two
				SET	@stmt	=	@select_clause + @dsp_col_list + @non_pk_cols_sets
								+ ' FROM ' + @join_clause
								+ '		ON ' + @join_condition
								+ @prvexp_join_clause
								+ @prvexp_join_condition
								+ @dsp_join_clause
								+ @where_clause
								+ @prv_imprt_sewa_clause
								+ @excl_new_swdrs_clause;
			ELSE
				SET	@stmt	=	@select_clause + @dsp_col_list + @non_pk_cols_sets
								+ ' FROM ' + @join_clause
								+ '		ON ' + @join_condition
								+ @dsp_join_clause
								+ @where_clause
								+ @prv_imprt_sewa_clause
								+ @excl_new_swdrs_clause;
--print @stmt
			EXEC (@stmt);
			IF (@@ROWCOUNT > 0)
			BEGIN
				IF (@report_anomaly & 256 = 256 AND @report_anomaly & 512 = 0)				-- Owner is Centre
					RAISERROR ('Records that are different for table "%s" in Centre and Zone (PrvExp, Zone (~Prv)', 16, 1, @tbl_nm);
				ELSE IF (@report_anomaly & 256 = 0 AND @report_anomaly & 512 = 512)			-- Owner is Zone
					RAISERROR ('Records that are different for table "%s" in Centre and Zone (PrvExp, Centre (~Prv)', 16, 1, @tbl_nm);
				ELSE IF (@tbl_nm = 'Sewadars')												-- Ownership is mixed (256+512) or Both (0 like post_offices_or_cities)
					RAISERROR ('Records that are different for table "%s" in Centre and Zone (PrvExp, Zone (~Prv), Centre (~Zone)', 16, 1, @tbl_nm);
				ELSE
					RAISERROR ('Records that are different for table "%s" in Centre and Zone (Centre, Zone (~Centre)', 16, 1, @tbl_nm);
			END
		END
		IF (@report_anomaly & 32 = 32) 			-- 6th bit: Report records that do not belong to the centre
		BEGIN
			SET	@stmt	=	'SELECT	' + @dsp_col_list + ' a.*
							 FROM	' + @tbl_nm + ' a	'
							+ @dsp_join_clause + '
							 WHERE	' + CASE WHEN @tbl_nm = 'sewadar_applications' THEN 'a.application_centre_id' ELSE 'a.satsang_centre_id' END	+ ' !=	' + CONVERT (VARCHAR, @centre_id) + ' '
--print @stmt 
			EXEC (@stmt);
			IF (@@ROWCOUNT > 0)
				RAISERROR ('Records that are present in table "%s" in Centre, but do not belong to the Centre', 16, 1, @tbl_nm);
		END
		IF (@report_anomaly & 64 = 64) 			-- 7th bit: Report records that are outside the prescribed range of alloted identity partition.
		BEGIN
			SELECT	@id_col_nm	=	COLUMN_NAME
			FROM	INFORMATION_SCHEMA.KEY_COLUMN_USAGE
			WHERE	TABLE_NAME		=		@tbl_nm
			AND		CONSTRAINT_NAME	LIKE	REPLACE (@tbl_nm, '_', '') + '_PK_%';

			SET	@stmt	=	'SELECT	' + @dsp_col_list + ' a.*
							 FROM	' + @tbl_nm + ' a	'
							+ @dsp_join_clause + '
							 WHERE	NOT EXISTS	(	SELECT	1
													FROM	ZSM..satsang_centres_seeds s
													WHERE	(	s.satsang_centre_id	=	' + CONVERT (VARCHAR, @centre_id) + '
															OR	s.is_zone = ''Yes''
															)
													AND		s.object_id = ''' + @tbl_nm + '''
													AND		a.	' + @id_col_nm + '	BETWEEN	s.min_value AND s.max_value
												)	'
--print @stmt 
			EXEC (@stmt);
			IF (@@ROWCOUNT > 0)
				RAISERROR ('Records that are present in table "%s" in Centre, but are outside the prescribed range of identity partition', 16, 1, @tbl_nm);
		END
		IF (@report_anomaly & 128 = 128) 		-- 8th bit: Report records that are outside the prescribed range of alloted identity partition, are present in Zone and not in Centre.
		BEGIN
			SELECT	@id_col_nm	=	COLUMN_NAME
			FROM	INFORMATION_SCHEMA.KEY_COLUMN_USAGE
			WHERE	TABLE_NAME		=		@tbl_nm
			AND		CONSTRAINT_NAME	LIKE	REPLACE (@tbl_nm, '_', '') + '_PK_%';

			SET	@stmt	=	'SELECT	' + @dsp_col_list + ' a.*
							 FROM	' + @tbl_nm + ' a	'
							+ @dsp_join_clause + '
								JOIN	ZSM..satsang_centres_seeds s
									ON	(	s.object_id = ''' + @tbl_nm + '''
										AND	s.satsang_centre_id	=	' + CONVERT (VARCHAR, @centre_id) + '
										)
								WHERE	a.' + @id_col_nm + ' NOT BETWEEN s.min_value AND s.max_value
								AND		NOT EXISTS	(	SELECT	1
														FROM	' + @tbl_nm + '	b
														WHERE	a.' + @id_col_nm + ' =	b.' + @id_col_nm + '
													)	'
--print @stmt 
			EXEC (@stmt);
			IF (@@ROWCOUNT > 0)
				RAISERROR ('Records that are present in table "%s" in Zone, but are not present in Centre and are outside the prescribed range of identity partition', 16, 1, @tbl_nm);
		END

		FETCH crsr
			INTO	@tbl_nm, @report_anomaly, @display_anomaly
	END

	CLOSE crsr;

	DEALLOCATE crsr;
	DROP TABLE	#prv_sewas;
	DROP TABLE	#crnt_sewas;
	DROP TABLE	#new_sewadars;
END
GO

-- =============================================================================
-- Procedure _ExportProgrammeCentreLists
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_ExportProgrammeCentreLists' AND xtype = 'P')
	DROP PROCEDURE _ExportProgrammeCentreLists
GO

CREATE PROCEDURE _ExportProgrammeCentreLists
(
	@p_centre_code			CHAR (3)
)
WITH ENCRYPTION
AS
	DECLARE
		@centre_id				satsang_centre_id,
		@list_id				INT,
		@cnt					INT,
		@rval					INT;
BEGIN
	EXEC	@rval =	__CheckCentreCode	@p_centre_code, @centre_id OUTPUT
	IF (@rval != 0)
		RETURN @rval;

	DECLARE	@tbl	TABLE	(	id	INT,	cnt	INT	);			--- Table to hold the Sewadar List ID and Number of Sewadars in the List

	INSERT INTO	@tbl
		SELECT	l.sewadar_list_id, COUNT (s.sewadar_list_id)
		FROM	ZSM..generic_sewadar_lists	l
			LEFT JOIN	ZSM..generic_sewadar_lists_sewadars	s
				ON	(	l.sewadar_list_id	=	s.sewadar_list_id	)
		WHERE	l.is_for_export	=	'Yes'
		AND		l.exported_dtm	IS	NULL
		AND		l.programme_satsang_centre_id	=	@centre_id
		GROUP BY l.sewadar_list_id;
	SET	@cnt	=	@@ROWCOUNT;

	IF (@cnt = 0)
	BEGIN
		RAISERROR ('There are no Sewadar Lists marked to be exported for the Programme Centre; EXPORT terminated', 16, 1);
		RETURN -2;
	END

	IF EXISTS	(	SELECT	TOP 1 1
					FROM	@tbl
					WHERE	cnt	=	0
				)
	BEGIN
		RAISERROR ('There is at least one Sewadar List marked to be exported, but does not have any Sewadars; EXPORT terminated', 16, 1);
		RETURN -3;
	END

	INSERT INTO	generic_sewadar_lists
			(	satsang_centre_id, sewadar_list_nm,
				sewadar_list_use, other_satsang_centre_sewadars, is_other_satsang_centre, is_editing_allowed, is_for_export
			)
		VALUES
			(	@centre_id, 'Other Centres Sewadars collated on ' + CONVERT (VARCHAR, GetDate(), 106) + ' at ' + CONVERT (VARCHAR, GetDate(), 108),
				'Sewadars for a Sewa', 'Yes', 'Yes', 'No', 'No'
			);
	SET @list_id = SCOPE_IDENTITY();

	INSERT INTO	generic_sewadar_lists_sewadars
			(	sewadar_list_id, satsang_centre_id, sewadar_grno
			)
		SELECT	@list_id, satsang_centre_id, sewadar_grno
		FROM	ZSM..generic_sewadar_lists_sewadars	z
			JOIn	@tbl	t
				ON	(	z.sewadar_list_id	=	t.id	);
	
	UPDATE	z
		SET	exported_dtm		=	GetDate(),
			is_editing_allowed	=	'No'
	FROM	ZSM..generic_sewadar_lists	z
		JOIn	@tbl	t
			ON	(	z.sewadar_list_id	=	t.id	);
END
GO

-- =============================================================================
-- Procedure __GetCentreSewadars
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '__GetCentreSewadars' AND xtype = 'P')
	DROP PROCEDURE __GetCentreSewadars
GO

CREATE PROCEDURE __GetCentreSewadars
(
	@p_centre_id	satsang_centre_id
)
WITH ENCRYPTION
AS
BEGIN
	INSERT	INTO	#centre_sewadars
			(	sewadar_grno, sewadar_id	)
		SELECT	z.current_sewadar_grno, z.sewadar_id
		FROM	ZSM..sewadars	z
			JOIN	sewadars	c
				ON	(	c.current_satsang_centre_id	=	z.current_satsang_centre_id
					AND	c.current_sewadar_grno		=	z.current_sewadar_grno
					)
		WHERE	z.current_satsang_centre_id	=	@p_centre_id;
END
GO

-- =============================================================================
-- Procedure _DeleteZoneRecords
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_DeleteZoneRecords' AND xtype = 'P')
	DROP PROCEDURE _DeleteZoneRecords
GO

CREATE PROCEDURE _DeleteZoneRecords
(
	@p_centre_code			CHAR (3)
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt					VARCHAR (8000),
		@tbl_nm					VARCHAR (50),
		@import_delete			INT,
		@centre_id				satsang_centre_id,
		@rval					INT;
BEGIN
	EXEC	@rval =	__CheckCentreCode	@p_centre_code, @centre_id OUTPUT
	IF (@rval != 0)
		RETURN @rval;

		---- Get the Centre's Sewadars
	CREATE	TABLE	#centre_sewadars
	(
	 	--	sewadar_grno	CHAR (6)	COLLATE	SQL_Latin1_General_CP1_CI_AS	NOT NULL	PRIMARY KEY,		-- Latin1_General_CI_AI
	 	sewadar_grno	CHAR (6)	NOT NULL	PRIMARY KEY,
		sewadar_id		INTEGER		NOT NULL	UNIQUE	NONCLUSTERED
	);

	EXEC __GetCentreSewadars @centre_id;

		---- Get the Sewas of the Centre
	SELECT	sewa_id
		INTO	#sewas
	FROM	sewas
	WHERE	satsang_centre_id	=	@centre_id;

		---- Get the newly enrolled Sewadars
	SELECT	sewadar_grno
		INTO	#new_sewadars
	FROM	ZSM..sewadars_registrations	z
	WHERE	satsang_centre_id	=	@centre_id
	AND		NOT EXISTS	(	SELECT	1
							FROM	sewadars_registrations	c
							WHERE	c.satsang_centre_id	=	z.satsang_centre_id
							AND		c.sewadar_grno		=	z.sewadar_grno
							);
	UPDATE	_ZSM_tables
		SET	table_sq	=	0 - table_id;

	DECLARE	crsr CURSOR STATIC	FOR
		SELECT	table_nm, import_delete
		FROM	_ZSM_tables
		WHERE	import_delete	>	0
		ORDER BY table_sq;
	
	OPEN crsr;

	FETCH crsr
		INTO	@tbl_nm, @import_delete
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		
PRINT @tbl_nm;
		SET @stmt = 'DELETE d FROM ZSM..' + @tbl_nm + ' d ';
				    
		IF (@import_delete & 1 = 1) 			-- 1st bit: Value 1 :	Use Sewas of the Centre
			SET @stmt = @stmt + 'JOIN	#sewas	s
									ON	(	d.sewa_id	=	s.sewa_id	)';
		ELSE IF (@import_delete & 2 = 2) 		-- 2nd bit: Value 2 :	Use Sewas of the Centre along with corresponding Sewa Teams
			SET @stmt = @stmt + 'JOIN	sewa_teams	t
									ON	(	t.sewa_team_id	=	d.sewa_team_id	)
								 JOIN	#sewas	s
									ON	(	t.sewa_id	=	s.sewa_id	)';
		ELSE IF (@import_delete & 4 = 4) 		-- 3rd bit: Value 4 :	Use Sewas of the Centre excluding freshly enrolled Sewadars
			SET @stmt = @stmt + 'JOIN	#sewas	s
									ON	(	d.sewa_id	=	s.sewa_id	)
								 WHERE	NOT EXISTS	(	SELECT	1
										 				FROM	#new_sewadars	n
														WHERE	d.satsang_centre_id	= ' + CONVERT (VARCHAR, @centre_id) + '
														AND		d.sewadar_grno		=	n.sewadar_grno
													)';
		ELSE IF (@import_delete & 8 = 8) 		-- 4th Bit  	Value 8 :	Use Sewadar IDs (obtained using JOIN between Zone and Centre Sewadars on Current Sewadar GRNo and restricted to the importing Centre)
			SET @stmt = @stmt + 'WHERE	EXISTS	(	SELECT	1
													FROM	#centre_sewadars	c
													WHERE	d.sewadar_id	=	c.sewadar_id
												)';
		ELSE IF (@import_delete & 16 = 16) 		-- 5th Bit  	Value 16 :	Use Sewadar GRNos (obtained using JOIN between Zone and Centre Sewadars on Current Sewadar GRNo and restricted to the importing Centre)
			SET @stmt = @stmt + 'WHERE	d.satsang_centre_id	= ' + CONVERT (VARCHAR, @centre_id) + '
								 AND	EXISTS	(	SELECT	1
													FROM	#centre_sewadars	c
													WHERE	d.sewadar_grno	=	c.sewadar_grno
												)';
		ELSE IF (@import_delete & 32 = 32) 		-- 6th bit: Value 32 :	Use Centre
			SET @stmt = @stmt + 'WHERE	d.satsang_centre_id	= ' + CONVERT (VARCHAR, @centre_id);
		ELSE IF (@import_delete & 64 = 64) 		-- 7th bit: Value 64 :	Use Credit Specifications ID along with Centre
			SET @stmt = @stmt + 'JOIN	credit_specifications	c
									ON	(	c.credit_specification_id	=	d.credit_specification_id	)
								 WHERE	c.satsang_centre_id	= ' + CONVERT (VARCHAR, @centre_id);

--print @stmt
		EXEC (@stmt);

		FETCH crsr
			INTO	@tbl_nm, @import_delete
	END

	CLOSE crsr;

	DEALLOCATE crsr;
	DROP TABLE	#centre_sewadars;
	DROP TABLE	#sewas;
	DROP TABLE	#new_sewadars;
END
GO


-- =============================================================================
-- Procedure _InsertCentreRecordsInZone
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_InsertCentreRecordsInZone' AND xtype = 'P')
	DROP PROCEDURE _InsertCentreRecordsInZone
GO

CREATE PROCEDURE _InsertCentreRecordsInZone
(
	@p_centre_code			CHAR (3)
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt					VARCHAR (8000),
		@tbl_nm					VARCHAR (50),
		@qlf_tbl_nm				VARCHAR (50),
		@import_insert			INT,
		@identity_action		CHAR (1),
		@current_ident			INT,
		@centre_id				satsang_centre_id,
		@cols					VARCHAR (3000),
		@select_clause			VARCHAR (2000),
		@non_pk_cols_sets		VARCHAR (MAX),
		@join_clause			VARCHAR (1000),
		@join_condition			VARCHAR (1000),
		@prvexp_join_clause		VARCHAR (1000),
		@prvexp_join_condition	VARCHAR (1000),
		@where_clause			VARCHAR (MAX),
		@rval					INT;
BEGIN
	EXEC	@rval =	__CheckCentreCode	@p_centre_code, @centre_id OUTPUT
	IF (@rval != 0)
		RETURN @rval;

		---- Get the Centre's Sewadars
	CREATE	TABLE	#centre_sewadars
	(
	 	--	sewadar_grno	CHAR (6)	COLLATE	SQL_Latin1_General_CP1_CI_AS	NOT NULL	PRIMARY KEY,		-- Latin1_General_CI_AI
	 	sewadar_grno	CHAR (6)	NOT NULL	PRIMARY KEY,
		sewadar_id		INTEGER		NOT NULL	UNIQUE	NONCLUSTERED
	);

	EXEC __GetCentreSewadars @centre_id;

	UPDATE	_ZSM_tables
		SET	table_sq	=	table_id;

	DECLARE	crsr CURSOR STATIC	FOR
		SELECT	table_nm, import_insert, identity_action
		FROM	_ZSM_tables
		WHERE	import_insert	>	0
		ORDER BY table_sq;
	
	OPEN crsr;

	FETCH crsr
		INTO	@tbl_nm, @import_insert, @identity_action
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
PRINT @tbl_nm;
		SET	@cols = '';
		SELECT	@cols = @cols + 'a.' + COLUMN_NAME + ', '
		FROM	INFORMATION_SCHEMA.COLUMNS
		WHERE	TABLE_NAME	=	@tbl_nm
		AND		DATA_TYPE	!=	'TIMESTAMP';
		IF (@@ROWCOUNT = 0)
		BEGIN
			RAISERROR ('Invalid table "%s" - no column found for it', 16, 1, @tbl_nm);
			RETURN -4;
		END
		SET @cols = SUBSTRING (@cols, 1, LEN (@cols) - 1);

		IF (@identity_action != 'N')	--- Table has IDENTITY column
		BEGIN
			SET @qlf_tbl_nm	= 'ZSM..' + @tbl_nm;
			SET @current_ident = IDENT_CURRENT(@qlf_tbl_nm);
			SET @stmt = 'SET IDENTITY_INSERT ZSM..' + @tbl_nm + ' ON ; ';
		END
		ELSE
			SET @stmt = '';

		SET @stmt =	@stmt
					+ '	INSERT	INTO	ZSM..' + @tbl_nm
					+ '			( ' +	@cols + ' ) '
					+ '		SELECT	' + @cols
					+ '		FROM	' + @tbl_nm + '	a	';

		IF (@import_insert & 2 = 2) 			-- 2nd Bit  	Value 2 :	Use Sewadar IDs (obtained using JOIN between Zone and Centre Sewadars on Current Sewadar GRNo and restricted to the importing Centre)
			SET @stmt = @stmt + 'WHERE	EXISTS	(	SELECT	1
													FROM	#centre_sewadars	c
													WHERE	a.sewadar_id	=	c.sewadar_id
												)';
		ELSE IF (@import_insert & 4 = 4) 		-- 3rd Bit  	Value 4 :	Use Sewadar GRNos (obtained using JOIN between Zone and Centre Sewadars on Current Sewadar GRNo and restricted to the importing Centre)
			SET @stmt = @stmt + 'WHERE	a.satsang_centre_id	= ' + CONVERT (VARCHAR, @centre_id) + '
								 AND	EXISTS	(	SELECT	1
													FROM	#centre_sewadars	c
													WHERE	a.sewadar_grno	=	c.sewadar_grno
												)';

		ELSE IF (@import_insert & 8 = 8) 		-- 4th Bit  	Value 8 :	Import all non-existing (determined using primary ket columns) records unconditionally
		BEGIN
			EXEC _GetTableConditions @tbl_nm, 0,	@select_clause			OUTPUT,
													@non_pk_cols_sets		OUTPUT,
													@join_clause			OUTPUT,
													@join_condition			OUTPUT,
													@prvexp_join_clause		OUTPUT,
													@prvexp_join_condition	OUTPUT,
													@where_clause			OUTPUT;
			SET @stmt = @stmt + 'WHERE	NOT	EXISTS	(	SELECT	1
														FROM	ZSM..' + @tbl_nm + ' b
														WHERE	' + @join_condition + '
													)';
		END

		IF (@identity_action != 'N')	--- Table has IDENTITY column
			SET @stmt = @stmt + 'SET IDENTITY_INSERT ZSM..' + @tbl_nm + ' OFF ; ';

print @stmt
		EXEC (@stmt);

		IF (@identity_action != 'N')	--- Table has IDENTITY column
			DBCC CHECKIDENT (@qlf_tbl_nm, RESEED, @current_ident) WITH NO_INFOMSGS;

		FETCH crsr
			INTO	@tbl_nm, @import_insert, @identity_action
	END

	CLOSE crsr;

	DEALLOCATE crsr;
	DROP TABLE	#centre_sewadars;
END
GO


-- =============================================================================
-- Procedure _UpdateRecordCount
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_UpdateRecordCount' AND xtype = 'P')
	DROP PROCEDURE _UpdateRecordCount
GO

CREATE PROCEDURE _UpdateRecordCount
(
	@p_operation_id		data_operation_id,
	@p_table_nm			VARCHAR (50),
	@p_is_audit_table	Boolean,
	@p_is_before_oprn	Boolean,
	@p_is_zone_count	Boolean
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt	VARCHAR (1000);
BEGIN
	SET @stmt =	 '	UPDATE	ZSM.._data_operations_tables
						SET	row_cnt_' + CASE WHEN @p_is_zone_count = 'Yes' THEN 'zone' ELSE 'centre' END + '_' + CASE WHEN @p_is_before_oprn = 'Yes' THEN 'before' ELSE 'after' END + '_opn
										=	(	SELECT	COUNT (*)
												FROM	' + CASE WHEN @p_is_zone_count = 'Yes' THEN 'ZSM..' ELSE '' END
														  + CASE WHEN @p_is_audit_table = 'Yes' THEN 'adt_' ELSE '' END
														  + @p_table_nm + '
											)
					WHERE	data_operation_id	=	' + CONVERT (VARCHAR, @p_operation_id) + '
					AND		zsm_table_nm		=	''' + @p_table_nm + '''
					AND		is_audit_table		=	''' + @p_is_audit_table + ''';';
----					print @stmt
	EXEC (@stmt);
END
GO

-- =============================================================================
-- Procedure _CountZoneRecordsBeforeOperation
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountZoneRecordsBeforeOperation' AND xtype = 'P')
	DROP PROCEDURE _CountZoneRecordsBeforeOperation
GO

CREATE PROCEDURE _CountZoneRecordsBeforeOperation
(
	@p_operation_id		data_operation_id,
	@p_table_nm			VARCHAR (50),
	@p_is_audit_table	Boolean
)
WITH ENCRYPTION
AS
	DECLARE
		@stmt	VARCHAR (1000);
BEGIN
	SET @stmt =	 '	INSERT INTO	ZSM.._data_operations_tables
							(	data_operation_id, zsm_table_nm, is_audit_table, row_cnt_zone_before_opn	)
				 		SELECT	' + CONVERT (VARCHAR, @p_operation_id) + ', ''' + @p_table_nm + ''', ''' + @p_is_audit_table + ''', COUNT (*)
				 		FROM	ZSM..' + CASE WHEN @p_is_audit_table = 'Yes' THEN 'adt_' ELSE '' END + @p_table_nm + ';';
	EXEC (@stmt);
END
GO

-- =============================================================================
-- Procedure _CountRecords
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountRecords' AND xtype = 'P')
	DROP PROCEDURE _CountRecords
GO

CREATE PROCEDURE _CountRecords
(
	@p_operation_id		data_operation_id,
	@p_is_before_oprn	Boolean
)
WITH ENCRYPTION
AS
	DECLARE
		@has_audit_tbl			Boolean,
		@tbl_nm					VARCHAR (50)
BEGIN
	IF (@p_operation_id IS NULL OR @p_operation_id <= 0)
	BEGIN
		RAISERROR('"Data Operation ID" must be specified', 16, 1)
		RETURN;
	END

	DECLARE	crsr CURSOR STATIC	FOR
		SELECT	table_nm, has_audit_table
		FROM	_ZSM_tables
		WHERE	is_import_export	=	'No'
		ORDER BY table_sq;
	
	OPEN crsr;

	FETCH crsr
		INTO	@tbl_nm, @has_audit_tbl
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@p_is_before_oprn = 'Yes')
			EXEC _CountZoneRecordsBeforeOperation @p_operation_id, @tbl_nm, 'No'
		ELSE
			EXEC _UpdateRecordCount @p_operation_id, @tbl_nm, 'No', @p_is_before_oprn, 'Yes'

		EXEC _UpdateRecordCount @p_operation_id, @tbl_nm, 'No', @p_is_before_oprn, 'No'
		IF (@has_audit_tbl = 'Yes')
		BEGIN
			IF (@p_is_before_oprn = 'Yes')
				EXEC _CountZoneRecordsBeforeOperation @p_operation_id, @tbl_nm, 'Yes'
			ELSE
				EXEC _UpdateRecordCount @p_operation_id, @tbl_nm, 'Yes', @p_is_before_oprn, 'Yes'
			EXEC _UpdateRecordCount @p_operation_id, @tbl_nm, 'Yes', @p_is_before_oprn, 'No'
		END
		
		FETCH crsr
			INTO	@tbl_nm, @has_audit_tbl
	END

	CLOSE crsr;
	DEALLOCATE crsr;
END
GO

-- =============================================================================
-- Procedure _CountRecordsBefore
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountRecordsBefore' AND xtype = 'P')
	DROP PROCEDURE _CountRecordsBefore
GO

CREATE PROCEDURE _CountRecordsBefore
(
	@p_operation		VARCHAR (10),
	@p_centre_code		CHAR (3),
	@p_remarks			VARCHAR (200)
)
WITH ENCRYPTION
AS
	DECLARE
		@operation_id	data_operation_id,
		@stmt			VARCHAR (100);
BEGIN
	IF (@p_centre_code IS NULL OR @p_centre_code = '')
	BEGIN
		RAISERROR('"Centre Code" must be specified', 16, 1)
		RETURN;
	END

	SET @stmt = 'ZSM_' + @p_centre_code;
	IF (@stmt != DB_NAME())
	BEGIN
		RAISERROR('Current Database is not for the ZSM as per the Centre Code specified', 16, 1)
		RETURN;
	END

	IF (@p_operation IS NULL OR @p_operation = '')
	BEGIN
		RAISERROR('"Operation" like Import, Export, Copy, etc. must be specified', 16, 1)
		RETURN;
	END
	
	INSERT	INTO	ZSM.._data_operations
			(	data_operation_cd, satsang_centre_cd, remarks	)
		VALUES
			(	@p_operation, @p_centre_code, @p_remarks	);
	SET @operation_id = SCOPE_IDENTITY();

	EXEC _CountRecords @operation_id, 'Yes';

	UPDATE	ZSM.._data_operations
		SET	before_count_finish_dtm	=	GetDate()
	WHERE	data_operation_id	=	@operation_id;
END
GO

-- =============================================================================
-- Procedure _CountRecordsAfter
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountRecordsAfter' AND xtype = 'P')
	DROP PROCEDURE _CountRecordsAfter
GO

CREATE PROCEDURE _CountRecordsAfter
(
	@p_operation			VARCHAR (10),
	@p_centre_code			CHAR (3),
	@p_operation_start_dt	DATETIME,
	@p_operation_id			data_operation_id
)
WITH ENCRYPTION
AS
	DECLARE
		@operation_id	data_operation_id,
		@stmt			VARCHAR (100);
BEGIN
	IF (@p_centre_code IS NULL OR @p_centre_code = '')
	BEGIN
		RAISERROR('"Centre Code" must be specified', 16, 1)
		RETURN;
	END

	SET @stmt = 'ZSM_' + @p_centre_code;
	IF (@stmt != DB_NAME())
	BEGIN
		RAISERROR('Current Database is not for the ZSM as per the Centre Code specified', 16, 1)
		RETURN;
	END

	IF (@p_operation IS NULL OR @p_operation = '')
	BEGIN
		RAISERROR('"Operation" like Import, Export, Copy, etc. must be specified', 16, 1)
		RETURN;
	END
	
	IF (@p_operation_start_dt IS NULL OR @p_operation_start_dt = '')
	BEGIN
		RAISERROR('"Date of Start Operation" must be specified', 16, 1)
		RETURN;
	END

	SELECT	@operation_id = data_operation_id
	FROM	ZSM.._data_operations
	WHERE	data_operation_cd	=	@p_operation
	AND		satsang_centre_cd	=	@p_centre_code
	AND		DATEDIFF(dd, before_count_start_dtm, @p_operation_start_dt)	=	0
	AND		after_count_start_dtm	IS NULL
	AND	(	(	@p_operation_id	IS NULL	)
		OR	(	@p_operation_id	IS NOT NULL	AND	data_operation_id = @p_operation_id	)
		);
	IF (@@ROWCOUNT != 1)
	BEGIN
		RAISERROR('Details about Start of Operation could not be found', 16, 1)
		RETURN;
	END
	
	UPDATE	ZSM.._data_operations
		SET	after_count_start_dtm	=	GetDate()
	WHERE	data_operation_id	=	@operation_id;

	EXEC _CountRecords @operation_id, 'No';

	UPDATE	ZSM.._data_operations
		SET	after_count_finish_dtm	=	GetDate()
	WHERE	data_operation_id	=	@operation_id;
END
GO

-- =============================================================================
-- Procedure _CountZoneRecordsBefore
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountZoneRecordsBefore' AND xtype = 'P')
	DROP PROCEDURE _CountZoneRecordsBefore
GO

CREATE PROCEDURE _CountZoneRecordsBefore
(
	@p_operation		VARCHAR (10),
	@p_remarks			VARCHAR (200)
)
WITH ENCRYPTION
AS
	DECLARE
		@operation_id	data_operation_id,
		@stmt			VARCHAR (100);
BEGIN
	IF (@p_operation IS NULL OR @p_operation = '')
	BEGIN
		RAISERROR('"Operation" like Import, Export, Copy, etc. must be specified', 16, 1)
		RETURN;
	END
	
	INSERT	INTO	ZSM.._data_operations
			(	data_operation_cd, satsang_centre_cd, remarks	)
		VALUES
			(	@p_operation, 'MUM', @p_remarks	);
	SET @operation_id = SCOPE_IDENTITY();

	EXEC _CountRecords @operation_id, 'Yes';

	UPDATE	ZSM.._data_operations
		SET	before_count_finish_dtm	=	GetDate()
	WHERE	data_operation_id	=	@operation_id;
END
GO

-- =============================================================================
-- Procedure _CountZoneRecordsAfter
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_CountZoneRecordsAfter' AND xtype = 'P')
	DROP PROCEDURE _CountZoneRecordsAfter
GO

CREATE PROCEDURE _CountZoneRecordsAfter
(
	@p_operation			VARCHAR (10),
	@p_operation_start_dt	DATETIME,
	@p_operation_id			data_operation_id
)
WITH ENCRYPTION
AS
	DECLARE
		@operation_id	data_operation_id,
		@stmt			VARCHAR (100);
BEGIN
	IF (@p_operation IS NULL OR @p_operation = '')
	BEGIN
		RAISERROR('"Operation" like Import, Export, Copy, etc. must be specified', 16, 1)
		RETURN;
	END
	
	IF (@p_operation_start_dt IS NULL OR @p_operation_start_dt = '')
	BEGIN
		RAISERROR('"Date of Start Operation" must be specified', 16, 1)
		RETURN;
	END

	SELECT	@operation_id = data_operation_id
	FROM	ZSM.._data_operations
	WHERE	data_operation_cd	=	@p_operation
	AND		satsang_centre_cd	=	'MUM'
	AND		DATEDIFF(dd, before_count_start_dtm, @p_operation_start_dt)	=	0
	AND		after_count_start_dtm	IS NULL
	AND	(	(	@p_operation_id	IS NULL	)
		OR	(	@p_operation_id	IS NOT NULL	AND	data_operation_id = @p_operation_id	)
		);
	IF (@@ROWCOUNT != 1)
	BEGIN
		RAISERROR('Details about Start of Operation could not be found', 16, 1)
		RETURN;
	END
	
	UPDATE	ZSM.._data_operations
		SET	after_count_start_dtm	=	GetDate()
	WHERE	data_operation_id	=	@operation_id;

	EXEC _CountRecords @operation_id, 'No';

	UPDATE	ZSM.._data_operations
		SET	after_count_finish_dtm	=	GetDate()
	WHERE	data_operation_id	=	@operation_id;
END
GO

-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console

