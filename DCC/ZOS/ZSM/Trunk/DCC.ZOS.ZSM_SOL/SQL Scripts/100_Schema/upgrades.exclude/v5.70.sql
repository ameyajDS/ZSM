/* ==================================================================================
    Source File		:	upgrade_v5.70.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	17 Sep, 2013
    Last updated	:	24 Sep, 2013
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.70
			.... Support for keeping count of records before and after ZSM operations.
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
	SET	version_no = 5.70,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'data_operation_id')
	EXEC	sp_droptype	'data_operation_id'
GO
EXEC	sp_addtype	'data_operation_id',			SMALLINT,			'NULL'
GO

-- =============================================================================

CREATE	TABLE	_data_operations
(
	data_operation_id		data_operation_id	NOT	NULL	IDENTITY (1,1)
															CONSTRAINT	_DataOperations_PK_DataOperationID
																PRIMARY KEY	NONCLUSTERED,
		--- Data Operations like Import, Export, Copy, etc.
	data_operation_cd		VARCHAR (10)		NOT NULL,

		--- 3-character code of Satsang Centre like MUM, NGP, KOL, IND, etc.
	satsang_centre_cd		CHAR (3)			NOT NULL,
	before_count_start_dtm	DATETIME			NOT NULL	CONSTRAINT	_DataOperations_DF_OperationStartDateTime
																DEFAULT	GETDATE(),
	before_count_finish_dtm	DATETIME				NULL,
	after_count_start_dtm	DATETIME				NULL,
	after_count_finish_dtm	DATETIME				NULL,
	remarks					VARCHAR (200)			NULL
)
GO

CREATE	TABLE _data_operations_tables
(
	data_operation_id			data_operation_id	NOT NULL	CONSTRAINT	_DataOperationsTables_FK_DataOperationID
																	REFERENCES	_data_operations,
	zsm_table_nm				VARCHAR (50)		NOT NULL,
	is_audit_table				Boolean				NOT NULL,
	row_cnt_zone_before_opn		INT					NOT NULL,
	row_cnt_centre_before_opn	INT						NULL,
	row_cnt_zone_after_opn		INT						NULL,
	row_cnt_centre_after_opn	INT						NULL,

		CONSTRAINT	_DataOperationsTables_PK_DataOperationID_ZSMTableName_IsAuditTable
			PRIMARY KEY	CLUSTERED	(	data_operation_id, zsm_table_nm, is_audit_table	)
)
GO

-- ===========================================================================================

