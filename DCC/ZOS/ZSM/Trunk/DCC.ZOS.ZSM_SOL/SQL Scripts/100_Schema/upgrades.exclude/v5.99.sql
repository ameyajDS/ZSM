/* ==================================================================================
    Source File		:	upgrade_v5.99.sql
    Author(s)		:	Jiten
    Started On		:	14th June 2018
	Last updated	:	19th June 2018
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
	SET	version_no = 5.99,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO


-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ReportDiscrepanciesBulkRegister' AND xtype = 'P')
	DROP PROCEDURE ReportDiscrepanciesBulkRegister
GO

DROP	TYPE	SewadarRegistrationType
GO

CREATE	TYPE	SewadarRegistrationType	AS	TABLE
(
	name					VARCHAR (100),
	gender					CHAR (1),
	is_local_sewadar 		CHAR (1),
	photo_id 				VARCHAR (20),
	department				VARCHAR (30),
	sub_department 			VARCHAR (30),
	mobile					VARCHAR (50),
	date_of_birth			SMALLDATETIME,
	occupation				VARCHAR (30),
	to_be_registered		CHAR (1),
	appointment_year		SMALLINT,
	old_grno				VARCHAR (10),

	is_married				CHAR (1)			NOT	NULL,
	is_initiated			CHAR (1)			NOT	NULL,
	initiated_on			DATE					NULL,
	initiated_by			VARCHAR (50)			NULL,
	initiation_place		VARCHAR (35)			NULL,

	address_line_1			VARCHAR (50)		NOT	NULL,
	address_line_2			VARCHAR (50)			NULL,
	country_nm				VARCHAR (50)		NOT	NULL,
	state_nm				VARCHAR (50)		NOT	NULL,
	district_nm				VARCHAR (50)		NOT	NULL,
	post_office_nm			VARCHAR (30)		NOT	NULL,
	pin_or_zip_code			VARCHAR (6)				NULL,
	telephone_residence		VARCHAR (50)			NULL,
	telephone_office		VARCHAR (50)			NULL,

	attends_weekly_satsang	CHAR (1)			NOT	NULL,
	weekly_satsang_centre	VARCHAR (40)			NULL,

	address_proof			VARCHAR (15)			NULL,
	other_address_proof		VARCHAR (60)			NULL,
	has_hypertension		CHAR (1)				NULL,
	is_diabetic				CHAR (1)				NULL,
	has_skin_problem		CHAR (1)				NULL,
	has_epillepsy			CHAR (1)				NULL,

	reference_1_centre		VARCHAR (40)			NULL,
	reference_1_grno		CHAR (6)				NULL,
	reference_1_nm			VARCHAR (40)			NULL,
	reference_1_relation	VARCHAR (20)			NULL,
	reference_1_department	varchar (30)			NULL,

	reference_2_centre		VARCHAR (40)			NULL,
	reference_2_grno		CHAR (6)				NULL,
	reference_2_nm			VARCHAR (40)			NULL,
	reference_2_relation	VARCHAR (20)			NULL,
	reference_2_department	varchar (30)			NULL,

	sponsorer_centre		VARCHAR (40)			NULL,
	sponsorer_grno			CHAR (6)				NULL,
	security_centre			VARCHAR (40)			NULL,
	security_grno			CHAR (6)				NULL,

	area_secretary_centre	VARCHAR (40)			NULL,
	secretary_centre		VARCHAR (40)			NULL
)
GO

GRANT EXEC ON TYPE::[dbo].[SewadarRegistrationType] TO ZSM_RDR 
GRANT EXEC ON TYPE::[dbo].[SewadarRegistrationType] TO ZSM_ATM 
GRANT EXEC ON TYPE::[dbo].[SewadarRegistrationType] TO ZSM_USR 
GRANT EXEC ON TYPE::[dbo].[SewadarRegistrationType] TO ZSM_SUP 
GRANT EXEC ON TYPE::[dbo].[SewadarRegistrationType] TO ZSM_ADM 
GRANT EXEC ON TYPE::[dbo].[SewadarRegistrationType] TO ZSM_CU 
GRANT EXEC ON TYPE::[dbo].[SewadarRegistrationType] TO ZSM_PC 


DROP	TABLE	tmp_bulk_registrations
GO


CREATE	TABLE	tmp_bulk_registrations
(
	name						VARCHAR (100)		NOT NULL,
	gender 						CHAR (1)			NOT NULL,
	is_local_sewadar			CHAR (1)			NOT NULL,
	photo_id					VARCHAR (20)		NOT NULL,
	department_nm				gnc_nm				NOT NULL,
	sub_department_nm			gnc_nm					NULL,
	telephone_mobile			telephone_lines			NULL,
    birth_dtm					SMALLDATETIME		NOT NULL,
	occupation					gnc_nm				NOT NULL,
	appointment_year			SMALLINT				NULL,
	old_grno					VARCHAR (10)			NULL,
                                
	is_married					CHAR (1)			NOT	NULL,
	is_initiated				CHAR (1)			NOT	NULL,
	initiated_on				DATE					NULL,
	initiated_by				VARCHAR (50)			NULL,
	initiation_place			VARCHAR (35)			NULL,
                                
	address_line_1				VARCHAR (50)		NOT	NULL,
	address_line_2				VARCHAR (50)			NULL,
	country_nm					VARCHAR (50)		NOT	NULL,
	state_nm					VARCHAR (50)		NOT	NULL,
	district_nm					VARCHAR (50)		NOT	NULL,
	post_office_nm				VARCHAR (30)		NOT	NULL,
	pin_or_zip_code				VARCHAR (6)				NULL,
	telephone_residence			VARCHAR (50)			NULL,
	telephone_office			VARCHAR (50)			NULL,
                                
	attends_weekly_satsang		CHAR (1)			NOT	NULL,
	weekly_satsang_centre		VARCHAR (40)			NULL,
                                
	address_proof				VARCHAR (15)			NULL,
	other_address_proof			VARCHAR (60)			NULL,
	has_hypertension			CHAR (1)				NULL,
	is_diabetic					CHAR (1)				NULL,
	has_skin_problem			CHAR (1)				NULL,
	has_epillepsy				CHAR (1)				NULL,
                                
	reference_1_centre			VARCHAR (40)			NULL,
	reference_1_grno			CHAR (6)				NULL,
	reference_1_nm				VARCHAR (40)			NULL,
	reference_1_relation		VARCHAR (20)			NULL,
	reference_1_department		varchar (30)			NULL,
                                
	reference_2_centre			VARCHAR (40)			NULL,
	reference_2_grno			CHAR (6)				NULL,
	reference_2_nm				VARCHAR (40)			NULL,
	reference_2_relation		VARCHAR (20)			NULL,
	reference_2_department		varchar (30)			NULL,
                                
	sponsorer_centre			VARCHAR (40)			NULL,
	sponsorer_grno				CHAR (6)				NULL,
	security_centre				VARCHAR (40)			NULL,
	security_grno				CHAR (6)				NULL,
                                
	area_secretary_centre		VARCHAR (40)			NULL,
	secretary_centre			VARCHAR (40)			NULL,
                                
	first_nm 					name_part				NULL,
	middle_nm 					name_part				NULL,
	last_nm 					name_part				NULL,
	department_id				department_id			NULL,
	sub_department_id			department_id			NULL,
	sewadar_id					sewadar_id				NULL,
                                
	initiated_by_id				TINYINT					NULL,
	initiation_place_id			SMALLINT				NULL,
	post_office_or_city_id		INTEGER					NULL,
	weekly_satsang_centre_id	INTEGER					NULL,
	other_address_proof_id		SMALLINT				NULL,

	reference_1_sewadar_id		INTEGER					NULL,
	reference_1_centre_id		INTEGER					NULL,
	reference_1_relation_id		SMALLINT				NULL,
	reference_2_sewadar_id		INTEGER					NULL,
	reference_2_centre_id		INTEGER					NULL,
	reference_2_relation_id		SMALLINT				NULL,

	sponsorer_sewadar_id		INTEGER					NULL,
	security_sewadar_id			INTEGER					NULL,

	area_secretary_id			SMALLINT				NULL,
	secretary_id				SMALLINT				NULL,

		CONSTRAINT	TmpBulkRegistrations_PK_NameGenderDOB
			PRIMARY KEY	NONCLUSTERED	(	name, gender, birth_dtm )
)
GO

