/* ==================================================================================
    Source File		:	upgrade_v5.35.sql.exclude
    Author(s)		:	Jitendra Loyal
    Started On		:	Sat Dec 10 17:54 IST 2011
    Version			:	1.00
    Last updated	:	Dec 15, 2011
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Upgrade Script for v5.35
			..... Support for Trainee and Open Sewadars added.
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
	SET	version_no = 5.35,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

GO
USE ZSM


-- =============================================================================
-- Table controlling_sequences is dropped
-- =============================================================================

ALTER	TABLE	sequence_controlling_information
	DROP CONSTRAINT	SequenceControllingInformation_FK_SequenceID;
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'controlling_sequences' AND xtype = 'U')
	DROP	TABLE	controlling_sequences
GO

-- =============================================================================
-- Data-type for sequence_id changed from CHAR (1) to VARCHAR (3)
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSewadarRegistrationNumber' AND xtype = 'P')
	DROP PROCEDURE GetSewadarRegistrationNumber
GO

ALTER	TABLE	sequence_controlling_information
	DROP	CONSTRAINT	SequenceControllingInformation_PK_SatsangCentreID_SequenceID;
GO

ALTER	TABLE	sequence_controlling_information
	ALTER	COLUMN	sequence_id 		CHAR (1)			NOT NULL;
GO

IF EXISTS (SELECT * FROM systypes WHERE name = 'sequence_id')
	EXEC	sp_droptype	'sequence_id'
GO

EXEC	sp_addtype	'sequence_id',				'VARCHAR (3)',		'NULL'
GO

ALTER	TABLE	sequence_controlling_information
	ALTER	COLUMN	sequence_id 		sequence_id			NOT NULL;
GO

ALTER	TABLE	sequence_controlling_information
	ADD	CONSTRAINT	SequenceControllingInformation_PK_SatsangCentreID_SequenceID
			PRIMARY KEY	NONCLUSTERED	(	satsang_centre_id, sequence_id	)
GO

-- =============================================================================
-- Optional column sewa_id added to table sequence_controlling_information
-- =============================================================================

ALTER	TABLE	sequence_controlling_information
	ADD		sewa_id 		sewa_id			NULL;
GO

ALTER	TABLE	sequence_controlling_information
	ADD	CONSTRAINT	SequenceControllingInformation_FK_SewaID
		FOREIGN KEY (sewa_id)
			REFERENCES	sewas;
GO


-- =============================================================================
-- Table sewas is altered to contain two more columns
-- =============================================================================

ALTER	TABLE	sewas
	ADD	trainee_current_seq_id 		sequence_id				NULL;
GO

ALTER	TABLE	sewas
	ADD	open_sewadar_current_seq_id sequence_id				NULL;
GO

ALTER	TABLE	adt_sewas
	ADD	trainee_current_seq_id 		sequence_id				NULL;
GO

ALTER	TABLE	adt_sewas
	ADD	open_sewadar_current_seq_id sequence_id				NULL;
GO

-- =============================================================================
-- Table sewadar_types is added
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadar_types' AND xtype = 'U')
BEGIN
	DROP	TABLE	sewadar_types
	EXEC	sp_droptype	'sewadar_type'
END
GO

EXEC	sp_addtype	'sewadar_type',				'CHAR (1)',			'NULL'
GO

CREATE	TABLE	sewadar_types
(
	sewadar_type		sewadar_type	NOT NULL	CONSTRAINT	SewadarTypes_PK_SewadarType
														PRIMARY KEY	NONCLUSTERED,
	remarks				remarks				NULL,

	effective_from		DATETIME		NOT NULL	CONSTRAINT	SewadarTypes_DF_EffectiveFrom
														DEFAULT Convert (VARCHAR (11), GetDate(), 106),
	effective_till		DATETIME		NOT NULL	CONSTRAINT	SewadarTypes_DF_EffectiveTill
														DEFAULT '31-Dec-9999',

		CONSTRAINT	SewadarTypes_CK_EffectiveDates
			CHECK	(	effective_from <= effective_till	)
)
GO

EXEC 	sp_addextendedproperty
		'SewadarTypes_CK_EffectiveDates', 'The "Effective From" date cannot be later than the "Effective Till" date',
		'USER',	'dbo', 'TABLE',	'sewadar_types'
GO

INSERT INTO	sewadar_types (	sewadar_type, remarks	) VALUES (	'R', 'Regular'	);
INSERT INTO	sewadar_types (	sewadar_type, remarks	) VALUES (	'T', 'Trainee'	);
INSERT INTO	sewadar_types (	sewadar_type, remarks	) VALUES (	'O', 'Open'		);
GO

-- =============================================================================
-- Columns sewadar_type and sewa_id are added to table sewadars_registrations
-- =============================================================================

ALTER	TABLE	sewadars_registrations
	ADD	sewadar_type	sewadar_type	NOT NULL
			CONSTRAINT	SewadarsRegistrations_FK_SewadarType
				REFERENCES	sewadar_types
			CONSTRAINT	SewadarsRegistrations_DF_SewadarType
				Default	'R';
GO

ALTER	TABLE	sewadars_registrations
	ADD	sewa_id			sewa_id				NULL
			CONSTRAINT	SewadarsRegistrations_FK_SewaID
				REFERENCES	sewas;
GO

ALTER	TABLE	adt_sewadars_registrations
	ADD	sewadar_type	sewadar_type		NULL;
GO

UPDATE	adt_sewadars_registrations
	SET	sewadar_type	=	'R';
GO

ALTER	TABLE	adt_sewadars_registrations
	ALTER COLUMN	sewadar_type	sewadar_type	NOT NULL;
GO

ALTER	TABLE	adt_sewadars_registrations
	ADD	sewa_id			sewa_id				NULL;
GO

-- =============================================================================
-- Column location_district_id is added to table sewadars_registrations
-- =============================================================================

ALTER	TABLE	sewadars_registrations
	ADD	location_district_id 		district_id		NULL;
GO

ALTER	TABLE	adt_sewadars_registrations
	ADD	location_district_id 		district_id		NULL;
GO
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'sewadars_registrations_p_iu' AND xtype = 'TR')
	DROP TRIGGER sewadars_registrations_p_iu
GO

-- =============================================================================

CREATE TRIGGER sewadars_registrations_p_iu	ON	sewadars_registrations
	WITH ENCRYPTION 
		FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS	(	SELECT TOP 1 1
					FROM 	inserted i 
						LEFT OUTER JOIN	CDB..districts_or_cities	d
							ON	(	i.location_district_id	=	d.district_or_city_id	)			
					WHERE	d.district_or_city_id			IS NULL
				)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'ParameterMisMatch', NULL,'Sewadars Registrations', 'Location District ', ' not in CDB Districts'
			RETURN
		END
END
GO

-- =============================================================================
-- Setup data for two new status (New and Open)
-- =============================================================================


INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('Trn',	'Trainee',			'No', 'No'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('Open',	'Open Sewadar',		'No', 'No'	);

-- =============================================================================
---- For Local Status ---- Trn
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Trn',	'InAc'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Trn',	'Cncl'	);

---- For Local Status ---- Open
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Open',	'InAc'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Open',	'Cncl'	);

-- =============================================================================

-- vim:sw=4 ht=4 ai ts=4
