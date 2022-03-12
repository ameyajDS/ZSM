/* ==================================================================================
    Source File		:	schema.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sun Nov 07 08:20:33 IST 2010
    Version			:	1.13
    Last updated	:	Oct 16, 2014
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
  AK/JL : 30-Oct-2014 : v1.77
		*	Changed column other_address_proof to other_address_proof_id and also changed the associated constraint 
  AK/JL : 15, 16-Oct-2014
		* Dropped column any_disability from table sewadars_details.
		* Added table sewadars_other_disabilities.
  JL/MS : 14-Feb-2013 : v1.13
		* 	Added missing foreign key SewadarsAttributes_FK_AttributeId_ListValue in sewadars_attributes table.
  JL : 05-Aug-2012 : v1.12
		* 	Tables sewadars_txn_ts, sewadar_wise_sewa_summaries and team_wise_daily_attendance have now clustered indexes.
  JL : 23-Feb-2012 : v1.12
		* 	Table manually_exported_sewadars added.
  JL : 22-Dec-2011 : v1.11
		*	Table definition of satsang_centre_seeds moved to schema_entities script
		* 	Table additionally_exported_sewadars added.
		*	Table definitions for generic_sewadar_lists and generic_sewadar_lists_sewadars moved to schema_centres script.
  JL : 12-Dec-2011 : v1.10
		*	Table sewadars_photos moved from ZMS database to ZSM_Photos.
  JL : 11-Dec-2011 : v1.09
		*	Column location_district_id has been added in table sewadars_registrations.
  JL : 11-Dec-2011 : v1.08
		*	Columns sewadar_type and sewa_id have been added in table sewadars_registrations.
  JL : 19-Feb-2011 : v1.07
		*	Check constraint SewadarsRemarks_CK_SewadarID_RemarkType_Remarks added in table sewadars_remarks.
  MS/JL : 10-Feb-2011 : v1.06
		*	Foreign Key constraint TeamWiseDailyAttendance_FK_SewaTeamID_AttendanceDt dropped from table team_wise_daily_attendance.
  MS/JL : 01-Jan-2011 : v1.05
		*	Added column skill_sq and constraint SewadarsSkills_UK_SewadarID_SkillSq in table sewadars_skills
  MS/JL : 12-Dec-2010 : v1.04
		*	Changed datatype of other_address_proof to VARCHAR (20) to match with size of older system.
  MS/JL : 12-Dec-2010 : v1.03
		*	is_married in sewadars table made NULLABLE only to enable migration. In application, this should be a mandatory field.
  MS/JL : 11-Dec-2010 : v1.02
		*	security_approver_id in sewadars_registrations table made NULLABLE only to enable migration. In application, this should be a mandatory field.
     JL : 06-Dec-2010 : v1.01
		*	Columns sewa_id and screen_id dropped from the table sewa_teams_txn_ts and a column attendance_dt has been added thereby changing the primary key.
			A referential constraint in the table team_wise_daily_attendance has been specified for the above table.
     JL : 07-29-Nov-2010
		*   Initial versions
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--	Tables for managing information of Sewadars
-- =============================================================================

CREATE	TABLE	sewadars
(
	sewadar_id					sewadar_id			NOT NULL	IDENTITY (100001, 1)		--- starting with 100,000+ to allow for migration data
																CONSTRAINT	Sewadars_PK_SewadarID
																	PRIMARY KEY	NONCLUSTERED,

	--- Parts of the name (first, middle and last) should contain only alphabets and apostrophe.
	--- No other character should be permitted. This needs to be ensured by the front-end application.
	first_nm 					name_part			NOT NULL,
	middle_nm 					name_part			NOT NULL,
	last_nm 					name_part			NOT NULL,

	gender 						Gender				NOT NULL,

	--- By default, the time portion of the birth should be initialised to mid-night, that is, 0000 hours.
	--- In case of two persons, having same name (first and last names), gender and date of birth, the time portion
	--- is to be used only in that case; the time initialised to 00:01 hours (1 minute past mid-night).
    birth_dtm					SMALLDATETIME		NOT NULL,

	---- is_married column is made NULLABLE only to enable migration. In application, this should be a mandatory field.
	is_married					Boolean					NULL,

	-- LATER... .consider the following.
	--gender_frst_lst_mddl_nm		concatenated_nm		NOT NULL,	--- Set thru insert/update trigger
	--gender_lst_frst_mddl_nm		concatenated_nm		NOT NULL,	--- Set thru insert/update trigger


	initiation_dt				SMALLDATETIME			NULL,
		--- Trigger ensures that initiation_place_id exists in cdb..initiation_places(Trigger a)
	initiation_place_id			initiation_place_id		NULL,
		--- Trigger ensures that patron_id exists in cdb..patrons(Trigger b)
	initiation_by				patron_id				NULL,

		---- Following two columns signify the current GR No in use for the sewadar. It's referential integrity is set later.
		---- These columns will usually be NOT NULL; these are NULL till the time entry is being done in sewadars_details and sewadars_registrations.
		---- These are set as part of INSERTing in sewadars_registrations.
	current_satsang_centre_id 	satsang_centre_id		NULL,
	current_sewadar_grno		sewadar_grno			NULL,

		----- Trigger ensures that the sewadar_status.is_global = Yes(Trigger c)
		----- Trigger ensures that status and status date change together (only one of these cannot be changed)(Trigger d)
		----- Trigger ensures that status change is as per sewadar_status_transitions(Trigger e)
		---- Trigger (DML) puts a record in sewadars_status_changes on every change (including INSERT), if there is a change
			----		note that changing from NULL values or to NULL values is a change.(Trigger DML a)
	global_sewadar_status_cd	sewadar_status_cd		NULL	CONSTRAINT	Sewadars_FK_GlobalStatusCd
																		REFERENCES	sewadar_status,
	global_sewadar_status_dt	SMALLDATETIME			NULL,

	txn_ts						TIMESTAMP			NOT NULL,

		CONSTRAINT	Sewadars_UK_Gender_FirstNm_LastNm_BirthDtm
			UNIQUE	NONCLUSTERED	(	gender, first_nm, last_nm, birth_dtm	),

		CONSTRAINT	Sewadars_CK_InitiationDetails
			CHECK	(	(	initiation_dt	IS NOT NULL	AND initiation_place_id	IS NOT NULL	AND initiation_by	IS NOT NULL	)
					OR	(	initiation_dt	IS NULL		AND initiation_place_id	IS NULL		AND initiation_by	IS NULL		)
					),

		CONSTRAINT	Sewadars_CK_GlobalStatusCd_GlobalStatusDt
			CHECK	(	(	global_sewadar_status_cd	IS NOT NULL	AND global_sewadar_status_dt	IS NOT NULL	)
					OR	(	global_sewadar_status_cd	IS NULL		AND global_sewadar_status_dt	IS NULL		)
					)
)
GO

CREATE INDEX Sewadars_IX_Gender_LastNm_FirstNm	ON	sewadars	(	gender, last_nm, first_nm	)
GO

--	.... consider later
--	CREATE INDEX Sewadars_IX_GenderFrstLstMdlNm	ON	sewadars	(	gender_frst_lst_mddl_nm	)
--	GO
--
--	CREATE INDEX Sewadars_IX_GenderLstFrstMdlNm	ON	sewadars	(	gender_lst_frst_mddl_nm	)
--	GO


EXEC 	sp_addextendedproperty
		'Sewadars_CK_InitiationDetails', 'Either Initiation details (Date, Place and By) must be provided or are not provided',
		'USER',	'dbo', 'TABLE',	'sewadars'
GO

EXEC 	sp_addextendedproperty
		'Sewadars_CK_GlobalStatusCd_GlobalStatusDt', 'Global Status and  Date are specified (or are not specified) together',
		'USER',	'dbo', 'TABLE',	'sewadars'
GO

-- =============================================================================
--	Sewadar Details like Address, Phone Number, Medical information, Qualifications, etc.
-- =============================================================================

CREATE	TABLE	sewadars_details
(
	sewadar_id					sewadar_id			NOT NULL	CONSTRAINT	SewadarsDetails_PK_SewadarID
																	PRIMARY KEY	NONCLUSTERED
																CONSTRAINT	SewadarsDetails_FK_SewadarID
																	REFERENCES	sewadars,

	address_proof				address_proof			NULL	CONSTRAINT	SewadarsDetails_FK_AddressProof
																	REFERENCES	address_proofs,
	other_address_proof_id      address_proof_id		NULL    CONSTRAINT	SewadarsDetails_FK_OtherAddressProofID
																	REFERENCES	other_address_proofs,
	telephone_mobile			telephone_lines			NULL,
	telephone_residence			telephone_lines			NULL,
	telephone_office			telephone_lines			NULL,

	occupation					occupation			NOT NULL	CONSTRAINT	SewadarsDetails_FK_Occupation
																	REFERENCES	occupations,
	attends_weekly_satsang		Boolean					NULL,
	weekly_satsang_centre_id 	satsang_centre_id		NULL	CONSTRAINT	SewadarsDetails_FK_WeeklySatsangCentreID
																	REFERENCES	satsang_centres_details,

	has_hypertension			Boolean					NULL,
	is_diabetic					Boolean					NULL,
	has_skin_problem			Boolean					NULL,
	has_epillepsy				Boolean					NULL,
	--any_disability				gnc_nm					NULL,		--- column dropped

	txn_ts						TIMESTAMP			NOT NULL,

		CONSTRAINT	SewadarsDetails_CK_AddressProof_OtherAddressProof
			CHECK	(	(	address_proof	IS NULL		AND	other_address_proof_id	IS NULL		)
					OR	(	address_proof	IS NOT NULL	AND	other_address_proof_id	IS NULL		)
					OR	(	address_proof	IS NULL		AND	other_address_proof_id	IS NOT NULL	)
					),

		CONSTRAINT	SewadarsDetails_CK_AttendsWeeklySatsang_WeeklySatsangCentreID
			CHECK	(	(	attends_weekly_satsang	IS NULL		AND	weekly_satsang_centre_id	IS NULL		)
					OR	(	attends_weekly_satsang	=	'Yes'	AND	weekly_satsang_centre_id	IS NOT NULL	)
					OR	(	attends_weekly_satsang	=	'No'	AND	weekly_satsang_centre_id	IS NULL		)
					)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarsDetails_CK_AddressProof_OtherAddressProof', 'Either Address Proof or Other Address Proof is specified, but not both together' ,
		'USER',	'dbo', 'TABLE',	'sewadars_details'
GO

EXEC 	sp_addextendedproperty
		'SewadarsDetails_CK_AttendsWeeklySatsang_WeeklySatsangCentreID', 'Satsang Centre is specified only when Sewadar is attending Weekly Satsangs' ,
		'USER',	'dbo', 'TABLE',	'sewadars_details'
GO

-- =============================================================================

CREATE	TABLE	sewadars_addresses
(
	sewadar_id				sewadar_id				NOT NULL	CONSTRAINT	SewadarsAddresses_FK_SewadarID
																	REFERENCES	sewadars_details,
	address_type			address_type			NOT NULL	CONSTRAINT	SewadarsAddresses_FK_AddressType
																	REFERENCES	address_types,
    address_line_1			address_line			NOT NULL,
    address_line_2			address_line				NULL,

	post_office_or_city_id	post_office_or_city_id	NOT NULL	CONSTRAINT	SewadarsAddresses_FK_PostOfficeOrCityID
																	REFERENCES	post_offices_or_cities,
    pin_or_zip_code			pin_or_zip_code				NULL,

		CONSTRAINT	SewadarsAddresses_PK_SewadarID_AddressType
			PRIMARY KEY	NONCLUSTERED	(	sewadar_id, address_type	)
)
GO

-- =============================================================================

CREATE	TABLE	sewadars_qualifications
(
	sewadar_id				sewadar_id			NOT NULL	CONSTRAINT	SewadarsQualifications_FK_SewadarID
																	REFERENCES	sewadars_details,
	qualification_sq		display_order		NOT NULL,

	  --- Trigger ensures that Qualification exists in CDB (Qualifications)(Trigger a)
	qualification_id		qualification_id	NOT NULL,		---- REFERENCES CDB..qualifications

	  --- Trigger ensures that Subject exists in CDB (Qualification_Subjects), as a composite foreign key with qualification id(Trigger b)
	qlfctn_subject_id		qlfctn_subject_id  		NULL,		---- REFERENCES CDB..qualification_qual_subjects

		CONSTRAINT	SewadarsQualifications_PK_SewadarID_QualificationSq
			PRIMARY KEY	CLUSTERED	(	sewadar_id, qualification_sq	),

		CONSTRAINT	SewadarsQualifications_UK_QualificationID_SubjectID_SewadarID
			UNIQUE	NONCLUSTERED	(	qualification_id, qlfctn_subject_id, sewadar_id	)
)
GO


-- =============================================================================

CREATE	TABLE	sewadars_other_disabilities
(
	sewadar_id					sewadar_id					NOT NULL	CONSTRAINT	SewadarsOtherDisabilities_FK_SewadarID
																			REFERENCES	sewadars_details,
	medical_disability_id		medical_disability_id		NOT NULL	CONSTRAINT	SewadarsOtherDisabilities_FK_MedicalDisabilityID
																			REFERENCES	medical_disabilities,
	medical_disability_sq		display_order				NOT NULL,

		CONSTRAINT	SewadarsOtherDisabilities_PK_SewadarID_MedicalDisabilitySequence
			PRIMARY KEY	CLUSTERED	(	sewadar_id, medical_disability_sq	),
			
		CONSTRAINT	SewadarsOtherDisabilities_UK_MedicalDisabilityID_SewadarID
			UNIQUE	NONCLUSTERED	(	medical_disability_id, sewadar_id	)
)
GO
-- =============================================================================


CREATE	TABLE	sewadars_skills
(
	sewadar_id		sewadar_id		NOT NULL	CONSTRAINT	SewadarsSkills_FK_SewadarID
													REFERENCES	sewadars_details,
	  --- Trigger ensures that skill_id exists in CDB..skills(Trigger a)
	skill_id		skill_id		NOT NULL,

	skill_sq		display_order	NOT NULL,

		CONSTRAINT	SewadarsSkills_PK_SewadarID_SkillID
			PRIMARY KEY	NONCLUSTERED	(	sewadar_id, skill_id	),

		CONSTRAINT	SewadarsSkills_UK_SewadarID_SkillSq
			UNIQUE	NONCLUSTERED	(	sewadar_id, skill_sq	)
)
GO

-- =============================================================================

--	Note. The order of display of remarks is governed by remarks_types.remark_type_sq and remarks_sq
CREATE	TABLE	sewadars_remarks
(
	sewadar_id		sewadar_id		NOT NULL	CONSTRAINT	SewadarsRemarks_FK_SewadarID
																REFERENCES	sewadars_details,
	remarks_type	remarks_type	NOT NULL	CONSTRAINT	SewadarsRemarks_FK_RemarksType
																REFERENCES	remarks_types,
	remarks_sq		display_order	NOT NULL,

	remarks			remarks  		NOT NULL,

		CONSTRAINT	SewadarsRemarks_PK_SewadarID_RemarkSq
			PRIMARY KEY	CLUSTERED	(	sewadar_id, remarks_type, remarks_sq	),

		CONSTRAINT	SewadarsRemarks_CK_SewadarID_RemarkType_RemarksSq
			CHECK	(	(	remarks_type	=	'Reference'	AND	remarks_sq	=	1	)
					OR	(	remarks_type	!=	'Reference'							)
					)
)
GO

-- =============================================================================
--	Sewadar Registrations at Satsang Centres
-- =============================================================================

CREATE	TABLE	sewadars_registrations
(
		--- Trigger ensures that the satsang_centre_id has is_main_centre set to Yes(Trigger a)
		--- LATER: Front-end screen ensures that the satsang_centre_id matches with the Satsang Centre passed as the parameter to the application
		--- Trigger (DML) sets the current_sewadar_grno and current_satsang_centre_id in sewadars table on INSERT only(Trigger DML a)
	satsang_centre_id 			satsang_centre_id		NOT NULL	CONSTRAINT	SewadarsRegistrations_FK_SatsangCentreID
																		REFERENCES	satsang_centres_details,
	sewadar_grno				sewadar_grno			NOT NULL,
	
	sewadar_id					sewadar_id				NOT NULL	CONSTRAINT	SewadarsRegistrations_FK_SewadarID
																		REFERENCES	sewadars_details,
	appointment_dt				SMALLDATETIME			NOT NULL,
	is_outstation_sewadar		Boolean					NOT NULL,

		---- Trigger (DML) puts a record in sewadars_transfers on INSERT only; updates are the other way round(Trigger DML b)
	department_id				department_id			NOT NULL	CONSTRAINT	SewadarsRegistrations_FK_DepartmentID
																		REFERENCES	departments,
		--- Trigger ensures that sub_department_id is specified when departments.sub_department_mandatory = Yes(Trigger b)
		--- Trigger also ensures that department_id  above is same as it is in sub_departments(Trigger c)
	sub_department_id			department_id				NULL	CONSTRAINT	SewadarsRegistrations_FK_SubDepartmentID
																		REFERENCES	sub_departments,
		----- Trigger ensures that in an update, the changed date is later than the previous one.(Trigger d)
	department_dt				SMALLDATETIME			NOT NULL,

		----- Trigger ensures that the sewadar_status.is_global = No(Trigger e)
		----- Trigger ensures that if sewadars.global_sewadar_status_cd is NOT NULL, status can not be changed(Trigger f)
		----- Trigger ensures that status and status date change together (only one of these cannot be changed)(Trigger g)
		----- Trigger ensures that status change is as per sewadar_status_transitions(Trigger h)
		----- Trigger ensures that it does not result in multiple sewadar_grno for sewadar_id having the sewadar_status_id where sewadar_status.is_multiple = No
			---			therefore, this check can be performed only if the new (inserted) status has sewadar_status.is_multiple = No(Trigger i)
		---- Trigger (DML) puts a record in sewadars_status_changes on every change (including INSERT), if there is a change(Trigger DML c & e)
	sewadar_status_cd			sewadar_status_cd		NOT NULL	CONSTRAINT	SewadarsRegistrations_FK_StatusCd
																		REFERENCES	sewadar_status,
		----- Trigger ensures that in an update, the changed date is later than the previous one.(Trigger j)
	sewadar_status_dtm			SMALLDATETIME			NOT NULL,

		----- Trigger ensures that responsibility and responsibility date change together (only one of these cannot be changed);
			----		note that changing from NULL values or to NULL values is a change.(Trigger k)
		---- Trigger (DML) puts a record in sewadars_responsibility_changes on every change (including INSERT, if specified), if there is a change(Trigger DML d)
	responsibility				responsibility				NULL	CONSTRAINT	SewadarsRegistrations_FK_Responsibility
																		REFERENCES	responsibilities,
		----- Trigger ensures that in an update, the changed date is later than the previous one.(Trigger l)
	responsibility_dtm			SMALLDATETIME				NULL,

	reference_1_sewadar_id		sewadar_id					NULL	CONSTRAINT	SewadarsRegistrations_FK_Reference1SewadarID
																		REFERENCES	sewadars,
	  --- Trigger ensures that reference_1_relationship exists in CDB..relations(Trigger m)
	reference_1_relationship	relationship_id				NULL,
	reference_1_nm				reference_nm				NULL,
	reference_1_centre_id		satsang_centre_id			NULL	CONSTRAINT	SewadarsRegistrations_FK_Reference1CentreID
																			REFERENCES	satsang_centres_details,
	reference_1_department		VARCHAR (20)				NULL,

	reference_2_sewadar_id		sewadar_id					NULL	CONSTRAINT	SewadarsRegistrations_FK_Reference2SewadarID
																			REFERENCES	sewadars,
	  --- Trigger ensures that reference_2_relationship exists in CDB..relations(Trigger n)
	reference_2_relationship	relationship_id				NULL,
	reference_2_nm				reference_nm				NULL,
	reference_2_centre_id		satsang_centre_id			NULL	CONSTRAINT	SewadarsRegistrations_FK_Reference2CentreID
																			REFERENCES	satsang_centres_details,
	reference_2_department		VARCHAR (20)				NULL,


	  --- Trigger ensures that Sponsorer's Status in sewadars_registrations.sewadar_status_cd (as per the Current GR No)(Trigger o)
	  		---- is one of General Use (system_info_cd = SttsGenUse)			.... JL 25-Dec-2010 ... this needs to be moved to front-end due to inter-centre transfers
	sponsorer_id 				sewadar_id					NULL	CONSTRAINT	SewadarsRegistrations_FK_SponsorerID
																		REFERENCES	sewadars,
	area_secretary_id 			centre_functionary_id		NULL	CONSTRAINT	SewadarsRegistrations_FK_AreaSecretaryID
																		REFERENCES	satsang_centre_functionaries,
	secretary_id 				centre_functionary_id		NULL	CONSTRAINT	SewadarsRegistrations_FK_SecretaryID
																		REFERENCES	satsang_centre_functionaries,
	  --- security_approver_id is NULLABLE only to enable migration. In application, this should be a mandatory field.
	security_approver_id 		sewadar_id				 	NULL	CONSTRAINT	SewadarsRegistrations_FK_SecurityApproverID
																		REFERENCES	sewadars,
	sewa_samiti_approver_id 	sewadar_id					NULL	CONSTRAINT	SewadarsRegistrations_FK_SewaSamitiApproverID
																		REFERENCES	sewadars,

		---- These two columns are set for those sewadars who do weekly sewa, and this signifies the location and department of sewa
	weekly_sewa_location_id		weekly_sewa_location_id		NULL	CONSTRAINT	SewadarsRegistrations_FK_WeeklySewaLocationID
																		REFERENCES	weekly_sewa_locations,
	weekly_department_id		department_id				NULL	CONSTRAINT	SewadarsRegistrations_FK_WeeklyDepartmentID
																		REFERENCES	departments,

	sewadar_type				sewadar_type			NOT NULL	CONSTRAINT	SewadarsRegistrations_FK_SewadarType
																		REFERENCES	sewadar_types
																	CONSTRAINT	SewadarsRegistrations_DF_SewadarType
																		Default	'R',

		--- It is used for Open and Trainee Sewadars because their validity is for that Sewa only
	sewa_id						sewa_id						NULL	CONSTRAINT	SewadarsRegistrations_FK_SewaID
																		REFERENCES	sewas,

		--- Trigger ensures that the district_id exists in CDB..districts_or_cities(Trigger p)
		--- It is used for Open and Trainee Sewadars badges as their addresses are not captured.
	location_district_id 		district_id					NULL,

		----- LATER: Trigger ensures that in an update, the changed date is later than the previous one.
	txn_ts						TIMESTAMP				NOT NULL,

		CONSTRAINT	SewadarsRegistrations_PK_SatsangCentreID_SewadarGRNo
			PRIMARY KEY	NONCLUSTERED	(	satsang_centre_id, sewadar_grno	)

	/* ----------------------- Check constraints are disabled now, and are taken care of in the screen now .........	
																				,
		CONSTRAINT	SewadarsRegistrations_CK_AppointmentDt_DepartmentDt
			CHECK	(	appointment_dt	<=	department_dt	),

		CONSTRAINT	SewadarsRegistrations_CK_AppointmentDt_SewadarStatusDt
			CHECK	(	appointment_dt	<=	sewadar_status_dtm	),

		CONSTRAINT	SewadarsRegistrations_CK_AppointmentDt_ResponsibilityDt
			CHECK	(	appointment_dt	<=	responsibility_dtm	),

		CONSTRAINT	SewadarsRegistrations_CK_Responsibility_ResponsibilityDt
			CHECK	(	(	responsibility	IS NOT NULL	AND	responsibility_dtm	IS NOT NULL	)
					OR	(	responsibility	IS NULL		AND	responsibility_dtm	IS NULL		)
					),

		CONSTRAINT	SewadarsRegistrations_CK_Reference1Information
			CHECK	(	(	reference_1_sewadar_id	IS NOT NULL	AND	reference_1_relationship	IS NOT NULL	AND	reference_1_nm	IS NULL		AND	reference_1_centre_id	IS NULL		AND	reference_1_department	IS NULL		)
					OR	(	reference_1_sewadar_id	IS NULL		AND	reference_1_relationship	IS NOT NULL	AND	reference_1_nm	IS NOT NULL	AND	reference_1_centre_id	IS NOT NULL	AND	reference_1_department	IS NOT NULL	)
					OR	(	reference_1_sewadar_id	IS NULL		AND	reference_1_relationship	IS NULL		AND	reference_1_nm	IS NULL		AND	reference_1_centre_id	IS NULL		AND	reference_1_department	IS NULL		)
					),

		CONSTRAINT	SewadarsRegistrations_CK_Reference2Information
			CHECK	(	(	reference_2_sewadar_id	IS NOT NULL	AND	reference_2_relationship	IS NOT NULL	AND	reference_2_nm	IS NULL		AND	reference_2_centre_id	IS NULL		AND	reference_2_department	IS NULL		)
					OR	(	reference_2_sewadar_id	IS NULL		AND	reference_2_relationship	IS NOT NULL	AND	reference_2_nm	IS NOT NULL	AND	reference_2_centre_id	IS NOT NULL	AND	reference_2_department	IS NOT NULL	)
					OR	(	reference_2_sewadar_id	IS NULL		AND	reference_2_relationship	IS NULL		AND	reference_2_nm	IS NULL		AND	reference_2_centre_id	IS NULL		AND	reference_2_department	IS NULL		)
					),

		CONSTRAINT	SewadarsRegistrations_CK_SponsorerID_IsOutstationSewadar
			CHECK	(	(	is_outstation_sewadar	=	'No'	AND	sponsorer_id	IS NOT NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	sponsorer_id	IS NULL		)
					),

		CONSTRAINT	SewadarsRegistrations_CK_AreaSecretaryID_IsOutstationSewadar
			CHECK	(	(	is_outstation_sewadar	=	'Yes'									)
					OR	(	is_outstation_sewadar	=	'No'	AND	area_secretary_id	IS NULL	)
					),

		CONSTRAINT	SewadarsRegistrations_CK_SecretaryID_IsOutstationSewadar
			CHECK	(	(	is_outstation_sewadar	=	'Yes'								)
					OR	(	is_outstation_sewadar	=	'No'	AND	secretary_id	IS NULL	)
					),

		CONSTRAINT	SewadarsRegistrations_CK_WeeklySewaLocationID_WeeklyDeparmentID
			CHECK	(	(	weekly_sewa_location_id	IS NOT NULL	AND	weekly_department_id	IS NOT NULL	)
					OR	(	weekly_sewa_location_id	IS NULL		AND	weekly_department_id	IS NULL		)
					)
					.......................... */
)

