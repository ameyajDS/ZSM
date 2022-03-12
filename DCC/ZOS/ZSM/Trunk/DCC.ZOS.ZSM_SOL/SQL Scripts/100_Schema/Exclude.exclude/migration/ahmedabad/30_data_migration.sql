Use ZSM
Go
BEGIN TRAN
--ROLLBACK
--commit

alter table sewadars_transfers
disable trigger sewadars_transfers_a_iu;

alter table sewadars_transfers
disable trigger sewadars_transfers_b_iu;

alter table sewadars_transfers
disable trigger sewadars_transfers_c_iu;

alter table sewadars_transfers
disable trigger sewadars_transfers_d_iu;

alter table sewadars_transfers
disable trigger sewadars_transfers_e_iu;

DECLARE
	@centre_id			INT,
	@ahd_dst_id			INT,
	@cnt1				INT,
	@cnt_mgr			INT,
	@cnt2				INT;
	
	SELECT @centre_id		= satsang_centre_id FROM CDB..satsang_centres WHERE satsang_centre_nm = 'AHMEDABAD-I(CHANDKHEDA)'; -- 5040

	SELECT	@ahd_dst_id	=	district_or_city_id
	FROM	CDB..countries cc
		JOIN CDB..states cs ON cs.country_id = cc.country_id AND cs.state_nm = 'Gujarat' and cc.country_nm = 'India'
		JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = 'Ahmedabad';
	
-- ====================================================================================================
--	Identifying Sewadars Mapping
-- ====================================================================================================
DECLARE
	@c_gender		varCHAR (6),
	@c_first_nm		VARCHAR (30),
	@c_last_nm		VARCHAR (30),
	@c_birth_dt	SMALLDATETIME,
	@c_status		VARCHAR (30),
	@sewadar_grno	CHAR (6)

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_mgr_sewadars' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_mgr_sewadars;

CREATE TABLE tmp_mgr_sewadars
(
	id			INT		IDENTITY (20001, 1),
	gender		VARCHAR (6),
	first_nm	VARCHAR (30),
	last_nm		VARCHAR (30),
	birth_dt	SMALLDATETIME,
	sewadar_grno	CHAR (6),
	new_grno		CHAR (6),
	status		VARCHAR (20),
	duplicate_type VARCHAR (30)
				CHECK 
				(duplicate_type IN
					(
						'Multiple Active',
						'No Duplicate'
					)
				),
	duplicate_cnt INT,
	latest_status_dt SMALLDATETIME
);

-- NS: added retired status in active statuses

INSERT INTO tmp_mgr_sewadars (gender, first_nm, last_nm, birth_dt, duplicate_type, duplicate_cnt)
	SELECT	CASE gender WHEN 'Gent' THEN 'Male' ELSE 'Female' END, LTRIM(RTRIM(first_nm)), LTRIM(RTRIM(last_nm)), birth_dt, 'No Duplicate', COUNT (*)
	FROM	sms..sewadars	s
	WHERE	(	status IN ('Temporary           ', 'Permanent           ', 'Non-Initiate        '	)
			OR	(	status =	'Retired             '	AND	is_eligible_for_prashaad	=	'Yes'	)
			)
	AND		NOT EXISTS	(	SELECT	1
							FROM	tmp_mgr_exist_swds	e
							WHERE	e.sms_grno	=	s.sewadar_id
						)
	--and sewadar_id not in 
	--('F00450', 'F00454', 'G01493', 'M00045', 'M00014', 'M01234', 'M01698', 'M00498') -- these sewadars have a record in ZSM --identified manually
	GROUP	BY	gender, LTRIM(RTRIM(first_nm)), LTRIM(RTRIM(last_nm)), birth_dt
	HAVING COUNT (*) = 1;
SET @cnt1	=	@@ROWCOUNT;

SET @cnt_mgr = @cnt1

UPDATE	t
	SET	sewadar_grno	=	s.sewadar_id,
		status			=	s.status
FROM	tmp_mgr_sewadars t
	JOIN	sms..sewadars s
		ON (t.gender = CASE s.gender WHEN 'Gent' THEN 'Male' ELSE 'Female' END and  t.first_nm = LTRIM(RTRIM(s.first_nm)) and  t.last_nm = LTRIM(RTRIM(s.last_nm)) and t. birth_dt = s. birth_dt)
	WHERE	(	s.status IN ('Temporary           ', 'Permanent           ', 'Non-Initiate        '	)
			OR	(	s.status =	'Retired             '	AND	is_eligible_for_prashaad	=	'Yes'	)
			)
SET @cnt2	=	@@ROWCOUNT;

IF (@cnt1 != @cnt2)
BEGIN
	RAISERROR ('Count of records of Sewadars did not match for whom GR No. was set', 16, 1);
	RETURN;
END

