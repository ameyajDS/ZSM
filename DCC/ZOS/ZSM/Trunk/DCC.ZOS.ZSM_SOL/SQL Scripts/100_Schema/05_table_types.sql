/* ==================================================================================
	Source File		:	table_types.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Fri Oct 07 11:07:00 IST 2016
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	07-Oct-2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Defines the following data-types:
			SewadarRegistrationType
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
     JL : 07-Oct-2016
		*   Initial version
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO


-- =============================================================================
-- DataType	SewadarRegistrationType
-- =============================================================================
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
	skill					VARCHAR (20)			NULL,
	qualification			VARCHAR (35)			NULL,
	qualification_subject	VARCHAR (20)			NULL,

	attends_weekly_satsang	CHAR (1)			NOT	NULL,
	weekly_satsang_centre	VARCHAR (40)			NULL,

	address_proof			VARCHAR (15)			NULL,
	other_address_proof		VARCHAR (60)			NULL,
	has_hypertension		CHAR (1)				NULL,
	is_diabetic				CHAR (1)				NULL,
	has_skin_problem		CHAR (1)				NULL,
	has_epillepsy			CHAR (1)				NULL,
	medical_disability		VARCHAR (60)			NULL,

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

-- =============================================================================

CREATE TYPE GrNoList AS TABLE
(
	grno	sewadar_grno			NOT NULL	PRIMARY KEY
)
GO

-- =============================================================================

CREATE TYPE FingerPrintData AS TABLE
(
	sewadar_id	sewadar_id	NOT	NULL,
	fp_scan_dtm	DATETIME	NOT NULL
)
GO


CREATE TYPE [dbo].[SewadarIdList] AS TABLE(
	[sewadar_id] [dbo].[sewadar_id] NOT NULL
)
GO


CREATE TYPE [dbo].[SewadarBadgeRecord] AS TABLE
(
	scanning_sub_job_id		scanning_job_id	NOT NULL,
	controlling_dt			smalldatetime NOT NULL,
	satsang_centre_id		satsang_centre_id NOT NULL,
	sewadar_grno 			sewadar_grno NOT NULL,
	scannedDTM				datetime	NOT NULL
)
GO
-- =============================================================================

-- vim:ts=4 ht=8 sw=4
