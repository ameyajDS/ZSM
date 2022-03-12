/* =================================================================================================
	Author(s)     : Jitendra Loyal
	Started On    : Thu Mar 29 12:06 IST 2013
	Last updated  : Nov 28, 2013
	Reviewed By   : 
	Reviewed On   : 
 ===================================================================================================
                                                                                         Usage Notes
 ---------------------------------------------------------------------------------------------------
      Stored Procedures:
	  	MD_ValidateEntity			It validates an entity by constructing various SQL statements to ensure
									that the names of the databases, tables and columns are correctly specified.
									Any error returned from the procedure indicates an incorrect specification.
									It also prints all the SQL statements that are dynamically created to help in fixing the error.
		MD_GetReferenceCount		It returns the record-set with number of occurrences of the Dirty Value
									in the Column of the Reference Database Table.
		MD_LookupRootEntity			This returns the record-set (ID and Column) for the first (root) preceding
									Entity.
		MD_LookupPrecedingEntity	This returns the record-set (ID and Column) for the preceding enity other
									than the first (root).
		MD_LookupEntity				This returns the record-set (ID and Column) for the Entity. The record-set
									must be restricted when one or more preceding entities exist.
		MD_FixDataInstance			This procedure replaces the old value with the new value for an entity.
		MD_QueryEntitiesOperations	This procedure is called for switching to browse mode on the basis of 
									criteria specified.
 ===================================================================================================
                                                                                    Revision History
 ---------------------------------------------------------------------------------------------------
 	JL : 27, 28-Nov-2013
		* All procedures modified for the schema changes (including prefix md_), and initial fixes post testing.
 	JL : 01-Apr-2013
		* Procedure QueryEntitiesCleanups added.
	JL : 29-Mar-2013
		* Initial Version
================================================================================================= */


-- =============================================================================
-- Procedure MD_ValidateEntity
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MD_ValidateEntity' AND xtype = 'P')
	DROP PROCEDURE MD_ValidateEntity
GO

CREATE PROCEDURE MD_ValidateEntity
(
	@p_entity_id			entity_id
)
WITH ENCRYPTION
AS
	DECLARE
		@entity_db					database_nm,
		@entity_tbl					table_nm,
		@reference_db				database_nm,
		@reference_tbl				table_nm,
		@reference_column			column_nm,
		@pk_column_nm				column_nm,
		@entity_id_column			column_nm,
		@preceding_entity_db		database_nm,
		@preceding_entity_tbl		table_nm,
		@preceding_entity_id_column	column_nm,
		@preceding_entity_nm_column	column_nm,
		@prv_entity_id_column		column_nm,
		@entity_reference_id		entity_reference_id,
		@reference_exists			BIT,
		@reference_pk_exists		BIT,
		@loop_entered				BIT,
		@col_list					VARCHAR (1000),
		@str						VARCHAR (4000);
BEGIN
		---- SELECTing from md_entities
		-------------------------------
	SELECT	@entity_db	=	entity_db,
			@entity_tbl	=	entity_tbl,
			@str	=	'	SELECT	TOP 10	'
									  + entity_id_column + ',	'
									  + entity_nm_column + '	'
									  + CASE WHEN effective_from_dt_column IS NOT NULL
									  			THEN ', ' + effective_from_dt_column + ', ' + effective_till_dt_column + '	'
												ELSE ''
										END
									  + CASE WHEN active_column IS NOT NULL
									  			THEN ', ' + active_column + '	'
												ELSE ''
										END
									  + CASE WHEN additional_info_column IS NOT NULL
									  			THEN ', ' + additional_info_column	+ '	'
												ELSE ''
										END
						+ '	FROM	' + entity_db + '..' + entity_tbl + ';'
	FROM	md_entities
	WHERE	entity_id	=	@p_entity_id;

	IF (@@ROWCOUNT = 1)
	BEGIN
