/* ==================================================================================
	Source File		:	triggers_dml.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Tue Nov 26 17:45 2013
	Module ID		:	CDB
	Last updated	:	Jun 26, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		The triggers defined in this script ensure that the geographical locations are
		propogated below up to the leaf level (4th) if a country is NOT using any of these.
		For example, if Country Singapore is NOT to use any of the below hierarchical
		components, the triggers will automatically populate (and manage) all the four
		address components.
		Note that these are manages only if the country's is_authentic bit is set.
		Further, if is_authentic bit was set, and is subsequently un-set, the auto-populated
		data will not be reverted back.
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
		26-Jun-2014 : JL
			* Triggers on table level_3_address_components dropped because these are not
			  propogate the values on to table level_4_address_components, which has been dropped.
		25-Jun-2014 : JL
			* Bug fix in trigger countries_b_u_DML
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
-- NOTE. Country to be propagated to address_level_1, if address_level_1_component_nm IS NULL
-- =============================================================================

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'TR'
				AND		NAME = 'countries_a_i_DML'
			)
	DROP TRIGGER countries_a_i_DML
GO

CREATE TRIGGER	countries_a_i_DML
	ON	countries
		WITH ENCRYPTION
			FOR	INSERT
AS
BEGIN
	INSERT	INTO	level_1_address_components
			(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic, effective_from, effective_till	)
		SELECT	country_cd, country_nm, country_id, is_authentic, effective_from, effective_till
		FROM	inserted
		WHERE	level_1_address_component	IS NULL
		AND		is_authentic				=	1;
END
GO
-- =============================================================================

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'TR'
				AND		NAME = 'countries_b_u_DML'
			)
	DROP TRIGGER countries_b_u_DML
GO

CREATE TRIGGER	countries_b_u_DML
	ON	countries
		WITH ENCRYPTION
			FOR	UPDATE
AS
BEGIN
	IF NOT EXISTS	(	SELECT	1
						FROM	level_1_address_components	c
							JOIN	inserted	i
								ON	(	c.country_id				=	i.country_id
									AND	i.level_1_address_component	IS NULL
									)
					)
		INSERT	INTO	level_1_address_components
				(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic, effective_from, effective_till, audit_log_id	)
			SELECT	country_cd, country_nm, country_id, is_authentic, effective_from, effective_till, audit_log_id
			FROM	inserted
			WHERE	level_1_address_component	IS NULL
			AND		is_authentic				=	1;
	ELSE
		UPDATE	c
			SET	level_1_address_component_cd	=	i.country_cd,
				level_1_address_component_nm	=	i.country_nm,
				is_authentic					=	1,
				effective_from					=	i.effective_from,
				effective_till					=	i.effective_till,
				audit_log_id					=	i.audit_log_id
		FROM	level_1_address_components	c
			JOIN	inserted	i
				ON	(	i.country_id				=	c.country_id
					AND	i.level_1_address_component	IS NULL
					AND	i.is_authentic				=	1
					);
END
GO

-- =============================================================================
-- NOTE. Level 1 Address Component to be propagated to address_level_2, if countries.address_level_2_component_nm IS NULL
-- =============================================================================

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'TR'
				AND		NAME = 'level_1_address_components_a_i_DML'
			)
	DROP TRIGGER level_1_address_components_a_i_DML
GO

CREATE TRIGGER	level_1_address_components_a_i_DML
	ON	level_1_address_components
		WITH ENCRYPTION
			FOR	INSERT
AS
BEGIN
	INSERT	INTO	level_2_address_components
			(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic, frro_level2_nm, effective_from, effective_till, audit_log_id	)
		SELECT	i.level_1_address_component_cd, i.level_1_address_component_nm, i.level_1_address_component_id, i.is_authentic, i.frro_level1_nm,  i.effective_from, i.effective_till, i.audit_log_id
		FROM	inserted	i
			JOIN	countries	c
				ON	(	i.country_id	=	c.country_id
					AND	c.level_2_address_component	IS NULL
					AND	c.is_authentic	=	1
					)
		AND		i.is_authentic	=	1;
END
GO
-- =============================================================================

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'TR'
				AND		NAME = 'level_1_address_components_b_u_DML'
			)
	DROP TRIGGER level_1_address_components_b_u_DML
GO

CREATE TRIGGER	level_1_address_components_b_u_DML
	ON	level_1_address_components
		WITH ENCRYPTION
			FOR	UPDATE
AS
BEGIN
	IF NOT EXISTS	(	SELECT	1
						FROM	level_2_address_components	a
							JOIN	inserted	i
								ON	(	a.level_1_address_component_id	=	i.level_1_address_component_id	)
							JOIN	countries	c
								ON	(	c.country_id				=	i.country_id
									AND	c.level_2_address_component	IS NULL
									)
					)
		INSERT	INTO	level_2_address_components
				(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic, frro_level2_nm, effective_from, effective_till, audit_log_id	)
			SELECT	i.level_1_address_component_cd, i.level_1_address_component_nm, i.level_1_address_component_id, i.is_authentic, i.frro_level1_nm, i.effective_from, i.effective_till, i.audit_log_id
			FROM	inserted	i
				JOIN	countries	c
					ON	(	i.country_id	=	c.country_id
						AND	c.level_2_address_component	IS NULL
						AND	c.is_authentic	=	1
						)
			AND		i.is_authentic	=	1;
	ELSE
		UPDATE	a
			SET	level_2_address_component_cd	=	i.level_1_address_component_cd,
				level_2_address_component_nm	=	i.level_1_address_component_nm,
				effective_from					=	i.effective_from,
				effective_till					=	i.effective_till,
				audit_log_id					=	i.audit_log_id
		FROM	level_2_address_components	a
			JOIN	inserted	i
				ON	(	a.level_1_address_component_id	=	i.level_1_address_component_id	)
			JOIN	countries	c
				ON	(	c.country_id				=	i.country_id
					AND	c.level_2_address_component	IS NULL
					AND	c.is_authentic				=	1
					)
		WHERE	i.is_authentic	=	1;
END
GO


-- =============================================================================
-- NOTE. Level 2 Address Component to be propagated to address_level_3, if countries.address_level_3_component_nm IS NULL
-- =============================================================================

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'TR'
				AND		NAME = 'level_2_address_components_a_i_DML'
			)
	DROP TRIGGER level_2_address_components_a_i_DML
GO

CREATE TRIGGER	level_2_address_components_a_i_DML
	ON	level_2_address_components
		WITH ENCRYPTION
			FOR	INSERT
AS
BEGIN
	INSERT	INTO	level_3_address_components
			(	level_3_address_component_cd, level_3_address_component_nm, level_2_address_component_id, is_authentic, frro_level3_nm, effective_from, effective_till, audit_log_id	)
		SELECT	i.level_2_address_component_cd, i.level_2_address_component_nm, i.level_2_address_component_id, i.is_authentic, i.frro_level2_nm, i.effective_from, i.effective_till, i.audit_log_id
		FROM	inserted	i
			JOIN	level_1_address_components	a
				ON	(	a.level_1_address_component_id	=	i.level_1_address_component_id
					AND	a.is_authentic					=	1
					)
			JOIN	countries	c
				ON	(	a.country_id	=	c.country_id
					AND	c.level_3_address_component	IS NULL
					AND	c.is_authentic	=	1
					)
		AND		i.is_authentic	=	1;
END
GO
-- =============================================================================

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'TR'
				AND		NAME = 'level_2_address_components_b_u_DML'
			)
	DROP TRIGGER level_2_address_components_b_u_DML
GO

CREATE TRIGGER	level_2_address_components_b_u_DML
	ON	level_2_address_components
		WITH ENCRYPTION
			FOR	UPDATE
AS
BEGIN
	IF NOT EXISTS	(	SELECT	1
						FROM	level_3_address_components	a
							JOIN	inserted	i
								ON	(	a.level_2_address_component_id	=	i.level_2_address_component_id	)
							JOIN	level_1_address_components	b
								ON	(	b.level_1_address_component_id	=	i.level_1_address_component_id	)
							JOIN	countries	c
								ON	(	c.country_id				=	b.country_id
									AND	c.level_3_address_component	IS NULL
									)
					)
		INSERT	INTO	level_3_address_components
				(	level_3_address_component_cd, level_3_address_component_nm, level_2_address_component_id, is_authentic, frro_level3_nm, effective_from, effective_till, audit_log_id	)
			SELECT	i.level_2_address_component_cd, i.level_2_address_component_nm, i.level_2_address_component_id, i.is_authentic, i.frro_level2_nm, i.effective_from, i.effective_till, i.audit_log_id
			FROM	inserted	i
				JOIN	level_1_address_components	a
					ON	(	a.level_1_address_component_id	=	i.level_1_address_component_id
						AND	a.is_authentic					=	1
						)
				JOIN	countries	c
					ON	(	a.country_id	=	c.country_id
						AND	c.level_3_address_component	IS NULL
						AND	c.is_authentic	=	1
						)
			AND		i.is_authentic	=	1;
	ELSE
		UPDATE	a
			SET	level_3_address_component_cd	=	i.level_2_address_component_cd,
				level_3_address_component_nm	=	i.level_2_address_component_nm,
				effective_from					=	i.effective_from,
				effective_till					=	i.effective_till,
				audit_log_id					=	i.audit_log_id
		FROM	level_3_address_components	a
			JOIN	inserted	i
				ON	(	a.level_2_address_component_id	=	i.level_2_address_component_id	)
			JOIN	level_1_address_components	b
				ON	(	b.level_1_address_component_id	=	i.level_1_address_component_id
					AND	b.is_authentic				=	1
					)
			JOIN	countries	c
				ON	(	c.country_id				=	b.country_id
					AND	c.level_2_address_component	IS NULL
					AND	c.is_authentic				=	1
					)
		WHERE	i.is_authentic	=	1;
END
GO

-- =============================================================================
-- NOTE. Level 3 Address Component to be propagated to address_level_4, if countries.address_level_4_component_nm IS NULL
-- =============================================================================

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'TR'
				AND		NAME = 'level_3_address_components_a_i_DML'
			)
	DROP TRIGGER level_3_address_components_a_i_DML
GO

/*
CREATE TRIGGER	level_3_address_components_a_i_DML
	ON	level_3_address_components
		WITH ENCRYPTION
			FOR	INSERT
AS
BEGIN
	INSERT	INTO	level_4_address_components
			(	level_4_address_component_cd, level_4_address_component_nm, level_3_address_component_id, is_authentic, effective_from, effective_till	)
		SELECT	i.level_3_address_component_cd, i.level_3_address_component_nm, i.level_3_address_component_id, i.is_authentic, i.effective_from, i.effective_till
		FROM	inserted	i
			JOIN	level_2_address_components	z
				ON	(	z.level_2_address_component_id	=	i.level_2_address_component_id
					AND	z.is_authentic					=	1
					)
			JOIN	level_1_address_components	a
				ON	(	a.level_1_address_component_id	=	z.level_1_address_component_id
					AND	a.is_authentic					=	1
					)
			JOIN	countries	c
				ON	(	a.country_id	=	c.country_id
					AND	c.level_4_address_component	IS NULL
					AND	c.is_authentic	=	1
					)
		AND		i.is_authentic	=	1;
END
GO
-- =============================================================================
*/

