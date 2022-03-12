/* ==================================================================================
    Source File		:	procs_other_reports.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Thu Dec 30 20:57 IST 2010
    Last updated	:	Feb 27, 2022
    Module ID		:	ZSM (Zonal Sewadars Manager)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		This is re-runnable script and thus is pre-qualified with DROP statements.
    ==================================================================================
								      								  Revision History
    ----------------------------------------------------------------------------------
		AJ : 27 Feb 2022
			* Added new badge type guide sewadar and its SP GetGuideSewadarsBadgeInfo
		JL : 16-Nov-2016
			* A new function GetAreaName has been added.
			* Stored Procedure GetHorizontalSewadarFrontInfo has been modified as below:
				+ If length of First and Last Name is more than 19, First Name initial is printed along with Last Name
				+ Instead of District Name, Area Name is printed for Outstation Sewadars; if Weekly Satsang Centre is not defined,
				  District is printed
		JL : 18_Oct-2014
			* A new Stored Procedure GetOtherDisabilities has been added.
			* Stored Procedures GetHorizontalSewadarBackInfo, GetTriangularSewadarFrontInfo and GetVerticalSewadarBackInfo have
			  been changed as these now call function GetOthersDisabilities instead of referring column any_disability.
		JL : 24-Sep-2013
			* All Stored Procedures that raise error also now return a negative value apart from raising the error.
			* All calls to stored procedures now check the return value, and if the return value is non-zero, the
			  calling stored procedure also returns with the returned value.
		JL : 14-Dec-2012
			* Stored Procedure GetConstructionSewaBadgeInfo has been changed to render Sub-department Code
			  instead of Sub-Department because the Sub-department Name was not getting completely rendered
			  on the Construction Badge.
		AJ : 14-OCT-2012
			* Added SP GetIDCardSewaBadgeInfo for ID card badge for outstation sewadars
		AJ : 27-Dec-2011
			* Stored Procedure GetTraineeSewadarsBadgeInfo fixed end year in validity text 
				and removed special characters to adjust the text in the report
		JL : 18-Dec-2011
			* Stored Procedure GetTraineeSewadarsBadgeInfo changed to NOT to use sewadar_status_cd using system_information_code.
			* Stored Procedure GetTraineeSewadarsBadgeInfo reviewed and changed (a) to NOT to use address, (b) to use location district
			  and (c) validity text logic incorporated.
		AJ : 17-Dec-2011
			* Stored Procedure GetTraineeSewadarsBadgeInfo added.
     JL : ??-Dec-2010
		*   Initial version
   ==================================================================================*/

-- =============================================================================
-- Function GetBadgeLineInfo
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetBadgeLineInfo' AND xtype = 'FN')
	DROP FUNCTION GetBadgeLineInfo
GO

CREATE FUNCTION GetBadgeLineInfo
(
	@p_part_1_type				badge_part_type,
	@p_part_1_text				badge_text,
	@p_parts_separator			Separator,
	@p_part_2_type				badge_part_type,
	@p_part_2_text				badge_text,
	@p_department_nm 			gnc_nm,
	@p_sub_department_nm 		gnc_nm,
	@p_satsang_centre_nm		gnc_nm,
	@p_weekly_sewa_location_nm	gnc_nm
)
	RETURNS	VARCHAR (100)
WITH ENCRYPTION
AS
BEGIN
	RETURN	CASE	@p_part_1_type	WHEN	'Department'		THEN	UPPER (@p_department_nm)
									WHEN	'Sub-Department'	THEN	UPPER (@p_sub_department_nm)
									WHEN	'Satsang Centre'	THEN	UPPER (@p_satsang_centre_nm)
									WHEN	'Weekly Location'	THEN	UPPER (@p_weekly_sewa_location_nm)
									WHEN	'Text'				THEN	@p_part_1_text
			END
			+	COALESCE	(	CASE @p_parts_separator WHEN '()'	THEN ' ('
														WHEN ' '	THEN ' '
																	ELSE COALESCE (' ' + @p_parts_separator + ' ', '')
														END
								+ CASE	@p_part_2_type	WHEN	'Department'		THEN	UPPER (@p_department_nm)
														WHEN	'Sub-Department'	THEN	UPPER (@p_sub_department_nm)
														WHEN	'Satsang Centre'	THEN	UPPER (@p_satsang_centre_nm)
														WHEN	'Weekly Location'	THEN	UPPER (@p_weekly_sewa_location_nm)
														WHEN	'Text'				THEN	@p_part_2_text
								END
								+ CASE @p_parts_separator WHEN '()' THEN ')' ELSE '' END
								, ''
							);
END
GO

-- =============================================================================
-- Function GetOtherDisabilities
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetOtherDisabilities' AND xtype = 'FN')
	DROP FUNCTION GetOtherDisabilities
GO

CREATE FUNCTION GetOtherDisabilities
(
	@p_sewadar_id				sewadar_id
)
	RETURNS	VARCHAR (1000)
WITH ENCRYPTION
AS
BEGIN
	DECLARE
		@txt	VARCHAR (1000);
	
	SET @txt = ''

	SELECT	@txt = @txt + m.medical_disability_nm + '; '
	FROM	sewadars_other_disabilities	s
		JOIN	medical_disabilities	m
			ON	(	s.medical_disability_id	=	m.medical_disability_id	)
	WHERE	s.sewadar_id	=	@p_sewadar_id
	ORDER BY s.medical_disability_sq;
	IF (LEN (@txt) > 1)
		SET @txt	=	LEFT (@txt, LEN (@txt) - 1);
	RETURN @txt;
END
GO

-- =============================================================================
-- Function GetAreaName
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetAreaName' AND xtype = 'FN')
	DROP FUNCTION GetAreaName
GO

CREATE FUNCTION GetAreaName
(
	@p_satsang_centre_id		satsang_centre_id
)
	RETURNS	VARCHAR (100)
WITH ENCRYPTION
AS
BEGIN
	DECLARE
		@area_nm	VARCHAR (100);
	
	SELECT	@area_nm = COALESCE (a.satsang_centre_nm, pc.satsang_centre_nm, c.satsang_centre_nm)
	FROM	CDB..satsang_centres	c
		JOIN	satsang_centres_details	d
			ON	(	c.satsang_centre_id	=	d.satsang_centre_id	)
		LEFT JOIN	CDB..satsang_centres	pc
			ON	(	pc.satsang_centre_id	=	d.reports_to_centre_id
				AND	c.satsang_centre_type	IN	(	'Sub Centre', 'Point'	)
				)
		LEFT JOIN	satsang_centres_details	pd
			ON	(	pc.satsang_centre_id	=	pd.satsang_centre_id	)
		LEFT JOIN	CDB..satsang_centres	a
			ON	(	a.satsang_centre_id	=	COALESCE (pd.reports_to_centre_id, d.reports_to_centre_id)	)
	WHERE	c.satsang_centre_id	=	@p_satsang_centre_id;

	RETURN @area_nm;
END
GO

-- =============================================================================
-- Procedure GetHorizontalSewadarFrontInfo
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetHorizontalSewadarFrontInfo' AND xtype = 'P')
	DROP PROCEDURE GetHorizontalSewadarFrontInfo
GO

