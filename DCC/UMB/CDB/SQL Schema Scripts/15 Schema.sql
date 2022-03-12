/* ==================================================================================
    Source File		:	schema.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat July 13 12:10:33 IST 2003
    Version		:	1.09
    Last updated	:	Nov 24, 2013
    Module ID		:	CDB (Central Data Base)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------
    Common suffixes used:
	id	Identifier
	cd	Code
	nm	Name
	dt	Date
	dtm	Date and Time
	dsc	Description
    Recommendations:
	*   Any piece of information (as far as possible, and unless stated otherwise)
	    should be stored in mixed case and NOT in upper case. This stems from the
	    fact that graphical outputs occupy lesser width for lower-case alphabets
	    thereby permitting to print more amount of information in same width.
    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
    JL : 28-May-2018
	* Table gst_state_numbers added
    JL : 24-Nov-2013
	* Countries table has been changed as below:
	    + Columns is_authentic, level_1_address_component, level_2_address_component,
	      level_3_address_component and level_4_address_component have been added.   
	    + Column is_authentic has a default constraint which sets the column value to 0 (indicating not authentic).
    SS : 04-Oct-2005
	*   Made the secretary column in table satsang_centres as nullable, since the data is inserted thru
	    MSC and MSC is not having secretary while inserting a centre
    JL : 26-Feb-2005
	Column tan has been renamed to pan to denote Permanent tax Account Number. Also,
	its length has been reduced to 10 from 15 as PANs are 10 chars long.
    JL : 26-Feb-2005
	Referential Integrity Constraint in table party_role_applications added.
	Name of the constraint is FK_PartyRoleApplctn_Party_Role.
    JL : 21-Feb-2005
	Domain for party_nm changed from VARCHAR (40) to VARCHAR (50).
    JL : 21-Feb-2005
	Comments put for triggers
    JL : 19-Feb-2005
	*   Added tables for parties and their corresponding addresses.
    JL : 19-Feb-2005
	*   measuring_unit_cd data-type changed from char (5) to char (4).
	............................ v1.04..................................
    JL : 14-Feb-2005
	*   Names of the Constraints have been specified, wherever these were not specified earlier.
	*   Constraint CK_Patrons_InitiationTill has been dropped.
	............................ v1.03..................................
    JL : 08-Dec-2004
	*   The column is_active is removed from persons. It had been documented to be removed;
	    but it continued to exist in the table definition.
    JL : 18-Mar-2004
	*   Table hospital_units added. It will not have any front-end interface for
	    managing the data. 
    JL : 15-Feb-2004
	*   Unique constraints have been modfied for most of the entities. Basically,
	    the effective_from has been removed.
	*   In Effective From and Till, instead of SMALLDATETIME, DATETIME is used as
	    data-type.
	*   Default values have been changed for Effective From and Till, as the earlier
	    values were given conversion error on INSERT.
	*   Semantics of Application ID and Screen ID changed in persons (these two
	    columns are now NULLable).
	*   The column is_active is removed from persons, p_and_t_lines and epabx_lines
	    tables. Instead effective_from and effective_till columns have been introduced
	    with usual semantics.
	*   The column txn_ts is added p_and_t_lines and epabx_lines tables.
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS OFF
GO

USE CDB

-- =====================================================================================
-- 							    Table definitions begin here
-- =====================================================================================


	-- Note. Countries
--Data coming from NDR
CREATE	TABLE	countries	(
    country_id			country_id		NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_Countries_ID
									    PRIMARY KEY	NONCLUSTERED,
    country_cd			VARCHAR (5)		NOT NULL,
    country_nm			VARCHAR (55)		NOT NULL,

	--- ISD code should contain only digits (to be validated in front-end application). It has been
	--- kept as varchar so that like searches can be made.
    isd_code			VARCHAR (10)		    NULL,
    gmt_diff			Numeric(4,2)		NOT NULL	DEFAULT 0,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

    is_authentic		BIT			NOT NULL	CONSTRAINT	Countries_DF_IsAuthentic
									    DEFAULT	0,
    level_1_address_component	address_component_nm	    NULL,
    level_2_address_component	address_component_nm	    NULL,
    level_3_address_component	address_component_nm	    NULL,

    frro_country_nm		VARCHAR (100)		    NULL,


	CONSTRAINT	UK_Countries_Code
		UNIQUE	NONCLUSTERED	(country_cd),

	CONSTRAINT	UK_Countries_Name
		UNIQUE	NONCLUSTERED	(country_nm),
	
	CONSTRAINT	Countries_CK_AddressComponents
		CHECK	(   (	level_1_address_component IS NOT NULL
					AND	(	(	level_2_address_component IS NOT NULL	)
						OR 	(   level_2_address_component IS NULL
							AND level_3_address_component IS NULL
							)
						)
					)
				OR 	(   level_1_address_component IS NULL
					AND level_2_address_component IS NULL
					AND level_3_address_component IS NULL
					)
				),

	CONSTRAINT	Countries_CK_CountryName_FRROCountryName
		CHECK	(	country_nm	!=	frro_country_nm	),

	CONSTRAINT	CK_Countries_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. States
--Data coming from NDR
CREATE	TABLE	states	(
    state_id			state_id		NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_States_ID
									    PRIMARY KEY	NONCLUSTERED,
    state_cd			VARCHAR (5)		NOT NULL,
    state_nm			VARCHAR (55)		NOT NULL,
    country_id			country_id		NOT NULL	CONSTRAINT	FK_States_Country
									    REFERENCES	countries,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_States_Code
		UNIQUE	NONCLUSTERED	(country_id, state_cd),

	CONSTRAINT	UK_States_Name
		UNIQUE	NONCLUSTERED	(state_nm, country_id),

	CONSTRAINT	CK_States_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. Districts OR Cities
--Data coming from NDR
CREATE	TABLE	districts_or_cities	(
    district_or_city_id		district_or_city_id	NOT NULL    IDENTITY (1,1)	
									CONSTRAINT	PK_DistrictsOrCities_ID
									    PRIMARY KEY	NONCLUSTERED,
    district_cd			VARCHAR (5)		NOT NULL,
--04 Jul 2005 Changed the Data type from Char(5) to Varchar(5)
    district_nm			VARCHAR (55)		NOT NULL,
    state_id			state_id		NOT NULL	CONSTRAINT	FK_DistrictsOrCities_State
									    REFERENCES	states,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_Districts_Code
		UNIQUE	NONCLUSTERED	(state_id, district_cd),

	CONSTRAINT	UK_Districts_Name
		UNIQUE	NONCLUSTERED	(district_nm, state_id),

	CONSTRAINT	CK_Districts_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. Post Offices
	-- Normally this table will NOT be used as part of addresses. In special cases only, it will be used
	-- as in NDR application.
--Data coming from NDR
CREATE	TABLE	post_offices	(
    post_office_id		post_office_id		NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_PostOffices_ID
									    PRIMARY KEY	NONCLUSTERED,
    post_office_cd		VARCHAR (10)		NOT NULL,
--04 Jul 2005 Changed the Data type from Char(5) to Varchar(5)
    post_office_nm		VARCHAR (35)		NOT NULL,
    district_or_city_id		district_or_city_id	NOT NULL	CONSTRAINT	FK_PostOffices_DistrictOrCity
									    REFERENCES	districts_or_cities,

	--- Pincode should contain only digits (to be validated in front-end application). It has been
	--- kept as varchar so that like searches can be made.
    pin_or_zip_code		pin_or_zip_code		    NULL,

	--- STD code should contain only digits (to be validated in front-end application). It has been
	--- kept as varchar so that like searches can be made.
    std_code			VARCHAR (10)		    NULL,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_PostOffices_Code
		UNIQUE	NONCLUSTERED	(district_or_city_id, post_office_cd),

	CONSTRAINT	UK_PostOffices_Name
		UNIQUE	NONCLUSTERED	(post_office_nm, district_or_city_id),

	CONSTRAINT	CK_PostOffices_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


CREATE	TABLE	passport_types
(
    passport_type_id	INTEGER		NOT NULL    IDENTITY (1,1)
						    CONSTRAINT	PassportTypes_PK_PassportTypeID
							PRIMARY KEY	NONCLUSTERED,
    passport_type_cd	VARCHAR (10)	NOT NULL,
    passport_type_nm	VARCHAR (50)	NOT NULL,

    remarks		VARCHAR (500)	    NULL,

    effective_from_dt	DATE		NOT NULL,
    effective_till_dt	DATE		NOT NULL,

    txn_ts		ROWVERSION	NOT NULL,

	audit_log_id		INTEGER		NOT NULL    CONSTRAINT	PassportTypes_FK_AuditLogID
								REFERENCES	audit_logs,

	CONSTRAINT	PassportTypes_UK_PassportTypeCode
		UNIQUE	NONCLUSTERED	(passport_type_cd),

	CONSTRAINT	PassportTypes_UK_PassportTypeName
		UNIQUE	CLUSTERED	(passport_type_nm),

	CONSTRAINT	PassportTypes_CK_EffectiveFrom_EffectiveTillDate
		CHECK	(effective_from_dt <= effective_till_dt)
)
GO



    --	These are typically used for Passports and Visas
CREATE	TABLE	document_issue_places
(
    document_issue_place_id	INTEGER		NOT NULL    IDENTITY (1,1)
							    CONSTRAINT	DocumentIssuePlaces_PK_DocumentIssuePlaceID
								PRIMARY KEY	NONCLUSTERED,
    document_issue_place_nm	VARCHAR (50)	NOT NULL,

    document_issue_country_id	country_id	    NULL    CONSTRAINT	DocumentIssuePlaces_FK_DocumentIssueCountryID
								REFERENCES	countries,

    remarks			VARCHAR (500)	    NULL,

    effective_from_dt		DATE		NOT NULL,
    effective_till_dt		DATE		NOT NULL,

    txn_ts			ROWVERSION	NOT NULL,

    audit_log_id		INTEGER		NOT NULL    CONSTRAINT	DocumentIssuePlaces_FK_AuditLogID
								REFERENCES	audit_logs,

	CONSTRAINT	DocumentIssuePlaces_UK_DocumentIssuePlaceName_DocumentIssueCountryID
		UNIQUE	CLUSTERED	(document_issue_place_nm, document_issue_country_id),

	CONSTRAINT	DocumentIssuePlaces_CK_EffectiveFrom_EffectiveTillDate
		CHECK	(effective_from_dt <= effective_till_dt)
)
GO

	-- Note. Department Groups

CREATE	TABLE	department_groups	(
    department_group_id		department_group_id	NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_DepartmentGroups_ID
									    PRIMARY KEY	NONCLUSTERED,
    department_group_cd		CHAR (2)		NOT NULL,
    department_group_nm		VARCHAR (30)		NOT NULL,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_DepartmentGroups_Code
		UNIQUE	NONCLUSTERED	(department_group_cd),

	CONSTRAINT	UK_DepartmentGroups_Name
		UNIQUE	NONCLUSTERED	(department_group_nm),

	CONSTRAINT	CK_DprtmntGrps_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. P & T Telephone Lines
	-- It will contain the information about the telephone lines in Dera only.
	-- More information in the table will be added as part of ETB application.

CREATE	TABLE	p_and_t_lines	(
    telephone_no		telephone_no		NOT NULL	CONSTRAINT	PK_PAndTLines_TelephoneNo
									    PRIMARY KEY	NONCLUSTERED,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	CK_PAndTLines_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. EPABX Lines
	-- It will contain the information about the EPAPX lines in Dera only.
	-- More information in the table will be added as part of ETB application.

CREATE	TABLE	epabx_lines	(
    extension_no		extension_no		NOT NULL	CONSTRAINT	PK_EPABXLines_ExtensionNo
									    PRIMARY KEY	NONCLUSTERED,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	CK_EPABXLines_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. Departments
--Data coming from SWS
CREATE	TABLE	departments	(
    department_id		department_id		NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_Departments_ID
									    PRIMARY KEY	NONCLUSTERED,
    department_cd		VARCHAR (5)		NOT NULL,
--04 Jul 2005 data type changed from Char(5) to Varchar(5)
    department_nm		VARCHAR (35)		NOT NULL,
    department_group_id		department_group_id	NOT NULL	CONSTRAINT	FK_Departments_DepartmentGroup
									    REFERENCES	department_groups,
    fax_line			telephone_no		    NULL	CONSTRAINT	FK_PAndTLines_FaxLine
									    REFERENCES	p_and_t_lines,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',
    is_section			boolean			NOT NULL	DEFAULT 'No',
    is_department		boolean			NOT NULL	DEFAULT 'No'


	CONSTRAINT	UK_Departments_Code
		UNIQUE	NONCLUSTERED	(department_cd),

	CONSTRAINT	UK_Departments_Name
		UNIQUE	NONCLUSTERED	(department_nm),

	CONSTRAINT	CK_Departments_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. P & T Telephone Lines for departments

CREATE	TABLE	department_p_and_t_lines	(
    department_id		department_id		NOT NULL	CONSTRAINT	FK_DepartmentPAndTLines_Dept
									    REFERENCES	departments,
    p_and_t_line		telephone_no		NOT NULL	CONSTRAINT	FK_DepartmentPAndTLines_PnTLin
									    REFERENCES	p_and_t_lines,
    display_order		display_order		NOT NULL,

	CONSTRAINT	PK_DepartmentPAndTLines
		PRIMARY KEY	NONCLUSTERED	(department_id, p_and_t_line)
)
GO


	-- Note. EPABX Extensions for departments

CREATE	TABLE	department_epabx_extensions	(
    department_id		department_id		NOT NULL	CONSTRAINT	FK_DepartmentEPABXExtns_Dept
									    REFERENCES	departments,
    epabx_extension		extension_no		NOT NULL	CONSTRAINT	FK_DepartmentEPABXExtns_Extn
									    REFERENCES	epabx_lines,
    display_order		display_order		NOT NULL,

	CONSTRAINT	PK_DepartmentEPABXExtensions
		PRIMARY KEY	NONCLUSTERED	(department_id, epabx_extension)
)
GO


	-- Note. Person Titles
	-- This table will not have front-end interface for manipulation information.

CREATE	TABLE	person_titles	(
    person_title		person_title		NOT NULL	CONSTRAINT	PK_PersonTitles_Title
								    PRIMARY KEY	NONCLUSTERED
)
GO


	-- Note. Persons
	-- This table will contain all the persons. Here, the details of the sewadars should also be added.
	-- Typically, sewadars table will have a foreign key to this table. The objective for this table
	-- is to have a uniform way of saving a person's basic information.

CREATE	TABLE	persons	(
    person_id			person_id		NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_Persons_ID
									    PRIMARY KEY	NONCLUSTERED,
    title			person_title		NOT NULL	CONSTRAINT	FK_Persons_Title
									    REFERENCES	person_titles,

	--- Parts of the name (first, middle and last) should contain only alphabets and apostrophe.
	--- No other character should be permitted. This needs to be ensured by the front-end application.
    first_nm			person_part_nm		NOT NULL,
    middle_nm			person_part_nm		    NULL,
    last_nm			person_part_nm		NOT NULL,

    gender			gender			NOT NULL,
    is_dera_resident		boolean			NOT NULL,

	--- It will contain the Cell Phone number if available, else it should contain the residence telephone number.
	--- If both are not available, it should stay as NULL.
	--- This has to be ensured by the front-end applications.
    contact_information		telephone_lines		    NULL,

    email_addresses		email_addresses		    NULL,

	--- By default, the time portion of the birth should be initialised to mid-night, that is, 0000 hours.
	--- In case of two persons, having same name and date of birth, the time portion is to be used.
	--- If exact time of birth can be found for either of the two persons, then the new person being
	--- added should have the time initialised to 00:01 hours (1 minute past mid-night). When two persons,
	--- have same birth date, it is strongly RECOMMENDED that additional_information column should be
	--- used to differentiate the persons.
    birth_dtm			SMALLDATETIME		NOT NULL,

	--- It should provide additional information for a person which can differentiate one person from another
	--- when their names match.
	--- SUGGESTION: Additional information must be specified when first_nm and last_nm match apart from gender.
	--- Such a check can be provided in the front-end application for ensuring the above.
	--- Before we do it, consensus is seeked from all the concerned.
    additional_information	VARCHAR (50)		    NULL,

	--- Note. Person's record maintenance semantics are controlled by the columns, application_id and screen_id.
	---	INSERT.	The following two columns contain the source application and the Screen from where the person's
	--- 		record has been created.
	---	UPDATE.	The information can be updated by the Screen of the Application what is stored in these columns.
	---		No other application and / or screen can modify this information.
	---		If however, these two columns are NULL, any application can modify the information, but when
	---		in such a case, the information is modified by an application, it should update the application
	---		and screen also. Hence, after the modification, the screen and application id will match with the
	---		with the last update which succeeds.
	---	DELETE. The information can be attempted to be deleted by the application and screen which is stored in
	---		these columns or if these columns are NULL. If the attempt to delete the person fails by the
	---		controlling Application / Screen, these two columns should then be set to NULL.
	---	This is in general the behavioural semantics for ALL the applications that operate on this table.

	---	In future, some application may be able to change this information on UPDATE (like in Sewadar Welfare
	---	System) because in such cases, that application would take the ownership of the record. This will be
	---	noted here specifically whenever it happens.
	
	---	For example, a record is created by Approvers screen in SIM.
	---	This record will be continued to be maintained by Approvers screen in SIM until one of the two happens:
	---		(a)	The record is deleted from Approvers (application_id and screen_id will be set to NULL).
	---				It may later be owned by some other application screen.
	---		(b)	The record is updated by Sewadar Welfare System (application_id and screen_id will be
	---			directly updated as SWS and the relevant screen irrespective of whether these columns
	---			were NULL or NOT.
	---		The latter (scenario (b)) will not be adopted by any application UNLESS IT IS EXPLICITLY APPROVED.

	---	Finally, Persons screen in CDB application CAN update any information without bothering about the above
	---	semantics. Also, Persons screen in CDB application NEVER changes or updates these two columns.
	---	The other screens of CDB (like representatives) that are based on this table MUST adhere to general
	---	behavioural semantics as described above.

    application_id		application_id		    NULL,
    screen_id			screen_id		    NULL,

	--- It refers to the initiation information in NDQ system, if the person is initiated.
    initiation_id		initiation_id		    NULL,

    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

    txn_ts			TIMESTAMP		NOT NULL,

	CONSTRAINT	UK_Persons
		UNIQUE	NONCLUSTERED	(title, first_nm, last_nm, gender, birth_dtm),

	CONSTRAINT	CK_Persons_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. sewadar_status
--Data coming from SWS
--04 Jul 2005 New Table
CREATE	TABLE	sewadar_status	(
    sewadarstatus_id		sewadarstatus_id	NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_SewadarStatus_ID
									    PRIMARY KEY	NONCLUSTERED,
    sewadarstatus_nm		VARCHAR (35)		NOT NULL,
    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_SewadarStatus_Name
		UNIQUE	NONCLUSTERED	(sewadarstatus_nm),

	CONSTRAINT	CK_SewadarStatus_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO

	-- Note. Sewadar_type
--Data coming from SWS
--04 Jul 2005 New Table
CREATE	TABLE	Sewadar_types	(
    sewadartype_id		sewadartype_id		NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_SewadarType_ID
									    PRIMARY KEY	NONCLUSTERED,
    sewadartype_nm		VARCHAR (35)		NOT NULL,
    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',
	is_used_in_RMS		boolean			NOT NULL,

	CONSTRAINT	UK_SewadarType_Name
		UNIQUE	NONCLUSTERED	(sewadartype_nm),

	CONSTRAINT	CK_SewadarType_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO

	-- Note. Department's Persons
	--- This table has been necessiated to keep the department incharges (to begin with).

CREATE	TABLE	department_persons	(
    person_id			person_id		NOT NULL	CONSTRAINT	FK_DeptPersons_Person
									    REFERENCES	persons,
    department_id		department_id		NOT NULL	CONSTRAINT	FK_DeptPersons_Dept
									    REFERENCES	departments,
    designation_id		designation_id		NOT NULL	CONSTRAINT	FK_DeptPersons_Designation
									    REFERENCES	designations,
    sewadarstatus_id		sewadarstatus_id	NOT NULL	CONSTRAINT	FK_DeptPersons_Sewadarstatus
									    REFERENCES	sewadar_status,
--04 Jul 2005 New Field
    sewadartype_id		sewadartype_id		NOT NULL	CONSTRAINT	FK_DeptPersons_SewadarType
									    REFERENCES	sewadar_types,
--04 Jul 2005 New Field
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),	--- Current Date
    effective_till		DATETIME		    NULL,

	CONSTRAINT	PK_DepartmentPersons			---- person, dept, designation, effective_from
		PRIMARY KEY	NONCLUSTERED	(person_id, effective_from),

	CONSTRAINT	CK_DprtmntPrsns_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. Patrons
	-- There would not be any front-end screen to manage this table.

CREATE	TABLE	patrons		(
	--- patorn_id is to be maintained in the same order as Patrons
    patron_id			patron_id		NOT NULL	CONSTRAINT	PK_Patrons_ID
									    PRIMARY KEY	NONCLUSTERED,
    patron_nm			VARCHAR (60)		NOT NULL,

    effective_from		SMALLDATETIME		NOT NULL,
    effective_till		SMALLDATETIME		    NULL,

    initiation_from		SMALLDATETIME		    NULL,
    initiation_till		SMALLDATETIME		    NULL,

	CONSTRAINT	CK_Patrons_EffectiveDates
		CHECK	(effective_from < effective_till),

	CONSTRAINT	CK_Patrons_InitiationDates
		CHECK	(initiation_from < initiation_till),

	CONSTRAINT	CK_Patrons_InitiationFrom
		CHECK	(effective_from < initiation_from)

				    --	CONSTRAINT	CK_Patrons_InitiationTill
				    --		CHECK	(initiation_till <= effective_till)
)
GO


	-- Note. Skills
	-- This table stores the skills like electrician, mason, doctor, trader, etc.

CREATE	TABLE	skills		(
    skill_id			skill_id		NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_Skills_ID
									    PRIMARY KEY	NONCLUSTERED,
    skill_nm			VARCHAR (100)		NOT NULL,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_Skills_Name
		UNIQUE	NONCLUSTERED	(skill_nm),
	
	CONSTRAINT	CK_Skills_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. Occupations
	-- This table stores the occupations like Self-Employed, Business, Service, House-wife, Retired, Student, etc.

CREATE	TABLE	occupations		(
    occupation_id		occupation_id		NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_Occupations_ID
									    PRIMARY KEY	NONCLUSTERED,
    occupation_cd		VARCHAR (12)		NOT NULL,
-- 04 Jul 2005 New Field	
    occupation_nm		VARCHAR (20)		NOT NULL,
    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_Occupations_Code
		UNIQUE	NONCLUSTERED	(occupation_cd),

	CONSTRAINT	UK_Occupations_Name
		UNIQUE	NONCLUSTERED	(occupation_nm),
	
	CONSTRAINT	CK_Occupations_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


-- Note. Languages

CREATE	TABLE	languages		(
    language_id			language_id		NOT NULL	IDENTITY(1,1)
									CONSTRAINT	PK_Languages_ID
									    PRIMARY KEY	NONCLUSTERED,
    language_cd			Char(2)			NOT NULL,
    language_nm			VARCHAR (35)		NOT NULL,
    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_Languages_Code
		UNIQUE	NONCLUSTERED	(Language_Cd),
	
	CONSTRAINT	UK_Languages_Name
		UNIQUE	NONCLUSTERED	(Language_Nm),

	CONSTRAINT	CK_Languages_EffectiveDates
		CHECK	(Effective_from <= Effective_till)
)
GO
	-- Note. Relations

CREATE	TABLE	relations		(
    relation_id			relation_id		NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_Relations_ID
									    PRIMARY KEY	NONCLUSTERED,

    relation_nm			VARCHAR (20)		NOT NULL	CONSTRAINT	UK_Relations_Name
									    UNIQUE	NONCLUSTERED,
    txn_ts			TIMESTAMP		NOT NULL,

    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',


	CONSTRAINT	CK_Relations_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO



	-- Note. Representatives

CREATE	TABLE	representatives		(
    representative_id		representative_id	NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_Representatives_ID
									    PRIMARY KEY	NONCLUSTERED,

    --- Is representative code really needed? If yes, then we shall put it; otherwise we do not feel the need to do it.
    --- We need it to understand the purpose for this column.
    -- representative_cd		VARCHAR (25)		NOT NULL,

    person_id			person_id		NOT NULL	CONSTRAINT	FK_Representatives_Person
									    REFERENCES	persons,

	--- While specifying the address lines, there should not be any trailing comma. This will be put wherever the address
	--- is to be printed.
    address_line_1		address_line		NOT NULL,
    address_line_2		address_line		    NULL,
    district_or_city_id		district_or_city_id	NOT NULL	CONSTRAINT	FK_Representatives_DistOrCity
									    REFERENCES	districts_or_cities,
    pin_or_zip_code		pin_or_zip_code		    NULL,

    telephones_office		telephone_lines		    NULL,
    telephones_residence	telephone_lines		    NULL,
    cell_phone_no		cell_phone_no		    NULL,
    fax_lines_office		telephone_lines		    NULL,
    fax_lines_residence		telephone_lines		    NULL,

    territory			VARCHAR (100)		NOT NULL,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_Representatives_Person
		UNIQUE	NONCLUSTERED	(person_id, effective_from),
	
	CONSTRAINT	CK_Rprsnttvs_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. Satsang Centre Types
	-- This table will not have front-end interface for manipulation information.

CREATE	TABLE	satsang_centre_types	(
    satsang_centre_type		satsang_centre_type	NOT NULL	CONSTRAINT	PK_SatsangCentreTypes_Type
									    PRIMARY KEY	NONCLUSTERED
)
GO


	-- Note. Satsang Centres

CREATE	TABLE	satsang_centres	(
    satsang_centre_id		satsang_centre_id	NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_SatsangCentres_ID
									    PRIMARY KEY	NONCLUSTERED,
    satsang_centre_cd		CHAR (5)		NOT NULL,
    satsang_centre_nm		VARCHAR (40)		NOT NULL,
    satsang_centre_type		satsang_centre_type	NOT NULL	CONSTRAINT	FK_SatsangCentres_CentreType
									    REFERENCES	satsang_centre_types,

	--- While specifying the address lines, there should not be any trailing comma. This will be put wherever the address
	--- is to be printed.
    address_line_1		address_line		NOT NULL,
    address_line_2		address_line		    NULL,
    district_or_city_id		district_or_city_id	NOT NULL	CONSTRAINT	FK_SatsangCentres_DistOrCity
									    REFERENCES	districts_or_cities,
    pin_or_zip_code		pin_or_zip_code		    NULL,

    secretary			person_id		    NULL	CONSTRAINT	FK_SatsangCentres_Person
									    REFERENCES	persons,

    telephones			telephone_lines		    NULL,
    email_addresses		email_addresses		    NULL,
    fax_lines			telephone_lines		    NULL,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

    file_no			VARCHAR (20)		    NULL,
    area_nm			VARCHAR (30)		    NULL,

	CONSTRAINT	UK_SatsangCentres_Code
		UNIQUE	NONCLUSTERED	(satsang_centre_cd),

	CONSTRAINT	UK_SatsangCentres_Name
		UNIQUE	NONCLUSTERED	(satsang_centre_nm),

	CONSTRAINT	CK_SatsangCntrs_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


	-- Note. Hospital Units. There is no screen that will manage information in this table.

CREATE	TABLE	hospital_units	(
    hospital_unit_id		hospital_unit_id	NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_HospitalUnits_ID
									    PRIMARY KEY	NONCLUSTERED,
    hospital_unit_nm		VARCHAR (25)		NOT NULL,

    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_HospitalUnits_Name
		UNIQUE	NONCLUSTERED	(hospital_unit_nm),

	CONSTRAINT	CK_HospitalUnit_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO

CREATE TABLE	e_invoice_units
(
    e_invoice_unit_cd	VARCHAR(10)	NOT NULL	CONSTRAINT EInvoiceUnits_PK_EInvoiceUnitCode
							    PRIMARY KEY,
    e_invoice_unit_nm	VARCHAR(50)	NOT NULL	CONSTRAINT EInvoiceUnits_UK_EInvoiceUnitName
							    UNIQUE
);


	-- Note. Measuring Units

CREATE	TABLE	measuring_units	(
    measuring_unit_id		measuring_unit_id	NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_MeasuringUnits_ID
									    PRIMARY KEY	NONCLUSTERED,
    measuring_unit_cd		VARCHAR (4)		NOT NULL,
    measuring_unit_symbol	NVARCHAR (10)		    NULL,
    measuring_unit_nm		VARCHAR (20)		NOT NULL,

	--- It specifies the number of digits that should be permitted after decimal point for accepting as well as
	--- printing values for this unit.
    unit_decimals		TINYINT			NOT NULL	CONSTRAINT	CK_MeasuringUnits_UnitDecimals
									    CHECK	(unit_decimals >= 0 AND unit_decimals <= 5),

	--- It is used to specify the default printing option that should be used to print the commas before decimals.
	--- Lacs format specifies to print a number like	9,99,99,99,999
	--- Millions format specifies to print a number like	 9,999,999,999
	--- The latter is deliberately NOT called Thousands, as it can confuse as the three least significant digits are printed
	--- in the same way in both formats.
    number_format_type		CHAR (8)		NOT NULL	DEFAULT	'Lacs'
									CONSTRAINT	CK_MeasuringUnits_FormatType
									    CHECK (number_format_type IN ('Millions', 'Lacs')),
    e_invoice_unit_cd		VARCHAR (10)		NOT NULL	CONSTRAINT	MeasuringUnits_FK_EInvoiceCode
									    REFERENCES	e_invoice_units,
    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

    type_of_unit		VARCHAR (100)		    NULL,
    tolerance_short		NUMERIC (5,2)		    NULL,
    tolerance_overage		NUMERIC (5,2)		    NULL,

	CONSTRAINT	UK_MeasuringUnits_Code
		UNIQUE	NONCLUSTERED	(measuring_unit_cd),

	CONSTRAINT	UK_MeasuringUnits_Name
		UNIQUE	NONCLUSTERED	(measuring_unit_nm),

	CONSTRAINT	CK_MsrngUnits_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


-- =============================================================================
-- Tables for Parties and the addresses
-- =============================================================================


	-- Note. roles
	-- It defines all the roles that a party can have like Supplier, Manufacturer, Distributor, Donor, etc.


CREATE	TABLE	roles	(
    role_cd			role_cd		    	NOT NULL	CONSTRAINT	PK_Roles_Code
									    PRIMARY KEY	NONCLUSTERED,

    role_nm			VARCHAR (15)		NOT NULL	CONSTRAINT	UK_Roles_Name
									    UNIQUE	NONCLUSTERED,

	--- It specifies whether the address is to be specified or not (when role is being defined for a party).
	--- Values are Mandatory, Optional and Not Required.
    address_requirement		requirement		NOT NULL,

    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	CK_Roles_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


    -- Note. role_application_controls
    --- The front-end screen shows the roles and the corresponding tuples for the role_cd in a grid.
    --- Show a check-box labelled "Update Party Roles" below the grid in Browse mode, which would not be ticked by default.
    --- On saving of this information in browse mode, if the check-box is ticked, do the following:
		--- DELETE	party_role_applications
		--- WHERE	role_cd		=	<this_role>
	    --- followed by the following statement
		--- INSERT INTO party_role_applications
		    --- SELECT	pr.party_id, pr.role_cd, rac.application_id, rac.is_read, rac.is_write
		    --- FROM	roles_application_controls	rac,
		    ---		party_roles			pr
		    --- WHERE	rac.role_cd	=	<this_role>
		    --- AND		pr.role_cd	=	rac.role_cd
		    --- AND		rac.owner_application_id	=	pr.owner_application_id

CREATE	TABLE	roles_application_controls	(
    role_cd			role_cd		    	NOT NULL	CONSTRAINT	FK_RoleApplicationControl_Role
									    REFERENCES	roles,

	--- Owner application specifies that the application can create the parties with this role.
    owner_application_id	application_id		NOT NULL,

	--- This application specified that when the application creates a party (or specifies a role),
	--- this role needs to be made available in this application as per the two columns that define
	--- read and update privilege.
    application_id		application_id		NOT NULL,

	--- Actually these two columns define here the behaviour when an application creates a party and / or
	--- assigns a role to party, that is, whether other applications would see this record for reading and
	--- / or updating or not.
	--- It specifies that the application can only view the party.
    is_read			boolean			NOT NULL,

	--- It specifies that the application can modify the information of the party.
    is_update			boolean			NOT NULL,

	CONSTRAINT	PK_RolesApplicatonControls
		PRIMARY KEY	NONCLUSTERED	(role_cd, owner_application_id, application_id),

	CONSTRAINT	CK_RoleApplnControls_Privilege
		CHECK	(   (is_update = 'No')
			OR  (is_update = 'Yes' AND is_read = 'Yes')
			)
)
GO


    -- Note. parties
    -- All references to this table should be restricted to party_addresses and party_roles.
    -- The entities from other databases like SIM, MPS, GAS, etc should refer to parties through
    -- party_roles table. If this is not adhered to, we would not have correctly defined party_roles.

CREATE	TABLE	parties	(
    party_id			party_id		NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_Parties_ID
									    PRIMARY KEY	NONCLUSTERED,

    party_cd			VARCHAR (10)	    	NOT NULL	CONSTRAINT	UK_Parties_Code
									    UNIQUE	NONCLUSTERED,

    party_nm			VARCHAR (50)		NOT NULL	CONSTRAINT	UK_Parties_Name
									    UNIQUE	NONCLUSTERED,

	--- Permanent tax Account Number ...... may be required for parties in GAS.
    pan				VARCHAR (10)	    	    NULL,
    party_contact_nm		VARCHAR (50)	    	    NULL,
--04 Jul 2005 new Field
    party_contact_designation	VARCHAR (30)	    	    NULL,
--04 Jul 2005 new Field
    txn_ts			TIMESTAMP		NOT NULL,

)
GO

    ---- NOTE. address_types
    ---- This table need not have the user-interface.

CREATE	TABLE	address_types	(
    address_type_id			address_type_id		NOT NULL	CONSTRAINT	PK_AddressTypes_ID
			        						    PRIMARY KEY	NONCLUSTERED,
--04 Jul 2005 New Field
    address_type_cd			CHAR(1)			NOT NULL,
--04 Jul 2005 New Field
    address_type_nm			address_type		NOT NULL,
--04 Jul 2005 PK dropped and field name changed from address_type to address_type_nm
	--	It is reflects
    is_applicable_for_pdb_person	BIT			NOT NULL,

    is_multiple_allowed			BIT			NOT NULL,

    effective_from			DATETIME    		NOT NULL	Default	GetDate(),
    effective_till			DATETIME    		NOT NULL	Default	'31-Dec-9999',

	CONSTRAINT	UK_AddressTypes_Code
		UNIQUE	NONCLUSTERED	(address_type_cd),

	CONSTRAINT	UK_AddressTypes_Name
		UNIQUE	NONCLUSTERED	(address_type_nm),

	CONSTRAINT	CK_AddressTypes_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO



    -- Note. party_addresses

CREATE	TABLE	party_addresses	(
    party_address_id		party_address_id	NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_PartyAddresses_AddressID
									    PRIMARY KEY	NONCLUSTERED,

    party_id			party_id		NOT NULL	CONSTRAINT	FK_PartyAddresses_Party
									    REFERENCES	parties,

    address_type_id		address_type_id		NOT NULL	CONSTRAINT	FK_PartyAddresses_AddressType
									    REFERENCES	address_types,

	--- Address number should be zero for a single address_type for a party, and should not be displayed.
	--- For multiple addresses of a party for a one address_type, it should be numbered 1 onwards.
    address_no			TINYINT			NOT NULL,

    contact_nm			VARCHAR (50)		    NULL,
    contact_designation		designation_nm		    NULL,

    address_line_1		address_line		NOT NULL,
    address_line_2		address_line		    NULL,
    state_id			state_id		    NULL	CONSTRAINT FK_PartyAddreses_States REFERENCES states,	
-- 04 Jul 2005 New Field
    district_or_city_id		district_or_city_id	    NULL	CONSTRAINT	FK_PartyAddresses_DistOrCity
										REFERENCES	districts_or_cities,
-- 04 Jul 2005 Changed from Not Null to Null
    post_office_id		post_office_id		    NULL	CONSTRAINT	FK_PartyAddresses_PostOffices
										REFERENCES	Post_offices,
-- 04 Jul 2005 new field
    pin_or_zip_code		pin_or_zip_code		    NULL,

    country_id			country_id		    NULL	CONSTRAINT FK_PartyAddreses_Country REFERENCES Countries,	
-- 04 Jul 2005 new field

	--- Read comments for telephone_lines in primitives.sql
    cell_phones			telephone_lines		    NULL,
    telephones			telephone_lines		    NULL,
    email_addresses		email_addresses		    NULL,
    fax_lines			telephone_lines		    NULL,

    effective_from		DATETIME    		NOT NULL	Default	GetDate(),
    effective_till		DATETIME    		NOT NULL	Default	'31-Dec-9999',

    website			VARCHAR (255)		    NULL,
    other_info			VARCHAR (7500)		    NULL,
    gst_reg_no			VARCHAR (15)		    NULL,

	CONSTRAINT	UK_PartyAddresses
		UNIQUE		NONCLUSTERED	(party_id, address_type_id, address_no),

	CONSTRAINT	CK_PartyAddress_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


    -- Note. party_roles
    -- All applications should refer to the parties using this table, rather than directly.
    -- This MUST be adhered in case of look-ups (help) and for validations in screens that use foreign key to a party.

CREATE	TABLE	party_roles	(
    party_id			party_id		NOT NULL	CONSTRAINT	FK_PartyRoles_Party
									    REFERENCES	parties,

    role_cd			role_cd		    	NOT NULL	CONSTRAINT	FK_PartyRoles_Role
									    REFERENCES	roles,

	--- LATER: Trigger will check on INSERT, if for a role address is Mandatory, this column is NOT NULL.
	--- 	   Also the trigger should check that the party specified in the party_addresses is same as specified in this table.
    default_address_id		party_address_id	    NULL	CONSTRAINT	FK_PartyRoles_AddressID
									    REFERENCES	party_addresses,
    
	--- Note. Party Role's record maintenance semantics are controlled by the column application_id.
	---	INSERT.	The column contains the source application (as defined below) which has created the role for the party.
	---	UPDATE.	The information can be updated by the Application corresponding to what is stored in this column.
	---		No other application modify this role.
	---		If however, this column is NULL, any application can modify the role, but when
	---		in such a case, the information is modified by an application, it should update the application.
	---		Hence, after the modification, the owner application id will be set again.
	---	DELETE. The information can be attempted to be deleted by the application which is stored in
	---		this column or if this column is NULL. If the attempt to delete the role fails by the
	---		controlling Application, this column should then be set to NULL.
	---	This is in general the behavioural semantics for ALL the applications that operate on this table.

	--- Owner application_id should be set as below:
	---	If CDB package is being used for maintaining this role, then
	---		Set to the parameter (first) passed to CDB application
	---	If individual application is being used for maintaining this user-role,
	--		Set to the application_id.
	--- For example, if Central Stores uses the CDB application to maintain Manufacturers / Donors,
	--- an application (say CDB_SCS) needs to be created and that would have first parameter set to SIM_SCS.

	--- This has been necessiated to controlling the security of table horizontally where same
	--- interface (screen) is used by other applications.

    owner_application_id	application_id		    NULL,

    effective_from		DATETIME    		NOT NULL	Default	GetDate(),
    effective_till		DATETIME    		NOT NULL	Default	'31-Dec-9999',

	CONSTRAINT	PK_PartyRoles_Party_Role
		PRIMARY KEY	NONCLUSTERED	(party_id, role_cd),

	CONSTRAINT	CK_PartyRoles_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO


    -- Note. party_role_applications

CREATE	TABLE	party_role_applications	(
    party_id			party_id		NOT NULL,
    role_cd			role_cd		    	NOT NULL,
    application_id		application_id		NOT NULL,

	--- It specifies that the application can only view the party in this role.
    is_read			boolean			NOT NULL,

	--- It specifies that the application can modify the information (parties and party_addresses) of the party.
	--- Note the above point more carefully.
	--- If an application has is_update set, it means that it can:
	---	UPDATE/DELETE parties
	---	UPDATE/DELETE party_roles (for this role_cd ONLY)
	---	INSERT/UPDATE/DELETE party_addresses
    is_update			boolean			NOT NULL,

	CONSTRAINT	PK_PartyRoleApplications
		PRIMARY KEY	NONCLUSTERED	(party_id, role_cd, application_id),

	CONSTRAINT	FK_PartyRoleApplctn_Party_Role
		FOREIGN KEY	(party_id, role_cd)
		    REFERENCES	party_roles,

	CONSTRAINT	CK_PartyRoleApplcns_Privilege
		CHECK	(   (is_update = 'No')
			OR  (is_update = 'Yes' AND is_read = 'Yes')
			)
)
GO

	-- Note. initiation_places
--Data coming from NDQ
--04 Jul 2005 New Table
CREATE	TABLE	initiation_places	(
    place_id			place_id		NOT NULL    IDENTITY (1,1)
									CONSTRAINT	PK_InitiationPlace_ID
									    PRIMARY KEY	NONCLUSTERED,
    place_nm			VARCHAR (35)		NOT NULL,
    txn_ts			TIMESTAMP		NOT NULL,
    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_InitiationPlaces_Name
		UNIQUE	NONCLUSTERED	(place_nm),

	CONSTRAINT	CK_InitiationPlaces_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO





CREATE	TABLE	societies	(
    society_id			society_id		NOT NULL	CONSTRAINT	PK_Societies_ID
									    PRIMARY KEY	NONCLUSTERED,
    society_cd			VARCHAR (5)		NOT NULL,
    society_nm			VARCHAR (40)		NOT NULL,

    effective_from		DATETIME		NOT NULL	DEFAULT	GetDate(),
    effective_till		DATETIME		NOT NULL	DEFAULT	'31-Dec-9999',

	CONSTRAINT	UK_Societies_Name
		UNIQUE	NONCLUSTERED	(society_nm),

	CONSTRAINT	CK_Societies_EffectiveDates
		CHECK	(effective_from <= effective_till)
)
GO

-- =============================================================================
-- 
-- =============================================================================
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- vim:ts=8 ht=8
