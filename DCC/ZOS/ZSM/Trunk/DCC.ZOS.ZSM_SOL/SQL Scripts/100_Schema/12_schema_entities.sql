/* ==================================================================================
    Source File		:	schema.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sun Nov 07 08:20:33 IST 2010
    Last updated	:	Oct 16, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	JL
    Reviewed On		:	Nov 29, 2010
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

		Following entities are to be used from CDB:
			Entity					Table(s)
			~~~~~~~~~~~~~~~~~		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
			Countries				countries
			States					states
			District / Cities		district_or_cities
			Patrons					patrons
			Skills					skills
			Occupations				occupations
			Relations				relations
			Satsang Centres			satsang_centre_types, satsang_centres
			Qualifications			qualification_types, qlfctn_subjects, qualifications, qualifications_qlfctn_subjects
			Initiatiion Places		initiation_places

			??????? below entities may be used in future
			Person Titles			person_titles
			Marital Status			marital_status
			Languages				languages
			Measuring Units			measuring_units
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
	AK/JL : 15, 16-Oct-2014
		*	Table medical_disabilities has been added.
	v1.13 JL : 30-Jun-2014
		*	Trigger definitions for open_sewadar_current_seq_id and trainee_current_seq_id columns
			of table sewas have been added.
	v1.12 JL : 10-Jan-2014
		*	Table sewa_shifts_valid_combinations has been added.
	v1.11 JL : 27-Dec-2013
		*	Two tables _data_operations and _data_operations_tables have been added to support keeping of count of
			records before and after operation.
	v1.10 JL : 17-Sep-2013
		*	Check Constraint Sewas_CK_AttendanceMarking_SummaryTs_DeleteTs_LockedDtm has been changed for it to work for Computed Sewas.
	v1.09 JL : 22-Jan-2013
		*	NULLable Column credit_group_nm has been added.
	v1.08 JL : 06-Jan-2013
		*	NULLable Column presence_sewa_id has been added along with a Check Constraint and a Foreign Key Constraint.
	v1.07 JL : 10-Feb-2012
		*	Check Constraint Sewas_CK_ReferredSewaID_AttendanceMarking on Sewas table has been changed as
			it was not proper.
	v1.06 JL : 12-Jan-2012
		*	Column are_outstation_sewadars_allowed has been added to table badge_templates.
	v1.05 MS : 26-Dec-2011
		*	Table centres_tables_id_changes added.
	v1.04 JL : 22-Dec-2011
		*	Table satsang_centres_seeds added.
	v1.03 JL : 10-Dec-2011
			* In table sewas, columns trainee_current_sequence_id and open_sewadar_current_sequence_id.
			  have been added along with referential constraints to table sequence_controlling_information.
			* Column sewa_id (NULLable) has been added to table sequence_controlling_information along with referential constraint.
	v1.02 MS/JL : 26-Dec-2010
			*	In table weekly_sewa_locations
					- Made Primary Key column as Identity Column
					- Added constraint WeeklySewaLocations_UK_WeeklySewaLocationNm_SatsangCentreId
	v1.01 MS/JL	: 23-Dec-2010
			*	In table sewas
					- type of column sewa_nm changed to gnc_long_nm
					- commented constraint Sewas_CK_AttendanceMarking_SummaryTs
	v1.00 JL : 07-29-Nov-2010
			*   Initial versions
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- NOTE. This table stores the different Colours
--	No front-end screen is required for this initially.
-- =============================================================================

CREATE	TABLE	colours
(
	colour_id			colour_id			NOT NULL	CONSTRAINT	Colours_PK_ColourID
															PRIMARY KEY	NONCLUSTERED,
	colour_nm			gnc_short_nm		NOT NULL,
	red_component		colour_component	NOT	NULL,
	green_component		colour_component	NOT	NULL,
	blue_component		colour_component	NOT	NULL,

	remarks				remarks					NULL,

	effective_from		DATETIME			NOT NULL	CONSTRAINT	Colours_DF_EffectiveFrom
															DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till		DATETIME			NOT NULL	CONSTRAINT	Colours_DF_EffectiveTill
															DEFAULT '31-Dec-9999',
	txn_ts				TIMESTAMP			NOT NULL,

		CONSTRAINT	Colours_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'Colours_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'colours'
GO


-- =============================================================================
--	Badge Templates for Sewadar Badges
-- =============================================================================

CREATE	TABLE	badge_templates
(
	badge_template_id			badge_template_id	NOT NULL	CONSTRAINT	BadgeTemplates_PK_BadgeTemplateID
																	PRIMARY KEY	NONCLUSTERED,

	badge_template_nm			gnc_nm				NOT NULL	CONSTRAINT	BadgeTemplates_UK_BadgeTemplateNm
																	UNIQUE	NONCLUSTERED,

	badge_shape					VARCHAR (10)		NOT NULL	CONSTRAINT	BadgeTemplates_CK_BadgeShape
																	CHECK	(	badge_shape	IN
																				(
																					'Vertical',
																					'Horizontal',
																					'Triangular'
																				)
																			),

	information_type			VARCHAR (10)		NOT NULL	CONSTRAINT	BadgeTemplates_CK_InformationType
																	CHECK	(	information_type	IN
																				(
																					'Sewadar',
																					'Number',
																					'Range'
																				)
																			),

	foreground_colour_control	ColourControl		NOT NULL,
	foreground_colour_id		colour_id				NULL	CONSTRAINT	BadgeTemplates_FK_ForegroundColourID
																	REFERENCES	colours,

		--- This colour is for top and bottom stripes or for some text which may be printed like  OS for outstation sewadars
	background_colour_control	ColourControl		NOT NULL,

	background_colour_id		colour_id				NULL	CONSTRAINT	BadgeTemplates_FK_BackgroundColourID
																	REFERENCES	colours,

	top_line_font_size			BadgeFontSize		NOT NULL,
	top_line_part_1_type		badge_part_type		NOT NULL	CONSTRAINT	BadgeTemplates_FK_TopLinePart1Type
																	REFERENCES	badge_part_types,
	top_line_part_1_text		badge_text				NULL,
	top_line_parts_separator	Separator				NULL,
	top_line_part_2_type		badge_part_type			NULL	CONSTRAINT	BadgeTemplates_FK_TopLinePart2Type
																	REFERENCES	badge_part_types,
	top_line_part_2_text		badge_text				NULL,

	middle_line_font_size		BadgeFontSize			NULL,
	middle_line_part_1_type		badge_part_type			NULL	CONSTRAINT	BadgeTemplates_FK_MiddleLinePart1Type
																	REFERENCES	badge_part_types,
	middle_line_part_1_text		badge_text				NULL,
	middle_line_parts_separator	Separator				NULL,
	middle_line_part_2_type		badge_part_type			NULL	CONSTRAINT	BadgeTemplates_FK_MiddleLinePart2Type
																	REFERENCES	badge_part_types,
	middle_line_part_2_text		badge_text				NULL,
	
	bottom_line_font_size		BadgeFontSize		NOT NULL,
	bottom_line_part_1_type		badge_part_type		NOT NULL	CONSTRAINT	BadgeTemplates_FK_BottomLinePart1Type
																	REFERENCES	badge_part_types,
	bottom_line_part_1_text		badge_text				NULL,
	bottom_line_parts_separator	Separator				NULL,
	bottom_line_part_2_type		badge_part_type			NULL	CONSTRAINT	BadgeTemplates_FK_BottomLinePart2Type
																	REFERENCES	badge_part_types,
	bottom_line_part_2_text		badge_text				NULL,

	expiry_year					CHAR (4)				NULL,
	is_expiry_year_check		Boolean				NOT NULL	CONSTRAINT	BadgeTemplates_DF_IsExpiryYearCheck
																	DEFAULT	'Yes',

	are_outstation_sewadars_allowed
								Boolean				NOT NULL	CONSTRAINT	BadgeTemplates_DF_AreOutstationSewadarsAllowed
																	DEFAULT	'Yes',
	report_file_nm_front		file_nm				NOT NULL,
	report_file_nm_back			file_nm					NULL,

	procedure_nm_front			procedure_nm		NOT NULL,
	procedure_nm_back			procedure_nm			NULL,

	txn_ts						TIMESTAMP			NOT NULL,

		CONSTRAINT	BadgeTemplates_CK_ForegroundColourControl_ForegroundColourID
			CHECK	(	(	foreground_colour_control = 'Colour'	AND	foreground_colour_id	IS NOT NULL	)
					OR	(	foreground_colour_control <> 'Colour'	AND	foreground_colour_id	IS NULL		)
					),

		CONSTRAINT	BadgeTemplates_CK_BackgroundColourControl_BackgroundColourID
			CHECK	(	(	background_colour_control = 'Colour'	AND	background_colour_id	IS NOT NULL	)
					OR	(	background_colour_control <> 'Colour'	AND	background_colour_id	IS NULL		)
					),

		CONSTRAINT	BadgeTemplates_CK_TopLineSpecification
			CHECK	(	(	top_line_part_2_type IS NULL		AND	top_line_part_2_text	IS NULL				AND	top_line_parts_separator IS NULL	)
					OR	(	top_line_part_2_type IS NOT NULL	AND	top_line_parts_separator	IS NOT NULL
																AND	(	(	top_line_part_2_type	=	'Text'	AND	top_line_part_2_text	IS NOT NULL	)
																	OR	(	top_line_part_2_type	<>	'Text'	AND	top_line_part_2_text	IS NULL		)
																	)
						)
					),

		CONSTRAINT	BadgeTemplates_CK_TopLinePart1Type_TopLinePart1Text
			CHECK	(	(	top_line_part_1_type = 'Text'	AND	top_line_part_1_text	IS NOT NULL	)
					OR	(	top_line_part_1_type <> 'Text'	AND	top_line_part_1_text	IS NULL		)
					),


		CONSTRAINT	BadgeTemplates_CK_MiddleLineSpecification
			CHECK	(	(	middle_line_part_2_type IS NULL		AND	middle_line_part_2_text	IS NULL				AND	middle_line_parts_separator IS NULL	)
					OR	(	middle_line_part_2_type IS NOT NULL	AND	middle_line_parts_separator	IS NOT NULL
																AND	(	(	middle_line_part_2_type	=	'Text'	AND	middle_line_part_2_text	IS NOT NULL	)
																	OR	(	middle_line_part_2_type	<>	'Text'	AND	middle_line_part_2_text	IS NULL		)
																	)
						)
					),

		CONSTRAINT	BadgeTemplates_CK_MiddleLinePart1Type_MiddleLinePart1Text
			CHECK	(	(	middle_line_part_1_type = 'Text'	AND	middle_line_part_1_text	IS NOT NULL	)
					OR	(	middle_line_part_1_type <> 'Text'	AND	middle_line_part_1_text	IS NULL		)
					),

		CONSTRAINT	BadgeTemplates_CK_BottomLineSpecification
			CHECK	(	(	bottom_line_part_2_type IS NULL		AND	bottom_line_part_2_text	IS NULL				AND	bottom_line_parts_separator IS NULL	)
					OR	(	bottom_line_part_2_type IS NOT NULL	AND	bottom_line_parts_separator	IS NOT NULL
																AND	(	(	bottom_line_part_2_type	=	'Text'	AND	bottom_line_part_2_text	IS NOT NULL	)
																	OR	(	bottom_line_part_2_type	<>	'Text'	AND	bottom_line_part_2_text	IS NULL		)
																	)
						)
					),

		CONSTRAINT	BadgeTemplates_CK_BottomLinePart1Type_BottomLinePart1Text
			CHECK	(	(	bottom_line_part_1_type = 'Text'	AND	bottom_line_part_1_text	IS NOT NULL	)
					OR	(	bottom_line_part_1_type <> 'Text'	AND	bottom_line_part_1_text	IS NULL		)
					),

		CONSTRAINT	BadgeTemplates_CK_ReportFileNmBack_ProcedureNmBack
			CHECK	(	(	report_file_nm_back IS NOT NULL	AND	procedure_nm_back	IS NOT NULL	)
					OR	(	report_file_nm_back IS NULL		AND	procedure_nm_back	IS NULL		)
					)
)
GO


-- =============================================================================
--	It stores the badge templates that are valid for sewadars having the status_cd in sewadars_registrations.
-- =============================================================================

CREATE	TABLE	badge_templates_sewadar_status
(
	badge_template_id		badge_template_id	NOT NULL	CONSTRAINT	BadgeTemplatesSewadarStatus_FK_BadgeTemplateID
																REFERENCES	badge_templates,
	sewadar_status_cd		sewadar_status_cd	NOT NULL	CONSTRAINT	BadgeTemplatesSewadarStatus_FK_SewadarStatusCd
																REFERENCES	sewadar_status,

		CONSTRAINT	BadgeTemplatesSewadarStatus_PK_BadgeTemplateID_SewadarStatusCd
			PRIMARY KEY	NONCLUSTERED	(	badge_template_id, sewadar_status_cd	)
)
GO


-- =============================================================================
-- NOTE. This table manages the satsang centres
--	It's screen should be done in conjunction with CDB..satsang_centres, where the top portion
--		comes from CDB. It has one-to-one relationship with CDB..satsang_centres.
-- =============================================================================
CREATE	TABLE	satsang_centres_details
(
		--- Trigger ensures that satsang_centre_id exists in cdb..satsang_centres(Trigger a)
	satsang_centre_id 		satsang_centre_id		NOT NULL	CONSTRAINT	SatsangCentresDetails_PK_SatsangCentreID
																	PRIMARY KEY	NONCLUSTERED,

		--- Main centres are those centres where Babaji's Satsang Programme is there
	is_main_centre			Boolean					NOT NULL	CONSTRAINT	SatsangCentresDetails_DF_IsMainCentre
																	Default 'No',

		---- Name of the Main Centre as to be printed on Badge
	centre_nm 				gnc_nm						NULL,

		---- Alphabet of the Main Centre as to be printed on Badge
	centre_alphabet 		CHAR (1)					NULL,

		---- Code of the Main Centre as to be printed on Badge along with G.R.No.
	centre_cd 				CHAR (3)					NULL,

	reports_to_centre_id	satsang_centre_id			NULL	CONSTRAINT	SatsangCentresDetails_FK_ReportsToSatsangCentreID
																	REFERENCES	satsang_centres_details,
		--- It can be specified for Main Satsang Centre, which can be used in Badges to distinguish these amongst centres
	colour_id				colour_id					NULL	CONSTRAINT	SatsangCentresDetails_FK_Colours
																	REFERENCES	colours,
	remarks					remarks						NULL,

	secretary_signature		IMAGE						NULL,

		CONSTRAINT	SatsangCentresDetails_CK_MainCentre_CentreNm
			CHECK	(	(	is_main_centre	=	'Yes'	AND	centre_nm	IS NOT NULL	)
					OR	(	is_main_centre	=	'No'	AND	centre_nm	IS NULL		)
					),

		CONSTRAINT	SatsangCentresDetails_CK_MainCentre_CentreAlphabet
			CHECK	(	(	is_main_centre	=	'Yes'	AND	centre_alphabet	IS NOT NULL	)
					OR	(	is_main_centre	=	'No'	AND	centre_alphabet	IS NULL		)
					),

		CONSTRAINT	SatsangCentresDetails_CK_MainCentre_CentreCd
			CHECK	(	(	is_main_centre	=	'Yes'	AND	centre_cd	IS NOT NULL	)
					OR	(	is_main_centre	=	'No'	AND	centre_cd	IS NULL		)
					),

		CONSTRAINT	SatsangCentresDetails_CK_MainCentre_ColourID
			CHECK	(	(	is_main_centre	=	'Yes'								)
					OR	(	is_main_centre	=	'No'	AND	colour_id	IS NULL		)
					)
)
GO

EXEC 	sp_addextendedproperty
		'SatsangCentresDetails_CK_MainCentre_CentreNm', 'Centre''s name can only be specified for Main Centre',
		'USER',	'dbo', 'TABLE',	'satsang_centres_details'
GO

EXEC 	sp_addextendedproperty
		'SatsangCentresDetails_CK_MainCentre_CentreAlphabet', 'Centre''s alphabet can only be specified for Main Centre',
		'USER',	'dbo', 'TABLE',	'satsang_centres_details'
GO

EXEC 	sp_addextendedproperty
		'SatsangCentresDetails_CK_MainCentre_CentreCd', 'Centre''s code can only be specified for Main Centre',
		'USER',	'dbo', 'TABLE',	'satsang_centres_details'
GO

-- =============================================================================
-- NOTE. This table manages various functionaries at a Centre
-- =============================================================================

CREATE	TABLE	satsang_centre_functionaries
(
	centre_functionary_id	centre_functionary_id	NOT NULL	IDENTITY (1, 1)
																CONSTRAINT	SatsangCentreFunctionaries_PK_CentreFunctionaryID
																	PRIMARY KEY	NONCLUSTERED,
	satsang_centre_id 		satsang_centre_id		NOT NULL	CONSTRAINT	SatsangCentreFunctionaries_FK_SatsangCentreID
																	REFERENCES	satsang_centres_details,
	centre_functionary		centre_functionary		NOT NULL	CONSTRAINT	SatsangCentreFunctionaries_FK_CentreFunctionary
																	REFERENCES	centre_functionaries,

		--- Full Name of the functionary with at least First and Last Names are specified in the order (first name being first).
	functionary_nm			functionary_nm			NOT NULL,

		--- Trigger should ensure that only one centre_functionary for a Centre is set as current; there should NOT be two more current functionaries for a Centre.(Trigger a)
	is_current				Boolean					NOT NULL	CONSTRAINT	SatsangCentreFunctionaries_DF_IsCurrent
																	DEFAULT	'No',

	telephones				telephone_lines				NULL,
	email_addresses			email_addresses				NULL,

	effective_from			DATETIME				NOT NULL	CONSTRAINT	SatsangCentreFunctionaries_DF_EffectiveFrom
																	DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME				NOT NULL	CONSTRAINT	SatsangCentreFunctionaries_DF_EffectiveTill
																	DEFAULT '31-Dec-9999',

		CONSTRAINT	SatsangCentreFunctionaries_UK_SatsangCentreID_CentreFunctionary
			UNIQUE NONCLUSTERED	(	satsang_centre_id, centre_functionary, effective_from	),

		CONSTRAINT	SatsangCentreFunctionaries_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'SatsangCentreFunctionaries_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'satsang_centre_functionaries'
GO

-- =============================================================================
-- NOTE. These tables manage information related to Sewas.
-- =============================================================================

CREATE	TABLE	sewas
(
	sewa_id						sewa_id				NOT NULL	IDENTITY (1, 1)
																CONSTRAINT	Sewas_PK_SewaID
																	PRIMARY KEY	NONCLUSTERED,

		--- Front-end application ensures that the satsang_centre_id matches with the Satsang Centre passed as the parameter to the application
	satsang_centre_id 			satsang_centre_id	NOT NULL	CONSTRAINT	Sewas_FK_SatsangCentreID
																	REFERENCES	satsang_centres_details,
	sewa_cd						VARCHAR (10)		NOT NULL,
	sewa_nm						gnc_long_nm			NOT NULL,

	start_dt					SMALLDATETIME		NOT NULL,
	finish_dt					SMALLDATETIME		NOT NULL,

	is_satsang_programme		Boolean				NOT NULL,
	is_scanner_used				Boolean				NOT NULL,
	is_leave_allowed			Boolean				NOT NULL,
	is_exemption_allowed		Boolean				NOT NULL,
		---	Trigger ensures that a maximum of only one Sewa for a Satsang Centre can be specified as default (Trigger a)
	is_default_sewa				Boolean				NOT NULL,

	sewa_frequency				sewa_frequency		NOT NULL	CONSTRAINT	Sewas_FK_SewaFrequency
																	REFERENCES	sewa_frequencies,
	attendance_unit				attendance_unit		NOT NULL	CONSTRAINT	Sewas_FK_AttendanceUnit
																	REFERENCES	attendance_units,
	attendance_marking			VARCHAR (10)		NOT NULL	CONSTRAINT	Sewas_CK_AttendanceMarking
																	CHECK	(	attendance_marking	IN	(
																					'Team-wise',	---- Attendance Sheets are maintained
																					'Arbitrary',	---- No attendance sheets are maintained and attendance is recorded for each sewadar
																					'Summary',		---- Directly summary is recorded
																					'Computed'		---- Computations are done for some subset of the referred sewa period
																										)
																			),

	min_sewa_duration			CreditCnt0				NULL,
	max_sewa_duration			CreditCnt				NULL,

		--- If following columns are specified, the respective genders are allowed to do sewa only if they are born after the specified date
	gents_born_after			DATETIME				NULL,
	ladies_born_after			DATETIME				NULL,

			--- Referred Sewa is used for intermediate computations of attendance for a subset period of the referred sewa
			---	Trigger ensures that when computed_sewa_id is specified, (Trigger b)
			---		(a) sewa_frequency, attendance_unit, is_leave_allowed and is_exemption_allowed are same as referred sewa_id
			---		(b) start_dt and finish_dt is a sub-set of referred sewa_id
			---		(c) attendance_marking of referred_sewa_id can not be 'Summary'
	referred_sewa_id			sewa_id					NULL	CONSTRAINT	Sewas_FK_ReferredSewaID
																	REFERENCES	sewas,

		--- Trigger ensures that the following sequence_ids, when specified (or changed), do not already
		--- exist for the Satsang Centre. (Triggers c and d)
	trainee_current_seq_id 		sequence_id				NULL,
	open_sewadar_current_seq_id sequence_id				NULL,

		--- Following are timestamps that are set automatically through triggers / stored procedures and help
		--- in determining the state of summaries, attendance, etc.
	attendance_ts				DATETIME				NULL,	--- Last time when attendance is recorded
	summary_ts					DATETIME				NULL,	--- Last time when summary is generated
	deleted_ts					DATETIME				NULL,	--- The time when actual attendance records have been deleted
	
		--- If this is set, the attendance can neither be recorded nor altered.
	locked_dtm					DATETIME				NULL,
	txn_ts						TIMESTAMP			NOT NULL,


		CONSTRAINT	Sewas_U1_SatsangCentreID_SewaCd
			UNIQUE	NONCLUSTERED	(	satsang_centre_id, sewa_cd	),

		CONSTRAINT	Sewas_U2_SatsangCentreID_SewaNm
			UNIQUE	NONCLUSTERED	(	satsang_centre_id, sewa_nm	),

		CONSTRAINT	Sewas_CK_StartDt_FinishDt
			CHECK	(	start_dt <= finish_dt	),

		---- Following contraint is a culmination of the attendance order (P->E->L->A)
		CONSTRAINT	Sewas_CK_LeaveExemption
			CHECK	(	(	is_exemption_allowed = 'No' AND is_leave_allowed = 'No'	)
					OR	(	is_exemption_allowed = 'Yes'							)
					),

		CONSTRAINT	Sewas_CK_ReferredSewaID_AttendanceMarking
			CHECK	(	(	referred_sewa_id	IS NULL		AND	attendance_marking	!=	'Computed'	)
					OR	(	referred_sewa_id	IS NOT NULL	AND	attendance_marking	=	'Computed'	)
					),

		CONSTRAINT	Sewas_CK_MinSewaDuration_MaxSewaDuration
			CHECK	(	min_sewa_duration <= max_sewa_duration
					),

	--	CONSTRAINT	Sewas_CK_AttendanceMarking_SummaryTs
	--		CHECK	(	(	summary_ts	IS NULL		AND	attendance_marking	IN	(	'Summary', 'Computed'		)	)
	--				OR	(	summary_ts	IS NOT NULL	AND	attendance_marking	IN	(	'Arbitrary', 'Team-wise'	)	)
	--				),

		CONSTRAINT	Sewas_CK_AttendanceMarking_SummaryTs_DeleteTs_LockedDtm
			CHECK	(	(	deleted_ts	IS NULL		)
					OR	(	deleted_ts	IS NOT NULL	AND	attendance_marking	IN	(	'Arbitrary', 'Team-wise', 'Computed'	)
													AND	summary_ts	IS NOT NULL
													AND	summary_ts	<	deleted_ts
													AND	locked_dtm	IS NOT NULL
						)
					)
)
GO

EXEC 	sp_addextendedproperty
		'Sewas_CK_AttendanceMarking', '"Attendance Marking" can be either Team-wise, Arbitrary, Summary or Computed',
		'USER',	'dbo', 'TABLE',	'sewas'
GO

EXEC 	sp_addextendedproperty
		'Sewas_CK_StartDt_FinishDt', 'Start Date must be earlier than or same as Finish Date',
		'USER',	'dbo', 'TABLE',	'sewas'
GO

EXEC 	sp_addextendedproperty
		'Sewas_CK_LeaveExemption', 'If Exemption is not allowed, Leave can not be allowed too',
		'USER',	'dbo', 'TABLE',	'sewas'
GO

EXEC 	sp_addextendedproperty
		'Sewas_CK_ReferredSewaID_AttendanceMarking', '"Attendance Marking" can be specified as Computed only if Referred Sewa is specified',
		'USER',	'dbo', 'TABLE',	'sewas'
GO

EXEC 	sp_addextendedproperty
		'Sewas_CK_MinSewaDuration_MaxSewaDuration', 'Minimum Sewa Duration must be less than or same as Maximum Sewa Duration',
		'USER',	'dbo', 'TABLE',	'sewas'
GO

--EXEC 	sp_addextendedproperty
--		'Sewas_CK_AttendanceMarking_SummaryTs', 'Arbitrary and Team-wise Sewas can be summarised, and Sewas where Attendance Marking is Sumamry or Computed can NOT be summarised',
--		'USER',	'dbo', 'TABLE',	'sewas'
--GO

EXEC 	sp_addextendedproperty
		'Sewas_CK_AttendanceMarking_SummaryTs_DeleteTs_LockedDtm', 'When Sewa records are deleted for Arbitrary, Team-wise or Computed Sewas, the Sewa should have been locked and summarised',
		'USER',	'dbo', 'TABLE',	'sewas'
GO


-- =============================================================================
--	Trigger ensures that periods for a Sewa are specified for sewas.attendance_marking IN ('Team-wise', 'Arbitrary') (Trigger a)
--	Trigger ensures that periods for a Sewa are non-overlapping (Trigger c)
--	Trigger ensures that periods for a Sewa are contained between start_dt/finish_dt of the sewa(Trigger b)
-- =============================================================================

CREATE	TABLE 	sewas_periods
(
	sewa_id			sewa_id				NOT NULL	CONSTRAINT	SewasPeriods_FK_SewaID
														REFERENCES	sewas,
	start_dt		SMALLDATETIME 		NOT NULL,
	finish_dt		SMALLDATETIME		NOT NULL,

		CONSTRAINT	SewasPeriods_PK_SewaID_StartDt
			PRIMARY KEY	NONCLUSTERED	(	sewa_id, start_dt	),

		CONSTRAINT	SewasPeriods_CK_StartDt_FinishDt
			CHECK	(	start_dt <= finish_dt	)
)
GO


-- =============================================================================
--	Trigger ensures that shifts for a Sewa are specified for sewas.attendance_unit = 'Shift'(Trigger a)
-- =============================================================================

CREATE	TABLE 	sewas_sewa_shifts
(
	sewa_id			sewa_id				NOT NULL	CONSTRAINT	SewasSewaShifts_FK_SewaID
														REFERENCEs	sewas,
	sewa_shift		sewa_shift			NOT NULL	CONSTRAINT	SewasSewaShifts_FK_SewaShift
														REFERENCES	sewa_shifts,
	sewa_shift_sq	display_order		NOT NULL,

		--- credit_cnt is the number of credits for unit_cnt number of shifts
	credit_cnt		CreditCnt			NOT NULL,	---- Numerator
	unit_cnt		CreditCnt			NOT NULL,	---- Denominator

		CONSTRAINT	SewasSewaShifts_PK_SewaID_SewaShift
			PRIMARY KEY	NONCLUSTERED	(	sewa_id, sewa_shift	),

		CONSTRAINT	SewasSewaShifts_UK_SewaID_SewaShiftSq
			UNIQUE	NONCLUSTERED	(	sewa_id, sewa_shift_sq	)
)
GO


-- =============================================================================
--	This stores the Satsang Centres that are allowed to do Sewa apart from the Main Centre where Sewa is taking place;
--	however, it contains a record for the main centre also.
-- =============================================================================

CREATE	TABLE	sewas_satsang_centres
(
	sewa_id					sewa_id				NOT NULL	CONSTRAINT	SewasSatsangCentres_FK_SewaID
																REFERENCEs	sewas,
	satsang_centre_id 		satsang_centre_id	NOT NULL	CONSTRAINT	SewasSatsangCentres_FK_SatsangCentreID
																REFERENCES	satsang_centres_details,

		CONSTRAINT	SewasSatsangCentres_PK_SewaID_SatsangCentreID
			PRIMARY KEY	NONCLUSTERED	(	sewa_id, satsang_centre_id	)
)
GO

-- =============================================================================
--	This table stores the valid combinations of sewas_sewa_shifts.
--	A trigger arbitrary_shift_presences_j_iu catches the INVALID combination, and prevents the entry in table arbitrary_shift_presences.
-- =============================================================================
CREATE	TABLE sewa_shifts_valid_combinations
(
	sewa_id					sewa_id				NOT NULL,
	recorded_sewa_shift		sewa_shift			NOT NULL,
	recording_sewa_shift	sewa_shift			NOT NULL,
	
		CONSTRAINT	SewaShiftsValidCombinations_PK_SewaID_RecordedSewaShift_RecordingSewaShift
			PRIMARY KEY	CLUSTERED	(	sewa_id, recorded_sewa_shift, recording_sewa_shift	),
			
		CONSTRAINT 	SewaShiftsValidCombinations_FK_SewaID_RecordedSewaShift
			FOREIGN KEY	(	sewa_id, recorded_sewa_shift	)
				REFERENCES	sewas_sewa_shifts,
				
		CONSTRAINT 	SewaShiftsValidCombinations_FK_SewaID_RecordingSewaShift
			FOREIGN KEY	(	sewa_id, recording_sewa_shift	)
				REFERENCES sewas_sewa_shifts
)
GO


-- =============================================================================
-- Tables for Credits Specifications
-- =============================================================================

CREATE	TABLE	credit_specifications
(
	credit_specification_id		credit_specification_id		NOT NULL	IDENTITY (1001, 1)	
																		CONSTRAINT	CreditSpecifications_PK_CreditSpecificationID
																			PRIMARY KEY	NONCLUSTERED,
	credit_specification_nm		gnc_nm						NOT NULL,

	credit_specification_dt		SMALLDATETIME				NOT NULL,

		--- Front-end application ensures that the satsang_centre_id matches with the Satsang Centre passed as the parameter to the application
	satsang_centre_id 			satsang_centre_id			NOT NULL	CONSTRAINT	CreditSpecifications_FK_SatsangCentreID
																			REFERENCES	satsang_centres_details,

		--- Appointments till this date are only considered for computations
	last_appointment_dt			SMALLDATETIME				NOT NULL,

	credit_group_nm				gnc_nm							NULL,

		--- If is_uniform_specification is Yes, the values of the three columns credit_cnt,
		--- unit_cnt and is_exemption_considered remain same for QUALIFYING criteria for ALL the sewas
		--- considered. On the other hand, these values act as defaults for each of the sewas
		--- in the front-end.
	is_uniform_specification	Boolean						NOT NULL,

		--- Whether the criteria is for Local or Outstation Sewadars. In case, if the value is not specified,
		--- it means that the criteria is for Local as well as Outstation sewadars.
	is_outstation_sewadar		Boolean							NULL,

		--- credit_cnt is the number of credits for unit_cnt number of units of attendance.
	credit_cnt					CreditCnt					NOT NULL,	---- Numerator
	unit_cnt					CreditCnt					NOT NULL,	---- Denominator

		--- Trigger ensures that is_exemption_considered MUST be No when sewas.is_exemption_allowed is No(Trigger b)
	is_exemption_considered		Boolean						NOT NULL,
	
		--- Trigger ensures that satsang_centre_id of credit_specifications matches with that of sewas(Trigger a)
	presence_sewa_id			sewa_id							NULL	CONSTRAINT	CreditSpecifications_FK_PresenceSewaID
																			REFERENCES	sewas,

		--- This specifies the overall qualifying criteria for all sewas.
		--- If such criteria does not exist, it should NOT be specified.
	min_credit_cnt				CreditCnt						NULL,

		--- Trigger: Columns for timestamps which are automatically set through trigger(s)/procedure(s)
		--- Set on initial INSERT and on each UPDATE(Trigger DML a & b)
	specification_ts			DATETIME					NOT NULL,

		--- Set through Procedure ComputeCredits.
	computation_ts				DATETIME						NULL,

		--- This is what has been finally used; others can be deleted.
	is_finally_used				Boolean							NULL,

	txn_ts						TIMESTAMP					NOT NULL,

		CONSTRAINT	CreditSpecifications_UK_SatsangCentreID_CreditSpecificationNme
			UNIQUE	NONCLUSTERED	(	satsang_centre_id, credit_specification_nm	),

		CONSTRAINT	CreditSpecifications_CK_IsExemptionAllowed_PresenceSewaID
			CHECK	(	(	is_exemption_considered	=	'Yes'	)
					OR	(	is_exemption_considered	=	'No'	AND	presence_sewa_id	IS NULL	)
					)
)
GO


-- =============================================================================
---- Front-end application ensures that the credit specifications (the three columns, viz., credit_cnt, unit_cnt
--		and is_exemption_considered) should NOT be editable for all the sewas, if credit_specifications.is_uniform_specification is Yes
-- =============================================================================

CREATE	TABLE	credit_specifications_sewas
(
	credit_specification_id		credit_specification_id		NOT NULL	CONSTRAINT	CreditSpecificationsSewas_FK_CreditSpecificationID
																			REFERENCES	credit_specifications,

		--- Trigger ensures that satsang_centre_id of credit_specifications matches with that of sewas (Trigger a)
	sewa_id						sewa_id						NOT NULL	CONSTRAINT	CreditSpecificationsSewas_FK_SewaID
																			REFERENCEs	sewas,

	credit_cnt					CreditCnt					NOT	NULL,	---- Numerator
	unit_cnt					CreditCnt					NOT	NULL,	---- Denominator

			---- Trigger ensures that this MUST be No when sewas.is_exemption_allowed is No (Trigger b)
	is_exemption_considered		Boolean						NOT NULL,

	min_credit_cnt				CreditCnt0					NOT NULL,	---- determines the minimum credits for eligibility
	max_credit_cnt				CreditCntF					NOT NULL,	---- determines the maximum credits for eligibility

		CONSTRAINT	CreditSpecificationsSewas_PK_CreditSpecificationID_SewaID
			PRIMARY KEY	NONCLUSTERED	(	credit_specification_id, sewa_id	)
)
GO

-- =============================================================================
-- NOTE. One screen will manage departments and sub-departments
-- =============================================================================

CREATE	TABLE	departments
(
	department_id				department_id	NOT NULL	IDENTITY (101, 1)
															CONSTRAINT	Departments_PK_DepartmentID
																PRIMARY KEY	NONCLUSTERED,
	department_cd				VARCHAR (5)		NOT NULL	CONSTRAINT	Departments_U1_DepartmentCd
																UNIQUE	NONCLUSTERED,
	department_nm 				gnc_nm			NOT NULL	CONSTRAINT	Departments_U2_DepartmentNm
																UNIQUE	NONCLUSTERED,
	colour_id					colour_id		NOT NULL	CONSTRAINT	Departments_FK_Colours
																REFERENCES	colours,
	has_sub_departments			Boolean			NOT NULL,

	remarks						remarks				NULL,

	txn_ts						TIMESTAMP		NOT NULL
)
GO

-- =============================================================================

CREATE	TABLE	departments_satsang_centres
(
	department_id			department_id		NOT NULL	CONSTRAINT	DepartmentsSatsangCentres_FK_DepartmentID
																REFERENCES	departments,
	satsang_centre_id 		satsang_centre_id	NOT NULL	CONSTRAINT	DepartmentsSatsangCentres_FK_SatsangCentreID
																REFERENCES	satsang_centres_details,
	genders_allowed				CHAR (1)		NOT NULL	CONSTRAINT	DepartmentsSatsangCentres_CK_GendersAllowed
																CHECK	(	genders_allowed		IN	(	'M',	---- Males only
																										'F',	---- Females only
																										'%'		---- Both
																									)
																		),
	is_common_roster			Boolean			NOT NULL,

		---- This is set for all the departments that operate usually for Babaji's Satsang Programmes
	is_generic					Boolean			NOT NULL,

		---- This is set for all the departments that operate for weekly satsangs
	is_weekly					Boolean			NOT NULL,

		--- LATER: Trigger ensures that this column can only be specified for only those Departments that have Sub-departments
		--- If set, the Sub-Deparment MUST be specified along with the Department
	sub_department_mandatory	Boolean				NULL,

	effective_from				DATETIME		NOT NULL	CONSTRAINT	Departments_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till				DATETIME		NOT NULL	CONSTRAINT	Departments_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	DepartmentsSatsangCentres_PK_DepartmentID_SatsangCentreID
			PRIMARY KEY NONCLUSTERED	(	department_id, satsang_centre_id	),

		CONSTRAINT	DepartmentsSatsangCentres_CK_IsCommonRoster
			CHECK	(	(	genders_allowed	IN	(	'M', 'F'	)	AND	is_common_roster	=	'No'	)
					OR	(	genders_allowed	=	'%'														)
					),

		CONSTRAINT	DepartmentsSatsangCentres_CK_IsGeneric_IsWeekly
			CHECK	(	(	is_generic	=	'Yes'	)
					OR	(	is_generic	=	'No'	AND	is_weekly	=	'Yes'	)
					),

		CONSTRAINT	Departments_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'DepartmentsSatsangCentres_CK_IsCommonRoster', 'Common Roster can only be specified for Departments that have Males as well as Females',
		'USER',	'dbo', 'TABLE',	'departments_satsang_centres'
GO

EXEC 	sp_addextendedproperty
		'DepartmentsSatsangCentres_CK_IsGeneric_IsWeekly', 'The department that is not generic must be a weekly department',
		'USER',	'dbo', 'TABLE',	'departments_satsang_centres'
GO

EXEC 	sp_addextendedproperty
		'DepartmentsSatsangCentres_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'departments_satsang_centres'
GO

-- =============================================================================
--	A department may NOT have sub-departments. Hence, this table stores the records
--	for those departments only that have sub-departments.
--	Trigger ensures that the departments.has_sub_departments = 'Yes' (Trigger a)
--  Trigger ensures that the effective_period (effective_from and effective_till) is 
--				a sub-set of the corresponding effective_period of the department.(Trigger b)
-- =============================================================================


CREATE	TABLE	sub_departments
(
	sub_department_id	department_id	NOT NULL	IDENTITY (1, 1)
													CONSTRAINT	SubDepartments_PK_SubDepartmentID
														PRIMARY KEY	NONCLUSTERED,
	department_id		department_id	NOT NULL	CONSTRAINT	SubDepartments_FK_DepartmentID
														REFERENCES	departments,
	sub_department_cd	VARCHAR (5)		NOT NULL,
	sub_department_nm 	gnc_nm			NOT NULL,

	remarks				remarks				NULL,

		CONSTRAINT	SubDepartments_U1_DepartmentID_SubDepartmentCd
			UNIQUE NONCLUSTERED		(	department_id, sub_department_cd	),

		CONSTRAINT	SubDepartments_U2_DepartmentID_SubDepartmentNm
			UNIQUE NONCLUSTERED		(	department_id, sub_department_nm	)
)
GO


-- =============================================================================
--	Trigger ensures that the effective_period (effective_from and effective_till) is 
--				a sub-set of the corresponding effective_period of the department(Trigger a)
-- =============================================================================

CREATE	TABLE	sub_departments_satsang_centres
(
	sub_department_id		department_id			NOT NULL	CONSTRAINT	SubDepartmentsSatsangCentres_FK_SubDepartmentID
																	REFERENCES	sub_departments,
	satsang_centre_id 		satsang_centre_id		NOT NULL	CONSTRAINT	SubDepartmentsSatsangCentres_FK_SatsangCentreID
																	REFERENCES	satsang_centres_details,

	effective_from			DATETIME				NOT NULL	CONSTRAINT	SubDepartmentsSatsangCentres_DF_EffectiveFrom
																	DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME				NOT NULL	CONSTRAINT	SubDepartmentsSatsangCentres_DF_EffectiveTill
																	DEFAULT '31-Dec-9999',

		CONSTRAINT	SubDepartmentsSatsangCentres_PK_SubDepartmentID_SatsangCentreID
			PRIMARY KEY NONCLUSTERED	(	sub_department_id, satsang_centre_id	),

		CONSTRAINT	SubDepartmentsSatsangCentres_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'SubDepartmentsSatsangCentres_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'sub_departments'
GO


-- =============================================================================
--	NOTE. Post Offices or Cities that are used to form address
-- =============================================================================

CREATE	TABLE	post_offices_or_cities
(
	post_office_or_city_id 	post_office_or_city_id	NOT NULL	IDENTITY (1, 1)			---- Starting from 1001 to allow for migration data
																CONSTRAINT	PostOfficesOrCities_PK_PostOfficeOrCityID
																	PRIMARY KEY	NONCLUSTERED,
		--- Trigger ensures that the district_id exists in CDB..districts_or_cities(Trigger a)
	district_id 			district_id				NOT NULL,

	post_office_or_city_cd 	VARCHAR (10)			NOT NULL,
	post_office_or_city_nm 	gnc_nm					NOT NULL,

	std_code				VARCHAR (10)				NULL,

	effective_from			DATETIME				NOT NULL	CONSTRAINT	PostOfficesOrCities_DF_EffectiveFrom
																	DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME				NOT NULL	CONSTRAINT	PostOfficesOrCities_DF_EffectiveTill
																	DEFAULT '31-Dec-9999',
	txn_ts					TIMESTAMP				NOT NULL,

		CONSTRAINT	PostOfficeOrCities_U1_DistrictID_PostOfficeOrCityCd
			UNIQUE	NONCLUSTERED	(	district_id, post_office_or_city_cd	),

		CONSTRAINT	PostOfficeOrCities_U1_DistrictID_PostOfficeOrCityNm
			UNIQUE	NONCLUSTERED	(	district_id, post_office_or_city_nm	),

		CONSTRAINT	PostOfficesOrCities_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'PostOfficesOrCities_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'post_offices_or_cities'
GO


-- =============================================================================
--	Sequences for generating GR Numbers
-- =============================================================================

CREATE	TABLE	sequence_controlling_information
(
		--- Trigger ensures that the satsang_centre_id has is_main_centre set to Yes(Trigger a)
	satsang_centre_id	satsang_centre_id	NOT NULL	CONSTRAINT	SequenceControllingInformation_FK_SatsangCentreID
															REFERENCES	satsang_centres_details,
	sequence_id 		sequence_id			NOT NULL,

		---- It is specified for Trainee and Open Sewadars
	sewa_id				sewa_id					NULL	CONSTRAINT	SequenceControllingInformation_FK_SewaID
															REFERENCES	sewas,
	last_no				INTEGER				NOT NULL,

		CONSTRAINT	SequenceControllingInformation_PK_SatsangCentreID_SequenceID
			PRIMARY KEY	NONCLUSTERED	(	satsang_centre_id, sequence_id	)
)
GO


-- =============================================================================
-- NOTE. This table manages the sewa exemptions.
-- =============================================================================

CREATE	TABLE	sewa_exemptions
(
	sewa_exemption_id			sewa_exemption_id		NOT NULL	IDENTITY (1, 1)
																	CONSTRAINT	SewaExemptions_PK_SewaExemptionID
																		PRIMARY KEY	NONCLUSTERED,
	sewa_exemption_nm			gnc_nm					NOT NULL,

	sewa_exemption_description	remarks						NULL,

	sewa_exemption_type			VARCHAR (10)			NOT NULL	CONSTRAINT	SewaExemptions_CK_SewaExemptionType
																		CHECK	(	sewa_exemption_type	IN	(	'Life-time',	---	Once granted, it is applicable till sewadar is active
																												'Duration',		--- Applicable for certain period like mothers of infant(s)/young child(ren)
																												'Once only'		--- Given on the basis of application to individuals
																											)
																				),
		--- Yes means that it is applicable for only certain sewas (Applicable for specific Sewas?), and in such a case, sewas are specified in sewa_exemptions_applicable_sewas.
		--- Thus a sewadar can use this exemption if a record exists for that sewa in the table below.
	sewa_applicability			Boolean					NOT NULL,

	is_computed					Boolean					NOT NULL	CONSTRAINT	SewaExemptions_DF_IsComputed
																		DEFAULT	'No',
	effective_from				DATETIME				NOT NULL	CONSTRAINT	SewaExemptions_DF_EffectiveFrom
																		DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till				DATETIME				NOT NULL	CONSTRAINT	SewaExemptions_DF_EffectiveTill
																		DEFAULT '31-Dec-9999',
	txn_ts						TIMESTAMP				NOT NULL,

		CONSTRAINT	SewaExemptions_CK_ComputationSequence_SewaApplicability
			CHECK	(	effective_from <= effective_till	),

		CONSTRAINT	SewaExemptions_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'SewaExemptions_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'sewa_exemptions'
GO

-- =============================================================================

CREATE	TABLE	sewa_exemptions_applicable_sewas
(
	sewa_exemption_id	sewa_exemption_id	NOT NULL	CONSTRAINT	SewaExemptionApplicableSewas_FK_SewaExemptionID
															REFERENCEs	sewa_exemptions,

		--- Trigger ensures that the sewa.attendance_marking != Computed(Trigger a)
	sewa_id				sewa_id				NOT NULL	CONSTRAINT	SewaExemptionApplicableSewas_FK_SewaID
															REFERENCEs	sewas,

		--- Trigger ensures that the exemption_days are ONLY specified when sewa_exemptions.is_computed = Yes(Trigger b)
		---		   The days specified here are used for giving these days of exemptions to respective sewadars.
	exemption_days		CreditCntF				NULL,

		CONSTRAINT	SewaExemptionApplicableSewas_PK_SewaExemptionID_SewaID
			PRIMARY KEY	NONCLUSTERED	(	sewa_exemption_id, sewa_id	)
)
GO

-- =============================================================================
-- NOTE. This table manages the weekly sewa locations.
-- =============================================================================

CREATE	TABLE	weekly_sewa_locations
(
	weekly_sewa_location_id		weekly_sewa_location_id		NOT NULL	IDENTITY (1,1)
																		CONSTRAINT	WeeklySewaLocations_PK_WeeklySewaLocationID
																			PRIMARY KEY	NONCLUSTERED,
	weekly_sewa_location_nm		gnc_nm						NOT NULL,

	satsang_centre_id 			satsang_centre_id				NULL	CONSTRAINT	WeeklySewaLocations_FK_SatsangCentreID
																			REFERENCES	satsang_centres_details,
	remarks						remarks							NULL,

	effective_from				DATETIME					NOT NULL	CONSTRAINT	WeeklySewaLocations_DF_EffectiveFrom
																			DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till				DATETIME					NOT NULL	CONSTRAINT	WeeklySewaLocations_DF_EffectiveTill
																			DEFAULT '31-Dec-9999',
	txn_ts						TIMESTAMP					NOT NULL,

		CONSTRAINT	WeeklySewaLocations_UK_WeeklySewaLocationNm_SatsangCentreId
			UNIQUE	NONCLUSTERED	(	weekly_sewa_location_nm, satsang_centre_id	),
		CONSTRAINT	WeeklySewaLocations_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'WeeklySewaLocations_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'weekly_sewa_locations'
GO

-- =============================================================================
--	This stores the Satsang Centres that are allowed to do use the Generic Attributes to be specified for that Centre.
-- =============================================================================

CREATE	TABLE	generic_attributes_satsang_centres
(
	attribute_id			attribute_id		NOT NULL	CONSTRAINT	GenericAttributesSatsangCentres_FK_AttributeID
																REFERENCEs	generic_attributes,
	satsang_centre_id 		satsang_centre_id	NOT NULL	CONSTRAINT	GenericAttributesSatsangCentres_FK_SatsangCentreID
																REFERENCES	satsang_centres_details,
	effective_from			DATETIME			NOT NULL	CONSTRAINT	GenericAttributesSatsangCentres_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	GenericAttributesSatsangCentres_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	GenericAttributesSatsangCentres_PK_GenericAttributeID_SatsangCentreID
			PRIMARY KEY	NONCLUSTERED	(	attribute_id, satsang_centre_id	),

		CONSTRAINT	GenericAttributesSatsangCentres_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'GenericAttributesSatsangCentres_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'generic_attributes_satsang_centres'
GO


-- =============================================================================
--	This stores a record for seed_value of identity columns of selected ZSM tables
---	The seed_value is stored / used / changed during export, import of data.
---- It is applicable for tables that are partitioned.
-- =============================================================================

CREATE	TABLE	satsang_centres_seeds
(
	satsang_centre_id	satsang_centre_id	NOT NULL		CONSTRAINT	SatsangCentresSeeds_FK_SatsangCentreID
																REFERENCES	satsang_centres_details,
		--- Contains the name of the table
	object_id			VARCHAR (50)		NOT NULL,
	min_value			INTEGER				NOT NULL,
	max_value			INTEGER				NOT NULL,
	seed_value			INTEGER				NOT NULL,

		--- Specifies that the range for the object is for the Zonal Office, and can thus
		--- exist in the Centre's data also; this may happen when Centre's information is created in the Zonal Office before exporting.
	is_zone				Boolean				NOT NULL,

		CONSTRAINT	SatsangCentresSeeds_PK_SatsangCentreID_ObjectID
			PRIMARY KEY	NONCLUSTERED	(	satsang_centre_id, object_id	),

		CONSTRAINT	SatsangCentresSeeds_CK_MinValue_MaxValue
			CHECK	(	min_value	<=	max_value	),

		CONSTRAINT	SatsangCentresSeeds_CK_SeedValue_MinValue_MaxValue
			CHECK	(	seed_value	BETWEEN	min_value	AND	max_value	)
)
GO

EXEC 	sp_addextendedproperty
		'SatsangCentresSeeds_CK_MinValue_MaxValue', 'Minimum Seed Value should be smaller Maximum Seed Value',
		'USER',	'dbo', 'TABLE',	'satsang_centres_seeds'
GO

EXEC 	sp_addextendedproperty
		'SatsangCentresSeeds_CK_SeedValue_MinValue_MaxValue', 'Seed Value should be between Minimum and Maximum Seed Values',
		'USER',	'dbo', 'TABLE',	'satsang_centres_seeds'
GO

-- =============================================================================

-- =============================================================================
--	This stores a record for any change in the id of the entries in selected ZSM tables in Centre's db.
---	The ids are changed during import, export of data.
-- =============================================================================

CREATE	TABLE	centres_tables_id_changes
(
	satsang_centre_id	satsang_centre_id	NOT NULL		CONSTRAINT	CentresTablesIdChanges_FK_SatsangCentreID
																REFERENCES	satsang_centres_details,
		--- Contains the name of the table
	object_id			VARCHAR (50)		NOT NULL,
	changed_on			DATETIME			NOT NULL		CONSTRAINT	CentresTablesIdChanges_DF_ChangedOn
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	imported_id			INTEGER				NOT NULL,
	exported_id			INTEGER				NOT NULL,

		CONSTRAINT	CentresTablesIdChanges_PK_SatsangCentreID_ObjectID_ImportedID
			PRIMARY KEY	NONCLUSTERED	(	satsang_centre_id, object_id, imported_id	),
		CONSTRAINT	CentresTablesIdChanges_UK_ObjectID_ExportedID
			UNIQUE	NONCLUSTERED		(	object_id, exported_id	)

)
GO

-- =============================================================================
--	Tables for keeping the counts of records before and after ZSM operations like Import, Copy, etc.
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

-- =============================================================================
--	Medical Disabilities for Sewadar Details
-- =============================================================================

CREATE	TABLE	medical_disabilities
(
	medical_disability_id				medical_disability_id	NOT NULL 	IDENTITY (1, 1)
																			CONSTRAINT	MedicalDisabilities_PK_MedicalDisabilityID
																				PRIMARY KEY	NONCLUSTERED,
	
	medical_disability_nm 				gnc_long_nm				NOT NULL	CONSTRAINT	MedicalDisabilities_U1_MedicalDisabilityName
																				UNIQUE	CLUSTERED,

	medical_disability_cd				VARCHAR (10)			NOT NULL	CONSTRAINT	MedicalDisabilities_U2_MedicalDisabilityCode
																				UNIQUE	NONCLUSTERED,

	effective_from						DATETIME				NOT NULL	CONSTRAINT	MedicalDisabilities_DF_EffectiveFrom
																				DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till						DATETIME				NOT NULL	CONSTRAINT	MedicalDisabilities_DF_EffectiveTill
																				DEFAULT '31-Dec-9999',
	txn_ts								TIMESTAMP				NOT NULL,

	CONSTRAINT	MedicalDisabilities_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO
-- =============================================================================
--	Other Address Proofs for Sewadar Details
-- =============================================================================

CREATE	TABLE	other_address_proofs
(

	address_proof_id				address_proof_id		NOT NULL 	IDENTITY (1, 1)
																		CONSTRAINT	OtherAddressProofs_PK_AddressProofID
																			PRIMARY KEY	NONCLUSTERED,
	address_proof_nm 				gnc_long_nm				NOT NULL	CONSTRAINT	OtherAddressProofs_U1_AddressProofName
																			UNIQUE	CLUSTERED,
	address_proof_cd				VARCHAR (10)			NOT NULL	CONSTRAINT	OtherAddressProofs_U2_AddressProofCode
																			UNIQUE	NONCLUSTERED,
	effective_from					DATETIME				NOT NULL	CONSTRAINT	OtherAddressProofs_DF_EffectiveFrom
																			DEFAULT CONVERT (VARCHAR (11), GetDate(), 106),
	effective_till					DATETIME				NOT NULL	CONSTRAINT	OtherAddressProofs_DF_EffectiveTill
																			DEFAULT '31-Dec-9999',

		CONSTRAINT	OtherAddressProofs_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO
-- =============================================================================

-- vim:ts=4 ht=4 sw=4