CREATE PROCEDURE GetHorizontalSewadarFrontInfo
(
	@p_from_badge_id 		INTEGER,
	@p_till_badge_id		INTEGER,
	@p_satsang_centre_id 	satsang_centre_id,		
	@p_badge_template_id	badge_template_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	dbo.GetBadgeLineInfo	(	m.top_line_part_1_type, m.top_line_part_1_text, m.top_line_parts_separator, m.top_line_part_2_type, m.top_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	top_line_text,
			f.red_component						AS	fore_red,
			f.green_component					AS	fore_blue,
			f.blue_component					AS	fore_green,
			k.red_component						AS	back_red,
			k.green_component					AS	back_blue,
			k.blue_component					AS	back_green,

			CASE	WHEN LEN (s.first_nm + s.last_nm) >= 19
						THEN	SUBSTRING (s.first_nm, 1, 1) + '. ' + s.last_nm
						ELSE	s.first_nm + ' ' + s.last_nm
			END									AS	sewadar_nm,

			b.sewadar_grno						AS	sewadar_gr_no,
			c.centre_alphabet					AS	satsang_centre_alphabet,
			r.is_outstation_sewadar				AS	is_outstation_sewadar,
			CASE r.sewadar_status_cd	WHEN 'TEMP'	THEN	'Yes'	ELSE	'No'	END
												AS	is_temporary,
			DATEPART (YY, r.appointment_dt)		AS	appointment_yr,
			DATEPART (YY, b.expiry_dt)			AS	valid_upto_yr,
	
			CONVERT (VARCHAR, DATEPART (YY, r.appointment_dt))
			+ ' - ' + CONVERT (VARCHAR, DATEPART (YY, GetDate()))	
			+ ' - ' + CONVERT (VARCHAR, DATEPART (YY, b.expiry_dt))			
												AS	year_info,
		
			CASE	WHEN	r.is_outstation_sewadar	=	'Yes'
						THEN	(COALESCE (dbo.GetAreaName (sd.weekly_satsang_centre_id), t.district_nm))
						--THEN	t.district_nm
			END									AS	outstation_sewadar_location,
			dbo.GetBadgeLineInfo	(	m.middle_line_part_1_type, m.middle_line_part_1_text, m.middle_line_parts_separator, m.middle_line_part_2_type, m.middle_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	middle_line_text,
			dbo.GetBadgeLineInfo	(	m.bottom_line_part_1_type, m.bottom_line_part_1_text, m.bottom_line_parts_separator, m.bottom_line_part_2_type, m.bottom_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	bottom_line_text,
			c.secretary_signature				AS	secretary_signature,
			h.sewadar_photo						AS	sewadar_photo
	FROM	sewadars_badges	b
		JOIN	sewadars_registrations	r
			ON	(	b.badge_id			BETWEEN	@p_from_badge_id	AND	@p_till_badge_id
				AND	b.satsang_centre_id	=	r.satsang_centre_id
				AND	b.sewadar_grno		=	r.sewadar_grno
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
		JOIN	sewadars_details	sd
			ON	(	sd.sewadar_id	=	r.sewadar_id	)
		JOIN	ZSM_Photos..sewadars_photos	h
			ON	(	h.sewadar_id	=	r.sewadar_id	)
		JOIN	departments	d
			ON	(	d.department_id	=	r.department_id	)
		JOIN	badge_templates	m
			ON	(	m.badge_template_id		=	@p_badge_template_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
		LEFT JOIN	sub_departments	e
			ON	(	e.sub_department_id	=	r.sub_department_id	)
		LEFT JOIN	weekly_sewa_locations	w
			ON	(	w.weekly_sewa_location_id	=	r.weekly_sewa_location_id	)
		LEFT JOIN	sewadars_addresses	a
			ON	(	a.sewadar_id	=	r.sewadar_id
				AND	a.address_type	=	'Residence'
				)
		LEFT JOIN	post_offices_or_cities	p
			ON	(	p.post_office_or_city_id	=	a.post_office_or_city_id	)
		LEFT JOIN	CDB..districts_or_cities	t
			ON	(	t.district_or_city_id	=	p.district_id	)
		LEFT JOIN	colours	f
			ON	(	f.colour_id	=	CASE	m.foreground_colour_control	WHEN	'Colour'		THEN	m.foreground_colour_id
																		WHEN	'Centre'		THEN	c.colour_id
																		WHEN	'Department'	THEN	d.colour_id
									END
				)
		LEFT JOIN	colours	k
			ON	(	k.colour_id	=	CASE	m.background_colour_control	WHEN	'Colour'		THEN	m.background_colour_id
																		WHEN	'Centre'		THEN	c.colour_id
																		WHEN	'Department'	THEN	d.colour_id
									END
				)
	ORDER BY	b.sewadar_grno;
END
GO

-- =============================================================================
-- Procedure GetHorizontalSewadarBackInfo
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetHorizontalSewadarBackInfo' AND xtype = 'P')
	DROP PROCEDURE GetHorizontalSewadarBackInfo
GO

CREATE PROCEDURE GetHorizontalSewadarBackInfo
(
	@p_from_badge_id 		INTEGER,
	@p_till_badge_id		INTEGER,
	@p_satsang_centre_id 	satsang_centre_id,		
	@p_badge_template_id	badge_template_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	s.sewadar_id					AS	system_id,
			e.sub_department_nm					AS	sub_department_nm,
			CASE WHEN has_hypertension			= 'Yes'	THEN	'Hypertension '	ELSE	''	END
				+ CASE WHEN is_diabetic			= 'Yes'	THEN	'Diabetic '		ELSE	''	END
				+ CASE WHEN has_skin_problem	= 'Yes'	THEN	'Skin Problem '	ELSE	''	END
				+ CASE WHEN has_epillepsy		= 'Yes'	THEN	'Epilepsy '		ELSE	''	END
				+ COALESCE (dbo.GetOtherDisabilities (s.sewadar_id), '') AS	ailment,
			c.centre_cd							AS	satsang_centre_cd,
			b.sewadar_grno						AS	sewadar_gr_no
	FROM	sewadars_badges	b
		JOIN	sewadars_registrations	r
			ON	(	b.badge_id			BETWEEN	@p_from_badge_id	AND	@p_till_badge_id
				AND	b.satsang_centre_id	=	r.satsang_centre_id
				AND	b.sewadar_grno		=	r.sewadar_grno
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
		JOIN	ZSM_Photos..sewadars_photos	h
			ON	(	h.sewadar_id	=	r.sewadar_id	)
		JOIN	sewadars_details	d
			ON	(	d.sewadar_id	=	r.sewadar_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
		LEFT JOIN	sub_departments	e
			ON	(	e.sub_department_id	=	r.sub_department_id	)
	ORDER BY	b.sewadar_grno;
END
GO

-- =============================================================================
-- Procedure GetConstructionSewaBadgeInfo
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetConstructionSewaBadgeInfo' AND xtype = 'P')
	DROP PROCEDURE GetConstructionSewaBadgeInfo
GO

CREATE PROCEDURE GetConstructionSewaBadgeInfo
(
	@p_from_badge_id 		INTEGER,
	@p_till_badge_id		INTEGER,
	@p_satsang_centre_id 	satsang_centre_id,		
	@p_badge_template_id	badge_template_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	dbo.GetBadgeLineInfo	(	m.top_line_part_1_type, m.top_line_part_1_text, m.top_line_parts_separator, m.top_line_part_2_type, m.top_line_part_2_text,
										d.department_nm, e.sub_department_cd, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	top_line_text,
			s.first_nm + ' ' + s.last_nm		AS	sewadar_nm,
			c.centre_cd							AS	satsang_centre_cd,
			b.sewadar_grno						AS	sewadar_gr_no,
			s.sewadar_id						AS	system_id,
			DATEPART (YY, b.expiry_dt)			AS	valid_upto_yr,
			dbo.GetBadgeLineInfo	(	m.middle_line_part_1_type, m.middle_line_part_1_text, m.middle_line_parts_separator, m.middle_line_part_2_type, m.middle_line_part_2_text,
										d.department_nm, e.sub_department_cd, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	middle_line_text,
			dbo.GetBadgeLineInfo	(	m.bottom_line_part_1_type, m.bottom_line_part_1_text, m.bottom_line_parts_separator, m.bottom_line_part_2_type, m.bottom_line_part_2_text,
										d.department_nm, e.sub_department_cd, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	bottom_line_text,
			c.secretary_signature				AS	secretary_signature,
			h.sewadar_photo						AS	sewadar_photo
	FROM	sewadars_badges	b
		JOIN	sewadars_registrations	r
			ON	(	b.badge_id			BETWEEN	@p_from_badge_id	AND	@p_till_badge_id
				AND	b.satsang_centre_id	=	r.satsang_centre_id
				AND	b.sewadar_grno		=	r.sewadar_grno
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
		JOIN	ZSM_Photos..sewadars_photos	h
			ON	(	h.sewadar_id	=	r.sewadar_id	)
		JOIN	departments	d
			ON	(	d.department_id	=	r.department_id	)
		JOIN	badge_templates	m
			ON	(	m.badge_template_id		=	@p_badge_template_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
		LEFT JOIN	sub_departments	e
			ON	(	e.sub_department_id	=	r.sub_department_id	)
		LEFT JOIN	weekly_sewa_locations	w
			ON	(	w.weekly_sewa_location_id	=	r.weekly_sewa_location_id	)
	ORDER BY	b.badge_id;
END
GO

-- =============================================================================
-- Procedure GetTraineeSewaBadgeInfo
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetTraineeSewadarsBadgeInfo' AND xtype = 'P')
	DROP PROCEDURE GetTraineeSewadarsBadgeInfo
GO

CREATE PROCEDURE GetTraineeSewadarsBadgeInfo
(
	@p_from_badge_id 		INTEGER,
	@p_till_badge_id		INTEGER,
	@p_satsang_centre_id 	satsang_centre_id,
	@p_badge_template_id	badge_template_id
)
WITH ENCRYPTION
AS
BEGIN
	DECLARE	@tbl	TABLE	(	sewa_id		INTEGER	PRIMARY KEY,
								start_month	CHAR (3),
								end_month	CHAR (3),
								start_YEAR	CHAR (4),
								end_YEAR	CHAR (4),
								valid_text	VARCHAR (100)
							)

	INSERT INTO @tbl
			(	sewa_id, start_month, end_month, start_year, end_year	)
		SELECT	DISTINCT	sw.sewa_id, SUBSTRING (CONVERT (VARCHAR, start_dt, 6), 4,3), SUBSTRING (CONVERT (VARCHAR, finish_dt, 6), 4,3), YEAR (start_dt), YEAR (finish_dt)
		FROM	sewadars_badges	b
			JOIN	sewadars_registrations	r
				ON	(	b.badge_id			BETWEEN	@p_from_badge_id	AND	@p_till_badge_id
					AND	b.satsang_centre_id	=	r.satsang_centre_id
					AND	b.sewadar_grno		=	r.sewadar_grno
					)
			JOIN	sewas sw
				ON	(	sw.sewa_id = r.sewa_id		);

	UPDATE	@tbl
		SET	valid_text	= start_month + ' ' + start_year
	WHERE	start_month	= end_month
	AND		start_year	= end_year;

	UPDATE	@tbl
		SET	valid_text	= start_month + '-' + end_month +' ' + start_year
	WHERE	start_month	!= end_month
	AND		start_year	= end_year;

	UPDATE	@tbl
		SET	valid_text	= start_month + '' + SUBSTRING (start_year, 3, 2) + '-' + end_month +' ' + SUBSTRING (end_year, 3, 2)
	WHERE	start_year	!= end_year;

	SELECT	dbo.GetBadgeLineInfo	(	m.top_line_part_1_type, m.top_line_part_1_text, m.top_line_parts_separator, m.top_line_part_2_type, m.top_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, dc.district_nm + '(' + SUBSTRING (st.state_nm, 1, 3) + '.)'
									)			AS	top_line_text,
			s.first_nm + ' ' + s.last_nm		AS	sewadar_nm,
			c.centre_cd							AS	satsang_centre_cd,
			b.sewadar_grno						AS	sewadar_gr_no,
			s.sewadar_id						AS	system_id,
			valid_text							AS	valid_upto_yr,
			dbo.GetBadgeLineInfo	(	m.middle_line_part_1_type, m.middle_line_part_1_text, m.middle_line_parts_separator, m.middle_line_part_2_type, m.middle_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, dc.district_nm + '(' + SUBSTRING (st.state_nm, 1, 3) + '.)'
									)			AS	middle_line_text,
			dbo.GetBadgeLineInfo	(	m.bottom_line_part_1_type, dc.district_nm, m.bottom_line_parts_separator, m.bottom_line_part_2_type, m.bottom_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, dc.district_nm + '(' + SUBSTRING (st.state_nm, 1, 3) + '.)'
									)			AS	bottom_line_text,
			c.secretary_signature				AS	secretary_signature,
			t.sewadar_photo						AS	sewadar_photo
	FROM	sewadars_badges	b
		JOIN	sewadars_registrations	r
			ON	(	b.badge_id			BETWEEN	@p_from_badge_id	AND	@p_till_badge_id
				AND	b.satsang_centre_id	=	r.satsang_centre_id
				AND	b.sewadar_grno		=	r.sewadar_grno
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
		LEFT	JOIN	ZSM_Photos..sewadars_photos	t
			ON	(	t.sewadar_id	=	r.sewadar_id	)
		JOIN	departments	d
			ON	(	d.department_id	=	r.department_id	)
		JOIN	badge_templates	m
			ON	(	m.badge_template_id		=	@p_badge_template_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
		LEFT JOIN	sub_departments	e
			ON	(	e.sub_department_id		=	r.sub_department_id	)
		JOIN	@tbl sw
			ON	(	sw.sewa_id = r.sewa_id		)
		JOIN	CDB..districts_or_cities dc
			ON	(	dc.district_or_city_id = r.location_district_id		)
		JOIN	CDB..states st
			ON	(	st.state_id = dc.state_id		)
	ORDER BY	b.badge_id;
END
GO


-- =============================================================================
-- Procedure GetTriangularSewadarFrontInfo
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetTriangularSewadarFrontInfo' AND xtype = 'P')
	DROP PROCEDURE GetTriangularSewadarFrontInfo
GO

CREATE PROCEDURE GetTriangularSewadarFrontInfo
(
	@p_from_badge_id 		INTEGER,
	@p_till_badge_id		INTEGER,
	@p_satsang_centre_id 	satsang_centre_id,		
	@p_badge_template_id	badge_template_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	dbo.GetBadgeLineInfo	(	m.top_line_part_1_type, m.top_line_part_1_text, m.top_line_parts_separator, m.top_line_part_2_type, m.top_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	top_line_text,
			f.red_component						AS	fore_red,
			f.green_component					AS	fore_blue,
			f.blue_component					AS	fore_green,
			k.red_component						AS	back_red,
			k.green_component					AS	back_blue,
			k.blue_component					AS	back_green,
			s.first_nm + ' ' + s.last_nm		AS	sewadar_nm,
			b.sewadar_grno						AS	sewadar_gr_no,
			DATEPART (YY, b.expiry_dt)			AS	valid_upto_yr,
			dbo.GetBadgeLineInfo	(	m.middle_line_part_1_type, m.middle_line_part_1_text, m.middle_line_parts_separator, m.middle_line_part_2_type, m.middle_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	middle_line_text,
			dbo.GetBadgeLineInfo	(	m.bottom_line_part_1_type, m.bottom_line_part_1_text, m.bottom_line_parts_separator, m.bottom_line_part_2_type, m.bottom_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	bottom_line_text,
			c.secretary_signature				AS	secretary_signature,
			CASE WHEN has_hypertension			= 'Yes'	THEN	'Hypertension '	ELSE	''	END
				+ CASE WHEN is_diabetic			= 'Yes'	THEN	'Diabetic '		ELSE	''	END
				+ CASE WHEN has_skin_problem	= 'Yes'	THEN	'Skin Problem '	ELSE	''	END
				+ CASE WHEN has_epillepsy		= 'Yes'	THEN	'Epilepsy '		ELSE	''	END
				+ COALESCE (dbo.GetOtherDisabilities (s.sewadar_id), '') AS	ailment,
			t.sewadar_photo						AS	sewadar_photo
	FROM	sewadars_badges	b
		JOIN	sewadars_registrations	r
			ON	(	b.badge_id			BETWEEN	@p_from_badge_id	AND	@p_till_badge_id
				AND	b.satsang_centre_id	=	r.satsang_centre_id
				AND	b.sewadar_grno		=	r.sewadar_grno
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
		JOIN	sewadars_details	h
			ON	(	h.sewadar_id	=	r.sewadar_id	)
		JOIN	ZSM_Photos..sewadars_photos	t
			ON	(	t.sewadar_id	=	r.sewadar_id	)
		JOIN	departments	d
			ON	(	d.department_id	=	r.department_id	)
		JOIN	badge_templates	m
			ON	(	m.badge_template_id		=	@p_badge_template_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
		LEFT JOIN	sub_departments	e
			ON	(	e.sub_department_id	=	r.sub_department_id	)
		LEFT JOIN	weekly_sewa_locations	w
			ON	(	w.weekly_sewa_location_id	=	r.weekly_sewa_location_id	)
		LEFT JOIN	colours	f
			ON	(	f.colour_id	=	CASE	m.foreground_colour_control	WHEN	'Colour'		THEN	m.foreground_colour_id
																		WHEN	'Centre'		THEN	c.colour_id
																		WHEN	'Department'	THEN	d.colour_id
									END
				)
		LEFT JOIN	colours	k
			ON	(	k.colour_id	=	CASE	m.background_colour_control	WHEN	'Colour'		THEN	m.background_colour_id
																		WHEN	'Centre'		THEN	c.colour_id
																		WHEN	'Department'	THEN	d.colour_id
									END
				)
	ORDER BY	b.badge_id;
END
GO


-- =============================================================================
-- Procedure GetTriangularSewadarBackInfo
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetTriangularSewadarBackInfo' AND xtype = 'P')
	DROP PROCEDURE GetTriangularSewadarBackInfo
GO

CREATE PROCEDURE GetTriangularSewadarBackInfo
(
	@p_from_badge_id 		INTEGER,
	@p_till_badge_id		INTEGER,
	@p_satsang_centre_id 	satsang_centre_id,		
	@p_badge_template_id	badge_template_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	s.sewadar_id			AS	system_id,
			b.sewadar_grno			AS	sewadar_gr_no,
			e.sub_department_nm		AS	sub_department_nm,
			c.centre_cd				AS	satsang_centre_cd
	FROM	sewadars_badges	b
		JOIN	sewadars_registrations	r
			ON	(	b.badge_id			BETWEEN	@p_from_badge_id	AND	@p_till_badge_id
				AND	b.satsang_centre_id	=	r.satsang_centre_id
				AND	b.sewadar_grno		=	r.sewadar_grno
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
		LEFT JOIN	sub_departments	e
			ON	(	e.sub_department_id	=	r.sub_department_id	)
	ORDER BY	b.badge_id;
END
GO


-- =============================================================================
-- Procedure GetSewadarRosterHeaders
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSewadarRosterHeaders' AND xtype = 'P')
	DROP PROCEDURE GetSewadarRosterHeaders
GO

CREATE PROCEDURE GetSewadarRosterHeaders
(
	@p_team_id			gnc_nm
)
WITH ENCRYPTION
AS
	DECLARE
		@col1		VARCHAR (5),
		@col2		VARCHAR (5),
		@col3		VARCHAR (5),
		@col4		VARCHAR (5),
		@col5		VARCHAR (5),
		@col6		VARCHAR (5),
		@col7		VARCHAR (5),
		@col8		VARCHAR (5),
		@col9		VARCHAR (5),
		@col0		VARCHAR (5),
		@coltxt		VARCHAR (50),
		@ctr		INT,
		@mth1		gnc_nm,
		@mth2		gnc_nm,
		@centre_nm	VARCHAR (30),
		@sewa_nm	VARCHAR (60),
		@team_nm	VARCHAR (60),
		@start_dt	DATETIME,
		@finish_dt	DATETIME;

BEGIN
	SELECT	@centre_nm	=	centre_nm,
			@sewa_nm	=	sewa_nm,
			@team_nm	=	sewa_team_nm,
			@start_dt	=	start_dt,
			@finish_dt	=	finish_dt,
			@mth1		=	dbo.GetMonthText (MONTH (start_dt)),
			@mth2		=	dbo.GetMonthText (MONTH (finish_dt))
	FROM	sewa_teams	t
		JOIN	sewas	s
			ON	(	t.sewa_team_id	=	@p_team_id
				AND	t.sewa_id		=	s.sewa_id
				)
		JOIN	satsang_centres_details	c
			ON	(	s.satsang_centre_id	=	c.satsang_centre_id	);

	SET @ctr = 1;
	WHILE (@start_dt <= @finish_dt)
	BEGIN
		IF (@ctr = 1)
			SET	@col1 = dbo.GetDayText (Day(@start_dt));
		ELSE IF (@ctr = 2)
			SET	@col2 = dbo.GetDayText (Day(@start_dt));
		ELSE IF (@ctr = 3)
			SET	@col3 = dbo.GetDayText (Day(@start_dt));
		ELSE IF (@ctr = 4)
			SET	@col4 = dbo.GetDayText (Day(@start_dt));
		ELSE IF (@ctr = 5)
			SET	@col5 = dbo.GetDayText (Day(@start_dt));
		ELSE IF (@ctr = 6)
			SET	@col6 = dbo.GetDayText (Day(@start_dt));
		ELSE IF (@ctr = 7)
			SET	@col7 = dbo.GetDayText (Day(@start_dt));
		ELSE IF (@ctr = 8)
			SET	@col8 = dbo.GetDayText (Day(@start_dt));
		ELSE IF (@ctr = 9)
			SET	@col9 = dbo.GetDayText (Day(@start_dt));
		ELSE
			SET	@col0 = dbo.GetDayText (Day(@start_dt));
		SET @ctr = @ctr + 1;
		SET @start_dt = @start_dt + 1;
	END

	SELECT	1				AS	session_id,
			@centre_nm		AS	satsang_centre_nm,
			@sewa_nm		AS	sewa_nm,
			@team_nm		AS	team_nm,
			CASE WHEN @mth1 = @mth2
					THEN	@mth1
					ELSE	@mth1 + '     ' + @mth2	
			END				AS	column_text,			---- December January
			'G R'			AS	vertical_col_1_text_line_1,		----- G R
			'No'			AS	vertical_col_1_text_line_2,		----  No
			'L T D'			AS	vertical_col_2_text_line_1,		----- L T D
			'Attnd'			AS	vertical_col_2_text_line_2,		----  Attnd
			'L T D'			AS	vertical_col_3_text_line_1,		----- L T D
			'Attnd'			AS	vertical_col_3_text_line_2,		----  Attnd
			@col1			AS  column_1,				----- 26
			@col2			AS  column_2,
			@col3			AS  column_3,
			@col4			AS  column_4,
			@col5			AS  column_5,
			@col6			AS  column_6,
			@col7			AS  column_7,
			@col8			AS  column_8,
			@col9			AS  column_9,
			@col0			AS  column_10;
END
GO

-- =============================================================================
-- Procedure GetSewadarRosterDetails
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSewadarRosterDetails' AND xtype = 'P')
	DROP PROCEDURE GetSewadarRosterDetails
GO


CREATE PROCEDURE GetSewadarRosterDetails
(	
	@p_sewa_id					sewa_id,
	@p_team_id					sewa_team_id,
	@p_prev_year_sewa_id		sewa_id,
	@p_prev_2nd_year_sewa_id	sewa_id,
	@p_prev_3rd_year_sewa_id	sewa_id,
	@p_construction_sewa_id		sewa_id,
	@p_NonInitiateTeam			Boolean
)
WITH ENCRYPTION
AS
BEGIN
	DECLARE
		@sewa_frequency		VARCHAR (10),	-- Daily, Weekly, Monthly, Arbitrary
		@attendance_unit	VARCHAR (10),	-- Day, Hours, Duration
		@attendance_marking	VARCHAR (10),	-- Team-wise, Arbitrary, Summary
		@third_start_dt		SMALLDATETIME,
		@second_start_dt	SMALLDATETIME,
		@start_dt			SMALLDATETIME,
		@rval				INT,
		@finish_dt			SMALLDATETIME

	IF (@p_prev_3rd_year_sewa_id IS NOT NULL AND @p_prev_3rd_year_sewa_id <> '')
	BEGIN
		EXEC	@rval =	SummariseSewa	@p_prev_3rd_year_sewa_id
		IF (@rval != 0)
			RETURN @rval;
	END

	IF (@p_prev_2nd_year_sewa_id IS NOT NULL AND @p_prev_2nd_year_sewa_id <> '')
	BEGIN
		EXEC	@rval =	SummariseSewa	@p_prev_2nd_year_sewa_id
		IF (@rval != 0)
			RETURN @rval;
	END

	IF (@p_prev_year_sewa_id IS NOT NULL AND @p_prev_year_sewa_id <> '')
	BEGIN
		EXEC	@rval =	SummariseSewa	@p_prev_year_sewa_id
		IF (@rval != 0)
			RETURN @rval;
	END

	IF (@p_construction_sewa_id IS NOT NULL AND @p_construction_sewa_id <> '')
	BEGIN
		EXEC	@rval =	SummariseSewa	@p_construction_sewa_id
		IF (@rval != 0)
			RETURN @rval;
	END

--	EXEC	SummariseSewa	@p_prev_days_sewa_id

	IF (@p_prev_3rd_year_sewa_id IS NOT NULL AND @p_prev_3rd_year_sewa_id <> '')
		BEGIN
			SELECT	@third_start_dt	=	start_dt
			FROM	sewas
			WHERE	sewa_id	=	@p_prev_3rd_year_sewa_id
		END

	IF (@p_prev_2nd_year_sewa_id IS NOT NULL AND @p_prev_2nd_year_sewa_id <> '')
		BEGIN
			SELECT	@second_start_dt	=	start_dt
			FROM	sewas
			WHERE	sewa_id	=	@p_prev_2nd_year_sewa_id
		END

	IF (@p_prev_year_sewa_id IS NOT NULL AND @p_prev_year_sewa_id <> '')
		BEGIN
			SELECT	@start_dt			=	start_dt,
					@sewa_frequency		=	sewa_frequency,
					@attendance_unit	=	attendance_unit,
					@attendance_marking	=	attendance_marking,
					@finish_dt			=	finish_dt
			FROM	sewas
			WHERE	sewa_id	=	@p_prev_year_sewa_id
		END

	IF (@p_prev_2nd_year_sewa_id IS NOT NULL AND @p_prev_2nd_year_sewa_id <> ''
			AND @p_prev_year_sewa_id IS NOT NULL AND @p_prev_year_sewa_id <> '')
		BEGIN
			IF (@p_prev_2nd_year_sewa_id = @p_prev_year_sewa_id)
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'ObjectCannotBe', NULL, 'Start of Previous Year Sewa', 'same as start of Previous 2nd Year Sewa', NULL
					RETURN -1;
				END
			IF (@second_start_dt > @start_dt)
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'InvalidPeriod', NULL, 'Previous 2nd Year Sewa', 'Previous Year Sewa', NULL
					RETURN -2;
				END
		END

	IF (@p_prev_3rd_year_sewa_id IS NOT NULL AND @p_prev_3rd_year_sewa_id <> ''
			AND @p_prev_2nd_year_sewa_id IS NOT NULL AND @p_prev_2nd_year_sewa_id <> '')
		BEGIN
			IF (@p_prev_3rd_year_sewa_id = @p_prev_2nd_year_sewa_id)
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'ObjectCannotBe', NULL, 'Start of Previous 2nd Year Sewa', 'same as start of Previous 3rd Year Sewa', NULL
					RETURN -3;
				END
			IF (@third_start_dt > @second_start_dt)
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'InvalidPeriod', NULL, 'Previous 3rd Year Sewa', 'Previous 2nd Year Sewa', NULL
					RETURN -4;
				END
		END

	IF (@p_prev_3rd_year_sewa_id IS NOT NULL AND @p_prev_3rd_year_sewa_id <> ''
			AND @p_prev_year_sewa_id IS NOT NULL AND @p_prev_year_sewa_id <> '')
		BEGIN
			IF (@p_prev_3rd_year_sewa_id = @p_prev_year_sewa_id)
				BEGIN
					EXEC SysAdmin..RaiseErrorMessage 'ObjectCannotBe', NULL, 'Start of Previous 3rd Year Sewa', 'same as start of Previous Year Sewa', NULL
					RETURN -5;
				END
		END

	DECLARE	@roster	TABLE
		(	team_id					INTEGER			NOT NULL,
			serial_id				INTEGER			NOT NULL,
			sewadar_id				INTEGER			NOT NULL,
			satsang_centre_id		INTEGER			NOT NULL,
			sewadar_grno			CHAR (6)		NOT NULL,
			sewadar_nm				VARCHAR	(100)	NOT NULL,
			status					VARCHAR	(4)			NULL,
			responsibility			CHAR (2)			NULL,
			telephone				VARCHAR	(100)		NULL,
			appointment_dt			DATETIME		NOT NULL,
			age						SMALLINT		NOT NULL,

			v_col_1_text_line_1		VARCHAR	(10)		NULL,		----- G R No
			v_col_1_text_line_2		VARCHAR	(2)			NULL,		----- Satsang Centre Code of Sewadar, if Satsang Centre not same as that of Sewa
			v_col_1_text_line_3		VARCHAR	(10)		NULL,		----  Responsibility
			v_col_1_text_line_4		VARCHAR	(10)		NULL,		----  Status Temp (if Temporary Sewadar)
                                                                                                                                                   
			v_col_2_text_line_1		VARCHAR	(10)		NULL,		--- Construnction Attendance
			v_col_2_text_line_2		VARCHAR	(10)		NULL,		--- 3rd last year
			v_col_2_text_line_3		VARCHAR	(10)		NULL,		--- 2nd last year
			v_col_2_text_line_4		VARCHAR	(10)		NULL,		--- Last Year
                                                                                                                                                   
			v_col_3_text_line_1		VARCHAR	(10)		NULL,		----- P
			v_col_3_text_line_2		VARCHAR	(10)		NULL,		----- A
			v_col_3_text_line_3		VARCHAR	(10)		NULL,		----- N
                                                                                                                                                   
			main_col_text_line_1	VARCHAR	(100)		NULL,		--- Name
			main_col_text_line_2	VARCHAR	(10)		NULL,		--- Age - 34
			main_col_text_line_3	VARCHAR	(100)		NULL,		--- Telephone
			main_col_text_line_4	VARCHAR	(10)		NULL,

			sewadar_address			VARCHAR(400)		NULL,

				PRIMARY KEY	(	team_id, serial_id	)
		);
	
	INSERT	INTO	@roster
		SELECT	x.sewa_team_id,
				x.serial_id,
				s.sewadar_id, 
				x.satsang_centre_id,
				x.sewadar_grno,
				RTRIM (s.first_nm) + ' ' + COALESCE (SUBSTRING (s.middle_nm, 1, 1) + '. ', '') + RTRIM (s.last_nm),
				COALESCE (s.global_sewadar_status_cd, r.sewadar_status_cd),
				CASE r.responsibility WHEN 'Head' THEN 'H1' WHEN 'Second Head' THEN 'H2' WHEN 'Third Head' THEN 'H3' WHEN 'Fourth Head' THEN 'H4' ELSE NULL END,
				COALESCE (y.telephone_mobile, COALESCE (y.telephone_residence, SPACE(0))),
				r.appointment_dt,
				DATEDIFF (yy, s.birth_dtm, GETDATE ()),

				x.sewadar_grno,
				NULL,
				NULL,		----  Satsang Centre Code of Sewadar, if Satsang Centre not same as that of Sewa
				CASE COALESCE (s.global_sewadar_status_cd, r.sewadar_status_cd) WHEN 'TEMP' THEN 'TEMP' END,		----  Temp (if Temporary Sewadar)
                                                                                                           
				NULL,		--- Construnction Attendance
				NULL,			--- 3rd last year
				NULL,			--- 2nd last year
				NULL,			--- Last Year
                                                                                                           
				NULL,		----- P
				NULL,		----- A
				NULL,		----- N
                                                                                                           
				NULL,		--- Name
				NULL,		--- Age - 34
				NULL,		--- Telephone
				NULL,

				RTRIM (a.address_line_1) + ', ' + COALESCE (RTRIM (a.address_line_2) + ', ', '')
						+ RTRIM (p.post_office_or_city_nm) + ', '
						+ RTRIM (d.district_nm)
						+ CASE WHEN c.country_nm = 'India' THEN '' ELSE ', ' + stt.state_nm + ', ' + c.country_nm END
						+ ' - ' + RTRIM (a.pin_or_zip_code)
		FROM	sewa_teams	t
			JOIN	sewa_team_wise_sewadars	x
				ON	(	x.sewa_team_id		=	t.sewa_team_id
					AND	t.sewa_id			=	@p_sewa_id
					AND	t.sewa_team_id		=	@p_team_id
					)
		JOIN	sewadars AS s
				ON	(	x.satsang_centre_id	= s.current_satsang_centre_id
					AND	x.sewadar_grno		= s.current_sewadar_grno
					)
		JOIN	sewadars_registrations AS r
				ON	(	x.satsang_centre_id	= r.satsang_centre_id
					AND	x.sewadar_grno		= r.sewadar_grno
					)
		JOIN	sewadars_details AS y
				ON	(	y.sewadar_id		= s.sewadar_id	)
		LEFT JOIN	sewadars_addresses	a
			ON	(	a.sewadar_id	=	r.sewadar_id
				AND	a.address_type	=	'Residence'
				)
		LEFT JOIN	post_offices_or_cities	p
			ON	(	p.post_office_or_city_id	=	a.post_office_or_city_id	)
		LEFT JOIN	CDB..districts_or_cities	d
			ON	(	d.district_or_city_id	=	p.district_id	)
		LEFT JOIN	CDB..states AS stt
				ON	(	d.state_id	=	stt.state_id)
		LEFT JOIN	CDB..countries AS c
				ON	(	stt.country_id	=	c.country_id);
	
	UPDATE @roster
		SET	v_col_1_text_line_1		=	sewadar_grno,
			v_col_1_text_line_2		=	responsibility,
			main_col_text_line_1	=	UPPER(sewadar_nm),
			main_col_text_line_2	=	'Age - ' + CONVERT (VARCHAR, age),
			main_col_text_line_3	=	telephone;

		-- Note. Update Construction Sewa Attendance
	IF (@p_construction_sewa_id IS NOT NULL AND @p_construction_sewa_id <> '')
		BEGIN
			UPDATE	@roster
				SET	v_col_2_text_line_1	=	b.present_cnt
			FROM	@roster		a,
					sewadar_wise_sewa_summaries	b,
					sewas		c
			WHERE	a.satsang_centre_id	=	b.satsang_centre_id
			AND		a.sewadar_grno	=	b.sewadar_grno
			AND		b.sewa_id		=	@p_construction_sewa_id
			AND		c.sewa_id		=	b.sewa_id
			AND		b.present_cnt	>	0;
		END

		-- Note. Update previous three years attendance years
	IF (@p_prev_3rd_year_sewa_id IS NOT NULL AND @p_prev_3rd_year_sewa_id <> '')
		BEGIN
			UPDATE	@roster
				SET	v_col_2_text_line_2	=	YEAR (c.start_dt)
			FROM	@roster		a,
					sewadar_wise_sewa_summaries	b,
					sewas		c
			WHERE	a.satsang_centre_id	=	b.satsang_centre_id
			AND		a.sewadar_grno	=	b.sewadar_grno
			AND		b.sewa_id		=	@p_prev_3rd_year_sewa_id
			AND		c.sewa_id		=	b.sewa_id
			AND		b.present_cnt	>=	1
		END

	IF (@p_prev_2nd_year_sewa_id IS NOT NULL AND @p_prev_2nd_year_sewa_id <> '')
		BEGIN
			UPDATE	@roster
				SET	v_col_2_text_line_3	=	YEAR (c.start_dt)
			FROM	@roster		a,
					sewadar_wise_sewa_summaries	b,
					sewas		c
			WHERE	a.satsang_centre_id	=	b.satsang_centre_id
			AND		a.sewadar_grno	=	b.sewadar_grno
			AND		b.sewa_id		=	@p_prev_2nd_year_sewa_id
			AND		c.sewa_id		=	b.sewa_id
			AND		b.present_cnt	>=	1
		END

	IF (@p_prev_year_sewa_id IS NOT NULL AND @p_prev_year_sewa_id <> '')
		BEGIN					------ [
			UPDATE	@roster
				SET	v_col_2_text_line_4	=	YEAR (c.start_dt)
			FROM	@roster		a,
					sewadar_wise_sewa_summaries	b,
					sewas		c
			WHERE	a.satsang_centre_id	=	b.satsang_centre_id
			AND		a.sewadar_grno		=	b.sewadar_grno
			AND		b.sewa_id			=	@p_prev_year_sewa_id
			AND		c.sewa_id		=	b.sewa_id
			AND		b.present_cnt		>=	1

				--- NOTE. LAST THREE DAYS
			IF (@sewa_frequency = 'Daily' AND @attendance_unit = 'Day')
				BEGIN					------ [
					IF (@attendance_marking = 'Team-wise')
						BEGIN				----- [
							--- NOTE. LAST THREE DAYS

							--- Note. New sewadars
							UPDATE	@roster
								SET	v_col_3_text_line_1	=	'N',
									v_col_3_text_line_2	=	'N',
									v_col_3_text_line_3	=	'N'
							WHERE	appointment_dt	>	@finish_dt

							SET	@start_dt	=	@finish_dt - 2;

							---- Note. Third last day
							UPDATE	a
								SET	v_col_3_text_line_1	=	attendance
							FROM	@roster		a
								JOIN	sewa_teams	b
									ON	(	b.sewa_id	=	@p_prev_year_sewa_id
										AND	a.v_col_3_text_line_1	IS NULL
										)
								JOIN	sewa_team_wise_sewadars		c
									ON	(	a.satsang_centre_id	=	c.satsang_centre_id
										AND	a.sewadar_grno		=	c.sewadar_grno
										AND	b.sewa_team_id		=	c.sewa_team_id
										)
								JOIN	team_wise_daily_attendance	d
									ON	(	d.sewa_team_id	=	c.sewa_team_id
										AND	d.serial_id		=	c.serial_id
										AND	d.attendance_dt	=	@start_dt
										);

							---- Note. Second last day
							SELECT	@start_dt = @start_dt + 1

							UPDATE	a
								SET	v_col_3_text_line_2	=	attendance
							FROM	@roster		a
								JOIN	sewa_teams	b
									ON	(	b.sewa_id	=	@p_prev_year_sewa_id
										AND	a.v_col_3_text_line_2	IS NULL
										)
								JOIN	sewa_team_wise_sewadars		c
									ON	(	a.satsang_centre_id	=	c.satsang_centre_id
										AND	a.sewadar_grno		=	c.sewadar_grno
										AND	b.sewa_team_id		=	c.sewa_team_id
										)
								JOIN	team_wise_daily_attendance	d
									ON	(	d.sewa_team_id	=	c.sewa_team_id
										AND	d.serial_id		=	c.serial_id
										AND	d.attendance_dt	=	@start_dt
										);

							---- Note. Last day
							SELECT	@start_dt = @start_dt + 1

							UPDATE	a
								SET	v_col_3_text_line_3	=	attendance
							FROM	@roster		a
								JOIN	sewa_teams	b
									ON	(	b.sewa_id	=	@p_prev_year_sewa_id
										AND	a.v_col_3_text_line_3	IS NULL
										)
								JOIN	sewa_team_wise_sewadars		c
									ON	(	a.satsang_centre_id	=	c.satsang_centre_id
										AND	a.sewadar_grno		=	c.sewadar_grno
										AND	b.sewa_team_id		=	c.sewa_team_id
										)
								JOIN	team_wise_daily_attendance	d
									ON	(	d.sewa_team_id	=	c.sewa_team_id
										AND	d.serial_id		=	c.serial_id
										AND	d.attendance_dt	=	@start_dt
										);
							
						END				----- ]
				END					------ ]
		END						------ ]
	SELECT	team_id, serial_id, 
			--sewadar_grno, sewadar_nm, status, responsibility, telephone, age,
			v_col_1_text_line_1, v_col_1_text_line_2, v_col_1_text_line_3, v_col_1_text_line_4,
			v_col_2_text_line_1, v_col_2_text_line_2, v_col_2_text_line_3, v_col_2_text_line_4,
			v_col_3_text_line_1, v_col_3_text_line_2, v_col_3_text_line_3,
			main_col_text_line_1, main_col_text_line_2, main_col_text_line_3, main_col_text_line_4,
			sewadar_address, sewadar_photo
	FROM	@roster	r
		LEFT JOIN	ZSM_Photos..sewadars_photos	p
			ON	(	r.sewadar_id	=	p.sewadar_id	)
	ORDER BY team_id, serial_id;
END
GO

-- =============================================================================
-- Procedure GetHorizontalSpecialFrontInfo	- For RED ZONE PENDING
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetHorizontalSpecialFrontInfo' AND xtype = 'P')
	DROP PROCEDURE GetHorizontalSpecialFrontInfo
GO

CREATE PROCEDURE GetHorizontalSpecialFrontInfo
(
	@p_from_badge_id 		INTEGER,
	@p_till_badge_id		INTEGER,
	@p_satsang_centre_id	satsang_centre_id,
	@p_badge_template_id	badge_template_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	dbo.GetBadgeLineInfo	(	m.top_line_part_1_type, m.top_line_part_1_text, m.top_line_parts_separator, m.top_line_part_2_type, m.top_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	top_line_text,
			m.top_line_font_size,				
			f.red_component						AS	fore_red,
			f.green_component					AS	fore_blue,
			f.blue_component					AS	fore_green,
			k.red_component						AS	back_red,
			k.green_component					AS	back_blue,
			k.blue_component					AS	back_green,
			
			s.first_nm + ' ' + s.last_nm		AS	sewadar_nm,
			b.sewadar_grno						AS	sewadar_gr_no,
			m.middle_line_part_2_text			AS	valid_month_yr,
			dbo.GetBadgeLineInfo	(	m.middle_line_part_1_type, m.middle_line_part_1_text, NULL, NULL, NULL,
										d.department_nm, e.sub_department_nm, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	middle_line_text,
			m.middle_line_font_size,
			dbo.GetBadgeLineInfo	(	m.bottom_line_part_1_type, m.bottom_line_part_1_text, m.bottom_line_parts_separator, m.bottom_line_part_2_type, m.bottom_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	bottom_line_text,
			m.bottom_line_font_size,
			c.secretary_signature				AS	secretary_signature,
			h.sewadar_photo						AS	sewadar_photo
	FROM	sewadars_badges	b
		JOIN	sewadars_registrations	r
			ON	(	b.badge_id			BETWEEN	@p_from_badge_id	AND	@p_till_badge_id
				AND	b.satsang_centre_id	=	r.satsang_centre_id
				AND	b.sewadar_grno		=	r.sewadar_grno
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
		JOIN	ZSM_Photos..sewadars_photos	h
			ON	(	h.sewadar_id	=	r.sewadar_id	)
		JOIN	departments	d
			ON	(	d.department_id	=	r.department_id	)
		JOIN	badge_templates	m
			ON	(	m.badge_template_id		=	@p_badge_template_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
		LEFT JOIN	sub_departments	e
			ON	(	e.sub_department_id	=	r.sub_department_id	)
		LEFT JOIN	weekly_sewa_locations	w
			ON	(	w.weekly_sewa_location_id	=	r.weekly_sewa_location_id	)
		LEFT JOIN	sewadars_addresses	a
			ON	(	a.sewadar_id	=	r.sewadar_id
				AND	a.address_type	=	'Residence'
				)
		LEFT JOIN	post_offices_or_cities	p
			ON	(	p.post_office_or_city_id	=	a.post_office_or_city_id	)
		LEFT JOIN	CDB..districts_or_cities	t
			ON	(	t.district_or_city_id	=	p.district_id	)
		LEFT JOIN	colours	f
			ON	(	f.colour_id	=	CASE	m.foreground_colour_control	WHEN	'Colour'		THEN	m.foreground_colour_id
																		WHEN	'Centre'		THEN	c.colour_id
																		WHEN	'Department'	THEN	d.colour_id
									END
				)
		LEFT JOIN	colours	k
			ON	(	k.colour_id	=	CASE	m.background_colour_control	WHEN	'Colour'		THEN	m.background_colour_id
																		WHEN	'Centre'		THEN	c.colour_id
																		WHEN	'Department'	THEN	d.colour_id
									END
				)
	ORDER BY	b.badge_id;	
END
GO

-- =============================================================================
-- Procedure GetSewadarPrintDetails
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetSewadarPrintDetails' AND xtype = 'P')
	DROP PROCEDURE GetSewadarPrintDetails
GO

-- =============================================================================
-- Procedure GetVerticalSewadarFrontInfo
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetVerticalSewadarFrontInfo' AND xtype = 'P')
	DROP PROCEDURE GetVerticalSewadarFrontInfo
GO

CREATE PROCEDURE GetVerticalSewadarFrontInfo
(
	@p_from_badge_id 		INTEGER,
	@p_till_badge_id		INTEGER,
	@p_satsang_centre_id 	satsang_centre_id,		
	@p_badge_template_id	badge_template_id	
)
WITH ENCRYPTION
AS
BEGIN
SELECT	dbo.GetBadgeLineInfo	(	m.top_line_part_1_type, m.top_line_part_1_text, m.top_line_parts_separator, m.top_line_part_2_type, m.top_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	top_line_text,
			s.first_nm + ' ' + s.last_nm		AS	sewadar_nm,
			b.sewadar_grno						AS	sewadar_gr_no,
			CASE r.sewadar_status_cd	WHEN 'TEMP'	THEN	'T'	ELSE	''	END
												AS	temporary_text,
			DATEPART (YY, r.appointment_dt)		AS	appointment_yr,
			DATEPART (YY, b.expiry_dt)			AS	valid_upto_yr,
			dbo.GetBadgeLineInfo	(	m.bottom_line_part_1_type, m.bottom_line_part_1_text, m.bottom_line_parts_separator, m.bottom_line_part_2_type, m.bottom_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, w.weekly_sewa_location_nm
									)			AS	bottom_line_text,
			c.secretary_signature				AS	secretary_signature,
			h.sewadar_photo						AS	sewadar_photo
	FROM	sewadars_badges	b
		JOIN	sewadars_registrations	r
			ON	(	b.badge_id			BETWEEN	@p_from_badge_id	AND	@p_till_badge_id
				AND	b.satsang_centre_id	=	r.satsang_centre_id
				AND	b.sewadar_grno		=	r.sewadar_grno
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
		JOIN	ZSM_Photos..sewadars_photos	h
			ON	(	h.sewadar_id	=	r.sewadar_id	)
		JOIN	departments	d
			ON	(	d.department_id	=	r.department_id	)
		JOIN	badge_templates	m
			ON	(	m.badge_template_id		=	@p_badge_template_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
		LEFT JOIN	sub_departments	e
			ON	(	e.sub_department_id	=	r.sub_department_id	)
		LEFT JOIN	weekly_sewa_locations	w
			ON	(	w.weekly_sewa_location_id	=	r.weekly_sewa_location_id	)
		LEFT JOIN	sewadars_addresses	a
			ON	(	a.sewadar_id	=	r.sewadar_id
				AND	a.address_type	=	'Residence'
				)
		LEFT JOIN	post_offices_or_cities	p
			ON	(	p.post_office_or_city_id	=	a.post_office_or_city_id	)
		LEFT JOIN	CDB..districts_or_cities	t
			ON	(	t.district_or_city_id	=	p.district_id	)
	ORDER BY	b.badge_id;
END
GO


-- =============================================================================
-- Procedure GetVerticalSewadarBackInfo
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetVerticalSewadarBackInfo' AND xtype = 'P')
	DROP PROCEDURE GetVerticalSewadarBackInfo
GO

CREATE PROCEDURE GetVerticalSewadarBackInfo
(
	@p_from_badge_id 		INTEGER,
	@p_till_badge_id		INTEGER,
	@p_satsang_centre_id 	satsang_centre_id,		
	@p_badge_template_id	badge_template_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	s.sewadar_id					AS	system_id,
			CASE WHEN has_hypertension			= 'Yes'	THEN	'Hypertension '	ELSE	''	END
				+ CASE WHEN is_diabetic			= 'Yes'	THEN	'Diabetic '		ELSE	''	END
				+ CASE WHEN has_skin_problem	= 'Yes'	THEN	'Skin Problem '	ELSE	''	END
				+ CASE WHEN has_epillepsy		= 'Yes'	THEN	'Epilepsy '		ELSE	''	END
				+ COALESCE (dbo.GetOtherDisabilities (s.sewadar_id), '') AS	ailment,
			c.centre_cd							AS	satsang_centre_cd,
			b.sewadar_grno						AS	sewadar_gr_no
	FROM	sewadars_badges	b
		JOIN	sewadars_registrations	r
			ON	(	b.badge_id			BETWEEN	@p_from_badge_id	AND	@p_till_badge_id
				AND	b.satsang_centre_id	=	r.satsang_centre_id
				AND	b.sewadar_grno		=	r.sewadar_grno
				)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	r.sewadar_id	)
		JOIN	sewadars_details	h
			ON	(	h.sewadar_id	=	r.sewadar_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
	ORDER BY	b.badge_id;
END
GO

-- =============================================================================
-- Procedure GetIDCardSewaBadgeInfo
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetIDCardSewaBadgeInfo' AND xtype = 'P')
	DROP PROCEDURE GetIDCardSewaBadgeInfo
GO

CREATE PROCEDURE GetIDCardSewaBadgeInfo
(
	@p_from_badge_id 		INTEGER,
	@p_till_badge_id		INTEGER,
	@p_satsang_centre_id 	satsang_centre_id,		
	@p_badge_template_id	badge_template_id	
)
WITH ENCRYPTION
AS
BEGIN
		SELECT		'ID CARD -	' + c.centre_nm			AS	top_line_text,
					s.first_nm + ' ' + s.last_nm		AS	sewadar_nm,
					c.centre_cd							AS	satsang_centre_cd,
					b.sewadar_grno						AS	sewadar_gr_no,
					s.sewadar_id						AS	system_id,
					dbo.GetBadgeLineInfo	(	m.middle_line_part_1_type, m.middle_line_part_1_text, m.middle_line_parts_separator, m.middle_line_part_2_type, m.middle_line_part_2_text,
												d.department_cd, LTRIM(RTRIM(e.sub_department_cd)), c.centre_nm, ''
											)			AS	middle_line_text,
					CASE	w.satsang_centre_type	WHEN	'Point'			THEN COALESCE (y.satsang_centre_nm + ' - ', '')
													WHEN	'Sub Centre'	THEN COALESCE (y.satsang_centre_nm + ' - ', '')
													ELSE	''
					END	+ 	w.satsang_centre_nm 	AS	satsang_centre_nm,
					h.sewadar_photo						AS	sewadar_photo
			FROM	sewadars_badges	b
				JOIN	sewadars_registrations	r
					ON	(	b.badge_id			BETWEEN		@p_from_badge_id	AND	@p_till_badge_id
						AND	b.satsang_centre_id	=	r.satsang_centre_id
						AND	b.sewadar_grno		=	r.sewadar_grno
						)
				JOIN	sewadars	s
					ON	(	s.sewadar_id	=	r.sewadar_id	)
				JOIN	sewadars_details	sd
					ON	(	sd.sewadar_id	=	s.sewadar_id	)
				JOIN	ZSM_Photos..sewadars_photos	h
					ON	(	h.sewadar_id	=	r.sewadar_id	)
				JOIN	departments	d
					ON	(	d.department_id	=	r.department_id	)
				JOIN	badge_templates	m
					ON	(	m.badge_template_id		=	@p_badge_template_id	)
				JOIN	satsang_centres_details	c
					ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
				LEFT JOIN	sub_departments	e
					ON	(	e.sub_department_id	=	r.sub_department_id	)
				JOIN	CDB..satsang_centres	w
					ON	(	sd.weekly_satsang_centre_id	=	w.satsang_centre_id	)
				JOIN	satsang_centres_details	x
					ON	(	sd.weekly_satsang_centre_id	=	x.satsang_centre_id	)
				LEFT JOIN	CDB..satsang_centres	y
					ON	(	x.reports_to_centre_id	=	y.satsang_centre_id	)
			ORDER BY	b.badge_id;	
END
GO

-- =============================================================================
-- Procedure GetHorizontalSewadarFrontInfo
-- =============================================================================

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetDarshanSewaSeriesFrontInfo' AND xtype = 'P')
	DROP PROCEDURE GetDarshanSewaSeriesFrontInfo
GO

CREATE PROCEDURE GetDarshanSewaSeriesFrontInfo
(
	@p_from 				INTEGER,
	@p_till					INTEGER,
	@p_satsang_centre_id 	satsang_centre_id,		
	@p_badge_template_id	badge_template_id	
)
WITH ENCRYPTION
AS
BEGIN
	SELECT	dbo.GetBadgeLineInfo	(	m.top_line_part_1_type, m.top_line_part_1_text, m.top_line_parts_separator, m.top_line_part_2_type, m.top_line_part_2_text,
										'', '', c.centre_nm, ''
									)			AS	top_line_text,
			f.red_component						AS	fore_red,
			f.green_component					AS	fore_blue,
			f.blue_component					AS	fore_green,
			k.red_component						AS	back_red,
			k.green_component					AS	back_blue,
			k.blue_component					AS	back_green,
			c.centre_alphabet					AS	satsang_centre_alphabet,
			--dbo.GetBadgeLineInfo	(	m.middle_line_part_1_type, m.middle_line_part_1_text, m.middle_line_parts_separator, m.middle_line_part_2_type, m.middle_line_part_2_text,
			--							'', '', c.centre_nm, ''
			--						)	
									m.middle_line_part_1_text + CONVERT(VARCHAR(30), @p_from + ints.number)
												AS	middle_line_text,
			dbo.GetBadgeLineInfo	(	m.bottom_line_part_1_type, m.bottom_line_part_1_text, m.bottom_line_parts_separator, m.bottom_line_part_2_type, m.bottom_line_part_2_text,
										'', '', c.centre_nm, ''
									)			AS	bottom_line_text,
			c.secretary_signature				AS	secretary_signature
	FROM	master.dbo.spt_values   as ints
		JOIN badge_templates	m
			ON	(	m.badge_template_id		=	@p_badge_template_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
		LEFT JOIN	colours	f
			ON	(	f.colour_id	=	CASE	m.foreground_colour_control	WHEN	'Colour'		THEN	m.foreground_colour_id
																		WHEN	'Centre'		THEN	c.colour_id															
									END
				)
		LEFT JOIN	colours	k
			ON	(	k.colour_id	=	CASE	m.background_colour_control	WHEN	'Colour'		THEN	m.background_colour_id
																		WHEN	'Centre'		THEN	c.colour_id
									END
				)
	WHERE   ints.type   =   'P'         --only integers
		AND	ints.number <=  @p_till - @p_from

	ORDER BY	number;
END
GO


IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SelectDailyAttendanceList' AND xtype = 'P')
	DROP PROCEDURE SelectDailyAttendanceList
GO

CREATE PROCEDURE SelectDailyAttendanceList
(
	@p_satsang_centre_id	int,
	@p_sewa_id				sewa_id,
	@p_start_dt				SMALLDATETIME,
	@p_finish_dt			SMALLDATETIME,
	@p_department_ids		report_xml_prm,
	@p_sub_department_ids	report_xml_prm,
	@p_attendance			CHAR(1) = '%'
	)
AS
	DECLARE
		@sewa_nm					gnc_nm,
		@start_dt					SMALLDATETIME,
		@finish_dt					SMALLDATETIME,
		@sewa_frequency				CHAR (9),	-- Daily, Arbitrary
		@attendance_unit			CHAR (8),	-- Day, Shift
		@attendance_marking			CHAR (9),	-- Team-wise, Arbitrary, Summary
		@sewadar_grno				sewadar_grno,
		@dflt_rspns					CHAR (3),
		@status						CHAR (20),
		@satsang_centre_id			satsang_centre_id,
		@p_is_outstation		VARCHAR (3),
		@p_is_summary			Boolean
BEGIN
	SET @p_sub_department_ids = null 
	SET @p_is_outstation = '%'
	SET @p_is_summary = 'No'
	


	DECLARE	@depts		TABLE	(	id	INT	);
	DECLARE	@sub_depts	TABLE	(	id	INT	);
	DECLARE @hdoc INT;	

	SELECT	@sewa_nm				=	sewa_nm,
			@start_dt				=	start_dt,
			@finish_dt				=	finish_dt,
			@sewa_frequency			=	sewa_frequency,
			@attendance_unit		=	attendance_unit,
			@attendance_marking		=	attendance_marking,
			@satsang_centre_id		=	satsang_centre_id
	FROM	sewas
	WHERE	sewa_id		=	@p_sewa_id

	IF (@@ROWCOUNT = 0 OR @sewa_nm IS NULL OR @sewa_nm = '')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'NotExist', NULL, 'Sewa Information', NULL, NULL
			
		END
	
	IF (@p_department_ids IS NULL)
		INSERT INTO	@depts
			SELECT	department_id
			FROM	departments_satsang_centres
			WHERE	satsang_centre_id	=	@satsang_centre_id
			AND		effective_till	>	GetDate();
	ELSE
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_department_ids; 
		INSERT INTO	@depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT);
		EXEC sp_xml_removedocument @hdoc;
	END
		
	IF (@p_sub_department_ids IS NOT NULL)
	BEGIN
		EXEC sp_xml_preparedocument @hdoc OUTPUT, @p_sub_department_ids; 
		INSERT INTO	@sub_depts
			SELECT	DISTINCT	id
			FROM 	OPENXML (@hdoc, '/Root/r', 1)
				WITH	(id	INT) 
		EXEC sp_xml_removedocument @hdoc
	END	
		

	IF (@p_start_dt > @p_finish_dt)
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidPeriod', NULL, 'Starting date', 'Finish date', NULL

		END
		
	IF (@p_start_dt < @start_dt)
		SELECT	@p_start_dt = @start_dt

	IF (@p_finish_dt > @finish_dt)
		SELECT	@p_finish_dt = @finish_dt	

	IF (@sewa_frequency != 'Daily')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidValue', NULL, 'Sewa Frequency', 'Sewa', NULL

		END

	IF (@attendance_unit != 'Day')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidValue', NULL, 'Attendance Unit', 'Sewa', NULL

		END

	IF (@attendance_marking != 'Team-wise')
		BEGIN
			EXEC SysAdmin..RaiseErrorMessage 'InvalidValue', NULL, 'Attendance Marking', 'Sewa', NULL

		END
	
	IF (@attendance_marking = 'Team-wise')
		BEGIN
			SELECT	@dflt_rspns	= '   '

			SELECT	DISTINCT sw.sewadar_grno,
						s.first_nm + ' ' + s.middle_nm + ' ' + s.last_nm as Name,
						tda.attendance_dt		AS	dt,
						SPACE (1) + tda.attendance + SPACE (1)		AS	atndnc,
						ss.sewadar_status_nm,
						st.sewa_team_nm,
						s.gender
				INTO #SewadarAttendance
				FROM	sewa_teams		st
					JOIN	sewa_team_wise_sewadars		sw
						ON	(	st.sewa_id				=	@p_sewa_id
							AND	sw.sewa_team_id			=	st.sewa_team_id
							AND sw.transfer_out_dt	IS NULL
							)
					INNER JOIN	team_wise_daily_attendance	tda
						ON	(	tda.sewa_team_id	=		sw.sewa_team_id
							AND	tda.serial_id		=		sw.serial_id
							AND	tda.attendance_dt	BETWEEN	@p_start_dt AND @p_finish_dt
							AND tda.attendance		LIKE	@p_attendance							
							)
					JOIN	sewadars	s
						ON	( sw.sewadar_grno				=	s.current_sewadar_grno
							AND	s.current_satsang_centre_id		=	@p_satsang_centre_id)
					JOIN	sewadars_registrations	sr
						ON	(	sw.sewadar_grno				=	sr.sewadar_grno
							AND sr.satsang_centre_id		=	@p_satsang_centre_id
							AND	sr.is_outstation_sewadar	LIKE	@p_is_outstation
							)
					JOIN	system_information_values	iv
						ON	(	iv.system_info_cd		=		'SttsActv'
							AND	iv.value_varchar		=		sr.sewadar_status_cd
							)
					JOIN	sewadar_status	ss
						ON	(	sr.sewadar_status_cd	=	ss.sewadar_status_cd	)					
					JOIN	@depts
						ON	(	sr.department_id	=	id	)
					LEFT	JOIN	@sub_depts	x
						ON	(	sr.sub_department_id	=	x.id	)
					WHERE 
						(	@p_sub_department_ids	IS NOT NULL	AND	x.id	IS NOT NULL	)
							OR	( @p_sub_department_ids	IS NULL					)
						
		END

		
		DECLARE @columns NVARCHAR(MAX), @sql NVARCHAR(MAX);
		SET @columns = N'';
		SELECT @columns = STUFF((select N','+QUOTENAME(CONVERT(DATE,dt,102))
							FROM #SewadarAttendance 
							GROUP BY dt
							ORDER BY CONVERT(DateTime, dt,101)  Asc
							FOR XML PATH ('')), 1, 1, '')
		
		SET @sql = N'SELECT * FROM ( SELECT sewadar_grno, name, sewa_team_nm, sewadar_status_nm, atndnc, dt
			FROM #SewadarAttendance) AS j PIVOT (MAX(atndnc) FOR dt in 
			   ('+@columns+')) AS p 
			ORDER BY sewa_team_nm, name;';	
		
		EXEC (@sql)
	 DROP TABLE #SewadarAttendance
END
GO

-- =============================================================================
-- Procedure GetTraineeSewaBadgeInfo
-- =============================================================================
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'GetGuideSewadarsBadgeInfo' AND xtype = 'P')
	DROP PROCEDURE GetGuideSewadarsBadgeInfo
GO

CREATE PROCEDURE GetGuideSewadarsBadgeInfo
(
	@p_from_badge_id 		INTEGER,
	@p_till_badge_id		INTEGER,
	@p_satsang_centre_id 	satsang_centre_id,
	@p_badge_template_id	badge_template_id
)
WITH ENCRYPTION
AS
BEGIN

	SELECT	
			dbo.GetBadgeLineInfo	(	m.top_line_part_1_type, m.top_line_part_1_text, m.top_line_parts_separator, m.top_line_part_2_type, m.top_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, ''
									)			AS	top_line_text,
			m.top_line_font_size,				
			f.red_component						AS	fore_red,
			f.green_component					AS	fore_blue,
			f.blue_component					AS	fore_green,
			k.red_component						AS	back_red,
			k.green_component					AS	back_blue,
			k.blue_component					AS	back_green,

			s.first_nm + ' ' + s.last_nm		AS	sewadar_nm,
			c.centre_cd							AS	satsang_centre_cd,
			c.centre_nm							AS	satsang_centre_nm,
			b.sewadar_grno						AS	sewadar_gr_no,
			s.sewadar_id						AS	system_id,
			d.department_nm						AS	department_name,	
			sd.telephone_mobile					AS	phone_number,
			dbo.GetBadgeLineInfo	(	m.middle_line_part_1_type, m.middle_line_part_1_text, m.middle_line_parts_separator, m.middle_line_part_2_type, m.middle_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, ''
									)			AS	middle_line_text,
			m.middle_line_font_size,
			dbo.GetBadgeLineInfo	(	m.bottom_line_part_1_type, m.bottom_line_part_1_text, m.bottom_line_parts_separator, m.bottom_line_part_2_type, m.bottom_line_part_2_text,
										d.department_nm, e.sub_department_nm, c.centre_nm, ''
									)			AS	bottom_line_text,
			m.bottom_line_font_size,
			c.secretary_signature				AS	secretary_signature,
			t.sewadar_photo						AS	sewadar_photo
	FROM	sewadars_badges	b
		JOIN	sewadars_registrations	r
			ON	(	b.badge_id			BETWEEN	@p_from_badge_id	AND	@p_till_badge_id
				AND	b.satsang_centre_id	=	r.satsang_centre_id
				AND	b.sewadar_grno		=	r.sewadar_grno
				)
		JOIN	sewadars_details	sd
			ON	(	r.sewadar_id	= sd.sewadar_id		)
		JOIN	sewadars	s
			ON	(	s.sewadar_id	=	sd.sewadar_id	)
		LEFT	JOIN	ZSM_Photos..sewadars_photos	t
			ON	(	t.sewadar_id	=	r.sewadar_id	)
		JOIN	departments	d
			ON	(	d.department_id	=	r.department_id	)
		JOIN	badge_templates	m
			ON	(	m.badge_template_id		=	@p_badge_template_id	)
		JOIN	satsang_centres_details	c
			ON	(	c.satsang_centre_id		=	@p_satsang_centre_id	)
		LEFT JOIN	sub_departments	e
			ON	(	e.sub_department_id		=	r.sub_department_id	)
		LEFT JOIN	colours	f
			ON	(	f.colour_id	=	CASE	m.foreground_colour_control	WHEN	'Colour'		THEN	m.foreground_colour_id
																		WHEN	'Centre'		THEN	c.colour_id
																		WHEN	'Department'	THEN	d.colour_id
									END
				)
		LEFT JOIN	colours	k
			ON	(	k.colour_id	=	CASE	m.background_colour_control	WHEN	'Colour'		THEN	m.background_colour_id
																		WHEN	'Centre'		THEN	c.colour_id
																		WHEN	'Department'	THEN	d.colour_id
									END
				)
	ORDER BY	b.badge_id;
END
GO



-- =============================================================================
-- vim:ts=4 ht=8 sw=4 guifont=Lucida_Console
