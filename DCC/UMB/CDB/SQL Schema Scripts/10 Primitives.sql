/* ==================================================================================
    Source File		:	primitives.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat July 13 12:45:48 IST 2003
    Version		:	1.07
    Last updated	:	February 21, 2005
    Module ID		:	CDB (Central Data Base)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------
	Defines the following data-types:
		age
		boolean
		gender
		requirement

	Defines the data-types for following objects:
		SmallInt	:   display_order
		String 5	:   extension_no
		String 6	:   pin_or_zip_code
		String 10	:   person_title, telephone_no
		String 20	:   cell_phone_no, satsang_centre_type
		String 30	:   address_component_nm, person_part_nm
		String 35	:   designation_nm
		String 50	:   address_line, email_addresses, telephone_lines

	Defines the data-types for following identifiers:
		TinyInts	:   patron_id
		SmallInts	:   camera_id, country_id, department_group_id, department_id,
				    designation_id, hospital_unit_id, measuring_unit_id, occupation_id, 
				    qualification_id, relation_id, skill_id
		Integers	:   district_or_city_id, initiation_id, party_address_id, party_id,
				    person_id, post_office_id, representative_id, satsang_centre_id,
				    state_id
		String 3	:   role_cd
		String 6	:   screen_id
		String 7	:   application_id
		String 20	:   address_type
    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	JL: 21-Feb-2005
	    The domain of telephone_lines changed from VARCHAR (20) to VARCHAR (50).
	JL: 21-Feb-2005
	    The domain of address_type changed from CHAR to VARCHAR.
	JL: 19-Feb-2005
	    Added data-types party_id, party_address_id, requirement, role_cd, designation_nm and address_type.
	JL: 19-Feb-2005
	    Length of application_id changed from 3 to 7.
	JL: 18-Mar-2004
	    Added hospital_unit_id added.
	JL: 15-Feb-2004
	    Department ID is SMALLINT instead of INTEGER
    ==================================================================================*/

USE CDB

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS OFF
GO

-- =============================================================================
-- DataType	Age
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'age' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'age'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'age')
	    EXEC	sp_droptype		'age'
	DROP	RULE	age
END
GO

CREATE	RULE	age		AS	@VALUE	>	0
GO

EXEC	sp_addtype	'age',			'TINYINT',	'NULL'
GO

EXEC	sp_bindrule	'age',		'age'
GO

IF EXISTS (SELECT * FROM systypes WHERE name = 'maritalstatus_id')
	EXEC	sp_droptype	'maritalstatus_id'
GO
EXEC	sp_addtype	'maritalstatus_id',	'TINYINT',	'NOT NULL'
GO


-- =============================================================================
-- DataType	Boolean
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'boolean' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'boolean'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'boolean')
	    EXEC	sp_droptype		'boolean'
	DROP	RULE	boolean
END
GO

CREATE	RULE	boolean		AS	@VALUE	IN	('Yes', 'No')
GO

EXEC	sp_addtype	'boolean',		'CHAR (3)',	'NULL'
GO

EXEC	sp_bindrule	'boolean',		'boolean'
GO



-- =============================================================================
-- DataType	Gender
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'gender' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'gender'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'gender')
	    EXEC	sp_droptype		'gender'
	DROP	RULE	gender
END
GO

CREATE	RULE	gender		AS	@VALUE	IN	('Male', 'Female')
GO

EXEC	sp_addtype	'gender',		'CHAR (6)',	'NULL'
GO

EXEC	sp_bindrule	'gender',		'gender'
GO



-- =============================================================================
-- DataType	Requirement
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'requirement' AND type = 'R')
BEGIN
	EXEC	sp_unbindrule	'requirement'
	IF EXISTS (SELECT * FROM systypes WHERE name = 'requirement')
	    EXEC	sp_droptype		'requirement'
	DROP	RULE	requirement
END
GO

CREATE	RULE	requirement	AS	@VALUE	IN	('Mandatory', 'Optional', 'Not Required')
GO

EXEC	sp_addtype	'requirement',		'VARCHAR (12)',	'NULL'
GO

EXEC	sp_bindrule	'requirement',		'requirement'
GO



-- =============================================================================
--	Objects	: SmallInts
-- =============================================================================

    -- -----------------------------------------------------------------------------
    -- Display Order is used for putting an order for display or printing.
    -- One example of usage is Stages of a Process where the stages need to be specified
    -- in an order. On the screens, typically command buttons with Up and Down arrows
    -- need to be provided for putting them in order, if required.
    -- Another example would be the ordering Telephone numbers in a department.
    -- It is NOT be used as a part of the primary key anywhere.
    -- -----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM systypes WHERE name = 'display_order')
	EXEC	sp_droptype	'display_order'
GO
EXEC	sp_addtype	'display_order',	'SMALLINT',	'NULL'
GO

