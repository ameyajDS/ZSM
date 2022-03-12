/* ==================================================================================
	Source File		:	nagpur_schema_migration.sql
	Author(s)		:	Manish Saluja, Jiten Loyal
	Started On		:	Sat Sep 24, 2011
	Version			:	0.01
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	01-Oct-2011
	Reviewed By		:
	Reviewed On		:
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
			* This script migrates the Nagpur sewadar management system data to zsm
	==================================================================================
														 SMS Tables not to be migrated
	----------------------------------------------------------------------------------
	==================================================================================
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
	v0.01 MS	* 01-Oct-2011
	 			* Initial version creates following temporary migration tables 
					- tmp_mgr_ngp_initiation_place_mapping
					- tmp_mgr_ngp_master_mapping
					- tmp_mgr_ngp_sewadar_mapping
					- tmp_mgr_ngp_addressproof_mapping
				* Following table migration scripts are written
					- sewadars
					- sewadars_details				
	==================================================================================
																		Workarounds
	----------------------------------------------------------------------------------
	1. Missing initiation_place is entered as 'NOT KNOWN' of CDB
	2. Missing intitiation_dt is entered as '01-Jan-1800'
	3. Missing initiated_by is entered as '0'
	4. For datas with Middle name also as part of Name, First name is written as everything
		except the last name.
	5. Assuming Married=0 means unmarried and Married>0 means married.
	6. Missing birth_dt is entered as '01-Jan-1800'
	7. Missing MiddleName is entered as 'GetMiddleName'
	==================================================================================
																			   Pending
	----------------------------------------------------------------------------------
	1. current_satsang_centre_id and current_sewadar_grno of ZSM..sewadars table.
	2. ZSM..sewadars_details..occupation (need mapping) (currently all is marked as 'Un-employed'.
	3. ZSM..sewadar_photos
	4. NGP..Sewadar_Relations
	5. ZSM..PO_Or_Cities
	6. Deptartments
	7. NGP..Sewadars.Guarantor_Role
	8. NGP..Sewadars.NatureOfWork
	9. Qualification
	10.NGP..Sewadars.SpExp
	==================================================================================
													Not planning to migrate from NGP 
	----------------------------------------------------------------------------------
	1. Blood Group Data.
	==================================================================================
																				 Notes
	----------------------------------------------------------------------------------
	==================================================================================*/

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
	@not_known_initiation_place_id INT,
	@not_known_initiation_dt DATETIME,
	@not_known_initiated_by INT,
	@not_known_middle_nm gnc_nm;

	SELECT @centre_id		= satsang_centre_id FROM CDB..satsang_centres WHERE satsang_centre_nm = 'NAGPUR(MH)'; -- 6056
	SET	@active_eff_from 	= '01-Jan-2000';
	SET @active_eff_till	= '31-Dec-9999';
	SET @inactiv_eff_frm	= '01-Jan-2000';
	SET @inactiv_eff_til	= '31-Dec-2009';
	SET @dummy_initiation_dt = '01-Jan-1991';
	SELECT @none_relation_id = relation_id FROM CDB..relations WHERE relation_nm = 'None'; -- 6
	SELECT @not_known_initiation_place_id = place_id FROM CDB..initiation_places WHERE place_nm = 'NOT KNOWN'; -- 73
	SELECT @not_known_initiation_dt = '01-Jan-1900';
	SELECT @not_known_initiated_by = '0';
	SELECT @not_known_middle_nm = 'GetMiddleName';

-- ====================================================================================================
--	Satsang Centre Details
-- ====================================================================================================

	UPDATE satsang_centres_details SET is_main_centre = 'Yes', centre_nm = 'Nagpur', centre_alphabet = 'N', centre_cd = 'NAG'
   		WHERE satsang_centre_id = @centre_id

-- ====================================================================================================
--	House Keeping
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_ngp_initiation_place_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_ngp_initiation_place_mapping;

CREATE TABLE tmp_mgr_ngp_initiation_place_mapping
(
	sms_initiation_place gnc_nm CONSTRAINT	TmpMgrNgpInitiationPlaceMapping_PK_SmsInitiationPlace
									PRIMARY KEY	NONCLUSTERED,
	cdb_initiation_place_nm gnc_nm
);

INSERT INTO tmp_mgr_ngp_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Banglore',	'BANGALORE'		);
INSERT INTO tmp_mgr_ngp_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Beas',		'Dera'			);
INSERT INTO tmp_mgr_ngp_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Delhi',		'Delhi'			);
INSERT INTO tmp_mgr_ngp_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Hyderabad',	'Hyderabad'		);
INSERT INTO tmp_mgr_ngp_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Indore',		'Indore'		);
INSERT INTO tmp_mgr_ngp_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Mumbai',		'Mumbai'		);
INSERT INTO tmp_mgr_ngp_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Nagpur',		'Nagpur'		);

SELECT @cnt1 = COUNT(*)
FROM NGP..sewadars s 
LEFT OUTER 	JOIN tmp_mgr_ngp_initiation_place_mapping ipm ON s.I_Place = ipm.sms_initiation_place
WHERE s.I_Place IS NOT NULL AND ipm.sms_initiation_place IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some initiation places in ngp..sewadars that are not mapped in tmp_mgr_ngp_initiation_place_mapping', 16, 0);
		SELECT DISTINCT s.I_Place
		FROM NGP..sewadars s 
		LEFT OUTER 	JOIN tmp_mgr_ngp_initiation_place_mapping ipm ON s.I_Place = ipm.sms_initiation_place
		WHERE s.I_Place IS NOT NULL AND ipm.sms_initiation_place IS NULL;
	END;

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_ngp_master_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_ngp_master_mapping;

CREATE TABLE tmp_mgr_ngp_master_mapping
(
	sms_master gnc_nm CONSTRAINT	TmpMgrNgpMasterMapping_PK_SmsMaster
									PRIMARY KEY	NONCLUSTERED,
	cdb_master gnc_nm
);

INSERT INTO tmp_mgr_ngp_master_mapping (sms_master, cdb_master) VALUES ('Sardar Bahadur Jagat Singh Ji',	'SARDAR BHADUR JI'			);
INSERT INTO tmp_mgr_ngp_master_mapping (sms_master, cdb_master) VALUES ('Huzur Maharaj Ji',					'MAHARAJ CHARAN SINGH JI'	);
INSERT INTO tmp_mgr_ngp_master_mapping (sms_master, cdb_master) VALUES ('Sant Babaji',						'BABA GURINDER SINGH JI'	);

SELECT @cnt1 = COUNT(*)
FROM NGP..sewadars s 
LEFT OUTER 	JOIN tmp_mgr_ngp_master_mapping mm ON s.I_SatGuru = mm.sms_master
WHERE s.I_SatGuru IS NOT NULL AND mm.sms_master IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some masters in ngp..sewadars that are not mapped in tmp_mgr_ngp_master_mapping', 16, 0);
		SELECT DISTINCT s.I_SatGuru
		FROM NGP..sewadars s 
		LEFT OUTER 	JOIN tmp_mgr_ngp_master_mapping mm ON s.I_SatGuru = mm.sms_master
		WHERE s.I_SatGuru IS NOT NULL AND mm.sms_master IS NULL;
	END;


--IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_occupation_mapping' AND TYPE = 'U')
--	DROP TABLE [dbo].tmp_mgr_occupation_mapping;
--
--CREATE TABLE tmp_mgr_occupation_mapping
--(
--	sms_occupation CHAR (15) CONSTRAINT	TmpMgrOccupationMapping_PK_SmsOccupation
--								PRIMARY KEY	NONCLUSTERED,
--	zsm_occupation occupation
--)
--
--INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('Service        ',	'Service'		);
--INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('Business       ',	'Business'		);
--INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('Self Employed  ',	'Self-employed'	);
--INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('Student        ',	'Student'		);
--INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('HouseWife      ',	'House-wife'	);
--INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('UnEmployed     ',	'Un-employed'	);
--INSERT INTO tmp_mgr_occupation_mapping (sms_occupation, zsm_occupation) VALUES ('Retired        ',	'Retired'		);
--
--IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_satsang_centre_mapping' AND TYPE = 'U')
--	DROP TABLE [dbo].tmp_mgr_satsang_centre_mapping;
--
--CREATE TABLE tmp_mgr_satsang_centre_mapping
--(
--	sms_id CHAR (10) CONSTRAINT	TmpMgrSatsangCentreMapping_PK_SmsId
--						PRIMARY KEY	NONCLUSTERED,
--	sms_nm gnc_nm, 
--	cdb_nm gnc_nm
--)
--
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('ADI       ', 'Ahmedabad ',					'BHAYANDAR'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AGRA      ', 'AGRA',						'AGRA-I'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AJ        ', 'Ajmer',						'AJMER-I (TABIJI)'			);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AK        ', 'AKOLA ',						'AKOLA'		);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AK-AS     ', 'AKOLA Area  ',				'AKOLA'		);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AN        ', 'Ahmed Nagar',				'AHMEDNAGAR');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AUR       ', 'AURANGABAD ',				'AURANGABAD');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BAST      ', 'Basti',						'BASTI'		);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BAD       ', 'BADLAPUR ',					'BADLAPUR'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BH        ', 'Bhiwandi ',					'BHIWANDI'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BHU       ', 'Bhusawal ',					'BHUSAWAL'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BHY       ', 'SATSANG GROUND, BHAYENDAR ',	'BHAYANDAR'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BL        ', 'Bilwa',						'Bilwa'		);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BNG       ', 'Banglore ',					'BANGALORE'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BOR       ', 'Bordi',						'BORDI'		);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BS        ', 'BEAS ',						'BEAS PIND'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('CHA       ', 'Chanera Sarsodi',			'SARSOLI'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('COL       ', 'Colaba ',					'COLABA'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('DAH       ', 'Dahanu ',					'DAHANU ROAD');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('DB        ', 'Dombivali ',					'DOMBIVALI'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('DHULE     ', 'Dhule ',						'DHULE'		);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('DMN       ', 'Daman ',						'DAMAN'		);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GANDHI    ', 'Gandhi Nagar',				'GANDHI NAGAR');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GONDIA    ', 'GONDIA ',					'GONDIA'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GOR       ', 'Gorakhpur',					'GORAKHPUR (UP)');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GU        ', 'Gurgaon',					'GURGAON');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('HOSH      ', 'Hoshiarpur ',				'HOSHIARPUR');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('HYD       ', 'HYDRABAD ',					'HYDERABAD-I');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('JAIPUR    ', 'Jaipur',						'JAIPUR-I');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('JAL       ', 'Jalgaon ',					'JALGAON'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('KOL       ', 'KOLHAPUR ', 					'KOLHAPUR'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('KU        ', 'Kuwait', 					'Kuwait'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('LN        ', 'Lonavala', 					'LONAVALA'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('LUCK      ', 'LUCKNOW', 					'LUCKNOW-I(MOHANLALGANJ)');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MAH       ', 'Mehsana ', 					'MEHSANA'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MAN       ', 'Mangalore', 					'MANGALORE(KARNATAKA)');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MG        ', 'MaharajGunj',				'MAHARAJGANJ(GORAKHPUR)');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MP        ', 'Mota Punda',					'MOTA PONDHA');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MU        ', 'Muzzafarpur',				'MUZAFFARPUR(BH)');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('N         ', 'Nainital',					'NAINITAL');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NA        ', 'Nasik',						'NASIK');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NAG       ', 'Nagpur ', 					'NAGPUR(MH)');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('ND        ', 'Delhi', 						'PUSA ROAD');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NDRBR     ', 'Nandurbar',					'NANDURBAR'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NMB       ', 'Navi Mumbai ',				'NAVI MUMBAI');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NY        ', 'New York',					'New York'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('PAL       ', 'PALGHAR ',					'PALGHAR'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('PIMPRI    ', 'PIMPRI ',					'PIMPRI'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('PN        ', 'PUNE ',						'PUNE-II (GULTEKDI)');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SAN       ', 'San Francisco',				'San Francisco');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SAR       ', 'Sarsoli',					'SARSOLI');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SATARA    ', 'SATARA',						'SATARA');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SGB       ', 'SATSANG GHAR, BANDRA ',		'BANDRA'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SGL       ', 'Sangli',						'SANGLI'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SIL       ', 'Silvassa ',					'SILVASSA'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SIN       ', 'Singapore',					'Singapore'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SO        ', 'Solapur',					'SOLAPUR'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SRT       ', 'Surat',						'SURAT'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('THN       ', 'Thane ',						'VARANASI'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('TRI       ', 'Thiruvananthapuram',			'TRIVANDRUM');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('VA        ', 'Varanasi',					'THANE'		);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('VAD       ', 'Vadodara',					'VADODARA'	);
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('VAR       ', 'Varap ',						'ULHASNAGAR -I (VARAP)');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('VAS       ', 'VASCO-DE-GAMA ',				'VASCO DA GAMA');
--INSERT INTO tmp_mgr_satsang_centre_mapping (sms_id, sms_nm, cdb_nm) VALUES ('VLD       ', 'Valsad -Maroli ',			'MAROLI');
--
--SELECT @cnt1 = COUNT(*)
--			FROM SMS..satsang_centres sc
--LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm ON sc.satsang_centre_id = scm.sms_id
--WHERE sc.satsang_centre_id IS NOT NULL AND scm.sms_id IS NULL;
--IF (@cnt1 > 0)
--	BEGIN
--		RAISERROR ('There are some satsang centres in sms..satsang_centres that are not mapped in tmp_mgr_satsang_centre_mapping', 16, 0);
--		SELECT sc.satsang_centre_id, sc.satsang_centre_nm
--					FROM SMS..satsang_centres sc
--		LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm ON sc.satsang_centre_id = scm.sms_id
--		WHERE sc.satsang_centre_id IS NOT NULL AND scm.sms_id IS NULL;
--	END;
--
--IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_relation_mapping' AND TYPE = 'U')
--	DROP TABLE [dbo].tmp_mgr_relation_mapping;
--
--CREATE TABLE tmp_mgr_relation_mapping
--(
--	sms_id CHAR (5) CONSTRAINT	TmpMgrRelationMapping_PK_SmsId
--						PRIMARY KEY	NONCLUSTERED,
--	sms_nm gnc_nm,
--	cdb_nm gnc_nm
--);
--
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('A    ', 'AUNTY',				'Aunty'			);	
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('AIL  ', 'AUNTY-IN-LAW',		'Aunty'			);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('B    ', 'BROTHER',			'Brother'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('BIL  ', 'BROTHER-IN-LAW',	'Brother-in-law');
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('COL  ', 'COLLEAGUE',			'Colleague'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('C    ', 'COUSIN',			'Cousin'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('D    ', 'DAUGHTER',			'Daughter'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('DIL  ', 'DAUGHTER-IN-LAW',	'Daughter-in-law');
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('EMPE ', 'EMPLOYEE',			'Employee'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('EMPR ', 'EMPLOYER',			'Employer'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('F    ', 'FATHER',			'Father'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('FIL  ', 'FATHER-IN-LAW',		'Father-in-law'	);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('FR   ', 'FRIEND',			'Friend'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GD   ', 'GRAND DAUGHTER',	'Grand Daughter');
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GS   ', 'GRAND SON',			'Grand Son'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GF   ', 'GRANDFATHER',		'Grand Father'	);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('GM   ', 'GRANDMOTHER',		'Grand Mother'	);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('H    ', 'HUSBAND',			'Spouse'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('IL   ', 'IN LAWS',			'Father-in-law'	);	--To be changed manually to Mother-in-law (cdb_nm) on based on the relation_nm.
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('M    ', 'MOTHER',			'Mother'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('MIL  ', 'MOTHER-IN-LAW',		'Mother-in-law'	);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NE   ', 'Neighbour',			'Neighbour'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NEP  ', 'NEPHEW',			'Nephew'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('NI   ', 'NIECE',				'Niece'			);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('RE   ', 'RELATIVE',			'None'			);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SF   ', 'Satsang Friend',	'Friend'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SI   ', 'SISTER',			'Sister'		);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SIL  ', 'SISTER-IN-LAW',		'Sister-in-law'	);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('S    ', 'SON',				'Son'			);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('SOIL ', 'SON-IN-LAW',		'Son-in-law'	);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('U    ', 'UNCLE',				'Uncle'			);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('UN   ', 'UNKNOWN',			'None'			);
--INSERT INTO tmp_mgr_relation_mapping (sms_id, sms_nm, cdb_nm) VALUES ('W    ', 'WIFE',				'Spouse'		);
--
--SELECT @cnt1 = COUNT(*)
--			FROM SMS..relationships r
--LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm ON r.relationship_id = rm.sms_id
--WHERE r.relationship_id IS NOT NULL AND rm.sms_id IS NULL;
--IF (@cnt1 > 0)
--	BEGIN
--		RAISERROR ('There are some relationships in sms..relationships that are not mapped in tmp_mgr_relation_mapping', 16, 0);
--		SELECT r.relationship_id, r.relationship_nm
--					FROM SMS..relationships r
--		LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm ON r.relationship_id = rm.sms_id
--		WHERE r.relationship_id IS NOT NULL AND rm.sms_id IS NULL;
--	END;
--
--SELECT @cnt1 = COUNT(*)
--			FROM SMS..address_proofs sap
--LEFT OUTER 	JOIN address_proofs zap ON zap.address_proof = sap.address_proof_id
--WHERE sap.address_proof_id IS NOT NULL AND zap.address_proof IS NULL;
--IF (@cnt1 > 0)
--	BEGIN
--		RAISERROR ('There are some address_proof_id in sms..sewadars that are not in zsm..address_proofs', 16, 0);
--		SELECT sap.address_proof_id
--					FROM SMS..address_proofs sap
--		LEFT OUTER 	JOIN address_proofs zap ON zap.address_proof = sap.address_proof_id
--		WHERE sap.address_proof_id IS NOT NULL AND zap.address_proof IS NULL;
--	END;

-- ====================================================================================================
--	Satsang Centre Details
-- ====================================================================================================

--INSERT INTO satsang_centres_details (satsang_centre_id, is_main_centre)
--	SELECT satsang_centre_id, 'No' FROM CDB..satsang_centres csc WHERE csc.satsang_centre_id <> @centre_id;

-- ====================================================================================================
--	Sub Departments, Sub Departments Satsang Centres
-- ====================================================================================================

-- =============================================================================
--INSERT INTO	sub_departments
--		(	department_id, sub_department_cd, sub_department_nm	)
--	SELECT	z.department_id, s.sub_department_id, s.sub_department_nm
--	FROM	SMS..sub_departments	s
--		JOIN	departments	z
--			ON	(	z.department_cd	=	s.department_id	COLLATE SQL_Latin1_General_CP1_CI_AS
--				);

-- =============================================================================
--INSERT INTO	sub_departments_satsang_centres
--		(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
--	SELECT	u.sub_department_id, @centre_id, @active_eff_from, @active_eff_till
--	FROM	SMS..sub_departments	s
--		JOIN	departments	z
--			ON	(	z.department_cd	=	s.department_id	COLLATE SQL_Latin1_General_CP1_CI_AS
--			)
--		JOIN	sub_departments	u
--			ON	(	u.department_id	=	z.department_id
--				AND	u.sub_department_cd	=	s.sub_department_id COLLATE SQL_Latin1_General_CP1_CI_AS
--				)
--	WHERE	is_active	=	'Yes';
--
--INSERT INTO	sub_departments_satsang_centres
--		(	sub_department_id, satsang_centre_id, effective_from, effective_till	)
--	SELECT	u.sub_department_id, @centre_id, @inactiv_eff_frm, @inactiv_eff_til
--	FROM	SMS..sub_departments	s
--		JOIN	departments	z
--			ON	(	z.department_cd	=	s.department_id	COLLATE SQL_Latin1_General_CP1_CI_AS)
--		JOIN	sub_departments	u
--			ON	(	u.department_id	=	z.department_id
--				AND	u.sub_department_cd	=	s.sub_department_id COLLATE SQL_Latin1_General_CP1_CI_AS
--				)
--	WHERE	is_active	=	'No';

-- ====================================================================================================
--	Satsang Centre Functionaries
-- ====================================================================================================

--SELECT @cnt1 = COUNT(*)
--			FROM SMS..centre_functionary scf
--LEFT OUTER 	JOIN centre_functionaries zcf ON zcf.centre_functionary = scf.functionary
--WHERE scf.functionary IS NOT NULL AND zcf.centre_functionary IS NULL;
--IF (@cnt1 > 0)
--	BEGIN
--		RAISERROR ('There are some functionary in sms..centre_functionary that are not in zsm..centre_functionaries', 16, 0);
--		SELECT scf.functionary
--					FROM SMS..centre_functionary scf
--		LEFT OUTER 	JOIN centre_functionaries zcf ON zcf.centre_functionary = scf.functionary
--		WHERE scf.functionary IS NOT NULL AND zcf.centre_functionary IS NULL;
--	END;
--
--INSERT INTO satsang_centre_functionaries
--			(satsang_centre_id, centre_functionary, functionary_nm, is_current, effective_from, effective_till)
--	SELECT	csc.satsang_centre_id, scf.functionary, scf.functionary_nm, LTRIM(RTRIM(scf.is_current)), scf.effective_from, scf.effective_till
--	FROM sms..satsang_centre_functionaries scf
--	JOIN tmp_mgr_satsang_centre_mapping scm ON scm.sms_id 				= scf.satsang_centre_id
--	JOIN CDB..satsang_centres csc			ON csc.satsang_centre_nm 	= scm.cdb_nm AND csc.effective_till > GETDATE()
--
--SELECT @cnt1 = COUNT(*)
--			FROM SMS..sewadars s
--LEFT OUTER 	JOIN sms..satsang_centre_functionaries scf ON s.outside_sewadar_secretary = scf.functionary_nm AND scf.functionary = 'Secretary'
--WHERE s.outside_sewadar_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
--IF (@cnt1 > 0)
--	BEGIN
--		RAISERROR ('There are some outside_sewadar_secretary in sms..sewadars that are not in sms..satsang_centre_functionaries', 16, 0);
--		SELECT DISTINCT s.outside_sewadar_secretary
--					FROM SMS..sewadars s
--		LEFT OUTER 	JOIN sms..satsang_centre_functionaries scf ON s.outside_sewadar_secretary = scf.functionary_nm
--		WHERE s.outside_sewadar_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
--	END;
--
--SELECT @cnt1 = COUNT(*)
--			FROM SMS..sewadars s
--LEFT OUTER 	JOIN sms..satsang_centre_functionaries scf ON s.outside_sewadar_area_secretary = scf.functionary_nm  AND scf.functionary = 'Area Secretary'
--WHERE s.outside_sewadar_area_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
--IF (@cnt1 > 0)
--	BEGIN
--		RAISERROR ('There are some outside_sewadar_area_secretary in sms..sewadars that are not in sms..satsang_centre_functionaries', 16, 0);
--		SELECT DISTINCT s.outside_sewadar_area_secretary
--					FROM SMS..sewadars s
--		LEFT OUTER 	JOIN sms..satsang_centre_functionaries scf ON s.outside_sewadar_area_secretary = scf.functionary_nm  AND scf.functionary = 'Area Secretary'
--		WHERE s.outside_sewadar_area_secretary IS NOT NULL AND scf.functionary_nm IS NULL;
--	END;

-- ====================================================================================================
--	Post Offices or Cities
-- ====================================================================================================

--SELECT @cnt1 = COUNT(*) FROM SMS..pos_or_cities;
--INSERT INTO post_offices_or_cities
--			(district_id, post_office_or_city_cd, post_office_or_city_nm, std_code, effective_from, effective_till)
--	SELECT	cd.district_or_city_id, LTRIM(RTRIM(p.po_or_city_id)), p.po_or_city_nm, p.po_or_city_std_code,
--			CASE WHEN p.is_active = 'Yes' THEN @active_eff_from ELSE @inactiv_eff_frm END,
--			CASE WHEN p.is_active = 'Yes' THEN @active_eff_till ELSE @inactiv_eff_til END
--	FROM SMS..pos_or_cities p 
--	JOIN SMS..districts d ON d.district_id = p.district_id AND d.state_id = p.state_id AND d.country_id = p.country_id
--	JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id
--	JOIN SMS..countries c ON c.country_id = d.country_id
--	JOIN CDB..countries cc ON cc.country_nm = c.country_nm AND cc.effective_till > GETDATE()
--	JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm AND cs.effective_till > GETDATE()
--	JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = d.district_nm AND cd.effective_till > GETDATE();
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Post Offices or Cities do not match', 16, 0);

-- ====================================================================================================
--	Sewadars
-- ====================================================================================================

INSERT INTO sewadars
			(first_nm, middle_nm, last_nm, gender, birth_dtm, is_married, initiation_dt, initiation_place_id, initiation_by,
			current_satsang_centre_id, current_sewadar_grno, global_sewadar_status_cd, global_sewadar_status_dt)
	SELECT 	LEFT(LTRIM(s.Name),LEN(s.Name) - CHARINDEX(' ',REVERSE(s.Name))), 
			COALESCE(LTRIM(RTRIM(s.MiddleName)), @not_known_middle_nm),
			RIGHT(RTRIM(s.Name),CHARINDEX(' ',REVERSE(RTRIM(s.Name))) - 1),
			LTRIM(RTRIM(s.Gender)),
			COALESCE(CONVERT(VARCHAR(11), s.DoB, 106), DATEADD(YEAR, -s.Age, '01-Jan-2011')),
			CASE WHEN (s.Married = 0) THEN 'No' ELSE 'Yes' END,
			CASE WHEN (s.I_Dt IS NULL AND COALESCE(s.I_SatGuru, s.I_Place, CONVERT(VARCHAR, s.I_Dt)) IS NOT NULL) THEN @not_known_initiation_dt
				ELSE CONVERT(VARCHAR(11), s.I_Dt, 106) END,
			CASE WHEN COALESCE(s.I_SatGuru, s.I_Place, CONVERT(VARCHAR, s.I_Dt)) IS NULL THEN NULL
				ELSE CASE WHEN (s.I_Place IS NULL) THEN @not_known_initiation_place_id ELSE ip.place_id END END,
			CASE WHEN COALESCE(s.I_SatGuru, s.I_Place, CONVERT(VARCHAR, s.I_Dt)) IS NULL THEN NULL
				ELSE CASE WHEN (s.I_SatGuru IS NULL) THEN @not_known_initiated_by ELSE p.patron_id END END,
			NULL, NULL, NULL, NULL
	FROM ngp..sewadars s
	LEFT OUTER JOIN tmp_mgr_ngp_initiation_place_mapping im ON im.sms_initiation_place = s.I_Place
	LEFT OUTER JOIN CDB..initiation_places ip ON ip.place_nm = im.cdb_initiation_place_nm
	LEFT OUTER JOIN tmp_mgr_ngp_master_mapping mm ON mm.sms_master = s.I_SatGuru
	LEFT OUTER JOIN CDB..patrons p ON p.patron_nm = mm.cdb_master;


-- ====================================================================================================
--	House Keeping
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_ngp_sewadar_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_ngp_sewadar_mapping;

CREATE TABLE tmp_mgr_ngp_sewadar_mapping
(
	sewadar_id INT,
	GrNo INT PRIMARY KEY
);

INSERT INTO tmp_mgr_ngp_sewadar_mapping (sewadar_id, GrNo) 
	SELECT zs.sewadar_id, s.GRNo
	FROM NGP..Sewadars s JOIN sewadars zs ON 
		zs.first_nm = LEFT(LTRIM(s.Name),LEN(s.Name) - CHARINDEX(' ',REVERSE(s.Name))) AND
		zs.middle_nm = COALESCE(LTRIM(RTRIM(s.MiddleName)), @not_known_middle_nm) AND
		zs.last_nm = RIGHT(RTRIM(s.Name),CHARINDEX(' ',REVERSE(RTRIM(s.Name))) - 1) AND
		zs.Gender = LTRIM(RTRIM(s.Gender)) AND
		zs.birth_dtm = COALESCE(CONVERT(VARCHAR(11), s.DoB, 106), DATEADD(YEAR, -s.Age, '01-Jan-2011'));

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_ngp_addressproof_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_ngp_addressproof_mapping;

CREATE TABLE tmp_mgr_ngp_addressproof_mapping
(
	GrNO INT PRIMARY KEY,
	ngp_addressproof_id INT,
	zsm_addressproof address_proof,
	details VARCHAR (300)
);

INSERT INTO tmp_mgr_ngp_addressproof_mapping (GrNo, ngp_addressproof_id, zsm_addressproof, details)
	SELECT GrNo, DocNo, 'Ration Card', Details  FROM NGP..Sewadar_AddProof WHERE DocNo = 1;
INSERT INTO tmp_mgr_ngp_addressproof_mapping (GrNo, ngp_addressproof_id, zsm_addressproof, details)
	SELECT GrNo, DocNo, 'Voter''s Card', Details FROM NGP..Sewadar_AddProof WHERE DocNo = 5 AND Details LIKE '%Voter%';
INSERT INTO tmp_mgr_ngp_addressproof_mapping (GrNo, ngp_addressproof_id, zsm_addressproof, details)
	SELECT GrNo, DocNo, NULL, Details FROM NGP..Sewadar_AddProof WHERE DocNo = 5 AND Details NOT LIKE '%Voter%'; -- Others
INSERT INTO tmp_mgr_ngp_addressproof_mapping (GrNo, ngp_addressproof_id, zsm_addressproof, details)
	SELECT sa.GrNo, sa.DocNo, NULL, a.Description FROM NGP..Sewadar_AddProof sa JOIN NGP..AddProofMast a ON a.Code = sa.DocNo 
		WHERE DocNo NOT IN (1, 5); -- Others

-- ====================================================================================================
--	Sewadars Details
-- ====================================================================================================

SELECT @cnt1 = COUNT(*) FROM NGP..sewadars WHERE CenterCode <> 1 OR CenterFlag <> 'SSC'
IF (@cnt1 <> 0)
	RAISERROR ('There are some Sewadars in NGP with Weekly Satsang Centre other than Nagpur', 16, 0);

INSERT INTO sewadars_details
			(sewadar_id, address_proof, other_address_proof, telephone_mobile, telephone_residence, telephone_office, occupation,
			attends_weekly_satsang, weekly_satsang_centre_id, has_hypertension, is_diabetic, has_skin_problem, has_epillepsy, any_disability)
	SELECT 	sm.sewadar_id, am1.zsm_addressproof, am2.details, s.ContactNo_M, s.ContactNo_R, s.ContactNo_O, 'Un-employed',
		CASE WHEN (s.Attended_WK_SS = 1) THEN 'Yes' ELSE 'No' END,
		CASE WHEN (s.Attended_WK_SS = 1) THEN @centre_id ELSE NULL END,
		CASE WHEN h1.GrNo IS NOT NULL THEN 'Yes' ELSE NULL END, 
		CASE WHEN h2.GrNo IS NOT NULL THEN 'Yes' ELSE NULL END, 
		CASE WHEN h3.GrNo IS NOT NULL THEN 'Yes' ELSE NULL END, 
		CASE WHEN h4.GrNo IS NOT NULL THEN 'Yes' ELSE NULL END, 
		CASE WHEN h5.GrNo IS NOT NULL THEN h5.Comments ELSE NULL END
	FROM tmp_mgr_ngp_sewadar_mapping sm
	JOIN NGP..sewadars s ON sm.GrNo = s.GrNo
	LEFT OUTER JOIN tmp_mgr_ngp_addressproof_mapping am1 ON am1.GrNo = s.GrNo AND am1.zsm_addressproof IS NOT NULL
	LEFT OUTER JOIN tmp_mgr_ngp_addressproof_mapping am2 ON am2.GrNo = s.GrNo AND am1.zsm_addressproof IS NULL
	LEFT OUTER JOIN NGP..Sewadar_Health h1 ON h1.GrNo = s.GrNo AND h1.ParameterCode = 1
	LEFT OUTER JOIN NGP..Sewadar_Health h2 ON h2.GrNo = s.GrNo AND h2.ParameterCode = 3
	LEFT OUTER JOIN NGP..Sewadar_Health h3 ON h3.GrNo = s.GrNo AND h3.ParameterCode = 2
	LEFT OUTER JOIN NGP..Sewadar_Health h4 ON h4.GrNo = s.GrNo AND h4.ParameterCode = 4
	LEFT OUTER JOIN NGP..Sewadar_Health h5 ON h5.GrNo = s.GrNo AND h5.ParameterCode = 5 AND h5.Comments IN ('Handicap', 'Asthama');

SELECT @cnt1 = COUNT(*) FROM NGP..sewadars;
SELECT @cnt2 = COUNT(*) FROM sewadars_details sd JOIN tmp_mgr_ngp_sewadar_mapping sm ON sm.sewadar_id = sd.sewadar_id;
IF (@cnt1 != @cnt2)
	RAISERROR ('Sewadars Details not entered for all Sewadars', 16, 0);

---- ====================================================================================================
----	Sewadars Addresses
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM sewadars;
--INSERT INTO sewadars_addresses
--			(sewadar_id, address_type, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code)
--	SELECT	zs.sewadar_id, 'Residence', ss.residence_address_line_1, ss.residence_address_line_2, zp.post_office_or_city_id, ss.residence_pincode
--	FROM sewadars zs
--	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id	
--	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--	JOIN SMS..pos_or_cities p ON p.country_id = ss.residence_country_id AND p.state_id = ss.residence_state_id AND
--		p.district_id = ss.residence_district_id AND p.po_or_city_id = ss.residence_po_or_city_id
--	JOIN SMS..districts d ON d.district_id = p.district_id AND d.state_id = p.state_id AND d.country_id = p.country_id
--	JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id
--	JOIN SMS..countries c ON c.country_id = d.country_id
--	JOIN CDB..countries cc ON cc.country_nm = c.country_nm AND cc.effective_till > GETDATE()
--	JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm AND cs.effective_till > GETDATE()
--	JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = d.district_nm AND cd.effective_till > GETDATE()
--	JOIN post_offices_or_cities zp ON zp.district_id = cd.district_or_city_id AND zp.post_office_or_city_nm = p.po_or_city_nm;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewadars Addresses do not match', 16, 0);
--
---- ====================================================================================================
----	Sewadars Skills
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT ssr.system_id, ss.specialisation_id FROM tmp_mgr_sewadar_system_record ssr
--						JOIN SMS..sewadar_specialisations ss ON ss.sewadar_id = ssr.sewadar_id) t;
--INSERT INTO sewadars_skills
--			(sewadar_id, skill_id, skill_sq)
--	SELECT	s.sewadar_id, cs.skill_id, ss.serial_id
--	FROM sewadars s
--	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
--	JOIN sms..sewadar_specialisations ss ON ss.sewadar_id = ssr.sewadar_id
--	JOIN sms..specialisation_areas sa ON sa.specialisation_id = ss.specialisation_id
--	JOIN cdb..skills cs ON cs.skill_nm = sa.specialisation_nm;
--SET @cnt2 = @@ROWCOUNT;
--
--IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewadars_skills' AND TYPE = 'U')
--	DROP TABLE [dbo].tmp_mgr_sewadars_skills;
--
--CREATE TABLE tmp_mgr_sewadars_skills
--(
--	sewadar_id	sewadar_id,
--	skill_id	skill_id,
--	skill_sq	display_order,
--	CONSTRAINT TmpMgrSewadarsSkills_PK PRIMARY KEY
--		(sewadar_id, skill_id)
--);
--
--INSERT INTO tmp_mgr_sewadars_skills (sewadar_id, skill_id)
--	SELECT	DISTINCT zssr.system_id, cs.skill_id
--	FROM tmp_mgr_sewadar_system_record zssr 
--	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id <> zssr.system_id AND ssr.sewadar_id = zssr.sewadar_id 
--	JOIN sms..sewadar_specialisations ss ON ss.sewadar_id = ssr.sewadar_id
--	JOIN sms..specialisation_areas sa ON sa.specialisation_id = ss.specialisation_id
--	JOIN cdb..skills cs ON cs.skill_nm = sa.specialisation_nm;
--
--UPDATE t
--	SET skill_sq = (SELECT COUNT(*)
--		FROM tmp_mgr_sewadars_skills ss1
--		JOIN tmp_mgr_sewadars_skills ss2 ON ss1.sewadar_id = ss2.sewadar_id AND ss1.skill_id <= ss2.skill_id
--		WHERE ss1.sewadar_id = t.sewadar_id AND ss1.skill_id = t.skill_id
--		GROUP BY ss1.sewadar_id, ss1.skill_id)		
--	FROM tmp_mgr_sewadars_skills t;
--
--INSERT INTO sewadars_skills
--			(sewadar_id, skill_id, skill_sq)
--	SELECT	ss.sewadar_id, ss.skill_id, (SELECT COALESCE(MAX(s.skill_sq), 0) FROM sewadars_skills s WHERE s.sewadar_id = ss.sewadar_id) + ss.skill_sq
--	FROM tmp_mgr_sewadars_skills ss WHERE ss.skill_id NOT IN 
--		(SELECT t.skill_id FROM sewadars_skills t WHERE t.sewadar_id = ss.sewadar_id);
--SET @cnt2 = @cnt2 + @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewadars Skills do not match', 16, 0);
--
---- ====================================================================================================
----	Sewadars Remarks
---- ====================================================================================================
--IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewadars_remarks' AND TYPE = 'U')
--	DROP TABLE [dbo].tmp_mgr_sewadars_remarks;
--
--CREATE TABLE tmp_mgr_sewadars_remarks
--(
--	sewadar_id		sewadar_id,
--	sewadar_grno	sewadar_grno,
--	remarks_type	remarks_type,
--	remarks			VARCHAR(200),
--	remarks_sq		display_order
--		CONSTRAINT	TmpMgrSewadarsRemarks_PK_SewadarGrno_RemarksType
--			PRIMARY KEY	NONCLUSTERED	(	sewadar_grno, remarks_type	)
--);
--
---- Annotations
--INSERT INTO tmp_mgr_sewadars_remarks
--			(sewadar_id, sewadar_grno, remarks_type, remarks, remarks_sq)
--	SELECT	ssr.system_id, ssr.sewadar_id, 'Annotations', ss.annotations, NULL
--	FROM tmp_mgr_sewadar_system_record ssr
--	JOIN SMS..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--	WHERE ss.annotations IS NOT NULL;
--		
--UPDATE t
--	SET t.remarks_sq = (SELECT COUNT(*)		
--		FROM tmp_mgr_sewadars_remarks sr1
--		JOIN tmp_mgr_sewadars_remarks sr2 ON sr1.sewadar_id = sr2.sewadar_id AND sr1.remarks <= sr2.remarks AND sr1.remarks_type = 'Annotations' AND sr2.remarks_type = 'Annotations'
--		WHERE sr1.sewadar_id = t.sewadar_id AND sr1.remarks = t.remarks AND t.remarks_type = 'Annotations'
--		GROUP BY sr1.sewadar_id, sr1.remarks)
--	FROM tmp_mgr_sewadars_remarks t
--	WHERE t.remarks_type = 'Annotations';
--	
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'Annotations', 1, SUBSTRING(tsr.remarks, 1, 91) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'Annotations' AND tsr.remarks_sq = 1
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'Annotations', 2, SUBSTRING(tsr.remarks, 92, 91) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'Annotations' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 91
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'Annotations', 3, SUBSTRING(tsr.remarks, 183, 100) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'Annotations' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 182
--
--SELECT @cnt1 = MAX(remarks_sq) FROM tmp_mgr_sewadars_remarks WHERE remarks_type = 'Annotations';
--IF (@cnt1 > 1)
--	RAISERROR ('Some more Remarks (type Annotations) needs to be migrated', 16, 0);
--
--SELECT @cnt1 = COUNT(*) FROM sewadars s1 WHERE sewadar_id IN 
--	(SELECT DISTINCT s2.sewadar_id
--		FROM sewadars s2
--		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s2.sewadar_id
--		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--		where ss.annotations IS NOT NULL);
--SELECT @cnt2 = COUNT(*) FROM sewadars s1 WHERE sewadar_id IN
--	(SELECT DISTINCT sewadar_id FROM sewadars_remarks WHERE remarks_type = 'Annotations');
--IF (@cnt1 <> @cnt2)
--	RAISERROR ('Sewadars Remarks (type Annotations) not entered for all Sewadars', 16, 0);
--
--SET @cnt1 = 
--	(SELECT COUNT(*) FROM sewadars s
--		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
--		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--		WHERE ss.annotations IS NOT NULL AND LEN(ss.annotations) < 92) + 
--	2*(SELECT COUNT(*) FROM sewadars s
--		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
--		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--		WHERE ss.annotations IS NOT NULL AND LEN(ss.annotations) > 91 AND LEN(ss.annotations) < 183) + 
--	3*(SELECT COUNT(*) FROM sewadars s
--		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
--		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--		WHERE ss.annotations IS NOT NULL AND LEN(ss.annotations) > 182);
--SELECT @cnt2 = COUNT (*) FROM sewadars_remarks WHERE remarks_type = 'Annotations';
--IF (@cnt1 <> @cnt2)
--	RAISERROR ('Sewadars Remarks (type Annotations) not entered for all Grno', 16, 0);
--
---- Adding annotations for incorrect initiation dates. These dates does not fall under initiation period of any Patron.
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	zs.sewadar_id, 'Annotations', 
--		(SELECT COALESCE(MAX(sr.remarks_sq), 0) FROM sewadars_remarks sr WHERE sr.sewadar_id = zs.sewadar_id AND sr.remarks_type = 'Annotations') + 1,
--		ssr.sewadar_id + ' has incorrect initiation date'
--	FROM sewadars zs
--	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = zs.sewadar_id
--	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--	WHERE zs.initiation_by = 0
--
---- To do notes
--INSERT INTO tmp_mgr_sewadars_remarks
--			(sewadar_id, sewadar_grno, remarks_type, remarks, remarks_sq)
--	SELECT	ssr.system_id, ssr.sewadar_id, 'To do notes', ss.to_do_notes, NULL
--	FROM tmp_mgr_sewadar_system_record ssr
--	JOIN SMS..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--	WHERE ss.to_do_notes IS NOT NULL;
--		
--UPDATE t
--	SET t.remarks_sq = (SELECT COUNT(*)		
--		FROM tmp_mgr_sewadars_remarks sr1
--		JOIN tmp_mgr_sewadars_remarks sr2 ON sr1.sewadar_id = sr2.sewadar_id AND sr1.remarks <= sr2.remarks AND sr1.remarks_type = 'To do notes' AND sr2.remarks_type = 'To do notes'
--		WHERE sr1.sewadar_id = t.sewadar_id AND sr1.remarks = t.remarks AND t.remarks_type = 'To do notes'
--		GROUP BY sr1.sewadar_id, sr1.remarks)
--	FROM tmp_mgr_sewadars_remarks t
--	WHERE t.remarks_type = 'To do notes';
--	
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'To do notes', 1, SUBSTRING(tsr.remarks, 1, 91) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'To do notes' AND tsr.remarks_sq = 1
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'To do notes', 2, SUBSTRING(tsr.remarks, 92, 91) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'To do notes' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 91
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'To do notes', 3, SUBSTRING(tsr.remarks, 183, 100) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'To do notes' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 182
--
--SELECT @cnt1 = MAX(remarks_sq) FROM tmp_mgr_sewadars_remarks WHERE remarks_type = 'To do notes';
--IF (@cnt1 > 1)
--	RAISERROR ('Some more Remarks (type "To do notes") needs to be migrated', 16, 0);
--
--SELECT @cnt1 = COUNT(*) FROM sewadars s1 WHERE s1.sewadar_id IN
--	(SELECT DISTINCT s2.sewadar_id
--	FROM sewadars s2
--	JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s2.sewadar_id
--	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--	WHERE ss.to_do_notes IS NOT NULL);
--SELECT @cnt2 = COUNT(*) FROM sewadars s1 WHERE s1.sewadar_id IN 
--	(SELECT DISTINCT sewadar_id FROM sewadars_remarks WHERE remarks_type = 'To do notes');
--IF (@cnt1 <> @cnt2)
--	RAISERROR ('Sewadars Remarks (type "To do notes") not entered for all Sewadars', 16, 0);
--
--SET @cnt1 = 
--	(SELECT COUNT(*) FROM sewadars s
--		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
--		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--		WHERE ss.to_do_notes IS NOT NULL AND LEN(ss.to_do_notes) < 92) + 
--	2*(SELECT COUNT(*) FROM sewadars s
--		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
--		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--		WHERE ss.to_do_notes IS NOT NULL AND LEN(ss.to_do_notes) > 91 AND LEN(ss.to_do_notes) < 183) + 
--	3*(SELECT COUNT(*) FROM sewadars s
--		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
--		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--		WHERE ss.to_do_notes IS NOT NULL AND LEN(ss.to_do_notes) > 182);
--SELECT @cnt2 = COUNT (*) FROM sewadars_remarks WHERE remarks_type = 'To do notes';
--IF (@cnt1 <> @cnt2)
--	RAISERROR ('Sewadars Remarks (type "To do notes") not entered for all Grno', 16, 0);
--
---- Remarks
--INSERT INTO tmp_mgr_sewadars_remarks
--			(sewadar_id, sewadar_grno, remarks_type, remarks, remarks_sq)
--	SELECT	ssr.system_id, ssr.sewadar_id, 'Remarks', ss.remarks, NULL
--	FROM tmp_mgr_sewadar_system_record ssr
--	JOIN SMS..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--	WHERE ss.remarks IS NOT NULL;
--		
--UPDATE t
--	SET t.remarks_sq = (SELECT COUNT(*)		
--		FROM tmp_mgr_sewadars_remarks sr1
--		JOIN tmp_mgr_sewadars_remarks sr2 ON sr1.sewadar_id = sr2.sewadar_id AND sr1.remarks <= sr2.remarks AND sr1.remarks_type = 'Remarks' AND sr2.remarks_type = 'Remarks'
--		WHERE sr1.sewadar_id = t.sewadar_id AND sr1.remarks = t.remarks AND t.remarks_type = 'Remarks'
--		GROUP BY sr1.sewadar_id, sr1.remarks)
--	FROM tmp_mgr_sewadars_remarks t
--	WHERE t.remarks_type = 'Remarks';
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'Remarks', 1, SUBSTRING(tsr.remarks, 1, 91) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 1
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'Remarks', 2, SUBSTRING(tsr.remarks, 92, 91) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 91
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'Remarks', 3, SUBSTRING(tsr.remarks, 183, 100) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 1 AND LEN(tsr.remarks) > 182
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'Remarks', 
--		(SELECT COALESCE(MAX(sr.remarks_sq), 0) FROM sewadars_remarks sr WHERE sr.sewadar_id = tsr.sewadar_id AND sr.remarks_type = 'Remarks') + 1, 
--		SUBSTRING(tsr.remarks, 1, 91) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 2
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'Remarks',
--		(SELECT COALESCE(MAX(sr.remarks_sq), 0) FROM sewadars_remarks sr WHERE sr.sewadar_id = tsr.sewadar_id AND sr.remarks_type = 'Remarks') + 1,
--		SUBSTRING(tsr.remarks, 92, 91) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 2 AND LEN(tsr.remarks) > 91
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	tsr.sewadar_id, 'Remarks',
--		(SELECT COALESCE(MAX(sr.remarks_sq), 0) FROM sewadars_remarks sr WHERE sr.sewadar_id = tsr.sewadar_id AND sr.remarks_type = 'Remarks') + 1,
--		SUBSTRING(tsr.remarks, 183, 100) + ' [' + tsr.sewadar_grno + ']'
--	FROM tmp_mgr_sewadars_remarks tsr
--	WHERE tsr.remarks_type = 'Remarks' AND tsr.remarks_sq = 2 AND LEN(tsr.remarks) > 182
--
--SELECT @cnt1 = MAX(remarks_sq) FROM tmp_mgr_sewadars_remarks WHERE remarks_type = 'Remarks';
--IF (@cnt1 > 2)
--	RAISERROR ('Some more Remarks (type Remarks) needs to be migrated', 16, 0);
--
--SELECT @cnt1 = COUNT(*) FROM sewadars s1 WHERE s1.sewadar_id IN
--	(SELECT DISTINCT s.sewadar_id FROM sewadars s
--	JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
--	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--	where ss.remarks IS NOT NULL);
--
--SELECT @cnt2 = COUNT(*) FROM sewadars s1 WHERE s1.sewadar_id IN
--	(SELECT DISTINCT sewadar_id FROM sewadars_remarks WHERE remarks_type = 'Remarks');
--IF (@cnt1 <> @cnt2)
--	RAISERROR ('Sewadars Remarks (type Remarks) not entered for all Sewadars', 16, 0);
--
--SET @cnt1 =
--	(SELECT COUNT(*) FROM sewadars s
--		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
--		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--		WHERE ss.remarks IS NOT NULL AND LEN(ss.remarks) < 92) +
--	2*(SELECT COUNT(*) FROM sewadars s
--		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
--		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--		WHERE ss.remarks IS NOT NULL AND LEN(ss.remarks) > 91 AND LEN(ss.remarks) < 183) +
--	3*(SELECT COUNT(*) FROM sewadars s
--		JOIN tmp_mgr_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id
--		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--		WHERE ss.remarks IS NOT NULL AND LEN(ss.remarks) > 182);
--SELECT @cnt2 = COUNT (*) FROM sewadars_remarks WHERE remarks_type = 'Remarks';
--IF (@cnt1 <> @cnt2)
--	RAISERROR ('Sewadars Remarks (type Remarks) not entered for all Grno', 16, 0);
--
---- ====================================================================================================
----	Sewadars Registrations
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM tmp_mgr_sms_sewadar_system_record;
--INSERT INTO sewadars_registrations
--			(satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt, sewadar_status_cd,
--			sewadar_status_dtm, responsibility, responsibility_dtm, reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id,
--			reference_1_department, reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department, sponsorer_id,
--			area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, weekly_sewa_location_id, weekly_department_id)
--	SELECT	@centre_id, ss.sewadar_id, ssr.system_id, appointment_dt, LTRIM(RTRIM(ss.is_emigrant)), ddpt.department_id, dsdpt.sub_department_id, ss.department_dt,
--		zss.sewadar_status_cd, ss.status_dt,
--		CASE WHEN ss.responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ') THEN LTRIM(RTRIM(ss.responsibility)) ELSE NULL END,
--		CASE WHEN ss.responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ') THEN ss.responsibility_dt ELSE NULL END, 
--		CASE WHEN ss.reference_1_sewadar_id IS NOT NULL THEN ssr1.system_id ELSE NULL END,
--		CASE WHEN ss.reference_1_relationship IS NOT NULL THEN cr1.relation_id ELSE @none_relation_id END,
--		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN LTRIM(RTRIM(ss.reference_1_nm)) ELSE NULL END,
--		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN CASE WHEN ss.reference_1_nm IS NOT NULL THEN CASE WHEN ss.reference_1_centre_id IS NOT NULL THEN 
--			csc1.satsang_centre_id ELSE @centre_id END ELSE NULL END ELSE NULL END,
--		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN CASE WHEN ss.reference_1_nm IS NOT NULL THEN CASE WHEN ss.reference_1_department IS NOT NULL THEN
--			ss.reference_1_department ELSE 'TO BE SPECIFIED' END ELSE NULL END ELSE NULL END,
--		CASE WHEN ss.reference_2_sewadar_id IS NOT NULL THEN ssr2.system_id ELSE NULL END,
--		CASE WHEN ss.reference_2_relationship IS NOT NULL THEN cr2.relation_id ELSE @none_relation_id END,
--		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN LTRIM(RTRIM(ss.reference_2_nm)) ELSE NULL END,
--		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN CASE WHEN ss.reference_2_nm IS NOT NULL THEN CASE WHEN ss.reference_2_centre_id IS NOT NULL THEN 
--			csc2.satsang_centre_id ELSE @centre_id END ELSE NULL END ELSE NULL END,
--		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN CASE WHEN ss.reference_2_nm IS NOT NULL THEN CASE WHEN ss.reference_2_department IS NOT NULL THEN
--			ss.reference_2_department ELSE 'TO BE SPECIFIED' END ELSE NULL END ELSE NULL END,
--		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'No' THEN ssrs.system_id ELSE NULL END,
--		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' THEN scfas.centre_functionary_id ELSE NULL END, 
--		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' THEN scfs.centre_functionary_id ELSE NULL END, 
--		ssra.system_id, NULL, NULL, NULL
--	FROM			 tmp_mgr_sewadar_system_record ssr
--				JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--				JOIN sms..departments	sdpt				ON	(ss.department_id		=	sdpt.department_id	)
--				JOIN departments		ddpt				ON	(sdpt.department_nm		=	ddpt.department_nm	)
--	LEFT OUTER	JOIN sms..sub_departments	ssdpt			ON	(ss.department_id		=	ssdpt.department_id		AND	ss.sub_department_id		=	ssdpt.sub_department_id	)
--	LEFT OUTER	JOIN sub_departments		dsdpt			ON	(ddpt.department_id		=	dsdpt.department_id		AND	ssdpt.sub_department_nm		=	dsdpt.sub_department_nm	)
--	LEFT OUTER 	JOIN tmp_mgr_sewadar_system_record ssr1 	ON ssr1.sewadar_id 			= ss.reference_1_sewadar_id
--	LEFT OUTER 	JOIN tmp_mgr_sewadar_system_record ssr2 	ON ssr2.sewadar_id 			= ss.reference_2_sewadar_id
--	LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm1 			ON rm1.sms_id 				= ss.reference_1_relationship
--	LEFT OUTER 	JOIN CDB..relations cr1						ON cr1.relation_nm 			= rm1.cdb_nm
--	LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm2 			ON rm2.sms_id 				= ss.reference_2_relationship
--	LEFT OUTER 	JOIN CDB..relations cr2						ON cr2.relation_nm 			= rm2.cdb_nm
--	LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm1 	ON scm1.sms_id 				= ss.reference_1_centre_id
--	LEFT OUTER 	JOIN CDB..satsang_centres csc1 				ON csc1.satsang_centre_nm 	= scm1.cdb_nm AND csc1.effective_till > GETDATE()
--	LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm2 	ON scm2.sms_id 				= ss.reference_2_centre_id
--	LEFT OUTER 	JOIN CDB..satsang_centres csc2 				ON csc2.satsang_centre_nm 	= scm2.cdb_nm AND csc2.effective_till > GETDATE()
--	LEFT OUTER	JOIN tmp_mgr_sewadar_system_record ssrs 	ON ssrs.sewadar_id 			= ss.sponsorer_id
--	LEFT OUTER	JOIN satsang_centre_functionaries scfas		ON scfas.functionary_nm		= ss.outside_sewadar_area_secretary AND scfas.centre_functionary = 'Area Secretary'
--	LEFT OUTER	JOIN satsang_centre_functionaries scfs		ON scfs.functionary_nm		= ss.outside_sewadar_secretary AND scfs.centre_functionary = 'Secretary'
--	LEFT OUTER	JOIN tmp_mgr_sewadar_system_record ssra 	ON ssra.sewadar_id 			= ss.approver_id
--				JOIN tmp_mgr_sewadar_status_mapping sm		ON sm.sms_status			= ss.status
--				JOIN sewadar_status zss 					ON zss.sewadar_status_nm 	= sm.zsm_sewadar_status_nm
--	WHERE ss.outside_sewadar_area_secretary IS NULL OR ss.outside_sewadar_secretary <> 'Narsibhai Tandel';
--SET @cnt2 = @@ROWCOUNT;
--
--INSERT INTO sewadars_registrations
--			(satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt, sewadar_status_cd,
--			sewadar_status_dtm, responsibility, responsibility_dtm, reference_1_sewadar_id, reference_1_relationship, reference_1_nm, reference_1_centre_id,
--			reference_1_department, reference_2_sewadar_id, reference_2_relationship, reference_2_nm, reference_2_centre_id, reference_2_department, sponsorer_id,
--			area_secretary_id, secretary_id, security_approver_id, sewa_samiti_approver_id, weekly_sewa_location_id, weekly_department_id)
--	SELECT	@centre_id, ss.sewadar_id, ssr.system_id, appointment_dt, LTRIM(RTRIM(ss.is_emigrant)), ddpt.department_id, dsdpt.sub_department_id, ss.department_dt,
--		zss.sewadar_status_cd, ss.status_dt,
--		CASE WHEN ss.responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ') THEN LTRIM(RTRIM(ss.responsibility)) ELSE NULL END,
--		CASE WHEN ss.responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ') THEN ss.responsibility_dt ELSE NULL END, 
--		CASE WHEN ss.reference_1_sewadar_id IS NOT NULL THEN ssr1.system_id ELSE NULL END,
--		CASE WHEN ss.reference_1_relationship IS NOT NULL THEN cr1.relation_id ELSE @none_relation_id END,
--		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN LTRIM(RTRIM(ss.reference_1_nm)) ELSE NULL END,
--		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN CASE WHEN ss.reference_1_nm IS NOT NULL THEN CASE WHEN ss.reference_1_centre_id IS NOT NULL THEN 
--			csc1.satsang_centre_id ELSE @centre_id END ELSE NULL END ELSE NULL END,
--		CASE WHEN ss.reference_1_sewadar_id IS NULL THEN CASE WHEN ss.reference_1_nm IS NOT NULL THEN CASE WHEN ss.reference_1_department IS NOT NULL THEN
--			ss.reference_1_department ELSE 'TO BE SPECIFIED' END ELSE NULL END ELSE NULL END,
--		CASE WHEN ss.reference_2_sewadar_id IS NOT NULL THEN ssr2.system_id ELSE NULL END,
--		CASE WHEN ss.reference_2_relationship IS NOT NULL THEN cr2.relation_id ELSE @none_relation_id END,
--		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN LTRIM(RTRIM(ss.reference_2_nm)) ELSE NULL END,
--		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN CASE WHEN ss.reference_2_nm IS NOT NULL THEN CASE WHEN ss.reference_2_centre_id IS NOT NULL THEN 
--			csc2.satsang_centre_id ELSE @centre_id END ELSE NULL END ELSE NULL END,
--		CASE WHEN ss.reference_2_sewadar_id IS NULL THEN CASE WHEN ss.reference_2_nm IS NOT NULL THEN CASE WHEN ss.reference_2_department IS NOT NULL THEN
--			ss.reference_2_department ELSE 'TO BE SPECIFIED' END ELSE NULL END ELSE NULL END,
--		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'No' THEN ssrs.system_id ELSE NULL END,
--		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' THEN scfas.centre_functionary_id ELSE NULL END, 
--		CASE WHEN LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' THEN scfs.centre_functionary_id ELSE NULL END, 
--		ssra.system_id, NULL, NULL, NULL
--	FROM			 tmp_mgr_sewadar_system_record ssr
--				JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_id
--				JOIN sms..departments	sdpt				ON	(ss.department_id		=	sdpt.department_id	)
--				JOIN departments		ddpt				ON	(sdpt.department_nm		=	ddpt.department_nm	)
--	LEFT OUTER	JOIN sms..sub_departments	ssdpt			ON	(ss.department_id		=	ssdpt.department_id		AND	ss.sub_department_id		=	ssdpt.sub_department_id	)
--	LEFT OUTER	JOIN sub_departments		dsdpt			ON	(ddpt.department_id		=	dsdpt.department_id		AND	ssdpt.sub_department_nm		=	dsdpt.sub_department_nm	)
--	LEFT OUTER 	JOIN tmp_mgr_sewadar_system_record ssr1 	ON ssr1.sewadar_id 			= ss.reference_1_sewadar_id
--	LEFT OUTER 	JOIN tmp_mgr_sewadar_system_record ssr2 	ON ssr2.sewadar_id 			= ss.reference_2_sewadar_id
--	LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm1 			ON rm1.sms_id 				= ss.reference_1_relationship
--	LEFT OUTER 	JOIN CDB..relations cr1						ON cr1.relation_nm 			= rm1.cdb_nm
--	LEFT OUTER 	JOIN tmp_mgr_relation_mapping rm2 			ON rm2.sms_id 				= ss.reference_2_relationship
--	LEFT OUTER 	JOIN CDB..relations cr2						ON cr2.relation_nm 			= rm2.cdb_nm
--	LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm1 	ON scm1.sms_id 				= ss.reference_1_centre_id
--	LEFT OUTER 	JOIN CDB..satsang_centres csc1 				ON csc1.satsang_centre_nm 	= scm1.cdb_nm AND csc1.effective_till > GETDATE()
--	LEFT OUTER 	JOIN tmp_mgr_satsang_centre_mapping scm2 	ON scm2.sms_id 				= ss.reference_2_centre_id
--	LEFT OUTER 	JOIN CDB..satsang_centres csc2 				ON csc2.satsang_centre_nm 	= scm2.cdb_nm AND csc2.effective_till > GETDATE()
--	LEFT OUTER	JOIN tmp_mgr_sewadar_system_record ssrs 	ON ssrs.sewadar_id 			= ss.sponsorer_id
--	LEFT OUTER	JOIN satsang_centre_functionaries scfas		ON scfas.functionary_nm		= ss.outside_sewadar_area_secretary AND scfas.centre_functionary = 'Area Secretary' AND COALESCE(ss.weekly_satsang_centre_id, ss.residence_district_id) = scfas.functionary_nm
--	LEFT OUTER	JOIN satsang_centre_functionaries scfs		ON scfs.functionary_nm		= ss.outside_sewadar_secretary AND scfs.centre_functionary = 'Secretary' AND COALESCE(ss.weekly_satsang_centre_id, ss.residence_district_id) = scfs.functionary_nm
--	LEFT OUTER	JOIN tmp_mgr_sewadar_system_record ssra 	ON ssra.sewadar_id 			= ss.approver_id
--				JOIN tmp_mgr_sewadar_status_mapping sm		ON sm.sms_status			= ss.status
--				JOIN sewadar_status zss 					ON zss.sewadar_status_nm 	= sm.zsm_sewadar_status_nm
--	WHERE ss.outside_sewadar_secretary = 'Narsibhai Tandel';
--SET @cnt2 = @cnt2 + @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--	RAISERROR ('Sewadars Registrations not entered for all Grno', 16, 0);
--
----Correcting status_cd to 'Left' (zsm_sewadar_status_cd) for retirees having is_eligible_for_prashaad = 'No'
--UPDATE sr
--	SET sr.sewadar_status_cd = 'Left'
--	FROM sewadars_registrations sr
--	JOIN sms..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
--	WHERE sr.sewadar_status_cd = 'Retired' AND LTRIM(RTRIM(ss.is_eligible_for_prashaad)) = 'No';
--
---- Corrcting 'In Laws' to Mother-in-law (cdb_nm) based on the relation_nm.
--UPDATE sr
--	SET sr.reference_1_relationship = (SELECT cr.relation_id FROM CDB..relations cr WHERE cr.relation_nm = 'Mother-in-law')
--	FROM sewadars_registrations sr
--	JOIN sms..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
--	WHERE 	ss.reference_1_relationship = 'IL   '
--	AND		ss.reference_1_nm IN ('LAXMI MAKHIJA                           ', 'HANSABEN MISTRY                         ', 'SHAKUNTALA NANDLAL ASRANI               ',
--			'RUKMANI M. LAKHIANI                     ', 'KAMLA ROHIRA                            ', 'POONAM VASUDEV MAGNANI                  ');
--
--UPDATE sr
--	SET reference_2_relationship = (SELECT cr.relation_id FROM CDB..relations cr WHERE cr.relation_nm = 'Mother-in-law')
--	FROM sewadars_registrations sr
--	JOIN sms..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
--	WHERE 	ss.reference_2_relationship = 'IL   '
--	AND		ss.reference_2_nm IN ('GANGUBAI HARIBHAU                       ', 'KASABAI MAHADEV KAMBLE                  ', 'PUSHPA KINGER                           ',
--			'KAVITA MOTWANI                          ', 'LAXMI PUNJABI                           ', 'PUSHPA NAGPAL                           ',
--			'KAVITA KARAMCHANDANI                    ')
--
---- ====================================================================================================
---- Updating current_satsang_centre_id, current_sewadar_grno in sewadars table after they are generated in sewadars_registrations
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM sewadars;
--UPDATE s
--	SET s.current_satsang_centre_id = @centre_id,
--		s.current_sewadar_grno		= ssr.sewadar_id
--	FROM sewadars s
--	JOIN tmp_mgr_sms_sewadar_system_record ssr ON ssr.system_id = s.sewadar_id	
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--	RAISERROR ('Sewadars Current GRNo updation mismatch ', 16, 0);
--
---- ====================================================================================================
----	Sewadars Remarks for non-migrated data in sewadars_registrations
---- ====================================================================================================
--
---- remarks_type='Migration' & remarks_sq=1 is for storing sponsorers for sewadars with is_outstation_sewadar = 'Yes'
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	sr.sewadar_id, 'Migration', 1, MAX(sr.sewadar_grno + ' had Sponsorer ' + ss.sponsorer_id)
--	FROM sewadars_registrations sr
--	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
--	WHERE LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' AND ss.sponsorer_id IS NOT NULL
--	GROUP BY sr.sewadar_id
--	HAVING COUNT(*) = 1
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	sr.sewadar_id, 'Migration', 1, dbo.tmp_mgr_fnGetAllRemarkStringForSponsors(sr.sewadar_id)
--	FROM sewadars_registrations sr
--	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
--	WHERE LTRIM(RTRIM(ss.is_emigrant)) = 'Yes' AND ss.sponsorer_id IS NOT NULL
--	GROUP BY sr.sewadar_id
--	HAVING COUNT(*) > 1
--
---- remarks_type='Migration' & remarks_sq=2 is for storing reference_1_nm, reference_1_centre, reference_1_dept for sewadars with reference_1_sewadar_id NOT NULL
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	sr.sewadar_id, 'Migration', 2, MAX(sr.sewadar_grno + ' had Ref1Nm ' + LTRIM(RTRIM(ss.reference_1_nm)) + ':Cntr ' + LTRIM(RTRIM(ss.reference_1_centre_id)) + 
--		':Dept ' + LTRIM(RTRIM(ss.reference_1_department)))
--	FROM sewadars_registrations sr
--	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
--	WHERE ss.reference_1_sewadar_id IS NOT NULL and ss.reference_1_nm IS NOT NULL
--	GROUP BY sr.sewadar_id
--	HAVING COUNT(*) = 1
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	sr.sewadar_id, 'Migration', 2, dbo.tmp_mgr_fnGetAllRemarkStringForReferenc1Nm(sr.sewadar_id)
--	FROM sewadars_registrations sr
--	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
--	WHERE ss.reference_1_sewadar_id IS NOT NULL and ss.reference_1_nm IS NOT NULL
--	GROUP BY sr.sewadar_id
--	HAVING COUNT(*) > 1
--
---- remarks_type='Migration' & remarks_sq=3 is for storing reference_2_nm, reference_2_centre, reference_2_dept for sewadars with reference_2_sewadar_id NOT NULL
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	sr.sewadar_id, 'Migration', 3, MAX(sr.sewadar_grno + ' had Ref1Nm ' + LTRIM(RTRIM(ss.reference_2_nm)) + ':Cntr ' + LTRIM(RTRIM(ss.reference_2_centre_id)) + 
--		':Dept ' + LTRIM(RTRIM(ss.reference_2_department)))
--	FROM sewadars_registrations sr
--	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
--	WHERE ss.reference_2_sewadar_id IS NOT NULL and ss.reference_2_nm IS NOT NULL
--	GROUP BY sr.sewadar_id
--	HAVING COUNT(*) = 1
--
--INSERT INTO sewadars_remarks
--			(sewadar_id, remarks_type, remarks_sq, remarks)
--	SELECT	sr.sewadar_id, 'Migration', 3, dbo.tmp_mgr_fnGetAllRemarkStringForReferenc2Nm(sr.sewadar_id)
--	FROM sewadars_registrations sr
--	JOIN SMS..sewadars ss ON ss.sewadar_id = sr.sewadar_grno
--	WHERE ss.reference_2_sewadar_id IS NOT NULL and ss.reference_2_nm IS NOT NULL
--	GROUP BY sr.sewadar_id
--	HAVING COUNT(*) > 1
--
---- ====================================================================================================
----	Sewadars Particulars and Attributes
---- ====================================================================================================
--
--INSERT INTO sewadars_particulars
--		(	satsang_centre_id, sewadar_grno	)
--	SELECT	DISTINCT @centre_id, sewadar_id
--	FROM	sms..sewadar_attributes
--	WHERE	attribute_id	IN	(	'ExmptCnst', 'MobilePerm', 'SndyCnst10'	);
--
--SELECT	@cnt1 = COUNT (*)
--FROM	sms..sewadar_attributes
--WHERE	attribute_id	IN	(	'ExmptCnst', 'MobilePerm', 'SndyCnst10'	);
--
--INSERT INTO	sewadars_attributes
--		(	satsang_centre_id, sewadar_grno, attribute_id, boolean_value, remarks	)
--	SELECT	@centre_id, s.sewadar_id, g.attribute_id, 'Yes', s.reference_no + COALESCE (' [' + s.remarks + ']', '')
--	FROM	sms..sewadar_attributes	s
--		JOIN	generic_attributes	g
--			ON	(	(	s.attribute_id	=	'ExmptCnst'		AND	g.attribute_nm = 'Construction Sewa Exemption'	)
--				OR	(	s.attribute_id	=	'MobilePerm'	AND	g.attribute_nm = 'Mobile Permission'			)
--				OR	(	s.attribute_id	=	'SndyCnst10'	AND	g.attribute_nm = 'Sewa allowed on Sunday, 2010'	)
--				);
--SET @cnt2 = @@ROWCOUNT;
--
--IF (@cnt1 != @cnt2)
--	RAISERROR ('Counts of records for Sewadars Attributes do not match', 16, 0);
--
---- ====================================================================================================
--
--SELECT	@cnt1 = COUNT (*)
--FROM	sms..sewadar_attributes
--WHERE	attribute_id	=	'Suspended';
--
--UPDATE	s
--	SET	global_sewadar_status_cd =	'Susp',
--		global_sewadar_status_dt =	a.effective_dt
--FROM	sewadars	s
--	JOIN	sms..sewadar_attributes	a
--		ON	(	s.current_satsang_centre_id	=	@centre_id
--			AND	s.current_sewadar_grno		=	a.sewadar_id
--			AND	attribute_id	=	'Suspended'
--			);
--
--SET @cnt2 = @@ROWCOUNT;
--
--IF (@cnt1 != @cnt2)
--	RAISERROR ('Counts of records for Suspended Sewadars (Attributes) do not match', 16, 0);
--
---- ====================================================================================================
----	Sewadars Tansfers
---- ====================================================================================================
--
--SELECT	@cnt1 = COUNT (*) FROM SMS..sewadar_transfers
--INSERT INTO sewadars_transfers 
--			(satsang_centre_id, sewadar_grno, effective_dt, old_department_id, old_sub_department_id, department_id, sub_department_id, remarks)
--	SELECT	@centre_id, sst.sewadar_id, sst.effective_ts, zd_o.department_id, zsd_o.sub_department_id, zd.department_id, zsd.sub_department_id, sst.remarks
--	FROM sms..sewadar_transfers sst
--	LEFT OUTER	JOIN sms..departments		sd_o	ON	(sd_o.department_id		=	sst.old_department_id	)
--	LEFT OUTER	JOIN departments			zd_o	ON	(zd_o.department_nm		=	sd_o.department_nm		)
--	LEFT OUTER	JOIN sms..sub_departments	ssd_o	ON	(ssd_o.department_id	=	sst.old_department_id	AND	ssd_o.sub_department_id		=	sst.old_sub_department_id	)
--	LEFT OUTER	JOIN sub_departments		zsd_o	ON	(zsd_o.department_id	=	zd_o.department_id		AND	zsd_o.sub_department_nm		=	ssd_o.sub_department_nm		)
--				JOIN sms..departments		sd		ON	(sd.department_id		=	sst.department_id	)
--				JOIN departments			zd		ON	(zd.department_nm		=	sd.department_nm	)
--	LEFT OUTER	JOIN sms..sub_departments	ssd		ON	(ssd.department_id		=	sst.department_id	AND	ssd.sub_department_id		=	sst.sub_department_id	)
--	LEFT OUTER	JOIN sub_departments		zsd		ON	(zsd.department_id		=	zd.department_id	AND	zsd.sub_department_nm		=	ssd.sub_department_nm		);
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 != @cnt2)
--	RAISERROR ('Counts of records for Sewadars Transfer do not match', 16, 0);
--
---- ====================================================================================================
----	Sewadars Stataus Changes
---- ====================================================================================================
--
--IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewadars_status_changes' AND TYPE = 'U')
--	DROP TABLE [dbo].tmp_mgr_sewadars_status_changes;
--
--CREATE TABLE tmp_mgr_sewadars_status_changes
--(
--	sewadar_grno		sewadar_grno,
--	effective_dt		SMALLDATETIME,
--	sewadar_status_cd	sewadar_status_cd,
--	change_sq			display_order,
--		CONSTRAINT	PK_TmpMgrSewadarsStatusChanges_SewadarGrno_EffectiveDt
--					PRIMARY KEY		(sewadar_grno, effective_dt)
--);
--
--INSERT INTO tmp_mgr_sewadars_status_changes
--			(sewadar_grno, effective_dt, sewadar_status_cd)
--	SELECT	s.sewadar_id, s.effective_dt, CASE WHEN ssm.zsm_global_sewadar_status_nm IS NOT NULL THEN ssg.sewadar_status_cd ELSE ss.sewadar_status_cd END
--				FROM	sms..sewadar_status s
--				JOIN	tmp_mgr_sewadar_status_mapping 	ssm ON ssm.sms_status 		 = s.status
--				JOIN	sewadar_status					ss	ON ss.sewadar_status_nm	 = ssm.zsm_sewadar_status_nm
--	LEFT OUTER 	JOIN	sewadar_status					ssg	ON ssg.sewadar_status_nm = ssm.zsm_global_sewadar_status_nm
--
---- Some entries in sms..sewadar_status, where 2 consecutive entries for the same grno had same status. Only 1 of them is migrated after manual inspection.
--DELETE t FROM tmp_mgr_sewadars_status_changes t WHERE
--	(t.sewadar_grno = 'G02701' AND t.effective_dt = '2001-11-17 00:00:00' AND t.sewadar_status_cd = 'Perm') OR
--	(t.sewadar_grno = 'G05128' AND t.effective_dt = '2002-11-14 00:00:00' AND t.sewadar_status_cd = 'Temp') OR
--	(t.sewadar_grno = 'L00943' AND t.effective_dt = '2001-10-29 00:00:00' AND t.sewadar_status_cd = 'Perm') OR
--	(t.sewadar_grno = 'L05568' AND t.effective_dt = '2001-12-25 00:00:00' AND t.sewadar_status_cd = 'Temp');
--	
--SELECT @cnt1 = COUNT(*) FROM sewadars_registrations WHERE sewadar_grno IN 
--	(SELECT ssc.sewadar_grno
--					FROM tmp_mgr_sewadars_status_changes ssc
--		LEFT OUTER	JOIN tmp_mgr_sewadars_status_changes ssc_o ON (ssc_o.sewadar_grno = ssc.sewadar_grno AND ssc_o.change_sq = (ssc.change_sq - 1))
--		LEFT OUTER	JOIN SMS..sewadar_status ss_o ON ss_o.sewadar_id = ssc_o.sewadar_grno AND ss_o.effective_dt = ssc_o.effective_dt
--					JOIN SMS..sewadar_status ss ON ss.sewadar_id = ssc.sewadar_grno AND ss.effective_dt = ssc.effective_dt
--		WHERE ssc_o.sewadar_status_cd	IS NOT NULL	AND	ssc.sewadar_status_cd	IS NOT NULL		AND	ss_o.status	=	ss.status);
--IF (@cnt1 > 0)
--	BEGIN
--		RAISERROR ('There are some entries in sms where 2 consecutive entries for a grno have same status. This needs to be manually seen.', 16, 0);
--		SELECT	ssc.sewadar_grno, ssc_o.effective_dt AS old_effective_dt, ss_o.status AS old_sms_status, ssc.effective_dt AS new_effective_dt, ss.status AS new_sms_status
--						FROM tmp_mgr_sewadars_status_changes ssc
--			LEFT OUTER	JOIN tmp_mgr_sewadars_status_changes ssc_o ON (ssc_o.sewadar_grno = ssc.sewadar_grno AND ssc_o.change_sq = (ssc.change_sq - 1))
--			LEFT OUTER	JOIN SMS..sewadar_status ss_o ON ss_o.sewadar_id = ssc_o.sewadar_grno AND ss_o.effective_dt = ssc_o.effective_dt
--						JOIN SMS..sewadar_status ss ON ss.sewadar_id = ssc.sewadar_grno AND ss.effective_dt = ssc.effective_dt
--			WHERE ssc_o.sewadar_status_cd	IS NOT NULL	AND	ssc.sewadar_status_cd	IS NOT NULL		AND	ss_o.status	=	ss.status;
--	END;
--
----Correcting status_cd to 'Left' (zsm_sewadar_status_cd) for retirees having is_eligible_for_prashaad = 'No'
--UPDATE ssc
--	SET ssc.sewadar_status_cd = 'Left'
--	FROM tmp_mgr_sewadars_status_changes ssc
--	JOIN sms..sewadars ss ON ss.sewadar_id = ssc.sewadar_grno
--	WHERE ssc.sewadar_status_cd = 'Retd' AND LTRIM(RTRIM(ss.is_eligible_for_prashaad)) = 'No';
--
--SELECT @cnt1 = COUNT (*) FROM sewadars_registrations WHERE sewadar_grno IN
--	(SELECT sewadar_grno FROM tmp_mgr_sewadars_status_changes
--	GROUP BY sewadar_grno, effective_dt
--	HAVING COUNT(*) > 1);
--IF (@cnt1 > 0)
--	BEGIN
--		RAISERROR ('Some Sewadar GRNO have mulitple status changed on same time. Needs to be handled manually.', 16, 0);
--		SELECT sewadar_grno FROM tmp_mgr_sewadars_status_changes
--		GROUP BY sewadar_grno, effective_dt
--		HAVING COUNT(*) > 1;
--	END;
--	
--UPDATE t
--	SET change_sq = 
--		(SELECT COUNT (*) FROM tmp_mgr_sewadars_status_changes ssc1
--				JOIN tmp_mgr_sewadars_status_changes ssc2 ON (ssc2.sewadar_grno = ssc1.sewadar_grno AND ssc1.effective_dt >= ssc2.effective_dt)
--				WHERE ssc1.sewadar_grno = t.sewadar_grno AND ssc1.effective_dt = t.effective_dt
--				GROUP BY ssc1.sewadar_grno, ssc1.effective_dt)
--	FROM tmp_mgr_sewadars_status_changes t;
--
--SELECT @cnt1 = COUNT(*) FROM SMS..sewadar_status;
--INSERT INTO sewadars_status_changes
--			(satsang_centre_id, sewadar_grno, effective_dtm, old_sewadar_status_cd, sewadar_status_cd)
--	SELECT	@centre_id, ssc.sewadar_grno, ssc.effective_dt, ssc_o.sewadar_status_cd, ssc.sewadar_status_cd
--				FROM tmp_mgr_sewadars_status_changes ssc
--	LEFT OUTER	JOIN tmp_mgr_sewadars_status_changes ssc_o ON (ssc_o.sewadar_grno = ssc.sewadar_grno AND ssc_o.change_sq = (ssc.change_sq - 1))
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2 + 4) -- +4 because of 4 incorrect entries deleted above
--		RAISERROR ('Counts of records for Sewadars Status Changes do not match', 16, 0);
--
---- ====================================================================================================
----	Sewadars Responsibility Changes
---- ====================================================================================================
--
--IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewadars_responsibility_changes' AND TYPE = 'U')
--	DROP TABLE [dbo].tmp_mgr_sewadars_responsibility_changes;
--
--CREATE TABLE tmp_mgr_sewadars_responsibility_changes
--(
--	sewadar_grno	sewadar_grno,
--	effective_dt	SMALLDATETIME,
--	responsibility	VARCHAR(20),
--	change_sq		display_order,
--		CONSTRAINT	PK_TmpMgrSewadarsResponsibilityChanges_SewadarGrno_EffectiveDt
--					PRIMARY KEY		(sewadar_grno, effective_dt)
--);
--
--INSERT INTO tmp_mgr_sewadars_responsibility_changes
--			(sewadar_grno, effective_dt, responsibility)
--	SELECT	sewadar_id, effective_dt, LTRIM(RTRIM(responsibility))
--	FROM sms..sewadar_responsibility
--
--UPDATE t
--	SET change_sq = 
--		(SELECT COUNT(*) FROM tmp_mgr_sewadars_responsibility_changes src1 
--				JOIN tmp_mgr_sewadars_responsibility_changes src2 ON (src2.sewadar_grno = src1.sewadar_grno AND src1.effective_dt >= src2.effective_dt)
--				WHERE src1.sewadar_grno = t.sewadar_grno AND src1.effective_dt = t.effective_dt
--				GROUP BY src1.sewadar_grno, src1.effective_dt)
--	FROM tmp_mgr_sewadars_responsibility_changes t;
--
--SELECT @cnt1 = COUNT(*) FROM sms..sewadar_responsibility 
--	WHERE responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ', 'Sewadar             ');
---- Some entries in sms..sewadar_responsibility, where 2 or more consecutive entries for the same grno had same status. Only one with oldest date is migrated.
--DELETE src		FROM tmp_mgr_sewadars_responsibility_changes src
--	LEFT OUTER	JOIN tmp_mgr_sewadars_responsibility_changes src_o ON (src_o.sewadar_grno = src.sewadar_grno AND src_o.change_sq = (src.change_sq - 1))
--	WHERE src.responsibility = src_o.responsibility;
--SELECT @cnt2 = @@ROWCOUNT;
--
---- Only entries with responsibility of Heads and Sewadar is migrated
--DELETE FROM tmp_mgr_sewadars_responsibility_changes
--WHERE responsibility NOT IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ', 'Sewadar             ');
--
---- Responsibility Sewadar is equivalent to NULL in ZSM
--UPDATE tmp_mgr_sewadars_responsibility_changes
--	SET responsibility = NULL
--	WHERE responsibility = 'Sewadar';
--
---- Reordering after data deletion and responsibility modification above
--UPDATE t
--	SET change_sq = 
--		(SELECT COUNT(*) FROM tmp_mgr_sewadars_responsibility_changes src1 
--				JOIN tmp_mgr_sewadars_responsibility_changes src2 ON (src2.sewadar_grno = src1.sewadar_grno AND src1.effective_dt >= src2.effective_dt)
--				WHERE src1.sewadar_grno = t.sewadar_grno AND src1.effective_dt = t.effective_dt
--				GROUP BY src1.sewadar_grno, src1.effective_dt)
--	FROM tmp_mgr_sewadars_responsibility_changes t;
--
---- Some entries are now in tmp_mgr_sewadars_responsibility_changes, where 2 or more consecutive entries for the same grno had same status. Only one with oldest date is migrated.
--DELETE src		FROM tmp_mgr_sewadars_responsibility_changes src
--	LEFT OUTER	JOIN tmp_mgr_sewadars_responsibility_changes src_o ON (src_o.sewadar_grno = src.sewadar_grno AND src_o.change_sq = (src.change_sq - 1))
--	WHERE (src.responsibility = src_o.responsibility) OR (src.responsibility IS NULL AND src_o.responsibility IS NULL)
--SELECT @cnt3 = @@ROWCOUNT;
--
--INSERT INTO sewadars_responsibility_changes
--			(satsang_centre_id, sewadar_grno, effective_dtm, old_responsibility, responsibility)
--	SELECT	@centre_id, src.sewadar_grno, src.effective_dt, src_o.responsibility, src.responsibility
--				FROM tmp_mgr_sewadars_responsibility_changes src
--	LEFT OUTER	JOIN tmp_mgr_sewadars_responsibility_changes src_o ON (src_o.sewadar_grno = src.sewadar_grno AND src_o.change_sq = (src.change_sq - 1));
--SELECT @cnt4 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2 + @cnt3 + @cnt4) -- +@cnt2 +@cnt3 for the deleted rows above
--		RAISERROR ('Counts of records for Sewadars Responsibility Changes do not match', 16, 0);
--
---- ====================================================================================================
----	Sewas
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM sms..sewas;
--INSERT INTO sewas
--			(satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme, is_scanner_used,
--			is_leave_allowed, is_exemption_allowed,	is_default_sewa, sewa_frequency, attendance_unit,
--			attendance_marking, min_sewa_duration, max_sewa_duration, gents_born_after, ladies_born_after, referred_sewa_id,
--			attendance_ts, summary_ts, deleted_ts, locked_dtm)
--	SELECT	@centre_id, LTRIM(RTRIM(s.sewa_id)), s.sewa_nm, s.start_dt, s.finish_dt, LTRIM(RTRIM(s.is_satsang_programme)), LTRIM(RTRIM(s.is_scanned)),
--			LTRIM(RTRIM(s.is_leave_allowed)), LTRIM(RTRIM(s.is_exemption_allowed)), 'No', LTRIM(RTRIM(s.sewa_frequency)), LTRIM(RTRIM(s.attendance_unit)),
--			LTRIM(RTRIM(s.attendance_marking)), s.min_sewa_duration, s.max_sewa_duration, s.gents_DOB, s.ladies_DOB, NULL,
--			s.attendance_ts, s.summary_ts, s.deleted_ts, s.lock_dtm
--	FROM sms..sewas s
--	WHERE s.referred_sewa_id IS NULL;
--SET @cnt2 = @@ROWCOUNT;
--INSERT INTO sewas
--			(satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, is_satsang_programme, is_scanner_used,
--			is_leave_allowed, is_exemption_allowed,	is_default_sewa, sewa_frequency, attendance_unit,
--			attendance_marking, min_sewa_duration, max_sewa_duration, gents_born_after, ladies_born_after, referred_sewa_id,
--			attendance_ts, summary_ts, deleted_ts, locked_dtm)
--	SELECT	@centre_id, LTRIM(RTRIM(s.sewa_id)), s.sewa_nm, s.start_dt, s.finish_dt, LTRIM(RTRIM(s.is_satsang_programme)), LTRIM(RTRIM(s.is_scanned)),
--			LTRIM(RTRIM(s.is_leave_allowed)), LTRIM(RTRIM(s.is_exemption_allowed)), 'No', LTRIM(RTRIM(s.sewa_frequency)), LTRIM(RTRIM(s.attendance_unit)),
--			'Computed', s.min_sewa_duration, s.max_sewa_duration, s.gents_DOB, s.ladies_DOB, sr.sewa_id,
--			s.attendance_ts, s.summary_ts, s.deleted_ts, s.lock_dtm
--				FROM sms..sewas s
--	LEFT OUTER	JOIN sewas sr ON sr.sewa_cd = s.referred_sewa_id
--	WHERE s.referred_sewa_id IS NOT NULL
--SET @cnt2 = @cnt2 + @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewas do not match', 16, 0);
--
--GO
---- ====================================================================================================
----	Sewa Teams
---- ====================================================================================================
--DECLARE
--	@centre_id			INT,
--	@active_eff_from	DATETIME,
--	@active_eff_till	DATETIME,
--	@inactiv_eff_frm	DATETIME,
--	@inactiv_eff_til	DATETIME,
--	@dummy_initiation_dt DATETIME,
--	@none_relation_id	INT,
--	@cnt1				INT,
--	@cnt2				INT,
--	@cnt3				INT,
--	@cnt4				INT,
--	@not_known_initiation_place_id				INT,
--	@team_wise_daily_attendance_screen_id		CHAR(6),
--	@arbitrary_daily_presences_screen_id		CHAR(6),
--	@arbitrary_shift_presences_screen_id		CHAR(6),
--	@arbitrary_summarised_exemptions_screen_id	CHAR(6),
--	@sewadar_wise_sewa_summaries_screen_id		CHAR(6);
--
--	SELECT @centre_id		= satsang_centre_id FROM CDB..satsang_centres WHERE satsang_centre_nm = 'BHAYANDAR'; -- 6015
--	SET	@active_eff_from 	= '01-Jan-2000';
--	SET @active_eff_till	= '31-Dec-9999';
--	SET @inactiv_eff_frm	= '01-Jan-2000';
--	SET @inactiv_eff_til	= '31-Dec-2009';
--	SET @dummy_initiation_dt = '01-Jan-1991';
--	SELECT @none_relation_id = relation_id FROM CDB..relations WHERE relation_nm = 'None'; -- 6
--	SELECT @not_known_initiation_place_id = place_id FROM CDB..initiation_places WHERE place_nm = 'NOT KNOWN'; -- 73
--	SET @team_wise_daily_attendance_screen_id		= 'ATT_05';
--	SET @arbitrary_daily_presences_screen_id		= 'ATT_02';
--	SET @arbitrary_shift_presences_screen_id		= 'ATT_06';
--	SET @arbitrary_summarised_exemptions_screen_id	= 'ATT_03';
--	SET @sewadar_wise_sewa_summaries_screen_id		= 'ATT_01';
--
--SELECT @cnt1 = COUNT(*) FROM SMS..sewa_teams;
--SET IDENTITY_INSERT sewa_teams ON;
--INSERT INTO sewa_teams
--			(sewa_team_id, sewa_team_nm, team_description, sewa_id, acceptance_ts)
--	SELECT	st.team_id, st.team_nm, NULL, s.sewa_id, st.acceptance_ts
--	FROM sms..sewa_teams st
--	JOIN sewas s ON st.sewa_id = s.sewa_cd;
--SET @cnt2 = @@ROWCOUNT;
--SET IDENTITY_INSERT sewa_teams OFF;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewa Teams do not match', 16, 0);
--
---- ====================================================================================================
----	Sewa Team Wise Sewadars
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM SMS..sewa_team_wise_sewadars;
--INSERT INTO sewa_team_wise_sewadars
--			(sewa_team_id, serial_id, satsang_centre_id, sewadar_grno, transfer_in_dt, transfer_out_dt)
--	SELECT	team_id, serial_id, @centre_id, sewadar_id, transfer_in_dt, transfer_out_dt
--	FROM sms..sewa_team_wise_sewadars;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewa Team Wise Sewadars do not match', 16, 0);
--
---- ====================================================================================================
----	Sewa Teams TxnTs
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT team_id, attendance_dt FROM SMS..team_wise_daily_attendance) t;
--INSERT INTO sewa_teams_txn_ts
--			(sewa_team_id, attendance_dt)
--	SELECT DISTINCT team_id, attendance_dt
--	FROM sms..team_wise_daily_attendance
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewa Teams TxnTs do not match', 16, 0);
--
---- ====================================================================================================
----	Team Wise Daily Attendence, Sewadars TxnTs
---- ====================================================================================================
--
--IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewa_exemptions_mapping' AND TYPE = 'U')
--	DROP TABLE [dbo].tmp_mgr_sewa_exemptions_mapping;
--
--CREATE	TABLE 	tmp_mgr_sewa_exemptions_mapping
--(	sms_sewa_exemption		VARCHAR (60)	NOT NULL	PRIMARY KEY,
--	zsm_sewa_exemption		gnc_nm			NOT NULL
--);
--
--INSERT	INTO	tmp_mgr_sewa_exemptions_mapping
--	SELECT	sewa_exemption_nm, sewa_exemption_nm
--	FROM	sewa_exemptions;
--
--INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Accident case',												'Accident'						);
--INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Could  not get leave from job',                                'Could not get leave from job'	);
--INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Doing Sewa at Ulnr, Varap, Dombivali, Badlapur, Bhiwandi',     'Doing Sewa at other Centre'	);
--INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Done sewa in another centre',                                  'Doing Sewa at other Centre'	);
--INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Exams',                                                        'Examinations'					);
--INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Gone Out Of Station',                                          'Out of station'				);
--INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Outside Bombay Sewadar',                                       'Outside Sewadar'				);
--INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Reactivated for inactive sewadars',                            'Reactivated from Inactive'		);
--INSERT	INTO	tmp_mgr_sewa_exemptions_mapping	VALUES	(	'Satara Jali sewa',                                             'Doing Sewa at other Centre'	);
--
--SELECT @cnt1 = COUNT(*)
--			FROM SMS..team_wise_daily_attendance a
--			JOIN SMS..sewa_exemptions e ON e.exemption_id = a.exemption_id
--LEFT OUTER 	JOIN tmp_mgr_sewa_exemptions_mapping m ON m.sms_sewa_exemption = e.exemption_nm
--WHERE e.exemption_nm IS NOT NULL AND m.sms_sewa_exemption IS NULL;
--IF (@cnt1 > 0)
--	BEGIN
--		RAISERROR ('There are some sewa exemptions in sms..team_wise_daily_attendance that are not mapped in tmp_mgr_sewa_exemptions_mapping', 16, 0);
--		SELECT DISTINCT e.exemption_nm
--					FROM SMS..team_wise_daily_attendance a
--			JOIN SMS..sewa_exemptions e ON e.exemption_id = a.exemption_id
--		LEFT OUTER 	JOIN tmp_mgr_sewa_exemptions_mapping m ON m.sms_sewa_exemption = e.exemption_nm
--		WHERE e.exemption_nm IS NOT NULL AND m.sms_sewa_exemption IS NULL;
--	END;
--
--SELECT @cnt1 = COUNT(*) FROM SMS..team_wise_daily_attendance;
--INSERT INTO team_wise_daily_attendance
--			(sewa_team_id, serial_id, attendance_dt, attendance, sewa_exemption_id, is_scanned)
--	SELECT	a.team_id, a.serial_id, a.attendance_dt, a.attendance, e.sewa_exemption_id, 'No'
--				FROM sms..team_wise_daily_attendance a
--	LEFT OUTER	JOIN SMS..sewa_exemptions se ON se.exemption_id = a.exemption_id
--	LEFT OUTER	JOIN tmp_mgr_sewa_exemptions_mapping m ON m.sms_sewa_exemption = se.exemption_nm
--	LEFT OUTER	JOIN sewa_exemptions e ON e.sewa_exemption_nm = m.zsm_sewa_exemption;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Team Wise Daily Attendance do not match', 16, 0);
--
--SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT s.sewadar_id, t.sewa_id FROM SMS..team_wise_daily_attendance a
--	JOIN sms..sewa_team_wise_sewadars s ON (s.team_id = a.team_id AND s.serial_id = a.serial_id)
--	JOIN SMS..sewa_teams t ON t.team_id = s.team_id) t;
--INSERT INTO sewadars_txn_ts
--					(satsang_centre_id, sewadar_grno, sewa_id, screen_id)
--	SELECT DISTINCT @centre_id, s.sewadar_grno, t.sewa_id, @team_wise_daily_attendance_screen_id
--	FROM team_wise_daily_attendance a
--	JOIN sewa_team_wise_sewadars s ON (s.sewa_team_id = a.sewa_team_id AND s.serial_id = a.serial_id)
--	JOIN sewa_teams t ON t.sewa_team_id = s.sewa_team_id;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewadars TxnTs (Team Wise Daily Attendance) do not match', 16, 0);
--
---- ====================================================================================================
----	Arbitrary Daily Presences, Sewadars TxnTs
---- ====================================================================================================
--	
--SELECT @cnt1 = COUNT(*) FROM SMS..arbitrary_daily_presences;
--INSERT INTO arbitrary_daily_presences
--			(sewa_id, satsang_centre_id, sewadar_grno, presence_dt, is_scanned)
--	SELECT	s.sewa_id, @centre_id, p.sewadar_id, p.presence_dt, 'No'
--	FROM SMS..arbitrary_daily_presences p
--	JOIN sewas s ON s.sewa_cd = p.sewa_id;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Arbitrary Daily Presences do not match', 16, 0);
--
--SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT sewadar_id, sewa_id FROM SMS..arbitrary_daily_presences) t;
--INSERT INTO sewadars_txn_ts
--					(satsang_centre_id, sewadar_grno, sewa_id, screen_id)
--	SELECT DISTINCT @centre_id, p.sewadar_grno, p.sewa_id, @arbitrary_daily_presences_screen_id
--	FROM arbitrary_daily_presences p;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewadars TxnTs (Arbitrary Daily Presences) do not match', 16, 0);
--
---- ====================================================================================================
----	Sewa Shifts
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT shift_id FROM SMS..sewa_shifts) t;
--INSERT INTO sewa_shifts
--			(sewa_shift, sewa_shift_sq, remarks, effective_from)
--	SELECT DISTINCT shift_id, shift_no, NULL, @active_eff_from
--	FROM SMS..sewa_shifts;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewa Shifts do not match', 16, 0);
--
---- ====================================================================================================
----	Sewas Sewa Shifts
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM (SELECT credit_days FROM SMS..sewa_shifts WHERE credit_days NOT IN (0.50, 1.00)) t;
--IF (@cnt1 <> 0)
--		RAISERROR ('sms..sewa_shifts.credit_days has values other than 0.50 and 1.00', 16, 0);
--
--SELECT @cnt1 = COUNT(*) FROM SMS..sewa_shifts;
--INSERT INTO sewas_sewa_shifts
--			(sewa_id, sewa_shift, sewa_shift_sq, credit_cnt, unit_cnt)
--	SELECT	s.sewa_id, ss.shift_id, ss.shift_no, 1, CASE WHEN ss.credit_days = 1.00 THEN 1 ELSE 2 END
--	FROM SMS..sewa_shifts ss
--	JOIN sewas s ON s.sewa_cd = ss.sewa_id;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewas Sewa Shifts do not match', 16, 0);
--
---- ====================================================================================================
----	Arbitrary Shift Presences, Sewadars TxnTs
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM sms..scanned_daily_shift_presences;
--INSERT INTO arbitrary_shift_presences
--			(sewa_id, satsang_centre_id, sewadar_grno, presence_dt, sewa_shift, is_scanned)
--	SELECT	s.sewa_id, @centre_id, p.sewadar_id, p.presence_dt, p.shift_id, p.is_scanned
--	FROM sms..scanned_daily_shift_presences p
--	JOIN sewas s ON s.sewa_cd = p.sewa_id;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Arbitrary Shift Presences do not match', 16, 0);
--
--SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT sewadar_id, sewa_id FROM SMS..scanned_daily_shift_presences) t;
--INSERT INTO sewadars_txn_ts
--					(satsang_centre_id, sewadar_grno, sewa_id, screen_id)
--	SELECT DISTINCT @centre_id, p.sewadar_grno, p.sewa_id, @arbitrary_shift_presences_screen_id
--	FROM arbitrary_shift_presences p;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewadars TxnTs (Arbitrary Shift Presences) do not match', 16, 0);
--
---- ====================================================================================================
----	Arbitrary Summarised Exemptions, Sewadars TxnTs
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*)
--			FROM SMS..arbitrary_summarised_exemptions a
--			JOIN SMS..sewa_exemptions e ON e.exemption_id = a.exemption_id
--LEFT OUTER 	JOIN tmp_mgr_sewa_exemptions_mapping m ON m.sms_sewa_exemption = e.exemption_nm
--WHERE e.exemption_nm IS NOT NULL AND m.sms_sewa_exemption IS NULL;
--IF (@cnt1 > 0)
--	BEGIN
--		RAISERROR ('There are some sewa exemptions in sms..arbitrary_summarised_exemptions that are not mapped in tmp_mgr_sewa_exemptions_mapping', 16, 0);
--		SELECT DISTINCT e.exemption_nm
--					FROM SMS..arbitrary_summarised_exemptions a
--			JOIN SMS..sewa_exemptions e ON e.exemption_id = a.exemption_id
--		LEFT OUTER 	JOIN tmp_mgr_sewa_exemptions_mapping m ON m.sms_sewa_exemption = e.exemption_nm
--		WHERE e.exemption_nm IS NOT NULL AND m.sms_sewa_exemption IS NULL;
--	END;
--
--SELECT @cnt1 = COUNT(*) FROM sms..arbitrary_summarised_exemptions;
--INSERT INTO arbitrary_summarised_exemptions
--			(sewa_id, satsang_centre_id, sewadar_grno, sewa_exemption_id, exemption_days)
--	SELECT	s.sewa_id, @centre_id, ase.sewadar_id, e.sewa_exemption_id, ase.exemption_days
--	FROM SMS..arbitrary_summarised_exemptions ase
--	JOIN sewas s ON s.sewa_cd = ase.sewa_id
--	JOIN sms..sewa_exemptions se ON se.exemption_id = ase.exemption_id
--	JOIN tmp_mgr_sewa_exemptions_mapping em ON em.sms_sewa_exemption = se.exemption_nm
--	JOIN sewa_exemptions e ON e.sewa_exemption_nm = em.zsm_sewa_exemption;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Arbitrary Summarised Exemptions do not match', 16, 0);
--
--SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT sewadar_id, sewa_id FROM SMS..arbitrary_summarised_exemptions) t;
--INSERT INTO sewadars_txn_ts
--					(satsang_centre_id, sewadar_grno, sewa_id, screen_id)
--	SELECT DISTINCT @centre_id, e.sewadar_grno, e.sewa_id, @arbitrary_summarised_exemptions_screen_id
--	FROM arbitrary_summarised_exemptions e;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewadars TxnTs (Arbitrary Summarised Exemptions) do not match', 16, 0);
--
---- ====================================================================================================
----	Sewadar Wise Sewa Summaries, Sewadars TxnTs
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM SMS..sewadar_wise_sewa_summaries;
--SELECT @cnt2 = COUNT(*) FROM SMS..sewadar_wise_sewa_summaries
--WHERE present_cnt = 0 AND absent_cnt = 0 AND (leave_cnt IS NULL OR leave_cnt = 0) AND (exempt_cnt IS NULL OR exempt_cnt = 0)
--INSERT INTO sewadar_wise_sewa_summaries
--			(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded)
--	SELECT	zs.sewa_id, @centre_id, s.sewadar_id, s.present_cnt, 
--		CASE WHEN s.exempt_cnt IS NOT NULL THEN s.exempt_cnt ELSE 0 END,
--		CASE WHEN s.leave_cnt IS NOT NULL THEN s.leave_cnt ELSE 0 END, s.absent_cnt,
--		CASE WHEN LTRIM(RTRIM(s.is_manual )) = 'Yes' THEN 'No' ELSE 'Yes' END
--	FROM SMS..sewadar_wise_sewa_summaries s
--	JOIN sewas zs ON zs.sewa_cd = s.sewa_id
--	WHERE present_cnt <> 0 OR absent_cnt <> 0 OR (leave_cnt IS NOT NULL AND leave_cnt <> 0) OR (exempt_cnt IS NOT NULL AND exempt_cnt <> 0)
--SET @cnt3 = @@ROWCOUNT;
--
--IF (@cnt1 <> @cnt3 + @cnt2) -- +@cnt2 because entries with all 4 counts = 0 are not migrated
--		RAISERROR ('Counts of records for Sewadar wise Sewa Summaries do not match', 16, 0);
--
--SELECT @cnt1 = COUNT(*) FROM (SELECT DISTINCT sewadar_id, sewa_id FROM SMS..sewadar_wise_sewa_summaries
--WHERE present_cnt <> 0 OR absent_cnt <> 0 OR (leave_cnt IS NOT NULL AND leave_cnt <> 0) OR (exempt_cnt IS NOT NULL AND exempt_cnt <> 0)) t;
--INSERT INTO sewadars_txn_ts
--					(satsang_centre_id, sewadar_grno, sewa_id, screen_id)
--	SELECT DISTINCT @centre_id, s.sewadar_grno, s.sewa_id, @sewadar_wise_sewa_summaries_screen_id
--	FROM sewadar_wise_sewa_summaries s;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewadars TxnTs (Sewadar wise Sewa Summaries) do not match', 16, 0);
--
---- ====================================================================================================
----	Weekly Sewa Locations
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM sms..weekly_sewa_locations;
--INSERT INTO weekly_sewa_locations
--			(weekly_sewa_location_nm, satsang_centre_id, remarks, effective_from, effective_till)
--	SELECT location_nm, @centre_id, NULL, @inactiv_eff_frm, @inactiv_eff_til
--	FROM sms..weekly_sewa_locations;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Weekly Sewa Locations do not match', 16, 0);
--
---- ====================================================================================================
----	Sewadars Badges
---- ====================================================================================================
--
--IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_badge_templates_mapping' AND TYPE = 'U')
--	DROP TABLE [dbo].tmp_badge_templates_mapping;
--
--CREATE TABLE tmp_badge_templates_mapping
--(
--	sms_template_id CHAR(10) PRIMARY KEY,
--	zsm_template_id badge_template_id
--);
--
--INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('WklyLadies', 'Weekly');
--INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('WklyGents ', 'Weekly');
--INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('SPECIAL   ', 'SpecialZon');
--INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('ConstSC   ', 'ConstSB');
--INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('Annual    ', 'Programme');
--INSERT INTO tmp_badge_templates_mapping	(sms_template_id, zsm_template_id) VALUES ('Retired   ', 'Retired');
--
--SELECT @cnt1 = COUNT(*)
--			FROM SMS..sewadar_badges b
--LEFT OUTER 	JOIN tmp_badge_templates_mapping m ON m.sms_template_id = b.badge_template_id
--WHERE b.badge_template_id IS NOT NULL AND m.sms_template_id IS NULL;
--IF (@cnt1 > 0)
--	BEGIN
--		RAISERROR ('There are some badge templates in sms..sewadar_badges that are not mapped in tmp_badge_templates_mapping', 16, 0);
--		SELECT DISTINCT b.badge_template_id
--					FROM SMS..sewadar_badges b
--		LEFT OUTER 	JOIN tmp_badge_templates_mapping m ON m.sms_template_id = b.badge_template_id
--		WHERE b.badge_template_id IS NOT NULL AND m.sms_template_id IS NULL;
--	END;
--GO
--
--DECLARE
--	@centre_id			INT,
--	@active_eff_from	DATETIME,
--	@active_eff_till	DATETIME,
--	@inactiv_eff_frm	DATETIME,
--	@inactiv_eff_til	DATETIME,
--	@dummy_initiation_dt DATETIME,
--	@none_relation_id	INT,
--	@cnt1				INT,
--	@cnt2				INT,
--	@cnt3				INT,
--	@cnt4				INT,
--	@not_known_initiation_place_id				INT,
--	@team_wise_daily_attendance_screen_id		CHAR(6),
--	@arbitrary_daily_presences_screen_id		CHAR(6),
--	@arbitrary_shift_presences_screen_id		CHAR(6),
--	@arbitrary_summarised_exemptions_screen_id	CHAR(6),
--	@sewadar_wise_sewa_summaries_screen_id		CHAR(6);
--
--	SELECT @centre_id		= satsang_centre_id FROM CDB..satsang_centres WHERE satsang_centre_nm = 'BHAYANDAR'; -- 6015
--	SET	@active_eff_from 	= '01-Jan-2000';
--	SET @active_eff_till	= '31-Dec-9999';
--	SET @inactiv_eff_frm	= '01-Jan-2000';
--	SET @inactiv_eff_til	= '31-Dec-2009';
--	SET @dummy_initiation_dt = '01-Jan-1991';
--	SELECT @none_relation_id = relation_id FROM CDB..relations WHERE relation_nm = 'None'; -- 6
--	SELECT @not_known_initiation_place_id = place_id FROM CDB..initiation_places WHERE place_nm = 'NOT KNOWN'; -- 73
--	SET @team_wise_daily_attendance_screen_id		= 'ATT_05';
--	SET @arbitrary_daily_presences_screen_id		= 'ATT_02';
--	SET @arbitrary_shift_presences_screen_id		= 'ATT_06';
--	SET @arbitrary_summarised_exemptions_screen_id	= 'ATT_03';
--	SET @sewadar_wise_sewa_summaries_screen_id		= 'ATT_01';
--
--SELECT @cnt1 = COUNT(*) FROM SMS..sewadar_badges;
--SET IDENTITY_INSERT sewadars_badges ON;
--INSERT INTO sewadars_badges
--			(badge_id, satsang_centre_id, sewadar_grno, badge_template_id, department_id, 
--			weekly_sewa_location_id, is_front_printed, is_back_printed, expiry_dt, printing_dtm, remarks)
--	SELECT	b.badge_id, @centre_id, b.sewadar_id, m.zsm_template_id, d.department_id,
--			l.weekly_sewa_location_id, 'Yes', CASE WHEN t.report_file_nm_back IS NOT NULL THEN 'Yes' ELSE 'No' END,			
--			b.expiry_dt, b.printing_ts, b.remarks
--	FROM SMS..sewadar_badges b
--	JOIN tmp_badge_templates_mapping m ON m.sms_template_id = b.badge_template_id
--	JOIN badge_templates t ON t.badge_template_id = m.zsm_template_id
--	JOIN SMS..departments sd ON sd.department_id = b.department_id
--	JOIN departments d ON d.department_nm = sd.department_nm
--	LEFT OUTER	JOIN sms..weekly_sewa_locations sl ON sl.location_id = b.location_id
--	LEFT OUTER	JOIN weekly_sewa_locations l ON l.weekly_sewa_location_nm = sl.location_nm;
--SET @cnt2 = @@ROWCOUNT;
--SET IDENTITY_INSERT sewadars_badges OFF;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Sewadars Badges do not match', 16, 0);
--GO
---- ====================================================================================================
----	Credit Specifications
---- ====================================================================================================
--
--DECLARE
--	@centre_id			INT,
--	@active_eff_from	DATETIME,
--	@active_eff_till	DATETIME,
--	@inactiv_eff_frm	DATETIME,
--	@inactiv_eff_til	DATETIME,
--	@dummy_initiation_dt DATETIME,
--	@none_relation_id	INT,
--	@cnt1				INT,
--	@cnt2				INT,
--	@cnt3				INT,
--	@cnt4				INT,
--	@not_known_initiation_place_id				INT,
--	@team_wise_daily_attendance_screen_id		CHAR(6),
--	@arbitrary_daily_presences_screen_id		CHAR(6),
--	@arbitrary_shift_presences_screen_id		CHAR(6),
--	@arbitrary_summarised_exemptions_screen_id	CHAR(6),
--	@sewadar_wise_sewa_summaries_screen_id		CHAR(6);
--
--	SELECT @centre_id		= satsang_centre_id FROM CDB..satsang_centres WHERE satsang_centre_nm = 'BHAYANDAR'; -- 6015
--	SET	@active_eff_from 	= '01-Jan-2000';
--	SET @active_eff_till	= '31-Dec-9999';
--	SET @inactiv_eff_frm	= '01-Jan-2000';
--	SET @inactiv_eff_til	= '31-Dec-2009';
--	SET @dummy_initiation_dt = '01-Jan-1991';
--	SELECT @none_relation_id = relation_id FROM CDB..relations WHERE relation_nm = 'None'; -- 6
--	SELECT @not_known_initiation_place_id = place_id FROM CDB..initiation_places WHERE place_nm = 'NOT KNOWN'; -- 73
--	SET @team_wise_daily_attendance_screen_id		= 'ATT_05';
--	SET @arbitrary_daily_presences_screen_id		= 'ATT_02';
--	SET @arbitrary_shift_presences_screen_id		= 'ATT_06';
--	SET @arbitrary_summarised_exemptions_screen_id	= 'ATT_03';
--	SET @sewadar_wise_sewa_summaries_screen_id		= 'ATT_01';
--
--SET IDENTITY_INSERT credit_specifications ON;
--INSERT INTO credit_specifications
--			(credit_specification_id, credit_specification_nm, credit_specification_dt, satsang_centre_id, is_uniform_specification,
--			credit_cnt, unit_cnt, is_exemption_considered, min_credit_cnt, specification_ts, computation_ts, is_finally_used)
--	SELECT	credit_specification_id, credit_specification_nm, credit_specification_dt, @centre_id, is_uniform_specification,
--			credit_cnt, unit_cnt, is_exemption_considered, CASE WHEN min_credit_cnt > 0 THEN min_credit_cnt END, specification_ts, computation_ts, 'No'
--	FROM SMS..credit_specifications;
--SET IDENTITY_INSERT credit_specifications OFF;
--
---- ====================================================================================================
----	Credit Specifications Sewas
---- ====================================================================================================
--
--SELECT @cnt1 = COUNT(*) FROM SMS..sewa_credit_specifications;
--INSERT INTO credit_specifications_sewas
--			(credit_specification_id, sewa_id, credit_cnt, unit_cnt, is_exemption_considered, min_credit_cnt, max_credit_cnt)
--	SELECT	cs.credit_specification_id, s.sewa_id, cs.eligible_credit_cnt, cs.eligible_unit_cnt, cs.eligible_consider_exemption,
--			cs.min_credit_cnt, cs.max_credit_cnt
--	FROM SMS..sewa_credit_specifications cs
--	JOIN sewas s ON s.sewa_cd = cs.sewa_id;
--SET @cnt2 = @@ROWCOUNT;
--IF (@cnt1 <> @cnt2)
--		RAISERROR ('Counts of records for Credit Specifications Sewas do not match', 16, 0);
--	
---- ====================================================================================================
----	Credit Specifications Sewadars
---- ====================================================================================================
--
--INSERT INTO credit_specifications_sewadars
--			(credit_specification_id, satsang_centre_id, sewadar_grno, credit_cnt)
--	SELECT credit_specification_id, @centre_id, sewadar_id, eligible_credit_cnt
--	FROM SMS..sewadar_credits
--	WHERE eligible_credit_cnt <> 0;
--
---- ====================================================================================================
----	Sequence Controlling Information
---- ====================================================================================================
--
--INSERT INTO sequence_controlling_information (satsang_centre_id, sequence_id, last_no)
--           SELECT   @centre_id, SUBSTRING (sequence_id, 1, 1), next_no - 1
--           FROM     SMS..sms_sequences
--           WHERE   sequence_id    LIKE '%GrNo'
--	UNION
--           SELECT   @centre_id, 'M', next_no - 1
--           FROM     SMS..sms_sequences
--           WHERE   sequence_id   = 'GMGNo'
--	UNION
--           SELECT   @centre_id, 'F', next_no - 1
--           FROM     SMS..sms_sequences
--           WHERE   sequence_id   = 'LMLNo';
--	
--SELECT @cnt1 = COUNT(*) FROM sequence_controlling_information;
--
--IF (@cnt1 <> 4)
--	RAISERROR ('Some more Sequence Controlling Information needs to be added', 16, 0);
--
---- ====================================================================================================
----	Generic Sewadar Lists
---- ====================================================================================================
--
--INSERT INTO generic_sewadar_lists
--			(satsang_centre_id, sewadar_list_nm, sewadar_list_use, sewadar_list_other_use, other_satsang_centre_sewadars,
--			is_other_satsang_centre, is_editing_allowed, remarks, generated_dtm, report_nm, session_id)
--	VALUES	(@centre_id, 'Construction Sewa Jan-Mar 2011', 'Sewadars for a Sewa', NULL, 'No',
--			'No', 'Yes', 'Migrated from sms..generic_report_details with session_id = 12690', NULL, NULL, NULL);
--
---- ====================================================================================================
----	Generic Sewadar Lists Sewadars
---- ====================================================================================================
--
--INSERT INTO generic_sewadar_lists_sewadars
--			(sewadar_list_id, satsang_centre_id, sewadar_grno)
--	SELECT	(SELECT sewadar_list_id FROM generic_sewadar_lists 
--			WHERE satsang_centre_id = @centre_id AND sewadar_list_nm = 'Construction Sewa Jan-Mar 2011'), @centre_id, sewadar_id
--	FROM SMS..generic_report_details WHERE session_id = 12690;
--
--GO
---- ====================================================================================================
