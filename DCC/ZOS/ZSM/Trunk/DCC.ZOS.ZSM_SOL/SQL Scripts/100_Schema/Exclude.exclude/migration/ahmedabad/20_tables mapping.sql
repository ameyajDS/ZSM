USE ZSM
GO

DECLARE
	@cnt1	INT,
	@cnt2	INT
-- ====================================================================================================
--	Initiation Places mapping
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
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHMEDABAD-I(CHANDKHEDA)',	'Mumbai'		);
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
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Not known',	'TO BE SPECIFIED'		);
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
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('Unknown',		'TO BE SPECIFIED'		);
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('West Africa (Country Benin)',		'Benin (West Africa)');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('4','TO BE SPECIFIED');			-- JL
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('1','TO BE SPECIFIED');			-- JL
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AH39*MEDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHEDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHEMADABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHEMEDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHMDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHMEABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHMEDABAD`','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHMEDABADA','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHMEDABAH','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHMEDABD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHMEDABDA','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHMMEDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHMRDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AHNEDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AMDAVAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AMEDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('AMHMEDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BAES','Dera');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BARODA','Gujarat');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BEAAS','Dera');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BEAD','Dera');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BEAS0','Dera');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BEAS5','Dera');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BOBAY','Mumbai');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BOMABY','Mumbai');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BOMBAI','Mumbai');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BOMBNAY','Mumbai');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BOMBy','Mumbai');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('BUNGLORE','BANGALORE');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('CHANDKHEDA','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('DEHLI','Delhi');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('DEIHI','Delhi');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('DELKI','Delhi');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('HYDRABAD','Hyderabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('INDOR','Indore');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('JBEAS','Dera');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('KENYA','Kenya');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('MIMBAI','Mumbai');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('MUMAI','Mumbai');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('MUMBAY','Mumbai');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('MUMBIA','Mumbai');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('MUMBVAI','Mumbai');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('PAROR','Paror');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('PUNA','TO BE SPECIFIED');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('RANIP','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('RANIP, AHEMDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('RANIP, AHMEDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('RANIP-AHMD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('RANIP-AHMEDABAD','Ahmedabad');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('SIDDDHPUR','Sidhpur');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('SIDDHAPUR','Sidhpur');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('SIDDHHPUR','Sidhpur');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('SIDDHUPR','Sidhpur');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('SIDDHUPUR','Sidhpur');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('SIDDPUR','Sidhpur');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('SURAT','Gujarat');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('U.S.A','U.S.A.');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('u.s.a (boston)','U.S.A.');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('MUNBAI','Mumbai');
INSERT INTO tmp_mgr_initiation_place_mapping (sms_initiation_place, cdb_initiation_place_nm) VALUES ('SIDHHPUR','Sidhpur');




SELECT @cnt1 = COUNT(*)
			FROM SMS..sewadars s 
LEFT OUTER 	JOIN tmp_mgr_initiation_place_mapping ipm ON s.initiation_place = ipm.sms_initiation_place
WHERE s.initiation_place IS NOT NULL AND ipm.sms_initiation_place IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some initiation places in sms..sewadars that are not mapped in tmp_mgr_initiation_place_mapping', 16, 1);
		SELECT DISTINCT s.initiation_place
					FROM SMS..sewadars s 
		LEFT OUTER 	JOIN tmp_mgr_initiation_place_mapping ipm ON s.initiation_place = ipm.sms_initiation_place
		WHERE s.initiation_place IS NOT NULL AND ipm.sms_initiation_place IS NULL;
		SELECT PLACE_NM FROM CDB..INITIATION_PLACES ORDER BY 1
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

-- ====================================================================================================
--	Status mapping
-- ====================================================================================================


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

SELECT @cnt1 = COUNT(*)
			FROM SMS..sewadars s 
LEFT OUTER 	JOIN tmp_mgr_sewadar_status_mapping ssm ON s.status = ssm.sms_status
WHERE s.status IS NOT NULL AND ssm.sms_status IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some status in sms..sewadars that are not mapped in tmp_mgr_sewadar_status_mapping', 16, 0);
		SELECT DISTINCT s.status
					FROM SMS..sewadars s 
		LEFT OUTER 	JOIN tmp_mgr_sewadar_status_mapping ssm ON s.initiation_place = ssm.sms_status
		WHERE s.status IS NOT NULL AND ssm.sms_status IS NULL;
	END;

-- ====================================================================================================
--	Occupation mapping
-- ====================================================================================================


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


SELECT @cnt1 = COUNT(*)
			FROM SMS..sewadars s 
LEFT OUTER 	JOIN tmp_mgr_occupation_mapping om ON s.occupation = om.sms_occupation
WHERE s.occupation IS NOT NULL AND om.sms_occupation IS NULL;
IF (@cnt1 > 0)
	BEGIN
		RAISERROR ('There are some occupations in sms..sewadars that are not mapped in tmp_mgr_occupation_mapping', 16, 0);
		SELECT DISTINCT s.occupation
					FROM SMS..sewadars s 
		LEFT OUTER 	JOIN tmp_mgr_occupation_mapping om ON s.occupation = om.sms_occupation
		WHERE s.occupation IS NOT NULL AND om.sms_occupation IS NULL;
	END;

-- ====================================================================================================
--	Relation mapping
-- ====================================================================================================


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

-- ====================================================================================================
--	Gender mapping
-- ====================================================================================================


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

-- ====================================================================================================
--	Distrcts mapping
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_district_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_district_mapping;

CREATE TABLE tmp_mgr_district_mapping
(
	country_id VARCHAR (10),
	state_id VARCHAR (10),
	district_id VARCHAR (10),
	cdb_district_id INT,
	cdb_district_nm	VARCHAR (50)
);

INSERT INTO tmp_mgr_district_mapping
	SELECT	d.country_id, d.state_id, d.district_id, cd.district_or_city_id, cd.district_nm FROM SMS..districts d 
		JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id AND d.district_nm IN ( 'Bhuj', 'Kutchh') JOIN SMS..countries c ON c.country_id = d.country_id
		JOIN CDB..countries cc ON cc.country_nm = c.country_nm JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
		JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = 'Kachchh';

INSERT INTO tmp_mgr_district_mapping
	SELECT	d.country_id, d.state_id, d.district_id, cd.district_or_city_id, cd.district_nm FROM SMS..districts d 
		JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id AND d.district_nm = 'DETROJ' JOIN SMS..countries c ON c.country_id = d.country_id
		JOIN CDB..countries cc ON cc.country_nm = c.country_nm JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
		JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = 'Ahmedabad';

INSERT INTO tmp_mgr_district_mapping
	SELECT	d.country_id, d.state_id, d.district_id, cd.district_or_city_id, cd.district_nm FROM SMS..districts d 
		JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id AND d.district_nm = 'GANDHINAGAR' JOIN SMS..countries c ON c.country_id = d.country_id
		JOIN CDB..countries cc ON cc.country_nm = c.country_nm JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
		JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = 'GANDHI NAGAR';

INSERT INTO tmp_mgr_district_mapping
	SELECT	d.country_id, d.state_id, d.district_id, cd.district_or_city_id, cd.district_nm FROM SMS..districts d 
		JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id AND d.district_nm = 'Khambhat' JOIN SMS..countries c ON c.country_id = d.country_id
		JOIN CDB..countries cc ON cc.country_nm = c.country_nm JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
		JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = 'Anand';

INSERT INTO tmp_mgr_district_mapping
	SELECT	d.country_id, d.state_id, d.district_id, cd.district_or_city_id, cd.district_nm FROM SMS..districts d 
		JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id AND d.district_nm = 'MEHSANA' JOIN SMS..countries c ON c.country_id = d.country_id
		JOIN CDB..countries cc ON cc.country_nm = c.country_nm JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
		JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = 'Mahesana';

INSERT INTO tmp_mgr_district_mapping
	SELECT	d.country_id, d.state_id, d.district_id, cd.district_or_city_id, cd.district_nm FROM SMS..districts d 
		JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id AND d.district_nm = 'Nadiad' JOIN SMS..countries c ON c.country_id = d.country_id
		JOIN CDB..countries cc ON cc.country_nm = c.country_nm JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
		JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = 'Kheda';

INSERT INTO tmp_mgr_district_mapping
	SELECT	d.country_id, d.state_id, d.district_id, cd.district_or_city_id, cd.district_nm FROM SMS..districts d 
		JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id AND d.district_nm = 'PANCHMAHAL' JOIN SMS..countries c ON c.country_id = d.country_id
		JOIN CDB..countries cc ON cc.country_nm = c.country_nm JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
		JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = 'Panchmahals';

INSERT INTO tmp_mgr_district_mapping
	SELECT	d.country_id, d.state_id, d.district_id, cd.district_or_city_id, cd.district_nm FROM SMS..districts d 
		JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id AND d.district_nm = 'SABARKATHA' JOIN SMS..countries c ON c.country_id = d.country_id
		JOIN CDB..countries cc ON cc.country_nm = c.country_nm JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
		JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = 'Sabarkantha';

SELECT COUNT(*) FROM tmp_mgr_district_mapping
PRINT '.... districts mapping complete'

-- ====================================================================================================
--	Qualifications mapping
-- ====================================================================================================
IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_qualifications' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_qualifications;


create table tmp_mgr_qualifications
(
sms_qualification_nm varchar(100),
cdb_qualification_nm varchar(100));


insert into tmp_mgr_qualifications values ('-',NULL);
insert into tmp_mgr_qualifications values ('.',NULL);
insert into tmp_mgr_qualifications values ('1 ST','1st');
insert into tmp_mgr_qualifications values ('1 ST PASS','1st');
insert into tmp_mgr_qualifications values ('1 TH','1st');
insert into tmp_mgr_qualifications values ('10','10th');
insert into tmp_mgr_qualifications values ('10 PASS','10th');
insert into tmp_mgr_qualifications values ('10 TH','10th');
insert into tmp_mgr_qualifications values ('10 TH , PTC','10th');
insert into tmp_mgr_qualifications values ('10 TH PASS','10th');
insert into tmp_mgr_qualifications values ('10 PASS SSC','10th');
insert into tmp_mgr_qualifications values ('10 TH TECHNICAL','10th');
insert into tmp_mgr_qualifications values ('10 TH WITH IIT CONTINUE','10th');
insert into tmp_mgr_qualifications values ('10 TH, ITI','10th');
insert into tmp_mgr_qualifications values ('10H','10th');
insert into tmp_mgr_qualifications values ('10HT','10th');
insert into tmp_mgr_qualifications values ('10TH  PASS','10th');
insert into tmp_mgr_qualifications values ('10TH & ARCHITECT','10th');
insert into tmp_mgr_qualifications values ('10TH ,D.C.E. CIVIL','10th');
insert into tmp_mgr_qualifications values ('10TH PAS','10th');
insert into tmp_mgr_qualifications values ('10TH PASS','10th');
insert into tmp_mgr_qualifications values ('10TH PASS & I.T.I','10th');
insert into tmp_mgr_qualifications values ('10TH STD','10th');
insert into tmp_mgr_qualifications values ('10TH, ITI (MOTER MECHANICAL)','10th');
insert into tmp_mgr_qualifications values ('10TH`','10th');
insert into tmp_mgr_qualifications values ('10THA','10th');
insert into tmp_mgr_qualifications values ('10THPASS','10th');
insert into tmp_mgr_qualifications values ('11 PASS','11th');
insert into tmp_mgr_qualifications values ('11 TH','11th');
insert into tmp_mgr_qualifications values ('11 TH COMMERCE','11th');
insert into tmp_mgr_qualifications values ('11 TH PASS','11th');
insert into tmp_mgr_qualifications values ('11 TH PSS','11th');
insert into tmp_mgr_qualifications values ('11TH PASS','11th');
insert into tmp_mgr_qualifications values ('11TH PASS`','11th');
insert into tmp_mgr_qualifications values ('11TH STD','11th');
insert into tmp_mgr_qualifications values ('11TH STD.','11th');
insert into tmp_mgr_qualifications values ('11TH(ITI ELECTRICIAN)','11th');
insert into tmp_mgr_qualifications values ('11TH`','11th');
insert into tmp_mgr_qualifications values ('11THA','11th');
insert into tmp_mgr_qualifications values ('12','12th');
insert into tmp_mgr_qualifications values ('12 DCA','12th');
insert into tmp_mgr_qualifications values ('12 PASS','12th');
insert into tmp_mgr_qualifications values ('12 TH','12th');
insert into tmp_mgr_qualifications values ('12 TH PASS','12th');
insert into tmp_mgr_qualifications values ('12 TH RUNNING','12th');
insert into tmp_mgr_qualifications values ('12''th','12th');
insert into tmp_mgr_qualifications values ('12H','12th');
insert into tmp_mgr_qualifications values ('12TH (ANGANWADI)','12th');
insert into tmp_mgr_qualifications values ('12TH (GARAGE WORK)','12th');
insert into tmp_mgr_qualifications values ('12TH , ITI','12th');
insert into tmp_mgr_qualifications values ('12TH , ITI VIREMEN','12th');
insert into tmp_mgr_qualifications values ('12TH COMMERECE','12th');
insert into tmp_mgr_qualifications values ('12TH FAIL','12th');
insert into tmp_mgr_qualifications values ('12TH M.SC IT','12th');
insert into tmp_mgr_qualifications values ('12TH PAS','12th');
insert into tmp_mgr_qualifications values ('12TH PASS','12th');
insert into tmp_mgr_qualifications values ('12TH PASS I.T.I','12th');
insert into tmp_mgr_qualifications values ('12TH RUNNING','12th');
insert into tmp_mgr_qualifications values ('12TH SCI.','12th');
insert into tmp_mgr_qualifications values ('12TH STD','12th');
insert into tmp_mgr_qualifications values ('12TH, COMPUTERS RUNNING','12th');
insert into tmp_mgr_qualifications values ('12TH, I.T.I.','12th');
insert into tmp_mgr_qualifications values ('12TH, ITI','12th');
insert into tmp_mgr_qualifications values ('12TH,CIVIL INTERMIDIATOR','12th');
insert into tmp_mgr_qualifications values ('12TH,I.T.I.,','12th');
insert into tmp_mgr_qualifications values ('12THPASS','12th');
insert into tmp_mgr_qualifications values ('1OTH PASS','10th');
insert into tmp_mgr_qualifications values ('1st PASS','1st');
insert into tmp_mgr_qualifications values ('2 ND','2nd');
insert into tmp_mgr_qualifications values ('2 ND PASS','2nd');
insert into tmp_mgr_qualifications values ('2 pass','2nd');
insert into tmp_mgr_qualifications values ('2 ST','2nd');
insert into tmp_mgr_qualifications values ('2ND PASS','2nd');
insert into tmp_mgr_qualifications values ('2ND STD.','2nd');
insert into tmp_mgr_qualifications values ('2ND YEAR','Second Year B.Com.');
insert into tmp_mgr_qualifications values ('2ND YEAR L.L.B.','Second Year L.L.B.');
insert into tmp_mgr_qualifications values ('2nd yearB.COM.','Second Year B.Com.');
insert into tmp_mgr_qualifications values ('2ND YR. ENGG.','Second Year B.E.');
insert into tmp_mgr_qualifications values ('2TH PASS','2nd');
insert into tmp_mgr_qualifications values ('3','3rd');
insert into tmp_mgr_qualifications values ('3 RD','3rd');
insert into tmp_mgr_qualifications values ('3 RD PASS','3rd');
insert into tmp_mgr_qualifications values ('3 TH','3rd');
insert into tmp_mgr_qualifications values ('3RD PASS','3rd');
insert into tmp_mgr_qualifications values ('3RD STD','3rd');
insert into tmp_mgr_qualifications values ('3RD.','3rd');
insert into tmp_mgr_qualifications values ('3th','3rd');
insert into tmp_mgr_qualifications values ('4','4th');
insert into tmp_mgr_qualifications values ('4 PASS','4th');
insert into tmp_mgr_qualifications values ('4 TH','4th');
insert into tmp_mgr_qualifications values ('4 TH PASS','4th');
insert into tmp_mgr_qualifications values ('4RT PASS','4th');
insert into tmp_mgr_qualifications values ('4TD STD.','4th');
insert into tmp_mgr_qualifications values ('4TH (SMC)','4th');
insert into tmp_mgr_qualifications values ('4TH CLASS','4th');
insert into tmp_mgr_qualifications values ('4TH PASS','4th');
insert into tmp_mgr_qualifications values ('4th std','4th');
insert into tmp_mgr_qualifications values ('4THSTD','4th');
insert into tmp_mgr_qualifications values ('4TY PASS','4th');
insert into tmp_mgr_qualifications values ('5','5th');
insert into tmp_mgr_qualifications values ('5  TH','5th');
insert into tmp_mgr_qualifications values ('5 PASS','5th');
insert into tmp_mgr_qualifications values ('5 TH','5th');
insert into tmp_mgr_qualifications values ('5 TH PASS','5th');
insert into tmp_mgr_qualifications values ('5TD STD','5th');
insert into tmp_mgr_qualifications values ('5TH PASS','5th');
insert into tmp_mgr_qualifications values ('5TH SEM, B.E. (MECHANICAL)','Third Year B.E.');
insert into tmp_mgr_qualifications values ('5TH STD','5th');
insert into tmp_mgr_qualifications values ('5TH STD.','5th');
insert into tmp_mgr_qualifications values ('5THPASS','5th');
insert into tmp_mgr_qualifications values ('5THSTD','5th');
insert into tmp_mgr_qualifications values ('6','6th');
insert into tmp_mgr_qualifications values ('6 PASS','6th');
insert into tmp_mgr_qualifications values ('6 TH','6th');
insert into tmp_mgr_qualifications values ('6 TH PASS','6th');
insert into tmp_mgr_qualifications values ('6TH PASS','6th');
insert into tmp_mgr_qualifications values ('6TH STD','6th');
insert into tmp_mgr_qualifications values ('7 PASS','7th');
insert into tmp_mgr_qualifications values ('7 TH','7th');
insert into tmp_mgr_qualifications values ('7 TH PASS','7th');
insert into tmp_mgr_qualifications values ('7 TH.','7th');
insert into tmp_mgr_qualifications values ('7PASS','7th');
insert into tmp_mgr_qualifications values ('7TH  PASS','7th');
insert into tmp_mgr_qualifications values ('7TH SEMI. B.E','Fourth Year B.E.');
insert into tmp_mgr_qualifications values ('7TH STD','7th');
insert into tmp_mgr_qualifications values ('7TH,NURSING COURSE','7th');
insert into tmp_mgr_qualifications values ('7YH','7th');
insert into tmp_mgr_qualifications values ('8 PASS','8th');
insert into tmp_mgr_qualifications values ('8 TH','8th');
insert into tmp_mgr_qualifications values ('8 TH PASS','8th');
insert into tmp_mgr_qualifications values ('8TH CLASS','8th');
insert into tmp_mgr_qualifications values ('8TH PAS','8th');
insert into tmp_mgr_qualifications values ('8TH PASS','8th');
insert into tmp_mgr_qualifications values ('8TH STD','8th');
insert into tmp_mgr_qualifications values ('8TH STD.','8th');
insert into tmp_mgr_qualifications values ('8THA','8th');
insert into tmp_mgr_qualifications values ('8THPASS','8th');
insert into tmp_mgr_qualifications values ('9 PASS','9th');
insert into tmp_mgr_qualifications values ('9 TH','9th');
insert into tmp_mgr_qualifications values ('9 TH PASS','9th');
insert into tmp_mgr_qualifications values ('9TH (SMC SERVICE)','');
insert into tmp_mgr_qualifications values ('9TH (SUZUKI 2 WHEELER)','9th');
insert into tmp_mgr_qualifications values ('9TH FAIL','8th');
insert into tmp_mgr_qualifications values ('9TH PASS','9th');
insert into tmp_mgr_qualifications values ('9TH STD','9th');
insert into tmp_mgr_qualifications values ('9TH STD.','9th');
insert into tmp_mgr_qualifications values ('9TH`','9th');
insert into tmp_mgr_qualifications values ('A.T.D.',NULL);
insert into tmp_mgr_qualifications values ('ACCOUNT','Cost Accountant');
insert into tmp_mgr_qualifications values ('AGRICULCHAR',NULL);
insert into tmp_mgr_qualifications values ('AGRICULTURE',NULL);
insert into tmp_mgr_qualifications values ('ANIMATION & FILMS',NULL);
insert into tmp_mgr_qualifications values ('AOCP(ATTENDANT OPERATOR CHEMICAL PLANT)',NULL);
insert into tmp_mgr_qualifications values ('ARCHITECH ENGG CONTINUE','Bachelor of Architecture');
insert into tmp_mgr_qualifications values ('ARCHITECHT','Bachelor of Architecture');
insert into tmp_mgr_qualifications values ('ARCHITECT ENG.','Bachelor of Architecture');
insert into tmp_mgr_qualifications values ('ART TEACHER DIPLOMA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('ARYUVED RATNA','Ayurved RatanDeg post 1968 frm');
insert into tmp_mgr_qualifications values ('AUTOMOBILE ENG. RUNNING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('AUTOMOBILE ENGG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('AUTOMOBILE ENGINEERING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('AUTOMOBILES','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('AVV RMP',NULL);
insert into tmp_mgr_qualifications values ('B .E. THIRD YEAR','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B COM, LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B COM, TEXTILE DESIGNING','');
insert into tmp_mgr_qualifications values ('B E','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B E CIVIL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B P ED','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B SC MATHS D.ME.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B TECH CIVIL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B. A. WITH STEO (GUJ)','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B. COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B. COM , C.A.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B. COM.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B. COM. M.B.A.','M.B.A.');
insert into tmp_mgr_qualifications values ('B. Sc.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B. TECH METALURGY','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A  D.P Ed','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A (DIAMOND TESTING LAB)','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A (ENG. LITERATURE)','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A (ENGLISH)','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A , PTC','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A ,L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A ,L.LB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A / M.A','Master of Arts');
insert into tmp_mgr_qualifications values ('B.A B ED.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A B.ED (RUNNING)','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A BED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A FINAL YEAR','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A FIRST YEAR','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A GUJARATI','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A HINDI','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A HOME SCIENCE','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A JOURNALISIJAM','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A, B.ED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A, B.ED (RUNNNING)','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A, LL.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A, LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A, LLB 2ND YEAR','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A, M.A','Master of Arts');
insert into tmp_mgr_qualifications values ('B.A,B.E.D,T.D,KOVID.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A,B.ED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A,B.P.D','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A,L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A,M.A','Master of Arts');
insert into tmp_mgr_qualifications values ('B.A,PGDCA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.   P.T.C','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A. , GENEAL NURSING','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A. B.ED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A. B.ED.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A. D.PED.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A. ELECTRICIAN','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A. ENGLISH','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A. ITI','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A. L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A. L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A. LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A. M.ED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A. P.T.C.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A. PTC','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A. SOCIOLOGY','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.(TELUGU)','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.+DIPLOMA IN COMPUTER','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A., B.ED.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A., L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A., LL.B., M.B.A','M.B.A.');
insert into tmp_mgr_qualifications values ('B.A., LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A., M.A.','Master of Arts');
insert into tmp_mgr_qualifications values ('B.A., M.A. B.ed.','Master of Arts');
insert into tmp_mgr_qualifications values ('B.A.,B.ED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.,B.Ed.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.,B.ED.,P.T.C.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.,B.P.ED,','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.,C.A.IIB','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.,L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A.,M.A.','Master of Arts');
insert into tmp_mgr_qualifications values ('B.A.,M.B.A.`','M.B.A.');
insert into tmp_mgr_qualifications values ('B.A.,M.C.A.','Master of Computer Applications.');
insert into tmp_mgr_qualifications values ('B.A.B.ED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.B.Ed.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.B.PED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.F.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.A.L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A.LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A.LLB, LLM.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A.LLB.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.A.M.S','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.P.T.C.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.B.A','Bachelor Business Management');
insert into tmp_mgr_qualifications values ('B.B.A PERSUING','B.B.A.');
insert into tmp_mgr_qualifications values ('B.B.A Running','B.B.A.');
insert into tmp_mgr_qualifications values ('B.B.A, DSA','B.B.A.');
insert into tmp_mgr_qualifications values ('B.BOM, MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('B.C.A','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('B.C.A F.Y','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('B.C.A.','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('B.C.A. CONTI.','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('B.C.A., M.B.A.','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM & C.A. RUNNING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM (DIP AVIATION)','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM (M.B.A)','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM + C.A. CONTINUE','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM , C.S. RUNNING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM , COMPUTER','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM , LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM ,B.E.D','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM ,C.AIIB','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM ,L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM AND LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM BANKING & INSURANCE','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM CA','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM CAIIB-I','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM CONTI.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM CONTINUE','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM D.C.A','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM DE CE (NIIT)','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM ICWA','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM LL.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM PURSUING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM RUNNING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM(RUNNNING)','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM, B.ED','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B.COM, B.P.ED.','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B.COM, C.A.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM, CAIIB','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM, F.C.A','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM, L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM, L.L.B., P.G. DIRPM','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM, LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM, LLB, LLM','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM, M.A., B.ED','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM, M.B.A (FINANCE)','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM, M.COM CONTI.','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM, M.COM RUNNING','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM, M.COM-i','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM, M.COM. RUNNING','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM, MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM, MPA(PG)','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM, P.G.DCA','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM, P.T.C','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM, PGDCA','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM, YOGA THERAPY','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,B.ED','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,B.ED, PGDCA,M.COM.','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,C.S,CA FINAL','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,CA','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,CA INTER','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,CA PURSUE','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,CA PURSUING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,CA(FINAL)','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,CS','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,D.C.A.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM,LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM,LLB, INTER C.A','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM,M.B.A','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM,M.COM CONTINUE','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,M.S.W,I.R.P.M,L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM,MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM,MBA CONTI','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM,MBA FINANCE','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM,MBA PURSUING','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM,MCOM CONTI.','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,MCOM CONTINUE','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,MCOM PURSUING','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,PGHRM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM,PTC,ICWA(INTER)','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.Com.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM.   L.L.B.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM.  L.L.B.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM. (PERSUING)','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM. (PURSUING) CFA','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.Com. , DIPLOMA IN COMPUTER','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM. ,D.C.A.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM. B.ED','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B.COM. C.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.COM. ICWA','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM. L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM. LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM. M.C.A','Master of Computer Applications.');
insert into tmp_mgr_qualifications values ('B.COM. M.COM(PERSUING)','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM. M.COM.','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM. MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM. MCOM.(PERSUING)','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM. PGDCA','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM., DIPLOMA IN FIN. MANAGEMENT','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM., I.T.I.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.Com., L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM., L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM., M. GOM., B. ED.(PGDCA)','');
insert into tmp_mgr_qualifications values ('B.COM., M.B.A.','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM., M.B.A.[FINANCE]','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM., M.COM. (RUNNING)','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM., RECEIPTIONIST','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM.,C.A.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM.,D.P.ED','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM.,ITI','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('B.COM.,L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM.,L.L.B., C.F.P','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM.,M.A.','Master of Arts');
insert into tmp_mgr_qualifications values ('B.Com.,MBA,DIPLO. IN COMP.','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM.B.ED','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B.COM.L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.COM.M.B.A','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM.M.COM','Master of Commerce');
insert into tmp_mgr_qualifications values ('B.COM.M.COM,MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM.MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('B.COM;LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.D.S','Bachelor of Dental Surgery');
insert into tmp_mgr_qualifications values ('B.D.S M.D CONTINUE','Bachelor of Dental Surgery');
insert into tmp_mgr_qualifications values ('B.D.S.','Bachelor of Dental Surgery');
insert into tmp_mgr_qualifications values ('B.E','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E (CHEM)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E (ELE.) M.B.A.','M.B.A.');
insert into tmp_mgr_qualifications values ('B.E (ELECTRICAL)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E (RUNNING)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E 2ND YEAR','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E CHEMICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E CIVIL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E CIVIL CONTINUE','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E CIVIL.M.TECH(STURCTURAL)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E COMPUTER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E E.C , M.E (E.C)','Master of Engineering');
insert into tmp_mgr_qualifications values ('B.E E.C.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E ELECTRIC','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E I.T','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E IN DESIGN','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E IN E.C','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E MECH','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E MECHANICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E RUNNING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E(E.C)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E(I.T.)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E(MECH),MBA,PDIS.','M.B.A.');
insert into tmp_mgr_qualifications values ('B.E.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. (BIO MEDICAL)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. (COMPUTER)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. (COMPUTER) RUNNING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. (E.C.)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. (FIRE)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. (MECH)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. (MECH.)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. (MECHANICAL)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. 3RD YEAR','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. CHEMICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. CIVIL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. CIVIL RUNNING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. COMP.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. COMPUTER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. COMPUTER ENGG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. E&TC','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. E.C.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. ELE.ENGINEER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. ELECTRICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. ELECTRICAL MPICANICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. EQUIVALENT','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. IN E.C','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. MBA','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. MECH.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. MECHANICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. MECHENICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. PRODUCTION','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. RUNNING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E. THIRD YEAR INFORMATION','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.(ELECT.)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.(MICHENICHAL)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.4TH YEAR','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.CIVIL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.CIVIL CONTINUE','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.CIVIL, M.B.A. FIRST YEAR','');
insert into tmp_mgr_qualifications values ('B.E.COMP','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.COMPUTER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.COMPUTER ENGG','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.COMPUTER SCIENCE','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.COMUPTER ENG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.E.C.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.ELECTRIC','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.ELECTRONICS','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.I.T.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.IT','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.M.TM','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.MECH','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.MECH CONTINUE','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.MECHANICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.E.METALLURGH','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.ECHEMICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.Ed','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B.ED , T.V.COURSE.','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B.ED RUNNING','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B.ED.','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B.FARM','Bachelor of Pharmacy');
insert into tmp_mgr_qualifications values ('B.H.M.S','B.H.M.S.');
insert into tmp_mgr_qualifications values ('B.H.M.S.(F.Y.)','B.H.M.S.');
insert into tmp_mgr_qualifications values ('B.P ED','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B.P.E.','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B.P.E.,M.P.E.','Master of Education');
insert into tmp_mgr_qualifications values ('B.P.EAD',NULL);
insert into tmp_mgr_qualifications values ('B.P.N.A',NULL);
insert into tmp_mgr_qualifications values ('B.PE (PHYSICAL EDUCATION)','Bachelor of Education');
insert into tmp_mgr_qualifications values ('B.PHARM','Bachelor of Pharmacy');
insert into tmp_mgr_qualifications values ('B.PHARM (MEDICAL CONSULTANT)','Bachelor of Pharmacy');
insert into tmp_mgr_qualifications values ('B.PHARM CONTI','Bachelor of Pharmacy');
insert into tmp_mgr_qualifications values ('B.PHARM MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('B.PHARM.','Bachelor of Pharmacy');
insert into tmp_mgr_qualifications values ('B.PHARMA','Bachelor of Pharmacy');
insert into tmp_mgr_qualifications values ('B.PT',NULL);
insert into tmp_mgr_qualifications values ('B.R.S',NULL);
insert into tmp_mgr_qualifications values ('B.R.S.',NULL);
insert into tmp_mgr_qualifications values ('B.R.S. AGRICULTURE',NULL);
insert into tmp_mgr_qualifications values ('B.R.S.(AGRICULTURE)',NULL);
insert into tmp_mgr_qualifications values ('B.RS. AGRICULTURE',NULL);
insert into tmp_mgr_qualifications values ('B.RS. M.SW.',NULL);
insert into tmp_mgr_qualifications values ('B.S.C','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.S.C CONIT.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.S.C DMLT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.S.C PHYSICS','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.S.C,B.E.D','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.S.C.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.S.C.,L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.S.N.',NULL);
insert into tmp_mgr_qualifications values ('B.SC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC  BIO','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC (AGRICULTURE)','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC (HOME SCIENCE)','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC ,B.PHARM','Bachelor of Pharmacy');
insert into tmp_mgr_qualifications values ('B.SC ,M.ED','Master of Education');
insert into tmp_mgr_qualifications values ('B.SC B.ED','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC C.A.IIB','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC CHEMISTRY','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC ENG. ELECTRICAL','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC Fashion Design','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.SC MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('B.SC MLT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC MLT, B.ED','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC NURSING','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC PURSUING','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC SY','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC WITH CHEMISTRY','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC(AGRI)','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC(BIO CHEM.)','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC, B. SC TECH','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC, B.ED','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC, M.B.A.','M.B.A.');
insert into tmp_mgr_qualifications values ('B.Sc, M.L.T','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC, M.L.T. P.G. IN HEATH CARE','');
insert into tmp_mgr_qualifications values ('B.SC, MLT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.Sc,B.Ed','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.Sc.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.Sc. (Micro) DMLT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC. (PERSUING)','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC. , L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.SC. , MLT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC. B.ED.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.Sc. chemisty','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC. FARMING','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC. HOME SCIENCE','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.Sc. IT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC. L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.SC. MICRO','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC. MLT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC. PURSUING NURSING','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.Sc.(HOME) [CHILD DEV.].M.Sc HDFC','Master of Science');
insert into tmp_mgr_qualifications values ('B.Sc.(MICRO),D.E..M.M','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC.(S.Y.)','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.Sc., B.Ed.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC., M.SC. MICRO','Master of Science');
insert into tmp_mgr_qualifications values ('B.Sc.,AGRICULTURE','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.Sc.,B.ED','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.Sc.,B.Ed.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.Sc.,BED.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.Sc.,D.T.C.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC.,L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('B.SC.,M.SC.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC.,MICRO,DMLT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC.IT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.SC.MICRO','Bachelor of Science');
insert into tmp_mgr_qualifications values ('B.TEC COMPUTER SCI','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.TEC.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.TECH','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.TECH CIVIL M.E','Master of Engineering');
insert into tmp_mgr_qualifications values ('B.TECH ICT','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.TECH PURSUING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.TECH(CONTI)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.TECH, M.B.A','M.B.A.');
insert into tmp_mgr_qualifications values ('B.TECH,MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('B.TECH-IT','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.TECH.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.TECH. COMPUTERS','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.TECH. IT','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('B.V.SC & A.H(VETY. MEDICINE)','Bachelor of Veterinary Science');
insert into tmp_mgr_qualifications values ('B/COM.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('BA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA B.ED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA BED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA BED, DIPLOMA IN TEACHING','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA BPeD','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA HEALTH','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('BA PTC','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA, COMPUTER & HARDWARE ENGINEER','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA, LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('BA,B.ED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA,BED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA,LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('BA,MA','Master of Arts');
insert into tmp_mgr_qualifications values ('BA,MA RUNNING','Master of Arts');
insert into tmp_mgr_qualifications values ('BA,MA,BED','Master of Arts');
insert into tmp_mgr_qualifications values ('BA,MAB.ED PURSUE','Master of Arts');
insert into tmp_mgr_qualifications values ('BA,PTC','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('BA,SI','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA. B.ED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA.BED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BA.B.ED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('BACHELOR IN ARCHITECTURE','');
insert into tmp_mgr_qualifications values ('BAMS','B.A.M.S.');
insert into tmp_mgr_qualifications values ('BANKING','Bachelor of Banking & Insurance');
insert into tmp_mgr_qualifications values ('BBA','B.B.A.');
insert into tmp_mgr_qualifications values ('BBA CONTINUE','B.B.A.');
insert into tmp_mgr_qualifications values ('BCA','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('BCA 1ST YEAR','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('BCA CONTINUE','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('BCOM C A','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('BCOM CS','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('BCOM LLB','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('BCOM PASS','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('BCOM PERSUING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('BCOM. COMPUTER DIPLOMA','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('BDS','Bachelor of Dental Surgery');
insert into tmp_mgr_qualifications values ('BDS CONTINUE','Bachelor of Dental Surgery');
insert into tmp_mgr_qualifications values ('BDS, SELF PRACTICE, G. HOSP. NADIAD','Bachelor of Dental Surgery');
insert into tmp_mgr_qualifications values ('BE','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE 2ND YEAR TEXTILE ENGG','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE CE','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE CHEMICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE CIVIL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE CIVIL ENGG','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE COMPUTER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE CONTINUE','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE EC','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE ELEC. THIRD YR','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE ELECTRICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE IC','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE MEC','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE MECHANICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE MECHANICAL ENGINEER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE. COMP 3RD SEM','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE. COMP. CONIT.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE. ELEC.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE. ENG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BE.CHEMICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BHMS','B.H.M.S.');
insert into tmp_mgr_qualifications values ('BHMS- LATST YEAR','B.H.M.S.');
insert into tmp_mgr_qualifications values ('BPNA',NULL);
insert into tmp_mgr_qualifications values ('BRS',NULL);
insert into tmp_mgr_qualifications values ('BSAM',NULL);
insert into tmp_mgr_qualifications values ('BSC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('Bsc (HOME), PGDC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('Bsc (Micro), D.MLT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('BSC IT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('BSC IT CONTINUE','Bachelor of Science');
insert into tmp_mgr_qualifications values ('BSC LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('BSC MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('BSC MLT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('BSC NURSING','Bachelor of Science');
insert into tmp_mgr_qualifications values ('BSC PHY, MBA HR','M.B.A.');
insert into tmp_mgr_qualifications values ('BSC, M.A(ENGLISH)','Master of Arts');
insert into tmp_mgr_qualifications values ('BSC, MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('BSC,MLT','Bachelor of Science');
insert into tmp_mgr_qualifications values ('BSC.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('BTec (DAIRY TECHNOLOGY)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BTECH','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('BTECH MECHANICAL ENGG','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('C.A','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.A ,L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('C.A 2ND YEAR','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.A FACULTY','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.A FINAL PURSUE','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.A, B.COM','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.A.','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.A. (FINAL YEAR)','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.A. FINAL CONTINUE','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.A. FIRST YEAR','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.A. I.C.W','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.A., M.COM. PART-1','Master of Commerce');
insert into tmp_mgr_qualifications values ('C.A.FINAL','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.A.M.COM','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('C.E','Chartered Engineers');
insert into tmp_mgr_qualifications values ('C.F.A.','Cert. Course');
insert into tmp_mgr_qualifications values ('C.P. ED','Cert. Course');
insert into tmp_mgr_qualifications values ('C.P.Ed','Cert. Course');
insert into tmp_mgr_qualifications values ('C.P.ED,ITI','I.T.I.');
insert into tmp_mgr_qualifications values ('C.P.Ed.','Cert. Course');
insert into tmp_mgr_qualifications values ('C.P.ED. ; S.Y.B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('CA','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('CARunning','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('CCA, IPCC GROUP II','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('CIVIL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('CIVIL DIPLOMA','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('CIVIL ENG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('CIVIL ENGG','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('CIVIL ENGG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('CIVIL ENGINEER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('CIVIL ENGINEERING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('CIVILENGINEER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('COM.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('COMP . ENGINEER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('COMP. HARDWARE','Diploma');
insert into tmp_mgr_qualifications values ('COMPUTER COURSE.','Diploma');
insert into tmp_mgr_qualifications values ('COMPUTER ENG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('COMPUTER ENGG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('COMPUTER ENGINEER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('COMPUTER ENGINEERING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('COMPUTER HARD WARE','Diploma');
insert into tmp_mgr_qualifications values ('COMPUTER OPERATOR','Diploma');
insert into tmp_mgr_qualifications values ('COMPUTER SCIENCE','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('CPED,PTC, 12TH','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('CS CONTINUE','Company Secretary');
insert into tmp_mgr_qualifications values ('CS.B.COM CONTINUE','Company Secretary');
insert into tmp_mgr_qualifications values ('CWA',NULL);
insert into tmp_mgr_qualifications values ('D E E','Diploma');
insert into tmp_mgr_qualifications values ('D I S','Diploma');
insert into tmp_mgr_qualifications values ('D''MAN CIVIL, B.COM, M.L.W','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('D-PHARM, BSE','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('D. COMPUTER ENG.,B.A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('D. ME. ENGINEER','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('D. PHARMA','Diploma');
insert into tmp_mgr_qualifications values ('D. TEXTILE','Diploma');
insert into tmp_mgr_qualifications values ('D.A.E.',NULL);
insert into tmp_mgr_qualifications values ('D.C. ENGINEER','Diploma');
insert into tmp_mgr_qualifications values ('D.C.A.',NULL);
insert into tmp_mgr_qualifications values ('D.C.E','Diploma');
insert into tmp_mgr_qualifications values ('D.C.E.','Diploma');
insert into tmp_mgr_qualifications values ('D.CH.(CONTD.)',NULL);
insert into tmp_mgr_qualifications values ('D.CIVIL','Diploma');
insert into tmp_mgr_qualifications values ('D.CIVIL ENG.','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('D.E. (ELECTRICAL)','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('D.E.C','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('D.E.E','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('D.E.E.','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('D.E.R.E',NULL);
insert into tmp_mgr_qualifications values ('D.M.E','Diploma');
insert into tmp_mgr_qualifications values ('D.M.E IN MECHENICAL','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('D.M.E.','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('D.M.E.,B.C.A.','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('D.M.F',NULL);
insert into tmp_mgr_qualifications values ('D.M.T',NULL);
insert into tmp_mgr_qualifications values ('D.MECH','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('D.PHARM','Diploma');
insert into tmp_mgr_qualifications values ('D.PHARM, B.A.LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('D.PHARM.','Diploma');
insert into tmp_mgr_qualifications values ('D.PHARMA','Diploma');
insert into tmp_mgr_qualifications values ('D.T.P.','Diploma');
insert into tmp_mgr_qualifications values ('D.T.T','Diploma');
insert into tmp_mgr_qualifications values ('D.TEXTTILE','Diploma');
insert into tmp_mgr_qualifications values ('DCS','Diploma');
insert into tmp_mgr_qualifications values ('DCT AND INTERNATIONAL ASSESOR','Diploma');
insert into tmp_mgr_qualifications values ('DE','Diploma');
insert into tmp_mgr_qualifications values ('DEE,PDCA,BCA,MCSD','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('DEP  COMP DESIGN','Diploma');
insert into tmp_mgr_qualifications values ('DEPLOMA CIVIL ENG','Diploma');
insert into tmp_mgr_qualifications values ('DERE HDSE','');
insert into tmp_mgr_qualifications values ('DETAILS REQD',NULL);
insert into tmp_mgr_qualifications values ('DHMS','');
insert into tmp_mgr_qualifications values ('DILOMA IN ELECTRONICS','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('DIP ELE ENG','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('DIP IN MECH ENG.','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('DIP. ELEC. ENGINEER','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('DIP. ELECTRICAL ENGG.','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('DIP. MECH. ENGG.','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('DIPL. AUTOMOBOILES','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('DIPL. CIVIL','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('DIPLOM IN COMPUTER ENG.','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('DIPLOMA (MECHANICAL)','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('DIPLOMA AGRICULTURE','Engineering Diploma 3 Yrs');
insert into tmp_mgr_qualifications values ('DIPLOMA ARCHI.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA ART','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA AUTOMOBILES','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA CHEMICAL','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA CIVIL','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA CIVIL ENG.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA CIVIL ENGG.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA CIVIL ENGGINEER','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA CIVIL ENGINEER','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA CIVIL ENGINIERING','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA CIVIL.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA COMP.ENG','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA COMPUTER','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA COMPUTER ENGINEERING','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA ELE. ENGINEER','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA ENGG.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA ENGINEER','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN CIVIL','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN CIVIL ENG.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN CIVIL ENGG.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN COMMERCIAL ART','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN COMPUTER','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN DESIGN','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN DISPANSARY','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN ELECT','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN ELECTRIC','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN ENGINEERING','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN FARM.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN FINE ARTS','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN FINE ARTS,','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN HEALTH CENTRE','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN MACHINIST','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN MECHANICAL,B.A.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN MECHENICAL','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN MICHENICAL','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN OPTHALNIC SCIENCE','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN PLASTIC ENG','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN TEXTILE TECH.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN WEB TECHNOLOGY','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA INSTRUMENTION','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA M.E.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA MECH.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA MECHANICAL','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA MECHANICAL ENGG','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA MECHANICAL ENGINEERING','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA MECHANICAL ENGINEERING.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA MICHANICAL','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA PHARMACY','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA TEXTILE','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA-MECH ENGINEER','Diploma');
insert into tmp_mgr_qualifications values ('DISM','Diploma');
insert into tmp_mgr_qualifications values ('DIT','Diploma');
insert into tmp_mgr_qualifications values ('DME','Diploma');
insert into tmp_mgr_qualifications values ('DNB ANETHESIA','Diploma');
insert into tmp_mgr_qualifications values ('DOCTOR','Bachelor of Medicine & Surgery');
insert into tmp_mgr_qualifications values ('DPMT','Diploma');
insert into tmp_mgr_qualifications values ('DRAFTMEN, MECHANIC',NULL);
insert into tmp_mgr_qualifications values ('DT. B.TECH','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('E.C.',NULL);
insert into tmp_mgr_qualifications values ('ED',NULL);
insert into tmp_mgr_qualifications values ('ELE. & TELECOM','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('Ele.,(sr.tec.amie)',NULL);
insert into tmp_mgr_qualifications values ('ELECTRICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ELECTRICAL ENGG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ELECTRICAL ENGINEER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ELECTRICAL ENGINEERING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ELECTRONIC','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ELECTRONIC ENG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ELECTRONICS','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ELECTRONICS ENGG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ELELCTRICAL ENGINEER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ELOCTRONICS AND COMMUNICATION','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ENG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ENG. IC','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ENGG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ENGG. THIRD YEAR RUNNING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ENGINEERING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ENGINEERING (TEXTILE)','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('EYE OHTOMETIST','Master of Surgery');
insert into tmp_mgr_qualifications values ('EYE SURGON','Master of Surgery');
insert into tmp_mgr_qualifications values ('F',NULL);
insert into tmp_mgr_qualifications values ('F Y B COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F. Y','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F. Y.B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.D FINALS RUNNING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y  B.A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('F.Y B.A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('F.Y B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y BA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('F.Y BBA','B.B.A.');
insert into tmp_mgr_qualifications values ('F.Y BCA','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('F.Y BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y BPT','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y. B. COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y. B.A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('F.Y. B.A (FINE ARTS)','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('F.Y. B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('F.Y. B.CA.','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('F.Y. B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y. B.COM  RUNNING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y. B.COM RUNNING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y. B.SC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('F.Y. B.SC.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('F.Y. BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y. BS.C','Bachelor of Science');
insert into tmp_mgr_qualifications values ('F.Y. BSC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('F.Y. MEDICAL','First Year M.B.B.S.');
insert into tmp_mgr_qualifications values ('F.Y.B. COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y.B. COM RUNNIN','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y.B.A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('F.Y.B.A RUNNING','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('F.Y.B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('F.Y.B.B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('F.Y.B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y.B.COM (CIVIL SUPPLY)','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y.B.COM CONTI','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y.B.Com.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y.B.S.C','Bachelor of Science');
insert into tmp_mgr_qualifications values ('F.Y.B.SC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('F.Y.B.SC.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('F.Y.BA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('F.Y.BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y.Bcom.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y.BSC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('F.Y.BSc.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('F.Y.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('F.Y.DIPLOMA','Diploma');
insert into tmp_mgr_qualifications values ('F.Y.L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('FABRICATION','Cert. Course');
insert into tmp_mgr_qualifications values ('FASHION DESIGN.','Cert. Course');
insert into tmp_mgr_qualifications values ('FASHION DESIGNER','Cert. Course');
insert into tmp_mgr_qualifications values ('FASHION DESIGNING','Cert. Course');
insert into tmp_mgr_qualifications values ('FERTILISER','Cert. Course');
insert into tmp_mgr_qualifications values ('FINE ARTS','Bachelor of Fine Arts');
insert into tmp_mgr_qualifications values ('FIRE ENGINEERING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('FY','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('FY B COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('FY B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('FY BA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('FY BBA','B.B.A.');
insert into tmp_mgr_qualifications values ('FY BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('FY BSC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('FY BSE, PTC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('FY PHARMACY','Bachelor of Pharmacy');
insert into tmp_mgr_qualifications values ('FY.B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('FYBCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('G.N.M Nursing Cont.','Dip. General Nursing and Midwi');
insert into tmp_mgr_qualifications values ('G.N.M.','Dip. General Nursing and Midwi');
insert into tmp_mgr_qualifications values ('GNM','Dip. General Nursing and Midwi');
insert into tmp_mgr_qualifications values ('GOR',NULL);
insert into tmp_mgr_qualifications values ('GRADUATION','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('GRAPHIC DIPLOMA','Diploma');
insert into tmp_mgr_qualifications values ('H S C','12th');
insert into tmp_mgr_qualifications values ('H. S. C.','12th');
insert into tmp_mgr_qualifications values ('H.S. C','12th');
insert into tmp_mgr_qualifications values ('H.S.C','12th');
insert into tmp_mgr_qualifications values ('H.S.C  (P.T.C.)','12th');
insert into tmp_mgr_qualifications values ('H.S.C RUNNING','12th');
insert into tmp_mgr_qualifications values ('H.S.C, I.T.I.','12th');
insert into tmp_mgr_qualifications values ('H.S.C, P.T.C','12th');
insert into tmp_mgr_qualifications values ('H.S.C,I.T.I','12th');
insert into tmp_mgr_qualifications values ('H.S.C,I.T.I,F.Y.B.A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('H.S.C,NURSING','12th');
insert into tmp_mgr_qualifications values ('H.S.C.','12th');
insert into tmp_mgr_qualifications values ('H.S.C.  ITI','12th');
insert into tmp_mgr_qualifications values ('H.S.C. + P.T.C','12th');
insert into tmp_mgr_qualifications values ('H.S.C. , A.T.D.','12th');
insert into tmp_mgr_qualifications values ('H.S.C. PASS','12th');
insert into tmp_mgr_qualifications values ('H.S.C. PTC','12th');
insert into tmp_mgr_qualifications values ('H.S.C., P.T.C.','12th');
insert into tmp_mgr_qualifications values ('H.S.C., P.T.C.,','12th');
insert into tmp_mgr_qualifications values ('H.S.C.,A.T.D.','12th');
insert into tmp_mgr_qualifications values ('H.S.C.,P.T.C.','12th');
insert into tmp_mgr_qualifications values ('H.S.C.ITI','12th');
insert into tmp_mgr_qualifications values ('H.S.S.','12th');
insert into tmp_mgr_qualifications values ('H.SC','12th');
insert into tmp_mgr_qualifications values ('H.SC.','12th');
insert into tmp_mgr_qualifications values ('H.SC. CPED','12th');
insert into tmp_mgr_qualifications values ('HOME SCIENCE','Bachelor of Home Science');
insert into tmp_mgr_qualifications values ('HOMESCIENCE','Bachelor of Home Science');
insert into tmp_mgr_qualifications values ('HSC','12th');
insert into tmp_mgr_qualifications values ('HSC & (LI COURSE)','12th');
insert into tmp_mgr_qualifications values ('HSC , BED','Bachelor of Education');
insert into tmp_mgr_qualifications values ('HSC , PTC','12th');
insert into tmp_mgr_qualifications values ('HSC ARTS','12th');
insert into tmp_mgr_qualifications values ('HSC FY BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('HSC PASS','12th');
insert into tmp_mgr_qualifications values ('HSC PTC','12th');
insert into tmp_mgr_qualifications values ('HSC WMC SI','12th');
insert into tmp_mgr_qualifications values ('HSC, ITI','12th');
insert into tmp_mgr_qualifications values ('HSC,DIPLOMA PRINTING','12th');
insert into tmp_mgr_qualifications values ('I T I','I.T.I.');
insert into tmp_mgr_qualifications values ('I.A.S.','');
insert into tmp_mgr_qualifications values ('I.T','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('I.T ENGG','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('I.T.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('I.T. ENGINEER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('I.T.E.S, D.M.T.','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.E.S.','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.I','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.I (ELECTRICIAN)','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.I. & DMI','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.I. (FITTING)','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.I. ELECTRICIAN,','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.I. MECH. DRAFTSMEN','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.I. PPO','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.I. RUNNING','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.I.,CCNN','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.I.,MECHANICAL','I.T.I.');
insert into tmp_mgr_qualifications values ('I.T.I.ELEC.','I.T.I.');
insert into tmp_mgr_qualifications values ('II YEAR B.TECH','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ILLITERAE',NULL);
insert into tmp_mgr_qualifications values ('ILLITERAT',NULL);
insert into tmp_mgr_qualifications values ('ILLITETATE',NULL);
insert into tmp_mgr_qualifications values ('ILLITRATE',NULL);
insert into tmp_mgr_qualifications values ('ILLITREATE',NULL);
insert into tmp_mgr_qualifications values ('ILLITRETE',NULL);
insert into tmp_mgr_qualifications values ('INT. DESIG.','Cert. Course');
insert into tmp_mgr_qualifications values ('INTER ARTS','Cert. Course');
insert into tmp_mgr_qualifications values ('INTER ARTS,','Cert. Course');
insert into tmp_mgr_qualifications values ('INTER C.A.','C.A. (Inter)');
insert into tmp_mgr_qualifications values ('INTER SCIENCE','Cert. Course');
insert into tmp_mgr_qualifications values ('INTERIOR DESIGN. CONTINUE','Cert. Course');
insert into tmp_mgr_qualifications values ('INTERIOR DESIGNER','Cert. Course');
insert into tmp_mgr_qualifications values ('INTERIOR DESIGNING','Cert. Course');
insert into tmp_mgr_qualifications values ('INTERMIDIAT ART','Cert. Course');
insert into tmp_mgr_qualifications values ('IORN WORKS','Cert. Course');
insert into tmp_mgr_qualifications values ('IT ENGG 3RD SEM','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('IT. BE','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('IT. WEB DESIGNING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('ITI','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI  RTUNNING','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI (INSTRUMENTS)','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI CABLE JOINTER,','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI DIESEL MECH','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI ELEC.','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI ELECTRICAL','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI ELECTRICIAN','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI FITTER','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI WIRE MAN','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI WIREMAN','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI- WIREMEN','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI-ELECTICAL','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI. E.T','I.T.I.');
insert into tmp_mgr_qualifications values ('ITI.ELECTICIAN','I.T.I.');
insert into tmp_mgr_qualifications values ('IV','4th');
insert into tmp_mgr_qualifications values ('IX','9th');
insert into tmp_mgr_qualifications values ('L.I.T.C.','Cert. Course');
insert into tmp_mgr_qualifications values ('L.L.B','Bachelor of Law');
insert into tmp_mgr_qualifications values ('L.L.B CONTINUE','Bachelor of Law');
insert into tmp_mgr_qualifications values ('L.L.B.','Bachelor of Law');
insert into tmp_mgr_qualifications values ('LLB','Bachelor of Law');
insert into tmp_mgr_qualifications values ('LLB , B.COM','Bachelor of Law');
insert into tmp_mgr_qualifications values ('LLM, M.B.A, [FINANCE]','');
insert into tmp_mgr_qualifications values ('M B A','M.B.A.');
insert into tmp_mgr_qualifications values ('M COM','Master of Commerce');
insert into tmp_mgr_qualifications values ('M COM PART 1','Master of Commerce');
insert into tmp_mgr_qualifications values ('M COM, B.LIB','Master of Commerce');
insert into tmp_mgr_qualifications values ('M COM, COMPUTER (MS OFFICE)','Master of Commerce');
insert into tmp_mgr_qualifications values ('M COM, M.PHIL','Master of Commerce');
insert into tmp_mgr_qualifications values ('M COM,CFA','Master of Commerce');
insert into tmp_mgr_qualifications values ('M COM., B.ED.M.ED. RUNNING','Master of Commerce');
insert into tmp_mgr_qualifications values ('M PHRAMA','Master of Pharmacy');
insert into tmp_mgr_qualifications values ('M SC','Master of Science');
insert into tmp_mgr_qualifications values ('M Sc ZOOLOGY','Master of Science');
insert into tmp_mgr_qualifications values ('M. Com.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M. COM., L.L.B.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.A','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A (ECO)','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A (HINDI)','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A (HISTORY)','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A ,B.ED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A .B.E.D','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A B.ED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A PART -2','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A PART 1','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A PART-1','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A(ECONOMICS)','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A(PYSCHOLOGY)','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A, B. ED.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A, B.ED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A,B.E.D','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A,B.ED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A,B.ED.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A-PSYCHOLOGY','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. B.ED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. B.ED MSW','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. B.ED.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. ENG.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. ENGLISH','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. HINDI','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. I IN ENGLISH','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. L.L.B.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. LLB','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. M.ED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. PART II RUNNING','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A. Phd.','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('M.A.(CONT.) B.A.B.ED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.(SOCIOLOGY)','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A., B.Ed.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A., B.ED.,','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A., B.Ped.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A., D.P.ED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A., M.Ed.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A., P.hd','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('M.A., PGDCA','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A., S.I. FIRE COURSE','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.,B.Ed.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.,B.R.S.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.,COPA.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.,D.P.ED.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.,M.Ed.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.,P.G.D.C','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.-2','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.B,ED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.B.ED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.B.ED,M.PHILL','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.B.Ed.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.B.ED. ;  L.L.B.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.B.ED.M.ED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.B.P.ED.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.BED','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.D.PHARM','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.M.PHIL','Master of Arts');
insert into tmp_mgr_qualifications values ('M.A.PART-1','Master of Arts');
insert into tmp_mgr_qualifications values ('M.B.A','M.B.A.');
insert into tmp_mgr_qualifications values ('M.B.A HR','M.B.A.');
insert into tmp_mgr_qualifications values ('M.B.A, B.TECH','M.B.A.');
insert into tmp_mgr_qualifications values ('M.B.A,M.SC(MICROBIOLOGY),DIPLOMA HOSPITAL MANAGEMENT','M.B.A.');
insert into tmp_mgr_qualifications values ('M.B.A-FINANCE','M.B.A.');
insert into tmp_mgr_qualifications values ('M.B.A. C.S.','M.B.A.');
insert into tmp_mgr_qualifications values ('M.B.A. RUNNING','M.B.A.');
insert into tmp_mgr_qualifications values ('M.B.A.(FINANCE)','M.B.A.');
insert into tmp_mgr_qualifications values ('M.B.A.(MARKETING)','M.B.A.');
insert into tmp_mgr_qualifications values ('M.B.A., MCSE','M.B.A.');
insert into tmp_mgr_qualifications values ('M.B.A.[HR]','M.B.A.');
insert into tmp_mgr_qualifications values ('M.B.B.S','Bachelor of Medicine & Surgery');
insert into tmp_mgr_qualifications values ('M.B.B.S  FIRST','Bachelor of Medicine & Surgery');
insert into tmp_mgr_qualifications values ('M.B.B.S(M.D.)','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.B.B.S, D.G.O','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.B.B.S, M.D.(SKIN)','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.B.B.S, MD.(MEDICINE)','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.B.B.S,D.PED','Bachelor of Medicine & Surgery');
insert into tmp_mgr_qualifications values ('M.B.B.S.','Bachelor of Medicine & Surgery');
insert into tmp_mgr_qualifications values ('M.B.B.S. (ANEASTHESIOLOGIST)','Bachelor of Medicine & Surgery');
insert into tmp_mgr_qualifications values ('M.B.B.S.,M.D.','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.C.A','Master of Computer Applications.');
insert into tmp_mgr_qualifications values ('M.C.A(SOFTWARE DEVELOPER)','Master of Computer Applications.');
insert into tmp_mgr_qualifications values ('M.C.A, M.TECH','Master of Technology');
insert into tmp_mgr_qualifications values ('M.C.A.','Master of Computer Applications.');
insert into tmp_mgr_qualifications values ('M.CA.','Master of Computer Applications.');
insert into tmp_mgr_qualifications values ('M.COM','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM & C.A','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM ,MBA','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM B.Ed','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM CONTINUE','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.Com PART I','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM PART-1','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM PART-2','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM PERSUING','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM WITH C.A (RUNING)','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM(ACCOUNTANT)','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM, (RUNNING)','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.Com, B.Ed','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM, B.ED, L.L.B','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM, B.Ed.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM, C.A.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM, C.S','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM, C.S.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM, L.L.B.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM, M.B.A.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM, M.PHIL','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM, M.PHIL, M.B.A.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM, P.G.D.C.A','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM,B.ED (CONTI.)','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM,L.L.B,CAIIB,MBA','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM,LLB','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM,MBA','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM,PGDBM','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM,PGDCA,DISM','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM-2','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.Com.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM. , B.ED','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM. C.A.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM. CA.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM. M. ED.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM. MBA','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.Com. PART I','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM. PGDBA','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM., B''ed.,ECCE IN PSY, DIP COMPUTER','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM., L.L.B.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM.,BED','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM.,M.ED.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM.B.ED.','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COM.C.A','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.COMRUNNING','Master of Commerce');
insert into tmp_mgr_qualifications values ('M.D(PHYSICIAN)','');
insert into tmp_mgr_qualifications values ('M.D.','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.D. MEDICINE','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.D. PHY.','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.D., F.C.P.S.','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.D.,M.B.B.S.','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.D.D.G.O','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.D.S','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.D.S.','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('M.E.','Master of Engineering');
insert into tmp_mgr_qualifications values ('M.E. CIVIL','Master of Engineering');
insert into tmp_mgr_qualifications values ('M.E.(ELECT.)','Master of Engineering');
insert into tmp_mgr_qualifications values ('M.E.CIVIL ENGG.','Master of Engineering');
insert into tmp_mgr_qualifications values ('M.ED M.PHIL (ADMIN)','Master of Education');
insert into tmp_mgr_qualifications values ('M.ED.','Master of Education');
insert into tmp_mgr_qualifications values ('M.H.Sc','Masters in Home Science');
insert into tmp_mgr_qualifications values ('M.I.T SOFTWARE ENG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('M.P.ED.','Master of Arts');
insert into tmp_mgr_qualifications values ('M.P.H.W','');
insert into tmp_mgr_qualifications values ('M.P.T. (CARDIO PULMONARY)','');
insert into tmp_mgr_qualifications values ('M.PHARM','Master of Pharmacy');
insert into tmp_mgr_qualifications values ('M.PHIL','Master of Philosophy');
insert into tmp_mgr_qualifications values ('M.PHIL BED','Master of Philosophy');
insert into tmp_mgr_qualifications values ('M.Q.P.M.','');
insert into tmp_mgr_qualifications values ('M.S (OPHTALAMOLOGY)','Master of Surgery');
insert into tmp_mgr_qualifications values ('M.S, D.O.M.S','Master of Surgery');
insert into tmp_mgr_qualifications values ('M.S, L.L.B,DIM,CIVIL ENGINEER','Master of Science  Abroad');
insert into tmp_mgr_qualifications values ('M.S.(ENT)','Master of Science  Abroad');
insert into tmp_mgr_qualifications values ('M.S.C','Master of Science');
insert into tmp_mgr_qualifications values ('M.S.C IT','Master of Science');
insert into tmp_mgr_qualifications values ('M.S.C.','Master of Science');
insert into tmp_mgr_qualifications values ('M.S.C. IT','Master of Science');
insert into tmp_mgr_qualifications values ('M.S.C.,BIOTECHNOLOGY','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC ,M.B.A','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC - MATHS','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC B.ED','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC PH.D','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC WITH CHEMISTRY','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC(BIOTECH)','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC(IT)','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC, DMLT','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC, PH.D, DCSA','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('M.SC, PHD','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('M.SC,L.L.B.','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC,M.B.A,CAIIB,PGDPM','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC,M.PHIL,B.ED','Master of Philosophy');
insert into tmp_mgr_qualifications values ('M.SC,M.PHIL.P.HD','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('M.Sc.','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC. (CA & IT)','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC. (IT)','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC. BIO TECH.','Master of Science');
insert into tmp_mgr_qualifications values ('M.Sc. D.M.C.T.','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC. I.T.','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC. M.ED','Master of Science');
insert into tmp_mgr_qualifications values ('M.Sc. M.Ed.','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC. MATHS','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC. MICRO BIOLOGY','Master of Science');
insert into tmp_mgr_qualifications values ('M.Sc.(BIO.CHEM)','Master of Science');
insert into tmp_mgr_qualifications values ('M.Sc., B.Ed.','Master of Science');
insert into tmp_mgr_qualifications values ('M.SC.,GEOLOGY','Master of Science');
insert into tmp_mgr_qualifications values ('M.Sc.,M.Ed.','Master of Science');
insert into tmp_mgr_qualifications values ('M.Sc.,Ph.D','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('M.SC.B.ED.','Master of Science');
insert into tmp_mgr_qualifications values ('M.SCI','Master of Science');
insert into tmp_mgr_qualifications values ('M.Se. BIOTECHNOLOGY','Master of Science');
insert into tmp_mgr_qualifications values ('M.Tech','Master of Technology');
insert into tmp_mgr_qualifications values ('M.TECH , COMPUTER ENG.','Master of Technology');
insert into tmp_mgr_qualifications values ('M.TECH CIVIL','Master of Technology');
insert into tmp_mgr_qualifications values ('MA','Master of Arts');
insert into tmp_mgr_qualifications values ('MA  DE. PED','Master of Arts');
insert into tmp_mgr_qualifications values ('MA , PG DCA','Master of Arts');
insert into tmp_mgr_qualifications values ('MA B ed','Master of Arts');
insert into tmp_mgr_qualifications values ('MA B ED, D P ED','Master of Arts');
insert into tmp_mgr_qualifications values ('MA B.ED','Master of Arts');
insert into tmp_mgr_qualifications values ('MA BA','Master of Arts');
insert into tmp_mgr_qualifications values ('MA BED','Master of Arts');
insert into tmp_mgr_qualifications values ('MA BED RUNNING','Master of Arts');
insert into tmp_mgr_qualifications values ('MA MED','Master of Arts');
insert into tmp_mgr_qualifications values ('MA PART I','Master of Arts');
insert into tmp_mgr_qualifications values ('MA PART II','Master of Arts');
insert into tmp_mgr_qualifications values ('MA RUNNING','Master of Arts');
insert into tmp_mgr_qualifications values ('MA, B ed','Master of Arts');
insert into tmp_mgr_qualifications values ('MA, B.ED.','Master of Arts');
insert into tmp_mgr_qualifications values ('MA,BED','Master of Arts');
insert into tmp_mgr_qualifications values ('MA,LLB,BED','Master of Arts');
insert into tmp_mgr_qualifications values ('MA. ENGLISH','Master of Arts');
insert into tmp_mgr_qualifications values ('MA.BED','Master of Arts');
insert into tmp_mgr_qualifications values ('MATRIC','10th');
insert into tmp_mgr_qualifications values ('MBA','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA CONTINUE','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA FINANCE','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA FINANCE [SMU]','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA FY RUNNING','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA II year Running','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA IN MARKETING','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA(CS)','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA(FINANCE) B.E.(ELECTRICAL)','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA, DIPLOMA','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA, HRM','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA,MS (FINANCE)','M.B.A.');
insert into tmp_mgr_qualifications values ('MBA-MCOM','M.B.A.');
insert into tmp_mgr_qualifications values ('MBBS','Bachelor of Medicine & Surgery');
insert into tmp_mgr_qualifications values ('MBBS, DGO','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('MBBS, MS (EYE SURGEON)','Master of Surgery');
insert into tmp_mgr_qualifications values ('MBBS,DCH','Bachelor of Medicine & Surgery');
insert into tmp_mgr_qualifications values ('MBBS,MS IN GEN SURGERY','Master of Surgery');
insert into tmp_mgr_qualifications values ('MCA','Master of Computer Applications.');
insert into tmp_mgr_qualifications values ('MCM','Master of Computer Applications.');
insert into tmp_mgr_qualifications values ('MCOM','Master of Commerce');
insert into tmp_mgr_qualifications values ('MCOM - I','Master of Commerce');
insert into tmp_mgr_qualifications values ('MCOM -II','Master of Commerce');
insert into tmp_mgr_qualifications values ('MCOM BED','Master of Commerce');
insert into tmp_mgr_qualifications values ('MCOM I','Master of Commerce');
insert into tmp_mgr_qualifications values ('MCOM PART II','Master of Commerce');
insert into tmp_mgr_qualifications values ('MD','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('MD (ANAESTHESIA)','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('MD (MEDICINE)','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('MD DGO','Doctor of Medicine');
insert into tmp_mgr_qualifications values ('ME','Master of Engineering');
insert into tmp_mgr_qualifications values ('MEC. ER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('MECHANICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('MECHANICAL ENG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('MECHANICAL ENGINEER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('MECHANICAL ENGINEERING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('MECHINECAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('MECHNICAL ENGINEERING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('MEDIA P.G','Post Graduate');
insert into tmp_mgr_qualifications values ('MEDICAL','Dip. General Nursing and Midwi');
insert into tmp_mgr_qualifications values ('MEDICAL IN DIPLOMA-1 YEAR','Dip. General Nursing and Midwi');
insert into tmp_mgr_qualifications values ('METRIC','10th');
insert into tmp_mgr_qualifications values ('MICHANICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('MICHENICAL ENGINEER','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('MIDDLE SCHOOL','10th');
insert into tmp_mgr_qualifications values ('MLW','Master of Law');
insert into tmp_mgr_qualifications values ('MPE','Master of Arts');
insert into tmp_mgr_qualifications values ('MRS, M.Ed.','Master of Education');
insert into tmp_mgr_qualifications values ('MS OPTHOLOGY','Master of Surgery');
insert into tmp_mgr_qualifications values ('MS ORTHOPEDIC','Master of Surgery');
insert into tmp_mgr_qualifications values ('MSAM',NULL);
insert into tmp_mgr_qualifications values ('MSC','Master of Science');
insert into tmp_mgr_qualifications values ('MSC CHEMISTRY','Master of Science');
insert into tmp_mgr_qualifications values ('MSC HOME MANAGEMENT','Master of Science');
insert into tmp_mgr_qualifications values ('MSC IT','Master of Science');
insert into tmp_mgr_qualifications values ('MSC IT CA','Master of Science');
insert into tmp_mgr_qualifications values ('MSC, ELECTRONIC & COMPUTER','Master of Science');
insert into tmp_mgr_qualifications values ('MSC- COMPUTER','Master of Science');
insert into tmp_mgr_qualifications values ('MSC. CHEMISTRY','Master of Science');
insert into tmp_mgr_qualifications values ('MSC.IT','Master of Science');
insert into tmp_mgr_qualifications values ('MSC.MLT','Master of Science');
insert into tmp_mgr_qualifications values ('MSW','Master of Social Work');
insert into tmp_mgr_qualifications values ('MTECH. EC','Master of Technology');
insert into tmp_mgr_qualifications values ('N.T.T.','');
insert into tmp_mgr_qualifications values ('NA',NULL);
insert into tmp_mgr_qualifications values ('NIL',NULL);
insert into tmp_mgr_qualifications values ('NILK',NULL);
insert into tmp_mgr_qualifications values ('NO',NULL);
insert into tmp_mgr_qualifications values ('NO DETAILS',NULL);
insert into tmp_mgr_qualifications values ('NO INFO',NULL);
insert into tmp_mgr_qualifications values ('NON MATRIC','10th');
insert into tmp_mgr_qualifications values ('NON METRIC','10th');
insert into tmp_mgr_qualifications values ('NON-METRIC','10th');
insert into tmp_mgr_qualifications values ('NURSING','Dip. General Nursing and Midwi');
insert into tmp_mgr_qualifications values ('OLD S.S.C','10th');
insert into tmp_mgr_qualifications values ('OLD S.S.C.','10th');
insert into tmp_mgr_qualifications values ('OLD SSC','10th');
insert into tmp_mgr_qualifications values ('OLD SSC PASS','10th');
insert into tmp_mgr_qualifications values ('OLD SSC.','10th');
insert into tmp_mgr_qualifications values ('ORTHOPEDIC (ANM GNM PERSUING)','');
insert into tmp_mgr_qualifications values ('P T C','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('P.G.D.CA.','');
insert into tmp_mgr_qualifications values ('P.H.C.','');
insert into tmp_mgr_qualifications values ('P.HD IN NUTRITION','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('P.HD. IN NUTRITION','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('P.S.C.','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('P.T.C','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('P.T.C ,S.S.C','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('P.T.C.','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('P.T.C. / B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('P.T.C. ; S.Y.B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('P.T.C., B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('P.T.C., M.A.','Master of Arts');
insert into tmp_mgr_qualifications values ('P.T.C.,H.S.C.','');
insert into tmp_mgr_qualifications values ('P.T.C`','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('P.U.C.','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('PAINTING',NULL);
insert into tmp_mgr_qualifications values ('PERA MEDICAL(CONTI)','');
insert into tmp_mgr_qualifications values ('PGD FINANCE','');
insert into tmp_mgr_qualifications values ('PGDBA','');
insert into tmp_mgr_qualifications values ('PGDCA','');
insert into tmp_mgr_qualifications values ('Ph.D','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('PH.D M.LIB.M.COM','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('PH.D. (ELECTRONICS)','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('PHD','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('Phd.','Doctor of Philosophy');
insert into tmp_mgr_qualifications values ('PHYSIOTHERAPIST','Bachelor of Physiotherapy');
insert into tmp_mgr_qualifications values ('PRE ARTS','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('PRE PTC','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('PRE.ARTS, S.I.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('PRI SCI.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('PRI.COMMERCE','Bachelor of Science');
insert into tmp_mgr_qualifications values ('PRIMARY','5th');
insert into tmp_mgr_qualifications values ('PRIMARY EDUCATION','5th');
insert into tmp_mgr_qualifications values ('PTC','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('PTC B.A.','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('PTC BCOM','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('PTC, B.A','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('PTC, B.A, M.A','Master of Arts');
insert into tmp_mgr_qualifications values ('PTC,BA','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('PUTERIAL DESIGN',NULL);
insert into tmp_mgr_qualifications values ('RD',NULL);
insert into tmp_mgr_qualifications values ('REQUIED',NULL);
insert into tmp_mgr_qualifications values ('RNRM & DILOMA IN NURSING EDUCATION','');
insert into tmp_mgr_qualifications values ('S S C','10th');
insert into tmp_mgr_qualifications values ('S Y B COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S Y BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S. Y. B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.N.P.T.C.',NULL);
insert into tmp_mgr_qualifications values ('S.S..C','10th');
insert into tmp_mgr_qualifications values ('S.S.C','10th');
insert into tmp_mgr_qualifications values ('S.S.C  C.P E.D','10th');
insert into tmp_mgr_qualifications values ('S.S.C  C.P Ed.','10th');
insert into tmp_mgr_qualifications values ('S.S.C  P.T.C','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C  PTC','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C (OLD)','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C , PTC','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C / P.T.C','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C I.T.I','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C ITI- WIREMAN','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C Old','10th');
insert into tmp_mgr_qualifications values ('S.S.C P.T.C','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C P.T.C.','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C PASS','10th');
insert into tmp_mgr_qualifications values ('S.S.C PTC','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C, C.P.ED','10th');
insert into tmp_mgr_qualifications values ('S.S.C, I.T.I.','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C, ITI','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C, ITI ELE','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C, ITI ELECTICIAN','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C, ITI ELECTRICIAN','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C, ITI TURNER','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C, P.T.C','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C, PTC','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C, T.T.N.C','10th');
insert into tmp_mgr_qualifications values ('S.S.C,FASHION DESIGNING','10th');
insert into tmp_mgr_qualifications values ('S.S.C,I.T.I','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C,ITI ELECTRONICS','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C,P.T.C','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C. & C.P.ED.','10th');
insert into tmp_mgr_qualifications values ('S.S.C. & I.T.I.,ELECTRICIAN','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C. (OLD)','10th');
insert into tmp_mgr_qualifications values ('S.S.C. I.T.I.','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C. P.T.C.','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C. PASS','10th');
insert into tmp_mgr_qualifications values ('S.S.C. PTC','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C.(OLD)','10th');
insert into tmp_mgr_qualifications values ('S.S.C., I.T.I.','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C., ITI [ELECRIC]','');
insert into tmp_mgr_qualifications values ('S.S.C., P.T.C.','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C.,L.S.W.D.','10th');
insert into tmp_mgr_qualifications values ('S.S.C.,LITC','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C.,P.T.C.','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C.AND ITI','I.T.I.');
insert into tmp_mgr_qualifications values ('S.S.C.P.T.C','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C.P.T.C.','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('S.S.C.S','10th');
insert into tmp_mgr_qualifications values ('S.S.S','10th');
insert into tmp_mgr_qualifications values ('S.S.SC','10th');
insert into tmp_mgr_qualifications values ('S.SC','10th');
insert into tmp_mgr_qualifications values ('S.Y','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y - B.C.A','');
insert into tmp_mgr_qualifications values ('S.Y B. COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y B.A','');
insert into tmp_mgr_qualifications values ('S.Y B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y BA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('S.Y BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y SCI','Bachelor of Science');
insert into tmp_mgr_qualifications values ('S.Y.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y. B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('S.Y. B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y. B.Com.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y. BA','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y. BSC PTC','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('S.Y. ELECTRICAL','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('S.Y. RUNNING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.B COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.B. COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.B.A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('S.Y.B.A CONT','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('S.Y.B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('S.Y.B.B.A','B.B.A.');
insert into tmp_mgr_qualifications values ('S.Y.B.C.A','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('S.Y.B.CM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.B.COM CONT.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.B.COM RUNNING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.B.Com.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.B.SC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('S.Y.B.Sc.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('S.Y.B.SC.(MICROBIOLOGY)','Bachelor of Science');
insert into tmp_mgr_qualifications values ('S.Y.B.TECH.','Bachelor of Technology');
insert into tmp_mgr_qualifications values ('S.Y.BA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('S.Y.BCA CONTI.','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('S.Y.BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.BCOM PURSUE','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.BCOM.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.BOM.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('S.Y.BSC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('S.Y.BSC RUNNING','Bachelor of Science');
insert into tmp_mgr_qualifications values ('S.Y.BSC.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('S.Y.C.S.','Bachelor of Computer Science');
insert into tmp_mgr_qualifications values ('S.Y.COM','Bachelor of Computer Science');
insert into tmp_mgr_qualifications values ('S.Y.IT','Bachelor of Computer Science');
insert into tmp_mgr_qualifications values ('S.YBCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('SECOND YEAR B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('SSC','10th');
insert into tmp_mgr_qualifications values ('SSC     PTC','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('SSC & ITI WIRE MAN','');
insert into tmp_mgr_qualifications values ('SSC [ P T C ]','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('SSC AGRI. DIPLOMA','');
insert into tmp_mgr_qualifications values ('SSC ITI','I.T.I.');
insert into tmp_mgr_qualifications values ('SSC MECH. FITTER','10th');
insert into tmp_mgr_qualifications values ('SSC OLD','10th');
insert into tmp_mgr_qualifications values ('SSC PASS','10th');
insert into tmp_mgr_qualifications values ('SSC PTC','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('SSC WITH IIT','Diploma');
insert into tmp_mgr_qualifications values ('SSC(P T C)','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('SSC, ITI','I.T.I.');
insert into tmp_mgr_qualifications values ('SSC, P.T.C','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('SSC,FHW','10th');
insert into tmp_mgr_qualifications values ('SSC,ITI','I.T.I.');
insert into tmp_mgr_qualifications values ('SSC,P.T.C','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('SSC,PTC','Primary Teaching Certificate');
insert into tmp_mgr_qualifications values ('STD -6','6th');
insert into tmp_mgr_qualifications values ('STD 10','10th');
insert into tmp_mgr_qualifications values ('STD 12 TH','12th');
insert into tmp_mgr_qualifications values ('STD 3','3rd');
insert into tmp_mgr_qualifications values ('STD 5TH','5th');
insert into tmp_mgr_qualifications values ('STD 7','7th');
insert into tmp_mgr_qualifications values ('STD 9','9th');
insert into tmp_mgr_qualifications values ('STD-9','9th');
insert into tmp_mgr_qualifications values ('SUNI',NULL);
insert into tmp_mgr_qualifications values ('SY','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('SY B COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('SY B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('SY B.COM.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('SY BA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('SY BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('SY BSC','Bachelor of SCience');
insert into tmp_mgr_qualifications values ('SY.B.COM.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('SYBA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('SYBCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('SYBCOM.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T .Y B. A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('T Y B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T. Y. B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('T.C.W.C.G',NULL);
insert into tmp_mgr_qualifications values ('T.T.N.C.',NULL);
insert into tmp_mgr_qualifications values ('T.Y B.A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('T.Y B.BPE',NULL);
insert into tmp_mgr_qualifications values ('T.Y B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y BA CONTINUE','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('T.Y BCA','');
insert into tmp_mgr_qualifications values ('T.Y BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y. B.A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('T.Y. B.A.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('T.Y. B.C.A','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('T.Y. B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y. B.COM CONT.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y. B.E RUNNING','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('T.Y. B.SC.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('T.Y. BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.B.A','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('T.Y.B.A.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.B.B.A.','B.B.A.');
insert into tmp_mgr_qualifications values ('T.Y.B.C.A','Bachelor of Computer Applications');
insert into tmp_mgr_qualifications values ('T.Y.B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.B.COM & C.A.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.B.COM CONTINUE','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.B.COM(CONTI)','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.B.Com.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.B.COM/C.A.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.B.R.S.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.B.S.C CONTI.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('T.Y.B.SC','Bachelor of Science');
insert into tmp_mgr_qualifications values ('T.Y.B.Sc.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('T.Y.B.SC.(CHEMESTRY)','Bachelor of Science');
insert into tmp_mgr_qualifications values ('T.Y.BA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('T.Y.BA.','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('T.Y.BA. BED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('T.Y.BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.BCOM (RUNING)','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.BCOM,C.A','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.BOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.BSC(BIO TECH)','Bachelor of Science');
insert into tmp_mgr_qualifications values ('T.Y.BSC.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('T.Y.DRS','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('T.Y.ENGG','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('T.Y.MSC IT','Master of Science');
insert into tmp_mgr_qualifications values ('TEACHER','Bachelor of Education');
insert into tmp_mgr_qualifications values ('TECHNICAL','Bachelor of Computer Science');
insert into tmp_mgr_qualifications values ('TEXTILE ENGG.','Bachelor of Engg.');
insert into tmp_mgr_qualifications values ('THIRD YEAR B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('TY B.COM.','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('TY B.SC.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('TY BA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('TY BCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('TY BCOM RUNNING','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('TY. B.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('TYB.COM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('TYBA','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('TYBCOM','Bachelor of Commerce');
insert into tmp_mgr_qualifications values ('TYBPE',NULL);
insert into tmp_mgr_qualifications values ('V',NULL);
insert into tmp_mgr_qualifications values ('VATARERNY DR.','Bachelor of Veterinary Science');
insert into tmp_mgr_qualifications values ('VET. DOCTOR','Bachelor of Veterinary Science');
insert into tmp_mgr_qualifications values ('VETARNARY DOCTOR','Bachelor of Veterinary Science');
insert into tmp_mgr_qualifications values ('VETENARY DOCTOR','Bachelor of Veterinary Science');
insert into tmp_mgr_qualifications values ('VII','7th');
insert into tmp_mgr_qualifications values ('VIII','8th');
insert into tmp_mgr_qualifications values ('WIRE MAN ITI','I.T.I.');
insert into tmp_mgr_qualifications values ('WIRE MAN ITI(ELECTRICAL)','I.T.I.');
insert into tmp_mgr_qualifications values ('WIREMAN','I.T.I.');
insert into tmp_mgr_qualifications values ('X','10th');
insert into tmp_mgr_qualifications values ('XI','11th');
insert into tmp_mgr_qualifications values ('XII','12th');
insert into tmp_mgr_qualifications values ('10TH','10th');
insert into tmp_mgr_qualifications values ('11TH','11th');
insert into tmp_mgr_qualifications values ('12TH','12th');
insert into tmp_mgr_qualifications values ('12TH SCIENCE','12th');
insert into tmp_mgr_qualifications values ('1ST','1st');
insert into tmp_mgr_qualifications values ('2ND','2nd');
insert into tmp_mgr_qualifications values ('3RD','3rd');
insert into tmp_mgr_qualifications values ('4TH','4th');
insert into tmp_mgr_qualifications values ('5TH','5th');
insert into tmp_mgr_qualifications values ('6TH','6th');
insert into tmp_mgr_qualifications values ('6TH  PASS','6th');
insert into tmp_mgr_qualifications values ('7tH','7th');
insert into tmp_mgr_qualifications values ('7TH PASS','7th');
insert into tmp_mgr_qualifications values ('8TH','8th');
insert into tmp_mgr_qualifications values ('9TH','9th');
insert into tmp_mgr_qualifications values ('B.A B. ED','Bachelor of Arts');
insert into tmp_mgr_qualifications values ('B.A.M.S.','B.A.M.S.');
insert into tmp_mgr_qualifications values ('B.B.A.','B.B.A.');
insert into tmp_mgr_qualifications values ('B.SC B.ED.','Bachelor of Science');
insert into tmp_mgr_qualifications values ('DIP. ELECTRIONICS ENG.','Diploma');
insert into tmp_mgr_qualifications values ('DIP. IN CIVIL ENGG.','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA','Diploma');
insert into tmp_mgr_qualifications values ('DIPLOMA IN ELECTRICAL','Diploma');
insert into tmp_mgr_qualifications values ('GRADUATE','Graduate');
insert into tmp_mgr_qualifications values ('I.T.I.','I.T.I.');
insert into tmp_mgr_qualifications values ('ILLITERATE',NULL);
insert into tmp_mgr_qualifications values ('M.B.A.','M.B.A.');
insert into tmp_mgr_qualifications values ('MATRICULATION','10th');
insert into tmp_mgr_qualifications values ('S.S.C.','10th');
insert into tmp_mgr_qualifications values ('UNDER GRADUATE','Under Graduate');
insert into tmp_mgr_qualifications values ('B.H.M.S.','B.H.M.S.');

select @cnt1 = COUNT(distinct qualification) from sms..sewadars 
where qualification not in (select sms_qualification_nm from tmp_mgr_qualifications);

IF (@cnt1 > 0)
RAISERROR ('Not all qualifications are mapped, check data grid', 16,1);

select distinct qualification from sms..sewadars 
where qualification not in (select sms_qualification_nm from tmp_mgr_qualifications);

-- ====================================================================================================
--	Dept Sub Dept mapping
-- ====================================================================================================


IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_dept_sub_dept_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_dept_sub_dept_mapping;

CREATE TABLE tmp_mgr_dept_sub_dept_mapping
(
	sms_dept_name VARCHAR (20),
	sms_sub_dept_name varchar(20),
	zsm_dept_name VARCHAR (20),
	zsm_sub_dept_name varchar(20)
);

insert into tmp_mgr_dept_sub_dept_mapping values ('Garden',null, 'Horticulture',null);
insert into tmp_mgr_dept_sub_dept_mapping values ('General Store',null, 'Sewa Samiti','Stores');
insert into tmp_mgr_dept_sub_dept_mapping values ('TAC',null, 'Sound & TV',null);

insert into tmp_mgr_dept_sub_dept_mapping values ('Accounts', NULL, 'Administration','Office');
insert into tmp_mgr_dept_sub_dept_mapping values ('Administration','Secretary', 'Administration','Office - Secretary');
insert into tmp_mgr_dept_sub_dept_mapping values ('Area Secretary', NULL, 'Administration', NULL);
insert into tmp_mgr_dept_sub_dept_mapping values ('Canteen','Coupon', 'Canteen','Coupons');
insert into tmp_mgr_dept_sub_dept_mapping values ('Canteen','Jatha 01', 'Canteen','Jatha 11');
insert into tmp_mgr_dept_sub_dept_mapping values ('Canteen','Jatha 02', 'Canteen','Jatha 12');
insert into tmp_mgr_dept_sub_dept_mapping values ('Canteen','Jatha 03', 'Canteen','Jatha 13');
insert into tmp_mgr_dept_sub_dept_mapping values ('Canteen','Jatha 04', 'Canteen','Jatha 14');
insert into tmp_mgr_dept_sub_dept_mapping values ('Canteen','Jatha 05', 'Canteen','Jatha 15');
insert into tmp_mgr_dept_sub_dept_mapping values ('Canteen','Jatha 06', 'Canteen','Jatha 16');
insert into tmp_mgr_dept_sub_dept_mapping values ('Canteen','Jatha 07', 'Canteen','Jatha 17');
insert into tmp_mgr_dept_sub_dept_mapping values ('Canteen','Jatha 08', 'Canteen','Jatha 18');
insert into tmp_mgr_dept_sub_dept_mapping values ('Committee', NULL, 'Administration','Office');
insert into tmp_mgr_dept_sub_dept_mapping values ('Construction','Art Work', 'Sewa Samiti','Art Work');
insert into tmp_mgr_dept_sub_dept_mapping values ('Construction','CARPENTER', 'Construction','Carpentry');
insert into tmp_mgr_dept_sub_dept_mapping values ('Construction','Stage', 'Construction','Carpentry');
insert into tmp_mgr_dept_sub_dept_mapping values ('Construction','Water Management', 'Construction','Plumbing');
insert into tmp_mgr_dept_sub_dept_mapping values ('Enquiry', NULL, 'Administration','Office');
insert into tmp_mgr_dept_sub_dept_mapping values ('Office', NULL, 'Administration','Office');
insert into tmp_mgr_dept_sub_dept_mapping values ('Pandal','Accomodation', 'Accommodation',null);
insert into tmp_mgr_dept_sub_dept_mapping values ('Safai', NULL, 'Sanitation', 'Safai');
insert into tmp_mgr_dept_sub_dept_mapping values ('Sewa Samiti','Office', 'Sewa Samiti',null);
insert into tmp_mgr_dept_sub_dept_mapping values ('Traffic','Bus Sewa', 'Traffic',null);
insert into tmp_mgr_dept_sub_dept_mapping values ('Traffic','Parking', 'Traffic',null);

SELECT	@cnt1 = COUNT(*)
FROM	tmp_mgr_dept_sub_dept_mapping;

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_dsd_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_dsd_mapping;

CREATE TABLE tmp_mgr_dsd_mapping
(
	sms_dept_id		VARCHAR (20),
	sms_sub_dept_id		VARCHAR (20),
	zsm_dept_id		INT,
	zsm_sub_dept_id		INT
);

INSERT INTO tmp_mgr_dsd_mapping
	SELECT	sd.department_id, ssd.sub_department_id, zd.department_id, zsd.sub_department_id	--, *
	FROM	tmp_mgr_dept_sub_dept_mapping	m
		LEFT JOIN	SMS..departments	sd
			ON	(	sd.department_nm = m.sms_dept_name	)
		LEFT JOIN	SMS..sub_departments	ssd
			ON	(	ssd.department_id	=	sd.department_id
				AND	ssd.sub_department_nm = m.sms_sub_dept_name
				)
		LEFT JOIN	ZSM..departments	zd
			ON	(	zd.department_nm = m.zsm_dept_name	)
		LEFT JOIN	ZSM..sub_departments	zsd
			ON	(	zsd.department_id	=	zd.department_id
				AND	zsd.sub_department_nm = m.zsm_sub_dept_name
				);
SET @cnt2 = @@ROWCOUNT;

IF (@cnt1 != @cnt2)
	RAISERROR ('Could not map all the Departments/Sub-Departments (%d); only %d could be mapped', 16, 1, @cnt1, @cnt2);

-- ====================================================================================================
--	Specialisations mapping
-- ====================================================================================================

DECLARE @specialisations	TABLE
(
	sms_name VARCHAR (40) PRIMARY KEY,
	cdb_name varchar(40)
);

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_specialisations' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_specialisations;

CREATE TABLE tmp_mgr_specialisations
(
	sms_id VARCHAR (40),
	cdb_id INT
);

insert into @specialisations values ('AIRCONDITIONING MECHANIC','Aircondition Mech.');
insert into @specialisations values ('Auditing Excise Department','Audit Excise Dept.');
insert into @specialisations values ('BARBAR','Barber');
insert into @specialisations values ('Confectionary','Confectionery');
insert into @specialisations values ('DRESS DESIGHNER','Dress Designer');
insert into @specialisations values ('FAST FOOD','Hotel / Restaurant');
insert into @specialisations values ('HEALTH VISITOR','Health Department');
insert into @specialisations values ('Laundary','Laundry');
insert into @specialisations values ('LECTURER','Professor');
insert into @specialisations values ('MACHINERY MANUFACTURER','Machine Mfg.');
insert into @specialisations values ('Maintainance','Maintenance');
insert into @specialisations values ('Medical and Disposable Equip','Med.& Disposbl Equip ');
insert into @specialisations values ('MEDICIAN SUPPLIER','Medicines Supplier');
insert into @specialisations values ('PROVISION STORE','Grocery Shop');
insert into @specialisations values ('Security Gaurd','Security Guard');
insert into @specialisations values ('Stationary Shop','Stationery Shop');
insert into @specialisations values ('VEGETABLE OR FLOWER VENDOR','Vegetable Vendor');
insert into @specialisations values ('WIREMAN','Electrician');


INSERT INTO tmp_mgr_specialisations
	SELECT	a.specialisation_id, k.skill_id
	FROM	@specialisations s
		LEFT JOIN cdb..skills	k
			ON	(	k.skill_nm = s.cdb_name	)
		LEFT JOIN sms..specialisation_areas	a
			ON	(	a.specialisation_nm	=	sms_name	);

-- ====================================================================================================
--	Already existing Sewadars
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_exist_swds' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_exist_swds;

CREATE TABLE tmp_mgr_exist_swds
(
	sms_grno	CHAR (6)	PRIMARY KEY,
	zsm_grno	CHAR (6),
	zsm_centre		INT,
	zsm_swd_id		INT,
	active			BIT
		UNIQUE (zsm_grno, zsm_centre)
);

INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'G00190',	'M00462', 6015	)		--	Dharmendra Jayantilal Patel/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'G00641',	'G07658', 6015	)		--	Jigar Trikamlal Panchal/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'G02438',	'G06358', 6015	)		--	Rajkumar Hanikram Mitra/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'G02789',	'G03407', 6015	)		--	Mangesh Shankar Kasar/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'G02880',	'M09711', 5820	)		--	Prakash Girdharilal Awatani/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'L02852',	'F00796', 5820	)		--	Jyoti Prakash Awatani/Female
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'L02872',	'F00617', 5820	)		--	Maya Pritam Awatani/Female
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'M02055',	'G05435', 6015	)		--	Alok Rameshkumar Arora/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'M02281',	'G00029', 6015	)		--	Alpesh Bhailal Darji/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'M03179',	'G00366', 6015	)		--	Bharat Mahadev Sachanandani/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'M03499',	'G03580', 6015	)		--	Ramesh Panachand Kiri/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'F00450',	'L00395', 6015	)		--	Deepa H Barodavala/Female
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'F00454',	'L03602', 6015	)		--	Falguni H Mehta/Female
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'G01493',	'G02397', 6015	)		--	Raju/Kanu G Bhatia/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'M00045',	'G01768', 6015	)		--	Mohanlal Naraindas Paryani/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'M00014',	'M00495', 6015	)		--	Mansukh Bachar Goyani/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'M01234',	'G02328', 6015	)		--	Rajesh Mahadev Sachanandani/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'M01698',	'M00554', 6015	)		--	Janakkumar Narendra Kumar Desai/Male
INSERT INTO tmp_mgr_exist_swds	( sms_grno, zsm_grno, zsm_centre )	VALUES	(	'M00498',	'G01532', 6015	)		--	Lallu Shrikrishna Kapoor/Male

SELECT	@cnt1	=	COUNT (*)
FROM	tmp_mgr_exist_swds;

UPDATE	e
	SET	zsm_swd_id	=	r.sewadar_id,
		active		=	CASE WHEN sewadar_status_cd	IN	('Perm', 'Temp') THEN 1 ELSE 0 END
FROM	tmp_mgr_exist_swds	e
	JOIN	sewadars_registrations	r
		ON	(	r.satsang_centre_id	=	e.zsm_centre
			AND	r.sewadar_grno		=	e.zsm_grno
			)

SELECT	*
FROM	tmp_mgr_exist_swds	t
	JOIN	sms..sewadars	s
		ON	(	s.sewadar_id	=	t.sms_grno	)
WHERE	status	NOT IN	(	'Temporary', 'Permanent'	)
OR	(	status	=	'Retired'
	AND	is_eligible_for_prashaad = 'No'
	)

DELETE	t
FROM	tmp_mgr_exist_swds	t
	JOIN	sms..sewadars	s
		ON	(	s.sewadar_id	=	t.sms_grno	)
WHERE	status	NOT IN	(	'Temporary', 'Permanent'	)
OR	(	status	=	'Retired'
	AND	is_eligible_for_prashaad = 'No'
	)

SELECT *
FROM	tmp_mgr_exist_swds

-- ====================================================================================================
--	Post Offices mapping
-- ====================================================================================================

DECLARE @po_mapping TABLE
(
	country_id VARCHAR (10),
	state_id VARCHAR (10),
	district_id VARCHAR (10),
	po_or_city_id VARCHAR (10),
	po_or_city_nm VARCHAR (50),
	zsm_po_nm		VARCHAR (50),
	zsm_district_nm	VARCHAR (50)		--- specified if it is different and does not map with SMS
);

INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'AIR', 'Airport', 'Ahmedabad', NULL                 );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'CHL', 'CHANDLODIYA', 'CHANDLODIA', NULL            );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'G', 'G.P.O.', 'Ahmedabad', NULL                  );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'GAN', 'Gandhinagar', 'Gandhi Nagar', 'Gandhi Nagar');
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'GAN', 'GN', 'Gandhinagar', 'Gandhi Nagar', 'Gandhi Nagar');
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'CH', 'Chandkheda', 'Chandkheda', 'Gandhi Nagar');
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'KUB', 'KUBERNAGAR', 'KUBER NAGAR', NULL            );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'M', 'MANINAGAR', 'Mani Nagar (E)', NULL          );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'NAVR', 'Navrangpura', 'Navrang Pura', NULL          );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'SAR', 'SARDARNAGAR', 'SARDAR NAGAR', NULL          );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'SAT', 'SATELITE', 'Ahmedabad', NULL                );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'SH', 'SHAHIBAUG', 'Saibaug', NULL                 );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'AHD', 'TH', 'THAKARBAPANAGAR', 'Thackar Bapa Nagar', NULL);
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'B', 'BHO', 'HEAD OFFICE BHARUCH', 'BHARUCH', NULL       );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'DA', 'AP', 'ANOPPURA', 'DAHOD', NULL                    );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'DA', 'BD', 'BHANDOI', 'DAHOD', NULL                     );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'DA', 'BT', 'BHITODI', 'DAHOD', NULL                     );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'DA', 'DU', 'DUDHIYA', 'DUDHIA', NULL                    );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'DA', 'JD', 'JALIAPADA', 'DAHOD', NULL                   );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'GAN', 'DE', 'DEDIYAPADA', 'Anodia', 'Gandhi Nagar'      );

INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'KUT', 'GAN', 'GANDHIDHAM', 'GANDHI DHAM', 'Kachchh'   );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'M', 'SI', 'SIDDHPUR', 'SIDDHPUR', 'Patan'          );

INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'ND', 'AD', 'Anand', 'Anand', 'Anand'          );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'ND', 'NA', 'Nadiad', 'Nadiad', 'Kheda'          );

INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'NAV', 'BI', 'BILLIMORA', 'BILIMORA', NULL          );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'NAV', 'NHO', 'NAVSARI HEAD OFFICE', 'NAVSARI', NULL          );

INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'RAJ', 'RH', 'RAJKOT H.O.', 'RAJKOT', NULL           );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'ST', 'SHD', 'HEAD OFFICE', 'SURAT', NULL            );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'ST', 'JAL', 'JALALPOR', 'JALALPORE', 'NAVSARI'      );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'NAV', 'JAL', 'JALALPOR', 'JALALPORE', NULL	        );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'ST', 'MR', 'MAROLI BAZAR', 'MAROLI BAZAR', 'NAVSARI');
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'ST', 'SO', 'SONGADH', 'SONGADH', 'TAPI'             );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'ST', 'UD', 'UDHNA', 'UDHANA', NULL                  );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'ST', 'VAR', 'VARACHHA', 'VARACHHA ROAD', NULL       );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'VA', 'BL', 'BABALIA(P)-2', 'Babaliya', 'Mahisagar'  );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'VA', 'FOR', 'FORT AREA', 'VADODARA', NULL           );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'VA', 'HA', 'HARNI', 'HARNI ROAD', NULL              );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'VA', 'VHO', 'VADODARA H.O.', 'VADODARA', NULL       );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'VA', 'WAR', 'WARSHIA', 'Warasia', NULL              );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'VAL', 'VHO', 'VALSAD H.O.', 'VALSAD', NULL          );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'VAL', 'MO', 'MOHANA KAUCHALI', 'VALSAD', NULL          );
INSERT INTO @po_mapping	VALUES ( 'IND', 'GUJ', 'VAL', 'CH', 'CHIKHLI', 'VALSAD', NULL          );

--INSERT INTO @po_mapping	VALUES ( );

SELECT	@cnt1 = COUNT(*)
FROM	@po_mapping;

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_po_mapping' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_po_mapping;

CREATE TABLE tmp_mgr_po_mapping
(
	country_id VARCHAR (10),
	state_id VARCHAR (10),
	district_id VARCHAR (10),
	po_or_city_id VARCHAR (10),
	zsm_post_office_or_city_id INT
);

INSERT INTO tmp_mgr_po_mapping
	SELECT	x.country_id, x.state_id, x.district_id, x.po_or_city_id, po.post_office_or_city_id
	FROM @po_mapping	x
		JOIN SMS..pos_or_cities	p ON p.state_id = x.state_id AND p.country_id = x.country_id AND p.district_id = x.district_id AND p.po_or_city_id = x.po_or_city_id AND p.po_or_city_nm = x.po_or_city_nm
		JOIN SMS..districts d ON p.state_id = d.state_id AND p.country_id = d.country_id AND p.district_id = d.district_id
		JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id JOIN SMS..countries c ON c.country_id = d.country_id
		JOIN CDB..countries cc ON cc.country_nm = c.country_nm JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
		JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = COALESCE (x.zsm_district_nm, d.district_nm)
		JOIN post_offices_or_cities po ON cd.district_or_city_id = po.district_id AND po.post_office_or_city_nm = x.zsm_po_nm;
SET @cnt2 = @@ROWCOUNT
IF (@cnt1 != @cnt2)
BEGIN
	RAISERROR ('Error in Post Offices mapping; instead of %d post offices, only %d are mapped', 16, 1, @cnt1, @cnt2);
	SELECT	x.country_id, x.state_id, x.district_id, x.po_or_city_id, po.post_office_or_city_id, *
	FROM @po_mapping	x
		LEFT JOIN SMS..pos_or_cities	p ON p.state_id = x.state_id AND p.country_id = x.country_id AND p.district_id = x.district_id AND p.po_or_city_id = x.po_or_city_id AND p.po_or_city_nm = x.po_or_city_nm
		LEFT JOIN SMS..districts d ON p.state_id = d.state_id AND p.country_id = d.country_id AND p.district_id = d.district_id
		LEFT JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id JOIN SMS..countries c ON c.country_id = d.country_id
		LEFT JOIN CDB..countries cc ON cc.country_nm = c.country_nm JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = s.state_nm
		LEFT JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = COALESCE (x.zsm_district_nm, d.district_nm)
		LEFT JOIN post_offices_or_cities po ON cd.district_or_city_id = po.district_id AND po.post_office_or_city_nm = x.zsm_po_nm
--	WHERE	po.district_id IS NULL;
END
PRINT '.... districts mapping complete'

