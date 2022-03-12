/* ==================================================================================
    Source File		:	procs_core.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Tue Dec 07 08:57 IST 2010
    Last updated	:	Jul 06, 2016
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		This is re-runnable script and thus is pre-qualified with DROP statements.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
    AJ : 06-Jul-2016
		* Added new stored procedure GetGRNoBySewadarIdSatsangCentre for ZSM photo clicking application
	 JL : 24-Sep-2013
		* Stored Procedures FillBulkTmpSewadars, ReportDiscrepanciesBulkRegister and BulkSewadarsRegister
		  have been changed to support addition of optional YOA during bulk registrations of Sewadars.
	 JL : 24-Sep-2013
		* All Stored Procedures that raise error also now return a negative value apart from raising the error.
		* All calls to stored procedures now check the return value, and if the return value is non-zero, the
		  calling stored procedure also returns with the returned value.
	 JL : 17-Sep-2013
		* Stored Procedures FillBulkTmpSewadars and BulkSewadarsRegister have been changed to support 
		  addition of optional Old G.R.No. during bulk registrations of Sewadars.
	 JL : 01-Apr-2013
	 	* Stored Procedures MakeSewaTeams, MakeCombinedSewaTeams and MakeNISewaTeams
		  have been modified to use the temporary table instead of memory table; this
		  has been done to get the IDENTITY column serial_id to start with 1 for every team.
  MS/JL : 13-Mar-2013
		* Stored Procedure QueryPhotoIdsBulkRegister added
     JL : 11-Mar-2013
		* Stored Procedures FillBulkTmpSewadars, ReportDiscrepanciesBulkRegister and
		  BulkSewadarsRegister have been added for bulk registrations of Sewadars using
		  an Excel File.
     JL : 28-Jan-2013
		* Stored Procedure MakeCombinedSewaTeams has been added.
     HP/JL : 20-Jan-2013
		* Stored Procedures MakeSewaTeams and MakeNISewaTeams have been added.
     JL : 30-Mar-2012
		* Stored Procedure SplitSewadarList has been added.
     JL : 11-Mar-2012
		* Stored Procedure DeleteGenericReportData has been changed to delete records from the two
		  newly added list report tables,viz., generic_list_report_details and generic_list_report_headers.
     JL : 08-Jan-2012
		* Stored Procedure MergeSewadarInformation has been changed to delete Remarks of source
		  Sewadar before deleting Source Sewadar.
     JL : 02-Jan-2012
		* Stored Procedure GrantExemptionForSewa has been changed to create the Timestamp entries
		  for the records that are created by System.
     JL : 14-Dec-2011
		* New Stored Procedure DeactivateOpenAndTraineesForSewa has been written.
     JL : 11-Dec-2011
		* New Stored Procedures GetTraineeSewadarRegistrationNumber, GetOpenSewadarRegistrationNumber
		  and _GetOtherSewadarRegistrationNumber have been written; the latter is an internal Stored
		  Procedure which is called by the former Stored Procedures.
		* Stored Procedures GetSewadarRegistrationNumber has been made more robust.
     JL : ??-Dec-2010
		*   Initial version
   ==================================================================================*/

-- =============================================================================
-- Procedure CreateSewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'CreateSewadarList' AND xtype = 'P')
	DROP PROCEDURE CreateSewadarList
GO

CREATE PROCEDURE CreateSewadarList
(
	@p_session_id			INTEGER,			--- Generic Report Session ID
	@p_satsang_centre_id 	satsang_centre_id,
	@p_sewadar_list_nm		gnc_long_nm,
	@p_report_nm			report_nm,
	@p_sewadar_list_id		sewadar_list_id		OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@cnt	INT;
BEGIN
	
	SELECT	@cnt	=	COUNT (*)
	FROM	generic_report_details
	WHERE	session_id	=	@p_session_id;

	IF (@cnt = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewadars in Sewadar List', NULL, NULL 
		RETURN -1;
	END

	INSERT INTO	generic_sewadar_lists
			(	satsang_centre_id, sewadar_list_nm, generated_dtm, report_nm, session_id	)
		SELECT	@p_satsang_centre_id,
				CASE @p_sewadar_list_nm WHEN @p_report_nm	THEN SUBSTRING (report_header, 1, 60)
															ELSE @p_sewadar_list_nm 
				END,
				prepare_dtm,
				@p_report_nm,
				session_id
		FROM	generic_report_headers
		WHERE	session_id	=	@p_session_id;
	SET	@p_sewadar_list_id = SCOPE_IDENTITY();

	INSERT INTO	generic_sewadar_lists_sewadars
		SELECT	@p_sewadar_list_id, satsang_centre_id, sewadar_grno
		FROM	generic_report_details
		WHERE	session_id	=	@p_session_id;
END
GO

-- =============================================================================
-- Procedure DeleteGenericReportData
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'DeleteGenericReportData' AND xtype = 'P')
	DROP PROCEDURE DeleteGenericReportData
GO

CREATE PROCEDURE DeleteGenericReportData
(
	@p_session_id			INTEGER
)
WITH ENCRYPTION
AS

BEGIN
	DELETE
	FROM	generic_report_synopsis
	WHERE	session_id	=	@p_session_id;

	DELETE
	FROM	generic_report_summaries
	WHERE	session_id	=	@p_session_id;

	DELETE
	FROM	generic_list_report_details
	WHERE	session_id	=	@p_session_id;

	DELETE
	FROM	generic_list_report_headers
	WHERE	session_id	=	@p_session_id;

	DELETE
	FROM	generic_report_details
	WHERE	session_id	=	@p_session_id;

	DELETE
	FROM	generic_report_headers
	WHERE	session_id	=	@p_session_id;
END
GO

-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'DeleteAllGenericReportsData' AND xtype = 'P')
	DROP PROCEDURE DeleteAllGenericReportsData
GO

-- =============================================================================
-- Procedure Delete100DayOldGenericReportsData
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'Delete100DayOldGenericReportsData' AND xtype = 'P')
	DROP PROCEDURE Delete100DayOldGenericReportsData
GO

CREATE PROCEDURE Delete100DayOldGenericReportsData
AS

BEGIN
	DECLARE	@tbl	TABLE	(	id	INT	);

	INSERT INTO @tbl
		SELECT	session_id
		FROM	generic_report_headers
		WHERE	DATEADD (d, 100, prepare_dtm)	<	GetDate();

	DELETE	r
	FROM	generic_report_synopsis	r
		JOIN	@tbl	t
			ON	(	r.session_id	=	t.id	);

	DELETE	r
	FROM	generic_report_summaries	r
		JOIN	@tbl	t
			ON	(	r.session_id	=	t.id	);

	DELETE	r
	FROM	generic_report_details	r
		JOIN	@tbl	t
			ON	(	r.session_id	=	t.id	);

	DELETE	r
	FROM	generic_list_report_details	r
		JOIN	@tbl	t
			ON	(	r.session_id	=	t.id	);

	DELETE	r
	FROM	generic_list_report_headers	r
		JOIN	@tbl	t
			ON	(	r.session_id	=	t.id	);

	DELETE	r
	FROM	generic_report_headers	r
		JOIN	@tbl	t
			ON	(	r.session_id	=	t.id	);
END
GO

-- =============================================================================
-- Procedure GetSewadarRegistrationNumber
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSewadarRegistrationNumber' AND xtype = 'P')
	DROP PROCEDURE GetSewadarRegistrationNumber
GO

CREATE PROCEDURE GetSewadarRegistrationNumber
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_gender					Gender,
	@p_is_outstation_sewadar	Boolean,
	@p_sewadar_grno				sewadar_grno		OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@sequence_id	sequence_id,
		@last_no		INTEGER;
BEGIN
	IF (@p_is_outstation_sewadar = 'No')
		IF (@p_gender = 'Male')
			SET	@sequence_id	= 'G'
		ELSE
			SET	@sequence_id	= 'L'
	ELSE
		SET	@sequence_id	= SUBSTRING (@p_gender, 1, 1);
	
	UPDATE	sequence_controlling_information
		SET	last_no	=	last_no + 1
	WHERE	satsang_centre_id	=	@p_satsang_centre_id
	AND		sequence_id			=	@sequence_id;
	IF (@@ROWCOUNT = 0)
		INSERT	INTO	sequence_controlling_information
				(	satsang_centre_id, sequence_id, last_no	)
			VALUES
				(	@p_satsang_centre_id, @sequence_id, 1	);

	SELECT	@last_no	=	last_no
	FROM	sequence_controlling_information
	WHERE	satsang_centre_id	=	@p_satsang_centre_id
	AND		sequence_id			=	@sequence_id;

	IF	(@last_no > 100000)
	BEGIN
		SET @p_sewadar_grno = 'ENDSEQ';
		RETURN -1;
	END;

	SET	@p_sewadar_grno	=	@sequence_id + SUBSTRING (CONVERT (VARCHAR (6), @last_no + 100000), 2, 5);
END
GO

-- =============================================================================
-- Procedure GetGuideRegistrationNumber
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetGuideRegistrationNumber' AND xtype = 'P')
	DROP PROCEDURE GetGuideRegistrationNumber
GO

CREATE PROCEDURE GetGuideRegistrationNumber
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_gender					Gender,
	@p_sewadar_grno				sewadar_grno		OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@sequence_id	sequence_id,
		@last_no		INTEGER;
BEGIN
	IF (@p_gender = 'Male')
		SET	@sequence_id	= 'GB'
	ELSE
		SET	@sequence_id	= 'GG'
	
	UPDATE	sequence_controlling_information
		SET	last_no	=	last_no + 1
	WHERE	satsang_centre_id	=	@p_satsang_centre_id
	AND		sequence_id			=	@sequence_id;
	IF (@@ROWCOUNT = 0)
		INSERT	INTO	sequence_controlling_information
				(	satsang_centre_id, sequence_id, last_no	)
			VALUES
				(	@p_satsang_centre_id, @sequence_id, 1	);

	SELECT	@last_no	=	last_no
	FROM	sequence_controlling_information
	WHERE	satsang_centre_id	=	@p_satsang_centre_id
	AND		sequence_id			=	@sequence_id;

	IF	(@last_no > 100000)
	BEGIN
		SET @p_sewadar_grno = 'ENDSEQ';
		RETURN -1;
	END;

	SET	@p_sewadar_grno	=	@sequence_id + SUBSTRING (CONVERT (VARCHAR (6), @last_no + 10000), 2, 5);
END
GO

-- =============================================================================
-- Procedure _GetOtherSewadarRegistrationNumber
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = '_GetOtherSewadarRegistrationNumber' AND xtype = 'P')
	DROP PROCEDURE _GetOtherSewadarRegistrationNumber
GO

CREATE PROCEDURE _GetOtherSewadarRegistrationNumber
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_sewa_id				sewa_id,
	@p_sequence_id			sequence_id,
	@p_sewadar_grno			sewadar_grno		OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@last_no	INTEGER,
		@len		INTEGER;
BEGIN
	UPDATE	sequence_controlling_information
		SET	last_no	=	last_no + 1
	WHERE	satsang_centre_id	=	@p_satsang_centre_id
	AND		sequence_id			=	@p_sequence_id;
	IF (@@ROWCOUNT = 0)
		INSERT	INTO	sequence_controlling_information
				(	satsang_centre_id, sequence_id, sewa_id, last_no	)
			VALUES
				(	@p_satsang_centre_id, @p_sequence_id, @p_sewa_id, 1);

	SELECT	@last_no	=	last_no
	FROM	sequence_controlling_information
	WHERE	satsang_centre_id	=	@p_satsang_centre_id
	AND		sequence_id			=	@p_sequence_id;

	SET @len = LEN (@p_sequence_id);

	IF	(	(@last_no >= 1000 AND @len = 3)
		OR	(@last_no >= 10000 AND @len = 2)
		OR	(@last_no >= 100000 AND @len = 1)
		)
	BEGIN
		SET @p_sewadar_grno = 'ENDSEQ';
		RETURN -1;
	END;

	SET	@p_sewadar_grno	=	@p_sequence_id + SUBSTRING (CONVERT (VARCHAR (6), @last_no + 100000), @len + 1, 6 - @len);
END
GO

-- =============================================================================
-- Procedure GetTraineeSewadarRegistrationNumber
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetTraineeSewadarRegistrationNumber' AND xtype = 'P')
	DROP PROCEDURE GetTraineeSewadarRegistrationNumber
GO

CREATE PROCEDURE GetTraineeSewadarRegistrationNumber
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_sewa_id					sewa_id,
	@p_sewadar_grno				sewadar_grno		OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@rval			INT,
		@sequence_id	sequence_id;
BEGIN
	SELECT	@sequence_id	=	trainee_current_seq_id
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id;

	IF (@@ROWCOUNT = 0 OR @sequence_id IS NULL)
	BEGIN
		SET @p_sewadar_grno = 'NO_SEQ';
		RETURN -2;
	END

	EXEC	@rval = _GetOtherSewadarRegistrationNumber	@p_satsang_centre_id, @p_sewa_id, @sequence_id, @p_sewadar_grno OUTPUT;
	IF (@rval != 0)
		RETURN @rval;
END
GO

-- =============================================================================
-- Procedure GetOpenSewadarRegistrationNumber
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetOpenSewadarRegistrationNumber' AND xtype = 'P')
	DROP PROCEDURE GetOpenSewadarRegistrationNumber
GO

CREATE PROCEDURE GetOpenSewadarRegistrationNumber
(
	@p_satsang_centre_id 		satsang_centre_id,
	@p_sewa_id					sewa_id,
	@p_sewadar_grno				sewadar_grno		OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@rval			INT,
		@sequence_id	sequence_id;
BEGIN
	SELECT	@sequence_id	=	open_sewadar_current_seq_id
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id;

	IF (@@ROWCOUNT = 0 OR @sequence_id IS NULL)
	BEGIN
		SET @p_sewadar_grno = 'NO_SEQ';
		RETURN
	END

	EXEC	@rval = _GetOtherSewadarRegistrationNumber	@p_satsang_centre_id, @p_sewa_id, @sequence_id, @p_sewadar_grno OUTPUT;
	IF (@rval != 0)
		RETURN @rval;
END
GO

-- =============================================================================
-- Procedure MergeSewadarInformation
--		(a) merges the sewadars_registrations of the Source Sewadar ID into Destination Sewadar ID
--		(b) merges the remarks of the Source Sewadar ID into Destination Sewadar ID
--		(c) deletes the information of Source Sewadar ID
--  IMPORTANT. Before calling this procedure, the action should be audited wherein the source
--		Sewadar ID's information should be saved (specifically information in tables sewadars,
--		sewasdars_photos, sewadars_details, sewadars_addresses, sewadars_qualifications, and
--		sewadars_skills) apart from noting in the audit_log entry source and destination Sewadar IDs.
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MergeSewadarInformation' AND xtype = 'P')
	DROP PROCEDURE MergeSewadarInformation
GO

CREATE PROCEDURE MergeSewadarInformation
(
	@p_src_sewadar_id 		sewadar_id,
	@p_dst_sewadar_id 		sewadar_id
)
WITH ENCRYPTION
AS
	DECLARE
		@cntsrc	INT,
		@cntdst	INT;
