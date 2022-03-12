
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QueryGenericSewadarListsSewadarForBadgePrinting
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QueryGenericSewadarListsSewadarForBadgePrinting'
			)
	BEGIN
		DROP PROCEDURE  QueryGenericSewadarListsSewadarForBadgePrinting
	END
GO
CREATE PROCEDURE QueryGenericSewadarListsSewadarForBadgePrinting
(
	@sewadar_list_id		sewadar_list_id,
	@satsang_centre_id		satsang_centre_id,
	@remarks				remarks,
	@badge_template_id      badge_template_id,
	@badge_expiry_year	CHAR (4),
	@gents_retirement_age INT,
	@ladies_retirement_age INT
)
WITH ENCRYPTION
AS
BEGIN

	SELECT
		g.sewadar_grno,
		vs.sewadar_id,
		vs.full_department_nm,
		expiry_dt = (CASE WHEN badge_t.is_expiry_year_check = 'Yes'  THEN (CASE WHEN vs.gender = 'Male' THEN
					(CASE WHEN @gents_retirement_age + YEAR(vs.birth_dtm) >= @badge_expiry_year THEN @badge_expiry_year ELSE @gents_retirement_age + YEAR(vs.birth_dtm) END)
					ELSE (CASE WHEN @ladies_retirement_age + YEAR(vs.birth_dtm) >= @badge_expiry_year THEN @badge_expiry_year ELSE @gents_retirement_age + YEAR(vs.birth_dtm) END)
					END)
					ELSE  @badge_expiry_year END),
		printing_dtm = MAX(sb.printing_dtm),
		vs.sewadar_status_nm,
		vs.department_id,
		vs.weekly_sewa_location_id,
		photo_dt = MAX(sp.photo_dt),
		remarks = @remarks,
		vs.full_nm
	FROM generic_sewadar_lists_sewadars g
	JOIN ViewSewadarHeader vs ON  vs.satsang_centre_id = g.satsang_centre_id AND vs.sewadar_grno = g.sewadar_grno
	JOIN sewadars_registrations sr ON sr.sewadar_grno = vs.sewadar_grno AND sr.satsang_centre_id = vs.satsang_centre_id
	JOIN badge_templates_sewadar_status bt ON COALESCE(vs.global_sewadar_status_cd, vs.sewadar_status_cd) = bt.sewadar_status_cd AND bt.badge_template_id = @badge_template_id
	LEFT OUTER JOIN sewadars_badges sb ON g.satsang_centre_id = sb.satsang_centre_id AND sb.sewadar_grno = g.sewadar_grno  AND sb.badge_template_id = @badge_template_id
	LEFT JOIN ZSM_Photos..sewadars_photos sp
		ON	(	sp.sewadar_id = vs.sewadar_id	)
	JOIN badge_templates badge_t ON badge_t.badge_template_id = @badge_template_id
	WHERE	(	badge_t.are_outstation_sewadars_allowed = 'Yes'
			OR	(	badge_t.are_outstation_sewadars_allowed = 'No'
				AND sr.is_outstation_sewadar = 'No'
				)
			)
	AND		(	(	sr.sewadar_type	=	'R'	AND	sp.sewadar_id	IS NOT NULL	)
			OR		sr.sewadar_type	IN	('T', 'O')
			)
	GROUP BY g.sewadar_grno,		
			 vs.sewadar_id,		
			 vs.full_department_nm,
			 vs.sewadar_status_nm,
			 vs.full_nm,
			 g.sewadar_list_id,
			 g.satsang_centre_id,
			 vs.gender, vs.birth_dtm, vs.department_id,badge_t.is_expiry_year_check, 
		vs.weekly_sewa_location_id
	HAVING
		g.sewadar_list_id = @sewadar_list_id
	AND	g.satsang_centre_id = @satsang_centre_id
END
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarForBadgePrinting
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarForBadgePrinting'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarForBadgePrinting
	END
