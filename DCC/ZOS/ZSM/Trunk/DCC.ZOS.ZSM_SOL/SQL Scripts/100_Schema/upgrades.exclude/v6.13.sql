/* ==================================================================================
    Source File		:	v6.13.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Wed Aug 24 11:07 IST 2020
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v6.13
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
	SET	version_no = 6.13,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================


ALTER	TABLE	sewadar_applications
	DROP	CONSTRAINT	SewadarApplications_CK_OutstationSewadar_AreaSecretary_AreaSecretaryID_AreaSecretaryName
GO

ALTER	TABLE	sewadar_applications
	ADD	CONSTRAINT	SewadarApplications_CK_OutstationSewadar_AreaSecretary_AreaSecretaryID_AreaSecretaryName
			CHECK	(	(	is_outstation_sewadar	=	'Yes'	AND	area_secretary_id	IS		NULL	AND	area_secretary_centre_id	IS	NOT	NULL	AND	area_secretary_grno	IS	NOT	NULL	AND	area_secretary_nm	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	area_secretary_id	IS	NOT	NULL	AND	area_secretary_centre_id	IS		NULL	AND	area_secretary_grno	IS		NULL	AND	area_secretary_nm	IS		NULL	)
					OR	(	is_outstation_sewadar	=	'No'	AND	area_secretary_id	IS		NULL	AND	area_secretary_centre_id	IS		NULL	AND	area_secretary_grno	IS		NULL	AND	area_secretary_nm	IS		NULL	)
					)
GO

ALTER	TABLE	sewadar_applications
	DROP	CONSTRAINT	SewadarApplications_CK_OutstationSewadar_Secretary_SecretaryID_SecretaryName
GO

ALTER	TABLE	sewadar_applications
	ADD	CONSTRAINT	SewadarApplications_CK_OutstationSewadar_Secretary_SecretaryID_SecretaryName
			CHECK	(	(	is_outstation_sewadar	=	'Yes'	AND	secretary_id	IS		NULL	AND	secretary_centre_id	IS	NOT	NULL	AND	secretary_grno	IS	NOT	NULL	AND	secretary_nm	IS	NOT	NULL	)
					OR	(	is_outstation_sewadar	=	'Yes'	AND	secretary_id	IS	NOT	NULL	AND	secretary_centre_id	IS		NULL	AND	secretary_grno	IS		NULL	AND	secretary_nm	IS		NULL	)
					OR	(	is_outstation_sewadar	=	'No'	AND	secretary_id	IS		NULL	AND	secretary_centre_id	IS		NULL	AND	secretary_grno	IS		NULL	AND	secretary_nm	IS		NULL	)
					)
GO

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