BEGIN
	SELECT	@cntsrc	=	COUNT (*)
	FROM	sewadars_registrations	r
		JOIN	system_information_values	v
			ON	(	v.value_varchar	=	r.sewadar_status_cd
				AND	v.system_info_cd	=	'SttsActv'
				AND	r.sewadar_id		=	@p_src_sewadar_id
				);

	SELECT	@cntdst	=	COUNT (*)
	FROM	sewadars_registrations	r
		JOIN	system_information_values	v
			ON	(	v.value_varchar	=	r.sewadar_status_cd
				AND	v.system_info_cd	=	'SttsActv'
				AND	r.sewadar_id		=	@p_dst_sewadar_id
				);

	IF (@cntsrc > 0 AND @cntdst > 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Merging of Sewadars', 'both records have Active Status', NULL 
		RETURN -1;
	END

	IF (@cntsrc > 0 AND @cntdst = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Merging of Sewadars', 'Destination record should have Active Status', NULL 
		RETURN -2;
	END

	UPDATE	sewadars_registrations
		SET	reference_1_sewadar_id	=	@p_dst_sewadar_id
	WHERE	reference_1_sewadar_id	=	@p_src_sewadar_id;

	UPDATE	sewadars_registrations
		SET	reference_2_sewadar_id	=	@p_dst_sewadar_id
	WHERE	reference_2_sewadar_id	=	@p_src_sewadar_id;

	UPDATE	sewadars_registrations
		SET	sponsorer_id	=	@p_dst_sewadar_id
	WHERE	sponsorer_id	=	@p_src_sewadar_id;

	UPDATE	sewadars_registrations
		SET	security_approver_id	=	@p_dst_sewadar_id
	WHERE	security_approver_id	=	@p_src_sewadar_id;

	UPDATE	sewadars_registrations
		SET	sewa_samiti_approver_id	=	@p_dst_sewadar_id
	WHERE	sewa_samiti_approver_id	=	@p_src_sewadar_id;

	UPDATE	sewadars_registrations
		SET	sewadar_id	=	@p_dst_sewadar_id
	WHERE	sewadar_id	=	@p_src_sewadar_id;

	DECLARE	@tbl	TABLE	(	remarks_type	VARCHAR (15),	max_sq	INT	);
	INSERT	INTO	@tbl
		SELECT	remarks_type, MAX (remarks_sq)
		FROM	sewadars_remarks	s
		WHERE	sewadar_id	=	@p_dst_sewadar_id
		GROUP BY	remarks_type;
		
	INSERT INTO	sewadars_remarks
			(	sewadar_id, remarks_type, remarks_sq, remarks	)
		SELECT	@p_dst_sewadar_id, s.remarks_type, COALESCE (max_sq, 0) + s.remarks_sq, s.remarks
		FROM	sewadars_remarks	s
			LEFT JOIN	@tbl	d
				ON	(	d.remarks_type	=	s.remarks_type	)
		WHERE	sewadar_id	=	@p_src_sewadar_id;
	SET @cntdst = @@ROWCOUNT;

	DELETE
	FROM	sewadars_remarks
	WHERE	sewadar_id	=	@p_src_sewadar_id;
	SET @cntsrc = @@ROWCOUNT;

	IF (@cntsrc != @cntdst)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Merging of Sewadars', 'Count of Remarks migrated differs from the count Deleted', NULL 
		RETURN -3;
	END

	DELETE
	FROM	sewadars_skills
	WHERE	sewadar_id	=	@p_src_sewadar_id;

	DELETE
	FROM	sewadars_qualifications
	WHERE	sewadar_id	=	@p_src_sewadar_id;

	DELETE
	FROM	sewadars_addresses
	WHERE	sewadar_id	=	@p_src_sewadar_id;

	DELETE
	FROM	sewadars_details
	WHERE	sewadar_id	=	@p_src_sewadar_id;

	DELETE
	FROM	ZSM_Photos..sewadars_photos
	WHERE	sewadar_id	=	@p_src_sewadar_id;

	DELETE
	FROM	sewadars
	WHERE	sewadar_id	=	@p_src_sewadar_id;
END
GO

-- =============================================================================
-- Procedure AuditBadgeReport
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'AuditBadgeReport' AND xtype = 'P')
	DROP PROCEDURE AuditBadgeReport
GO

CREATE PROCEDURE AuditBadgeReport
(
	@p_session_id			INTEGER,			--- Generic Report Session ID
	@p_report_nm			gnc_nm
)
WITH ENCRYPTION
AS
	DECLARE
		@cnt	INT;
BEGIN
	
	SELECT	@cnt	=	COUNT (*)
	FROM	generic_report_details
	WHERE	session_id	=	@p_session_id;

	IF (@cnt = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Data for Auditing Badge Report', NULL, NULL 
		RETURN -1;
	END;

	INSERT INTO	sewadars_badges
			(	satsang_centre_id, sewadar_grno, badge_template_id, department_id, expiry_dt, printing_dtm, remarks	)
		SELECT	g.satsang_centre_id, g.sewadar_grno, CASE @p_report_nm WHEN 'Mobile Phone Report' THEN 'MobileCard' END, department_id, DATEADD (D, 15, CONVERT (VARCHAR, GetDate(), 106)), GetDate(), 'Mobile Card Report'
		FROM	generic_report_details	g
			JOIN	sewadars_registrations	s
				ON	(	s.satsang_centre_id	=	g.satsang_centre_id
					AND	s.sewadar_grno		=	g.sewadar_grno
					AND	g.session_id		=	@p_session_id
					)
			JOIN	sewadars	w
				ON	(	w.sewadar_id	=	s.sewadar_id
					AND	w.global_sewadar_status_cd	IS NULL
					)
			JOIN	system_information_values	v
				ON	(	v.system_info_cd	=	'SttsGenUse'
					AND	v.value_varchar		=	s.sewadar_status_cd
					);
END
GO


-- =============================================================================
-- Procedure MakeSewaTeamUsingSewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MakeSewaTeamUsingSewadarList' AND xtype = 'P')
	DROP PROCEDURE MakeSewaTeamUsingSewadarList
GO

CREATE PROCEDURE MakeSewaTeamUsingSewadarList
(
	@p_sewadar_list_id		sewadar_list_id,
	@p_sewa_id				sewa_id,
	@p_sewa_team_id			sewa_team_id	OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@cnt	INT;

BEGIN
	DECLARE	@tbl	TABLE	(	id		INT			NOT NULL	IDENTITY (1, 1),
								cntr	INT			NOT NULL,
								grno	CHAR (6)	NOT NULL
							);
	INSERT INTO	@tbl
			(	cntr, grno	)
		SELECT	g.satsang_centre_id, g.sewadar_grno
		FROM	generic_sewadar_lists_sewadars	g
			JOIN	sewadars_registrations	r
				ON	(	r.satsang_centre_id	=	g.satsang_centre_id
					AND	r.sewadar_grno		=	g.sewadar_grno
					AND	g.sewadar_list_id	=	@p_sewadar_list_id
					)
			JOIN	sewadars	w
				ON	(	w.sewadar_id	=	r.sewadar_id
					AND	w.global_sewadar_status_cd	IS NULL
					)
			JOIN	system_information_values	v
				ON	(	v.system_info_cd	=	'SttsGenUse'
					AND	v.value_varchar		=	r.sewadar_status_cd
					)
		ORDER BY w.first_nm, SUBSTRING (w.middle_nm, 1, 1), w.last_nm;

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewadar List for Sewa Team', NULL, NULL 
		RETURN -1;
	END

	INSERT INTO	sewa_teams
			(	sewa_id, sewa_team_nm	)
		SELECT	@p_sewa_id, sewadar_list_nm
		FROM	generic_sewadar_lists
		WHERE	sewadar_list_id	=	@p_sewadar_list_id;
	SET	@p_sewa_team_id = SCOPE_IDENTITY();

	INSERT INTO	sewa_team_wise_sewadars
			(	sewa_team_id, serial_id, satsang_centre_id, sewadar_grno	)
		SELECT	@p_sewa_team_id, id, cntr, grno
		FROM	@tbl;

	DELETE
	FROM	generic_sewadar_lists_sewadars
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DELETE
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;
END
GO

-- =============================================================================
-- Procedure GrantExemptionForSewa
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GrantExemptionForSewa' AND xtype = 'P')
	DROP PROCEDURE GrantExemptionForSewa
GO

CREATE PROCEDURE GrantExemptionForSewa
(
	@p_sewadar_list_id		sewadar_list_id,
	@p_sewa_id				sewa_id,
	@p_sewa_exemption_id	sewa_exemption_id
)
WITH ENCRYPTION
AS
	DECLARE
		@days	CreditCntF;

BEGIN
	SELECT	@days	=	exemption_days
	FROM	sewa_exemptions_applicable_sewas
	WHERE	sewa_exemption_id	=	@p_sewa_exemption_id
	AND		sewa_id				=	@p_sewa_id;
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Number of days to exempt for the Exemption of the Sewa', NULL, NULL 
		RETURN -1;
	END

	DELETE	tbl
	FROM	arbitrary_summarised_exemptions	tbl
		JOIN	generic_sewadar_lists_sewadars	lst
			ON	(	lst.sewadar_list_id	=	@p_sewadar_list_id
				AND	tbl.sewa_id			=	@p_sewa_id
				AND	tbl.satsang_centre_id	=	lst.satsang_centre_id
				AND	tbl.sewadar_grno		=	lst.sewadar_grno
				AND	tbl.exemption_days		<	@days
				);

	INSERT INTO sewadars_txn_ts
			(	satsang_centre_id, sewadar_grno, sewa_id, screen_id	)
		SELECT	satsang_centre_id, sewadar_grno, @p_sewa_id, 'ATT_03'
		FROM	generic_sewadar_lists_sewadars	lst
		WHERE	lst.sewadar_list_id	=	@p_sewadar_list_id
		AND	NOT EXISTS	(	SELECT	1
							FROM	arbitrary_summarised_exemptions	tbl
							WHERE	tbl.sewa_id			=	@p_sewa_id
							AND		tbl.satsang_centre_id	=	lst.satsang_centre_id
							AND		tbl.sewadar_grno		=	lst.sewadar_grno
						)
		AND	NOT EXISTS	(	SELECT	1
							FROM	sewadars_txn_ts stt
							WHERE	stt.satsang_centre_id = lst.satsang_centre_id
							AND		stt.sewadar_grno = lst.sewadar_grno
							AND		stt.sewa_id		=	@p_sewa_id
							AND		stt.screen_id = 'ATT_03'
						);

	INSERT INTO	arbitrary_summarised_exemptions
		SELECT	@p_sewa_id, satsang_centre_id, sewadar_grno, @p_sewa_exemption_id, @days
		FROM	generic_sewadar_lists_sewadars	lst
		WHERE	lst.sewadar_list_id	=	@p_sewadar_list_id
		AND	NOT EXISTS	(	SELECT	1
							FROM	arbitrary_summarised_exemptions	tbl
							WHERE	tbl.sewa_id			=	@p_sewa_id
							AND		tbl.satsang_centre_id	=	lst.satsang_centre_id
							AND		tbl.sewadar_grno		=	lst.sewadar_grno
						);

/*
	DELETE
	FROM	generic_sewadar_lists_sewadars
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DELETE
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;
	*/
END
GO

-- =============================================================================
-- Procedure AssignAttributeUsingSewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'AssignAttributeUsingSewadarList' AND xtype = 'P')
	DROP PROCEDURE AssignAttributeUsingSewadarList
GO

CREATE PROCEDURE AssignAttributeUsingSewadarList
(
	@p_sewadar_list_id	sewadar_list_id,
	@p_attribute_id		attribute_id,
	@p_boolean_value	Boolean,
	@p_date_value		SMALLDATETIME,
	@p_int_value		INTEGER,
	@p_number_value		NUMERIC (20, 8),
	@p_list_value		attribute_value,
	@p_string_value		VARCHAR (255),
	@p_remarks			remarks,
	@p_effective_from	DATETIME,
	@p_effective_till	DATETIME

)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO	sewadars_attributes
		SELECT	satsang_centre_id, sewadar_grno, @p_attribute_id,
				@p_boolean_value, @p_date_value, @p_int_value, @p_number_value, @p_list_value, @p_string_value,
				@p_remarks, @p_effective_from, @p_effective_till
		FROM	generic_sewadar_lists_sewadars
		WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DELETE
	FROM	generic_sewadar_lists_sewadars
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DELETE
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;
END
GO

-- =============================================================================
-- Procedure RemoveAttributeUsingSewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'RemoveAttributeUsingSewadarList' AND xtype = 'P')
	DROP PROCEDURE RemoveAttributeUsingSewadarList
GO

CREATE PROCEDURE RemoveAttributeUsingSewadarList
(
	@p_sewadar_list_id	sewadar_list_id,
	@p_attribute_id		attribute_id
)
WITH ENCRYPTION
AS
BEGIN
	DELETE	attr
	FROM	sewadars_attributes	attr
		JOIN	generic_sewadar_lists_sewadars	lst
			ON	(	lst.sewadar_list_id		=	@p_sewadar_list_id
				AND	lst.satsang_centre_id	=	attr.satsang_centre_id
				AND	lst.sewadar_grno		=	attr.sewadar_grno
				AND	attr.attribute_id		=	@p_attribute_id
				);

	DELETE
	FROM	generic_sewadar_lists_sewadars
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	DELETE
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;
END
GO

-- =============================================================================
-- Procedure TransferSewadarToSatsangCentre
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'TransferSewadarToSatsangCentre' AND xtype = 'P')
	DROP PROCEDURE TransferSewadarToSatsangCentre
GO

CREATE PROCEDURE TransferSewadarToSatsangCentre
(
	@p_current_satsang_centre_id 	satsang_centre_id,
	@p_current_sewadar_grno			sewadar_grno,
	@p_new_satsang_centre_id	 	satsang_centre_id,
	@p_effective_dt					SMALLDATETIME,
	@p_department_id				department_id,
	@p_sub_department_id			department_id,
	@p_is_outstation_sewadar		Boolean,
--	@p_sponsorer_id 				sewadar_id,
--	@p_area_secretary_id 			centre_functionary_id,
--	@p_secretary_id 				centre_functionary_id,
	@p_remarks						remarks,
	@p_new_sewadar_grno				sewadar_grno		OUTPUT
)
WITH ENCRYPTION
AS
	DECLARE
		@sewadar_id			INT,
		@rval				INT,
		@gender				Gender,
		@status_cd			VARCHAR (10),
		@old_centre_nm		gnc_nm,
		@new_centre_nm		gnc_nm,
		@sq					INT,
		@remarks			remarks;
BEGIN
	SELECT	@sewadar_id				=	swd.sewadar_id,
			@gender					=	swd.gender,
			@status_cd				=	rgs.sewadar_status_cd
	FROM	sewadars	swd
		JOIN	sewadars_registrations	rgs
			ON	(	rgs.satsang_centre_id		=	@p_current_satsang_centre_id
				AND	rgs.sewadar_grno			=	@p_current_sewadar_grno
				AND	swd.sewadar_id				=	rgs.sewadar_id
				AND	rgs.sewadar_status_cd		IN	(	'Temp', 'Perm', 'NI', 'Retd'	)
				)
	AND		global_sewadar_status_cd	IS NULL;

	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Transfer of Sewadar to other Centre', 'Global Status is set or Sewadar'' GR No is not Perm or Temp', NULL 
		RETURN -1;
	END

	SELECT	@old_centre_nm	=	centre_nm
	FROM	satsang_centres_details
	WHERE	satsang_centre_id	=	@p_current_satsang_centre_id
	AND		is_main_centre	=	'Yes'
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Current Satsang Centre', NULL, NULL
		RETURN -2;
	END

	SELECT	@new_centre_nm	=	centre_nm
	FROM	satsang_centres_details
	WHERE	satsang_centre_id	=	@p_new_satsang_centre_id
	AND		is_main_centre	=	'Yes'
	IF (@@ROWCOUNT = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'New Satsang Centre', NULL, NULL
		RETURN -3;
	END


	EXEC	@rval = GetSewadarRegistrationNumber @p_new_satsang_centre_id, @gender, @p_is_outstation_sewadar, @p_new_sewadar_grno			OUTPUT;
	IF (@rval != 0)
		RETURN @rval;

	UPDATE	sewadars_registrations
		SET	sewadar_status_cd	=	sys.value_varchar,
			sewadar_status_dtm	=	@p_effective_dt,
			responsibility		=	NULL,
			responsibility_dtm	=	NULL
	FROM	sewadars_registrations	rgs
		JOIN	system_information_values	sys
			ON	(	sys.system_info_cd		=	'SttsCntrXfrOut'
				AND	rgs.satsang_centre_id	=	@p_current_satsang_centre_id
				AND	rgs.sewadar_grno		=	@p_current_sewadar_grno
				);

	INSERT INTO	sewadars_registrations
			(	satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar,
				department_id, sub_department_id, department_dt, sewadar_status_cd, sewadar_status_dtm,
				reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department,
				reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department,
				sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id
			)
		SELECT	@p_new_satsang_centre_id, @p_new_sewadar_grno, sewadar_id, @p_effective_dt, @p_is_outstation_sewadar,
					--- Note that we use the Current Department and Sub-Department when department_id is not provided.
					--- If department_id is provided, then the provided sub_department_id is used.
				COALESCE (@p_department_id, department_id), COALESCE (@p_department_id, sub_department_id),
				@p_effective_dt, @status_cd, @p_effective_dt,
				reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department,
				reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department,
				sponsorer_id, area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id
		FROM	sewadars_registrations
		WHERE	satsang_centre_id	=	@p_current_satsang_centre_id
		AND		sewadar_grno		=	@p_current_sewadar_grno;


	UPDATE	sewadars
		SET	current_satsang_centre_id	=	@p_new_satsang_centre_id,
			current_sewadar_grno		=	@p_new_sewadar_grno
	WHERE	sewadar_id	=	@sewadar_id;

	INSERT INTO	sewadars_satsang_centre_transfers
			(	old_satsang_centre_id, old_sewadar_grno, satsang_centre_id, sewadar_grno, effective_dt, remarks	)
		VALUES
			(	@p_current_satsang_centre_id, @p_current_sewadar_grno, @p_new_satsang_centre_id, @p_new_sewadar_grno, @p_effective_dt, @p_remarks	);
	
	SELECT	@sq	=	MAX (remarks_sq) + 1
	FROM	sewadars_remarks
	WHERE	sewadar_id	=	@sewadar_id;
	IF (@sq IS NULL)
		SET @sq = 1;
	SET @remarks = 'Transferred from ' + @old_centre_nm + ' (' + @p_current_sewadar_grno + ')'
	INSERT INTO	sewadars_remarks
			(	sewadar_id, remarks_type, remarks_sq, remarks	)
		VALUES
			(	@sewadar_id, 'Remarks', @sq, @remarks	)
END
GO


-- =============================================================================
-- Procedure DeactivateOpenAndTraineesForSewa
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'DeactivateOpenAndTraineesForSewa' AND xtype = 'P')
	DROP PROCEDURE DeactivateOpenAndTraineesForSewa
