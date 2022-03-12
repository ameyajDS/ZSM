SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarsTransfer
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarsTransfer'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarsTransfer
	END
GO
CREATE PROCEDURE QuerySewadarsTransfer
(
	@satsang_centre_id			satsang_centre_id,
	@sewadar_grno				sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		st.effective_dt, 
		st.old_department_id, 
		old_department_nm = od.department_nm, 
		st.old_sub_department_id, 
		old_sub_department_nm = osd.sub_department_nm, 
		st.department_id, 
		d.department_nm, 
		st.sub_department_id, 
		sd.sub_department_nm, 
		st.remarks, 
		st.txn_ts
	FROM sewadars_transfers st
	JOIN departments d ON d.department_id = st.department_id
	LEFT OUTER JOIN departments od ON od.department_id = st.old_department_id
	LEFT OUTER JOIN sub_departments osd ON osd.sub_department_id = st.old_sub_department_id
	LEFT OUTER JOIN sub_departments sd ON sd.sub_department_id = st.sub_department_id
	WHERE
		st.satsang_centre_id = @satsang_centre_id
	AND	st.sewadar_grno	  = @sewadar_grno
	ORDER BY effective_dt DESC
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarsBadge
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarsBadge'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarsBadge
	END
GO
CREATE PROCEDURE QuerySewadarsBadge
(
	@satsang_centre_id				satsang_centre_id,
	@sewadar_grno					sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		sb.badge_id, 
		sb.satsang_centre_id, 
		sb.sewadar_grno, 
		sb.badge_template_id, 
		bt.badge_template_nm, 
		sb.department_id, 
		d.department_nm, 
		sb.weekly_sewa_location_id, 
		sb.expiry_dt, 
		sb.printing_dtm, 
		sb.remarks
	FROM sewadars_badges sb
	JOIN badge_templates bt ON bt.badge_template_id = sb.badge_template_id
	JOIN departments d ON d.department_id = sb.department_id
	WHERE
		sb.satsang_centre_id = @satsang_centre_id
	AND	sb.sewadar_grno	  = @sewadar_grno
	ORDER BY sb.printing_dtm DESC
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarsResponsibilityChange
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarsResponsibilityChange'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarsResponsibilityChange
	END
GO
CREATE PROCEDURE QuerySewadarsResponsibilityChange
(
	@satsang_centre_id		satsang_centre_id,
	@sewadar_grno			sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		satsang_centre_id, 
		sewadar_grno, 
		effective_dtm, 
		old_responsibility, 
		responsibility
	FROM sewadars_responsibility_changes
	WHERE
		satsang_centre_id = @satsang_centre_id
	AND	sewadar_grno	  = @sewadar_grno
	ORDER BY effective_dtm DESC
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================================================
--	Procedure	QuerySewadarsStatusChange
-- =============================================================================
IF EXISTS	(	SELECT  TOP 1 1 
				FROM    INFORMATION_SCHEMA.ROUTINES 
				WHERE   ROUTINE_TYPE='PROCEDURE'
				AND     SPECIFIC_NAME='QuerySewadarsStatusChange'
			)
	BEGIN
		DROP PROCEDURE  QuerySewadarsStatusChange
	END
GO
CREATE PROCEDURE QuerySewadarsStatusChange
(
	@satsang_centre_id			satsang_centre_id,
	@sewadar_grno				sewadar_grno
)
WITH ENCRYPTION
AS
BEGIN
	SELECT
		ssc.satsang_centre_id, 
		ssc.sewadar_grno, 
		ssc.effective_dtm, 
		ssc.old_sewadar_status_cd, 
		ss.sewadar_status_nm,
		ssc.sewadar_status_cd
	FROM sewadars_status_changes ssc
	LEFT OUTER JOIN sewadar_status ss ON ss.sewadar_status_cd = ssc.sewadar_status_cd
	WHERE
		ssc.satsang_centre_id = @satsang_centre_id
	AND	ssc.sewadar_grno	  = @sewadar_grno
	ORDER BY ssc.effective_dtm DESC
END
GO
-- =============================================================================
-- vim:ts=4 sw=4 ht=4

