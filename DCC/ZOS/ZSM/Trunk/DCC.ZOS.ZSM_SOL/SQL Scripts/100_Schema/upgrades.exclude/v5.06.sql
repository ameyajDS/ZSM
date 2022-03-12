/* ==================================================================================
    Source File		:	upgrade.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Feb 19 18:05 IST 2011
    Version			:	1.00
    Last updated	:	Feb 19, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Script to upgrade to v5.06 (current version is v5.05)
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------

   ==================================================================================*/
USE SysAdmin
GO


UPDATE packages
	SET	version_no = 5.06,			---- build / release 16148
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO

-- =============================================================================
--	Changes dated 19-Feb-2011			-- [
-- =============================================================================
USE ZSM

-- =============================================================================
--	Remarks for Reference should be at _sq = 1
-- =============================================================================
UPDATE	sewadars_remarks
	SET	remarks_sq	=	1
WHERE	remarks_type	=	'Reference';


ALTER	TABLE	sewadars_remarks
		ADD CONSTRAINT	SewadarsRemarks_CK_SewadarID_RemarkType_RemarksSq
			CHECK	(	(	remarks_type	=	'Reference'	AND	remarks_sq	=	1	)
					OR	(	remarks_type	!=	'Reference'							)
					);
GO

-- =============================================================================
--	Changes dated 19-Feb-2011			-- ]
-- =============================================================================

-- =============================================================================
--	Changes dated 20-Feb-2011			-- [
-- =============================================================================

-- =============================================================================
--	Boolean columns in adt_sewadars_details giving error; changing to VARCHAR (3)
-- =============================================================================
SELECT	*
INTO	tmp_adt_sewadars_details
FROM	adt_sewadars_details

DROP TABLE adt_sewadars_details
GO

CREATE	TABLE	adt_sewadars_details
(
 	audit_log_id				audit_log_id		NOT NULL	CONSTRAINT	AdtSewadarsDetails_FK_AuditLogId
																	REFERENCES	audit_logs,
	sewadar_id					sewadar_id			NOT NULL,
	address_proof				address_proof			NULL,
	other_address_proof			VARCHAR (20)			NULL,
	telephone_mobile			telephone_lines			NULL,
	telephone_residence			telephone_lines			NULL,
	telephone_office			telephone_lines			NULL,
	occupation					occupation			NOT NULL,
	attends_weekly_satsang		VARCHAR (3)				NULL,
	weekly_satsang_centre_id 	satsang_centre_id		NULL,
	has_hypertension			VARCHAR (3)				NULL,
	is_diabetic					VARCHAR (3)				NULL,
	has_skin_problem			VARCHAR (3)				NULL,
	has_epillepsy				VARCHAR (3)				NULL,
	any_disability				gnc_nm					NULL,

		CONSTRAINT	AdtSewadarsDetails_PK_AuditLogId_SewadarId
			PRIMARY KEY		NONCLUSTERED	(	audit_log_id, sewadar_id	)
)
GO

INSERT INTO adt_sewadars_details
	(	audit_log_id, address_proof, other_address_proof, sewadar_id, telephone_mobile, telephone_residence, telephone_office, occupation, attends_weekly_satsang, weekly_satsang_centre_id, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy, any_disability	)
	SELECT	audit_log_id, address_proof, other_address_proof, sewadar_id, telephone_mobile, telephone_residence, telephone_office, occupation, attends_weekly_satsang, weekly_satsang_centre_id, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy, any_disability
	FROM	tmp_adt_sewadars_details

DROP table	tmp_adt_sewadars_details
GO


-- =============================================================================
--	Blue and Green components of colours were not correct in setup; these were interchanged
-- =============================================================================

UPDATE	colours
	SET	blue_component	=	green_component,
		green_component	=	blue_component;

-- =============================================================================
--	Changes dated 20-Feb-2011			-- ]
-- =============================================================================

