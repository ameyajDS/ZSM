/* ==================================================================================
    Source File		:	schema_adt_tables.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Nov 18 07:19 IST 2010
    Last updated	:	Feb 05, 2015
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
	 JL : 05-Feb-2015
		* Table adt_generic_sewadar_lists has three new columns, viz., is_for_export, exported_dtm and programme_satsang_centre_id.
	 AK/JL : 15, 16-Oct-2014
		* Table adt_medical_disabilities and adt_sewadars_other_disabilities have been added.
	 JL : 10-Jan-2014
		* Table adt_sewa_shifts_valid_combinations has been added.
	 JL : 25-Jan-2013
		* Corrected column scanning_sub_job_id to scanning_job_id in adt_scanning_jobs_controlling_dates as in the base table. Also correctoed the
		  Primary Key corresponding to this.
		* Column skill_sq  added to adt_sewadars_skills as in the base table.
     JL : 24-Jan-2013
		* Columns is_expiry_year_check and are_outstation_sewadars_allowed added to adt_badge_templates, which were added to base table earlier.
		* Columns last_appointment_dt, credit_group_nm and presence_sewa_id added to adt_credit_specifications, which were added to base table earlier except for credit_group_nm.
		* Table adt_sewa_exemption_application_sewas was incorrectly defined, which has now been corrected to adt_sewa_exemptions_applicable_sewas.
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

CREATE	TABLE	adt_badge_templates
(
 	audit_log_id				audit_log_id		NOT NULL	CONSTRAINT	AdtBadgeTemplates_FK_AuditLogId
																	REFERENCES	audit_logs,
	badge_template_id			badge_template_id	NOT NULL,
	badge_template_nm			gnc_nm				NOT NULL,
	badge_shape					VARCHAR (10)		NOT NULL,
	information_type			VARCHAR (10)		NOT NULL,
	foreground_colour_control	ColourControl		NOT NULL,
	foreground_colour_id		colour_id				NULL,
	background_colour_control	ColourControl		NOT NULL,
	background_colour_id		colour_id				NULL,
	top_line_font_size			BadgeFontSize		NOT NULL,
	top_line_part_1_type		badge_part_type		NOT NULL,
	top_line_part_1_text		badge_text				NULL,
	top_line_parts_separator	Separator				NULL,
	top_line_part_2_type		badge_part_type			NULL,
	top_line_part_2_text		badge_text				NULL,
	middle_line_font_size		BadgeFontSize			NULL,
	middle_line_part_1_type		badge_part_type			NULL,
	middle_line_part_1_text		badge_text				NULL,
	middle_line_parts_separator	Separator				NULL,
	middle_line_part_2_type		badge_part_type			NULL,
	middle_line_part_2_text		badge_text				NULL,
	bottom_line_font_size		BadgeFontSize		NOT NULL,
	bottom_line_part_1_type		badge_part_type		NOT NULL,
	bottom_line_part_1_text		badge_text				NULL,
	bottom_line_parts_separator	Separator				NULL,
	bottom_line_part_2_type		badge_part_type			NULL,
	bottom_line_part_2_text		badge_text				NULL,
	expiry_year					CHAR (4)				NULL,
	is_expiry_year_check		Boolean				NOT NULL,
	are_outstation_sewadars_allowed
								Boolean				NOT NULL,
	report_file_nm_front		file_nm				NOT NULL,
	report_file_nm_back			file_nm					NULL,
	procedure_nm_front			procedure_nm		NOT NULL,
	procedure_nm_back			procedure_nm			NULL,

		CONSTRAINT	AdtBadgeTemplates_PK_AuditLogId_BadgeTemplateId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, badge_template_id	)
)
GO

CREATE	TABLE	adt_badge_templates_sewadar_status
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtBadgeTemplatesSewadarStatus_FK_AuditLogId
																REFERENCES	audit_logs,
	badge_template_id		badge_template_id	NOT NULL,
	sewadar_status_cd		sewadar_status_cd	NOT NULL,

		CONSTRAINT	AdtBadgeTemplatesSewadarStatus_PK_AuditLogId_BadgeTemplateId_SewadarStatusCd	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, badge_template_id, sewadar_status_cd	)
)
GO

CREATE	TABLE	adt_colours
(
 	audit_log_id		audit_log_id		NOT NULL	CONSTRAINT	AdtColours_FK_AuditLogId
															REFERENCES	audit_logs,
	colour_id			colour_id			NOT NULL,
	colour_nm			gnc_short_nm		NOT NULL,
	red_component		colour_component	NOT	NULL,
	green_component		colour_component	NOT	NULL,
	blue_component		colour_component	NOT	NULL,
	remarks				remarks					NULL,
	effective_from		DATETIME			NOT NULL,
	effective_till		DATETIME			NOT NULL,

		CONSTRAINT	AdtColours_PK_AuditLogId_ColourId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, colour_id	)
)
GO

CREATE	TABLE	adt_credit_specifications
(
 	audit_log_id				audit_log_id				NOT NULL	CONSTRAINT	AdtCreditSpecifications_FK_AuditLogId
																			REFERENCES	audit_logs,
	credit_specification_id		credit_specification_id		NOT NULL,
	credit_specification_nm		gnc_nm						NOT NULL,
	credit_specification_dt		SMALLDATETIME				NOT NULL,
	satsang_centre_id 			satsang_centre_id			NOT NULL,
	last_appointment_dt			SMALLDATETIME				NOT NULL,
	credit_group_nm				gnc_nm							NULL,
	is_uniform_specification	Boolean						NOT NULL,
	is_outstation_sewadar		Boolean							NULL,
	credit_cnt					CreditCnt					NOT NULL,
	unit_cnt					CreditCnt					NOT NULL,
	is_exemption_considered		Boolean						NOT NULL,
	presence_sewa_id			sewa_id							NULL,
	min_credit_cnt				CreditCnt						NULL,
	specification_ts			DATETIME					NOT NULL,
	computation_ts				DATETIME						NULL,
	is_finally_used				Boolean							NULL,

		CONSTRAINT	AdtCreditSpecifications_PK_AuditLogId_CreditSpecificationId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, credit_specification_id	)
)
GO

CREATE	TABLE	adt_credit_specifications_sewas
(
 	audit_log_id				audit_log_id				NOT NULL	CONSTRAINT	AdtCreditSpecificationsSewas_FK_AuditLogId
																			REFERENCES	audit_logs,
	credit_specification_id		credit_specification_id		NOT NULL,
	sewa_id						sewa_id						NOT NULL,
	credit_cnt					CreditCnt					NOT	NULL,
	unit_cnt					CreditCnt					NOT	NULL,
	is_exemption_considered		Boolean						NOT NULL,
	min_credit_cnt				CreditCnt0					NOT NULL,
	max_credit_cnt				CreditCntF					NOT NULL,

		CONSTRAINT	AdtCreditSpecificationsSewas_PK_AuditLogId_CreditSpecificationId_SewaId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, credit_specification_id, sewa_id	)
)
GO

CREATE	TABLE	adt_departments
(
 	audit_log_id				audit_log_id	NOT NULL	CONSTRAINT	AdtDepartments_FK_AuditLogId
																REFERENCES	audit_logs,
	department_id				department_id	NOT NULL,
	department_cd				VARCHAR (5)		NOT NULL,
	department_nm 				gnc_nm			NOT NULL,
	colour_id					colour_id		NOT NULL,
	has_sub_departments			Boolean			NOT NULL,
	remarks						remarks				NULL,

		CONSTRAINT	AdtDepartments_PK_AuditLogId_DepartmentId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, department_id	)
)
GO

CREATE	TABLE	adt_departments_satsang_centres
(
 	audit_log_id			audit_log_id			NOT NULL	CONSTRAINT	AdtDepartmentsSatsangCentres_FK_AuditLogId
																	REFERENCES	audit_logs,
	department_id			department_id			NOT NULL,
	satsang_centre_id 		satsang_centre_id		NOT NULL,
	genders_allowed				CHAR (1)		NOT NULL,
	is_common_roster			Boolean			NOT NULL,
	is_generic					Boolean			NOT NULL,
	is_weekly					Boolean			NOT NULL,
	sub_department_mandatory	Boolean				NULL,
	effective_from				DATETIME		NOT NULL,
	effective_till				DATETIME		NOT NULL,

		CONSTRAINT	AdtDepartmentsSatsangCentres_PK_AuditLogId_DepartmentId_SatsangCentreId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, department_id, satsang_centre_id	)
)
GO

CREATE	TABLE	adt_sub_departments
(
 	audit_log_id		audit_log_id	NOT NULL	CONSTRAINT	AdtSubDepartments_FK_AuditLogId
														REFERENCES	audit_logs,
	sub_department_id	department_id	NOT NULL,
	department_id		department_id	NOT NULL,
	sub_department_cd	VARCHAR (5)		NOT NULL,
	sub_department_nm 	gnc_nm			NOT NULL,
	remarks				remarks				NULL,

		CONSTRAINT	AdtSubDepartments_PK_AuditLogId_SubDepartmentId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sub_department_id	)
)
GO

CREATE	TABLE	adt_sub_departments_satsang_centres
(
 	audit_log_id			audit_log_id			NOT NULL	CONSTRAINT	AdtSubDepartmentsSatsangCentres_FK_AuditLogId
																	REFERENCES	audit_logs,
	sub_department_id		department_id			NOT NULL,
	satsang_centre_id 		satsang_centre_id		NOT NULL,
	effective_from			DATETIME				NOT NULL,
	effective_till			DATETIME				NOT NULL,

		CONSTRAINT	AdtSubDepartmentsSatsangCentres_PK_AuditLogId_SubDepartmentId_SatsangCentreId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sub_department_id, satsang_centre_id	)
)
GO

CREATE	TABLE	adt_generic_attributes
(
 	audit_log_id			audit_log_id			NOT NULL	CONSTRAINT	AdtGenericAttributes_FK_AuditLogId
																	REFERENCES	audit_logs,
	attribute_id			attribute_id			NOT NULL,
	attribute_nm			gnc_nm					NOT NULL,
	attribute_group			gnc_nm					NOT NULL,
	attribute_sq			display_order			NOT NULL,
	attribute_type			gnc_short_nm			NOT NULL,
	attribute_length		TINYINT						NULL,
	attribute_scale			TINYINT						NULL,
	is_temporal				Boolean					NOT	NULL,
	is_mandatory			Boolean					NOT	NULL,
	is_status_applicable	Boolean						NULL,
	remarks					remarks						NULL,

		CONSTRAINT	AdtGenericAttributes_PK_AuditLogId_AttributeId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, attribute_id	)
)
GO

CREATE	TABLE	adt_generic_attributes_list_values
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtGenericAttributesListValues_FK_AuditLogId
																REFERENCES	audit_logs,
	attribute_id			attribute_id		NOT NULL,
	attribute_value			VARCHAR (20)		NOT NULL,
	attribute_value_sq		display_order		NOT NULL,

		CONSTRAINT	AdtGenericAttributesListValues_PK_AuditLogId_AttributeId_AttributeValue	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, attribute_id, attribute_value	)
)
GO

CREATE	TABLE	adt_generic_attributes_status
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtGenericAttributesStatus_FK_AuditLogId
																REFERENCES	audit_logs,
	attribute_id			attribute_id		NOT NULL,
	sewadar_status_cd		sewadar_status_cd	NOT NULL,

		CONSTRAINT	AdtGenericAttributesStatus_PK_AuditLogId_AttributeId_SewadarStatusId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, attribute_id, sewadar_status_cd	)
)
GO

CREATE	TABLE	adt_generic_attributes_satsang_centres
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtGenericAttributesSatsangCentres_FK_AuditLogId
																REFERENCES	audit_logs,
	attribute_id			attribute_id		NOT NULL,
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	effective_from			DATETIME			NOT NULL,
	effective_till			DATETIME			NOT NULL,

		CONSTRAINT	AdtGenericAttributesSatsangCentres_PK_AuditLogId_AttributeId_SatsangCentreId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, attribute_id, satsang_centre_id	)
)
GO

CREATE	TABLE	adt_post_offices_or_cities
(
 	audit_log_id			audit_log_id			NOT NULL	CONSTRAINT	AdtPostOfficesOrCities_FK_AuditLogId
																	REFERENCES	audit_logs,
	post_office_or_city_id 	post_office_or_city_id	NOT NULL,
	district_id 			district_id				NOT NULL,
	post_office_or_city_cd 	VARCHAR (10)			NOT NULL,
	post_office_or_city_nm 	gnc_nm					NOT NULL,
	std_code				VARCHAR (10)				NULL,
	effective_from			DATETIME				NOT NULL,
	effective_till			DATETIME				NOT NULL,

		CONSTRAINT	AdtPostOfficesOrCities_PK_AuditLogId_PostOfficeOrCityId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, post_office_or_city_id	)
)
GO


CREATE	TABLE	adt_satsang_centres_details
(
 	audit_log_id			audit_log_id			NOT NULL	CONSTRAINT	AdtSatsangCentresDetails_FK_AuditLogId
																	REFERENCES	audit_logs,
	satsang_centre_id 		satsang_centre_id		NOT NULL,
	is_main_centre			Boolean					NOT NULL,
	centre_nm 				gnc_nm						NULL,
	centre_alphabet 		CHAR (1)					NULL,
	centre_cd 				CHAR (3)					NULL,
	reports_to_centre_id	satsang_centre_id			NULL,
	colour_id				colour_id					NULL,
	remarks					remarks						NULL,
	secretary_signature		IMAGE						NULL,

		CONSTRAINT	AdtSatsangCentresDetails_PK_AuditLogId_SatsangCentreId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, satsang_centre_id	)
)
GO


CREATE	TABLE	adt_satsang_centre_functionaries
(
 	audit_log_id			audit_log_id			NOT NULL	CONSTRAINT	AdtSatsangCentreFunctionaries_FK_AuditLogId
																	REFERENCES	audit_logs,
	centre_functionary_id	centre_functionary_id	NOT NULL,
	satsang_centre_id 		satsang_centre_id		NOT NULL,
	centre_functionary		centre_functionary		NOT NULL,
	functionary_nm			functionary_nm			NOT NULL,
	is_current				Boolean					NOT NULL,
	telephones				telephone_lines				NULL,
	email_addresses			email_addresses				NULL,
	effective_from			DATETIME				NOT NULL,
	effective_till			DATETIME				NOT NULL,

		CONSTRAINT	AdtSatsangCentreFunctionaries_PK_AuditLogId_CentreFunctionaryId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, centre_functionary_id	)
)
GO

CREATE	TABLE	adt_sewas
(
 	audit_log_id				audit_log_id		NOT NULL	CONSTRAINT	AdtSewas_FK_AuditLogId
																	REFERENCES	audit_logs,
	sewa_id						sewa_id				NOT NULL,
	satsang_centre_id 			satsang_centre_id	NOT NULL,
	sewa_cd						VARCHAR (10)		NOT NULL,
	sewa_nm						gnc_long_nm			NOT NULL,
	start_dt					SMALLDATETIME		NOT NULL,
	finish_dt					SMALLDATETIME		NOT NULL,
	is_satsang_programme		Boolean				NOT NULL,
	is_scanner_used				Boolean				NOT NULL,
	is_leave_allowed			Boolean				NOT NULL,
	is_exemption_allowed		Boolean				NOT NULL,
	is_default_sewa				Boolean				NOT NULL,
	sewa_frequency				sewa_frequency		NOT NULL,
	attendance_unit				attendance_unit		NOT NULL,
	attendance_marking			VARCHAR (10)		NOT NULL,
	min_sewa_duration			CreditCnt0				NULL,
	max_sewa_duration			CreditCnt				NULL,
	gents_born_after			DATETIME				NULL,
	ladies_born_after			DATETIME				NULL,
	referred_sewa_id			sewa_id					NULL,
	attendance_ts				DATETIME				NULL,
	summary_ts					DATETIME				NULL,
	deleted_ts					DATETIME				NULL,
	locked_dtm					DATETIME				NULL,
	trainee_current_seq_id 		sequence_id				NULL,
	open_sewadar_current_seq_id sequence_id				NULL,

		CONSTRAINT	AdtSewas_PK_AuditLogId_SewaId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_id	)
)
GO

CREATE	TABLE	adt_medical_disabilities
(
 	audit_log_id						audit_log_id			NOT NULL	CONSTRAINT	AdtMedicalDisabilities_FK_AuditLogId
																				REFERENCES	audit_logs,
	medical_disability_id				medical_disability_id	NOT NULL,
	medical_disability_nm 				gnc_long_nm				NOT NULL,
	medical_disability_cd				VARCHAR (10)			NOT NULL,
	effective_from						DATETIME				NOT NULL,
	effective_till						DATETIME				NOT NULL,

		CONSTRAINT	AdtMedicalDisabilities_PK_AuditLogId_MedicalDisabilityId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, medical_disability_id)
)
GO


CREATE	TABLE 	adt_sewas_periods
(
 	audit_log_id	audit_log_id		NOT NULL	CONSTRAINT	AdtSewasPeriods_FK_AuditLogId
														REFERENCES	audit_logs,
	sewa_id			sewa_id				NOT NULL,
	start_dt		SMALLDATETIME 		NOT NULL,
	finish_dt		SMALLDATETIME		NOT NULL,

		CONSTRAINT	AdtSewasPeriods_PK_AuditLogId_SewaId_StartDt	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_id, start_dt	)
)
GO


CREATE	TABLE 	adt_sewas_sewa_shifts
(
 	audit_log_id	audit_log_id		NOT NULL	CONSTRAINT	AdtSewasSewaShifts_FK_AuditLogId
														REFERENCES	audit_logs,
	sewa_id			sewa_id				NOT NULL,
	sewa_shift		sewa_shift			NOT NULL,
	sewa_shift_sq	display_order		NOT NULL,
	credit_cnt		CreditCnt			NOT NULL,
	unit_cnt		CreditCnt			NOT NULL,

		CONSTRAINT	AdtSewasSewaShifts_PK_AuditLogId_SewaId_SewaShift	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_id, sewa_shift	)
)
GO

CREATE	TABLE adt_sewa_shifts_valid_combinations
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtSewaShiftsValidCombinations_FK_AuditLogId
																REFERENCES	audit_logs,
	sewa_id					sewa_id				NOT NULL,
	recorded_sewa_shift		sewa_shift			NOT NULL,
	recording_sewa_shift	sewa_shift			NOT NULL,
	
		CONSTRAINT	AdtSewaShiftsValidCombinations_PK_AuditLogID_SewaID_RecordedSewaShift_RecordingSewaShift
			PRIMARY KEY	CLUSTERED	(	audit_log_id, sewa_id, recorded_sewa_shift, recording_sewa_shift	)
)
GO

CREATE	TABLE	adt_sewas_satsang_centres
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtSewasSatsangCentres_FK_AuditLogId
																REFERENCES	audit_logs,
	sewa_id					sewa_id				NOT NULL,
	satsang_centre_id 		satsang_centre_id	NOT NULL,

		CONSTRAINT	AdtSewasSatsangCentres_PK_AuditLogId_SewaId_SatsangCentreId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_id, satsang_centre_id	)
)
GO

CREATE	TABLE	adt_sewa_exemptions
(
 	audit_log_id				audit_log_id			NOT NULL	CONSTRAINT	AdtSewaExemptions_FK_AuditLogId
																		REFERENCES	audit_logs,
	sewa_exemption_id			sewa_exemption_id		NOT NULL,
	sewa_exemption_nm			gnc_nm					NOT NULL,
	sewa_exemption_description	remarks						NULL,
	sewa_exemption_type			VARCHAR (10)			NOT NULL,
	sewa_applicability			Boolean					NOT NULL,
	is_computed					Boolean					NOT NULL,
	effective_from				DATETIME				NOT NULL,
	effective_till				DATETIME				NOT NULL,

		CONSTRAINT	AdtSewaExemptions_PK_AuditLogId_SewaExemptionId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_exemption_id	)
)
GO

CREATE	TABLE	adt_sewa_exemptions_applicable_sewas
(
 	audit_log_id		audit_log_id		NOT NULL	CONSTRAINT	AdtSewaExemptionsApplicableSewas_FK_AuditLogId
															REFERENCES	audit_logs,
	sewa_exemption_id	sewa_exemption_id	NOT NULL,
	sewa_id				sewa_id				NOT NULL,
	exemption_days		CreditCntF				NULL,

		CONSTRAINT	AdtSewaExemptionsApplicableSewas_PK_AuditLogId_SewaExemptionId_SewaId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_exemption_id, sewa_id	)
)
GO

CREATE	TABLE	adt_system_information_codes
(
 	audit_log_id		audit_log_id	NOT NULL	CONSTRAINT	AdtSystemInformationCodes_FK_AuditLogId
														REFERENCES	audit_logs,
	system_info_cd		system_info_cd	NOT NULL,
	system_info_nm		gnc_nm			NOT NULL,
	remarks				remarks				NULL

		CONSTRAINT	AdtSystemInformationCodes_PK_AuditLogId_SystemInfoCd
			PRIMARY KEY		CLUSTERED	(	audit_log_id, system_info_cd	)
)
GO

CREATE	TABLE	adt_system_information_values
(
 	audit_log_id		audit_log_id	NOT NULL	CONSTRAINT	AdtSystemInformationValues_FK_AuditLogId
														REFERENCES	audit_logs,
	system_info_cd		system_info_cd	NOT NULL,
	value_int			INT					NULL,
	value_varchar		gnc_nm				NULL,
	value_dt			DATETIME			NULL,
	value_dtm			DATETIME			NULL,

		CONSTRAINT	AdtSystemInformationValues_UK_AuditLogId_InfoCd_ValueInt_ValueVarchar_ValueDt_ValueDtm
			UNIQUE CLUSTERED 	(	audit_log_id, system_info_cd, value_int, value_varchar, value_dt, value_dtm	)
)
GO

CREATE	TABLE	adt_weekly_sewa_locations
(
 	audit_log_id				audit_log_id				NOT NULL	CONSTRAINT	AdtWeeklySewaLocations_FK_AuditLogId
																			REFERENCES	audit_logs,
	weekly_sewa_location_id		weekly_sewa_location_id		NOT NULL,
	weekly_sewa_location_nm		gnc_nm						NOT NULL,
	satsang_centre_id 			satsang_centre_id				NULL,
	remarks						remarks							NULL,
	effective_from				DATETIME					NOT NULL,
	effective_till				DATETIME					NOT NULL,

		CONSTRAINT	AdtWeeklySewaLocations_PK_AuditLogId_WeeklySewaLocationId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, weekly_sewa_location_id	)
)
GO

CREATE	TABLE	adt_sewadars
(
 	audit_log_id				audit_log_id		NOT NULL	CONSTRAINT	AdtSewadars_FK_AuditLogId
																	REFERENCES	audit_logs,
	sewadar_id					sewadar_id			NOT NULL,
	first_nm 					name_part			NOT NULL,
	middle_nm 					name_part			NOT NULL,
	last_nm 					name_part			NOT NULL,
	gender 						Gender				NOT NULL,
    birth_dtm					SMALLDATETIME		NOT NULL,
	is_married					Boolean					NULL,
	initiation_dt				SMALLDATETIME			NULL,
	initiation_place_id			initiation_place_id		NULL,
	initiation_by				patron_id				NULL,
	current_satsang_centre_id 	satsang_centre_id		NULL,
	current_sewadar_grno		sewadar_grno			NULL,
	global_sewadar_status_cd	sewadar_status_cd		NULL,
	global_sewadar_status_dt	SMALLDATETIME			NULL,

		CONSTRAINT	AdtSewadars_PK_AuditLogId_SewadarId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewadar_id	)
)
GO

-- ====================================================================================================
--	Note. Boolean columns (5 in number) in the following table have been put as VARCHAR (3) because it is resulting in error:
--		A column insert or update conflicts with a rule imposed by a previous CREATE RULE statement.
--		The statement was terminated.
--		The conflict occurred in database 'ZSM', table 'adt_sewadars_details', column 'attends_weekly_satsang'.
-- ====================================================================================================
CREATE	TABLE	adt_sewadars_details
(
 	audit_log_id				audit_log_id		NOT NULL	CONSTRAINT	AdtSewadarsDetails_FK_AuditLogId
																	REFERENCES	audit_logs,
	sewadar_id					sewadar_id			NOT NULL,
	address_proof				address_proof			NULL,
	other_address_proof_id		address_proof_id		NULL,
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
		--- Though this column has been dropped, but we are keeping to preserve old audit data
	any_disability				gnc_nm					NULL,

		CONSTRAINT	AdtSewadarsDetails_PK_AuditLogId_SewadarId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewadar_id	)
)
GO

CREATE	TABLE	adt_sewadars_addresses
(
 	audit_log_id			audit_log_id			NOT NULL	CONSTRAINT	AdtSewadarsAddresses_FK_AuditLogId
																	REFERENCES	audit_logs,
	sewadar_id				sewadar_id				NOT NULL,
	address_type			address_type			NOT NULL,
    address_line_1			address_line			NOT NULL,
    address_line_2			address_line				NULL,
	post_office_or_city_id	post_office_or_city_id	NOT NULL,
    pin_or_zip_code			pin_or_zip_code				NULL,

		CONSTRAINT	AdtSewadarsAddresses_PK_AuditLogId_SewadarId_AddressType	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewadar_id, address_type	)
)
GO

CREATE	TABLE	adt_sewadars_qualifications
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtSewadarsQualifications_FK_AuditLogId
																REFERENCES	audit_logs,
	sewadar_id				sewadar_id			NOT NULL,
	qualification_sq		display_order		NOT NULL,
	qualification_id		qualification_id	NOT NULL,
	qlfctn_subject_id		qlfctn_subject_id  		NULL,

		CONSTRAINT	AdtSewadarsQualifications_PK_AuditLogId_SewadarId_QualificationSq
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewadar_id, qualification_sq	)
)
GO

CREATE	TABLE	adt_sewadars_skills
(
 	audit_log_id	audit_log_id	NOT NULL	CONSTRAINT	AdtSewadarsSkills_FK_AuditLogId
													REFERENCES	audit_logs,
	sewadar_id		sewadar_id		NOT NULL,
	skill_id		skill_id		NOT NULL,
	skill_sq		display_order	NOT NULL,

		CONSTRAINT	AdtSewadarsSkills_PK_AuditLogId_SewadarId_SkillId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewadar_id, skill_id	)
)
GO

CREATE	TABLE	adt_sewadars_other_disabilities
(
 	audit_log_id				audit_log_id				NOT NULL	CONSTRAINT	AdtSewadarsOtherDisabilities_FK_AuditLogId
																			REFERENCES	audit_logs,
	sewadar_id					sewadar_id					NOT NULL,
	medical_disability_id		medical_disability_id		NOT NULL,
	medical_disability_sq		display_order				NOT NULL,

		CONSTRAINT	AdtSewadarsOtherDisabilities_PK_AuditLogId_SewadarId_MedicalDisabilityId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewadar_id, medical_disability_id	)
)
GO

CREATE	TABLE	adt_sewadars_remarks
(
 	audit_log_id	audit_log_id	NOT NULL	CONSTRAINT	AdtSewadarsRemarks_FK_AuditLogId
													REFERENCES	audit_logs,
	sewadar_id		sewadar_id		NOT NULL,
	remarks_type	remarks_type	NOT NULL,
	remarks_sq		display_order	NOT NULL,
	remarks			remarks  		NOT NULL,

		CONSTRAINT	AdtSewadarsRemarks_PK_AuditLogId_SewadarId_RemarksType_RemarksSq
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewadar_id, remarks_type, remarks_sq	)
)
GO

CREATE	TABLE	adt_sewadars_registrations
(
 	audit_log_id				audit_log_id			NOT NULL	CONSTRAINT	AdtSewadarsRegistrations_FK_AuditLogId
																		REFERENCES	audit_logs,
	satsang_centre_id 			satsang_centre_id		NOT NULL,
	sewadar_grno				sewadar_grno			NOT NULL,
	sewadar_id					sewadar_id				NOT NULL,
	appointment_dt				SMALLDATETIME			NOT NULL,
	is_outstation_sewadar		Boolean					NOT NULL,
	department_id				department_id			NOT NULL,
	sub_department_id			department_id				NULL,
	department_dt				SMALLDATETIME			NOT NULL,
	sewadar_status_cd			sewadar_status_cd		NOT NULL,
	sewadar_status_dtm			SMALLDATETIME			NOT NULL,
	responsibility				responsibility				NULL,
	responsibility_dtm			SMALLDATETIME				NULL,
	reference_1_sewadar_id		sewadar_id					NULL,
	reference_1_relationship	relationship_id				NULL,
	reference_1_nm				reference_nm				NULL,
	reference_1_centre_id		satsang_centre_id			NULL,
	reference_1_department		varchar (20)				NULL,
	reference_2_sewadar_id		sewadar_id					NULL,
	reference_2_relationship	relationship_id				NULL,
	reference_2_nm				reference_nm				NULL,
	reference_2_centre_id		satsang_centre_id			NULL,
	reference_2_department		varchar (20)				NULL,
	sponsorer_id 				sewadar_id					NULL,
	area_secretary_id 			centre_functionary_id		NULL,
	secretary_id 				centre_functionary_id		NULL,
	security_approver_id 		sewadar_id				 	NULL,
	sewa_samiti_approver_id 	sewadar_id					NULL,
	weekly_sewa_location_id		weekly_sewa_location_id		NULL,
	weekly_department_id		department_id				NULL,
	sewadar_type				sewadar_type			NOT NULL,
	sewa_id						sewa_id						NULL,
	location_district_id 		district_id					NULL,

		CONSTRAINT	AdtSewadarsRegistrations_PK_AuditLogId_SatsangCentreId_SewadarGrno	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, satsang_centre_id, sewadar_grno	)
)
GO

CREATE	TABLE	adt_sewadars_transfers
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtSewadarsTransfers_FK_AuditLogId
																REFERENCES	audit_logs,
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,
	effective_dt			SMALLDATETIME		NOT NULL,
	old_department_id		department_id			NULL,
	old_sub_department_id	department_id			NULL,
	department_id			department_id		NOT NULL,
	sub_department_id		department_id			NULL,
	remarks					remarks					NULL,

		CONSTRAINT	AdtSewadarsTransfers_PK_AuditLogId_SatsangCentreId_SewadarGrno_EffectiveDt	
			PRIMARY KEY		CLUSTERED	(audit_log_id, satsang_centre_id, sewadar_grno, effective_dt	)
)
GO

CREATE	TABLE	adt_sewadars_status_changes
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtSewadarsStatusChanges_FK_AuditLogId
																REFERENCES	audit_logs,
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,
	effective_dtm			SMALLDATETIME		NOT NULL,
	old_sewadar_status_cd	sewadar_status_cd		NULL,
	sewadar_status_cd		sewadar_status_cd		NULL,

		CONSTRAINT	AdtSewadarsStatusChanges_PK_AuditLogId_SatsangCentreId_SewadarGrno_EffectiveDtm	
			PRIMARY KEY		CLUSTERED	(audit_log_id, satsang_centre_id, sewadar_grno, effective_dtm	)
)
GO

CREATE	TABLE	adt_sewadars_responsibility_changes
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtSewadarsResponsibilityChanges_FK_AuditLogId
																REFERENCES	audit_logs,
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,
	effective_dtm			SMALLDATETIME		NOT NULL,
	old_responsibility		responsibility			NULL,
	responsibility			responsibility			NULL,

		CONSTRAINT	AdtSewadarsResponsibilityChanges_PK_AuditLogId_SatsangCentreId_SewadarGrno_EffectiveDtm	
			PRIMARY KEY		CLUSTERED	(audit_log_id, satsang_centre_id, sewadar_grno, effective_dtm	)
)
GO

CREATE	TABLE	adt_sewadars_particulars
(
 	audit_log_id		audit_log_id		NOT NULL	CONSTRAINT	AdtSewadarsParticulars_FK_AuditLogId
															REFERENCES	audit_logs,
	satsang_centre_id 	satsang_centre_id	NOT NULL,
	sewadar_grno		sewadar_grno		NOT NULL,

		CONSTRAINT	AdtSewadarsParticulars_PK_AuditLogId_SatsangCentreId_SewadarGrno	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, satsang_centre_id, sewadar_grno	)
)
GO

CREATE	TABLE	adt_sewadars_attributes
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtSewadarsAttributes_FK_AuditLogId
																REFERENCES	audit_logs,
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,
	attribute_id			attribute_id		NOT NULL,
	boolean_value			Boolean					NULL,
	date_value				SMALLDATETIME			NULL,
	int_value				INTEGER					NULL,
	number_value			NUMERIC (20, 8)			NULL,
	list_value				attribute_value			NULL,
	string_value			VARCHAR (255)			NULL,
	remarks					remarks					NULL,
	effective_from			DATETIME				NULL,
	effective_till			DATETIME				NULL,

		CONSTRAINT	AdtSewadarsAttributes_PK_AuditLogId_SatsangCentreId_SewadarGrno_AttributeId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, satsang_centre_id, sewadar_grno, attribute_id	)
)
GO

CREATE	TABLE	adt_sewa_teams
(
 	audit_log_id		audit_log_id		NOT NULL	CONSTRAINT	AdtSewaTeams_FK_AuditLogId
															REFERENCES	audit_logs,
	sewa_team_id		sewa_team_id		NOT	NULL,
	sewa_team_nm		gnc_long_nm			NOT NULL,
	team_description	remarks					NULL,
	sewa_id				sewa_id				NOT NULL,
	acceptance_ts		SMALLDATETIME			NULL,

		CONSTRAINT	AdtSewaTeams_PK_AuditLogId_SewaTeamId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_team_id	)
)
GO

CREATE	TABLE	adt_sewa_team_wise_sewadars
(
 	audit_log_id		audit_log_id			NOT NULL	CONSTRAINT	AdtSewaTeamWiseSewadars_FK_AuditLogId
																REFERENCES	audit_logs,
	sewa_team_id		sewa_team_id			NOT NULL,
	serial_id			sewa_team_serial_id		NOT NULL,
	satsang_centre_id 	satsang_centre_id		NOT NULL,
	sewadar_grno		sewadar_grno			NOT NULL,
	transfer_in_dt		SMALLDATETIME				NULL,
	transfer_out_dt		SMALLDATETIME				NULL,

		CONSTRAINT	AdtSewaTeamWiseSewadars_PK_AuditLogId_SewaTeamId_SerialId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_team_id, serial_id	)
)
GO

CREATE	TABLE	adt_arbitrary_daily_presences
(
 	audit_log_id		audit_log_id			NOT NULL	CONSTRAINT	AdtArbitraryDailyPresences_FK_AuditLogId
																REFERENCES	audit_logs,
	sewa_id				sewa_id					NOT NULL,
	satsang_centre_id 	satsang_centre_id		NOT NULL,
	sewadar_grno		sewadar_grno			NOT NULL,
	presence_dt			SMALLDATETIME			NOT NULL,
	is_scanned			Boolean					NOT NULL,

		CONSTRAINT	AdtArbitraryDailyPresences_PK_AuditLogId_SewaId_SatsangCentreId_SewadarGrno_PresenceDt	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_id, satsang_centre_id, sewadar_grno, presence_dt	)
)
GO

CREATE	TABLE	adt_arbitrary_shift_presences
(
 	audit_log_id		audit_log_id		NOT NULL	CONSTRAINT	AdtArbitraryShiftPresences_FK_AuditLogId
															REFERENCES	audit_logs,
	sewa_id				sewa_id				NOT NULL,
	satsang_centre_id 	satsang_centre_id	NOT NULL,
	sewadar_grno		sewadar_grno		NOT NULL,
	presence_dt			SMALLDATETIME		NOT NULL,
	sewa_shift			sewa_shift			NOT NULL,
	is_scanned			Boolean				NOT NULL,

		CONSTRAINT	AdtArbitraryShiftPresences_PK_AuditLogId_SewaId_PresenceDt_SewaShift_SatsangCentreId_SewadarGrno 	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_id, presence_dt, sewa_shift, satsang_centre_id, sewadar_grno 	)
)
GO

CREATE	TABLE	adt_arbitrary_summarised_exemptions
(
 	audit_log_id		audit_log_id		NOT NULL	CONSTRAINT	AdtArbitrarySummarisedExemptions_FK_AuditLogId
															REFERENCES	audit_logs,
	sewa_id				sewa_id				NOT NULL,
	satsang_centre_id 	satsang_centre_id	NOT NULL,
	sewadar_grno		sewadar_grno		NOT NULL,
	sewa_exemption_id	sewa_exemption_id	NOT NULL,
	exemption_days		CreditCntF			NOT NULL,

		CONSTRAINT	AdtArbitrarySummarisedExemptions_PK_AuditLogId_SewaId_SatsangCentreId_SewadarGrno	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_id, satsang_centre_id, sewadar_grno	)
)
GO

CREATE	TABLE	adt_sewadar_wise_sewa_summaries
(
 	audit_log_id		audit_log_id		NOT NULL	CONSTRAINT	AdtSewadarWiseSewaSummaries_FK_AuditLogId
															REFERENCES	audit_logs,
	sewa_id				sewa_id				NOT NULL,
	satsang_centre_id 	satsang_centre_id	NOT NULL,
	sewadar_grno		sewadar_grno		NOT NULL,
	present_cnt			CreditCntF0			NOT NULL,
	exempt_cnt			CreditCntF0			NOT	NULL,
	leave_cnt			CreditCntF0			NOT	NULL,
	absent_cnt			CreditCntF0			NOT NULL,
	is_system_recorded	Boolean				NOT NULL,

		CONSTRAINT	AdtSewadarWiseSewaSummaries_PK_AuditLogId_SewaId_SatsangCentreId_SewadarGrno 	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewa_id, satsang_centre_id, sewadar_grno 	)
)
GO

CREATE	TABLE	adt_credit_specifications_sewadars
(
 	audit_log_id				audit_log_id				NOT NULL	CONSTRAINT	AdtCreditSpecificationsSewadars_FK_AuditLogId
																				REFERENCES	audit_logs,
	credit_specification_id		credit_specification_id		NOT NULL,
	satsang_centre_id 			satsang_centre_id			NOT NULL,
	sewadar_grno				sewadar_grno				NOT NULL,
	credit_cnt					CreditCntF					NOT NULL,

		CONSTRAINT	AdtCreditSpecificationsSewadars_PK_AuditLogId_CreditSpecificationId_SatsangCentreId_SewadarGrno 	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, credit_specification_id, satsang_centre_id, sewadar_grno 	)
)
GO

CREATE	TABLE	adt_generic_sewadar_lists
(
 	audit_log_id					audit_log_id			NOT NULL	CONSTRAINT	AdtGenericSewadarLists_FK_AuditLogId
																			REFERENCES	audit_logs,
	sewadar_list_id					sewadar_list_id			NOT NULL,
	satsang_centre_id 				satsang_centre_id		NOT NULL,
	sewadar_list_nm					gnc_long_nm				NOT NULL,
	sewadar_list_use				sewadar_list_use			NULL,
	sewadar_list_other_use			sewadar_list_use			NULL,
	other_satsang_centre_sewadars	Boolean					NOT NULL,
	is_other_satsang_centre			Boolean					NOT NULL,
	is_editing_allowed				Boolean					NOT NULL,
	is_for_export					Boolean					NOT NULL,
	exported_dtm					DATETIME					NULL,
	programme_satsang_centre_id 	satsang_centre_id			NULL,
	remarks							remarks						NULL,
	generated_dtm					SMALLDATETIME				NULL,
	report_nm						report_nm					NULL,
	session_id						report_session_id			NULL,

		CONSTRAINT	AdtGenericSewadarLists_PK_AuditLogId_SewadarListId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewadar_list_id	)
)
GO

CREATE	TABLE	adt_generic_sewadar_lists_sewadars
(
 	audit_log_id				audit_log_id			NOT NULL	CONSTRAINT	AdtGenericSewadarListsSewadars_FK_AuditLogId
																		REFERENCES	audit_logs,
	sewadar_list_id				sewadar_list_id			NOT NULL,
	satsang_centre_id 			satsang_centre_id		NOT NULL,
	sewadar_grno				sewadar_grno			NOT NULL,

		CONSTRAINT	AdtGenericSewadarListsSewadars_PK_AuditLogId_SewadarListId_SatsangCentreId_SewadarGrno 	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, sewadar_list_id, satsang_centre_id, sewadar_grno 	)
)
GO

CREATE	TABLE	adt_scanning_jobs
(
 	audit_log_id			audit_log_id			NOT NULL	CONSTRAINT	AdtScanningJobs_FK_AuditLogId
																	REFERENCES	audit_logs,
	scanning_job_id			scanning_job_id			NOT NULL,
	satsang_centre_id 		satsang_centre_id		NOT NULL,
	scanning_job_nm			gnc_nm					NOT NULL,
	scanning_job_type_cd 	scanning_job_type_cd	NOT NULL,
	remarks					remarks						NULL,
	effective_from			DATETIME				NOT NULL,
	effective_till			DATETIME				NOT NULL,
	sewadar_list_id			sewadar_list_id				NULL,
	sewa_id					sewa_id						NULL,
	is_deleting_allowed		Boolean					NOT NULL,
	status_system_info_cd	system_info_cd				NULL,
	last_transfer_dtm		DATETIME					NULL,
	total_processed_cnt		SMALLINT					NULL,
	is_closed				Boolean					NOT NULL,
	is_concluded			Boolean					NOT NULL,

		CONSTRAINT	AdtScanningJobs_PK_AuditLogId_ScanningJobId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, scanning_job_id	)
)
GO

CREATE TABLE 	adt_scanning_jobs_periods
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtScanningJobsPeriods_FK_AuditLogId
																REFERENCES	audit_logs,
	scanning_job_id 		scanning_job_id		NOT NULL,
	effective_from			DATETIME 			NOT NULL,
	effective_till			DATETIME			NOT NULL,

		CONSTRAINT	AdtScanningJobsPeriods_PK_AuditLogId_ScanningJobId_EffectiveFrom	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, scanning_job_id, effective_from	)
)
GO

CREATE	TABLE 	adt_scanning_sub_jobs
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtScanningSubJobs_FK_AuditLogId
																REFERENCES	audit_logs,
	scanning_sub_job_id		scanning_job_id		NOT NULL,
	scanning_job_id 		scanning_job_id		NOT NULL,
	scanning_sub_job_nm		gnc_nm				NOT NULL,
	scanning_sub_job_sq		display_order		NOT NULL,

		CONSTRAINT	AdtScanningSubJobs_PK_AuditLogId_ScanningSubJobId
			PRIMARY KEY		CLUSTERED	(	audit_log_id, scanning_sub_job_id	)
)
GO

CREATE	TABLE 	adt_scanning_sub_jobs_validations
(
 	audit_log_id			audit_log_id				NOT NULL	CONSTRAINT	AdtScanningSubJobsValidations_FK_AuditLogId
																		REFERENCES	audit_logs,
	recorded_sub_job_id		scanning_job_id				NOT NULL,
	recording_sub_job_id	scanning_job_id				NOT NULL,
	validating_action		scanning_validating_action	NOT NULL,

		CONSTRAINT	AdtScanningSubJobsValidations_PK_AuditLogId_RecordedSubJobId_RecordingSubJobId	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, recorded_sub_job_id, recording_sub_job_id	)
)
GO

CREATE TABLE 	adt_scanning_sub_jobs_valid_combinations
(
 	audit_log_id					audit_log_id		NOT NULL	CONSTRAINT	AdtScanningSubJobsValidCombinations_FK_AuditLogId
																		REFERENCES	audit_logs,
	scanning_job_id 				scanning_job_id		NOT NULL,
	scanning_job_valid_sq			display_order		NOT NULL,
	valid_combination_sub_job_ids	VARCHAR (35)		NOT NULL,

		CONSTRAINT	AdtScanningSubJobsValidCombinations_PK_AuditLogId_ScanningJobId_ValidCombinationSubJobIds	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, scanning_job_id, valid_combination_sub_job_ids	)
)
GO

CREATE	TABLE	adt_scanning_jobs_controlling_dates
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtScanningJobsControllingDates_FK_AuditLogId
																REFERENCES	audit_logs,
	scanning_job_id 		scanning_job_id		NOT NULL,
	controlling_dt			SMALLDATETIME		NOT NULL,
	last_transfer_dtm		DATETIME				NULL,
	total_processed_cnt		SMALLINT				NULL,
	is_closed				Boolean				NOT NULL,

		CONSTRAINT	AdtScanningJobsControllingDates_PK_AuditLogId_ScanningJobId_ControllingDt	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, scanning_job_id, controlling_dt	)
)
GO


CREATE	TABLE	adt_scanned_badges
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtScannedBadges_FK_AuditLogId
																REFERENCES	audit_logs,
	scanning_sub_job_id 	scanning_job_id		NOT NULL,
	controlling_dt			SMALLDATETIME		NOT NULL,
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,
	scanned_dtm				DATETIME			NOT NULL,

		CONSTRAINT	AdtScannedBadges_PK_AuditLogId_ScanningSubJobId_ControllingDt_SewadarListId_SatsangCentreId_SewadarGrno 	
			PRIMARY KEY		CLUSTERED	(	audit_log_id, scanning_sub_job_id, controlling_dt, satsang_centre_id, sewadar_grno 	)
)
GO


CREATE TABLE adt_scanning_jobs_sewa_teams
(
	scanning_job_id		scanning_job_id		NOT NULL	CONSTRAINT	AdtScanningJobsSewaTeams_FK_ScanningJobID
															REFERENCES	scanning_jobs,
    satsang_centre_id	satsang_centre_id	NOT NULL	CONSTRAINT	AdtScanningJobsSewaTeams_FK_SatsangCentreID
															REFERENCES	satsang_centres_details,
	sewa_team_id		sewa_team_id		NOT NULL	CONSTRAINT	AdtScanningJobsSewaTeams_FK_SewaTeamID
															REFERENCES	sewa_teams,

		CONSTRAINT	AdtScanningJobsSewaTeams_PK_ScanningJobID_SatsangCentreID_SewaTeamID
			PRIMARY KEY	(	scanning_job_id, satsang_centre_id, sewa_team_id	)
)
GO

CREATE TABLE adt_scanned_badge_file_audit_logs
(
	scanning_job_id			INT				NOT NULL,
	filepath				VARCHAR(MAX)	NOT NULL,
	controlling_dt			SMALLDATETIME	NOT NULL,		
	import_username			VARCHAR(100)	NOT NULL,
	process_dt				DATETIME		NULL,
	process_username		VARCHAR(100)	NULL,

	CONSTRAINT AdtScannedBadgeFileAuditAogs_PK_scanning_job_id PRIMARY KEY NONCLUSTERED 
	(
		scanning_job_id ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


-- =============================================================================
-- vim:ts=4 ht=8 sw=4
