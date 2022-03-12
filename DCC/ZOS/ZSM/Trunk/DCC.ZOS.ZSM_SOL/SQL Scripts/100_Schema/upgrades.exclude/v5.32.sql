/* ==================================================================================
    Source File		:	upgrade_v5.32.sql.exclude
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat Dec 10 18:01 IST 2011
    Version			:	1.00
    Last updated	:	Dec 10, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.32
			..... Dropping constraints from Sewadars_registrations table to facilitate
					(a) changing from local to outstation sewadars and vice versa without
					specifying the respective designatories which are usually required, and,
					(b) to facilitate Open and Trainee Sewadars support at a later date.
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
	SET	version_no = 5.32,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================

ALTER	TABLE	sewadars_registrations
	DROP	CONSTRAINT	SewadarsRegistrations_CK_AppointmentDt_DepartmentDt;

ALTER	TABLE	sewadars_registrations
	DROP	CONSTRAINT	SewadarsRegistrations_CK_AppointmentDt_SewadarStatusDt;

ALTER	TABLE	sewadars_registrations
	DROP	CONSTRAINT	SewadarsRegistrations_CK_AppointmentDt_ResponsibilityDt;

ALTER	TABLE	sewadars_registrations
	DROP	CONSTRAINT	SewadarsRegistrations_CK_Responsibility_ResponsibilityDt;

ALTER	TABLE	sewadars_registrations
	DROP	CONSTRAINT	SewadarsRegistrations_CK_Reference1Information;

ALTER	TABLE	sewadars_registrations
	DROP	CONSTRAINT	SewadarsRegistrations_CK_Reference2Information;

ALTER	TABLE	sewadars_registrations
	DROP	CONSTRAINT	SewadarsRegistrations_CK_SponsorerID_IsOutstationSewadar;

ALTER	TABLE	sewadars_registrations
	DROP	CONSTRAINT	SewadarsRegistrations_CK_AreaSecretaryID_IsOutstationSewadar;

ALTER	TABLE	sewadars_registrations
	DROP	CONSTRAINT	SewadarsRegistrations_CK_SecretaryID_IsOutstationSewadar;

ALTER	TABLE	sewadars_registrations
	DROP	CONSTRAINT	SewadarsRegistrations_CK_WeeklySewaLocationID_WeeklyDeparmentID;

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