INSERT INTO tmp_mgr_sewadars (gender, first_nm, last_nm, birth_dt, duplicate_type, duplicate_cnt)
	SELECT	CASE gender WHEN 'Gent' THEN 'Male' ELSE 'Female' END, LTRIM(RTRIM(first_nm)), LTRIM(RTRIM(last_nm)), birth_dt, 'Multiple Active', COUNT (*)
	FROM	sms..sewadars	s
	WHERE	(	status IN ('Temporary           ', 'Permanent           ', 'Non-Initiate        '	)
			OR	(	status =	'Retired             '	AND	is_eligible_for_prashaad	=	'Yes'	)
			)
	AND		NOT EXISTS	(	SELECT	1
							FROM	tmp_mgr_exist_swds	e
							WHERE	e.sms_grno	=	s.sewadar_id
						)
	GROUP	BY	gender, LTRIM(RTRIM(first_nm)), LTRIM(RTRIM(last_nm)), birth_dt
	HAVING COUNT (*) > 1;
SET @cnt1	=	@@ROWCOUNT;

SELECT	t.gender, t.first_nm, t.last_nm, t.birth_dt, s.initiation_dt, COUNT(*)
FROM	tmp_mgr_sewadars t
	JOIN	sms..sewadars s
		ON (t.gender = CASE s.gender WHEN 'Gent' THEN 'Male' ELSE 'Female' END and  t.first_nm = LTRIM(RTRIM(s.first_nm)) and  t.last_nm = LTRIM(RTRIM(s.last_nm)) and t. birth_dt = s. birth_dt)
WHERE	duplicate_type= 'Multiple Active'
AND		(	s.status IN ('Temporary           ', 'Permanent           ', 'Non-Initiate        '	)
		OR	(	s.status =	'Retired             '	AND	is_eligible_for_prashaad	=	'Yes'	)
		)
GROUP BY	t.gender, t.first_nm, t.last_nm, t.birth_dt, s.initiation_dt
HAVING	COUNT (*)	>	1;
SET @cnt2	=	@@ROWCOUNT;

IF (@cnt1 > 0 AND @cnt2 > 0)
BEGIN
	RAISERROR ('Multiple records of Sewadars (on the basis of First and Last Names, Gender and DOB) have same Initiation Dates too for %d records', 16, 1, @cnt2);
	RETURN;
END

	---- and thus set the birth_dt's time to 00.01 for one of the two records

	DECLARE	crsr CURSOR FOR
		SELECT	t.gender, t.first_nm, t.last_nm, t.birth_dt, s.sewadar_id, s.status
		FROM	tmp_mgr_sewadars t
			JOIN	sms..sewadars s
				ON (t.gender = CASE s.gender WHEN 'Gent' THEN 'Male' ELSE 'Female' END and  t.first_nm = LTRIM(RTRIM(s.first_nm)) and  t.last_nm = LTRIM(RTRIM(s.last_nm)) and t. birth_dt = s. birth_dt)
		WHERE	duplicate_type= 'Multiple Active'
		AND		(	s.status IN ('Temporary           ', 'Permanent           ', 'Non-Initiate        '	)
				OR	(	s.status =	'Retired             '	AND	is_eligible_for_prashaad	=	'Yes'	)
				)
		ORDER BY	t.gender, LTRIM(RTRIM(t.first_nm)), LTRIM(RTRIM(t.last_nm)), t.birth_dt, s.sewadar_id;
	
	OPEN crsr;

	FETCH crsr
		INTO	@c_gender, @c_first_nm, @c_last_nm, @c_birth_dt, @sewadar_grno, @c_status
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		UPDATE	tmp_mgr_sewadars
			SET	sewadar_grno	=	@sewadar_grno,
				status			=	@c_status
		WHERE	duplicate_type	= 'Multiple Active'
		AND		first_nm	=	@c_first_nm
		AND		last_nm	=	@c_last_nm
		AND		birth_dt	=	@c_birth_dt
		AND		gender	=	@c_gender
		AND		sewadar_grno	IS NULL
		IF (@@ROWCOUNT = 0)
			INSERT INTO	tmp_mgr_sewadars
					(	gender, first_nm, last_nm, birth_dt, sewadar_grno, duplicate_type, status	)
				VALUES
					(	@c_gender, @c_first_nm, @c_last_nm, convert (datetime, convert (varchar, @c_birth_dt, 106) + ' 00:01:00'), @sewadar_grno, 'Multiple Active', @c_status	);
		FETCH crsr
			INTO	@c_gender, @c_first_nm, @c_last_nm, @c_birth_dt, @sewadar_grno, @c_status
	END

	CLOSE crsr;

	DEALLOCATE crsr;

SELECT	@cnt2 = COUNT (*)
FROM	tmp_mgr_sewadars
WHERE	duplicate_type	= 'Multiple Active';

