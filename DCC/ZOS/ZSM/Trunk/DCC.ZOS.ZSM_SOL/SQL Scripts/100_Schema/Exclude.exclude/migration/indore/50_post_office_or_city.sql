/* ==================================================================================
	Source File		:	post_office_or_city.sql
	Author(s)		:	Manish Saluja / Jitendra Loyal
	Started On		:	
	Version			:	
	Module ID		:	ZSM (Indore)
	Language		:	TRANSACT-SQL
	Last updated	:	28 May 2012
	Reviewed By		:	
	Reviewed On		:	
	==================================================================================
														 				   Usage Notes
	==================================================================================
																	  Revision History
	==================================================================================*/

-- State
UPDATE mgr_centre_sewadars
	SET state_nm = 'CHHATTISGARH'
	WHERE	state_nm = 'Chhatisgarh'
	AND		is_migrated			= 'N';
-- District
UPDATE mgr_centre_sewadars
	SET district_nm = 'RAJNANDGAON'
	WHERE state_nm = 'CHHATTISGARH' AND district_nm = 'Rajnangaon'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'Alirajpur'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = 'Ali Rajpur'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'KHARGONE'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = 'Khargon'
	AND		is_migrated			= 'N';

UPDATE mgr_centre_sewadars
	SET district_nm = 'SHIVPURI' -- 335
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = 'Shivapuri'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET post_office_or_city_nm = 'Shujalpur'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = 'Shujalpur' AND post_office_or_city_nm = 'Same'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'SHAJAPUR'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = 'Shujalpur'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'SEHORE'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = 'Ashta'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'BULDANA'
	WHERE state_nm = 'Maharashtra' AND district_nm = 'Buldhana'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'RAIGAD'
	WHERE state_nm = 'Maharashtra' AND district_nm = 'Raigarh'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'YEOTMAL'
	WHERE state_nm = 'Maharashtra' AND district_nm = 'Yawatmal'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'JALANDHAR'
	WHERE state_nm = 'Punjab' AND district_nm = 'Jallandhar'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'DAHOD'
	WHERE state_nm = 'Gujarat' AND district_nm = '' AND address_line_1 like '%Dahod'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'THANE'
	WHERE state_nm = 'Maharashtra' AND district_nm = '' AND address_line_1 like '%Thane'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'JALGAON'
	WHERE state_nm = 'Maharashtra' AND district_nm = '' AND address_line_1 like '%Jalgaon'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'AMRAVATI'
	WHERE state_nm = 'Maharashtra' AND district_nm = '' AND address_line_1 like '%Pathrot'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'JHALAWAR'
	WHERE state_nm = 'Rajasthan' AND district_nm = '' AND post_office_or_city_nm = 'Gangdhar'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'JHALAWAR'
	WHERE state_nm = 'Rajasthan' AND district_nm = '' AND post_office_or_city_nm = 'Bardia'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'PALI'
	WHERE state_nm = 'Rajasthan' AND district_nm = '' AND address_line_1 like '%Kulthana'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'RAJ SAMAND'
	WHERE state_nm = 'Rajasthan' AND district_nm = '' AND address_line_1 = 'Mohangarh Nichla Chouk'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'AGRA'
	WHERE state_nm = 'Uttar Pradesh' AND district_nm = '' AND address_line_1 like '%Agra'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'ALLAHABAD'
	WHERE state_nm = 'Uttar Pradesh' AND district_nm = '' AND address_line_1 like '%Tagor Town'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'SONBHADRA'
	WHERE state_nm = 'Uttar Pradesh' AND district_nm = '' AND address_line_1 like '%Sonbhadra'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'Indore'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Rajendra Nagar'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'MANDSAUR'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Dalauda'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'Indore'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Indore'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'RAJGARH'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Kachnariya'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'RATLAM'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Palsoda'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'Indore'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Pivdai'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'Indore'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Mangliya'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'UJJAIN'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Kheda Khajuria'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'RATLAM'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Namli'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'KHANDWA'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Khutla'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET post_office_or_city_nm = 'DEOGARH'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Devgard'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'DEWAS'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'DEOGARH'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'BURHANPUR'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Biroda'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'Indore'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Sanwer'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'UJJAIN'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Undasa'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'MANDSAUR'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Patela'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET post_office_or_city_nm = 'BADKUMED'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'Badkuned'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'UJJAIN'
	WHERE state_nm = 'Madhya Pradesh' AND district_nm = '' AND post_office_or_city_nm = 'BADKUMED'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'Indore',
		state_nm	= 'Madhya Pradesh'
	WHERE state_nm = '' AND district_nm = '' AND post_office_or_city_nm = 'Betma'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'DEWAS',
		state_nm	= 'Madhya Pradesh'
	WHERE state_nm = '' AND district_nm = '' AND post_office_or_city_nm = 'Dewas'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'Indore',
		state_nm	= 'Madhya Pradesh'
	WHERE state_nm = '' AND district_nm = '' AND post_office_or_city_nm = 'Depalpur'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'UJJAIN',
		state_nm	= 'Madhya Pradesh'
	WHERE state_nm = '' AND district_nm = '' AND post_office_or_city_nm = 'Karnavad'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'Indore',
		state_nm	= 'Madhya Pradesh'
	WHERE state_nm = '' AND district_nm = '' AND post_office_or_city_nm = 'Khudel'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'SEHORE',
		state_nm	= 'Madhya Pradesh'
	WHERE state_nm = '' AND district_nm = '' AND post_office_or_city_nm = 'Muskara'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'Indore',
		state_nm	= 'Madhya Pradesh'
	WHERE state_nm = '' AND district_nm = '' AND post_office_or_city_nm = 'Pivdai'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm = 'Indore',
		state_nm	= 'Madhya Pradesh'
	WHERE state_nm = '' AND district_nm = '' AND post_office_or_city_nm = 'Rajendra Nagar'
	AND		is_migrated			= 'N';
	
