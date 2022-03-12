/* ==================================================================================
    Source File		:	audit_logs_tbl.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Nov 18 07:19 IST 2010
    Version			:	1.??
    Last updated	:	Aug 02, 2012
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
     JL : 02-Aug-2011
		*   Split it into keeping audit_logs in the first file and other adt_* tables in the second one.
     JL : 31-Jul-2011
		*   Made all Primary Keys as Clustered.
     MS : 14-Dec-2011
		*   Moved adt_sewadars_photos to ZSM_Photos database.
     JL : 11-Dec-2011
		*   Column location_district_id added to table adt_sewadars_registrations.
     JL : 10-Dec-2011
		*   Columns trainee_current_seq_id and open_sewadar_current_seq_id added to table adt_sewas.
		*   Columns sewadar_type_id and sewa_id added to table adt_sewadars_registrations.
     JL : 15-Nov-2011
		*   Tables adt_generic_report_headers, adt_generic_report_details, adt_generic_report_summaries, and
			adt_generic_report_synopsis dropped.
     JL : 07-29-Nov-2010
		*   Initial versions
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

CREATE	TABLE	audit_logs
(
	audit_log_id			INTEGER			NOT NULL	IDENTITY (1, 1)		
														CONSTRAINT	AuditLogs_PK_AuditLogID
																PRIMARY KEY	CLUSTERED,
	session_id				INTEGER			NOT NULL,		
	application_id 			CHAR (7)		NOT NULL,
	user_no					INTEGER			NOT NULL,
	user_role_id			VARCHAR (10)	NOT NULL,
	operation				CHAR (1)		NOT NULL	CONSTRAINT	AuditLogs_CK_Operation
															CHECK	(operation	IN
																		(
																			'A',	--- Action (through Action Buttons)
																			'P',	--- Print			
																			'I',	--- Add / Insert
																			'U',	--- Modify / Update
																			'D'		--- Delete / Remove
																		 )
																	),
	screen_id				CHAR (6)		NOT NULL,
	object_id				VARCHAR (50)	NOT NULL,	--- Sewadar_id, sewadar_id + attendance_dt, team_id + attendance_dt, etc.
														--- Individual parts are separated by | (pipe) symbol.

	-- Note. --[-- Application specific columns START here
	satsang_centre_id 		satsang_centre_id	NULL,
	sewadar_grno			sewadar_grno		NULL,
	sewadar_id				sewadar_id			NULL,
	sewa_id					sewa_id				NULL,
	transaction_dt			DATETIME			NULL,
	-- Note. --]-- Application specific columns END here

	operation_dts			DATETIME		NOT NULL		CONSTRAINT	AuditLogs_DF_OperationDts
																	DEFAULT GetDate()
)
	

CREATE	INDEX	AuditLogs_IDX_ApplicationId_ScreenId_ObjectId
			ON	audit_logs	(	application_id, screen_id, object_id	)




-- =============================================================================
-- vim:ts=4 ht=8 sw=4