GO

-- =============================================================================

ALTER	TABLE	sewadars
	ADD	CONSTRAINT	Sewadars_FK_CurrentSatsangCentreID_CurrentSewadarGRNo
		FOREIGN KEY	(	current_satsang_centre_id, current_sewadar_grno	)
			REFERENCES	sewadars_registrations;
GO

-- =============================================================================

EXEC 	sp_addextendedproperty
		'SewadarsRegistrations_CK_AppointmentDt_DepartmentDt', 'Department Date can not be earlier than Appointment Date' ,
		'USER',	'dbo', 'TABLE',	'sewadars_registrations'
GO

EXEC 	sp_addextendedproperty
		'SewadarsRegistrations_CK_AppointmentDt_SewadarStatusDt', 'Status Date can not be earlier than Appointment Date' ,
		'USER',	'dbo', 'TABLE',	'sewadars_registrations'
GO

EXEC 	sp_addextendedproperty
		'SewadarsRegistrations_CK_AppointmentDt_ResponsibilityDt', 'Responsibility Date can not be earlier than Appointment Date' ,
		'USER',	'dbo', 'TABLE',	'sewadars_registrations'
GO

EXEC 	sp_addextendedproperty
		'SewadarsRegistrations_CK_Responsibility_ResponsibilityDt', 'Responsibility and the date of taking up the responsibility are specified (or are not specified) together' ,
		'USER',	'dbo', 'TABLE',	'sewadars_registrations'