GO

CREATE PROCEDURE DeactivateOpenAndTraineesForSewa
(
	@p_sewa_id				sewa_id
)
AS
	DECLARE
		@satsang_centre_id		satsang_centre_id,
		@trainee_seq_id 		sequence_id,
		@status_dtm				DATETIME,
		@open_sewadar_seq_id	sequence_id;

BEGIN
	SELECT	@trainee_seq_id 		=	trainee_current_seq_id,
			@open_sewadar_seq_id	=	open_sewadar_current_seq_id,
			@satsang_centre_id		=	satsang_centre_id
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id;

	IF (@@ROWCOUNT = 0)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa', NULL, NULL
			RETURN -1;
		END

	IF (@trainee_seq_id IS NULL AND	@open_sewadar_seq_id IS NULL)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'OperationNotAllowed', NULL, 'Deactivation of Trainee and / or Open Sewadars', 'there are no sequence prefix(es)', NULL
			RETURN -2;
		END
	
	SET @status_dtm = GetDate ();

	UPDATE	sewadars_registrations
		SET	sewadar_status_cd	=	'InAc',
			sewadar_status_dtm	=	@status_dtm
	WHERE	satsang_centre_id	=	@satsang_centre_id
	AND		sewa_id				=	@p_sewa_id
	AND		sewadar_status_cd	IN	(	'Trn', 'Open');

	UPDATE	sewas
		SET	trainee_current_seq_id		=	NULL,
			open_sewadar_current_seq_id	=	NULL
	WHERE	sewa_id		=	@p_sewa_id;
END
GO

-- =============================================================================
-- Procedure SplitSewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SplitSewadarList' AND xtype = 'P')
	DROP PROCEDURE SplitSewadarList
GO

CREATE PROCEDURE SplitSewadarList
(
	@p_sewadar_list_id		sewadar_list_id,
	@p_sewadars_cnt			INTEGER
)
WITH ENCRYPTION
AS
	DECLARE
		@sewadar_list_id				sewadar_list_id,
		@satsang_centre_id 				satsang_centre_id,
		@sewadar_list_nm				gnc_long_nm,
		@sewadar_list_use				sewadar_list_use,
		@sewadar_list_other_use			sewadar_list_use,
		@other_satsang_centre_sewadars	Boolean,
		@is_other_satsang_centre		Boolean,
		@is_editing_allowed				Boolean,
		@generated_dtm					SMALLDATETIME,
		@last_satsang_centre_id 		satsang_centre_id,
		@last_sewadar_grno 				sewadar_grno,
		@cnt							INT,
		@str							VARCHAR (100),
		@itr							INT,
		@stmt							VARCHAR (2000);