IF (@cnt1 * 2 != @cnt2)
	BEGIN
		RAISERROR ('Mutiple Active Sewadar Counts do not match (Double of %d should be %d)', 16, 1, @cnt1, @cnt2);
		RETURN;
	END

SELECT	status, COUNT(*)
FROM	tmp_mgr_sewadars
GROUP BY status

select gender, first_nm, last_nm, birth_dt, count(*)
from tmp_mgr_sewadars
group by gender, first_nm, last_nm, birth_dt
having count(*) > 1

SET @cnt_mgr = @cnt_mgr + @cnt2

SELECT	*
FROM	tmp_mgr_sewadars t
	JOIN	sewadars s
		ON (t.gender = s.gender and t.first_nm = s.first_nm and  t.last_nm = s.last_nm and t. birth_dt = s. birth_dtm)
	JOIN	sms..sewadars	m
		ON	(	m.sewadar_id	=	t.sewadar_grno	);
SET @cnt1 = @@ROWCOUNT;
IF (@cnt1 > 0)
BEGIN
	RAISERROR ('Records of Sewadars conflict with the existing ZSM sewadars (on the basis of First and Last Names, Gender and DOB) for %d cases; resolved by changing DOB by 1 minute', 16, 1, @cnt1);
	UPDATE	t
		SET	birth_dt	=	convert (datetime, convert (varchar, @c_birth_dt, 106) + ' 00:01:00')
	FROM	tmp_mgr_sewadars t
		JOIN	sewadars s
			ON (t.gender = s.gender and t.first_nm = s.first_nm and  t.last_nm = s.last_nm and t. birth_dt = s. birth_dtm)
END

print @cnt_mgr

-- ====================================================================================================
--	Sewadars
-- ====================================================================================================

DECLARE
	@cnt3				INT,
	@cnt4				INT,
	@sewadar_wise_sewa_summaries_screen_id		CHAR(6);

	SET @sewadar_wise_sewa_summaries_screen_id		= 'ATT_01';


--NS: insert into Sewadars also inserts into sewadars_status_changes using a trigger sewadars_a_i_DML 
-- Therefore, disabling trigger sewadars_a_i_DML

alter table sewadars
disable trigger sewadars_a_i_DML;

SET IDENTITY_INSERT sewadars ON

INSERT INTO sewadars
		(	sewadar_id, first_nm, middle_nm, last_nm, gender, birth_dtm, is_married,
			initiation_dt, initiation_place_id, initiation_by
		)
SELECT 	ds.id, ds.first_nm, LTRIM(RTRIM(s.middle_nm)), ds.last_nm, gm.zsm_gender, ds.birth_dt, LTRIM(RTRIM(s.is_married)), 
		s.initiation_dt,	CASE WHEN s.initiation_dt IS NOT NULL THEN 
								CASE	WHEN s.initiation_place IS NOT NULL THEN ip.place_id 
										ELSE 80 --setting place_id to TO BE SPECIFIED place_id			JL - done
								END 
							END,
							CASE WHEN s.initiation_dt IS NOT NULL THEN 
								CASE	WHEN s.initiation_by IS NOT NULL THEN s.initiation_by -- JL - done
								END 
							END
FROM sms..sewadars s
JOIN tmp_mgr_sewadars ds ON s.sewadar_id = ds.sewadar_grno 
JOIN tmp_mgr_gender_mapping gm ON gm.sms_gender = s.gender
LEFT OUTER JOIN tmp_mgr_initiation_place_mapping im ON im.sms_initiation_place = s.initiation_place
LEFT OUTER JOIN CDB..initiation_places ip ON ip.place_nm = im.cdb_initiation_place_nm
order by 1

SET IDENTITY_INSERT sewadars OFF

-- Correcting the patron_id for cases where initiation_by is NULL and initiation_dt is not NULL
UPDATE zs
	SET zs.initiation_by = cp.patron_id
	FROM sewadars zs
	JOIN tmp_mgr_sewadars ssr ON ssr.id = zs.sewadar_id
	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_grno
	JOIN CDB..patrons cp ON cp.initiation_from <= ss.initiation_dt AND ss.initiation_dt <= COALESCE(cp.initiation_till, GETDATE())
	WHERE ss.initiation_by IS NULL AND ss.initiation_dt IS NOT NULL;

alter table sewadars
enable trigger sewadars_a_i_DML;

--------------------===================================================================================

-- ====================================================================================================
--	Sewadars Details
-- ====================================================================================================

INSERT INTO sewadars_details
	(	sewadar_id, telephone_mobile, telephone_residence, telephone_office, occupation	)
	SELECT	ssr.id, ss.telephone_mobile, ss.telephone_residence, ss.telephone_office, om.zsm_occupation
	FROM	tmp_mgr_sewadars ssr
		JOIN SMS..sewadars ss ON ss.sewadar_id = ssr.sewadar_grno
		JOIN tmp_mgr_occupation_mapping om ON om.sms_occupation = ss.occupation
