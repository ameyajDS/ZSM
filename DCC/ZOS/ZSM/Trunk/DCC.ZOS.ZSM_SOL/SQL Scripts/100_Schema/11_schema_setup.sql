/* ==================================================================================
    Source File		:	schema_setup.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sun Nov 07 08:20:33 IST 2010
    Version			:	1.00
    Last updated	:	Apr 07, 2013
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
  JL/MS : 07-Apr-2013
		* Table _sample_images added.
     JL : 22-Dec-2011
		* Table definition for scanning_job_types moved from schema_scanning script.
		* Table definition for generic_reports moved from schema_rpts script.
     JL : 10-Dec-2011
		* Table sewadar_types added.
		* Table controlling_sequences dropped.
     JL : 07-29-Nov-2010
		*   Initial versions
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--	NOTE. Address Proofs; there is no front-end screen to manage these
-- =============================================================================

CREATE	TABLE	address_proofs
(
	address_proof			address_proof		NOT NULL	CONSTRAINT	AddressProofs_PK_AddressProof
																PRIMARY KEY	NONCLUSTERED,
	address_proof_sq		display_order		NOT NULL	CONSTRAINT	AddressProofs_UK_AddressProofSq
																UNIQUE	NONCLUSTERED,
	remarks					remarks					NULL,

	effective_from			DATETIME			NOT NULL	CONSTRAINT	AddressProofs_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	AddressProofs_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	AddressProofs_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'AddressProofs_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'address_proofs'
GO


-- =============================================================================
--	NOTE. Address Types; there is no front-end screen to manage these
-- =============================================================================

CREATE	TABLE	address_types
(
	address_type			address_type		NOT NULL	CONSTRAINT	AddressTypes_PK_AddressType
																PRIMARY KEY	NONCLUSTERED,
	remarks					remarks					NULL,

	effective_from			DATETIME			NOT NULL	CONSTRAINT	AddressTypes_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	AddressTypes_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	AddressTypes_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'AddressTypes_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'address_types'
GO


-- =============================================================================
---- There is no front-end screen to manage Attendance Units
-- =============================================================================

CREATE	TABLE	attendance_units
(
	attendance_unit			attendance_unit		NOT NULL	CONSTRAINT	AttendanceUnits_PK_AttendanceUnit
																PRIMARY KEY	NONCLUSTERED,
	remarks					remarks					NULL,

	effective_from			DATETIME			NOT NULL	CONSTRAINT	AttendanceUnits_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	AttendanceUnits_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	AttendanceUnits_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'AttendanceUnits_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'attendance_units'
GO


-- =============================================================================
--	NOTE. Types of Badge Parts like Department, Sub-department, Centre, etc
-- =============================================================================

CREATE	TABLE	badge_part_types
(
	badge_part_type			badge_part_type		NOT NULL	CONSTRAINT	BadgePartTypes_PK_BadgePartType
																PRIMARY KEY	NONCLUSTERED,
	remarks					remarks					NULL,

	effective_from			DATETIME			NOT NULL	CONSTRAINT	BadgePartTypes_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	BadgePartTypes_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	BadgePartTypes_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'BadgePartTypes_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'badge_part_types'
GO


-- =============================================================================
--	Functionaries like Secretaries, Area Secretaries at Centres; there is no front-end screen to manage these
-- =============================================================================

CREATE	TABLE	centre_functionaries
(
	centre_functionary		centre_functionary	NOT NULL	CONSTRAINT	CentreFunctionaries_PK_CentreFunctionary
																PRIMARY KEY	NONCLUSTERED,
	remarks					remarks					NULL,

	effective_from			DATETIME			NOT NULL	CONSTRAINT	CentreFunctionaries_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	CentreFunctionaries_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	CentreFunctionaries_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'SewaFrequencies_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'centre_functionaries'
GO


-- =============================================================================
-- Status of a sewadar; this table does not have a front-end screen
-- =============================================================================

CREATE	TABLE	sewadar_status
(
	sewadar_status_cd		sewadar_status_cd	NOT NULL	CONSTRAINT	SewadarStatus_PK_SewadarStatusCd
																PRIMARY KEY	NONCLUSTERED,
	sewadar_status_nm		VARCHAR (20)		NOT NULL	CONSTRAINT	SewadarStatus_UK_SewadarStatusNm
																UNIQUE	NONCLUSTERED,
	is_global				Boolean				NOT	NULL,

		--- Whether multiple status are allowed for a Person? For example, a person can be Inactive, Left, etc at more than one centre.
	is_multiple				Boolean					NULL,

	remarks					remarks					NULL,

	effective_from			DATETIME			NOT NULL	CONSTRAINT	SewadarStatus_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	SewadarStatus_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	SewadarStatus_CK_IsGlobal_IsMultiple
			CHECK	(	(	is_global	=	'Yes'	AND	is_multiple	IS NULL		)
					OR	(	is_global	=	'No'	AND	is_multiple	IS NOT NULL	)
					),

		CONSTRAINT	SewadarStatus_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarStatus_CK_FutureDays', 'The "Future Days for Status Date" should be between 1 and 65 only',
		'USER',	'dbo', 'TABLE',	'sewadar_status'
GO

EXEC 	sp_addextendedproperty
		'SewadarStatus_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'sewadar_status'
GO

-- =============================================================================


CREATE	TABLE	sewadar_status_valid_transitions
(
	old_sewadar_status_cd		sewadar_status_cd	NULL	CONSTRAINT	SewadarStatusValidTransitions_FK_OldSewadarStatusCd
																REFERENCES	sewadar_status,
	new_sewadar_status_cd		sewadar_status_cd	NULL	CONSTRAINT	SewadarStatusValidTransitions_FK_NewSewadarStatusCd
																REFERENCES	sewadar_status,

		CONSTRAINT	SewadarStatusValidTransitions_UK_OldSewadarStatusCd_NewSewadarStatusCd
			UNIQUE	NONCLUSTERED	(	old_sewadar_status_cd, new_sewadar_status_cd	)
)
GO


-- =============================================================================
-- Tables for Attributes
-- =============================================================================

CREATE	TABLE	generic_attributes
(
	attribute_id			attribute_id			NOT NULL	IDENTITY (1, 1)
																CONSTRAINT	GenericAttributes_PK_AttributeID
																	PRIMARY KEY	NONCLUSTERED,
	attribute_nm			gnc_nm					NOT NULL	CONSTRAINT	GenericAttributes_UK_AttributeNm
																	UNIQUE	NONCLUSTERED,
	
		--- The purpose of this is to group certain attributes so that this can be used for managing a set
		---	of attributes from a different screen, or for any other purpose like supporting it for different objects like sewadars, satsang_centres, etc.
		--- Initially, only one group is defined, viz., Sewadar
	attribute_group			gnc_nm					NOT NULL,

	attribute_sq			display_order			NOT NULL,

	attribute_type			gnc_short_nm			NOT NULL	CONSTRAINT	GenericAttributes_CK_AttributeType
																	CHECK	(	attribute_type	IN	(	'Boolean',			---- Boolean
																										'Date',				---- DATETIME (_dt)
																										'Timestamp',		---- DATETIME (_dtm)
																										'String',			---- VARCHAR
																										'Integer',			---- INTEGER
																										'Number',			---- NUMERIC
																										'List'				---- Value is from a selected list
																									)
																			),
			--- Length is specified for String and Number (actually Precision)
	attribute_length		TINYINT						NULL,
			--- Scale is specified for Number
	attribute_scale		TINYINT							NULL,

			--- If set to Yes, the attribute is applicable for specified period (which must be specified) when using the attribute for a Sewadar
	is_temporal				Boolean					NOT	NULL,

	is_mandatory			Boolean					NOT	NULL,

			--- If set to Yes, the attribute is applicable for only those status that is specified in generic_attributes_status
	is_status_applicable	Boolean						NULL,

	remarks					remarks						NULL,

	txn_ts					TIMESTAMP				NOT NULL,

		CONSTRAINT	GenericAttributes_PK_AttributeGroup_AttributeSq
			UNIQUE	NONCLUSTERED	(	attribute_group, attribute_sq	),

		CONSTRAINT	GenericAttributes_CK_AttributeType_AttributeLength_AttributePrecision
			CHECK	(	(	attribute_type	=	'String'						AND	attribute_length	BETWEEN 1	AND	255	AND	attribute_scale	IS NULL				)
					OR	(	attribute_type	=	'List'							AND	attribute_length	BETWEEN 1	AND	20	AND	attribute_scale	IS NULL				)
					OR	(	attribute_type	=	'Number'						AND	attribute_length	BETWEEN 1	AND	20	AND	attribute_scale	BETWEEN 1	AND	8
																				AND	attribute_length	>	attribute_scale
						)
					OR	(	attribute_type	NOT IN	(	'String', 'Number', 'List'	)	AND	attribute_length	IS NULL				AND	attribute_scale	IS NULL				)
					)
)
GO

EXEC 	sp_addextendedproperty
		'GenericAttributes_CK_AttributeType_AttributeLength_AttributeScale',
				'Length (between 1 and 20 / 255) is specified only for List or String Attributes whereas Length (between 1 and 20) and Scale (between 1 and 8) are specified only for Numeric Attributes',
		'USER',	'dbo', 'TABLE',	'generic_attributes'
GO


-- =============================================================================
--	NOTE. Trigger ensures that rows exist in this table only for such generic_attributes.attribute_type = List(Trigger a)
-- =============================================================================

CREATE	TABLE	generic_attributes_list_values
(
	attribute_id			attribute_id		NOT NULL	CONSTRAINT	GenericAttributesListValues_FK_AttributeID
																REFERENCES	generic_attributes,
	attribute_value			attribute_value		NOT NULL,

	attribute_value_sq		display_order		NOT NULL,

		CONSTRAINT	GenericAttributesListValues_PK_AttributeID_AttributeValue
			PRIMARY KEY	NONCLUSTERED	(	attribute_id, attribute_value	),

		CONSTRAINT	GenericAttributesListValues_PK_AttributeID_AttributeValueSq
			UNIQUE	NONCLUSTERED	(	attribute_id, attribute_value_sq	)
)
GO


-- =============================================================================
--	NOTE. Trigger ensures that rows exist in this table only for such generic_attributes.is_status_applicable = Yes(Trigger a)
-- =============================================================================

CREATE	TABLE	generic_attributes_status
(
	attribute_id			attribute_id		NOT NULL	CONSTRAINT	GenericAttributesStatus_FK_AttributeID
																REFERENCES	generic_attributes,
	sewadar_status_cd		sewadar_status_cd	NOT NULL	CONSTRAINT	GenericAttributesStatus_FK_StatusCd
																REFERENCES	sewadar_status,

		CONSTRAINT	GenericAttributesStatus_PK_AttributeID_StatusCd
			PRIMARY KEY	NONCLUSTERED	(	attribute_id, sewadar_status_cd	)
)
GO


-- =============================================================================
--	NOTE. Occupations; there is no front-end screen to manage these
-- =============================================================================

CREATE	TABLE	occupations
(
	occupation			occupation		NOT NULL	CONSTRAINT	Occupations_PK_Occupation
														PRIMARY KEY	NONCLUSTERED,
	remarks				remarks				NULL,

	effective_from		DATETIME		NOT NULL	CONSTRAINT	Occupations_DF_EffectiveFrom
														DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till		DATETIME		NOT NULL	CONSTRAINT	Occupations_DF_EffectiveTill
														DEFAULT '31-Dec-9999',

		CONSTRAINT	Occupations_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'Occupations_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'occupations'
GO


-- =============================================================================
--	NOTE. Sewadar Types; there is no front-end screen to manage these
-- =============================================================================

CREATE	TABLE	sewadar_types
(
	sewadar_type		sewadar_type	NOT NULL	CONSTRAINT	SewadarTypes_PK_SewadarType
														PRIMARY KEY	NONCLUSTERED,
	remarks				remarks				NULL,

	effective_from		DATETIME		NOT NULL	CONSTRAINT	SewadarTypes_DF_EffectiveFrom
														DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till		DATETIME		NOT NULL	CONSTRAINT	SewadarTypes_DF_EffectiveTill
														DEFAULT '31-Dec-9999',

		CONSTRAINT	SewadarTypes_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarTypes_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'sewadar_types'
GO


-- =============================================================================
--	NOTE. Types of Remarks; there is no front-end screen to manage these
-- =============================================================================

CREATE	TABLE	remarks_types
(
	remarks_type		remarks_type		NOT NULL	CONSTRAINT	RemarksTypes_PK_RemarksType
															PRIMARY KEY	NONCLUSTERED,
	remarks_type_sq		display_order		NOT NULL	CONSTRAINT	RemarksTypes_UK_RemarksTypeSq
															UNIQUE	NONCLUSTERED,
	remarks				remarks					NULL,

	effective_from		DATETIME			NOT NULL	CONSTRAINT	RemarksTypes_DF_EffectiveFrom
															DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till		DATETIME			NOT NULL	CONSTRAINT	RemarksTypes_DF_EffectiveTill
															DEFAULT '31-Dec-9999',

		CONSTRAINT	RemarksTypes_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'RemarksTypes_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'remarks_types'
GO


-- =============================================================================
--	NOTE. Responsibilities that may be assigned to a sewadar; there is no front-end screen to manage these
-- =============================================================================

CREATE	TABLE	responsibilities
(
	responsibility			responsibility		NOT NULL	CONSTRAINT	Responsibilities_PK_Responsibility
																PRIMARY KEY	NONCLUSTERED,
	responsibility_sq		display_order		NOT NULL	CONSTRAINT	Responsibilities_UK_ResponsibilitySq
																UNIQUE	NONCLUSTERED,
	remarks					remarks					NULL,

	effective_from			DATETIME			NOT NULL	CONSTRAINT	Responsibilities_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	Responsibilities_DF_EffectiveTill
																DEFAULT '31-Dec-9999',
	txn_ts					TIMESTAMP			NOT NULL,

		CONSTRAINT	Responsibilities_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'Responsibilities_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'responsibilities'
GO


-- =============================================================================
--	NOTE. Validating Actions while scanning badges; there is no front-end screen to manage these
--	These are the actions that need to be taken when already a scanned record is existing.
-- =============================================================================

CREATE	TABLE	scanning_validating_actions
(
	scanning_validating_action	scanning_validating_action		NOT NULL	CONSTRAINT	ScanningValidatingActions_PK_ScanningValidatingAction
																				PRIMARY KEY	NONCLUSTERED,
	remarks						VARCHAR (200)						NULL,

	effective_from				DATETIME						NOT NULL	CONSTRAINT	ScanningValidatingActions_DF_EffectiveFrom
																				DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till				DATETIME						NOT NULL	CONSTRAINT	ScanningValidatingActions_DF_EffectiveTill
																				DEFAULT '31-Dec-9999',

		CONSTRAINT	ScanningValidatingActions_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'ScanningValidatingActions_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'scanning_validating_actions'
GO

-- =============================================================================
---- There is no front-end screen to manage Sewa Frequencies
-- =============================================================================

CREATE	TABLE	sewa_frequencies
(
	sewa_frequency			sewa_frequency		NOT NULL	CONSTRAINT	SewaFrequencies_PK_SewaFrequency
																PRIMARY KEY	NONCLUSTERED,
	remarks					remarks					NULL,

	effective_from			DATETIME			NOT NULL	CONSTRAINT	SewaFrequencies_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	SewaFrequencies_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	SewaFrequencies_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'SewaFrequencies_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'sewa_frequencies'
GO


-- =============================================================================
--	NOTE. Sewa Shifts; there is no front-end screen to manage these
-- =============================================================================

CREATE	TABLE	sewa_shifts
(
	sewa_shift			sewa_shift		NOT NULL	CONSTRAINT	SewaShifts_PK_SewaShift
															PRIMARY KEY	NONCLUSTERED,
	sewa_shift_sq		display_order	NOT NULL	CONSTRAINT	SewaShifts_UK_SewaShiftSq
															UNIQUE	NONCLUSTERED,
	remarks				remarks				NULL,

	effective_from		DATETIME		NOT NULL	CONSTRAINT	SewaShifts_DF_EffectiveFrom
														DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till		DATETIME		NOT NULL	CONSTRAINT	SewaShifts_DF_EffectiveTill
														DEFAULT '31-Dec-9999',

		CONSTRAINT	SewaShifts_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'SewaShifts_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'sewa_shifts'
GO


-- =============================================================================
---- There is no front-end screen to manage Used of Sewadar Lists
-- =============================================================================

CREATE	TABLE	sewadar_list_uses
(
	sewadar_list_use		sewadar_list_use	NOT NULL	CONSTRAINT	SewadarListUses_PK_SewadarListUse
																PRIMARY KEY	NONCLUSTERED,
	sewadar_list_use_sq		display_order		NOT NULL	CONSTRAINT	SewadarListUses_UK_SewadarListUseSq
																UNIQUE	NONCLUSTERED,
	remarks					remarks					NULL,

	effective_from			DATETIME			NOT NULL	CONSTRAINT	SewadarListUses_DF_EffectiveFrom
																DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till			DATETIME			NOT NULL	CONSTRAINT	SewadarListUses_DF_EffectiveTill
																DEFAULT '31-Dec-9999',

		CONSTRAINT	SewadarListUses_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarListUses_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'sewadar_list_uses'
GO


-- =============================================================================
	---- NOTE. This function is used for the getting the value for specified system information id
-- =============================================================================

CREATE	FUNCTION	GetSystemInfoValue
(
		@p_value_int		INT,
		@p_value_varchar	gnc_nm,
		@p_value_dt			DATETIME,
		@p_value_dtm		DATETIME
)
	RETURNS gnc_nm

WITH ENCRYPTION
AS
BEGIN
    DECLARE	@v_info_value			gnc_nm

    SELECT	@v_info_value =
		CASE
			WHEN	@p_value_int		IS NOT NULL		THEN	CONVERT	(VARCHAR, 		@p_value_int		)
			WHEN	@p_value_varchar	IS NOT NULL		THEN	@p_value_varchar
			WHEN	@p_value_dt			IS NOT NULL		THEN	CONVERT (VARCHAR (11), 	@p_value_dt,	106	)
			WHEN	@p_value_dtm		IS NOT NULL		THEN	CONVERT (VARCHAR (24), 	@p_value_dtm, 	113	)
		END

    RETURN	@v_info_value
END
GO


-- =============================================================================
--	System Information
--	This table stores different parameters at the system level, and it does not have an UI
-- =============================================================================

CREATE	TABLE	system_information_codes
(
	system_info_cd		system_info_cd	NOT NULL	CONSTRAINT	SystemInformationCodes_PK_InfoCd
														PRIMARY KEY NONCLUSTERED,
	system_info_nm		gnc_nm			NOT NULL,
	remarks				remarks				NULL
)
GO


-- =============================================================================

CREATE	TABLE	system_information_values
(
	system_info_cd		system_info_cd	NOT NULL	CONSTRAINT	SystemInformationValues_FK_InfoCd
														REFERENCES	system_information_codes,
	system_info_value	AS	dbo.GetSystemInfoValue (	value_int, value_varchar, value_dt, value_dtm	),
	value_int			INT					NULL,
	value_varchar		gnc_nm				NULL,
	value_dt			DATETIME			NULL,
	value_dtm			DATETIME			NULL,

		CONSTRAINT	SystemInformationValues_UK_InfoCd_ValueInt_ValueVarchar_ValueDt_ValueDtm
			UNIQUE NONCLUSTERED 	(	system_info_cd, value_int, value_varchar, value_dt, value_dtm	),

		CONSTRAINT	SystemInformationValues_CK_InfoValuesSpecified
			CHECK	(	(	value_int		IS NOT 	NULL
						AND	value_varchar	IS  	NULL
						AND	value_dt		IS  	NULL
						AND	value_dtm		IS 	 	NULL
						)
					OR
						(	value_int		IS  	NULL
						AND	value_varchar	IS NOT 	NULL
						AND	value_dt		IS  	NULL
						AND	value_dtm		IS 	 	NULL
						)
					OR
						(	value_int		IS  	NULL
						AND	value_varchar	IS  	NULL
						AND	value_dt		IS NOT 	NULL
						AND	value_dtm		IS 	 	NULL
						)
					OR
						(	value_int		IS  	NULL
						AND	value_varchar	IS  	NULL
						AND	value_dt		IS  	NULL
						AND	value_dtm		IS NOT 	NULL
						)
					)
)
GO


-- =============================================================================
--	Types of Scanning Jobs
-- =============================================================================

CREATE	TABLE	scanning_job_types
(
	scanning_job_type_cd	scanning_job_type_cd	NOT NULL	CONSTRAINT	ScanningJobTypes_PK_ScanningJobTypeID
																	PRIMARY KEY	NONCLUSTERED,

	remarks					remarks						NULL,

		--- This indicates that there will be date-wise control so that previous dates data can not be scanned.
	is_date_wise			Boolean					NOT NULL,

		--- Indicates that the Job has Sub-jobs (like shifts) and the scanning is to be done for Sub-jobs only
	has_sub_jobs			Boolean					NOT NULL,

		--	Behavious of this is as below:
		--		Yes		---	Sewadar List must be provided and is checked in Sewadar List
		--		No		---	Not checked in Sewadar List
		--		NULL	--	If Sewadar List is provided, check; and if not provided,  obviously, do not check
	check_in_sewadar_list	Boolean						NULL,

		--- If specified, the status specified by this system information code are only allowed for scanning.
		---	The values specified here is for default purpose only, and may be different for a Scanning Job.
	status_system_info_cd	system_info_cd				NULL	CONSTRAINT	ScanningJobTypes_FK_StatusSystemInfoCd
																	REFERENCES	system_information_codes,
		
		---	The specified procedure will copy the records from scanned badges table to corresponding annual/construction/... 
		--- attendance tables or badges issues / returns
	procedure_nm			VARCHAR (100)			NOT NULL,
	cnt_procedure_nm		VARCHAR (100)				NULL,

	effective_from			DATETIME				NOT NULL,
	effective_till			DATETIME				NOT NULL,

		CONSTRAINT	ScanningJobTypes_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'ScanningJobTypes_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'scanning_job_types'
GO

-- =============================================================================
-- Table for Generic Reports... there is no front-end screen to manager this screen,
--	but the parameters screen for these reports is controlled using information in this table.
-- =============================================================================

CREATE	TABLE	generic_reports
(
	report_nm						report_nm				NOT NULL	CONSTRAINT	GenericReports_PK_ReportNm
																			PRIMARY KEY	NONCLUSTERED,
                                                        
	report_group					TINYINT					NOT NULL	Default	1,		--- Used for grouping like Sewadar Reports, Attendance Reports, Photo Reports, etc.
	report_type						CHAR (1)				NOT NULL	Default	'D',	--- D[etails only], S[ummary only], B[oth]
	is_total_line					Boolean					NOT NULL	Default	'No', 	--- to be used when report_type is S or B
                                                        
	sewadar_list_nm					gnc_long_nm					NULL,			-- If specified, it indicates that the report output can be saved. A check-box Save Result, which
																				-- is initially either ticked or not, should be shown along with Sewadar List field with this column's value.
	is_sewadar_list_ticked			Boolean						NULL,			-- It is specified along with sewadar_list_nm and indicates as to whether the check-box is ticked or not.
                                                        
	is_satsang_centre				CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]		--- Default is always the Parameter Satsang Centre
	is_satsang_centre_multi_select	Boolean		    			NULL,					--- It is specified along with is_satsang_centre
	is_sewa							CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_default_sewa					Boolean					NOT NULL	Default	'No',	--- When Yes, it is to be taken for the parameter Satsang Centre
	is_start_dt						CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_finish_dt					CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	default_period_source			CHAR (1)					NULL	Default	'N',	---	N[one], S[ewa dates], C[urrent System Dates]
	is_department					CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_department_multi_select		Boolean						NULL,					--- It is specified along with is_department
	is_sub_department				CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_status						CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_status_multi_select			Boolean						NULL,					--- It is specified along with is_status
	status_system_info_cd			system_info_cd				NULL,					--- It may be specified along with is_status
	is_global_status				CHAR (1)				NOT NULL	Default	'N',	--- Y[es], N[o]
	is_weekly_sewa_location			CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_country						CHAR (1)	    		NOT NULL	Default	'N',	--- R[equired], N[ot required]; it is always multi-select, if required
	default_country_id				INTEGER						NULL,					--- It may be specified along with is_country
	is_state						CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], N[ot required]; it is always multi-select, if required
	is_district						CHAR (1)	    		NOT NULL	Default	'N',	--- R[equired], N[ot required]; it is always multi-select, if required
	is_po_or_city					CHAR (1)				NOT NULL	Default	'N',	--- R[equired], N[ot required]; it is always multi-select, if required
	is_gender						CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_outstation_sewadar			CHAR (1)				NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	default_outstation_sewadar		Boolean						NULL,					--- It may be specified along with is_outstation_sewadar
	is_cnt_1						CHAR (1)				NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	cnt_1_label						CHAR (20)					NULL,					--- Specified when is_cnt_1 IN (R, O)
	cnt_1_min_value					INTEGER						NULL,					--- Specified when is_cnt_1 IN (R, O)
	cnt_1_max_value					INTEGER						NULL,					--- Specified when is_cnt_1 IN (R, O)
	cnt_1_default_value				INTEGER						NULL,					--- It may be specified when is_cnt_1 IN (R, O)
	is_cnt_2						CHAR (1)				NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	cnt_2_label						CHAR (20)					NULL,					--- Specified when is_cnt_2 IN (R, O)
	cnt_2_min_value					INTEGER						NULL,					--- Specified when is_cnt_2 IN (R, O)
	cnt_2_max_value					INTEGER				    	NULL,					--- Specified when is_cnt_2 IN (R, O)
	cnt_2_default_value				INTEGER						NULL,					--- It may be specified when is_cnt_2 IN (R, O)
	is_team							CHAR (1)				NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	is_credit_specification			CHAR (1)				NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	is_default_credit_specification	Boolean						NULL,					--- If yes, take it from credit_specifications.is_finally_used for parameter Satsang Centre
	is_gnc_dt1						CHAR (1)	    		NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	gnc_dt1_label					CHAR (20)					NULL,					--- Specified when is_gnc_dt IN (R, O)
	is_gnc_dt1_default_current_date	Boolean						NULL,					--- If yes, show Current Date as default; it can be specified along with is_gnc_dt1
	is_gnc_dt1_show_difference		Boolean						NULL,					--- If yes, it shows the difference in years (floor) between the date specified and current date as a displayonly field next to this
	is_gnc_dt2						CHAR (1)	    		NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	gnc_dt2_label					CHAR (20)					NULL,					--- Specified when is_gnc_dt IN (R, O)
	is_gnc_dt2_default_current_date	Boolean						NULL,					--- If yes, show Current Date as default; it can be specified along with is_gnc_dt2
	is_gnc_dt2_show_difference		Boolean						NULL,					--- If yes, it shows the difference in years (floor) between the date specified and current date as a displayonly field next to this
	is_skill						CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_qualification_type			CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	is_gnc_boolean					CHAR (1)	    		NOT NULL	Default 'N',	--- R[equired], O[ptional], N[ot required]
	gnc_boolean_label				CHAR (20)					NULL,					--- Specified when is_gnc_boolean IN (R, O)
	default_gnc_boolean				Boolean						NULL,					--- It can be specified along with is_gnc_boolean and contains the default value
	is_attribute					CHAR (1)				NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
	attribute_system_info_cd		system_info_cd				NULL,					--- It may be specified along with is_attribute
	is_sewadar_list					CHAR (1)				NOT NULL	Default	'N',	---	R[equired], N[ot required]
    is_sewa_shift                   CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]                        	    	
    is_badge_template               CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]                        	    	
    is_remarks_type	                CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required] ... Drop Down for Remarks Type
    is_sewadar_type	                CHAR (1)			    NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required] ... Drop Down for Sewadars Type
    is_area							CHAR(1)					NOT NULL	Default	'N',	--- R[equired], O[ptional], N[ot required]
                                                	    	
	is_eject_page					Boolean					NOT NULL	Default	'Yes',
                                                	    	
	audit_type						CHAR (1)				NOT NULL	Default	'N',	--- N[one], Q[uick audit], R[egular audit], B[adge print]

	report_main_ordering			VARCHAR (512)			NOT NULL
		Default	'IF ISNULL ({sewadars_registrations.sub_department_id}) THEN {departments.department_nm} ELSE {departments.department_nm} + '' ('' + {sub_departments.sub_department_nm} + '')'' ',
	is_main_ascending_order			Boolean					NOT NULL	Default	'Yes',
                                                	
	report_ordering					VARCHAR (512)			NOT NULL
		Default	'IF TRIM({sewadars.middle_nm}) = '''' THEN TRIM ({sewadars.first_nm}) + '' '' + TRIM ({sewadars.last_nm}) ELSE TRIM ({sewadars.first_nm}) + '' '' + LEFT (TRIM ({sewadars.middle_nm}), 1) + ''. '' + TRIM ({sewadars.last_nm})',
	is_ascending_order				Boolean					NOT NULL	Default	'Yes',
                                                	
	procedure_nm					procedure_nm			NOT NULL,
                                                            
	sewa_id_prm						TINYINT					NOT NULL	Default	0,
	sewa_nm_prm						TINYINT					NOT NULL	Default	0,
	start_dt_prm					TINYINT		    		NOT NULL	Default	0,
	finish_dt_prm					TINYINT					NOT NULL	Default	0,
	department_id_prm				TINYINT					NOT NULL	Default	0,
	department_nm_prm				TINYINT					NOT NULL	Default	0,
	sub_department_id_prm			TINYINT		    		NOT NULL	Default	0,
	sub_department_nm_prm			TINYINT					NOT NULL	Default	0,
	status_prm						TINYINT					NOT NULL	Default	0,
	weekly_sewa_location_id_prm		TINYINT		    		NOT NULL	Default	0,
	weekly_sewa_location_nm_prm		TINYINT					NOT NULL	Default	0,
	country_id_prm					TINYINT					NOT NULL	Default	0,
	state_id_prm					TINYINT					NOT NULL	Default	0,
	district_id_prm					TINYINT					NOT NULL	Default	0,
	po_or_city_id_prm				TINYINT					NOT NULL	Default	0,
	gender_prm						TINYINT					NOT NULL	Default	0,
	outstation_sewadar_prm			TINYINT					NOT NULL	Default	0,
	cnt_1_prm						TINYINT					NOT NULL	Default	0,
	cnt_2_prm						TINYINT		    		NOT NULL	Default	0,
	team_id_prm						TINYINT					NOT NULL	Default	0,
	team_nm_prm						TINYINT					NOT NULL	Default	0,
	credit_specification_id_prm		TINYINT					NOT NULL	Default	0,
	credit_specification_nm_prm		TINYINT		    		NOT NULL	Default	0,
	gnc_dt1_prm						TINYINT					NOT NULL	Default	0,
	gnc_dt2_prm						TINYINT					NOT NULL	Default	0,
	skill_id_prm					TINYINT					NOT NULL	Default	0,
	skill_nm_prm					TINYINT		    		NOT NULL	Default	0,
	qualification_type_prm			TINYINT					NOT NULL	Default	0,
	gnc_boolean_prm					TINYINT					NOT NULL	Default	0,
	satsang_centre_id_prm			TINYINT					NOT NULL	Default	0,
	satsang_centre_nm_prm			TINYINT					NOT NULL	Default	0,
	attribute_id_prm				TINYINT					NOT NULL	Default	0,
	attribute_nm_prm				TINYINT					NOT NULL	Default	0,
	sewadar_list_id_prm				TINYINT					NOT NULL	Default	0,
	sewa_shift_prm					TINYINT					NOT NULL	Default	0,
	badge_template_id_prm			TINYINT					NOT NULL	Default	0,
	badge_template_nm_prm			TINYINT					NOT NULL	Default	0,
	remarks_type_prm				TINYINT					NOT NULL	Default	0,
	sewadar_type_nm_prm				TINYINT					NOT NULL	Default	0,
	area_id_prm						TINYINT					NOT NULL	Default 0,
	area_nm_prm						TINYINT					NOT NULL	Default 0,
                                                	    
	details_report_file_nm			file_nm						NULL,
	summary_report_file_nm			file_nm						NULL,
                                                	    
	detail_report_footnote			VARCHAR (200)				NULL,
	summary_report_footnote			VARCHAR (200)				NULL
)
GO


-- =============================================================================

-- =============================================================================
-- Table for Sample Images... there is no front-end screen to manager this screen.
--	This is only used for data anonymizing
-- =============================================================================

CREATE	TABLE	_sample_images
(
	sample_id		gnc_short_nm	NOT NULL		CONSTRAINT	_SampleImages_PK_SampleId
														PRIMARY KEY	NONCLUSTERED,
	sample_image	IMAGE			NOT NULL
)

GO
-- vim:ts=4 ht=8 sw=4
