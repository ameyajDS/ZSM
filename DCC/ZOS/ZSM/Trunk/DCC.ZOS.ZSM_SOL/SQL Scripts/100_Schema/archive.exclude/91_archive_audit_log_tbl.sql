/* ==================================================================================
    Source File		:	schema_audit_archive.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Jul 31 18:09 IST 2012
    Version			:	1.00
    Last updated	:	Jul 31, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------

    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------
     JL : 31-Jul-2011
		*   Initial version
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

CREATE	TABLE	audit_logs
(
	audit_log_id			INTEGER			NOT NULL	CONSTRAINT	AuditLogs_PK_AuditLogID
																PRIMARY KEY	CLUSTERED,
	session_id				INTEGER			NOT NULL,		
	application_id 			CHAR (7)		NOT NULL,
	user_no					INTEGER			NOT NULL,
	user_role_id			VARCHAR (10)	NOT NULL,
	operation				CHAR (1)		NOT NULL,
	screen_id				CHAR (6)		NOT NULL,
	object_id				VARCHAR (50)	NOT NULL,

	satsang_centre_id 		satsang_centre_id	NULL,
	sewadar_grno			sewadar_grno		NULL,
	sewadar_id				sewadar_id			NULL,
	sewa_id					sewa_id				NULL,
	transaction_dt			DATETIME			NULL,

	operation_dts			DATETIME		NOT NULL
)
GO


-- =============================================================================
-- vim:ts=4 ht=8 sw=4
