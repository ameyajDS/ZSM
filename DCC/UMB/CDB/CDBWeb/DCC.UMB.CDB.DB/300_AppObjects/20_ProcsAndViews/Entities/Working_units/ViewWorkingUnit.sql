SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
--	View	ViewWorkingUnit
-- =============================================================================
IF EXISTS	(	SELECT  *
				FROM    sysobjects
				WHERE name = 'ViewWorkingUnit' and TYPE='V'	
			)
	BEGIN
		DROP VIEW  ViewWorkingUnit
	END
GO
CREATE VIEW ViewWorkingUnit
AS
	SELECT
		wu.working_unit_id, 
		wu.working_unit_cd, 
		wu.working_unit_nm, 
		wu.is_root, 
		wu.is_leaf, 
		wu.society_id, 
		s.society_nm as society_id_display,
		wu.is_staff_posted, 
		wu.working_unit_entity_id, 
		wue.entity_singular_nm as working_unit_entity_id_display,
		wu.group_working_unit_id, 
		wur.working_unit_nm as group_working_unit_id_display,
		wu.effective_from, 
		wu.effective_till, 
		wu.txn_ts
	FROM working_units wu
	JOIN dbo.societies s 
		ON wu.society_id = s.society_id
	JOIN dbo.working_unit_entities wue
		ON wu.working_unit_entity_id = wue.entity_id
	LEFT JOIN dbo.working_units wur
		ON wu.group_working_unit_id = wur.working_unit_id
GO
-- =============================================================================