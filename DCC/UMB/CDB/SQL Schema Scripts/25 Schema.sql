/* ==================================================================================
	Source File		:	02_CDB_schema.sql
	Author(s)		:	Sukhdev B. Darira / Jitendra Loyal
	Started On		:	Wed Aug 22 01:46:15 IST 2007
	Version			:	0.13
	Module ID		:	CDB (by virtue of RMS)
	Language		:	TRANSACT-SQL
	Last updated	:	Jun 20, 2009
	Reviewed By		:	JL
	Reviewed On		:	May 10, 2008
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Common suffixes used:
			id	Identifier		--- used for System generated identifiers
			cd	Code			--- used for user defined codes
			sq	Sequence Number	--- used for identifying the sequence, if part of Unique / Primary Key
			nm	Name
			dt	Date
			dtm	Date and Time
			dsc	Description
			ts	TimeStamp
		Recommendations for end-users for data inputs:
			*   Any piece of information (as far as possible, and unless stated otherwise)
				should be stored in mixed case and NOT in upper case. This stems from the
				fact that graphical outputs occupy lesser width for lower-case alphabets
				thereby permitting to print more amount of information in same width.
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

-- USE CDB

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- NOTE. Stores various currencies of the World.
-- =============================================================================

CREATE	TABLE	currencies
(

	currency_id			currency_id			NOT NULL	IDENTITY (1, 1)
														CONSTRAINT	Currencies_PK
															PRIMARY KEY	CLUSTERED,
	currency_nm			NVARCHAR (50)		NOT NULL	CONSTRAINT	Currencies_UK_CurrencyNm
															UNIQUE		NONCLUSTERED,


		--- The abbreviation can be used to represent the currency symbol or a short name for the currency
	currency_abbr		NVARCHAR (5)		NULL,

	effective_from		DATETIME			NOT NULL	CONSTRAINT 	Currencies_DF_EffectiveFrom
															DEFAULT Convert (VARCHAR (11), GetDate(), 106),

	effective_till		DATETIME			NOT NULL	CONSTRAINT	Currencies_DF_EffectiveTill
															DEFAULT '31-Dec-9999',

	currency_cd			VARCHAR(3)			NOT NULL	CONSTRAINT Currencies_UK_CurrencyCode 
															UNIQUE NONCLUSTERED,

		CONSTRAINT	Currencies_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)
)

GO

-- =============================================================================
-- NOTE. Stores the types of documents like Ration Card, Passport, Driving License, etc.
--		These can be single or multiple like one has a single Aadhar card, PAN, etc but can have multiple Passports, Driving Licenses, etc
--		This table is pre-populated by an initial setup script, and thus does not have any screen to manage it.
-- =============================================================================

CREATE	TABLE	document_types
(

	document_type_id		document_type_id	NOT NULL	IDENTITY (1, 1)
															CONSTRAINT	DocumentTypes_PK
																PRIMARY KEY	CLUSTERED,
	document_type_nm		VARCHAR (25)		NOT NULL	CONSTRAINT	DocumentTypes_UK_DocumentNm
																UNIQUE	NONCLUSTERED,
	document_type_cd		VARCHAR (10)		NOT NULL	CONSTRAINT	DocumentTypes_UK_DocumentCode
																UNIQUE	NONCLUSTERED,
	are_multiple_allowed	BIT					NOT	NULL,

	effective_from			DATETIME			NOT NULL	CONSTRAINT 	DocumentTypes_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	DocumentTypes_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	DocumentTypes_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)
)
GO

-- =============================================================================
-- NOTE. This table stores the different types of qualifications
--		 The information in this table is to be maintained without a UI
-- =============================================================================


CREATE	TABLE	qualification_types
(
	qualification_type		qualification_type	NOT NULL	CONSTRAINT	QualificationTypes_PK_QualificationType
																	PRIMARY KEY 	NONCLUSTERED,
	qualification_type_sq	display_order			NULL,
	effective_from			DATETIME			NOT NULL	CONSTRAINT 	QualificationTypes_DF_EffectiveFrom
																	DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	QualificationTypes_DF_EffectiveTill
																	DEFAULT '31-Dec-9999',

		CONSTRAINT	QualificationTypes_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)
)

GO

-- =============================================================================
-- NOTE. This table stores the different qualification subjects; these subjects are independent of qualifications.
-- =============================================================================


CREATE	TABLE	qlfctn_subjects
(
	qlfctn_subject_id	qlfctn_subject_id	NOT NULL	IDENTITY (1, 1)
														CONSTRAINT	QlfctnSubjects_PK_QlfctnSubjectId
																PRIMARY KEY 	NONCLUSTERED,
	qlfctn_subject_cd	VARCHAR (5)			NOT NULL	CONSTRAINT	QlfctnSubjects_U1_QlfctnSubjectCd
																UNIQUE	NONCLUSTERED,
	qlfctn_subject_nm	VARCHAR (20)		NOT NULL	CONSTRAINT	QlfctnSubjects_U2_QlfctnSubjectNm
																UNIQUE	NONCLUSTERED,
	description			VARCHAR (50)			NULL	,																
			--- LATER	Write a trigger that ensures -
			---				(a) effective_from (if updated) is earlier than the qualifications_qlfctn_subjects.effective_from, if any
			---				(b) effective_till (if updated) is later than the qualifications_qlfctn_subjects.effective_till, if any
			---			If condition is violated, the trigger should prevent update.
	effective_from		DATETIME			NOT NULL	CONSTRAINT	QlfctnSubjects_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till		DATETIME			NOT NULL	CONSTRAINT	QlfctnSubjects_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	QlfctnSubjects_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)
)

GO

-- =============================================================================
-- NOTE. This table stores the different qualifications
-- =============================================================================


CREATE	TABLE	qualifications
(
	qualification_id	qualification_id	NOT NULL	IDENTITY (1, 1)
														CONSTRAINT	Qualifications_PK_QualificationId
																PRIMARY KEY 	NONCLUSTERED,
	qualification_type	qualification_type	NOT NULL	CONSTRAINT	Qualifications_FK_QualificationType
																REFERENCES	qualification_types,
	qualification_cd	VARCHAR (8)			NOT NULL	CONSTRAINT	Qualifications_U1_QualificationCd
																UNIQUE	NONCLUSTERED,
	qualification_nm	VARCHAR (100)		NOT NULL	CONSTRAINT	Qualifications_U2_QualificationNm
																UNIQUE	NONCLUSTERED,
	remarks				VARCHAR (200)			NULL,
			--- LATER	Write a trigger that ensures -
			---				(a) effective_from (if updated) is earlier than the qualifications_qlfctn_subjects.effective_from, if any
			---				(b) effective_till (if updated) is later than the qualifications_qlfctn_subjects.effective_till, if any
			---			If condition is violated, the trigger should prevent update.
	effective_from		DATETIME			NOT NULL	CONSTRAINT 	Qualifications_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till		DATETIME			NOT NULL	CONSTRAINT	Qualifications_DF_EffectiveTill
																DEFAULT '31-Dec-9999',
	txn_ts				TIMESTAMP			NOT NULL,

		CONSTRAINT	Qualifications_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)
)

GO

-- =============================================================================
-- NOTE. This table stores the different qualification subjects for qualifications
-- =============================================================================


CREATE	TABLE	qualifications_qlfctn_subjects
(
	qualification_id	qualification_id	NOT NULL	CONSTRAINT	QualificationsQlfctnSubjects_FK_QualificationId
																REFERENCES	qualifications,
	qlfctn_subject_id	qlfctn_subject_id	NOT NULL	CONSTRAINT	QualificationsQlfctnSubjects_FK_QlfctnSubjectId
																REFERENCES	qlfctn_subjects,
			--- LATER	Trigger(s) ensurea that -
			---				(a) effective_from is not earlier than the [qlfctn_subjects|qualifications].effective_from, if any
			---				(b) effective_till (if updated) is earlier than the [qlfctn_subjects|qualifications].effective_till, if any
			---			If condition is violated, the trigger should prevent update/insert.
	effective_from		DATETIME			NOT NULL	CONSTRAINT 	QualificationsQlfctnSubjects_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till		DATETIME			NOT NULL	CONSTRAINT	QualificationsQlfctnSubjects_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	QualificationsQlfctnSubjects_PK_QualificationId_QlfctnSubjectID
				PRIMARY KEY NONCLUSTERED	(qualification_id, qlfctn_subject_id),

		CONSTRAINT	QualificationsQlfctnSubjects_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)
)

GO

-- =============================================================================
	---- NOTE. This table is redefined to change the column names
-- =============================================================================

CREATE	TABLE	marital_status
(
	marital_status		marital_status		NOT NULL	CONSTRAINT	MaritalStatus_PK_MaritalStatus
																PRIMARY KEY		NONCLUSTERED,
	effective_from		DATETIME			NOT NULL	CONSTRAINT 	MaritalStatus_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till		DATETIME			NOT NULL	CONSTRAINT	MaritalStatus_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	MaritalStatus_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)
)
GO


-- =============================================================================
-- Note. 											Table for Working Units
-- =============================================================================
	--- The department groups, departments and sections for different societies form the hierarchy today.
	--- These can be called as working_unit_entities, whereas the actual instances of these entities
	--- can be called as working_units. This terminology will facilitate in setting up and managing the
	--- the hierarchy as we go along.
	---	Working Unit Entities do not have any front-end and these are directly managed in the table.
	--- The hierarchy of Working Units is formed with ROOT nodes as the Socities, viz., RSSB and MJSMRS.
	--- Since the societies are managed in an independant table, the working unit entity is pre-defined
	--- for root nodes. Also, the root nodes can NOT be created using the front-end screen for Working Units;
	--- this is because the Societies are managed independantly, and when a society information is added or
	--- or modified, the corresponding working unit (root node) should also be added or modified respectively.
-- =============================================================================


CREATE	TABLE	working_unit_entities
(
	entity_id				working_unit_entity_id	NOT NULL	IDENTITY (1, 1)
																CONSTRAINT	WorkingUnitEntities_PK_WorkingUnitEntityId
																		PRIMARY KEY 	NONCLUSTERED,
	entity_singular_nm		VARCHAR (20)			NOT NULL	CONSTRAINT	WorkingUnitEntities_U1_EntitySingularNm
																		UNIQUE	NONCLUSTERED,
	entity_plural_nm		VARCHAR (20)			NOT NULL	CONSTRAINT	WorkingUnitEntities_U2_EntityPluralNm
																		UNIQUE	NONCLUSTERED,
	effective_from			DATETIME				NOT NULL	CONSTRAINT 	WorkingUnitEntities_DF_EffectiveFrom
																		DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME				NOT NULL	CONSTRAINT	WorkingUnitEntities_DF_EffectiveTill
																		DEFAULT '31-Dec-9999',
		CONSTRAINT	WorkingUnitEntities_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)
)
GO

-- =============================================================================

CREATE	TABLE	working_units
(
	working_unit_id			working_unit_id			NOT NULL	IDENTITY (1, 1)
																CONSTRAINT	WorkingUnits_PK_WorkingUnitId
																		PRIMARY KEY	NONCLUSTERED,
	working_unit_cd			VARCHAR (10)			NOT NULL,
	working_unit_nm			VARCHAR (50)			NOT NULL,

	is_root					Boolean					NOT NULL	Default	'No',
	is_leaf					Boolean					NOT NULL	Default	'No',

    society_id				society_id				NOT NULL	CONSTRAINT	WorkingUnits_FK_SocietyID
																		REFERENCES	societies,

		---- Note. This column, when set for the current level is continued to be set for all the sub-nodes (till leaf nodes) in the sub-tree.
		---			This is because the nodes that have this flag set, can be used for identifying whether the sewadars
		---			can be posted there. For example, if we consider that it is set when the current level is department
		---			groups, it will be set for all the departments as well as sections (assuming that
		---			the department has sections) in the department_group.
		--	LATER: We may have trigger defined on working_units table that ensures that 
		--			when is_staff_posted is set to Yes, all the levels below working_unit_id
		--			have indeed is_staff_posted set to Yes.
	is_staff_posted			Boolean					NOT NULL	Default	'No',

	working_unit_entity_id	working_unit_entity_id	NOT NULL	CONSTRAINT	WorkingUnits_FK_WorkingUnitEntityId
																		REFERENCES	working_unit_entities,

		--- This is the parent node of the current working unit. It is NOT specified for ROOT nodes (societies).
	group_working_unit_id	working_unit_id				NULL	CONSTRAINT	WorkingUnits_FK_GroupWorkingUnitId
																	REFERENCES	working_units,

		--	It will be usually 2 or 3 characters and is used for printing on the vouchers like Material Requisition in MMS
	working_unit_short_cd	VARCHAR (10)				NULL,

	effective_from			DATETIME				NOT NULL	CONSTRAINT	WorkingUnits_DF_EffectiveFrom
																		DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME				NOT NULL	CONSTRAINT	WorkingUnits_DF_EffectiveTill
																		DEFAULT '31-Dec-9999',
	txn_ts					TIMESTAMP				NOT NULL,

	print_nm				VARCHAR (50)				NULL,

		CONSTRAINT	WorkingUnits_U1_WorkingUnitNm_GroupWorkingUnitId
			UNIQUE		NONCLUSTERED	(working_unit_nm, group_working_unit_id),

		CONSTRAINT	WorkingUnits_U2_WorkingUnitCd_GroupWorkingUnitId
			UNIQUE		NONCLUSTERED	(working_unit_cd, group_working_unit_id),

		CONSTRAINT	WorkingUnits_CK_GroupWorkingUnitId_IsRoot
			CHECK	(	(	is_root = 'Yes'	AND	group_working_unit_id	IS NULL		)
					OR	(	is_root = 'No'	AND	group_working_unit_id	IS NOT NULL	)
					),

		CONSTRAINT	WorkingUnits_CK_EffectiveDates
				CHECK	(effective_from <= effective_till)

)
GO

-- =============================================================================
--	Note. This table stores the types of responsibilities that the next level of working units can have.
-- =============================================================================

CREATE	TABLE	responsibility_types
(
	responsibility_type_id	responsibility_type_id	NOT NULL	IDENTITY (1, 1)
																CONSTRAINT	ResponsibilityTypes_PK_ResponsibilityTypeId
																		PRIMARY KEY	NONCLUSTERED,
		--- It is the current working unit id for which the next level of responsibility specs are defined
	working_unit_id			working_unit_id			NOT NULL	CONSTRAINT	ResponsibilityTypes_FK_WorkingUnitId
																		REFERENCES	working_units,
	responsibility_nm		VARCHAR (20)			NOT NULL,
		
		--- Number of sewadars
	responsibility_cnt		TINYINT					NOT NULL,

		--- This defines the order in which the responsibilities should appear when sewadars are specified.
	responsibility_sq		display_order			NOT NULL,

		CONSTRAINT	ResponsibilityTypes_U1_WorkingUnitId_ResponsibilityNm
				UNIQUE	NONCLUSTERED	(working_unit_id, responsibility_nm),

		CONSTRAINT	ResponsibilityTypes_U2_WorkingUnitId_ResponsibilitySq
				UNIQUE	NONCLUSTERED	(working_unit_id, responsibility_sq)
)
GO


-- =============================================================================
---	Note. This table contains the actual sewadars that who have undertaken the respective responsibilities.
---		LATER: The triggers can be defined that ensure:-
---					*	working_unit_id is child of responsibility_types.working_unit_id
--					*	sewadar_id exists in RMS..sewadars table and has active status
--					*	The number of rows for a working unit and responsibility type is less than
--						or equal to the responsibility_types.responsibility_cnt.
-- =============================================================================

CREATE	TABLE	working_unit_responsibilities
(
	working_unit_id			working_unit_id			NOT NULL	CONSTRAINT	WorkingUnitsResponsibilities_FK_WorkingUnitId
																		REFERENCES	working_units,
	sewadar_id				sewadar_id				NOT NULL,

	responsibility_type_id	responsibility_type_id	NOT NULL	CONSTRAINT	WorkingUnitsResponsibilities_FK_ResponsibilityId
																		REFERENCES	responsibility_types,
	responsibility_sq		display_order			NOT NULL,

		CONSTRAINT	WorkingUnitsResponsibilities_PK_WorkingUnitId_SewadarId
				PRIMARY KEY	NONCLUSTERED	(working_unit_id, sewadar_id),

		CONSTRAINT	WorkingUnitsResponsibilities_UK_WorkingUnitId_ResponsibilitySq
				UNIQUE	NONCLUSTERED	(working_unit_id, responsibility_sq)
)
GO

-- =============================================================================

CREATE	TABLE	working_unit_sanctioned_strength
(
		--- This working unit should have is_staff_posted set to Yes.
		--- LATER: A trigger to be written to ensure the above.
	working_unit_id			working_unit_id			NOT NULL	CONSTRAINT	WorkingUnitSanctionedStrength_PK_WorkingUnitId
																		PRIMARY KEY	NONCLUSTERED
																CONSTRAINT	WorkingUnitSanctionedStrength_FK_WorkingUnitId
																		REFERENCES	working_units,

	honorary_sewadar_cnt	SMALLINT				NOT NULL	CONSTRAINT	WorkingUnitSanctionedStrength_CK_HonorarySewadarCnt
																		CHECK	(honorary_sewadar_cnt	>=	0),

	parshadi_sewadar_cnt	SMALLINT				NOT NULL	CONSTRAINT	WorkingUnitSanctionedStrength_CK_ParshadiSewadarCnt
																		CHECK	(parshadi_sewadar_cnt	>=	0),

		CONSTRAINT	WorkingUnitSanctionedStrength_CK_SewadarCount
				CHECK	(honorary_sewadar_cnt + parshadi_sewadar_cnt	>	0)
)
GO

-- =============================================================================
--				Tables for Telephone Line, EPABX Extensions and Fax Lines
-- =============================================================================

	-- Note. P & T Telephone Lines 

CREATE	TABLE	working_unit_p_and_t_lines
(
    working_unit_id		working_unit_id		NOT NULL	CONSTRAINT	WorkingUnitPAndTLines_FK_WorkingUnitId
																REFERENCES	working_units,
    p_and_t_line		telephone_no		NOT NULL	CONSTRAINT	WorkingUnitPAndTLines_FK_PAndTLine
																REFERENCES	p_and_t_lines,
    line_sq				display_order		NOT NULL,

		CONSTRAINT	WorkingUnitPAndTLines_PK_WorkingUnitId_PAndTLine
				PRIMARY KEY	NONCLUSTERED	(working_unit_id, p_and_t_line),

		CONSTRAINT	WorkingUnitPAndTLines_UK_WorkingUnitId_LineSq
				UNIQUE		NONCLUSTERED	(working_unit_id, line_sq)
)
GO


	-- Note. P & T Fax Lines 

CREATE	TABLE	working_unit_fax_lines
(
    working_unit_id		working_unit_id		NOT NULL	CONSTRAINT	WorkingUnitFaxLines_FK_WorkingUnitId
																REFERENCES	working_units,
    fax_line			telephone_no		NOT NULL	CONSTRAINT	WorkingUnitFaxLines_FK_FaxLine
																REFERENCES	p_and_t_lines,
    line_sq				display_order		NOT NULL,

		CONSTRAINT	WorkingUnitFaxLines_PK_WorkingUnitId_FaxLine
				PRIMARY KEY	NONCLUSTERED	(working_unit_id, fax_line),

		CONSTRAINT	WorkingUnitFaxLines_UK_WorkingUnitId_LineSq
				UNIQUE		NONCLUSTERED	(working_unit_id, line_sq)
)
GO


	-- Note. EPABX Extensions

CREATE	TABLE	working_unit_epabx_extensions
(
    working_unit_id		working_unit_id		NOT NULL	CONSTRAINT	WorkingUnitEpabxExtensions_FK_WorkingUnitId
																REFERENCES	working_units,
    epabx_extension		extension_no		NOT NULL	CONSTRAINT	WorkingUnitEpabxExtensions_FK_EpabxExtension
																REFERENCES	epabx_lines,
    extension_sq		display_order		NOT NULL,

		CONSTRAINT	WorkingUnitEpabxExtensions_PK_WorkingUnitId_EpabxExtension
			PRIMARY KEY	NONCLUSTERED	(working_unit_id, epabx_extension),

		CONSTRAINT	WorkingUnitEpabxExtensions_UK_WorkingUnitId_ExtensionSq
			UNIQUE		NONCLUSTERED	(working_unit_id, extension_sq)
)
GO


	
-- =============================================================================

CREATE	TABLE	designations	
(
    designation_id			designation_id			NOT NULL    	IDENTITY (1,1)
																	CONSTRAINT	Designations_PK_DesignationID
									    									PRIMARY KEY	NONCLUSTERED,
    designation_cd			VARCHAR (50)			NOT NULL,
    designation_nm			VARCHAR (100)			NOT NULL,
	designation_sq			display_order				NULL,

    minimum_age				age			    			NULL,
    maximum_starting_age	age			    			NULL,
    retirement_age			age			    			NULL,

    txn_ts					TIMESTAMP				NOT NULL,
    effective_from			DATETIME				NOT NULL		CONSTRAINT	Designations_DF_EffectiveFrom
																			DEFAULT	GetDate(),
    effective_till			DATETIME				NOT NULL		CONSTRAINT	Designations_DF_EffectiveTill
																			DEFAULT	'31-Dec-9999',

		CONSTRAINT	UK_Designations_Code
				UNIQUE	NONCLUSTERED	(designation_cd),

		CONSTRAINT	UK_Designations_Name
				UNIQUE	NONCLUSTERED	(designation_nm),
	
		CONSTRAINT	CK_Designations_StartingAge
				CHECK	(minimum_age <= maximum_starting_age),

		CONSTRAINT	CK_Designations_RetirementAge
				CHECK	(maximum_starting_age <= retirement_age),

		CONSTRAINT	CK_Designations_EffectiveDates
				CHECK	(effective_from <= effective_till)
)
GO

-- =============================================================================

-- vim:ts=4 sw=4 ht=4
