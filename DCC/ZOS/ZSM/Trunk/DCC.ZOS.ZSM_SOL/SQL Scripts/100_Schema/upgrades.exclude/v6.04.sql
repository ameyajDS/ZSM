/* ==================================================================================
    Source File		:	upgrade_v6.03.sql
    Author(s)		:	Ameya
    Started On		:	24th Dec 2018
	Last updated	:	24th Dec 2018
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
	SET	version_no = 6.04,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO


USE ZSM
GO

CREATE TABLE scanned_badge_file_audit_logs
(
	scanning_job_id			INT				NOT NULL	CONSTRAINT ScannedBadgeFileAuditAogs_PK_ScanningJobID
															PRIMARY KEY CLUSTERED,
	filepath				VARCHAR(MAX)	NOT NULL,
	controlling_dt			SMALLDATETIME	NOT NULL,		
	import_username			VARCHAR(100)	NOT NULL,
	process_dt				DATETIME		NULL,
	process_username		VARCHAR(100)	NULL,
)
GO