UPDATE mgr_centre_sewadars
	SET district_nm				= 'Indore',
		state_nm				= 'Madhya Pradesh',
		post_office_or_city_nm	=	'SANWER'
	WHERE state_nm = '' AND district_nm = '' AND post_office_or_city_nm = 'Sanver'
	AND		is_migrated			= 'N';
	
GO

UPDATE c
	SET	 c.post_office_or_city_id = p.post_office_or_city_id
	FROM mgr_centre_sewadars c
	join CDB..states s on s.state_nm = c.state_nm and  GETDATE() BETWEEN s.effective_from AND s.effective_till
	join CDB..districts_or_cities d on d.state_id = s.state_id and d.district_nm = c.district_nm and GETDATE() BETWEEN d.effective_from AND d.effective_till
	join post_offices_or_cities p on p.district_id = d.district_or_city_id and p.post_office_or_city_nm = c.post_office_or_city_nm and GETDATE() BETWEEN p.effective_from and p.effective_till
	where c.district_nm <> '' and c.post_office_or_city_nm <> '' and c.post_office_or_city_nm <> 'Same'
	AND EXISTS				
	(select m.state_nm, m.district_nm, m.post_office_or_city_nm from mgr_centre_sewadars m join CDB..states s on s.state_nm = m.state_nm and GETDATE() BETWEEN s.effective_from AND s.effective_till
	join CDB..districts_or_cities d on d.state_id = s.state_id and d.district_nm = m.district_nm and GETDATE() BETWEEN d.effective_from AND d.effective_till
	join post_offices_or_cities p on p.district_id = d.district_or_city_id and p.post_office_or_city_nm = m.post_office_or_city_nm and GETDATE() BETWEEN p.effective_from and p.effective_till
	where m.state_nm = c.state_nm and m.district_nm = c.district_nm and m.post_office_or_city_nm = c.post_office_or_city_nm)
	AND		is_migrated			= 'N';
	
GO