PRINT @str;
		EXEC (@str);
	END
	ELSE
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Entity', NULL, NULL 
		RETURN -1;
	END

		---- SELECTing from md_entities_references
		------------------------------------------
	DECLARE	r_crsr	CURSOR	FAST_FORWARD	FOR
		SELECT	entity_reference_id, reference_db, reference_tbl, reference_column
		FROM	md_entities_references
		WHERE	entity_id	=	@p_entity_id;
	
	SET @reference_exists	=	0;

	OPEN r_crsr;
	FETCH NEXT FROM	r_crsr
		INTO	@entity_reference_id, @reference_db, @reference_tbl, @reference_column;

--	WHILE (@@FETCH_STATUS = 0)
--	WHILE ( ( SELECT fetch_status FROM sys.dm_exec_cursors(@@SPID) WHERE name = 'r_crsr' ) = 0 )
	WHILE ( (	SELECT	fetch_status
				FROM	sys.dm_exec_cursors(0)
				WHERE	name		=	'r_crsr'
				AND		session_id	=	@@SPID
			) = 0 )
	BEGIN
		SET @reference_exists	=	1;

PRINT 'Reference table :: ' + @reference_tbl + '   Reference Column :: ' + @reference_column;
		SET	@str	=	'	SELECT	TOP 10	' + @reference_column + '	'
						+ '	FROM	' + @reference_db + '..' + @reference_tbl
						+ '	WHERE	' + @reference_column + '	IS NOT NULL;';
PRINT @str;
		EXEC (@str);

		SET @reference_pk_exists	=	0;
		SET @loop_entered	=	0;
		SET @col_list	= ''

					---- SELECTing from md_entities_references_pk_columns
					-----------------------------------------------------
		DECLARE	k_crsr	CURSOR	FAST_FORWARD	FOR
			SELECT	pk_column_nm
			FROM	md_entities_references_pk_columns
			WHERE	entity_reference_id	=	@entity_reference_id
			ORDER BY	pk_column_sq;
		
		OPEN k_crsr;
		FETCH NEXT FROM	k_crsr
			INTO	@pk_column_nm;

--		WHILE (@@FETCH_STATUS = 0)
--		WHILE ( ( SELECT fetch_status FROM sys.dm_exec_cursors(@@SPID) WHERE name = 'k_crsr' ) = 0 )
		WHILE ( (	SELECT	fetch_status
					FROM	sys.dm_exec_cursors(0)
					WHERE	name		=	'k_crsr'
					AND		session_id	=	@@SPID
				) = 0 )
		BEGIN
			SET @reference_pk_exists	=	1;
			SET @loop_entered	=	1;
			SET	@col_list	=	@col_list + @pk_column_nm + ', '
			FETCH NEXT FROM	k_crsr
				INTO	@pk_column_nm;
		END
		CLOSE	k_crsr;
		DEALLOCATE	k_crsr;

		IF (@loop_entered = 1)
		BEGIN
			SET	@str	=	'	SELECT	' + @col_list + 'COUNT (*)	AS [No. of Records for a Primary Key]'
							+ '	FROM	' + @reference_db + '..' + @reference_tbl
							+ '	GROUP BY ' + LEFT (@col_list, LEN (@col_list) - 1)
							+ ' HAVING	COUNT (*)	>	1';
