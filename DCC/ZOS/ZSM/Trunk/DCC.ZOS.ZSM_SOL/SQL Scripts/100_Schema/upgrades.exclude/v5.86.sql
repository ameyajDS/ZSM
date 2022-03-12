/* ==================================================================================
    Source File		:	upgrade_v5.86.sql
    Author(s)		:	Jiten
    Started On		:	18 Nov, 2016
    Last updated	:	18 Nov, 2016
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
	SET	version_no = 5.86,
		version_dt = GetDate()
WHERE	package_id = 'ZSM'

-- =============================================================================
--		ZSM changes
-- =============================================================================

USE ZSM
GO


-- =============================================================================
-- DataType	SewadarRegistrationType
-- =============================================================================
CREATE	TYPE	SewadarRegistrationType	AS	TABLE
(
	name				VARCHAR (100),
	gender				VARCHAR (10),
	is_local_sewadar 	VARCHAR (10),
	photo_id 			VARCHAR (20),
	department			VARCHAR (100),
	sub_department 		VARCHAR (100),
	mobile				VARCHAR (50),
	date_of_birth		SMALLDATETIME,
	occupation			VARCHAR (20),
	to_be_registered	VARCHAR (10),
	appointment_year	VARCHAR (10),
	old_grno			VARCHAR (10)
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


--	====================================================================================================
--		Tables for Fingerprint Scanning
--	====================================================================================================
CREATE	TABLE	sewas_fp_controlling_dates
(
	controlling_id		INTEGER				NOT NULL	IDENTITY (1, 1)
														CONSTRAINT	SewasFPControllingDates_PK_ControllingID
															PRIMARY KEY	NONCLUSTERED,

		--- Trigger ensures that a row is neither updated, inserted or deleted if sewa is locked(Trigger a & b)
	sewa_id				sewa_id				NOT NULL	CONSTRAINT	SewasFPControllingDates_FK_SewaID
															REFERENCES	sewas,

	start_dt			DATE				NOT	NULL,
	end_dt				DATE				NOT	NULL,

	processing_dtm		DATETIME			NOT	NULL,

	shift_1_cnt			SMALLINT				NULL,		--- Half day ... 1st half
	shift_2_cnt			SMALLINT				NULL,		--- Full day
	shift_3_cnt			SMALLINT				NULL,		--- Half day ... 2nd half

		CONSTRAINT	SewasFPControllingDates_UK_SewaID_StartDate
			UNIQUE	CLUSTERED	(	sewa_id, start_dt	),

		CONSTRAINT	SewasFPControllingDates_FK_StartDate_EndDate
			CHECK	(	start_dt <= end_dt	)

)
GO

	------------------------------------------------------------------------------------------------------
	-- This table contains the erroneous records, which could not be processed.
	------------------------------------------------------------------------------------------------------

CREATE	TABLE	scanned_fingerprints
(
	controlling_id			INTEGER				NOT NULL	CONSTRAINT	ScannedFingerPrints_FK_ControllingID
																REFERENCES	sewas_fp_controlling_dates,

	sewadar_id				sewadar_id			NOT	NULL	CONSTRAINT	ScannedFingerPrints_FK_SewadarID
																REFERENCES	sewadars,
	scanned_dtm				DATETIME			NOT	NULL,
	
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno for the SewadarID.(Trigger b)
	satsang_centre_id 		satsang_centre_id		NULL,
	sewadar_grno			sewadar_grno			NULL,

	remarks					VARCHAR (200)			NULL,

		CONSTRAINT	ScannedFingerPrints_PK_SewadarID_ScannedDateTime
			PRIMARY KEY	NONCLUSTERED	(	sewadar_id, scanned_dtm 	),

		CONSTRAINT	ScannedFingerPrints_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno 	)
				REFERENCES	sewadars_registrations
)
GO


-- =============================================================================
--	This is a replica of scanned_fingerprints and records are preserved here for posterity, if required by the Processing Procedure.
--	Currently, the data in this table is not accessible through any screen(s) or report(s).

-- This table contains the processed records
-- =============================================================================

CREATE	TABLE	scanned_fingerprints_store
(
	controlling_id			INTEGER				NOT NULL	CONSTRAINT	ScannedFingerPrintsStore_FK_ControllingID
																REFERENCES	sewas_fp_controlling_dates,

	sewadar_id				sewadar_id			NOT	NULL	CONSTRAINT	ScannedFingerPrintsStore_FK_SewadarID
																REFERENCES	sewadars,
	scanned_dtm				DATETIME			NOT	NULL,
	
		--- Trigger ensures that (current_satsang_centre_id, current_sewadar_grno) matches with satsang_centre_id, sewadar_grno for the SewadarID.(Trigger b)
	satsang_centre_id 		satsang_centre_id	NOT	NULL,
	sewadar_grno			sewadar_grno		NOT	NULL,
	sewa_shift				sewa_shift			NOT NULL,
	is_start				BIT					NOT NULL,

		CONSTRAINT	ScannedFingerPrintsStore_PK_SewadarID_ScannedDateTime
			PRIMARY KEY	NONCLUSTERED	(	sewadar_id, scanned_dtm 	),

		CONSTRAINT	ScannedFingerPrintsStore_FK_SatsangCentreID_SewadarGRNo
			FOREIGN KEY	(	satsang_centre_id, sewadar_grno 	)
				REFERENCES	sewadars_registrations
)
GO




-- =============================================================================
--	Information Code and Values for Processing Fingerprint Scanned Data
-- =============================================================================

DELETE
FROM	system_information_values
WHERE	system_info_cd	IN	(	'MinHalfDayMin', 'MinFullDayMin', 'CutOff2ndHalf', 'SundayShiftSq', 'EntryBeginHrs', 'ExitEndHrs', 'SunChkOutAftr'	
							);

DELETE
FROM	system_information_codes
WHERE	system_info_cd	IN	(	'MinHalfDayMin', 'MinFullDayMin', 'CutOff2ndHalf', 'SundayShiftSq', 'EntryBeginHrs', 'ExitEndHrs', 'SunChkOutAftr'	
							);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'MinHalfDayMin',	'Minimum minutes for Half Day');
																								 --					 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int		)	VALUES 	(	'MinHalfDayMin',	180	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'MinFullDayMin',	'Minimum minutes for Full Day');
																								 --					 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int		)	VALUES 	(	'MinFullDayMin',	360	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm,
																		remarks	)	VALUES 	(	'EntryBeginHrs',	'Entry begins at specified hrs',
																								'For scanning of Fingerprints, data is considered starting from this hour'
																							);
																								 --					 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int		)	VALUES 	(	'EntryBeginHrs',	0730	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm,
																		remarks	)	VALUES 	(	'ExitEndHrs',		'Exit ends at specified hrs',
																								'For scanning of Fingerprints, data is considered till this hour'
																							);
																								 --					 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int		)	VALUES 	(	'ExitEndHrs',		2031	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'CutOff2ndHalf',	'Cut-off hours for 2nd Half Day');
																								 --					 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int		)	VALUES 	(	'CutOff2ndHalf',	0931	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SundayShiftSq',	'Shift Sequence for Sundays');
																								 --					 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int		)	VALUES 	(	'SundayShiftSq',	3	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm,
																		remarks	)	VALUES 	(	'SunChkOutAftr',	'Sunday CheckOut after thisHour',
																													'Sunday attendance is considered if Check-out is done on or after the specified hours here'
																							);
																								 --					 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int		)	VALUES 	(	'SunChkOutAftr',	1700	);

-- =============================================================================

-- vim:ts=4 ht=8 sw=4
