/* ==================================================================================
    Source File		:	upgrade_v6.08.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	18-Jul-2019
	Last updated	:	18-Jul-2019
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
	SET	version_no = 6.08,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO


USE [ZSM]
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
	area_secretary_centre_id		satsang_centre_id		NOT	NULL	CONSTRAINT	SewadarApplications_FK_AreaSecretaryCentreID
																			REFERENCES	satsang_centres_details,
	area_secretary_grno				sewadar_grno			NOT	NULL,
	area_secretary_nm				reference_nm				NULL,

	secretary_id 					centre_functionary_id		NULL	CONSTRAINT	SewadarApplications_FK_SecretaryID
																			REFERENCES	satsang_centre_functionaries,
	secretary_centre_id				satsang_centre_id		NOT	NULL	CONSTRAINT	SewadarApplications_FK_SecretaryCentreID
	   																		REFERENCES	satsang_centres_details,
	secretary_grno					sewadar_grno			NOT	NULL,
	secretary_nm					reference_nm				NULL,


	sponsorer_id 					sewadar_id					NULL	CONSTRAINT	SewadarApplications_FK_SponsorerID
																			REFERENCES	sewadars,
	sponsorer_centre_id				satsang_centre_id		NOT	NULL	CONSTRAINT	SewadarApplications_FK_SponsorerCentreID
																			REFERENCES	satsang_centres_details,
	sponsorer_grno					sewadar_grno			NOT	NULL,
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
			CHECK	(	(	security_approver_id	IS		NULL	AND	security_approver_nm	IS	NOT	NULL		)
					OR	(	security_approver_id	IS	NOT	NULL	AND	security_approver_nm	IS		NULL		)
					),

		CONSTRAINT	SewadarApplications_CK_SewaSamitiApprover_SewadarID_ApproverName
			CHECK	(	(	sewa_samiti_approver_id	IS		NULL	AND	sewa_samiti_approver_nm	IS	NOT	NULL		)
					OR	(	sewa_samiti_approver_id	IS	NOT	NULL	AND	sewa_samiti_approver_nm	IS		NULL		)
					),

		CONSTRAINT	SewadarApplications_CK_LocalSewadar_SponsorerApprover_SewadarID_SponsorerName_SponsorerDepartment
			CHECK	(	(	is_outstation_sewadar	=	'No'	AND	sponsorer_id	IS		NULL	AND	sponsorer_nm	IS	NOT	NULL	AND	sponsorer_department	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'No'	AND	sponsorer_id	IS	NOT	NULL	AND	sponsorer_nm	IS		NULL	AND	sponsorer_department	IS		NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	sponsorer_id	IS		NULL	AND	sponsorer_nm	IS		NULL	AND	sponsorer_department	IS		NULL	)
					),

		CONSTRAINT	SewadarApplications_CK_OutstationSewadar_AreaSecretary_AreaSecretaryID_AreaSecretaryName
			CHECK	(	(	is_outstation_sewadar	=	'Yes'	AND	area_secretary_id	IS		NULL	AND	area_secretary_nm	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	area_secretary_id	IS	NOT	NULL	AND	area_secretary_nm	IS		NULL	)
					OR	(	is_outstation_sewadar	=	'No'	AND	area_secretary_id	IS		NULL	AND	area_secretary_nm	IS		NULL	)
					),

		CONSTRAINT	SewadarApplications_CK_OutstationSewadar_Secretary_SecretaryID_SecretaryName
			CHECK	(	(	is_outstation_sewadar	=	'Yes'	AND	secretary_id	IS		NULL	AND	secretary_nm	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	secretary_id	IS	NOT	NULL	AND	secretary_nm	IS		NULL	)
					OR	(	is_outstation_sewadar	=	'No'	AND	secretary_id	IS		NULL	AND	secretary_nm	IS		NULL	)
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