GO

EXEC 	sp_addextendedproperty
		'SewadarsRegistrations_CK_Reference1Information', 'Either Reference 1 Sewadar should be identified or his/her Name, Centre and Department is specified' ,
		'USER',	'dbo', 'TABLE',	'sewadars_registrations'
GO

EXEC 	sp_addextendedproperty
		'SewadarsRegistrations_CK_Reference2Information', 'Either Reference 2 Sewadar should be identified or his/her Name, Centre and Department is specified' ,
		'USER',	'dbo', 'TABLE',	'sewadars_registrations'
GO

EXEC 	sp_addextendedproperty
		'SewadarsRegistrations_CK_SponsorerID_IsOutstationSewadar', 'Sponsorer is specified for Local Sewadars only' ,
		'USER',	'dbo', 'TABLE',	'sewadars_registrations'
GO

EXEC 	sp_addextendedproperty
		'SewadarsRegistrations_CK_AreaSecretaryID_IsOutstationSewadar', 'Area Secretary is specified for Outstation Sewadars only' ,
		'USER',	'dbo', 'TABLE',	'sewadars_registrations'
GO

EXEC 	sp_addextendedproperty
		'SewadarsRegistrations_CK_SecretaryID_IsOutstationSewadar', 'Secretary is specified for Outstation Sewadars only' ,
		'USER',	'dbo', 'TABLE',	'sewadars_registrations'