SET @cnt1 = @@ROWCOUNT
IF (@cnt1 != @cnt_mgr)
	RAISERROR ('Sewadars Details not entered for all Sewadars (%d against %d', 16, 1, @cnt1, @cnt_mgr);


-- ====================================================================================================
--	Sewadars Addresses
-- ====================================================================================================
/* Commenting this because all mappings are established
	SELECT	p.country_id, p.state_id, p.district_id, p.po_or_city_id, p.po_or_city_nm, d.district_nm, s.state_nm, c.country_nm, COUNT(*)
	FROM tmp_mgr_sewadars ssr
	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_grno
	JOIN SMS..pos_or_cities p ON p.country_id = ss.residence_country_id AND p.state_id = ss.residence_state_id AND
		p.district_id = ss.residence_district_id AND p.po_or_city_id = ss.residence_po_or_city_id
	JOIN SMS..districts d ON d.district_id = p.district_id AND d.state_id = p.state_id AND d.country_id = p.country_id
	JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id
	JOIN SMS..countries c ON c.country_id = d.country_id
	JOIN CDB..countries cc ON cc.country_nm = c.country_nm 	--AND cc.effective_till > GETDATE()
	JOIN CDB..states cs ON cs.country_id = cc.country_id 	AND cs.state_nm = s.state_nm --AND cs.effective_till > GETDATE()
	LEFT JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = d.district_nm 	--AND cd.effective_till > GETDATE()
	LEFT JOIN tmp_mgr_district_mapping m ON m.district_id = p.district_id AND m.state_id = p.state_id AND m.country_id = p.country_id
	LEFT JOIN post_offices_or_cities zp ON zp.district_id = COALESCE (m.cdb_district_id, cd.district_or_city_id) AND zp.post_office_or_city_nm = COALESCE (p.po_or_city_nm, m.cdb_district_nm)
	LEFT JOIN tmp_mgr_po_mapping mp ON mp.po_or_city_id = ss.residence_po_or_city_id AND mp.district_id = ss.residence_district_id AND mp.state_id = ss.residence_state_id AND mp.country_id = ss.residence_country_id
	WHERE	zp.post_office_or_city_id is null
	AND		mp.zsm_post_office_or_city_id IS NULL
	GROUP BY p.country_id, p.state_id, p.district_id, p.po_or_city_id, p.po_or_city_nm, d.district_nm, s.state_nm, c.country_nm
	ORDER BY d.district_nm, s.state_nm, c.country_nm, p.po_or_city_nm
	... */


INSERT INTO sewadars_addresses
			(sewadar_id, address_type, address_line_1, address_line_2, post_office_or_city_id, pin_or_zip_code)
	SELECT	ssr.id, 'Residence', ss.residence_address_line_1, ss.residence_address_line_2, COALESCE (mp.zsm_post_office_or_city_id, zp.post_office_or_city_id), ss.residence_pincode
	FROM tmp_mgr_sewadars ssr
	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_grno
	JOIN SMS..pos_or_cities p ON p.country_id = ss.residence_country_id AND p.state_id = ss.residence_state_id AND
		p.district_id = ss.residence_district_id AND p.po_or_city_id = ss.residence_po_or_city_id
	JOIN SMS..districts d ON d.district_id = p.district_id AND d.state_id = p.state_id AND d.country_id = p.country_id
	JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id
	JOIN SMS..countries c ON c.country_id = d.country_id
	JOIN CDB..countries cc ON cc.country_nm = c.country_nm 	--AND cc.effective_till > GETDATE()
	JOIN CDB..states cs ON cs.country_id = cc.country_id 	AND cs.state_nm = s.state_nm --AND cs.effective_till > GETDATE()
	LEFT JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = d.district_nm 	--AND cd.effective_till > GETDATE()
	LEFT JOIN tmp_mgr_district_mapping m ON m.district_id = p.district_id AND m.state_id = p.state_id AND m.country_id = p.country_id
	LEFT JOIN post_offices_or_cities zp ON zp.district_id = COALESCE (m.cdb_district_id, cd.district_or_city_id) AND zp.post_office_or_city_nm = COALESCE (p.po_or_city_nm, m.cdb_district_nm)
	LEFT JOIN tmp_mgr_po_mapping mp ON mp.po_or_city_id = ss.residence_po_or_city_id AND mp.district_id = ss.residence_district_id AND mp.state_id = ss.residence_state_id AND mp.country_id = ss.residence_country_id;
	

