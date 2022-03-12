/* ==================================================================================
    Source File		:	upgrade_v5.65.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	13 Mar, 2013
    Last updated	:	
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.65
				....
		
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
	SET	version_no = 5.65,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

CREATE	TABLE	tmp_bulk_registrations
(
	name				VARCHAR (100)		NOT NULL,
	gender 				CHAR (1)			NOT NULL,
	is_local_sewadar	CHAR (1)			NOT NULL,
	photo_id			VARCHAR (20)		NOT NULL,
	department_nm		gnc_nm				NOT NULL,
	sub_department_nm	gnc_nm					NULL,
	telephone_mobile	telephone_lines			NULL,
    birth_dtm			SMALLDATETIME		NOT NULL,
	occupation			gnc_nm				NOT NULL,
	first_nm 			name_part				NULL,
	middle_nm 			name_part				NULL,
	last_nm 			name_part				NULL,
	department_id		department_id			NULL,
	sub_department_id	department_id			NULL,
	sewadar_id			sewadar_id				NULL,

		CONSTRAINT	TmpBulkRegistrations_PK_NameGenderDOB
			PRIMARY KEY	NONCLUSTERED	(	name, gender, birth_dtm )
)

GO
-- =============================================================================