GO

EXEC 	sp_addextendedproperty
		'SewadarsRegistrations_CK_WeeklySewaLocationID_WeeklyDeparmentID', 'Weekly Sewa Location and Department are specified (or are not specified) together' ,
		'USER',	'dbo', 'TABLE',	'sewadars_registrations'
GO

-- =============================================================================
---	Transfer of Sewadars from one Satsang Centre to another
---	This table does not have the corresponding audit table because neither UPDATE or DELETE is allowed on this table.
-- =============================================================================

CREATE	TABLE	sewadars_satsang_centre_transfers
(
		--- LATER: Front-end screen ensures that old_satsang_centre_id is same as that passed as parameter to application.
	old_satsang_centre_id 	satsang_centre_id	NOT NULL,
	old_sewadar_grno		sewadar_grno		NOT NULL,

	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,

		--- Transfer is not permitted on same date
	effective_dt			SMALLDATETIME		NOT NULL,

	remarks					remarks					NULL,

		CONSTRAINT	SewadarsSatsangCentreTransfers_PK_OldSatsangCentreID_OldSewadarGRNo
			PRIMARY KEY	NONCLUSTERED	(	old_satsang_centre_id, old_sewadar_grno	),

		CONSTRAINT	SewadarsSatsangCentreTransfers_FK_OldSatsangCentreID_OldSewadarGRNo
			FOREIGN KEY	(	old_satsang_centre_id, old_sewadar_grno	)
				REFERENCES	sewadars_registrations,

		CONSTRAINT	SewadarsSatsangCentreTransfers_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations,

		CONSTRAINT	SewadarsSatsangCentreTransfers_CK_OldSatsangCentreID_SatsangCentreID
			CHECK	(	old_satsang_centre_id	!=	satsang_centre_id	)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarsSatsangCentreTransfers_CK_OldSatsangCentreID_SatsangCentreID', 'In a Satsang Centre transfer, Satsang Centre must change' ,
		'USER',	'dbo', 'TABLE',	'sewadars_satsang_centre_transfers'
GO


-- =============================================================================
		---	LATER: DML .... updates the department_id, sub_department_id in sewadars_registrations table.(Trigger DML a)
-- =============================================================================

CREATE	TABLE	sewadars_transfers
(
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.(Trigger a)
		--- Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.(Trigger b)
		--- LATER: Front-end screen ensures that current_satsang_centre_id is same as that passed as parameter to application.

	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,

		--- Transfer is not permitted on same date
	effective_dt			SMALLDATETIME		NOT NULL,

		--- These will be NULL for new sewadars
		--- Trigger ensures that old_department_id (and old_sub_department_id), if specified, match
		--		the corresponding values in sewadars_registrations using sewadars.current_{satsang_centre_id | sewadar_grno](Trigger c)
	old_department_id		department_id			NULL	CONSTRAINT	SewadarsTransfers_FK_OldDepartmentID
																REFERENCES	departments,
		--- Trigger ensures that sub_department_id is specified when departments.sub_department_mandatory = Yes(Trigger d)
	old_sub_department_id	department_id			NULL	CONSTRAINT	SewadarsTransfers_FK_OldSubDepartmentID
																REFERENCES	sub_departments,
	
	department_id			department_id		NOT NULL	CONSTRAINT	SewadarsTransfers_FK_DepartmentID
																REFERENCES	departments,
		--- Trigger ensures that sub_department_id is specified when departments.sub_department_mandatory = Yes(Trigger e)
	sub_department_id		department_id			NULL	CONSTRAINT	SewadarsTransfers_FK_SubDepartmentID
																REFERENCES	sub_departments,
	remarks					remarks					NULL,

	txn_ts					TIMESTAMP			NOT NULL,

		CONSTRAINT	SewadarsTransfers_PK_SatsangCentreID_SewadarGRNo_EffectiveDt
			PRIMARY KEY	NONCLUSTERED	(	satsang_centre_id, sewadar_grno, effective_dt	),

		CONSTRAINT	SewadarsTransfers_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations,

		CONSTRAINT	SewadarsTransfers_CK_OldDepartmentID_OldSubDepartmentID_DepartmentID_SubDepartmentID
			CHECK	(	(	old_department_id	IS NULL		AND	old_sub_department_id	IS NULL			)
					OR	(	old_department_id	IS NOT NULL	AND	old_department_id	!=	department_id	)
					OR	(	old_department_id	IS NOT NULL	AND	old_department_id	=	department_id	
						AND	(	(	old_sub_department_id	IS NULL		AND	sub_department_id	IS NOT NULL	)	
							OR	(	old_sub_department_id	IS NOT NULL	AND	sub_department_id	IS NULL		)	
							OR	(	old_sub_department_id	!=	sub_department_id							)	
							)
						)
					)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarsTransfers_CK_OldDepartmentID_OldSubDepartmentID_DepartmentID_SubDepartmentID', 'In a department transfer, either Department or Sub-Department or both must change' ,
		'USER',	'dbo', 'TABLE',	'sewadars_transfers'
GO


-- =============================================================================
--		Sewadars Status Changes - it is maintained through triggers
-- =============================================================================
CREATE	TABLE	sewadars_status_changes
(
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.(Trigger a)
		--- LATER: Front-end screen ensures that current_satsang_centre_id is same as that passed as parameter to application.
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,

	effective_dtm			SMALLDATETIME		NOT NULL,

	old_sewadar_status_cd	sewadar_status_cd		NULL	CONSTRAINT	SewadarsStatusChanges_FK_OldStatusCd
																REFERENCES	sewadar_status,

		----- Trigger ensures that sewadar_status_cd is NOT NULL when sewadar_status.is_global = No
		--				This trigger has been eliminated, since this condition will be taken care by the valid status transitions 
		--					in sewadars, and sewadars_registrations
	sewadar_status_cd		sewadar_status_cd		NULL	CONSTRAINT	SewadarsStatusChanges_FK_StatusCd
																REFERENCES	sewadar_status,

		CONSTRAINT	SewadarsStatusChanges_PK_SatsangCentreID_SewadarGRNo_EffectiveDtm
			PRIMARY KEY	NONCLUSTERED(	satsang_centre_id, sewadar_grno, effective_dtm	),

		CONSTRAINT	SewadarsStatusChanges_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations,

		CONSTRAINT	SewadarsStatusChanges_CK_OldStatusCd_StatusCd
			CHECK	(	(	old_sewadar_status_cd	IS NULL		AND	sewadar_status_cd	IS NOT NULL			)
					OR	(	old_sewadar_status_cd	IS NOT NULL	AND	sewadar_status_cd	IS NULL				)
					OR	(	old_sewadar_status_cd	IS NOT NULL	AND	sewadar_status_cd	IS NOT NULL		AND	old_sewadar_status_cd	!=	sewadar_status_cd	)
					)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarsStatusChanges_CK_OldStatusCd_StatusCd', 'Status has not changed' ,
		'USER',	'dbo', 'TABLE',	'sewadars_status_changes'
GO



-- =============================================================================
--		Sewadars Responsibility Changes - it is maintained through triggers
-- =============================================================================

CREATE	TABLE	sewadars_responsibility_changes
(
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.(Trigger a)
		--- Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.(Trigger b)
		--- LATER: Front-end screen ensures that current_satsang_centre_id is same as that passed as parameter to application.
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,

	effective_dtm			SMALLDATETIME		NOT NULL,
	old_responsibility		responsibility			NULL	CONSTRAINT	SewadarsResponsibilityChanges_FK_OldResponsibility
																REFERENCES	responsibilities,
	responsibility			responsibility			NULL	CONSTRAINT	SewadarsResponsibilityChanges_FK_Responsibility
																REFERENCES	responsibilities,

		CONSTRAINT	SewadarsResponsibilityChanges_PK_SatsangCentreID_SewadarGRNo_EffectiveDt
			PRIMARY KEY	NONCLUSTERED(	satsang_centre_id, sewadar_grno, effective_dtm	),

		CONSTRAINT	SewadarsResponsibilityChanges_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations,

		CONSTRAINT	SewadarsResponsibilityChanges_CK_OldResponsibility_Responsibility
			CHECK	(	(	old_responsibility	IS NULL		AND	responsibility	IS NOT NULL			)
					OR	(	old_responsibility	IS NOT NULL	AND	responsibility	IS NULL				)
					OR	(	old_responsibility	IS NOT NULL	AND	responsibility	IS NOT NULL		AND	old_responsibility	!=	responsibility	)
					)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarsResponsibilityChanges_CK_OldResponsibility_Responsibility', 'Responsibility has not changed' ,
		'USER',	'dbo', 'TABLE',	'sewadars_responsibility_changes'
GO


-- =============================================================================
--	Sewadars' Particulars (currently only Attributes)
-- =============================================================================

CREATE	TABLE	sewadars_particulars
(
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.(Trigger a)
		--- LATER: Front-end screen ensures that current_satsang_centre_id is same as that passed as parameter to application.
	satsang_centre_id 	satsang_centre_id	NOT NULL,
	sewadar_grno		sewadar_grno		NOT NULL,

	txn_ts				TIMESTAMP			NOT NULL,

		CONSTRAINT	SewadarsParticulars_PK_SatsangCentreID_SewadarGRNo
			PRIMARY KEY	NONCLUSTERED	(	satsang_centre_id, sewadar_grno	),

		CONSTRAINT	SewadarsParticulars_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO


CREATE	TABLE	sewadars_attributes
(
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.(Trigger a)
		--- LATER: Front-end screen ensures that current_satsang_centre_id is same as that passed as parameter to application.
	satsang_centre_id 		satsang_centre_id	NOT NULL,
	sewadar_grno			sewadar_grno		NOT NULL,

		--- LATER: Trigger ensures that attribute_id is valid for satsang_centre_id as there should be a row existing in generic_attributes_satsang_centres.
	attribute_id			attribute_id		NOT NULL	CONSTRAINT	SewadarsAttributes_FK_AttributeID
																REFERENCES	generic_attributes,

		--- Trigger ensures that one of these values are set on the basis of attribute_type(Trigger b)
	boolean_value			Boolean					NULL,
	date_value				SMALLDATETIME			NULL,			---- For Date and Timestamp attributes
	int_value				INTEGER					NULL,
	number_value			NUMERIC (20, 8)			NULL,
	list_value				attribute_value			NULL,
	string_value			VARCHAR (255)			NULL,

	remarks					remarks					NULL,

		--- Trigger ensures that (a) these two columns are set, and (b) not set on the basis of is_temporal(Trigger c)
	effective_from			DATETIME				NULL,
	effective_till			DATETIME				NULL,

		CONSTRAINT	SewadarsAttributes_PK_SatsangCentreID_SewadarGRNo_AttributeID
			PRIMARY KEY	NONCLUSTERED	(	satsang_centre_id, sewadar_grno, attribute_id	),

		CONSTRAINT	SewadarsAttributes_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_particulars,

		CONSTRAINT	SewadarsAttributes_FK_AttributeId_ListValue
			FOREIGN KEY	(	attribute_id, list_value	)
				REFERENCES	generic_attributes_list_values,
		
		CONSTRAINT	SewadarsAttributes_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO


-- =============================================================================
--	Tables for Sewa Teams
-- =============================================================================
CREATE	TABLE	sewa_teams
(
	sewa_team_id		sewa_team_id		NOT	NULL	IDENTITY (10001, 1)									-- to allow for migration data
														CONSTRAINT	SewaTeams_PK_SewaTeamID
															PRIMARY KEY	NONCLUSTERED,

		--- It should be constructed like <dept_nm> [(<sub_dept_nm>)]-[Gents|Ladies]-[Outside|Local][-Status][-District]
	sewa_team_nm		gnc_long_nm			NOT NULL,

	team_description	remarks					NULL,

		--- Trigger ensures that the (a) sewa_id has sewa.attendance_marking = Team-wise(Trigger a)
		--	Front-end application ensures that the sewas.satsang_centre_id is same as that passed as an argument to the application.
		--	Ideally, lookup should restrict the sewas to current Satsang Centre.
	sewa_id				sewa_id				NOT NULL	CONSTRAINT	SewaTeams_FK_SewaID
															REFERENCES	sewas,

	--- Set when teams' sewadars are accepted and their sequencing can not be altered.
	--- After setting this timestamp, transfers and attendance can be recorded.
	--- A transfer results in adding a record in new team at the finish of the team list,
	--- and update sewadar's record in previous team's list.
	acceptance_ts		SMALLDATETIME			NULL,

	txn_ts				TIMESTAMP			NOT NULL,

		CONSTRAINT	SewaTeams_UK_SewaTeamID_SewaTeamNm
			UNIQUE			(	sewa_id, sewa_team_nm	)
)
GO

-- =============================================================================

-- =============================================================================
--	Trigger ensures that there is only one entry for Sewadar for any day in a Sewa Team for the same Sewa (Trigger f)
-- =============================================================================

CREATE	TABLE	sewa_team_wise_sewadars
(
		--- Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked (Triggers a & b)
	sewa_team_id		sewa_team_id			NOT NULL	CONSTRAINT	SewaTeamWiseSewadars_FK_SewaTeamID
																REFERENCES	sewa_teams,

		--- Manually generated at the time of specification of Teams. Once team is
		--- accepted (sewa_teams.acceptance_ts), serial_id can not be altered and sewadars are
		--- added with MAX (serial_id) + 1.
	serial_id			sewa_team_serial_id		NOT NULL,

		--- Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv. (Trigger c)
		--- We do NOT want to ensure that current_satsang_centre_id is same as sewa_teams->sewas.satsang_centre_id
		--	so as to allow some sewadars to do sewa at other satsang centres.
		---				LATER..... trigger should restrict the sewadars to current centre or authorised sewadars from other centres.
	satsang_centre_id	satsang_centre_id		NOT NULL,
	sewadar_grno		sewadar_grno			NOT NULL,

		---	Trigger ensures that attendance_dt (if any) >= transfer_in_dt (Trigger d)
	transfer_in_dt		SMALLDATETIME				NULL,

		---	Trigger ensures that attendance_dt (if any) <= transfer_out_dt (Trigger e)
	transfer_out_dt		SMALLDATETIME				NULL,

		CONSTRAINT	SewaTeamWiseSewadars_PK_SewaTeamID_SerialID
			PRIMARY KEY	NONCLUSTERED	(	sewa_team_id, serial_id	),

		CONSTRAINT	SewaTeamWiseSewadars_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations,

		CONSTRAINT	SewaTeamWiseSewadars_CK_TransferInDt_TransferOutDt
			CHECK	(	transfer_in_dt <= transfer_out_dt	)
)
GO


-- =============================================================================
-- The table is to be used for mutual exclusion for following tables (Sewadar-wise):
--				team_wise_daily_attendance
--				arbitrary_daily_presences
--				arbitrary_shift_presences
--				arbitrary_summarised_exemptions
--				sewadar_wise_sewa_summaries
-- =============================================================================

CREATE	TABLE	sewadars_txn_ts
(
	satsang_centre_id 	satsang_centre_id	NOT NULL,
	sewadar_grno		sewadar_grno		NOT NULL,
	sewa_id				sewa_id				NOT NULL,
	screen_id			CHAR (6)			NOT NULL,				

	txn_ts				TIMESTAMP			NOT NULL,

		CONSTRAINT	SewadarsTxnTs_PK_SatsangCentreID_SewadarGRNo_SewaID_ScreenID
			PRIMARY KEY	CLUSTERED	(	satsang_centre_id, sewadar_grno, sewa_id, screen_id	)
)
GO


-- =============================================================================
-- The table is to be used for mutual exclusion for following tables:
--				team_wise_daily_attendance	(Team Wise)
	---	Front-end application restricts the attendance reocording to the Team of the Sewa for the centre that is passed as an argument to the application.
-- =============================================================================

CREATE	TABLE	sewa_teams_txn_ts
(
	sewa_team_id		sewa_team_id		NOT NULL,
	attendance_dt		SMALLDATETIME		NOT NULL,

	txn_ts				TIMESTAMP			NOT NULL,

		CONSTRAINT	SewaTeamsTxnTs_PK_SewaTeamID_AttendanceDt
			PRIMARY KEY	NONCLUSTERED	(	sewa_team_id, attendance_dt	)
)
GO


-- =============================================================================
-- Table where attendence_marking is 'Team-wise'
-- =============================================================================

	---- Trigger (DML) sets sewas.attendance_ts to Current Date & Time (using GetDate()) on each INSERT/UPDATE(Trigger DML a & aa)
	---	Front-end application restricts the attendance reocording to the Team of the Sewa for the centre that is passed as an argument to the application.
CREATE	TABLE	team_wise_daily_attendance
(
		--- Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked(Trigger a & b_d)
	sewa_team_id		sewa_team_id		NOT NULL,
	serial_id			sewa_team_serial_id	NOT NULL,

	---	Trigger ensures attendance_dt  is within (BETWEEN) the start_dt and finish_dt of the sewa_id(Trigger d)
	--- Trigger ensures attendance_dt is within (BETWEEN) the start_dt and finish_dt of periods of the sewa_id, if any periods for the sewa exists(Trigger f)
	attendance_dt		SMALLDATETIME		NOT NULL,
		--- Trigger ensures that
		---			(a) sewas.is_leave_allowed to record attendance as Leave
		---			(b) sewas.is_exemption_allowed to record attendance as Exemption(Trigger b)
	attendance			CHAR (1)			NOT NULL	CONSTRAINT	TeamWiseDailyAttendance_CK_Attendance
															CHECK	(	attendance		IN	(	'P',		---- Present
																								'E',		---- Exempt
																								'L',		---- Leave
																								'A'			---- Absent
																							)
																		),
	
		--- Trigger ensures that when sewa_exemptions.sewa_applicability = Yes, the exemption exists in sewa_exemptions_applicable_sewas(Trigger g)
	sewa_exemption_id	sewa_exemption_id		NULL	CONSTRAINT	TeamWiseDailyAttendance_FK_SewaExemptionID
															REFERENCES	sewa_exemptions,
		--- Trigger ensures that is_scanned can be set to Yes only if sewas.is_scanner_used is set to Yes(Trigger c)
	is_scanned			Boolean				NOT NULL,

		CONSTRAINT	TeamWiseDailyAttendance_PK_SewaTeamID_SerialID_AttendanceDt
			PRIMARY KEY	CLUSTERED	(	sewa_team_id, serial_id, attendance_dt	),

		CONSTRAINT	TeamWiseDailyAttendance_FK_SewaTeamID_SerialID
			FOREIGN KEY		(	sewa_team_id, serial_id	)
				REFERENCES	sewa_team_wise_sewadars,

		CONSTRAINT	TeamWiseDailyAttendance_CK_ExemptionID_Attendance
			CHECK	(	(	attendance	=	'E'	AND	sewa_exemption_id IS NOT NULL	)
					OR	(	attendance	!=	'E'	AND	sewa_exemption_id IS NULL		)
					)
)
GO


-- =============================================================================
-- Table where attendence_marking is 'Arbitrary', and attendance_unit is Day
-- Trigger ensures that attendence cannot be marked if a scanning job (or sub-job) is NOT processed for a Sewa(Trigger j)
-- =============================================================================

	---- Trigger (DML) sets sewas.attendance_ts to Current Date & Time (using GetDate()) on each INSERT/UPDATE(Trigger DML a & aa)
CREATE	TABLE	arbitrary_daily_presences
(
		--- Trigger ensures that the sewa_id has sewa.attendance_marking = Arbitrary and attendance_unit = Day(Trigger a)
		--- Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked(Trigger b & c)
		--- Trigger ensures that the sewa's satsang centre is same as specified as the column in column satsang_centre(Trigger d)
	sewa_id				sewa_id					NOT NULL	CONSTRAINT	ArbitraryDailyPresences_FK_SewaID
																REFERENCES	sewas,

		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.(trigger e)
		--- Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.(trigger f)
		--- LATER: Front-end screen ensures that current_satsang_centre_id is same as that passed as parameter to application.
	satsang_centre_id 	satsang_centre_id		NOT NULL,
	sewadar_grno		sewadar_grno			NOT NULL,
		---	Trigger ensures presence_dt  is within (BETWEEN) the start_dt and finish_dt of the sewa_id(Trigger h)
		--- Trigger ensures presence_dt is within (BETWEEN) the start_dt and finish_dt of periods of the sewa_id, if any periods for the sewa exists(Trigger i)

	
	presence_dt			SMALLDATETIME			NOT NULL,

		--- Trigger ensures that is_scanned can be set to Yes only if sewas.is_scanner_used is set to Yes(trigger g)
	is_scanned			Boolean					NOT NULL,

		CONSTRAINT	ArbitraryDailyPresences_PK_SewaID_SewadarID_PresenceDt
			PRIMARY KEY	NONCLUSTERED	(	sewa_id, satsang_centre_id, sewadar_grno, presence_dt	),

		CONSTRAINT	ArbitraryDailyPresences_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================
-- Table where attendence_marking is 'Arbitrary', and attendance_unit is Shift
-- =============================================================================

	---- Trigger (DML) sets sewas.attendance_ts to Current Date & Time (using GetDate()) on each INSERT/UPDATE(Trigger DML a & aa)
CREATE	TABLE	arbitrary_shift_presences
(
		--- Trigger ensures that the sewa_id has sewa.attendance_marking = Arbitrary and attendance_unit = Shift(Trigger a)
		--- Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked(Trigger b & c)
		--- Trigger ensures that the sewa's satsang centre is same as specified as the column in column satsang_centre(Trigger d)
	sewa_id				sewa_id				NOT NULL,
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.(Trigger e)
		--- Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.(Trigger f)
		--- LATER: Front-end screen ensures that current_satsang_centre_id is same as that passed as parameter to application.
	satsang_centre_id 	satsang_centre_id	NOT NULL,
	sewadar_grno		sewadar_grno		NOT NULL,

	presence_dt			SMALLDATETIME		NOT NULL,
		---	Trigger ensures attendance_dt  is within (BETWEEN) the start_dt and finish_dt of the sewa_id(Trigger h)
		--- Trigger ensures presence_dt is within (BETWEEN) the start_dt and finish_dt of periods of the sewa_id, if any periods for the sewa exists(Trigger i)
		--- Trigger ensures that attendence cannot be marked if a scanning job (or sub-job) is NOT processed for a Sewa(Trigger k)

	
		---	Trigger ensures that only allowable sewa_shift combinations are permitted for a day for a Sewadar for a Sewa.(Trigger j)
	sewa_shift			sewa_shift			NOT NULL,
		--- Trigger ensures that is_scanned can be set to Yes only if sewas.is_scanner_used is set to Yes(Trigger g)
	is_scanned			Boolean				NOT NULL,

		CONSTRAINT	ArbitraryShiftPresences_PK_SewaID_PresenceDt_SewwaShift_SatsangCentreID_SewadarGRNo
			PRIMARY KEY	NONCLUSTERED	(	sewa_id, presence_dt, sewa_shift, satsang_centre_id, sewadar_grno 	),

		CONSTRAINT	ArbitraryShiftPresences_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations,

		CONSTRAINT	ArbitraryShiftPresences_FK_SewaID_SewaShift
			FOREIGN KEY	(	sewa_id, sewa_shift	)
				REFERENCES	sewas_sewa_shifts
)
GO


-- =============================================================================
-- Table for Exemptions where attendence_marking is 'Arbitrary' (this records exemptions for both attendance_units, viz., Day and Shift.
-- =============================================================================

	---- Trigger (DML) sets sewas.attendance_ts to Current Date & Time (using GetDate()) on each INSERT/UPDATE(Trigger DML a & aa)
CREATE TABLE	arbitrary_summarised_exemptions
(
		--- Trigger ensures that the sewa_id has sewa.attendance_marking = Arbitrary(Trigger a)
		--- Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked( Trigger b & c)
	sewa_id				sewa_id				NOT NULL	CONSTRAINT ArbitrarySummarisedExemptions_FK_SewaID
															REFERENCES	sewas,
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno.(Trigger d)
		--- Trigger ensures that the sewadar_status is one of specified in System Info Code SttsActv.(Trigger e)
		--- LATER: Front-end screen ensures that current_satsang_centre_id is same as that passed as parameter to application.
	satsang_centre_id 	satsang_centre_id	NOT NULL,
	sewadar_grno		sewadar_grno		NOT NULL,

		--- Trigger ensures that when sewa_exemptions.sewa_applicability = Yes, the exemption exists in sewa_exemptions_applicable_sewas(Trigger f)
	sewa_exemption_id	sewa_exemption_id	NOT NULL	CONSTRAINT	ArbitrarySummarisedExemp_FK_ExemptionID
															REFERENCES	sewa_exemptions,
	exemption_days		CreditCntF			NOT NULL,

		CONSTRAINT	ArbitrarySummarisedExemptions_PK_SewaID_SatsangCentreID_SewadarGRNo
			PRIMARY KEY	NONCLUSTERED	(	sewa_id, satsang_centre_id, sewadar_grno	),

		CONSTRAINT	ArbitrarySummarisedExemptions_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO


-- =============================================================================================================
-- Table where attendance_marking is 'Summary' or for storing summaries for other two types of attendance_marking
-- =============================================================================================================
	----	Front-end screen to ensure that information can be added, modified, or deleted for sewas.attendance_marking = 'Summary';
	---			for all other sewas, it is to be used only for displaying the information (and not manipulating).
CREATE	TABLE	sewadar_wise_sewa_summaries
(
		--- Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked(Trigger a & b)
	sewa_id				sewa_id				NOT NULL	CONSTRAINT	SewadarWiseSewaSummaries_FK_SewaID
															REFERENCES	sewas,
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno only when is_system_recorded is No.
		---			when the Attendance Marking is Summary (this is to allow Summarisation for other Sewas by the System).(Trigger c)
		--- Front-end screen code ensures that the sewadar_status is one of specified in System Info Code SttsActv.
		--- LATER: Front-end screen ensures that current_satsang_centre_id is same as that passed as parameter to application.
	satsang_centre_id 	satsang_centre_id	NOT NULL,
	sewadar_grno		sewadar_grno		NOT NULL,

	present_cnt			CreditCntF0			NOT NULL,

		---- Trigger ensures that exempt_cnt > 0 only when sewas.is_exemption_allowed is Yes(Trigger e)
	exempt_cnt			CreditCntF0			NOT	NULL,

		---- Trigger ensures that leave_cnt > 0 only when sewas.is_leave_allowed is Yes(Trigger f)
	leave_cnt			CreditCntF0			NOT	NULL,

		---- Trigger ensures that absent_cnt > 0 only when sewas.attendance_marking is one of Team-wise or Computed(Trigger g)
	absent_cnt			CreditCntF0			NOT NULL,

		---- LATER: Trigger ensures that (a) overwriting system generated values is not permitted (in other words, updates are not allowed)
	    ---- Trigger ensures that (b) is_system_recorded can be No only for sewas where attendance_marking = "Summary"(Trigger i)
		---- For system generated summaries, is_system_recorded is specified as Yes.
	is_system_recorded	Boolean				NOT NULL	CONSTRAINT	SewadarWiseSewaSummaries_DF_IsSystemRecorded
															DEFAULT		'Yes',

		CONSTRAINT	SewadarWiseSewaSummaries_PK_SewaID_SatsangCentreID_SewadarGRNo
			PRIMARY KEY	CLUSTERED	(	sewa_id, satsang_centre_id, sewadar_grno 	),

		CONSTRAINT	SewadarWiseSewaSummaries_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations,

		CONSTRAINT	SewadarWiseSewaSummaries_CK_PresentCnt_ExemptCnt_LeaveCnt_AbsentCnt
			CHECK	(	(	present_cnt + exempt_cnt + leave_cnt + absent_cnt ) > 0	)
)
GO

CREATE	NONCLUSTERED INDEX	SewadarWiseSewaSummariesIX_SatsangCentreID_SewadarGRNo	ON	sewadar_wise_sewa_summaries	(	satsang_centre_id, sewadar_grno 	)
GO

EXEC 	sp_addextendedproperty
		'SewadarWiseSewaSummaries_CK_PresentCnt_ExemptCnt_LeaveCnt_AbsentCnt', 'At least one of Present, Exempt, Leave or Absent Count should be more than zero',
		'USER',	'dbo', 'TABLE',	'sewadar_wise_sewa_summaries'
GO


-- =============================================================================================================
-- Table that stores the credits of Sewadars who qualify as the Credit Specification, and is therefore managed
-- by the Stored Procedure ComputeCredits only.
-- =============================================================================================================

CREATE	TABLE	credit_specifications_sewadars
(
	credit_specification_id		credit_specification_id		NOT NULL	CONSTRAINT	CreditSpecificationsSewadars_FK_CreditSpecificationID
																			REFERENCES	credit_specifications,
	satsang_centre_id 			satsang_centre_id			NOT NULL,
	sewadar_grno				sewadar_grno				NOT NULL,

	credit_cnt					CreditCntF					NOT NULL,

		CONSTRAINT	CreditSpecificationsSewadars_PK_CreditSpecificationID_SatsangCentreID_SewadarGRNo
			PRIMARY KEY	NONCLUSTERED	(	credit_specification_id, satsang_centre_id, sewadar_grno 	),

		CONSTRAINT	CreditSpecificationsSewadars_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO


-- =============================================================================
--	This stores a record for each badge printed.
-- =============================================================================

CREATE	TABLE	sewadars_badges
(
	badge_id					INTEGER					NOT NULL	IDENTITY (100001, 1)
																	CONSTRAINT	SewadarsBadges_PK_BadgeID
																		PRIMARY KEY	NONCLUSTERED,

	satsang_centre_id 			satsang_centre_id		NOT NULL,
	sewadar_grno				sewadar_grno			NOT NULL,
	
	badge_template_id			badge_template_id		NOT NULL	CONSTRAINT	SewadarsBadges_FK_BadgeTemplateID
																		REFERENCES	badge_templates,
	department_id				department_id			NOT NULL	CONSTRAINT	SewadarsBadges_FK_DepartmentID
																		REFERENCES	departments,
	weekly_sewa_location_id		weekly_sewa_location_id		NULL	CONSTRAINT	SewadarsBadges_FK_WeeklySewaLocationID
																		REFERENCES	weekly_sewa_locations,
	is_front_printed			Boolean					NOT NULL,
	is_back_printed				Boolean						NULL,

		--- Expiry_dt is:
		---		min. (retirement_dt, photo_dt + 4) for Annual & Weekly badge types & is_temporary_badge = 'No'
		---		min. (retirement_dt, photo_dt + 2) for Annual & Weekly badge types & is_temporary_badge = 'Yes'
		---		photo_dt for Retired badge_type
	expiry_dt					SMALLDATETIME			NOT NULL,

	printing_dtm				SMALLDATETIME				NULL,

			---- Remarks should contain the description as to why a particular badge entry
			---- is made.  For example, for original badges, specify "Original", etc.
	remarks						gnc_description			NOT NULL,

		CONSTRAINT	SewadarsBadges_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================
CREATE	INDEX	SewadarBadges_IX_SatsangCentreID_SewadarGRNo		ON	sewadars_badges	(	satsang_centre_id, sewadar_grno	)
GO


-- =============================================================================
--	This stores a record for issue and return of badge for a sewa.
--	Currently, the audit table is not created as manual manipulation of this table is not allowed.
-- =============================================================================

CREATE	TABLE	sewadars_badge_issues_and_returns
(
	satsang_centre_id 		satsang_centre_id		NOT NULL,
	sewadar_grno			sewadar_grno			NOT NULL,
	
	sewa_id					sewa_id					NOT NULL	CONSTRAINT	SewadarsBadgesIssuesAndReturns_FK_SewaID
																	REFERENCES	sewas,

	issue_dtm				SMALLDATETIME			NOT NULL,
	return_dtm				SMALLDATETIME				NULL,

	is_system_recorded		Boolean					NOT NULL,

		CONSTRAINT	SewadarsBadgesIssuesAndReturns_PK_SatsangCentreID_SewadarGRNo_SewaID
			PRIMARY KEY	NONCLUSTERED	(	satsang_centre_id, sewadar_grno, sewa_id	),

		CONSTRAINT	SewadarsBadgesIssuesAndReturns_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations,

		CONSTRAINT	SewadarsBadgesIssuesAndReturns_CK_IssueDtm_ReturnDtm
			CHECK	(	issue_dtm	<	return_dtm	)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarsBadgesIssuesAndReturns_CK_IssueDtm_ReturnDtm', 'Issue Date & Time can not be later than Return Date & Time',
		'USER',	'dbo', 'TABLE',	'sewadars_badge_issues_and_returns'
GO

-- =============================================================================
--	This stores a record for each sewadar merge.
--	We are not keeping the referential integrity for destination Sewadar ID (we can NOT keep for Source Sewadar ID anyway as the information is deleted)
--	because that Destination Sewadar ID may also be merged.
--	Therefore, this table has only INSERTs (and no UPDATEs or DELETEs). LATER: Triggers ensure this.
--	Thus it does not require an auditing table too.
-- =============================================================================

CREATE	TABLE	sewadars_merged
(
	src_sewadar_id			sewadar_id			NOT NULL		CONSTRAINT	SewadarsMerged_PK_SrcSewadarID
																	PRIMARY KEY	NONCLUSTERED,
	dst_sewadar_id			sewadar_id			NOT NULL,

	merged_dtm				SMALLDATETIME		NOT NULL		CONSTRAINT	SewadarMerged_DF_MergedDtm
																	DEFAULT	GetDate()
)
GO


-- =============================================================================
--	Some sewadars records are additionally exported to maintain referential integrity for Approver, References, etc.
--	These are kept in this table so that an error is NOT shown when the records are imported for a Centre.
-- =============================================================================

CREATE	TABLE	additionally_exported_sewadars
(
	exported_to_centre_id 	satsang_centre_id	NOT NULL	CONSTRAINT	AdditionallyExported_FK_ExportedToCentreID
																REFERENCES	satsang_centres_details,

	sewadar_id				sewadar_id			NOT NULL	CONSTRAINT	AdditionallyExported_FK_SewadarID
																REFERENCES	sewadars,

	satsang_centre_id 		satsang_centre_id		NOT NULL,
	sewadar_grno			sewadar_grno			NOT NULL,
	
		CONSTRAINT	AdditionallyExported_PK_ExportedToCentreID_SewadarGRNo_SewaID
			PRIMARY KEY	NONCLUSTERED	(	exported_to_centre_id, sewadar_id	),

		CONSTRAINT	AdditionallyExported_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO

-- =============================================================================
--	Some sewadars records are manually identified to be exported for different purpose.
--- One of the purpose is to create Mumbai users for managing the application at other centres.
-- =============================================================================

CREATE	TABLE	manually_exported_sewadars
(
	exported_to_centre_id 	satsang_centre_id	NOT NULL	CONSTRAINT	ManuallyExported_FK_ExportedToCentreID
																REFERENCES	satsang_centres_details,

	sewadar_id				sewadar_id			NOT NULL	CONSTRAINT	ManuallyExported_FK_SewadarID
																REFERENCES	sewadars,

	satsang_centre_id 		satsang_centre_id		NOT NULL,
	sewadar_grno			sewadar_grno			NOT NULL,
	
		CONSTRAINT	ManuallyExported_PK_ExportedToCentreID_SewadarGRNo_SewaID
			PRIMARY KEY	NONCLUSTERED	(	exported_to_centre_id, sewadar_id	),

		CONSTRAINT	ManuallyExported_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno	)
				REFERENCES	sewadars_registrations
)
GO

-- ======================================================================================
--	Speakers (Satsang Kartas, Satsang Readers, Pathis, Bal Satsang Kartas and Bal Pathis)
-- ======================================================================================

CREATE	TABLE	speakers
(
	speaker_id					sewadar_id			NOT NULL	CONSTRAINT	Speakers_PK_SpeakerID
																	PRIMARY KEY	CLUSTERED
																CONSTRAINT	Speakers_FK_SpeakerID
																	REFERENCES	sewadars_details,
	speaker_type				SpeakerType			NOT	NULL,
	satsang_centre_id 			satsang_centre_id	NOT	NULL	CONSTRAINT	Speakers_FK_SatsangCentreID
																	REFERENCES	satsang_centres_details,
	speaker_status				SpeakerStatus		NOT	NULL,
	speaker_status_dtm			SMALLDATETIME		NOT NULL,

	txn_ts						TIMESTAMP			NOT NULL
)
GO

-- =============================================================================

CREATE	TABLE	speakers_approvals_renewals
(
	speaker_id					sewadar_id			NOT NULL	CONSTRAINT	SpeakersApprovalsRenewals_FK_SpeakerID
																	REFERENCES	speakers,
	request_for_speaker_type	SpeakerType			NOT	NULL,

		--	When 0, request is for renewal
	is_approval					BIT					NOT NULL,

		--	Next renewal is 5 years from this date
	approval_dt					DATE				NOT	NULL,
	request_dt					DATE					NULL,

	reference_no				VARCHAR (20)			NULL,
	reference_dt				DATE					NULL,

	audition_remarks			VARCHAR (200)			NULL,

	review_remarks				VARCHAR (200)			NULL,
	review_sewadar_id			sewadar_id				NULL	CONSTRAINT	SpeakersApprovalsRenewals_FK_ReviewSewadarID
																	REFERENCES	sewadars,
	review_non_sewadar_nm		VARCHAR (30)			NULL,

	remarks						VARCHAR (200)			NULL,

	txn_ts						TIMESTAMP			NOT NULL,

		CONSTRAINT	SpeakersApprovalsRenewals_PK_SpeakerID_ApprovalDate
			PRIMARY	KEY	CLUSTERED	(	speaker_id, approval_dt),

		CONSTRAINT	SpeakersApprovalsRenewals_CK_ReferenceNo_ReferenceDate
			CHECK	(	(	reference_no	IS		NULL	AND	reference_dt	IS		NULL	)
					OR	(	reference_no	IS	NOT	NULL										)
					),

		CONSTRAINT	SpeakersApprovalsRenewals_CK_ReviewRemarks_ReviewSewadarID_ReviewNonSewadarName
			CHECK	(	(	review_remarks	IS		NULL	AND	review_sewadar_id	IS		NULL	AND		review_non_sewadar_nm	IS		NULL	)
					OR	(	review_remarks	IS	NOT	NULL	AND	review_sewadar_id	IS	NOT	NULL	AND		review_non_sewadar_nm	IS		NULL	)
					OR	(	review_remarks	IS	NOT	NULL	AND	review_sewadar_id	IS		NULL	AND		review_non_sewadar_nm	IS	NOT	NULL	)
					)
)
GO

-- =============================================================================

CREATE	TABLE	speakers_trainings
(
	speaker_id					sewadar_id			NOT NULL	CONSTRAINT	SpeakersTrainings_FK_SpeakerID
																	REFERENCES	speakers,
	training_for_speaker_type	SpeakerType			NOT	NULL,

		--	When is_attended is 1 or 0 (signifying attended training or did not attend training), training_dt should be in past;
		--	when is_attended is NULL, training_dt can be in future.	
	training_dt					DATE				NOT	NULL,
	is_attended					BIT						NULL,

	request_dt					DATE					NULL,

	reference_no				VARCHAR (20)			NULL,
	reference_dt				DATE					NULL,

	remarks						VARCHAR (200)			NULL,

	txn_ts						TIMESTAMP			NOT NULL,

		CONSTRAINT	SpeakersTrainings_PK_SpeakerID_TrainingDate
			PRIMARY	KEY	CLUSTERED	(	speaker_id, training_dt),

		CONSTRAINT	SpeakersTrainings_CK_ReferenceNo_ReferenceDate
			CHECK	(	(	reference_no	IS		NULL	AND	reference_dt	IS		NULL	)
					OR	(	reference_no	IS	NOT	NULL										)
					)
)
GO


-- =============================================================================

-- vim:ts=4 ht=8 sw=4