SET @cnt2 = @@ROWCOUNT;
IF (@cnt_mgr <> @cnt2)
		RAISERROR ('Counts of records for Sewadars Addresses do not match (%d against %d)', 16, 1, @cnt2, @cnt_mgr);

-- ====================================================================================================
--	Sewadars Qualifications
-- ====================================================================================================


INSERT INTO sewadars_qualifications
		(	qualification_sq, sewadar_id, qualification_id)
	SELECT 1, ssr.id, cq.qualification_id
	FROM tmp_mgr_sewadars ssr
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_grno
		JOIN tmp_mgr_qualifications tmq on tmq.sms_qualification_nm = ss.qualification
		JOIN CDB..qualifications cq ON cq.qualification_nm = tmq.cdb_qualification_nm
	where tmq.cdb_qualification_nm is not null
--and ssr.system_id not in (select sewadar_id from sewadars_qualifications where qualification_sq = 1)

-- ====================================================================================================
--	Sewadars Skills
-- ====================================================================================================

SELECT COUNT(*) FROM tmp_mgr_sewadars ssr
						JOIN SMS..sewadar_specialisations ss ON ss.sewadar_id = ssr.sewadar_grno;
INSERT INTO sewadars_skills
			(sewadar_id, skill_id, skill_sq)
	SELECT	ssr.id, COALESCE (m.cdb_id, cs.skill_id), ss.serial_id
	FROM tmp_mgr_sewadars ssr
	JOIN sms..sewadar_specialisations ss ON ss.sewadar_id = ssr.sewadar_grno
	JOIN sms..specialisation_areas sa ON sa.specialisation_id = ss.specialisation_id
	LEFT JOIN cdb..skills cs ON cs.skill_nm = sa.specialisation_nm
	LEFT JOIN tmp_mgr_specialisations	m
		ON	(	m.sms_id = ss.specialisation_id	)
	WHERE	m.cdb_id	IS NOT NULL
	OR		cs.skill_id	IS NOT NULL;


		/*   This is not needed as we have a mapping table now
	SELECT DISTINCT	specialisation_nm
	FROM tmp_mgr_sewadars ssr
	JOIN sms..sewadar_specialisations ss ON ss.sewadar_id = ssr.sewadar_grno
	JOIN sms..specialisation_areas sa ON sa.specialisation_id = ss.specialisation_id
	where not exists (select 1 FROM cdb..skills cs where cs.skill_nm = sa.specialisation_nm);
	IF (@@ROWCOUNT > 0)
	BEGIN
		SELECT @cnt1 = COUNT(*)
		FROM tmp_mgr_sewadars ssr
		JOIN sms..sewadar_specialisations ss ON ss.sewadar_id = ssr.sewadar_grno
		JOIN sms..specialisation_areas sa ON sa.specialisation_id = ss.specialisation_id
		where not exists (select 1 FROM cdb..skills cs where cs.skill_nm = sa.specialisation_nm);
		RAISERROR ('There are Specialisation Areas which could not be mapped to Skills in CDB (A total of %d Sewadar Records)', 16, 1, @cnt1);
	END
	*/


-- ====================================================================================================
--	Sewadars Registrations
-- ====================================================================================================
PRINT '.............. Sewadars Registrations .............. begins ......'
/*		These are commented because now the mapping table has been created
SELECT DISTINCT	sdpt.*
FROM	tmp_mgr_sewadars ssr
	JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_grno
	JOIN sms..departments	sdpt				ON	(ss.department_id		=	sdpt.department_id	)
	LEFT JOIN departments		ddpt				ON	(sdpt.department_nm		=	ddpt.department_nm	)
WHERE	ddpt.department_nm IS NULL;
IF (@@ROWCOUNT > 0)
BEGIN
	SELECT @cnt1 = COUNT(*)
	FROM	tmp_mgr_sewadars ssr
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_grno
		JOIN sms..departments	sdpt				ON	(ss.department_id		=	sdpt.department_id	)
		LEFT JOIN departments		ddpt				ON	(sdpt.department_nm		=	ddpt.department_nm	)
	WHERE	ddpt.department_nm IS NULL;
	RAISERROR ('There are Departments which could not be mapped to ZSM (A total of %d Sewadar Records)', 16, 1, @cnt1);
END

SELECT DISTINCT	ssdpt.*, sdpt.*
	FROM	tmp_mgr_sewadars ssr
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_grno
		JOIN sms..departments	sdpt				ON	(ss.department_id		=	sdpt.department_id	)
		LEFT JOIN departments		ddpt				ON	(sdpt.department_nm		=	ddpt.department_nm	)
		LEFT JOIN sms..sub_departments	ssdpt			ON	(ss.department_id		=	ssdpt.department_id		AND	ss.sub_department_id		=	ssdpt.sub_department_id	)
		LEFT JOIN sub_departments		dsdpt			ON	(ddpt.department_id		=	dsdpt.department_id		AND	ssdpt.sub_department_nm		=	dsdpt.sub_department_nm	)
	WHERE	dsdpt.department_id	IS NULL;
IF (@@ROWCOUNT > 0)
BEGIN
	SELECT @cnt1 = COUNT(*)
	FROM	tmp_mgr_sewadars ssr
		JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_grno
		JOIN sms..departments	sdpt				ON	(ss.department_id		=	sdpt.department_id	)
		LEFT JOIN departments		ddpt				ON	(sdpt.department_nm		=	ddpt.department_nm	)
		LEFT JOIN sms..sub_departments	ssdpt			ON	(ss.department_id		=	ssdpt.department_id		AND	ss.sub_department_id		=	ssdpt.sub_department_id	)
		LEFT JOIN sub_departments		dsdpt			ON	(ddpt.department_id		=	dsdpt.department_id		AND	ssdpt.sub_department_nm		=	dsdpt.sub_department_nm	)
	WHERE	ssdpt.department_id	IS NOT NULL
	AND		dsdpt.department_id	IS NULL;
	RAISERROR ('There are Sub-Departments which could not be mapped to ZSM (A total of %d Sewadar Records)', 16, 1, @cnt1);
END
*/
			--- Mark Active Sewadars as Shifted
