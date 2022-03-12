/* ==================================================================================
	Source File		:	setup_data.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Fri Nov 12 15:23 IST 2010
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	09-Jan-2013
	Reviewed By		:
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------

	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
     JL : 09-Jan-2013
		*  Scanning Job Type name changed from BadgeTracking to Reducing List and default System Information Code for
		   Status removed because the Status Code is for Badges Tracking.
     JL : 08-Jan-2013
		*  Scanning Job Type BadgeTracking added.
     JL : 21-Apr-2012
		*  Remark Type "Old G.R.No." added.
     JL : 12-Jan-2012
		*  Setup data for Badge Template ConstSB changed to set are_outstation_sewadars_allowed as No.
     JL : 17, 18-Dec-2011
		*  Setup data for Badge Template TraineeSB added.
     JL : 11, 15-Dec-2011
		*  Setup data for Status (Trn and Open) has been added.
		*  Setup data for table controlling_sequences has been removed as the table is dropped.
		*  Setup data for table sewadar_types has been added.
     JL : 12-23-Nov-2010
		*   Initial versions
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--	Centre's Functionaries
-- =============================================================================

INSERT INTO	centre_functionaries (	centre_functionary	 ) VALUES (	'Area Secretary'	);
INSERT INTO	centre_functionaries (	centre_functionary	 ) VALUES (	'Secretary'			);

-- =============================================================================
--	Attendance Units; other units like Duration and Hours are not supported initially.
-- =============================================================================

INSERT INTO	attendance_units (	attendance_unit	 ) VALUES (	'Day'	);
INSERT INTO	attendance_units (	attendance_unit	 ) VALUES (	'Shift'	);

-- =============================================================================
--	Sewa Frequencies; other frequencies like Weekly and Monthly are not supported initially.
-- =============================================================================

INSERT INTO	sewa_frequencies (	sewa_frequency	 ) VALUES (	'Daily'	);
INSERT INTO	sewa_frequencies (	sewa_frequency	 ) VALUES (	'Arbitrary'	);

-- =============================================================================
--	Sewa Shifts
-- =============================================================================

INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'8am - 1pm (1)',	5	);
INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'8am - 6.30pm(2)',	6	);
INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'2pm - 6.30pm(3)',	7	);

INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'9am - 6pm(2)',		8	);
INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'2pm - 6pm(3)',		9	);
INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'9am - 6pm(Sun)',	10	);

INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'7am - 12noon(1)',	11	);

INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'Short Shift',		12	);

INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'Morning',		13	);
INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'Day',			14	);
INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'Afternoon',	15	);
INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'Evening',		16	);
INSERT INTO	sewa_shifts	(	sewa_shift, sewa_shift_sq	)	VALUES	(	'Night',		17	);

-- =============================================================================
--	Status of Sewadar
-- =============================================================================

INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('Perm',	'Permanent',		'No', 'No'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('Temp',	'Temporary',		'No', 'No'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('NI',	'Non-Initiate',		'No', 'No'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple, remarks) VALUES ('Retd',	'Retired',			'No', 'No', 'Sewadars who are eligible for Parshad'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('UnFt',	'Un-fit',			'No', 'No'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple, remarks) VALUES ('Left',	'Left',				'No', 'Yes', 'When Sewadar has left Sewa like acquiring Retirement Age, not able to take out time, etc.'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple, remarks) VALUES ('Shft',	'Shifted',			'No', 'Yes', 'When Sewadar has moved to another centre; he may get benefit of previous sewa records'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('InAc',	'In-active',		'No', 'Yes'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('Cncl',	'Cancelled',		'No', 'Yes'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('WL',	'Wait-listed',		'No', 'No'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('Trn',	'Trainee',			'No', 'No'	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('Open',	'Open Sewadar',		'No', 'No'	);

INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('BNR',	'Badge Not Returned','Yes', NULL	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('Exp',	'Expired',			'Yes', NULL	);
INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple		 ) VALUES ('Susp',	'Suspended',		'Yes', NULL	);

INSERT INTO	sewadar_status (sewadar_status_cd, sewadar_status_nm, is_global, is_multiple, remarks, effective_from, effective_till		 )
					VALUES ('TS',	'Transfer Sought',			'No', 		'Yes',	'Kept only for old data',	'01-Jan-2000',	'31-Dec-2009'	);

-- =============================================================================
--	Valid Transitions for Status of Sewadar
-- =============================================================================

---- For Global Status
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	NULL,	'BNR'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'BNR',	NULL	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'BNR',	'Exp'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'BNR',	'Susp'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	NULL,	'Susp'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Susp',	NULL	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Susp',	'BNR'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Susp',	'Exp'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	NULL,	'Exp'	);

---- For Local Status ---- Temp
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Temp',	'Perm'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Temp',	'NI'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Temp',	'UnFt'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Temp',	'Left'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Temp',	'Shft'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Temp',	'InAc'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Temp',	'Cncl'	);

---- For Local Status ---- Perm
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Perm',	'Temp'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Perm',	'NI'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Perm',	'UnFt'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Perm',	'Left'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Perm',	'Shft'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Perm',	'InAc'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Perm',	'Cncl'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Perm',	'Retd'	);

---- For Local Status ---- NI
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'NI',	'Perm'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'NI',	'Temp'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'NI',	'UnFt'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'NI',	'Left'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'NI',	'Shft'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'NI',	'InAc'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'NI',	'Cncl'	);

---- For Local Status ---- UnFt
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'UnFt',	'Perm'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'UnFt',	'Temp'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'UnFt',	'Left'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'UnFt',	'Shft'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'UnFt',	'InAc'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'UnFt',	'Cncl'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'UnFt',	'Retd'	);

---- For Local Status ---- Left
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Left',	'Perm'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Left',	'Temp'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Left',	'Shft'	);

---- For Local Status ---- Shft
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Shft',	'Perm'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Shft',	'Temp'	);

---- For Local Status ---- InAc
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'InAc',	'Perm'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'InAc',	'Temp'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'InAc',	'Cncl'	);

---- For Local Status ---- Canc   ..... no transitions possible from Cancelled

---- For Local Status ---- Retd
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Retd',	'Perm'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Retd',	'Temp'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Retd',	'Left'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Retd',	'Shft'	);

---- For Local Status ---- Trn
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Trn',	'InAc'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Trn',	'Cncl'	);

---- For Local Status ---- Open
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Open',	'InAc'	);
INSERT INTO	sewadar_status_valid_transitions (	old_sewadar_status_cd, new_sewadar_status_cd	) VALUES (	'Open',	'Cncl'	);

-- =============================================================================
--	Address Proofs that are permitted
-- =============================================================================

INSERT INTO	address_proofs (	address_proof, address_proof_sq	) VALUES (	'Passport',			1	);
INSERT INTO	address_proofs (	address_proof, address_proof_sq	) VALUES (	'Ration Card',		2	);
INSERT INTO	address_proofs (	address_proof, address_proof_sq	) VALUES (	'Voter''s Card',	3	);
INSERT INTO	address_proofs (	address_proof, address_proof_sq	) VALUES (	'Purchase deed',	4	);
INSERT INTO	address_proofs (	address_proof, address_proof_sq	) VALUES (	'Rent Agreement',	5	);
INSERT INTO	address_proofs (	address_proof, address_proof_sq	) VALUES (	'Sr Citizen	Card',	6	);
INSERT INTO	address_proofs (	address_proof, address_proof_sq	) VALUES (	'Property Tax',		7	);
INSERT INTO	address_proofs (	address_proof, address_proof_sq	) VALUES (	'Society Receipt',	8	);
INSERT INTO	address_proofs (	address_proof, address_proof_sq	) VALUES (	'Aadhaar UID'	,	9	);

-- =============================================================================
--	Address Types that are permitted
-- =============================================================================

INSERT INTO	address_types (	address_type	) VALUES (	'Residence'	);
INSERT INTO	address_types (	address_type	) VALUES (	'Office'	);


-- =============================================================================
--	Occupations
-- =============================================================================

INSERT INTO	occupations (	occupation	) VALUES (	'Business'		);
INSERT INTO	occupations (	occupation	) VALUES (	'House-wife'	);
INSERT INTO	occupations (	occupation	) VALUES (	'Retired'		);
INSERT INTO	occupations (	occupation	) VALUES (	'Self-employed'	);
INSERT INTO	occupations (	occupation	) VALUES (	'Service'		);
INSERT INTO	occupations (	occupation	) VALUES (	'Student'		);
INSERT INTO	occupations (	occupation	) VALUES (	'Un-employed'	);

-- =============================================================================
--	Sewadar Responsibilities; other responsibilities like Jathedar, Store Keeper, Attendance Marker are not supported initially.
-- =============================================================================

INSERT INTO	responsibilities (	responsibility,	responsibility_sq	) VALUES (	'Head',			1	);
INSERT INTO	responsibilities (	responsibility,	responsibility_sq	) VALUES (	'Second Head',	2	);
INSERT INTO	responsibilities (	responsibility,	responsibility_sq	) VALUES (	'Third Head',	3	);
INSERT INTO	responsibilities (	responsibility,	responsibility_sq	) VALUES (	'Fourth Head',	4	);

-- =============================================================================
--	Types of Remarks
-- =============================================================================

INSERT INTO	remarks_types (	remarks_type, remarks_type_sq	) VALUES (	'Remarks',		1	);
INSERT INTO	remarks_types (	remarks_type, remarks_type_sq	) VALUES (	'Annotations',	2	);
INSERT INTO	remarks_types (	remarks_type, remarks_type_sq	) VALUES (	'To do notes',	3	);
INSERT INTO	remarks_types (	remarks_type, remarks_type_sq	) VALUES (	'Reference',	4	);			--- It is to be used for Photos uploading
INSERT INTO	remarks_types (	remarks_type, remarks_type_sq	) VALUES (	'Migration',	5	);			--- It is used for information that could not be migrated
INSERT INTO	remarks_types (	remarks_type, remarks_type_sq	) VALUES (	'Old G.R.No.',	6	);			--- It is used for Old G.R.No. that existed before migrating the data

-- =============================================================================
--	Types of Jobs for Scanning
-- =============================================================================

INSERT INTO	scanning_job_types
		(	scanning_job_type_cd, remarks, is_date_wise, has_sub_jobs, status_system_info_cd, procedure_nm, cnt_procedure_nm, effective_from, effective_till	)
	VALUES
		(	'Cnstrctn Sewa', 'Construction Sewa', 'Yes', 'Yes', 'SttsCnstSewa', 'ProcessConstructionSewaDate', 'GetSewadarArbitraryShiftPresencesCount', '01-Jan-2011', '31-Dec-9999'	);

INSERT INTO	scanning_job_types
		(	scanning_job_type_cd, remarks, is_date_wise, has_sub_jobs, procedure_nm, cnt_procedure_nm, effective_from, effective_till	)
	VALUES
		(	'Reducing List', 'Reducing Sewadar List; can be used for Badges tracking', 'No', 'No', 'ReduceSewadarList', NULL, '08-Jan-2013', '31-Dec-9999'	);


INSERT INTO	scanning_job_types
		(	scanning_job_type_cd, remarks, is_date_wise, has_sub_jobs, procedure_nm, cnt_procedure_nm, effective_from, effective_till	)
	VALUES
		(	'Increasing List', 'Increasing Sewadar List; can be used for Badges tracking', 'No', 'No', 'AddToSewadarList', NULL, '01-Jan-2017', '31-Dec-9999'	);


-- =============================================================================
--	Validating Actions for Scanning
-- =============================================================================

INSERT INTO	scanning_validating_actions (	scanning_validating_action, remarks	)
	VALUES (	'No Action',	'When no action is to be taken, when a scanning record exists; this allows multiple scans for the same record as benign like Shift 2 being recorded again'		);
INSERT INTO	scanning_validating_actions (	scanning_validating_action, remarks	)
	VALUES (	'Error',		'Throw an error when a scanning record exists; for example, 1st shift can NOT be recorded after recording 2nd shift. Also, this can be used for ensuring single scan like entry for Parshad'		);
INSERT INTO	scanning_validating_actions (	scanning_validating_action, remarks	)
	VALUES (	'Add',			'Add this also to scanned records; for example, a person has done 1st shift and is now doing 2nd shift'		);
INSERT INTO	scanning_validating_actions (	scanning_validating_action, remarks	)
	VALUES (	'Move',			'Move the scanned record to this sub-job; for example, person had submitted for 1st shift and now intends to Full day. It essentially is DELETing the recorded sub-job and INSERTing the new sub-job'	);

-- =============================================================================
--	Types of Uses for Sewadar Lists
-- =============================================================================

INSERT INTO	sewadar_list_uses (	sewadar_list_use, sewadar_list_use_sq	) VALUES (	'Sewa Team',				1	);
INSERT INTO	sewadar_list_uses (	sewadar_list_use, sewadar_list_use_sq	) VALUES (	'Sewadars for a Sewa',		2	);
INSERT INTO	sewadar_list_uses (	sewadar_list_use, sewadar_list_use_sq	) VALUES (	'Bulk Exemption',			3	);
INSERT INTO	sewadar_list_uses (	sewadar_list_use, sewadar_list_use_sq	) VALUES (	'Assigning an Attribute',	4	);
INSERT INTO	sewadar_list_uses (	sewadar_list_use, sewadar_list_use_sq	) VALUES (	'Removing an Attribute',	5	);
INSERT INTO	sewadar_list_uses (	sewadar_list_use, sewadar_list_use_sq	) VALUES (	'Issue of Badges',			6	);
INSERT INTO	sewadar_list_uses (	sewadar_list_use, sewadar_list_use_sq	) VALUES (	'Return of Badges',			7	);
INSERT INTO	sewadar_list_uses (	sewadar_list_use, sewadar_list_use_sq	) VALUES (	'Printing of Badges',		8	);
INSERT INTO	sewadar_list_uses (	sewadar_list_use, sewadar_list_use_sq	) VALUES (	'Miscellaneous',			9	);

-- =============================================================================
--	Colours
-- =============================================================================

INSERT INTO	colours (	colour_id, colour_nm, red_component, blue_component, green_component	 ) VALUES (	1,	'Black',		0,		0,		0	);
INSERT INTO	colours (	colour_id, colour_nm, red_component, blue_component, green_component	 ) VALUES (	2,	'White',		255,	255,	255	);
INSERT INTO	colours (	colour_id, colour_nm, red_component, blue_component, green_component	 ) VALUES (	3,	'Blue - Dark',	0,		48,		96	);
INSERT INTO	colours (	colour_id, colour_nm, red_component, blue_component, green_component	 ) VALUES (	4,	'Blue - Light',	0,		117,	234	);
INSERT INTO	colours (	colour_id, colour_nm, red_component, blue_component, green_component	 ) VALUES (	5,	'Brown',		128,	0,		0	);
INSERT INTO	colours (	colour_id, colour_nm, red_component, blue_component, green_component	 ) VALUES (	6,	'Green',		7,		85,		29	);
INSERT INTO	colours (	colour_id, colour_nm, red_component, blue_component, green_component	 ) VALUES (	7,	'Grey',			93,		93,		93	);
INSERT INTO	colours (	colour_id, colour_nm, red_component, blue_component, green_component	 ) VALUES (	8,	'Orange',		255,	140,	0	);
INSERT INTO	colours (	colour_id, colour_nm, red_component, blue_component, green_component	 ) VALUES (	9,	'Purple',		100,	0,		100	);
INSERT INTO	colours (	colour_id, colour_nm, red_component, blue_component, green_component	 ) VALUES (	10, 'Red',			255,	0,		0	);

-- =============================================================================
--	Sewadar Types that are permitted
-- =============================================================================

INSERT INTO	sewadar_types (	sewadar_type, remarks	) VALUES (	'R', 'Regular'	);
INSERT INTO	sewadar_types (	sewadar_type, remarks	) VALUES (	'T', 'Trainee'	);
INSERT INTO	sewadar_types (	sewadar_type, remarks	) VALUES (	'O', 'Open'		);

-- =============================================================================
--	Types of Badge Parts that are permitted
-- =============================================================================

INSERT INTO	badge_part_types (	badge_part_type	) VALUES (	'Department'		);
INSERT INTO	badge_part_types (	badge_part_type	) VALUES (	'Sub-Department'	);
INSERT INTO	badge_part_types (	badge_part_type	) VALUES (	'Weekly Location'	);
INSERT INTO	badge_part_types (	badge_part_type	) VALUES (	'Satsang Centre'	);
INSERT INTO	badge_part_types (	badge_part_type	) VALUES (	'Text'				);

-- =============================================================================
--	Sewa Exemptions
-- =============================================================================

INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Accident',							NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Attend ceremony',					NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Attend funeral',					NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Could not get leave from job',		NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Death in the family',				NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Doing Sewa at other Centre',	'Doing Sewa at Ulhasnagar, Varap, Dombivali, Badlapur, Bhiwandi	',	'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Examinations',						NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Family member not keeping well',	NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Family problem',					NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Financially weak',					NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Function in the family',			NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Ladies Above 60 years',			NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Leg fracture',						NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Marriage in the family',			NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Medical problem',					NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Miscellaneous',					NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'New born baby',					NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Not feeling well',					NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Out of station',					NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Outside Sewadar',					NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Pregnant',							NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Problem in local areas',			NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Reactivated from Inactive',		NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Reactivated from Retired (E)',		NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Studying',							NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Unaviodable circumstances',		NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Unfit for Construction Sewa',		NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Visit for Satsang work',			NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Visit to Beas',					NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Visit to Gujarat for Sewa',		NULL,															'Once only',	'No',	'No'	);
INSERT INTO	sewa_exemptions
		(	sewa_exemption_nm, sewa_exemption_description, sewa_exemption_type, sewa_applicability, is_computed	)
	VALUES
		(	'Weekly Sewa - Group Exemptions',	NULL,															'Once only',	'No',	'No'	);

-- =============================================================================
--	Badge Templates
-- =============================================================================

INSERT INTO	badge_templates
		(	badge_template_id, badge_template_nm, badge_shape, information_type,
			foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id,
			top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text,
			middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text,
			bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text,
			expiry_year, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back
		)
	VALUES
		(	'Programme',	'Satsang Programme Badge',	'Horizontal',	'Sewadar',
			'Colour',	2,		'Department',	NULL,	
			12,		'Department',	NULL,							NULL,		NULL,					NULL,
			NULL,	NULL,			NULL,							NULL,		NULL,					NULL,
			12,		'Text',			'RADHASOAMI SATSANG BEAS',		'-',		'Satsang Centre',		NULL,
			2015,	'HorizontalSewadarFront.rpt',	'HorizontalSewadarBack.rpt',	'GetHorizontalSewadarFrontInfo',	'GetHorizontalSewadarBackInfo'
		);

INSERT INTO	badge_templates_sewadar_status	VALUES	(	'Programme',	'Perm'	);
INSERT INTO	badge_templates_sewadar_status	VALUES	(	'Programme',	'Temp'	);


INSERT INTO	badge_templates
		(	badge_template_id, badge_template_nm, badge_shape, information_type,
			foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id,
			top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text,
			middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text,
			bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text,
			expiry_year, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back, is_expiry_year_check
		)
	VALUES
		(	'Retired',		'Retired Sewadar''s Badge',	'Triangular',	'Sewadar',
			'Colour',	2,		'Department',	NULL,
			10,		'Department',	NULL,							NULL,		NULL,					NULL,
			NULL,	NULL,			NULL,							NULL,		NULL,					NULL,
			10,		'Text',			'RADHASOAMI SATSANG BEAS',		'-',		'Satsang Centre',		NULL,
			2015,	'TriangularSewadarFront.rpt',	'TriangularSewadarBack.rpt',	'GetTriangularSewadarFrontInfo',	'GetTriangularSewadarBackInfo', 'No'
		);

INSERT INTO	badge_templates_sewadar_status	VALUES	(	'Retired',	'Retd'	);


INSERT INTO	badge_templates
		(	badge_template_id, badge_template_nm, badge_shape, information_type,
			foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id,
			top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text,
			middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text,
			bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text,
			expiry_year, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back
		)
	VALUES
		(	'SpecialZon',	'Special Zone (Red) Badge',	'Horizontal',	'Sewadar',
			'Colour',	2,		'Colour',	10,	
			12,		'Department',	NULL,							NULL,		NULL,					NULL,
			30,		'Text',			'Red Zone',						' ',		'Text',					'January 2010',
			12,		'Text',			'RADHASOAMI SATSANG BEAS',		'-',		'Satsang Centre',		NULL,
			2010,	'HorizontalSpecialFront.rpt',	NULL,	'GetHorizontalSpecialFrontInfo',	NULL
		);

INSERT INTO	badge_templates_sewadar_status	VALUES	(	'SpecialZon',	'Perm'	);


INSERT INTO	badge_templates
		(	badge_template_id, badge_template_nm, badge_shape, information_type,
			foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id,
			top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text,
			middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text,
			bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text,
			expiry_year, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back
		)
	VALUES
		(	'Weekly',	'Weekly Sewa Badge',			'Vertical',		'Sewadar',
			'Colour',	1,		'Colour',	2,
			12,		'Department',	NULL,							NULL,		NULL,					NULL,
			8,		'Text',			'(Weekly)',						NULL,		NULL,					NULL,
			12,		'Text',			'RSSB',							'()',		'Weekly Location',		NULL,
			2015,	'VerticalSewadarFront.rpt',		'VerticalSewadarBack.rpt',	'GetVerticalSewadarFrontInfo',		'GetVerticalSewadarBackInfo'
		);

INSERT INTO	badge_templates_sewadar_status	VALUES	(	'Weekly',	'Perm'	);


INSERT INTO	badge_templates
		(	badge_template_id, badge_template_nm, badge_shape, information_type,
			foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id,
			top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text,
			middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text,
			bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text,
			expiry_year, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back, are_outstation_sewadars_allowed
		)
	VALUES
		(	'ConstSB',	'Construction Sewa Badge',		'Vertical',		'Sewadar',
			'Colour',	1,		'Colour',	2,
			10,		'Text',			'RSSB',		'-',		'Satsang Centre',		NULL,
			9,		'Department',	NULL,							'()',		'Sub-Department',		NULL,
			8,		'Text',			'-',							NULL,		NULL,					NULL,
			2015,	'ConstructionSewaBadge.rpt',		NULL,	'GetConstructionSewaBadgeInfo',		NULL,	'No'
		);

INSERT INTO	badge_templates_sewadar_status	VALUES	(	'ConstSB',	'Perm'	);
INSERT INTO	badge_templates_sewadar_status	VALUES	(	'ConstSB',	'Temp'	);

INSERT INTO	badge_templates
		(	badge_template_id, badge_template_nm, badge_shape, information_type,
			foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id,
			top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text,
			middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text,
			bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text,
			expiry_year, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back
		)
	VALUES
		(	'TraineeSB',	'Trainee/Open Sewadar Badge',		'Horizontal',		'Sewadar',
			'Colour',	1,		'Colour',	2,
			10,		'Text',			'RSSB',		'-',		'Satsang Centre',		NULL,
			9,		'Department',	NULL,							'()',		'Sub-Department',		NULL,
			8,		'Text',			'',							'',		'Text',					'',
			2015,	'TraineeSewadarsBadge.rpt',		NULL,	'GetTraineeSewadarsBadgeInfo',		NULL
		);


INSERT INTO	badge_templates_sewadar_status	VALUES	(	'TraineeSB',	'Trn'	);
INSERT INTO	badge_templates_sewadar_status	VALUES	(	'TraineeSB',	'Open'	);

INSERT INTO	badge_templates
		(	badge_template_id, badge_template_nm, badge_shape, information_type,
			foreground_colour_control, foreground_colour_id, background_colour_control, background_colour_id,
			top_line_font_size, top_line_part_1_type, top_line_part_1_text, top_line_parts_separator, top_line_part_2_type, top_line_part_2_text,
			middle_line_font_size, middle_line_part_1_type, middle_line_part_1_text, middle_line_parts_separator, middle_line_part_2_type, middle_line_part_2_text,
			bottom_line_font_size, bottom_line_part_1_type, bottom_line_part_1_text, bottom_line_parts_separator, bottom_line_part_2_type, bottom_line_part_2_text,
			expiry_year, report_file_nm_front, report_file_nm_back, procedure_nm_front, procedure_nm_back, are_outstation_sewadars_allowed
		)
	VALUES
		(	'IDCard',	'Identity Card',		'Vertical',		'Sewadar',
			'Colour',	1,		'Colour',	2,
			10,		'Text',			'RSSB',		'-',		'Satsang Centre',		NULL,
			9,		'Department',	NULL,							'()',		'Sub-Department',		NULL,
			8,		'Text',			'-',	NULL,		NULL,					NULL,
			2015,	'IDCardBadge.rpt',		NULL,	'GetIDCardSewaBadgeInfo',		NULL,	'Yes'
		);
INSERT INTO	badge_templates_sewadar_status	VALUES	(	'IDCard',	'Perm'	);
INSERT INTO	badge_templates_sewadar_status	VALUES	(	'IDCard',	'Temp'	);


-- ===========================================================================================
-- vim:ts=4 sw=4 ht=4