IF EXISTS (SELECT * FROM systypes WHERE name = 'place_id')
	EXEC	sp_droptype	'place_id'
GO
EXEC	sp_addtype	'place_id',		'SMALLINT',	'NOT NULL'
GO

-- =============================================================================
--	Objects	: Strings
-- =============================================================================

--		Strings size 5
--		--------------

IF EXISTS (SELECT * FROM systypes WHERE name = 'extension_no')
	EXEC	sp_droptype	'extension_no'
GO
EXEC	sp_addtype	'extension_no',		'CHAR (5)',	'NULL'
GO


--		Strings size 6
--		--------------

IF EXISTS (SELECT * FROM systypes WHERE name = 'pin_or_zip_code')
	EXEC	sp_droptype	'pin_or_zip_code'
GO
EXEC	sp_addtype	'pin_or_zip_code',	'CHAR (6)',	'NULL'
GO


--		Strings size 10
--		---------------

IF EXISTS (SELECT * FROM systypes WHERE name = 'person_title')
	EXEC	sp_droptype	'person_title'
GO
EXEC	sp_addtype	'person_title',		'CHAR (10)',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'telephone_no')
	EXEC	sp_droptype	'telephone_no'
GO
EXEC	sp_addtype	'telephone_no',		'CHAR (10)',	'NULL'
GO


--		Strings size 20
--		---------------

IF EXISTS (SELECT * FROM systypes WHERE name = 'cell_phone_no')
	EXEC	sp_droptype	'cell_phone_no'
GO
EXEC	sp_addtype	'cell_phone_no',	'VARCHAR (20)',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'satsang_centre_type')
	EXEC	sp_droptype	'satsang_centre_type'
GO
EXEC	sp_addtype	'satsang_centre_type',	'VARCHAR (20)',	'NULL'
GO


--		Strings size 30
--		---------------

IF EXISTS (SELECT * FROM systypes WHERE name = 'address_component_nm')
	EXEC	sp_droptype	'address_component_nm'
GO
EXEC	sp_addtype	'address_component_nm',	'VARCHAR (30)',	'NULL'
GO

IF EXISTS (SELECT * FROM systypes WHERE name = 'person_part_nm')
	EXEC	sp_droptype	'person_part_nm'
GO
EXEC	sp_addtype	'person_part_nm',	'VARCHAR (30)',	'NULL'
GO


--		Strings size 35
--		---------------

IF EXISTS (SELECT * FROM systypes WHERE name = 'designation_nm')
	EXEC	sp_droptype	'designation_nm'
GO
EXEC	sp_addtype	'designation_nm',	'VARCHAR (35)',	'NULL'
GO


--		Strings size 50
--		---------------

IF EXISTS (SELECT * FROM systypes WHERE name = 'address_line')
	EXEC	sp_droptype	'address_line'
GO
EXEC	sp_addtype	'address_line',		'VARCHAR (50)',	'NULL'
GO


    --- It should store comma separated list of email addresses (with no trailing comma)
    --- There should be an space after each comma.
    --- Example : jitendra_loyal@yahoo.com, jiten@softduty.com

IF EXISTS (SELECT * FROM systypes WHERE name = 'email_addresses')
	EXEC	sp_droptype	'email_addresses'
GO
EXEC	sp_addtype	'email_addresses',	'VARCHAR (50)',	'NULL'
GO


    --- It should store comma separated list of telephone numbers (with no trailing comma)
    --- There should be a space after each comma.
    --- Example:28578240, 28578242

IF EXISTS (SELECT * FROM systypes WHERE name = 'telephone_lines')
	EXEC	sp_droptype	'telephone_lines'
GO
EXEC	sp_addtype	'telephone_lines',	'VARCHAR (50)',	'NULL'
GO



-- =============================================================================
--	Identifiers	: TinyInts
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'patron_id')
	EXEC	sp_droptype	'patron_id'
GO
EXEC	sp_addtype	'patron_id',		'TINYINT',	'NULL'
GO


-- =============================================================================
--	Identifiers	: SmallInts
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'camera_id')
	EXEC	sp_droptype	'camera_id'
GO
EXEC	sp_addtype	'camera_id',		'SMALLINT',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'country_id')
	EXEC	sp_droptype	'country_id'
GO
EXEC	sp_addtype	'country_id',		'SMALLINT',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'department_group_id')
	EXEC	sp_droptype	'department_group_id'
GO
EXEC	sp_addtype	'department_group_id',	'SMALLINT',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'department_id')
	EXEC	sp_droptype	'department_id'
GO
EXEC	sp_addtype	'department_id',	'SMALLINT',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'designation_id')
	EXEC	sp_droptype	'designation_id'
GO
EXEC	sp_addtype	'designation_id',	'SMALLINT',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'hospital_unit_id')
	EXEC	sp_droptype	'hospital_unit_id'
GO
EXEC	sp_addtype	'hospital_unit_id',	'SMALLINT',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'measuring_unit_id')
	EXEC	sp_droptype	'measuring_unit_id'