PRINT @str;
			EXEC (@str);
			IF (@@ROWCOUNT > 0)
			BEGIN
				EXEC SysAdmin..RaiseErrorMessage 'ExistInfo', NULL, 'Invalid Primary Key for Entity Reference', NULL, NULL 
				CLOSE	r_crsr;
				DEALLOCATE	r_crsr;
				RETURN -2;
			END

		END

		FETCH NEXT FROM	r_crsr
			INTO	@entity_reference_id, @reference_db, @reference_tbl, @reference_column;
	END
	CLOSE	r_crsr;
	DEALLOCATE	r_crsr;

	IF (@reference_exists = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Entity Reference(s)', NULL, NULL 
		RETURN -3;
	END

	IF (@reference_pk_exists = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Entity Reference''s Primary Key Column(s)', NULL, NULL 
		RETURN -4;
	END

		---- SELECTing from md_preceding_entities
		-----------------------------------------
	DECLARE	p_crsr	CURSOR	FAST_FORWARD	FOR
		SELECT	entity_id_column, preceding_entity_db, preceding_entity_tbl, preceding_entity_id_column, preceding_entity_nm_column
		FROM	md_preceding_entities
		WHERE	entity_id	=	@p_entity_id
		ORDER BY display_order;
	
	SET @prv_entity_id_column = NULL;

	OPEN p_crsr;
	FETCH NEXT FROM	p_crsr
		INTO	@entity_id_column, @preceding_entity_db, @preceding_entity_tbl, @preceding_entity_id_column, @preceding_entity_nm_column

--	WHILE (@@FETCH_STATUS = 0)
--	WHILE ( ( SELECT fetch_status FROM sys.dm_exec_cursors(@@SPID) WHERE name = 'p_crsr' ) = 0 )
	WHILE ( (	SELECT	fetch_status
				FROM	sys.dm_exec_cursors(0)
				WHERE	name		=	'p_crsr'
				AND		session_id	=	@@SPID
			) = 0 )
	BEGIN
		IF (@prv_entity_id_column IS NOT NULL)
		BEGIN
			SET	@str	=	'	SELECT	TOP 10	' + @prv_entity_id_column + '	'
							+ '	FROM	' + @preceding_entity_db + '..' + @preceding_entity_tbl
							+ '	WHERE	' + @prv_entity_id_column + '	IS NOT NULL;';
PRINT @str;
			EXEC (@str);
		END
		SET	@str	=	'	SELECT	TOP 10	' + @preceding_entity_id_column + ', ' + @preceding_entity_nm_column + '	'
						+ '	FROM	' + @preceding_entity_db + '..' + @preceding_entity_tbl
						+ '	WHERE	' + @preceding_entity_id_column + '	IS NOT NULL;';
PRINT @str;
		EXEC (@str);

		SET @prv_entity_id_column		=	@entity_id_column;

		FETCH NEXT FROM	p_crsr
			INTO	@entity_id_column, @preceding_entity_db, @preceding_entity_tbl, @preceding_entity_id_column, @preceding_entity_nm_column
	END
	IF (@prv_entity_id_column IS NOT NULL)
	BEGIN
		SET	@str	=	'	SELECT	TOP 10	' + @prv_entity_id_column + '	'
						+ '	FROM	' + @entity_db + '..' + @entity_tbl
						+ '	WHERE	' + @prv_entity_id_column + '	IS NOT NULL;';
PRINT @str;
		EXEC (@str);
	END
	CLOSE	p_crsr;
	DEALLOCATE	p_crsr;
END
GO

-- =============================================================================
-- Procedure MD_GetReferenceCount
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MD_GetReferenceCount' AND xtype = 'P')
	DROP PROCEDURE MD_GetReferenceCount
GO

CREATE PROCEDURE MD_GetReferenceCount
(
	@p_reference_db		database_nm,
	@p_reference_tbl	table_nm,
	@p_reference_column	column_nm,
	@p_old_value		column_value
)
WITH ENCRYPTION
AS
	DECLARE
		@str						VARCHAR (2000);
BEGIN
	SET	@str	=	'	SELECT	COUNT (*)	'
					+ '	FROM	' + @p_reference_db + '..' + @p_reference_tbl
					+ '	WHERE	' + @p_reference_column	+ ' = ''' + @p_old_value + ''';'
	EXEC (@str);
END
GO


-- =============================================================================
-- Procedure MD_LookupRootEntity
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MD_LookupRootEntity' AND xtype = 'P')
	DROP PROCEDURE MD_LookupRootEntity
GO

CREATE PROCEDURE MD_LookupRootEntity
(
	@p_entity_id		entity_id
)
WITH ENCRYPTION
AS
	DECLARE
		@str	VARCHAR (2000);
BEGIN
	SELECT	@str	=	'	SELECT	' + preceding_entity_id_column + ', ' + preceding_entity_nm_column + '	'
						+ '	FROM	' + preceding_entity_db + '..' + preceding_entity_tbl + '	'
						+ '	ORDER BY 2;'
	FROM	md_preceding_entities
	WHERE	entity_id	=	@p_entity_id
	AND		display_order	=	1
	EXEC (@str);
END
GO


-- =============================================================================
-- Procedure MD_LookupPrecedingEntity
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MD_LookupPrecedingEntity' AND xtype = 'P')
	DROP PROCEDURE MD_LookupPrecedingEntity
GO

CREATE PROCEDURE MD_LookupPrecedingEntity
(
	@p_entity_id		entity_id,
	@p_entity_no		display_order,		--- Value > 1
	@p_preceding_value	column_value
)
WITH ENCRYPTION
AS
	DECLARE
		@str	VARCHAR (2000);
BEGIN
	IF (@p_preceding_value IS NULL OR @p_preceding_value = '')
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'ValueReqd', NULL, 'Preceding Value', NULL, NULL 
		RETURN -1;
	END
	SELECT	@str	=	'	SELECT	' + n.preceding_entity_id_column + ', ' + n.preceding_entity_nm_column + '	'
						+ '	FROM	' + n.preceding_entity_db + '..' + n.preceding_entity_tbl
						+ '	WHERE	' + p.entity_id_column + '	=	''' + @p_preceding_value + '''	'
						+ '	ORDER BY 2;'
	FROM	md_preceding_entities	n
		JOIN	md_preceding_entities	p
			ON	(	n.entity_id	=	p.entity_id
				AND	n.entity_id	=	@p_entity_id
				AND	n.display_order	=	@p_entity_no
				AND	p.display_order	=	@p_entity_no - 1
				)
	WHERE	n.display_order	>	1
	EXEC (@str);
END
GO


-- =============================================================================
-- Procedure MD_LookupEntity
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MD_LookupEntity' AND xtype = 'P')
	DROP PROCEDURE MD_LookupEntity
GO

CREATE PROCEDURE MD_LookupEntity
(
	@p_entity_id		entity_id,
	@p_preceding_value	column_value	=	NULL
)
WITH ENCRYPTION
AS
	DECLARE
		@e_no	display_order,
		@str	VARCHAR (2000);
BEGIN
	SELECT	@e_no	=	MAX (display_order)
	FROM	md_preceding_entities
	WHERE	entity_id	=	@p_entity_id;

	IF (@e_no IS NOT NULL AND @e_no > 0 AND (@p_preceding_value IS NULL OR @p_preceding_value = ''))
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'ValueReqd', NULL, 'Preceding Value', NULL, NULL 
		RETURN -1;
	END

	SELECT @str = '	SELECT	'	+ e.entity_id_column + ',	'
								+ e.entity_nm_column + '	'
								+ CASE WHEN e.effective_from_dt_column IS NOT NULL
										THEN ', ' + e.effective_from_dt_column + ', ' + e.effective_till_dt_column + '	'
										ELSE ''
								END
								+ CASE WHEN e.active_column IS NOT NULL
										THEN ', ' + e.active_column + '	'
										ELSE ''
								END
								+ CASE WHEN e.additional_info_column IS NOT NULL
										THEN ', ' + e.additional_info_column	+ '	'
										ELSE ''
								END
				+ '	FROM	' + e.entity_db + '..' + e.entity_tbl + '	'
				+ CASE WHEN @e_no > 0
						THEN	'	WHERE	' + p.entity_id_column + '	=	''' + @p_preceding_value + '''	'
						ELSE	''
				  END
				+ '	ORDER BY 2;'
	FROM	md_entities	e
		LEFT JOIN	md_preceding_entities	p
			ON	(	e.entity_id	=	p.entity_id
				AND	p.display_order	=	@e_no
				)
	WHERE	e.entity_id	=	@p_entity_id;

	EXEC (@str);
END
GO


-- =============================================================================
-- Procedure MD_FixDataInstance
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MD_FixDataInstance' AND xtype = 'P')
	DROP PROCEDURE MD_FixDataInstance
GO

CREATE PROCEDURE MD_FixDataInstance
(
	@p_entity_id		entity_id,
	@p_user_no			INTEGER,
	@p_old_value		column_value,
	@p_new_value		column_value,
	@p_operation_id		INTEGER			OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@rowcnt					INT,
		@cnt					INT,
		@entity_reference_id	entity_reference_id,
		@reference_db			database_nm,
		@reference_tbl			table_nm,
		@reference_column		column_nm,
		@pk_column_nm			column_nm,
		@col_cnt				INT,
		@col_nm_list			VARCHAR (1000),
		@col_vl_list			VARCHAR (1000),
		@str					VARCHAR (3000),
		@references				VARCHAR (6000),
		@upd_str				VARCHAR (6000);
BEGIN
	SELECT	@upd_str	=	'	UPDATE	' + entity_db + '..' + entity_tbl + '	'
							+ '		SET	' + CASE WHEN effective_till_dt_column IS NOT NULL
													THEN effective_till_dt_column + ' = CONVERT (VARCHAR (11), GetDate(), 106) '
												WHEN active_column IS NOT NULL
													THEN active_column + ' = ''' + inactive_value + '''	'
											END
							+ '	WHERE	' + entity_id_column + ' = ''' + @p_old_value + ''';'
	FROM	md_entities
	WHERE	entity_id	=	@p_entity_id;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Entity', NULL, NULL 
		RETURN -1;
	END

	INSERT INTO	md_entities_operations_log
			(	entity_id, user_no, user_role_id, operation, old_value, new_value	)
		VALUES
			(	@p_entity_id, @p_user_no, CURRENT_USER, 'Fix', @p_old_value, @p_new_value	);

 	SET @p_operation_id	=	SCOPE_IDENTITY ();

	IF (@upd_str IS NOT NULL)
		EXEC (@upd_str);			--- UPDATE the entity_table to make the instance inactive/ineffective
		
	DECLARE	r_crsr	CURSOR	FAST_FORWARD	FOR
		SELECT	entity_reference_id, reference_db, reference_tbl, reference_column
		FROM	md_entities_references
		WHERE	entity_id	=	@p_entity_id;
	
	DECLARE	k_crsr	CURSOR	FAST_FORWARD	FOR
		SELECT	pk_column_nm
		FROM	md_entities_references_pk_columns
		WHERE	entity_reference_id	=	@entity_reference_id
		ORDER BY	pk_column_sq;
	
	SET @cnt = 0;
	SET	@references = '';
	OPEN r_crsr;
	FETCH NEXT FROM	r_crsr
		INTO	@entity_reference_id, @reference_db, @reference_tbl, @reference_column;

--	WHILE (@@FETCH_STATUS = 0)
--	WHILE ( ( SELECT fetch_status FROM sys.dm_exec_cursors(@@SPID) WHERE name = 'r_crsr' ) = 0 )
	WHILE ( (	SELECT	fetch_status
				FROM	sys.dm_exec_cursors(0)
				WHERE	name		=	'r_crsr'
				AND		session_id	=	@@SPID
			) = 0 )
	BEGIN
		SET	@col_nm_list	=	'';
		SET	@col_vl_list	=	'';
		SET @col_cnt	=	0;

		OPEN k_crsr;
		FETCH NEXT FROM	k_crsr
			INTO	@pk_column_nm;

--		WHILE (@@FETCH_STATUS = 0)
--		WHILE ( ( SELECT fetch_status FROM sys.dm_exec_cursors(@@SPID) WHERE name = 'k_crsr' ) = 0 )
		WHILE ( (	SELECT	fetch_status
					FROM	sys.dm_exec_cursors(0)
					WHERE	name		=	'k_crsr'
					AND		session_id	=	@@SPID
				) = 0 )
		BEGIN
			SET @col_cnt =	@col_cnt + 1;
			SET	@col_nm_list	=	@col_nm_list + 'pk_column_' + CONVERT (VARCHAR, @col_cnt) + '_value, ';
			SET	@col_vl_list	=	@col_vl_list + @pk_column_nm + ', ';
			FETCH NEXT FROM	k_crsr
				INTO	@pk_column_nm;
		END
		CLOSE	k_crsr;

				--- Before updation to new values, we store the primary keys of the instances that will be affected
		SET	@str	=	'	INSERT INTO	md_entities_operations_instances_log
									(	entity_operation_id, ' + @col_nm_list + ', entity_reference_id
									)
								SELECT ' + CONVERT (VARCHAR, @p_operation_id) + ', ' + @col_vl_list + CONVERT (VARCHAR, @entity_reference_id) + '
								FROM	' + @reference_db + '..' + @reference_tbl + '
								WHERE	' + @reference_column + ' = ''' + @p_old_value + ''';';
		EXEC (@str);

				--- Update the instances to new values now
		SET	@upd_str	=	'	UPDATE	' + @reference_db + '..' + @reference_tbl	+	'
									SET	' + @reference_column + ' = ''' + @p_new_value + '''
								WHERE	' + @reference_column + ' = ''' + @p_old_value + ''';'
		EXEC (@upd_str);

		SET @rowcnt = @@ROWCOUNT;
		SET @cnt = @cnt + @rowcnt;
		SET @references = @references + @reference_db + '..' + @reference_tbl +	'.' + @reference_column + ':' + CONVERT (VARCHAR, @rowcnt) + '|';

		FETCH NEXT FROM	r_crsr
			INTO	@entity_reference_id, @reference_db, @reference_tbl, @reference_column;
	END
	CLOSE	r_crsr;
	DEALLOCATE	r_crsr;

	UPDATE	md_entities_operations_log
		SET	operation_finish_dtm	=	GetDate (),
			occurrences_replaced	=	@cnt,
			references_affected		=	@references
	WHERE	entity_operation_id	=	@p_operation_id;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Cleanup Entity Instance', NULL, NULL 
		RETURN -2;
	END
END
GO


-- =============================================================================
-- Procedure MD_QueryEntitiesOperations
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MD_QueryEntitiesOperations' AND xtype = 'P')
	DROP PROCEDURE MD_QueryEntitiesOperations
GO

CREATE PROCEDURE MD_QueryEntitiesOperations
(
	@p_entity_id		entity_id,
	@p_operation_id		INTEGER			=	NULL,
	@p_user_no			INTEGER			=	NULL,
	@p_user_role_id		user_role_id	=	NULL,
	@p_operation_dtm	DATETIME		=	NULL,
	@p_old_value		column_value	=	NULL,
	@p_new_value		column_value	=	NULL
)
WITH ENCRYPTION
AS
	DECLARE
		@str	VARCHAR (2000);
BEGIN
	SET @str	=	'	SELECT	*
						FROM	md_entities_operations_log
						WHERE	entity_id	=	'  + CONVERT (VARCHAR, @p_entity_id) + '	';
	IF (@p_operation_id	IS NOT NULL	AND	@p_operation_id	>	0)
		SET	@str = @str + '	AND	entity_operation_id	=	' + CONVERT (VARCHAR, @p_operation_id) + '	';
	IF (@p_user_no	IS NOT NULL	AND	@p_user_no	>	0)
		SET	@str = @str + '	AND	user_no	=	' + CONVERT (VARCHAR, @p_user_no) + '	';
	IF (@p_user_role_id	IS NOT NULL	AND	@p_user_role_id	!= '')
		SET	@str = @str + '	AND	user_role_id	=	''' + @p_user_role_id + '''	';
	IF (@p_operation_dtm	IS NOT NULL	AND	@p_operation_dtm	!= '')
		SET	@str = @str + '	AND	CONVERT (VARCHAR, operation_start_dtm, 106)	=	''' + CONVERT (VARCHAR, @p_operation_dtm, 106) + ''' ';
	IF (@p_old_value	IS NOT NULL	AND	@p_old_value	!= '')
		SET	@str = @str + '	AND	old_value	=	''' + @p_old_value + '''	';
	IF (@p_new_value	IS NOT NULL	AND	@p_new_value	!= '')
		SET	@str = @str + '	AND	new_value	=	''' + @p_new_value + '''	';
	
	EXEC (@str);
END
GO
-- ====================================================================================================

-- vim:ts=4 sw=4 ht=4
