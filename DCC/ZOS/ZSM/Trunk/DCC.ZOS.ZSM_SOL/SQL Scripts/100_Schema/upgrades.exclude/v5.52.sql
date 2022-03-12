/* ==================================================================================
    Source File		:	upgrade_v5.52.sql
    Author(s)		:	Manish Saluja
    Started On		:	Sun May 13, 2012
    Last updated	:	May 13, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.52
			..... Added tables mgr_indore_sewadars and mgr_tmp_sewadars
	The tables in this file needs to be dropped after all the badges for indore are
	generetaed for the first time. This will be roughly 9 months from May 13, 2012.
			
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
	SET	version_no = 5.52,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

-- =============================================================================

CREATE TABLE mgr_indore_sewadars
(
	indore_foxpro_grno			INT				NOT NULL,
	sewadar_id					INT					NULL, -- ZSM
	first_name					VARCHAR (30)	NOT NULL,
	middle_name					VARCHAR (30)	NOT	NULL,
	surname						VARCHAR (30)	NOT NULL,
	gender						CHAR (1)		NOT NULL,
	is_married					VARCHAR (5)		NOT NULL,
	birth_dtm					SMALLDATETIME	    NULL, -- Made Nullable --> Jiten: Data issue
	is_initiated				CHAR (1)		NOT NULL,
	initiation_dt				SMALLDATETIME	 	NULL,
	initiation_by				INT					NULL,
	initiation_place			VARCHAR (30)		NULL,
	address_line_1				VARCHAR (50)	NOT NULL,
	address_line_2				VARCHAR (50)		NULL,
	state_nm					VARCHAR (55)	NOT	NULL,
	district_nm					VARCHAR (55)	NOT	NULL,
	post_office_or_city_nm		VARCHAR (30)	NOT NULL,
	post_office_or_city_id		INT					NULL, -- ZSM
	pin_or_zip_code				VARCHAR (6)			NULL,
	telephone_mobile			VARCHAR (50)		NULL,
	telephone_residence			VARCHAR (50)		NULL,
	telephone_office			VARCHAR (50)		NULL,
	occupation1					VARCHAR (30)	NOT NULL,
	occupation2					VARCHAR (30)		NULL,
	occupation3					VARCHAR (30)		NULL,
	occupation					VARCHAR (15)		NULL, -- ZSM
	qualification_nm			VARCHAR (50)		NULL,
	qualification_id			INT					NULL, -- ZSM
	attends_weekly_satsang		VARCHAR (5)		NOT NULL, -- TRUE/FALSE
	weekly_satsang_centre_nm	VARCHAR (30)		NULL,
	weekly_satsang_centre_id	INT					NULL, -- ZSM
	status						VARCHAR (20)	NOT NULL,
	status_id					INT					NULL, -- ZSM
	appointment_dt				SMALLDATETIME		NULL, -- Made Nullable --> Jiten: Data issue
	department_nm				VARCHAR (30)	NOT NULL,
	department_id				INT					NULL, -- ZSM
	sub_department_nm			VARCHAR (30)		NULL,
	sub_department_id			INT					NULL, -- ZSM
	attendance_97				CHAR(1)			NOT NULL, -- X/P/A/
	attendance_98				CHAR(1)			NOT NULL,
	attendance_99				CHAR(1)			NOT NULL,
	attendance_2k				CHAR(1)			NOT NULL,
	attendance_01				CHAR(1)			NOT NULL,
	attendance_02				CHAR(1)			NOT NULL,
	attendance_03				CHAR(1)			NOT NULL,
	attendance_04				CHAR(1)			NOT NULL,
	attendance_05				CHAR(1)			NOT NULL,
	attendance_06				CHAR(1)			NOT NULL,
	attendance_07				CHAR(1)			NOT NULL,
	attendance_08				CHAR(1)			NOT NULL,
	attendance_09				CHAR(1)			NOT NULL,
	attendance_10				CHAR(1)			NOT NULL,
	attendance_11				CHAR(1)			NOT NULL,
	attendance_12				CHAR(1)			NOT NULL,
	migration_note_fhname		VARCHAR (30)		NULL,
	migration_note_skill		VARCHAR (20)		NULL,
	migration_note_tehsil		VARCHAR (55)		NULL,
	is_migrated					CHAR (1)		NOT NULL DEFAULT 'Y'

)
GO

CREATE TABLE mgr_tmp_sewadars
(
	old_grno 			INT 			NOT NULL, 
	name				VARCHAR (100) 	NOT NULL,
	gender				CHAR (1) 		NOT NULL,
	is_local_sewadar 	CHAR (1) 		NOT NULL,
	department_nm		VARCHAR (30)	NOT	NULL,
	department_id		INT			 	 	NULL, -- ZSM
	sub_department_nm	VARCHAR (30)		NULL,
	sub_department_id 	VARCHAR (30) 		NULL, -- ZSM
	telephone_no		VARCHAR (50)		NULL,
	photo_id 			VARCHAR (5)		NOT NULL,
	to_be_migrated		CHAR (1)		NOT NULL,
	is_name_overridden 	CHAR (1) 			NULL
)

GO

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