IF EXISTS	(	SELECT	1
				FROM	sysobjects
				WHERE	xtype = 'TR'
				AND		NAME = 'level_3_address_components_b_u_DML'
			)
	DROP TRIGGER level_3_address_components_b_u_DML
GO

/*
CREATE TRIGGER	level_3_address_components_b_u_DML
	ON	level_3_address_components
		WITH ENCRYPTION
			FOR	UPDATE
AS
BEGIN
	IF NOT EXISTS	(	SELECT	1
						FROM	level_4_address_components	z
							JOIN	inserted	i
								ON	(	z.level_3_address_component_id	=	i.level_3_address_component_id	)
							JOIN	level_2_address_components	a
								ON	(	a.level_2_address_component_id	=	i.level_2_address_component_id	)
							JOIN	level_1_address_components	b
								ON	(	b.level_1_address_component_id	=	a.level_1_address_component_id	)
							JOIN	countries	c
								ON	(	c.country_id				=	b.country_id
									AND	c.level_4_address_component	IS NULL
									)
					)
		INSERT	INTO	level_4_address_components
				(	level_4_address_component_cd, level_4_address_component_nm, level_3_address_component_id, is_authentic, effective_from, effective_till	)
			SELECT	i.level_3_address_component_cd, i.level_3_address_component_nm, i.level_3_address_component_id, i.is_authentic, i.effective_from, i.effective_till
			FROM	inserted	i
				JOIN	level_2_address_components	z
					ON	(	z.level_2_address_component_id	=	i.level_2_address_component_id
						AND	z.is_authentic					=	1
						)
				JOIN	level_1_address_components	a
					ON	(	a.level_1_address_component_id	=	z.level_1_address_component_id
						AND	a.is_authentic					=	1
						)
				JOIN	countries	c
					ON	(	a.country_id	=	c.country_id
						AND	c.level_4_address_component	IS NULL
						AND	c.is_authentic	=	1
						)
			AND		i.is_authentic	=	1;
	ELSE
		UPDATE	z
			SET	level_4_address_component_cd	=	i.level_3_address_component_cd,
				level_4_address_component_nm	=	i.level_3_address_component_nm,
				effective_from					=	i.effective_from,
				effective_till					=	i.effective_till
		FROM	level_4_address_components	z
			JOIN	inserted	i
				ON	(	z.level_3_address_component_id	=	i.level_3_address_component_id	)
			JOIN	level_2_address_components	a
				ON	(	a.level_2_address_component_id	=	i.level_2_address_component_id
					AND	a.is_authentic				=	1
					)
			JOIN	level_1_address_components	b
				ON	(	b.level_1_address_component_id	=	a.level_1_address_component_id
					AND	b.is_authentic				=	1
					)
			JOIN	countries	c
				ON	(	c.country_id				=	b.country_id
					AND	c.level_2_address_component	IS NULL
					AND	c.is_authentic				=	1
					)
		WHERE	i.is_authentic	=	1;
END
GO

*/
-- =============================================================================

-- vim:ts=4 sw=4 ht=4
