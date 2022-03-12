
BEGIN TRAN;
--ROLLBACK;
--COMMIT;

DECLARE
	@fdt	DATE	=	GETDATE(),
	@tdt	DATE	=	'31 Dec 9999',
	@al		INTEGER	--	audit_log_id

DELETE
FROM	imp_pincodes
WHERE	officename LIKE 'test%office';

DROP TABLE	IF EXISTS base_pincodes;

SELECT	DISTINCT	l2.level_1_address_component_id, l2.level_1_address_component_id_display, l2.level_2_address_component_id, l2.level_2_address_component_nm, replace (OfficeName, '"', '') as OfficeName, 
		replace (OfficeName, '"', '') as CleanOfficeName, p.pincode
	INTO	base_pincodes
FROM	imp_pincodes	p
	JOIN	CDB..view_level_2_address_components	l2
		ON	(	l2.country_id	=	1
			AND getdate() BETWEEN L2.effective_from AND l2.effective_till
			AND ( level_1_address_component_id_display = statename OR (level_1_address_component_id_display = 'JAMMU & KASHMIR' AND statename = 'JAMMU and KASHMIR')
							OR (level_1_address_component_id_display = 'Dadra and Nagar Haveli and Daman and Diu' AND statename = 'THE DADRA AND NAGAR HAVELI AND DAMAN AND DIU')
				)
			AND (	level_2_address_component_nm = replace (district, '.', ' ') OR (level_1_address_component_id_display = 'delhi' AND district + ' ' + statename = level_2_address_component_nm )
				OR (level_1_address_component_id_display = 'ANDAMAN AND NICOBAR ISLANDS' AND district= level_2_address_component_nm + 's'  )
				OR (level_1_address_component_id_display = 'ANDHRA PRADESH' AND district + 'amu' = level_2_address_component_nm  ) 
				OR (level_1_address_component_id_display = 'ANDHRA PRADESH' AND REPLACE (district, 'spsr ', 'sps ') = level_2_address_component_nm  )
				OR (level_1_address_component_id_display = 'ANDHRA PRADESH' AND REPLACE (district, 'patanam', 'patnam') = level_2_address_component_nm  )
				OR (level_1_address_component_id_display = 'ANDHRA PRADESH' AND REPLACE (district, '.', '') = level_2_address_component_nm  )
				OR (level_1_address_component_id_display = 'Arunachal PRADESH' AND REPLACE (district, 'leparada', 'lepa rada') = level_2_address_component_nm  )
				OR (level_1_address_component_id_display = 'Arunachal PRADESH' AND REPLACE (district, ' ', '-') = level_2_address_component_nm  )
				OR (level_1_address_component_id_display = 'Assam' AND district + ' rural' = level_2_address_component_nm  )
				OR (level_1_address_component_id_display = 'Assam' AND district + 'politan' = level_2_address_component_nm  )
				OR (level_1_address_component_id_display = 'Assam' AND 'east ' + district = level_2_address_component_nm  )						
				OR (level_1_address_component_id_display = 'Assam' AND district = 'MARIGAON' AND level_2_address_component_nm  = 'MORIGAON')
				OR (level_1_address_component_id_display = 'Assam' AND district = 'SOUTH SALMARA MANCACHAR' AND level_2_address_component_nm  = 'South Salmara-Mankachar')
				OR (level_1_address_component_id_display = 'Bihar' AND replace (district, 'Pashchim', 'West') = level_2_address_component_nm)
				OR (level_1_address_component_id_display = 'Bihar' AND replace (district, 'pURBI', 'East') = level_2_address_component_nm)
				OR (level_1_address_component_id_display = 'Bihar' AND replace (district, ' (Bhabua)', '') = level_2_address_component_nm)
				OR (level_1_address_component_id_display = 'Bihar' AND district = 'PURNIA' AND level_2_address_component_nm  = 'PURNeA')
				OR (level_1_address_component_id_display = 'CHHATTISGARH' AND district = 'GARIYABAND' AND level_2_address_component_nm  = 'GARIABAND')
				OR (level_1_address_component_id_display = 'CHHATTISGARH' AND district = 'Gaurella Pendra Marwahi' AND level_2_address_component_nm  = 'Gaurella-Pendra-Marwahi')
				OR (level_1_address_component_id_display = 'CHHATTISGARH' AND district = 'KOREA' AND level_2_address_component_nm  = 'KORiyA')
				OR (level_1_address_component_id_display = 'GUJARAT' AND district = 'AHMADABAD' AND level_2_address_component_nm  = 'AHMEDABAD')
				OR (level_1_address_component_id_display = 'GUJARAT' AND district = 'ARVALLI' AND level_2_address_component_nm  = 'Aravalli')
				OR (level_1_address_component_id_display = 'GUJARAT' AND district = 'BANAS KANTHA' AND level_2_address_component_nm  = 'BANASKANTHA')
				OR (level_1_address_component_id_display = 'GUJARAT' AND district = 'CHHOTAUDEPUR' AND level_2_address_component_nm  = 'Chhota Udaipur')
				OR (level_1_address_component_id_display = 'GUJARAT' AND district = 'DOHAD' AND level_2_address_component_nm  = 'DAHOD')
				OR (level_1_address_component_id_display = 'GUJARAT' AND district = 'GANDHINAGAR' AND level_2_address_component_nm  = 'GANDHI NAGAR')
				OR (level_1_address_component_id_display = 'GUJARAT' AND district = 'PANCH MAHALS' AND level_2_address_component_nm  = 'PANCHMAHAL')
				OR (level_1_address_component_id_display = 'GUJARAT' AND district = 'SABAR KANTHA' AND level_2_address_component_nm  = 'SABARKANTHA')
				OR (level_1_address_component_id_display = 'HARYANA' AND district = 'CHARKI DADRI' AND level_2_address_component_nm  = 'Charkhi Dadri')
				OR (level_1_address_component_id_display = 'HIMACHAL PRADESH' AND district = 'LAHUL AND SPITI' AND level_2_address_component_nm  = 'LAHAUL AND SPITI')
				OR (level_1_address_component_id_display = 'JHARKHAND' AND district = 'DEOGHAR' AND level_2_address_component_nm  = 'DEOGARH')
				OR (level_1_address_component_id_display = 'JHARKHAND' AND district = 'EAST SINGHBUM' AND level_2_address_component_nm  = 'PURBI SINGHBHUM')
				OR (level_1_address_component_id_display = 'JHARKHAND' AND district = 'KODERMA' AND level_2_address_component_nm  = 'KODARMA')
				OR (level_1_address_component_id_display = 'JHARKHAND' AND district = 'SAHEBGANJ' AND level_2_address_component_nm  = 'SAHIBGANJ')
				OR (level_1_address_component_id_display = 'JHARKHAND' AND district = 'SARAIKELA KHARSAWAN' AND level_2_address_component_nm  = 'SERAIKELA KHARSWAN')
				OR (level_1_address_component_id_display = 'JHARKHAND' AND district = 'WEST SINGHBHUM' AND level_2_address_component_nm  = 'PASCHIMI SINGHBHUM')
				OR (level_1_address_component_id_display = 'KARNATAKA' AND district = 'BAGALKOTE' AND level_2_address_component_nm  = 'Bagalkot')
				OR (level_1_address_component_id_display = 'KARNATAKA' AND district = 'BENGALURU URBAN' AND level_2_address_component_nm  = 'Bengaluru')
				OR (level_1_address_component_id_display = 'KARNATAKA' AND district = 'CHAMARAJANAGARA' AND level_2_address_component_nm  = 'Chamarajanagar')
				OR (level_1_address_component_id_display = 'KARNATAKA' AND district = 'DAVANGERE' AND level_2_address_component_nm  = 'Davanagere')
				OR (level_1_address_component_id_display = 'KARNATAKA' AND district = 'YADGIR' AND level_2_address_component_nm  = 'Yadagiri')
				OR (level_1_address_component_id_display = 'LADAKH' AND district = 'LEH LADAKH' AND level_2_address_component_nm  = 'leh')
				OR (level_1_address_component_id_display = 'LAKSHADWEEP' AND district = 'LAKSHADWEEP DISTRICT' AND level_2_address_component_nm  = 'LAKSHADWEEP')
				OR (level_1_address_component_id_display = 'MADHYA PRADESH' AND district = 'AGAR MALWA' AND level_2_address_component_nm  = 'AGAR-MALWA')
				OR (level_1_address_component_id_display = 'MADHYA PRADESH' AND district = 'ASHOKNAGAR' AND level_2_address_component_nm  = 'ASHOK NAGAR')
				OR (level_1_address_component_id_display = 'MADHYA PRADESH' AND district = 'EAST NIMAR' AND level_2_address_component_nm  = 'KHANDWA')
				OR (level_1_address_component_id_display = 'MADHYA PRADESH' AND district = 'HOSHANGABAD' AND level_2_address_component_nm  = 'Narmadapuram')
				OR (level_1_address_component_id_display = 'MAHARASHTRA' AND district = 'BULDHANA' AND level_2_address_component_nm  = 'BULDANA')
				OR (level_1_address_component_id_display = 'MIZORAM' AND district = 'AIZAWL' AND level_2_address_component_nm  = 'AIZWAL')
				OR (level_1_address_component_id_display = 'odisha' AND district = 'ANUGUL' AND level_2_address_component_nm  = 'ANGUL')
				OR (level_1_address_component_id_display = 'odisha' AND district = 'BALESHWAR' AND level_2_address_component_nm  = 'BALASORE')
				OR (level_1_address_component_id_display = 'odisha' AND district = 'DEOGARH' AND level_2_address_component_nm  = 'DEBAGARH')
				OR (level_1_address_component_id_display = 'odisha' AND district = 'JAJAPUR' AND level_2_address_component_nm  = 'Jajpur')
				OR (level_1_address_component_id_display = 'odisha' AND district = 'SONEPUR' AND level_2_address_component_nm  = 'SUBARNAPUR')
				OR (level_1_address_component_id_display = 'PUDUCHERRY' AND district = 'PONDICHERRY' AND level_2_address_component_nm  = 'PUDUCHERRY')
				OR (level_1_address_component_id_display = 'PUNJAB' AND district = 'FIROZEPUR' AND level_2_address_component_nm  = 'FIROZPUR')
				OR (level_1_address_component_id_display = 'PUNJAB' AND district = 'S.A.S Nagar' AND level_2_address_component_nm  = 'Sahibzada Ajit Singh Nagar')
				OR (level_1_address_component_id_display = 'PUNJAB' AND district = 'Shahid Bhagat Singh Nagar' AND level_2_address_component_nm  = 'SHAHEED BHAGAT SINGH NAGAR')
				OR (level_1_address_component_id_display = 'RAJASTHAN' AND district = 'GANGANAGAR' AND level_2_address_component_nm  = 'SRI GANGANAGAR')
				OR (level_1_address_component_id_display = 'SIKKIM' AND replace (district, 'DISTRICT', 'SIKKIM') = level_2_address_component_nm  )
				OR (level_1_address_component_id_display = 'TAMIL NADU' AND district = 'KANNIYAKUMARI' AND level_2_address_component_nm  = 'KANYAKUMARI')
				OR (level_1_address_component_id_display = 'TAMIL NADU' AND district = 'THE NILGIRIS' AND level_2_address_component_nm  = 'NILGIRIS')
				OR (level_1_address_component_id_display = 'TAMIL NADU' AND district = 'THIRUVALLUR' AND level_2_address_component_nm  = 'TIRUVALLUR')
				OR (level_1_address_component_id_display = 'TAMIL NADU' AND district = 'THIRUVARUR' AND level_2_address_component_nm  = 'TIRUVARUR')
				OR (level_1_address_component_id_display = 'TAMIL NADU' AND district = 'Tirupathur' AND level_2_address_component_nm  = 'Tirupattur')
				OR (level_1_address_component_id_display = 'TAMIL NADU' AND district = 'TUTICORIN' AND level_2_address_component_nm  = 'Thoothukudi')
				OR (level_1_address_component_id_display = 'TAMIL NADU' AND district = 'VILLUPURAM' AND level_2_address_component_nm  = 'VILUPPURAM')
				OR (level_1_address_component_id_display = 'TELANGANA' AND district = 'JANGOAN' AND level_2_address_component_nm  = 'Jangaon')
				OR (level_1_address_component_id_display = 'TELANGANA' AND district = 'JAYASHANKAR BHUPALAPALLY' AND level_2_address_component_nm  = 'Jayashankar Bhupalpally')
				OR (level_1_address_component_id_display = 'TELANGANA' AND district = 'KUMURAM BHEEM ASIFABAD' AND level_2_address_component_nm  = 'Kumuram Bheem')
				OR (level_1_address_component_id_display = 'TELANGANA' AND district = 'MEDCHAL MALKAJGIRI' AND level_2_address_component_nm  = 'Medchal–Malkajgiri')
				OR (level_1_address_component_id_display = 'TELANGANA' AND district = 'WARANGAL RURAL' AND level_2_address_component_nm  = 'WARANGAL')
				OR (level_1_address_component_id_display = 'TELANGANA' AND district = 'WARANGAL URBAN' AND level_2_address_component_nm  = 'Hanamkonda')
				OR (level_1_address_component_id_display = 'DADRA AND NAGAR HAVELI AND DAMAN AND DIU' AND district = 'DADRA AND NAGAR HAVELI' AND level_2_address_component_nm  = 'DADRA & NAGAR HAVELI')
				OR (level_1_address_component_id_display = 'TRIPURA' AND district = 'Sepahijala' AND level_2_address_component_nm  = 'Sipahiljala')
				OR (level_1_address_component_id_display = 'UTTAR PRADESH' AND district = 'KHERI' AND level_2_address_component_nm  = 'LAKHIMPUR KHERI')
				OR (level_1_address_component_id_display = 'UTTAR PRADESH' AND district = 'MUZAFFARNAGAR' AND level_2_address_component_nm  = 'MUZAFFAR NAGAR')
				OR (level_1_address_component_id_display = 'UTTAR PRADESH' AND district = 'SANT KABEER NAGAR' AND level_2_address_component_nm  = 'SANT KABIR NAGAR')
				OR (level_1_address_component_id_display = 'UTTAR PRADESH' AND district = 'SIDDHARTH NAGAR' AND level_2_address_component_nm  = 'SIDHARTH NAGAR')
				OR (level_1_address_component_id_display = 'UTTARAKHAND' AND district = 'RUDRA PRAYAG' AND level_2_address_component_nm  = 'RUDRAPRAYAG')
				OR (level_1_address_component_id_display = 'UTTARAKHAND' AND district = 'UDAM SINGH NAGAR' AND level_2_address_component_nm  = 'UDHAM SINGH NAGAR')
				OR (level_1_address_component_id_display = 'UTTARAKHAND' AND district = 'UTTAR KASHI' AND level_2_address_component_nm  = 'UTTARKASHI')
				OR (level_1_address_component_id_display = 'WEST BENGAL' AND district = '24 PARAGANAS NORTH' AND level_2_address_component_nm  = 'NORTH 24 PARGANAS')
				OR (level_1_address_component_id_display = 'WEST BENGAL' AND district = '24 PARAGANAS SOUTH' AND level_2_address_component_nm  = 'SOUTH 24 PARGANAS')
				OR (level_1_address_component_id_display = 'WEST BENGAL' AND district = 'COOCHBEHAR' AND level_2_address_component_nm  = 'COOCH BEHAR')
				OR (level_1_address_component_id_display = 'WEST BENGAL' AND district = 'DINAJPUR DAKSHIN' AND level_2_address_component_nm  = 'DAKSHIN DINAJPUR')
				OR (level_1_address_component_id_display = 'WEST BENGAL' AND district = 'DINAJPUR UTTAR' AND level_2_address_component_nm  = 'UTTAR DINAJPUR')
				OR (level_1_address_component_id_display = 'WEST BENGAL' AND district = 'MALDAH' AND level_2_address_component_nm  = 'MALDA')
				OR (level_1_address_component_id_display = 'WEST BENGAL' AND district = 'MEDINIPUR EAST' AND level_2_address_component_nm  = 'Purba Medinipur')
				OR (level_1_address_component_id_display = 'WEST BENGAL' AND district = 'MEDINIPUR WEST' AND level_2_address_component_nm  = 'Paschim Medinipur')
				)
			);

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('%BO', officename) - 2)
WHERE	officename LIKE '%BO';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('%SO', officename) - 2)
WHERE	officename LIKE '%SO';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('%HO', officename) - 2)
WHERE	officename LIKE '%HO';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('%B.O', officename) - 2)
WHERE	officename LIKE '%B.O';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('%S.O', officename) - 2)
WHERE	officename LIKE '%S.O';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('%H.O', officename) - 2)
WHERE	officename LIKE '%H.O';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('%S.O.', officename) - 2)
WHERE	officename LIKE '%S.O.';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('%B.O.', officename) - 2)
WHERE	officename LIKE '%B.O.';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('% SO %', officename) - 1)
WHERE	officename LIKE '% SO %';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('% S.O %', officename) - 1)
WHERE	officename LIKE '% S.O %';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('% GPO', officename) - 1)
WHERE	officename LIKE '% GPO';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('% G.P.O.', officename) - 1)
WHERE	officename LIKE '% G.P.O.';

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('% B.O%', officename) - 1)
WHERE	officename LIKE '% B.O%'
AND		officename = cleanofficename;

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('% BO %', officename) - 1)
WHERE	officename LIKE '% BO %'
AND		officename = cleanofficename;

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('% [SB]. %', officename) - 1)
WHERE	officename LIKE '% [SB]. %'
AND		officename = cleanofficename;

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('% [SHB] %', officename) - 1)
WHERE	officename LIKE '% [SHB] %'
AND		officename = cleanofficename;

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('% PO', officename) - 1)
WHERE	officename LIKE '% PO'
AND		officename = cleanofficename;