GO
CREATE PROCEDURE QuerySewadarForBadgePrinting
(
	@sewadar_grno		sewadar_grno,
	@satsang_centre_id	satsang_centre_id,
	@badge_template_id	badge_template_id,
	@badge_expiry_year	CHAR (4),
	@gents_retirement_age INT,
	@ladies_retirement_age INT
)
WITH ENCRYPTION
AS
BEGIN

	SELECT
		vs.sewadar_id,
		vs.full_department_nm,
		expiry_dt = (CASE WHEN badge_t.is_expiry_year_check = 'Yes'  THEN (CASE WHEN vs.gender = 'Male' THEN
					(CASE WHEN @gents_retirement_age + YEAR(vs.birth_dtm) >= @badge_expiry_year THEN @badge_expiry_year ELSE @gents_retirement_age + YEAR(vs.birth_dtm) END)
					ELSE (CASE WHEN @ladies_retirement_age + YEAR(vs.birth_dtm) >= @badge_expiry_year THEN @badge_expiry_year ELSE @gents_retirement_age + YEAR(vs.birth_dtm) END)
					END)
					ELSE  @badge_expiry_year END),
		printing_dtm = MAX(sb.printing_dtm),
		vs.department_id,
		vs.weekly_sewa_location_id,
		vs.sewadar_status_nm,
		photo_dt = MAX(sp.photo_dt),
		vs.full_nm
	FROM ViewSewadarHeader vs
	JOIN badge_templates_sewadar_status bt ON COALESCE(vs.global_sewadar_status_cd, vs.sewadar_status_cd) = bt.sewadar_status_cd AND bt.badge_template_id = @badge_template_id
	LEFT OUTER JOIN sewadars_badges sb ON vs.satsang_centre_id = sb.satsang_centre_id AND vs.sewadar_grno = sb.sewadar_grno AND sb.badge_template_id = @badge_template_id
	LEFT JOIN ZSM_Photos..sewadars_photos sp ON sp.sewadar_id = vs.sewadar_id
	JOIN badge_templates badge_t ON badge_t.badge_template_id = @badge_template_id
	GROUP BY		
			 vs.sewadar_id,		
			 vs.full_department_nm,
			 vs.sewadar_status_nm,
			 vs.full_nm,
			 vs.sewadar_grno,
			 vs.satsang_centre_id,
			 vs.gender, vs.birth_dtm,
			 		vs.department_id,badge_t.is_expiry_year_check,
		vs.weekly_sewa_location_id
	HAVING
		 vs.sewadar_grno  = @sewadar_grno
	AND	vs.satsang_centre_id = @satsang_centre_id
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	InsertSewadarsBadge
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='InsertSewadarsBadge'
			)
	BEGIN
		DROP PROCEDURE  InsertSewadarsBadge
	END
GO
CREATE PROCEDURE InsertSewadarsBadge
(
	@badge_id						int output,
	@satsang_centre_id				satsang_centre_id,
	@sewadar_grno					sewadar_grno,
	@badge_template_id				badge_template_id,
	@department_id					department_id,
	@weekly_sewa_location_id		weekly_sewa_location_id = NULL,
	@is_front_printed				Boolean,
	@is_back_printed				Boolean = NULL,
	@expiry_dt						smalldatetime,
	@remarks						gnc_description
)
WITH ENCRYPTION
AS
BEGIN
	INSERT INTO sewadars_badges
	(
		satsang_centre_id, sewadar_grno, badge_template_id, department_id, weekly_sewa_location_id, is_front_printed, is_back_printed, expiry_dt, printing_dtm, remarks
	)
	VALUES
	(
		@satsang_centre_id, @sewadar_grno, @badge_template_id, @department_id, @weekly_sewa_location_id, @is_front_printed, @is_back_printed, @expiry_dt, GETDATE(), @remarks
	)
	SELECT @badge_id = SCOPE_IDENTITY()
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4

