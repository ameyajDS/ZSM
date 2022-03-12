/* ==================================================================================
	Source File		:	04_CDB_audit_schema.sql
	Author(s)		:	Sukhdev B. Darira / Jitendra Loyal
	Started On		:	Fri Aug 01 09:45:00 2008
	Version			:	0.07
	Module ID		:	CDB
	Language		:	TRANSACT-SQL
	Last updated	:	July 04, 2009
	Reviewed By		:	JL
	Reviewed On		:	August 01, 2008
	==================================================================================
									   Usage Notes
	----------------------------------------------------------------------------------
		Audit log tables for :
				Qualification Subjects
				Qualifications
				Assistant Services
				House Types
	==================================================================================
									  Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

--	USE CDB

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =====================================================================================
-- 								Table definitions begin here
-- =====================================================================================

CREATE	TABLE	audit_logs	
(
	audit_log_id			INTEGER					NOT NULL	IDENTITY (1, 1)		
																CONSTRAINT	AuditLogs_PK_AuditLogID
																		PRIMARY KEY	NONCLUSTERED,
	session_id				INTEGER					NOT NULL,		
	application_id 			CHAR (7)				NOT NULL,
	user_no					INTEGER					NOT NULL,
	user_role_id			VARCHAR (10)			NOT NULL,
	operation				CHAR (1)				NOT NULL
																CONSTRAINT	AuditLogs_CK_Operation
																		CHECK	(operation	IN
																					(
																						'A',	--- Action (through Action Buttons)
																						'P',	--- Print			
																						'I',	--- Add / Insert
																						'U',	--- Modify / Update
																						'D'		--- Delete / Remove
											   										 )
																				),
	screen_id				CHAR (6)				NOT NULL,
	object_id				VARCHAR (50)			NOT NULL,	--- Sewadar_id, sewadar_id + attendance_dt, team_id + attendance_dt, etc.
																--- Individual parts are separated by | (pipe) symbol.

	-- Note. Application specific columns START here.

	qualification_id		qualification_id			NULL,
   
	-- Note. Application specific columns END here.

	operation_dts			DATETIME				NOT NULL		CONSTRAINT	AuditLogs_DF_OperationDts
																			DEFAULT GetDate()
)
	
CREATE	INDEX	idx_audit_logs	ON	audit_logs	(application_id, screen_id, object_id)

-- ========================================================================================================
-- Detail Audit tables - one for each of the table in the CDB that has a screen to manage it
-- ========================================================================================================

CREATE	TABLE	adt_qlfctn_subjects
(
	audit_log_id		INTEGER				NOT NULL	CONSTRAINT	AdtQlfctnSubjects_FK_AuditLogId
																REFERENCES	audit_logs,
	qlfctn_subject_id	qlfctn_subject_id	NOT NULL,
	qlfctn_subject_cd	VARCHAR (5)			NOT NULL,
	qlfctn_subject_nm	VARCHAR (20)		NOT NULL,
	description			VARCHAR (50)			NULL,
	effective_from		DATETIME			NOT NULL,
	effective_till		DATETIME			NOT NULL,

		CONSTRAINT	AdtQlfctnSubjects_PK_QlfctnSubjectId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(qlfctn_subject_id, audit_log_id)
)


CREATE	TABLE	adt_qualifications
(
	audit_log_id		INTEGER				NOT NULL	CONSTRAINT	AdtQualifications_FK_AuditLogId
																REFERENCES	audit_logs,
	qualification_id	qualification_id	NOT NULL,
	qualification_type	qualification_type	NOT NULL,
	qualification_cd	VARCHAR (8)			NOT NULL,
	qualification_nm	VARCHAR (30)		NOT NULL,
	remarks				VARCHAR (200)			NULL,
	effective_from		DATETIME			NOT NULL,
	effective_till		DATETIME			NOT NULL,

		CONSTRAINT	AdtQualifications_PK_QualificationId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(qualification_id, audit_log_id)
)


CREATE	TABLE	adt_qualifications_qlfctn_subjects
(
	audit_log_id		INTEGER				NOT NULL	CONSTRAINT	AdtQualificationsQlfctnSubjects_FK_AuditLogId
																REFERENCES	audit_logs,
	qualification_id	qualification_id	NOT NULL,
	qlfctn_subject_id	qlfctn_subject_id	NOT NULL,
	effective_from		DATETIME			NOT NULL,
	effective_till		DATETIME			NOT NULL,

		CONSTRAINT	AdtQualificationQlfctnSubjects_PK_QualificationId_QlfctnSubjectId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(qualification_id, qlfctn_subject_id, audit_log_id)
)


CREATE	TABLE	adt_assistant_services
(
	audit_log_id			INTEGER					NOT NULL	CONSTRAINT	AdtAssistantServices_FK_AuditLogId
																		REFERENCES	audit_logs,
	assistant_service_id	assistant_service_id	NOT NULL,
	assistant_service_nm	VARCHAR (15)			NOT NULL,
	effective_from			DATETIME				NOT NULL,
	effective_till			DATETIME				NOT NULL,

		CONSTRAINT	AdtAssistantServices_PK_AssistantServiceId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(assistant_service_id, audit_log_id)
)


CREATE	TABLE	adt_working_units
(
	audit_log_id			INTEGER					NOT NULL	CONSTRAINT	AdtWorkingUnits_FK_AuditLogId
																		REFERENCES	audit_logs,
	working_unit_id			working_unit_id			NOT NULL,
	working_unit_cd			VARCHAR (10)			NOT NULL,
	working_unit_nm			VARCHAR (30)			NOT NULL,
	is_root					Boolean					NOT NULL,
	is_leaf					Boolean					NOT NULL,
    society_id				society_id				NOT NULL,
	is_staff_posted			Boolean					NOT NULL,
	working_unit_entity_id	working_unit_entity_id	NOT NULL,
	group_working_unit_id	working_unit_id				NULL,
	effective_from			DATETIME				NOT NULL,
	effective_till			DATETIME				NOT NULL,

		CONSTRAINT	AdtWorkingUnits_PK_WorkingUnitId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(working_unit_id, audit_log_id)
)


CREATE	TABLE	adt_responsibility_types
(
	audit_log_id			INTEGER					NOT NULL	CONSTRAINT	AdtResponsibilityTypes_FK_AuditLogId
																		REFERENCES	audit_logs,
	responsibility_type_id	responsibility_type_id	NOT NULL,
	working_unit_id			working_unit_id			NOT NULL,
	responsibility_nm		VARCHAR (20)			NOT NULL,
	responsibility_cnt		TINYINT					NOT NULL,
	responsibility_sq		display_order			NOT NULL,

		CONSTRAINT	AdtResponsibilityTypes_PK_ResponsibilityTypeId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(responsibility_type_id, audit_log_id)
)


CREATE	TABLE	adt_working_unit_responsibilities
(
	audit_log_id			INTEGER					NOT NULL	CONSTRAINT	AdtWorkingUnitsResponsibilities_FK_AuditLogId
																		REFERENCES	audit_logs,
	working_unit_id			working_unit_id			NOT NULL,
	sewadar_id				sewadar_id				NOT NULL,
	responsibility_type_id	responsibility_type_id	NOT NULL,
	responsibility_sq		display_order			NOT NULL,

		CONSTRAINT	AdtWorkingUnitsResponsibilities_PK_WorkingUnitId_SewadarId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(working_unit_id, sewadar_id, audit_log_id)
)

-- =============================================================================

CREATE	TABLE	adt_working_unit_sanctioned_strength
(
	audit_log_id			INTEGER					NOT NULL	CONSTRAINT	AdtWorkingUnitSanctionedStrength_FK_AuditLogId
																		REFERENCES	audit_logs,
	working_unit_id			working_unit_id			NOT NULL,
	honorary_sewadar_cnt	SMALLINT				NOT NULL,
	parshadi_sewadar_cnt	SMALLINT				NOT NULL,

		CONSTRAINT	AdtWorkingUnitSanctionedStrength_PK_WorkingUnitId_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(working_unit_id, audit_log_id)
)


CREATE	TABLE	adt_working_unit_p_and_t_lines
(
	audit_log_id		INTEGER				NOT NULL	CONSTRAINT	AdtWorkingUnitPAndTLines_FK_AuditLogId
																REFERENCES	audit_logs,
    working_unit_id		working_unit_id		NOT NULL,
    p_and_t_line		telephone_no		NOT NULL,
    line_sq				display_order		NOT NULL,

		CONSTRAINT	AdtWorkingUnitPAndTLines_PK_WorkingUnitId_PAndTLine_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(working_unit_id, p_and_t_line, audit_log_id)
)


CREATE	TABLE	adt_working_unit_fax_lines
(
	audit_log_id		INTEGER				NOT NULL	CONSTRAINT	AdtWorkingUnitFaxLines_FK_AuditLogId
																		REFERENCES	audit_logs,
    working_unit_id		working_unit_id		NOT NULL,
    fax_line			telephone_no		NOT NULL,
    line_sq				display_order		NOT NULL,

		CONSTRAINT	AdtWorkingUnitFaxLines_PK_WorkingUnitId_FaxLine_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(working_unit_id, fax_line, audit_log_id)
)


CREATE	TABLE	adt_working_unit_epabx_extensions
(
	audit_log_id		INTEGER				NOT NULL	CONSTRAINT	AdtWorkingUnitEpabxExtensions_FK_AuditLogId
																REFERENCES	audit_logs,
    working_unit_id		working_unit_id		NOT NULL,
    epabx_extension		extension_no		NOT NULL,
    extension_sq		display_order		NOT NULL,

		CONSTRAINT	AdtWorkingUnitEpabxExtensions_PK_WorkingUnitId_EpabxExtension_AuditLogId
				PRIMARY KEY		NONCLUSTERED	(working_unit_id, epabx_extension, audit_log_id)
)


-- ========================================================================================================

GO

-- vim:ts=4 sw=4 ht=4
