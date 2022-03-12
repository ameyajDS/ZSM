/* ==================================================================================
	Source File		:	primitives.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Mon Nov 08 18:27:00 IST 2010
	Version			:	1.01
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	16-Oct-2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Defines the following data-types:
			BadgeFontSize, Boolean, ColourControl, CreditCnt, CreditCnt0, CreditCntF, CreditCntF0, Gender, ObjectRequirement^, Separator,
			SpeakerStatus, SpeakerType

		Defines the following generic domains:
			TinyInt		:	colour_component
			SmallInt	:	display_order
			Integer		: 
			Numeric-
				(12,5)	: 
			Strings-
					6	:	pin_or_zip_code
					15	:	gnc_short_nm
					30	:	functionary_nm, gnc_nm, name_part, person_nm
					40	:	badge_text, reference_nm
					50	:	address_line, email_addresses, report_nm, telephone_lines
					60	:	gnc_long_nm
					100	:	file_nm, gnc_description, procedure_nm, remarks
					300	:	report_description

		Defines the data-types for following identifiers:
			Strings-
					1	:	sewadar_type^
					3	:	sequence_id
					4	:	sewadar_status_cd
					6	:	sewadar_grno^
					7	:	application_id^
					10	:	address_type, attendance_unit, badge_template_id, scanning_validating_action, sewa_frequency
							sewadar_source, user_id, user_role_id
					15	:	address_proof, badge_part_type, centre_functionary, occupation, remarks_type, responsibility,
							scanning_job_type_cd, sewa_shift, system_info_cd
					20	:	attribute_value
					30	:	sewadar_list_use
			TinyInts	:	patron_id
			SmallInts	:	attribute_id, centre_functionary_id, colour_id, credit_specification_id, data_operation_id,
							department_id, initiation_place_id, qualification_id, qlfctn_subject_id, medical_disability_id,
							relationship_id, scanning_job_id, sewa_exemption_id, skill_id, sub_department_id
			Integers	:	audit_log_id, district_id, post_office_or_city_id, report_session_id,
							satsang_centre_id, sewa_id, sewa_team_id, sewa_team_serial_id, sewadar_id,
							sewadar_list_id, weekly_sewa_location_id, user_no

	* indicates that there are notes documented along with the definition.
	^ indicates that the string is of type CHAR instead of usual VARCHAR
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
	NS : 04-Jun-2017
		* String Domain Data Type person_nm added.
		* Identifiers user_no (type number), application_id, sewadar_source, user_id,
		  user_role_id (type Strings) added. 
     AK/JL : 15, 30-Oct-2013
		* Identifier address_proof_id added.
     AK/JL : 15, 16-Oct-2013
		* Identifier medical_disability_id added.
     JL : 29-Dec-2013
		* Identifier data_operation_id added.
     JL : 10-Dec-2011
		*   Datatype of sequence_id changed from CHAR (1) to VARCHAR (3)
		*	Identifier sewadar_type added
     JL : 15-Nov-2011
		*   Datatype of report_description changed from VARCHAR (200) to VARCHAR (300)
     JL : 08-27-Nov-2010
		*   Initial versions
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO


-- =============================================================================
-- DataType	BadgeFontSize
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'BadgeFontSize' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'BadgeFontSize'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'BadgeFontSize')
		EXEC	sp_droptype		'BadgeFontSize'
	DROP	RULE	BadgeFontSize
END
GO

CREATE	RULE	BadgeFontSize
		AS	@VALUE	BETWEEN	8 AND 72
GO

EXEC	sp_addtype	'BadgeFontSize',			TINYINT,			'NULL'
GO

EXEC	sp_bindrule	'BadgeFontSize',	'BadgeFontSize'
GO

-- =============================================================================
-- DataType	Boolean
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'Boolean' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'Boolean'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'Boolean')
		EXEC	sp_droptype		'Boolean'
	DROP	RULE	Boolean
END
GO

CREATE	RULE	Boolean
		AS	@VALUE	IN
				(	'Yes',
					'No'
				)
GO

EXEC	sp_addtype	'Boolean',					'VARCHAR (3)',		'NULL'
GO

EXEC	sp_bindrule	'Boolean',	'Boolean'
GO

-- =============================================================================
-- DataType	ColourControl
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ColourControl' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'ColourControl'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'ColourControl')
		EXEC	sp_droptype		'ColourControl'
	DROP	RULE	ColourControl
END
GO

CREATE	RULE	ColourControl
		AS	@VALUE	IN
				(	'Colour',				---- defined as per the colour specified
					'Department',			---- defined as per the colour of the Department
					'Centre'				---- defined as per the colour of the Satsang Centre
				)
GO

EXEC	sp_addtype	'ColourControl',			'VARCHAR (10)',		'NULL'
GO

EXEC	sp_bindrule	'ColourControl',	'ColourControl'
GO

-- =============================================================================
-- DataType	CreditCnt
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'CreditCnt' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'CreditCnt'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'CreditCnt')
		EXEC	sp_droptype		'CreditCnt'
	DROP	RULE	CreditCnt
END
GO

CREATE	RULE	CreditCnt		AS	@VALUE	>	0
GO

EXEC	sp_addtype	'CreditCnt',				SMALLINT,		'NULL'
GO

EXEC	sp_bindrule	'CreditCnt',	'CreditCnt'
GO

-- =============================================================================
-- DataType	CreditCnt0
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'CreditCnt0' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'CreditCnt0'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'CreditCnt0')
		EXEC	sp_droptype		'CreditCnt0'
	DROP	RULE	CreditCnt0
END
GO

CREATE	RULE	CreditCnt0		AS	@VALUE	>=	0
GO

EXEC	sp_addtype	'CreditCnt0',				SMALLINT,		'NULL'
GO

EXEC	sp_bindrule	'CreditCnt0',	'CreditCnt0'
GO

-- =============================================================================
-- DataType	CreditCntF
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'CreditCntF' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'CreditCntF'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'CreditCntF')
		EXEC	sp_droptype		'CreditCntF'
	DROP	RULE	CreditCntF
END
GO

CREATE	RULE	CreditCntF		AS	@VALUE	>	0
GO

EXEC	sp_addtype	'CreditCntF',				'NUMERIC(6,2)',	'NULL'
GO

EXEC	sp_bindrule	'CreditCntF',	'CreditCntF'
GO

-- =============================================================================
-- DataType	CreditCntF0
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'CreditCntF0' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'CreditCntF0'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'CreditCntF0')
		EXEC	sp_droptype		'CreditCntF0'
	DROP	RULE	CreditCntF0
END
GO

CREATE	RULE	CreditCntF0		AS	@VALUE	>=	0
GO

EXEC	sp_addtype	'CreditCntF0',				'NUMERIC(6,2)',	'NULL'
GO

EXEC	sp_bindrule	'CreditCntF0',	'CreditCntF0'
GO

-- =============================================================================
-- DataType	Gender
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'Gender' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'Gender'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'Gender')
		EXEC	sp_droptype		'Gender'
	DROP	RULE	Gender
END
GO

CREATE	RULE	Gender
		AS	@VALUE	IN
				(	'Male',
					'Female'
				)
GO

EXEC	sp_addtype	'Gender',					'VARCHAR (6)',		'NULL'
GO

EXEC	sp_bindrule	'Gender',	'Gender'
GO

-- =============================================================================
-- DataType	ObjectRequirement
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ObjectRequirement' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'ObjectRequirement'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'ObjectRequirement')
		EXEC	sp_droptype		'ObjectRequirement'
	DROP	RULE	ObjectRequirement
END
GO

CREATE	RULE	ObjectRequirement
		AS	@VALUE	IN
				(	'R', 	--- Required
					'N',	--- Not required
					'O'		--- Optional
				)
GO

EXEC	sp_addtype	'ObjectRequirement',		'CHAR (1)',			'NULL'
GO

EXEC	sp_bindrule	'ObjectRequirement',	'ObjectRequirement'
GO

-- =============================================================================
-- DataType	Separator
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'Separator' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'Separator'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'Separator')
		EXEC	sp_droptype		'Separator'
	DROP	RULE	Separator
END
GO

CREATE	RULE	Separator
		AS	@VALUE	IN
				(	' ',
					'-',
					'()',
					':'
				)
GO

EXEC	sp_addtype	'Separator',		'VARCHAR (2)',			'NULL'
GO

EXEC	sp_bindrule	'Separator',	'Separator'
GO

-- =============================================================================
-- DataType	SpeakerStatus
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SpeakerStatus' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'SpeakerStatus'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'SpeakerStatus')
		EXEC	sp_droptype		'SpeakerStatus'
	DROP	RULE	SpeakerStatus
END
GO

CREATE	RULE	SpeakerStatus
		AS	@VALUE	IN
				(	'Active',
					'Provisional',
					'InActive',
					'Retired',
					'Shifted'
				)
GO

EXEC	sp_addtype	'SpeakerStatus',		'VARCHAR (20)',			'NULL'
GO

EXEC	sp_bindrule	'SpeakerStatus',	'SpeakerStatus'
GO

-- =============================================================================
-- DataType	SpeakerType
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SpeakerType' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'SpeakerType'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'SpeakerType')
		EXEC	sp_droptype		'SpeakerType'
	DROP	RULE	SpeakerType
END
GO

CREATE	RULE	SpeakerType
		AS	@VALUE	IN
				(	'Satsang Karta',
					'Satsang Reader',
					'Pathi',
					'Bal Satsang Karta',
					'Bal Pathi'
				)
GO

EXEC	sp_addtype	'SpeakerType',		'VARCHAR (20)',			'NULL'
GO

EXEC	sp_bindrule	'SpeakerType',	'SpeakerType'
GO

-- =============================================================================
-- Domains : Integers
-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'colour_component')
	EXEC	sp_droptype	'colour_component'
GO

EXEC	sp_addtype	'colour_component',			TINYINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'display_order')
	EXEC	sp_droptype	'display_order'
GO
EXEC	sp_addtype	'display_order',			SMALLINT,			'NULL'
GO

-- =============================================================================
-- Domains : Strings
-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'pin_or_zip_code')
	EXEC	sp_droptype	'pin_or_zip_code'
GO

EXEC	sp_addtype	'pin_or_zip_code',			'VARCHAR (6)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'gnc_short_nm')
	EXEC	sp_droptype	'gnc_short_nm'
GO

EXEC	sp_addtype	'gnc_short_nm',				'VARCHAR (15)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'functionary_nm')
	EXEC	sp_droptype	'functionary_nm'
GO

EXEC	sp_addtype	'functionary_nm',			'VARCHAR (30)',		'NULL'
GO
-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'gnc_nm')
	EXEC	sp_droptype	'gnc_nm'
GO

EXEC	sp_addtype	'gnc_nm',					'VARCHAR (30)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'name_part')
	EXEC	sp_droptype	'name_part'
GO

EXEC	sp_addtype	'name_part',				'VARCHAR (30)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'badge_text')
	EXEC	sp_droptype	'badge_text'
GO

EXEC	sp_addtype	'badge_text',				'VARCHAR (40)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'reference_nm')
	EXEC	sp_droptype	'reference_nm'
GO

EXEC	sp_addtype	'reference_nm',				'VARCHAR (40)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'address_line')
	EXEC	sp_droptype	'address_line'
GO

EXEC	sp_addtype	'address_line',				'VARCHAR (50)',		'NULL'
GO

-- =============================================================================
    --- It should store comma separated list of email addresses (with no trailing comma)
    --- There should be an space after each comma.
    --- Example : jitendra_loyal@yahoo.com, jiten@softduty.com

IF EXISTS (SELECT * FROM systypes WHERE name = 'email_addresses')
	EXEC	sp_droptype	'email_addresses'
GO
EXEC	sp_addtype	'email_addresses',			'VARCHAR (50)',		'NULL'
GO

-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'report_nm')
	EXEC	sp_droptype	'report_nm'
GO
EXEC	sp_addtype	'report_nm',				'VARCHAR (50)',		'NULL'
GO

-- =============================================================================
    --- It should store comma separated list of telephone numbers (with no trailing comma)
    --- There should be a space after each comma.
    --- Example:28578240, 28578242

IF EXISTS (SELECT * FROM systypes WHERE name = 'telephone_lines')
	EXEC	sp_droptype	'telephone_lines'
GO
EXEC	sp_addtype	'telephone_lines',			'VARCHAR (50)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'gnc_long_nm')
	EXEC	sp_droptype	'gnc_long_nm'
GO

EXEC	sp_addtype	'gnc_long_nm',				'VARCHAR (60)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'file_nm')
	EXEC	sp_droptype	'file_nm'
GO

EXEC	sp_addtype	'file_nm',					'VARCHAR (100)',	'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'gnc_description')
	EXEC	sp_droptype	'gnc_description'
GO

EXEC	sp_addtype	'gnc_description',			'VARCHAR (100)',	'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'procedure_nm')
	EXEC	sp_droptype	'procedure_nm'
GO

EXEC	sp_addtype	'procedure_nm',				'VARCHAR (100)',	'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'remarks')
	EXEC	sp_droptype	'remarks'
GO

EXEC	sp_addtype	'remarks',					'VARCHAR (100)',	'NULL'
GO
-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'report_description')
	EXEC	sp_droptype	'report_description'
GO

EXEC	sp_addtype	'report_description',		'VARCHAR (300)',	'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'person_nm')
	EXEC	sp_droptype	'person_nm'
GO
EXEC	sp_addtype	'person_nm',		'VARCHAR (30)',		'NULL'
GO

-- =============================================================================
--	Identifiers	: Strings
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'sewadar_type')
	EXEC	sp_droptype	'sewadar_type'
GO

EXEC	sp_addtype	'sewadar_type',				'CHAR (1)',			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sequence_id')
	EXEC	sp_droptype	'sequence_id'
GO

EXEC	sp_addtype	'sequence_id',				'VARCHAR (3)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewadar_status_cd')
	EXEC	sp_droptype	'sewadar_status_cd'
GO

EXEC	sp_addtype	'sewadar_status_cd',		'VARCHAR (4)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewadar_grno')
	EXEC	sp_droptype	'sewadar_grno'
GO

EXEC	sp_addtype	'sewadar_grno',				'CHAR (6)',			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'address_type')
	EXEC	sp_droptype	'address_type'
GO

EXEC	sp_addtype	'address_type',				'VARCHAR (10)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'attendance_unit')
	EXEC	sp_droptype	'attendance_unit'
GO

EXEC	sp_addtype	'attendance_unit',			'VARCHAR (10)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'badge_template_id')
	EXEC	sp_droptype	'badge_template_id'
GO

EXEC	sp_addtype	'badge_template_id',		'VARCHAR (10)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'scanning_validating_action')
	EXEC	sp_droptype	'scanning_validating_action'
GO

EXEC	sp_addtype	'scanning_validating_action',	'VARCHAR (10)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewa_frequency')
	EXEC	sp_droptype	'sewa_frequency'
GO

EXEC	sp_addtype	'sewa_frequency',			'VARCHAR (10)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'address_proof')
	EXEC	sp_droptype	'address_proof'
GO

EXEC	sp_addtype	'address_proof',			'VARCHAR (15)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'badge_part_type')
	EXEC	sp_droptype	'badge_part_type'
GO

EXEC	sp_addtype	'badge_part_type',			'VARCHAR (15)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'centre_functionary')
	EXEC	sp_droptype	'centre_functionary'
GO

EXEC	sp_addtype	'centre_functionary',		'VARCHAR (15)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'occupation')
	EXEC	sp_droptype	'occupation'
GO

EXEC	sp_addtype	'occupation',				'VARCHAR (15)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'remarks_type')
	EXEC	sp_droptype	'remarks_type'
GO

EXEC	sp_addtype	'remarks_type',				'VARCHAR (15)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'responsibility')
	EXEC	sp_droptype	'responsibility'
GO

EXEC	sp_addtype	'responsibility',			'VARCHAR (15)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'scanning_job_type_cd')
	EXEC	sp_droptype	'scanning_job_type_cd'
GO

EXEC	sp_addtype	'scanning_job_type_cd',		'VARCHAR (15)',		'NOT NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewa_shift')
	EXEC	sp_droptype	'sewa_shift'
GO

EXEC	sp_addtype	'sewa_shift',				'VARCHAR (15)',		'NOT NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'system_info_cd')
	EXEC	sp_droptype	'system_info_cd'
GO

EXEC	sp_addtype	'system_info_cd',			'VARCHAR (15)',		'NOT NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'attribute_value')
	EXEC	sp_droptype	'attribute_value'
GO

EXEC	sp_addtype	'attribute_value',			'VARCHAR (20)',		'NULL'
GO

---- ===================================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewadar_list_use')
	EXEC	sp_droptype	'sewadar_list_use'
GO

EXEC	sp_addtype	'sewadar_list_use',			'VARCHAR (30)',		'NULL'
GO

---- ===================================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'report_xml_prm')
	EXEC	sp_droptype	'report_xml_prm'
GO
EXEC	sp_addtype	'report_xml_prm',			'varchar(500)',		'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'application_id')
	EXEC	sp_droptype	'application_id'
GO
EXEC	sp_addtype	'application_id',	'CHAR (7)',		'NULL'
GO
-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewadar_source')
	EXEC	sp_droptype	'sewadar_source'
GO
EXEC	sp_addtype	'sewadar_source',	'VARCHAR (10)',		'NULL'
GO
-- =============================================================================


IF EXISTS (SELECT * FROM systypes WHERE name = 'user_id')
	EXEC	sp_droptype	'user_id'
GO
EXEC	sp_addtype	'user_id',		'VARCHAR (10)',		'NULL'
GO
-- =============================================================================


    -- Note. User Role ID has first three alphabets followed by an underscore followed by other alphabets.
    -- So, its format is AAA_aaaaaa, where first set of three alphabets denote a package id and the
    -- second set of alphabets (maximum six) denote the actual user role for the package.
    -- Examples are SMS_gnrc, BAV_rcpts, BAV_gnrc, etc.

IF EXISTS (SELECT * FROM systypes WHERE name = 'user_role_id')
	EXEC	sp_droptype	'user_role_id'
GO
EXEC	sp_addtype	'user_role_id',		'VARCHAR (10)',		'NULL'
GO
-- =============================================================================

-- =============================================================================
--	Identifiers	: Numbers - TinyInt
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'patron_id')
	EXEC	sp_droptype	'patron_id'
GO
EXEC	sp_addtype	'patron_id',				TINYINT,			'NULL'
GO

-- =============================================================================
--	Identifiers	: Numbers - SmallInt
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'attribute_id')
	EXEC	sp_droptype	'attribute_id'
GO
EXEC	sp_addtype	'attribute_id',				SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'centre_functionary_id')
	EXEC	sp_droptype	'centre_functionary_id'
GO
EXEC	sp_addtype	'centre_functionary_id',	SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'colour_id')
	EXEC	sp_droptype	'colour_id'
GO
EXEC	sp_addtype	'colour_id',				SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'credit_specification_id')
	EXEC	sp_droptype	'credit_specification_id'
GO

EXEC	sp_addtype	'credit_specification_id',	SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'data_operation_id')
	EXEC	sp_droptype	'data_operation_id'
GO
EXEC	sp_addtype	'data_operation_id',			SMALLINT,			'NULL'
GO

-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'department_id')
	EXEC	sp_droptype	'department_id'
GO
EXEC	sp_addtype	'department_id',			SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'initiation_place_id')
	EXEC	sp_droptype	'initiation_place_id'
GO
EXEC	sp_addtype	'initiation_place_id',		SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'qualification_id')
	EXEC	sp_droptype	'qualification_id'
GO
EXEC	sp_addtype	'qualification_id',			SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'qlfctn_subject_id')
	EXEC	sp_droptype	'qlfctn_subject_id'
GO
EXEC	sp_addtype	'qlfctn_subject_id',		SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'medical_disability_id')
	EXEC	sp_droptype	'medical_disability_id'
GO
EXEC	sp_addtype	'medical_disability_id',	SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'address_proof_id')
	EXEC	sp_droptype	'address_proof_id'
GO
EXEC	sp_addtype	'address_proof_id',	SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'relationship_id')
	EXEC	sp_droptype	'relationship_id'
GO
EXEC	sp_addtype	'relationship_id',			SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'scanning_job_id')
	EXEC	sp_droptype	'scanning_job_id'
GO
EXEC	sp_addtype	'scanning_job_id',			SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewa_exemption_id')
	EXEC	sp_droptype	'sewa_exemption_id'
GO
EXEC	sp_addtype	'sewa_exemption_id',		SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'skill_id')
	EXEC	sp_droptype	'skill_id'
GO
EXEC	sp_addtype	'skill_id',					SMALLINT,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sub_department_id')
	EXEC	sp_droptype	'sub_department_id'
GO
EXEC	sp_addtype	'sub_department_id',		SMALLINT,			'NULL'
GO

-- =============================================================================
--	Identifiers	: Numbers - Integer
-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'audit_log_id')
	EXEC	sp_droptype	'audit_log_id'
GO
EXEC	sp_addtype	'audit_log_id',				INTEGER,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'district_id')
	EXEC	sp_droptype	'district_id'
GO
EXEC	sp_addtype	'district_id',				INTEGER,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'post_office_or_city_id')
	EXEC	sp_droptype	'post_office_or_city_id'
GO
EXEC	sp_addtype	'post_office_or_city_id',	INTEGER,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'report_session_id')
	EXEC	sp_droptype	'report_session_id'
GO
EXEC	sp_addtype	'report_session_id',		INTEGER,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'satsang_centre_id')
	EXEC	sp_droptype	'satsang_centre_id'
GO
EXEC	sp_addtype	'satsang_centre_id',		INTEGER,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewa_id')
	EXEC	sp_droptype	'sewa_id'
GO
EXEC	sp_addtype	'sewa_id',					INTEGER,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewa_team_serial_id')
	EXEC	sp_droptype	'sewa_team_serial_id'
GO
EXEC	sp_addtype	'sewa_team_serial_id',		INTEGER,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewa_team_id')
	EXEC	sp_droptype	'sewa_team_id'
GO
EXEC	sp_addtype	'sewa_team_id',				INTEGER,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewadar_id')
	EXEC	sp_droptype	'sewadar_id'
GO
EXEC	sp_addtype	'sewadar_id',				INTEGER,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'sewadar_list_id')
	EXEC	sp_droptype	'sewadar_list_id'
GO
EXEC	sp_addtype	'sewadar_list_id',			INTEGER,			'NULL'
GO

-- =============================================================================
IF EXISTS (SELECT * FROM systypes WHERE name = 'weekly_sewa_location_id')
	EXEC	sp_droptype	'weekly_sewa_location_id'
GO
EXEC	sp_addtype	'weekly_sewa_location_id',	INTEGER,			'NULL'
GO
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'user_no')
	EXEC	sp_droptype	'user_no'
GO
EXEC	sp_addtype	'user_no',		'INTEGER',		'NULL'
GO
-- =============================================================================

-- vim:ts=4 ht=8 sw=4