GO
EXEC	sp_addtype	'measuring_unit_id',	'SMALLINT',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'occupation_id')
	EXEC	sp_droptype	'occupation_id'
GO
EXEC	sp_addtype	'occupation_id',	'SMALLINT',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'qualification_id')
	EXEC	sp_droptype	'qualification_id'
GO
EXEC	sp_addtype	'qualification_id',	'SMALLINT',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'relation_id')
	EXEC	sp_droptype	'relation_id'
GO
EXEC	sp_addtype	'relation_id',		'SMALLINT',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'skill_id')
	EXEC	sp_droptype	'skill_id'
GO
EXEC	sp_addtype	'skill_id',		'SMALLINT',	'NULL'
GO


-- =============================================================================
--	Identifiers	: Integers
-- =============================================================================

IF EXISTS (SELECT * FROM systypes WHERE name = 'address_type_id')
	EXEC	sp_droptype	'address_type_id'
GO
EXEC	sp_addtype	'address_type_id',	'INTEGER',	'NOT NULL'
GO

IF EXISTS (SELECT * FROM systypes WHERE name = 'district_or_city_id')
	EXEC	sp_droptype	'district_or_city_id'
GO
EXEC	sp_addtype	'district_or_city_id',	'INTEGER',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'initiation_id')
	EXEC	sp_droptype	'initiation_id'
GO
EXEC	sp_addtype	'initiation_id',	'INTEGER',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'party_address_id')
	EXEC	sp_droptype	'party_address_id'
GO
EXEC	sp_addtype	'party_address_id',	'INTEGER',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'party_id')
	EXEC	sp_droptype	'party_id'
GO
EXEC	sp_addtype	'party_id',		'INTEGER',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'person_id')
	EXEC	sp_droptype	'person_id'
GO
EXEC	sp_addtype	'person_id',		'INTEGER',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'post_office_id')
	EXEC	sp_droptype	'post_office_id'
GO
EXEC	sp_addtype	'post_office_id',	'INTEGER',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'representative_id')
	EXEC	sp_droptype	'representative_id'
GO
EXEC	sp_addtype	'representative_id',	'INTEGER',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'satsang_centre_id')
	EXEC	sp_droptype	'satsang_centre_id'
GO
EXEC	sp_addtype	'satsang_centre_id',	'INTEGER',	'NULL'
GO


IF EXISTS (SELECT * FROM systypes WHERE name = 'state_id')
	EXEC	sp_droptype	'state_id'
GO
EXEC	sp_addtype	'state_id',		'INTEGER',	'NULL'
GO

IF EXISTS (SELECT * FROM systypes WHERE name = 'sewadarstatus_id')
	EXEC	sp_droptype	'sewadarstatus_id'
GO
EXEC	sp_addtype	'sewadarstatus_id',	'INTEGER',	'NOT NULL'
GO

IF EXISTS (SELECT * FROM systypes WHERE name = 'sewadartype_id')
	EXEC	sp_droptype	'sewadartype_id'
GO
EXEC	sp_addtype	'sewadartype_id',	'INTEGER',	'NOT NULL'
GO

IF EXISTS (SELECT * FROM systypes WHERE name = 'language_id')
	EXEC	sp_droptype	'language_id'
GO
EXEC	sp_addtype	'language_id',		'INTEGER',	'NOT NULL'
GO

-- =============================================================================
--	Identifiers	: Integers
-- =============================================================================

--		Strings size 3
--		--------------

IF EXISTS (SELECT * FROM systypes WHERE name = 'role_cd')
	EXEC	sp_droptype	'role_cd'
GO
EXEC	sp_addtype	'role_cd',		'CHAR (3)',	'NULL'
GO


--		Strings size 6
--		--------------

IF EXISTS (SELECT * FROM systypes WHERE name = 'screen_id')
	EXEC	sp_droptype	'screen_id'
GO
EXEC	sp_addtype	'screen_id',		'CHAR (6)',	'NULL'
GO


--		Strings size 7
--		--------------

IF EXISTS (SELECT * FROM systypes WHERE name = 'application_id')
	EXEC	sp_droptype	'application_id'
GO
EXEC	sp_addtype	'application_id',	'CHAR (7)',	'NULL'
GO


--		Strings size 20
--		---------------

IF EXISTS (SELECT * FROM systypes WHERE name = 'address_type')
	EXEC	sp_droptype	'address_type'
GO
EXEC	sp_addtype	'address_type',		'VARCHAR (20)',	'NULL'
GO



IF EXISTS (SELECT * FROM systypes WHERE name = 'society_id')
	EXEC	sp_droptype	'society_id'
GO
EXEC	sp_addtype	'society_id',		'SMALLINT',	'NULL'
GO


-- =============================================================================
-- 
-- =============================================================================
SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- vim:ts=8 ht=8
