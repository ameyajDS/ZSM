/* ==================================================================================
	Source File		:	13_schema_migration.sql
	Author(s)		:	Manish Saluja, Jiten Loyal
	Started On		:	Thu Dec 09, 2010
	Version			:	0.27
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	06-Feb-2011
	Reviewed By		:
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
											* This script migrates the sms data to zsm
	==================================================================================
														 ZSM Tables Migration Not Done
	----------------------------------------------------------------------------------
														 From file 11_schema_setup.sql
														 -----------------------------
	* generic_attributes_list_values -- New in ZSM	
													  From file 12_schema_entities.sql
													  -------------------------------- 
	* sewas_satsang_centres -- No need to migrate
	* sewa_exemptions_applicable_sewas -- New in ZSM	
															   From file 13_schema.sql
															   -----------------------
	* ZSM_Photos..sewadars_photos -- To be migrated separately
	* sewadars_satsang_centre_transfers -- New in ZSM
	* sewadars_badge_issues_and_returns -- New in ZSM
	* sewadars_merged -- New in ZSM	
	==================================================================================
						  ZSM Tables Migrated as part of following files in 100_Schema
														31_setup_system_codes.sql (&),
																32_setup_data.sql (@),
														 34_setup_departments.sql (%),
														  36_setup_attributes.sql (#),
										14_schema_migration_for_qualification.sql (~)
	----------------------------------------------------------------------------------
														 From file 11_schema_setup.sql
														 -----------------------------
	* address_proofs @
	* address_types @
	* attendance_units @
	* badge_part_types @
	* centre_functionaries @
	* controlling_sequences @
	* sewadar_status @
	* sewadar_status_valid_transitions @
	* generic_attributes #
	* generic_attributes_status #
	* occupations @
	* remarks_types @
	* responsibilities @
	* scanning_validating_actions @
	* sewa_frequencies @
	* sewadar_list_uses @
	* system_information_codes &
	* system_information_values &
														From file 12_schema_entities.sql
														-------------------------------- 
	* colours @
	* badge_templates @
	* badge_templates_sewadar_status @
	* satsang_centres_details %
	* departments %
	* departments_satsang_centres %
	* sewa_exemptions @
	* generic_attributes_satsang_centres #
																From file 13_schema.sql
																-----------------------
	* sewadars_qualifications ~
	==================================================================================
													  ZSM Tables Migrated in this file
	----------------------------------------------------------------------------------
														 From file 11_schema_setup.sql
														 -----------------------------
	* sewa_shifts	
													  From file 12_schema_entities.sql
													  --------------------------------
	* satsang_centres_details
	* satsang_centre_functionaries
	* sewas
	* sewas_sewa_shifts
	* credit_specifications
	* credit_specifications_sewas	
	* sub_departments
	* sub_departments_satsang_centres	
	* post_offices_or_cities
	* sequence_controlling_information
	* weekly_sewa_locations	
																From file 13_schema.sql
																-----------------------
	* sewadars
	* sewadars_details
	* sewadars_addresses
	* sewadars_skills
	* sewadars_remarks
	* sewadars_registrations
	* sewadar_transfers
	* sewadars_status_changes
	* sewadars_responsibility_changes
	* sewadars_particulars
	* sewadars_attributes
	* sewa_teams
	* sewa_team_wise_sewadars
	* sewadars_txn_ts
	* sewa_teams_txn_ts
	* team_wise_daily_attendance
	* arbitrary_daily_presences
	* arbitrary_shift_presences
	* arbitrary_summarised_exemptions
	* sewadar_wise_sewa_summaries
	* credit_specifications_sewadars
	* generic_sewadar_lists
	* generic_sewadar_lists_sewadars
	* sewadars_badges
	==================================================================================
														 SMS Tables not to be migrated
	----------------------------------------------------------------------------------
	* cities -- We will loose the data. Not required.
	* department_groups -- We will loose the data. Not required.
	* sewadar_satsang_centres -- We will loose the data. Not required.
	* sewadar_system_record -- NA
	* auxilary_sewadar_system_record -- NA
	* stickers -- Handled in another way in ZSM
	* team_wise_hourly_attendance -- This was never used in SMS
	* team_wise_duration_attendance -- This was never used in SMS
	* arbitrary_hourly_presences -- This was never used in SMS
	* arbitrary_duration_presences -- This was never used in SMS
	* arbitrary_exemptions -- We will loose the data. Not required.
	* arbitrary_leaves -- We will loose the data. Not required.
	* sewadars_for_report -- We will loose the data. Not required.
	* sewa_shift_validations -- Taken care in another way in ZSM
	* criteria -- Taken care in another way in ZSM
	* sewas_criteria -- Taken care in another way in ZSM
	* installations -- Taken care in another way in ZSM
	* installation_configurations -- Taken care in another way in ZSM
	==================================================================================
	ZSM Tables to be added in Phase 2 release but no data need to be migrated from SMS
	----------------------------------------------------------------------------------
	* languages (already in CDB)
	* sewadar_languages_known
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
	v0.27 MS	* 06-Feb-2011
				* Moved sewadars_qualifications related migration to 14_schema_migration_for_qualification.sql
	v0.26 MS	* 05-Feb-2011
				* Following table migration script written
					- sewadars_qualifications
				* Added migration remarks for sewadars_qualifications that are not migrated (completely or pratially).
	v0.25 MS	* 09-Jan-2011
				* Following table migration script written
					- generic_sewadar_lists
					- generic_sewadar_lists_sewadars
	v0.24 MS	* 08-Jan-2011
				* Following table migration script written
					- sequence_controlling_information
	v0.23 MS	* 06-Jan-2011
				* Created following temporary migration table to enable migration of data with one
				  system_id and multiple sewadar_ids.
					- tmp_mgr_sms_sewadar_system_record
	v0.22 MS	* 03-Jan-2011
				* Following table migration script written
					- credit_specifications
					- credit_specifications_sewas
					- credit_specifications_sewadars
				* Added details of Migration done / not-done in comments
	v0.21 MS	* 01-Jan-2011
				* Following table migration script written
					- sewadars_skills
				* Created following temporary migration table
					- tmp_mgr_sewadars_skills
	v0.20 MS	* 31-Dec-2010
				* Following table migration script written
					- post_offices_or_cities
					- sewadars_addresses
	v0.19 MS	* 28-Dec-2010
				* Moved CDB update to 11_cdb_updates.sql
	v0.18 MS	* 26-Dec-2010
				* Following table migration script moved to this file
					- sub_departments
					- sub_departments_satsang_centres
				* Moved following temporary migration table to this file
					- tmp_mgr_sewa_exemptions_mapping
				* Following table migration script written
					- sewa_shifts
					- sewas_sewa_shifts
					- arbitrary_shift_presences
					- arbitrary_summarised_exemptions
					- weekly_sewa_locations
					- sewadars_badges
				* Created following temporary migration table
					- tmp_badge_templates_mapping
	v0.17 MS	* 25-Dec-2010
				* Following table migration script written
					- sewa_teams_txn_ts
					- sewadars_txn_ts
					- team_wise_daily_attendance
					- arbitrary_daily_presences
					- sewadar_wise_sewa_summaries
	v0.16 MS	* 25-Dec-2010
				* Following table migration script written
					- sewa_teams
					- sewa_team_wise_sewadars
	v0.15 MS	* 23-Dec-2010
				* Following table migration script written
					- sewadars_responsibility_changes
					- sewas
				* Created following temporary migration table
					- tmp_mgr_sewadars_responsibility_changes
	v0.14 MS	* 22-Dec-2010
				* Following table migration script written
					- sewadars_status_changes
	v0.13 MS	* 21-Dec-2010
				* Created following temporary migration table
					- tmp_mgr_sewadars_status_changes
	v0.12 MS	* 20-Dec-2010
				* Following table migration script written
					- satsang_centre_functionaries
	v0.11 MS	* 20-Dec-2010
				* Added checks for missing entries in the mapping tables
	v0.10 MS	* 19-Dec-2010
				* Incorrect initiation dates are entered as annotations
				* Modified the @cnt checks to not give any resultant data sets
	v0.09 MS	* 19-Dec-2010
				* Following table migration script written
					- sewadar_transfers
	v0.08 MS	* 18-Dec-2010
				* Added count check for all the migrated tables.
				* Added remarks, annotations, to-do-list of duplicate entries of a sewadar_id
				* Added primary keys in all the tmp_mgr tables
				* Created following temporary migration table
					- tmp_mgr_sewadars_remarks
	v0.07 JL	* 17-Dec-2010
				* Migration for sms..sewadar_attributes completed.
	v0.06 MS	* 17-Dec-2010
				* Added migration remarks for sponsor id, reference_nm1 and reference_nm2 that are not migrated.
	v0.05 MS	* 13-Dec-2010
				* Migration tested for table sewdars_registrations
				* Created follwing temporary migration table
					- tmp_mgr_sewadar_system_record
	v0.04 MS	* 13-Dec-2010
				* Migration tested for tables sewadars, sewadars_details and sewadar_remarks
				* Created follwing temporary migration tables
					- tmp_mgr_gender_mapping
					- tmp_mgr_duplicate_sewadars
	v0.03 MS	* Following table migration scripts written
					- sewadars_remarks
					- sewadars_registrations
				* Added missing data in CDB in relations
				* Removed tmp_mgr_sewadar_id_map as it is not required
				* Created follwing temporary migration tables
					- tmp_mgr_relation_mapping
				* Mapped sms..sewadars.other_address_proof to newly defined address_proof in zsm..sewadars_details wherever applicable
	v0.02 MS	* Added missing data in CDB in initiation_places and satsang_centres
				* Populated tmp_mgr_initiation_place_mapping
				* Corrected entries after clarifying doubts with Jiten
	v0.01 MS	* Initial version creates following temporary migration tables 
					- tmp_mgr_initiation_place_mapping
					- tmp_mgr_sewadar_status_mapping
					- tmp_mgr_occupation_mapping
					- tmp_mgr_satsang_centre_mapping
					- tmp_mgr_sewadar_id_map
				* Following table migration scripts are written
					- sewadars
					- sewadars_details				
	==================================================================================
																			   Pending
	----------------------------------------------------------------------------------
	1. sewadars_qualifications migration is delayed.
	2. sequence_controlling_information partially migrated.
	==================================================================================
																				 Notes
	----------------------------------------------------------------------------------
	1. telephone_pager, weekly_sewa_location_id (location_id in sms),weekly_department_id, stickers, office_adresses, is not migrated (set to NULL if the column exists).
	2. in responsibility, only Heads are migrated. Rest are set to NULL.
	3. Initiation details of G00913 and G01871 have not been migrated because initiation_dt was missing and their status was Cancelled and Expired respectively.
	4. effective_dt and status in sms..sewadar_system_record are not migrated (redundant information)
	5. some incorrect initiation dates are entered as annotations
	6. Some entries in sms..sewadar_status, where 2 consecutive entries for the same grno had same status. Only 1 of them is migrated after manual inspection.
	7. Some entries in sms..sewadar_responsibility, where consecutive entries for the same grno had same responsibility. Only the oldest of them is migrated.
	8. only all Heads and Sewadar responsibility migrated from sms..sewadar_responsibility. Also Sewadar responsibility is mapped to NULL.
	9. attendance_marking of all the sewas in table sewas made 'Computed' if its referred_sewa_id was NOT NULL
	10.is_scanned in team_wise_daily_attendance, arbitrary_daily_presences is set to 'No' for all migrated data.
	11.in sewadar_wise_sewa_summaries, data not migrated with present_cnt = 0 AND absent_cnt = 0 AND (leave_cnt IS NULL OR leave_cnt = 0) AND (exempt_cnt IS NULL OR exempt_cnt = 0)
	12.in sms..sewadar_badges, is_temporary_badge column is not migrated.
	13.in sms..sewadars only residence_adress, residence_* migrated (not office_*)
	==================================================================================*/

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_fnGetAllRemarkStringForSponsors' AND TYPE = 'FN')
	DROP FUNCTION [dbo].tmp_mgr_fnGetAllRemarkStringForSponsors
GO
CREATE FUNCTION dbo.tmp_mgr_fnGetAllRemarkStringForSponsors 
( 
	@sewadar_id			sewadar_id
) 
RETURNS remarks 
AS 
BEGIN 
    DECLARE @v_remarks remarks
    SET @v_remarks = NULL
    SELECT @v_remarks = ISNULL(@v_remarks + ';', '') 
		+ sr.sewadar_grno + ' had Sponsorer ' + ss.sponsorer_id
	FROM sewadars_registrations sr
	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' AND ss.sponsorer_id IS NOT NULL
	AND sr.sewadar_id = @sewadar_id;
	RETURN @v_remarks;
END
GO

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_fnGetAllRemarkStringForReferenc1Nm' AND TYPE = 'FN')
	DROP FUNCTION [dbo].tmp_mgr_fnGetAllRemarkStringForReferenc1Nm
GO
CREATE FUNCTION dbo.tmp_mgr_fnGetAllRemarkStringForReferenc1Nm
( 
	@sewadar_id			sewadar_id
) 
RETURNS remarks 
AS 
BEGIN 
    DECLARE @v_remarks remarks
    SET @v_remarks = NULL
    SELECT @v_remarks = ISNULL(@v_remarks + ';', '') 
		+ sr.sewadar_grno + ' had Ref1Nm ' + LTRIM(RTRIM(ss.reference_1_nm)) + ':Cntr ' + LTRIM(RTRIM(ss.reference_1_centre_id)) + 
		':Dept ' + LTRIM(RTRIM(ss.reference_1_department))
	FROM sewadars_registrations sr
	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE ss.reference_1_sewadar_id IS NOT NULL and ss.reference_1_nm IS NOT NULL
	AND sr.sewadar_id = @sewadar_id;
	RETURN @v_remarks;
END
GO

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_fnGetAllRemarkStringForReferenc2Nm' AND TYPE = 'FN')
	DROP FUNCTION [dbo].tmp_mgr_fnGetAllRemarkStringForReferenc2Nm
GO
CREATE FUNCTION dbo.tmp_mgr_fnGetAllRemarkStringForReferenc2Nm
( 
	@sewadar_id			sewadar_id
) 
RETURNS remarks 
AS 
BEGIN 
    DECLARE @v_remarks remarks
    SET @v_remarks = NULL
    SELECT @v_remarks = ISNULL(@v_remarks + ';', '') 
		+ sr.sewadar_grno + ' had Ref1Nm ' + LTRIM(RTRIM(ss.reference_2_nm)) + ':Cntr ' + LTRIM(RTRIM(ss.reference_2_centre_id)) + 
		':Dept ' + LTRIM(RTRIM(ss.reference_2_department))
	FROM sewadars_registrations sr
	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE ss.reference_2_sewadar_id IS NOT NULL and ss.reference_2_nm IS NOT NULL
	AND sr.sewadar_id = @sewadar_id;
	RETURN @v_remarks;
END
GO

DECLARE
	@centre_id			INT,
	@active_eff_from	DATETIME,
	@active_eff_till	DATETIME,
	@inactiv_eff_frm	DATETIME,
	@inactiv_eff_til	DATETIME,
	@dummy_initiation_dt DATETIME,
	@none_relation_id	INT,
	@cnt1				INT,
	@cnt2				INT,
	@not_known_initiation_place_id INT;

	SELECT @centre_id		= satsang_centre_id FROM CDB..satsang_centres WHERE satsang_centre_nm = 'BHAYANDAR'; -- 6015
	SET	@active_eff_from 	= '01-Jan-2000';
	SET @active_eff_till	= '31-Dec-9999';
	SET @inactiv_eff_frm	= '01-Jan-2000';
	SET @inactiv_eff_til	= '31-Dec-2009';
	SET @dummy_initiation_dt = '01-Jan-1991';
	SELECT @none_relation_id = relation_id FROM CDB..relations WHERE relation_nm = 'None'; -- 6
	SELECT @not_known_initiation_place_id = place_id FROM CDB..initiation_places WHERE place_nm = 'NOT KNOWN'; -- 73

-- ====================================================================================================
--	House Keeping
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_initiation_place_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_initiation_place_mapping;

CREATE TABLE tmp_mgr_initiation_place_mapping
(
	sms_initiation_place gnc_nm CONSTRAINT	TmpMgrInitiationPlaceMapping_PK_SmsInitiationPlace
									PRIMARY KEY	NONCLUSTERED,
	cdb_initiation_place_nm gnc_nm
);

INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('.',			'TO BE SPECIFIED');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Ahemdabad',	'Ahmedabad'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHMEDABAD',	'Ahmedabad'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Ahmedbad',	'Ahmedabad'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Ajmer',		'Ajmer'			);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Akola',		'Akola'			);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Amritsar',	'Amritsar'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Bandra',		'Mumbai'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BANGALORE',	'BANGALORE'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Bangkok',		'Bangkok'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Banglore',	'BANGALORE'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Beaa',		'Dera'			);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BEAS',		'Dera'			);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BHAYANDAR',	'Mumbai'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Bombay',		'Mumbai'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('CALCUTTA',	'Kolkata'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Delhi',		'Delhi'			);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('dera',		'Dera'			);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('GUJARAT',		'Gujarat'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Gujrat',		'Gujarat'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('GWALIOR',		'Gwalior'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('HongKong',	'HongKong'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('HYDERABAD',	'Hyderabad'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Indore',		'Indore'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('JAIPUR',		'Jaipur'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('JAKARTA',		'Jakarta'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('JAMSHEDPUR',	'Jamshedpur'	);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Karachi',		'Karachi'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Kolkata',		'Kolkata'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('LONDON',		'London'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('MUBAI',		'Mumbai'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('MUMABI',		'Mumbai'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Mumbai',		'Mumbai'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Mumbai`',		'Mumbai'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('MUMBAU',		'Mumbai'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Mumbaii',		'Mumbai'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Muimbai',		'Mumbai'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('NAGPUR',		'Nagpur'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('New Delhi',	'Delhi'			);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('NEW ZEALAND',	'New Zealand'	);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Not known',	'NOT KNOWN'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Raipur',		'Raipur'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('San Francisco','San Francisco');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('SANGLI',		'Sangli'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('SECUNDERABAD','Hyderabad'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('SECUNDRABAD',	'Hyderabad'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Siddhpur',	'Sidhpur'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Sidhapur',	'Sidhpur'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Sidhhapur',	'Sidhpur'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Sidhpur',		'Sidhpur'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Spain',		'Spain'			);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('TO BE SPECIFIED','TO BE SPECIFIED');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('umbai',		'Mumbai'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Unknown',		'NOT KNOWN'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('West Africa (Country Benin)',		'Benin (West Africa)');

SELECT @cnt1 = COUNT(*)
			FROM SMS..sewadars s 
LEFT OUTER 	JOIN tmp_mgr_initiation_place_mapping ipm ON s.initiation_place = ipm.sms_initiation_place
WHERE s.initiation_place IS NOT NULL AND ipm.sms_initiation_place IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some initiation places in sms..sewadars that are not mapped in tmp_mgr_initiation_place_mapping', 16, 0);
		SELECT DISTINCT s.initiation_place
					FROM SMS..sewadars s 
		LEFT OUTER 	JOIN tmp_mgr_initiation_place_mapping ipm ON s.initiation_place = ipm.sms_initiation_place
		WHERE s.initiation_place IS NOT NULL AND ipm.sms_initiation_place IS NULL;
	END;

SELECT @cnt1 = COUNT(*)
			FROM SMS..masters m 
LEFT OUTER 	JOIN CDB..patrons p ON p.patron_id = m.master_id
WHERE m.master_id IS NOT NULL AND p.patron_id IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some masters in sms..masters that are not mapped in CDB..patrons', 16, 0);
		SELECT m.master_id, m.master_nm
					FROM SMS..masters m 
		LEFT OUTER 	JOIN CDB..patrons p ON p.patron_id = m.master_id
		WHERE m.master_id IS NOT NULL AND p.patron_id IS NULL;
	END;

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewadar_status_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_sewadar_status_mapping;

CREATE TABLE tmp_mgr_sewadar_status_mapping
(
	sms_status CHAR (20) CONSTRAINT	TmpMgrSewadarStatusMapping_PK_SmsStatus
							PRIMARY KEY	NONCLUSTERED,
	zsm_global_sewadar_status_nm VARCHAR (20),
	zsm_sewadar_status_nm VARCHAR (20)
)

INSERT INTO tmp_mgr_sewadar_status_mapping (sms_status,	zsm_global_sewadar_status_nm, zsm_sewadar_status_nm) VALUES ('Temporary           ',		NULL,		'Temporary'   );
INSERT INTO tmp_mgr_sewadar_status_mapping (sms_status,	zsm_global_sewadar_status_nm, zsm_sewadar_status_nm) VALUES ('Permanent           ',		NULL,		'Permanent'   );
INSERT INTO tmp_mgr_sewadar_status_mapping (sms_status,	zsm_global_sewadar_status_nm, zsm_sewadar_status_nm) VALUES ('InActive            ',		NULL,		'In-active'   );
INSERT INTO tmp_mgr_sewadar_status_mapping (sms_status,	zsm_global_sewadar_status_nm, zsm_sewadar_status_nm) VALUES ('WaitingList         ',		NULL,		'Wait-listed' );
INSERT INTO tmp_mgr_sewadar_status_mapping (sms_status,	zsm_global_sewadar_status_nm, zsm_sewadar_status_nm) VALUES ('Retired             ',		NULL,		'Retired'	  ); -- To be changed later to 'Left' (zsm_sewadar_status_cd) if is_eligible_for_prashaad = 'No'
INSERT INTO tmp_mgr_sewadar_status_mapping (sms_status,	zsm_global_sewadar_status_nm, zsm_sewadar_status_nm) VALUES ('Expired             ',		'Expired',	'Left'		  );
INSERT INTO tmp_mgr_sewadar_status_mapping (sms_status,	zsm_global_sewadar_status_nm, zsm_sewadar_status_nm) VALUES ('Transfer Sought     ',		NULL,		'Transfer Sought');
INSERT INTO tmp_mgr_sewadar_status_mapping (sms_status,	zsm_global_sewadar_status_nm, zsm_sewadar_status_nm) VALUES ('Cancelled           ',		NULL,		'Cancelled'   );
INSERT INTO tmp_mgr_sewadar_status_mapping (sms_status,	zsm_global_sewadar_status_nm, zsm_sewadar_status_nm) VALUES ('Unwanted            ',		'Suspended','In-active'   );
INSERT INTO tmp_mgr_sewadar_status_mapping (sms_status,	zsm_global_sewadar_status_nm, zsm_sewadar_status_nm) VALUES ('Non-Initiate        ',		NULL, 		'Non-Initiate');

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_occupation_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_occupation_mapping;

CREATE TABLE tmp_mgr_occupation_mapping
(
	sms_occupation CHAR (15) CONSTRAINT	TmpMgrOccupationMapping_PK_SmsOccupation
								PRIMARY KEY	NONCLUSTERED,
	zsm_occupation occupation
)

INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('Service        ',	'Service'		);
INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('Business       ',	'Business'		);
INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('Self Employed  ',	'Self-employed'	);
INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('Student        ',	'Student'		);
INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('HouseWife      ',	'House-wife'	);
INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('UnEmployed     ',	'Un-employed'	);
INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('Retired        ',	'Retired'		);

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_satsang_centre_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_satsang_centre_mapping;

CREATE TABLE tmp_mgr_satsang_centre_mapping
(
	sms_id CHAR (10) CONSTRAINT	TmpMgrSatsangCentreMapping_PK_SmsId
						PRIMARY KEY	NONCLUSTERED,
	sms_nm gnc_nm, 
	cdb_nm gnc_nm
)

INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('ADI       ', 'Ahmedabad ',					'BHAYANDAR'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AGRA      ', 'AGRA',						'AGRA-I'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AJ        ', 'Ajmer',						'AJMER-I (TABIJI)'			);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AK        ', 'AKOLA ',						'AKOLA'		);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AK-AS     ', 'AKOLA Area  ',				'AKOLA'		);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AN        ', 'Ahmed Nagar',				'AHMEDNAGAR');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AUR       ', 'AURANGABAD ',				'AURANGABAD');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BAST      ', 'Basti',						'BASTI'		);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BAD       ', 'BADLAPUR ',					'BADLAPUR'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BH        ', 'Bhiwandi ',					'BHIWANDI'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BHU       ', 'Bhusawal ',					'BHUSAWAL'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BHY       ', 'SATSANG GROUND, BHAYENDAR ',	'BHAYANDAR'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BL        ', 'Bilwa',						'Bilwa'		);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BNG       ', 'Banglore ',					'BANGALORE'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BOR       ', 'Bordi',						'BORDI'		);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BS        ', 'BEAS ',						'BEAS PIND'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('CHA       ', 'Chanera Sarsodi',			'SARSOLI'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('COL       ', 'Colaba ',					'COLABA'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('DAH       ', 'Dahanu ',					'DAHANU ROAD');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('DB        ', 'Dombivali ',					'DOMBIVALI'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('DHULE     ', 'Dhule ',						'DHULE'		);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('DMN       ', 'Daman ',						'DAMAN'		);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GANDHI    ', 'Gandhi Nagar',				'GANDHI NAGAR');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GONDIA    ', 'GONDIA ',					'GONDIA'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GOR       ', 'Gorakhpur',					'GORAKHPUR (UP)');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GU        ', 'Gurgaon',					'GURGAON');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('HOSH      ', 'Hoshiarpur ',				'HOSHIARPUR');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('HYD       ', 'HYDRABAD ',					'HYDERABAD-I');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('JAIPUR    ', 'Jaipur',						'JAIPUR-I');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('JAL       ', 'Jalgaon ',					'JALGAON'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('KOL       ', 'KOLHAPUR ', 					'KOLHAPUR'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('KU        ', 'Kuwait', 					'Kuwait'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('LN        ', 'Lonavala', 					'LONAVALA'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('LUCK      ', 'LUCKNOW', 					'LUCKNOW-I(MOHANLALGANJ)');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MAH       ', 'Mehsana ', 					'MEHSANA'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MAN       ', 'Mangalore', 					'MANGALORE(KARNATAKA)');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MG        ', 'MaharajGunj',				'MAHARAJGANJ(GORAKHPUR)');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MP        ', 'Mota Punda',					'MOTA PONDHA');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MU        ', 'Muzzafarpur',				'MUZAFFARPUR(BH)');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('N         ', 'Nainital',					'NAINITAL');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NA        ', 'Nasik',						'NASIK');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NAG       ', 'Nagpur ', 					'NAGPUR(MH)');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('ND        ', 'Delhi', 						'PUSA ROAD');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NDRBR     ', 'Nandurbar',					'NANDURBAR'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NMB       ', 'Navi Mumbai ',				'NAVI MUMBAI');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NY        ', 'New York',					'New York'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('PAL       ', 'PALGHAR ',					'PALGHAR'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('PIMPRI    ', 'PIMPRI ',					'PIMPRI'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('PN        ', 'PUNE ',						'PUNE-II (GULTEKDI)');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SAN       ', 'San Francisco',				'San Francisco');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SAR       ', 'Sarsoli',					'SARSOLI');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SATARA    ', 'SATARA',						'SATARA');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SGB       ', 'SATSANG GHAR, BANDRA ',		'BANDRA'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SGL       ', 'Sangli',						'SANGLI'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SIL       ', 'Silvassa ',					'SILVASSA'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SIN       ', 'Singapore',					'Singapore'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SO        ', 'Solapur',					'SOLAPUR'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SRT       ', 'Surat',						'SURAT'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('THN       ', 'Thane ',						'VARANASI'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('TRI       ', 'Thiruvananthapuram',			'TRIVANDRUM');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('VA        ', 'Varanasi',					'THANE'		);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('VAD       ', 'Vadodara',					'VADODARA'	);
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('VAR       ', 'Varap ',						'ULHASNAGAR -I (VARAP)');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('VAS       ', 'VASCO-DE-GAMA ',				'VASCO DA GAMA');
INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('VLD       ', 'Valsad -Maroli ',			'MAROLI');

SELECT @cnt1 = COUNT(*)
			FROM SMS..satsang_centres sc
LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm ON sc.satsang_centre_id = scm.sms_id
WHERE sc.satsang_centre_id IS NOT NULL AND scm.sms_id IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some satsang centres in sms..satsang_centres that are not mapped in tmp_mgr_satsang_centre_mapping', 16, 0);
		SELECT sc.satsang_centre_id, sc.satsang_centre_nm
					FROM SMS..satsang_centres sc
		LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm ON sc.satsang_centre_id = scm.sms_id
		WHERE sc.satsang_centre_id IS NOT NULL AND scm.sms_id IS NULL;
	END;

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_relation_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_relation_mapping;

CREATE TABLE tmp_mgr_relation_mapping
(
	sms_id CHAR (5) CONSTRAINT	TmpMgrRelationMapping_PK_SmsId
						PRIMARY KEY	NONCLUSTERED,
	sms_nm gnc_nm,
	cdb_nm gnc_nm
);

INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('A    ', 'AUNTY',				'Aunty'			);	
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AIL  ', 'AUNTY-IN-LAW',		'Aunty'			);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('B    ', 'BROTHER',			'Brother'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BIL  ', 'BROTHER-IN-LAW',	'Brother-in-law');
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('COL  ', 'COLLEAGUE',			'Colleague'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('C    ', 'COUSIN',			'Cousin'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('D    ', 'DAUGHTER',			'Daughter'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('DIL  ', 'DAUGHTER-IN-LAW',	'Daughter-in-law');
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('EMPE ', 'EMPLOYEE',			'Employee'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('EMPR ', 'EMPLOYER',			'Employer'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('F    ', 'FATHER',			'Father'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('FIL  ', 'FATHER-IN-LAW',		'Father-in-law'	);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('FR   ', 'FRIEND',			'Friend'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GD   ', 'GRAND DAUGHTER',	'Grand Daughter');
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GS   ', 'GRAND SON',			'Grand Son'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GF   ', 'GRANDFATHER',		'Grand Father'	);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GM   ', 'GRANDMOTHER',		'Grand Mother'	);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('H    ', 'HUSBAND',			'Spouse'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('IL   ', 'IN LAWS',			'Father-in-law'	);	--To be changed manually to Mother-in-law (cdb_nm) on based on the relation_nm.
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('M    ', 'MOTHER',			'Mother'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MIL  ', 'MOTHER-IN-LAW',		'Mother-in-law'	);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NE   ', 'Neighbour',			'Neighbour'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NEP  ', 'NEPHEW',			'Nephew'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NI   ', 'NIECE',				'Niece'			);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('RE   ', 'RELATIVE',			'None'			);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SF   ', 'Satsang Friend',	'Friend'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SI   ', 'SISTER',			'Sister'		);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SIL  ', 'SISTER-IN-LAW',		'Sister-in-law'	);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('S    ', 'SON',				'Son'			);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SOIL ', 'SON-IN-LAW',		'Son-in-law'	);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('U    ', 'UNCLE',				'Uncle'			);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('UN   ', 'UNKNOWN',			'None'			);
INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('W    ', 'WIFE',				'Spouse'		);

SELECT @cnt1 = COUNT(*)
			FROM SMS..relationships r
LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm ON r.relationship_id = rm.sms_id
WHERE r.relationship_id IS NOT NULL AND rm.sms_id IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some relationships in sms..relationships that are not mapped in tmp_mgr_relation_mapping', 16, 0);
		SELECT r.relationship_id, r.relationship_nm
					FROM SMS..relationships r
		LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm ON r.relationship_id = rm.sms_id
		WHERE r.relationship_id IS NOT NULL AND rm.sms_id IS NULL;
	END;

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_gender_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_gender_mapping;

CREATE TABLE tmp_mgr_gender_mapping
(
	sms_gender CHAR (4) CONSTRAINT	TmpMgrGenderMapping_PK_SmsGender
							PRIMARY KEY	NONCLUSTERED,
	zsm_gender gender
);

INSERT INTO tmp_mgr_gender_mapping (sms_gender, zsm_gender) VALUES ('Gent', 'Male'	);
INSERT INTO tmp_mgr_gender_mapping (sms_gender, zsm_gender) VALUES ('Lady', 'Female');

SELECT @cnt1 = COUNT(*)
			FROM SMS..address_proofs sap
LEFT OUTER 	JOIN address_proofs zap ON zap.address_proof = sap.address_proof_id
WHERE sap.address_proof_id IS NOT NULL AND zap.address_proof IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some address_proof_id in sms..sewadars that are not in zsm..address_proofs', 16, 0);
		SELECT sap.address_proof_id
					FROM SMS..address_proofs sap
		LEFT OUTER 	JOIN address_proofs zap ON zap.address_proof = sap.address_proof_id
		WHERE sap.address_proof_id IS NOT NULL AND zap.address_proof IS NULL;
	END;

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_duplicate_sewadars' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_duplicate_sewadars;

CREATE TABLE tmp_mgr_duplicate_sewadars
(
	gender		CHAR (4),
	first_nm	CHAR (30),
	last_nm		CHAR (30),
	birth_dt	SMALLDATETIME,
	duplicate_type VARCHAR (30)
				CHECK 
				(duplicate_type IN
					(
						'Multiple Active',
						'Only Inactive Duplicate',
						'Only one Active with Inactive',
						'No Duplicate'
					)
				),
	duplicate_cnt INT,
	latest_status_dt SMALLDATETIME,
		CONSTRAINT	TmpMgrDuplicateSewadars_PK_Gender_FirstNm_LastNm_BirthDt
			PRIMARY KEY	NONCLUSTERED	(	gender, first_nm, last_nm, birth_dt	)
);

INSERT INTO tmp_mgr_duplicate_sewadars (gender, first_nm, last_nm, birth_dt, duplicate_type, duplicate_cnt)
	SELECT	gender, first_nm, last_nm, birth_dt, 'No Duplicate', COUNT (*)
	FROM	sms..sewadars
	GROUP	BY	gender, first_nm, last_nm, birth_dt
	HAVING COUNT (*) = 1;
	
INSERT INTO tmp_mgr_duplicate_sewadars (gender, first_nm, last_nm, birth_dt, duplicate_type, duplicate_cnt)
	SELECT	gender, first_nm, last_nm, birth_dt, 'No Duplicate', 1
	FROM	sms..sewadars
	WHERE sewadar_id = 'L07419'-- Indrawati Yadav
	
INSERT INTO tmp_mgr_duplicate_sewadars (gender, first_nm, last_nm, birth_dt, duplicate_type, duplicate_cnt)
	SELECT	gender, first_nm, last_nm, '1962-01-01 00:01:00', 'No Duplicate', 1
	FROM	sms..sewadars
	WHERE sewadar_id = 'L06871'-- Indrawati Yadav
	
INSERT INTO tmp_mgr_duplicate_sewadars (gender, first_nm, last_nm, birth_dt, duplicate_type, duplicate_cnt)
	SELECT	gender, first_nm, last_nm, birth_dt, 'Multiple Active', COUNT (*)
	FROM	sms..sewadars
	WHERE status IN ('Temporary           ', 'Permanent           ', 'Non-Initiate        ')
	AND sewadar_id NOT IN ('L07419', 'L06871')-- Indrawati Yadav
	GROUP	BY	gender, first_nm, last_nm, birth_dt
	HAVING COUNT (*) > 1;

INSERT INTO tmp_mgr_duplicate_sewadars (gender, first_nm, last_nm, birth_dt, duplicate_type, duplicate_cnt)
	SELECT	gender, first_nm, last_nm, birth_dt, 'Only one Active with Inactive', COUNT (*)
	FROM	sms..sewadars
	WHERE status IN ('Temporary           ', 'Permanent           ', 'Non-Initiate        ')
	AND sewadar_id NOT IN (SELECT s.sewadar_id FROM sms..sewadars s JOIN tmp_mgr_duplicate_sewadars ds ON
							ds.birth_dt = s.birth_dt AND ds.first_nm = s.first_nm AND ds.last_nm = s.last_nm AND ds.gender = s.gender
							WHERE ds.duplicate_type IN ('No duplicate', 'Multiple Active'))
	GROUP	BY	gender, first_nm, last_nm, birth_dt
	HAVING COUNT (*) = 1;

INSERT INTO tmp_mgr_duplicate_sewadars (gender, first_nm, last_nm, birth_dt, duplicate_type, duplicate_cnt, latest_status_dt)
	SELECT	gender, first_nm, last_nm, birth_dt, 'Only Inactive Duplicate', COUNT (*), MAX(status_dt)
	FROM	sms..sewadars
	WHERE status NOT IN ('Temporary           ', 'Permanent           ', 'Non-Initiate        ') AND
	sewadar_id NOT IN (SELECT s.sewadar_id FROM sms..sewadars s JOIN tmp_mgr_duplicate_sewadars ds ON
							ds.birth_dt = s.birth_dt AND ds.first_nm = s.first_nm AND ds.last_nm = s.last_nm AND ds.gender = s.gender
							WHERE ds.duplicate_type IN ('No duplicate', 'Multiple Active', 'Only one Active with Inactive'))
	GROUP	BY	gender, first_nm, last_nm, birth_dt
	HAVING COUNT (*) > 1;

-- ====================================================================================================
--	Satsang Centre Details
-- ====================================================================================================

INSERT INTO satsang_centres_details (satsang_centre_id, is_main_centre)
	SELECT satsang_centre_id, 'No' FROM CDB..satsang_centres csc WHERE csc.satsang_centre_id <> @centre_id;

-- ====================================================================================================
--	Sub Departments, Sub Departments Satsang Centres
-- ====================================================================================================

-- =============================================================================
INSERT INTO	sub_departments
		(	department_id, sub_department_cd, sub_department_nm	)
	SELECT	z.department_id, s.sub_department_id, s.sub_department_nm
	FROM	SMS..sub_departments	s
		JOIN	departments	z
			ON	(	z.department_cd	=	s.department_id	COLLATE SQL_Latin1_General_CP1_CI_AS
				);

-- =============================================================================
INSERT INTO	sub_departments_satsang_centres
		(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
	SELECT	u.sub_department_id, @centre_id, @active_eff_from, @active_eff_till
	FROM	SMS..sub_departments	s
		JOIN	departments	z
			ON	(	z.department_cd	=	s.department_id	COLLATE SQL_Latin1_General_CP1_CI_AS
			)
		JOIN	sub_departments	u
			ON	(	u.department_id	=	z.department_id
				AND	u.sub_department_cd	=	s.sub_department_id COLLATE SQL_Latin1_General_CP1_CI_AS
				)
	WHERE	is_active	=	'Yes';

INSERT INTO	sub_departments_satsang_centres
		(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
	SELECT	u.sub_department_id, @centre_id, @inactiv_eff_frm, @inactiv_eff_til
	FROM	SMS..sub_departments	s
		JOIN	departments	z
			ON	(	z.department_cd	=	s.department_id	COLLATE SQL_Latin1_General_CP1_CI_AS)
		JOIN	sub_departments	u
			ON	(	u.department_id	=	z.department_id
				AND	u.sub_department_cd	=	s.sub_department_id COLLATE SQL_Latin1_General_CP1_CI_AS
				)
	WHERE	is_active	=	'No';

-- ====================================================================================================
--	Satsang Centre Functionaries
-- ====================================================================================================

SELECT @cnt1 = COUNT(*)
			FROM SMS..centre_functionary scf
LEFT OUTER 	JOIN centre_functionaries zcf ON zcf.centre_functionary = scf.functionary
WHERE scf.functionary IS NOT NULL AND zcf.centre_functionary IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some functionary in sms..centre_functionary that are not in zsm..centre_functionaries', 16, 0);
		SELECT scf.functionary
					FROM SMS..centre_functionary scf
		LEFT OUTER 	JOIN centre_functionaries zcf ON zcf.centre_functionary = scf.functionary
		WHERE scf.functionary IS NOT NULL AND zcf.centre_functionary IS NULL;
	END;

INSERT INTO satsang_centre_functionaries
			(satsang_centre_id, centre_functionary, functionary_nm, is_current, effective_from, effective_till)
	SELECT	csc.satsang_centre_id, scf.functionary, scf.functionary_nm, LTRIM(RTRIM(scf.is_current)), scf.effective_from, scf.effective_till
	FROM sms..satsang_centre_functionaries scf
	JOIN tmp_mgr_satsang_centre_mapping scm ON scm.sms_id 				= scf.satsang_centre_id
	JOIN CDB..satsang_centres csc			ON csc.satsang_centre_nm 	= scm.cdb_nm AND csc.effective_till > GETDATE()

SELECT @cnt1 = COUNT(*)
			FROM SMS..sewadars s
LEFT OUTER 	JOIN sms..satsang_centre_functionaries scf ON s.outside_sewadar_secretary = scf.functionary_nm AND scf.functionary = 'Secretary'
WHERE s.outside_sewadar_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some outside_sewadar_secretary in sms..sewadars that are not in sms..satsang_centre_functionaries', 16, 0);
		SELECT DISTINCT s.outside_sewadar_secretary
					FROM SMS..sewadars s
		LEFT OUTER 	JOIN sms..satsang_centre_functionaries scf ON s.outside_sewadar_secretary = scf.functionary_nm
		WHERE s.outside_sewadar_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
	END;

SELECT @cnt1 = COUNT(*)
			FROM SMS..sewadars s
LEFT OUTER 	JOIN sms..satsang_centre_functionaries scf ON s.outside_sewadar_area_secretary = scf.functionary_nm  AND scf.functionary = 'Area Secretary'
WHERE s.outside_sewadar_area_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some outside_sewadar_area_secretary in sms..sewadars that are not in sms..satsang_centre_functionaries', 16, 0);
		SELECT DISTINCT s.outside_sewadar_area_secretary
					FROM SMS..sewadars s
		LEFT OUTER 	JOIN sms..satsang_centre_functionaries scf ON s.outside_sewadar_area_secretary = scf.functionary_nm  AND scf.functionary = 'Area Secretary'
		WHERE s.outside_sewadar_area_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
	END;

-- ====================================================================================================
--	Post Offices or Cities
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM SMS..pos_or_cities;
INSERT INTO post_offices_or_cities
			(district_id, post_office_or_city_cd, post_office_or_city_nm, std_code, effective_from, effective_till)
	SELECT	cd.district_or_city_id, LTRIM(RTRIM(p.po_or_city_id)), p.po_or_city_nm, p.po_or_city_std_code,
			CASE WHEN p.is_active = 'Yes' THEN @active_eff_from ELSE @inactiv_eff_frm END,
			CASE WHEN p.is_active = 'Yes' THEN @active_eff_till ELSE @inactiv_eff_til END
	FROM SMS..pos_or_cities p 
	JOIN SMS..districts d ON d.district_id = p.district_id AND d.state_id = p.state_id AND d.country_id = p.country_id
	JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id
	JOIN SMS..countries c ON c.country_id = d.country_id
	JOIN CDB..countries cc ON cc.country_nm = c.country_nm AND cc.effective_till > GETDATE()
	JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm AND cs.effective_till > GETDATE()
	JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = d.district_nm AND cd.effective_till > GETDATE();
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Post Offices or Cities do not match', 16, 0);

-- ====================================================================================================
--	Sewadars
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sms_sewadar_system_record' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_sms_sewadar_system_record;

CREATE TABLE tmp_mgr_sms_sewadar_system_record
(
	system_id INT,
	sewadar_id sewadar_grno,
	PRIMARY KEY (system_id, sewadar_id)
);

INSERT INTO tmp_mgr_sms_sewadar_system_record (system_id, sewadar_id) SELECT system_id, sewadar_id FROM SMS..sewadar_system_record

-- Temporary for new centre migration post Mumbai
--INSERT INTO tmp_mgr_sms_sewadar_system_record (system_id, sewadar_id)
--	SELECT system_id, sewadar_id FROM SMS..sewadar_system_record WHERE sewadar_id NOT IN 
--		(SELECT ss.sewadar_id FROM sewadars s JOIN tmp_mgr_gender_mapping g ON g.zsm_gender = s.gender
--		JOIN SMS..sewadars ss ON ss.first_nm = s.first_nm AND ss.last_nm = s.last_nm AND ss.gender = g.sms_gender AND 
--			ss.birth_dt = s.birth_dtm)

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sms_new_sewadar_ids' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_sms_new_sewadar_ids;

CREATE TABLE tmp_mgr_sms_new_sewadar_ids
 (
	add_to_max_system_id INT IDENTITY(1,1) PRIMARY KEY,
	sewadar_id sewadar_grno,
 );
 
INSERT INTO tmp_mgr_sms_new_sewadar_ids (sewadar_id)
	SELECT sewadar_id from sms..sewadar_system_record WHERE system_id IN(
		SELECT	system_id
		FROM	sms..sewadar_system_record
		GROUP	BY	system_id
		HAVING COUNT (*) > 1
		) AND effective_dt > '2010-12-15 00:00:00' order by system_id
		
UPDATE t
	SET system_id = (SELECT MAX(system_id) FROM SMS..sewadar_system_record) + i.add_to_max_system_id
	FROM tmp_mgr_sms_sewadar_system_record t
	JOIN tmp_mgr_sms_new_sewadar_ids i ON t.sewadar_id = i.sewadar_id

SELECT @cnt1 = COUNT(*) FROM sms..sewadar_system_record ssr1 WHERE ssr1.system_id IN
	(SELECT	system_id
	FROM	tmp_mgr_sms_sewadar_system_record
	GROUP	BY	system_id
	HAVING COUNT (*) > 1);
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are multiple GR Nos for a System ID', 16, 0);
		SELECT	system_id
		FROM	tmp_mgr_sms_sewadar_system_record
		GROUP	BY	system_id
		HAVING COUNT (*) > 1;
	END;
GO

DECLARE
	@centre_id			INT,
	@active_eff_from	DATETIME,
	@active_eff_till	DATETIME,
	@inactiv_eff_frm	DATETIME,
	@inactiv_eff_til	DATETIME,
	@dummy_initiation_dt DATETIME,
	@none_relation_id	INT,
	@cnt1				INT,
	@cnt2				INT,
	@cnt3				INT,
	@cnt4				INT,
	@not_known_initiation_place_id				INT,
	@team_wise_daily_attendance_screen_id		CHAR(6),
	@arbitrary_daily_presences_screen_id		CHAR(6),
	@arbitrary_shift_presences_screen_id		CHAR(6),
	@arbitrary_summarised_exemptions_screen_id	CHAR(6),
	@sewadar_wise_sewa_summaries_screen_id		CHAR(6);

	SELECT @centre_id		= satsang_centre_id FROM CDB..satsang_centres WHERE satsang_centre_nm = 'BHAYANDAR'; -- 6015
	SET	@active_eff_from 	= '01-Jan-2000';
	SET @active_eff_till	= '31-Dec-9999';
	SET @inactiv_eff_frm	= '01-Jan-2000';
	SET @inactiv_eff_til	= '31-Dec-2009';
	SET @dummy_initiation_dt = '01-Jan-1991';
	SELECT @none_relation_id = relation_id FROM CDB..relations WHERE relation_nm = 'None'; -- 6
	SELECT @not_known_initiation_place_id = place_id FROM CDB..initiation_places WHERE place_nm = 'NOT KNOWN'; -- 73
	SET @team_wise_daily_attendance_screen_id		= 'ATT_05';
	SET @arbitrary_daily_presences_screen_id		= 'ATT_02';
	SET @arbitrary_shift_presences_screen_id		= 'ATT_06';
	SET @arbitrary_summarised_exemptions_screen_id	= 'ATT_03';
	SET @sewadar_wise_sewa_summaries_screen_id		= 'ATT_01';

SET IDENTITY_INSERT sewadars ON
INSERT INTO sewadars
			(sewadar_id, first_nm, middle_nm, last_nm, gender, birth_dtm, is_married, initiation_dt, initiation_place_id, initiation_by,
			current_satsang_centre_id, current_sewadar_grno, global_sewadar_status_cd, global_sewadar_status_dt)
	SELECT 	ssr.system_id, LTRIM(RTRIM(s.first_nm)), LTRIM(RTRIM(s.middle_nm)), LTRIM(RTRIM(s.last_nm)), gm.zsm_gender, s.birth_dt, LTRIM(RTRIM(s.is_married)), s.initiation_dt,
		CASE WHEN s.initiation_dt IS NOT NULL THEN CASE WHEN s.initiation_place IS NOT NULL THEN ip.place_id ELSE @not_known_initiation_place_id END ELSE NULL END,
		CASE WHEN s.initiation_dt IS NOT NULL THEN CASE WHEN s.initiation_by IS NOT NULL THEN s.initiation_by ELSE 0 END ELSE NULL END, --Temporary setting patron_id = 0 if initiation_by is NULL and initiation_dt is not NULL
			NULL, NULL, ss.sewadar_status_cd, CASE WHEN ss.sewadar_status_cd IS NOT NULL THEN s.status_dt END
	FROM sms..sewadars s
	JOIN tmp_mgr_duplicate_sewadars ds ON s.birth_dt = ds.birth_dt AND s.first_nm = ds.first_nm AND s.last_nm = ds.last_nm AND
		s.gender = ds.gender AND (ds.duplicate_type = 'No Duplicate' OR
		(ds.duplicate_type = 'Only one Active with Inactive' AND s.status IN ('Temporary           ', 'Permanent           ', 'Non-Initiate        ')) OR
		(ds.duplicate_type = 'Only Inactive Duplicate' AND s.status_dt = ds.latest_status_dt))
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.sewadar_id = s.sewadar_id
	JOIN tmp_mgr_gender_mapping gm ON gm.sms_gender = s.gender
	LEFT OUTER JOIN tmp_mgr_initiation_place_mapping im ON im.sms_initiation_place = s.initiation_place
	LEFT OUTER JOIN CDB..initiation_places ip ON ip.place_nm = im.cdb_initiation_place_nm
	JOIN tmp_mgr_sewadar_status_mapping sm ON sm.sms_status = s.status
	LEFT OUTER JOIN sewadar_status ss ON ss.sewadar_status_nm = sm.zsm_global_sewadar_status_nm
	WHERE s.sewadar_id NOT IN ('L06871', 'L07419') -- Indrawati Yadav

INSERT INTO sewadars
			(sewadar_id, first_nm, middle_nm, last_nm, gender, birth_dtm, is_married, initiation_dt, initiation_place_id, initiation_by,
			current_satsang_centre_id, current_sewadar_grno, global_sewadar_status_cd, global_sewadar_status_dt)
	SELECT 	ssr.system_id, LTRIM(RTRIM(s.first_nm)), LTRIM(RTRIM(s.middle_nm)), LTRIM(RTRIM(s.last_nm)), gm.zsm_gender, s.birth_dt, LTRIM(RTRIM(s.is_married)), s.initiation_dt,
		CASE WHEN s.initiation_dt IS NOT NULL THEN CASE WHEN s.initiation_place IS NOT NULL THEN ip.place_id ELSE @not_known_initiation_place_id END ELSE NULL END,
		CASE WHEN s.initiation_dt IS NOT NULL THEN CASE WHEN s.initiation_by IS NOT NULL THEN s.initiation_by ELSE 0 END ELSE NULL END, --Temporary setting patron_id = 0 if initiation_by is NULL and initiation_dt is not NULL
			NULL, NULL, ss.sewadar_status_cd, CASE WHEN ss.sewadar_status_cd IS NOT NULL THEN s.status_dt END
	FROM sms..sewadars s
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.sewadar_id = s.sewadar_id
	JOIN tmp_mgr_gender_mapping gm ON gm.sms_gender = s.gender
	LEFT OUTER JOIN tmp_mgr_initiation_place_mapping im ON im.sms_initiation_place = s.initiation_place
	LEFT OUTER JOIN CDB..initiation_places ip ON ip.place_nm = im.cdb_initiation_place_nm
	JOIN tmp_mgr_sewadar_status_mapping sm ON sm.sms_status = s.status
	LEFT OUTER JOIN sewadar_status ss ON ss.sewadar_status_nm = sm.zsm_global_sewadar_status_nm
	WHERE s.sewadar_id IN ('L07419') -- Indrawati Yadav

INSERT INTO sewadars
			(sewadar_id, first_nm, middle_nm, last_nm, gender, birth_dtm, is_married, initiation_dt, initiation_place_id, initiation_by,
			current_satsang_centre_id, current_sewadar_grno, global_sewadar_status_cd, global_sewadar_status_dt)
	SELECT 	ssr.system_id, LTRIM(RTRIM(s.first_nm)), LTRIM(RTRIM(s.middle_nm)), LTRIM(RTRIM(s.last_nm)), gm.zsm_gender, '1962-01-01 00:01:00', LTRIM(RTRIM(s.is_married)), 
		s.initiation_dt,
		CASE WHEN s.initiation_dt IS NOT NULL THEN CASE WHEN s.initiation_place IS NOT NULL THEN ip.place_id ELSE @not_known_initiation_place_id END ELSE NULL END,
		CASE WHEN s.initiation_dt IS NOT NULL THEN CASE WHEN s.initiation_by IS NOT NULL THEN s.initiation_by ELSE 0 END ELSE NULL END, --Temporary setting patron_id = 0 if initiation_by is NULL and initiation_dt is not NULL
			NULL, NULL, ss.sewadar_status_cd, CASE WHEN ss.sewadar_status_cd IS NOT NULL THEN s.status_dt END
	FROM sms..sewadars s
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.sewadar_id = s.sewadar_id
	JOIN tmp_mgr_gender_mapping gm ON gm.sms_gender = s.gender
	LEFT OUTER JOIN tmp_mgr_initiation_place_mapping im ON im.sms_initiation_place = s.initiation_place
	LEFT OUTER JOIN CDB..initiation_places ip ON ip.place_nm = im.cdb_initiation_place_nm
	JOIN tmp_mgr_sewadar_status_mapping sm ON sm.sms_status = s.status
	LEFT OUTER JOIN sewadar_status ss ON ss.sewadar_status_nm = sm.zsm_global_sewadar_status_nm
	WHERE s.sewadar_id IN ('L06871') -- Indrawati Yadav

SELECT @cnt1 = COUNT(*) FROM tmp_mgr_duplicate_sewadars WHERE duplicate_type = 'Multiple Active';
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are sewadars having multiple entries with active status. These sewadars needs to be added manually', 16, 0);
		SELECT * from tmp_mgr_duplicate_sewadars WHERE duplicate_type = 'Multiple Active';
	END;
SET IDENTITY_INSERT sewadars OFF

SELECT @cnt1 = COUNT (*) FROM SMS..sewadars ss1 WHERE ss1.sewadar_id IN 
	(SELECT MAX(ss2.sewadar_id) FROM sms..sewadars ss2 GROUP BY ss2.gender, ss2.first_nm, ss2.last_nm, ss2.birth_dt);
SELECT @cnt2 = COUNT(*) FROM sewadars;
IF (@cnt1 != @cnt2 - 1) -- -1 for Indrawati Yadav
	RAISERROR ('Counts of Distinct Sewadars do not match', 16, 0);

-- Correcting the patron_id for cases where initiation_by is NULL and initiation_dt is not NULL
UPDATE zs
	SET zs.initiation_by = cp.patron_id
	FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
	JOIN CDB..patrons cp ON cp.initiation_from <= ss.initiation_dt AND ss.initiation_dt <= COALESCE(cp.initiation_till, GETDATE())
	WHERE ss.initiation_by IS NULL AND ss.initiation_dt IS NOT NULL;

-- ====================================================================================================
--	House Keeping
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewadar_system_record' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_sewadar_system_record;

CREATE TABLE tmp_mgr_sewadar_system_record
(
	system_id	INT,
	sewadar_id	sewadar_grno,
	CONSTRAINT	PK_TmpMgrSewadarSystemRecord
					PRIMARY KEY		(system_id, sewadar_id)
);

INSERT INTO tmp_mgr_sewadar_system_record
	SELECT ssr.system_id, ssr.sewadar_id
	FROM tmp_mgr_sms_sewadar_system_record ssr
	JOIN sewadars s ON s.sewadar_id = ssr.system_id;

INSERT INTO tmp_mgr_sewadar_system_record
	SELECT ssr1.system_id, ss2.sewadar_id
	FROM tmp_mgr_sms_sewadar_system_record ssr1
	JOIN sewadars s ON s.sewadar_id = ssr1.system_id
	JOIN SMS..sewadars ss1 ON ss1.sewadar_id = ssr1.sewadar_id
	JOIN tmp_mgr_duplicate_sewadars ds ON ds.birth_dt = ss1.birth_dt AND ds.gender = ss1.gender AND ds.first_nm = ss1.first_nm AND ds.last_nm = ss1.last_nm
	JOIN SMS..sewadars ss2 ON (ss2.birth_dt = ds.birth_dt AND ss2.gender = ds.gender AND ss2.first_nm = ds.first_nm AND ss2.last_nm = ds.last_nm) AND
		((ds.duplicate_type = 'Only Inactive Duplicate' AND ds.latest_status_dt <> ss2.status_dt) OR
		(ds.duplicate_type = 'Only one Active with Inactive' AND ss2.status NOT IN ('Temporary           ', 'Permanent           ', 'Non-Initiate        ')));
	
-- ====================================================================================================
--	Sewadars Details
-- ====================================================================================================

INSERT INTO sewadars_details
			(sewadar_id, address_proof, other_address_proof, telephone_mobile, telephone_residence, telephone_office, occupation,
			attends_weekly_satsang, weekly_satsang_centre_id, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy, any_disability)
	SELECT 	s.sewadar_id, ss.address_proof_id, ss.other_address_proof, ss.telephone_mobile, ss.telephone_residence, ss.telephone_office, om.zsm_occupation,
			LTRIM(RTRIM(ss.is_attend_weekly_satsang)), csc.satsang_centre_id, LTRIM(RTRIM(ss.has_hypertension)), LTRIM(RTRIM(ss.is_diabetic)), 
			LTRIM(RTRIM(ss.has_skin_problem)), LTRIM(RTRIM(ss.has_epillepsy)), LTRIM(RTRIM(ss.any_disability))
	FROM sewadars s
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
	JOIN tmp_mgr_occupation_mapping om ON om.sms_occupation = ss.occupation
	LEFT OUTER JOIN tmp_mgr_satsang_centre_mapping scm ON scm.sms_id = ss.weekly_satsang_centre_id
	LEFT OUTER JOIN CDB..satsang_centres csc ON csc.satsang_centre_nm = scm.cdb_nm AND csc.effective_till > GETDATE();

SELECT @cnt1 = COUNT(*) FROM sewadars;
SELECT @cnt2 = COUNT(*) FROM sewadars_details;
IF (@cnt1 != @cnt2) -- -1 for Indrawati Yadav
	RAISERROR ('Sewadars Details not entered for all Sewadars', 16, 0);

-- Mapping other_address_proof to new address_proof in ZSM
UPDATE sewadars_details
	SET address_proof = 'Purchase deed',
		other_address_proof = NULL
	WHERE other_address_proof IN ('Purchase Agreement', 'Sale Agreement', 'Agreement For Sale', 'Agreement Of Sale', 'Agreement For Sale.');

UPDATE sewadars_details
	SET address_proof = 'Sr Citizen	Card',
		other_address_proof = NULL
	WHERE other_address_proof IN ('Senior Citizen Card.', 'Senior Citizens Card', 'Senior Citizen Certi', 'Sr. Citizens Id Card', 'Senior Citizen''s Id', 
			'Sr Citizens I D Card', 'Senior Citizen Card', 'Sr.citizen I D Card', 'Senior Citizen Id', 'Senior Citizen I D', 'Senior Citizens Id');

UPDATE sewadars_details
	SET address_proof = 'Rent Agreement',
		other_address_proof = NULL
	WHERE other_address_proof IN ('House Agreement', 'L & L Agreement', 'LEAVE & LICENCE', 'Agreement Papers', 'Agreement Of Leave', 'Leave Lic. Agreement',
			'License', 'Flat Agreement', 'Agreement', 'Agreement Deed', 'Agreement Copy');

UPDATE sewadars_details
	SET address_proof = 'Society Receipt',
		other_address_proof = NULL
	WHERE other_address_proof IN ('Maintenance Receipt');

UPDATE sewadars_details
	SET address_proof = 'Property Tax',
		other_address_proof = NULL
	WHERE other_address_proof IN ('Property Tax Paper');

UPDATE sewadars_details
	SET address_proof = 'Voter''s Card',
		other_address_proof = NULL
	WHERE other_address_proof IN ('VOTER ID CARD', 'Rent Recpt, Voter Id');

UPDATE sewadars_details
	SET address_proof = 'Ration Card',
		other_address_proof = NULL
	WHERE other_address_proof IN ('Uncles Ration Card', 'Navy Ration Issue Cd');

-- ====================================================================================================
--	Sewadars Addresses
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM sewadars;
INSERT INTO sewadars_addresses
			(sewadar_id, address_type, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code)
	SELECT	zs.sewadar_id, 'Residence', ss.residence_address_line_1, ss.residence_address_line_2, zp.post_office_or_city_id, ss.residence_pincode
	FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id	
	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
	JOIN SMS..pos_or_cities p ON p.country_id = ss.residence_country_id AND p.state_id = ss.residence_state_id AND
		p.district_id = ss.residence_district_id AND p.po_or_city_id = ss.residence_po_or_city_id
	JOIN SMS..districts d ON d.district_id = p.district_id AND d.state_id = p.state_id AND d.country_id = p.country_id
	JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id
	JOIN SMS..countries c ON c.country_id = d.country_id
	JOIN CDB..countries cc ON cc.country_nm = c.country_nm AND cc.effective_till > GETDATE()
	JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm AND cs.effective_till > GETDATE()
	JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = d.district_nm AND cd.effective_till > GETDATE()
	JOIN post_offices_or_cities zp ON zp.district_id = cd.district_or_city_id AND zp.post_office_or_city_nm = p.po_or_city_nm;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewadars Addresses do not match', 16, 0);

-- ====================================================================================================
--	Sewadars Skills
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT ssr.system_id, ss.specialisation_id FROM tmp_mgr_sewadar_system_record ssr
						JOIN SMS..sewadar_specialisations ss ON ss.sewadar_id = ssr.sewadar_id) t;
INSERT INTO sewadars_skills
			(sewadar_id, skill_id, skill_sq)
	SELECT	s.sewadar_id, cs.skill_id, ss.serial_id
	FROM sewadars s
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
	JOIN sms..sewadar_specialisations ss ON ss.sewadar_id = ssr.sewadar_id
	JOIN sms..specialisation_areas sa ON sa.specialisation_id = ss.specialisation_id
	JOIN cdb..skills cs ON cs.skill_nm = sa.specialisation_nm;
SET @cnt2 = @@ROWCOUNT;

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewadars_skills' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_sewadars_skills;

CREATE TABLE tmp_mgr_sewadars_skills
(
	sewadar_id	sewadar_id,
	skill_id	skill_id,
	skill_sq	display_order,
	CONSTRAINT TmpMgrSewadarsSkills_PK PRIMARY KEY
		(sewadar_id, skill_id)
);

INSERT INTO tmp_mgr_sewadars_skills (sewadar_id, skill_id)
	SELECT	DISTINCT zssr.system_id, cs.skill_id
	FROM tmp_mgr_sewadar_system_record zssr 
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id <> zssr.system_id AND ssr.sewadar_id = zssr.sewadar_id 
	JOIN sms..sewadar_specialisations ss ON ss.sewadar_id = ssr.sewadar_id
	JOIN sms..specialisation_areas sa ON sa.specialisation_id = ss.specialisation_id
	JOIN cdb..skills cs ON cs.skill_nm = sa.specialisation_nm;

UPDATE t
	SET skill_sq = (SELECT COUNT(*)
		FROM tmp_mgr_sewadars_skills ss1
		JOIN tmp_mgr_sewadars_skills ss2 ON ss1.sewadar_id = ss2.sewadar_id AND ss1.skill_id <= ss2.skill_id
		WHERE ss1.sewadar_id = t.sewadar_id AND ss1.skill_id = t.skill_id
		GROUP BY ss1.sewadar_id, ss1.skill_id)		
	FROM tmp_mgr_sewadars_skills t;

INSERT INTO sewadars_skills
			(sewadar_id, skill_id, skill_sq)
	SELECT	ss.sewadar_id, ss.skill_id, (SELECT COALESCE(MAX(s.skill_sq), 0) FROM sewadars_skills s WHERE s.sewadar_id = ss.sewadar_id) + ss.skill_sq
	FROM tmp_mgr_sewadars_skills ss WHERE ss.skill_id NOT IN 
		(SELECT t.skill_id FROM sewadars_skills t WHERE t.sewadar_id = ss.sewadar_id);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewadars Skills do not match', 16, 0);

-- ====================================================================================================
--	Sewadars Remarks
-- ====================================================================================================
IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewadars_remarks' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_sewadars_remarks;

CREATE TABLE tmp_mgr_sewadars_remarks
(
	sewadar_id		sewadar_id,
	sewadar_grno	sewadar_grno,
	remarks_type	remarks_type,
	remarks			VARCHAR(200),
	remarks_sq		display_order
		CONSTRAINT	TmpMgrSewadarsRemarks_PK_SewadarGrno_RemarksType
			PRIMARY KEY	NONCLUSTERED	(	sewadar_grno, remarks_type	)
);

-- Annotations
INSERT INTO tmp_mgr_sewadars_remarks
			(sewadar_id, sewadar_grno, remarks_type, remarks, remarks_sq)
	SELECT	ssr.system_id, ssr.sewadar_id, 'Annotations', ss.annotations, NULL
	FROM tmp_mgr_sewadar_system_record ssr
	JOIN SMS..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
	WHERE ss.annotations IS NOT NULL;
		
UPDATE t
	SET t.remarks_sq = (SELECT COUNT(*)		
		FROM tmp_mgr_sewadars_remarks sr1
		JOIN tmp_mgr_sewadars_remarks sr2 ON sr1.sewadar_id = sr2.sewadar_id AND sr1.remarks <= sr2.remarks AND sr1.remarks_type = 'Annotations' AND sr2.remarks_type = 'Annotations'
		WHERE sr1.sewadar_id = t.sewadar_id AND sr1.remarks = t.remarks AND t.remarks_type = 'Annotations'
		GROUP BY sr1.sewadar_id, sr1.remarks)
	FROM tmp_mgr_sewadars_remarks t
	WHERE t.remarks_type = 'Annotations';
	
INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'Annotations', 1, SUBSTRING(tsr.remarks, 1, 91) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'Annotations' AND tsr.remarks_sq = 1

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'Annotations', 2, SUBSTRING(tsr.remarks, 92, 91) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'Annotations' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 91

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'Annotations', 3, SUBSTRING(tsr.remarks, 183, 100) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'Annotations' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 182

SELECT @cnt1 = MAX(remarks_sq) FROM tmp_mgr_sewadars_remarks WHERE remarks_type = 'Annotations';
IF (@cnt1 > 1)
	RAISERROR ('Some more Remarks (type Annotations) needs to be migrated', 16, 0);

SELECT @cnt1 = COUNT(*) FROM sewadars s1 WHERE sewadar_id IN 
	(SELECT DISTINCT s2.sewadar_id
		FROM sewadars s2
		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s2.sewadar_id
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
		where ss.annotations IS NOT NULL);
SELECT @cnt2 = COUNT(*) FROM sewadars s1 WHERE sewadar_id IN
	(SELECT DISTINCT sewadar_id FROM sewadars_remarks WHERE remarks_type = 'Annotations');
IF (@cnt1 <> @cnt2)
	RAISERROR ('Sewadars Remarks (type Annotations) not entered for all Sewadars', 16, 0);

SET @cnt1 = 
	(SELECT COUNT(*) FROM sewadars s
		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
		WHERE ss.annotations IS NOT NULL AND LEN(ss.annotations) < 92) + 
	2*(SELECT COUNT(*) FROM sewadars s
		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
		WHERE ss.annotations IS NOT NULL AND LEN(ss.annotations) > 91 AND LEN(ss.annotations) < 183) + 
	3*(SELECT COUNT(*) FROM sewadars s
		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
		WHERE ss.annotations IS NOT NULL AND LEN(ss.annotations) > 182);
SELECT @cnt2 = COUNT (*) FROM sewadars_remarks WHERE remarks_type = 'Annotations';
IF (@cnt1 <> @cnt2)
	RAISERROR ('Sewadars Remarks (type Annotations) not entered for all Grno', 16, 0);

-- Adding annotations for incorrect initiation dates. These dates does not fall under initiation period of any Patron.
INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	zs.sewadar_id, 'Annotations', 
		(SELECT COALESCE(MAX(sr.remarks_sq), 0) FROM sewadars_remarks sr WHERE sr.sewadar_id = zs.sewadar_id AND sr.remarks_type = 'Annotations') + 1,
		ssr.sewadar_id + ' has incorrect initiation date'
	FROM sewadars zs
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
	WHERE zs.initiation_by = 0

-- To do notes
INSERT INTO tmp_mgr_sewadars_remarks
			(sewadar_id, sewadar_grno, remarks_type, remarks, remarks_sq)
	SELECT	ssr.system_id, ssr.sewadar_id, 'To do notes', ss.to_do_notes, NULL
	FROM tmp_mgr_sewadar_system_record ssr
	JOIN SMS..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
	WHERE ss.to_do_notes IS NOT NULL;
		
UPDATE t
	SET t.remarks_sq = (SELECT COUNT(*)		
		FROM tmp_mgr_sewadars_remarks sr1
		JOIN tmp_mgr_sewadars_remarks sr2 ON sr1.sewadar_id = sr2.sewadar_id AND sr1.remarks <= sr2.remarks AND sr1.remarks_type = 'To do notes' AND sr2.remarks_type = 'To do notes'
		WHERE sr1.sewadar_id = t.sewadar_id AND sr1.remarks = t.remarks AND t.remarks_type = 'To do notes'
		GROUP BY sr1.sewadar_id, sr1.remarks)
	FROM tmp_mgr_sewadars_remarks t
	WHERE t.remarks_type = 'To do notes';
	
INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'To do notes', 1, SUBSTRING(tsr.remarks, 1, 91) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'To do notes' AND tsr.remarks_sq = 1

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'To do notes', 2, SUBSTRING(tsr.remarks, 92, 91) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'To do notes' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 91

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'To do notes', 3, SUBSTRING(tsr.remarks, 183, 100) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'To do notes' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 182

SELECT @cnt1 = MAX(remarks_sq) FROM tmp_mgr_sewadars_remarks WHERE remarks_type = 'To do notes';
IF (@cnt1 > 1)
	RAISERROR ('Some more Remarks (type "To do notes") needs to be migrated', 16, 0);

SELECT @cnt1 = COUNT(*) FROM sewadars s1 WHERE s1.sewadar_id IN
	(SELECT DISTINCT s2.sewadar_id
	FROM sewadars s2
	JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s2.sewadar_id
	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
	WHERE ss.to_do_notes IS NOT NULL);
SELECT @cnt2 = COUNT(*) FROM sewadars s1 WHERE s1.sewadar_id IN 
	(SELECT DISTINCT sewadar_id FROM sewadars_remarks WHERE remarks_type = 'To do notes');
IF (@cnt1 <> @cnt2)
	RAISERROR ('Sewadars Remarks (type "To do notes") not entered for all Sewadars', 16, 0);

SET @cnt1 = 
	(SELECT COUNT(*) FROM sewadars s
		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
		WHERE ss.to_do_notes IS NOT NULL AND LEN(ss.to_do_notes) < 92) + 
	2*(SELECT COUNT(*) FROM sewadars s
		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
		WHERE ss.to_do_notes IS NOT NULL AND LEN(ss.to_do_notes) > 91 AND LEN(ss.to_do_notes) < 183) + 
	3*(SELECT COUNT(*) FROM sewadars s
		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
		WHERE ss.to_do_notes IS NOT NULL AND LEN(ss.to_do_notes) > 182);
SELECT @cnt2 = COUNT (*) FROM sewadars_remarks WHERE remarks_type = 'To do notes';
IF (@cnt1 <> @cnt2)
	RAISERROR ('Sewadars Remarks (type "To do notes") not entered for all Grno', 16, 0);

-- Remarks
INSERT INTO tmp_mgr_sewadars_remarks
			(sewadar_id, sewadar_grno, remarks_type, remarks, remarks_sq)
	SELECT	ssr.system_id, ssr.sewadar_id, 'Remarks', ss.remarks, NULL
	FROM tmp_mgr_sewadar_system_record ssr
	JOIN SMS..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
	WHERE ss.remarks IS NOT NULL;
		
UPDATE t
	SET t.remarks_sq = (SELECT COUNT(*)		
		FROM tmp_mgr_sewadars_remarks sr1
		JOIN tmp_mgr_sewadars_remarks sr2 ON sr1.sewadar_id = sr2.sewadar_id AND sr1.remarks <= sr2.remarks AND sr1.remarks_type = 'Remarks' AND sr2.remarks_type = 'Remarks'
		WHERE sr1.sewadar_id = t.sewadar_id AND sr1.remarks = t.remarks AND t.remarks_type = 'Remarks'
		GROUP BY sr1.sewadar_id, sr1.remarks)
	FROM tmp_mgr_sewadars_remarks t
	WHERE t.remarks_type = 'Remarks';

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'Remarks', 1, SUBSTRING(tsr.remarks, 1, 91) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 1

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'Remarks', 2, SUBSTRING(tsr.remarks, 92, 91) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 91

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'Remarks', 3, SUBSTRING(tsr.remarks, 183, 100) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 182

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'Remarks', 
		(SELECT COALESCE(MAX(sr.remarks_sq), 0) FROM sewadars_remarks sr WHERE sr.sewadar_id = tsr.sewadar_id AND sr.remarks_type = 'Remarks') + 1, 
		SUBSTRING(tsr.remarks, 1, 91) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 2

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'Remarks',
		(SELECT COALESCE(MAX(sr.remarks_sq), 0) FROM sewadars_remarks sr WHERE sr.sewadar_id = tsr.sewadar_id AND sr.remarks_type = 'Remarks') + 1,
		SUBSTRING(tsr.remarks, 92, 91) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 2 AND LEN(tsr.remarks) > 91

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	tsr.sewadar_id, 'Remarks',
		(SELECT COALESCE(MAX(sr.remarks_sq), 0) FROM sewadars_remarks sr WHERE sr.sewadar_id = tsr.sewadar_id AND sr.remarks_type = 'Remarks') + 1,
		SUBSTRING(tsr.remarks, 183, 100) + ' [' + tsr.sewadar_grno + ']'
	FROM tmp_mgr_sewadars_remarks tsr
	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 2 AND LEN(tsr.remarks) > 182

SELECT @cnt1 = MAX(remarks_sq) FROM tmp_mgr_sewadars_remarks WHERE remarks_type = 'Remarks';
IF (@cnt1 > 2)
	RAISERROR ('Some more Remarks (type Remarks) needs to be migrated', 16, 0);

SELECT @cnt1 = COUNT(*) FROM sewadars s1 WHERE s1.sewadar_id IN
	(SELECT DISTINCT s.sewadar_id FROM sewadars s
	JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
	where ss.remarks IS NOT NULL);

SELECT @cnt2 = COUNT(*) FROM sewadars s1 WHERE s1.sewadar_id IN
	(SELECT DISTINCT sewadar_id FROM sewadars_remarks WHERE remarks_type = 'Remarks');
IF (@cnt1 <> @cnt2)
	RAISERROR ('Sewadars Remarks (type Remarks) not entered for all Sewadars', 16, 0);

SET @cnt1 =
	(SELECT COUNT(*) FROM sewadars s
		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
		WHERE ss.remarks IS NOT NULL AND LEN(ss.remarks) < 92) +
	2*(SELECT COUNT(*) FROM sewadars s
		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
		WHERE ss.remarks IS NOT NULL AND LEN(ss.remarks) > 91 AND LEN(ss.remarks) < 183) +
	3*(SELECT COUNT(*) FROM sewadars s
		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
		WHERE ss.remarks IS NOT NULL AND LEN(ss.remarks) > 182);
SELECT @cnt2 = COUNT (*) FROM sewadars_remarks WHERE remarks_type = 'Remarks';
IF (@cnt1 <> @cnt2)
	RAISERROR ('Sewadars Remarks (type Remarks) not entered for all Grno', 16, 0);

-- ====================================================================================================
--	Sewadars Registrations
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM tmp_mgr_sms_sewadar_system_record;
INSERT INTO sewadars_registrations
			(satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt, sewadar_status_cd,
			sewadar_status_dtm, responsibility, responsibility_dtm, reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id,
			reference_1_department, reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department, sponsorer_id,
			area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, weekly_sewa_location_id, weekly_department_id)
	SELECT	@centre_id, ss.sewadar_id, ssr.system_id, appointment_dt, LTRIM(RTRIM(ss.is_emigrant)), ddpt.department_id, dsdpt.sub_department_id, ss.department_dt,
		zss.sewadar_status_cd, ss.status_dt,
		CASE WHEN ss.responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ') THEN LTRIM(RTRIM(ss.responsibility)) ELSE NULL END,
		CASE WHEN ss.responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ') THEN ss.responsibility_dt ELSE NULL END, 
		CASE WHEN ss.reference_1_sewadar_id IS NOT NULL THEN ssr1.system_id ELSE NULL END,
		CASE WHEN ss.reference_1_relationship IS NOT NULL THEN cr1.relation_id ELSE @none_relation_id END,
		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN LTRIM(RTRIM(ss.reference_1_nm)) ELSE NULL END,
		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN CASE WHEN ss.reference_1_nm IS NOT NULL THEN CASE WHEN ss.reference_1_centre_id IS NOT NULL THEN 
			csc1.satsang_centre_id ELSE @centre_id END ELSE NULL END ELSE NULL END,
		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN CASE WHEN ss.reference_1_nm IS NOT NULL THEN CASE WHEN ss.reference_1_department IS NOT NULL THEN
			ss.reference_1_department ELSE 'TO BE SPECIFIED' END ELSE NULL END ELSE NULL END,
		CASE WHEN ss.reference_2_sewadar_id IS NOT NULL THEN ssr2.system_id ELSE NULL END,
		CASE WHEN ss.reference_2_relationship IS NOT NULL THEN cr2.relation_id ELSE @none_relation_id END,
		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN LTRIM(RTRIM(ss.reference_2_nm)) ELSE NULL END,
		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN CASE WHEN ss.reference_2_nm IS NOT NULL THEN CASE WHEN ss.reference_2_centre_id IS NOT NULL THEN 
			csc2.satsang_centre_id ELSE @centre_id END ELSE NULL END ELSE NULL END,
		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN CASE WHEN ss.reference_2_nm IS NOT NULL THEN CASE WHEN ss.reference_2_department IS NOT NULL THEN
			ss.reference_2_department ELSE 'TO BE SPECIFIED' END ELSE NULL END ELSE NULL END,
		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'No' THEN ssrs.system_id ELSE NULL END,
		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' THEN scfas.centre_functionary_id ELSE NULL END, 
		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' THEN scfs.centre_functionary_id ELSE NULL END, 
		ssra.system_id, NULL, NULL, NULL
	FROM			 tmp_mgr_sewadar_system_record ssr
				JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
				JOIN sms..departments	sdpt				ON	(ss.department_id		=	sdpt.department_id	)
				JOIN departments		ddpt				ON	(sdpt.department_nm		=	ddpt.department_nm	)
	LEFT OUTER	JOIN sms..sub_departments	ssdpt			ON	(ss.department_id		=	ssdpt.department_id		AND	ss.sub_department_id		=	ssdpt.sub_department_id	)
	LEFT OUTER	JOIN sub_departments		dsdpt			ON	(ddpt.department_id		=	dsdpt.department_id		AND	ssdpt.sub_department_nm		=	dsdpt.sub_department_nm	)
	LEFT OUTER 	JOIN tmp_mgr_sewadar_system_record ssr1 	ON ssr1.sewadar_id 			= ss.reference_1_sewadar_id
	LEFT OUTER 	JOIN tmp_mgr_sewadar_system_record ssr2 	ON ssr2.sewadar_id 			= ss.reference_2_sewadar_id
	LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm1 			ON rm1.sms_id 				= ss.reference_1_relationship
	LEFT OUTER 	JOIN CDB..relations cr1						ON cr1.relation_nm 			= rm1.cdb_nm
	LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm2 			ON rm2.sms_id 				= ss.reference_2_relationship
	LEFT OUTER 	JOIN CDB..relations cr2						ON cr2.relation_nm 			= rm2.cdb_nm
	LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm1 	ON scm1.sms_id 				= ss.reference_1_centre_id
	LEFT OUTER 	JOIN CDB..satsang_centres csc1 				ON csc1.satsang_centre_nm 	= scm1.cdb_nm AND csc1.effective_till > GETDATE()
	LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm2 	ON scm2.sms_id 				= ss.reference_2_centre_id
	LEFT OUTER 	JOIN CDB..satsang_centres csc2 				ON csc2.satsang_centre_nm 	= scm2.cdb_nm AND csc2.effective_till > GETDATE()
	LEFT OUTER	JOIN tmp_mgr_sewadar_system_record ssrs 	ON ssrs.sewadar_id 			= ss.sponsorer_id
	LEFT OUTER	JOIN satsang_centre_functionaries scfas		ON scfas.functionary_nm		= ss.outside_sewadar_area_secretary AND scfas.centre_functionary = 'Area Secretary'
	LEFT OUTER	JOIN satsang_centre_functionaries scfs		ON scfs.functionary_nm		= ss.outside_sewadar_secretary AND scfs.centre_functionary = 'Secretary'
	LEFT OUTER	JOIN tmp_mgr_sewadar_system_record ssra 	ON ssra.sewadar_id 			= ss.approver_id
				JOIN tmp_mgr_sewadar_status_mapping sm		ON sm.sms_status			= ss.status
				JOIN sewadar_status zss 					ON zss.sewadar_status_nm 	= sm.zsm_sewadar_status_nm
	WHERE ss.outside_sewadar_area_secretary IS NULL OR ss.outside_sewadar_secretary <> 'Narsibhai Tandel';
SET @cnt2 = @@ROWCOUNT;

INSERT INTO sewadars_registrations
			(satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt, sewadar_status_cd,
			sewadar_status_dtm, responsibility, responsibility_dtm, reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id,
			reference_1_department, reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department, sponsorer_id,
			area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, weekly_sewa_location_id, weekly_department_id)
	SELECT	@centre_id, ss.sewadar_id, ssr.system_id, appointment_dt, LTRIM(RTRIM(ss.is_emigrant)), ddpt.department_id, dsdpt.sub_department_id, ss.department_dt,
		zss.sewadar_status_cd, ss.status_dt,
		CASE WHEN ss.responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ') THEN LTRIM(RTRIM(ss.responsibility)) ELSE NULL END,
		CASE WHEN ss.responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ') THEN ss.responsibility_dt ELSE NULL END, 
		CASE WHEN ss.reference_1_sewadar_id IS NOT NULL THEN ssr1.system_id ELSE NULL END,
		CASE WHEN ss.reference_1_relationship IS NOT NULL THEN cr1.relation_id ELSE @none_relation_id END,
		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN LTRIM(RTRIM(ss.reference_1_nm)) ELSE NULL END,
		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN CASE WHEN ss.reference_1_nm IS NOT NULL THEN CASE WHEN ss.reference_1_centre_id IS NOT NULL THEN 
			csc1.satsang_centre_id ELSE @centre_id END ELSE NULL END ELSE NULL END,
		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN CASE WHEN ss.reference_1_nm IS NOT NULL THEN CASE WHEN ss.reference_1_department IS NOT NULL THEN
			ss.reference_1_department ELSE 'TO BE SPECIFIED' END ELSE NULL END ELSE NULL END,
		CASE WHEN ss.reference_2_sewadar_id IS NOT NULL THEN ssr2.system_id ELSE NULL END,
		CASE WHEN ss.reference_2_relationship IS NOT NULL THEN cr2.relation_id ELSE @none_relation_id END,
		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN LTRIM(RTRIM(ss.reference_2_nm)) ELSE NULL END,
		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN CASE WHEN ss.reference_2_nm IS NOT NULL THEN CASE WHEN ss.reference_2_centre_id IS NOT NULL THEN 
			csc2.satsang_centre_id ELSE @centre_id END ELSE NULL END ELSE NULL END,
		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN CASE WHEN ss.reference_2_nm IS NOT NULL THEN CASE WHEN ss.reference_2_department IS NOT NULL THEN
			ss.reference_2_department ELSE 'TO BE SPECIFIED' END ELSE NULL END ELSE NULL END,
		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'No' THEN ssrs.system_id ELSE NULL END,
		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' THEN scfas.centre_functionary_id ELSE NULL END, 
		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' THEN scfs.centre_functionary_id ELSE NULL END, 
		ssra.system_id, NULL, NULL, NULL
	FROM			 tmp_mgr_sewadar_system_record ssr
				JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
				JOIN sms..departments	sdpt				ON	(ss.department_id		=	sdpt.department_id	)
				JOIN departments		ddpt				ON	(sdpt.department_nm		=	ddpt.department_nm	)
	LEFT OUTER	JOIN sms..sub_departments	ssdpt			ON	(ss.department_id		=	ssdpt.department_id		AND	ss.sub_department_id		=	ssdpt.sub_department_id	)
	LEFT OUTER	JOIN sub_departments		dsdpt			ON	(ddpt.department_id		=	dsdpt.department_id		AND	ssdpt.sub_department_nm		=	dsdpt.sub_department_nm	)
	LEFT OUTER 	JOIN tmp_mgr_sewadar_system_record ssr1 	ON ssr1.sewadar_id 			= ss.reference_1_sewadar_id
	LEFT OUTER 	JOIN tmp_mgr_sewadar_system_record ssr2 	ON ssr2.sewadar_id 			= ss.reference_2_sewadar_id
	LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm1 			ON rm1.sms_id 				= ss.reference_1_relationship
	LEFT OUTER 	JOIN CDB..relations cr1						ON cr1.relation_nm 			= rm1.cdb_nm
	LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm2 			ON rm2.sms_id 				= ss.reference_2_relationship
	LEFT OUTER 	JOIN CDB..relations cr2						ON cr2.relation_nm 			= rm2.cdb_nm
	LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm1 	ON scm1.sms_id 				= ss.reference_1_centre_id
	LEFT OUTER 	JOIN CDB..satsang_centres csc1 				ON csc1.satsang_centre_nm 	= scm1.cdb_nm AND csc1.effective_till > GETDATE()
	LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm2 	ON scm2.sms_id 				= ss.reference_2_centre_id
	LEFT OUTER 	JOIN CDB..satsang_centres csc2 				ON csc2.satsang_centre_nm 	= scm2.cdb_nm AND csc2.effective_till > GETDATE()
	LEFT OUTER	JOIN tmp_mgr_sewadar_system_record ssrs 	ON ssrs.sewadar_id 			= ss.sponsorer_id
	LEFT OUTER	JOIN satsang_centre_functionaries scfas		ON scfas.functionary_nm		= ss.outside_sewadar_area_secretary AND scfas.centre_functionary = 'Area Secretary' AND COALESCE(ss.weekly_satsang_centre_id, ss.residence_district_id) = scfas.functionary_nm
	LEFT OUTER	JOIN satsang_centre_functionaries scfs		ON scfs.functionary_nm		= ss.outside_sewadar_secretary AND scfs.centre_functionary = 'Secretary' AND COALESCE(ss.weekly_satsang_centre_id, ss.residence_district_id) = scfs.functionary_nm
	LEFT OUTER	JOIN tmp_mgr_sewadar_system_record ssra 	ON ssra.sewadar_id 			= ss.approver_id
				JOIN tmp_mgr_sewadar_status_mapping sm		ON sm.sms_status			= ss.status
				JOIN sewadar_status zss 					ON zss.sewadar_status_nm 	= sm.zsm_sewadar_status_nm
	WHERE ss.outside_sewadar_secretary = 'Narsibhai Tandel';
SET @cnt2 = @cnt2 + @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
	RAISERROR ('Sewadars Registrations not entered for all Grno', 16, 0);

--Correcting status_cd to 'Left' (zsm_sewadar_status_cd) for retirees having is_eligible_for_prashaad = 'No'
UPDATE sr
	SET sr.sewadar_status_cd = 'Left'
	FROM sewadars_registrations sr
	JOIN sms..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE sr.sewadar_status_cd = 'Retired' AND LTRIM(RTRIM(ss.is_eligible_for_prashaad)) = 'No';

-- Corrcting 'In Laws' to Mother-in-law (cdb_nm) based on the relation_nm.
UPDATE sr
	SET sr.reference_1_relationship = (SELECT cr.relation_id FROM CDB..relations cr WHERE cr.relation_nm = 'Mother-in-law')
	FROM sewadars_registrations sr
	JOIN sms..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE 	ss.reference_1_relationship = 'IL   '
	AND		ss.reference_1_nm IN ('LAXMI MAKHIJA                           ', 'HANSABEN MISTRY                         ', 'SHAKUNTALA NANDLAL ASRANI               ',
			'RUKMANI M. LAKHIANI                     ', 'KAMLA ROHIRA                            ', 'POONAM VASUDEV MAGNANI                  ');

UPDATE sr
	SET reference_2_relationship = (SELECT cr.relation_id FROM CDB..relations cr WHERE cr.relation_nm = 'Mother-in-law')
	FROM sewadars_registrations sr
	JOIN sms..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE 	ss.reference_2_relationship = 'IL   '
	AND		ss.reference_2_nm IN ('GANGUBAI HARIBHAU                       ', 'KASABAI MAHADEV KAMBLE                  ', 'PUSHPA KINGER                           ',
			'KAVITA MOTWANI                          ', 'LAXMI PUNJABI                           ', 'PUSHPA NAGPAL                           ',
			'KAVITA KARAMCHANDANI                    ')

-- ====================================================================================================
-- Updating current_satsang_centre_id, current_sewadar_grno in sewadars table after they are generated in sewadars_registrations
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM sewadars;
UPDATE s
	SET s.current_satsang_centre_id = @centre_id,
		s.current_sewadar_grno		= ssr.sewadar_id
	FROM sewadars s
	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id	
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
	RAISERROR ('Sewadars Current GRNo updation mismatch ', 16, 0);

-- ====================================================================================================
--	Sewadars Remarks for non-migrated data in sewadars_registrations
-- ====================================================================================================

-- remarks_type='Migration' & remarks_sq=1 is for storing sponsorers for sewadars with is_outstation_sewadar = 'Yes'
INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	sr.sewadar_id, 'Migration', 1, MAX(sr.sewadar_grno + ' had Sponsorer ' + ss.sponsorer_id)
	FROM sewadars_registrations sr
	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' AND ss.sponsorer_id IS NOT NULL
	GROUP BY sr.sewadar_id
	HAVING COUNT(*) = 1

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	sr.sewadar_id, 'Migration', 1, dbo.tmp_mgr_fnGetAllRemarkStringForSponsors(sr.sewadar_id)
	FROM sewadars_registrations sr
	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' AND ss.sponsorer_id IS NOT NULL
	GROUP BY sr.sewadar_id
	HAVING COUNT(*) > 1

-- remarks_type='Migration' & remarks_sq=2 is for storing reference_1_nm, reference_1_centre, reference_1_dept for sewadars with reference_1_sewadar_id NOT NULL
INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	sr.sewadar_id, 'Migration', 2, MAX(sr.sewadar_grno + ' had Ref1Nm ' + LTRIM(RTRIM(ss.reference_1_nm)) + ':Cntr ' + LTRIM(RTRIM(ss.reference_1_centre_id)) + 
		':Dept ' + LTRIM(RTRIM(ss.reference_1_department)))
	FROM sewadars_registrations sr
	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE ss.reference_1_sewadar_id IS NOT NULL and ss.reference_1_nm IS NOT NULL
	GROUP BY sr.sewadar_id
	HAVING COUNT(*) = 1

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	sr.sewadar_id, 'Migration', 2, dbo.tmp_mgr_fnGetAllRemarkStringForReferenc1Nm(sr.sewadar_id)
	FROM sewadars_registrations sr
	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE ss.reference_1_sewadar_id IS NOT NULL and ss.reference_1_nm IS NOT NULL
	GROUP BY sr.sewadar_id
	HAVING COUNT(*) > 1

-- remarks_type='Migration' & remarks_sq=3 is for storing reference_2_nm, reference_2_centre, reference_2_dept for sewadars with reference_2_sewadar_id NOT NULL
INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	sr.sewadar_id, 'Migration', 3, MAX(sr.sewadar_grno + ' had Ref1Nm ' + LTRIM(RTRIM(ss.reference_2_nm)) + ':Cntr ' + LTRIM(RTRIM(ss.reference_2_centre_id)) + 
		':Dept ' + LTRIM(RTRIM(ss.reference_2_department)))
	FROM sewadars_registrations sr
	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE ss.reference_2_sewadar_id IS NOT NULL and ss.reference_2_nm IS NOT NULL
	GROUP BY sr.sewadar_id
	HAVING COUNT(*) = 1

INSERT INTO sewadars_remarks
			(sewadar_id, remarks_type, remarks_sq, remarks)
	SELECT	sr.sewadar_id, 'Migration', 3, dbo.tmp_mgr_fnGetAllRemarkStringForReferenc2Nm(sr.sewadar_id)
	FROM sewadars_registrations sr
	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
	WHERE ss.reference_2_sewadar_id IS NOT NULL and ss.reference_2_nm IS NOT NULL
	GROUP BY sr.sewadar_id
	HAVING COUNT(*) > 1

-- ====================================================================================================
--	Sewadars Particulars and Attributes
-- ====================================================================================================

INSERT INTO sewadars_particulars
		(	satsang_centre_id, sewadar_grno	)
	SELECT	DISTINCT @centre_id, sewadar_id
	FROM	sms..sewadar_attributes
	WHERE	attribute_id	IN	(	'ExmptCnst', 'MobilePerm', 'SndyCnst10'	);

SELECT	@cnt1 = COUNT (*)
FROM	sms..sewadar_attributes
WHERE	attribute_id	IN	(	'ExmptCnst', 'MobilePerm', 'SndyCnst10'	);

INSERT INTO	sewadars_attributes
		(	satsang_centre_id, sewadar_grno, attribute_id, boolean_value, remarks	)
	SELECT	@centre_id, s.sewadar_id, g.attribute_id, 'Yes', s.reference_no + COALESCE (' [' + s.remarks + ']', '')
	FROM	sms..sewadar_attributes	s
		JOIN	generic_attributes	g
			ON	(	(	s.attribute_id	=	'ExmptCnst'		AND	g.attribute_nm = 'Construction Sewa Exemption'	)
				OR	(	s.attribute_id	=	'MobilePerm'	AND	g.attribute_nm = 'Mobile Permission'			)
				OR	(	s.attribute_id	=	'SndyCnst10'	AND	g.attribute_nm = 'Sewa allowed on Sunday, 2010'	)
				);
SET @cnt2 = @@ROWCOUNT;

IF (@cnt1 != @cnt2)
	RAISERROR ('Counts of records for Sewadars Attributes do not match', 16, 0);

-- ====================================================================================================

SELECT	@cnt1 = COUNT (*)
FROM	sms..sewadar_attributes
WHERE	attribute_id	=	'Suspended';

UPDATE	s
	SET	global_sewadar_status_cd =	'Susp',
		global_sewadar_status_dt =	a.effective_dt
FROM	sewadars	s
	JOIN	sms..sewadar_attributes	a
		ON	(	s.current_satsang_centre_id	=	@centre_id
			AND	s.current_sewadar_grno		=	a.sewadar_id
			AND	attribute_id	=	'Suspended'
			);

SET @cnt2 = @@ROWCOUNT;

IF (@cnt1 != @cnt2)
	RAISERROR ('Counts of records for Suspended Sewadars (Attributes) do not match', 16, 0);

-- ====================================================================================================
--	Sewadars Tansfers
-- ====================================================================================================

SELECT	@cnt1 = COUNT (*) FROM SMS..sewadar_transfers
INSERT INTO sewadars_transfers 
			(satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks)
	SELECT	@centre_id, sst.sewadar_id, sst.effective_ts, zd_o.department_id, zsd_o.sub_department_id, zd.department_id, zsd.sub_department_id, sst.remarks
	FROM sms..sewadar_transfers sst
	LEFT OUTER	JOIN sms..departments		sd_o	ON	(sd_o.department_id		=	sst.old_department_id	)
	LEFT OUTER	JOIN departments			zd_o	ON	(zd_o.department_nm		=	sd_o.department_nm		)
	LEFT OUTER	JOIN sms..sub_departments	ssd_o	ON	(ssd_o.department_id	=	sst.old_department_id	AND	ssd_o.sub_department_id		=	sst.old_sub_department_id	)
	LEFT OUTER	JOIN sub_departments		zsd_o	ON	(zsd_o.department_id	=	zd_o.department_id		AND	zsd_o.sub_department_nm		=	ssd_o.sub_department_nm		)
				JOIN sms..departments		sd		ON	(sd.department_id		=	sst.department_id	)
				JOIN departments			zd		ON	(zd.department_nm		=	sd.department_nm	)
	LEFT OUTER	JOIN sms..sub_departments	ssd		ON	(ssd.department_id		=	sst.department_id	AND	ssd.sub_department_id		=	sst.sub_department_id	)
	LEFT OUTER	JOIN sub_departments		zsd		ON	(zsd.department_id		=	zd.department_id	AND	zsd.sub_department_nm		=	ssd.sub_department_nm		);
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
	RAISERROR ('Counts of records for Sewadars Transfer do not match', 16, 0);

-- ====================================================================================================
--	Sewadars Stataus Changes
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewadars_status_changes' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_sewadars_status_changes;

CREATE TABLE tmp_mgr_sewadars_status_changes
(
	sewadar_grno		sewadar_grno,
	effective_dt		SMALLDATETIME,
	sewadar_status_cd	sewadar_status_cd,
	change_sq			display_order,
		CONSTRAINT	PK_TmpMgrSewadarsStatusChanges_SewadarGrno_EffectiveDt
					PRIMARY KEY		(sewadar_grno, effective_dt)
);

INSERT INTO tmp_mgr_sewadars_status_changes
			(sewadar_grno, effective_dt, sewadar_status_cd)
	SELECT	s.sewadar_id, s.effective_dt, CASE WHEN ssm.zsm_global_sewadar_status_nm IS NOT NULL THEN ssg.sewadar_status_cd ELSE ss.sewadar_status_cd END
				FROM	sms..sewadar_status s
				JOIN	tmp_mgr_sewadar_status_mapping 	ssm ON ssm.sms_status 		 = s.status
				JOIN	sewadar_status					ss	ON ss.sewadar_status_nm	 = ssm.zsm_sewadar_status_nm
	LEFT OUTER 	JOIN	sewadar_status					ssg	ON ssg.sewadar_status_nm = ssm.zsm_global_sewadar_status_nm

-- Some entries in sms..sewadar_status, where 2 consecutive entries for the same grno had same status. Only 1 of them is migrated after manual inspection.
DELETE t FROM tmp_mgr_sewadars_status_changes t WHERE
	(t.sewadar_grno = 'G02701' AND t.effective_dt = '2001-11-17 00:00:00' AND t.sewadar_status_cd = 'Perm') OR
	(t.sewadar_grno = 'G05128' AND t.effective_dt = '2002-11-14 00:00:00' AND t.sewadar_status_cd = 'Temp') OR
	(t.sewadar_grno = 'L00943' AND t.effective_dt = '2001-10-29 00:00:00' AND t.sewadar_status_cd = 'Perm') OR
	(t.sewadar_grno = 'L05568' AND t.effective_dt = '2001-12-25 00:00:00' AND t.sewadar_status_cd = 'Temp');
	
SELECT @cnt1 = COUNT(*) FROM sewadars_registrations WHERE sewadar_grno IN 
	(SELECT ssc.sewadar_grno
					FROM tmp_mgr_sewadars_status_changes ssc
		LEFT OUTER	JOIN tmp_mgr_sewadars_status_changes ssc_o ON (ssc_o.sewadar_grno = ssc.sewadar_grno AND ssc_o.change_sq = (ssc.change_sq - 1))
		LEFT OUTER	JOIN SMS..sewadar_status ss_o ON ss_o.sewadar_id = ssc_o.sewadar_grno AND ss_o.effective_dt = ssc_o.effective_dt
					JOIN SMS..sewadar_status ss ON ss.sewadar_id = ssc.sewadar_grno AND ss.effective_dt = ssc.effective_dt
		WHERE ssc_o.sewadar_status_cd	IS NOT NULL	AND	ssc.sewadar_status_cd	IS NOT NULL		AND	ss_o.status	=	ss.status);
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some entries in sms where 2 consecutive entries for a grno have same status. This needs to be manually seen.', 16, 0);
		SELECT	ssc.sewadar_grno, ssc_o.effective_dt AS old_effective_dt, ss_o.status AS old_sms_status, ssc.effective_dt AS new_effective_dt, ss.status AS new_sms_status
						FROM tmp_mgr_sewadars_status_changes ssc
			LEFT OUTER	JOIN tmp_mgr_sewadars_status_changes ssc_o ON (ssc_o.sewadar_grno = ssc.sewadar_grno AND ssc_o.change_sq = (ssc.change_sq - 1))
			LEFT OUTER	JOIN SMS..sewadar_status ss_o ON ss_o.sewadar_id = ssc_o.sewadar_grno AND ss_o.effective_dt = ssc_o.effective_dt
						JOIN SMS..sewadar_status ss ON ss.sewadar_id = ssc.sewadar_grno AND ss.effective_dt = ssc.effective_dt
			WHERE ssc_o.sewadar_status_cd	IS NOT NULL	AND	ssc.sewadar_status_cd	IS NOT NULL		AND	ss_o.status	=	ss.status;
	END;

--Correcting status_cd to 'Left' (zsm_sewadar_status_cd) for retirees having is_eligible_for_prashaad = 'No'
UPDATE ssc
	SET ssc.sewadar_status_cd = 'Left'
	FROM tmp_mgr_sewadars_status_changes ssc
	JOIN sms..sewadars ss ON ss.sewadar_id = ssc.sewadar_grno
	WHERE ssc.sewadar_status_cd = 'Retd' AND LTRIM(RTRIM(ss.is_eligible_for_prashaad)) = 'No';

SELECT @cnt1 = COUNT (*) FROM sewadars_registrations WHERE sewadar_grno IN
	(SELECT sewadar_grno FROM tmp_mgr_sewadars_status_changes
	GROUP BY sewadar_grno, effective_dt
	HAVING COUNT(*) > 1);
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('Some Sewadar GRNO have mulitple status changed on same time. Needs to be handled manually.', 16, 0);
		SELECT sewadar_grno FROM tmp_mgr_sewadars_status_changes
		GROUP BY sewadar_grno, effective_dt
		HAVING COUNT(*) > 1;
	END;
	
UPDATE t
	SET change_sq = 
		(SELECT COUNT (*) FROM tmp_mgr_sewadars_status_changes ssc1
				JOIN tmp_mgr_sewadars_status_changes ssc2 ON (ssc2.sewadar_grno = ssc1.sewadar_grno AND ssc1.effective_dt >= ssc2.effective_dt)
				WHERE ssc1.sewadar_grno = t.sewadar_grno AND ssc1.effective_dt = t.effective_dt
				GROUP BY ssc1.sewadar_grno, ssc1.effective_dt)
	FROM tmp_mgr_sewadars_status_changes t;

SELECT @cnt1 = COUNT(*) FROM SMS..sewadar_status;
INSERT INTO sewadars_status_changes
			(satsang_centre_id, sewadar_grno, effective_dtm, old_sewadar_status_cd, sewadar_status_cd)
	SELECT	@centre_id, ssc.sewadar_grno, ssc.effective_dt, ssc_o.sewadar_status_cd, ssc.sewadar_status_cd
				FROM tmp_mgr_sewadars_status_changes ssc
	LEFT OUTER	JOIN tmp_mgr_sewadars_status_changes ssc_o ON (ssc_o.sewadar_grno = ssc.sewadar_grno AND ssc_o.change_sq = (ssc.change_sq - 1))
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2 + 4) -- +4 because of 4 incorrect entries deleted above
		RAISERROR ('Counts of records for Sewadars Status Changes do not match', 16, 0);

-- ====================================================================================================
--	Sewadars Responsibility Changes
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewadars_responsibility_changes' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_sewadars_responsibility_changes;

CREATE TABLE tmp_mgr_sewadars_responsibility_changes
(
	sewadar_grno	sewadar_grno,
	effective_dt	SMALLDATETIME,
	responsibility	VARCHAR(20),
	change_sq		display_order,
		CONSTRAINT	PK_TmpMgrSewadarsResponsibilityChanges_SewadarGrno_EffectiveDt
					PRIMARY KEY		(sewadar_grno, effective_dt)
);

INSERT INTO tmp_mgr_sewadars_responsibility_changes
			(sewadar_grno, effective_dt, responsibility)
	SELECT	sewadar_id, effective_dt, LTRIM(RTRIM(responsibility))
	FROM sms..sewadar_responsibility

UPDATE t
	SET change_sq = 
		(SELECT COUNT(*) FROM tmp_mgr_sewadars_responsibility_changes src1 
				JOIN tmp_mgr_sewadars_responsibility_changes src2 ON (src2.sewadar_grno = src1.sewadar_grno AND src1.effective_dt >= src2.effective_dt)
				WHERE src1.sewadar_grno = t.sewadar_grno AND src1.effective_dt = t.effective_dt
				GROUP BY src1.sewadar_grno, src1.effective_dt)
	FROM tmp_mgr_sewadars_responsibility_changes t;

SELECT @cnt1 = COUNT(*) FROM sms..sewadar_responsibility 
	WHERE responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ', 'Sewadar             ');
-- Some entries in sms..sewadar_responsibility, where 2 or more consecutive entries for the same grno had same status. Only one with oldest date is migrated.
DELETE src		FROM tmp_mgr_sewadars_responsibility_changes src
	LEFT OUTER	JOIN tmp_mgr_sewadars_responsibility_changes src_o ON (src_o.sewadar_grno = src.sewadar_grno AND src_o.change_sq = (src.change_sq - 1))
	WHERE src.responsibility = src_o.responsibility;
SELECT @cnt2 = @@ROWCOUNT;

-- Only entries with responsibility of Heads and Sewadar is migrated
DELETE FROM tmp_mgr_sewadars_responsibility_changes
WHERE responsibility NOT IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ', 'Sewadar             ');

-- Responsibility Sewadar is equivalent to NULL in ZSM
UPDATE tmp_mgr_sewadars_responsibility_changes
	SET responsibility = NULL
	WHERE responsibility = 'Sewadar';

-- Reordering after data deletion and responsibility modification above
UPDATE t
	SET change_sq = 
		(SELECT COUNT(*) FROM tmp_mgr_sewadars_responsibility_changes src1 
				JOIN tmp_mgr_sewadars_responsibility_changes src2 ON (src2.sewadar_grno = src1.sewadar_grno AND src1.effective_dt >= src2.effective_dt)
				WHERE src1.sewadar_grno = t.sewadar_grno AND src1.effective_dt = t.effective_dt
				GROUP BY src1.sewadar_grno, src1.effective_dt)
	FROM tmp_mgr_sewadars_responsibility_changes t;

-- Some entries are now in tmp_mgr_sewadars_responsibility_changes, where 2 or more consecutive entries for the same grno had same status. Only one with oldest date is migrated.
DELETE src		FROM tmp_mgr_sewadars_responsibility_changes src
	LEFT OUTER	JOIN tmp_mgr_sewadars_responsibility_changes src_o ON (src_o.sewadar_grno = src.sewadar_grno AND src_o.change_sq = (src.change_sq - 1))
	WHERE (src.responsibility = src_o.responsibility) OR (src.responsibility IS NULL AND src_o.responsibility IS NULL)
SELECT @cnt3 = @@ROWCOUNT;

INSERT INTO sewadars_responsibility_changes
			(satsang_centre_id, sewadar_grno, effective_dtm, old_responsibility, responsibility)
	SELECT	@centre_id, src.sewadar_grno, src.effective_dt, src_o.responsibility, src.responsibility
				FROM tmp_mgr_sewadars_responsibility_changes src
	LEFT OUTER	JOIN tmp_mgr_sewadars_responsibility_changes src_o ON (src_o.sewadar_grno = src.sewadar_grno AND src_o.change_sq = (src.change_sq - 1));
SELECT @cnt4 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2 + @cnt3 + @cnt4) -- +@cnt2 +@cnt3 for the deleted rows above
		RAISERROR ('Counts of records for Sewadars Responsibility Changes do not match', 16, 0);

-- ====================================================================================================
--	Sewas
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM sms..sewas;
INSERT INTO sewas
			(satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme, is_scanner_used,
			is_leave_allowed, is_exemption_allowed,	is_default_sewa, sewa_frequency, attendance_unit,
			attendance_marking, min_sewa_duration, max_sewa_duration, gents_born_after, ladies_born_after, referred_sewa_id,
			attendance_ts, summary_ts, deleted_ts, locked_dtm)
	SELECT	@centre_id, LTRIM(RTRIM(s.sewa_id)), s.sewa_nm, s.start_dt, s.finish_dt, LTRIM(RTRIM(s.is_satsang_programme)), LTRIM(RTRIM(s.is_scanned)),
			LTRIM(RTRIM(s.is_leave_allowed)), LTRIM(RTRIM(s.is_exemption_allowed)), 'No', LTRIM(RTRIM(s.sewa_frequency)), LTRIM(RTRIM(s.attendance_unit)),
			LTRIM(RTRIM(s.attendance_marking)), s.min_sewa_duration, s.max_sewa_duration, s.gents_DOB, s.ladies_DOB, NULL,
			s.attendance_ts, s.summary_ts, s.deleted_ts, s.lock_dtm
	FROM sms..sewas s
	WHERE s.referred_sewa_id IS NULL;
SET @cnt2 = @@ROWCOUNT;
INSERT INTO sewas
			(satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme, is_scanner_used,
			is_leave_allowed, is_exemption_allowed,	is_default_sewa, sewa_frequency, attendance_unit,
			attendance_marking, min_sewa_duration, max_sewa_duration, gents_born_after, ladies_born_after, referred_sewa_id,
			attendance_ts, summary_ts, deleted_ts, locked_dtm)
	SELECT	@centre_id, LTRIM(RTRIM(s.sewa_id)), s.sewa_nm, s.start_dt, s.finish_dt, LTRIM(RTRIM(s.is_satsang_programme)), LTRIM(RTRIM(s.is_scanned)),
			LTRIM(RTRIM(s.is_leave_allowed)), LTRIM(RTRIM(s.is_exemption_allowed)), 'No', LTRIM(RTRIM(s.sewa_frequency)), LTRIM(RTRIM(s.attendance_unit)),
			'Computed', s.min_sewa_duration, s.max_sewa_duration, s.gents_DOB, s.ladies_DOB, sr.sewa_id,
			s.attendance_ts, s.summary_ts, s.deleted_ts, s.lock_dtm
				FROM sms..sewas s
	LEFT OUTER	JOIN sewas sr ON sr.sewa_cd = s.referred_sewa_id
	WHERE s.referred_sewa_id IS NOT NULL
SET @cnt2 = @cnt2 + @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewas do not match', 16, 0);

GO
-- ====================================================================================================
--	Sewa Teams
-- ====================================================================================================
DECLARE
	@centre_id			INT,
	@active_eff_from	DATETIME,
	@active_eff_till	DATETIME,
	@inactiv_eff_frm	DATETIME,
	@inactiv_eff_til	DATETIME,
	@dummy_initiation_dt DATETIME,
	@none_relation_id	INT,
	@cnt1				INT,
	@cnt2				INT,
	@cnt3				INT,
	@cnt4				INT,
	@not_known_initiation_place_id				INT,
	@team_wise_daily_attendance_screen_id		CHAR(6),
	@arbitrary_daily_presences_screen_id		CHAR(6),
	@arbitrary_shift_presences_screen_id		CHAR(6),
	@arbitrary_summarised_exemptions_screen_id	CHAR(6),
	@sewadar_wise_sewa_summaries_screen_id		CHAR(6);

	SELECT @centre_id		= satsang_centre_id FROM CDB..satsang_centres WHERE satsang_centre_nm = 'BHAYANDAR'; -- 6015
	SET	@active_eff_from 	= '01-Jan-2000';
	SET @active_eff_till	= '31-Dec-9999';
	SET @inactiv_eff_frm	= '01-Jan-2000';
	SET @inactiv_eff_til	= '31-Dec-2009';
	SET @dummy_initiation_dt = '01-Jan-1991';
	SELECT @none_relation_id = relation_id FROM CDB..relations WHERE relation_nm = 'None'; -- 6
	SELECT @not_known_initiation_place_id = place_id FROM CDB..initiation_places WHERE place_nm = 'NOT KNOWN'; -- 73
	SET @team_wise_daily_attendance_screen_id		= 'ATT_05';
	SET @arbitrary_daily_presences_screen_id		= 'ATT_02';
	SET @arbitrary_shift_presences_screen_id		= 'ATT_06';
	SET @arbitrary_summarised_exemptions_screen_id	= 'ATT_03';
	SET @sewadar_wise_sewa_summaries_screen_id		= 'ATT_01';

SELECT @cnt1 = COUNT(*) FROM SMS..sewa_teams;
SET IDENTITY_INSERT sewa_teams ON;
INSERT INTO sewa_teams
			(sewa_team_id, sewa_team_nm, team_description, sewa_id, acceptance_ts)
	SELECT	st.team_id, st.team_nm, NULL, s.sewa_id, st.acceptance_ts
	FROM sms..sewa_teams st
	JOIN sewas s ON st.sewa_id = s.sewa_cd;
SET @cnt2 = @@ROWCOUNT;
SET IDENTITY_INSERT sewa_teams OFF;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewa Teams do not match', 16, 0);

-- ====================================================================================================
--	Sewa Team Wise Sewadars
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM SMS..sewa_team_wise_sewadars;
INSERT INTO sewa_team_wise_sewadars
			(sewa_team_id, serial_id, satsang_centre_id, sewadar_grno, transfer_in_dt, transfer_out_dt)
	SELECT	team_id, serial_id, @centre_id, sewadar_id, transfer_in_dt, transfer_out_dt
	FROM sms..sewa_team_wise_sewadars;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewa Team Wise Sewadars do not match', 16, 0);

-- ====================================================================================================
--	Sewa Teams TxnTs
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT team_id, attendance_dt FROM SMS..team_wise_daily_attendance) t;
INSERT INTO sewa_teams_txn_ts
			(sewa_team_id, attendance_dt)
	SELECT DISTINCT team_id, attendance_dt
	FROM sms..team_wise_daily_attendance
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewa Teams TxnTs do not match', 16, 0);

-- ====================================================================================================
--	Team Wise Daily Attendence, Sewadars TxnTs
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewa_exemptions_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_sewa_exemptions_mapping;

CREATE	TABLE 	tmp_mgr_sewa_exemptions_mapping
(	sms_sewa_exemption		VARCHAR (60)	NOT NULL	PRIMARY KEY,
	zsm_sewa_exemption		gnc_nm			NOT NULL
);

INSERT	INTO	tmp_mgr_sewa_exemptions_mapping
	SELECT	sewa_exemption_nm, sewa_exemption_nm
	FROM	sewa_exemptions;

INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Accident case',												'Accident'						);
INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Could  not get leave from job',                                'Could not get leave from job'	);
INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Doing Sewa at Ulnr, Varap, Dombivali, Badlapur, Bhiwandi',     'Doing Sewa at other Centre'	);
INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Done sewa in another centre',                                  'Doing Sewa at other Centre'	);
INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Exams',                                                        'Examinations'					);
INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Gone Out Of Station',                                          'Out of station'				);
INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Outside Bombay Sewadar',                                       'Outside Sewadar'				);
INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Reactivated for inactive sewadars',                            'Reactivated from Inactive'		);
INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Satara Jali sewa',                                             'Doing Sewa at other Centre'	);

SELECT @cnt1 = COUNT(*)
			FROM SMS..team_wise_daily_attendance a
			JOIN SMS..sewa_exemptions e ON e.exemption_id = a.exemption_id
LEFT OUTER 	JOIN tmp_mgr_sewa_exemptions_mapping m ON m.sms_sewa_exemption = e.exemption_nm
WHERE e.exemption_nm IS NOT NULL AND m.sms_sewa_exemption IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some sewa exemptions in sms..team_wise_daily_attendance that are not mapped in tmp_mgr_sewa_exemptions_mapping', 16, 0);
		SELECT DISTINCT e.exemption_nm
					FROM SMS..team_wise_daily_attendance a
			JOIN SMS..sewa_exemptions e ON e.exemption_id = a.exemption_id
		LEFT OUTER 	JOIN tmp_mgr_sewa_exemptions_mapping m ON m.sms_sewa_exemption = e.exemption_nm
		WHERE e.exemption_nm IS NOT NULL AND m.sms_sewa_exemption IS NULL;
	END;

SELECT @cnt1 = COUNT(*) FROM SMS..team_wise_daily_attendance;
INSERT INTO team_wise_daily_attendance
			(sewa_team_id, serial_id, attendance_dt, attendance, sewa_exemption_id, is_scanned)
	SELECT	a.team_id, a.serial_id, a.attendance_dt, a.attendance, e.sewa_exemption_id, 'No'
				FROM sms..team_wise_daily_attendance a
	LEFT OUTER	JOIN SMS..sewa_exemptions se ON se.exemption_id = a.exemption_id
	LEFT OUTER	JOIN tmp_mgr_sewa_exemptions_mapping m ON m.sms_sewa_exemption = se.exemption_nm
	LEFT OUTER	JOIN sewa_exemptions e ON e.sewa_exemption_nm = m.zsm_sewa_exemption;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Team Wise Daily Attendance do not match', 16, 0);

SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT s.sewadar_id, t.sewa_id FROM SMS..team_wise_daily_attendance a
	JOIN sms..sewa_team_wise_sewadars s ON (s.team_id = a.team_id AND s.serial_id = a.serial_id)
	JOIN SMS..sewa_teams t ON t.team_id = s.team_id) t;
INSERT INTO sewadars_txn_ts
					(satsang_centre_id, sewadar_grno, sewa_id, screen_id)
	SELECT DISTINCT @centre_id, s.sewadar_grno, t.sewa_id, @team_wise_daily_attendance_screen_id
	FROM team_wise_daily_attendance a
	JOIN sewa_team_wise_sewadars s ON (s.sewa_team_id = a.sewa_team_id AND s.serial_id = a.serial_id)
	JOIN sewa_teams t ON t.sewa_team_id = s.sewa_team_id;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewadars TxnTs (Team Wise Daily Attendance) do not match', 16, 0);

-- ====================================================================================================
--	Arbitrary Daily Presences, Sewadars TxnTs
-- ====================================================================================================
	
SELECT @cnt1 = COUNT(*) FROM SMS..arbitrary_daily_presences;
INSERT INTO arbitrary_daily_presences
			(sewa_id, satsang_centre_id, sewadar_grno, presence_dt, is_scanned)
	SELECT	s.sewa_id, @centre_id, p.sewadar_id, p.presence_dt, 'No'
	FROM SMS..arbitrary_daily_presences p
	JOIN sewas s ON s.sewa_cd = p.sewa_id;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Arbitrary Daily Presences do not match', 16, 0);

SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT sewadar_id, sewa_id FROM SMS..arbitrary_daily_presences) t;
INSERT INTO sewadars_txn_ts
					(satsang_centre_id, sewadar_grno, sewa_id, screen_id)
	SELECT DISTINCT @centre_id, p.sewadar_grno, p.sewa_id, @arbitrary_daily_presences_screen_id
	FROM arbitrary_daily_presences p;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewadars TxnTs (Arbitrary Daily Presences) do not match', 16, 0);

-- ====================================================================================================
--	Sewa Shifts
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT shift_id FROM SMS..sewa_shifts) t;
INSERT INTO sewa_shifts
			(sewa_shift, sewa_shift_sq, remarks, effective_from)
	SELECT DISTINCT shift_id, shift_no, NULL, @active_eff_from
	FROM SMS..sewa_shifts;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewa Shifts do not match', 16, 0);

-- ====================================================================================================
--	Sewas Sewa Shifts
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM (SELECT credit_days FROM SMS..sewa_shifts WHERE credit_days NOT IN (0.50, 1.00)) t;
IF (@cnt1 <> 0)
		RAISERROR ('sms..sewa_shifts.credit_days has values other than 0.50 and 1.00', 16, 0);

SELECT @cnt1 = COUNT(*) FROM SMS..sewa_shifts;
INSERT INTO sewas_sewa_shifts
			(sewa_id, sewa_shift, sewa_shift_sq, credit_cnt, unit_cnt)
	SELECT	s.sewa_id, ss.shift_id, ss.shift_no, 1, CASE WHEN ss.credit_days = 1.00 THEN 1 ELSE 2 END
	FROM SMS..sewa_shifts ss
	JOIN sewas s ON s.sewa_cd = ss.sewa_id;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewas Sewa Shifts do not match', 16, 0);

-- ====================================================================================================
--	Arbitrary Shift Presences, Sewadars TxnTs
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM sms..scanned_daily_shift_presences;
INSERT INTO arbitrary_shift_presences
			(sewa_id, satsang_centre_id, sewadar_grno, presence_dt, sewa_shift, is_scanned)
	SELECT	s.sewa_id, @centre_id, p.sewadar_id, p.presence_dt, p.shift_id, p.is_scanned
	FROM sms..scanned_daily_shift_presences p
	JOIN sewas s ON s.sewa_cd = p.sewa_id;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Arbitrary Shift Presences do not match', 16, 0);

SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT sewadar_id, sewa_id FROM SMS..scanned_daily_shift_presences) t;
INSERT INTO sewadars_txn_ts
					(satsang_centre_id, sewadar_grno, sewa_id, screen_id)
	SELECT DISTINCT @centre_id, p.sewadar_grno, p.sewa_id, @arbitrary_shift_presences_screen_id
	FROM arbitrary_shift_presences p;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewadars TxnTs (Arbitrary Shift Presences) do not match', 16, 0);

-- ====================================================================================================
--	Arbitrary Summarised Exemptions, Sewadars TxnTs
-- ====================================================================================================

SELECT @cnt1 = COUNT(*)
			FROM SMS..arbitrary_summarised_exemptions a
			JOIN SMS..sewa_exemptions e ON e.exemption_id = a.exemption_id
LEFT OUTER 	JOIN tmp_mgr_sewa_exemptions_mapping m ON m.sms_sewa_exemption = e.exemption_nm
WHERE e.exemption_nm IS NOT NULL AND m.sms_sewa_exemption IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some sewa exemptions in sms..arbitrary_summarised_exemptions that are not mapped in tmp_mgr_sewa_exemptions_mapping', 16, 0);
		SELECT DISTINCT e.exemption_nm
					FROM SMS..arbitrary_summarised_exemptions a
			JOIN SMS..sewa_exemptions e ON e.exemption_id = a.exemption_id
		LEFT OUTER 	JOIN tmp_mgr_sewa_exemptions_mapping m ON m.sms_sewa_exemption = e.exemption_nm
		WHERE e.exemption_nm IS NOT NULL AND m.sms_sewa_exemption IS NULL;
	END;

SELECT @cnt1 = COUNT(*) FROM sms..arbitrary_summarised_exemptions;
INSERT INTO arbitrary_summarised_exemptions
			(sewa_id, satsang_centre_id, sewadar_grno, sewa_exemption_id, exemption_days)
	SELECT	s.sewa_id, @centre_id, ase.sewadar_id, e.sewa_exemption_id, ase.exemption_days
	FROM SMS..arbitrary_summarised_exemptions ase
	JOIN sewas s ON s.sewa_cd = ase.sewa_id
	JOIN sms..sewa_exemptions se ON se.exemption_id = ase.exemption_id
	JOIN tmp_mgr_sewa_exemptions_mapping em ON em.sms_sewa_exemption = se.exemption_nm
	JOIN sewa_exemptions e ON e.sewa_exemption_nm = em.zsm_sewa_exemption;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Arbitrary Summarised Exemptions do not match', 16, 0);

SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT sewadar_id, sewa_id FROM SMS..arbitrary_summarised_exemptions) t;
INSERT INTO sewadars_txn_ts
					(satsang_centre_id, sewadar_grno, sewa_id, screen_id)
	SELECT DISTINCT @centre_id, e.sewadar_grno, e.sewa_id, @arbitrary_summarised_exemptions_screen_id
	FROM arbitrary_summarised_exemptions e;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewadars TxnTs (Arbitrary Summarised Exemptions) do not match', 16, 0);

-- ====================================================================================================
--	Sewadar Wise Sewa Summaries, Sewadars TxnTs
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM SMS..sewadar_wise_sewa_summaries;
SELECT @cnt2 = COUNT(*) FROM SMS..sewadar_wise_sewa_summaries
WHERE present_cnt = 0 AND absent_cnt = 0 AND (leave_cnt IS NULL OR leave_cnt = 0) AND (exempt_cnt IS NULL OR exempt_cnt = 0)
INSERT INTO sewadar_wise_sewa_summaries
			(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded)
	SELECT	zs.sewa_id, @centre_id, s.sewadar_id, s.present_cnt, 
		CASE WHEN s.exempt_cnt IS NOT NULL THEN s.exempt_cnt ELSE 0 END,
		CASE WHEN s.leave_cnt IS NOT NULL THEN s.leave_cnt ELSE 0 END, s.absent_cnt,
		CASE WHEN LTRIM(RTRIM(s.is_manual )) = 'Yes' THEN 'No' ELSE 'Yes' END
	FROM SMS..sewadar_wise_sewa_summaries s
	JOIN sewas zs ON zs.sewa_cd = s.sewa_id
	WHERE present_cnt <> 0 OR absent_cnt <> 0 OR (leave_cnt IS NOT NULL AND leave_cnt <> 0) OR (exempt_cnt IS NOT NULL AND exempt_cnt <> 0)
SET @cnt3 = @@ROWCOUNT;

IF (@cnt1 <> @cnt3 + @cnt2) -- +@cnt2 because entries with all 4 counts = 0 are not migrated
		RAISERROR ('Counts of records for Sewadar wise Sewa Summaries do not match', 16, 0);

SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT sewadar_id, sewa_id FROM SMS..sewadar_wise_sewa_summaries
WHERE present_cnt <> 0 OR absent_cnt <> 0 OR (leave_cnt IS NOT NULL AND leave_cnt <> 0) OR (exempt_cnt IS NOT NULL AND exempt_cnt <> 0)) t;
INSERT INTO sewadars_txn_ts
					(satsang_centre_id, sewadar_grno, sewa_id, screen_id)
	SELECT DISTINCT @centre_id, s.sewadar_grno, s.sewa_id, @sewadar_wise_sewa_summaries_screen_id
	FROM sewadar_wise_sewa_summaries s;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewadars TxnTs (Sewadar wise Sewa Summaries) do not match', 16, 0);

-- ====================================================================================================
--	Weekly Sewa Locations
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM sms..weekly_sewa_locations;
INSERT INTO weekly_sewa_locations
			(weekly_sewa_location_nm, satsang_centre_id, remarks, effective_from, effective_till)
	SELECT location_nm, @centre_id, NULL, @inactiv_eff_frm, @inactiv_eff_til
	FROM sms..weekly_sewa_locations;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Weekly Sewa Locations do not match', 16, 0);

-- ====================================================================================================
--	Sewadars Badges
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_badge_templates_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_badge_templates_mapping;

CREATE TABLE tmp_badge_templates_mapping
(
	sms_template_id CHAR(10) PRIMARY KEY,
	zsm_template_id badge_template_id
);

INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('WklyLadies', 'Weekly');
INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('WklyGents ', 'Weekly');
INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('SPECIAL   ', 'SpecialZon');
INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('ConstSC   ', 'ConstSB');
INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('Annual    ', 'Programme');
INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('Retired   ', 'Retired');

SELECT @cnt1 = COUNT(*)
			FROM SMS..sewadar_badges b
LEFT OUTER 	JOIN tmp_badge_templates_mapping m ON m.sms_template_id = b.badge_template_id
WHERE b.badge_template_id IS NOT NULL AND m.sms_template_id IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some badge templates in sms..sewadar_badges that are not mapped in tmp_badge_templates_mapping', 16, 0);
		SELECT DISTINCT b.badge_template_id
					FROM SMS..sewadar_badges b
		LEFT OUTER 	JOIN tmp_badge_templates_mapping m ON m.sms_template_id = b.badge_template_id
		WHERE b.badge_template_id IS NOT NULL AND m.sms_template_id IS NULL;
	END;
GO

DECLARE
	@centre_id			INT,
	@active_eff_from	DATETIME,
	@active_eff_till	DATETIME,
	@inactiv_eff_frm	DATETIME,
	@inactiv_eff_til	DATETIME,
	@dummy_initiation_dt DATETIME,
	@none_relation_id	INT,
	@cnt1				INT,
	@cnt2				INT,
	@cnt3				INT,
	@cnt4				INT,
	@not_known_initiation_place_id				INT,
	@team_wise_daily_attendance_screen_id		CHAR(6),
	@arbitrary_daily_presences_screen_id		CHAR(6),
	@arbitrary_shift_presences_screen_id		CHAR(6),
	@arbitrary_summarised_exemptions_screen_id	CHAR(6),
	@sewadar_wise_sewa_summaries_screen_id		CHAR(6);

	SELECT @centre_id		= satsang_centre_id FROM CDB..satsang_centres WHERE satsang_centre_nm = 'BHAYANDAR'; -- 6015
	SET	@active_eff_from 	= '01-Jan-2000';
	SET @active_eff_till	= '31-Dec-9999';
	SET @inactiv_eff_frm	= '01-Jan-2000';
	SET @inactiv_eff_til	= '31-Dec-2009';
	SET @dummy_initiation_dt = '01-Jan-1991';
	SELECT @none_relation_id = relation_id FROM CDB..relations WHERE relation_nm = 'None'; -- 6
	SELECT @not_known_initiation_place_id = place_id FROM CDB..initiation_places WHERE place_nm = 'NOT KNOWN'; -- 73
	SET @team_wise_daily_attendance_screen_id		= 'ATT_05';
	SET @arbitrary_daily_presences_screen_id		= 'ATT_02';
	SET @arbitrary_shift_presences_screen_id		= 'ATT_06';
	SET @arbitrary_summarised_exemptions_screen_id	= 'ATT_03';
	SET @sewadar_wise_sewa_summaries_screen_id		= 'ATT_01';

SELECT @cnt1 = COUNT(*) FROM SMS..sewadar_badges;
SET IDENTITY_INSERT sewadars_badges ON;
INSERT INTO sewadars_badges
			(badge_id, satsang_centre_id, sewadar_grno, badge_template_id, department_id, 
			weekly_sewa_location_id, is_front_printed, is_back_printed, expiry_dt, printing_dtm, remarks)
	SELECT	b.badge_id, @centre_id, b.sewadar_id, m.zsm_template_id, d.department_id,
			l.weekly_sewa_location_id, 'Yes', CASE WHEN t.report_file_nm_back IS NOT NULL THEN 'Yes' ELSE 'No' END,			
			b.expiry_dt, b.printing_ts, b.remarks
	FROM SMS..sewadar_badges b
	JOIN tmp_badge_templates_mapping m ON m.sms_template_id = b.badge_template_id
	JOIN badge_templates t ON t.badge_template_id = m.zsm_template_id
	JOIN SMS..departments sd ON sd.department_id = b.department_id
	JOIN departments d ON d.department_nm = sd.department_nm
	LEFT OUTER	JOIN sms..weekly_sewa_locations sl ON sl.location_id = b.location_id
	LEFT OUTER	JOIN weekly_sewa_locations l ON l.weekly_sewa_location_nm = sl.location_nm;
SET @cnt2 = @@ROWCOUNT;
SET IDENTITY_INSERT sewadars_badges OFF;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Sewadars Badges do not match', 16, 0);
GO
-- ====================================================================================================
--	Credit Specifications
-- ====================================================================================================

DECLARE
	@centre_id			INT,
	@active_eff_from	DATETIME,
	@active_eff_till	DATETIME,
	@inactiv_eff_frm	DATETIME,
	@inactiv_eff_til	DATETIME,
	@dummy_initiation_dt DATETIME,
	@none_relation_id	INT,
	@cnt1				INT,
	@cnt2				INT,
	@cnt3				INT,
	@cnt4				INT,
	@not_known_initiation_place_id				INT,
	@team_wise_daily_attendance_screen_id		CHAR(6),
	@arbitrary_daily_presences_screen_id		CHAR(6),
	@arbitrary_shift_presences_screen_id		CHAR(6),
	@arbitrary_summarised_exemptions_screen_id	CHAR(6),
	@sewadar_wise_sewa_summaries_screen_id		CHAR(6);

	SELECT @centre_id		= satsang_centre_id FROM CDB..satsang_centres WHERE satsang_centre_nm = 'BHAYANDAR'; -- 6015
	SET	@active_eff_from 	= '01-Jan-2000';
	SET @active_eff_till	= '31-Dec-9999';
	SET @inactiv_eff_frm	= '01-Jan-2000';
	SET @inactiv_eff_til	= '31-Dec-2009';
	SET @dummy_initiation_dt = '01-Jan-1991';
	SELECT @none_relation_id = relation_id FROM CDB..relations WHERE relation_nm = 'None'; -- 6
	SELECT @not_known_initiation_place_id = place_id FROM CDB..initiation_places WHERE place_nm = 'NOT KNOWN'; -- 73
	SET @team_wise_daily_attendance_screen_id		= 'ATT_05';
	SET @arbitrary_daily_presences_screen_id		= 'ATT_02';
	SET @arbitrary_shift_presences_screen_id		= 'ATT_06';
	SET @arbitrary_summarised_exemptions_screen_id	= 'ATT_03';
	SET @sewadar_wise_sewa_summaries_screen_id		= 'ATT_01';

SET IDENTITY_INSERT credit_specifications ON;
INSERT INTO credit_specifications
			(credit_specification_id, credit_specification_nm, credit_specification_dt, satsang_centre_id, is_uniform_specification,
			credit_cnt, unit_cnt, is_exemption_considered, min_credit_cnt, specification_ts, computation_ts, is_finally_used)
	SELECT	credit_specification_id, credit_specification_nm, credit_specification_dt, @centre_id, is_uniform_specification,
			credit_cnt, unit_cnt, is_exemption_considered, CASE WHEN min_credit_cnt > 0 THEN min_credit_cnt END, specification_ts, computation_ts, 'No'
	FROM SMS..credit_specifications;
SET IDENTITY_INSERT credit_specifications OFF;

-- ====================================================================================================
--	Credit Specifications Sewas
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM SMS..sewa_credit_specifications;
INSERT INTO credit_specifications_sewas
			(credit_specification_id, sewa_id, credit_cnt, unit_cnt, is_exemption_considered, min_credit_cnt, max_credit_cnt)
	SELECT	cs.credit_specification_id, s.sewa_id, cs.eligible_credit_cnt, cs.eligible_unit_cnt, cs.eligible_consider_exemption,
			cs.min_credit_cnt, cs.max_credit_cnt
	FROM SMS..sewa_credit_specifications cs
	JOIN sewas s ON s.sewa_cd = cs.sewa_id;
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 <> @cnt2)
		RAISERROR ('Counts of records for Credit Specifications Sewas do not match', 16, 0);
	
-- ====================================================================================================
--	Credit Specifications Sewadars
-- ====================================================================================================

INSERT INTO credit_specifications_sewadars
			(credit_specification_id, satsang_centre_id, sewadar_grno, credit_cnt)
	SELECT credit_specification_id, @centre_id, sewadar_id, eligible_credit_cnt
	FROM SMS..sewadar_credits
	WHERE eligible_credit_cnt <> 0;

-- ====================================================================================================
--	Sequence Controlling Information
-- ====================================================================================================

INSERT INTO sequence_controlling_information (satsang_centre_id, sequence_id, last_no)
           SELECT   @centre_id, SUBSTRING (sequence_id, 1, 1), next_no - 1
           FROM     SMS..sms_sequences
           WHERE   sequence_id    LIKE '%GrNo'
	UNION
           SELECT   @centre_id, 'M', next_no - 1
           FROM     SMS..sms_sequences
           WHERE   sequence_id   = 'GMGNo'
	UNION
           SELECT   @centre_id, 'F', next_no - 1
           FROM     SMS..sms_sequences
           WHERE   sequence_id   = 'LMLNo';
	
SELECT @cnt1 = COUNT(*) FROM sequence_controlling_information;

IF (@cnt1 <> 4)
	RAISERROR ('Some more Sequence Controlling Information needs to be added', 16, 0);

-- ====================================================================================================
--	Generic Sewadar Lists
-- ====================================================================================================

INSERT INTO generic_sewadar_lists
			(satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars,
			is_other_satsang_centre, is_editing_allowed, remarks, generated_dtm, report_nm, session_id)
	VALUES	(@centre_id, 'Construction Sewa Jan-Mar 2011', 'Sewadars for a Sewa', NULL, 'No',
			'No', 'Yes', 'Migrated from sms..generic_report_details with session_id = 12690', NULL, NULL, NULL);

-- ====================================================================================================
--	Generic Sewadar Lists Sewadars
-- ====================================================================================================

INSERT INTO generic_sewadar_lists_sewadars
			(sewadar_list_id, satsang_centre_id, sewadar_grno)
	SELECT	(SELECT sewadar_list_id FROM generic_sewadar_lists 
			WHERE satsang_centre_id = @centre_id AND sewadar_list_nm = 'Construction Sewa Jan-Mar 2011'), @centre_id, sewadar_id
	FROM SMS..generic_report_details WHERE session_id = 12690;

GO
-- ====================================================================================================
