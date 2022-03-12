/* ==================================================================================
    Source File		:	upgrade_v5.69.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	17 Sep, 2013
    Last updated	:	24 Sep, 2013
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.69
				....
		
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		24-Sep-2013 : JL
			* System code added for earliest Year of Appointment that can be used in Bulk Registration.
			* Column appointment_year added in table tmp_bulk_registrations.
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 5.69,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO

ALTER	TABLE	sewas
	DROP	CONSTRAINT	Sewas_CK_AttendanceMarking_SummaryTs_DeleteTs_LockedDtm;
GO

ALTER	TABLE	sewas
	ADD	CONSTRAINT	Sewas_CK_AttendanceMarking_SummaryTs_DeleteTs_LockedDtm
			CHECK	(	(	deleted_ts	IS NULL		)
					OR	(	deleted_ts	IS NOT NULL	AND	attendance_marking	IN	(	'Arbitrary', 'Team-wise', 'Computed'	)
													AND	summary_ts	IS NOT NULL
													AND	summary_ts	<	deleted_ts
													AND	locked_dtm	IS NOT NULL
						)
					);
GO


ALTER	TABLE	tmp_bulk_registrations
	ADD	old_grno			VARCHAR (10)			NULL;
GO

-- =============================================================================

	--- Following System Code is used for defining the earliest appointment year that can be allowed in bulk registration.
	--- For example, for Raipur, earliest appointment year is 2008.
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm, remarks	)
									VALUES 	(	'YOABlkRgst',	'Earliest YOA', 'Earliest Year of Appointment that is allowed in Bulk Registration');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'YOABlkRgst',	2008	);

-- ===========================================================================================

ALTER	TABLE	tmp_bulk_registrations
	ADD	appointment_year	SMALLINT	NULL;
GO

-- ===========================================================================================

