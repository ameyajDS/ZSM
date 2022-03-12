/* ==================================================================================
    Source File		:	schema_centres.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sun Nov 27 21:39 IST 2010
    Version			:	1.12
    Last updated	:	Nov 16, 2016
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------
		Common suffixes used:
				id	Identifier
				cd	Code
				nm	Name
				dt	Date
				dtm	Date and Time
		Recommendations:
		*   Any piece of information (as far as possible, and unless stated otherwise)
			should be stored in mixed case and NOT in upper case. This stems from the
			fact that graphical outputs occupy lesser width for lower-case alphabets
			thereby permitting to print more amount of information in same width.
    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	JL : v1.12 : 16-Nov-2016
		* Tables sewas_fp_controlling_dates, scanned_fingerprints, and scanned_fingerprints_store added.
	JL : v1.11 : 29-Oct-2014
		* Check constraint ScanningJobsControllingDates_CK_ControllingDate has been added to table scanning_jobs_controlling_dates.
	JL : v1.10 : 30-Sep-2014
		* Columns is_for_export, exported_dtm and programme_satsang_centre_id added to table generic_sewadar_lists
		  along with a couple of check constraints.
	JL : v1.09 : 24-Sep-2013
		* Column appointment_year added in table tmp_bulk_registrations.
	JL : v1.08 : 17-Sep-2013
		* Column old_grno added in table tmp_bulk_registrations.
	JL/MS : v1.07 : 13-Mar-2013
	 	* Dropped unique constraint from tmp_bulk_registrations.
	JL/MS : v1.06 : 13-Mar-2013
	 	* Updated gender column type to CHAR (1) in tmp_bulk_registrations.
	 JL : v1.05 : 9-Mar-2013
	 	* Table tmp_bulk_registrations added.
	 JL : v1.04 : 9-Jan-2013
	 	* Check Constraint ScanningJobs_CK_IsConcluded_IsClosed_SewadarListId in table scanning_jobs so as to ignore
		  Sewadar List ID when the Scanning Job is concluded. Earlier to this, it should not have been there.
	 JL : v1.03 : 7, 8-Jan-2013
	 	* Table scanned_badges_store added to store scanned_badges data for posterity, on case to case basis.
	 JL : v1.02 : 22-Dec-2011
	    * Script name renamed from schema_scanning to schema_centres.
	 	* Table definition for scanning_job_types moved to schema_setup script.
		* Table definitions for generic_sewadar_lists and generic_sewadar_lists_sewadars moved from schema script.
	 JL : v1.01 : 07-Oct-2011
	 	* Datatype of Column total_processed_cnt of table scanning_jobs changed from SMALLINT to INTEGER.
     JL : 27-28-Nov-2010
		*   Initial versions
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- Tables that manage lists of Sewadars in a generic way.
--	The data in these tables is initially created using the generic reports.
--	All operations including actions are audited.
-- =============================================================================

CREATE	TABLE	generic_sewadar_lists
(
	sewadar_list_id					sewadar_list_id			NOT NULL	IDENTITY (1,1)
																		CONSTRAINT	GenericSewadarLists_PK_SewadarListID
																			PRIMARY KEY	NONCLUSTERED,

		--- Trigger ensures that the satsang_centre_id has is_main_centre set to Yes(Trigger a)
		--- LATER: Front-end application ensures that the satsang_centre_id matches with the Satsang Centre passed as the parameter to the application for creation of the list
	satsang_centre_id 				satsang_centre_id		NOT NULL	CONSTRAINT	GenericSewadarLists_FK_SatsangCentreID
																			REFERENCES	satsang_centres_details,
	sewadar_list_nm					gnc_long_nm				NOT NULL,

		--- This indicates as to how the list is being used or is intended to be used.
	sewadar_list_use				sewadar_list_use			NULL 	CONSTRAINT	GenericSewadarLists_FK_SewadarListUse
																			REFERENCES	sewadar_list_uses,
	sewadar_list_other_use			sewadar_list_use			NULL,

		--- It indicates whether the Sewadars from other Centres can be added / deleted
	other_satsang_centre_sewadars	Boolean					NOT NULL	CONSTRAINT	GenericSewadarLists_DF_OtherSatsangCentreSewadars
																			DEFAULT	'No',

		--- It indicates whether the Sewadar list is managed by the Current Satsang Centre or any other Centre
	is_other_satsang_centre			Boolean					NOT NULL	CONSTRAINT	GenericSewadarLists_DF_IsDifferentSatsangCentre
																			DEFAULT	'No',
		--- It indicates whether the adding / deleting of Sewadars is allowed from the screen
	is_editing_allowed				Boolean					NOT NULL	CONSTRAINT	GenericSewadarLists_DF_IsEditingAllowed
																			DEFAULT	'No',
		--- It indicates whether the List is to be exported to Zonal Office
	is_for_export					Boolean					NOT NULL	CONSTRAINT	GenericSewadarLists_DF_IsForExport
																			DEFAULT	'No',
		--- This is the date and time when the list is exported from a Centre to Zonal Office.
		---	At Zonal Office, this indicates the date and time when it is exported to Programme Centre, if Programme Centre has been specified.
	exported_dtm					DATETIME					NULL,

	programme_satsang_centre_id 	satsang_centre_id			NULL	CONSTRAINT	GenericSewadarLists_FK_ProgrammeSatsangCentreID
																			REFERENCES	satsang_centres_details,

	remarks							remarks						NULL,

		--- Following columns are not editable
		----	There may be referential integrity violations for the list being used in unconcluded scanning jobs, which is benign.
		----	Such lists will be deleted as part of conclusion of scanning job.
	generated_dtm					SMALLDATETIME				NULL,

	report_nm						report_nm					NULL,			--- REFERENCES	generic_reports, but foreign key not maintained to allow for reports data being re-loaded.
	session_id						report_session_id			NULL,			--- REFERENCES	generic_report_headers, but foreign key not maintained to allow for generic reports to be deleted.

	txn_ts							TIMESTAMP				NOT NULL,

		CONSTRAINT	GenericSewadarLists_UK_SatsangCentreID_SewadarListNm
			UNIQUE	NONCLUSTERED	(	satsang_centre_id, sewadar_list_nm	),

		CONSTRAINT	GenericSewadarLists_CK_GeneratedDtm_ReportNm_SessionID
			CHECK	(	(	generated_dtm	IS NOT NULL		AND	report_nm	IS NOT NULL		AND	session_id	IS NOT NULL	)
					OR	(	generated_dtm	IS NULL			AND	report_nm	IS NULL			AND	session_id	IS NULL		)
					),

		CONSTRAINT	GenericSewadarLists_CK_ExportedDateTime_IsEditingAllowed
			CHECK	(	(	exported_dtm	IS NOT NULL		AND	is_editing_allowed	=	'No'	)
					OR	(	exported_dtm	IS NULL												)
					),

		CONSTRAINT	GenericSewadarLists_CK_IsForExport_ExportedDateTime
			CHECK	(	(	is_for_export	=	'No'	AND	exported_dtm	IS NULL	)
					OR	(	is_for_export	=	'Yes'								)
					),

		CONSTRAINT	GenericSewadarLists_CK_IsForExport_ProgrammeSatsangCentreID
			CHECK	(	(	is_for_export	=	'No'	AND	programme_satsang_centre_id	IS NULL	)
					OR	(	is_for_export	=	'Yes'								)
					)
)
GO

-- =============================================================================

CREATE	TABLE	generic_sewadar_lists_sewadars
(
	sewadar_list_id				sewadar_list_id			NOT NULL	CONSTRAINT	GenericSewadarListsSewadars_FK_SewadarListID
																		REFERENCES	generic_sewadar_lists,

		--- LATER: Trigger ensures that the satsang_centre_id is same as that of generic_sewadar_lists when is_other_satsang_centre is No
	satsang_centre_id 			satsang_centre_id		NOT NULL,
	sewadar_grno				sewadar_grno			NOT NULL,

		CONSTRAINT	GenericSewadarListsSewadars_PK_SewadarListID_SatsangCentreID_SewadarGRNo
			PRIMARY KEY	NONCLUSTERED	(	sewadar_list_id, satsang_centre_id, sewadar_grno 	),

		CONSTRAINT	GenericSewadarListsSewadars_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================
--	Tables for managing information of Scanning Activities
--	Trigger ensures that for multiple Scanning Jobs for same Sewa, effective_till_dt should be same(Trigger a)
--	Trigger (DML) sets INSERTS a records in scanning_sub_jobs when has_sub_jobs is No(Trigger DML a)
-- =============================================================================

CREATE	TABLE	scanning_jobs
(
	scanning_job_id			scanning_job_id			NOT NULL	IDENTITY (1, 1)
																CONSTRAINT	ScanningJobs_PK_ScanningJobID
																	PRIMARY KEY	NONCLUSTERED,

		--- LATER: Front-end screen ensures that current_satsang_centre_id is same as that passed as parameter to application.
	satsang_centre_id 		satsang_centre_id		NOT NULL	CONSTRAINT	ScanningJobs_FK_SatsangCentreID
																	REFERENCES	satsang_centres_details,

	scanning_job_nm			gnc_nm					NOT NULL,

	scanning_job_type_cd 	scanning_job_type_cd	NOT NULL	CONSTRAINT	ScanningJobs_FK_ScanningJobTypeCd
																	REFERENCES	scanning_job_types,
	remarks					remarks					NULL,

	effective_from			DATETIME			NOT NULL,
	effective_till			DATETIME			NOT NULL,

		--- This list specifies the sewadars for which scanning will be allowed.
		--- On closure, the list of sewadars must be deleted.
	sewadar_list_id			sewadar_list_id			NULL	CONSTRAINT	ScanningJobs_FK_SewadarListID
																REFERENCES	generic_sewadar_lists,

		--- If the scanning job is associated with a Sewa, it is specified here.
	sewa_id					sewa_id					NULL	CONSTRAINT	ScanningJobs_FK_SewaID
																REFERENCES	sewas,

		--- Trigger ensures that if deleting is not allowed, the scanned badges can NOT be deleted from table scanned_badges.(Trigger f in scanned_badges)
	is_deleting_allowed		Boolean					NOT NULL,

		--- If specified, the status specified by this system information code are only allowed for scanning.
	status_system_info_cd	system_info_cd			NULL	CONSTRAINT	ScanningJobs_FK_StatusSystemInfoCd
																REFERENCES	system_information_codes,
		
		---- This is the last Date and Time till which the scanned data has been processed using procedure_nm
		---- For date-wise controlled scanning jobs, total_processed_cnt is summation for all dates that have been processed
		---- These two columns are managed by the procedure that processes the scanned_badges (including table scanning_jobs_controlling_dates)
	last_transfer_dtm		DATETIME				NULL,
	total_processed_cnt		INTEGER					NULL,

		--	This is set by front-end screen to closed or suspend scanning for a job, and can be unset to resume (if the job is not yet concluded).
		--- The procedure that closes a job sets scanning_jobs_controlling_dates.is_closed also, but does NOT unset.
	is_closed				Boolean				NOT NULL	CONSTRAINT	ScanningJobs_DF_IsClosed
																DEFAULT	'No',

		--- This indicates the final conclusion of the job, which indicates the following:
		--		1. It is complete and no action can now be initiated; a closed job may be re-opened, but not the concluded job.
		--		2. The sewadars list (including sewadars from the list) are deleted.
		--		3. All scanned job's data (scannings) is also deleted (which is usually deleted with each processing).
		--		4. This can NOT be managed by the front-end screen; a concluding stored procedure should set it (the job must be closed).
	is_concluded			Boolean				NOT NULL	CONSTRAINT	ScanningJobs_DF_IsConcluded
																DEFAULT	'No',

	txn_ts					TIMESTAMP			NOT NULL,

		CONSTRAINT	ScanningJobs_UK_SatsangCentreID_ScanningJobNm
			UNIQUE	NONCLUSTERED	(	satsang_centre_id, scanning_job_nm	),

		CONSTRAINT	ScanningJobs_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'ScanningJobs_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'scanning_jobs'
GO

EXEC 	sp_addextendedproperty
		'ScanningJobs_CK_IsClosed_LastTransferDtm_TotalProcessedCnt', 'Scanning Job can NOT be opened when Processing has been done',
		'USER',	'dbo', 'TABLE',	'scanning_jobs'
GO

-- =============================================================================
--	Periods of Scanning Jobs
-- =============================================================================

CREATE TABLE 	scanning_jobs_periods
(
	scanning_job_id 		scanning_job_id		NOT NULL	CONSTRAINT	ScanningJobsPeriods_FK_ScanningJobID
																REFERENCES	scanning_jobs,
	effective_from			DATETIME 			NOT NULL,
	effective_till			DATETIME			NOT NULL,
	--	Trigger ensures that effective_from/effective_till is with in scanning_jobs effective_from/ effective_till date(Trigger a)
	--	Trigger ensures that effective_from/effective_till is with in sewas start/finish date(Trigger b)
	--	Trigger ensures that effective_from/effective_till is with in sewas_periods range, if sewas_periods exist for the sewa(Trigger c)
	--	Trigger ensures that periods for a scanning-job are non-overlapping(Trigger d)
	

		CONSTRAINT	ScanningJobsPeriods_PK_ScanningJobId_EffectiveFrom
			PRIMARY KEY	NONCLUSTERED	(	scanning_job_id, effective_from	),

		CONSTRAINT	ScanningJobsPeriods_CK_EffectiveFrom_EffectiveTill
			CHECK	(	effective_from <= effective_till	)
)
GO

-- =============================================================================
--	Sub-jobs of Scanning; it has always records. There is only one record (INSERTed/UPDATEd through
--	trigger(DML) - [LATER]) when has_sub_jobs = No. Therefore, the front-end screen should never operate on
--	this table directly when has_sub_jobs = No.
-- =============================================================================

CREATE TABLE 	scanning_sub_jobs
(
	scanning_sub_job_id		scanning_job_id		NOT NULL	IDENTITY (1, 1)
															CONSTRAINT	ScanningSubJobs_PK_ScanningSubJobID
																PRIMARY KEY	NONCLUSTERED,

	scanning_job_id 		scanning_job_id		NOT NULL	CONSTRAINT	ScanningSubJobs_FK_ScanningJobID
																REFERENCES	scanning_jobs,
	scanning_sub_job_nm		gnc_nm				NOT NULL,
	scanning_sub_job_sq		display_order		NOT NULL,

		CONSTRAINT	ScanningSubJobs_U1_ScanningJobId_ScanningSubJobNm
			UNIQUE	NONCLUSTERED	(	scanning_job_id, scanning_sub_job_nm	),

		CONSTRAINT	ScanningSubJobs_U2_ScanningJobId_ScanningSubJobSq
			UNIQUE	NONCLUSTERED	(	scanning_job_id, scanning_sub_job_sq	)
)
GO


-- =============================================================================
--	This table records the action to be performed in such cases when a sub-job is already recorded and a
--	another sub-job is being recorded.
--	Trigger ensures that	recorded_sub_job_id and recording_sub_job_id belong to same scanning_job_id(Trigger a)
--	An absence of entry in this table should result in an error. For example, even for jobs that do not have sub-jobs
--	should have an entry in this if multiple scans are to be allowed (with action as "No Action").
-- =============================================================================

CREATE TABLE 	scanning_sub_jobs_validations
(
	recorded_sub_job_id		scanning_job_id				NOT NULL	CONSTRAINT	ScanningSubJobsValidations_FK_RecordedSubJobID
																		REFERENCES	scanning_sub_jobs,
	recording_sub_job_id	scanning_job_id				NOT NULL	CONSTRAINT	ScanningSubJobsValidations_FK_RecordingSubJobID
																		REFERENCES	scanning_sub_jobs,
	validating_action		scanning_validating_action	NOT NULL	CONSTRAINT	ScanningSubJobsValidations_FK_ValidatingAction
																		REFERENCES	scanning_validating_actions,

		CONSTRAINT	ScanningSubJobsValidations_PK_ScanningJobId_ScanningSubJobNm
			PRIMARY KEY	NONCLUSTERED	(	recorded_sub_job_id, recording_sub_job_id	)
)
GO


-- =============================================================================

CREATE TABLE 	scanning_sub_jobs_valid_combinations
(
	scanning_job_id 				scanning_job_id		NOT NULL	CONSTRAINT	ScanningSubJobsValidCombinations_FK_ScanningJobID
																		REFERENCES	scanning_jobs,
	scanning_job_valid_sq			display_order		NOT NULL,
	valid_combination_sub_job_ids	VARCHAR (35)		NOT NULL,

		CONSTRAINT	ScanningSubJobsValidCombinations_PK_ScanningSubJobId_ValidCombinationSubJobIDs
			PRIMARY KEY	NONCLUSTERED	(	scanning_job_id, valid_combination_sub_job_ids	),

		CONSTRAINT	ScanningSubJobsValidCombinations_UK_ScanningSubJobId_ScanningJobValidSq
			UNIQUE	NONCLUSTERED	(	scanning_job_id, scanning_job_valid_sq	)
)
GO


-- =============================================================================
--	This tables has information for controlling scanning jobs that have is_date_wise = Yes.
--	It has always records. There is only one record (INSERTed/UPDATEd through
--	trigger(DML) - [LATER] with controlling_dt as effective_from) when is_date_wise = No.
--	Therefore, the front-end screen should never operate on this table directly when is_date_wise = No.
-- =============================================================================

CREATE	TABLE	scanning_jobs_controlling_dates
(
	scanning_job_id 		scanning_job_id		NOT NULL	CONSTRAINT	ScanningJobsControllingDates_FK_ScanningJobID
																REFERENCES	scanning_jobs,

		---- Trigger ensures that INSERTing controlling_dt is > MAX (controlling_dt) for existing records.(Trigger a)
		--	Trigger ensures that contolling_dt is with in scanning_jobs__periods, if scanning_jobs_periods exist for the scanning_job(Trigger c)
		--	Trigger ensures that there can be no records (controlling_dt) for a scanning_job_id that has is_closed = Yes And LastTransferDTM as NULL(Trigger d)


	controlling_dt			SMALLDATETIME		NOT NULL	CONSTRAINT	ScanningJobsControllingDates_CK_ControllingDate
																CHECK	(	controlling_dt	<	GetDate ()),
	
		---- This is the last Date and Time till which the scanned data has been processed using procedure_nm
		---- This is required because there may be many dates for which the scanned records are not processed, and these are processed together, say, once in a week.
	last_transfer_dtm		DATETIME				NULL,
	total_processed_cnt		SMALLINT				NULL,

		---- Trigger ensures that there can be at most one record (controlling_dt) for a scanning_job_id that has is_closed = No(Trigger b)
		----	This can be set/unset by front-end screen to close or suspend and resume scanning; unsetting can be done only for the MAX (controlling_dt) for the job.
	is_closed				Boolean				NOT NULL	CONSTRAINT	ScanningJobsControllingDates_DF_IsClosed
																DEFAULT	'No',
	txn_ts					TIMESTAMP			NOT NULL,

		CONSTRAINT	ScanningJobsControllingDates_PK_ScanningJobID_ControllingDt
			PRIMARY KEY	NONCLUSTERED	(	scanning_job_id, controlling_dt	),

		CONSTRAINT	ScanningJobsControllingDates_CK_IsClosed_LastTransferDtm_TotalProcessedCnt
			CHECK	(	(	is_closed = 'No'	AND	last_transfer_dtm	IS NULL		AND	total_processed_cnt	IS NULL		)
					OR	(	is_closed = 'Yes'																			)
					)
)
GO

EXEC 	sp_addextendedproperty
		'ScanningJobsControllingDates_CK_IsClosed_LastTransferDtm_TotalProcessedCnt', 'Date for a Scanning Job can NOT be opened when Processing has been done',
		'USER',	'dbo', 'TABLE',	'scanning_jobs_controlling_dates'
GO


CREATE TABLE scanning_jobs_sewa_teams
(
	scanning_job_id		scanning_job_id		NOT NULL	CONSTRAINT	ScanningJobsSewaTeams_FK_ScanningJobID
															REFERENCES	scanning_jobs,
    satsang_centre_id	satsang_centre_id	NOT NULL	CONSTRAINT	ScanningJobsSewaTeams_FK_SatsangCentreID
															REFERENCES	satsang_centres_details,
	sewa_team_id		sewa_team_id		NOT NULL	CONSTRAINT	ScanningJobsSewaTeams_FK_SewaTeamID
															REFERENCES	sewa_teams,

		CONSTRAINT	ScanningJobsSewaTeams_PK_ScanningJobID_SatsangCentreID_SewaTeamID
			PRIMARY KEY	(	scanning_job_id, satsang_centre_id, sewa_team_id	)
)
GO

CREATE TABLE scanned_badge_file_audit_logs
(
	scanning_job_id			INT				NOT NULL,
	filepath				VARCHAR (MAX)	NOT NULL,
	controlling_dt			SMALLDATETIME	NOT NULL,		
	import_username			VARCHAR (100)	NOT NULL,
	process_dt				DATETIME			NULL,
	process_username		VARCHAR (100)		NULL
)
GO

-- =============================================================================
--	The actual information (records) are stored here which are managed using a Scanner.
---		NOTE. Manual editing of these records is NOT permitted in the system
--	Trigger ensures that if deleting is not allowed in (SCANNING_JOBS), the scanned badges can NOT be deleted from table SCANNED_BADGES.(Trigger f)
-- =============================================================================

CREATE	TABLE	scanned_badges
(
		--- Trigger ensures that is_closed in the Controlling Dates is No when record is INSERTed.(Trigger a)
		--- We are not allowing DELETEs to be checked in trigger whether is_closed is No; this is to allow DELETEs on conclusion.
	scanning_sub_job_id 	scanning_job_id		NOT NULL	CONSTRAINT	ScannedBadges_FK_ScanningSubJobID
																REFERENCES	scanning_sub_jobs,

		---	Trigger ensures that contolling_dt is with in scanning_jobs_periods, if scanning_jobs_periods exist for the scanning_job(Trigger g)
	controlling_dt			SMALLDATETIME		NOT	NULL,
	
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.(Trigger b)
		--- Another trigger ensures that satsang_centre_id, sewadar_grno exists in the generic_sewadar_lists_sewadars.(Trigger c)
		--- Another trigger ensures that if system information code is specified for status, the status of sewadar matches with that.(Trigger d)
		--- Another trigger ensures that if sewadar has global status defined, the record can NOT be manipulated (INSERTed or DELETEd).(Trigger e)
		--- We are NOT restricting scanning to badges of current centre to allow for other centres' sewadars also; this is controlled through Generic Sewadars List.
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,

		-- No need to set a value through stored proc
	scanned_dtm				DATETIME			NOT NULL	CONSTRAINT	ScannedBadges_DF_ScannedDtm
																DEFAULT	GETDATE(),

		CONSTRAINT	ScannedBadges_PK_ControllingDt_SatsangCentreID_SewadarGRNo_ScanningJobID
			PRIMARY KEY	NONCLUSTERED	(	controlling_dt, satsang_centre_id, sewadar_grno, scanning_sub_job_id 	),

		CONSTRAINT	ScannedBadges_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno 	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================
--	This is a replica of scanned_badges and records are preserved here for posterity, if required by the Processing Procedure.
--	Currently, the data in this table is not accessible through any screen(s) or report(s).
-- =============================================================================

CREATE	TABLE	scanned_badges_store
(
	scanning_sub_job_id 	scanning_job_id		NOT NULL	CONSTRAINT	ScannedBadgesStore_FK_ScanningSubJobID
																REFERENCES	scanning_sub_jobs,
	controlling_dt			SMALLDATETIME		NOT	NULL,
	
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,

	scanned_dtm				DATETIME			NOT NULL,
	
	remarks					VARCHAR(200)			NULL,

		CONSTRAINT	ScannedBadgesStore_PK_ControllingDt_SatsangCentreID_SewadarGRNo_ScanningJobID
			PRIMARY KEY	NONCLUSTERED	(	controlling_dt, satsang_centre_id, sewadar_grno, scanning_sub_job_id 	),

		CONSTRAINT	ScannedBadgesStore_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno 	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================
--	This table stores the temporary data for bulk registration of Sewadars for a Centre.
--	Since this table is expected to be used at Zone and the storage is temporary, the data
--	in this table is neither to be exported nor imported
-- =============================================================================

CREATE	TABLE	tmp_bulk_registrations
(
	name						VARCHAR (100)		NOT NULL,
	gender 						CHAR (1)			NOT NULL,
	is_local_sewadar			CHAR (1)			NOT NULL,
	photo_id					VARCHAR (20)		NOT NULL,
	department_nm				gnc_nm				NOT NULL,
	sub_department_nm			gnc_nm					NULL,
	telephone_mobile			telephone_lines			NULL,
    birth_dtm					SMALLDATETIME		NOT NULL,
	occupation					gnc_nm				NOT NULL,
	appointment_year			SMALLINT				NULL,
	old_grno					VARCHAR (10)			NULL,
                                
	is_married					CHAR (1)			NOT	NULL,
	is_initiated				CHAR (1)			NOT	NULL,
	initiated_on				DATE					NULL,
	initiated_by				VARCHAR (50)			NULL,
	initiation_place			VARCHAR (35)			NULL,
                                
	address_line_1				VARCHAR (50)		NOT	NULL,
	address_line_2				VARCHAR (50)			NULL,
	country_nm					VARCHAR (50)		NOT	NULL,
	state_nm					VARCHAR (50)		NOT	NULL,
	district_nm					VARCHAR (50)		NOT	NULL,
	post_office_nm				VARCHAR (30)		NOT	NULL,
	pin_or_zip_code				VARCHAR (6)				NULL,
	telephone_residence			VARCHAR (50)			NULL,
	telephone_office			VARCHAR (50)			NULL,
	skill						VARCHAR (20)			NULL,
	qualification				VARCHAR (35)			NULL,
	qualification_subject		VARCHAR (20)			NULL,
                                
	attends_weekly_satsang		CHAR (1)			NOT	NULL,
	weekly_satsang_centre		VARCHAR (40)			NULL,
                                
	address_proof				VARCHAR (15)			NULL,
	other_address_proof			VARCHAR (60)			NULL,
	has_hypertension			CHAR (1)				NULL,
	is_diabetic					CHAR (1)				NULL,
	has_skin_problem			CHAR (1)				NULL,
	has_epillepsy				CHAR (1)				NULL,
	medical_disability			VARCHAR (60)			NULL,
                                
	reference_1_centre			VARCHAR (40)			NULL,
	reference_1_grno			CHAR (6)				NULL,
	reference_1_nm				VARCHAR (40)			NULL,
	reference_1_relation		VARCHAR (20)			NULL,
	reference_1_department		varchar (30)			NULL,
                                
	reference_2_centre			VARCHAR (40)			NULL,
	reference_2_grno			CHAR (6)				NULL,
	reference_2_nm				VARCHAR (40)			NULL,
	reference_2_relation		VARCHAR (20)			NULL,
	reference_2_department		varchar (30)			NULL,
                                
	sponsorer_centre			VARCHAR (40)			NULL,
	sponsorer_grno				CHAR (6)				NULL,
	security_centre				VARCHAR (40)			NULL,
	security_grno				CHAR (6)				NULL,
                                
	area_secretary_centre		VARCHAR (40)			NULL,
	secretary_centre			VARCHAR (40)			NULL,
                                
	first_nm 					name_part				NULL,
	middle_nm 					name_part				NULL,
	last_nm 					name_part				NULL,
	department_id				department_id			NULL,
	sub_department_id			department_id			NULL,
	sewadar_id					sewadar_id				NULL,
                                
	initiated_by_id				TINYINT					NULL,
	initiation_place_id			SMALLINT				NULL,
	post_office_or_city_id		INTEGER					NULL,
	weekly_satsang_centre_id	INTEGER					NULL,
	other_address_proof_id		SMALLINT				NULL,

	skill_id					SMALLINT				NULL,
	qualification_id			SMALLINT				NULL,
	qualification_subject_id	SMALLINT				NULL,
	medical_disability_id		SMALLINT				NULL,

	reference_1_sewadar_id		INTEGER					NULL,
	reference_1_centre_id		INTEGER					NULL,
	reference_1_relation_id		SMALLINT				NULL,
	reference_2_sewadar_id		INTEGER					NULL,
	reference_2_centre_id		INTEGER					NULL,
	reference_2_relation_id		SMALLINT				NULL,

	sponsorer_sewadar_id		INTEGER					NULL,
	security_sewadar_id			INTEGER					NULL,

	area_secretary_id			SMALLINT				NULL,
	secretary_id				SMALLINT				NULL,

		CONSTRAINT	TmpBulkRegistrations_PK_NameGenderDOB
			PRIMARY KEY	NONCLUSTERED	(	name, gender, birth_dtm )
)
GO

--	====================================================================================================
--		Tables for Fingerprint Scanning
--	====================================================================================================
CREATE	TABLE	sewas_fp_controlling_dates
(
	controlling_id		INTEGER				NOT NULL	IDENTITY (1, 1)
														CONSTRAINT	SewasFPControllingDates_PK_ControllingID
															PRIMARY KEY	NONCLUSTERED,

		--- LATER: Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked
	sewa_id				sewa_id				NOT NULL	CONSTRAINT	SewasFPControllingDates_FK_SewaID
															REFERENCES	sewas,

	start_dt			DATE				NOT	NULL,
	end_dt				DATE				NOT	NULL,

	processing_dtm		DATETIME			NOT	NULL,

	shift_1_cnt			SMALLINT				NULL,		--- Half day ... 1st half
	shift_2_cnt			SMALLINT				NULL,		--- Full day
	shift_3_cnt			SMALLINT				NULL,		--- Half day ... 2nd half

		CONSTRAINT	SewasFPControllingDates_UK_SewaID_StartDate
			UNIQUE	CLUSTERED	(	sewa_id, start_dt	),

		CONSTRAINT	SewasFPControllingDates_FK_StartDate_EndDate
			CHECK	(	start_dt <= end_dt	)

)
GO

	------------------------------------------------------------------------------------------------------
	-- This table contains the erroneous records, which could not be processed.
	------------------------------------------------------------------------------------------------------

CREATE	TABLE	scanned_fingerprints
(
	controlling_id			INTEGER				NOT NULL	CONSTRAINT	ScannedFingerPrints_FK_ControllingID
																REFERENCES	sewas_fp_controlling_dates,

	sewadar_id				sewadar_id			NOT	NULL	CONSTRAINT	ScannedFingerPrints_FK_SewadarID
																REFERENCES	sewadars,
	scanned_dtm				DATETIME			NOT	NULL,
	
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno for the SewadarID.(Trigger b)
	satsang_centre_id 		satsang_centre_id		NULL,
	sewadar_grno			sewadar_grno			NULL,

	remarks					VARCHAR (200)			NULL,

		CONSTRAINT	ScannedFingerPrints_PK_SewadarID_ScannedDateTime
			PRIMARY KEY	NONCLUSTERED	(	sewadar_id, scanned_dtm 	),

		CONSTRAINT	ScannedFingerPrints_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno 	)
				REFERENCES	sewadars_registrations
)
GO


-- =============================================================================
--	This is a replica of scanned_fingerprints and records are preserved here for posterity, if required by the Processing Procedure.
--	Currently, the data in this table is not accessible through any screen(s) or report(s).

-- This table contains the processed records
-- =============================================================================

CREATE	TABLE	scanned_fingerprints_store
(
	controlling_id			INTEGER				NOT NULL	CONSTRAINT	ScannedFingerPrintsStore_FK_ControllingID
																REFERENCES	sewas_fp_controlling_dates,

	sewadar_id				sewadar_id			NOT	NULL	CONSTRAINT	ScannedFingerPrintsStore_FK_SewadarID
																REFERENCES	sewadars,
	scanned_dtm				DATETIME			NOT	NULL,
	
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno for the SewadarID.(Trigger b)
	satsang_centre_id 		satsang_centre_id	NOT	NULL,
	sewadar_grno			sewadar_grno		NOT	NULL,
	sewa_shift				sewa_shift			NOT NULL,
	is_start				BIT					NOT NULL,

		CONSTRAINT	ScannedFingerPrintsStore_PK_SewadarID_ScannedDateTime
			PRIMARY KEY	NONCLUSTERED	(	sewadar_id, scanned_dtm 	),

		CONSTRAINT	ScannedFingerPrintsStore_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno 	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================
--	This table stores the Applications of Sewadars for a Centre, which are recorded at a Centre.
--	This data is imported at the Zone from Centre, and then processed. Therefore, the registration
--	of Sewadar for the Centre takes place at the Zone, and thereby G.R.No. issued.
-- =============================================================================

CREATE	TABLE	sewadar_applications
(
	application_id					INTEGER					NOT NULL	IDENTITY (100001, 1)		--- starting with 100,000+ to allow for migration data
																		CONSTRAINT	SewadarApplications_PK_ApplicationID
																			PRIMARY KEY	CLUSTERED,
		--	Trigger ensures that the is_main_centre is Yes
	application_centre_id 			satsang_centre_id		NOT	NULL	CONSTRAINT	SewadarApplications_FK_ApplicationCentreID
																			REFERENCES	satsang_centres_details,
                                    
	application_dt					DATE					NOT NULL	CONSTRAINT	SewadarApplications_CK_ApplicationDate
																			CHECK	(	application_dt	<=	GetDate	()	),

	application_status				VARCHAR (20)			NOT	NULL	CONSTRAINT	SewadarApplications_CK_ApplicationStatus
																			CHECK	(	application_status	IN	(	'Entered',
																													'Verified',
																													'Processed',
																													'Rejected',
																													'Pending',
																													'Error'
																												)
																					),
                                    
	application_status_dtm			SMALLDATETIME				NULL	CONSTRAINT	SewadarApplications_DF_ApplicationStatusDateTime
																			DEFAULT	GetDate(),
	first_nm 						name_part				NOT NULL,
	middle_nm 						name_part				NOT NULL,
	last_nm 						name_part				NOT NULL,
                                    
	gender 							Gender					NOT NULL,

	--- By default, the time portion of the birth should be initialised to mid-night, that is, 0000 hours.
	--- In case of two persons, having same name (first and last names), gender and date of birth, the time portion
	--- is to be used only in that case; the time initialised to 00:01 hours (1 minute past mid-night).
    birth_dtm						SMALLDATETIME			NOT NULL,
                                    
	is_married						Boolean					NOT	NULL,
                                    
	initiation_dt					SMALLDATETIME				NULL,
		--- Trigger ensures that initiation_place_id exists in cdb..initiation_places(Trigger a)
	initiation_place_id				initiation_place_id			NULL,
		--- Trigger ensures that patron_id exists in cdb..patrons(Trigger b)
	initiation_by					patron_id					NULL,
                                    
    address_line_1					address_line			NOT NULL,
    address_line_2					address_line				NULL,
                                    
	post_office_or_city_id			post_office_or_city_id	NOT NULL	CONSTRAINT	SewadarApplications_FK_PostOfficeOrCityID
																			REFERENCES	post_offices_or_cities,
    pin_or_zip_code					pin_or_zip_code				NULL,
                                    
	address_proof					address_proof				NULL	CONSTRAINT	SewadarApplications_FK_AddressProof
																			REFERENCES	address_proofs,
	other_address_proof_id          address_proof_id			NULL    CONSTRAINT	SewadarApplications_FK_OtherAddressProofID
																			REFERENCES	other_address_proofs,
	telephone_mobile				telephone_lines				NULL,
	telephone_residence				telephone_lines				NULL,
	telephone_office				telephone_lines				NULL,
                                    
	occupation						occupation				NOT NULL	CONSTRAINT	SewadarApplications_FK_Occupation
																			REFERENCES	occupations,
	attends_weekly_satsang			Boolean						NULL,
	weekly_satsang_centre_id 	 	satsang_centre_id			NULL	CONSTRAINT	SewadarApplications_FK_WeeklySatsangCentreID
																			REFERENCES	satsang_centres_details,

	has_hypertension				Boolean					NOT	NULL,
	is_diabetic						Boolean					NOT	NULL,
	has_skin_problem				Boolean					NOT	NULL,
	has_epillepsy					Boolean					NOT	NULL,

	photo_id						VARCHAR (20)				NULL,
	photo_dt						DATE						NULL,

	appointment_dt					SMALLDATETIME			NOT NULL,
	is_outstation_sewadar			Boolean					NOT NULL,

		---- Trigger (DML) puts a record in sewadars_transfers on INSERT only; updates are the other way round(Trigger DML b)
	department_id					department_id			NOT NULL	CONSTRAINT	SewadarApplications_FK_DepartmentID
																			REFERENCES	departments,
		--- Trigger ensures that sub_department_id is specified when departments.sub_department_mandatory = Yes(Trigger b)
		--- Trigger also ensures that department_id  above is same as it is in sub_departments(Trigger c)
	sub_department_id				department_id				NULL	CONSTRAINT	SewadarApplications_FK_SubDepartmentID
																			REFERENCES	sub_departments,
	old_grno						VARCHAR (10)				NULL,
 
	reference_1_sewadar_id			sewadar_id					NULL	CONSTRAINT	SewadarApplications_FK_Reference1SewadarID
																			REFERENCES	sewadars,
	  --- Trigger ensures that reference_1_relationship exists in CDB..relations(Trigger m)
	reference_1_grno				sewadar_grno				NULL,
	reference_1_relationship		relationship_id			NOT	NULL,
	reference_1_nm					reference_nm				NULL,
	reference_1_centre_id			satsang_centre_id		NOT	NULL	CONSTRAINT	SewadarApplications_FK_Reference1CentreID
																			REFERENCES	satsang_centres_details,
	reference_1_department			VARCHAR (20)				NULL,

	reference_2_sewadar_id			sewadar_id					NULL	CONSTRAINT	SewadarApplications_FK_Reference2SewadarID
																			REFERENCES	sewadars,
	  --- Trigger ensures that reference_2_relationship exists in CDB..relations(Trigger n)
	reference_2_grno				sewadar_grno				NULL,
	reference_2_relationship		relationship_id			NOT	NULL,
	reference_2_nm					reference_nm				NULL,
	reference_2_centre_id			satsang_centre_id		NOT	NULL	CONSTRAINT	SewadarApplications_FK_Reference2CentreID
																			REFERENCES	satsang_centres_details,
	reference_2_department			VARCHAR (20)				NULL,
                                    
                                    
	security_approver_id 			sewadar_id				 	NULL	CONSTRAINT	SewadarApplications_FK_SecurityApproverID
																			REFERENCES	sewadars,
	security_approver_centre_id		satsang_centre_id		NOT	NULL	CONSTRAINT	SewadarApplications_FK_SecurityApproverCentreID
																			REFERENCES	satsang_centres_details,
	security_approver_grno			sewadar_grno			NOT	NULL,
	security_approver_nm			reference_nm				NULL,


	sewa_samiti_approver_id 		sewadar_id					NULL	CONSTRAINT	SewadarApplications_FK_SewaSamitiApproverID
																			REFERENCES	sewadars,
	sewa_samiti_approver_centre_id	satsang_centre_id		NOT	NULL	CONSTRAINT	SewadarApplications_FK_SewaSamitiApproverCentreID
																			REFERENCES	satsang_centres_details,
	sewa_samiti_approver_grno		sewadar_grno			NOT	NULL,
	sewa_samiti_approver_nm			reference_nm				NULL,

	area_secretary_id 				centre_functionary_id		NULL	CONSTRAINT	SewadarApplications_FK_AreaSecretaryID
																			REFERENCES	satsang_centre_functionaries,
	area_secretary_centre_id		satsang_centre_id			NULL	CONSTRAINT	SewadarApplications_FK_AreaSecretaryCentreID
																			REFERENCES	satsang_centres_details,
	area_secretary_grno				sewadar_grno				NULL,
	area_secretary_nm				reference_nm				NULL,

	secretary_id 					centre_functionary_id		NULL	CONSTRAINT	SewadarApplications_FK_SecretaryID
																			REFERENCES	satsang_centre_functionaries,
	secretary_centre_id				satsang_centre_id			NULL	CONSTRAINT	SewadarApplications_FK_SecretaryCentreID
	   																		REFERENCES	satsang_centres_details,
	secretary_grno					sewadar_grno				NULL,
	secretary_nm					reference_nm				NULL,


	sponsorer_id 					sewadar_id					NULL	CONSTRAINT	SewadarApplications_FK_SponsorerID
																			REFERENCES	sewadars,
	sponsorer_centre_id				satsang_centre_id			NULL	CONSTRAINT	SewadarApplications_FK_SponsorerCentreID
																			REFERENCES	satsang_centres_details,
	sponsorer_grno					sewadar_grno				NULL,
	sponsorer_nm					reference_nm				NULL,
	sponsorer_department			VARCHAR (20)				NULL,
                                    
	remarks							VARCHAR (500)				NULL,
	reason							VARCHAR (200)				NULL,

		--	When application is successfully processed, it contains the G.R.No., which is allocated to the Sewadar.
	registered_sewadar_grno			sewadar_grno				NULL,
	registered_sewadar_id			sewadar_id					NULL,

	txn_ts							TIMESTAMP				NOT	NULL,

		CONSTRAINT	SewadarApplications_UK_NameGenderDOB
			UNIQUE	NONCLUSTERED	(	application_centre_id, first_nm, middle_nm, last_nm, gender, birth_dtm ),

		CONSTRAINT	SewadarApplications_CK_InitiationDetails
			CHECK	(	(	initiation_dt	IS NOT NULL	AND initiation_place_id	IS NOT NULL	AND initiation_by	IS NOT NULL	)
					OR	(	initiation_dt	IS NULL		AND initiation_place_id	IS NULL		AND initiation_by	IS NULL		)
					),

		CONSTRAINT	SewadarApplications_CK_PhotoID_PhotoDate
			CHECK	(	(	initiation_dt	IS NOT NULL	AND initiation_place_id	IS NOT NULL	AND initiation_by	IS NOT NULL	)
					OR	(	initiation_dt	IS NULL		AND initiation_place_id	IS NULL		AND initiation_by	IS NULL		)
					),

		CONSTRAINT	SewadarApplications_CK_AddressProof_OtherAddressProof
			CHECK	(	(	address_proof	IS NOT NULL	AND	other_address_proof_id	IS NULL		)
					OR	(	address_proof	IS NULL		AND	other_address_proof_id	IS NOT NULL	)
					),

		CONSTRAINT	SewadarApplications_CK_Reference1_SewadarID_GRNo_ReferenceName_Department
			CHECK	(	(	reference_1_sewadar_id	IS	NOT	NULL	)
					OR	(	reference_1_sewadar_id	IS		NULL	AND	reference_1_grno	IS	NOT	NULL	AND	reference_1_nm	IS	NOT	NULL	AND	reference_1_department	IS	NOT	NULL	)
					),

		CONSTRAINT	SewadarApplications_CK_Reference2_SewadarID_GRNo_ReferenceName_Department
			CHECK	(	(	reference_2_sewadar_id	IS	NOT	NULL	)
					OR	(	reference_2_sewadar_id	IS		NULL	AND	reference_2_grno	IS	NOT	NULL	AND	reference_2_nm	IS	NOT	NULL	AND	reference_2_department	IS	NOT	NULL	)
					),

		CONSTRAINT	SewadarApplications_CK_SecurityApprover_SewadarID_ApproverName
			CHECK  ( (	[security_approver_id] IS NULL AND [security_approver_nm] IS NOT NULL )
				 OR  ( [security_approver_id] IS NOT NULL AND [security_approver_nm] IS NULL )
				 OR  ( [security_approver_id] IS NOT NULL AND [security_approver_nm] IS NOT NULL )
			),

		CONSTRAINT	SewadarApplications_CK_SewaSamitiApprover_SewadarID_ApproverName
			CHECK	( ( [sewa_samiti_approver_id] IS NULL AND [sewa_samiti_approver_nm] IS NOT NULL )
				  OR  ( [sewa_samiti_approver_id] IS NOT NULL AND [sewa_samiti_approver_nm] IS NULL )
				  OR  ( [sewa_samiti_approver_id] IS NOT NULL AND [sewa_samiti_approver_nm] IS NOT NULL )
			),

		CONSTRAINT	SewadarApplications_CK_OutstationSewadar_AreaSecretary_AreaSecretaryID_AreaSecretaryName
			CHECK	(	(	is_outstation_sewadar	=	'Yes'	AND	area_secretary_id	IS		NULL	AND	area_secretary_centre_id	IS	NOT	NULL	AND	area_secretary_grno	IS	NOT	NULL	AND	area_secretary_nm	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	area_secretary_id	IS	NOT NULL	AND	area_secretary_centre_id	IS	NOT	NULL	AND	area_secretary_grno	IS	NOT	NULL	AND	area_secretary_nm	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	area_secretary_id	IS	NOT	NULL	AND	area_secretary_centre_id	IS	NOT	NULL	AND	area_secretary_grno	IS		NULL	AND	area_secretary_nm	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'No'	AND	area_secretary_id	IS		NULL	AND	area_secretary_centre_id	IS		NULL	AND	area_secretary_grno	IS		NULL	AND	area_secretary_nm	IS		NULL	)
					),

		CONSTRAINT	SewadarApplications_CK_OutstationSewadar_Secretary_SecretaryID_SecretaryName
			CHECK	(	(	is_outstation_sewadar	=	'Yes'	AND	secretary_id	IS		NULL	AND	secretary_centre_id	IS	NOT	NULL	AND	secretary_grno	IS	NOT	NULL	AND	secretary_nm	IS	NOT	NULL	)
					OR  (	is_outstation_sewadar	=	'Yes'	AND	secretary_id	IS	NOT	NULL	AND	secretary_centre_id	IS	NOT	NULL	AND	secretary_grno	IS	NOT	NULL	AND	secretary_nm	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	secretary_id	IS	NOT	NULL	AND	secretary_centre_id	IS	NOT	NULL	AND	secretary_grno	IS		NULL	AND	secretary_nm	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'No'	AND	secretary_id	IS		NULL	AND	secretary_centre_id	IS		NULL	AND	secretary_grno	IS		NULL	AND	secretary_nm	IS		NULL	)
					),

		CONSTRAINT	SewadarApplications_CK_LocalSewadar_SponsorerApprover_SewadarID_SponsorerName_SponsorerDepartment
			CHECK	( ( [is_outstation_sewadar]='No' AND [sponsorer_id] IS NULL AND [sponsorer_centre_id] IS NOT NULL AND [sponsorer_grno] IS NOT NULL AND [sponsorer_nm] IS NOT NULL AND [sponsorer_department] IS NOT NULL ) 
					OR    ( [is_outstation_sewadar]='No' AND [sponsorer_id] IS NOT NULL AND [sponsorer_centre_id] IS NOT NULL AND [sponsorer_grno] IS NOT NULL AND [sponsorer_nm] IS NOT NULL AND [sponsorer_department] IS NOT NULL )
					OR    ( [is_outstation_sewadar]='Yes' AND [sponsorer_id] IS NULL AND [sponsorer_centre_id] IS NULL AND [sponsorer_grno] IS NULL AND [sponsorer_nm] IS NULL AND [sponsorer_department] IS NULL)
					),

		CONSTRAINT	SewadarApplications_CK_ApplicationStatus_Reason
			CHECK	(	(	application_status	IN		(	'Rejected', 'Pending', 'Error'	)	AND	reason	IS	NOT	NULL		)
					OR	(	application_status	NOT	IN	(	'Rejected', 'Pending', 'Error'	)	AND	reason	IS		NULL		)
					)
)
GO

CREATE	TABLE	sewadar_application_qualifications
(
	sewadar_application_id		INTEGER				NOT NULL	CONSTRAINT	SewadarApplicationQualifications_FK_SewadarApplicationID
																	REFERENCES	sewadar_applications,
	qualification_sq			display_order		NOT NULL,

	  --- Trigger ensures that Qualification exists in CDB (Qualifications)(Trigger a)
	qualification_id			qualification_id	NOT NULL,		---- REFERENCES CDB..qualifications

	  --- Trigger ensures that Subject exists in CDB (Qualification_Subjects), as a composite foreign key with qualification id(Trigger b)
	qlfctn_subject_id			qlfctn_subject_id  		NULL,		---- REFERENCES CDB..qualification_qual_subjects

		CONSTRAINT	SewadarApplicationQualifications_PK_SewadarApplicationID_QualificationSq
			PRIMARY KEY	CLUSTERED	(	sewadar_application_id, qualification_sq	),

		CONSTRAINT	SewadarApplicationQualifications_UK_QualificationID_SubjectID_SewadarApplicationID
			UNIQUE	NONCLUSTERED	(	qualification_id, qlfctn_subject_id, sewadar_application_id	)
)
GO


-- =============================================================================

CREATE	TABLE	sewadar_application_other_disabilities
(
	sewadar_application_id		INTEGER						NOT NULL	CONSTRAINT	SewadarApplicationOtherDisabilities_FK_SewadarApplicationID
																			REFERENCES	sewadar_applications,
	medical_disability_id		medical_disability_id		NOT NULL	CONSTRAINT	SewadarApplicationOtherDisabilities_FK_MedicalDisabilityID
																			REFERENCES	medical_disabilities,
	medical_disability_sq		display_order				NOT NULL,

		CONSTRAINT	SewadarApplicationOtherDisabilities_PK_SewadarApplicationID_MedicalDisabilitySequence
			PRIMARY KEY	CLUSTERED	(	sewadar_application_id, medical_disability_sq	),
			
		CONSTRAINT	SewadarApplicationOtherDisabilities_UK_MedicalDisabilityID_SewadarApplicationID
			UNIQUE	NONCLUSTERED	(	medical_disability_id, sewadar_application_id	)
)
GO
-- =============================================================================


CREATE	TABLE	sewadar_application_skills
(
	sewadar_application_id	INTEGER			NOT NULL	CONSTRAINT	SewadarApplicationSkills_FK_SewadarApplicationID
															REFERENCES	sewadar_applications,
	  --- Trigger ensures that skill_id exists in CDB..skills(Trigger a)
	skill_id				skill_id		NOT NULL,

	skill_sq				display_order	NOT NULL,

		CONSTRAINT	SewadarApplicationSkills_PK_SewadarApplicationID_SkillID
			PRIMARY KEY	NONCLUSTERED	(	sewadar_application_id, skill_id	),

		CONSTRAINT	SewadarApplicationSkills_UK_SewadarApplicationID_SkillSq
			UNIQUE	NONCLUSTERED	(	sewadar_application_id, skill_sq	)
)
GO


-- =============================================================================

-- vim:ts=4 ht=8 sw=4