BEGIN
	
	SELECT	@cnt	=	COUNT (*)
	FROM	generic_sewadar_lists_sewadars
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	IF (@cnt = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewadar List', NULL, NULL 
		RETURN -1;
	END

	IF (@p_sewadars_cnt IS NULL OR @p_sewadars_cnt <= 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'ValueReqd', NULL, 'Number of Sewadars in each List', NULL, NULL 
		RETURN -2;
	END

	IF (@p_sewadars_cnt >= @cnt)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'GreaterValueReqd', NULL, 'Number of Sewadars in each List', 'Sewadars in Source List', NULL 
		RETURN -3;
	END

	SELECT	@satsang_centre_id = satsang_centre_id, @sewadar_list_nm = sewadar_list_nm,
			@sewadar_list_use = sewadar_list_use, @sewadar_list_other_use = sewadar_list_other_use,
			@other_satsang_centre_sewadars = other_satsang_centre_sewadars, @is_other_satsang_centre = is_other_satsang_centre, @is_editing_allowed = is_editing_allowed
	FROM	generic_sewadar_lists
	WHERE	sewadar_list_id	=	@p_sewadar_list_id;

	SET @itr = 1;
	SET	@last_satsang_centre_id = -1;
	SET	@last_sewadar_grno = '';

	WHILE (@cnt > 0)
	BEGIN
		SET @str = ':' + CONVERT (VARCHAR, @itr)
		SET @str = SUBSTRING (@sewadar_list_nm, 1, 60 - LEN(@str)) + @str;

		INSERT INTO	generic_sewadar_lists
				(	satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars,
					is_other_satsang_centre, is_editing_allowed
				)
			VALUES
				(	@satsang_centre_id, @str, @sewadar_list_use, @sewadar_list_other_use, @other_satsang_centre_sewadars,
					@is_other_satsang_centre, @is_editing_allowed
				)

		SET	@sewadar_list_id = SCOPE_IDENTITY();

		SET @stmt	=	'	INSERT INTO	generic_sewadar_lists_sewadars '
						+ '		SELECT	TOP ' + CONVERT (VARCHAR, @p_sewadars_cnt) + ' ' + CONVERT (VARCHAR, @sewadar_list_id) + ', satsang_centre_id, sewadar_grno'
						+ '		FROM	generic_sewadar_lists_sewadars '
						+ '		WHERE	sewadar_list_id	= ' + CONVERT (VARCHAR, @p_sewadar_list_id)
						+ '		AND		(	(	satsang_centre_id	>	' + CONVERT (VARCHAR, @last_satsang_centre_id) + ')'
						+ '				OR	(	satsang_centre_id	=	' + CONVERT (VARCHAR, @last_satsang_centre_id)
						+ '					AND	sewadar_grno		>	''' + @last_sewadar_grno + ''''
						+ '					)'
						+ '				)'
						+ '		ORDER BY satsang_centre_id, sewadar_grno;'
		EXEC (@stmt);

		SELECT	@last_satsang_centre_id	=	MAX (satsang_centre_id),
				@last_sewadar_grno		=	MAX (sewadar_grno),
				@p_sewadars_cnt			=	COUNT (*)
		FROM	generic_sewadar_lists_sewadars
		WHERE	sewadar_list_id	=	@sewadar_list_id;

		SET @cnt = @cnt - @p_sewadars_cnt;
		SET @itr = @itr + 1;
	END
END
GO


-- =============================================================================
-- Procedure MakeCombinedSewaTeams
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MakeCombinedSewaTeams' AND xtype = 'P')
	DROP PROCEDURE MakeCombinedSewaTeams
GO

CREATE PROCEDURE MakeCombinedSewaTeams
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_sewa_id				sewa_id,
	@p_sewadar_list_id		sewadar_list_id,
	@p_department_ids		report_xml_prm
)

WITH ENCRYPTION
AS
DECLARE	
	@cnt					INT,
	@sewa_id				sewa_id,
	@sewa_team_id			sewa_team_id,
	@department_id			INT,
	@department_nm			VARCHAR (50),
	@sub_department_id		INT,
	@sub_department_nm		VARCHAR (50),
	@gender					CHAR (1),
	@hdoc					INT;
DECLARE	@depts		TABLE	(	id	INT	);
DECLARE		
	@tmp_all_sewadars	TABLE	(
		sewadar_id					INT				NOT NULL	PRIMARY KEY	NONCLUSTERED,
		sewadar_nm 					VARCHAR (200)	NOT NULL,
		satsang_centre_id			INT				NOT NULL,
		sewadar_grno				CHAR (6)		NOT NULL,
		department_id				INT				NOT NULL,
		sub_department_id			INT					NULL,
		gender 						CHAR (1)		NOT NULL,
			UNIQUE NONCLUSTERED (sewadar_grno, satsang_centre_id) 
	);

DECLARE	
	@tmp_teams	TABLE	(
		department_id			INT			NOT NULL,
		sub_department_id		INT				NULL,
		gender 					CHAR (1)	NOT NULL
	);
BEGIN
	SELECT	@cnt	=	COUNT (*)
	FROM	satsang_centres_details
	WHERE	satsang_centre_id 	=	@p_satsang_centre_id ;
	IF (@cnt = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Satsang Centre', NULL, NULL 
		RETURN -1;
	END

	SELECT	@cnt	=	COUNT (*)
	FROM	sewas
	WHERE	sewa_id	=	@p_sewa_id	;
	IF (@cnt = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa', NULL, NULL 
		RETURN -2;
	END
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@p_satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END

	INSERT INTO	@tmp_all_sewadars
		SELECT	s.sewadar_id, RTRIM (LTRIM (first_nm)) + COALESCE (' ' + SUBSTRING (middle_nm, 1, 1) + '.', '') + RTRIM (LTRIM (last_nm)),
				r.satsang_centre_id, r.sewadar_grno, department_id, sub_department_id, CASE gender WHEN 'Male' THEN 'G' WHEN 'Female' THEN 'L' END
		FROM	sewadars	s
			JOIN	sewadars_registrations	r
				ON	(	s.sewadar_id	=	r.sewadar_id
					AND	s.global_sewadar_status_cd	IS	NULL
					)
			JOIN    system_information_values i
	            ON  (	r.sewadar_status_cd			=	i.value_varchar 
				    AND i.system_info_cd            =	'SttsAttnd'
				    ) 
		     JOIN @depts d 
				ON (	d.id	=	r.department_id )
			 LEFT JOIN	generic_sewadar_lists	x
				ON	(	x.satsang_centre_id		=	@p_satsang_centre_id
					AND	x.sewadar_list_id		=	@p_sewadar_list_id
					)
			 LEFT JOIN	generic_sewadar_lists_sewadars	z
				ON	(	r.satsang_centre_id		=	z.satsang_centre_id
					AND	r.sewadar_grno			=	z.sewadar_grno
					AND	z.sewadar_list_id		=	x.sewadar_list_id
					)
		WHERE	(	(	@p_sewadar_list_id	IS NOT NULL	AND	x.satsang_centre_id	IS NOT NULL	
														AND	z.satsang_centre_id	IS NOT NULL	
					)
				OR	    @p_sewadar_list_id	IS NULL 	AND	r.satsang_centre_id	=	@p_satsang_centre_id
				)
    IF (@@ROWCOUNT = 0)					
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewadars Detail', NULL, NULL 
		RETURN -3;
	END

	INSERT INTO	@tmp_teams
		SELECT	DISTINCT	department_id, sub_department_id, gender
		FROM	@tmp_all_sewadars;	
		
	DECLARE	crsr	CURSOR	FOR
		SELECT	a.department_id, department_nm, a.sub_department_id, sub_department_nm, gender
		FROM	@tmp_teams	a
			JOIN	departments	d
				ON	(	a.department_id	=	d.department_id	)
			LEFT JOIN	sub_departments	s
				ON	(	a.sub_department_id	=	s.sub_department_id	)

	OPEN crsr;
	
	FETCH	crsr
		INTO	@department_id, @department_nm, @sub_department_id, @sub_department_nm, @gender;

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
	--	print		@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-' + @gender
		INSERT INTO	sewa_teams 	(	sewa_team_nm, sewa_id	)		--	, acceptance_ts	)
			VALUES	(	@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-' + @gender,
						@p_sewa_id									--	, GetDate()
					)
		SET @sewa_team_id	=	SCOPE_IDENTITY();

		CREATE	TABLE #tmp_team_sewadars
		(
			serial_id					INT			NOT NULL	IDENTITY (1, 1)		PRIMARY KEY NONCLUSTERED,
			satsang_centre_id			INT			NOT NULL,
			sewadar_grno				CHAR (6)	NOT NULL
		);

		INSERT	INTO	#tmp_team_sewadars	(sewadar_grno, satsang_centre_id)
			SELECT	sewadar_grno, satsang_centre_id
			FROM	@tmp_all_sewadars
			WHERE	department_id			=	@department_id
			AND		gender					=	@gender
			AND		(	(	@sub_department_id	IS NULL		AND	sub_department_id	IS NULL					)
					OR	(	@sub_department_id	IS NOT NULL	AND	sub_department_id	=	@sub_department_id	)
					)
			ORDER BY sewadar_nm;

		INSERT INTO	sewa_team_wise_sewadars ( sewa_team_id, serial_id, satsang_centre_id, sewadar_grno )
			SELECT	@sewa_team_id, serial_id, satsang_centre_id, sewadar_grno
			FROM	#tmp_team_sewadars
			ORDER BY serial_id;

		DROP TABLE	#tmp_team_sewadars;

		FETCH	crsr
			INTO	@department_id, @department_nm, @sub_department_id, @sub_department_nm, @gender;
	END
	CLOSE crsr;
	DEALLOCATE crsr;
END
GO

-- =============================================================================
-- Procedure MakeSewaTeams
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MakeSewaTeams' AND xtype = 'P')
	DROP PROCEDURE MakeSewaTeams
GO

CREATE PROCEDURE MakeSewaTeams
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_sewa_id				sewa_id,
	@p_sewadar_list_id		sewadar_list_id
)

WITH ENCRYPTION
AS
DECLARE	
	@cnt					INT,
	@sewa_id				sewa_id,
	@sewa_team_id			sewa_team_id,
	@department_id			INT,
	@department_nm			VARCHAR (50),
	@sub_department_id		INT,
	@is_outstation_sewadar	Boolean,
	@sub_department_nm		VARCHAR (50),
	@gender					CHAR (1);

DECLARE		
	@tmp_all_sewadars	TABLE	(
		sewadar_id					INT				NOT NULL	PRIMARY KEY	NONCLUSTERED,
		sewadar_nm 					VARCHAR (200)	NOT NULL,
		satsang_centre_id			INT				NOT NULL,
		sewadar_grno				CHAR (6)		NOT NULL,
		is_outstation_sewadar		VARCHAR (3)		NOT NULL,
		department_id				INT				NOT NULL,
		sub_department_id			INT					NULL,
		gender 						CHAR (1)		NOT NULL,
			UNIQUE NONCLUSTERED (sewadar_grno, satsang_centre_id) 
	);

DECLARE	
	@tmp_teams	TABLE	(
		is_outstation_sewadar	VARCHAR (3)	NOT NULL,
		department_id			INT			NOT NULL,
		sub_department_id		INT				NULL,
		gender 					CHAR (1)	NOT NULL
	);

BEGIN
	SELECT	@cnt	=	COUNT (*)
	FROM	satsang_centres_details
	WHERE	satsang_centre_id 	=	@p_satsang_centre_id ;
	IF (@cnt = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Satsang Centre', NULL, NULL 
		RETURN -1;
	END

	SELECT	@cnt	=	COUNT (*)
	FROM	sewas
	WHERE	sewa_id	=	@p_sewa_id	;
	IF (@cnt = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa', NULL, NULL 
		RETURN -2;
	END	

	INSERT INTO	@tmp_all_sewadars
		SELECT	s.sewadar_id, RTRIM (LTRIM (first_nm)) + COALESCE (' ' + SUBSTRING (middle_nm, 1, 1) + '.', '') + RTRIM (LTRIM (last_nm)),
				r.satsang_centre_id, r.sewadar_grno, is_outstation_sewadar, department_id, sub_department_id, CASE gender WHEN 'Male' THEN 'G' WHEN 'Female' THEN 'L' END
		FROM	sewadars	s
			JOIN	sewadars_registrations	r
				ON	(	s.sewadar_id	=	r.sewadar_id
					AND	s.global_sewadar_status_cd	IS	NULL
					)
			JOIN    system_information_values i
	            ON  (	r.sewadar_status_cd			=	i.value_varchar 
				    AND i.system_info_cd            =	'SttsAttnd'
				    ) 
			 LEFT JOIN	generic_sewadar_lists	x
				ON	(	x.satsang_centre_id		=	@p_satsang_centre_id
					AND	x.sewadar_list_id		=	@p_sewadar_list_id
					)
			 LEFT JOIN	generic_sewadar_lists_sewadars	z
				ON	(	r.satsang_centre_id		=	z.satsang_centre_id
					AND	r.sewadar_grno			=	z.sewadar_grno
					AND	z.sewadar_list_id		=	x.sewadar_list_id
					)
		WHERE	(	(	@p_sewadar_list_id	IS NOT NULL	AND	x.satsang_centre_id	IS NOT NULL	
														AND	z.satsang_centre_id	IS NOT NULL	
					)
				OR	    @p_sewadar_list_id	IS NULL 	AND	r.satsang_centre_id	=	@p_satsang_centre_id
				)
    IF (@@ROWCOUNT = 0)					
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewadars Detail', NULL, NULL 
		RETURN -3;
	END

	INSERT INTO	@tmp_teams
		SELECT	DISTINCT	is_outstation_sewadar, department_id, sub_department_id, gender
		FROM	@tmp_all_sewadars;	
		
	DECLARE	crsr	CURSOR	FOR
		SELECT	is_outstation_sewadar, a.department_id, department_nm, a.sub_department_id, sub_department_nm, gender
		FROM	@tmp_teams	a
			JOIN	departments	d
				ON	(	a.department_id	=	d.department_id	)
			LEFT JOIN	sub_departments	s
				ON	(	a.sub_department_id	=	s.sub_department_id	)

	OPEN crsr;
	
	FETCH	crsr
		INTO	@is_outstation_sewadar, @department_id, @department_nm, @sub_department_id, @sub_department_nm, @gender;

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
	--	print		@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-' + @gender + '-' + @is_outstation_sewadar
		INSERT INTO	sewa_teams 	(	sewa_team_nm, sewa_id	)		--	, acceptance_ts	)
			VALUES	(	@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-' + @gender + '-'
							+ CASE @is_outstation_sewadar	WHEN	'Yes'	THEN	'Outstation'
															WHEN	'No'	THEN	'Local'
								END,
						@p_sewa_id									--	, GetDate()
					)
		SET @sewa_team_id	=	SCOPE_IDENTITY();

		CREATE	TABLE #tmp_team_sewadars
		(
			serial_id					INT			NOT NULL	IDENTITY (1, 1)		PRIMARY KEY NONCLUSTERED,
			satsang_centre_id			INT			NOT NULL,
			sewadar_grno				CHAR (6)	NOT NULL
		);

		INSERT	INTO	#tmp_team_sewadars	(sewadar_grno, satsang_centre_id)
			SELECT	sewadar_grno, satsang_centre_id
			FROM	@tmp_all_sewadars
			WHERE	department_id			=	@department_id
			AND		is_outstation_sewadar	=	@is_outstation_sewadar
			AND		gender					=	@gender
			AND		(	(	@sub_department_id	IS NULL		AND	sub_department_id	IS NULL					)
					OR	(	@sub_department_id	IS NOT NULL	AND	sub_department_id	=	@sub_department_id	)
					)
			ORDER BY sewadar_nm;

		INSERT INTO	sewa_team_wise_sewadars ( sewa_team_id, serial_id, satsang_centre_id, sewadar_grno )
			SELECT	@sewa_team_id, serial_id, satsang_centre_id, sewadar_grno
			FROM	#tmp_team_sewadars
			ORDER BY serial_id;

		DROP TABLE	#tmp_team_sewadars;

		FETCH	crsr
			INTO	@is_outstation_sewadar, @department_id, @department_nm, @sub_department_id, @sub_department_nm, @gender;
	END
	CLOSE crsr;
	DEALLOCATE crsr;
END
GO

-- =============================================================================
-- Procedure MakeAreaWiseSewaTeams
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MakeAreaWiseSewaTeams' AND xtype = 'P')
	DROP PROCEDURE MakeAreaWiseSewaTeams
GO

CREATE PROCEDURE MakeAreaWiseSewaTeams
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_sewa_id				sewa_id,
	@p_sewadar_list_id		sewadar_list_id
)

WITH ENCRYPTION
AS
DECLARE	
	@cnt					INT,
	@sewa_id				sewa_id,
	@sewa_team_id			sewa_team_id,
	@department_id			INT,
	@department_nm			VARCHAR (50),
	@sub_department_id		INT,
	@is_outstation_sewadar	Boolean,
	@sub_department_nm		VARCHAR (50),
	@area_nm				VARCHAR (40),
	@gender					CHAR (1);

DECLARE		
	@tmp_all_sewadars	TABLE	(
		sewadar_id					INT				NOT NULL	PRIMARY KEY	NONCLUSTERED,
		sewadar_nm 					VARCHAR (200)	NOT NULL,
		satsang_centre_id			INT				NOT NULL,
		sewadar_grno				CHAR (6)		NOT NULL,
		is_outstation_sewadar		VARCHAR (3)		NOT NULL,
		department_id				INT				NOT NULL,
		sub_department_id			INT					NULL,
		area_nm						VARCHAR (40)		NULL,
		gender 						CHAR (1)		NOT NULL,
			UNIQUE NONCLUSTERED (sewadar_grno, satsang_centre_id) 
	);

DECLARE	
	@tmp_teams	TABLE	(
		is_outstation_sewadar	VARCHAR (3)	NOT NULL,
		department_id			INT			NOT NULL,
		sub_department_id		INT				NULL,
		area_nm					VARCHAR (40)	NULL,
		gender 					CHAR (1)	NOT NULL
	);

DECLARE
	@centres	TABLE	(
		id		INT	PRIMARY KEY,
		typ		CHAR (1),
		area_nm	VARCHAR (40)
	);

BEGIN
	SELECT	@cnt	=	COUNT (*)
	FROM	satsang_centres_details
	WHERE	satsang_centre_id 	=	@p_satsang_centre_id ;
	IF (@cnt = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Satsang Centre', NULL, NULL 
		RETURN -1;
	END

	SELECT	@cnt	=	COUNT (*)
	FROM	sewas
	WHERE	sewa_id	=	@p_sewa_id	;
	IF (@cnt = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa', NULL, NULL 
		RETURN -2;
	END	

	INSERT INTO	@centres
		SELECT	a.satsang_centre_id, 'A', a.satsang_centre_nm
		FROM	CDB..satsang_centres	a
			JOIN	satsang_centres_details	b
				ON	(	a.satsang_centre_id	=	b.satsang_centre_id	)
		WHERE	reports_to_centre_id	=	@p_satsang_centre_id
		AND		satsang_centre_type	=	'Area';
	IF (@@ROWCOUNT > 0)
	BEGIN
		INSERT INTO	@centres
			SELECT	a.satsang_centre_id, 'C', c.area_nm
			FROM	CDB..satsang_centres	a
				JOIN	satsang_centres_details	b
					ON	(	a.satsang_centre_id	=	b.satsang_centre_id	)
				JOIN	@centres	c
					ON	(	b.reports_to_centre_id	=	c.id	)
			AND		satsang_centre_type	=	'Centre';
		IF (@@ROWCOUNT > 0)
		BEGIN
			INSERT INTO	@centres
				SELECT	a.satsang_centre_id, SUBSTRING (satsang_centre_type, 1, 1), c.area_nm
				FROM	CDB..satsang_centres	a
					JOIN	satsang_centres_details	b
						ON	(	a.satsang_centre_id	=	b.satsang_centre_id	)
					JOIN	@centres	c
						ON	(	b.reports_to_centre_id	=	c.id
							AND	c.typ		=	'C'
							)
				WHERE	satsang_centre_type	IN	(	'Sub Centre', 'Point');
		END
	END

	INSERT INTO	@tmp_all_sewadars
		SELECT	s.sewadar_id, RTRIM (LTRIM (first_nm)) + COALESCE (' ' + SUBSTRING (middle_nm, 1, 1) + '.', '') + RTRIM (LTRIM (last_nm)),
				r.satsang_centre_id, r.sewadar_grno, is_outstation_sewadar, department_id, sub_department_id,
				CASE WHEN is_outstation_sewadar = 'Yes' THEN area_nm END,
				CASE gender WHEN 'Male' THEN 'G' WHEN 'Female' THEN 'L' END
		FROM	sewadars	s
			JOIN	sewadars_registrations	r
				ON	(	s.sewadar_id	=	r.sewadar_id
					AND	s.global_sewadar_status_cd	IS	NULL
					)
			JOIN    system_information_values i
	            ON  (	r.sewadar_status_cd			=	i.value_varchar 
				    AND i.system_info_cd            =	'SttsAttnd'
				    )
			JOIN	sewadars_details	d
				ON	(	d.sewadar_id	=	s.sewadar_id	)
			LEFT JOIN	@centres	c
				ON	(	c.id	=	d.weekly_satsang_centre_id	)
			LEFT JOIN	generic_sewadar_lists	x
				ON	(	x.satsang_centre_id		=	@p_satsang_centre_id
					AND	x.sewadar_list_id		=	@p_sewadar_list_id
					)
			LEFT JOIN	generic_sewadar_lists_sewadars	z
				ON	(	r.satsang_centre_id		=	z.satsang_centre_id
					AND	r.sewadar_grno			=	z.sewadar_grno
					AND	z.sewadar_list_id		=	x.sewadar_list_id
					)
		WHERE	(	(	@p_sewadar_list_id	IS NOT NULL	AND	x.satsang_centre_id	IS NOT NULL	
														AND	z.satsang_centre_id	IS NOT NULL	
					)
				OR	    @p_sewadar_list_id	IS NULL 	AND	r.satsang_centre_id	=	@p_satsang_centre_id
				)
    IF (@@ROWCOUNT = 0)					
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewadars Detail', NULL, NULL 
		RETURN -3;
	END

	INSERT INTO	@tmp_teams
		SELECT	DISTINCT	is_outstation_sewadar, department_id, sub_department_id, area_nm, gender
		FROM	@tmp_all_sewadars;	
		
	DECLARE	crsr	CURSOR	FOR
		SELECT	is_outstation_sewadar, a.department_id, department_nm, a.sub_department_id, sub_department_nm, area_nm, gender
		FROM	@tmp_teams	a
			JOIN	departments	d
				ON	(	a.department_id	=	d.department_id	)
			LEFT JOIN	sub_departments	s
				ON	(	a.sub_department_id	=	s.sub_department_id	)

	OPEN crsr;
	
	FETCH	crsr
		INTO	@is_outstation_sewadar, @department_id, @department_nm, @sub_department_id, @sub_department_nm, @area_nm, @gender;

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
	--	print		@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-' + @gender + '-' + @is_outstation_sewadar + '-' + @area_nm
		INSERT INTO	sewa_teams 	(	sewa_team_nm, sewa_id	)		--	, acceptance_ts	)
			VALUES	(	@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-' + @gender + '-'
							+ CASE @is_outstation_sewadar	WHEN	'Yes'	THEN	COALESCE (@area_nm, 'Outstation')
															WHEN	'No'	THEN	'Local'
								END,
						@p_sewa_id									--	, GetDate()
					)
		SET @sewa_team_id	=	SCOPE_IDENTITY();

		CREATE	TABLE #tmp_team_sewadars
		(
			serial_id					INT			NOT NULL	IDENTITY (1, 1)		PRIMARY KEY NONCLUSTERED,
			satsang_centre_id			INT			NOT NULL,
			sewadar_grno				CHAR (6)	NOT NULL
		);

		INSERT	INTO	#tmp_team_sewadars	(sewadar_grno, satsang_centre_id)
			SELECT	sewadar_grno, satsang_centre_id
			FROM	@tmp_all_sewadars
			WHERE	department_id			=	@department_id
			AND		is_outstation_sewadar	=	@is_outstation_sewadar
			AND		gender					=	@gender
			AND		(	(	@sub_department_id	IS NULL		AND	sub_department_id	IS NULL					)
					OR	(	@sub_department_id	IS NOT NULL	AND	sub_department_id	=	@sub_department_id	)
					)
			AND		(	(	@area_nm	IS NULL		AND	area_nm	IS NULL			)
					OR	(	@area_nm	IS NOT NULL	AND	area_nm	=	@area_nm	)
					)
			ORDER BY sewadar_nm;

		INSERT INTO	sewa_team_wise_sewadars ( sewa_team_id, serial_id, satsang_centre_id, sewadar_grno )
			SELECT	@sewa_team_id, serial_id, satsang_centre_id, sewadar_grno
			FROM	#tmp_team_sewadars
			ORDER BY serial_id;

		DROP TABLE	#tmp_team_sewadars;

		FETCH	crsr
			INTO	@is_outstation_sewadar, @department_id, @department_nm, @sub_department_id, @sub_department_nm, @area_nm, @gender;
	END
	CLOSE crsr;
	DEALLOCATE crsr;
END
GO

-- =============================================================================
-- Procedure MakeNISewaTeams
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'MakeNISewaTeams' AND xtype = 'P')
	DROP PROCEDURE MakeNISewaTeams
GO

CREATE PROCEDURE MakeNISewaTeams
(
	@p_satsang_centre_id 	satsang_centre_id,
	@p_sewa_id				sewa_id
)

WITH ENCRYPTION
AS

DECLARE	
	@cnt					INT,
	@sewa_id				sewa_id,
	@sewa_team_id			sewa_team_id,
	@department_id			INT,
	@department_nm			VARCHAR (50),
	@sub_department_id		INT,
	@sub_department_nm		VARCHAR (50),
	@gender					CHAR (1);

DECLARE		
	@tmp_all_sewadars	TABLE	(
		sewadar_id					INT				NOT NULL	PRIMARY KEY	NONCLUSTERED,
		sewadar_nm 					VARCHAR (200)	NOT NULL,
		sewadar_grno				CHAR (6)		NOT NULL	UNIQUE NONCLUSTERED,
		department_id				INT				NOT NULL,
		sub_department_id			INT					NULL,
		gender 						CHAR (1)		NOT NULL 
	);

DECLARE	
	@tmp_teams	TABLE	(
		department_id				INT			NOT NULL,
		sub_department_id			INT				NULL,
		gender 						CHAR (1)	NOT NULL
	);

BEGIN
	SELECT	@cnt	=	COUNT (*)
	FROM	satsang_centres_details
	WHERE	satsang_centre_id 	=	@p_satsang_centre_id;
	IF (@cnt = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Satsang Centre', NULL, NULL 
		RETURN -1;
	END

	SELECT	@cnt	=	COUNT (*)
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id;
	IF (@cnt = 0)
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa', NULL, NULL 
		RETURN -2;
	END	
		
	INSERT INTO	@tmp_all_sewadars
		SELECT	s.sewadar_id, RTRIM (LTRIM (first_nm)) + COALESCE (' ' + SUBSTRING (middle_nm, 1, 1) + '.', '') + RTRIM (LTRIM (last_nm)),
				r.sewadar_grno, department_id, sub_department_id, CASE gender WHEN 'Male' THEN 'G' WHEN 'Female' THEN 'L' END
		FROM	sewadars	s
			JOIN	sewadars_registrations	r
				ON	(	s.sewadar_id	=	r.sewadar_id	
					AND	s.global_sewadar_status_cd	IS	NULL
					AND	r.satsang_centre_id			=	@p_satsang_centre_id
					AND r.sewadar_status_cd			= 'NI' 
                    )
    IF (@@ROWCOUNT = 0)					
	BEGIN
		EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewadars Detail', NULL, NULL 
		RETURN -3;
	END

	INSERT INTO	@tmp_teams
		SELECT	DISTINCT	department_id, sub_department_id, gender
		FROM	@tmp_all_sewadars;	
		
	DECLARE	crsr	CURSOR	FOR
		SELECT	a.department_id, department_nm, a.sub_department_id, sub_department_nm, gender
		FROM	@tmp_teams	a
			JOIN	departments	d
				ON	(	a.department_id	=	d.department_id	)
			LEFT JOIN	sub_departments	s
				ON	(	a.sub_department_id	=	s.sub_department_id	)

	OPEN crsr;
	
	FETCH	crsr
		INTO	@department_id, @department_nm, @sub_department_id, @sub_department_nm, @gender;

	WHILE (@@FETCH_STATUS = 0)
	BEGIN
--		print		@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-' + @gender
		INSERT INTO	sewa_teams 	(	sewa_team_nm, sewa_id	)		--	, acceptance_ts	)
			VALUES	(	@department_nm + COALESCE (' (' + @sub_department_nm + ')', '') + '-NI-' + @gender,
						@p_sewa_id									--	, GetDate()
					)
		SET @sewa_team_id	=	SCOPE_IDENTITY();

		CREATE	TABLE #tmp_team_sewadars
		(
			serial_id					INT			NOT NULL	IDENTITY (1, 1)		PRIMARY KEY NONCLUSTERED,
			sewadar_grno				CHAR (6)	NOT NULL
		);

		INSERT	INTO	#tmp_team_sewadars	(sewadar_grno)
			SELECT	sewadar_grno
			FROM	@tmp_all_sewadars
			WHERE	department_id			=	@department_id
			AND		gender					=	@gender
			AND		(	(	@sub_department_id	IS NULL		AND	sub_department_id	IS NULL					)
					OR	(	@sub_department_id	IS NOT NULL	AND	sub_department_id	=	@sub_department_id	)
					)
			ORDER BY sewadar_nm;

		INSERT INTO	sewa_team_wise_sewadars ( sewa_team_id, serial_id, satsang_centre_id, sewadar_grno )
			SELECT	@sewa_team_id, serial_id, @p_satsang_centre_id, sewadar_grno
			FROM	#tmp_team_sewadars
			ORDER BY serial_id;

		DROP TABLE	#tmp_team_sewadars;

		FETCH	crsr
			INTO	@department_id, @department_nm, @sub_department_id, @sub_department_nm, @gender;
	END
	CLOSE crsr;
	DEALLOCATE crsr;
END
GO

-- =============================================================================
-- Procedure FillBulkTmpSewadars
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'FillBulkTmpSewadars' AND xtype = 'P')
	DROP PROCEDURE FillBulkTmpSewadars
GO

-- =============================================================================
-- Procedure FillBulkTmpSewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'FillBulkTmpSewadarList' AND xtype = 'P')
	DROP PROCEDURE FillBulkTmpSewadarList
GO

CREATE PROCEDURE FillBulkTmpSewadarList
(
   @loc VARCHAR(200)
)
WITH ENCRYPTION
AS
BEGIN

exec(
'IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = ''#tmp_bulk_sewadar_list'')
	DROP TABLE #tmp_bulk_sewadar_list


CREATE TABLE #tmp_bulk_sewadar_list
(
	satsang_centre_id	INT,
	gr_no				CHAR (6)
);

--EXEC sp_configure ''show advanced options'', 1
--GO
--RECONFIGURE
--GO

INSERT INTO #tmp_bulk_sewadar_list
		(
			satsang_centre_id, gr_no
		)
	SELECT	[Centre ID], [G R No.]
	FROM OPENROWSET(''Microsoft.Jet.OLEDB.4.0'', ''Excel 8.0;Database='+ @loc +''', ''SELECT * FROM [Sheet1$]'');
--GO
')

END
GO


-- =============================================================================
-- Procedure FillBulkSewadarList
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'FillBulkSewadarList' AND xtype = 'P')
	DROP PROCEDURE FillBulkSewadarList