UPDATE	r
	SET	sewadar_status_cd	=	'Shft',
		sewadar_status_dtm	=	GetDate()
FROM	sewadars_registrations	r
	JOIN	tmp_mgr_exist_swds	t
		ON	(	r.satsang_centre_id	=	t.zsm_centre
			AND	r.sewadar_grno		=	t.zsm_grno
			AND	t.active	=	1
			);

			---- Get existing sewadars data
SET IDENTITY_INSERT tmp_mgr_sewadars ON

INSERT INTO tmp_mgr_sewadars
	(	id, gender, first_nm, last_nm, birth_dt, sewadar_grno, status	)
	SELECT	t.zsm_swd_id, s.gender, s.first_nm, s.last_nm, s.birth_dtm, t.sms_grno, ss.status
	FROM	tmp_mgr_exist_swds	t
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	t.zsm_swd_id	)
		JOIN	sms..sewadars	ss
			ON	(	ss.sewadar_id	=	t.sms_grno	);
		
DECLARE
	@new_grno	CHAR (6),
	@old_grno	CHAR (6),
	@gender		VARCHAR (6),
	@swd_id		INT,
	@app_dt		DATETIME,
	@is_os		VARCHAR (3),
	@dpt_id		INT,
	@sdpt_id	INT,
	@dpt_dt		DATETIME,
	@sts_cd		VARCHAR (4),
	@sts_dt		DATETIME,
	@rsp_cd		VARCHAR (15),
	@rsp_dt		DATETIME,
	@cnt		INT

