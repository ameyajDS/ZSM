/* ==================================================================================
    Source File		:	upgrade_v5.71.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	09 Jan, 2014
    Last updated	:	10 Jan, 2014
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.71
			.... Support for invalidating the undesired sewa shift combinations added.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		10-Jan-2014 : JL
			* Table changed from storing invalid combinations to valid combinations.
   ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

USE SysAdmin
GO

UPDATE packages
	SET	version_no = 5.71,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'
GO

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO


-- =============================================================================
-- NOTE. This table stores the VALID combinations of sewas_sewa_shifts
--	A trigger arbitrary_shift_presences_j_iu catches the INVALID combination, and prevents the entry in table arbitrary_shift_presences.
-- =============================================================================
CREATE	TABLE sewa_shifts_valid_combinations
(
	sewa_id					sewa_id				NOT NULL,
	recorded_sewa_shift		sewa_shift			NOT NULL,
	recording_sewa_shift	sewa_shift			NOT NULL,
	
		CONSTRAINT	SewaShiftsValidCombinations_PK_SewaID_RecordedSewaShift_RecordingSewaShift
			PRIMARY KEY	CLUSTERED	(	sewa_id, recorded_sewa_shift, recording_sewa_shift	),
			
		CONSTRAINT 	SewaShiftsValidCombinations_FK_SewaID_RecordedSewaShift
			FOREIGN KEY	(	sewa_id, recorded_sewa_shift	)
				REFERENCES	sewas_sewa_shifts,
				
		CONSTRAINT 	SewaShiftsValidCombinations_FK_SewaID_RecordingSewaShift
			FOREIGN KEY	(	sewa_id, recording_sewa_shift	)
				REFERENCES sewas_sewa_shifts
)
GO

-- Audit table
-- =============================================================================

CREATE	TABLE adt_sewa_shifts_valid_combinations
(
 	audit_log_id			audit_log_id		NOT NULL	CONSTRAINT	AdtSewaShiftsValidCombinations_FK_AuditLogId
																REFERENCES	audit_logs,
	sewa_id					sewa_id				NOT NULL,
	recorded_sewa_shift		sewa_shift			NOT NULL,
	recording_sewa_shift	sewa_shift			NOT NULL,
	
		CONSTRAINT	AdtSewaShiftsValidCombinations_PK_AuditLogID_SewaID_RecordedSewaShift_RecordingSewaShift
			PRIMARY KEY	CLUSTERED	(	audit_log_id, sewa_id, recorded_sewa_shift, recording_sewa_shift	)
)
GO

-- =============================================================================
---	TRIGGER  to ensure that only allowable sewa_shift combinations are permitted
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'arbitrary_shift_presences_j_iu' AND xtype = 'TR')
	DROP TRIGGER arbitrary_shift_presences_j_iu
GO

CREATE TRIGGER arbitrary_shift_presences_j_iu ON arbitrary_shift_presences
	WITH ENCRYPTION
		FOR INSERT, UPDATE
AS
BEGIN
	IF	NOT EXISTS	(	SELECT	TOP 1 1
						FROM 	inserted i
							JOIN arbitrary_shift_presences	p
								ON 	( 	i.sewa_id		=	p.sewa_id
									AND	i.sewadar_grno	=	p.sewadar_grno
									AND	i.presence_dt	=	p.presence_dt
									)
							JOIN sewa_shifts_valid_combinations	c
								ON	(	i.sewa_id		=	c.sewa_id
									AND	p.sewa_shift	=	c.recorded_sewa_shift
									AND	i.sewa_shift	=	c.recording_sewa_shift
									)
					)
	AND	EXISTS	(	SELECT	TOP 1 1
					FROM 	inserted i
						JOIN arbitrary_shift_presences	p
							ON 	( 	i.sewa_id		=	p.sewa_id
								AND	i.sewadar_grno	=	p.sewadar_grno
								AND	i.presence_dt	=	p.presence_dt
								AND	i.sewa_shift	!=	p.sewa_shift
								)
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ObjectValidity', 'Another Shift on same day', 'as per the allowable Shift Combinations', NULL, NULL
			RETURN
		END
END
GO
-- =============================================================================

DECLARE	@valid_combinations	TABLE
(
	sewa_id					INT				NOT NULL,
	recorded_sewa_shift		VARCHAR (15)	NOT NULL,
	recording_sewa_shift	VARCHAR (15)	NOT NULL,
	
		PRIMARY KEY	(	sewa_id, recorded_sewa_shift, recording_sewa_shift	)
);

			--- Mumbai 2011
INSERT INTO	@valid_combinations	VALUES	(	60,			'8am - 1pm (1)',	'2pm - 6.30pm(3)'	);
INSERT INTO	@valid_combinations	VALUES	(	60,			'2pm - 6.30pm(3)',	'8am - 1pm (1)'		);

			--- Mumbai 2012
INSERT INTO	@valid_combinations	VALUES	(	67,			'8am - 1pm (1)',	'2pm - 6.30pm(3)'	);
INSERT INTO	@valid_combinations	VALUES	(	67,			'2pm - 6.30pm(3)',	'8am - 1pm (1)'		);

			--- Mumbai 2013-14
INSERT INTO	@valid_combinations	VALUES	(	89,			'8am - 1pm (1)',	'2pm - 6.30pm(3)'	);
INSERT INTO	@valid_combinations	VALUES	(	89,			'2pm - 6.30pm(3)',	'8am - 1pm (1)'		);


			--- Nagpur 2012-13
INSERT INTO	@valid_combinations	VALUES	(	100000001,	'8am - 1pm (1)',	'2pm - 6.30pm(3)'	);
INSERT INTO	@valid_combinations	VALUES	(	100000001,	'2pm - 6.30pm(3)',	'8am - 1pm (1)'		);

			--- Nagpur 2013-14
INSERT INTO	@valid_combinations	VALUES	(	100000010,	'7am - 12noon(1)',	'2pm - 6.30pm(3)'	);
INSERT INTO	@valid_combinations	VALUES	(	100000010,	'2pm - 6.30pm(3)',	'7am - 12noon(1)'	);

			--- Kolkata
			--- A person can do only one shift per day out the three shifts, viz., '8am - 1pm (1)', '8am - 6.30pm(2)', or Short Shift.

			--- Indore 2013
INSERT INTO	@valid_combinations	VALUES	(	120000007,	'9am - 1pm (1)',	'2pm - 6pm(3)'		);
INSERT INTO	@valid_combinations	VALUES	(	120000007,	'2pm - 6pm(3)',		'9am - 1pm (1)'		);

INSERT INTO	sewa_shifts_valid_combinations
	SELECT	a.*
	FROM	@valid_combinations	a
		JOIN	sewas	s
			ON	(	s.sewa_id	=	a.sewa_id	);

GO
-- =============================================================================