GO

CREATE PROCEDURE FillBulkSewadarList
(
	@sewadar_list_id		sewadar_list_id,
	@satsang_centre_id		INT,
	@gr_no_list				GrNoList READONLY
)
WITH ENCRYPTION
AS
BEGIN	
	SELECT DISTINCT GrNo INTO #TmpGrNo
	FROM @gr_no_list
	
	SELECT GrNo INTO #TmpDelete FROM #TmpGrNo
	WHERE GrNo NOT IN (SELECT current_sewadar_grno FROM sewadars WHERE current_satsang_centre_id = @satsang_centre_id)
		
	DELETE
	FROM	generic_sewadar_lists_sewadars
	WHERE	sewadar_list_id	=	@sewadar_list_id;
	
	INSERT INTO generic_sewadar_lists_sewadars
			(	sewadar_list_id, satsang_centre_id, sewadar_grno	)
		SELECT	@sewadar_list_id, @satsang_centre_id, GrNo
		FROM	#TmpGrNo
		WHERE	GrNo	IS NOT NULL
		AND		LEN (grno)	=	6
	
END

GO
-- =============================================================================
-- Procedure ReportDiscrepanciesBulkRegister
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ReportDiscrepanciesBulkRegister' AND xtype = 'P')
	DROP PROCEDURE ReportDiscrepanciesBulkRegister
GO

CREATE PROCEDURE ReportDiscrepanciesBulkRegister
(
	@sewadar_registration_tbl	SewadarRegistrationType		READONLY,
	@satsang_centre_nm			gnc_nm,
	@satsang_centre_id			satsang_centre_id,
	@ret_str					VARCHAR(MAX) OUTPUT
)
WITH ENCRYPTION
AS
DECLARE

	@name							VARCHAR(100),
	@oname							VARCHAR(100),
	@gender							CHAR,
    @is_local_sewadar				CHAR,
	@photo_id						VARCHAR(20),
    @department_nm					gnc_nm,
    @sub_department_nm				gnc_nm,
	@telephone_mobile				telephone_lines,
	@birth_dtm						SMALLDATETIME,
    @occupation						gnc_nm,
	@appointment_year				INT,
	@first_nm						name_part,
	@middle_nm						name_part,
	@last_nm						name_part,
    @position1						INT,
	@position2						INT,
	@position3						INT,
	@db_gender						VARCHAR (6),
	@sewadar_id						sewadar_id,
	@dept_id						INT,
	@dept_eff_frm_dt				DATETIME,
	@dept_eff_tll_dt				DATETIME,
	@sub_dept_id					INT,
	@earliest_yoa					INT,
	@sub_dept_eff_frm_dt			DATETIME,
	@sub_dept_eff_tll_dt			DATETIME,

	@is_married						CHAR (1),
	@is_initiated					CHAR (1),
	@initiated_on					DATE,
	@initiated_by					VARCHAR (50),
	@initiation_place				VARCHAR (35),
                                    
	@address_line_1					VARCHAR (50),
	@address_line_2					VARCHAR (50),
	@country_nm						VARCHAR (50),
	@state_nm						VARCHAR (50),
	@district_nm					VARCHAR (50),
	@post_office_nm					VARCHAR (30),
	@pin_or_zip_code				VARCHAR (6),
	@telephone_residence			VARCHAR (50),
	@telephone_office				VARCHAR (50),
	@skill							VARCHAR (20),
	@qualification					VARCHAR (35),
	@qualification_subject			VARCHAR (20),
                                    
	@attends_weekly_satsang			CHAR (1),
	@weekly_satsang_centre			VARCHAR (40),
                                    
	@address_proof					VARCHAR (15),
	@other_address_proof			VARCHAR (60),
	@has_hypertension				CHAR (1),
	@is_diabetic					CHAR (1),
	@has_skin_problem				CHAR (1),
	@has_epillepsy					CHAR (1),
	@medical_disability				VARCHAR (60),
                                    
	@reference_1_centre				VARCHAR (40),
	@reference_1_grno				CHAR (6),
	@reference_1_nm					VARCHAR (40),
	@reference_1_relation			VARCHAR (20),
	@reference_1_department			varchar (30),
                                    
	@reference_2_centre				VARCHAR (40),
	@reference_2_grno				CHAR (6),
	@reference_2_nm					VARCHAR (40),
	@reference_2_relation			VARCHAR (20),
	@reference_2_department			varchar (30),
                                    
	@sponsorer_centre				VARCHAR (40),
	@sponsorer_grno					CHAR (6),
	@security_centre				VARCHAR (40),
	@security_grno					CHAR (6),
                                    
	@area_secretary_centre			VARCHAR (40),
	@secretary_centre				VARCHAR (40),
                                    
	@initiated_by_id				TINYINT,
	@initiation_place_id			SMALLINT,
	@country_id						INTEGER,
	@state_id						INTEGER,
	@district_or_city_id			INTEGER,
	@post_office_or_city_id			INTEGER,
	@weekly_satsang_centre_id		INTEGER,
	@address_proof_id				VARCHAR (15),
	@other_address_proof_id			SMALLINT,
                                    
	@skill_id						SMALLINT,
	@qualification_id				SMALLINT,
	@qualification_subject_id		SMALLINT,
	@qqs_dtm						DATETIME,
	@medical_disability_id			SMALLINT,

	@reference_1_sewadar_id			INTEGER,
	@reference_1_first_nm			name_part,
	@reference_1_global_status_cd	VARCHAR (4),
	@reference_1_status_cd			VARCHAR (4),
	@reference_1_centre_id			INTEGER,
	@reference_1_relation_id		SMALLINT,
	@reference_1_dept_id			SMALLINT,
	@reference_1_dept_eff_from		DATE,

	@reference_2_sewadar_id			INTEGER,
	@reference_2_first_nm			name_part,
	@reference_2_global_status_cd	VARCHAR (4),
	@reference_2_status_cd			VARCHAR (4),
	@reference_2_centre_id			INTEGER,
	@reference_2_relation_id		SMALLINT,
	@reference_2_dept_id			SMALLINT,
	@reference_2_dept_eff_from		DATE,
                                    
	@sponsorer_sewadar_id			INTEGER,
	@sponsorer_global_status_cd		VARCHAR (4),
	@sponsorer_status_cd			VARCHAR (4),
	@security_sewadar_id			INTEGER,
	@security_global_status_cd		VARCHAR (4),
	@security_status_cd				VARCHAR (4),
                                    
	@area_secretary_id				SMALLINT,
	@area_secretary_centre_id		INTEGER,
	@secretary_id					SMALLINT,
	@secretary_centre_id			INTEGER,
	
	@frst_nm						name_part;
	
