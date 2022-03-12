/* ==================================================================================
    Source File		:	tmp_indore_migration_schema.sql
    Author(s)		:	Manish Saluja
    Started On		:	Sun May 13 2012
    Version			:	1.0
    Last updated	:	May 13, 2012
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------
	The tables in this file needs to be dropped after all the badges for indore are
	generetaed for the first time. This will be roughly 9 months from May 13, 2012.
	After dropping the tables, this file also needs to be removed from svn.
	==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
	JL : 18-May-2012 : v1.01
		* Table name changed from mgr_indore_sewadars to mgr_centre_sewadars. Also following changes
		  were done in the table:
		  	+ Column satsang_centre_id has been introduced.
			+ Column indore_foxpro_grno has been renamed to centre_grno.
			+ Default value of column is_migrated changed to 'N'.
			+ Primart key based on columns satsang_centre_id and centre_grno has been added.
			+ Column centre_grno is now VARCHAR (10) instead of INT.
		* Table mgr_tmp_sewadars has following changes:
			+ Primary Key defined on column centre_grno.
			+ Unique key defined on column photo_id.
			+ Column centre_grno is now VARCHAR (10) instead of INT.
	MS : 13-May-2012 : v1.0
		* 	Added tables mgr_indore_sewadars and mgr_tmp_sewadars
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

CREATE TABLE mgr_centre_sewadars
(
	centre_grno					VARCHAR (10)	NOT NULL,
 	satsang_centre_id			INT				NOT NULL,
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
	initiation_place_id			INT					NULL, -- ZSM
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
	skill1_id					INT					NULL, -- ZSM
	skill2_id					INT					NULL, -- ZSM
	skill3_id					INT					NULL, -- ZSM
	qualification_nm			VARCHAR (50)		NULL,
	qualification1_id			INT					NULL, -- ZSM
	qlfctn_subject1_id			INT					NULL, -- ZSM
	qualification2_id			INT					NULL, -- ZSM
	qlfctn_subject2_id			INT					NULL, -- ZSM
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
	is_migrated					CHAR (1)		NOT NULL DEFAULT 'N',
	-- ZSM migration_remark1 is created directly in migration.sql for 'Name of Sewadar changed ...'
	migration_remark2			VARCHAR (100)		NULL, -- ZSM ('Unknown occupation is put as Un-employed')
	migration_remark3			VARCHAR (100)		NULL, -- ZSM ('Unknown appointment_dt is put as 1-Feb-2012')
	issues						VARCHAR (1000)		NULL, -- ZSM (for any issues due to which migration should not be done (if this column is NULL))

		CONSTRAINT	MgrCentreSewadars_PK_CentreGRNo_SatsangCentreID
			PRIMARY KEY 	NONCLUSTERED	(	centre_grno, satsang_centre_id	)
)
GO

CREATE TABLE mgr_tmp_sewadars
(
	centre_grno 		VARCHAR (10)	NOT NULL	CONSTRAINT	MgrTmpSewadars_PK_CentreGRNo
														PRIMARY KEY NONCLUSTERED,
	name				VARCHAR (100) 	NOT NULL,
	gender				CHAR (1) 		NOT NULL,
	is_local_sewadar 	CHAR (1) 		NOT NULL,
	department_nm		VARCHAR (30)	NOT	NULL,
	sub_department_nm	VARCHAR (30)		NULL,
	department_id		INT					NULL,
	sub_department_id	INT					NULL,
	telephone_no		VARCHAR (50)		NULL,
	photo_id 			VARCHAR (10)	NOT NULL	CONSTRAINT	MgrTmpSewadars_UK_PhotoId
														UNIQUE NONCLUSTERED,
	to_be_migrated		CHAR (1)		NOT NULL,
	is_name_overridden 	CHAR (1) 			NULL
)

GO

-- =============================================================================

-- vim:ts=4 ht=8 sw=4
