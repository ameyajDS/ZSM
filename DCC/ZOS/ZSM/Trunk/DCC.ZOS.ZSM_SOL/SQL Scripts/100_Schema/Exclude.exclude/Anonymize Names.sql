--select * from sewadars_badges

UPDATE s 
SET first_nm		=	SUBSTRING (first_nm, LEN(first_nm) -1, 2) 
							+ CASE CONVERT (int, SUBSTRING (convert(varchar, (RAND (sewadar_id))), 3, 2)) % 5 WHEN 0 THEN 'A' WHEN 1 THEN 'E' WHEN 2 THEN 'I' WHEN 3 THEN 'O' WHEN 4 THEN 'U' ELSE 'X' END
							+ SUBSTRING(first_nm, LEN(first_nm) -3, 2) 
							+ CASE CONVERT (int, SUBSTRING (convert(varchar, (RAND (txn_ts))), 3, 2)) % 5 WHEN 0 THEN 'A' WHEN 1 THEN 'E' WHEN 2 THEN 'I' WHEN 3 THEN 'O' WHEN 4 THEN 'U' ELSE 'X' END
							+ SUBSTRING(first_nm, 1,1),
	middle_nm		=	SUBSTRING (middle_nm, LEN(middle_nm) -1, 2) 
							+ SUBSTRING(middle_nm, LEN(middle_nm) -3, 2) 
							+ SUBSTRING(middle_nm, 1,1),
	last_nm		=	 SUBSTRING(last_nm, LEN(last_nm) -3, 2) 
							+ CASE CONVERT (int, SUBSTRING (convert(varchar, (RAND (sewadar_id))), 3, 2)) % 5 WHEN 0 THEN 'A' WHEN 1 THEN 'E' WHEN 2 THEN 'I' WHEN 3 THEN 'O' WHEN 4 THEN 'U' ELSE 'X' END
							+ SUBSTRING(last_nm, 1,1)
							+ CASE CONVERT (int, SUBSTRING (convert(varchar, (RAND (txn_ts))), 3, 2)) % 5 WHEN 0 THEN 'A' WHEN 1 THEN 'E' WHEN 2 THEN 'I' WHEN 3 THEN 'O' WHEN 4 THEN 'U' ELSE 'X' END
							+ SUBSTRING (last_nm, LEN(last_nm) -1, 2),
	birth_dtm		= s.birth_dtm + CONVERT (int, SUBSTRING (convert(varchar, (RAND (sewadar_id))), 3, 2)),
	initiation_dt	= s.initiation_dt + 5
FROM sewadars s

UPDATE sd
SET telephone_mobile	= SUBSTRING(sd.telephone_mobile, 1, 5),
	telephone_residence = SUBSTRING(sd.telephone_residence, 1, 4),
	telephone_office	= SUBSTRING(sd.telephone_office, 1, 4)
FROM sewadars_details sd

UPDATE sa
SET address_line_1 = 'Address Line 1 of ' + CONVERT(VARCHAR, sa.sewadar_id),
	address_line_2 = CASE WHEN address_line_2 IS NOT NULL THEN 'Address Line 2 of ' + CONVERT(VARCHAR, sa.sewadar_id) END
FROM sewadars_addresses sa

UPDATE sr
SET remarks = CONVERT(VARCHAR, sr.sewadar_id) + SUBSTRING(sr.remarks_type, 1, 1) + CONVERT(VARCHAR, sr.remarks_sq)
FROM sewadars_remarks sr

UPDATE sr
SET --appointment_dt		= sr.appointment_dt + 9,
	--department_dt		= sr.department_dt + 9,
	--sewadar_status_dtm	= sr.sewadar_status_dtm + 9,
	--responsibility_dtm	= sr.responsibility_dtm + 9,
	reference_1_nm		= CASE WHEN sr.reference_1_nm IS NOT NULL THEN 'Reference1 Name' END,
	reference_2_nm		= CASE WHEN sr.reference_2_nm IS NOT NULL THEN 'Reference2 Name' END,
	reference_1_relationship = CASE WHEN sr.reference_1_relationship IS NOT NULL THEN 6 END,
	reference_2_relationship = CASE WHEN sr.reference_2_relationship IS NOT NULL THEN 6 END
FROM sewadars_registrations sr
--UPDATE ssc
--SET effective_dtm	= ssc.effective_dtm + 9
--FROM sewadars_status_changes ssc

--UPDATE ssc
--SET effective_dtm	= ssc.effective_dtm + 9
--FROM sewadars_responsibility_changes ssc