BEGIN
	SELECT	@earliest_yoa	=	value_int
	FROM	system_information_values
	WHERE	system_info_cd	=	'YOABlkRgst';

	IF (@earliest_yoa IS NULL)
		SET @earliest_yoa = 2000;
		
	DELETE FROM tmp_bulk_registrations;
	
	SELECT	TOP 1	@name	=	name,
					@gender	=	gender,
					@birth_dtm	=	date_of_birth
	FROM	@sewadar_registration_tbl
	GROUP BY	name, gender, date_of_birth
	HAVING COUNT (*) > 1;
	IF (@@ROWCOUNT > 0)
	BEGIN
		SET @ret_str = 'There exist multiple records with same Sewadar Name [' + @name + '], Gender [' + @gender + '], and Date of Birth [' + CONVERT (VARCHAR, @birth_dtm, 106) + ']';
		RETURN;
	END
		
	INSERT INTO tmp_bulk_registrations
			(
				name, gender, is_local_sewadar, photo_id, department_nm, sub_department_nm,
				telephone_mobile, birth_dtm, occupation, old_grno, appointment_year,
				is_married, is_initiated, initiated_on, initiated_by, initiation_place,
				address_line_1, address_line_2, country_nm, state_nm, district_nm, post_office_nm, pin_or_zip_code, telephone_residence, telephone_office,
				skill, qualification, qualification_subject, attends_weekly_satsang, weekly_satsang_centre,
				address_proof, other_address_proof, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy, medical_disability,
				reference_1_centre, reference_1_grno, reference_1_nm, reference_1_relation, reference_1_department,
				reference_2_centre, reference_2_grno, reference_2_nm, reference_2_relation, reference_2_department,
				sponsorer_centre, sponsorer_grno, security_centre, security_grno, area_secretary_centre, secretary_centre
			)
		SELECT	name, gender, is_local_sewadar, photo_id, department, sub_department,
				mobile, date_of_birth, occupation, old_grno, appointment_year,
				is_married, is_initiated, initiated_on, initiated_by, initiation_place,
				address_line_1, address_line_2, country_nm, state_nm, district_nm, post_office_nm, pin_or_zip_code, telephone_residence, telephone_office,
				skill, qualification, qualification_subject, attends_weekly_satsang, weekly_satsang_centre,
				address_proof, other_address_proof, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy, medical_disability,
				reference_1_centre, reference_1_grno, reference_1_nm, reference_1_relation, reference_1_department,
				reference_2_centre, reference_2_grno, reference_2_nm, reference_2_relation, reference_2_department,
				sponsorer_centre, sponsorer_grno, security_centre, security_grno, area_secretary_centre, secretary_centre
		FROM	@sewadar_registration_tbl
		WHERE	to_be_registered	=	'Y';

	DECLARE crsr CURSOR FOR
		SELECT	name, REPLACE (REPLACE (REPLACE (m.name, '  ', ' '), '  ', ' '), '  ', ' '), RTRIM (LTRIM (m.gender)), RTRIM (LTRIM (is_local_sewadar)),
				RTRIM (LTRIM (m.photo_id)), RTRIM (LTRIM (m.department_nm)), RTRIM (LTRIM (m.sub_department_nm)), RTRIM (LTRIM (telephone_mobile)),
				m.birth_dtm, LTRIM (RTRIM (occupation)), appointment_year,
				d.department_id, ds.effective_from, ds.effective_till, s.sub_department_id, ss.effective_from, ss.effective_till,

				m.is_married, is_initiated, initiated_on, initiated_by, initiation_place,
				m.address_line_1, m.address_line_2, m.country_nm, m.state_nm, m.district_nm, post_office_nm, m.pin_or_zip_code, telephone_residence, telephone_office,
				m.skill, m.qualification, m.qualification_subject, m.attends_weekly_satsang, m.weekly_satsang_centre,
				m.address_proof, other_address_proof, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy, m.medical_disability,
				reference_1_centre, reference_1_grno, m.reference_1_nm, reference_1_relation, m.reference_1_department,
				reference_2_centre, reference_2_grno, m.reference_2_nm, reference_2_relation, m.reference_2_department,
				sponsorer_centre, sponsorer_grno, security_centre, security_grno, area_secretary_centre, secretary_centre,

				ib.patron_id AS initiated_by_id, ip.place_id AS initiation_place_id,
				cc.country_id, cs.state_id, cd.district_or_city_id, pc.post_office_or_city_id,
				wsc.satsang_centre_id AS weekly_satsang_centre_id, ap.address_proof AS address_proof_id, oap.address_proof_id AS other_address_proof_id,
				sk.skill_id, q.qualification_id, qs.qlfctn_subject_id, qqs.effective_from, md.medical_disability_id,

				r1s.sewadar_id AS reference_1_sewadar_id, r1s.first_nm AS reference_1_first_nm, r1s.global_sewadar_status_cd AS reference_1_global_status_cd, r1sr.sewadar_status_cd AS reference_1_status_cd,
				r1sc.satsang_centre_id AS reference_1_centre_id, r1cr.relation_id AS reference_1_relation_id, r1d.department_id AS reference_1_dept_id, r1ds.effective_from AS reference_1_dept_eff_from,

				r2s.sewadar_id AS reference_2_sewadar_id, r2s.first_nm AS reference_2_first_nm, r2s.global_sewadar_status_cd AS reference_2_global_status_cd, r2sr.sewadar_status_cd AS reference_2_status_cd,
				r2sc.satsang_centre_id AS reference_2_centre_id, r2cr.relation_id AS reference_2_relation_id, r2d.department_id AS reference_2_dept_id, r2ds.effective_from AS reference_2_dept_eff_from,

				sss.sewadar_id AS sponsorer_sewadar_id, sss.global_sewadar_status_cd AS sponsorer_global_status_cd, sssr.sewadar_status_cd AS sponsorer_status_cd,
				scss.sewadar_id AS security_sewadar_id, scss.global_sewadar_status_cd AS security_global_status_cd, scssr.sewadar_status_cd AS security_status_cd,

				assc.satsang_centre_id AS area_secretary_centre_id, asf.centre_functionary_id AS area_secretary_id, secsc.satsang_centre_id AS secretary_centre_id, sf.centre_functionary_id AS secretary_id
		FROM    tmp_bulk_registrations m
			LEFT JOIN	departments d
				ON	(	m.department_nm = d.department_nm	)
			LEFT JOIN	sub_departments	s
				ON	(	s.department_id = d.department_id
					AND	s.sub_department_nm = m.sub_department_nm
					)
			LEFT JOIN	departments_satsang_centres	ds
				ON	(	ds.department_id = d.department_id
					AND	ds.satsang_centre_id = @satsang_centre_id
					)
			LEFT JOIN	sub_departments_satsang_centres	ss
				ON	(	ss.sub_department_id = s.sub_department_id
					AND	ss.satsang_centre_id = @satsang_centre_id
					)
			LEFT JOIN	CDB..patrons	ib
				ON	(	ib.patron_nm	=	m.initiated_by	)
			LEFT JOIN	CDB..initiation_places	ip
				ON	(	ip.place_nm	=	m.initiation_place	)
			LEFT JOIN	CDB..countries	cc
				ON	(	cc.country_nm	=	m.country_nm	)
			LEFT JOIN	CDB..states	cs
				ON	(	cs.state_nm	=	m.state_nm	
					AND	cs.country_id	=	cc.country_id
					)
			LEFT JOIN	CDB..districts_or_cities	cd
				ON	(	cd.district_nm	=	m.district_nm
					AND	cd.state_id		=	cs.state_id
					)
			LEFT JOIN	post_offices_or_cities	pc
				ON	(	pc.post_office_or_city_nm	=	m.post_office_nm
					AND	pc.district_id				=	cd.district_or_city_id
					)
			LEFT JOIN	CDB..satsang_centres	wsc
				ON	(	wsc.satsang_centre_nm	=	m.weekly_satsang_centre
					AND	GetDate()		BETWEEN	wsc.effective_from	AND	wsc.effective_till
					)
			LEFT JOIN	address_proofs	ap
				ON	(	ap.address_proof	=	m.address_proof	)
			LEFT JOIN	other_address_proofs	oap
				ON	(	oap.address_proof_nm	=	m.other_address_proof	)
	
			LEFT JOIN	CDB..skills	sk
				ON	(	sk.skill_nm	=	m.skill	
					AND	GetDate()	BETWEEN	sk.effective_from	AND	sk.effective_till
					)
			LEFT JOIN	CDB..qualifications	q
				ON	(	q.qualification_nm	=	m.qualification	
					AND	GetDate()	BETWEEN	q.effective_from	AND	q.effective_till
					)
			LEFT JOIN	CDB..qlfctn_subjects	qs
				ON	(	qs.qlfctn_subject_nm	=	m.qualification_subject	
					AND	GetDate()	BETWEEN	qs.effective_from	AND	qs.effective_till
					)
			LEFT JOIN	CDB..qualifications_qlfctn_subjects	qqs
				ON	(	qqs.qualification_id	=	q.qualification_id
					AND	qqs.qlfctn_subject_id	=	qs.qlfctn_subject_id
					)
			LEFT JOIN	medical_disabilities	md
				ON	(	md.medical_disability_nm	=	m.medical_disability	
					AND	GetDate()	BETWEEN	md.effective_from	AND	md.effective_till
					)

			LEFT JOIN	satsang_centres_details	r1sc
				ON	(	r1sc.centre_nm	=	m.reference_1_centre
					AND	r1sc.is_main_centre	=	'Yes'
					)
			LEFT JOIN	sewadars	r1s
				ON	(	r1s.current_satsang_centre_id	=	r1sc.satsang_centre_id
					AND	r1s.current_sewadar_grno		=	m.reference_1_grno
					)
			LEFT JOIN	sewadars_registrations	r1sr
				ON	(	r1sr.satsang_centre_id	=	r1sc.satsang_centre_id
					AND	r1sr.sewadar_grno		=	m.reference_1_grno
					)
			LEFT JOIN	CDB..relations	r1cr
				ON	(	r1cr.relation_nm	=	m.reference_1_relation	)
			LEFT JOIN	departments r1d
				ON	(	r1d.department_nm	=	m.reference_1_department	)
			LEFT JOIN	departments_satsang_centres	r1ds
				ON	(	r1ds.department_id		=	r1d.department_id
					AND	r1ds.satsang_centre_id	=	r1sc.satsang_centre_id
					)

			LEFT JOIN	satsang_centres_details	r2sc
				ON	(	r2sc.centre_nm	=	m.reference_2_centre
					AND	r2sc.is_main_centre	=	'Yes'
					)
			LEFT JOIN	sewadars	r2s
				ON	(	r2s.current_satsang_centre_id	=	r2sc.satsang_centre_id
					AND	r2s.current_sewadar_grno		=	m.reference_2_grno
					)
			LEFT JOIN	sewadars_registrations	r2sr
				ON	(	r2sr.satsang_centre_id	=	r2sc.satsang_centre_id
					AND	r2sr.sewadar_grno		=	m.reference_2_grno
					)
			LEFT JOIN	CDB..relations	r2cr
				ON	(	r2cr.relation_nm	=	m.reference_2_relation	)
			LEFT JOIN	departments r2d
				ON	(	r2d.department_nm	=	m.reference_2_department	)
			LEFT JOIN	departments_satsang_centres	r2ds
				ON	(	r2ds.department_id		=	r2d.department_id
					AND	r2ds.satsang_centre_id	=	r2sc.satsang_centre_id
					)

			LEFT JOIN	satsang_centres_details	ssc
				ON	(	ssc.centre_nm	=	m.sponsorer_centre
					AND	ssc.is_main_centre	=	'Yes'
					)
			LEFT JOIN	sewadars	sss
					ON	(	sss.current_satsang_centre_id	=	ssc.satsang_centre_id
						AND	sss.current_sewadar_grno		=	m.sponsorer_grno
						)
			LEFT JOIN	sewadars_registrations	sssr
				ON	(	sssr.satsang_centre_id	=	ssc.satsang_centre_id
					AND	sssr.sewadar_grno		=	m.sponsorer_grno
					)

			LEFT JOIN	satsang_centres_details	scsc
				ON	(	scsc.centre_nm	=	m.security_centre
					AND	scsc.is_main_centre	=	'Yes'
					)
			LEFT JOIN	sewadars	scss
				ON	(	scss.current_satsang_centre_id	=	scsc.satsang_centre_id
					AND	scss.current_sewadar_grno		=	m.security_grno
					)
			LEFT JOIN	sewadars_registrations	scssr
				ON	(	scssr.satsang_centre_id	=	scsc.satsang_centre_id
					AND	scssr.sewadar_grno		=	m.security_grno
					)

			LEFT JOIN	CDB..satsang_centres	assc
				ON	(	assc.satsang_centre_nm	=	m.area_secretary_centre
					AND	GetDate()	BETWEEN	assc.effective_from	AND	assc.effective_till
					)
			LEFT JOIN	satsang_centre_functionaries	asf
				ON	(	asf.satsang_centre_id	=	assc.satsang_centre_id
					AND	asf.centre_functionary	=	'Area Secretary'
					AND	GetDate()	BETWEEN	asf.effective_from	AND	asf.effective_till
					)

			LEFT JOIN	CDB..satsang_centres	secsc
				ON	(	secsc.satsang_centre_nm	=	m.secretary_centre
					AND	GetDate()	BETWEEN	secsc.effective_from	AND	secsc.effective_till
					)
			LEFT JOIN	satsang_centre_functionaries	sf
				ON	(	sf.satsang_centre_id	=	secsc.satsang_centre_id
					AND	sf.centre_functionary	=	'Secretary'
					AND	GetDate()	BETWEEN	sf.effective_from	AND	sf.effective_till
					)
		ORDER BY photo_id;

	SET @ret_str =  ''

	OPEN crsr
	FETCH crsr INTO @oname, @name, @gender, @is_local_sewadar, @photo_id,  @department_nm, @sub_department_nm, @telephone_mobile, @birth_dtm, @occupation, @appointment_year,
					@dept_id, @dept_eff_frm_dt, @dept_eff_tll_dt, @sub_dept_id, @sub_dept_eff_frm_dt, @sub_dept_eff_tll_dt,

					@is_married, @is_initiated, @initiated_on, @initiated_by, @initiation_place,
					@address_line_1, @address_line_2, @country_nm, @state_nm, @district_nm, @post_office_nm, @pin_or_zip_code, @telephone_residence, @telephone_office,
					@skill, @qualification, @qualification_subject, @attends_weekly_satsang, @weekly_satsang_centre,
					@address_proof, @other_address_proof, @has_hypertension, @is_diabetic, @has_skin_problem, @has_epillepsy, @medical_disability,
					@reference_1_centre, @reference_1_grno, @reference_1_nm, @reference_1_relation, @reference_1_department,
					@reference_2_centre, @reference_2_grno, @reference_2_nm, @reference_2_relation, @reference_2_department,
					@sponsorer_centre, @sponsorer_grno, @security_centre, @security_grno, @area_secretary_centre, @secretary_centre,

					@initiated_by_id, @initiation_place_id,
					@country_id, @state_id, @district_or_city_id, @post_office_or_city_id,
					@weekly_satsang_centre_id, @address_proof_id, @other_address_proof_id,
					@skill_id, @qualification_id, @qualification_subject_id, @qqs_dtm, @medical_disability_id,

					@reference_1_sewadar_id, @reference_1_first_nm, @reference_1_global_status_cd, @reference_1_status_cd,
					@reference_1_centre_id, @reference_1_relation_id, @reference_1_dept_id, @reference_1_dept_eff_from,

					@reference_2_sewadar_id, @reference_2_first_nm, @reference_2_global_status_cd, @reference_2_status_cd,
					@reference_2_centre_id, @reference_2_relation_id, @reference_2_dept_id, @reference_2_dept_eff_from,

					@sponsorer_sewadar_id, @sponsorer_global_status_cd, @sponsorer_status_cd,
					@security_sewadar_id, @security_global_status_cd, @security_status_cd,

					@area_secretary_centre_id, @area_secretary_id, @secretary_centre_id, @secretary_id;
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
--		print 'iterating over ' + '[' + @photo_id +']'
--		print 'iterating over ' + '[' + @photo_id +'] with Name as ' + @name
		SET @position1 = CHARINDEX (' ', @name)
		IF (@position1 > 0)
		BEGIN
			SET @first_nm = LTRIM(RTRIM(SUBSTRING (@name, 1, @position1 - 1)));
			SET @position2 = CHARINDEX (' ', LTRIM(RTRIM(SUBSTRING (@name, @position1 + 1, 100))))
			IF (@position2 > 0)
			BEGIN
				SET @middle_nm = LTRIM(RTRIM(SUBSTRING ( LTRIM(RTRIM(SUBSTRING (@name, @position1 + 1, 100))), 1, @position2 -1)));
				SET @last_nm = LTRIM(RTRIM(SUBSTRING (@name, @position1 + @position2 + 1, 100)))
				SET @position3 = CHARINDEX (' ', LTRIM(RTRIM(SUBSTRING (@name, @position1 + @position2 + 1, 100))))
				IF (@position3 > 0)
					SET @ret_str =  @ret_str + 'Name [' + @name + '] has more than three name parts separated by a space for ' +'[' + @photo_id +']' + CHAR (13);
			END
			ELSE
				SET @ret_str =  @ret_str + 'Name [' + @name + '] does not have First Name, Middle Name and Surname separated by a space for ' +'[' + @photo_id +']' + CHAR (13);
		END
		ELSE
			SET @ret_str =  @ret_str + 'Name [' + @name + '] does not have First Name, Middle Name and Surname separated by a space for ' +'[' + @photo_id +']' + CHAR (13);
	
		IF (@first_nm IS NULL OR @last_nm IS NULL OR @middle_nm IS NULL OR CHARINDEX (' ', @first_nm) > 0  OR CHARINDEX (' ', @middle_nm) > 0 OR CHARINDEX (' ', @last_nm) > 0)
			SET @ret_str =  @ret_str + 'There should be three parts in Name column, viz., First Name, Middle Name and Last Name separated by a space each for '  +'[' + @photo_id +']' + CHAR (13)

		IF (@is_local_sewadar NOT IN ( 'Y', 'N'))
			SET @ret_str =  @ret_str + 'Outstation Sewadar should Y or N for '  +'[' + @photo_id +']' + CHAR (13)
		IF (@gender NOT IN ( 'G', 'L'))
			SET @ret_str =  @ret_str + 'Gender should G or L for '  +'[' + @photo_id +']' + CHAR (13)

		IF (@dept_id IS NULL)
			SET @ret_str =  @ret_str + 'Department [' + @department_nm + '] does not exist for '  +'[' + @photo_id +']' + CHAR (13)
		ELSE IF (@dept_eff_frm_dt IS NULL)
			SET @ret_str =  @ret_str + 'Department [' + @department_nm + '] is not valid this Centre for '  +'[' + @photo_id +']' + CHAR (13)
		ELSE IF (GetDate () NOT BETWEEN @dept_eff_frm_dt AND @dept_eff_tll_dt)
			SET @ret_str =  @ret_str + 'Department [' + @department_nm + '] is not Active for '  +'[' + @photo_id +']' + CHAR (13)
		IF (@sub_department_nm IS NOT NULL AND @sub_department_nm != '')
		BEGIN
			IF (@sub_dept_id IS NULL)
				SET @ret_str =  @ret_str + 'Sub-department [' + @department_nm + '(' + @sub_department_nm + ')] does not exist for '  +'[' + @photo_id +']' + CHAR (13)
			ELSE IF (@sub_dept_eff_frm_dt IS NULL)
				SET @ret_str =  @ret_str + 'Sub-department [' + @department_nm + '(' + @sub_department_nm + ')] is not valid this Centre for '  +'[' + @photo_id +']' + CHAR (13)
			ELSE IF (GetDate () NOT BETWEEN @sub_dept_eff_frm_dt AND @sub_dept_eff_tll_dt)
				SET @ret_str =  @ret_str + 'Sub-department [' + @department_nm + '(' + @sub_department_nm + ')] is not Active for '  +'[' + @photo_id +']' + CHAR (13)
		END
		IF (DATEDIFF (MONTH, @birth_dtm, GetDate()) BETWEEN 0 AND 14*12)	---	Younger than 14 years is not allowed
			SET @ret_str =  @ret_str + 'Sewadar is too young for enrolment as per DOB for '  +'[' + @photo_id +']' + CHAR (13)
		IF (DATEDIFF (YEAR, @birth_dtm, GetDate()) < 0)
			SET @ret_str =  @ret_str + 'Ooops .... Sewadar is yet to be born as per DOB for '  +'[' + @photo_id +']' + CHAR (13)
	
		IF (@occupation NOT IN ('Business', 'House-wife', 'Retired', 'Self-employed', 'Service', 'Student', 'Un-employed'))
			SET @ret_str =  @ret_str + 'Occupation [' + @occupation + '] is invalid for '  +'[' + @photo_id +']' + CHAR (13)

		IF (@gender = 'G')
			SET @db_gender = 'Male';
		ELSE
			SET @db_gender = 'Female';

		IF (@is_married NOT IN ('Y', 'N'))
			SET @ret_str =  @ret_str + 'Married [' + @is_married + '] is invalid for '  +'[' + @photo_id +']; only Y or N allowed' + CHAR (13)

		IF (@is_initiated NOT IN ('Y', 'N'))
			SET @ret_str =  @ret_str + 'Initiated [' + @is_married + '] is invalid for '  +'[' + @photo_id +']; only Y or N allowed' + CHAR (13)
		IF (@is_initiated = 'Y')
		BEGIN
			IF (@initiated_on IS NULL)
				SET @ret_str =  @ret_str + 'Initiation date is not specified for '  +'[' + @photo_id +'];' + CHAR (13)
			IF (@initiated_by IS NULL)
				SET @ret_str =  @ret_str + 'Initiated By is not specified for '  +'[' + @photo_id +'];' + CHAR (13)
			IF (@initiation_place IS NULL)
				SET @ret_str =  @ret_str + 'Initiation Place is not specified for '  +'[' + @photo_id +'];' + CHAR (13)
			IF (@initiated_by_id IS NULL)
				SET @ret_str =  @ret_str + 'Initiated By is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
			IF (@initiation_place_id IS NULL)
				SET @ret_str =  @ret_str + 'Initiation Place is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
		END
		ELSE IF (@is_initiated = 'N')
		BEGIN
			IF (@initiated_on IS NOT NULL)
				SET @ret_str =  @ret_str + 'Initiation date can not be specified for '  +'[' + @photo_id +'];' + CHAR (13)
			IF (@initiated_by IS NOT NULL)
				SET @ret_str =  @ret_str + 'Initiated By can not be specified for '  +'[' + @photo_id +'];' + CHAR (13)
			IF (@initiation_place IS NOT NULL)
				SET @ret_str =  @ret_str + 'Initiation Place can not be specified for '  +'[' + @photo_id +'];' + CHAR (13)
		END
		IF (@address_line_1	IS NOT NULL)
		BEGIN
			IF (@country_nm IS NULL OR @state_nm IS NULL OR @district_nm IS NULL OR @post_office_nm IS NULL)
				SET @ret_str =  @ret_str + 'Country/State/District/Post Office must be specified for '  +'[' + @photo_id +'];' + CHAR (13)
			IF (@country_id IS NULL AND @country_nm IS NOT NULL)
				SET @ret_str =  @ret_str + 'Country is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
			IF (@state_id IS NULL AND @state_nm IS NOT NULL)
				SET @ret_str =  @ret_str + 'State is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
			IF (@district_or_city_id IS NULL AND @district_nm IS NOT NULL)
				SET @ret_str =  @ret_str + 'District is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
			IF (@post_office_or_city_id IS NULL AND @post_office_nm IS NOT NULL)
				SET @ret_str =  @ret_str + 'Post Office is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
		END
		ELSE		---	Address Line 1 is NULL
		BEGIN
			IF (@address_line_2 IS NOT NULL)
				SET @ret_str =  @ret_str + 'Address Line 1 must be specified for '  +'[' + @photo_id +'];' + CHAR (13)
			ELSE
			BEGIN
				IF (@country_nm IS NOT NULL OR @state_nm IS NOT NULL OR @district_nm IS NOT NULL OR @post_office_nm IS NOT NULL OR @pin_or_zip_code IS NOT NULL)
					SET @ret_str =  @ret_str + 'Country/State/District/Post Office/Pincode can not be specified without Address Line for '  +'[' + @photo_id +'];' + CHAR (13)
			END
		END

		IF (@attends_weekly_satsang NOT IN ('Y', 'N'))
			SET @ret_str =  @ret_str + 'Attends Weekly Satsang [' + @attends_weekly_satsang + '] is invalid for '  +'[' + @photo_id +']; only Y or N allowed' + CHAR (13)
		IF (@attends_weekly_satsang  = 'Y')
		BEGIN
			IF (@weekly_satsang_centre IS NULL)
				SET @ret_str =  @ret_str + 'Weekly Satsang Centre is not specified for '  +'[' + @photo_id +'];' + CHAR (13)
			ELSE IF (@weekly_satsang_centre_id IS NULL)
				SET @ret_str =  @ret_str + 'Weekly Satsang Centre is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
		END
		ELSE IF (@attends_weekly_satsang  = 'N')
			IF (@weekly_satsang_centre IS NOT NULL)
				SET @ret_str =  @ret_str + 'Weekly Satsang Centre can not be specified for '  +'[' + @photo_id +'];' + CHAR (13)

		IF (@address_proof IS NOT NULL AND @other_address_proof IS NOT NULL)
			SET @ret_str =  @ret_str + 'Address Proof as well as Other Address Proof can not be specified for '  +'[' + @photo_id +'];' + CHAR (13)
		ELSE IF (@address_proof IS NOT NULL AND @address_proof_id IS NULL)
			SET @ret_str =  @ret_str + 'Address Proof is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
		ELSE IF (@other_address_proof IS NOT NULL AND @other_address_proof_id IS NULL)
			SET @ret_str =  @ret_str + 'Other Address Proof is invalid for '  +'[' + @photo_id +'];' + CHAR (13)

		IF (@skill IS NOT NULL AND @skill_id IS NULL)
			SET @ret_str =  @ret_str + 'Skill is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
		IF (@qualification IS NOT NULL)
		BEGIN
			IF (@qualification_id IS NULL)
				SET @ret_str =  @ret_str + 'Qualification is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
			IF (@qualification_subject IS NOT NULL)
				IF (@qualification_subject_id IS NULL)
					SET @ret_str =  @ret_str + 'Qualification Subject is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
				ELSE IF (@qqs_dtm IS NULL)
					SET @ret_str =  @ret_str + 'Qualification Subject (' + @qualification_subject +') can not be used for Qualification (' + @qualification + ') for '  +'[' + @photo_id +'];' + CHAR (13)
		END
		IF (@medical_disability IS NOT NULL AND @medical_disability_id IS NULL)
			SET @ret_str =  @ret_str + 'Other Medical Disability is invalid for '  +'[' + @photo_id +'];' + CHAR (13)

		IF (@has_hypertension NOT IN ('Y', 'N'))
			SET @ret_str =  @ret_str + 'Hypertension [' + @has_hypertension + '] is invalid for '  +'[' + @photo_id +']; only Y or N allowed' + CHAR (13)
		IF (@is_diabetic NOT IN ('Y', 'N'))
			SET @ret_str =  @ret_str + 'Diabetic [' + @is_diabetic + '] is invalid for '  +'[' + @photo_id +']; only Y or N allowed' + CHAR (13)
		IF (@has_skin_problem NOT IN ('Y', 'N'))
			SET @ret_str =  @ret_str + 'Skin Problem [' + @has_skin_problem + '] is invalid for '  +'[' + @photo_id +']; only Y or N allowed' + CHAR (13)
		IF (@has_epillepsy NOT IN ('Y', 'N'))
			SET @ret_str =  @ret_str + 'Epillepsy [' + @has_epillepsy + '] is invalid for '  +'[' + @photo_id +']; only Y or N allowed' + CHAR (13)

		IF (@reference_1_relation IS NOT NULL OR @reference_1_centre IS NOT NULL OR @reference_1_grno IS NOT NULL)
		BEGIN
			IF (@reference_1_relation IS NULL OR @reference_1_centre IS NULL OR @reference_1_nm IS NULL OR @reference_1_department IS NULL)
				SET @ret_str =  @ret_str + 'Satsang Centre/Name of Sewadar/Department/Relationship for Reference 1 must be specified for '  +'[' + @photo_id +'];' + CHAR (13)
			ELSE
			BEGIN
				IF (@reference_1_centre_id IS NULL)
					SET @ret_str =  @ret_str + 'Satsang Centre for Reference 1 is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
				IF (@reference_1_relation_id IS NULL)
					SET @ret_str =  @ret_str + 'Relationship for Reference 1 is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
				IF (@reference_1_grno IS NOT NULL)
				BEGIN
					IF(CHARINDEX (' ', @reference_1_nm) > 0)
						SET @frst_nm = SUBSTRING (@reference_1_nm, 1, CHARINDEX (' ', @reference_1_nm) - 1);
					ELSE
						SET @frst_nm = @reference_1_nm					
					IF (@reference_1_sewadar_id IS NULL)
						SET @ret_str =  @ret_str + 'GR No. for Reference 1 is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
					ELSE IF (@reference_1_global_status_cd IS NOT NULL)
						SET @ret_str =  @ret_str + 'Global Status for Reference 1 is ' + @reference_1_global_status_cd + '  for '  +'[' + @photo_id +'];' + CHAR (13)
					ELSE IF (@reference_1_status_cd NOT IN ( 'Temp', 'Perm', 'Retd'))
						SET @ret_str =  @ret_str + 'Status for Reference 1 is ' + @reference_1_status_cd + '  for '  +'[' + @photo_id +'];' + CHAR (13)
					ELSE IF (@reference_1_first_nm != @frst_nm)
						SET @ret_str =  @ret_str + 'First Name of Reference 1 does not match with ' + @reference_1_first_nm + '  for '  +'[' + @photo_id +'];' + CHAR (13)
					ELSE IF (@reference_1_dept_id IS NULL)
						SET @ret_str =  @ret_str + 'Department of Reference 1 is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
					ELSE IF (@reference_1_dept_eff_from IS NULL)
						SET @ret_str =  @ret_str + 'Department of Reference 1 is not applicable for ' + @reference_1_centre + '  for '  +'[' + @photo_id +'];' + CHAR (13)
				END
			END
		END

		IF (@reference_2_relation IS NOT NULL OR @reference_2_centre IS NOT NULL OR @reference_2_grno IS NOT NULL)
		BEGIN
			IF (@reference_2_relation IS NULL OR @reference_2_centre IS NULL OR @reference_2_nm IS NULL OR @reference_2_department IS NULL)
				SET @ret_str =  @ret_str + 'Satsang Centre/Name of Sewadar/Department/Relationship for Reference 2 must be specified for '  +'[' + @photo_id +'];' + CHAR (13)
			ELSE
			BEGIN
				IF (@reference_2_centre_id IS NULL)
					SET @ret_str =  @ret_str + 'Satsang Centre for Reference 2 is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
				IF (@reference_2_relation_id IS NULL)
					SET @ret_str =  @ret_str + 'Relationship for Reference 2 is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
				IF (@reference_2_grno IS NOT NULL)
				BEGIN
					IF(CHARINDEX (' ', @reference_2_nm) > 0)
						SET @frst_nm = SUBSTRING (@reference_2_nm, 1, CHARINDEX (' ', @reference_2_nm) - 1);
					ELSE
						SET @frst_nm = @reference_2_nm
					IF (@reference_2_sewadar_id IS NULL)
						SET @ret_str =  @ret_str + 'GR No. for Reference 2 is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
					ELSE IF (@reference_2_global_status_cd IS NOT NULL)
						SET @ret_str =  @ret_str + 'Global Status for Reference 2 is ' + @reference_2_global_status_cd + '  for '  +'[' + @photo_id +'];' + CHAR (13)
					ELSE IF (@reference_2_status_cd NOT IN ( 'Temp', 'Perm', 'Retd'))
						SET @ret_str =  @ret_str + 'Status for Reference 2 is ' + @reference_2_status_cd + '  for '  +'[' + @photo_id +'];' + CHAR (13)
					ELSE IF (@reference_2_first_nm != @frst_nm)
						SET @ret_str =  @ret_str + 'First Name of Reference 2 does not match with ' + @reference_2_first_nm + '  for '  +'[' + @photo_id +'];' + CHAR (13)
					ELSE IF (@reference_2_dept_id IS NULL)
						SET @ret_str =  @ret_str + 'Department of Reference 2 is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
					ELSE IF (@reference_2_dept_eff_from IS NULL)
						SET @ret_str =  @ret_str + 'Department of Reference 2 is not applicable for ' + @reference_2_centre + '  for '  +'[' + @photo_id +'];' + CHAR (13)
				END
			END
		END

		IF (@sponsorer_centre IS NOT NULL AND @sponsorer_grno IS NOT NULL)
		BEGIN
			IF (@sponsorer_sewadar_id IS NULL)
				SET @ret_str =  @ret_str + 'GR No. for Sponsorer is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
			ELSE IF (@sponsorer_global_status_cd IS NOT NULL)
				SET @ret_str =  @ret_str + 'Global Status for Sponsorer is ' + @sponsorer_global_status_cd + '  for '  +'[' + @photo_id +'];' + CHAR (13)
			ELSE IF (@sponsorer_status_cd NOT IN ( 'Temp', 'Perm', 'Retd'))
				SET @ret_str =  @ret_str + 'Status for Sponsorer is ' + @sponsorer_status_cd + '  for '  +'[' + @photo_id +'];' + CHAR (13)
		END
		ELSE IF (@sponsorer_centre IS NOT NULL OR @sponsorer_grno IS NOT NULL)
			SET @ret_str =  @ret_str + 'Centre and GR No. of Sponsorer must be specified together for '  +'[' + @photo_id +'];' + CHAR (13)

		IF (@security_centre IS NOT NULL AND @security_grno IS NOT NULL)
		BEGIN
			IF (@security_sewadar_id IS NULL)
				SET @ret_str =  @ret_str + 'GR No. for Security Approver is invalid for '  +'[' + @photo_id +'];' + CHAR (13)
			ELSE IF (@security_global_status_cd IS NOT NULL)
				SET @ret_str =  @ret_str + 'Global Status for Security Approver is ' + @security_global_status_cd + '  for '  +'[' + @photo_id +'];' + CHAR (13)
			ELSE IF (@security_status_cd NOT IN ( 'Temp', 'Perm' ))
				SET @ret_str =  @ret_str + 'Status for Security Approver is ' + @security_status_cd + '  for '  +'[' + @photo_id +'];' + CHAR (13)
		END
		ELSE IF (@sponsorer_centre IS NOT NULL OR @sponsorer_grno IS NOT NULL)
			SET @ret_str =  @ret_str + 'Centre and GR No. of Sponsorer must be specified together for '  +'[' + @photo_id +'];' + CHAR (13)

		IF (@area_secretary_centre IS NOT NULL)
		BEGIN
			IF (@area_secretary_centre_id IS NULL)
				SET @ret_str =  @ret_str + 'Centre of Area Secretary is invalid for '  + '[' + @photo_id +'];' + CHAR (13)
			IF (@area_secretary_id IS NULL)
				SET @ret_str =  @ret_str + 'Area Secretary is not specified for Satsang Centre [' + @area_secretary_centre  + ']' + CHAR (13)
		END

		IF (@secretary_centre IS NOT NULL)
		BEGIN
			IF (@secretary_centre_id IS NULL)
				SET @ret_str =  @ret_str + 'Centre of Secretary is invalid for '  + '[' + @photo_id +'];' + CHAR (13)
			IF (@secretary_id IS NULL)
				SET @ret_str =  @ret_str + 'Secretary is not specified for Satsang Centre [' + @secretary_centre  + ']' + CHAR (13)
		END

		SELECT	@sewadar_id	=	sewadar_id
		FROM	sewadars
		WHERE	first_nm	=	@first_nm
		AND		last_nm		=	@last_nm
		AND		gender		=	@db_gender
		AND		birth_dtm	=	@birth_dtm;
		IF (@@ROWCOUNT > 0)
			SET @ret_str =  @ret_str + 'Sewadar already exists in ZSM for '  +'[' + @photo_id +'] with Sewadar ID [' + CONVERT (VARCHAR(20), @sewadar_id) + ']' + CHAR (13)

		UPDATE	tmp_bulk_registrations
			SET	first_nm					=	@first_nm,
				middle_nm					=	@middle_nm,
				last_nm						=	@last_nm,
				department_id				=	@dept_id,
				sub_department_id			=	@sub_dept_id,
				initiated_on				=	@initiated_on,
				initiated_by_id				=	@initiated_by_id,
				initiation_place_id			=	@initiation_place_id,
				post_office_or_city_id		=	@post_office_or_city_id,
				weekly_satsang_centre_id	=	@weekly_satsang_centre_id,
				other_address_proof_id		=	@other_address_proof_id,
				skill_id					=	@skill_id,
				qualification_id			=	@qualification_id,
				qualification_subject_id	=	@qualification_subject_id,
				medical_disability_id		=	@medical_disability_id,
				reference_1_sewadar_id		=	@reference_1_sewadar_id,
				reference_1_centre_id		=	@reference_1_centre_id,
				reference_1_relation_id		=	@reference_1_relation_id,
				reference_2_sewadar_id		=	@reference_2_sewadar_id,
				reference_2_centre_id		=	@reference_2_centre_id,
				reference_2_relation_id		=	@reference_2_relation_id,
				sponsorer_sewadar_id		=	@sponsorer_sewadar_id,
				security_sewadar_id			=	@security_sewadar_id,
				area_secretary_id			=	@area_secretary_id,
				secretary_id				=	@secretary_id			
		WHERE	name	=	@oname
		AND		gender	=	@gender
		AND		birth_dtm	=	@birth_dtm;

		IF (@appointment_year IS NOT NULL)
		BEGIN
			IF (@appointment_year < @earliest_yoa)
				SET @ret_str =  @ret_str + 'YOA is too early for '  +'[' + @photo_id +']' + CHAR (13)
			IF (@appointment_year > YEAR (GetDate()))
				SET @ret_str =  @ret_str + 'YOA cannot be in future for '  +'[' + @photo_id +']' + CHAR (13)
		END

