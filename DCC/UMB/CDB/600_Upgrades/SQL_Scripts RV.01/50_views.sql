/* ==================================================================================
	Source File		:	views.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Tue Nov 26 22:49 2013
	Module ID		:	CDB
	Last updated	:	Jun 26, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Views that can be used in reports for printing the address_component_values.
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
		26-Jun-2014 : JL
			* View v_level_4_address_components dropped
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- NOTE. View for address_level_1
-- =============================================================================

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'V'
				AND		NAME = 'v_level_1_address_components'
			)
	DROP VIEW v_level_1_address_components
GO

CREATE VIEW	v_level_1_address_components
	WITH ENCRYPTION
AS
	SELECT	a.level_1_address_component_id, a.level_1_address_component_cd, a.level_1_address_component_nm,
			CASE WHEN a.level_1_address_component_nm = c.country_nm THEN '' ELSE a.level_1_address_component_nm + ', ' END
				+ c.country_nm	AS	level_1_address_component_desc,
			c.country_id, c.country_cd, c.country_nm,c.level_1_address_component,c.level_2_address_component,c.level_3_address_component,
			a.is_authentic, a.effective_from, a.effective_till
	FROM	level_1_address_components	a
		JOIN	countries	c
			ON	(	a.country_id	=	c.country_id	);
GO

-- =============================================================================
-- NOTE. View for address_level_2
-- =============================================================================

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'V'
				AND		NAME = 'v_level_2_address_components'
			)
	DROP VIEW v_level_2_address_components
GO

CREATE VIEW	v_level_2_address_components
	WITH ENCRYPTION
AS
	SELECT	b.level_2_address_component_id, b.level_2_address_component_cd, b.level_2_address_component_nm,
			CASE WHEN b.level_2_address_component_nm = a.level_1_address_component_nm THEN '' ELSE b.level_2_address_component_nm + ', ' END
				+ a.level_1_address_component_desc	AS	level_2_address_component_desc,
			a.level_1_address_component_id, a.level_1_address_component_cd, a.level_1_address_component_nm,
			a.country_id, a.country_cd, a.country_nm,a.level_1_address_component,a.level_2_address_component,a.level_3_address_component,
			b.is_authentic, b.effective_from, b.effective_till
	FROM	level_2_address_components	b
		JOIN	v_level_1_address_components	a
			ON	(	a.level_1_address_component_id	=	b.level_1_address_component_id	);
GO

-- =============================================================================
-- NOTE. View for address_level_3
-- =============================================================================

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'V'
				AND		NAME = 'v_level_3_address_components'
			)
	DROP VIEW v_level_3_address_components
GO

CREATE VIEW	v_level_3_address_components
	WITH ENCRYPTION
AS
	SELECT	b.level_3_address_component_id, b.level_3_address_component_cd, b.level_3_address_component_nm,
			CASE WHEN b.level_3_address_component_nm = a.level_2_address_component_nm THEN '' ELSE b.level_3_address_component_nm + ', ' END
				+ a.level_2_address_component_desc	AS	level_3_address_component_desc,
			a.level_2_address_component_id, a.level_2_address_component_cd, a.level_2_address_component_nm,
			a.level_1_address_component_id, a.level_1_address_component_cd, a.level_1_address_component_nm,
			a.country_id, a.country_cd, a.country_nm,a.level_1_address_component,a.level_2_address_component,a.level_3_address_component,
			b.is_authentic, b.effective_from, b.effective_till
	FROM	level_3_address_components	b
		JOIN	v_level_2_address_components	a
			ON	(	a.level_2_address_component_id	=	b.level_2_address_component_id	);
GO

/*
-- =============================================================================
-- NOTE. View for address_level_4
-- =============================================================================

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'V'
				AND		NAME = 'v_level_4_address_components'
			)
	DROP VIEW v_level_4_address_components
GO


CREATE VIEW	v_level_4_address_components
	WITH ENCRYPTION
AS
	SELECT	b.level_4_address_component_id, b.level_4_address_component_cd, b.level_4_address_component_nm,
			CASE WHEN b.level_4_address_component_nm = a.level_3_address_component_nm THEN '' ELSE b.level_4_address_component_nm + ', ' END
				+ a.level_3_address_component_desc	AS	level_4_address_component_desc,
			a.level_3_address_component_id, a.level_3_address_component_cd, a.level_3_address_component_nm,
			a.level_2_address_component_id, a.level_2_address_component_cd, a.level_2_address_component_nm,
			a.level_1_address_component_id, a.level_1_address_component_cd, a.level_1_address_component_nm,
			a.country_id, a.country_cd, a.country_nm,a.level_1_address_component,a.level_2_address_component,a.level_3_address_component,a.level_4_address_component,
			b.is_authentic, b.effective_from, b.effective_till
	FROM	level_4_address_components	b
		JOIN	v_level_3_address_components	a
			ON	(	a.level_3_address_component_id	=	b.level_3_address_component_id	);
GO
-- =============================================================================
*/

-- vim:ts=4 sw=4 ht=4
