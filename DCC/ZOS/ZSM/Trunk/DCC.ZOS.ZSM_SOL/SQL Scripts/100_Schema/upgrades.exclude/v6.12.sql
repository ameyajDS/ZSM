/* ==================================================================================
    Source File		:	v6.12.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Wed Feb 12 20:39 IST 2020
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v6.12
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
	SET	version_no = 6.12,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================

ALTER	TABLE	sewadar_applications
	ALTER	COLUMN	area_secretary_centre_id		satsang_centre_id			NULL
GO
ALTER	TABLE	sewadar_applications
	ALTER	COLUMN	area_secretary_grno				sewadar_grno				NULL
GO
ALTER	TABLE	sewadar_applications
	ALTER	COLUMN	secretary_centre_id				satsang_centre_id			NULL
GO
ALTER	TABLE	sewadar_applications
	ALTER	COLUMN	secretary_grno					sewadar_grno				NULL
GO
ALTER	TABLE	sewadar_applications
	ALTER	COLUMN	sponsorer_centre_id				satsang_centre_id			NULL
GO
ALTER	TABLE	sewadar_applications
	ALTER	COLUMN	sponsorer_grno					sewadar_grno				NULL
GO

ALTER	TABLE	sewadar_applications
	DROP	CONSTRAINT	SewadarApplications_CK_OutstationSewadar_AreaSecretary_AreaSecretaryID_AreaSecretaryName
GO

ALTER	TABLE	sewadar_applications
	ADD	CONSTRAINT	SewadarApplications_CK_OutstationSewadar_AreaSecretary_AreaSecretaryID_AreaSecretaryName
			CHECK	(	(	is_outstation_sewadar	=	'Yes'	AND	area_secretary_id	IS		NULL	AND	area_secretary_centre_id	IS	NOT	NULL	AND	area_secretary_grno	IS	NOT	NULL	AND	area_secretary_nm	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	area_secretary_id	IS	NOT	NULL	AND	area_secretary_centre_id	IS	NOT	NULL	AND	area_secretary_grno	IS	NOT	NULL	AND	area_secretary_nm	IS		NULL	)
					OR	(	is_outstation_sewadar	=	'No'	AND	area_secretary_id	IS		NULL	AND	area_secretary_centre_id	IS		NULL	AND	area_secretary_grno	IS		NULL	AND	area_secretary_nm	IS		NULL	)
					)
GO

ALTER	TABLE	sewadar_applications
	DROP	CONSTRAINT	SewadarApplications_CK_OutstationSewadar_Secretary_SecretaryID_SecretaryName
GO

ALTER	TABLE	sewadar_applications
	ADD	CONSTRAINT	SewadarApplications_CK_OutstationSewadar_Secretary_SecretaryID_SecretaryName
			CHECK	(	(	is_outstation_sewadar	=	'Yes'	AND	secretary_id	IS		NULL	AND	secretary_centre_id	IS	NOT	NULL	AND	secretary_grno	IS	NOT	NULL	AND	secretary_nm	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	secretary_id	IS	NOT	NULL	AND	secretary_centre_id	IS	NOT	NULL	AND	secretary_grno	IS	NOT	NULL	AND	secretary_nm	IS		NULL	)
					OR	(	is_outstation_sewadar	=	'No'	AND	secretary_id	IS		NULL	AND	secretary_centre_id	IS		NULL	AND	secretary_grno	IS		NULL	AND	secretary_nm	IS		NULL	)
					)
GO

ALTER	TABLE	sewadar_applications
	DROP	CONSTRAINT	SewadarApplications_CK_LocalSewadar_SponsorerApprover_SewadarID_SponsorerName_SponsorerDepartment
GO

ALTER	TABLE	sewadar_applications
	ADD	CONSTRAINT	SewadarApplications_CK_LocalSewadar_SponsorerApprover_SewadarID_SponsorerName_SponsorerDepartment
			CHECK	(	(	is_outstation_sewadar	=	'No'	AND	sponsorer_id	IS		NULL	AND	sponsorer_centre_id	IS	NOT	NULL	AND	sponsorer_grno	IS	NOT	NULL	AND	sponsorer_nm	IS	NOT	NULL	AND	sponsorer_department	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'No'	AND	sponsorer_id	IS	NOT	NULL	AND	sponsorer_centre_id	IS	NOT	NULL	AND	sponsorer_grno	IS	NOT	NULL	AND	sponsorer_nm	IS		NULL	AND	sponsorer_department	IS		NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	sponsorer_id	IS		NULL	AND	sponsorer_centre_id	IS		NULL	AND	sponsorer_grno	IS		NULL	AND	sponsorer_nm	IS		NULL	AND	sponsorer_department	IS		NULL	)
					)
GO

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