--		print 'iteration over ' + '[' + @photo_id +'] with Name as ' + @first_nm + ' ' + @middle_nm + ' ' + @last_nm + ' ' + CONVERT (VARCHAR, @birth_dtm, 106) + ' ' + @db_gender
		
		IF (LEN(@ret_str) > 7000)
		BEGIN
			CLOSE crsr
			DEALLOCATE crsr
			RETURN;
		END

		FETCH crsr INTO @oname, @name, @gender, @is_local_sewadar, @photo_id,  @department_nm, @sub_department_nm, @telephone_mobile, @birth_dtm, @occupation, @appointment_year,
						@dept_id, @dept_eff_frm_dt, @dept_eff_tll_dt, @sub_dept_id, @sub_dept_eff_frm_dt, @sub_dept_eff_tll_dt,

						@is_married, @is_initiated, @initiated_on, @initiated_by, @initiation_place,
						@address_line_1, @address_line_2, @country_nm, @state_nm, @district_nm, @post_office_nm, @pin_or_zip_code, @telephone_residence, @telephone_office,
						@skill, @qualification, @qualification_subject, @attends_weekly_satsang, @weekly_satsang_centre,
						@address_proof, @other_address_proof, @has_hypertension, @is_diabetic, @has_skin_problem, @has_epillepsy, @medical_disability,
						@reference_1_centre, @reference_1_grno, @reference_1_nm, @reference_1_relation, @reference_1_department,
						@reference_2_centre, @reference_2_grno, @reference_2_nm, @reference_2_relation, @reference_2_department,
						@sponsorer_centre, @sponsorer_grno, @security_centre, @security_grno, @area_secretary_centre, @secretary_centre,

						@initiated_by_id, @initiation_place_id,
						@country_id, @state_id, @district_or_city_id, @post_office_or_city_id,
						@weekly_satsang_centre_id, @address_proof_id, @other_address_proof_id,
						@skill_id, @qualification_id, @qualification_subject_id, @qqs_dtm, @medical_disability_id,

						@reference_1_sewadar_id, @reference_1_first_nm, @reference_1_global_status_cd, @reference_1_status_cd,
						@reference_1_centre_id, @reference_1_relation_id, @reference_1_dept_id, @reference_1_dept_eff_from,

						@reference_2_sewadar_id, @reference_2_first_nm, @reference_2_global_status_cd, @reference_2_status_cd,
						@reference_2_centre_id, @reference_2_relation_id, @reference_2_dept_id, @reference_2_dept_eff_from,

						@sponsorer_sewadar_id, @sponsorer_global_status_cd, @sponsorer_status_cd,
						@security_sewadar_id, @security_global_status_cd, @security_status_cd,

						@area_secretary_centre_id, @area_secretary_id, @secretary_centre_id, @secretary_id;
	END 
	CLOSE crsr
	DEALLOCATE crsr

	UPDATE	tmp_bulk_registrations
		SET	initiated_on		=	NULL,
			initiated_by_id		=	NULL,
			initiation_place_id	=	NULL
	WHERE	is_initiated	=	'Y'
	AND	(	initiated_on		IS	NULL
		OR	initiated_by_id		IS	NULL
		OR	initiation_place_id	IS	NULL
		);

	UPDATE	tmp_bulk_registrations
		SET	attends_weekly_satsang		=	'N',
			weekly_satsang_centre_id	=	NULL
	WHERE	attends_weekly_satsang		=	'Y'
	AND		weekly_satsang_centre_id	IS	NULL;

	UPDATE	tmp_bulk_registrations
		SET	reference_1_sewadar_id	=	NULL,
			reference_1_nm			=	NULL,
			reference_1_centre_id	=	NULL,
			reference_1_department	=	NULL
	WHERE	reference_1_relation_id	IS	NULL;

	UPDATE	tmp_bulk_registrations
		SET	reference_1_nm			=	NULL,
			reference_1_centre_id	=	NULL,
			reference_1_department	=	NULL
	WHERE	reference_1_relation_id	IS	NOT	NULL
	AND		reference_1_sewadar_id	IS 	NOT	NULL;

	UPDATE	tmp_bulk_registrations
		SET	reference_1_nm			=	NULL,
			reference_1_centre_id	=	NULL,
			reference_1_department	=	NULL
	WHERE	reference_1_relation_id	IS	NOT	NULL
	AND		reference_1_sewadar_id	IS 	NULL
	AND	(	reference_1_nm			IS	NULL
		OR	reference_1_centre_id	IS	NULL
		OR	reference_1_department	IS	NULL
		);

	UPDATE	tmp_bulk_registrations
		SET	reference_2_sewadar_id	=	NULL,
			reference_2_nm			=	NULL,
			reference_2_centre_id	=	NULL,
			reference_2_department	=	NULL
	WHERE	reference_2_relation_id	IS	NULL;

	UPDATE	tmp_bulk_registrations
		SET	reference_2_nm			=	NULL,
			reference_2_centre_id	=	NULL,
			reference_2_department	=	NULL
	WHERE	reference_2_relation_id	IS	NOT	NULL
	AND		reference_2_sewadar_id	IS 	NOT	NULL;

	UPDATE	tmp_bulk_registrations
		SET	reference_2_nm			=	NULL,
			reference_2_centre_id	=	NULL,
			reference_2_department	=	NULL
	WHERE	reference_2_relation_id	IS	NOT	NULL
	AND		reference_2_sewadar_id	IS 	NULL
	AND	(	reference_2_nm			IS	NULL
		OR	reference_2_centre_id	IS	NULL
		OR	reference_2_department	IS	NULL
		);

	UPDATE	tmp_bulk_registrations
		SET	secretary_id		=	NULL,
			area_secretary_id	=	NULL
	WHERE	is_local_sewadar	=	'Y';

	UPDATE	tmp_bulk_registrations
		SET	sponsorer_sewadar_id	=	NULL
	WHERE	is_local_sewadar	=	'N';