SET IDENTITY_INSERT tmp_mgr_sewadars OFF

			---- Loop for INSERTing into sewadars_registrations
	DECLARE	csr CURSOR FOR
		SELECT	ssr.id, ssr.sewadar_grno, ssr.gender, appointment_dt,
				--	LTRIM(RTRIM(ss.is_emigrant)),
				CASE WHEN COALESCE (dm.cdb_district_id, cd.district_or_city_id) = @ahd_dst_id THEN 'No' ELSE 'Yes' END,
				COALESCE (m.zsm_dept_id, ddpt.department_id), COALESCE (m.zsm_sub_dept_id, dsdpt.sub_department_id), ss.department_dt,
				zss.sewadar_status_cd, ss.status_dt,
				CASE WHEN ss.responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ') THEN LTRIM(RTRIM(ss.responsibility)) END,
				CASE WHEN ss.responsibility IN ('Head                ', 'Second Head         ', 'Third Head          ', 'Fourth Head         ') THEN ss.responsibility_dt END
		FROM	tmp_mgr_sewadars ssr
			JOIN sms..sewadars ss ON ss.sewadar_id = ssr.sewadar_grno
			JOIN sms..departments	sdpt				ON	(ss.department_id		=	sdpt.department_id	)
			LEFT JOIN departments		ddpt				ON	(sdpt.department_nm		=	ddpt.department_nm	)
			LEFT JOIN sms..sub_departments	ssdpt			ON	(ss.department_id		=	ssdpt.department_id		AND	ss.sub_department_id		=	ssdpt.sub_department_id	)
			LEFT JOIN sub_departments		dsdpt			ON	(ddpt.department_id		=	dsdpt.department_id		AND	ssdpt.sub_department_nm		=	dsdpt.sub_department_nm	)
			JOIN tmp_mgr_sewadar_status_mapping sm		ON sm.sms_status			= ss.status
			JOIN sewadar_status zss 					ON zss.sewadar_status_nm 	= sm.zsm_sewadar_status_nm
			LEFT JOIN tmp_mgr_dsd_mapping	m	
				ON	(	m.sms_dept_id	=	ss.department_id
					AND	(	(	ss.sub_department_id	IS	NULL	AND	m.sms_sub_dept_id	IS NULL	)
						OR	(	ss.sub_department_id	IS	NOT NULL	AND	m.sms_sub_dept_id	IS NOT NULL	AND	ss.sub_department_id = m.sms_sub_dept_id	)
						)
					)
			JOIN SMS..districts d ON d.district_id = ss.residence_district_id AND d.state_id = ss.residence_state_id AND d.country_id = ss.residence_country_id
			JOIN SMS..states s ON s.state_id = d.state_id AND s.country_id = d.country_id
			JOIN SMS..countries c ON c.country_id = d.country_id
			JOIN CDB..countries cc ON cc.country_nm = c.country_nm 	--AND cc.effective_till > GETDATE()
			JOIN CDB..states cs ON cs.country_id = cc.country_id 	AND cs.state_nm = s.state_nm --AND cs.effective_till > GETDATE()
			LEFT JOIN CDB..districts_or_cities cd ON cd.state_id = cs.state_id AND cd.district_nm = d.district_nm 	--AND cd.effective_till > GETDATE()
			LEFT JOIN tmp_mgr_district_mapping dm ON dm.district_id = ss.residence_district_id AND dm.state_id = ss.residence_state_id AND dm.country_id = ss.residence_country_id
		ORDER BY ssr.first_nm, ssr.last_nm, ss.middle_nm
	
	SET @cnt = 0;
	SET NOCOUNT ON;
	OPEN csr;

	FETCH csr
		INTO	@swd_id, @old_grno, @gender, @app_dt, @is_os, @dpt_id, @sdpt_id, @dpt_dt, @sts_cd, @sts_dt, @rsp_cd, @rsp_dt;
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @cnt = @cnt + 1;
		
		EXEC GetSewadarRegistrationNumber @centre_id, @gender, @is_os, @new_grno OUTPUT;
 		PRINT	CONVERT (VARCHAR, @cnt) + '.	ID: ' +	CONVERT (VARCHAR, @swd_id) + ', ' + @gender + ', Old: ' +  @old_grno + ', New: ' + @new_grno; ----@app_dt, @is_os, @dpt_id, @sdpt_id, @dpt_dt, @sts_cd, @sts_dt, @rsp_cd, @rsp_dt;

		INSERT INTO sewadars_registrations
				(	satsang_centre_id, sewadar_grno, sewadar_id, appointment_dt, is_outstation_sewadar, department_id, sub_department_id, department_dt, 
					sewadar_status_cd, sewadar_status_dtm, responsibility, responsibility_dtm
				)
			VALUES
				(	@centre_id, @new_grno, @swd_id, @app_dt, @is_os, @dpt_id, @sdpt_id, @dpt_dt, @sts_cd, @sts_dt, @rsp_cd, @rsp_dt	);

		UPDATE	tmp_mgr_sewadars
			SET	new_grno	=	@new_grno
		WHERE	id	=	@swd_id;
		IF (@@ROWCOUNT != 1)
			RAISERROR ('Update for NEW GRNo. (%S) failed for Sewadar ID %d', 16, 1, @new_grno, @swd_id);

		FETCH csr
			INTO	@swd_id, @old_grno, @gender, @app_dt, @is_os, @dpt_id, @sdpt_id, @dpt_dt, @sts_cd, @sts_dt, @rsp_cd, @rsp_dt;
	END

	CLOSE csr;

	DEALLOCATE csr;

	SET NOCOUNT OFF;
	PRINT  '..... INSERTed ' + CONVERT (VARCHAR, @cnt) + ' sewadars with new GR Nos.'
	
INSERT INTO sewadars_remarks
	SELECT	id, 'Old G.R.No.', 1, sewadar_grno
	FROM	tmp_mgr_sewadars;

					/*
				---- LATER.. .JL ... WHERE clause needs to be removed once we get resolution for Departments and Sub-departments
	WHERE	ddpt.department_id	IS NOT NULL
	AND		(	(	ssdpt.department_id	IS NOT NULL AND		dsdpt.department_id	IS NOT NULL	)
			OR	(	ssdpt.department_id	IS NULL )
			)
			*/

-- We need to handle this differently......
  -- ...... so commenting it out                       - JL
-- Removing commented part, created a mapping table

-- ====================================================================================================
--	Sewas
-- ====================================================================================================

IF  EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'tmp_sewas' AND TYPE = 'U')
	DROP TABLE [dbo].tmp_sewas;

SET IDENTITY_INSERT SEWAS ON;
select system_sewa_id = identity(int,112,1),sewa_id into tmp_sewas from SMS..sewas where referred_sewa_id is null;


