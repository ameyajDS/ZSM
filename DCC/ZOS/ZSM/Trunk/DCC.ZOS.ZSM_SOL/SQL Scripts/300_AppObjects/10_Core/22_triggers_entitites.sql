/* ==================================================================================
    Source File		:	18_trigger_b_integrity.sql
    Author(s)		:	Jitendra Loyal (JL) / Sukhdev B. Darira (SB)
    Started On		:	Sun Nov 28 01:00:00 IST 2010
    Version			:	0.02
    Last updated	:	Jun 30, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:	
    Reviewed On		:	
    ==================================================================================
									   Usage Notes
    ----------------------------------------------------------------------------------

    ==================================================================================
								      Revision History
    ----------------------------------------------------------------------------------
     JL : 30-Jun-2014
	 	* Trigger sewas_b_iu has been reviewed/corrected.
	 	* Trigger sewas_c_u and sewas_d_u have been added.
     JL : 24-Sep-2013
	 	* All triggers after raising the error, rollback the transaction.
     SB : 0.01 : 28-Nov-2010
		*  First Draft
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--	Table 	CREDIT_SPECIFICATIONS_SEWAS
--	Trigger ensures that satsang_centre_id of credit_specifications matches with that of sewas
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'credit_specifications_sewas_a_iu' AND xtype = 'TR')
	DROP TRIGGER credit_specifications_sewas_a_iu
GO

CREATE TRIGGER credit_specifications_sewas_a_iu	ON	credit_specifications_sewas
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT JOIN	credit_specifications	c
							ON 	(	i.credit_specification_id 	= 	c.credit_specification_id	)
						LEFT JOIN	sewas	s
							ON	(	i.sewa_id	=	s.sewa_id	)			
					WHERE	c.satsang_centre_id	=	s.satsang_centre_id
					AND		s.sewa_id			IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'CREDIT_SPECIFICATIONS_SEWAS', 'Satsang Centre ', 'Match'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	CREDIT_SPECIFICATIONS_SEWAS
--	Trigger ensures that 'is_exemption_considered' MUST be No when sewas.is_exemption_allowed is No
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'credit_specifications_sewas_b_iu' AND xtype = 'TR')
	DROP TRIGGER credit_specifications_sewas_b_iu
GO

CREATE TRIGGER credit_specifications_sewas_b_iu	ON	credit_specifications_sewas
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT JOIN	sewas	s
							ON	(	i.sewa_id	=	s.sewa_id	
								AND	i.is_exemption_considered	=	s.is_exemption_allowed
								)			
					WHERE	s.is_exemption_allowed	=	'No'
					AND		s.sewa_id			IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'CREDIT_SPECIFICATIONS_SEWAS', 'IS_EXEMPTION_ALLOWED ', 'No'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SUB_DEPARTMENTS
--	Trigger ensures that the departments.has_sub_departments = 'Yes'
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sub_departments_a_iu' AND xtype = 'TR')
	DROP TRIGGER sub_departments_a_iu
GO

CREATE TRIGGER sub_departments_a_iu	ON	sub_departments
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	departments	d
							ON	(	i.department_id	=	d.department_id	)			
					WHERE	d.has_sub_departments	=	'No'
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'SUB_DEPARTMENTS', 'Has Sub Departments ', 'No'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SUB_DEPARTMENTS_SATSANG_CENTRES
--	Trigger ensures that the effective_period (effective_from and effective_till) is 
--				a sub-set of the corresponding effective_period of the department.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sub_departments_satsang_centres_a_iu' AND xtype = 'TR')
	DROP TRIGGER sub_departments_satsang_centres_a_iu
GO

CREATE TRIGGER sub_departments_satsang_centres_a_iu	ON	sub_departments_satsang_centres
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sub_departments	sd
							ON	(	i.sub_department_id	= sd.sub_department_id	)
						LEFT OUTER JOIN	departments_satsang_centres	dsc
							ON	(	sd.department_id	 =	dsc.department_id	
								AND	i.effective_from	>=	dsc.effective_from
								AND	i.effective_till	<=	dsc.effective_till
								)			
					WHERE	dsc.department_id			IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'SUB_DEPARTMENTS_SATSANG_CENTRES', 'Effective Period Range', 'Subset of Resp. Departments'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	POST_OFFICES_OR_CITIES
--	Trigger ensures that the district_id exists in CDB..districts_or_cities
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'post_offices_or_cities_a_iu' AND xtype = 'TR')
	DROP TRIGGER post_offices_or_cities_a_iu
GO

CREATE TRIGGER post_offices_or_cities_a_iu	ON	post_offices_or_cities
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	CDB..districts_or_cities	d
							ON	(	i.district_id	=	d.district_or_city_id	)			
					WHERE	d.district_or_city_id			IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'POST_OFFICES_OR_CITIES', 'District ', ' Not in Main Records'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SATSANG_CENTRES_DETAILS
--	 Trigger ensures that satsang_centre_id exists in cdb..satsang_centres
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'satsang_centres_details_a_iu' AND xtype = 'TR')
	DROP TRIGGER satsang_centres_details_a_iu
GO

CREATE TRIGGER satsang_centres_details_a_iu	ON	satsang_centres_details
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	CDB..satsang_centres	s
							ON	(	i.satsang_centre_id	=	s.satsang_centre_id	)			
					WHERE	s.satsang_centre_id			IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'SATSANG_CENTRES_DETAILS', 'SATSANG_CENTRE_ID ', ' Not in Main Records'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SATSANG_CENTRE_FUNCTIONARIES
--	Trigger should ensure that only one centre_functionary for a Centre is set as current; there should NOT be two more current functionaries for a Centre.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'satsang_centre_functionaries_a_iu' AND xtype = 'TR')
	DROP TRIGGER satsang_centre_functionaries_a_iu
GO

CREATE TRIGGER satsang_centre_functionaries_a_iu	ON	satsang_centre_functionaries
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	satsang_centre_functionaries	s
							ON	(	i.satsang_centre_id	=	s.satsang_centre_id	)			
					WHERE	i.centre_functionary_id		<>	s.centre_functionary_id
					AND		i.centre_functionary		=	s.centre_functionary
					AND		i.is_current				=	'Yes'
					AND		s.is_current				=	'Yes'
					AND		s.satsang_centre_id			IS NOT NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'SATSANG_CENTRE_FUNCTIONARIES', 'Current Functionary ', ' Already Set'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SEQUENCE_CONTROLLING_INFORMATION
--	Trigger ensures that the satsang_centre_id has is_main_centre set to Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sequence_controlling_information_a_iu' AND xtype = 'TR')
	DROP TRIGGER sequence_controlling_information_a_iu
GO

CREATE TRIGGER sequence_controlling_information_a_iu	ON	sequence_controlling_information
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	satsang_centres_details	s
							ON	(	i.satsang_centre_id	=	s.satsang_centre_id	)			
					WHERE	s.is_main_centre		=	'Yes'
					AND		s.satsang_centre_id		IS  NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'SEQUENCE_CONTROLLING_INFORMATION', 'Satsang Main Centre', ' Different'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SEWAS
--	Trigger ensures that a maximum of only one Sewa for a Satsang Centre can be specified as default
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewas_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewas_a_iu
GO

CREATE TRIGGER sewas_a_iu	ON	sewas
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewas	s
							ON	(	i.satsang_centre_id	=	s.satsang_centre_id	)	
					WHERE	s.is_default_sewa		=	'Yes'
					AND		s.sewa_id				<>	i.sewa_id
					AND		i.is_default_sewa		=	'Yes'
					AND		s.satsang_centre_id		IS  NOT NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'SEWAS', 'Satsang Centre', ' Only one Default Sewa'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SEWAS
---	Trigger ensures that when computed_sewa_id is specified,
---		(a) sewa_frequency, attendance_unit, is_leave_allowed and is_exemption_allowed are same as referred sewa_id
---		(b) start_dt and finish_dt is a sub-set of referred sewa_id
---		(c) attendance_marking of referred_sewa_id can not be 'Summary'
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewas_b_iu' AND xtype = 'TR')
	DROP TRIGGER sewas_b_iu
GO

CREATE TRIGGER sewas_b_iu	ON	sewas
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewas	s
							ON	(	i.referred_sewa_id	=	s.sewa_id	)			
					WHERE	i.referred_sewa_id		IS NOT NULL
					AND		s.sewa_id				IS NOT NULL
					AND		(	i.sewa_frequency		!=	s.sewa_frequency
							OR	i.attendance_unit		!=	s.attendance_unit
							OR	i.is_leave_allowed		!=	s.is_leave_allowed
							OR	i.is_exemption_allowed	!=	s.is_exemption_allowed
							OR	i.start_dt				NOT BETWEEN	s.start_dt	AND	s.finish_dt
							OR	i.finish_dt				NOT BETWEEN	s.start_dt	AND	s.finish_dt
							OR	s.attendance_marking	=	'Summary'
							)
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'SEWAS', 'Referred Sewa Id', ' Not Valid'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SEWAS
--- Trigger ensures that the trainee_current_seq_id, when specified (or changed), does not already
--- exist for the Satsang Centre.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewas_c_u' AND xtype = 'TR')
	DROP TRIGGER sewas_c_u
GO

CREATE TRIGGER sewas_c_u	ON	sewas
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	deleted	d
							ON	(	i.sewa_id	=	d.sewa_id	)			
					WHERE	i.trainee_current_seq_id	IS NOT NULL
					AND	(	(	d.trainee_current_seq_id	IS NOT NULL
							AND	d.trainee_current_seq_id	!=	i.trainee_current_seq_id
							)
						OR	(	d.trainee_current_seq_id	IS NULL
							)
						)
					AND		EXISTS	(	SELECT	1
										FROM	sequence_controlling_information	s
										WHERE	s.satsang_centre_id	=	i.satsang_centre_id
										AND		s.sequence_id		=	i.trainee_current_seq_id
									)
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ExistInfo', NULL,'Trainee Sequence ID already', NULL, NULL
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SEWAS
--- Trigger ensures that the open_sewadar_current_seq_id, when specified (or changed), does not already
--- exist for the Satsang Centre.
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewas_d_u' AND xtype = 'TR')
	DROP TRIGGER sewas_d_u
GO

CREATE TRIGGER sewas_d_u	ON	sewas
	WITH ENCRYPTION 
		FOR UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	deleted	d
							ON	(	i.sewa_id	=	d.sewa_id	)			
					WHERE	i.open_sewadar_current_seq_id	IS NOT NULL
					AND	(	(	d.open_sewadar_current_seq_id	IS NOT NULL
							AND	d.open_sewadar_current_seq_id	!=	i.open_sewadar_current_seq_id
							)
						OR	(	d.open_sewadar_current_seq_id	IS NULL
							)
						)
					AND		EXISTS	(	SELECT	1
										FROM	sequence_controlling_information	s
										WHERE	s.satsang_centre_id	=	i.satsang_centre_id
										AND		s.sequence_id		=	i.open_sewadar_current_seq_id
									)
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ExistInfo', NULL,'Open Sewadar Sequence ID already', NULL, NULL
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SEWAS_SEWA_SHIFTS
--	Trigger ensures that shifts for a Sewa are specified for sewas.attendance_unit = 'Shift'
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewas_sewa_shifts_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewas_sewa_shifts_a_iu
GO

CREATE TRIGGER sewas_sewa_shifts_a_iu	ON	sewas_sewa_shifts
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewas	s
							ON	(	i.sewa_id	=	s.sewa_id	)			
					WHERE	s.attendance_unit		=	'Shift'
					AND		s.sewa_id				IS  NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'SEWAS_SEWA_SHIFTS', 'Attendance Unit ', ' Not in Shift'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SEWAS_PERIODS
--	Trigger ensures that periods for a Sewa are specified for sewas.attendance_marking IN ('Team-wise', 'Arbitrary')
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewas_periods_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewas_periods_a_iu
GO

CREATE TRIGGER sewas_periods_a_iu	ON	sewas_periods
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewas	s
							ON	(	i.sewa_id	=	s.sewa_id	)			
					WHERE	s.attendance_marking	NOT IN ('Team-wise', 'Arbitrary')
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'Sewa Period', 'Attendance marking ', 'either Team-wise or Arbitrary'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SEWAS_PERIODS
--	Trigger ensures that periods for a Sewa are contained between start_dt/finish_dt of the sewa
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewas_periods_b_iu' AND xtype = 'TR')
	DROP TRIGGER sewas_periods_b_iu
GO

CREATE TRIGGER sewas_periods_b_iu	ON	sewas_periods
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						JOIN	sewas	s
							ON	(	i.sewa_id	=	s.sewa_id	)			
					WHERE	s.start_dt  > i.start_dt
					OR		s.finish_dt < i.finish_dt
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', NULL, 'Sewa Period Start / Finish date', 'within the sewa''s Start and Finish date', NULL
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SEWAS_PERIODS
--	Trigger ensures that periods for a Sewa are non-overlapping
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewas_periods_c_iu' AND xtype = 'TR')
	DROP TRIGGER sewas_periods_c_iu
GO

CREATE TRIGGER sewas_periods_c_iu	ON	sewas_periods
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT	TOP 1 1
					FROM 	inserted i
						JOIN	sewas_periods	sp
							ON	(	i.sewa_id	=	sp.sewa_id
								AND	i.start_dt	!=	sp.start_dt
								)
					WHERE	i.start_dt	BETWEEN sp.start_dt AND sp.finish_dt
					OR		i.finish_dt	BETWEEN sp.start_dt AND sp.finish_dt
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectCannotBe', NULL, 'Sewa Periods', 'overlapping', NULL
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SEWA_EXEMPTIONS_APPLICABLE_SEWAS
--	Trigger ensures that the sewa.attendance_marking != Computed
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewa_exemptions_applicable_sewas_a_iu' AND xtype = 'TR')
	DROP TRIGGER sewa_exemptions_applicable_sewas_a_iu
GO

CREATE TRIGGER sewa_exemptions_applicable_sewas_a_iu	ON	sewa_exemptions_applicable_sewas
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewas	s
							ON	(	i.sewa_id	=	s.sewa_id	)			
					WHERE	s.attendance_marking	<>	'Computed'
					AND		s.sewa_id				IS  NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL, 'sewa_exemptions_applicable_sewas', 'Attendance Marking', ' Is Computed'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================
--	Table 	SEWA_EXEMPTIONS_APPLICABLE_SEWAS
--Trigger ensures that the exemption_days are ONLY specified when sewa_exemptions.is_computed = Yes
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewa_exemptions_applicable_sewas_b_iu' AND xtype = 'TR')
	DROP TRIGGER sewa_exemptions_applicable_sewas_b_iu
GO

CREATE TRIGGER sewa_exemptions_applicable_sewas_b_iu	ON	sewa_exemptions_applicable_sewas
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	sewa_exemptions	s
							ON	(	i.sewa_exemption_id		=	s.sewa_exemption_id	)			
					WHERE	i.exemption_days		IS NOT NULL
					AND		s.is_computed			=	'Yes'
					AND		s.sewa_exemption_id		IS  NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'SEWA_EXEMPTIONS_APPLICABLE_SEWAS', 'Exemption Days Computed', ' Yes'
			ROLLBACK
			RETURN
		END
END
GO

-- =============================================================================

-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console