UPDATE	base_pincodes
	SET	CleanOfficeName	=	SUBSTRING (officename, 1, patindex ('% [SP].O%', officename) - 1)
WHERE	officename LIKE '% [SP].O%'
AND		officename = cleanofficename;


--	====================================================================================================
--	We have pruned the input data, and now we just import the non-existing pincdoes
--	====================================================================================================

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev091', 'Setup Pincodes', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

ALTER	TABLE	pincodes	DISABLE	TRIGGER	trg_sync_pincodes_i;

INSERT	INTO	pincodes
	(	level_3_component_id, pincode_number, effective_from_dt, effective_till_dt, audit_log_id	)
	SELECT	DISTINCT	l3.level_3_address_component_id, p.pincode, @fdt, @tdt, @al
	FROM	base_pincodes p
		JOIN	level_3_address_components	l3
			ON	(	l3.level_2_address_component_id	=	p.level_2_address_component_id
				AND	l3.level_3_address_component_nm	=	cleanofficename
				AND	GETDATE() BETWEEN l3.effective_from AND l3.effective_till
				)
		LEFT JOIN	pincodes	z
			ON	(	z.pincode_number		=	p.pincode
				AND	z.level_3_component_id	=	l3.level_3_address_component_id
				)
	WHERE	z.pincode_number	IS NULL;

ALTER	TABLE	pincodes	ENABLE	TRIGGER	trg_sync_pincodes_i;

INSERT	INTO	MPB..bridge_sync_records
		(	database_nm, table_nm, operation_type, operation_dtm	)
	VALUES
		(	'CDB', 'pincodes', 'S', GetDate()	);

--	====================================================================================================
--	We have pruned the input data, and now we just import the non-existing pincdoes
--	====================================================================================================

DROP	TABLE	imp_pincodes;
DROP	TABLE	base_pincodes;

