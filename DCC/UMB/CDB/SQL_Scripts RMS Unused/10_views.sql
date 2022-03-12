/* ==================================================================================
	Source File		:	10_views.sql
	Author(s)		:	Sukhdev B. Darira, Jitendra Loyal
	Started On		:	Thu Feb 25 14:15:50 IST 2010
	Version			:	0.01
	Module ID		:	RMS
	Language		:	TRANSACT-SQL
	Last updated	:	Feb 25, 2010
	Reviewed By		:	
	Reviewed On		:	
	==================================================================================
									   Usage Notes
	----------------------------------------------------------------------------------
		Contains the following views:
	==================================================================================
									  Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

--	USE CDB

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--	View provides the OLD table "Departments", as a view, which has been defunto post RMS Release
-- =============================================================================

--	First dropping the Old "Departments" table, to allow the creation of the view by the same name

DROP	TABLE	departments
GO

--	Now creating the view

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	name	=	'departments'
				AND		xtype	=	'V')
	DROP VIEW	departments
GO
CREATE VIEW departments
AS
	SELECT	department_id		= working_unit_id,
			department_cd		= working_unit_cd,
			department_nm		= working_unit_nm,
			department_group_id	= group_working_unit_id,
			fax_line			= NULL,
			txn_ts				= txn_ts,
			effective_from		= u.effective_from,
			effective_till		= u.effective_till,
			is_section			= CASE WHEN entity_singular_nm = 'Section'		THEN 'Yes' ELSE 'No' END,
			is_department		= CASE WHEN entity_singular_nm = 'Department'	THEN 'Yes' ELSE 'No' END
	FROM	working_unit_entities	e
		JOIN	working_units		u
			ON	(	e.entity_id	= u.working_unit_entity_id	)
GO

-- =============================================================================

-- vim:ts=4 sw=4 ht=4