SELECT @cnt1 = COUNT(*) FROM sms..sewas;

INSERT INTO sewas
	(	sewa_id, satsang_centre_id, sewa_cd, sewa_nm, start_dt, finish_dt, 
		is_satsang_programme, is_scanner_used, is_leave_allowed, is_exemption_allowed,	is_default_sewa, 
		sewa_frequency, attendance_unit, attendance_marking, min_sewa_duration, max_sewa_duration, 
		attendance_ts, summary_ts, deleted_ts
	)
	SELECT	ts.system_sewa_id, @centre_id, ts.sewa_id, s.sewa_nm, s.start_dt, s.finish_dt, 
			LTRIM(RTRIM(s.is_satsang_programme)), 'No', LTRIM(RTRIM(s.is_leave_allowed)), LTRIM(RTRIM(s.is_exemption_allowed)), 'No', 
			LTRIM(RTRIM(s.sewa_frequency)), LTRIM(RTRIM(s.attendance_unit)), LTRIM(RTRIM(s.attendance_marking)), s.min_sewa_duration, s.max_sewa_duration, 
			s.attendance_ts, s.summary_ts, s.deleted_ts
	FROM	tmp_sewas ts
		JOIN	sms..sewas s
			ON	ts.sewa_id = s.sewa_id
	WHERE	s.referred_sewa_id IS NULL
	AND		EXISTS	(	SELECT	1
						FROM	sms..sewadar_wise_sewa_summaries	x
						WHERE	x.sewa_id	=	s.sewa_id
					);
-- and sewa_nm not in (select sewa_nm from sewas where satsang_centre_id = @centre_id);

SET IDENTITY_INSERT SEWAS OFF;

-- ====================================================================================================
--	Sewadar Wise Sewa Summaries, Sewadars TxnTs
-- ====================================================================================================

INSERT INTO sewadar_wise_sewa_summaries
			(sewa_id, satsang_centre_id, sewadar_grno, present_cnt, exempt_cnt, leave_cnt, absent_cnt, is_system_recorded)
	SELECT	zs.sewa_id, @centre_id, r.new_grno, s.present_cnt, 
		CASE WHEN s.exempt_cnt IS NOT NULL THEN s.exempt_cnt ELSE 0 END,
		CASE WHEN s.leave_cnt IS NOT NULL THEN s.leave_cnt ELSE 0 END, s.absent_cnt,
		CASE WHEN LTRIM(RTRIM(s.is_manual )) = 'Yes' THEN 'No' ELSE 'Yes' END
	FROM SMS..sewadar_wise_sewa_summaries s
		JOIN sewas zs ON zs.sewa_cd = s.sewa_id
		JOIN tmp_mgr_sewadars r ON s.sewadar_id	= r.sewadar_grno
	WHERE (present_cnt <> 0 OR absent_cnt <> 0 OR (leave_cnt IS NOT NULL AND leave_cnt <> 0) OR (exempt_cnt IS NOT NULL AND exempt_cnt <> 0))

SET @cnt3 = @@ROWCOUNT;

/*
IF (@cnt1 <> @cnt3 + @cnt2) -- +@cnt2 because entries with all 4 counts = 0 are not migrated
		RAISERROR ('Counts of records for Sewadar wise Sewa Summaries do not match', 16, 1);
*/

INSERT INTO sewadars_txn_ts
					(satsang_centre_id, sewadar_grno, sewa_id, screen_id)
	SELECT @centre_id, s.sewadar_grno, s.sewa_id, @sewadar_wise_sewa_summaries_screen_id
	FROM sewadar_wise_sewa_summaries s
		JOIN	tmp_mgr_sewadars	x
			ON	(	s.satsang_centre_id = @centre_id
				AND s.sewadar_grno		=	x.new_grno
				)

SET @cnt2 = @@ROWCOUNT;

IF (@cnt3 <> @cnt2)
		RAISERROR ('Counts of records for Sewadars TxnTs (Sewadar wise Sewa Summaries) do not match (%d against %d)', 16, 1, @cnt2, @cnt3);


SELECT	s.sewa_id, COUNT (*)
FROM	sewadar_wise_sewa_summaries	s
WHERE	s.satsang_centre_id = @centre_id
GROUP BY s.sewa_id;

-------------------------------------------------------------------------------

SELECT *
FROM	sequence_controlling_information
WHERE	satsang_centre_id	=	@centre_id;

alter table sewadars_transfers
enable trigger sewadars_transfers_a_iu;

alter table sewadars_transfers
enable trigger sewadars_transfers_b_iu;

alter table sewadars_transfers
enable trigger sewadars_transfers_c_iu;

alter table sewadars_transfers
enable trigger sewadars_transfers_d_iu;

alter table sewadars_transfers
disable trigger sewadars_transfers_e_iu;