END
GO

-- =============================================================================
-- Procedure QueryPhotoIdsBulkRegister
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'QueryPhotoIdsBulkRegister' AND xtype = 'P')
	DROP PROCEDURE QueryPhotoIdsBulkRegister
GO

CREATE PROCEDURE QueryPhotoIdsBulkRegister
WITH ENCRYPTION
AS
BEGIN
	SELECT  m.photo_id, m.first_nm, m.sewadar_id
	FROM     tmp_bulk_registrations m
	ORDER BY m.photo_id;
END

GO

-- =============================================================================
-- Procedure BulkSewadarsRegister
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'BulkSewadarsRegister' AND xtype = 'P')
	DROP PROCEDURE BulkSewadarsRegister
GO

CREATE PROCEDURE BulkSewadarsRegister
(
	@satsang_centre_nm			gnc_nm,
	@satsang_centre_id			satsang_centre_id,
	@sewa_samiti_approver_id	sewadar_id,
	@photo_dt					SMALLDATETIME
)
WITH ENCRYPTION
AS
	DECLARE
		@name						VARCHAR(100),
		@gender						CHAR,
		@is_local_sewadar			CHAR,
		@photo_id					VARCHAR(20),
		@telephone_mobile			telephone_lines,
		@birth_dtm					SMALLDATETIME,
		@occupation					gnc_nm,
		@appointment_year			INT,
		@old_grno					VARCHAR (10),
		@first_nm					name_part,
		@middle_nm					name_part,
		@last_nm					name_part,
		@position1					INT,
		@position2					INT,
		@dept_id					INT,
		@sub_dept_id				INT,
		@sewadar_id					sewadar_id,
		@sewadar_list_id			sewadar_list_id,
		@db_gender					VARCHAR (6),
		@is_outstation_sewadar		VARCHAR (3),
		@sewadar_grno               sewadar_grno,
		@rval						INT,
		@status						VARCHAR(30),
		@app_dt						DATETIME,

		@is_married					CHAR (1),
		@is_initiated				CHAR (1),
		@initiated_on				DATE,
		@initiated_by_id			TINYINT,
		@initiation_place_id		SMALLINT,
								
		@address_line_1				VARCHAR (50),
		@address_line_2				VARCHAR (50),
		@post_office_or_city_id		INTEGER	,
		@pin_or_zip_code			VARCHAR (6),
		@telephone_residence		VARCHAR (50),
		@telephone_office			VARCHAR (50),
								
		@attends_weekly_satsang		CHAR (1),
		@weekly_satsang_centre_id	INTEGER,
								
		@address_proof				VARCHAR (15),
		@other_address_proof_id		SMALLINT,
		@has_hypertension			CHAR (1),
		@is_diabetic				CHAR (1),
		@has_skin_problem			CHAR (1),
		@has_epillepsy				CHAR (1),

		@skill_id					SMALLINT,
		@qualification_id			SMALLINT,
		@qualification_subject_id	SMALLINT,
		@medical_disability_id		SMALLINT,
								
		@reference_1_sewadar_id		INTEGER,
		@reference_1_relation_id	SMALLINT,
		@reference_1_nm				VARCHAR (40),
		@reference_1_centre_id		INTEGER,
		@reference_1_department		varchar (30),
								
		@reference_2_sewadar_id		INTEGER,
		@reference_2_relation_id	SMALLINT,
		@reference_2_nm				VARCHAR (40),
		@reference_2_centre_id		INTEGER,
		@reference_2_department		varchar (30),
								
		@sponsorer_sewadar_id		INTEGER,
		@security_sewadar_id		INTEGER,

		@area_secretary_id			SMALLINT,
		@secretary_id				SMALLINT;

BEGIN
	INSERT INTO generic_sewadar_lists
			(	satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use	)
		VALUES
			(	@satsang_centre_id, @satsang_centre_nm + ' Sewadars Registered on ' + CONVERT (VARCHAR (12), GetDate(), 106) + ' at ' + CONVERT (VARCHAR (12), GetDate(), 8), 
				'Miscellaneous', 'Bulk Sewadar Registration'
			)
	SET @sewadar_list_id = SCOPE_IDENTITY();

	DECLARE crsr CURSOR FOR
		SELECT	name, RTRIM (LTRIM (gender)), RTRIM (LTRIM (is_local_sewadar)),
				RTRIM (LTRIM (photo_id)), RTRIM (LTRIM (telephone_mobile)), birth_dtm, LTRIM (RTRIM (occupation)), LTRIM (RTRIM (old_grno)), appointment_year,
				first_nm, middle_nm, last_nm, department_id, sub_department_id,
				is_married, is_initiated, initiated_on, initiated_by_id, initiation_place_id,
				address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code, telephone_residence, telephone_office,
				attends_weekly_satsang, weekly_satsang_centre_id, skill_id, qualification_id, qualification_subject_id,
				address_proof, other_address_proof_id, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy, medical_disability_id,
				reference_1_sewadar_id, reference_1_relation_id, reference_1_nm, reference_1_centre_id, reference_1_department,
				reference_2_sewadar_id, reference_2_relation_id, reference_2_nm, reference_2_centre_id, reference_2_department,
				sponsorer_sewadar_id, security_sewadar_id, area_secretary_id, secretary_id
		FROM    tmp_bulk_registrations
		ORDER BY photo_id;

	OPEN crsr
	FETCH crsr INTO @name, @gender, @is_local_sewadar, @photo_id, @telephone_mobile, @birth_dtm, @occupation, @old_grno, @appointment_year,
					@first_nm, @middle_nm, @last_nm, @dept_id, @sub_dept_id,
					@is_married, @is_initiated, @initiated_on, @initiated_by_id, @initiation_place_id,
					@address_line_1, @address_line_2, @post_office_or_city_id, @pin_or_zip_code, @telephone_residence, @telephone_office,
					@attends_weekly_satsang, @weekly_satsang_centre_id, @skill_id, @qualification_id, @qualification_subject_id,
					@address_proof, @other_address_proof_id, @has_hypertension, @is_diabetic, @has_skin_problem, @has_epillepsy, @medical_disability_id,
					@reference_1_sewadar_id, @reference_1_relation_id, @reference_1_nm, @reference_1_centre_id, @reference_1_department,
					@reference_2_sewadar_id, @reference_2_relation_id, @reference_2_nm, @reference_2_centre_id, @reference_2_department,
					@sponsorer_sewadar_id, @security_sewadar_id, @area_secretary_id, @secretary_id;
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		IF (@is_local_sewadar = 'Y')
			SET @is_outstation_sewadar = 'No';
		ELSE
			SET @is_outstation_sewadar = 'Yes';

		IF (@gender = 'G')
			SET @db_gender = 'Male';
		ELSE
			SET @db_gender = 'Female';

		SET @status = 'Temp';

--		print 'iterating over ' + '[' + @photo_id +']'
--		print 'iterating over ' + '[' + @photo_id +'] with Name as ' + @first_nm + ' ' + @middle_nm + ' ' + @last_nm
		INSERT INTO sewadars 
				(	first_nm, middle_nm, last_nm, gender, birth_dtm, is_married, initiation_dt, initiation_place_id, initiation_by	)
			VALUES
				(	@first_nm, @middle_nm, @last_nm, @db_gender, @birth_dtm, CASE @is_married WHEN 'Y' THEN 'Yes' WHEN 'N' THEN 'No' END, @initiated_on, @initiation_place_id, @initiated_by_id	);

		SET @sewadar_id = SCOPE_IDENTITY();
		
		INSERT INTO sewadars_details
				(	sewadar_id, telephone_mobile, occupation, address_proof, other_address_proof_id, telephone_residence, telephone_office,
					attends_weekly_satsang, weekly_satsang_centre_id,
					has_hypertension, is_diabetic, has_skin_problem, has_epillepsy
				)
			VALUES
				(	@sewadar_id, @telephone_mobile, @occupation, @address_proof, @other_address_proof_id, @telephone_residence, @telephone_office,
					CASE @attends_weekly_satsang	WHEN 'Y' THEN 'Yes' WHEN 'N' THEN 'No' END, @weekly_satsang_centre_id,
					CASE @has_hypertension	WHEN 'Y' THEN 'Yes' WHEN 'N' THEN 'No' END,
					CASE @is_diabetic		WHEN 'Y' THEN 'Yes' WHEN 'N' THEN 'No' END,
					CASE @has_skin_problem	WHEN 'Y' THEN 'Yes' WHEN 'N' THEN 'No' END,
					CASE @has_epillepsy		WHEN 'Y' THEN 'Yes' WHEN 'N' THEN 'No' END
				)
		IF (@post_office_or_city_id IS NOT NULL)
		BEGIN
			INSERT INTO	sewadars_addresses
					(	sewadar_id, address_type, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code	)
				VALUES
					(	@sewadar_id, 'Residence', @address_line_1, @address_line_2, @post_office_or_city_id, @pin_or_zip_code	);
		END

		IF (@qualification_id IS NOT NULL)
			INSERT INTO	sewadars_qualifications
					(	sewadar_id, qualification_sq, qualification_id, qlfctn_subject_id	)
				VALUES
					(	@sewadar_id, 1, @qualification_id, @qualification_subject_id	);

		IF (@medical_disability_id IS NOT NULL)
			INSERT INTO	sewadars_other_disabilities
					(	sewadar_id, medical_disability_sq, medical_disability_id	)
				VALUES
					(	@sewadar_id, 1, @medical_disability_id	);
		
		IF (@skill_id IS NOT NULL)
			INSERT INTO	sewadars_skills
					(	sewadar_id, skill_sq, skill_id	)
				VALUES
					(	@sewadar_id, 1, @skill_id	);
		
		INSERT INTO sewadars_remarks
				(	sewadar_id, remarks_type, remarks_sq, remarks	)
			VALUES
				(	@sewadar_id, 'Reference', 1, @photo_id	);

		IF (@old_grno IS NOT NULL AND @old_grno <> '')
			INSERT INTO sewadars_remarks
					(	sewadar_id, remarks_type, remarks_sq, remarks	)
				VALUES
					(	@sewadar_id, 'Old G.R.No.', 1, @old_grno	);

		EXEC	@rval = GetSewadarRegistrationNumber	@satsang_centre_id,      -- Should be Indore and if part of application, should be the one that is passed as a Parameter to the Application
														@db_gender,              -- Values allowed are Male or Female
														@is_outstation_sewadar,  -- Values allowed are Yes or No
														@sewadar_grno OUTPUT
		IF (@rval != 0)
		BEGIN
			CLOSE crsr
			DEALLOCATE crsr
			RETURN @rval;
		END
										
		INSERT INTO sewadars_registrations
				(	satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar,
					department_id, sub_department_id, department_dt, sewadar_status_cd, sewadar_status_dtm,
					reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id, reference_1_department,
					reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department,
					sponsorer_id, area_secretary_id, secretary_id, security_approver_id,
					sewadar_type, sewa_samiti_approver_id
				) 
			VALUES
				(	@satsang_centre_id, @sewadar_grno, @sewadar_id, CASE WHEN @appointment_year IS NOT NULL THEN '01-Jan-' + CONVERT (VARCHAR, @appointment_year) ELSE @photo_dt END, @is_outstation_sewadar,
					@dept_id, @sub_dept_id, @photo_dt, @status, @photo_dt,
					@reference_1_sewadar_id, @reference_1_relation_id, @reference_1_nm, @reference_1_centre_id, @reference_1_department,
					@reference_2_sewadar_id, @reference_2_relation_id, @reference_2_nm, @reference_2_centre_id, @reference_2_department,
					@sponsorer_sewadar_id, @area_secretary_id, @secretary_id, @security_sewadar_id,
					'R', @sewa_samiti_approver_id
				)
		
		INSERT INTO generic_sewadar_lists_sewadars VALUES (@sewadar_list_id, @satsang_centre_id, @sewadar_grno);
		
		UPDATE tmp_bulk_registrations
			SET sewadar_id  = @sewadar_id
		WHERE	name	=	@name
		AND		gender	=	@gender
		AND		birth_dtm	=	@birth_dtm;

		FETCH crsr INTO @name, @gender, @is_local_sewadar, @photo_id, @telephone_mobile, @birth_dtm, @occupation, @old_grno, @appointment_year,
						@first_nm, @middle_nm, @last_nm, @dept_id, @sub_dept_id,
						@is_married, @is_initiated, @initiated_on, @initiated_by_id, @initiation_place_id,
						@address_line_1, @address_line_2, @post_office_or_city_id, @pin_or_zip_code, @telephone_residence, @telephone_office,
						@attends_weekly_satsang, @weekly_satsang_centre_id, @skill_id, @qualification_id, @qualification_subject_id,
						@address_proof, @other_address_proof_id, @has_hypertension, @is_diabetic, @has_skin_problem, @has_epillepsy, @medical_disability_id,
						@reference_1_sewadar_id, @reference_1_relation_id, @reference_1_nm, @reference_1_centre_id, @reference_1_department,
						@reference_2_sewadar_id, @reference_2_relation_id, @reference_2_nm, @reference_2_centre_id, @reference_2_department,
						@sponsorer_sewadar_id, @security_sewadar_id, @area_secretary_id, @secretary_id;
	END
	CLOSE crsr
	DEALLOCATE crsr
END
GO


-- =============================================================================
--	Procedure	GetGRNoBySewadarIdSatsangCentre
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='GetGRNoBySewadarIdSatsangCentre'
			)
BEGIN
	DROP PROCEDURE  GetGRNoBySewadarIdSatsangCentre
END
GO


CREATE PROCEDURE GetGRNoBySewadarIdSatsangCentre
(
	@sewadar_grno		sewadar_grno,
	@satsang_centre_id	satsang_centre_id
)
AS
BEGIN
	SELECT sewadar_id FROM sewadars
	WHERE current_sewadar_grno = @sewadar_grno AND current_satsang_centre_id = @satsang_centre_id
END
GO

-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console
